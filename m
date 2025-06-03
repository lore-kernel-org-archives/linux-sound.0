Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1303F211C
	for <linux-sound@vger.kernel.org>; Tue,  3 Jun 2025 11:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748948473; cv=none; b=DnqPB7lMMsFHdIGjRK1FSkmY6GJlHPBVyLZtVBcrjSKES4drgoSO5FeHP6agQHAxYRgDKrFRU0lZJWwHcpS3wB8H7GBb5ULp0PQjmuvRyuzfPEbOzxL1mRCti/bUTpDL6XHdI1ywh8xFBSMjQrCS1eXYjKw7JRLIBsRb7LRTruQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748948473; c=relaxed/simple;
	bh=pMK92PDLjOpjhpRI6dZ5TJ9SuIC2NaD81NIZCB+4YOw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=krELOe9nrgQY6W/5nAvBn9DlwtXquKyKElYrxxNBiydSxNwtZv4iaXK/DAggD4h8AYKweL2k084ZAspKMsLYzJjMiPcG2hSa2okGTfcHOTFG/OhVOUP+5aCj4NGPXOcipi3c01RSdJq8se4fvifNwpgqysCkgsQOalNkvFABAOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O9+B/rTY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O9+B/rTY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59AE9C4CEED;
	Tue,  3 Jun 2025 11:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748948472;
	bh=pMK92PDLjOpjhpRI6dZ5TJ9SuIC2NaD81NIZCB+4YOw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O9+B/rTYugLf3sT0bJCvnOarLEXBDp0ugZ8EVme2UZIOXjXcxljH8pesmB6YRqWPQ
	 z8/6ziWn1zJSwu5g60pHMsqIKie/LwR3bJs0yLpDYce0G9AfZvwNpQ77t6KSGEHsN3
	 Exeq2YB3OfUXVQWJxY4ZaZN+3bnIpjvO/WQpCfGULuVRnd0nywpNU29sq6IbNFa7bd
	 PPT5jyQkxZXy8gig2DwpRsQVwYJxSuHizrdRUX+i3w344cqW8KxXZBLeO2QQ/5HIzP
	 FcsTupcxcUMZsv6oqR92pW3vo9WX1jYoMNjyqT0aQwgNlZ3pH3Bni4lxxsWb4zLNOf
	 rWQfhiFnZiPhw==
Date: Tue, 3 Jun 2025 12:01:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com, perex@perex.cz, amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org
Subject: Re: (subset) [PATCH 0/9] ASoC: Intel: avs: Set of functional fixes
Message-ID: <b8f4cfcc-4cc1-41a0-befb-f069308005df@sirena.org.uk>
References: <20250530141025.2942936-1-cezary.rojewski@intel.com>
 <174888256446.96622.6929185418537717818.b4-ty@kernel.org>
 <64f38617-c8c1-43b2-947d-5182321d8f6f@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+TBXSHT7IpVbLTd4"
Content-Disposition: inline
In-Reply-To: <64f38617-c8c1-43b2-947d-5182321d8f6f@intel.com>
X-Cookie: Avec!


--+TBXSHT7IpVbLTd4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 03, 2025 at 12:57:09PM +0200, Cezary Rojewski wrote:

> I've just checked broonie/sound/for-next and it seems the status of the
> branch matches above - patch 8/9 is _missing_.

> At the same time, I do not see any reply with reasoning behind skipping the
> patch. What can I do to help address that?

It was waiting for after the merge window, though largely a fat finger
as I intended to skip patch 9 (adding string.h).

--+TBXSHT7IpVbLTd4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmg+1fMACgkQJNaLcl1U
h9BKMgf/e8H37CKQHEf6TwDSrsqhZwhwEphEMCEhKwDlAS9TDvQ/1zDp+CEKvSS8
KTvMQHEE514j2JKZWrwQJemAlhDzuMlliFaStKupcnU3PDFUtQ3oQtX4f9KtbJOY
e65ARw/mV90OCZz7BdBr3xqspluXrKiutHGGZ9/Ue/h2b7ayzh6sMLyHV3PKicTV
pMHPKeqi+xX8qhGkI6nmFBZYR+FmaBw7c6IZj59lNsXlTAtkstSH6gwJlWMRLyik
CTAgGELRdmqwRxw63MootJvwEm4IVsZ911smKcMJWM/Jsq1RoJL40LuNNOaXhjVF
ABfhErvxueb3mHvRB7pN9ReGRUgk5w==
=J+a2
-----END PGP SIGNATURE-----

--+TBXSHT7IpVbLTd4--
