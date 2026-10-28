Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793156610;
	b=0EUnijOBwsbOo0/1PP7n0IPTlFlLccnv8NRgd5FzpRUBEoCF1wzb6MLjrNAEOVO55grW
	 8VUNwWiiHMEzNwwCDbmJXxzXKIkhXAqdr8NB1ksdC00Zhd66T4tpRTg1B0aLPvuIWGMva
	 S6+GP0hPO0DwG6mLAbu1NGZjaslkYmzJLcNLI3eeN9PCwbeUzCWvfmkm9oy4TXpgcFTUA
	 OBnFCnygNkUXRjoG+L3WCvflo8+THTCAABxBOCx9nOOFuIrK/GvbdbhSXutp+L0zaEjYw
	 A7OMuKvr6T+hlaLybDzrGrxhBF3OUacjGnjA8QpWkbtB80iie7UvftA0TkvtF0O9mKg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793156610;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=aaEqPOtzFlYjy8gKp4FKOSLSSYaCTpKCbbzsP/dMKDE=;
	b=E4pKyz7spZXm7lFWgB2WESRLARcWr8GsBky2ETmeOl+lE/NKroRcU0p55Fx5KULUVw56
	 tuhj2nkUe3ZiqxveR8d/tCSnOe92CjDfwCzJfugdPHDktso7BC7CekC43fSTvFHdGmIEX
	 s/ImHswimCwn8CNKRsSZ1ra38mcHnvhQ073w/KFc/f2q/G92KYKDEY5zY7qPCFvByh05v
	 q+at8XiqgJLUBhxRWbI2eTqm0WA1j6RSC8Fh2sMI0VCHSNXraVKlHNSK/kXlaTTt9VF5E
	 B7B1JdWkSmouSgu8kLU1snd5lHLdwAYU3FH9lYuh6DWGhfl9dZaETkxCSnoseucMl9A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fJlr3kzr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6AB606A31E
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 03:03:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C6AB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fJlr3kzr
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c468bd799ecso57798366b.1
        for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 20:03:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793156609; cv=none;
        d=google.com; s=arc-20260327;
        b=bwsYhiGyBpSfB/Y/U4jWIPuNIRiWA7ONQOJuD6KQ4/RDu0s9BDCEl8BUnbb57tiOc4
         JKIxpL7VjPSEPW08Sb4aHjUFTifAiSWaN9USLhuWnsrmWbj0TVl15xTtTSerL4Fp+fh4
         h9gDE1DTLATecnT5HtyGeUUujvCNhiNFPF7EMH8LKR6BdbH6LKBsejmX6EMZulFVJl3s
         tSej648/lwOWuILZ/vJ5yXY9fpisD36tSTAUgeAD5y6SZvvRracPswxpS9klp0rB+NY1
         ATQLYwYSwiWYLTzpwXqqLnxGzlyhfTk8w4JmGZ0/OWB3aF54Os3N3IQrKWLRDvhJ0pkf
         YTjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aaEqPOtzFlYjy8gKp4FKOSLSSYaCTpKCbbzsP/dMKDE=;
        fh=2Whz5ATE8F31yM34+0TlxO5XAnaQMXp4KcgJ9CPTTZ4=;
        b=iLQrc4PqrgrH/dQQqVWSgNoLS/6kh9459H9IbKUF1cTXhEnQkEXrJ1NVomnDLeg1cT
         dlcg9m3QioxVk34lu0jJiCnE1Yya/0l7d9LTEZKlnOmtSaMoehduR8n/hJvPIpas2Sch
         082rQu8Ajr6TM+zUc7xa4jtwsDm5VGntcEpwTRdDmH/ykdRw9iXtIqLwM7HxKc3Z0Oa4
         GYSbs3l6fRnIGZ3foLLnsNhFrFxn16TFWXOLv+PHeJWdx7TrdffC9brfqg/MGyU+pz+O
         SNSOPCerulczJmsoGpo6EcWd6jvYDWI/W+30NA5YBDnluDFZPmPSQNvTExCmo0kaVesP
         eBJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793156609; x=1793761409; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aaEqPOtzFlYjy8gKp4FKOSLSSYaCTpKCbbzsP/dMKDE=;
        b=fJlr3kzr9n1JZwZfBRF/WNMuIoTECpYRxlSRtiRZDvh2vnQxFkVKujt6hYhELyUMau
         qclOZDsIrlYWUhxiqrDl/YQqIF92a9MFeInSKz3wGO9s0k9gRT1vtg9KTRvEsSnXNGz4
         avn7Hczjkg0HQ9KWop8AmySku0iWsYXyeV03g0mPNb6YED4z9zVDKAyp8rcj12A20Kx6
         fxtels3SbDc9Zx/leb2n1ieK2POOfKHhm2rUpp/pW+t0pEZ4jGmDQBZTrAKKdmUm92YP
         9X0e7W3LASnIPLzEUFSJrDhKwYkwW6mDntm2IRHxh05FZZdQw3GP/22l8uQs8ObkOzfX
         0w2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793156609; x=1793761409;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aaEqPOtzFlYjy8gKp4FKOSLSSYaCTpKCbbzsP/dMKDE=;
        b=Gtd/O9BcuYeLS6ebqueejSSDWrYcSX1K2fjU/mijJoP94iOy14eYr41iMJscPkedzC
         V8i97C1W5LfyLpxU0Pe/SFPwgoHVbdmilAWQJo0rwdBu8CH6iGyYnnzCoUsbhmOfmEU7
         Y/Hum8j3r4Gf+cqcDJ8t6LBwR10XlWCfia1yrKQ0HISrc0TRir33mIi5Kknm8G4Na7ug
         +BGH08KcTTMQEkwoB/F/fiDfi/F3PyODSYM4mBSHeMEvqrwO6bCZFXdK+O8HJ+5SrJTN
         VTgAxkItlNj+2ipWGnaxa4DJnLGnnipwxJx6Qg23YJRsjLJKJEBsnW40WMbl0otet+te
         buBQ==
