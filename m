Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876614963B7
	for <linux-sound@vger.kernel.org>; Fri, 14 Aug 2026 18:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786732102; cv=pass; b=onBplrpiW+vzIHGk+ZfAPGm0LzaPPp22c3oVrpFcSji3xPyF68IkzQAlXdPvQ0veQIFOcyeX5nlVJTZgltIDrCL2dTzsyk70poEBteocABjnBeLlPlM/q0+ZzxMZm6g3YT5y1dysfss4eQWpAh8M/SlpG9yfpto+je8HqeIbiZ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786732102; c=relaxed/simple;
	bh=DjHNKa+QmVQXKpsOmIPSTjmh+Crdk2rrYn0inOmyLew=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HxoiX1b+27V5GseaypmpcLTVUrS3vjmdWdjtPVAwB8pt6ZnYD3aaDfSpnrVC8SUI0gGs/31+sbS4q4Auo6IUi16VydsnqyFx+0m/9TcO2+foFk3uNGFDo3E/rTQeh+4aHcqjcGnGGgh6Cpx4kjaOMlP4hbPlpd44P339nBwckNA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F+HiIQTB; arc=pass smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F+HiIQTB"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cbe827e3cb4so1425538a12.3
        for <linux-sound@vger.kernel.org>; Fri, 14 Aug 2026 11:28:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786732100; cv=none;
        d=google.com; s=arc-20260327;
        b=cZbH7wHw18e5WQEP3aHt9T4AbHL0cI4NP3rqrE5nDDPeoEXyGR5gj6GWPZSl2IyIdW
         apq4Qp8Jq7FrcyWXmCgF2qbsgqIS2NuwAwQesRHNxp01O4AmQG8F4vHqXsiv5UJFDVAe
         tH8fUKEpHrXmNrOqrCo+wwaLMeaK7t4ru/VUzUcb8QiRtugoKvPvepOXhcauNKVYRNas
         vb8JYG5BjiLIANz5puCmOxyRM/wtwM5SkpmFmTBV3mqiJgWAu+f+DBwT3bhjC+47swXL
         Y02A8qsW5mYZ8AmZzHLo4sybbD7Foomt8kWB7MHADLtTDDEz1KkLqeJvaJuyMmV7AJ7t
         Ru3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/YbHkM80NNxWA7mkBZjAsWZLeohNAOxuBAhqNvs9d80=;
        fh=/EciPM+bhkrv2uedo0A7bW61c1Dm33cOl2z1yiHbCJg=;
        b=khSKUBhppXwPaXGc6pRFP07KiuLPhIJQmbIoq1r28ssf6tEC/5nruqOOCqR3kQSW6E
         1A/sQr06Bm8g0fwiewwSX0N1KUJVNKSvFHWmhF2lpLUtPxyWXHrEH1N188lfqFP9N5RQ
         t4q149VEFLZs+vSewqhnxYn4P+TNV5T88bW+b0oG65/V59vlL1Gyk9HsWNp6F6X1182u
         psUMg7CbjboJHVJBzZpX59EM1VWl31qrkzEANL769g64BG0HLxDgcSIRItFW/riNdaSa
         XZrFNPbGJ6/1bK0A7mq4TA/77At74b71m3RUQNcry0j7tfcB0Ezo418JBqahKjc5maSv
         kozg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786732100; x=1787336900; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/YbHkM80NNxWA7mkBZjAsWZLeohNAOxuBAhqNvs9d80=;
        b=F+HiIQTBjir2f6YsycYi6vmgS1BJkEYbLC5P+xWDM2aHeVx2GJfS6W+hHQpJJQBw9V
         FkqNi/Rd2ODQuGJ+yY+xTtr/v9oEFEVujXmkKI63I5BbESraZwZSz47mDGGtMMC+BtM4
         CxBTpHgcziiRJi7zwCA93+Bz7q7njARsWXUfkFjs+EBHv9oBt9d8aa+dYjCk1o1TkirS
         A19nBNUZ2PcSauA3+3/PEWuyP74tLQFy0NTEpZmptOfak2IlQj3vrJrI1scVQb4BxKSm
         heRKItGirypxoDbh0Jo05eHQRVg7NUZnuXbyQxlN0LEkmCJ+GCTciXjT5WGl/FxWBHIn
         W9DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786732100; x=1787336900;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/YbHkM80NNxWA7mkBZjAsWZLeohNAOxuBAhqNvs9d80=;
        b=fLNBYbN7sGRbNjlCmwsnKgTZPjpzsU8z1RSenVae6i+DJV7iY4LajdI6WNXcv+8D7g
         S/fa+g2fG9ha/YF9hFL2wyOSOi/LQ/nielk9Ewjys3OkxAbGXzJh/dgmttNu+UTU4lzE
         R23To6SrXdpmCYKkNfNXMAb5IPOrFHGUDEYQzNbk8ykzlAi4/C9dfI/gwexiLtC4C88M
         rMCi3Ph9EaAz5pMIM1IAER4dJ2LUP9Q1kkLzbTPKrIfTcR/78h+OGYsS9T4cd3LfJ3lZ
         D92MhHtxcH4dow7CybsMvF64cIZ/7hzSpLFVtwoOgPEAtX4XRtbbOKZkmIhP6FBPeWQB
         z5IQ==
X-Gm-Message-State: AOJu0YzaSJbwwOli11xXlRm1h6/JiZ2LSQWbSwEYL1CVvz6PBRragiI6
	Ku2Xz2+IxzvcpdgYnFAU7mhMpMW042fURBEthwxGcI8XG0TqCTHDx4X3j+Bf0POTk0vPdmTSNFR
	mtE9dKUerwxVxKZtpMqtpLyOiyCCp1Zc=
