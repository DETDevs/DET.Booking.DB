-- *************************************** INSERT BUSINESS ***************************************

--INSERT INTO [dbo].[Business] ([Name], [Code], [PrimaryColor], [SecondColor], [Logo], [IsActive], [CreateUser])
--VALUES
--('TechNova', 'TN001', '#1A73E8', '#34A853', '/logos/technova.png', 1, 'admin'),
--('EcoMarket', 'EM002', '#2E7D32', '#A5D6A7', '/logos/ecomarket.png', 1, 'admin'),
--('BookVerse', 'BV009', '#3F51B5', '#C5CAE9', '/logos/bookverse.png', 1, 'admin'),
--('MoPetCo', 'MP011', '#FF9800', '#FFE0B2', '/logos/mopetco.png', 1, 'admin');

-- *************************************** INSERT EMPLOYEE ***************************************

--TODO: Las variables @CreateDate, @ModificationUser @ModificationDate ya no se ocuparan eliminarlas de las sentencias de inserción

--DECLARE @Now DATETIME = GETDATE();

--EXEC [Employee_Guardar]
--  @BusinessID = 4,
--  @Name = 'Luis Torres',
--  @Email = 'luis.torres@mopetco.com',
--  @PhoneNumber = '50512345678',
--  @Puesto = 1001,
--  @IsActive = 1,
--  @CreateUser = 'admin',


--EXEC [Employee_Guardar]
--  @BusinessID = 4,
--  @Name = 'Ana Castillo',
--  @Email = 'ana.castillo@technova.com',
--  @PhoneNumber = '50587654321',
--  @Puesto = 2002,
--  @IsActive = 1,
--  @CreateUser = 'admin',


--EXEC [Employee_Guardar]
--  @BusinessID = 2,
--  @Name = 'Carlos Méndez',
--  @Email = 'carlos.mendez@ecomarket.com',
--  @PhoneNumber = '50522446688',
--  @Puesto = 3003,
--  @IsActive = 1,
--  @CreateUser = 'admin',


-- *************************************** INSERT SERVICES ***************************************

--EXEC Services_Guardar
--   @BusinessID = 4,
--   @EmployeeID = 7,
--   @Name = 'Baño básico',
--   @Description = 'Servicio de baño con productos hipoalergénicos para perros pequeños.',
--   @DutarionMin = '45',
--   @Price = '15.00',
--   @DiasHabiles = 'Lunes,Miércoles,Viernes',
--   @IsActive = 1,
--   @CreateUser = 'admin';


--EXEC Services_Guardar
--   @BusinessID = 2,
--   @EmployeeID = 5,
--   @Name = 'Corte de uñas',
--   @Description = 'Recorte seguro de uñas para todas las razas.',
--   @DutarionMin = '20',
--   @Price = '5.00',
--   @DiasHabiles = 'Martes,Jueves,Sábado',
--   @IsActive = 1,
--   @CreateUser = 'admin';

--EXEC Services_Guardar
--   @BusinessID = 4,
--   @EmployeeID = 6,
--   @Name = 'Consulta veterinaria',
--   @Description = 'Consulta de revisión general y chequeo de salud.',
--   @DutarionMin = '30',
--   @Price = '20.00',
--   @DiasHabiles = 'Lunes a Sábado',
--   @IsActive = 1,
--   @CreateUser = 'admin';

-- *************************************** INSERT SUB SERVICE ***************************************

--EXEC [dbo].[SubService_Guardar]
--   @ServiceID = 1,
--   @Name = 'Baño basico full',
--   @Description = 'Servicio de baño con todos los poderes',
--   @DurationMin = '30',
--   @Price = '8.00',
--   @IsActive = 1,
--   @CreateUser = 'admin';


-- *************************************** INSERT EMPLOYEE SCHEDULE ***************************************

--INSERT INTO EmployeeSchedule (EmployeeID, [Day], StartTime, EndTime)
--VALUES
--   (7, 2, '08:00:00', '17:00:00'),  -- Lunes
--   (7, 4, '08:00:00', '17:00:00'),  -- Miércoles
--   (7, 6, '08:00:00', '17:00:00');  -- Viernes

--INSERT INTO EmployeeSchedule (EmployeeID, [Day], StartTime, EndTime)
--VALUES
--   (5, 3, '08:00:00', '17:00:00'),  -- Martes
--   (5, 5, '08:00:00', '17:00:00'),  -- Jueves
--   (5, 7, '08:00:00', '17:00:00');  -- Sábado

--INSERT INTO EmployeeSchedule (EmployeeID, [Day], StartTime, EndTime)
--VALUES
--   (6, 2, '08:00:00', '17:00:00'),  -- Lunes
--   (6, 3, '08:00:00', '17:00:00'),  -- Martes
--   (6, 4, '08:00:00', '17:00:00'),  -- Miércoles
--   (6, 5, '08:00:00', '17:00:00'),  -- Jueves
--   (6, 6, '08:00:00', '17:00:00'),  -- Viernes
--   (6, 7, '08:00:00', '17:00:00');  -- Sábado

-- *************************************** INSERT RESERVATION ***************************************

--EXEC [dbo].[Reservation_Insert]
--    @PersonName = 'Juan Pérez',
--    @PersonEmail = 'juan.perez@example.com',
--    @PersonPhoneNumber = '555-1234',
--    @CreateUserCustomer = 'admin',
--    @EmployeeID = 7,
--    @ServiceID = 2,
--    @Date = '2025-06-02',
--    @Hour = '14:00',
--    @CreateUserReservation = 'admin';

--*********** Acutlaizar reserva ***************

--EXEC [dbo].[Reservation_UpdateState] 
--    @ReservationID = 4, 
--    @NewStateID = 2,  -- 2 sería "Aprobada"
--    @ModificationUser = 'adminUser';

-- *************************************** INSERT ROLL ***************************************

--INSERT INTO [dbo].[Rol] (
--    RolID,
--    RolName,
--    RolDescription,
--    RolStatus,
--    CreateUser,
--    CreateDate,
--    ModificationUser,
--    ModificationDate
--)
--VALUES (
--    1,
--    'Administrador',
--    'Rol con acceso completo al sistema',
--    'Activo',
--    'admin',
--    '2025-06-08',
--    'admin',
--    '2025-06-08'
--);
