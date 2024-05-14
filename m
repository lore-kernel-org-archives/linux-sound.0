Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA49E144D01
	for <linux-sound@vger.kernel.org>; Tue, 14 May 2024 14:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715697233; cv=none; b=RcW52zZZMMJeRtGkkiRg6m1R437GcsoTeIam9AOMKxSYvuLkKN+rIoMQsFu3rTdkLK3N8Dgl5y7RWX08L6BzVtb3kS2QIqpinRytZ01Vx2C2goN56ICkt7h893M5BVi+3BsJLSvanCXxHPB2MBm2SSIRUbEYEozKBEa8DbuZOyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715697233; c=relaxed/simple;
	bh=+IxW0MEtemQ59ohxen6OsJDtFiyIBSyf4pXlzCYNPeg=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:Message-ID:
	 MIME-Version:Content-Type; b=TiFteT8Ao3hQP1ZpGftgtkG8rUifhZb417UsvKIRVpcHPTdig9nYHNMK49sQ7ueEBzul+DlSdnHF8JgpmX9UTfJxC6nd3lCoU0e8WKTqIUbfXpQ20zq9IqcIrQOX7e4Y0VjEflAAkSrlaiA4pk3NBcIxMogFF4xEpVgEgPyfOho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=RvJPKFfn; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="RvJPKFfn"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2e45c0a8360so59268101fa.3
        for <linux-sound@vger.kernel.org>; Tue, 14 May 2024 07:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1715697230; x=1716302030; darn=vger.kernel.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=2HpNVPq3YKqLVtMUiQ9jyLRuvtM9nOeWOTnThXBUYyw=;
        b=RvJPKFfnUEwRr81KmvQ1Z57JbxUyYZ8tfEHdTLmtQRhFWuBnG+L2/jj0KJEEGnjJB8
         hAQAgxCg2BBclw6EXv7ugU8BLuWlZJ0bID4lIjHRVbNihKT6jYYFEJS4gx2eAGWgS6bT
         57eo1o109BgPROTUoDC5Hbb24u4cmkxms8p6OWAREWibJ7hvSXA69VKVK+o+v0Ia7pDt
         nzHZqRQ+F2rQWENaghowxQoGtY/4KVuA5jVxWscJfZfYyu3PcDS7IP/UKF5Y0ABPDeWt
         6X2bNmr6S4kEF6RJLRX1x3VHydBPq9COnsy/8ueMSPDF27kx3BX1rN/5WaL6xELnyOJF
         S5JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715697230; x=1716302030;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2HpNVPq3YKqLVtMUiQ9jyLRuvtM9nOeWOTnThXBUYyw=;
        b=UN1rVtysmGfJCQ+3U2w65JIjOvDHrN2W5JtE6fenucrtSPwIctntchesoy/gjgH80R
         Mjb9wTCM4IPrJNdOgTNEt8/CS+hyN7A2omkyGMn4dmXb5BLcXerirsKuLmta+suUo2EB
         YS2Km17hUWlk/HAfgaNEIJl7GJO0o8FUtpNHIL8i1r4safbv3IxZwJbniJrXQfQJm3pO
         rh4OIg9nh8lbXV7k967XP/hkP7KujkJoXnhMyD22gTNGYBa0tXR60P9cZjvMVlkB5CAN
         uFAH2EsftxnjUqZo2oAqQZAE15ZoY8zV3YCyOweaARyf4a2UTwdN78/xn0ZSl/t15RT6
         AdMQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6pYXuwv3EZIzLcpbCQcnA9ujNK24xX2FXQIXsE/ovgrJgObpVH1eZoLjQDvZvY96S5yrAyjqeyoJMqDKwb06K1/lSCCO9Gr0dQoo=
X-Gm-Message-State: AOJu0Ywr7G9bovt5vt6nCP0ROPt6S3DbsaFJlSrlmgc7Ww60/Spv1go2
	GAo2tZ2vwDR30oJZ8kq2umliyGNX3DKtKDczppByRM071Gq1AuJOz0/NU2YTocw=
X-Google-Smtp-Source: AGHT+IFD4/QQf7DSCFn7BpKaHqZVvWjrhBM0s1pr0jlg9Ch9ima5C7dw+J80WKNKg5qjzUacSgKW4Q==
X-Received: by 2002:a2e:a175:0:b0:2e3:3b4e:43e4 with SMTP id 38308e7fff4ca-2e5204b2ed4mr86104081fa.32.1715697229984;
        Tue, 14 May 2024 07:33:49 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:3f47:f219:de13:38a7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502b8a76e6sm13856362f8f.62.2024.05.14.07.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 07:33:49 -0700 (PDT)
