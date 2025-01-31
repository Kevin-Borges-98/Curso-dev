﻿using Equinox.Domain.Commands.Validations;
using System;

namespace Equinox.Domain.Commands
{
	public class RegisterNewCustomerCommand : CustomerCommand
	{
		public RegisterNewCustomerCommand(string name, string email, DateTime birthDate)
		{
			Name = name;
			Email = email;
			BirthDate = birthDate;
		}

		public override bool IsValid()
		{
			ValidationResult = new RegisterNewCustomerCommandValidation().Validate(this);
			return ValidationResult.IsValid;
		}
	}
}