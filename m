Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F446256C8B
	for <linux-sound@vger.kernel.org>; Fri, 28 Nov 2025 07:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764315886; cv=none; b=cwB6Y8t9ZIaps/di9oSO5TBB8pPIhAs1D+O85y2/MCRtmMp68kefqw73A4y0+VCp4pyaviL00vOEyE7lJ5L2lZTD61ZjkPA2jspZ7oZoUjdeo07xxe2qfpVrCUMYnffSVZ9NWJqCP5IC6TXE3AXDucLpSUcxmCefu4DMsK3kSOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764315886; c=relaxed/simple;
	bh=M5NFGBTQVOajWJXRZ46hOXDJ53iZM2Fq0w5Hd4+xZkE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UHK9kzCSDpsXX6f9tnut1DyZA69tTjl2uTb5YdQ1OOfvLeAiXOnFeXRK/cs+TUUPxk85eyM6yrehvbPJRF54J0duTsVTdUVI/8WxxHJCueM7bTBprxlF3LM4z9NDB3ORNTgC3GaTxi+BLGQQsJwrq2VLd1fOcF5EahTkkh/P09Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nNCcwCCa; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nNCcwCCa"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-34374febdefso1698495a91.0
        for <linux-sound@vger.kernel.org>; Thu, 27 Nov 2025 23:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764315884; x=1764920684; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=APcKIriRF2y6sXpDwx+oMCC81Q13RwzisOJwdH+1RDY=;
        b=nNCcwCCar0GP1FKhqVThl8uM2zz431OLE3uTe9vWMTFIAkEBF0v2ZbI3EIkzGmhzHS
         dIjG5zWiyRjjZrCvYGCMVkSXZDw+43genhvK0OKI40mpeLC/pmX5WRdBaDbQV0GYfZEL
         sATTsphWDgNEBMzVr3oRRARiRqx2yra78X086PbnJLC8fK+hNLWzRSVgzgBWOF0hlRIF
         Kz3ldIJ/XpnFwjCCxbCrw8NyY/PVtDdQsGWzOUNvxHZH7biFybxkslQzYepC2rCBk5D5
         UdEobMqu8haKP9/ArgCr1neEcopYOhj00nxbgpjio/QILYa+x4vBXu/5a3cNdiCD5Ms+
         dJFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764315884; x=1764920684;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=APcKIriRF2y6sXpDwx+oMCC81Q13RwzisOJwdH+1RDY=;
        b=NaXhAeYWW8l3S/Qqd6/7EW/QaFnp+XFhi8+yJZn0d+hP4huK65eoJ1naMke0s7ugnM
         BKOvQOg6EBg6W8DBkZnNnpu0+juk20UNhD97N7+WKtinfolet0MjwkyKZc4UVI9fVzhf
         D2p0OvLBwrgg372cZgdfTNlDVg0AchIgsxYy6IH6W7WGBI/7AA4OqBlXqtd4E0sOiBRR
         mlkIMjNvkbnDLJJk0fYjJn05IFDh1nxsd8XYtn72CML5jXhAUgSgtoxqEI7FbrZzlO8h
         Zp6ziw8yLV2GSsTPLlZM3SUqB8NaJ98qJA1AHFqszqZHfgsw+VUDlxgG7CE73oehXlM3
         EdAA==
X-Forwarded-Encrypted: i=1; AJvYcCUnWuWfO7P0ZbH+4FiTji5QPTZs0r7UZHwjItc4QMrqtNb0uNOiLBq5e1gBnUdyEr2VAoaWO0Mxakhqaw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yww+9khBlRbg04fZZZyslk+CTOotuy+5JrI+oU/13BV3BlcwsFN
	qwbR2bHay9tYTPYiIDCVm3zmqBb5QutoorclxBXle8MGbkwBNRTbbW1D0VOL0KRrIrCgRBEAqCT
	uE0ggkj7kwK6X/6qU4GSlFncw0QkdwfE=
X-Gm-Gg: ASbGnctdoSPN44B52hSNCrXIkc+UwvN/AaXghZQQqwRHwZ2wzJ6FvvxCI3bO5YmpRj8
	gOUgW1awr5booecQPF54FrqOvKCnUk6YEL6AejjCEk5yZBerxYDOpcK7Vz0WCYfZ91qnH0TZluH
	1taXfLY5TR3dBNOoNH8Ovk/3lwft5/K3HshXGYMhTX0Y2d6bcz0agZDgDRdsAiPRrAOshqO2VaD
	YKjFaM72Bqah1wNRRcpJ1bIq3awRIzgJTSunZjALjVx6w2vdGlFSdLzA6XcjuIVR3oD6/4=
