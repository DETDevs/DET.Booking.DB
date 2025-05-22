-- *************************************** INSERT BUSINESS ***************************************

--INSERT INTO [dbo].[Business] ([Name], [Code], [PrimaryColor], [SecondColor], [Logo], [IsActive], [CreateUser])
--VALUES
--('TechNova', 'TN001', '#1A73E8', '#34A853', '/logos/technova.png', 1, 'admin'),
--('EcoMarket', 'EM002', '#2E7D32', '#A5D6A7', '/logos/ecomarket.png', 1, 'admin'),
--('BookVerse', 'BV009', '#3F51B5', '#C5CAE9', '/logos/bookverse.png', 1, 'admin'),
--('MoPetCo', 'MP011', '#FF9800', '#FFE0B2', '/logos/mopetco.png', 1, 'admin');

-- *************************************** INSERT EMPLOYEE ***************************************

--EXEC [sp_Employee_Guardar]
--   @BusinessID = 4,
--   @Name = 'Luis Torres',
--   @Email = 'luis.torres@mopetco.com',
--   @PhoneNumber = '50512345678',
--   @Puesto = 1001,
--   @IsActive = 1,
--   @CreateUser = 'admin',
--   @CreateDate = '2025-05-21',
--   @ModificationUser = 'admin',
--   @ModificationDate = '2025-05-21';


--EXEC [sp_Employee_Guardar]
--   @BusinessID = 4,
--   @Name = 'Ana Castillo',
--   @Email = 'ana.castillo@technova.com',
--   @PhoneNumber = '50587654321',
--   @Puesto = 2002,
--   @IsActive = 1,
--   @CreateUser = 'admin',
--   @CreateDate = '2025-05-21',
--   @ModificationUser = 'admin',
--   @ModificationDate = '2025-05-21';

--EXEC [sp_Employee_Guardar]
--   @BusinessID = 2,
--   @Name = 'Carlos Méndez',
--   @Email = 'carlos.mendez@ecomarket.com',
--   @PhoneNumber = '50522446688',
--   @Puesto = 3003,
--   @IsActive = 1,
--   @CreateUser = 'admin',
--   @CreateDate = '2025-05-21',
--   @ModificationUser = 'admin',
--   @ModificationDate = '2025-05-21';

-- *************************************** INSERT EMPLOYEE ***************************************

--EXEC sp_Services_Guardar
--    @BusinessID = 4,
--    @EmployeeID = 7,
--    @Name = 'Baño básico',
--    @Description = 'Servicio de baño con productos hipoalergénicos para perros pequeños.',
--    @DutarionMin = '45',
--    @Price = '15.00',
--    @DiasHabiles = 'Lunes,Miércoles,Viernes',
--    @IsActive = 1,
--    @CreateUser = 'admin';


--EXEC sp_Services_Guardar
--    @BusinessID = 2,
--    @EmployeeID = 9,
--    @Name = 'Corte de uñas',
--    @Description = 'Recorte seguro de uñas para todas las razas.',
--    @DutarionMin = '20',
--    @Price = '5.00',
--    @DiasHabiles = 'Martes,Jueves,Sábado',
--    @IsActive = 1,
--    @CreateUser = 'admin';

--EXEC sp_Services_Guardar
--    @BusinessID = 4,
--    @EmployeeID = 8,
--    @Name = 'Consulta veterinaria',
--    @Description = 'Consulta de revisión general y chequeo de salud.',
--    @DutarionMin = '30',
--    @Price = '20.00',
--    @DiasHabiles = 'Lunes a Sábado',
--    @IsActive = 1,
--    @CreateUser = 'admin';

-- *************************************** INSERT SERVICES ***************************************

--EXEC sp_Services_Guardar
--    @BusinessID = 4,
--    @EmployeeID = 7,
--    @Name = 'Baño básico',
--    @Description = 'Servicio de baño con productos hipoalergénicos para perros pequeños.',
--    @DutarionMin = '45',
--    @Price = '15.00',
--    @DiasHabiles = 'Lunes,Miércoles,Viernes',
--    @IsActive = 1,
--    @CreateUser = 'admin';


--EXEC sp_Services_Guardar
--    @BusinessID = 2,
--    @EmployeeID = 9,
--    @Name = 'Corte de uñas',
--    @Description = 'Recorte seguro de uñas para todas las razas.',
--    @DutarionMin = '20',
--    @Price = '5.00',
--    @DiasHabiles = 'Martes,Jueves,Sábado',
--    @IsActive = 1,
--    @CreateUser = 'admin';

--EXEC sp_Services_Guardar
--    @BusinessID = 4,
--    @EmployeeID = 8,
--    @Name = 'Consulta veterinaria',
--    @Description = 'Consulta de revisión general y chequeo de salud.',
--    @DutarionMin = '30',
--    @Price = '20.00',
--    @DiasHabiles = 'Lunes a Sábado',
--    @IsActive = 1,
--    @CreateUser = 'admin';

-- *************************************** INSERT EMPLOYEE SCHEDULE ***************************************

--INSERT INTO EmployeeSchedule (EmployeeID, Dia, HoraInicio, HoraFin)
--VALUES
--    (7, 2, '08:00:00', '17:00:00'),  -- Lunes
--    (7, 4, '08:00:00', '17:00:00'),  -- Miércoles
--    (7, 6, '08:00:00', '17:00:00');  -- Viernes

--INSERT INTO EmployeeSchedule (EmployeeID, Dia, HoraInicio, HoraFin)
--VALUES
--    (9, 3, '08:00:00', '17:00:00'),  -- Martes
--    (9, 5, '08:00:00', '17:00:00'),  -- Jueves
--    (9, 7, '08:00:00', '17:00:00');  -- Sábado

--INSERT INTO EmployeeSchedule (EmployeeID, Dia, HoraInicio, HoraFin)
--VALUES
--    (8, 2, '08:00:00', '17:00:00'),  -- Lunes
--    (8, 3, '08:00:00', '17:00:00'),  -- Martes
--    (8, 4, '08:00:00', '17:00:00'),  -- Miércoles
--    (8, 5, '08:00:00', '17:00:00'),  -- Jueves
--    (8, 6, '08:00:00', '17:00:00'),  -- Viernes
--    (8, 7, '08:00:00', '17:00:00');  -- Sábado


