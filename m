Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E20715665C
	for <linux-sound@vger.kernel.org>; Tue,  3 Mar 2026 00:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772496747; cv=none; b=AuXtk/qxHKKErKRPwp37UrMqsRNsbFLAz7cp9ujQ6ECQHCt2jOTJoaSTOtyAfaZPxWb8z+gRSnvpw/ivDkBedQvRuWeVMIWiyMgcqE/kiG2DlCtswxmHxJkR4yY8UeCteYnwVsanEkgaAGgFk6OncP9as84N8x7Lj9IzZgmG3pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772496747; c=relaxed/simple;
	bh=qSKER8QGe6HZO4QaGeUl/ODcWDhF1g3/IWXqqL3vY+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f6hgMwgxdWYQoUMhCPfLXAUu4jfLR3SiwhsSxkd3CgYmkJa9/I8PdJjer33GqFGY+quAQpA5Ntp8DZfHseaOMn2lQDr0yJbhzi8Rrd9hBYG8a2xIEIEoq/cGR3omqg8RMfxKVLVfhMwv0+faHfsgoKbz9crf95DQztmvfd9Cjgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kZIuZjBL; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kZIuZjBL"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-660a293515fso328157a12.1
        for <linux-sound@vger.kernel.org>; Mon, 02 Mar 2026 16:12:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772496743; x=1773101543; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oCh6HhY0IphrnmZpVDSvtegoc53EkacAYA1p+wqMJS8=;
        b=kZIuZjBL5ztTB/EAq1hDDg/Ks6051EIRFPqeYvhtA4czgn3mnNHEYA5NynjPnw3T9X
         sqVwTauAhdePC/J1q6Ni6qxbgWg4zSmEGzuVKW/wRqLZ1xJGNdOjwpIM8bK0ACuHZ/O7
         em/RS9AV0vVBkDlMdzprbpp9kccF5Iw+FMpCIx5qA9Ae5rxrIaDVDuW/c0P4GaPazbgU
         nVal4ReZp+U8g9oyM2XPq0+feFX0oZB9B99GjrGtk/149qfb7L5Aj5nvzxipR9yKARnP
         47yIWPAx6Dd/rgwocC9m0jnt2Xe6EO9W9JTzSEcHcejhy7JejJ/MiWjKKtD74iEcxBYN
         7A+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772496743; x=1773101543;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oCh6HhY0IphrnmZpVDSvtegoc53EkacAYA1p+wqMJS8=;
        b=g8wmMy485BeEucincU0z7pwmAnQd9mEn5v0Jvuowy/fRxUUWr/33hdxivMTKJoq6Y9
         0MKc/IzH5ouk3YhAvtxAOBTTiPsYTCZ+MfYNpROlJkuhykLaIUZUlJOpzUeQiZ49yWmj
         g8hLlCRpQI+2CS4FgIFGGyd24yLfFazElr9L9yZfJaWIU0voeLLit6bInxN7qTyghjwR
         w6NfKIDXZVd+br/XR9U3kzqR7jCg08rPqc5h1Afmqz60bwOAufoiidMa5Y4wIGTOvDQi
         QYXSTZwRsAS9KS77SvxmHTjR1rNDnx4uX+mZUYDChkJAbM9zr2x5MN+F39UmT8nSGj1F
         hlQw==
X-Gm-Message-State: AOJu0Yw9BEnO5h9v1Qp3GepBtjJVkcYDVcVlS46cAfgh8XhlegEUhAH+
	pvaqIovZ/rTEvyfBYWst8dNmQXC41TH//BhwqhYR/QcJrLbE4R3VXcCZ
