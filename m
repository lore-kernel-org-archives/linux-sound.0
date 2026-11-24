Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795547275;
	b=4ouFyw5Ygt8SM1wA/cXwEuNten+E9VzWqrnOnkY4OTPakkyBXkImGF4ylMgR22WahgJI
	 mpefLJnQvEVJzKHHZVsa69XsYY9KL04vpnGRY28l4erVVLrhWfQyAuE01MMBwgVGAommq
	 vhW5Y1ZY0AxX87zkZC2WfGZor/nqABlPX7Bt6kCDSiE+/vRHt2VapNO67wjdkK6IpkWZu
	 aCicy/SEfvdiw20tS1rfC5yLhKjM/lJZY8lcmGQENVKfkrzZZX2aOHSWs64IUKj61PjsC
	 zHFrct7plHsIWkbPLqRy6nd+gD0v2faGa00i9OJilWe+ufsAKrCVgFXHCUsrDvPx36w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795547275;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=ymttAzMi6QK8KdqB2d9k3QJYn/FX2q299z8AR5W+ij0=;
	b=QweHPV1p3d6xPyoNICqmbpcsz2I80ODtmsUV3jL2EF3GOQkBIKSJIOpWle9PaAnCaTm5
	 CwScGd3p/K8jHfwfzb4ttAKv8qPmZ4dNPgTvtfk8rJ1+Mq8RrpZGAKaSziUAtftmv3us3
	 1dFDxVaMtoRqcTXFiHIF8bHxX3C35GH/0miKGByjhKq/Gd1y7VROECZuQW+/0BUOeq0tR
	 DtAr+NecQLzYwXlz+9rJBtOCGMsim/8y2KAdUE8rK8d9n1JugPoYmK5tV5H4s+j9tAxqQ
	 OXsx7iSYDLwgw+KxQqcIs4YlbhJzD6UhysgiVHsLW/ys8VceLNMr1xgolNTaZMQXciQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qtOsztTu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.181
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209CB606A31E
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 19:07:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 209CB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qtOsztTu
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5eaabf28c06so3421171e0c.2
        for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 11:07:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795547274; cv=none;
        d=google.com; s=arc-20260327;
        b=OlDHBqdw0Ubm3EZ4gNaTcyQS/W48qFNvQai33DPm8OD9io8P9SthxETqhVpPW7mtEO
         TDMk6gz32Twu6VwRIHO6obQUUmYXxxH7XrxhdR8xViYJL2OQdnROPOnccapbO7EogL5j
         WZNWeBxM0XO24iMKzKrhoh73dcMcyc+jH3i7SDcbpNYNTdubG4ebTEUTh9zFoU9PkRiR
         WdjHqYfpsrYyeVROqJR5629l1rS89fcg4tjnFCsp2GF3Sn8Rbt7MlWB8DJAAFCGzT5sX
         wXS68QrqKdfWJ0JlbHhHOnwB1ntOdnzjxPXCP3As9hjm1LnGP0HELpv2RYsBvAXM86b7
         tStw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ymttAzMi6QK8KdqB2d9k3QJYn/FX2q299z8AR5W+ij0=;
        fh=gWcoFkBM7QM4/KnRijzle33lHB1tmSdFDb9wGc3tp98=;
        b=V2lfwj2iKWZ+K0YYD51E5Mmx8nXFjczsTWs2ul/0qaAz7+Q82+mIXZWdLHPcgtYB4P
         u3ZPsY1ux7n87moui9v/tkwLJP+67igcH156GJ9EjvahdTtnL84Xf8+iurcWipCea4cL
         CFbtO5kedNZXrQgLRVqTeI+BB7CsaHeiu1J1QskpBCRXzpsyFn9vLLtTDCwCjh1o1Oci
         Q4vhJDBO33rkR7E6GIQBeNBlXzBk1qFkvZU0Dz9or6aaGiO+6+vaSH6IScDO0kEjSBTq
         iy77+RCfvryyA151GhSPWA8Hj0hJBl+QNF9VEvVHWuP9YSCSArS3y0fNeD9Sm3CCd4PW
         OwHw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795547274; x=1796152074; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ymttAzMi6QK8KdqB2d9k3QJYn/FX2q299z8AR5W+ij0=;
        b=qtOsztTulsvcwZ3HJXaSDCy7Z7E9KA4oQN6TdflYNyxSK0q8MrqNreP+HVnSFUk8ap
         hIR1cyBKchXrKTdCSuBFn2TeV0F19ksR1wq3+/TuDNsDTRG/aRRWukiCpk+INgcajSKj
         EYyRY/0SPyd8mvlusEiK/hhWMh2NZeJt/T6n08smKroq/ymw6ha8S0J8WdL0X7azKS0K
         G/ti3OLy3xvnEZorM+bwhF1aPrbfAuSbOIHMBIsxlze9zDX5cJVOVOCXRmFcH1zG2tdy
         NB+Cf29kxh52f++6MNJn9YfQmk5mrT1aF1TWRMG0mIyxBhYIHzOgSOq08N73QS/dJos6
         j6Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795547274; x=1796152074;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ymttAzMi6QK8KdqB2d9k3QJYn/FX2q299z8AR5W+ij0=;
        b=bbojt0iywqHdZkLVbeCSKhzk1lONcv9OUlRUoc0/3SA7F3NoHGgYOXK5OhmUTIMt3D
         jE3yOgSS59V39yF0RyQbQZZDV6tgqhsO1VkOiLKERpDuaqwQvpr8xYn4BvlKRu6u7ZPm
         yqRm8HfrIYABqruqvrELnt1zfMEFWVO+GRNoWtvgkdO8RSI+ljK7/W+ibwodgR4tOI6H
         39oD1bshhCKaRmsBsYarIUFvq4JHOAwHuCd9tBB9raZ6UhX4ke63Z3jQQNx++YfxU7TF
         qwKqY+gKAI3ovw7aeAu/jQiI6f+rr0FNJpqqgaQSp8vOzPxDknSth9Rhv/hUEoIad7yt
         OTXA==
