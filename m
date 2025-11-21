Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE278223705
	for <linux-sound@vger.kernel.org>; Fri, 21 Nov 2025 05:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763704520; cv=none; b=UNb4HLd1xxEejfZ6H+FNH1Yos6fE1uZ0u6y1MymUEL4WgE9hyNahOgJKdmkN6WMw2ijoIhNFR85jpb4T00GbE7StVt5SyN6svgeMDNVtVY7fcWGBDbFJegk+ux24uyVm3NW3zj+uM9akiS/DIxQbwK0XzuGjIXOv6Le9i9RWOVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763704520; c=relaxed/simple;
	bh=IOFTpva6B/7noDWvBeJvRf8I5PuYlg0+UHLsi+1dyR8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MuYIX08CScyH5ee9Crl5z+cOWYnEX18UbKGLmtKbvsXKSZT8Xx2s2sJqCpugJeqv1s5IaVQpRL2ix5n1GRK1CJTEdnfwcyGVMOqpmWXsWcHGgbvldOFKqyWxoWHXpLEvSYUdZbrszWxARQTJtQwtazH8wSumhsVY+eMo2UbSUYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=aXS9Hupm; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aXS9Hupm"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-59578e38613so1831675e87.2
        for <linux-sound@vger.kernel.org>; Thu, 20 Nov 2025 21:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763704517; x=1764309317; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zwvomCI1BwoaMdIOXY7Bw6epo0QG3ROLLVd2yNeflzU=;
        b=aXS9Hupmf8C5YiUy/dhoTQaeD5o6CvP6Mil4xXeaUYGuz1rZQvOJQSvp+4siHY3VYr
         drf/OpfpGsA9IFgEiuGL8MfkzERGSs2Sy7TEZuJLzkWlYyDDMjwvjeSd/TnLZesNfGY5
         bth2MEX0A2ca9EByqNMshpzrBspfAj0IGBYH0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763704517; x=1764309317;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zwvomCI1BwoaMdIOXY7Bw6epo0QG3ROLLVd2yNeflzU=;
        b=vXQdWcB/z7ZN3GT1Mb/qSweld15ZnHLXp0XcUoifrlDOxBitDscU8N8RAqsn5iT7li
         TAZyMsFYyGKucLgQordhGFiHj3JbOmhJDd2Jvj7UdE0rFqNXBgXSSUF6/S4jJNywpp8O
         LfRe+Uk9S2Bcw8msXou+cTbmrVol6mbPnll17x09RggaOrz+M/5X/yTw7gGN5S0scGvd
         1/sMYaGOutaVFH5KvllmXcsEWjXYic4beyFC38VdGUlwnSqlcFefqeeqQnGIXzpVzDQ8
         df5VB3t0mYkAtAGLT5aU2WO5+ff6403rUX51Xv0gg8NKk+0BBOLTaft6ayrzwZ9aQFkf
         UQxw==
X-Forwarded-Encrypted: i=1; AJvYcCVsSQ8h92+gMJvhmGDQX7bEw8Guv3DoSpNbpEQ2ITHnSn7i+FnipBwvOot7HNUfvJIGK8urPQVTujHG3w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwyLySK83VMQOn2sJBWJXZZ+4uzbiyil3bmdW1djn41Ww4i6CTn
	Mp30gTEo2pZxjhguuj/wcBpUatoqMaHI/P7s+d3DxG2cGcteUKDuWSsIoxObUCRGxo8j8M0PgE1
	Xfh7Lx9LAwqmBS+sv6D3/ZK3avjeRfQcN/7mxPArG
X-Gm-Gg: ASbGncsp5Tl371Jqf9d9JE6vwVzuKz5w43bIVvP4gcOA0tCDsvnLLgEYpkScxmkKJ4r
	z9ARR42klLSYp3zdjeb73zF6yEbrrioJEEnekKnOlAZLA769uEAZ5imEkxNBnaSXV4MooPLygr2
	A7GUFiS7+SnMJDtZGGVY09Fn2ZpuJDIHFRuTOImoE0/wgvtSuSFLF4PQ6+IwhE/OXTixXZU9p6R
	yU2GPPhQ9vJ9rYy1q8NdQ88tS6vP0WwTEt13OSPPz7KiMhBftZIyPExDGpJ1z72E6oRpPqZKkzS
	Eb4OJiMvktvGRS2vZXuJPr+JGA==
