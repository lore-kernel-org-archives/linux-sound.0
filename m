Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3CD7175F
	for <linux-sound@vger.kernel.org>; Thu,  4 Apr 2024 08:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712220417; cv=none; b=lzmBsMTgK7b9UMxRqx2xdCPUUzQxbAkVjTbilVObdp8u+UVbxAz7E720Umhb+p3ba/TI6Wg3WGS/y6KbhFhsFAbOc5f/XWSPnwxMurM2K/7jXvWS9jHdRP30voffB+Kua2WfBSjHcYb994hu6Fxhc5d7SrRf/FK8OH5Brra2mrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712220417; c=relaxed/simple;
	bh=Q9rxavh+3jGPYQmhPcwtJShwvPawHe7CzUPk3kXsc38=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:Message-ID:
	 MIME-Version:Content-Type; b=fEi3ZU2hzqC3fy/gLhdKjlda44Wevfs0BDnkgz35d7Of4Zuw8x1cFxqO3I2O7Y9aUTzZCypVBiwXD8YX/DNZ9HpMUupHZ8VUx74OSUXmwW6nsAmKoSCzB1oYW4f4zGeBtIPIfRsjXIzb1W3n9RNun7s0VQZrMpU8TuJ7fm1RNGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=bTgNB5QL; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="bTgNB5QL"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-513d3746950so844873e87.1
        for <linux-sound@vger.kernel.org>; Thu, 04 Apr 2024 01:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712220413; x=1712825213; darn=vger.kernel.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=vssJvDsEm5h5nxOLNKKmfZj8jedONQ1OyiP3MNwrwU4=;
        b=bTgNB5QLkvXz9u7IGOv7PgOuaCipD8OoCiPoSdiQc7JDuw3V1HLPBPptRRc7P/KC0r
         b5w3H+/Hv7fqzndNkWDifPu7+C42lpczPbkbjV9sRBhDJ1BR3SiKmpu9dIqCKPQDaf9+
         CUTm3QMi43aGMHalN/uL6Aaaoz6ECH/sss4MVo5fNRakgcVuC3VOS0r6KTysuiky9kxS
         WJgMQ2pcAU80HMlizL/ckSXj6+c3fukgRM0SbxUdb3wSJSFe9BVlNQJonB7SJnw2TRPi
         6dQ4muVcUY8jO3qTinVrUf1VfZ8McQcBatwfoz2lCLdwE2FoR6PJiPJLhIQJrfQnkc8G
         fBTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712220413; x=1712825213;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vssJvDsEm5h5nxOLNKKmfZj8jedONQ1OyiP3MNwrwU4=;
        b=rePjVbWYm8q/Ky+yjFTt3PqprfWvsu8S3EBlZKmx+5cxr69lqj9kgttN3Fu257JEpC
         vEmPRkDe0az+U7+qAzCdZXdJGRAp52YTAy0WPMR4/3dZNLXnmeelo0HV55k7srcDsFNS
         uPlu9zjWLg9xu9656CAIEUdWGdsU1Qw2pTrr5krE+wNWGLpRS+2gpcFo7hCDY05pJ7mG
         PQ+LCS3eLLJrNleBTDc0HZjSxDjL2ksCIbpQpj8ufA7fmih7zQVgmPZ0R+VGd4DT8VoY
         s26uZBwM4VGL2Q8/86eW12WEzRGsRbcidv26BRDApSfrNAYcs9u84JohI59+Giy1inwX
         TwSg==
X-Forwarded-Encrypted: i=1; AJvYcCUfPxD6W6pXkX9lOjxjMf406Ei1g0w4GPeenMuo5sxLkS6FE9ISsYTA4PhF/vzA2VTGLqrdcPt4t00VoqxsNryzLNW2PHbqlo74B6Q=
X-Gm-Message-State: AOJu0YxrdStEfj9aNajOpXfSggddEfDNfphTgh7WRoB1GK59wrnFCtM6
	OB/QZjNnLZKWG+Bk8VSXySsLH0BZjQ+3GTlEhRhOOqsn32hQwDqOOLpLvZZ6z3w=
X-Google-Smtp-Source: AGHT+IGfmakMeTh3jAGVQJKJ+VTm2R438vkeBhF7L+wEWqOROEyvzepKwPfwlLVcE3mN6ey9Em+MkA==
X-Received: by 2002:ac2:4c8f:0:b0:513:d01e:b68 with SMTP id d15-20020ac24c8f000000b00513d01e0b68mr1237043lfl.3.1712220413384;
        Thu, 04 Apr 2024 01:46:53 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:b7ad:8118:73f1:92e5])
        by smtp.gmail.com with ESMTPSA id p15-20020a05600c468f00b0041550e03bc6sm1869265wmo.44.2024.04.04.01.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 01:46:53 -0700 (PDT)
