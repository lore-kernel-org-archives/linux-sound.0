Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A79C8C7;
	Sun, 22 Dec 2024 17:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734887733; cv=none; b=gpjONCfPJPzzFz0ADrORL4Hhk/lc0T+/z+HfxRZQqWVJX/r0WW5ZyJLW0o958ye51ELrowm6GIZCoGGyGHO01N7kNQg2lqi0AQoJyFPC7hMY2ckAuqqISEi6vtl0Q3FK6itN618s/Hg72LTpEl60N2V97Vf3SjPRY0UUAFWbDC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734887733; c=relaxed/simple;
	bh=g8nYvPqAO0FjEEchQsjQQF7QHU7XUp4wkO+nydDKEWU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L/LgEV9e45Tgt1LGaRU7RdzhLHm7IEf8VVU7eGhS1qGn45cwhTFSZWcd93NEEXezUtAJLMuRRo8OOQ5v25nnF75TU5uq3zQIJFijpv7N3OBx6RqpS9XGdjg2aMpSyb5Qmn7hxezU/2QodmHhYemJVB1Xvz4u/RvRHFfsDEzPzC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2ffd6b7d77aso44620071fa.0;
        Sun, 22 Dec 2024 09:15:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734887728; x=1735492528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dlz2LOWxC4ZL1ezJ/U8+YOy1mneK8Pcrb6gV8siPKTc=;
        b=b/+hAAsn6A5Mb5eDLOKCpcV4ef+AfVS+TyQKR8qbN29Pm+o0/bK42oBPNLgDTjpSQo
         6siBvV6dXJ48R/Wfy+S1OK64bMyWn9d8wgj3UOYY0GvCc5BeaIqiWtVyOedhLxFzBXvN
         VShXzHGgBlPkIR+UoweL8s4BnMl+JLovfxCZRlnxGyAQqHl3SRuh8lhidrFMt9ZWWhkd
         aOySMVhd+J1chFtWb8bIkd6BLmnaN7IlWXVFhmzoLywEzN4eoeVPYWCGxX36geUPme2w
         xCmd8KFKSu+7Mm3zocSr1PNmyLODOBZxxvSmykqzuvnJzVnSsvPQiHrNTrwg1tu5GmJR
         XAaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTSrPW82knCNTrB5XIVRj33sPBpgR6CcO0dMLnPKhpIB5Z9hsooOTwU6LdAJTYEY84mSTXPa3nzI+xU0c=@vger.kernel.org, AJvYcCX+lWIkJTRi9JMg3dzeW+nGAzVO0HX8QjOyckkimqnaFPpk/ApnUeDfp/eoWRV/zBmuobY3VbYODNFN@vger.kernel.org
X-Gm-Message-State: AOJu0YwgwlsLJPCJvXnuW3uOC6b2l2RlXHaIsoJBiWFta3UyCledjfbl
	aooHETtIjMzUWgKuV8PCnijRLOHrVtTfiuGuekceOqCryje0ZPMrUYdqjKAZ
X-Gm-Gg: ASbGncv8jqxUmdrWxRWFYfu5cVqPs8BXVRmFA/sw1G6OBEUt3qKRw35+cw3c3mxIfU0
	6OGu1yXKQ1Ui3yr+gzs2R3IeYbZ4zInhQhqX5V3eeCCKIEarpN/DY/2CqR2nZLMyayzjIxLotTu
	mL4DVZQNnZiOK1RO6HanR1WaeKFJ1B80gh9ejbLQlS45Pb1eUnNcjeybUO6539eLpzrE1J+/TgU
	7PaCH4Y2jglToO03vZNHp5IeHK7D/7QkMsM490uNkZQ9XFOqPVLAFsc3RYNtOBWvnFFI/cI/xOt
	2/12D1Nn3w==
