-- ALBUMS --

-- name: CreateAlbum :exec
INSERT INTO albums (id, name, description)
VALUES (?, ?, ?);

-- name: GetAlbum :one
SELECT id, name, description, created_at, edited_at
FROM albums
WHERE id = ?;

-- name: ListAlbums :many
SELECT id, name, description, created_at, edited_at
FROM albums
ORDER BY created_at DESC;

-- name: UpdateAlbum :exec
UPDATE albums
SET name = ?, description = ?, edited_at = CURRENT_TIMESTAMP
WHERE id = ?;

-- name: DeleteAlbum :exec
DELETE FROM albums
WHERE id = ?;

-- IMAGE_ALBUM --

-- name: AddImageToAlbum :exec
INSERT INTO image_album (image_id, album_id)
VALUES (?, ?);

-- name: RemoveImageFromAlbum :exec
DELETE FROM image_album
WHERE image_id = ? AND album_id = ?;

-- name: ListImagesInAlbum :many
SELECT i.*
FROM images i
JOIN image_album ia ON i.id = ia.image_id
WHERE ia.album_id = ?
ORDER BY ia.created_at DESC;

-- name: ListAlbumsForImage :many
SELECT a.*
FROM albums a
JOIN image_album ia ON a.id = ia.album_id
WHERE ia.image_id = ?
ORDER BY ia.created_at DESC;
