Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EDCD3D47AB;
	Wed,  8 Jul 2026 19:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783537922; cv=none; b=dqbauk1GjPmXpCriXDQkBfBQqccovHplaxYl6espiZq16TurWcO/+7uhRTOOOMlyVJz2JlFT6uVqnDrggZHUWXbKltieeTYSC093QOWtc/3wypPNClNIGg0YOQboZnxHN2YqqRzLjwsnLejIYOF16yjGbdoyQ/CwWnAVdmQ+uqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783537922; c=relaxed/simple;
	bh=AHJGdgLVcs9+b0U+hYJ2REpkRPctlOTm/9KrFAqcN68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PSqFeKU7cgmUOhrHOOe5yDGpLRET0eJvdMboeMyoGrfD7Zdwmpn2y4iuz7P8YygT7FPwB3wP9e3LMbi1CSZ2V1A70v5HcGi+tsc21x4oG5K7keU/fvfoEfLZobnj8zmeO5+B/29ad6nzZSXHCZspkkJuJQmq1tuejH01Gap1dI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WBwiNzL4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WBwiNzL4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A93B1F000E9;
	Wed,  8 Jul 2026 19:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783537919;
	bh=7gW1UZYVyjQ2M2NqvU0zYgWO0SDITcTPS+KqhiirHDw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WBwiNzL4xrokL7T6ob4BOeOInvFa/3JXuUp/Xmg5auqvTnW+OTnSwRnomvag3+hZt
	 pqUITBKMczmaxOkLdKrOzYftsH607vkqxh/DOCJ25dj1wj4PMpk8zYxMIugOLDPOW9
	 WtzOdKYikSBiOALBdDnP6zXbI68jSQJ4lv4e+bUWUzDvzMM+zdiABhYB6POxLnsxvq
	 Y68fYLjR0WV74q18eBlETPd7GIuh7MMb7arGVhIgKQtP9JUg0LC22HiMkOmLmvcrnD
	 UlQ6387nPXsLF3rP8GJg+XwDEyfNSJdzDUfB/7wA/iMNhzFf6ixzFZpZ9v7w7hqd9j
	 K+IufqGu3daPQ==
Date: Wed, 8 Jul 2026 20:11:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Neo Chang <YLCHANG2@nuvoton.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, robh@kernel.org,
	krzk+dt@kernel.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
	neo.chang70@gmail.com, kchsu0@nuvoton.com, sjlin0@nuvoton.com
Subject: Re: [PATCH v6 2/2] ASoC: codecs: nau8360: Add support for NAU83G60
 amplifier
Message-ID: <a5139285-2017-4c94-92f2-f87fbef6fa6a@sirena.org.uk>
References: <20260708093506.895481-1-YLCHANG2@nuvoton.com>
 <20260708093506.895481-3-YLCHANG2@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bPb+sFRLKRrMY7hN"
Content-Disposition: inline
In-Reply-To: <20260708093506.895481-3-YLCHANG2@nuvoton.com>
X-Cookie: The other line moves faster.


--bPb+sFRLKRrMY7hN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 08, 2026 at 05:35:06PM +0800, Neo Chang wrote:
> Add support for the Nuvoton NAU83G60 audio codec. The NAU83G60 is a
> stereo 30W+30W smart amplifier with an integrated low-latency
> Advanced Audio DSP.

> +static int nau8360_dsp_chan_kcs_setup(struct snd_soc_component *cp,
> +       const char *fw_name, int dsp_addr)

> +       ret = request_firmware_nowait(THIS_MODULE, true,
> +               fw_name, dev, GFP_KERNEL, ctx, nau8360_dsp_fw_cb);

This gets run every resume but there's no cleanup so if for some reason
we get suspend/resumes running back to back and the firmware load
doesn't complete, or the driver gets removed while the firmware loads
are pending during normal probe, nothing cancels the firmware loads and
they might end up completing.  Both suspend and remove should clean up
anything that's pending.

There's a bunch of issues reported by Sashiko:

   https://sashiko.dev/#/patchset/20260708093506.895481-1-YLCHANG2%40nuvoton.com

some of which looked valid.

--bPb+sFRLKRrMY7hN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpOoPoACgkQJNaLcl1U
h9ApFgf/XITbLpbuaEsOktfRrg4vKBaYvkVaUPW5mhT7anTKrSX69Ce+SEnRWo8V
cmTotB0Z8zn8ziV3QYo+zt+q/ecmEkEHCSWVmdUPNDhdRwriNMB7u1JZ1R9Wo/ho
BIIARxALZI4I06wE0gJii1sY9oh9kIFJOHzcIWDjEHdDQXXdZI6JLTivh4etD4Ac
9sK4KQ3XKuphSCu07zP1Y/+lcGjss7+N5VyY2OpSKZ1oVKLzqXsLsJI7pYUw1L90
+kZRHM5Ea1CzQ2cnY17SYQeDmKz2aNVLs3F+dzjBceIPshYqI2FW4fPlcZPFPU20
mtZD0lC4x+xcMc/1ePCj0er3ucfZCA==
=wcRd
-----END PGP SIGNATURE-----

--bPb+sFRLKRrMY7hN--