X-Google-Smtp-Source: AGHT+IHUM790H0hQYa7LYBxGb6nJ5PS3hqkZxjtAhhMxL0x+XFOIcpEsdH+RStwjvfu5tO0cXoP8rA==
X-Received: by 2002:a05:651c:a0b:b0:2ff:d32f:f881 with SMTP id 38308e7fff4ca-3046863063cmr25804391fa.38.1734887727684;
        Sun, 22 Dec 2024 09:15:27 -0800 (PST)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com. [209.85.167.48])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045b096cafsm10832721fa.123.2024.12.22.09.15.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Dec 2024 09:15:26 -0800 (PST)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53df19bf6a9so5212206e87.1;
        Sun, 22 Dec 2024 09:15:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW9P19ZaR3VK+oeCsWtfaFQPlhUfsDcGpM64Ao7q2WURIuhTJOx4U/1ZP/CNGkC0sldlf9sEFFEQ/zk@vger.kernel.org, AJvYcCWefOtDq0Zr9g/ymGFBYYRuXXR/aOYyWu5uAjSh1lKmqsuAO+ZtFy1GmB/YjuGp1yRY+TEwCpM0Mhsrpd0=@vger.kernel.org
X-Received: by 2002:a05:6512:31d3:b0:540:1e5e:3876 with SMTP id
 2adb3069b0e04-5422957ace2mr3418251e87.52.1734887726415; Sun, 22 Dec 2024
 09:15:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241221094122.27325-1-ryan@testtoast.com> <20241221094122.27325-3-ryan@testtoast.com>
In-Reply-To: <20241221094122.27325-3-ryan@testtoast.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 23 Dec 2024 01:15:13 +0800
X-Gmail-Original-Message-ID: <CAGb2v64qf0jNv72uHUK+aSj0Xt-bf+DW0NCnsZmLf-6xHZF_ew@mail.gmail.com>
Message-ID: <CAGb2v64qf0jNv72uHUK+aSj0Xt-bf+DW0NCnsZmLf-6xHZF_ew@mail.gmail.com>
Subject: Re: [PATCH 2/3] ASoC: sun4i-codec: support hp-det-gpios property
To: Ryan Walklin <ryan@testtoast.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
	Chris Morgan <macromorgan@hotmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 21, 2024 at 5:41=E2=80=AFPM Ryan Walklin <ryan@testtoast.com> w=
