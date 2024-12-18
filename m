Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DB01A23BC
	for <linux-sound@vger.kernel.org>; Wed, 18 Dec 2024 13:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734528369; cv=none; b=bvM98VJEK7fH9CUs2YqbYmnB7ZVusmNCK/FQvt4PBhoHZoqydNYj6SS9jR/vgs3YB5neMnWm0kcWhoevqwL24lqwKTDXN8a/KMRsO+RGTU02JV8QSSTsRjh1KzKHABtdreNVC2lnPBu/Q/8S1/avNRqnGkvgDlnT2LX2z8S+Ex8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734528369; c=relaxed/simple;
	bh=mdXrbMGTc2pSmfmNP4zaPgCDQ8cTj4gkXgL9Yv/q+dI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gav0n/0gCmv0jr07TzIhYKWTco8Ptpm0A22R/U5tC7/v4yZ1FIfxSsQtJkYlWK/P+TPvorpOVfCGwsF1Quv5okAskpCDrTGwJ//nErNgMt2c6YnK30MtKzedWBni8LJmb+yqVA+oPN//A4tinlxBylM5ZieLXiHe61Lm7uS3NL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MkXTYiG+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MkXTYiG+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A6DCC4CECE;
	Wed, 18 Dec 2024 13:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734528369;
	bh=mdXrbMGTc2pSmfmNP4zaPgCDQ8cTj4gkXgL9Yv/q+dI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MkXTYiG+Y28YfFC8m8TIMNLlxSy+QKYW265mrmo3bvBe9k0SFQ0VGagA+gmUtPJx/
	 QsuEcX6wH8rRONIzu9xHXBX7eJyoAU5NBFWT48EfbMKpwvS5yoysYRvU+OgZGooxYT
	 9V1pS9HzDYOzdb96g+BsImRAr3kXWSoVuF1OY+nbkTm8xbjO/Q6FdhQHDv6Lc+Qo4k
	 57YvR5m45lTAMMIlmTlaKFuDJC0+lR3wMN+znmorLHZjaK16TkT2ms3eyff202B4zE
	 Iuxbl2saBD/WKzejmDga6M7jUe/BUsDEXEc5WncscRy++kbblunliNWhDU4IoSyOrD
	 bmDtF3XrwrloQ==
Date: Wed, 18 Dec 2024 13:26:05 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Stephen Gordon <gordoste@iinet.net.au>, linux-sound@vger.kernel.org
Subject: Re: [PATCH 6/6] ASoC: audio-graph-card2: Use extra format on each DAI
Message-ID: <10b19dc9-c113-4f72-94d6-c729ee88862c@sirena.org.uk>
References: <8734innkpy.wl-kuninori.morimoto.gx@renesas.com>
 <87v7vjm639.wl-kuninori.morimoto.gx@renesas.com>
 <20241218000652.197e8b7a@rpi5>
 <87zfktpkpt.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6laY+2K2MwUSykM2"
Content-Disposition: inline
In-Reply-To: <87zfktpkpt.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: The heart is wiser than the intellect.


--6laY+2K2MwUSykM2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 18, 2024 at 06:29:51AM +0000, Kuninori Morimoto wrote:

> Ah, it seems above patch is...

> 	asoc/for-6.13 :     included
> 	asoc/for-6.14 : not included

> Mark, is it possible to merge for-6.13 into for-6.14 ?
> It can ignore conflict issue. I can post v2 patch-set on top of it.

Yes, I tend to do that if there's dependency issues.  Just base on
for-next for now, I'll do a merge into for-6.14 before applying if I've
not already merged up mainline (I'm holding off on doing the latter for
now since the KVM people broke things again).

--6laY+2K2MwUSykM2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdizWwACgkQJNaLcl1U
h9Bv2gf+LPOb/oZitdpo2eeWwThb/YiReVg9yl+kEip70/qg/gMYnIc4O5id3rM0
vM2R5WzY+9bUL2JCzZH8UOy6sw/hg50HbvMLfXAHYKHDq0jUVrmVEeLvTJCubLEP
ws4uYkXtuI4G3YrCNsFtE6GupuYbN23v489k3SWJ+LZddd7q9Kcv2Mrgi54ZQ79Z
hW+zouNGmETU+yTy2VMQmPBMvvYhymhJF71DgBkT364EqEQEfLWfnx1mI926e6J1
2ho5DsVPB+Twp4l1YE7eDXB3MXjdA+CjaJ+na88sX5EM7xR++NrYCel8vaV4K6Lb
2O1qmjNEqyBTZT5/fYjT7TqcvWcVFw==
=FyxO
-----END PGP SIGNATURE-----

--6laY+2K2MwUSykM2--
