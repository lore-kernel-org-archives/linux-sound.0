Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F601CAA6F
	for <linux-sound@vger.kernel.org>; Mon, 13 Jan 2025 14:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736778705; cv=none; b=bIKeEFUoB10yAc/JZe2w/Qfsp1XywmKlgG0LlgPa6g9tu1DonTLU5a4Y9ETfrxtlQHo3fK+Kf4kvbeyNWC9h2/T6a7Is3QP6OoEsi7Bkm6P1qTOzeH6MQEiUs2WLcoIU0Rb0DkRmgdM5S5EWQSfLcJYeNf+auXTouJ3VoU+SjJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736778705; c=relaxed/simple;
	bh=DFMyj7BU0LMrEt4o+1e7ZtVDqKoOovhrtsLeqdJY0zY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=SXlJfkna5iWXA7HEEP+JGf2JvYbabems5mc+D830Yg+frAawTssK/CJALMavTAbZaleV5gn/3tJ44jneTz1AMEZDasSXzf0+lS9i8xAHr1GCrptg8XFuDrhtgNNOrRFpuaE//JH1g2H3LeL3tTWUClJHyg4/29IEig2DtHh+CsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=sotk+C82; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="sotk+C82"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4368a293339so50219575e9.3
        for <linux-sound@vger.kernel.org>; Mon, 13 Jan 2025 06:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736778700; x=1737383500; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tkJZOWdQ7DSSfWzIyKLMYvgbqLowNP+cyEYkO9/h/9A=;
        b=sotk+C822JyQUHZlVCBeMMLTwPhbX1FKnUjKRZ4e9jKWd630XR2Ya4u2zTRV0fwVEp
         1XL+cRygJ/W2PPbujm22l+qykMUPrLsPsmbjXwwXfGTpXifvPglllHA+sOD4+Fi654fj
         +l4U8pybUdykyZsE1mAWWsaPR1oeaXy2ULvwsVvTHzXdSuDCQG/Dfe2i5LvfX3MaoaTW
         L7zM+p4u35K+8LGDJSzy37jk2F+JhR9HAj9+vHn5IEfuqYDmknYoDrNPa6VU4m+zwp8v
         hSwI2J0/US0LhJRdWkZsZ9ucW+NIHCBPamimun/Bamwa6RyHVqUXFWWlTU9X6Dfi1Fbd
         w/iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736778700; x=1737383500;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tkJZOWdQ7DSSfWzIyKLMYvgbqLowNP+cyEYkO9/h/9A=;
        b=Wc8XOs78OI7qdQ9rGJvFVx+74PIBrHB35krrZ+6My/C384akQcUke1F+almdJvXlD+
         VlrsQeYXUVw7w5pvRhM4bpjsK89Z7EJNW6Rq0ZSURDDzzhcczv6gFtvDR3z/ZKgMfn1W
         OPu/YbUL7+7WDQ+4p+2AYO6hULUnnfuklulwtJJ998Ypp/U3zTTaSgZinUAjKSR/qg9D
         FuyNsHZzsNNpMpIoCF9jaarm+mDXZgeXseOF87fyD1/EelgEW+ZgTffrMZrDzeO2UUnJ
         w4nmvHf61a73/6YAJlQkJVgvlKnk1d15jmpNOTmw8bw/s7aFzSCkVgzbfF1YPXvJoEU7
         BAiA==
X-Forwarded-Encrypted: i=1; AJvYcCWHnPHIGyZTqggPgqsI0z+SiHH/j4iUDwkVjCpkywdqNN+Q7KFSVlAlINKyOmloXt2U7bA7KfqvDWmLoA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOJl8kjSURwDQ96fEUb4Ksym9dE+KWNudQ3Vu93KKrBdJchwhL
	gITRh6JEVRBVDFlI+j8n0+l395Io9m3dmRjZ6Q9SP525vEekVgyyk8Ra4qSAH4c=
X-Gm-Gg: ASbGncvfa2E+gBjYL9mFv0zEQSnYxsoyrbgZQuvPFnXSoVPTmKa1lgcL6uiL/TjsHuJ
	FJhkK5SOGdW9bdvccSGOY6fVzgXk4l8wDpNjkJNUTpBgsj1YAEZaABT7h/ymDZ3xi2gJGwNAHyv
	shfPGwxrV/7DTVZrZLUKRlpqfPG07hBLK/OUNbGEDLdvZimTaHF60rjHwh23gUN/Xue3/62aZv/
	Pl7lBYxa/sP8u5UuR/OQrJ4XNQgi+TfcluqcQxvZcXzDU8wKYKPaXle
X-Google-Smtp-Source: AGHT+IH5sJ5xFp1Qx36jmJXkEkjo1gH2JT5g2s2ZQM9VcCRmiSmu2sWdlu3uMuHB4dSa4Y2Ssfc6+Q==
X-Received: by 2002:a05:600c:46ce:b0:436:6ddf:7a27 with SMTP id 5b1f17b1804b1-436e27072a7mr170981525e9.23.1736778699604;
        Mon, 13 Jan 2025 06:31:39 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:9d2d:28cc:aafd:8429])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9dd1cc3sm144236365e9.14.2025.01.13.06.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 06:31:39 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: jiebing chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>,
  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>,  Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
  jiebing.chen@amlogic.com,  linux-sound@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 2/3] ASoC: meson: s4:support for the on-chip audio