X-Google-Smtp-Source: AGHT+IEpcOWd0k4JnVngO3b0eihgUsfuZG4/x8EcIDYrjUn8+ueadxUoPqF0QP3vDfHqGn3+fZTCh9BWOYCiFZqYeIY=
X-Received: by 2002:a17:90b:578c:b0:340:ad5e:ca with SMTP id
 98e67ed59e1d1-34733e726ecmr27689264a91.12.1764315884255; Thu, 27 Nov 2025
 23:44:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251127022652.674574-1-chancel.liu@nxp.com> <20251127022652.674574-3-chancel.liu@nxp.com>
In-Reply-To: <20251127022652.674574-3-chancel.liu@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 28 Nov 2025 15:44:31 +0800
X-Gm-Features: AWmQ_bmbkdAiETXBbYHF5WjEuqgKfNpFxQrLUUBSBm5poEGpAusHHJMBGLm6CIA
Message-ID: <CAA+D8AMvZK_OLgf+ocxZDDBXi-L1VYwHi-EoTBcC0_gcxoLmHQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ASoC: fsl_micfil: Set channel range control
To: Chancel Liu <chancel.liu@nxp.com>
Cc: Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com, 
	lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 27, 2025 at 10:27=E2=80=AFAM Chancel Liu <chancel.liu@nxp.com> =