X-Google-Smtp-Source: AGHT+IEDYrCP2AUvrHoGRLMquIrh7OcHVFanViendh+zN/U9VV/Im6NFRvLgmuSn64N/ilxblNrZFfLqTBBGNdSvpjg=
X-Received: by 2002:a05:6512:220f:b0:592:f521:188a with SMTP id
 2adb3069b0e04-596a3ee2889mr332332e87.49.1763704516899; Thu, 20 Nov 2025
 21:55:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251121054537.25796-1-ansuelsmth@gmail.com> <20251121054537.25796-4-ansuelsmth@gmail.com>
In-Reply-To: <20251121054537.25796-4-ansuelsmth@gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 21 Nov 2025 13:55:05 +0800
X-Gm-Features: AWmQ_bmSFIa1l2iBEM2F1Ns2W5B-YvvlaQwgWNVUEBTmTCIap5cAu57a2ztT9KE
Message-ID: <CAGXv+5HZbB+CeeM7ggCRmxdiyeY-5tXYpLLTyoazEinrLe_jCw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] ASoC: airoha: Add AFE and machine driver for
 Airoha AN7581
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Cyril Chao <Cyril.Chao@mediatek.com>, Arnd Bergmann <arnd@arndb.de>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	upstream@airoha.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 21, 2025 at 1:46=E2=80=AFPM Christian Marangi <ansuelsmth@gmail=
.com> wrote:
>
> Add support for the Sound system present on Airoha AN7581 SoC. This is
> based on the mediatek AFE drivers.
>
> Also add the machine driver to create an actual sound card for the AFE.
>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---

[...]

