Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D01282F3B
	for <linux-sound@vger.kernel.org>; Wed, 29 Apr 2026 05:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777440114; cv=none; b=nmqsH6tc12NPygs9NdYVaBUwdR4vhjxEWRfRgWBoTViVrp5P1M8wUWaQtWsUglIw64esbFe9FmNppM4zCfoEaQY5inGVHYu+sHRyg8hRn5DzRqLGFAcp3wNst+FgyUu27iYjwNl+jxfDwLUEeYNsRSMp0cFpMqLQG1AbgXKWJ4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777440114; c=relaxed/simple;
	bh=x9nxK5yIuqDyL3I0l2OLr4/D/S02JPBmwVeVcuGk9a4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FbFVfIRAnCO8+JOL9Ai62PcZJhd0+5wHShA4IwouC02nXjfRjU+gVy56MBuvPoww9mP1OjqvXb1DeI0TSuawyxa5Mo3DMmkMgBGtueWVejTTx3dt+SMyb3+h0R5iCyakKbHrGiTuhYJHqbK3dHC4mCi5yPYsvkDXPAllhD4t+eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=JZpUQF0v; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="JZpUQF0v"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-445795cf6f1so1468519f8f.1
        for <linux-sound@vger.kernel.org>; Tue, 28 Apr 2026 22:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1777440110; x=1778044910; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3TRGM11Oo9A/5BC8iYPdvRFql8rMPwehfRNi/N3/DQE=;
        b=JZpUQF0vBWQqgJXhdM3EjDEGX5cA5o8niqSSQGiQhPcuIbzANg2OEKX4VpnVa+Bp8I
         4kozOWgQ8br9sRAyyrICim8ao5Yl0rqma4RcH0xHVxlN2F71QBFomSMBck8+H4t0uHUQ
         g4/ABNTeRYnnth557DmDy43AqmYZIGOHZRUiUNXGwOIac6k7IwrDk3HNu25bRKFCd8jd
         j7bNKLk9N1KpGQ1H3COXzKLvHJtKRsWipOL74fm9SDl2DtMbtEyeijOSboorbP5DJ9Xc
         GJm1hUXITJzgU8SEJvFIGv/qO4Bxp6kAi5+cfpd2Jt+o8uZdXLYfaFHP+QSIJWhWJHXX
         /PwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777440110; x=1778044910;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3TRGM11Oo9A/5BC8iYPdvRFql8rMPwehfRNi/N3/DQE=;
        b=mQJdsbShEpymr+EIfzzGRA6rxjxGAOF4EVtCvjbaA+sGjL+w1wh+sFH9dDxYCqCsxA
         B4eUI1LYfBqUrOirQ6IdO/jn73K6p0Y/6p1ZmVINnBdecqeQH9d3M+CK+NOgDJ9JFz04
         i22t138cddDKUvx57oAuIwpKCcM4I2J0is0mZtgyom5d09GbtLQpL11gsoFNcgkKhaRG
         6nwwd2R1RhkwyeiSQ0nYh03bu2FobaXWB5g6afdPZfGZKXjgSQFgY4ekrIjCe0bnmEvB
         DAnE/TYFjvS6xY2t5Tjco7bCx5JmlAXgGnyUGANvcQrXkITxXTf/PUE+Q1Zl0RIxPWno
         p4Mg==
X-Forwarded-Encrypted: i=1; AFNElJ/bcWoR0pWDS8j6WCYYX5ZVrTjdMLaxAbVULMdjb9DtvmYpIx+GUUOphazSBdGwrrbm0TzGVWW67qhj1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YztwjChV+I+IrAJ1nYu+kcKyULaZp9Xpb1Uqv/zl56WkVbejBfC
	L9mUSamfRt5VnYEAJ0NCY/Ce4gCf9vzH0ovqcz0VqBQQ90R6uEnMTuq24JUZpE9gyAQ=
