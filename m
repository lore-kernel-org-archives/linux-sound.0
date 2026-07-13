Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A5325A321;
	Mon, 13 Jul 2026 13:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783949585; cv=none; b=AUmZm8lNMbs5FC4TnrIV8JtZK8w2uKukhBHslgZEXWP9maAVmZ+14PDZ5GII00zmfkKae6RfAy7h7N2+rgR6nlSVPehmsVtoNiLjw7pRAsSDJwn3gxsv+8YS4nZTHVaFjE9v6vBWLA4T6pXUcF9s96eaPI0KIcUI8fZ6FyiiJ9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783949585; c=relaxed/simple;
	bh=CD/1xYpF4vLV+4giYwfXUJumGTFtohcFakKfGzJSyJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HfcQ9lGQbbYZc+RNBO+1uT9zshoxplRCZU0pV2zl5am/WOMBBWexBuYIUcqm9bsGN29Nsbj9LbncTO+54zeoo71cKYEtQKnczgZujloKener8mkKKzfKzw3PEyGc+jRJvWbsNF6S2JzV673h4B/1TWP3KwMdq7Kx6/9ejBt6oAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ICS8U0Yp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ICS8U0Yp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 536FA1F000E9;
	Mon, 13 Jul 2026 13:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783949584;
	bh=CD/1xYpF4vLV+4giYwfXUJumGTFtohcFakKfGzJSyJg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ICS8U0Yp6su40kd/VaDZjrrEj/c1CV7XT6NlBDLk+ORagmLVJavesNK2C8qzlFhEB
	 4DbIfyfHLbYCYi0nPfNgp0ZKul4KbNJJc4Dl9G+fJE5qwGDMTigfSZCUyVY0qHkb+7
	 uFWJ2KLJn8q4bpR7V3HU0vB79sSruZkS5EA8l/9vaZX/5Mlbwu3p24jhkrCUqiIMGb
	 u9J/m4nBrhzSYVMKWJhpw6Zr3MRCnebltBtdkFETof1LH96MIpc3LHG0rGgwgMEHpy
	 4b4/jrxVb90SkmvYuUiUeHinFmRe5wfjXW53U5hIylH1TtGX9cQFCOprzoR19QDotO
	 VpzQvU1Lzu3Kg==
Date: Mon, 13 Jul 2026 14:32:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Gianluca Boiano <morf3089@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, "Wang, Sen" <sen@ti.com>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: sound: add Texas Instruments TAS2557
Message-ID: <37d64158-0df0-431a-9374-6c227a05fc05@sirena.org.uk>
References: <20260711145722.188556-1-morf3089@gmail.com>
 <20260711145722.188556-2-morf3089@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LKXqr5oULIUPW+B4"
Content-Disposition: inline
In-Reply-To: <20260711145722.188556-2-morf3089@gmail.com>
X-Cookie: Courage is grace under pressure.


--LKXqr5oULIUPW+B4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jul 11, 2026 at 04:57:20PM +0200, Gianluca Boiano wrote:
> Document the TAS2557 mono Class-D smart amplifier with an integrated
> DSP for speaker protection. The device is controlled over I2C and
> receives audio over I2S/TDM (ASI). It can drive a single mono speaker
> or, as two devices, a stereo pair; in that case the ti,channel
> property selects the audio slot each device reproduces and the
> per-device tuning it applies.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--LKXqr5oULIUPW+B4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpU6QoACgkQJNaLcl1U
h9AWVgf/V/itqM9XhL5d0SR5YxijwJy+8txuXBZn6nHtzN6yqzyIK6zKnaSl0K11
jM7OhXlwFSkCv2+Q8F2DAUxjDwnTou8B+Nd8eJ//R0RpD9GZSQFLn2r9qGdbwBWb
RHrPmCn299kcOz4t1nOH5o7Cy7Sy843k+LYYkWfsH+T77pQqvk83kJkZhqAvuj8+
wMEfyv/DOJgzG5JC0Iiwpr0n0BYCcf3PZYiGEFbag5R7CHytNri/ZOj5vA0vdIHw
BPDbtuBNgiUtfdWvu5+x6voNZzHYU/Uh6J7ua3zFLXbcqstloVNESXp4NUB+45A2
H3xx8+cdo1uDrvSw+0No+gpjK/+9Rw==
=fhmW
-----END PGP SIGNATURE-----

--LKXqr5oULIUPW+B4--