In-Reply-To: <20250113-audio_drvier-v1-2-8c14770f38a0@amlogic.com> (jiebing
	chen via's message of "Mon, 13 Jan 2025 14:35:14 +0800")
References: <20250113-audio_drvier-v1-0-8c14770f38a0@amlogic.com>
	<20250113-audio_drvier-v1-2-8c14770f38a0@amlogic.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 13 Jan 2025 15:31:38 +0100
Message-ID: <1jwmey9451.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon 13 Jan 2025 at 14:35, jiebing chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org> wrote:

> From: jiebing chen <jiebing.chen@amlogic.com>
>
> Add audio support for Amlogic S4.The audio output pad
> can be freelycombined with the output lane,and the tocodec
> control logic has been optimized.

The patch is a mixture of different HW modules.

Each patch should have one clear purpose and, as such, deal with a
single HW module

>
> Signed-off-by: jiebing chen <jiebing.chen@amlogic.com>
> ---
>  sound/soc/meson/Kconfig              |  16 ++
>  sound/soc/meson/Makefile             |   6 +
>  sound/soc/meson/s4-pad-out-control.c | 372 ++++++++++++++++++++++++++++++++++
>  sound/soc/meson/s4-tocodec-control.c | 376 +++++++++++++++++++++++++++++++++++
>  sound/soc/meson/t9015.c              |   5 +-
>  5 files changed, 771 insertions(+), 4 deletions(-)
>
> diff --git a/sound/soc/meson/Kconfig b/sound/soc/meson/Kconfig
> index 6458d5dc4902f665211bb9e4ae7d274e4bff2fdc..d01e284642fd987cf4bdf88e5bf5f7c9a241af59 100644
> --- a/sound/soc/meson/Kconfig
> +++ b/sound/soc/meson/Kconfig
> @@ -69,6 +69,8 @@ config SND_MESON_AXG_SOUND_CARD
>  	imply SND_MESON_AXG_SPDIFIN
>  	imply SND_MESON_AXG_PDM
>  	imply SND_MESON_G12A_TOACODEC
> +	imply SND_SOC_MESON_PAD_OUT
> +	imply SND_SOC_MESON_TOCODEC_CONTROL
>  	imply SND_MESON_G12A_TOHDMITX if DRM_MESON_DW_HDMI
>  	help
>  	  Select Y or M to add support for the AXG SoC sound card
> @@ -135,4 +137,18 @@ config SND_SOC_MESON_T9015
>  	help
>  	  Say Y or M if you want to add support for the internal DAC found
>  	  on GXL, G12 and SM1 SoC family.
> +
> +config SND_SOC_MESON_PAD_OUT
> +	tristate "Amlogic PAD OUT"
> +	select REGMAP_MMIO
> +	help
> +	  Say Y or M if you want to add support for the S4 Audio Output from
> +	  the data Pad.
> +
> +config SND_SOC_MESON_TOCODEC_CONTROL
> +	tristate "Amlogic TOCODEC CONTROL"
> +	select REGMAP_MMIO
> +	help
> +	 Say Y or M if you want to add support for the internal DAC control
> +	 on SM1 SoC family.
>  endmenu
> diff --git a/sound/soc/meson/Makefile b/sound/soc/meson/Makefile
> index 24078e4396b02d545d8ba4bcb1632979001354e3..afbefcb1313670f9b1365e88b8eb1a0badd7dc1e 100644
> --- a/sound/soc/meson/Makefile
> +++ b/sound/soc/meson/Makefile
> @@ -24,8 +24,11 @@ snd-soc-meson-codec-glue-y := meson-codec-glue.o
>  snd-soc-meson-gx-sound-card-y := gx-card.o
>  snd-soc-meson-g12a-toacodec-y := g12a-toacodec.o
>  snd-soc-meson-g12a-tohdmitx-y := g12a-tohdmitx.o
> +snd-soc-meson-s4-padout-objs := s4-pad-out-control.o
> +snd-soc-meson-s4-tocodec-control-objs := s4-tocodec-control.o
>  snd-soc-meson-t9015-y := t9015.o
>  
> +
>  obj-$(CONFIG_SND_MESON_AIU) += snd-soc-meson-aiu.o
>  obj-$(CONFIG_SND_MESON_AXG_FIFO) += snd-soc-meson-axg-fifo.o
>  obj-$(CONFIG_SND_MESON_AXG_FRDDR) += snd-soc-meson-axg-frddr.o
> @@ -43,4 +46,7 @@ obj-$(CONFIG_SND_MESON_CODEC_GLUE) += snd-soc-meson-codec-glue.o
>  obj-$(CONFIG_SND_MESON_GX_SOUND_CARD) += snd-soc-meson-gx-sound-card.o
>  obj-$(CONFIG_SND_MESON_G12A_TOACODEC) += snd-soc-meson-g12a-toacodec.o
>  obj-$(CONFIG_SND_MESON_G12A_TOHDMITX) += snd-soc-meson-g12a-tohdmitx.o
> +obj-$(CONFIG_SND_SOC_MESON_PAD_OUT) += snd-soc-meson-s4-padout.o
> +obj-$(CONFIG_SND_SOC_MESON_TOCODEC_CONTROL) += snd-soc-meson-s4-tocodec-control.o
>  obj-$(CONFIG_SND_SOC_MESON_T9015) += snd-soc-meson-t9015.o
> +
> diff --git a/sound/soc/meson/s4-pad-out-control.c b/sound/soc/meson/s4-pad-out-control.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..a86dcf8a5995926f0ddf8d2911f42006daed0feb
> --- /dev/null
> +++ b/sound/soc/meson/s4-pad-out-control.c
> @@ -0,0 +1,372 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
> +/*
> + * Copyright (C) 2024 Amlogic, Inc. All rights reserved
> + */
> +
> +#include <linux/module.h>
> +#include <linux/of_platform.h>
> +#include <linux/regmap.h>
> +#include <sound/soc.h>
> +#include <sound/soc-dai.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include<linux/kstrtox.h>
> +
> +#include "axg-tdm.h"
> +
> +static const struct regmap_config tdmout_pad_regmap_cfg = {
> +	.reg_bits	= 32,
> +	.val_bits	= 32,
> +	.reg_stride	= 4,
> +	.max_register	= 0x28,
> +};
> +
> +#define TDM_IFACE 0
> +#define TDM_A_PAD 0
> +#define TDM_B_PAD 1
> +#define TDM_C_PAD 2
> +
> +#define EE_AUDIO_DAT_PAD_CTRL6 0x0
> +#define EE_AUDIO_DAT_PAD_CTRL7 0x4
> +#define EE_AUDIO_DAT_PAD_CTRL8 0x8
> +#define EE_AUDIO_DAT_PAD_CTRL9 0xc
> +#define EE_AUDIO_DAT_PAD_CTRLA 0x10
> +#define EE_AUDIO_DAT_PAD_CTRLB 0x14
> +#define EE_AUDIO_DAT_PAD_CTRLC 0x1c
> +#define EE_AUDIO_DAT_PAD_CTRLD 0x20
> +#define EE_AUDIO_DAT_PAD_CTRLE 0x24
> +#define EE_AUDIO_DAT_PAD_CTRLF 0x28
> +
> +#define REG_OFFSET 4
> +
> +static const char * const s4_tdmout_sel_texts[] = {
> +	"TDM_D0", "TDM_D1", "TDM_D2", "TDM_D3", "TDM_D4", "TDM_D5", "TDM_D6", "TDM_D7",
> +	"TDM_D8", "TDM_D9", "TDM_D10", "TDM_D11", "TDM_D12", "TDM_D13", "TDM_D14", "TDM_D15",
> +	"TDM_D16", "TDM_D17", "TDM_D18", "TDM_D19", "TDM_D20", "TDM_D21", "TDM_D22", "TDM_D23",
> +	"TDM_D24", "TDM_D25", "TDM_D26", "TDM_D27", "TDM_D28", "TDM_D29", "TDM_D30", "TDM_D31"
> +};

This thing does not belong in ASoC. This is clearly yet another layer of
pinctrl. Please deal with it there.


> +
> +static const struct soc_enum tdmout_sel_enum =
> +	SOC_ENUM_SINGLE(SND_SOC_NOPM, 0, ARRAY_SIZE(s4_tdmout_sel_texts),
> +			s4_tdmout_sel_texts);
> +
> +static struct snd_soc_dai *tdm_get_ahead_be(struct snd_soc_dapm_widget *w)
> +{
> +	struct snd_soc_dapm_path *p;
> +	struct snd_soc_dai *be;
> +
> +	snd_soc_dapm_widget_for_each_source_path(w, p) {
> +		if (p->source->id == snd_soc_dapm_dai_in)
> +			return (struct snd_soc_dai *)p->source->priv;
> +		be = tdm_get_ahead_be(p->source);
> +		if (be && be->id == TDM_IFACE)
> +			return be;
> +	}
> +	return NULL;
> +}
> +
> +#define SND_SOC_DAPM_DEMUX_E(wname, wreg, wshift, winvert, wcontrols, \
> +	wevent, wflags) \
> +((struct snd_soc_dapm_widget) { \
> +	.id = snd_soc_dapm_demux, .name = wname, \
> +	SND_SOC_DAPM_INIT_REG_VAL(wreg, wshift, winvert), \
> +	.kcontrol_news = wcontrols, .num_kcontrols = 1, \
> +	.event = wevent, .event_flags = wflags})
> +
> +static const struct snd_kcontrol_new tdmout_sel_demux[] = {
> +	SOC_DAPM_ENUM("TDMOUTA SEL", tdmout_sel_enum),
> +	SOC_DAPM_ENUM("TDMOUTB SEL", tdmout_sel_enum),
> +	SOC_DAPM_ENUM("TDMOUTC SEL", tdmout_sel_enum),
> +};
> +
> +static unsigned int aml_simple_strtoull(const char *cp)
> +{
> +	unsigned int result = 0;
> +	unsigned int value = 0;
> +	unsigned int len =  strlen(cp);
> +
> +	while (len != 0) {
> +		len--;
> +		value = isdigit(*cp);
> +		if (value) {
> +			value = *cp - '0';
> +		} else {
> +			cp++;
> +			continue;
> +		}
> +		cp++;
> +		result = result * 10 + value;
> +	}
> +	return result;
> +}
> +
> +static int tdm_out_pad_set(struct snd_soc_dapm_widget *w)
> +{
> +	struct snd_soc_dai *be;
> +	struct axg_tdm_stream *stream;
> +	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
> +	unsigned int tdm_id = TDM_A_PAD;
> +	const char *dai_widget_name;
> +	struct snd_soc_dapm_path *p;
> +	unsigned int lane_num = 0;
> +	unsigned long pin = 0;
> +	unsigned int reg, mask, val = 0;
> +	int lane_cnt;
> +
> +	be = tdm_get_ahead_be(w);
> +	if (!be) {
> +		dev_err(component->dev, "%s not find the be\n", __func__);
> +		return -EINVAL;
> +	}
> +	stream = snd_soc_dai_dma_data_get_playback(be);
> +	if (!stream) {
> +		dev_err(component->dev, "%s not find the stream\n", __func__);
> +		return -EINVAL;
> +	}
> +	lane_cnt = (stream->channels - 1) / stream->iface->slots + 1;
> +	/*we like to use dai id, but it is fixed val*/
> +	dai_widget_name = be->stream[SNDRV_PCM_STREAM_PLAYBACK].widget->name;
> +	if (strstr(dai_widget_name, "TDM_A"))
> +		tdm_id = TDM_A_PAD;
> +	else if (strstr(dai_widget_name, "TDM_B"))
> +		tdm_id = TDM_B_PAD;
> +	else if (strstr(dai_widget_name, "TDM_C"))
> +		tdm_id = TDM_C_PAD;
> +	else
> +		dev_err(component->dev, "%s not find the be dai widget\n", __func__);
> +	dev_dbg(component->dev, "tdm_id:%d, channel:%d, slot:%d\n",
> +		tdm_id, stream->channels, stream->iface->slots);
> +	snd_soc_dapm_widget_for_each_sink_path(w, p) {
> +		if (p->sink->id == snd_soc_dapm_output) {
> +			if (p->connect) {
> +				pin = aml_simple_strtoull(p->name);
> +				reg = (pin / 4) * REG_OFFSET;
> +				/*calculate mask pos */
> +				mask = 0x1f << ((pin % 4) * 8);
> +				val = tdm_id * 8 + lane_num;
> +				snd_soc_component_update_bits(component, reg, mask, val);
> +				snd_soc_component_update_bits(component, EE_AUDIO_DAT_PAD_CTRLF,
> +							      0x1 << pin, 0 << pin);
> +				lane_num++;
> +				if (lane_num > lane_cnt - 1)
> +					break;
> +			}
> +		}
> +	}
> +	return 0;
> +}
> +
> +static int tdmout_sel_pad_event(struct snd_soc_dapm_widget *w,
> +				struct snd_kcontrol *control,
> +				int event)
> +{
> +	int ret = 0;
> +	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_PRE_PMU:
> +		tdm_out_pad_set(w);
> +		break;
> +
> +	case SND_SOC_DAPM_PRE_PMD:
> +		break;
> +
> +	default:
> +		dev_err(component->dev, "Unexpected event %d\n", event);
> +		return -EINVAL;
> +	}
> +
> +	return ret;
> +}
> +
> +static const struct snd_soc_dapm_widget s4_tdmout_pad_dapm_widgets[] = {
> +	SND_SOC_DAPM_DEMUX_E("TDMA_OUT SEL", SND_SOC_NOPM, 0, 0,
> +			     &tdmout_sel_demux[TDM_A_PAD], tdmout_sel_pad_event,
> +			   (SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_PRE_PMD)),
> +	SND_SOC_DAPM_DEMUX_E("TDMB_OUT SEL", SND_SOC_NOPM, 0, 0,
> +			     &tdmout_sel_demux[TDM_B_PAD], tdmout_sel_pad_event,
> +			   (SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_PRE_PMD)),
> +	SND_SOC_DAPM_DEMUX_E("TDMC_OUT SEL", SND_SOC_NOPM, 0, 0,
> +			     &tdmout_sel_demux[TDM_C_PAD], tdmout_sel_pad_event,
> +			   (SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_PRE_PMD)),
> +	SND_SOC_DAPM_OUTPUT("TDM_D0"),
> +	SND_SOC_DAPM_OUTPUT("TDM_D1"),
> +	SND_SOC_DAPM_OUTPUT("TDM_D2"),
> +	SND_SOC_DAPM_OUTPUT("TDM_D3"),
> +	SND_SOC_DAPM_OUTPUT("TDM_D4"),
> +	SND_SOC_DAPM_OUTPUT("TDM_D5"),
> +	SND_SOC_DAPM_OUTPUT("TDM_D6"),
> +	SND_SOC_DAPM_OUTPUT("TDM_D7"),
> +	SND_SOC_DAPM_OUTPUT("TDM_D8"),
> +	SND_SOC_DAPM_OUTPUT("TDM_D9"),
> +	SND_SOC_DAPM_OUTPUT("TDM_D10"),
> +	SND_SOC_DAPM_OUTPUT("TDM_D11"),
> +	SND_SOC_DAPM_OUTPUT("TDM_D12"),
> +	SND_SOC_DAPM_OUTPUT("TDM_D13"),
> +	SND_SOC_DAPM_OUTPUT("TDM_D14"),
> +	SND_SOC_DAPM_OUTPUT("TDM_D15"),
> +	SND_SOC_DAPM_OUTPUT("TDM_D16"),
> +	SND_SOC_DAPM_OUTPUT("TDM_D17"),
> +	SND_SOC_DAPM_OUTPUT("TDM_D18"),
> +	SND_SOC_DAPM_OUTPUT("TDM_D19"),
> +	SND_SOC_DAPM_OUTPUT("TDM_D20"),
> +	SND_SOC_DAPM_OUTPUT("TDM_D21"),
> +	SND_SOC_DAPM_OUTPUT("TDM_D22"),
> +	SND_SOC_DAPM_OUTPUT("TDM_D23"),
> +	SND_SOC_DAPM_OUTPUT("TDM_D24"),
> +	SND_SOC_DAPM_OUTPUT("TDM_D25"),
> +	SND_SOC_DAPM_OUTPUT("TDM_D26"),
> +	SND_SOC_DAPM_OUTPUT("TDM_D27"),
> +	SND_SOC_DAPM_OUTPUT("TDM_D28"),
> +	SND_SOC_DAPM_OUTPUT("TDM_D29"),
> +	SND_SOC_DAPM_OUTPUT("TDM_D30"),
> +	SND_SOC_DAPM_OUTPUT("TDM_D31"),
> +};
> +
> +static const struct snd_soc_dapm_route s4_tdmout_pad_dapm_routes[] = {
> +	{ "TDM_D0", "TDM_D0", "TDMA_OUT SEL" },
> +	{ "TDM_D1", "TDM_D1", "TDMA_OUT SEL" },
> +	{ "TDM_D2", "TDM_D2", "TDMA_OUT SEL" },
> +	{ "TDM_D3", "TDM_D3", "TDMA_OUT SEL" },
> +	{ "TDM_D4", "TDM_D4", "TDMA_OUT SEL" },
> +	{ "TDM_D5", "TDM_D5", "TDMA_OUT SEL" },
> +	{ "TDM_D6", "TDM_D6", "TDMA_OUT SEL" },
> +	{ "TDM_D7", "TDM_D7", "TDMA_OUT SEL" },
> +	{ "TDM_D8", "TDM_D8", "TDMA_OUT SEL" },
> +	{ "TDM_D9", "TDM_D9", "TDMA_OUT SEL" },
> +	{ "TDM_D10", "TDM_D10", "TDMA_OUT SEL" },
> +	{ "TDM_D11", "TDM_D11", "TDMA_OUT SEL" },
> +	{ "TDM_D12", "TDM_D12", "TDMA_OUT SEL" },
> +	{ "TDM_D13", "TDM_D13", "TDMA_OUT SEL" },
> +	{ "TDM_D14", "TDM_D14", "TDMA_OUT SEL" },
> +	{ "TDM_D15", "TDM_D15", "TDMA_OUT SEL" },
> +	{ "TDM_D16", "TDM_D16", "TDMA_OUT SEL" },
> +	{ "TDM_D17", "TDM_D17", "TDMA_OUT SEL" },
> +	{ "TDM_D18", "TDM_D18", "TDMA_OUT SEL" },
> +	{ "TDM_D19", "TDM_D19", "TDMA_OUT SEL" },
> +	{ "TDM_D20", "TDM_D20", "TDMA_OUT SEL" },
> +	{ "TDM_D21", "TDM_D21", "TDMA_OUT SEL" },
> +	{ "TDM_D22", "TDM_D22", "TDMA_OUT SEL" },
> +	{ "TDM_D23", "TDM_D23", "TDMA_OUT SEL" },
> +	{ "TDM_D24", "TDM_D24", "TDMA_OUT SEL" },
> +	{ "TDM_D25", "TDM_D25", "TDMA_OUT SEL" },
> +	{ "TDM_D26", "TDM_D26", "TDMA_OUT SEL" },
> +	{ "TDM_D27", "TDM_D27", "TDMA_OUT SEL" },
> +	{ "TDM_D28", "TDM_D28", "TDMA_OUT SEL" },
> +	{ "TDM_D29", "TDM_D29", "TDMA_OUT SEL" },
> +	{ "TDM_D30", "TDM_D30", "TDMA_OUT SEL" },
> +	{ "TDM_D31", "TDM_D31", "TDMA_OUT SEL" },
> +	{ "TDM_D0", "TDM_D0", "TDMB_OUT SEL" },
> +	{ "TDM_D1", "TDM_D1", "TDMB_OUT SEL" },
> +	{ "TDM_D2", "TDM_D2", "TDMB_OUT SEL" },
> +	{ "TDM_D3", "TDM_D3", "TDMB_OUT SEL" },
> +	{ "TDM_D4", "TDM_D4", "TDMB_OUT SEL" },
> +	{ "TDM_D5", "TDM_D5", "TDMB_OUT SEL" },
> +	{ "TDM_D6", "TDM_D6", "TDMB_OUT SEL" },
> +	{ "TDM_D7", "TDM_D7", "TDMB_OUT SEL" },
> +	{ "TDM_D8", "TDM_D8", "TDMB_OUT SEL" },
> +	{ "TDM_D9", "TDM_D9", "TDMB_OUT SEL" },
> +	{ "TDM_D10", "TDM_D10", "TDMB_OUT SEL" },
> +	{ "TDM_D11", "TDM_D11", "TDMB_OUT SEL" },
> +	{ "TDM_D12", "TDM_D12", "TDMB_OUT SEL" },
> +	{ "TDM_D13", "TDM_D13", "TDMB_OUT SEL" },
> +	{ "TDM_D14", "TDM_D14", "TDMB_OUT SEL" },
> +	{ "TDM_D15", "TDM_D15", "TDMB_OUT SEL" },
> +
> +	{ "TDM_D16", "TDM_D16", "TDMB_OUT SEL" },
> +	{ "TDM_D17", "TDM_D17", "TDMB_OUT SEL" },
> +	{ "TDM_D18", "TDM_D18", "TDMB_OUT SEL" },
> +	{ "TDM_D19", "TDM_D19", "TDMB_OUT SEL" },
> +	{ "TDM_D20", "TDM_D20", "TDMB_OUT SEL" },
> +	{ "TDM_D21", "TDM_D21", "TDMB_OUT SEL" },
> +	{ "TDM_D22", "TDM_D22", "TDMB_OUT SEL" },
> +	{ "TDM_D23", "TDM_D23", "TDMB_OUT SEL" },
> +	{ "TDM_D24", "TDM_D24", "TDMB_OUT SEL" },
> +	{ "TDM_D25", "TDM_D25", "TDMB_OUT SEL" },
> +	{ "TDM_D26", "TDM_D26", "TDMB_OUT SEL" },
> +	{ "TDM_D27", "TDM_D27", "TDMB_OUT SEL" },
> +	{ "TDM_D28", "TDM_D28", "TDMB_OUT SEL" },
> +	{ "TDM_D29", "TDM_D29", "TDMB_OUT SEL" },
> +	{ "TDM_D30", "TDM_D30", "TDMB_OUT SEL" },
> +	{ "TDM_D31", "TDM_D31", "TDMB_OUT SEL" },
> +	{ "TDM_D0", "TDM_D0", "TDMC_OUT SEL" },
> +	{ "TDM_D1", "TDM_D1", "TDMC_OUT SEL" },
> +	{ "TDM_D2", "TDM_D2", "TDMC_OUT SEL" },
> +	{ "TDM_D3", "TDM_D3", "TDMC_OUT SEL" },
> +	{ "TDM_D4", "TDM_D4", "TDMC_OUT SEL" },
> +	{ "TDM_D5", "TDM_D5", "TDMC_OUT SEL" },
> +	{ "TDM_D6", "TDM_D6", "TDMC_OUT SEL" },
> +	{ "TDM_D7", "TDM_D7", "TDMC_OUT SEL" },
> +	{ "TDM_D8", "TDM_D8", "TDMC_OUT SEL" },
> +	{ "TDM_D9", "TDM_D9", "TDMC_OUT SEL" },
> +	{ "TDM_D10", "TDM_D10", "TDMC_OUT SEL" },
> +	{ "TDM_D11", "TDM_D11", "TDMC_OUT SEL" },
> +	{ "TDM_D12", "TDM_D12", "TDMC_OUT SEL" },
> +	{ "TDM_D13", "TDM_D13", "TDMC_OUT SEL" },
> +	{ "TDM_D14", "TDM_D14", "TDMC_OUT SEL" },
> +	{ "TDM_D15", "TDM_D15", "TDMC_OUT SEL" },
> +	{ "TDM_D16", "TDM_D16", "TDMC_OUT SEL" },
> +	{ "TDM_D17", "TDM_D17", "TDMC_OUT SEL" },
> +	{ "TDM_D18", "TDM_D18", "TDMC_OUT SEL" },
> +	{ "TDM_D19", "TDM_D19", "TDMC_OUT SEL" },
> +	{ "TDM_D20", "TDM_D20", "TDMC_OUT SEL" },
> +	{ "TDM_D21", "TDM_D21", "TDMC_OUT SEL" },
> +	{ "TDM_D22", "TDM_D22", "TDMC_OUT SEL" },
> +	{ "TDM_D23", "TDM_D23", "TDMC_OUT SEL" },
> +	{ "TDM_D24", "TDM_D24", "TDMC_OUT SEL" },
> +	{ "TDM_D25", "TDM_D25", "TDMC_OUT SEL" },
> +	{ "TDM_D26", "TDM_D26", "TDMC_OUT SEL" },
> +	{ "TDM_D27", "TDM_D27", "TDMC_OUT SEL" },
> +	{ "TDM_D28", "TDM_D28", "TDMC_OUT SEL" },
> +	{ "TDM_D29", "TDM_D29", "TDMC_OUT SEL" },
> +	{ "TDM_D30", "TDM_D30", "TDMC_OUT SEL" },
> +	{ "TDM_D31", "TDM_D31", "TDMC_OUT SEL" },
> +};
> +
> +static const struct snd_soc_component_driver s4_tdmout_pad_component_drv = {
> +	.dapm_widgets		= s4_tdmout_pad_dapm_widgets,
> +	.num_dapm_widgets	= ARRAY_SIZE(s4_tdmout_pad_dapm_widgets),
> +	.dapm_routes		= s4_tdmout_pad_dapm_routes,
> +	.num_dapm_routes	= ARRAY_SIZE(s4_tdmout_pad_dapm_routes),
> +
> +};
> +
> +static const struct of_device_id s4_tdmout_pad_of_match[] = {
> +	{
> +		.compatible = "amlogic,s4-tdmout-pad",
> +	}, {}
> +};
> +
> +MODULE_DEVICE_TABLE(of, s4_tdmout_pad_of_match);
> +
> +static int tdm_pad_out_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct regmap *map;
> +	void __iomem *regs;
> +
> +	regs = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(regs))
> +		return PTR_ERR(regs);
> +
> +	map = devm_regmap_init_mmio(dev, regs, &tdmout_pad_regmap_cfg);
> +	if (IS_ERR(map))
> +		return dev_err_probe(dev, PTR_ERR(map), "failed to init regmap\n");
> +
> +	return devm_snd_soc_register_component(dev, &s4_tdmout_pad_component_drv,
> +					       NULL, 0);
> +}
> +
> +static struct platform_driver tdmout_pad_pdrv = {
> +	.probe = tdm_pad_out_probe,
> +	.driver = {
> +		.name = "s4-pad-out",
> +		.of_match_table = s4_tdmout_pad_of_match,
> +	},
> +};
> +
> +module_platform_driver(tdmout_pad_pdrv);
> +
> +MODULE_DESCRIPTION("Amlogic TDM PAD DRIVER");
> +MODULE_AUTHOR("jiebing.chen@amlogic.com");
> +MODULE_LICENSE("GPL");
> diff --git a/sound/soc/meson/s4-tocodec-control.c b/sound/soc/meson/s4-tocodec-control.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..e5d824fae0eba545d38dc36e2566e7cee590e7f5
> --- /dev/null
> +++ b/sound/soc/meson/s4-tocodec-control.c