X-Forwarded-Encrypted: i=1; AL+hErHk8MRVOkI+PQVH3Vr2j375zgTkJrm+TcH4hvOJYmfmRu7l3CUAGMlfP1J9xJ/E0sz5Vb3zjuBpA0le1g==@vger.kernel.org
X-Gm-Message-State: APuU4Z/YFyMQHHISqZk+nW7ASFxNls4STthERCQcg3NE+T8clKE2QBjP
	HijhjHjvXH2dZg6KycgXMyNd3NjnUm5gBOLnrMs8RcPhpX2vvIDEgW7THl5jLwIo+zFErnTcI2N
	pREepGV2s72uJdHtks0iuz2CWg3Kw4g==
X-Gm-Gg: AZFdTZffkh9iLsHlMpaRD5ijLWEtYBzRL9N1GqA69aOtmb4wel1LwyquXg0QCWUbVgw
	ky/8opRafwKaM+NnVgVcUdK7vrzDfz0vdARkOgQAjQxVrw8lz3e5waPsil2AeAyiAPPZbxzLX8D
	xsKzFWn+ckalzsrN4JPNYKqtFPiDj6uf0ZiPjjP+RDYfjKrFg/ZiE+3f8gtDycLqCS+r790KXhS
	3K03fBwFRFXBKI6u525h+nEgIPrcnxxqk3YgatoRTALh/tJU/7pJBca43EKF69fyu06B6i7npw9
	mJlcX8HQX9FIXtsIo17cfqxp6P4HW8GmD4uajO+U6mRuYRIv4uM5VWSclPsLhL58JYk9fYY0jOB
	gDiwNXER2gjRiLZRv5dCXQ0M+ThIH25Adew==
X-Received: by 2002:a05:6122:208c:b0:5ea:e223:5437 with SMTP id
 71dfb90a1353d-5ee8aed6f64mr9885695e0c.12.1795547274040; Tue, 24 Nov 2026
 11:07:54 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123234050.150364-1-gianfranco.mariotti94@gmail.com>
 <20261123234050.150364-2-gianfranco.mariotti94@gmail.com> <179554337505.947306.7216985666736610034.b4-review@b4>