X-Forwarded-Encrypted: i=1; AKwUvBzzzT6XKda2Otc6G5Cyi4CZeOEJq0RJQzahjNdb/2Qp78CLyWf4SoqGHvCnlkE7ktht3wgjT7uqKC8l9g==@vger.kernel.org
X-Gm-Message-State: AFq9FYJGoIWIA8L48ylLqw/h10271LLuf9JLSkwE8aFfRYopZ6iT4lKO
	3CIycNjn/Jjh+vd17K4hEGwHRHvrT+2h9bS2KSI1W+lHltFvOHz8GK7t1vznTqyPm6KDOByjIxj
	lUXp6UyUHTQcthv9SSLWGAhov3wfHVhY=
X-Gm-Gg: AYBFou0gxtJX+WqGi6nstG6nnt3eVjQwsZ8T9tKasW7COXYfr6MGiuFcCOisSIBp/OE
	o5M62SvCGeMwMkvkszJV6SOQIMO//uW4hcPVNc/AP7/P1R/z+ZNiT5Ft8vtbSIYuIO14k49+Uc4
	qj9XXellWRfSJwDOuGyFBtNj+WqKa3FpBzwhI/8e6BkFr9jc/DxvDDtY4nRDhlCy2DRe2LGBb4y
	K5mWrKWaTy3/049GSFFA8iqm7DQ/Hwnpw7h3nBVCTRILnSvIAIOZGlcCXz6u3IwHa2buwR8Cn3S
	v3kbh6O8Et/RoVr/5zJx1p16AIQ57OL2ZB5dnJ9SPawX7KJYYDEzdYfkDrebX7VQoeucJa5Kn/G
	QmanYXDrLvjxwn2DW1eRW/7IBQ4bRk45AHGsl
X-Received: by 2002:a17:907:940d:b0:c2e:378c:8ceb with SMTP id
 a640c23a62f3a-c49be04547amr78000866b.36.1793156608518; Tue, 27 Oct 2026
 20:03:28 -0700 (PDT)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022084040.31181-1-phucduc.bui@gmail.com> <20261022084040.31181-2-phucduc.bui@gmail.com>
In-Reply-To: <20261022084040.31181-2-phucduc.bui@gmail.com>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Wed, 28 Oct 2026 11:03:15 +0800
X-Gm-Features: AclHuK9_JRik7hNrw0otOvyuxwVOGZJTnCyRDn51Ysq1x8h9U1nnfyQP3CQor0c
Message-ID: <CAMpQs4LpM1C6diap6JKYgLTYLoaC=W5wEsp=Y9DAj0Mwg-q7BQ@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] ASoC: loongson: Fix IISConfig0 update in
 hw_params for rev 1
To: phucduc.bui@gmail.com
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Yingkun Meng <mengyingkun@loongson.cn>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi phucduc:

Thanks for your patch.

On Thu, Oct 22, 2026 at 4:46=E2=80=AFPM <phucduc.bui@gmail.com> wrote:
>
> From: bui duc phuc <phucduc.bui@gmail.com>
>
> On revision 1 controllers, loongson_i2s_hw_params() reads LS_I2S_CFG
> and ORs the new LR_LEN, BCLK_RATIO and RES_DEPTH values into it
> without clearing the old ones.
>
> The first stream after boot is configured correctly, but any later
> stream with a different rate or sample width ends up with a mix of
> old and new bits, so it may run with the wrong rate or sample width.

