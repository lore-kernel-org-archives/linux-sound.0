Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C51442B3A;
	Tue,  4 Aug 2026 09:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785837532; cv=none; b=dUk2XeyzN1k5mRrmrfg3wCOf3sIgpKTLsryJ+8pcDtDa20z2Li1xP0KI3+BDd0LFqEqA1a/YlQhaVC4438brr3W5Xhn73rlVCfLA8HYzIsAnBEjAgTY+kPIJclnxRBlts0gfXHZ5eA1uqoMHEPnJ3KZN1LaxpCtUkhh23uPSTcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785837532; c=relaxed/simple;
	bh=M+TmsBRqsaotdKV4MNUk+HSU3vtmsjAJ6Gh3p9iXGUE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Hb1vdIVbsaRV/XUnJwz1qGfz/QK3kp3asdei3FEidNZ0e5duE1kLcD83pah6EGk8bLXRsUS8j/Dzi9+sI8MiUknE77B9V6lHCQw4Zj6x95XnJOKNMHXTFbsVnfrubgqfAOZCBx3/e2MbOTWhJlyb3aDDWwYlM2BxZLftA8mIQRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=TBU2k3NU; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="TBU2k3NU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1785837518;
	bh=eASxnIu27cM4kSePkHRjBYViS2jgTwYuVb5LZLVqwAk=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=TBU2k3NUgLy+eyesQmCKcnSBN/aG1Vw+5af0C4EbvVWqvsPNejbYZMK+J6khJ31xy
	 nlEFNPx1rWf8phhGEy+UjmWqPnGOy0YDjTwrgd5dMos2cg20y6O0DHY6zrxqPuVlbd
	 yzPwPsFAFCMjspA5xyGB4eQWj5vRdt30qJyEoZYc=
X-QQ-mid: zesmtpgz8t1785837514tb710e2bc
X-QQ-Originating-IP: gOdDl/GieSB+p1OcvJg/0pTe9PzCnvv0wn9y3EHVhAc=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 04 Aug 2026 17:58:32 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8218745806127972950
EX-QQ-RecipientCnt: 13
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=8a808a06b4a953b5d20dec0ffee61d2775fd30a9d99a11e1a9dc7451dbff;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Tue, 04 Aug 2026 02:58:30 -0700
Message-Id: <DKG2KAJX4WFA.O51VPZ9PSCH9@linux.spacemit.com>
Cc: "Yixun Lan" <dlan@kernel.org>, "Takashi Iwai" <tiwai@suse.com>, "Mark
 Brown" <broonie@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>, "Liam
 Girdwood" <lgirdwood@gmail.com>, "Goko Mell" <goku.sonxin626@gmail.com>,
 "Jinmei Wei" <weijinmei@linux.spacemit.com>, "Kuninori Morimoto"
 <kuninori.morimoto.gx@renesas.com>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-sound@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ASoC: spacemit: Remove redundant DAI field
 initialization
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Bui Duc Phuc" <phucduc.bui@gmail.com>
References: <20260804043036.22065-1-phucduc.bui@gmail.com>
	<DKFYC1MGUCF0.1AQF42KLZZ0XL@linux.spacemit.com>
	<CAABR9nFn0XW3CzAEncVkVKd65yBUEmquxjag6ybf_-NRf6mA8A@mail.gmail.com>