X-Gm-Gg: ATEYQzyb1PZreZYFmRkJGjov+gCqEwsn3u8MGBjInh4zi1wajuK8XJLAtKYtLrROpJ0
	wCa9qtDulld1i01MlTLwI52m264sQT1+n8RwvgNUtN4zLe5ufve+8r0qxQn2QPweoOMVpv4EG3A
	rZBxX5IswASxXH1CbKRZI9EiFhLFla1zOJf9cWRdH1PVGGE7RAgz/tp5h1bzA0xXd1DXf/XUUY2
	b9lpSqlQS/EoiGTz7IuVLLeG7YFFxw87OwrSzV6pA8cE1h87aUn+5Pql0ygg+zMrLGbpjuXcSxY
	HcueEW3YS+twPnjAGmgFvIN11n7mU5SAOlreyFpYiI0csSAdhiRSONJVnuiehRNLGAzLymcj+bt
	QHI9wl2gmZgBl9NFEnhhulSAXBeIRjM7qDwc+fDDOutxY7G9ai01WDGzFBKKOEQfmw7ZT9/o1uq
	pykZ7htUgAoiIQYw==
X-Received: by 2002:a17:906:dc8f:b0:b73:4fbb:37a2 with SMTP id a640c23a62f3a-b9376366e35mr1175297866b.5.1772496743265;
        Mon, 02 Mar 2026 16:12:23 -0800 (PST)
Received: from jekhomev ([46.251.53.180])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ab13593sm522349466b.3.2026.03.02.16.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 16:12:22 -0800 (PST)
Date: Tue, 3 Mar 2026 02:12:21 +0200
From: Yauhen Kharuzhy <jekhor@gmail.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Hans de Goede <hansg@kernel.org>, Liam Girdwood <liam.r.girdwood@linux.intel.com>, 
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 3/3] ASoC: Intel: cht_yogabook: Add driver for Lenovo
 Yoga Book tablets
Message-ID: <aaYRd2Irw8bOpDL0@jekhomev>
References: <20260301-asoc-yogabook-v2-v2-0-adcc7ed40985@gmail.com>
 <20260301-asoc-yogabook-v2-v2-3-adcc7ed40985@gmail.com>
 <7932c58b-b6fa-40c3-8967-7710d84f9667@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7932c58b-b6fa-40c3-8967-7710d84f9667@intel.com>

On Mon, Mar 02, 2026 at 01:03:04PM +0100, Cezary Rojewski wrote:
> On 2026-03-01 10:33 PM, Yauhen Kharuzhy wrote:
> > Add a new ASoC machine driver for Lenovo Yoga Book Intel Cherry
> > Trail-based tablets (YB1-X90F/L, YB1-X91F/L models).
> > 
> > This platform uses a Realtek ALC5677 codec accompanied by a TS3A227E jack
> > configuration detection IC.
> > 
> > The driver is based on the cht_bsw_rt5672.c mainline driver and the driver
> > from the vendor's Android kernel [1].
> > 
> > There are no other known Cherry Trail platforms using an RT5677 codec, so
> > the driver is named 'cht_yogabook', and some device-specific tricks are
> > hardcoded, such as jack events and additional GPIOs controlling the
> > speaker amplifier.
> 
> I'd switch to more specific naming. From the Intel-maintainer point of view,
> it's easier to navigate between configurations when <platform>-<codec>
> naming is in use. TBH, we do not see "yogabook", we configuration composed
> of Cherrytrail-based device and rt5677 I2C codec.

So, should it just be named "cht-rt5677", but the code inside will be Yoga
Book-specific without generalization? Or is it better to make the code as
generic as possible and add machine-specific things via some kind of quirks
selected by DMI data, for example? I doubt if we will meet another
working Cherry Trail-based device with RT5677 codec in the future.

> 
> For the entire driver:
> - fix alignments

There are alignment rule violations only at SND_SOC_DAILINK_DEF()
declarations where they looks acceptable. I just copied their style from
other intel board drivers.

But OK, I will change this.

> - fix char-per-line limit, submission rules expect 100c-per-line limit

checkpatch.pl reports no such violations except of the link in the commit
description.


