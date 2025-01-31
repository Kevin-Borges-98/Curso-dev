﻿using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Security.Claims;

namespace Equinox.Infra.CrossCutting.Identity.User
{
	public interface IAspNetUser
	{
		string Name { get; }

		Guid GetUserId();

		string GetUserEmail();

		bool IsAutenticated();

		bool IsInRole(string role);

		IEnumerable<Claim> GetUserClaims();

		HttpContext GetHttpContext();
	}
}