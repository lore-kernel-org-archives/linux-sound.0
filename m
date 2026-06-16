Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4863A309DDF;
	Tue, 16 Jun 2026 20:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781641406; cv=none; b=usBpLDnYFSWD5AfAPQ/EDf1V6lOLWBnxPwhB/hURyh5qn48IdKjNG3zXRoAaKsKINs4w1+YUCVmK/uhOsjeXeykEPz0UTRkKRGF+VzlNVuauwI3rl119PBGVssJb7IefRhBkPo/eAU4kLES2quDGEu0oSMHs5B2lxKEn/EBF4jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781641406; c=relaxed/simple;
	bh=gT6ed+/sv7Tk2a45VmT2GjsK+Xh8jcVEZuUkalfYoAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FqXGzG9DOVEyaS94Yv2JZ9TW7Bk1raxQOHJHfSv9tBEeSGcr9HUjQ+uEToDHtFkBSfUgtCYV8HlzPE/oAEcZ5ktI3uwjNTju4uTu2gYoz9aYzPSivvUgB8FlE0ScYYyef8nciPlD1kHUZK7JpA58HWmRoDdvDVXvqwWPXdVDCvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NP/gYieC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NP/gYieC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA6001F000E9;
	Tue, 16 Jun 2026 20:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781641404;
	bh=gT6ed+/sv7Tk2a45VmT2GjsK+Xh8jcVEZuUkalfYoAE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NP/gYieC6OmPb/2hM9upMaUMuXztqosRlwkRbSXUfc9TatnKTIyt61vIH+YUgxZOS
	 QZmAvESLcSOaMWIJYzFpnxKLWpSLY5lVvUbs7oVFbJx0E1TmxrZN1Iiid5+MqFJ6dF
	 QYo9pXrj1hrtHaKViWGZ3M6C+GZ3VHk6iep8rknvgxUUkWf5/wFA2EW66Z4wufJ0Lb
	 sMAyFig8QE6zeZU5KqcMeUxIzUlVrHaHIFX2ps2KV6jFSJZFwp4Yku0HNQ+4kGTe1M
	 4NtzV9TfyC0fvFSYtaf/3BVZWw47r5Vdh+U3+ZWZ+7BUM3r1Ls3UJF+GNyrXGyZJ0P
	 bjZXJahn1NOZQ==
Date: Tue, 16 Jun 2026 21:23:19 +0100
From: Mark Brown <broonie@kernel.org>
To: "Pablo D. Bergamasco" <danpablo@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: sound: add toshiba,apb-dummy-codec binding
Message-ID: <ff68f7fe-5459-4dda-8810-9db6ae2146ab@sirena.org.uk>
References: <20260616185619.1581174-1-danpablo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wwW1L6k/2CumYSRq"
Content-Disposition: inline
In-Reply-To: <20260616185619.1581174-1-danpablo@gmail.com>
X-Cookie: Password:


--wwW1L6k/2CumYSRq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 16, 2026 at 03:56:19PM -0300, Pablo D. Bergamasco wrote:
> Add device tree binding documentation for the Toshiba APBridge
> dummy ALSA SoC codec used in the Greybus audio framework.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--wwW1L6k/2CumYSRq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoxsLcACgkQJNaLcl1U
h9ALdQf/bpL7a4vJfiuasEf7BIf8IwZ/ogKD8/qeHaBiZg6QJE5YxvtiE1IxvZ5T
cW3S9O64e2YQpDyDnOZSHIp0wXLmvvl3nqUk9T4BnO+Do3HDqIbDVCP4TStQShX+
UJ1vYf/m5/myp+u3z3YG/E2EQGHwa6wgJ6zgvLSOkXhP4gjtf/f1SReAPSLACQht
KfeNe93ByAq+FY59zHL6sMa529ghoc8Ivxuz4EvmIFc1XH8pPQf7M2LeWIrIW5wB
Fd9oldQF2u3p+xfcBONJ+jtR55Sf8Kf2281NcSFaSng0FbqIckZUGz6hT2SUcca0
LDWFq6hYAqbT2cRw1K714E4xTQjgoQ==
=kz7F
-----END PGP SIGNATURE-----

--wwW1L6k/2CumYSRq--