> 
> Below additional comments.
> 
> > 
> > [1] https://github.com/deadman96385/android_kernel_lenovo_yeti/blob/master/sound/soc/intel/board/cht_bl_dpcm_rt5677.c
> > 
> > Signed-off-by: Yauhen Kharuzhy <jekhor@gmail.com>
> 
> ...
> 
> 
> > diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
> > index 25a1a9066cbf..58bd6029545b 100644
> > --- a/sound/soc/intel/boards/Makefile
> > +++ b/sound/soc/intel/boards/Makefile
> > @@ -15,6 +15,7 @@ snd-soc-sst-cht-bsw-nau8824-y := cht_bsw_nau8824.o
> >   snd-soc-sst-byt-cht-cx2072x-y := bytcht_cx2072x.o
> >   snd-soc-sst-byt-cht-da7213-y := bytcht_da7213.o
> >   snd-soc-sst-byt-cht-es8316-y := bytcht_es8316.o
> > +snd-soc-sst-cht-yogabook-objs := cht_yogabook.o
> 
> Let's follow recommendation from Takashi [1]. Suffix "-objs" is obsolete.
> 
> [1]: https://lore.kernel.org/all/20240507155540.24815-13-tiwai@suse.de/

OK.

> 
> >   snd-soc-sst-byt-cht-nocodec-y := bytcht_nocodec.o
> >   snd-soc-sof_rt5682-y := sof_rt5682.o
> >   snd-soc-sof_cs42l42-y := sof_cs42l42.o
> > @@ -47,6 +48,7 @@ obj-$(CONFIG_SND_SOC_INTEL_CHT_BSW_NAU8824_MACH) += snd-soc-sst-cht-bsw-nau8824.
> >   obj-$(CONFIG_SND_SOC_INTEL_BYT_CHT_CX2072X_MACH) += snd-soc-sst-byt-cht-cx2072x.o
> >   obj-$(CONFIG_SND_SOC_INTEL_BYT_CHT_DA7213_MACH) += snd-soc-sst-byt-cht-da7213.o
> >   obj-$(CONFIG_SND_SOC_INTEL_BYT_CHT_ES8316_MACH) += snd-soc-sst-byt-cht-es8316.o
> > +obj-$(CONFIG_SND_SOC_INTEL_CHT_YOGABOOK_MACH) += snd-soc-sst-cht-yogabook.o
> >   obj-$(CONFIG_SND_SOC_INTEL_BYT_CHT_NOCODEC_MACH) += snd-soc-sst-byt-cht-nocodec.o
> >   obj-$(CONFIG_SND_SOC_INTEL_SKL_HDA_DSP_GENERIC_MACH) += snd-soc-skl_hda_dsp.o
> >   obj-$(CONFIG_SND_SOC_INTEL_EHL_RT5660_MACH) += snd-soc-ehl-rt5660.o
> > diff --git a/sound/soc/intel/boards/cht_yogabook.c b/sound/soc/intel/boards/cht_yogabook.c
> > new file mode 100644
> > index 000000000000..9d945cad5660
> > --- /dev/null
> > +++ b/sound/soc/intel/boards/cht_yogabook.c
> > @@ -0,0 +1,551 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + *  cht_yogabook.c - ASoc Machine driver for Lenovo Yoga Book YB1-X90/X91
> > + *  tablets, based on Intel Cherrytrail platform with RT5677 codec.
> > + *
> > + *  Copyright (C) 2026 Yauhen Kharuzhy <jekhor@gmail.com>
> > + *
> > + *  Based on cht_bsw_rt5672.c:
> > + *  Copyright (C) 2014 Intel Corp
> > + *  Author: Subhransu S. Prusty <subhransu.s.prusty@intel.com>
> > + *          Mengdong Lin <mengdong.lin@intel.com>
> > + *
> > + *  And based on the cht_bl_dpcm_rt5677.c from the Lenovo's Android kernel:
> > + *  Copyright (C) 2014 Intel Corp
> > + *  Author: Mythri P K <mythri.p.k@intel.com>
> 
> Not sure about the boiler plate here. Mentioning people is OK but the emails
> are all obsolete. Such information does not help anyone. Perhaps "based on
> XYZ" is enough.

OK