> diff --git a/sound/soc/mediatek/an7581/an7581-wm8960.c b/sound/soc/mediat=
ek/an7581/an7581-wm8960.c
> new file mode 100644
> index 000000000000..5d6c736aa6f2
> --- /dev/null
> +++ b/sound/soc/mediatek/an7581/an7581-wm8960.c
> @@ -0,0 +1,170 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Airoha ALSA SoC I2S platform driver for AN7581
> + *
> + */
> +
> +#include <linux/module.h>
> +#include <sound/soc.h>
> +
> +#include "an7581-afe-common.h"
> +
> +static const struct snd_soc_dapm_widget an7581_wm8960_widgets[] =3D {
> +       SND_SOC_DAPM_HP("Headphone", NULL),
> +       SND_SOC_DAPM_MIC("AMIC", NULL),
> +};
> +
> +static const struct snd_kcontrol_new an7581_wm8960_controls[] =3D {
> +       SOC_DAPM_PIN_SWITCH("Headphone"),
> +       SOC_DAPM_PIN_SWITCH("AMIC"),
> +};
> +
> +SND_SOC_DAILINK_DEFS(playback,
> +                    DAILINK_COMP_ARRAY(COMP_CPU("DL1")),
> +                    DAILINK_COMP_ARRAY(COMP_DUMMY()),
> +                    DAILINK_COMP_ARRAY(COMP_EMPTY()));
> +
> +SND_SOC_DAILINK_DEFS(capture,
> +                    DAILINK_COMP_ARRAY(COMP_CPU("UL1")),
> +                    DAILINK_COMP_ARRAY(COMP_DUMMY()),
> +                    DAILINK_COMP_ARRAY(COMP_EMPTY()));
> +
> +SND_SOC_DAILINK_DEFS(codec,
> +                    DAILINK_COMP_ARRAY(COMP_CPU("ETDM")),
> +                    DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "wm8960-hifi")),
> +                    DAILINK_COMP_ARRAY(COMP_EMPTY()));
> +
> +static struct snd_soc_dai_link an7581_wm8960_dai_links[] =3D {
> +       /* FE */
> +       {
> +               .name =3D "wm8960-playback",
> +               .stream_name =3D "wm8960-playback",
> +               .trigger =3D {SND_SOC_DPCM_TRIGGER_POST,
> +                           SND_SOC_DPCM_TRIGGER_POST},
> +               .dynamic =3D 0,
> +               .playback_only =3D 1,
> +               SND_SOC_DAILINK_REG(playback),
> +       },
> +       {
> +               .name =3D "wm8960-capture",
> +               .stream_name =3D "wm8960-capture",
> +               .trigger =3D {SND_SOC_DPCM_TRIGGER_POST,
> +                           SND_SOC_DPCM_TRIGGER_POST},
> +               .dynamic =3D 0,
> +               .capture_only =3D 1,
> +               SND_SOC_DAILINK_REG(capture),
> +       },
> +       /* BE */
> +       {
> +               .name =3D "wm8960-codec",
> +               .no_pcm =3D 1,
> +               .dai_fmt =3D SND_SOC_DAIFMT_I2S |
> +                       SND_SOC_DAIFMT_NB_NF |
> +                       SND_SOC_DAIFMT_CBC_CFC |
> +                       SND_SOC_DAIFMT_GATED,
> +               SND_SOC_DAILINK_REG(codec),
> +       },
> +};
> +
> +static struct snd_soc_card an7581_wm8960_card =3D {
> +       .name =3D "an7581-wm8960",
> +       .owner =3D THIS_MODULE,
> +       .dai_link =3D an7581_wm8960_dai_links,
> +       .num_links =3D ARRAY_SIZE(an7581_wm8960_dai_links),
> +       .controls =3D an7581_wm8960_controls,
> +       .num_controls =3D ARRAY_SIZE(an7581_wm8960_controls),
> +       .dapm_widgets =3D an7581_wm8960_widgets,
> +       .num_dapm_widgets =3D ARRAY_SIZE(an7581_wm8960_widgets),
> +};
> +
> +static int an7581_wm8960_machine_probe(struct platform_device *pdev)
> +{
> +       struct device_node *platform_dai_node, *codec_dai_node;
> +       struct snd_soc_card *card =3D &an7581_wm8960_card;
> +       struct device_node *platform, *codec;
> +       struct snd_soc_dai_link *dai_link;
> +       int ret, i;
> +
> +       card->dev =3D &pdev->dev;
> +
> +       platform =3D of_get_child_by_name(pdev->dev.of_node, "platform");
> +
> +       if (platform) {
> +               platform_dai_node =3D of_parse_phandle(platform, "sound-d=
ai", 0);
> +               of_node_put(platform);
> +
> +               if (!platform_dai_node) {
> +                       dev_err(&pdev->dev, "Failed to parse platform/sou=
nd-dai property\n");
> +                       return -EINVAL;
> +               }
> +       } else {
> +               dev_err(&pdev->dev, "Property 'platform' missing or inval=
id\n");
> +               return -EINVAL;
> +       }
> +
> +       for_each_card_prelinks(card, i, dai_link) {
> +               if (dai_link->platforms->name)
> +                       continue;
> +               dai_link->platforms->of_node =3D platform_dai_node;
> +       }
> +
> +       codec =3D of_get_child_by_name(pdev->dev.of_node, "codec");
> +
> +       if (codec) {
> +               codec_dai_node =3D of_parse_phandle(codec, "sound-dai", 0=
);
> +               of_node_put(codec);
> +
> +               if (!codec_dai_node) {
> +                       of_node_put(platform_dai_node);
> +                       dev_err(&pdev->dev, "Failed to parse codec/sound-=
dai property\n");
> +                       return -EINVAL;
> +               }
> +       } else {
> +               of_node_put(platform_dai_node);
> +               dev_err(&pdev->dev, "Property 'codec' missing or invalid\=
n");
> +               return -EINVAL;
> +       }
> +
> +       for_each_card_prelinks(card, i, dai_link) {
> +               if (dai_link->codecs->name)
> +                       continue;
> +               dai_link->codecs->of_node =3D codec_dai_node;
> +       }
> +
> +       ret =3D snd_soc_of_parse_audio_routing(card, "audio-routing");
> +       if (ret) {
> +               dev_err(&pdev->dev, "Failed to parse audio-routing: %d\n"=
, ret);
> +               goto err_of_node_put;
> +       }
> +
> +       ret =3D devm_snd_soc_register_card(&pdev->dev, card);
> +       if (ret) {
> +               dev_err_probe(&pdev->dev, ret, "%s snd_soc_register_card =
fail\n", __func__);
> +               goto err_of_node_put;
> +       }
> +
> +       return 0;
> +
> +err_of_node_put:
> +       of_node_put(platform_dai_node);
> +       of_node_put(codec_dai_node);
> +       return ret;
> +}
> +
> +static const struct of_device_id an7581_wm8960_machine_dt_match[] =3D {
> +       { .compatible =3D "airoha,an7581-wm8960-sound" },
> +       { /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, an7581_wm8960_machine_dt_match);
> +
> +static struct platform_driver an7581_wm8960_driver =3D {
> +       .driver =3D {
> +                  .name =3D "an7581-wm8960",
> +                  .of_match_table =3D an7581_wm8960_machine_dt_match,
> +       },
> +       .probe =3D an7581_wm8960_machine_probe,
> +};
> +module_platform_driver(an7581_wm8960_driver);
> +
> +MODULE_DESCRIPTION("Airoha SoC I2S platform driver for ALSA AN7581");
> +MODULE_LICENSE("GPL");

This machine driver seems very generic. Maybe you could get away with
using the audio graph drivers instead? It avoids tying the platform with
a specific codec just for boilerplate code.


ChenYu