X-Gm-Gg: AR+sD13QAHn3wZQ6Cmk368MlRYdd6d7kcMXKe4YSrHcwch3gtwWo3PboGta9CUUhSgD
	pnQS2v0UkQDeNHZQJKAb61xARuidmG4nyMZ6pDT2SJsCxlPyvE52NFgBHdwdQZoiy78bNNN8EBR
	veTFJroGNTtkVpyRxdE0WryOSbzJHf0GRJq/Nt2dBt5Zn6sAEK3vOG3gon2xB3oodRGMpjc9/1J
	phvRjoo0ARkFgG6By3Szwo5Wxbd4ntwLpU+v0jU0vA5vBSrQ8ESD22HCc6Bcddmnbj+fNUGOwi1
	8AUj/a3IqOIUfwn1PxII/npvxOXHSrtBn2M2t3DgxgdUaVDLlqIuEX25Goi7mwB8wmqzFr9RuJx
	Q0r+S3We9ug==
X-Received: by 2002:a05:6a21:7316:b0:3c4:de3:816c with SMTP id
 adf61e73a8af0-3cc71ed56f7mr9497115637.37.1786732099857; Fri, 14 Aug 2026
 11:28:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANd6bg+B_fZUpy4wwU8HyQMeo9-GKMEx2FPBem=-e4yr4eU1uw@mail.gmail.com>
In-Reply-To: <CANd6bg+B_fZUpy4wwU8HyQMeo9-GKMEx2FPBem=-e4yr4eU1uw@mail.gmail.com>
From: =?UTF-8?B?5p2O5YiZ6Imv?= <lizeliang.linux@gmail.com>
Date: Sat, 15 Aug 2026 02:28:08 +0800
X-Gm-Features: AcwNN1UfuKTtyA65FA3Bt8Cm1cCfi2UZKvzhn3T7yDog0DELOAc4NvTe-7QRqFQ
Message-ID: <CANd6bgLaQfKOBfpj0wR2bntm-YNO77_a4Od+a8GZrwE0o16ZQQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: tas2781: Add delay before block checksum retry to
 prevent deadlock
To: shenghao-ding@ti.com, kevin-lu@ti.com, baojun.xu@ti.com, sen@ti.com, 
	lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

dmesg on my laptop:
[ 4024.480031]  snd_hda_codec_alc269 hdaudioC0D0: bound
i2c-TIAS2781:00 (ops tas2781_hda_comp_ops
[snd_hda_scodec_tas2781_i2c])
[ 4025.643145]  tas2781-hda i2c-TIAS2781:00: tas2781_apply_calib: V1 CRC er=
ror

=E6=9D=8E=E5=88=99=E8=89=AF <lizeliang.linux@gmail.com> =E4=BA=8E2026=E5=B9=
=B48=E6=9C=8815=E6=97=A5=E5=91=A8=E5=85=AD 02:19=E5=86=99=E9=81=93=EF=BC=9A
>
> From 3ee77f811a91350caa56783b76251cd8218e2263 Mon Sep 17 00:00:00 2001
> From: Zeliang Li <lizeliang.linux@gmail.com>
> Date: Sat, 15 Aug 2026 01:52:57 +0800
> Subject: [PATCH] ASoC: tas2781: Add delay before block checksum retry to
>  prevent deadlock
>
> During runtime resume from power-saving states, the tas2781 amplifier
> firmware block calibration checksum verification may occasionally fail
> due to transient instabilities on the I2C bus or the chip's internal
> power rails.
>
> When tasdev_block_chksum() detects a checksum mismatch, it correctly
> decrements block->nr_retry and returns -EAGAIN to trigger a
> re-transmission loop. However, because there is no delay introduced
> before repeating the loop, all available retry attempts are exhausted
> almost instantly (within microseconds) before the hardware can fully
> stabilize. This causes a permanent calibration failure, triggering
> "ERROR_PRAM_CRCCHK", and results in a silent speaker deadlock after
> pausing/resuming media on modern laptops.
>
> Fix this by adding a 2ms usleep_range() delay before initiating a
> checksum re-try loop, allowing the hardware sufficient time to
> stabilize.
>
> Signed-off-by: Zeliang Li <lizeliang.linux@gmail.com>
> ---
>  sound/soc/codecs/tas2781-fmwlib.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/sound/soc/codecs/tas2781-fmwlib.c
> b/sound/soc/codecs/tas2781-fmwlib.c
> index dcbeb9618195..09cbee7a55dc 100644
> --- a/sound/soc/codecs/tas2781-fmwlib.c
> +++ b/sound/soc/codecs/tas2781-fmwlib.c
> @@ -1765,9 +1765,16 @@ static int tasdev_block_chksum(struct
> tasdevice_priv *tas_priv,
>   ret =3D -EAGAIN;
>   block->nr_retry--;
>
> - if (block->nr_retry <=3D 0)
> + if (block->nr_retry <=3D 0) {
>   set_err_prg_cfg(block->type,
>   &tas_priv->tasdevice[chn]);
> +
> + } else {
> + /* Give the chip and I2C bus time to stabilize before
> + * next re-transmission attempt.
> + */
> + usleep_range(2000, 2500);
> + }
>   } else
>   tas_priv->tasdevice[chn].err_code &=3D ~ERROR_PRAM_CRCCHK;
>
> --
> 2.53.0
>
> --
> KISS =3D=3D Keep it simple,stupid~:-)
> http://lizeliang.org



--=20
KISS =3D=3D Keep it simple,stupid~:-)
http://lizeliang.org
