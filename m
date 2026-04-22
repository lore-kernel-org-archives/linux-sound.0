Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D1B3101A6
	for <linux-sound@vger.kernel.org>; Wed, 22 Apr 2026 23:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776899482; cv=none; b=URRk2aCQd5px0EAv/HVq5jl/EkJYnEnHkLAJKY/C8z9tdKgNnwInfT06tlDQIeXFJPsZW05udBJwYgIw2WZsPUm5cL7q1+lj7dPICX+qBoJWzvqzaSTFd0Xd1kpYDbgrDWlDWdnU0x0T6VxieJrFH1Dy4+ApxeFjkqIS3OjTJFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776899482; c=relaxed/simple;
	bh=CoXMHrQ6baNC5wEGVAf+ThrnWtG98D7+R633VT0t30M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PQfVxQTfbtcUg6JSrcZa+Ue59Kpa7MY9GoSDnBDwutppnnr/8YFkGlFCIu7hl6h79LH3B3hBBckCqlB0p2rzRicNz0S/7L7OmYEM0klHTusLY1ImD+D/TBO361PdBlYkoer2jXm+n6gTL5Z7b/VeETIaLBXYAt/yAIwzzY2KAJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bc3Drsix; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bc3Drsix"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso50292045e9.3
        for <linux-sound@vger.kernel.org>; Wed, 22 Apr 2026 16:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776899479; x=1777504279; darn=vger.kernel.org;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=PtW5X9uSOliAud5sdI7w59W/zsfETijkZwXizYRq+Kw=;
        b=bc3Drsix7CPtCbJwoFxVrHUncEGrhCbkktZ+2ALR0cmcykCrqinE6XCgqJTdiM1elv
         H2wYqW7ZS9Ad12GyKRfxfHulc7ejLnySah/KXFo78cYB7GaEgaTtIr9SeMZhv9pdJu5Q
         /ZevF6RXh4PZNzX6b06HpnUlcvpddDvZk25C0VNY+fgRWjd7htvpKPFg3cj4esqjajmj
         nxZhRcgETU/zwGqiJrMwHTI7JQCA62eUvGSz8x3q/bi7GJ6F4hHQvtSbXalUHCeDseIy
         Ik3Cx10wR+aeY75lwyUv8KTYYw9zc3j7Kbb4W9QGoZq3oHu/dkMwDB0KI8VmfzyhZFvw
         HEKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776899479; x=1777504279;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PtW5X9uSOliAud5sdI7w59W/zsfETijkZwXizYRq+Kw=;
        b=OpcNFh2E7Iy7TyflRb00PrYhuDBDS65Y1ATmnzM56BnD97Sbt7aamr5ClbTaGbTw4n
         ItgI/SphCuWtzgvqjLlGGSbj7aJu13aVf+H6TZOPLeXmlwtM5Talkw2P947bzFYeCgiW
         IKUdhEkAAuCheW+s+Hnw96sy+tGBY3jO2glj5ZFfW+eIodZBcZTwu/MlNQE+y33YO4Wj
         ciqlotqWvsw785cob4Xvq8sl1c45auyJzPnVkDpkHhq5znCcP1QX3CV3K5EzUMQpxXmJ
         1aDN4Y4CQHisQBurcSbQWi1RdaG5+yWO+zAQJL7e5HowmauDkVDJU7oGhLtGnxVRs06D
         ZfTw==
X-Forwarded-Encrypted: i=1; AFNElJ8I24+SvBlvzHMCpmRBjKnclGBpaSUBbTSmKGIH4NgGJA8Ze5t5xpBx40g1nlQCIU73rNGBEbMCVd5P3A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxanE7lsBD3fmRMKiOUDz9y0pYLOOyoIPRRGXC3xZ40ea+yDVRr
	HFaVTzagDgULefCkIpxwsDGkeoRTQkS66hnsYmDeZIL/ZdsQ8ho3N8Vl
X-Gm-Gg: AeBDietQc+f7IFNcuOUflDSQggEyimBFAvKklThoSWFxEuaImSlNLS0AAqhR6kIrEXQ
	t2KtThwlU0coNovaXqafHsO7lpDVDh/m8oGQdtaPwz5UjhONPQv1/2r7TCaGefYr/khm7sLJVAy
	nUcYqPxrMfl8uTHZGJWQr1P4Vmsf65MddNDfK64G4hJ6HOVjbDmOnqFTpMk44Lfod0+JPOTw+ag
	7P9wBAUgzerZ0dg0fOkS7N2MpuVxqioGYcGU1U6/sZiRrVTDRoyogv/hCRwaCgrtpDi+eTEkSnE
	D800wZLNZryfUgIIie00af0fOtb0vTWX6Zzofzo1kSNYrra6JM4o/HtzgVVb+4r9C8k5/nKOMmq
	+tmxx3ekfPhTgA2tQatP4U+oxl5PRQGxhTeMBf1PPz37WU6PG7TtZ3P14hsH6cJISIjdRMUDuWT
	FjOQqOhWpfrTtrLUGoFLDHMxy35Lb4OTLrhJf3uO1FYVCE3WM6jB9hcDkG/befiIKQyZjIilGL4
	avwYWiXYtCeDi2lpiW9AbbPLOJE