X-Gm-Gg: AeBDieuLyMnhY3VGYi0jBgF287ww5o3brZN638DGQ+pOBkX5079bDTYiNBj2frrIfs6
	RH3ZEajvT4QgBphnsvaQWLkywHWDNKz947xnuwcv7gmmf4d3K+tPqOPRvj4npzjwBJz3Hj/ZhRS
	4hixFTXTjMjqs9Tdixcup9GM01Q6fgbWRlmZ0uu5C89ZsAXE3O7kvf5hGktqqpLHn86hCFQXTLG
	twepxcg02L4MBEFLZX5tCVwV9RtH+z1FRNijaIyuLVUpZCQBD7R1XpshPLBTnj1aloMyBDOJL0a
	JdnZj9WG0AUtZq/LbPOc+vEeDbx4FXTnsc9+XlctTzqz2YHfw+4oyP7bKGgIWmWlZ6qO2Zz9Nud
	HsBoKHmoIKUlSzGNJNbLTGLGYATUu1xjv5Xizsa+bLiL5/e5O/pr5c6PxN5U0iRTPHbAWgLhM0g
	Fl75mgwYh4BRkfmtQ+Uj9K36fIdX+tmuA2cI4YnOY=
X-Received: by 2002:a05:6000:1885:b0:43d:733f:aee6 with SMTP id ffacd0b85a97d-44648f28f69mr10428048f8f.10.1777440110554;
        Tue, 28 Apr 2026 22:21:50 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-447b7217c56sm2900140f8f.20.2026.04.28.22.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 22:21:49 -0700 (PDT)
Date: Wed, 29 Apr 2026 07:21:48 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Ola Lilja <ola.o.lilja@stericsson.com>, "Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>, 
	"Christian A. Ehrhardt" <lk@c--e.de>, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: codecs: ab8500: Fix casting of private data
Message-ID: <afGUk057kw5f2EOO@monoceros>
References: <20260428192255.2294705-2-u.kleine-koenig@baylibre.com>
 <177742366371.363516.7540902089580354260.b4-ty@b4>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="s5drs7mklefdo2x5"
Content-Disposition: inline
In-Reply-To: <177742366371.363516.7540902089580354260.b4-ty@b4>


--s5drs7mklefdo2x5
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] ASoC: codecs: ab8500: Fix casting of private data
MIME-Version: 1.0

Hello Mark,

On Wed, Apr 29, 2026 at 09:47:43AM +0900, Mark Brown wrote:
> On Tue, 28 Apr 2026 21:22:49 +0200, Uwe Kleine-K=F6nig (The Capable Hub) =
wrote:
> > ASoC: codecs: ab8500: Fix casting of private data
>=20
> Applied to
>=20
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-=
7.1
>=20
> Thanks!
>=20
> [1/1] ASoC: codecs: ab8500: Fix casting of private data
>       https://git.kernel.org/broonie/sound/c/a201aef1a88b

Thanks for applying. Sashiko found[1] that I should have written
"private_value" instead of "private_data" in the commit log. I think it's
still understandable as is, but if you want to fixup that would please
the pedant in me.

Best regards
Uwe

[1] https://sashiko.dev/#/patchset/20260428192255.2294705-2-u.kleine-koenig=
%40baylibre.com

--s5drs7mklefdo2x5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmnxlWoACgkQj4D7WH0S
/k4mFAf/chRsFGCPmCpBN52WltnvABjQ1uFWeZb1QjVy5gH4BpoXpbfWFUiUhh5V
gfKECFQS96O60Ou3bAEY+tad5quLig7t2sy5DsQG36fZP1Zvch+ya3y/zb1sC3Yr
JcRTLrA4za2M0w98Bxtw96E/D5o+tN3uoO4aXUZvgzLOIdXdZ1BJMhscFVy5WxGq
HMFpfmqiKMFxL9kdcA4zyP5PhLxKidxBuDkxzQg54HnuYAMruS/pw30h9CJcRRs2
lcpZTOTXB1HqGXWjuda4mHkWACe7XTAY2RP+HwaV6CqSWsMHx6U+fI0S0u8FqcS/
iHQ+7K4vl/INS8bkvLBWDW9N0FWH8g==
=UcoO
-----END PGP SIGNATURE-----

--s5drs7mklefdo2x5--
