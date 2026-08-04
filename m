Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2FFC376A08;
	Tue,  4 Aug 2026 09:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785837594; cv=none; b=gKN0ZOZBOhJC0DhmShsEcoilNctI0P8sW/uJ5YSYbQG/gow4jBIgmfoT/m8mvrC1twoBOnsm/0+R4v4H+Ofo0XsSekmdY8eLj2ZaNICI/48vSCDlgjjxbMx3l7sAQxP90pdpSksXvhLGW2Id8NAAUZch6dEtd6aFgpZ9zjnPK5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785837594; c=relaxed/simple;
	bh=I4nKQIqakEl4AcAWcfhShCFtxF29eBoBD9yQFCgcxqY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=XM3LnK2t7KGXPawQLFsZy5VksqgBqKWTePrcEDxMhditrMy+nlrt7qohbS/y10AmK65WdkFjY1sWy2cjaIeXlPe16oHicvgKN2t/0u6UhQ6Z9tYuFmRt0v+LkAp9Q3jr8KAre7vTi+vMnr/BSoLczpXV8IbVRlyHqh0SVOu9hNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=mlWF6xmh; arc=none smtp.client-ip=54.204.34.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="mlWF6xmh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1785837585;
	bh=Ysd0un+5gtGIkkj7N0nhvFD98XFxC6uJDNPImhDLpDg=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=mlWF6xmhnRWukAYagY9PwlryZ3sz/cvKxVAWNKylrBXmq0ojiLAPBgDqGG0mLxRgl
	 KIVn3y/EODSOuzhzL9iECh1HPK0avKH4FAF5Sazc4efYWjtrgOAl9SQaTwWT5c47OG
	 HHypbN/IeVvSjopiUvZa70e/yYrNMt6juycRa9u0=
X-QQ-mid: zesmtpsz6t1785837580t822d7ccb
X-QQ-Originating-IP: /deDCG4cZbZ/zIhBmDDPRVENV3b+dlp0f/0Nmm7NpCw=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 04 Aug 2026 17:59:38 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11623012881500782239
EX-QQ-RecipientCnt: 13
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=0cb53cc854d56efd7aaf92f0490d3586ec96bc93b77b8c725886ac6337f3;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Tue, 04 Aug 2026 02:59:36 -0700
Message-Id: <DKG2L4V8Q2EU.1W5VODY60D6D7@linux.spacemit.com>
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
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NfGQECF1EzMaHtIWUW+i4t/cJyKGyMJKsST0FnN6c7I25AP2cXYxpo8X
	2AYPJXbdzJsH02rXQ98RvXtaOMAylnB9+6HmHNMX+XZI2lOnUEUTR8KK9fpuHOwrd6hjMiw
	8X5+BPFC8z8oLwBiW6AKoWqeup5S79jkbWitKXf28NidTfliP9vNHkVBhcamD1dBGRjOFTp
	wMysaHKm+6/y0gu+BhizbcwSyaGJaAQua4Xl1+/+uUX24G/fc03IbE2zqHtjqkYuT/KDcJb
	NEtDaJzK7FPrvSy03/0IqFaJ9GKWhho56g8CRC+B27GwPDVwHULozQGgmQWn+3pBObyscq7
	KxWxyPKMDRas3SrZntYAi4Z+nda2L1gFbNe5IUBFPam2Aqh1GnVyZbWntUgt05xMqFW9PDz
	j5cSHPRnat0GvUWeV83USvAmvcEQ9BVM+EAFb2NYqcCvB2PzRi0L9sgStfQa3/zxLc2+Rgd
	FKGjFwtRb6X+4V67y1wVRgaAO8ia8D957TYu/Bx/nKfh3y0g+RFKFI12YcpUdcEPMEvhRgT
	SUqTYxP/E/s6eZ8IBjOlVqNveeIqdqyzCb/TSObTDtir9vS+/Aowz4k3k5RpxTS40Bzjn5a
	lg4C1YPnGtzGguhnSIuiRJhG9FxyOwtxJaHpFkcRZty9cmRWhVct1V/7ZwfaHWuen2aXHaf
	gft9ShXthmHtnpNVMd0n1o3RYpkawgyM766RtH+tqsQ1ItNm3aw6jomrJcMMLvkJ9Du0eU1
	ma2AICoMToOZfcqnc4qju9ADHBw3iahRsWBVd+TxlvOprG0E5Fd6TS7P9Gj72bZRKN2Jj1o
	+jFUPl0dj2RXw8BKTHSEbsMQyw7EF9p7ciJnVV+6JNYyJeoZsyJ4i/R4Uqd0mrrQaL7usXz
	7aCqYBz7APxJF/aFA+b//kam4R1i5yfdO9wlRChNVgmc5A8OyIcwm7KLOsztvIU8xLrWMLQ
	rK0yly1rfd/uc02yekSDCXOiZb4tQyNDSJXSGHDSD1KNFCxwVh2d0JgvsNZ9L7ndf55s0MB
	r4YaSxZTDWknm5taCcz6RiFOW/xNy3kJrer9MXCY74vzr+Rz3RdoJRJZ5PX33Qrq2c2E1eZ
	UDAm83XcaTFE+4aBBOejZLQKyUMGpGW+cBR3Hx5Mr+b9PIS0Eq9TMeaa9uwaPSyqkuKLnVf
	LorHkbTi+AM6g4k=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0

--0cb53cc854d56efd7aaf92f0490d3586ec96bc93b77b8c725886ac6337f3
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

--0cb53cc854d56efd7aaf92f0490d3586ec96bc93b77b8c725886ac6337f3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCanG4CA0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQvmhgA/iKim769XKKzBMQSQN0e0WT8cDcERmf6hZVpFc2P
GucAAQCL7rMgg02LAyIJm55KkoPR7IBfAkfgUjclm5YznSGKCg==
=QizS
-----END PGP SIGNATURE-----

--0cb53cc854d56efd7aaf92f0490d3586ec96bc93b77b8c725886ac6337f3--
