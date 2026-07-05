Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D164C328B5E;
	Sun,  5 Jul 2026 12:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783254735; cv=none; b=dPrkL6tIvJe7B0vamBbefEluv6mQJ1bXvyswpAuQshCUzshcThBkLJI6E42gtXQ+tDGf99iHHDlBv5hS+jAXDhIQpjb4wqSjC8gGFcVt4NmgR+6bBX4Q5TBol6bTt/eY/rHKzdc6ZPpjWmsUTrOFyr0Kv1xVQpmpH4+/wI241Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783254735; c=relaxed/simple;
	bh=kCnFH0V5bkUOIV0fiHl29DKKYu4m94o1jAMzJXsZ7vM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jmFCLatZBMTmm5hl3KbnW+u9X/Db0U7KyUdJPLzu5Wy+RsUe3WHkXh75DLs4lXRFvolT/CHgD4g87bJGxPqXwnv5KFRHk9GZV029XgTYiyewdmyIsLUZh7rIH1dxAE1eUdbV2HnF+0RkV1H5YC/biay4HC9EPV/IyM0CF4R+fYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LnUhwDHo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LnUhwDHo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 478B71F000E9;
	Sun,  5 Jul 2026 12:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783254734;
	bh=CUmcoIH8UZfQOi92h9YHbdWwrZUGogZhLPJcSsnuaE8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LnUhwDHoT1C2NwsP2qpQUJPINDRwCgLMsyP1P9fmVkRgM/PaVZk2xVU+LWoaa6DO2
	 hcc2s3uYQYvhPOzdIp0hohZ70JPlsjRfVandee4VUaTE4AjVmcAoMUKr6hOiJVJIIF
	 YfPk27/06kyXvTeLhEa572sGVgW8XW7fdJGszb3+aAwR3Vi7+nMU+cM08V4kkykZDl
	 h6ZvRz5NUzxi4qR58Pp3YLrNUqsiSLp4gGYVX5G0TAPiVPXnoGHYmQu00kw5zQr0Bv
	 Ji83tV8I2/Y0XuiIySRHLImrNwEfxagbCGDQuhUA7sr6FqKU2GIYWWNDaqCxL6CeRU
	 rTJOKVZYTgR+A==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id EF3E51AC5AC6; Sun, 05 Jul 2026 13:32:11 +0100 (BST)
Date: Sun, 5 Jul 2026 13:32:11 +0100
From: Mark Brown <broonie@kernel.org>
To: YLCHANG2 <neo.chang70@gmail.com>
Cc: Neo Chang <YLCHANG2@nuvoton.com>, lgirdwood@gmail.com, perex@perex.cz,
	robh@kernel.org, krzk+dt@kernel.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
	kchsu0@nuvoton.com, sjlin0@nuvoton.com
Subject: Re: [PATCH v5 2/2] ASoC: codecs: nau8360: Add support for NAU83G60
 amplifier
Message-ID: <akpOy2HJsDCu7wVx@sirena.co.uk>
References: <20260630021510.821919-1-YLCHANG2@nuvoton.com>
 <20260630021510.821919-3-YLCHANG2@nuvoton.com>
 <66ce56eb-95b9-4915-8658-a1e4d1eacd7f@sirena.org.uk>
 <3b32493b-b827-e4ed-3ad1-281dc19faf40@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9OleKUcYTZwvIODp"
Content-Disposition: inline
In-Reply-To: <3b32493b-b827-e4ed-3ad1-281dc19faf40@gmail.com>
X-Cookie: Absence makes the heart grow frantic.


--9OleKUcYTZwvIODp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 03, 2026 at 11:26:12AM +0800, YLCHANG2 wrote:
> On 7/2/26 23:15, Mark Brown wrote:

> > I would expect TDM to be configured by set_tdm_slot() from the machine
> > driver, not from userspace.  I see the driver does actually have a
> > set_tdm_slot() operation...

> Our DSP functions require specific Slot mapping (e.g., Slot 0 for AECL, Slot
> 1 for AECR).
> The standard set_tdm_slot() only defines active slots but doesn't handle the
> functional mapping.
> We originally intended to allow dynamic mapping via UCM/userspacea and then
> apply these settings using set_tdm_slot().
> How should we implement this mapping according to ASoC standards?

This would usually be doing using DAPM routing if it's expected to be
runtime variable, define AIF widgets for the bus slots then route to
them.

> Should we define the default mapping during the codec probe stage,
> or is there a preferred way to handle this via the machine driver?

Device properties, this is better if it's supposed to be fixed for the
system.

--9OleKUcYTZwvIODp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpKTssACgkQJNaLcl1U
h9A/mQf/c053HM+naqdF17/uVmgb6e04rPNnqH7Us+kvxpfWyPS0bp+3vo1P6Ur0
POHx0sPld8RauUxTig2rXk+Kt87Asn3/wm4kTQrOvOBv8airOLBViFeIQHoIrajo
JdH678NtqoVhc3zy5W8pt+/6zeTbQK4obbfOzjtWEe6EbsrXiy3B9BUnxbe2bt5k
E3coE4U4a587PPepJe5ue7eJfyc3xFHTHlsLxtWXsO+P0oSZXwrt2CB74Cvjvzwc
Yt1JExI6vhfLnLt/2YR1PtTiMH9srG/xVBQo7USnxq1SxDnV2y8nelMpyE9LjkAH
KZ9YYwMy9ji8OzML5MUqNYGiVXihiA==
=bhKF
-----END PGP SIGNATURE-----

--9OleKUcYTZwvIODp--