I tested this patch on a Loongson-2K0300 and Loongson-2K2000 board
(LoongsonASoC sound card).

I ran consecutive playback and capture tests alternating between
S16_LE/44100 Hz and S24_LE/48000 Hz, both in stereo. After applying
this patch, switching between different sample formats and rates, works
correctly.

>
> Use regmap_update_bits() to replace LR_LEN, BCLK_RATIO and the
> RES_DEPTH field for the current direction while preserving the
> other direction's RES_DEPTH field.
>
> Fixes: d84881e06836 ("ASoC: Add support for Loongson I2S controller")
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>
> Compile-tested only, I don't have the hardware.
> A Tested-by from someone with a 2K0300, 2K2000 board would be appreciated=
.
>
> The field layout follows the Loongson-2K0300 user manual (IISConfig0) [1]=
.
>
> Not sure whether concurrent playback and capture is supported on this con=
troller.
> If it is, note that LR_LEN and BCLK_RATIO are shared, so the stream start=
ed later
> would overwrite them when the sample width or channel count differs.
> I can follow up with symmetric_channels and symmetric_sample_bits if that=
 is
> the right fix.
>
> [1] https://github.com/loongson-community/docs/blob/master/2K0300/2025060=
909243029508.%E9%BE%99%E8%8A%AF2K0300%E5%A4%84%E7%90%86%E5%99%A8%E7%94%A8%E=
6%88%B7%E6%89%8B%E5%86%8C_V1.01.pdf
>
>  sound/soc/loongson/loongson_i2s.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
>
> diff --git a/sound/soc/loongson/loongson_i2s.c b/sound/soc/loongson/loong=
son_i2s.c
> index da0d029c028a..109cb61c6ddf 100644
> --- a/sound/soc/loongson/loongson_i2s.c
> +++ b/sound/soc/loongson/loongson_i2s.c
> @@ -69,6 +69,7 @@ static int loongson_i2s_hw_params(struct snd_pcm_substr=
eam *substream,
>         u32 fs =3D params_rate(params);
>         u32 bclk_ratio, mclk_ratio;
>         u32 mclk_ratio_frac;
> +       u32 mask;
>         u32 val =3D 0;
>
>         switch (i2s->rev_id) {
> @@ -92,14 +93,19 @@ static int loongson_i2s_hw_params(struct snd_pcm_subs=
tream *substream,
>                 mclk_ratio_frac =3D DIV_ROUND_CLOSEST_ULL(((u64)clk_rate =
<< 16),
>                                                     sysclk) - (mclk_ratio=
 << 16);
>
> -               regmap_read(i2s->regmap, LS_I2S_CFG, &val);
> -               val |=3D (bits << 24);
> -               val |=3D (bclk_ratio << 8);
> -               if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK)
> +               /* Shared fields: LR_LEN [31:24], BCLK_RATIO [15:8] */
> +               mask =3D GENMASK(31, 24) | GENMASK(15, 8);
> +               val =3D (bits << 24) | (bclk_ratio << 8);
> +               if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK) {
> +                       /* TX_RES_DEPTH */
> +                       mask |=3D GENMASK(23, 16);
>                         val |=3D (bits << 16);
> -               else
> +               } else {
> +                       /* RX_RES_DEPTH */
> +                       mask |=3D GENMASK(7, 0);

One minor suggestion: would it be possible to define these bit fields via
macros, or use FIELD_PREP()/FIELD_GET() with GENMASK(), instead of
open-coded shifts and masks? For example:

#define LS_I2S_CFG_LR_LEN_MASK          GENMASK(31, 24)
#define LS_I2S_CFG_TX_RES_DEPTH_MASK    GENMASK(23, 16)
#define LS_I2S_CFG_BCLK_RATIO_MASK      GENMASK(15, 8)
#define LS_I2S_CFG_RX_RES_DEPTH_MASK    GENMASK(7, 0)

>                         val |=3D bits;
> -               regmap_write(i2s->regmap, LS_I2S_CFG, val);
> +               }
> +               regmap_update_bits(i2s->regmap, LS_I2S_CFG, mask, val);
>
>                 val =3D (mclk_ratio_frac << 16) | mclk_ratio;
>                 regmap_write(i2s->regmap, LS_I2S_CFG1, val);
> --
> 2.43.0
>
>

--=20
Thanks.
Binbin