References: <87o79azh65.wl-kuninori.morimoto.gx@renesas.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: =?utf-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Alexandre
 Belloni <alexandre.belloni@bootlin.com>, Alper Nebi Yasak
 <alpernebiyasak@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Banajit Goswami
 <bgoswami@quicinc.com>, Bard Liao <yung-chuan.liao@linux.intel.com>, Brent
  Lu <brent.lu@intel.com>, Cezary Rojewski <cezary.rojewski@intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, Cristian Ciocaltea
 <cristian.ciocaltea@collabora.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 Hans de Goede <hdegoede@redhat.com>, Jaroslav Kysela <perex@perex.cz>,
 Jerome Brunet <jbrunet@baylibre.com>, Jiawei Wang <me@jwang.link>,
 Jonathan  Corbet <corbet@lwn.net>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>, Kevin Hilman <khilman@baylibre.com>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Maso
 Huang <maso.huang@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>, Sascha Hauer
 <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Shengjiu Wang
 <shengjiu.wang@gmail.com>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>, Vinod Koul
 <vkoul@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 alsa-devel@alsa-project.org, imx@lists.linux.dev,
 linux-doc@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 0/3] ASoC: grace time for DPCM cleanup
Date: Tue, 14 May 2024 16:31:55 +0200
In-reply-to: <87o79azh65.wl-kuninori.morimoto.gx@renesas.com>
Message-ID: <1jttj0xy2b.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


On Mon 13 May 2024 at 00:31, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> wrote:

> Hi Mark, Pierre-Louis, Jerome
> Cc each ASoC driver maintainer
>
> As we discussed in [1], we don't need to use dpcm_playback/capture flag,
> so we remove it. But we have been using it for 10 years, some driver might
> get damage. The most likely case is that the device/driver can use both
> playback/capture, but have only one flag, and not using xxx_only flag.
> [1/3] patch indicates warning in such case.
>
> And because of its history, DPCM has been checking CPU side only. But it should
> check Codec side too same as non-DPCM. Some device/driver has been bypassed
> this check. It should be error. [2/3] patch indicates warning in such case.
>
> Because dpcm_xxx flag is no longer used by [1/3] patch, 
> snd_soc_dai_link_set_capabilities() is no longer needed. [3/3] patch remove it.
>
> These adds grace time for DPCM cleanup.
> I'm not sure when dpcm_xxx will be removed, and Codec check bypass will be error,
> but maybe v6.11 or v6.12 ?
> Please check each driver by that time.
>
> [1] https://lore.kernel.org/r/87edaym2cg.wl-kuninori.morimoto.gx@renesas.com
>
> Link: https://lore.kernel.org/r/87edaym2cg.wl-kuninori.morimoto.gx@renesas.com
> Link: https://lore.kernel.org/r/87wmo6dyxg.wl-kuninori.morimoto.gx@renesas.com
>
> v1 -> v2
> 	- tidyup Codec check warning output condition
>
> Kuninori Morimoto (3):
>   ASoC: soc-pcm: Indicate warning if dpcm_playback/capture were used for availability limition
>   ASoC: soc-pcm: Indicate warning if CPU / Codec availability mismatch
>   ASoC: remove snd_soc_dai_link_set_capabilities()

For Amlogic, with the change sent as RFC on this series.

Tested-by: Jerome Brunet <jbrunet@baylibre.com>

>
>  include/sound/soc-dai.h               |   1 -
>  include/sound/soc.h                   |   1 +
>  sound/soc/fsl/imx-card.c              |   3 -
>  sound/soc/generic/audio-graph-card.c  |   2 -
>  sound/soc/generic/audio-graph-card2.c |   2 -
>  sound/soc/generic/simple-card.c       |   2 -
>  sound/soc/meson/axg-card.c            |   1 -
>  sound/soc/meson/gx-card.c             |   1 -
>  sound/soc/qcom/common.c               |   1 -
>  sound/soc/soc-dai.c                   |  38 ---------
>  sound/soc/soc-pcm.c                   | 110 +++++++++++++++++++-------
>  11 files changed, 81 insertions(+), 81 deletions(-)


-- 
Jerome