> 
> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/dmi.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/gpio/machine.h>
> > +#include <linux/i2c.h>
> > +#include <linux/input.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/slab.h>
> > +#include <sound/jack.h>
> > +#include <sound/pcm.h>
> > +#include <sound/pcm_params.h>
> > +#include <sound/soc-acpi.h>
> > +#include <sound/soc.h>
> > +#include "../../codecs/rt5677.h"
> > +#include "../../codecs/ts3a227e.h"
> > +#include "../atom/sst-atom-controls.h"
> > +
> > +#define RT5677_I2C_DEFAULT	"i2c-rt5677"
> > +
> > +/* The platform clock #3 outputs 19.2Mhz clock to codec as I2S MCLK */
> > +#define CHT_PLAT_CLK_3_HZ	19200000
> > +#define CHT_CODEC_DAI		"rt5677-aif1"
> > +
> > +struct cht_yb_private {
> > +	char codec_name[SND_ACPI_I2C_ID_LEN];
> > +	struct snd_soc_jack jack;
> > +	struct clk *mclk;
> > +	struct gpio_desc *gpio_spk_en1;
> > +	struct gpio_desc *gpio_spk_en2;
> > +	struct gpio_desc *gpio_hp_en;
> > +};
> > +
> > +static int cht_yb_platform_clock_control(struct snd_soc_dapm_widget *w,
> > +					 struct snd_kcontrol *k, int  event)
> 
> Please replace 'k' with 'kctl' for the entire file.

OK.

