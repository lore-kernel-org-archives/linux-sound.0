Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C327C40D568;
	Thu, 11 Jun 2026 14:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781187038; cv=none; b=Rf6X+sUIjbhAWOOKgptwHlg3zgTtxkhk+1+JteJYj/PHToSwCO84f+oFbmUNf38e1vFYeDJDQfGK8FLvCZWZioDIC90ibvTjc8Va3o4v+TDHwX+PgAM3puOg9rjW9UYBXWAHhz7cxWJEG5CeLLESbJqwxyVf8oKtfzYCWK18vmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781187038; c=relaxed/simple;
	bh=6ELg1z84WMJjzCgnxcoT1AW10RxHJAK0QSl96mg03do=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h2QyvNj6jl9liC4kKO9yUCLCkPibv12Vv/ChL5WTsV6Awh+qorHHjhC8Q3mhlr/ogA0vgNrmc+lOdSyI1Vy+/SyAka8qfOiv0wYRATu4YHOpjND6h/sbRZTldEPiKXzESJ0iw24lltlGWCyIftuCL4X+iY7ahAow9IXUf9+yLJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DWgDGu2u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DWgDGu2u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8864C1F00893;
	Thu, 11 Jun 2026 14:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781187036;
	bh=vr20JB8bVBaK1pilRHNyEeuCr6bq4UFZBsXmphf3kqM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DWgDGu2ufbMPvKngBCVIyz3K3rp1qGdTSTfOtVxm0g3tqGVW9/V4lU1/miR0VPFQc
	 gmEsWEraIfFCLELBDPPOM6PflaZAE0KwhHu3tp6aUxhMM9vQafvdplzM/G85KFUNir
	 w0GWFkECUloCNUM9PKBLrMk2WoMgvECrwgVZkiMDoaEr9Rkz98dshL0gTteyzgWWwk
	 vN59nz6WVe/2gfp1A4X6YCwsL/VBZbCyasIwLOkxcb590+WTzUqFaAiFucktYRb4l/
	 JF9B6lir7wa6lMiBCf88f7tyKWdOYucx+3sE43XAbkcB8/Zv9994RVC3fpJ5Eu570z
	 9Zsn1KiqIE1mA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 539A71AC56C6; Thu, 11 Jun 2026 15:10:34 +0100 (BST)
Date: Thu, 11 Jun 2026 15:10:34 +0100
From: Mark Brown <broonie@kernel.org>
To: Yauhen Kharuzhy <jekhor@gmail.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>
Subject: Re: [PATCH v3 1/3] ASoC: Intel: soc-acpi-cht: Unify device quirks
Message-ID: <airB2kIl_R_CH4vO@sirena.co.uk>
References: <20260611-asoc-yogabook-v2-v3-0-3128447b67b6@gmail.com>
 <20260611-asoc-yogabook-v2-v3-1-3128447b67b6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DC6gm37vBP6n4Ied"
Content-Disposition: inline
In-Reply-To: <20260611-asoc-yogabook-v2-v3-1-3128447b67b6@gmail.com>
X-Cookie: Leave no stone unturned.


--DC6gm37vBP6n4Ied
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 11, 2026 at 02:51:55AM +0300, Yauhen Kharuzhy wrote:

> This file contains two types of quirks, both checking DMI for
> machine-specific strings and returning machine data for a matching entry.

You've not copied me on the rest of the series so I don't know what's
going on with dependencies.  When sending a patch series it is important
to ensure that all the various maintainers understand what the
relationship between the patches as the expecation is that there will be
interdependencies.  Either copy everyone on the whole series or at least
copy them on the cover letter and explain what's going on.  If there are
no strong interdependencies then it's generally simplest to just send
the patches separately to avoid any possible confusion.

--DC6gm37vBP6n4Ied
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoqwdkACgkQJNaLcl1U
h9B/9Af/fuxoXgNfJFUGP4yJ26PpteTGWdk+RocCNGCYObSIf9qiHo46Exy/++Mq
KI6Sqb5m6PqB+w64HKMaZh8w/EWyQy6MkcIOmWumRkPZdrYsgm75i6pehndZyyaX
0mwZIQuEy3H1ELuk02dDurdCYU7qFlCYtMs0mpMW7wUhtNmBsjyph7Y3+cP1jlwR
lQFsTK5RpL3YQRgfVAUFB8bf6WKJFIkJ+Ft0eAw5l6yVl30dl6d27yiWVn80XRMJ
v3oM8FPkzdfatI0hiVAYyn2nKyXUtIfWrANMy1d+Br2V2dAVRgicj8joPumfvMIz
qePul2mx7nHM7FSks5yQX4msW3kO9Q==
=JEas
-----END PGP SIGNATURE-----

--DC6gm37vBP6n4Ied--
