Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257E440DFCE;
	Wed, 11 Mar 2026 15:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773243017; cv=none; b=Jm7FHZJpwOluYZcMH5S2aXp1HVMIJslJFpD5hxNVBFFtjtR8BP/TfThZiVYFz8qjrNZqSGZsfnrAN8jMMnWnTTf7i0VR1dRiOEzHOJfj7KmRP4F06nxKW45sC4tLW+egNkbhHiZ/Ew1eBCxyJwa8a11utqjoQSCNjKQLRPGJkSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773243017; c=relaxed/simple;
	bh=+CGBCcnLcWyM1ZR4GRTe2PlhU3N2yEMovhrEucRd0RY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MACxFsT3cE+FI321xInTGXBnRVcsUL7yTPI+7Me0VdS3hKj0+oi4XX1dUtgBPSOh9ffET05xP5tabuJ8hHnAOphqz3nwPK2kdu51w7CLlt8T16NtcJ9Ftf4AsNCaC6CCLoxYMt6WY1wX1omwwb1D05Ep1Nwa3NpwQGN3u/Ku/ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uAeiFmdh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uAeiFmdh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 962EEC2BC9E;
	Wed, 11 Mar 2026 15:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773243016;
	bh=+CGBCcnLcWyM1ZR4GRTe2PlhU3N2yEMovhrEucRd0RY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uAeiFmdhxGFCr/SaEt/ciwWR0gaikqTBOLUHF0f0fr2siwdIzSgmUx4/u7u5HLqPn
	 zjljqxdVaRTCNtueEk5JGiHqjbgk6quPgWAOWK3gpbqrW3qD6AkiWVdOJlmO73EWzD
	 zX9rslt3IMZ4WSPQtxOKNwAZgk5TL6Gfvd/7CGmoHNHQPpwjzUNLZ8xfGLIKpqkghC
	 Ab2tnXYQqsKoxEfXEXZlw1+X8+AKVoFxAvp8xvWYBnq3xlqSAWf2M5+M81U4NNDgqB
	 zY4KYgOdlbxMHX2R6SvsKbLnngraM5fYwvWoxWkwVx+TKpNFARkLe5ufAR22GCr4rg
	 g29Yz7WgCiRXw==
Date: Wed, 11 Mar 2026 15:30:13 +0000
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: yung-chuan.liao@linux.intel.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH] ASoC: cs35l56: Support clock stop mode 1 if enabled in
 ACPI
Message-ID: <4976ec0c-f4d9-456e-81a9-55fcafa30b9d@sirena.org.uk>
References: <20260311142153.2201761-1-rf@opensource.cirrus.com>
 <80ba7c33-7949-4940-a72c-582ba749b2e7@sirena.org.uk>
 <efbbabe3-b42e-4f54-bef4-d27744f4309f@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="S/An+Np9RolJcGQs"
Content-Disposition: inline
In-Reply-To: <efbbabe3-b42e-4f54-bef4-d27744f4309f@opensource.cirrus.com>
X-Cookie: When all else fails, EAT!!!


--S/An+Np9RolJcGQs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 11, 2026 at 03:17:16PM +0000, Richard Fitzgerald wrote:
> On 11/03/2026 3:03 pm, Mark Brown wrote:
> > On Wed, Mar 11, 2026 at 02:21:53PM +0000, Richard Fitzgerald wrote:

> > > +	ret = fwnode_property_read_u8(dev_fwnode(cs35l56->base.dev),
> > > +				      "mipi-sdw-clock-stop-mode1-supported",
> > > +				      &clock_stop_1);
> > > +	if (ret == 0)
> > > +		prop->clk_stop_mode1 = !!clock_stop_1;

> > Should this be using fwnode_property_read_bool()?

> No, that only reports whether the property exists (it calls
> acpi_fwnode_property_present()).

> The property can (and usually does) exist with value 0 to disable
> clock-stop-mode1.

> I copied the use of fwnode_property_read_u8() to read this property from
> the implementation of sdw_slave_read_prop().

Hrm, OK - the property seems to be confusingly named and defined :(  Can
it have any values other than 0 and 1?

--S/An+Np9RolJcGQs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmxioQACgkQJNaLcl1U
h9DQ8Qf9FHdHtb++Afu/tc2ubaUMC6KeAH2fSCcfWqDxGFCl4BDo7Pk0PZ9H21S7
0OMC3QvRaCPlsGZFdaOsvfjngHVFNblr/woQ1NLJGbLMDfqAPMK+nT6hpJ2Xpo4D
0i5PBgirBYQqxDe8GyzjAEy7rZg8+q7Yh+y8ldcOOlHSIUp67St3OPyLvAzg9G9Q
R7YYwqgD5+EZ2MrYBIUJW9Zlp+bqXI84M+7zw5nvnRPjxUecvjo1j4vzxNI7Xo1p
UWWLoqjau048uzc17N3EZDq4aDt1Tgro4nG4457chS68EKyxoCG2H7Iv5qVf6wNz
Tlc2RudVCPLvPTLfRx3+NgeGwn4KmQ==
=Sysm
-----END PGP SIGNATURE-----

--S/An+Np9RolJcGQs--