> > +{
> > +	struct snd_soc_card *card = snd_soc_dapm_to_card(w->dapm);
> > +	struct snd_soc_dai *codec_dai;
> > +	struct cht_yb_private *ctx = snd_soc_card_get_drvdata(card);
> > +	int ret;
> > +
> > +	codec_dai = snd_soc_card_get_codec_dai(card, CHT_CODEC_DAI);
> > +	if (!codec_dai) {
> > +		dev_err(card->dev,
> > +			"Codec dai not found; Unable to set platform clock\n");
> > +		return -EIO;
> > +	}
> > +
> > +	if (SND_SOC_DAPM_EVENT_ON(event)) {
> > +		if (ctx->mclk) {
> > +			ret = clk_prepare_enable(ctx->mclk);
> > +			if (ret < 0) {
> > +				dev_err(card->dev,
> > +					"could not configure MCLK state");
> > +				return ret;
> > +			}
> > +		}
> > +
> > +		/* set codec PLL source to the 19.2MHz platform clock (MCLK) */
> > +		ret = snd_soc_dai_set_pll(codec_dai, 0, RT5677_PLL1_S_MCLK,
> > +					  CHT_PLAT_CLK_3_HZ, 48000 * 512);
> > +		if (ret < 0) {
> > +			dev_err(card->dev, "can't set codec pll: %d\n", ret);
> > +			return ret;
> > +		}
> > +
> > +		/* set codec sysclk source to PLL */
> > +		ret = snd_soc_dai_set_sysclk(codec_dai, RT5677_SCLK_S_PLL1,
> > +					     48000 * 512, SND_SOC_CLOCK_IN);
> > +		if (ret < 0) {
> > +			dev_err(card->dev, "can't set codec sysclk: %d\n", ret);
> > +			return ret;
> > +		}
> > +	} else {
> > +		/* Set codec sysclk source to its internal clock because codec
> > +		 * PLL will be off when idle and MCLK will also be off by ACPI
> > +		 * when codec is runtime suspended. Codec needs clock for jack
> > +		 * detection and button press.
> > +		 */
> > +		snd_soc_dai_set_sysclk(codec_dai, RT5677_SCLK_S_RCCLK,
> > +				       48000 * 512, SND_SOC_CLOCK_IN);
> > +
> > +		if (ctx->mclk)
> > +			clk_disable_unprepare(ctx->mclk);
> > +	}
> 
> The entire function is made of if-statement. I'd split this into:
> 
> xyz_platform_clock_control()
> |_ xyz_platform_clock_enable()
> |_ xyz_platform_clock_disable()
> 
> 

OK

> > +	return 0;
> > +}
> > +
> > +static int cht_yb_hp_event(struct snd_soc_dapm_widget *w,
> > +			   struct snd_kcontrol *k, int event)
> > +{
> > +	struct snd_soc_card *card = snd_soc_dapm_to_card(w->dapm);
> > +	struct cht_yb_private *ctx = snd_soc_card_get_drvdata(card);
> > +
> > +	dev_dbg(card->dev, "HP event: %s\n",
> > +		SND_SOC_DAPM_EVENT_ON(event) ? "ON" : "OFF");
> 
> These dev_dbg() can be dropped. Function tracer or DAPM events found within
> tracing/events are sufficient.

OK

> 
> > +
> > +	gpiod_set_value_cansleep(ctx->gpio_hp_en, SND_SOC_DAPM_EVENT_ON(event));
> > +
> > +	return 0;
> > +}
> > +
> > +static int cht_yb_spk_event(struct snd_soc_dapm_widget *w,
> > +			    struct snd_kcontrol *k, int event)
> > +{
> > +	struct snd_soc_card *card = snd_soc_dapm_to_card(w->dapm);
> > +	struct cht_yb_private *ctx = snd_soc_card_get_drvdata(card);
> > +
> > +	dev_dbg(card->dev, "SPK event: %s\n",
> > +		SND_SOC_DAPM_EVENT_ON(event) ? "ON" : "OFF");
> 
> Ditto.
> 
> > +
> > +	gpiod_set_value_cansleep(ctx->gpio_spk_en1,
> > +				 SND_SOC_DAPM_EVENT_ON(event));
> > +	gpiod_set_value_cansleep(ctx->gpio_spk_en2,
> > +				 SND_SOC_DAPM_EVENT_ON(event));
> > +
> > +	return 0;
> > +}
> 
> ...
> 
> > +static int cht_yb_codec_init(struct snd_soc_pcm_runtime *runtime)
> > +{
> > +	int ret = 0;
> 
> Move as last.

OK

> 
> > +	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(runtime, 0);
> > +	struct snd_soc_component *component = codec_dai->component;
> > +	struct cht_yb_private *ctx = snd_soc_card_get_drvdata(runtime->card);
> > +
> > +	/* Enable codec ASRC function for Stereo DAC/Stereo1 ADC/DMIC/I2S1.
> > +	 * The ASRC clock source is clk_i2s1_asrc.
> > +	 */
> > +	rt5677_sel_asrc_clk_src(component, RT5677_DA_STEREO_FILTER |
> > +			RT5677_AD_STEREO1_FILTER | RT5677_I2S1_SOURCE,
> > +			RT5677_CLK_SEL_I2S1_ASRC);
> > +	/* Enable codec ASRC function for Mono ADC L.
> > +	 * The ASRC clock source is clk_sys2_asrc.
> > +	 */
> > +	rt5677_sel_asrc_clk_src(component, RT5677_AD_MONO_L_FILTER,
> > +				RT5677_CLK_SEL_SYS2);
> > +
> > +	ctx->gpio_spk_en1 = devm_gpiod_get(component->dev, "speaker-enable",
> > +					   GPIOD_OUT_LOW);
> > +	if (IS_ERR(ctx->gpio_spk_en1)) {
> > +		dev_err(component->dev, "Can't find speaker enable GPIO\n");
> > +		return PTR_ERR(ctx->gpio_spk_en1);
> > +	}
> > +
> > +	ctx->gpio_spk_en2 = devm_gpiod_get(component->dev, "speaker-enable2",
> > +					   GPIOD_OUT_LOW);
> > +	if (IS_ERR(ctx->gpio_spk_en2)) {
> > +		dev_err(component->dev, "Can't find speaker enable 2 GPIO\n");
> > +		return PTR_ERR(ctx->gpio_spk_en2);
> > +	}
> > +
> > +	ctx->gpio_hp_en = devm_gpiod_get(component->dev, "headphone-enable",
> > +					 GPIOD_OUT_LOW);
> > +	if (IS_ERR(ctx->gpio_hp_en)) {
> > +		dev_err(component->dev, "Can't find headphone enable GPIO\n");
> 
> The messages here are misleading. "Can't find ..." when devm_gpiod_get()
> returns different IS_ERR() than -ENOENT is incorrect. I'd just state that
> XYZ operation failed and append the return code. Scales nicely into the
> future.

ok

> 
> > +		return PTR_ERR(ctx->gpio_hp_en);
> > +	}
> > +
> > +	if (ctx->mclk) {
> 
> If no-MCLK case even valid here? You're providing new driver for an older,
> specific configuration. Perhaps limiting the code to the actual (and only)
> user is the way to go?

Yes, you are correct, the driver fails to probe if the mclk is not obtained.
Will remove such checks.

> 
> > +		/*
> > +		 * The firmware might enable the clock at
> > +		 * boot (this information may or may not
> > +		 * be reflected in the enable clock register).
> > +		 * To change the rate we must disable the clock
> > +		 * first to cover these cases. Due to common
> > +		 * clock framework restrictions that do not allow
> > +		 * to disable a clock that has not been enabled,
> > +		 * we need to enable the clock first.
> > +		 */
> > +		ret = clk_prepare_enable(ctx->mclk);
> > +		if (!ret)
> > +			clk_disable_unprepare(ctx->mclk);
> > +
> > +		ret = clk_set_rate(ctx->mclk, CHT_PLAT_CLK_3_HZ);
> > +
> > +		if (ret) {
> > +			dev_err(runtime->dev, "unable to set MCLK rate\n");
> > +			return ret;
> > +		}
> > +	}
> > +
> > +	return 0;
> > +}
> 
> ...
> 
> > +#define SOF_CARD_NAME "cht yogabook"
> > +#define SOF_DRIVER_NAME "SOF"
> > +
> > +#define CARD_NAME "cht-yogabook"
> > +#define DRIVER_NAME NULL
> 
> Have you tested the driver with both, legacy -and- SOF firmware? If you're
> using just one of them, let's limit the driver to that one. Anything else
> can be part of a follow up series if there is a need to support multiple
> solutions. Otherwise we'd be merging code with no coverage and no user.