There is already a to-acodec driver a not reason has been provided as to why a
completly new driver is required.

Please have look at the existing driver and do try to use it.
If you need to do things so differently, clear justification are necessary.

> @@ -0,0 +1,376 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
> +/*
> + * Copyright (C) 2023 Amlogic, Inc. All rights reserved
> + */
> +
> +#include <linux/module.h>
> +#include <linux/of_platform.h>
> +#include <linux/regmap.h>
> +#include <sound/soc.h>
> +#include <sound/soc-dai.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include<linux/kstrtox.h>
> +#include <linux/clk-provider.h>
> +#include <linux/reset.h>
> +#include "axg-tdm.h"
> +
> +#define TOACODEC_CTRL0			0x0
> +
> +#define CTRL0_ENABLE_SHIFT		31
> +#define CTRL0_BCLK_ENABLE_SHIFT		30
> +#define CTRL0_MCLK_ENABLE_SHIFT		29
> +#define CTRL0_BLK_CAP_INV_SHIFT		9
> +
> +#define TDM_IFACE 0
> +#define TDM_A_PAD 0
> +#define TDM_B_PAD 1
> +#define TDM_C_PAD 2
> +
> +struct toacodec {
> +	struct regmap_field *field_dat_sel;
> +	struct regmap_field *field_lrclk_sel;
> +	struct regmap_field *field_bclk_sel;
> +	struct regmap_field *field_mclk_sel;
> +};
> +
> +struct toacodec_match_data {
> +	const struct snd_soc_component_driver *component_drv;
> +	const struct reg_field field_dat_sel;
> +	const struct reg_field field_lrclk_sel;
> +	const struct reg_field field_bclk_sel;
> +	const struct reg_field field_mclk_sel;
> +};
> +
> +static const struct regmap_config tocodec_regmap_cfg = {
> +	.reg_bits	= 32,
> +	.val_bits	= 32,
> +	.reg_stride	= 4,
> +	.max_register	= 0x1,
> +};
> +
> +#define S4_LANE_OFFSET 8
> +
> +static const char * const s4_tocodec_lane_sel_texts[] = {
> +	"Lane0", "Lane1", "Lane2", "Lane3", "Lane4", "Lane5", "Lane6", "Lane7"
> +};
> +
> +static const struct soc_enum s4_tocodec_lane_sel_enum =
> +	SOC_ENUM_SINGLE(SND_SOC_NOPM, 0, ARRAY_SIZE(s4_tocodec_lane_sel_texts),
> +			s4_tocodec_lane_sel_texts);
> +
> +static const struct snd_kcontrol_new s4_tocodec_lane_sel =
> +	SOC_DAPM_ENUM("TOCODEC LANE SEL", s4_tocodec_lane_sel_enum);
> +
> +static const char * const s4_tocodec_src_sel_texts[] = {
> +	"TDMA", "TDMB", "TDMC"
> +};
> +
> +static const struct soc_enum s4_tocodec_src_sel_enum =
> +	SOC_ENUM_SINGLE(SND_SOC_NOPM, 0, ARRAY_SIZE(s4_tocodec_src_sel_texts),
> +			s4_tocodec_src_sel_texts);
> +
> +static const struct snd_kcontrol_new s4_tocodec_src_sel =
> +	SOC_DAPM_ENUM("TOCODEC SEL", s4_tocodec_src_sel_enum);
> +
> +static const struct snd_kcontrol_new s4_toacodec_out_enable =
> +	SOC_DAPM_SINGLE_AUTODISABLE("Switch", TOACODEC_CTRL0,
> +				    CTRL0_ENABLE_SHIFT, 1, 0);
> +
> +static struct snd_soc_dai *tocodec_tdm_get_ahead_be(struct snd_soc_dapm_widget *w)
> +{
> +	struct snd_soc_dapm_path *p;
> +	struct snd_soc_dai *be;
> +
> +	snd_soc_dapm_widget_for_each_source_path(w, p) {
> +		if (!p->connect)
> +			continue;
> +		if (p->source->id == snd_soc_dapm_dai_in)
> +			return (struct snd_soc_dai *)p->source->priv;
> +		be = tocodec_tdm_get_ahead_be(p->source);
> +		if (be && be->id == TDM_IFACE)
> +			return be;
> +	}
> +	return NULL;
> +}
> +
> +static unsigned int aml_simple_strtoull(const char *cp)
> +{
> +	unsigned int result = 0;
> +	unsigned int value = 0;
> +	unsigned int len = strlen(cp);
> +
> +	while (len != 0) {
> +		len--;
> +		value = isdigit(*cp);
> +		if (value) {
> +			value = *cp - '0';
> +		} else {
> +			cp++;
> +			continue;
> +		}
> +		cp++;
> +		result = result * 10 + value;
> +	}
> +	return result;
> +}
> +
> +static int aml_get_clk_id(const char *name)
> +{
> +	int clk_id = 0;
> +
> +	if (strstr(name, "mst_a"))
> +		clk_id = 0;
> +	else if (strstr(name, "mst_b"))
> +		clk_id = 1;
> +	else if (strstr(name, "mst_c"))
> +		clk_id = 2;
> +	else if (strstr(name, "mst_d"))
> +		clk_id = 3;
> +	else if (strstr(name, "mst_e"))
> +		clk_id = 4;
> +	else if (strstr(name, "mst_f"))
> +		clk_id = 5;
> +
> +	return clk_id;
> +}
> +
> +static int aml_tocodec_sel_set(struct snd_soc_dapm_widget *w)
> +{
> +	struct snd_soc_dai *be;
> +	struct axg_tdm_stream *stream;
> +	struct axg_tdm_iface *iface;
> +	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
> +	struct toacodec *priv = snd_soc_component_get_drvdata(component);
> +	unsigned int tdm_id = TDM_A_PAD;
> +	const char *dai_widget_name;
> +	struct snd_soc_dapm_path *p;
> +	unsigned int lane = 0;
> +	unsigned int val = 0;
> +	struct clk *sclk, *mclk;
> +	char *clk_name;
> +	int mclk_id, sclk_id;
> +
> +	be = tocodec_tdm_get_ahead_be(w);
> +	if (!be) {
> +		dev_err(component->dev, "%s not find the be\n", __func__);
> +		return -EINVAL;
> +	}
> +	stream = snd_soc_dai_dma_data_get_playback(be);
> +	if (!stream) {
> +		dev_err(component->dev, "%s not find the stream\n", __func__);
> +		return -EINVAL;
> +	}
> +	/*we like to use dai id, but it is fixed val*/
> +	dai_widget_name = be->stream[SNDRV_PCM_STREAM_PLAYBACK].widget->name;
> +	if (strstr(dai_widget_name, "TDM_A"))
> +		tdm_id = TDM_A_PAD;
> +	else if (strstr(dai_widget_name, "TDM_B"))
> +		tdm_id = TDM_B_PAD;
> +	else if (strstr(dai_widget_name, "TDM_C"))
> +		tdm_id = TDM_C_PAD;
> +	snd_soc_dapm_widget_for_each_source_path(w, p) {
> +		if (p->connect && p->name) {
> +			lane = aml_simple_strtoull(p->name);
> +			val = lane + tdm_id * S4_LANE_OFFSET;
> +			regmap_field_write(priv->field_dat_sel, val);
> +		}
> +	}
> +	iface = stream->iface;
> +	mclk = iface->mclk;
> +	sclk = iface->sclk;
> +	mclk_id = aml_get_clk_id(__clk_get_name(mclk));
> +	sclk_id = aml_get_clk_id(__clk_get_name(sclk));
> +	regmap_field_write(priv->field_mclk_sel, mclk_id);
> +	regmap_field_write(priv->field_bclk_sel, sclk_id);
> +	regmap_field_write(priv->field_lrclk_sel, sclk_id);
> +
> +	return 0;
> +}
> +
> +static int tocodec_sel_event(struct snd_soc_dapm_widget *w,
> +			     struct snd_kcontrol *control,
> +			     int event)
> +{
> +	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
> +	int ret = 0;
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_PRE_PMU:
> +		ret = aml_tocodec_sel_set(w);
> +		break;
> +
> +	case SND_SOC_DAPM_PRE_PMD:
> +		break;
> +
> +	default:
> +		dev_err(component->dev, "Unexpected event %d\n", event);
> +		return -EINVAL;
> +	}
> +
> +	return ret;
> +}
> +
> +static int tocodec_clk_enable(struct snd_soc_dapm_widget *w,
> +			      struct snd_kcontrol *control,
> +			      int event)
> +{
> +	int ret = 0;
> +	unsigned int mask = 0, val = 0;
> +	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
> +
> +	snd_soc_component_update_bits(component, TOACODEC_CTRL0,
> +				      1 << CTRL0_BLK_CAP_INV_SHIFT, 1 << CTRL0_BLK_CAP_INV_SHIFT);
> +	switch (event) {
> +	case SND_SOC_DAPM_PRE_PMU:
> +		mask = 1 << CTRL0_MCLK_ENABLE_SHIFT | 1 << CTRL0_BCLK_ENABLE_SHIFT;
> +		val = 1 << CTRL0_MCLK_ENABLE_SHIFT | 1 << CTRL0_BCLK_ENABLE_SHIFT;
> +		snd_soc_component_update_bits(component, TOACODEC_CTRL0, mask, val);
> +		break;
> +	case SND_SOC_DAPM_PRE_PMD:
> +		mask = 1 << CTRL0_MCLK_ENABLE_SHIFT | 1 << CTRL0_BCLK_ENABLE_SHIFT;
> +		val = 0 << CTRL0_MCLK_ENABLE_SHIFT | 0 << CTRL0_BCLK_ENABLE_SHIFT;
> +		snd_soc_component_update_bits(component, TOACODEC_CTRL0, mask, val);
> +		break;
> +	default:
> +		dev_err(component->dev, "Unexpected event %d\n", event);
> +		return -EINVAL;
> +	}
> +
> +	return ret;
> +}
> +
> +static const struct snd_soc_dapm_widget s4_toacodec_widgets[] = {
> +	SND_SOC_DAPM_MUX_E("Lane SRC", SND_SOC_NOPM, 0, 0,
> +			   &s4_tocodec_lane_sel, tocodec_sel_event,
> +			   (SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_PRE_PMD)),
> +	SND_SOC_DAPM_MUX("INPUT SRC", SND_SOC_NOPM, 0, 0, &s4_tocodec_src_sel),
> +	SND_SOC_DAPM_SWITCH_E("OUT EN", SND_SOC_NOPM, 0, 0,
> +			      &s4_toacodec_out_enable, tocodec_clk_enable,
> +				(SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_PRE_PMD)),
> +	SND_SOC_DAPM_AIF_IN("TDMA", NULL, 0, SND_SOC_NOPM, 0, 0),
> +	SND_SOC_DAPM_AIF_IN("TDMB", NULL, 0, SND_SOC_NOPM, 0, 0),
> +	SND_SOC_DAPM_AIF_IN("TDMC", NULL, 0, SND_SOC_NOPM, 0, 0),
> +	SND_SOC_DAPM_OUT_DRV("Lane0", SND_SOC_NOPM, 0, 0, NULL, 0),
> +	SND_SOC_DAPM_OUT_DRV("Lane1", SND_SOC_NOPM, 0, 0, NULL, 0),
> +	SND_SOC_DAPM_OUT_DRV("Lane2", SND_SOC_NOPM, 0, 0, NULL, 0),
> +	SND_SOC_DAPM_OUT_DRV("Lane3", SND_SOC_NOPM, 0, 0, NULL, 0),
> +	SND_SOC_DAPM_OUT_DRV("Lane4", SND_SOC_NOPM, 0, 0, NULL, 0),
> +	SND_SOC_DAPM_OUT_DRV("Lane5", SND_SOC_NOPM, 0, 0, NULL, 0),
> +	SND_SOC_DAPM_OUT_DRV("Lane6", SND_SOC_NOPM, 0, 0, NULL, 0),
> +	SND_SOC_DAPM_OUT_DRV("Lane7", SND_SOC_NOPM, 0, 0, NULL, 0),
> +	SND_SOC_DAPM_OUTPUT("TDM_TO_ACODEC"),
> +};
> +
> +static const struct snd_soc_dapm_route s4_tocodec_dapm_routes[] = {
> +	{ "INPUT SRC", "TDMA", "TDMA"},
> +	{ "INPUT SRC", "TDMB", "TDMB"},
> +	{ "INPUT SRC", "TDMC", "TDMC"},
> +	{ "Lane0", NULL, "INPUT SRC" },
> +	{ "Lane1", NULL, "INPUT SRC"},
> +	{ "Lane2", NULL, "INPUT SRC"},
> +	{ "Lane3", NULL, "INPUT SRC"},
> +	{ "Lane4", NULL, "INPUT SRC"},
> +	{ "Lane5", NULL, "INPUT SRC"},
> +	{ "Lane6", NULL, "INPUT SRC"},
> +	{ "Lane7", NULL, "INPUT SRC"},
> +	{ "Lane SRC", "Lane0", "Lane0"},
> +	{ "Lane SRC", "Lane1", "Lane1"},
> +	{ "Lane SRC", "Lane2", "Lane2"},
> +	{ "Lane SRC", "Lane3", "Lane3"},
> +	{ "Lane SRC", "Lane4", "Lane4"},
> +	{ "Lane SRC", "Lane5", "Lane5"},
> +	{ "Lane SRC", "Lane6", "Lane6"},
> +	{ "Lane SRC", "Lane7", "Lane7"},
> +	{ "OUT EN", "Switch", "Lane SRC"},
> +	{ "TDM_TO_ACODEC", NULL, "OUT EN"},
> +
> +};
> +
> +static const struct snd_soc_component_driver s4_tocodec_component_drv = {
> +	.dapm_widgets		= s4_toacodec_widgets,
> +	.num_dapm_widgets	= ARRAY_SIZE(s4_toacodec_widgets),
> +	.dapm_routes		= s4_tocodec_dapm_routes,
> +	.num_dapm_routes	= ARRAY_SIZE(s4_tocodec_dapm_routes),
> +};
> +
> +static const struct toacodec_match_data s4_toacodec_match_data = {
> +	.component_drv	= &s4_tocodec_component_drv,
> +	.field_dat_sel	= REG_FIELD(TOACODEC_CTRL0, 16, 20),
> +	.field_lrclk_sel = REG_FIELD(TOACODEC_CTRL0, 12, 14),
> +	.field_bclk_sel	= REG_FIELD(TOACODEC_CTRL0, 4, 6),
> +	.field_mclk_sel	= REG_FIELD(TOACODEC_CTRL0, 0, 2),
> +};
> +
> +static const struct of_device_id s4_tocodec_of_match[] = {
> +	{
> +		.compatible = "amlogic,s4-tocodec",
> +		.data = &s4_toacodec_match_data,
> +	}, {}
> +};
> +
> +MODULE_DEVICE_TABLE(of, s4_tocodec_of_match);
> +
> +static int tocodec_probe(struct platform_device *pdev)
> +{
> +	const struct toacodec_match_data *data;
> +	struct device *dev = &pdev->dev;
> +	struct toacodec *priv;
> +	void __iomem *regs;
> +	struct regmap *map;
> +	int ret;
> +
> +	data = device_get_match_data(dev);
> +	if (!data)
> +		return dev_err_probe(dev, -ENODEV, "failed to match device\n");
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, priv);
> +
> +	ret = device_reset(dev);
> +	if (ret)
> +		return ret;
> +
> +	regs = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(regs))
> +		return PTR_ERR(regs);
> +
> +	map = devm_regmap_init_mmio(dev, regs, &tocodec_regmap_cfg);
> +	if (IS_ERR(map))
> +		return dev_err_probe(dev, PTR_ERR(map), "failed to init regmap\n");
> +
> +	priv->field_dat_sel = devm_regmap_field_alloc(dev, map, data->field_dat_sel);
> +	if (IS_ERR(priv->field_dat_sel))
> +		return PTR_ERR(priv->field_dat_sel);
> +
> +	priv->field_lrclk_sel = devm_regmap_field_alloc(dev, map, data->field_lrclk_sel);
> +	if (IS_ERR(priv->field_lrclk_sel))
> +		return PTR_ERR(priv->field_lrclk_sel);
> +
> +	priv->field_bclk_sel = devm_regmap_field_alloc(dev, map, data->field_bclk_sel);
> +	if (IS_ERR(priv->field_bclk_sel))
> +		return PTR_ERR(priv->field_bclk_sel);
> +
> +	priv->field_mclk_sel = devm_regmap_field_alloc(dev, map, data->field_mclk_sel);
> +	if (IS_ERR(priv->field_mclk_sel))
> +		return PTR_ERR(priv->field_mclk_sel);
> +
> +	return devm_snd_soc_register_component(dev,
> +			data->component_drv, NULL, 0);
> +}
> +
> +static struct platform_driver tocodec_pdrv = {
> +	.probe = tocodec_probe,
> +	.driver = {
> +		.name = "s4-tocodec",
> +		.of_match_table = s4_tocodec_of_match,
> +	},
> +};
> +
> +module_platform_driver(tocodec_pdrv);
> +
> +MODULE_DESCRIPTION("Amlogic to codec driver");
> +MODULE_AUTHOR("jiebing.chen@amlogic.com");
> +MODULE_LICENSE("GPL");
> diff --git a/sound/soc/meson/t9015.c b/sound/soc/meson/t9015.c
> index 571f65788c592050abdca264f5656d4d1a9d99f6..2db1cd18cf2cea507f3d7282054e03d953586648 100644
> --- a/sound/soc/meson/t9015.c
> +++ b/sound/soc/meson/t9015.c
> @@ -89,10 +89,7 @@ static struct snd_soc_dai_driver t9015_dai = {
>  		.channels_min = 1,
>  		.channels_max = 2,
>  		.rates = SNDRV_PCM_RATE_8000_96000,
> -		.formats = (SNDRV_PCM_FMTBIT_S8 |
> -			    SNDRV_PCM_FMTBIT_S16_LE |
> -			    SNDRV_PCM_FMTBIT_S20_LE |
> -			    SNDRV_PCM_FMTBIT_S24_LE),
> +		.formats = (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S32_LE),

Again, mixed up changes with zero justification.

This drops S8 and S16 format support for the existing SoCs (such as GXL)
which is known to work and add S32 support on an HW documented as 24bits
only. Can you explain ?

>  	},
>  	.ops = &t9015_dai_ops,
>  };

-- 
Jerome
