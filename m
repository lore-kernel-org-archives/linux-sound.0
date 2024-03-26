Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664A713C82E
	for <linux-sound@vger.kernel.org>; Tue, 26 Mar 2024 15:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711466626; cv=none; b=I1rPpP/R/4xy6wEw7ncEIX4wvOqggoqA7jve/llosUmBB2H+9qk6JV+yd4Rv3D7cgPB6i3pqzpOdHKBf6e6MqMsQiv+Bc2EZczHHIn0xI+xuR8PmmGrbqK+NpgLGrN88cxeM3TlfwA9B8sszaMIjCaU2e8uc411NzTmz67DA1JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711466626; c=relaxed/simple;
	bh=+K8e/fYuyVDvRpEXJ6MEqprpqClNLUw96QDT9d7KkGw=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:Message-ID:
	 MIME-Version:Content-Type; b=AUwZFCxQMxTVyotVVyQ+v46gcgfL7ffZ9olfutqTRt1DEg0m+vmu+v7+9PI5wC2wGh0BxpfmesoOGbwHqFNzxzbFfjfp/ZI+yolY9uoFFuMNdJzHrOW8PwYvhMRJxPd00X0kekq4alfFyOljAsdFGqGY+XoVEmBxAiXx1FuYF4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=CeaUhL8d; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="CeaUhL8d"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-33e285a33bdso3347892f8f.2
        for <linux-sound@vger.kernel.org>; Tue, 26 Mar 2024 08:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1711466622; x=1712071422; darn=vger.kernel.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=aM+9RXmEYQB5vl1fffTAMXMZVqZ/ACCmOiJ2FPQkdAA=;
        b=CeaUhL8dULWKn7x4N3Brdb14cmc5wNlgH7WYelsfTC0XbHLF+uCfk26etYJwNrFiGy
         g9Geh/KHyhQNzfurQh9oi1YmDUq4zHRi5fpTYPN7k+c/FTkL2iPQEEMtQjpCbFpf2d2K
         TbmT3oodXoa+hJefNQAb6o5fdQA7YQFBtPiDNW9fTFRKgjdJOXN87l3bH6W3DYbfCbXG
         Z7ZzhICrNgiGg/9NoDavx9QSrFSDDUeONGNHjhhGNaL5dy0Ezxq4xte+FJN7Ye8bX7Oa
         6FR1TqP9nKzVkLQXB+J+w2KzXV1QOVMK/PqsL0MA7J1W2ijLSmXijorMF7eziEtVtRvr
         MFww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711466622; x=1712071422;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aM+9RXmEYQB5vl1fffTAMXMZVqZ/ACCmOiJ2FPQkdAA=;
        b=xMohucOkl8Fe/621Z/OoueFETan/ejcHuOmbzckGMitsZSWIgrpeLwImIhikNvkup2
         OWIuXKKYUjCuQGkl/EiO0IcAd85qq5XIKmF9E9NI6sjsYx7lfbuYDKvMliWszP2lGd6Q
         4jhtTJ9jf9aQnjgKKAhjesWT/Mw/JNWv24gsfRUoaejXS6ojHTd2JZpecg5EmZj9yqaF
         JTZAr63qwnO7eGcf2HxH6pBon5H7UZrjfz/bjS3s8ifGUtDjs3D+qtinVhhNIIB61hjD
         NbpazaWK+R29nBEhQPO+AUse/sGOJ2NfzNiGj1U1kcLgSddofW84zc4cEdmdLwPz6AVW
         fwqA==
X-Forwarded-Encrypted: i=1; AJvYcCUyvGN0nTKF2gssySktcRGpSxBnxjlksB8oOwWCLb5TOkeCbM9da7GPB3eRfPXJnnLhZBAlO+lzPkfwGJOBdC9txlmlMfd9nPp+6OM=
X-Gm-Message-State: AOJu0Yx8s4m8lKGFAHDR2zNZLDQWSoAMLFkTHvmpGD4qA/zzvAy1+YWn
	G+wdHQigK/QKwMpSAx3nascUTVTwFkBZXTWEfNMQFw6UDA9rIXGfs0ROBZpjYxI=
X-Google-Smtp-Source: AGHT+IHsYZJ/uOqZnp1TmWFGMlVgZ+AivccEHh8xx3hUmGEHsDKWJ4EN0Xf/+CitijnbkfltJZVucg==
X-Received: by 2002:a5d:69ca:0:b0:33e:7adc:516c with SMTP id s10-20020a5d69ca000000b0033e7adc516cmr1290781wrw.57.1711466621739;
        Tue, 26 Mar 2024 08:23:41 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:97a2:bb9f:463a:6468])
        by smtp.gmail.com with ESMTPSA id ch9-20020a5d5d09000000b00341c6778171sm8083186wrb.83.2024.03.26.08.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 08:23:41 -0700 (PDT)
