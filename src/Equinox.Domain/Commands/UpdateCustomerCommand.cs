﻿using Equinox.Domain.Commands.Validations;
using System;

namespace Equinox.Domain.Commands
{
	public class UpdateCustomerCommand : CustomerCommand
	{
		public UpdateCustomerCommand(Guid id, string name, string email, DateTime birthDate)
		{
			Id = id;
			Name = name;
			Email = email;
			BirthDate = birthDate;
		}

		public override bool IsValid()
		{
			ValidationResult = new UpdateCustomerCommandValidation().Validate(this);
			return ValidationResult.IsValid;
		}
	}
}