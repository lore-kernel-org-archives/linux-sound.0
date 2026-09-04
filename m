Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C877A511E76;
	Fri,  4 Sep 2026 17:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788544063; cv=none; b=tj5cxWjc3a2UwFOCn+NtNzYhL539Gu8es+cDVnVMXRe6nhMk9AwNU+hh/ffXPoQUQdO4ayDVhHTZhefKb9JlzOp4kLODjtHMnf3+J0cT1xf2REDnxtiBHgoEngz5O1XlqHujVbGqdCa8kuKANdJvoCxVOk99+WB3GdHWByH21xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788544063; c=relaxed/simple;
	bh=okkv6UDrUqy+DEthbwY9aepwc87vVJuEScNT8yiV0m0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tcoY6WRTwhHx8tQTfrCh8zTWDvt5XmcE3o1WgBVQoH8jobG9suVaBpuDVfdvp8Uv3ExBOTbiAJa80FBN7jA6C/qncKMiVm7L5W2D1b/1DXixL2mOmg0KesY6deUSwQyJIk6GMG3oODvcncj+3rCu+x9eUcC4b5a2+/tOwF2ZUPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PgYY4H6S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PgYY4H6S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB3401F00A3D;
	Fri,  4 Sep 2026 17:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788544062;
	bh=eCOtz/eK/E9rW0zcIgRUL/87v/TZ7l09UIY9gMQ0ON4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PgYY4H6SLf3R3NvzSgbSF8zwixvalL785pqcXnnjfVilM5MHOLP2q/ffzk06OyAoX
	 VaUwXmq7mMiCpFOf6nOSVAUBcCkD0FuM9CUdEDEhATyK3yxaU+xCxbZ7v5o4QUk5jO
	 /gDsiFlp9YnG2027R7tXCvOE3nvKG6X1eSd87GYcMTT/aHkwZvWjlFaOR/fVH7Z9UL
	 g3V4JiTMTm0S+cChiolaIXHiH5o7dqvBbbKhmdfZCv4cNXRQa3iTnONU69XMCyj+ro
	 nNrd5JhZn6/Goi9se+ByzUwGPe6RwEfymQNd7kGfu4sUbmlwE+tHUg5K9/4rjOXFpW
	 2xAh31NDEz3Kw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 0FA0B1AC52F1; Fri, 04 Sep 2026 18:47:39 +0100 (BST)
Date: Fri, 4 Sep 2026 18:47:39 +0100
From: Mark Brown <broonie@kernel.org>
To: Neo Chang <YLCHANG2@nuvoton.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, robh@kernel.org,
	krzk+dt@kernel.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
	neo.chang70@gmail.com, kchsu0@nuvoton.com, sjlin0@nuvoton.com
Subject: Re: [PATCH v2 1/2] ASoC: codecs: nau8360: Set DAC path to bypass
 mode when DSP firmware load fails
Message-ID: <apsEO6K6Qo1ADH-y@sirena.co.uk>
References: <20260904060035.196399-1-YLCHANG2@nuvoton.com>
 <20260904060035.196399-2-YLCHANG2@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RAsO9G6pITb1+7kJ"
Content-Disposition: inline
In-Reply-To: <20260904060035.196399-2-YLCHANG2@nuvoton.com>
X-Cookie: My vaseline is RUNNING...


--RAsO9G6pITb1+7kJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 04, 2026 at 02:00:34PM +0800, Neo Chang wrote:
> Automatically route the DAC path to bypass mode if DSP firmware fails
> to load, ensuring basic audio playback remains functional.

> @@ -1702,6 +1702,8 @@ static void nau8360_load_fw_work(struct work_struct *work)
>  	if (ret) {
>  		dev_err(nau8360->dev, "Failed to initialize DSP: %d\n", ret);
>  		nau8360_dsp_enable(nau8360->regmap, false);
> +		snd_soc_component_update_bits(cp, NAU8360_R12_PATH_CTRL,
> +			NAU8360_DAC_SEL_MASK, NAU8360_DAC_SEL_BYP);
>  		return;

We don't generally do things like this, we rely on the user to fix up
their configuration, but equally we don't have a good mechanism to flag
problems with firmware download to the user.  It's not something we
really expect to go wrong.

Since the register being updated here is a user visible control if this
does kick in we should also generate an event on the DAC Source control
so userspace knows something happened.

--RAsO9G6pITb1+7kJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqbBDoACgkQJNaLcl1U
h9DbNgf5Ack5EEylaxiBYfX6x0Ca5h2XClwAfPmBuqKkqf3atu8wy5q4fqj8ovn7
j1pAU2ZEW3NcXbtu8ppR+rOGRwfj2xV7xNkNkvl+g8SSVAMeGxDuHCDIhhSRuTSE
VeTVDbGYPYzO8yFwAGjycjDN3JMOCJCcVOEZbbesEGW7kQsCnyjvg0DEbUAB8j25
8234Y+J3EGB2xFhFhg2jR9YFpEhRgRnH6K9ns+or1yC0tBTJCd7/zbCx8dvndpOC
RkQuR7AWRnI8oqKw+qz6cvDnt6+oNxcR6wZ+xmbDWuUr8ZCS6Gnask3wix7vQ7jh
Q/dc8QhLV72gdTYFtoVpPAq0Wsk90Q==
=walo
-----END PGP SIGNATURE-----

--RAsO9G6pITb1+7kJ--
