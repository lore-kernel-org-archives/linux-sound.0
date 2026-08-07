Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66904447800
	for <linux-sound@vger.kernel.org>; Fri,  7 Aug 2026 06:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786084393; cv=none; b=HrmoFarwBl6KLaZnFEJlfet/gvyuJFYpE9CMX8kuCioHvINfORL7UCsnICNzSsU9kGY7AIAiMH6f6vd0eZco7I2bxr3TObYkgux9GKL/b8ckg4vMXFAu2CipeneRpEGjGeW4flKocudn5lyCG2PVVNdnp31nVCRyok5hFVYutug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786084393; c=relaxed/simple;
	bh=5MdlN0g6g3JiytnyVknNHCb/qJjIV3yg7qNcbGc6QRg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=PF/gJYZNoHVNpGBS5vx6RVLyqrxGnAhr3PFKgkinf6eAN96bDIB2eSfE6QaAsWn8wQTJZ5k6gSlhUqRrSGcleEs9e8uYDOp8JgropfVINj5jo3l4vzhM9HScd4UGog6xXqgR6X7ZEpFfL2PcRywq4t//VZNT1lYoMqyJbfPgw3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=jD/nCgK2; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="jD/nCgK2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1786084375;
	bh=5MdlN0g6g3JiytnyVknNHCb/qJjIV3yg7qNcbGc6QRg=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=jD/nCgK2bzU53LWMj7FJpr6tdn474cW/DvuO7pxBLnxJ0zs1e0giGKM75b7l6tbmZ
	 LQcwDX3HLKwyEwt6Ik0JRAuWEENqZdUY6+LDL5/tCZIsAODULGcpv9VjL6Q4+jHS5h
	 CIpTxolkwQtiAJy2syhBMXSSbvd2w4MOpu+vQrmU=
X-QQ-mid: zesmtpsz7t1786084374t62737953
X-QQ-Originating-IP: Sng1q14c/po68KsubI3vLuw3R4iDanUTACsAlviElMA=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 07 Aug 2026 14:32:51 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10684818840048973946
EX-QQ-RecipientCnt: 13
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=c237d4cb3ee5a8bd56d5cd3485a4b31cb02272d470fc4d54b8dcc63a50ab;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Fri, 07 Aug 2026 14:32:49 +0800
Message-Id: <DKII2FXWGL7C.F6B941Z9F9J9@linux.spacemit.com>
Cc: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, "Goko Mell"
 <goku.sonxin626@gmail.com>, "Jinmei Wei" <weijinmei@linux.spacemit.com>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] ASoC: spacemit: advertise only DMA-backed DAI
 streams
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: <phucduc.bui@gmail.com>, "Yixun Lan" <dlan@kernel.org>, "Takashi Iwai"
 <tiwai@suse.com>, "Mark Brown" <broonie@kernel.org>, "Jaroslav Kysela"
 <perex@perex.cz>, "Liam Girdwood" <lgirdwood@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260805064348.44283-1-phucduc.bui@gmail.com>
In-Reply-To: <20260805064348.44283-1-phucduc.bui@gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Mx4a6RVPsZn7SPLXLOB+MH0nEuLA8OUTKEOFpsFaq4M4Y0Ot8jFfi110
	xi/ZiHTBy7E17nEUYSGgOi1lXd4ngliBqe9w6Dww3PHhPQZWyfvc2yidSfg6M8by9+3lJqW
	2t63p7dnjfn9XbrcEMryK1Lt5FmvSm51q00IgpzGki79OVFSphBxdmjqWWiCg8YTkWR8+ei
	f+iIIfo5kijlQziNongYfQ/PPZaXBD8WffagsQ7k3sEc3L7eAewrdwRn35cjz60rjYV7FGF
	QtUEanZoyMD3EzecdryAEPy9ZFKygNf+ZlgEwW77wpda/y9pRF3vnY6uqT6I6Z402kPFuin
	ArrAp7fNaHM8/fKYgSsKJdpLpv8qPbaqK8HK0WdL6uK/T0MA1eOy9iII+kZQ9+MnIG+jmJm
	n+f96Anu03IdsviUaAbYYoQvHfA3nvYtDJsmouThFWZ56rIw9dFTfqBjsXXXC9U/rMlNELR
	UZ++sZ0aqaZ3yCjSSUYGHImoDDeoeJpbtBTYCjYJHnFnnmOFGio+kj2bxHmBTN75EwCCRK8
	mIM7YThpsvq62m5VJ9Hq+CwQNhNvRoAyjuEroWMOSndrskSNE9Rr2n3gT/7bUfO/amdrNsU
	frhZvBrhiLVKhhouQigKh9fC4p4AsEd+hG1Bq4bqG/Qwt+2yyVkKtgAKdsYM8xf8cLTAWJp
	Qub0G5E5c6yJnlZ1dIwCp7j+DQG5z5s9o7bWSb/vJyy3KQfvvGfbGeWU+1X7l3R8VUDh9Rp
	p5Nj55SsFO9T4Fjw93tyVEMhhjkwAxWQWCIKxWgv41OhhJsNtCq+lphcrHk/+GIeD/L3Cxl
	++ouWuR4+aEcYmEj6hKJDmK+Ls4wP9RuS0stsFzii4zy0W2XewDlD5ELwuaPTTPhfy8+nBV
	2tN8Ycd2XLApSuU2U6RswjRMT1IJu/DHLEzRvK+cUwxaDccJJtf4SvLF4IIeCwGagBwjxS2
	FV2wVQl5IKAYGqRkHMe5cBNVRrEhcAkCJG4nQ8ndsdxajipi7Cb2kU6DKZOSo8oYfJbvlvd
	OwcLgEI3RZy8jEhuUFQh/5Dp3+e0gYAM54bIMgmqSFMOpA6C59yUti//vZyzmxrZxrMlwj+
	nDMZJ557qwy/uVK/oTT0rzAGmmaPXJJvg==
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0

--c237d4cb3ee5a8bd56d5cd3485a4b31cb02272d470fc4d54b8dcc63a50ab
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Aug 5, 2026 at 2:43 PM +08, phucduc.bui wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
>
> The static DAI template initializes both playback and capture stream
> capabilities before dma-names is examined. As a result,
> snd_soc_dai_stream_valid() considers both directions valid even when the
> device only provides a single DMA channel.
>
> Move the playback and capture capability initialization into
> spacemit_i2s_init_dai(), where it is performed only for the stream
> directions backed by a corresponding DMA channel. This preserves the
> existing capabilities for devices with both "tx" and "rx" DMA channels,
> while preventing unsupported stream directions from being advertised.
>
> Initialize rate_min and rate_max together with the other stream
> capabilities to preserve the existing rate constraints.
>
> Fixes: fce217449075 ("ASoC: spacemit: add i2s support for K1 SoC")
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
Please don't send out the next version so quickly. Many people may miss
it before they even have a chance to see it.

--=20
Troy Mitchell


--c237d4cb3ee5a8bd56d5cd3485a4b31cb02272d470fc4d54b8dcc63a50ab
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCanV8EQ0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQvAX4BAOHjCv7ECGQ4DfJ7+iuPzmRhMFbc5GAhwoISzU9Q
V/RYAQDGGrjRRBR2tC9vXENPWGWxVc78HVuyymlyDMJBTTiECA==
=8Duy
-----END PGP SIGNATURE-----

--c237d4cb3ee5a8bd56d5cd3485a4b31cb02272d470fc4d54b8dcc63a50ab--