wrote:
>
> The range control register can't directly adjust volume gain according
> to specification. It's the dynamic range of the CIC filter. The range
> value should meet some conditions otherwise the channel data is not
> reliable. Add an array in soc data to store const value in formula
> with which range with all quality on different platforms can be
> calculated. If the value set to range control exceeds the max range
> there'll be warning logs.
>
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Shengjiu wang
> ---
>  sound/soc/fsl/fsl_micfil.c | 125 ++++++++++++++++++++++++++++++-------
>  1 file changed, 103 insertions(+), 22 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
> index 86678fee7a57..d6cde2757c6d 100644
> --- a/sound/soc/fsl/fsl_micfil.c
> +++ b/sound/soc/fsl/fsl_micfil.c
> @@ -17,6 +17,7 @@
>  #include <linux/sysfs.h>
>  #include <linux/types.h>
>  #include <linux/dma/imx-dma.h>
> +#include <linux/log2.h>
>  #include <sound/dmaengine_pcm.h>
>  #include <sound/pcm.h>
>  #include <sound/pcm_params.h>
> @@ -93,6 +94,8 @@ struct fsl_micfil_soc_data {
>         u64  formats;
>         int  fifo_offset;
>         enum quality default_quality;
> +       /* stores const value in formula to calculate range */
> +       int rangeadj_const[3][2];
>  };
>
>  static struct fsl_micfil_soc_data fsl_micfil_imx8mm =3D {
> @@ -115,6 +118,7 @@ static struct fsl_micfil_soc_data fsl_micfil_imx8mp =
=3D {
>         .volume_sx =3D false,
>         .fifo_offset =3D 0,
>         .default_quality =3D QUALITY_MEDIUM,
> +       .rangeadj_const =3D {{27, 7}, {27, 7}, {26, 7}},
>  };
>
>  static struct fsl_micfil_soc_data fsl_micfil_imx93 =3D {
> @@ -128,6 +132,7 @@ static struct fsl_micfil_soc_data fsl_micfil_imx93 =
=3D {
>         .volume_sx =3D false,
>         .fifo_offset =3D 0,
>         .default_quality =3D QUALITY_MEDIUM,
> +       .rangeadj_const =3D {{30, 6}, {30, 6}, {29, 6}},
>  };
>
>  static struct fsl_micfil_soc_data fsl_micfil_imx943 =3D {
> @@ -141,6 +146,7 @@ static struct fsl_micfil_soc_data fsl_micfil_imx943 =
=3D {
>         .volume_sx =3D false,
>         .fifo_offset =3D -4,
>         .default_quality =3D QUALITY_MEDIUM,
> +       .rangeadj_const =3D {{34, 6}, {34, 6}, {33, 6}},
>  };
>
>  static const struct of_device_id fsl_micfil_dt_ids[] =3D {
> @@ -167,9 +173,69 @@ static const struct soc_enum fsl_micfil_quality_enum=
 =3D
>
>  static DECLARE_TLV_DB_SCALE(gain_tlv, 0, 100, 0);
>
> +static int micfil_get_max_range(struct fsl_micfil *micfil)
> +{
> +       int max_range;
> +
> +       switch (micfil->quality) {
> +       case QUALITY_HIGH:
> +       case QUALITY_VLOW0:
> +               max_range =3D micfil->soc->rangeadj_const[0][0] - micfil-=
>soc->rangeadj_const[0][1] *
> +                           ilog2(2 * MICFIL_OSR_DEFAULT);
> +               break;
> +       case QUALITY_MEDIUM:
> +       case QUALITY_VLOW1:
> +               max_range =3D micfil->soc->rangeadj_const[1][0] - micfil-=
>soc->rangeadj_const[1][1] *
> +                           ilog2(MICFIL_OSR_DEFAULT);
> +               break;
> +       case QUALITY_LOW:
> +       case QUALITY_VLOW2:
> +               max_range =3D micfil->soc->rangeadj_const[2][0] - micfil-=
>soc->rangeadj_const[2][1] *
> +                           ilog2(MICFIL_OSR_DEFAULT);
> +               break;
> +       default:
> +               return 0;
> +       }
> +       max_range =3D max_range < 0 ? 0 : max_range;
> +
> +       return max_range;
> +}
> +
> +static int micfil_range_set(struct snd_kcontrol *kcontrol,
> +                           struct snd_ctl_elem_value *ucontrol)
> +{
> +       struct snd_soc_component *cmpnt =3D snd_kcontrol_chip(kcontrol);
> +       struct fsl_micfil *micfil =3D snd_soc_component_get_drvdata(cmpnt=
);
> +       struct soc_mixer_control *mc =3D
> +               (struct soc_mixer_control *)kcontrol->private_value;
> +       unsigned int shift =3D mc->shift;
> +       int max_range, new_range;
> +
> +       new_range =3D ucontrol->value.integer.value[0];
> +       max_range =3D micfil_get_max_range(micfil);
> +       if (new_range > max_range)
> +               dev_warn(&micfil->pdev->dev, "range makes channel %d data=
 unreliable\n", shift / 4);
> +
> +       regmap_update_bits(micfil->regmap, REG_MICFIL_OUT_CTRL, 0xF << sh=
ift, new_range << shift);
> +
> +       return 0;
> +}
> +
>  static int micfil_set_quality(struct fsl_micfil *micfil)
>  {
> -       u32 qsel;
> +       int range, max_range;
> +       u32 qsel, val;
> +       int i;
> +
> +       if (!micfil->soc->volume_sx) {
> +               regmap_read(micfil->regmap, REG_MICFIL_OUT_CTRL, &val);
> +               max_range =3D micfil_get_max_range(micfil);
> +               for (i =3D 0; i < micfil->soc->fifos; i++) {
> +                       range =3D (val >> MICFIL_OUTGAIN_CHX_SHIFT(i)) & =
0xF;
> +                       if (range > max_range)
> +                               dev_warn(&micfil->pdev->dev, "please rese=
t channel %d range\n", i);
> +               }
> +       }
>
>         switch (micfil->quality) {
>         case QUALITY_HIGH:
> @@ -367,23 +433,31 @@ static int hwvad_detected(struct snd_kcontrol *kcon=
trol,
>         return 0;
>  }
>
> -static const struct snd_kcontrol_new fsl_micfil_volume_controls[] =3D {
> -       SOC_SINGLE_TLV("CH0 Volume", REG_MICFIL_OUT_CTRL,
> -                      MICFIL_OUTGAIN_CHX_SHIFT(0), 0xF, 0, gain_tlv),
> -       SOC_SINGLE_TLV("CH1 Volume", REG_MICFIL_OUT_CTRL,
> -                      MICFIL_OUTGAIN_CHX_SHIFT(1), 0xF, 0, gain_tlv),
> -       SOC_SINGLE_TLV("CH2 Volume", REG_MICFIL_OUT_CTRL,
> -                      MICFIL_OUTGAIN_CHX_SHIFT(2), 0xF, 0, gain_tlv),
> -       SOC_SINGLE_TLV("CH3 Volume", REG_MICFIL_OUT_CTRL,
> -                      MICFIL_OUTGAIN_CHX_SHIFT(3), 0xF, 0, gain_tlv),
> -       SOC_SINGLE_TLV("CH4 Volume", REG_MICFIL_OUT_CTRL,
> -                      MICFIL_OUTGAIN_CHX_SHIFT(4), 0xF, 0, gain_tlv),
> -       SOC_SINGLE_TLV("CH5 Volume", REG_MICFIL_OUT_CTRL,
> -                      MICFIL_OUTGAIN_CHX_SHIFT(5), 0xF, 0, gain_tlv),
> -       SOC_SINGLE_TLV("CH6 Volume", REG_MICFIL_OUT_CTRL,
> -                      MICFIL_OUTGAIN_CHX_SHIFT(6), 0xF, 0, gain_tlv),
> -       SOC_SINGLE_TLV("CH7 Volume", REG_MICFIL_OUT_CTRL,
> -                      MICFIL_OUTGAIN_CHX_SHIFT(7), 0xF, 0, gain_tlv),
> +static const struct snd_kcontrol_new fsl_micfil_range_controls[] =3D {
> +       SOC_SINGLE_EXT("CH0 Range", REG_MICFIL_OUT_CTRL,
> +                      MICFIL_OUTGAIN_CHX_SHIFT(0), 0xF, 0,
> +                      snd_soc_get_volsw, micfil_range_set),
> +       SOC_SINGLE_EXT("CH1 Range", REG_MICFIL_OUT_CTRL,
> +                      MICFIL_OUTGAIN_CHX_SHIFT(1), 0xF, 0,
> +                      snd_soc_get_volsw, micfil_range_set),
> +       SOC_SINGLE_EXT("CH2 Range", REG_MICFIL_OUT_CTRL,
> +                      MICFIL_OUTGAIN_CHX_SHIFT(2), 0xF, 0,
> +                      snd_soc_get_volsw, micfil_range_set),
> +       SOC_SINGLE_EXT("CH3 Range", REG_MICFIL_OUT_CTRL,
> +                      MICFIL_OUTGAIN_CHX_SHIFT(3), 0xF, 0,
> +                      snd_soc_get_volsw, micfil_range_set),
> +       SOC_SINGLE_EXT("CH4 Range", REG_MICFIL_OUT_CTRL,
> +                      MICFIL_OUTGAIN_CHX_SHIFT(4), 0xF, 0,
> +                      snd_soc_get_volsw, micfil_range_set),
> +       SOC_SINGLE_EXT("CH5 Range", REG_MICFIL_OUT_CTRL,
> +                      MICFIL_OUTGAIN_CHX_SHIFT(5), 0xF, 0,
> +                      snd_soc_get_volsw, micfil_range_set),
> +       SOC_SINGLE_EXT("CH6 Range", REG_MICFIL_OUT_CTRL,
> +                      MICFIL_OUTGAIN_CHX_SHIFT(6), 0xF, 0,
> +                      snd_soc_get_volsw, micfil_range_set),
> +       SOC_SINGLE_EXT("CH7 Range", REG_MICFIL_OUT_CTRL,
> +                      MICFIL_OUTGAIN_CHX_SHIFT(7), 0xF, 0,
> +                      snd_soc_get_volsw, micfil_range_set),
>  };
>
>  static const struct snd_kcontrol_new fsl_micfil_volume_sx_controls[] =3D=
 {
> @@ -895,13 +969,20 @@ static int fsl_micfil_dai_probe(struct snd_soc_dai =
*cpu_dai)
>         struct fsl_micfil *micfil =3D dev_get_drvdata(cpu_dai->dev);
>         struct device *dev =3D cpu_dai->dev;
>         unsigned int val =3D 0;
> -       int ret, i;
> +       int ret, i, max_range;
>
>         micfil->quality =3D micfil->soc->default_quality;
>         micfil->card =3D cpu_dai->component->card;
>
>         /* set default gain to 2 */
> -       regmap_write(micfil->regmap, REG_MICFIL_OUT_CTRL, 0x22222222);
> +       if (micfil->soc->volume_sx) {
> +               regmap_write(micfil->regmap, REG_MICFIL_OUT_CTRL, 0x22222=
222);
> +       } else {
> +               max_range =3D micfil_get_max_range(micfil);
> +               for (i =3D 1; i < micfil->soc->fifos; i++)
> +                       max_range |=3D max_range << 4;
> +               regmap_write(micfil->regmap, REG_MICFIL_OUT_CTRL, max_ran=
ge);
> +       }
>
>         /* set DC Remover in bypass mode*/
>         for (i =3D 0; i < MICFIL_OUTPUT_CHANNELS; i++)
> @@ -935,8 +1016,8 @@ static int fsl_micfil_component_probe(struct snd_soc=
_component *component)
>                 snd_soc_add_component_controls(component, fsl_micfil_volu=
me_sx_controls,
>                                                ARRAY_SIZE(fsl_micfil_volu=
me_sx_controls));
>         else
> -               snd_soc_add_component_controls(component, fsl_micfil_volu=
me_controls,
> -                                              ARRAY_SIZE(fsl_micfil_volu=
me_controls));
> +               snd_soc_add_component_controls(component, fsl_micfil_rang=
e_controls,
> +                                              ARRAY_SIZE(fsl_micfil_rang=
e_controls));
>
>         return 0;
>  }
> --
> 2.50.1
>