References: <87zfuesz8y.wl-kuninori.morimoto.gx@renesas.com>
 <87sf05udnx.wl-kuninori.morimoto.gx@renesas.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: =?utf-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Alper Nebi
 Yasak <alpernebiyasak@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Banajit Goswami
 <bgoswami@quicinc.com>, Bard Liao <yung-chuan.liao@linux.intel.com>, Brent
  Lu <brent.lu@intel.com>, Cezary Rojewski <cezary.rojewski@intel.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Daniel Baluta
 <daniel.baluta@nxp.com>, Hans de Goede <hdegoede@redhat.com>, Jaroslav
  Kysela <perex@perex.cz>, Jerome Brunet <jbrunet@baylibre.com>, Kai
 Vehmanen <kai.vehmanen@linux.intel.com>, Kevin Hilman
 <khilman@baylibre.com>, Liam  Girdwood <lgirdwood@gmail.com>, Linus
 Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>, Maso
 Huang <maso.huang@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>, Sascha Hauer
 <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Shengjiu Wang
 <shengjiu.wang@gmail.com>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>, Trevor Wu
 <trevor.wu@mediatek.com>, Vinod Koul <vkoul@kernel.org>, Xiubo Li
 <Xiubo.Lee@gmail.com>, alsa-devel@alsa-project.org, imx@lists.linux.dev,
 linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 05/16] ASoC: meson: Replace dpcm_playback/capture to
 playback/capture_only
Date: Thu, 04 Apr 2024 10:46:13 +0200
In-reply-to: <87sf05udnx.wl-kuninori.morimoto.gx@renesas.com>
Message-ID: <1jedblplab.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


On Mon 01 Apr 2024 at 00:31, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> wrote:

> soc_get_playback_capture() is now handling DPCM and normal comprehensively
> for playback/capture stream. We can use playback/capture_only flag
> instead of using dpcm_playback/capture. This patch replace these.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Looks OK

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

> ---
>  sound/soc/meson/axg-card.c         | 8 ++++----
>  sound/soc/meson/meson-card-utils.c | 4 ++--
>  2 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
> index 3180aa4d3a15..21bf1453af43 100644
> --- a/sound/soc/meson/axg-card.c
> +++ b/sound/soc/meson/axg-card.c
> @@ -132,7 +132,7 @@ static int axg_card_add_tdm_loopback(struct snd_soc_card *card,
>  	lb->stream_name = lb->name;
>  	lb->cpus->of_node = pad->cpus->of_node;
>  	lb->cpus->dai_name = "TDM Loopback";
> -	lb->dpcm_capture = 1;
> +	lb->capture_only = 1;
>  	lb->no_pcm = 1;
>  	lb->ops = &axg_card_tdm_be_ops;
>  	lb->init = axg_card_tdm_dai_lb_init;
> @@ -176,7 +176,7 @@ static int axg_card_parse_cpu_tdm_slots(struct snd_soc_card *card,
>  
>  	/* Disable playback is the interface has no tx slots */
>  	if (!tx)
> -		link->dpcm_playback = 0;
> +		link->capture_only = 1;
>  
>  	for (i = 0, rx = 0; i < AXG_TDM_NUM_LANES; i++) {
>  		snprintf(propname, 32, "dai-tdm-slot-rx-mask-%d", i);
> @@ -186,7 +186,7 @@ static int axg_card_parse_cpu_tdm_slots(struct snd_soc_card *card,
>  
>  	/* Disable capture is the interface has no rx slots */
>  	if (!rx)
> -		link->dpcm_capture = 0;
> +		link->playback_only = 1;
>  
>  	/* ... but the interface should at least have one of them */
>  	if (!tx && !rx) {
> @@ -275,7 +275,7 @@ static int axg_card_parse_tdm(struct snd_soc_card *card,
>  		return ret;
>  
>  	/* Add loopback if the pad dai has playback */
> -	if (link->dpcm_playback) {
> +	if (!link->capture_only) {
>  		ret = axg_card_add_tdm_loopback(card, index);
>  		if (ret)
>  			return ret;
> diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
> index ed6c7e2f609c..1a4ef124e4e2 100644
> --- a/sound/soc/meson/meson-card-utils.c
> +++ b/sound/soc/meson/meson-card-utils.c
> @@ -186,9 +186,9 @@ int meson_card_set_fe_link(struct snd_soc_card *card,
>  	link->dpcm_merged_rate = 1;
>  
>  	if (is_playback)
> -		link->dpcm_playback = 1;
> +		link->playback_only = 1;
>  	else
> -		link->dpcm_capture = 1;
> +		link->capture_only = 1;
>  
>  	return meson_card_set_link_name(card, link, node, "fe");
>  }


-- 
Jerome