No, I tested only with non-SOF firmware because topology file for rt5677
is missing. Agree, I will remove SOF related code.

> 
> > +
> > +static int snd_cht_yb_mc_probe(struct platform_device *pdev)
> > +{
> > +	int ret_val = 0;
> > +	struct cht_yb_private *drv;
> 
> No. 'drv', short for 'driver', is not the right name for the private
> context. Typically 'priv' or 'data' is used.

OK

> 
> > +	struct snd_soc_acpi_mach *mach = pdev->dev.platform_data;
> 
> dev_get_platdata(), no reason to avoid well-established APIs.
OK

> 
> > +	const char *platform_name;
> > +	struct acpi_device *adev;
> > +	struct device *codec_dev;
> > +	bool sof_parent;
> > +	int i;
> > +
> > +	drv = devm_kzalloc(&pdev->dev, sizeof(*drv), GFP_KERNEL);
> > +	if (!drv)
> > +		return -ENOMEM;
> > +
> > +	strscpy(drv->codec_name, RT5677_I2C_DEFAULT);
> > +
> > +	/* fixup codec name based on HID if ACPI node is present */
> > +	adev = acpi_dev_get_first_match_dev(mach->id, NULL, -1);
> > +	if (adev) {
> > +		snprintf(drv->codec_name, sizeof(drv->codec_name),
> > +			 "i2c-%s", acpi_dev_name(adev));
> > +		dev_info(&pdev->dev, "real codec name: %s\n", drv->codec_name);
> > +
> > +		put_device(&adev->dev);
> > +		for (i = 0; i < ARRAY_SIZE(cht_yb_dailink); i++) {
> > +			if (cht_yb_dailink[i].codecs->name &&
> > +			    !strcmp(cht_yb_dailink[i].codecs->name,
> > +				    RT5677_I2C_DEFAULT)) {
> > +				cht_yb_dailink[i].codecs->name = drv->codec_name;
> > +				break;
> > +			}
> > +		}
> > +	}
> > +
> > +	codec_dev = bus_find_device_by_name(&i2c_bus_type, NULL,
> > +					    drv->codec_name);
> > +	if (!codec_dev)
> > +		return -EPROBE_DEFER;
> > +
> > +	if (adev) {
> > +		ret_val = devm_acpi_dev_add_driver_gpios(codec_dev,
> > +							 cht_yb_gpios);
> > +		if (ret_val)
> > +			dev_warn(&pdev->dev,
> > +				 "Unable to add GPIO mapping table: %d\n",
> > +				 ret_val);
> > +	}
> > +
> > +	/* override platform name, if required */
> > +	snd_soc_card_cht_yb.dev = &pdev->dev;
> > +	platform_name = mach->mach_params.platform;
> > +
> > +	ret_val = snd_soc_fixup_dai_links_platform_name(&snd_soc_card_cht_yb,
> > +							platform_name);
> > +	if (ret_val) {
> > +		dev_err(&pdev->dev,
> > +			"snd_soc_fixup_dai_links_platform_name failed: %d\n",
> > +			ret_val);
> > +		return ret_val;
> > +	}
> > +
> > +	drv->mclk = devm_clk_get(&pdev->dev, "pmc_plt_clk_3");
> > +	if (IS_ERR(drv->mclk)) {
> > +		dev_err(&pdev->dev,
> > +			"Failed to get MCLK from pmc_plt_clk_3: %ld\n",
> > +			PTR_ERR(drv->mclk));
> > +		return PTR_ERR(drv->mclk);
> > +	}
> > +	snd_soc_card_set_drvdata(&snd_soc_card_cht_yb, drv);
> > +
> > +	sof_parent = snd_soc_acpi_sof_parent(&pdev->dev);
> > +
> > +	/* set the card and driver name */
> > +	if (sof_parent) {
> > +		snd_soc_card_cht_yb.name = SOF_CARD_NAME;
> > +		snd_soc_card_cht_yb.driver_name = SOF_DRIVER_NAME;
> > +	} else {
> > +		snd_soc_card_cht_yb.name = CARD_NAME;
> > +		snd_soc_card_cht_yb.driver_name = DRIVER_NAME;
> > +	}
> > +
> > +	/* register the soc card */
> > +	snd_soc_card_cht_yb.dev = &pdev->dev;
> 
> I'd move away from static-card approach and dynamically allocate the object
> here, in the probe() function.

hmm... OK but why? Most sound drivers use a static approach to simplify
declaration.

> 
> > +	ret_val = devm_snd_soc_register_card(&pdev->dev, &snd_soc_card_cht_yb);
> > +	if (ret_val) {
> > +		dev_err(&pdev->dev,
> > +			"snd_soc_register_card failed %d\n", ret_val);
> > +		return ret_val;
> > +	}
> > +	platform_set_drvdata(pdev, &snd_soc_card_cht_yb);
> 
> This seems bogus. The probe() found here is not the function that spawned
> the platform-device 'pdev' yet it attempts to manipulate device's private
> data. At the same time there is no platform_get_drvdata() anywhere. Unless
> there's a strong reason for the call, please drop the line.

Sure, snaked from the cht_bsw_rt5672.c

> 
> > +
> > +	return ret_val;
> > +}
> > +
> > +static struct platform_driver snd_cht_yb_mc_driver = {
> > +	.driver = {
> > +		.name = "cht-yogabook",
> 
> It seems .pm assignment is missing. I see that the "base" is missing this
> too. Looks like a flaw, I'd assign snd_soc_pm_ops and re-test. The ops
> describe basic bring-up and tear-down procedures and I'm expecting them to
> notify us about any problems rather than harm the configuration.

OK

> 
> > +	},
> > +	.probe = snd_cht_yb_mc_probe,
> > +};
> > +
> > +module_platform_driver(snd_cht_yb_mc_driver);
> > +
> > +MODULE_DESCRIPTION("Lenovo Yoga Book YB1-X9x machine driver");
> > +MODULE_AUTHOR("Yauhen Kharuzhy");
> > +MODULE_LICENSE("GPL v2");
> > +MODULE_ALIAS("platform:cht-yogabook");
> > 
> 

-- 
Yauhen Kharuzhy