In-Reply-To: <CAABR9nFn0XW3CzAEncVkVKd65yBUEmquxjag6ybf_-NRf6mA8A@mail.gmail.com>
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OQEfmBmUqqJ6hwUK9SI9hqTOK1GcRfmMaQPuGoQR1Txv1x0Asj6lJ1P5
	sTTtKjLjzmrMj//ymXPkA8kuPKnkIvVB+rplCkFAYQGmJJhXhVw5zPviDcBU3Tm2btggw/D
	TyG4bMzYcVnmDct7PnFyHIuloUiNxsCMEmjK5WHp+yrCOSPdskJ6JfKbTG+clIpMra0nkT6
	CYABtm/w5SdxNYNYRuGyx5GhC7ZOTfeChUajATn8WdsI1Zy8s5CwS5WigSvxaUfidijUdIp
	S5JMZoSMFIHd3nZGh+Rz9so1YpWCjpRjiny33JjFriX56CjsemRQHrrqoFttRoJhvSOuJ3s
	mmvLu4qTDf2/Z+pxB9RttgjcmnWInWzP9aiN2ueRUsaK6Vwj0HrY7U6l9N0AWOzST6VWXQw
	E2cwCCk9LGBZJs2Prd5cLOxhqT1MgNHGPskOdoo10Ku8lGdtZZtfahXpARBZJnev0We/DdS
	h+NrH8QEYMYQpcNJCsaMBsu8HLh8jg7T0sUyQes3wnlRmuAMP7sVne/Hk9ml6hz8o6Hju7A
	wzNtR8gM7kolH4G1uT0rdT7I4R7z57AlAaxT60UiCTZqr3I0bbLbG9knSYG7vEFM7EbkqjP
	0JtPWqecDj/LrUlZaoGfNCqUacUCo90IPqmmd2uQSJPZ79FN16CUdW4cQjc8WuWZaAeZeBX
	Hb+xo8MAqX+4iPit5iXBdzxAym2j3elgUWMop2C6s28s4w92yKSQtTSrC60/lyoYQ7VlMG6
	mOwJSAUZaIQ5Ux1qLkfNwo3kG1gbasNQ8r5BAzfFSKpPTk6hJRxE1sJ39IU2hIVpiAHZEej
	/abAZhAfgF4UUzwiFUCzaAWhiuwTq/m+ZApZ1vGUXlMbXLzIImwkdG8bFg2uCulOy3Fn1Gr
	5TEQ7pJeP1M6ahyH81dYKAT9Xq83MQhzM/pH9Bg6bjrT7l1AxxvRYnoiprkcUIrJSvHAohu
	/SHbrsP/205hqbCksherLJB1Ogv2lznDwwEGac4RRXmm51blt4kIg7i4IOHqVipxHTQHrIb
	kNLUPO7W3EqXqS20lG9wjq6xjBRN4Z7+4ci5grybYrtFW68+roEZBN39fCgwUgynofGpR55
	xkD4PCYpTYaWOIIi2WGeRA=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

--8a808a06b4a953b5d20dec0ffee61d2775fd30a9d99a11e1a9dc7451dbff
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

> I traced the probe path and confirmed that snd_soc_dai_stream_valid()
> is called from soc_new_pcm().
> However, I still couldn't see where a nonzero channels_min alone leads
> to creating a capture substream
> without an RX DMA channel.
> To avoid confusion, I'm referring specifically to the DMA-based
> configuration, not PIO mode.
> Could you point me to the relevant call path?

More precisely, channels_min alone is not sufficient. The codec DAI must
also support capture (or be the dummy DAI for a dynamic link), and the link
must not be playback_only.

Under those conditions, the path is:

  soc_new_pcm()
    -> soc_get_playback_capture()
    -> soc_create_pcm(..., capture =3D 1)
    -> snd_pcm_new()
    -> snd_pcm_new_stream(CAPTURE, 1)
    -> snd_soc_pcm_component_new()
    -> dmaengine_pcm_new()

dmaengine_pcm_request_chan_of() tolerates a missing "rx" channel and leaves
pcm->chan[CAPTURE] NULL. Once the capture substream exists,
dmaengine_pcm_new() returns -EINVAL with
"Missing dma channel for stream: 1".
The conditional initialization prevents the CPU DAI from advertising that
direction for a tx-only node.

                                            - Troy

--8a808a06b4a953b5d20dec0ffee61d2775fd30a9d99a11e1a9dc7451dbff
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCanG3xg0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQv3rsA/2enFw0bQFhdVHzqRfjGAS8XMICv20KQTtx7sWDo
HgV6AQCJZ2ce17LUExbaXiGqo5RUP6KShzKJeeVv+oVziPH8DQ==
=AgpX
-----END PGP SIGNATURE-----

--8a808a06b4a953b5d20dec0ffee61d2775fd30a9d99a11e1a9dc7451dbff--
