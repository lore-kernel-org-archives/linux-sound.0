Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE51846A;
	Wed,  6 May 2026 00:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778026438; cv=none; b=SbRAyja2rFWGVT6ZGaiO5wJx9tqqBJOTYR63Wp2piLC2JBgz7oLg0Q0ayblhkauqoK8FceJgH0BGGfXcWJxa82EpWSl3jd9BITgRluVz8t8TmHt8S1oFid93kBeHMs5+kYCX/q62PzQR4GTGTJbsJysr/eDLhm2EcBnAce9Htm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778026438; c=relaxed/simple;
	bh=iMc6Dhd7ZOOQCJ9g5Ov0WeT1mvkq1myTk4NZyeOCadw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CMbKi6o+pvDjTdsA0EVooCs9JihoFvmhR3gJp/vTQY1U3x15pbVcUUFb5DCjPFCvmWrRCssIp4RptzfPhE6Y0cqITZuwotQ70YP3UqwuudlA3tdERkm8R6ba1xcvHOzh08Q+SdsKl7oT8E0HzEalwIXLzW+/hz8nKiQ2vO0od9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=McdFY0JS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="McdFY0JS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9363BC2BCB4;
	Wed,  6 May 2026 00:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778026437;
	bh=iMc6Dhd7ZOOQCJ9g5Ov0WeT1mvkq1myTk4NZyeOCadw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=McdFY0JS4e4mhUnhx+0T1Ve/6uL/qE6Hc1NHOKRwfG39mJeCtwAj9fpV5+zcr3RO4
	 6CafEZ6qRljMZxRdVWJ68zB+mUdpiF7fvw1jANVINrlYPslcN5We8nOgVS3JeQMO0J
	 i0eGqqwB7YwWTmSxPQt4GFUQGiUnszGQriLqoDguKc9YEg7ybkRSnm5kRfQ4vqu57O
	 txK7taMaji4hqHaB0i7/iktK0zBIXM59DY+YJ2c0+TipGdMAOAuMH3dlQr1FdLWl4s
	 NSgnXeG014OJz0HeHHVqMS21YMUaUch8bNkHRTBL4bCkqWxU2ZsfE2soXH/Vfgb5Xx
	 VycXUJF2d1vzQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 331541AC5879; Wed, 06 May 2026 01:13:55 +0100 (BST)
Date: Wed, 6 May 2026 09:13:55 +0900
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
	oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
	shenghao-ding@ti.com, niranjan.hy@ti.com, kevin-lu@ti.com,
	baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH 02/17] ASoC: cs42l42: Use new SoundWire enumeration helper
Message-ID: <afqHw42Vcq-mPSFg@sirena.co.uk>
References: <20260505164807.4108684-1-ckeepax@opensource.cirrus.com>
 <20260505164807.4108684-3-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ufUrsGE6WunnGMTv"
Content-Disposition: inline
In-Reply-To: <20260505164807.4108684-3-ckeepax@opensource.cirrus.com>
X-Cookie: Alex Haley was adopted!


--ufUrsGE6WunnGMTv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 05, 2026 at 05:47:52PM +0100, Charles Keepax wrote:
> Update the driver to use the new core helper that waits for the device
> to enumerate on SoundWire and be initialised by the SoundWire core.

>  static int cs42l42_sdw_handle_unattach(struct cs42l42_private *cs42l42)
>  {

> -	if (!peripheral->unattach_request)
> -		return 0;

=2E..

> =20
>  	/*
>  	 * After a bus reset there must be a reconfiguration reset to

We now always fall through to this block of code instead of exiting
early if the device wasn't actually reset, the new helper doesn't
distinguish between no reset and successfully waited for reset.

--ufUrsGE6WunnGMTv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmn6h8IACgkQJNaLcl1U
h9Bn9gf/f+SrNqz+RIQDhUmZXxSTcYJVkIqaN6zF6ukWJwuxCdYOrkp0GIMfMxLc
HPMcEK1LnwRA1YjuBCVf4QwHkn7ZQE4MZ1zKgXOPfS2fK2Xq48fBhaBdww6fRoqZ
hi25HG4lhwJ2aH4+7dhM8TTtRgeiXOEradMKSj6z3CLsJ3KQOvTeBCiGaJLDOgmQ
6IqJqCtlX1pEzZBs3xwBre8xHjPRavLnodh+je7Z9cNzU433wLOnpUFBzleALPQe
7oK6jCwPxyBMdQpYv96WPRvOJDQ8rWFxMWPo1gdyrGYoOWEU5+pkQyIGHTr87mDN
MnSScR2Lr6mpoQqo3nd/pPCJQsw+Cw==
=E1B8
-----END PGP SIGNATURE-----

--ufUrsGE6WunnGMTv--
