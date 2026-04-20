CREATE TABLE giovani.dim_categoria (
    id_categoria INT PRIMARY KEY,
    nombre_categoria VARCHAR(100)
);

CREATE OR ALTER PROCEDURE sp_giovani_carga_full_categorias
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        DELETE FROM giovani.dim_categoria;

        INSERT INTO giovani.dim_categoria (id_categoria, nombre_categoria)
        SELECT id_categoria, nombre
        FROM Ventas_Transac_LAB.dbo.categorias;

        COMMIT TRANSACTION;

        RETURN 0;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;

