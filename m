Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02332E54AA;
	Mon, 22 Jun 2026 15:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782140946; cv=none; b=FNLfNrY8uupLHWgricHZ5N5de78nzCUPSPc/Yv2nhRFm15ec2r4UNqUgwg9y/uWcMGOGNgGyy/WsIAFaVs5WgZ89+kbKWCdBxQjsr4H63b5LxSQoK16q3/6sSAT0ytYC4Sd8p4Gs1JlTZdRuC+VB7nmohIYcj02GTmlT/yrTomA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782140946; c=relaxed/simple;
	bh=U+S/i7ORNb/JlO1tkw7s8wy9l5h+yXETDLH3TMR2hiM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rFpJqRzLhXXMnwy3ZVZ3SMMjJf0176qpZSJ1/iq2SXInR1GEd6ICv7G3AQji+8Xsm1k3UPNNNeXcxvZ9+Z75DHWFqUNp8CRMeNdCEi2lDjUOKNSlwJydqLtRx6v1rzF9wuA6mf5+8flDy+ybYSTgCIVRh+wD4G0PExWoSWDWDP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z8xsDmpM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z8xsDmpM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 221301F000E9;
	Mon, 22 Jun 2026 15:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782140945;
	bh=m4qSLthdRFlmMLKdJ8lGsOirbyKckLfnyBFdbv2lz5E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Z8xsDmpMBL/2c11G09p7v2zTq//4OBra3XEsTf0KW07JFO7x+EDMl6yLbt6Dpnym6
	 +iSw7O0QPb2W9NlaDERW92kujLiTsg4gf1QtxZi8iPzEXLAYMPUb9z0mM6y6ClLOa9
	 +9UpuhzNT2kQ7EQFCW71C8PHrbdx2IKaO6shakFAZzcqrc1YgMyqiftiyXWUFXPnEv
	 HENnxP6j+ODI2WKE/gnUqwWgmUwzhUGR8wY64jNy2g3J06zLCdzUL77U19YRVQsWOl
	 pFu+gl9FUifBYy3Ta5xjctyfq5jPmR/T+fUNa3K558Vb2uyN9Jsmi8Gbxbs+xOXuhb
	 IeIRPUvdp7elQ==
Date: Mon, 22 Jun 2026 16:08:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: vkoul@kernel.org, arnd@arndb.de, lgirdwood@gmail.com,
	pierre-louis.bossart@linux.dev, yung-chuan.liao@linux.intel.com,
	peter.ujfalusi@linux.intel.com, oder_chiou@realtek.com,
	jack.yu@realtek.com, shumingf@realtek.com, niranjan.hy@ti.com,
	shenghao-ding@ti.com, kevin-lu@ti.com, baojun.xu@ti.com, sen@ti.com,
	zhangyi@everest-semi.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH 1/5] soundwire: Move wait for initialisation helper to
 header
Message-ID: <3d39f181-0d40-47db-8432-2f22dd3aeefc@sirena.org.uk>
References: <20260620110237.2684234-1-ckeepax@opensource.cirrus.com>
 <20260620110237.2684234-2-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PRUa/3pG8yjkwWzX"
Content-Disposition: inline
In-Reply-To: <20260620110237.2684234-2-ckeepax@opensource.cirrus.com>
X-Cookie: Now I am depressed ...


--PRUa/3pG8yjkwWzX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jun 20, 2026 at 12:02:33PM +0100, Charles Keepax wrote:

> As SoundWire devices tend to enumerate on the bus after probe, drivers
> frequently need to wait for the device to initialise from common driver
> code. The common system is to split drivers into a core module and then

> +static inline int sdw_slave_wait_for_init(struct sdw_slave *slave, int timeout_ms)
> +{
> +	unsigned long time;
> +
> +	if (!slave)
> +		return 0;
> +
> +	time = wait_for_completion_timeout(&slave->initialization_complete,
> +					   msecs_to_jiffies(timeout_ms));

You need to add an include of linux/jiffies.h for msecs_to_jiffies()
otherwise we might get build breaks.

--PRUa/3pG8yjkwWzX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmo5UAUACgkQJNaLcl1U
h9Bimgf/WsuiRE/RfnrVKkCT5oMUC5Gajz/Ze6Uv6OVVxqZnrHbMm8F3PCPZwr3D
vHv2EM3+d8z3c1UzMEz1SxgiRBU8ik5+1Rvcd9ueSQLp305csJ3iflbANkpVwBrG
croKaDOWcnj2Buv1VtClOFLyT+OO2ofL/Ax4LFxdlKQlJL7nbXC7gfUjN8kU+xVN
buJi4r28P/rC7s8VijJJkk2IJeIxFnO6Ncd+N+kPQLXtK0Eb5WhwVP8fGDO5Vo2p
dckE0srRUSOUvmQs4OWHzxkLFHL5VJ5Ttsis7PDzOTaBcNunQvmkBVf4us3yZ1FU
F0SEvqBBzplq7RLPT6lDGHt7IY6jBg==
=ptUR
-----END PGP SIGNATURE-----

--PRUa/3pG8yjkwWzX--
