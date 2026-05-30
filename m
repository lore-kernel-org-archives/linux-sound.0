Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9D5186284
	for <linux-sound@vger.kernel.org>; Sat, 30 May 2026 19:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780169603; cv=none; b=TfwwpxZ8VmdTxtQPwxXqBAYJFGrRtj8kgc9VNDrRq6ffoBYrUeftIz14wmCzvOxwVQ6RO1CDABf4T9T65Zq/M3JrYVWIxL4ZerGob/YDjnJyGCKWO6RP6bdy/BseZ4Lp71wGeiSSyJ4Gbs+jDT3VBMv1UY0nPEs2a3vtcJsaAmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780169603; c=relaxed/simple;
	bh=CX2qVC2AE+L54uXUXm+Z9Iit5+nOZCKob5b+x1Y+h68=;
	h=Subject:To:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=jwQweLfxedhcPVBR6e49PIcadOZZn3koce+4TLSetuzS58wi+d6Z9MRh8EJzvpQaIWevmwssuQ/X44rSgcS6cbuvuLqctFlPxOq6cZ9/pa3jg5OIJlwIAMrc4HwsKkLSVeNBx8VDtZrNGqNQry9WMxcGe3loRfkwMDMm2BGQKak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sgpN/8P2; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sgpN/8P2"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-45eedcdaeaaso1870370f8f.3
        for <linux-sound@vger.kernel.org>; Sat, 30 May 2026 12:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780169601; x=1780774401; darn=vger.kernel.org;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ujDzl3VgcuY/zkAs0Fu8yv7JZl4goVNlOsppss5gFKQ=;
        b=sgpN/8P2Kwj3swjgvEKvdzF/SNVsxW18fqtec7ofx6GNIAMFe1YQPRzJuxcAWfJizB
         FfQs5ufj6ol8h/cDLOWwXAW2Q3l/vf/8rXaGbsiouUlqUwXONF4VFhgTsUCd1dkrKbIO
         SUUngmyM98yPzkVbrwnXY984kivOX77qhw0FIZwqbD02SWgerZpMDUYRJSjVMqbQApRc
         +U8ct0P1KfhKyVhoLNG7FH5dxN+b/ydq3HWkyI1SelgFec7C5ZIXoB2WjxkWB3pDzuuD
         F9gYCtliqOG2guMiLsCBo6UzNvEHrg1a4g7RwaheZomcWOdxk+Mqdr4HoJPylj3RK8dB
         xFbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780169601; x=1780774401;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ujDzl3VgcuY/zkAs0Fu8yv7JZl4goVNlOsppss5gFKQ=;
        b=avfyoiIRHhiH3p00FpeDn2iKuN/FmzyxqGxlsNXjMGNrQVgJ7So0Od5gNo2V6iCfpo
         AohVZ37l+mwsV2+EwWfSFLPEfZ+IrNyviqlJU8MuRu1wf9FNPwwc8RbjU3wWxTz6ZEg7
         Jbmq0bzBfl2BhOkd+q+ypxsV56dQKpzJVgfViK9Uv3BwNkV8InMN0qakDU+bqf21aoFP
         z/Uap6mfP7FmSe6t0LIG2pc6Mmt89cBUyOSiMmDbJ3s2s2+J85v4MCMqAhFsNRAsQx1t
         bpAko94uGH/tA58RJO/ik+HUyHAO47c+QZ2dBRZ/PCSqOvDsF/6X17kcdglyGJMbJ+AL
         rjkQ==
X-Forwarded-Encrypted: i=1; AFNElJ/h9wtmv+dXJWqFiFgHtEHCqnNfpUxgIBOUirJgNiEkOMv6U5kp8ARmx3/L3iIpqjzXngURGZ/Hk+rAwA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMHAzjJhnlW2ZCPhLumzbK4m1hmSGefBPUPaM2fX3yCVmIb0MN
	y5OFCkQloUkEUZfNOh0Rvas2TUt68/YlDo8dhUQwXecM4LzAEHa4Ebfa8tNOMhBk