References: <20240325235311.411920-1-jan.dakinevich@salutedevices.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2] ASoC: meson: g12a-toacodec: rework the
 definition of bits
Date: Tue, 26 Mar 2024 16:15:51 +0100
In-reply-to: <20240325235311.411920-1-jan.dakinevich@salutedevices.com>
Message-ID: <1j34sd9fur.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


On Tue 26 Mar 2024 at 02:53, Jan Dakinevich <jan.dakinevich@salutedevices.com> wrote:

> There is a lot of defines, but almost all of them are not used. Lets
> rework them:

Thanks for noticing. Please start by removing what's unused.

>
>  - keep separate the definition for different platforms to make easier
>    checking that they match documentation.
>
>  - use LSB/MSB sufixes for uniformity.

I'd be in favor of dropping these suffixes completely.

>
>  - don't use hard-coded values for already declared defines.
>
> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
> ---
> Links:
>
>  [1] https://lore.kernel.org/lkml/20240314232201.2102178-1-jan.dakinevich@salutedevices.com/
>
> Changes v1 -> v2:
>  - Detached from v1's series (patch 7).
>  - Fixed my wrong understanding of SOC_SINGLE's input parameters.
>
>  sound/soc/meson/g12a-toacodec.c | 79 ++++++++++++++++++++-------------
>  1 file changed, 49 insertions(+), 30 deletions(-)
>
> diff --git a/sound/soc/meson/g12a-toacodec.c b/sound/soc/meson/g12a-toacodec.c
> index 531bb8707a3e..22181f4bab72 100644
> --- a/sound/soc/meson/g12a-toacodec.c
> +++ b/sound/soc/meson/g12a-toacodec.c
> @@ -20,26 +20,37 @@
>  #define G12A_TOACODEC_DRV_NAME "g12a-toacodec"
>  
>  #define TOACODEC_CTRL0			0x0
> -#define  CTRL0_ENABLE_SHIFT		31
> -#define  CTRL0_DAT_SEL_SM1_MSB		19
> -#define  CTRL0_DAT_SEL_SM1_LSB		18
> -#define  CTRL0_DAT_SEL_MSB		15
> -#define  CTRL0_DAT_SEL_LSB		14
> -#define  CTRL0_LANE_SEL_SM1		16
> -#define  CTRL0_LANE_SEL			12
> -#define  CTRL0_LRCLK_SEL_SM1_MSB	14
> -#define  CTRL0_LRCLK_SEL_SM1_LSB	12
> -#define  CTRL0_LRCLK_SEL_MSB		9
> -#define  CTRL0_LRCLK_SEL_LSB		8
> -#define  CTRL0_LRCLK_INV_SM1		BIT(10)
> -#define  CTRL0_BLK_CAP_INV_SM1		BIT(9)
> -#define  CTRL0_BLK_CAP_INV		BIT(7)
> -#define  CTRL0_BCLK_O_INV_SM1		BIT(8)
> -#define  CTRL0_BCLK_O_INV		BIT(6)
> -#define  CTRL0_BCLK_SEL_SM1_MSB		6
> -#define  CTRL0_BCLK_SEL_MSB		5
> -#define  CTRL0_BCLK_SEL_LSB		4
> -#define  CTRL0_MCLK_SEL			GENMASK(2, 0)
> +
> +/* Common bits */
> +#define CTRL0_ENABLE_SHIFT		31
> +#define CTRL0_MCLK_SEL			GENMASK(2, 0)
> +
> +/* G12A bits */
> +#define CTRL0_DAT_SEL_G12A_MSB		15
> +#define CTRL0_DAT_SEL_G12A_LSB		14
> +#define CTRL0_LANE_SEL_G12A_MSB		13
> +#define CTRL0_LANE_SEL_G12A_LSB		12
> +#define CTRL0_LANE_SEL_G12A_MAX		3
> +#define CTRL0_LRCLK_SEL_G12A_MSB	9
> +#define CTRL0_LRCLK_SEL_G12A_LSB	8
> +#define CTRL0_BLK_CAP_INV_G12A		BIT(7)
> +#define CTRL0_BCLK_O_INV_G12A		BIT(6)
> +#define CTRL0_BCLK_SEL_G12A_MSB		5
> +#define CTRL0_BCLK_SEL_G12A_LSB		4
> +
> +/* SM1 bits */
> +#define CTRL0_DAT_SEL_SM1_MSB		19
> +#define CTRL0_DAT_SEL_SM1_LSB		18
> +#define CTRL0_LANE_SEL_SM1_MSB		17
> +#define CTRL0_LANE_SEL_SM1_LSB		16
> +#define CTRL0_LANE_SEL_SM1_MAX		3
> +#define CTRL0_LRCLK_SEL_SM1_MSB		14
> +#define CTRL0_LRCLK_SEL_SM1_LSB		12
> +#define CTRL0_LRCLK_INV_SM1		BIT(10)
> +#define CTRL0_BLK_CAP_INV_SM1		BIT(9)
> +#define CTRL0_BCLK_O_INV_SM1		BIT(8)
> +#define CTRL0_BCLK_SEL_SM1_MSB		6
> +#define CTRL0_BCLK_SEL_SM1_LSB		4
>  
>  #define TOACODEC_OUT_CHMAX		2
>  
> @@ -108,7 +119,7 @@ static int g12a_toacodec_mux_put_enum(struct snd_kcontrol *kcontrol,
>  }
>  
>  static SOC_ENUM_SINGLE_DECL(g12a_toacodec_mux_enum, TOACODEC_CTRL0,
> -			    CTRL0_DAT_SEL_LSB,
> +			    CTRL0_DAT_SEL_G12A_LSB,
>  			    g12a_toacodec_mux_texts);
>  
>  static SOC_ENUM_SINGLE_DECL(sm1_toacodec_mux_enum, TOACODEC_CTRL0,
> @@ -210,7 +221,7 @@ static int g12a_toacodec_component_probe(struct snd_soc_component *c)
>  {
>  	/* Initialize the static clock parameters */
>  	return snd_soc_component_write(c, TOACODEC_CTRL0,
> -				       CTRL0_BLK_CAP_INV);
> +				       CTRL0_BLK_CAP_INV_G12A);
>  }
>  
>  static int sm1_toacodec_component_probe(struct snd_soc_component *c)
> @@ -229,11 +240,13 @@ static const struct snd_soc_dapm_route g12a_toacodec_routes[] = {
>  };
>  
>  static const struct snd_kcontrol_new g12a_toacodec_controls[] = {
> -	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL, 3, 0),
> +	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL_G12A_LSB,
> +		   CTRL0_LANE_SEL_G12A_MAX, 0),
>  };
>  
>  static const struct snd_kcontrol_new sm1_toacodec_controls[] = {
> -	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL_SM1, 3, 0),
> +	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL_SM1_LSB,
> +		   CTRL0_LANE_SEL_SM1_MAX, 0),
>  };
>  
>  static const struct snd_soc_component_driver g12a_toacodec_component_drv = {
> @@ -266,16 +279,22 @@ static const struct regmap_config g12a_toacodec_regmap_cfg = {
>  
>  static const struct g12a_toacodec_match_data g12a_toacodec_match_data = {
>  	.component_drv	= &g12a_toacodec_component_drv,
> -	.field_dat_sel	= REG_FIELD(TOACODEC_CTRL0, 14, 15),
> -	.field_lrclk_sel = REG_FIELD(TOACODEC_CTRL0, 8, 9),
> -	.field_bclk_sel	= REG_FIELD(TOACODEC_CTRL0, 4, 5),
> +	.field_dat_sel	= REG_FIELD(TOACODEC_CTRL0, CTRL0_DAT_SEL_G12A_LSB,
> +				    CTRL0_DAT_SEL_G12A_MSB),
> +	.field_lrclk_sel = REG_FIELD(TOACODEC_CTRL0, CTRL0_LRCLK_SEL_G12A_LSB,
> +				     CTRL0_LRCLK_SEL_G12A_MSB),
> +	.field_bclk_sel	= REG_FIELD(TOACODEC_CTRL0, CTRL0_BCLK_SEL_G12A_LSB,
> +				    CTRL0_BCLK_SEL_G12A_MSB),
>  };
>  
>  static const struct g12a_toacodec_match_data sm1_toacodec_match_data = {
>  	.component_drv	= &sm1_toacodec_component_drv,
> -	.field_dat_sel	= REG_FIELD(TOACODEC_CTRL0, 18, 19),
> -	.field_lrclk_sel = REG_FIELD(TOACODEC_CTRL0, 12, 14),
> -	.field_bclk_sel	= REG_FIELD(TOACODEC_CTRL0, 4, 6),
> +	.field_dat_sel	= REG_FIELD(TOACODEC_CTRL0, CTRL0_DAT_SEL_SM1_LSB,
> +				    CTRL0_DAT_SEL_SM1_MSB),
> +	.field_lrclk_sel = REG_FIELD(TOACODEC_CTRL0, CTRL0_LRCLK_SEL_SM1_LSB,
> +				     CTRL0_LRCLK_SEL_SM1_MSB),
> +	.field_bclk_sel	= REG_FIELD(TOACODEC_CTRL0, CTRL0_BCLK_SEL_SM1_LSB,
> +				    CTRL0_BCLK_SEL_SM1_MSB),

Those defines are already platform specific by the structure holding
them and the defines you have added are not helping readability.

I don't see the point to see.
I'd prefer to keep the field defined as they are.

>  };
>  
>  static const struct of_device_id g12a_toacodec_of_match[] = {


-- 
Jerome