rote:
>
> From: Chris Morgan <macromorgan@hotmail.com>
>
> Add support for GPIO headphone detection with the hp-det-gpios
> property. In order for this to properly disable the path upon
> removal of headphones, the output must be labelled Headphone which
> is a common sink in the driver. Note this patch also adds the output
> of Headphone for the H616 codec.
>
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> ---
>  sound/soc/sunxi/sun4i-codec.c | 59 +++++++++++++++++++++++++++++++++--
>  1 file changed, 57 insertions(+), 2 deletions(-)
>
> diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.=
c
> index 933a0913237c8..5f718dd3fcf0a 100644
> --- a/sound/soc/sunxi/sun4i-codec.c
> +++ b/sound/soc/sunxi/sun4i-codec.c
> @@ -21,6 +21,7 @@
>  #include <linux/gpio/consumer.h>
>
>  #include <sound/core.h>
> +#include <sound/jack.h>
>  #include <sound/pcm.h>
>  #include <sound/pcm_params.h>
>  #include <sound/soc.h>
> @@ -272,6 +273,7 @@ struct sun4i_codec {
>         struct clk      *clk_module;
>         struct reset_control *rst;
>         struct gpio_desc *gpio_pa;
> +       struct gpio_desc *gpio_hp;
>
>         /* ADC_FIFOC register is at different offset on different SoCs */
>         struct regmap_field *reg_adc_fifoc;
> @@ -1302,6 +1304,49 @@ static struct snd_soc_dai_driver dummy_cpu_dai =3D=
 {
>         .ops =3D &dummy_dai_ops,
>  };
>
> +static struct snd_soc_jack sun4i_headphone_jack;
> +
> +static struct snd_soc_jack_pin sun4i_headphone_jack_pins[] =3D {
> +       { .pin =3D "Headphone", .mask =3D SND_JACK_HEADPHONE},
> +};
> +
> +static struct snd_soc_jack_gpio sun4i_headphone_jack_gpio =3D {
> +       .name =3D "hp-det",
> +       .report =3D SND_JACK_HEADPHONE,
> +       .debounce_time =3D 150,
> +};
> +
> +static int sun4i_codec_machine_init(struct snd_soc_pcm_runtime *rtd)
> +{
> +       struct snd_soc_card *card =3D rtd->card;
> +       struct sun4i_codec *scodec =3D snd_soc_card_get_drvdata(card);
> +       int ret;
> +
> +       if (scodec->gpio_hp) {
> +               ret =3D snd_soc_card_jack_new_pins(card, "Headphone Jack"=
,
> +                                                SND_JACK_HEADPHONE,
> +                                                &sun4i_headphone_jack,
> +                                                sun4i_headphone_jack_pin=
s,
> +                                                ARRAY_SIZE(sun4i_headpho=
ne_jack_pins));
> +               if (ret) {
> +                       dev_err(rtd->dev,
> +                               "Headphone jack creation failed: %d\n", r=
et);
> +                       return ret;
> +               }
> +
> +               sun4i_headphone_jack_gpio.desc =3D scodec->gpio_hp;
> +               ret =3D snd_soc_jack_add_gpios(&sun4i_headphone_jack, 1,
> +                                            &sun4i_headphone_jack_gpio);
> +
> +               if (ret) {
> +                       dev_err(rtd->dev, "Headphone GPIO not added: %d\n=
", ret);
> +                       return ret;
> +               }
> +       }
> +
> +       return 0;
> +}
> +
>  static struct snd_soc_dai_link *sun4i_codec_create_link(struct device *d=
ev,
>                                                         int *num_links)
>  {
> @@ -1327,6 +1372,7 @@ static struct snd_soc_dai_link *sun4i_codec_create_=
link(struct device *dev,
>         link->codecs->name      =3D dev_name(dev);
>         link->platforms->name   =3D dev_name(dev);
>         link->dai_fmt           =3D SND_SOC_DAIFMT_I2S;
> +       link->init              =3D sun4i_codec_machine_init;
>
>         *num_links =3D 1;
>
> @@ -1635,10 +1681,11 @@ static const struct snd_soc_component_driver sun5=
0i_h616_codec_codec =3D {
>  };
>
>  static const struct snd_kcontrol_new sun50i_h616_card_controls[] =3D {
> -       SOC_DAPM_PIN_SWITCH("LINEOUT"),
> +       SOC_DAPM_PIN_SWITCH("Speaker"),

Why?

>  };
>
>  static const struct snd_soc_dapm_widget sun50i_h616_codec_card_dapm_widg=
ets[] =3D {
> +       SND_SOC_DAPM_HP("Headphone", NULL),
>         SND_SOC_DAPM_LINE("Line Out", NULL),
>         SND_SOC_DAPM_SPK("Speaker", sun4i_codec_spk_event),
>  };
> @@ -1684,7 +1731,7 @@ static struct snd_soc_card *sun50i_h616_codec_creat=
e_card(struct device *dev)
>
>         card->dev               =3D dev;
>         card->owner             =3D THIS_MODULE;
> -       card->name              =3D "H616 Audio Codec";
> +       card->name              =3D "h616-audio-codec";

Why?

>         card->driver_name       =3D "sun4i-codec";
>         card->controls          =3D sun50i_h616_card_controls;
>         card->num_controls      =3D ARRAY_SIZE(sun50i_h616_card_controls)=
;
> @@ -1940,6 +1987,14 @@ static int sun4i_codec_probe(struct platform_devic=
e *pdev)
>                 return ret;
>         }
>
> +       scodec->gpio_hp =3D devm_gpiod_get_optional(&pdev->dev, "allwinne=
r,hp-det",
> +                                                 GPIOD_IN);

Just put it on the same line. Lines can go up to 100 characters.

> +       if (IS_ERR(scodec->gpio_hp)) {
> +               ret =3D PTR_ERR(scodec->gpio_hp);
> +               dev_err_probe(&pdev->dev, ret, "Failed to get hp-det gpio=
\n");
> +               return ret;
> +       }
> +
>         /* reg_field setup */
>         scodec->reg_adc_fifoc =3D devm_regmap_field_alloc(&pdev->dev,
>                                                         scodec->regmap,
> --
> 2.47.1
>
>