X-Gm-Gg: Acq92OEAIEByvr4NzVmgnGgjKBzLs5Lz80shlAxORSWA4p+hY4UaUKrfPMlUo7YiESh
	z7cXG7t2sZqyK4q5TuR0RaHrLwYhizax4gNjtOcs5iURsBUBbCYPUrPok/F91wsi5zCz0GTEzUd
	+JnDx9GLJPVZmZvBc/6fcaWejH0vX+8kBsJazRdnBWnHUiAHE8Nke+RSvkDweW5qPebqPogBgGc
	GVLCx/3M4SmZ+B29tRlZKTZ08dkdtH6pgfqa966UKSq4CiWoIWJP9nM1NFZdv0b2kJA4j1OD2Fl
	AEjGSN1tqFlGrtQM96lDmNTgv3KH8k+xn3by4mI8zfpbTpd3LPNnunjVnnpHZwpKGUZem5JHa9G
	VfMdNgblbOwP6WCRpmE6R2nnwC4H1mcrJu0onLkDRlhpAqUZ67wKZOkpQ0LgDkt02oL2nqHFxHg
	w7qvBWL0kf0ao6p09iJ0YlEBhjebq2G/Fg/dSdwQyDM1lwA8DxNC+QeyxrhkmqagcyB8P34+P8h
	7A7buRiRO6ijXBeihY5VCFVxYvoRDfQWsB8ZdXznhU8WDkLY/ak/MziTcVv2KdqeZRk
X-Received: by 2002:adf:ea85:0:b0:45e:f302:95b with SMTP id ffacd0b85a97d-45ef6b8b285mr6484053f8f.37.1780169600401;
        Sat, 30 May 2026 12:33:20 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3102-4c14-1900-f233-a94f-4a5a-3424.310.pool.telefonica.de. [2a02:3102:4c14:1900:f233:a94f:4a5a:3424])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34a03f8sm13408490f8f.7.2026.05.30.12.33.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 May 2026 12:33:19 -0700 (PDT)
Subject: Re: [PATCH 43/83] ASoC: codecs: pcm*: use .auto_selectable_formats
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 =?UTF-8?Q?Alvin_=c5=a0ipraga?= <alsi@bang-olufsen.dk>,
 "J.M.B. Downing" <jonathan.downing@nautel.com>,
 =?UTF-8?Q?Martin_Povi=c5=a1er?= <povik+lin@cutebit.org>,
 =?UTF-8?Q?Nuno_S=c3=a1?= <nuno.sa@analog.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Baojun Xu
 <baojun.xu@ti.com>, Bartosz Golaszewski <brgl@kernel.org>,
 Ben Bright <ben.bright@cirrus.com>, Benson Leung <bleung@chromium.org>,
 Biju Das <biju.das.jz@bp.renesas.com>, Binbin Zhou <zhoubinbin@loongson.cn>,
 Bram Vlerick <bram.vlerick@openpixelsystems.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Chen-Yu Tsai <wens@kernel.org>, Cheng-Yi Chiang <cychiang@chromium.org>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Daniel Mack <daniel@zonque.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 David Rhodes <david.rhodes@cirrus.com>, Fabio Estevam <festevam@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Frank Li
 <Frank.Li@nxp.com>, Fred Treven <fred.treven@cirrus.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Guenter Roeck <groeck@chromium.org>,
 Guoqing Jiang <guoqing.jiang@canonical.com>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 HariKrishna Sagala <hariconscious@gmail.com>,
 Heiko Stuebner <heiko@sntech.de>, Herve Codina <herve.codina@bootlin.com>,
 Hsieh Hung-En <hungen3108@gmail.com>,
 James Ogletree <jogletre@opensource.cirrus.com>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>, Jaroslav Kysela <perex@perex.cz>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Jihed Chaibi <jihed.chaibi.dev@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Kevin Cernekee <cernekee@chromium.org>, Kevin Hilman <khilman@baylibre.com>,
 Kevin Lu <kevin-lu@ti.com>, Kiseok Jo <kiseok.jo@irondevice.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 M R Swami Reddy <mr.swami.reddy@ti.com>, Mark Brown <broonie@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Max Filippov
 <jcmvbkbc@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Oder Chiou <oder_chiou@realtek.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Paul Cercueil <paul@crapouillou.net>, Peter Rosin <peda@lysator.liu.se>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 Qianfeng Rong <rongqianfeng@vivo.com>, Ray Jui <rjui@broadcom.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Samuel Holland
 <samuel@sholland.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Scott Branden <sbranden@broadcom.com>, Sen Wang <sen@ti.com>,
 Sharique Mohammad <sharq0406@gmail.com>, Shenghao Ding
 <shenghao-ding@ti.com>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>,
 Thierry Reding <thierry.reding@kernel.org>, Tim Bird <tim.bird@sony.com>,
 Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Tzung-Bi Shih <tzungbi@kernel.org>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Vishwas A Deshpande <vishwas.a.deshpande@ti.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Yixun Lan <dlan@kernel.org>, Zhang Yi <zhangyi@everest-semi.com>,
 linux-sound@vger.kernel.org
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
 <87bje2hpyv.wl-kuninori.morimoto.gx@renesas.com>
From: Kirill Marinushkin <k.marinushkin@gmail.com>
Message-ID: <93f2741f-e23e-a1be-bc04-a00a5c4713cd@gmail.com>
Date: Sat, 30 May 2026 21:33:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <87bje2hpyv.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hello Kuninori Morimoto,


