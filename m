Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7486A13B5B8;
	Tue, 18 Jun 2024 14:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718722447; cv=none; b=S84TyKN4jQvfamERjggjOOTPmp2zeac79GZFlJ9f1oGDE6pAt2Qdh1GLptVOeaVnuGGAdF+eMh8ky5Dy28WvpffwPMnyaAHmQGIxNBQ9d1VnUmvMDU6FKXrZmyIUjBWX3HiTMHxX6XW7HQ9qUGXNt7ZhVgmumTehPpVJPx90FWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718722447; c=relaxed/simple;
	bh=a8Kjl5Sc9s+kYLMmM63LyQQJLQ21S9FnZ/zdTcyxi8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZsJmcJY9sb2B9iPpuV8LjYzZMhK7rZA8aQ3IfxC7rX8SMtgfE+EnXRPNT0HVIy5TbdQCeZ6D6+WbRrQo9yk0y/Szr50snWLqIqOIXtTEjX1g+bDGfp52vaXdSdHkqGNN9ue5A7rxF0qCrtLFKse3dKLoN/57fhgVe/mROkAt/nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fIysFqfU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fIysFqfU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC3EEC3277B;
	Tue, 18 Jun 2024 14:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718722447;
	bh=a8Kjl5Sc9s+kYLMmM63LyQQJLQ21S9FnZ/zdTcyxi8s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fIysFqfUWeJ7Wf1nAjV+viUbuM4wea/lbybTSonrv3tWWiRD2l/CLSNiDSmbbY/2Y
	 ADP62E85knZPLFGYhQrGMKn3EKpY0lyKg8p5HjC15bHf8jU3DyzJ0PTyYCarbAR7CV
	 bauS/Ez5ie6a0ISIa4QzA9M15SAEdPlR7sfd9l0mO9mXW3sqvRTHFE6FUS0emcZO7X
	 IzgP7baEfnGJMze6SIQPQMTvG7EdbHqtDBY1KWSszaOfDeTmRIndrLHU5sI0e3Wfdc
	 l9ocDErR1SxSq9vUJI6jg3R99eZrgBrb69uDw6vfYz/1atcY+qTNY4niFPoYEk8ef+
	 ZLg5gL9I8wb6g==
Date: Tue, 18 Jun 2024 15:53:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Paul Handrigan <paulha@opensource.cirrus.com>, lgirdwood@gmail.com,
	linux-sound@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH v3 2/2] ASoC: cs530x: Support for cs530x ADCs
Message-ID: <aa3eefdd-75cb-4772-aeca-1b98c62297ae@sirena.org.uk>
References: <20240617190102.1010597-1-paulha@opensource.cirrus.com>
 <20240617190102.1010597-2-paulha@opensource.cirrus.com>
 <96162ff4-8c54-4efa-b06a-dc20e358e712@sirena.org.uk>
 <4e192a95-bb3d-41d4-b83f-176f0f8aba6b@opensource.cirrus.com>
 <24e1df82-bcad-4b8c-9743-a5ea213807d5@sirena.org.uk>
 <36dae588-5f01-4e27-b054-8db49388e21b@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Fuj6WTz8QPr+0UxV"
Content-Disposition: inline
In-Reply-To: <36dae588-5f01-4e27-b054-8db49388e21b@opensource.cirrus.com>
X-Cookie: If you can read this, you're too close.


--Fuj6WTz8QPr+0UxV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 18, 2024 at 03:43:59PM +0100, Richard Fitzgerald wrote:
> On 18/06/2024 15:25, Mark Brown wrote:

> > Marking the register as read only should DTRT there, if not then that's
> > a regmap bug which should be fixed.

> True but now we're adding extra callbacks and complexity just to
> avoid marking a register volatile for some reason. The driver doesn't
> need it to be cached, so why bother?

Well, moving the volatile callback to be a readable callback.  If
nothing else it avoids anyone reading the code and having to wonder why
the ID registers are volatile.

--Fuj6WTz8QPr+0UxV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZxn3kACgkQJNaLcl1U
h9Bpfwf8C56mxWCyThKjJ1O5zVJsOieVgy+3sgl89QnlnpRJ7D2RWEQLvg28tNa4
6cPpCVbRkfiwrtPbvzYwrUDjoCtRBzxJjn3iBi2umEhNXacuFbH5lwy0HOMU8AJ5
E7kKNkdGyko5bCU2Z8fdtqSZq2IZNrjhSHh2CQc4BR4JWpodm5FKZ2ORy/Q3UsdN
mNjh4bddIo6laigK9+kqTuEW0w6iHiOn5JI5snw453tU7R7D0Tlo9xgydB0jwrBN
AWuuK2BIhCMWyzHN5HHkDucrk86IqGlZDOhQ4HucWhMGsEaYwPifbppuGZZyzD6x
mciPItYTBD2cJtNKyi+p+tXNy0gz9w==
=UT//
-----END PGP SIGNATURE-----

--Fuj6WTz8QPr+0UxV--
