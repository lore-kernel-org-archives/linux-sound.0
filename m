Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689063CB562
	for <linux-sound@vger.kernel.org>; Wed, 29 Jul 2026 22:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785363960; cv=none; b=DTha67FJWhzYTGcB2XznCqa6u0xY7y1hkAYCRYXMP8KfXApOVHz4RkHFvOv6NslHimOggA1CN6gFpgyA/ycMrwi/0qnBjtQ9mzqyW3FHZCgy92yHLxRP1uiJ2YMRGeZOt4Xgeqeb+4FkZezITn0YvljBxCydZ/tFFlT/BZ7w5uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785363960; c=relaxed/simple;
	bh=CBJBpHzSvMnkJYNrlP8VQjxy3ANxpIzdrHEU0Ekg6I0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nkIEd/9IE+Hcs+QJoiyIyYMRK7nxsk/gfJlWb06ITBL91TkydtPUqFrReeKq05GaDwV4SY51cH57UqS2uLkKmBEEH2QcA72JFBJ4/rpkcyaJyd02nAiab3wKyIvpOvhVh9A6LToeT34zDS+3s2sLb78/8wGdMxLwDpGRpOuWnRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KSchgv/z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KSchgv/z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F02C1F000E9;
	Wed, 29 Jul 2026 22:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785363959;
	bh=QJLNHoKpyp196W+QERRL/qc76LnOUjCBegrFWtcxcqg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KSchgv/zmwy4iidXi1/P2Ne1okHR3828XN6lmLoRl9H5RVDU/odyI0Ip7lRhUf1NM
	 kJbD8OCqMT1ODB6a846fD9b7P7ytJRi9nO480YDFtxSat3uqpPXBUi6sQQag+fAnHs
	 iWIT9lJyp38f6yFQ2hd1HyWbL1GBJePwDGcGo6b3ehR7H+0D7gYapGEGcbMdtYvi2C
	 8lDmHb1ahbk/abzi6HgcYpYHJWfbLiTYKT2lryc5GHRn6Aslyk0c7xmCkQIMg+6I8R
	 Rh8lI+r2iOJr/0kIvlfXSIFtHOYfpRlhFs87kRJCtWLxMAiAHsKwomKKIzt1iR/0ZS
	 5wke1tjLAfQIA==
Date: Wed, 29 Jul 2026 23:25:54 +0100
From: Mark Brown <broonie@kernel.org>
To: shumingf@realtek.com
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org, lars@metafoo.de,
	flove@realtek.com, oder_chiou@realtek.com, jack.yu@realtek.com,
	derek.fang@realtek.com
Subject: Re: [PATCH] ASoC: rt722: reset codec to fix abnormal sound
Message-ID: <950e515e-0d5c-44c7-bc14-d9bdbe841182@sirena.org.uk>
References: <20260728090111.3676617-1-shumingf@realtek.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rvnZOZoLRZeB9kXR"
Content-Disposition: inline
In-Reply-To: <20260728090111.3676617-1-shumingf@realtek.com>
X-Cookie: Captain's Log, star date 21:34.5...


--rvnZOZoLRZeB9kXR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 28, 2026 at 05:01:11PM +0800, shumingf@realtek.com wrote:

> The audio output may become abnormal after a warm reboot from Windows.
> Reset the codec once during hardware initialization to restore it to a kn=
own
> state and prevent the issue.

> @@ -1888,6 +1899,9 @@ int rt722_sdca_io_init(struct device *dev, struct s=
dw_slave *slave)
>  	rt722->hw_vid =3D (val & 0x0f00) >> 8;
>  	dev_dbg(&slave->dev, "%s hw_vid=3D0x%x\n", __func__, rt722->hw_vid);
> =20
> +	if (!rt722->first_hw_init)
> +		rt722_sdca_reset(rt722);
> +
>  	rt722_sdca_dmic_preset(rt722);
>  	rt722_sdca_amp_preset(rt722);
>  	rt722_sdca_jack_preset(rt722);

Slirhgly separate issue but you probably need a _jack_init() after the
reset - your other devices do that, I think there's some races there.

--rvnZOZoLRZeB9kXR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpqffIACgkQJNaLcl1U
h9DdaAf/cQfAvyxD/bzEpIfH/NA/7lH2D7Q2mAQYB/PigJozgD1vMdC2Bx2Y+hN+
o65h24xfT8m03kiEd9xuHbmVb9Njy6eGCHb3IfQ3m0UG8W0sxIgMGY/zaR+jzYvw
Y1ecLpSbqsNbwY/aRpElvWJo5aqK2SXCIksCme1ItdFSHpWMoCbXM70zrmV8iRlC
1TBsMvQxAclh0G0P4Q7l0xkINSYybbIVWs4EGusFsQcxUM1Fm8q3lHM3vkGom0ll
uCmn6bgzMJXbVcY1tJyPJpY+19Owf+cw4GEV6i+1+xh++09G4KJM+XAXt0jZaKx+
Kqt3v70xYZhrBB1sGjyq6z70W3WjbA==
=Qjc0
-----END PGP SIGNATURE-----

--rvnZOZoLRZeB9kXR--
