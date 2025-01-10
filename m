Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71AB1F63C9
	for <linux-sound@vger.kernel.org>; Fri, 10 Jan 2025 16:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736526698; cv=none; b=ipN7tXSz07rLTzGsVtwxDRaIsTJlWZeCWKpBR+93wOWCvpR6VZ+T90zw18wJXyVHodecjX302ngTzlIvhTwDM0OP0FwvCBgdQ+1O/tGHTFtBis8zQsXQJTKBM1iAjMWSkb2wEWdLgkOSKhdEKXxSCckzXUUixiRfjUUSG6hnvtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736526698; c=relaxed/simple;
	bh=CFvx3tcw4k1oAUEkgS+/Y47410gb//QqJJYDQG52ajw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SWdX6j4or9qwFpFYmqwTBYt1SFn43WtTROTxJRADRhElcF0IHNO7G65kAXIs2OJcC4j5SI6Z0Kej3A/X4E0CaVCmYraiu/iJkmiE8F+BjeOmdWRxAT/AKxc57hJW/NLoGu1Z6cyXluHuSyBjsTF0Hvq4LQ2jNiKiHDAbE9K7Oqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J7ESLXlG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J7ESLXlG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C71B7C4CEE7;
	Fri, 10 Jan 2025 16:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736526698;
	bh=CFvx3tcw4k1oAUEkgS+/Y47410gb//QqJJYDQG52ajw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J7ESLXlGfF28zrHasCWgCsehnWKqBcSh8n8VQwkmYcWDaj1jQ1J+f+6ZVYj62aE0P
	 rIhzHuQNHtNM8X0uuIfRUShqjAzmBO5L8JbaG/VE/RBb7eNskFsq8b7C9rTbRpBMOA
	 UV6SLkYB25DXFv24HrJlpd5+R/g/28GFavJZQBIcMsBGKUexDGXXjT0LHodPAsiEXv
	 tC1hAxaxItdXCZRwa7i7GRlObkUSocfLEbWA58rb0C0LSFS0fW+khiPkG9Zsr7z2DR
	 hhGq7RHLIpsgHu8g/G5TXKnbWNe3RjOyytzpNkh2bC1fCoqOCCk8/iyvwuZCSDa39t
	 3L3ge2lXAJmMw==
Date: Fri, 10 Jan 2025 16:31:33 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.com,
	linux-sound@vger.kernel.org, perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com
Subject: Re: [PATCH v2 1/2] ALSA: hda: Fix compilation of snd_hdac_adsp_xxx()
 helpers
Message-ID: <e07e56da-4259-4a4f-a2b2-2482fc511e01@sirena.org.uk>
References: <20250110113326.3809897-1-cezary.rojewski@intel.com>
 <20250110113326.3809897-2-cezary.rojewski@intel.com>
 <871pxavdhx.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aA/VGyXzy3N7/bQX"
Content-Disposition: inline
In-Reply-To: <871pxavdhx.wl-tiwai@suse.de>
X-Cookie: RELATIVES!!


--aA/VGyXzy3N7/bQX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 10, 2025 at 05:29:30PM +0100, Takashi Iwai wrote:

> I can take this, but as it touches ASoC stuff, need an ack from Mark.

Acked-by: Mark Brown <broonie@kernel.org>

I tend to just not look at stuff with ALSA: on it since I get copied on
lots of HDA patches.

--aA/VGyXzy3N7/bQX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmeBS2UACgkQJNaLcl1U
h9Dz+gf/dzdlpDAE2CDzq7Ppqn1MqnWQZDsJePRcCw5eEyvtEi5AAKZwvnlz3RuG
uEEnPOtPNV9pPmYBir2VfXzGdSTkLNHaZal3HA6xLmXERBwOYsIoy5fXXUi4pcmn
A6ZBabvcUbgYWCyXeqsD4w0lyg7sSPCeMJUzdIJ+rT+YvylT1JNgW/ita9tfgwho
cdLZhbmrlK12jpPMXVD69byd0u1WUmniAOjcgJdNf9BCFD3GFi3be64IQjy6jSpQ
d88pdyCpANdOlRG61MA0kSqriBxtcIjZkJuleOhFirggxr4Kxfo7QFipWKDnxOrW
UQH3Bx90GVUTh6iPueZ7wrejw61mpA==
=4kPb
-----END PGP SIGNATURE-----

--aA/VGyXzy3N7/bQX--
