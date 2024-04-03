Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D99D14A4D3
	for <linux-sound@vger.kernel.org>; Wed,  3 Apr 2024 15:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712159602; cv=none; b=kD7fgWPSfMBRhf7RPaSX3dcmQ3vU+jC9MFNHb44AHbwGvss/BQ1C8DpG1GfHtD3l1b/3ur9WvRB2BfyVtpixiQtBsPl9SllJytxl6hKJ2uwirgyeL0aewnOMv58rX25k31XpQWIFmTyC7h/UiYOGSB2KrN2QPYFI3G7m3BtF49c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712159602; c=relaxed/simple;
	bh=k/OEm1O+N4pFF8hKKQ1wp3dIBzJrgNFMh7ciuZb3SgU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lfonCVKhRh2y58e2OPFl9Vu1IHGM4BRuAwoa8Qx1TErWjZneugLpI6ZPKM2KSL12s+/lUkdRAQ5+dncozvJ4iJ6R2EkbnOgqffbVSkHOP9LlioxWiYv+l6eg71tFWv7MfGJhJr9PKuVBXQ3vgdHw4HYzNF32QJTJeesyU5hbgQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sLg7zsqa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sLg7zsqa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28717C433C7;
	Wed,  3 Apr 2024 15:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712159602;
	bh=k/OEm1O+N4pFF8hKKQ1wp3dIBzJrgNFMh7ciuZb3SgU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sLg7zsqa7TwwrbSu5mXYsd8T/1gxfVBuRvhweIu57XJOvEJbsGdCYrPuTixZ8DHDc
	 jyyvniVOACqSumcuvdW/hjzg4Pnf45zNsuLshvsLpiEn6Vzw8l8gwnSwaJHc27P9Kk
	 6fei932wpqzuHgzjBSNuJBrhqPLVRTlsXYGvEjsZ/HjIaH8lo9X4y8zkTah3NWAuN7
	 O7V59796ngEC5IDsvKsgfziNkKfuqcye0kjVHYI+69AAAWv2njISKjNoP1IJonWMVz
	 Dl5sdgRtzUQ/DV7G2qQUfnnZpDKwXFC30rzGcndLDHSCX7VIUeDxnPlLxAg9un3uYX
	 BJRa/gEJkbaqQ==
Date: Wed, 3 Apr 2024 16:53:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	tiwai@suse.com, perex@perex.cz, amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
	cujomalainey@chromium.org, lmajczak@google.com
Subject: Re: [PATCH 0/4] ASoC: Drop soc-topology ABI v4 support
Message-ID: <70c48f28-36c5-4fb0-9f07-5d8e4eeb1694@sirena.org.uk>
References: <20240403091629.647267-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jsog9sEwC/0aC5C5"
Content-Disposition: inline
In-Reply-To: <20240403091629.647267-1-cezary.rojewski@intel.com>
X-Cookie: Knowledge is power.


--jsog9sEwC/0aC5C5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 03, 2024 at 11:16:25AM +0200, Cezary Rojewski wrote:
> This patchset impacts UAPI.

> The only known users of the soc-topology ABI v4 are Chromebook
> configurations. Starting from kernel v5.4, all of them are making use of
> soc-topology ABI v5. The patchset first removes obsolete code from the
> Intel's skylake-driver - the driver of choice for the mentioned
> Chromebooks - and then proceeds with removal of relevant soc-topology.c
> and uapi bits.

Do we have to worry about old Chromebooks that fell out of ChromeOS
support but people are still using with a general purpose distro?  I'm
not sure what the user community is like there but v5.4 is from 2019
(and products would I guess have still been coming out for earlier
things in 2020) which feels kind of recent.

--jsog9sEwC/0aC5C5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmYNe2wACgkQJNaLcl1U
h9AWEwf+JraZmqk8SeRd5dhoQ5JcHDeOkXYlvqrh7duippvSjyHyJ5pTkxUmIJlp
3sMJ4UXQJWA3A/xeyXnCw1PuBHqIypk/tJMLwOWkWlQ+vjr62Zgzs9EA87f2tVaM
871NcBIYBHATzWrQCBZErDqISHLgUbQ/BWc41KITG9kQ+ngsRUHXg6viSCepAb2H
EOfTTROiyvZT5p1aTVwhGEQiJxV/Xm1NkAuVlXZGZjdx3D1Kh3vdJLje4g4tlFZk
AoFYPJbHeHqiYr7wln8W4B7lYv1RiTz/trbogtV3rNhNrDiwFXe7X4NhWSk/mK5t
PzxcdpCwGvwyfYqqVboF4x0ZeOrEkg==
=FDsA
-----END PGP SIGNATURE-----

--jsog9sEwC/0aC5C5--