i looked at the [PATCH 43/83], related to pcm* codecs, it looks good to me!

I don't think i would be able to embrace the whole patchset, but hopefully,

my review will be at least somewhat helpful!


Only one minor thought is that probably `.auto_selectable_formats` for 
`pcm3060.c`

could also include `SND_SOC_POSSIBLE_DAIFMT_NB_NF`, similar to `pcm186x.c`.

But it's a tiny comment, you don't need to take it seriously.

You are doing a massive work, i deeply respect the scope you take on!


Reviewed-by: Kirill Marinushkin <k.marinushkin@gmail.com>


Best regards,

Kirill

---

On 5/26/26 4:19 AM, Kuninori Morimoto wrote:
> We can use .auto_selectable_formats. Let's adds it.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>   sound/soc/codecs/pcm1681.c | 7 +++++++
>   sound/soc/codecs/pcm1754.c | 6 ++++++
>   sound/soc/codecs/pcm1789.c | 7 +++++++
>   sound/soc/codecs/pcm179x.c | 6 ++++++
>   sound/soc/codecs/pcm186x.c | 9 +++++++++
>   sound/soc/codecs/pcm3060.c | 7 +++++++
>   sound/soc/codecs/pcm512x.c | 9 +++++++++
>   7 files changed, 51 insertions(+)
>
> diff --git a/sound/soc/codecs/pcm1681.c b/sound/soc/codecs/pcm1681.c
> index cb923cecb47fc..60fdbe5c4e054 100644
> --- a/sound/soc/codecs/pcm1681.c
> +++ b/sound/soc/codecs/pcm1681.c
> @@ -199,10 +199,17 @@ static int pcm1681_hw_params(struct snd_pcm_substream *substream,
>   	return pcm1681_set_deemph(component);
>   }
>   
> +static const u64 pcm1681_selectable_formats =
> +	SND_SOC_POSSIBLE_DAIFMT_I2S	|
> +	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
> +	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
> +
>   static const struct snd_soc_dai_ops pcm1681_dai_ops = {
>   	.set_fmt	= pcm1681_set_dai_fmt,
>   	.hw_params	= pcm1681_hw_params,
>   	.mute_stream	= pcm1681_mute,
> +	.auto_selectable_formats	= &pcm1681_selectable_formats,
> +	.num_auto_selectable_formats	= 1,
>   	.no_capture_mute = 1,
>   };
>   
> diff --git a/sound/soc/codecs/pcm1754.c b/sound/soc/codecs/pcm1754.c
> index b68a528000be8..bb15da1c24aa2 100644
> --- a/sound/soc/codecs/pcm1754.c
> +++ b/sound/soc/codecs/pcm1754.c
> @@ -78,10 +78,16 @@ static int pcm1754_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
>   	return 0;
>   }
>   
> +static const u64 pcm1754_selectable_formats =
> +	SND_SOC_POSSIBLE_DAIFMT_I2S	|
> +	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J;
> +
>   static const struct snd_soc_dai_ops pcm1754_dai_ops = {
>   	.set_fmt = pcm1754_set_dai_fmt,
>   	.hw_params = pcm1754_hw_params,
>   	.mute_stream = pcm1754_mute_stream,
> +	.auto_selectable_formats = &pcm1754_selectable_formats,
> +	.num_auto_selectable_formats = 1,
>   };
>   
>   static const struct snd_soc_dai_driver pcm1754_dai = {
> diff --git a/sound/soc/codecs/pcm1789.c b/sound/soc/codecs/pcm1789.c
> index 3ab381e9a8566..f06e353743aaa 100644
> --- a/sound/soc/codecs/pcm1789.c
> +++ b/sound/soc/codecs/pcm1789.c
> @@ -164,11 +164,18 @@ static int pcm1789_trigger(struct snd_pcm_substream *substream, int cmd,
>   	return ret;
>   }
>   
> +static const u64 pcm1789_selectable_formats =
> +	SND_SOC_POSSIBLE_DAIFMT_I2S	|
> +	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
> +	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
> +
>   static const struct snd_soc_dai_ops pcm1789_dai_ops = {
>   	.set_fmt	= pcm1789_set_dai_fmt,
>   	.hw_params	= pcm1789_hw_params,
>   	.mute_stream	= pcm1789_mute,
>   	.trigger	= pcm1789_trigger,
> +	.auto_selectable_formats	= &pcm1789_selectable_formats,
> +	.num_auto_selectable_formats	= 1,
>   	.no_capture_mute = 1,
>   };
>   
> diff --git a/sound/soc/codecs/pcm179x.c b/sound/soc/codecs/pcm179x.c
> index f52ff66b6e644..cb70927872aa0 100644
> --- a/sound/soc/codecs/pcm179x.c
> +++ b/sound/soc/codecs/pcm179x.c
> @@ -142,10 +142,16 @@ static int pcm179x_hw_params(struct snd_pcm_substream *substream,
>   	return 0;
>   }
>   
> +static const u64 pcm179x_selectable_formats =
> +	SND_SOC_POSSIBLE_DAIFMT_I2S	|
> +	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J;
> +
>   static const struct snd_soc_dai_ops pcm179x_dai_ops = {
>   	.set_fmt	= pcm179x_set_dai_fmt,
>   	.hw_params	= pcm179x_hw_params,
>   	.mute_stream	= pcm179x_mute,
> +	.auto_selectable_formats	= &pcm179x_selectable_formats,
> +	.num_auto_selectable_formats	= 1,
>   	.no_capture_mute = 1,
>   };
>   
> diff --git a/sound/soc/codecs/pcm186x.c b/sound/soc/codecs/pcm186x.c
> index 0d1103fe4e04d..461ec74e87521 100644
> --- a/sound/soc/codecs/pcm186x.c
> +++ b/sound/soc/codecs/pcm186x.c
> @@ -473,11 +473,20 @@ static int pcm186x_set_dai_sysclk(struct snd_soc_dai *dai, int clk_id,
>   	return 0;
>   }
>   
> +static const u64 pcm186x_selectable_formats =
> +	SND_SOC_POSSIBLE_DAIFMT_I2S	|
> +	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
> +	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
> +	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
> +	SND_SOC_POSSIBLE_DAIFMT_NB_NF;
> +
>   static const struct snd_soc_dai_ops pcm186x_dai_ops = {
>   	.set_sysclk = pcm186x_set_dai_sysclk,
>   	.set_tdm_slot = pcm186x_set_tdm_slot,
>   	.set_fmt = pcm186x_set_fmt,
>   	.hw_params = pcm186x_hw_params,
> +	.auto_selectable_formats = &pcm186x_selectable_formats,
> +	.num_auto_selectable_formats = 1,
>   };
>   
>   static struct snd_soc_dai_driver pcm1863_dai = {
> diff --git a/sound/soc/codecs/pcm3060.c b/sound/soc/codecs/pcm3060.c
> index 8974200652e7e..5fb344c6d8d90 100644
> --- a/sound/soc/codecs/pcm3060.c
> +++ b/sound/soc/codecs/pcm3060.c
> @@ -164,10 +164,17 @@ static int pcm3060_hw_params(struct snd_pcm_substream *substream,
>   	return 0;
>   }
>   
> +static const u64 pcm3060_selectable_formats =
> +	SND_SOC_POSSIBLE_DAIFMT_I2S	|
> +	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
> +	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
> +
>   static const struct snd_soc_dai_ops pcm3060_dai_ops = {
>   	.set_sysclk = pcm3060_set_sysclk,
>   	.set_fmt = pcm3060_set_fmt,
>   	.hw_params = pcm3060_hw_params,
> +	.auto_selectable_formats = &pcm3060_selectable_formats,
> +	.num_auto_selectable_formats = 1,
>   };
>   
>   #define PCM3060_DAI_RATES_ADC	(SNDRV_PCM_RATE_16000 | SNDRV_PCM_RATE_32000 | \
> diff --git a/sound/soc/codecs/pcm512x.c b/sound/soc/codecs/pcm512x.c
> index a70e8ea166dc5..981a2e56fa724 100644
> --- a/sound/soc/codecs/pcm512x.c
> +++ b/sound/soc/codecs/pcm512x.c
> @@ -1505,12 +1505,21 @@ static int pcm512x_mute(struct snd_soc_dai *dai, int mute, int direction)
>   	return ret;
>   }
>   
> +static const u64 pcm512x_selectable_formats =
> +	SND_SOC_POSSIBLE_DAIFMT_I2S	|
> +	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
> +	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
> +	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
> +	SND_SOC_POSSIBLE_DAIFMT_DSP_B;
> +
>   static const struct snd_soc_dai_ops pcm512x_dai_ops = {
>   	.startup = pcm512x_dai_startup,
>   	.hw_params = pcm512x_hw_params,
>   	.set_fmt = pcm512x_set_fmt,
>   	.mute_stream = pcm512x_mute,
>   	.set_bclk_ratio = pcm512x_set_bclk_ratio,
> +	.auto_selectable_formats = &pcm512x_selectable_formats,
> +	.num_auto_selectable_formats = 1,
>   	.no_capture_mute = 1,
>   };
>   
