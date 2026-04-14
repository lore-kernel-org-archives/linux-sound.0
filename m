Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B979310645;
	Tue, 14 Apr 2026 18:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776190117; cv=none; b=koUADiCOdgrysnmUCc8XdRLIYvcizhd4aGQBrp9jkaDHIpNtaGJ4Wp0e+Ew9iU/Wh4DQ2qarFNCXb67tS3RKWUP9e6fylZJ5tyOTdf1kBLCf1/iawPQmzSiGXWQgsyYdPhvd5xaxqWbhcph2Vi7VoftcODjvHC+yKZwcztX+EB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776190117; c=relaxed/simple;
	bh=Ozd025/xrTDLOxNrVs7b7G0/NZigIYX3P6EPqj9AhuM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SDoeM+bxH9whZtW6RNqWCf9TtmP9qcMS7smQCekZPlZ0/SKvOYqw7kSiDCsxYOnjF/SKLrA1HlrOs2JWjzrEF2e94TLPf3WQ7M/Za+IA+LKXaM3P1Zux1RANFqYvOUvZAATB7NVNFmz0X9thp2QzKbO6MxMIjzyYWk12D5bXdAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pMx6PxZV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pMx6PxZV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91375C19425;
	Tue, 14 Apr 2026 18:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776190116;
	bh=Ozd025/xrTDLOxNrVs7b7G0/NZigIYX3P6EPqj9AhuM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pMx6PxZVtg1YD6BqeoXbOcy7HqZwkldhJSAyr0xufTyS/YllC7dbQB3GP5Poe8IaC
	 wXOmf5XIuISpJSG/BsAZR422xofrUtae4Cic1b3wnPwfFBxoMtANkgD3KIYpWYc9ij
	 36Oa+uALakZnnZ4z73xM8EaMCAOS0jlAbzOS8ADDnDcpnm0EOSO1YGmFPWTo78Iq07
	 Z2rjlZ6EBwD7RQsq3KWGE53Vju7oG9FgGvn6y5tweZsEOIvdY+/Ndqgm3ShECAxPk+
	 FG3527VjLfjS53p+M8ZpwfgrNDYRJNI/8YKjHzlkVRG5gC9uaJjhrUlZxVb48HeGIq
	 nCZRpg3Ib9KRA==
Date: Tue, 14 Apr 2026 19:08:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Sen Wang <sen@ti.com>
Cc: linux-sound@vger.kernel.org, lgirdwood@gmail.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
	perex@perex.cz, tiwai@suse.com, shenghao-ding@ti.com,
	kevin-lu@ti.com, baojun.xu@ti.com, niranjan.hy@ti.com,
	l-badrinarayanan@ti.com, devarsht@ti.com, v-singh1@ti.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/4] ASoC: codecs: Add TAS67524 quad-channel audio
 amplifier driver
Message-ID: <dd740c4c-e0bc-4140-961d-6c6c604a594d@sirena.org.uk>
References: <20260409220607.686146-1-sen@ti.com>
 <20260409220607.686146-3-sen@ti.com>
 <adkC_fNHcpRA_ffo@sirena.co.uk>
 <a0f50798-3293-4b2b-8d9c-7a85fce9e8e7@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PuUWRM09uVj7iFkS"
Content-Disposition: inline
In-Reply-To: <a0f50798-3293-4b2b-8d9c-7a85fce9e8e7@ti.com>
X-Cookie: Academicians care, that's who.


--PuUWRM09uVj7iFkS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 10, 2026 at 12:56:47PM -0500, Sen Wang wrote:
> On 4/10/26 09:02, Mark Brown wrote:

> > This looks mostly good, but one issue I see is that AFAICT we only stop
> > fault_check_work during runtime suspsend - if runtime PM is disabled, or
> > if the driver is removed, the work will be left running.

> Regarding fault_check_work w/o runtime PM: the device has fault
> conditions that fire regardless of stream state, so the work runs for the
> duration of the active power state (runtime PM) rather than stream state.

> I could add a DAPM event fallback to gate the work when runtime PM is not
> defined, but that's more restrictive; it could miss faults outside of active
> playback, and adds complexity for what is a fairly niche configuration
> (optional check_work with runtime PM disabled).

> Do you think the DAPM fallback would suffice, or is the current approach
> (poll until removal) acceptable given the hardware behavior? Any other
> suggestions would be greatly appreciated!

It's fine to keep on checking for faults if there's faults that can be
generated, the only reason I mentioned runtime PM there was that it's
the only thing that stops the polling in the current version.  So long
as everything is stopped when the device is removed it's fine.  No need
for a DAPM fallback.

--PuUWRM09uVj7iFkS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnegp0ACgkQJNaLcl1U
h9C9ugf+JNbqHw5I2t2EAaLsAQ11sZ+f7RXRJosA6Wmpi1UloKFB5/ymnjyFdf2u
l69xtkCApVtwTedMHR9gaaKx/UaD4fADapfvp2se+r0RtsYapr+wWRJJ5mc80KG6
pOlpiqkTFuAPqrUiBH4SaN0aFWCieRoDmapYbU/E1awrc0vDNraB/emGobkwhVnp
l3uo2Q3eormVkRANYNAnBPgL+0LGYyYl445UHtfpVp4o+1DeJ6TcNoqcVdmh5ryI
YnjgQd36XR5lWmL9KUq9vPpngp1b+DF8der065ApOvp+ERe+FYuixoL2u9S2EHgF
kTCiLqUHCZc8WzMKL4sP+GfalaXKoQ==
=T1F7
-----END PGP SIGNATURE-----

--PuUWRM09uVj7iFkS--