X-Received: by 2002:a05:600c:890c:b0:485:3ff1:d5ed with SMTP id 5b1f17b1804b1-488fb739cd9mr291435205e9.1.1776899479300;
        Wed, 22 Apr 2026 16:11:19 -0700 (PDT)
Received: from dell.localnet (2a01-114f-4a05-91c0-0000-0000-0000-0540.ea.ipv6.supernova.orange.pl. [2a01:114f:4a05:91c0::540])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc1c0354sm446907085e9.11.2026.04.22.16.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 16:11:18 -0700 (PDT)
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org
Subject:
 Re: [RFC][PATCH 1/2] ASoC: ti: ams-delta: Stop (ab)using card->pop_time
Date: Thu, 23 Apr 2026 01:11:17 +0200
Message-ID: <9xDiBMSWSvmvMeBrronf_A@gmail.com>
In-Reply-To: <87340md2o4.wl-kuninori.morimoto.gx@renesas.com>
References:
 <87ik9jk8kd.wl-kuninori.morimoto.gx@renesas.com>
 <Q-gEHDxFQKq1L_9pbbzxnA@gmail.com>
 <87340md2o4.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2yacvjXdRnKCh55XuBjvWQ";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart2yacvjXdRnKCh55XuBjvWQ
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Thu, 23 Apr 2026 01:11:17 +0200
Message-ID: <9xDiBMSWSvmvMeBrronf_A@gmail.com>
In-Reply-To: <87340md2o4.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0

On Thursday, 23 April 2026 00:57:06 CEST Kuninori Morimoto wrote:
> 
> Hi Janusz
> 
> > > We need an update in _close() as well, that's getting the component from
> > > disc_data.
> > 
> > Thanks for spotting this.  We should now get the component from 
> > cx20442_codec.component in _close(), as we do in _receive(), and return if 
> > (tty->disc_data != &cx20442_codec), maybe also WARN_ON(), or even BUG_ON().  
> > Sorry for missing that.
> > 
> > Kuninori, will you take care yourself, or do you prefer me to send a fixed 
> > version?
> 
> OK, I will try.
> 
> I noticed that it seems it is inconsistent ways of handling tty->disc_data ?
> 	(A) is handling as "struct cx20442_codec",
> 	(B) is handling as "struct snd_soc_component",
> 
> 	static int cx81801_open(...)
> 	{
> 		...
> (A)		tty->disc_data = &cx20442_codec;
> 		...
> 	}
> 
> 	static void cx81801_close(...)
> 	{
> (B)		struct snd_soc_component *component = tty->disc_data;

Yeah, that's exactly what Mark pointed out as missed in my patch.

Thanks,
Janusz

> 		...
> 	};
> 
> Well.., it is the same things, anyway...
> It is confusable, I will fix this too.
> 
> (A)	struct cx20442_codec {
> (B)		struct snd_soc_component *component;
> 		bool ready;
> 	};
> 
> 
> Thank you for your help !!
> 
> Best regards
> ---
> Kuninori Morimoto
> 


--nextPart2yacvjXdRnKCh55XuBjvWQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEnyr6IsGnTYAeAkHJ2WqSnltsjBoFAmnpVZUACgkQ2WqSnlts
jBpkOwf/U9H1vlSiOUyX7Q65vnjkPg9A3N7zAZzNPBNKDSLLgyRvapfniWjEuGrM
TM669hnykIPAtT0X96lTWIEk6JFWXYV48qdmA5BtTNq8IRJkElp0NG1qnkfW4IZC
1zZ6gzUMQed1Ib4As4IRB/DrT51C2cqnzUkja93KG+YA5WdwoNBlRk3r3HqU8wTI
OjlSDDVUJWZoYuukEpj5OENY7l3qvM8h2wJlcBWZ2X8QOLy6JXzrSFwNRJeSRRyg
J+RswgB7WEZpsNLORbGJt+sDDuYrX7qGMWVYLIBxhVUgx8wpVnq3Mqn84wu8L2Qk
TGyN2DR5BhXYAE5ZMk1g6i5vWFxo2g==
=RmxO
-----END PGP SIGNATURE-----

--nextPart2yacvjXdRnKCh55XuBjvWQ--