In-Reply-To: <179554337505.947306.7216985666736610034.b4-review@b4>
From: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
Date: Tue, 24 Nov 2026 20:07:43 +0100
X-Gm-Features: Aa3M54q1gc0a7R36YtS_e_8LcERGdr5F5REuP_ZXLyFPnQ6qw18niLuwfZB6EYE
Message-ID: <CAAX85RsxcCES5z9nT98OzPMr-bHk-6+mO7p2H=UBqXjMHW9+3Q@mail.gmail.com>
Subject: Re: [PATCH 1/4] ASoC: tlv320aic32x4: Add missing DAC and driver
 output mixer routes
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Shenghao Ding <shenghao-ding@ti.com>, 
	Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

Thanks for pointing this out, I proceeded to double-check on the
AIC32x6 reference guides.

Checking all four patches against SLAA463 (TLV320AIC3206) and SLAU306
(TLV320AIC3256) in addition to SLAA557/SLAA408 (TLV320AIC3204/3254):

- TAS2505 uses its own separate soc_component_dev_aic32x4_tas2505
  component and is unaffected by this series.
- Patch 1: AIC32X4_HPRROUTE bit 4 (L_DAC Switch), AIC32X4_LOLROUTE bit 4
  (R_DAC Switch), and AIC32X4_LOLROUTE bit 0 (LOR Switch) are supported
  on both AIC32x4 and AIC32x6, whereas AIC32X4_HPRROUTE bit 0 ("HPL
  Switch", HPL output routed to HPR) is AIC32x4-only and marked Reserved
  on AIC32x6 (which uses ground-centered charge-pump headphone drivers
  rather than AVDD-powered headphone drivers).
- Patches 2 & 4: MAL/MAR power and routing (Page 1, Reg 9 and 12-15) and
  CM2_L/CM2_R negative MicPGA routing (Page 1, Reg 54 and 57 bits 1:0)
  are identical across AIC32x4 and AIC32x6.
- Patch 3: MAL/MAR bypass volume (Page 1, Reg 24-25, 0x00..0x28) is
  identical across all four guides. IN1L/R-to-HPL/R bypass volume (Page
  1, Reg 22-23, 0x00..0x75) is also identical in SLAA557, SLAA408, and
  SLAU306 (AIC3256); SLAA463B (AIC3206) omits the -6.5 dB, -7.5 dB, and
  -31.1 dB rows (shifting MUTE from 0x75 to 0x72), which looks like a
  table erratum in SLAA463B given SLAU306A has them and both parts share
  ti,tlv320aic32x6.

I will restrict "HPL Switch" and its DAPM route to AIC32X4_TYPE_AIC32X4
in v2.

Best regards,
Gianfranco

Il giorno mar 24 nov 2026 alle ore 19:03 Mark Brown
<broonie@kernel.org> ha scritto:
>
> > The HPR and LOL output routing selection registers (Page 1, Registers 13
> > and 14) support routing the opposite DAC channel's negative
> > reconstruction filter terminal as well as bridging the HPL and LOR
> > output amplifier stages for mono differential configurations:
> > - AIC32X4_HPRROUTE bit 4: Left DAC negative terminal to HPR
> > - AIC32X4_HPRROUTE bit 0: HPL output driver to HPR
> > - AIC32X4_LOLROUTE bit 4: Right DAC negative terminal to LOL
> > - AIC32X4_LOLROUTE bit 0: LOR output driver to LOL
>
> >  static const struct snd_kcontrol_new hpr_output_mixer_controls[] = {
> > +     SOC_DAPM_SINGLE("L_DAC Switch", AIC32X4_HPRROUTE, 4, 1, 0),
> >       SOC_DAPM_SINGLE("R_DAC Switch", AIC32X4_HPRROUTE, 3, 1, 0),
> >       SOC_DAPM_SINGLE("IN1_R Switch", AIC32X4_HPRROUTE, 2, 1, 0),
> > +     SOC_DAPM_SINGLE("HPL Switch", AIC32X4_HPRROUTE, 0, 1, 0),
>
> Is this supported for all the devices covered by the driver?  See
>
>    https://www.ti.com/lit/pdf/slaa463
>    https://www.ti.com/lit/pdf/slau306
>
> --
> Mark Brown <broonie@kernel.org>
