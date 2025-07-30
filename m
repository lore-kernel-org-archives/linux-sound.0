Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB0B12B73
	for <linux-sound@vger.kernel.org>; Wed, 30 Jul 2025 11:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753875835; cv=none; b=fGvruEa+LgfaflTSBRNpQjJ0uhFAEDgQD+gj+kVUFIRZp5S8zUYOE1kbLG1IXTOWaMOs0TMLhIU7AJQ05YLOICp/QJJTql36gQS9t7DB1EvfATDw8X46Ln6ssZwg8haITfotTazlw8AOs0BZfc4SjVCSHXAyW2Im0DHPkrt9b6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753875835; c=relaxed/simple;
	bh=YKwEkBv+zcxZ5CnLI0DOcUCph/S+8OXX2QFQ/jtSiY4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t52xKmr9HjLI2dNwFGYa0wxAagyVaB2/tHZOKSPEDzVaVN48ZGSFk2ajgeWdCIZqKYy438RRy9e7NwUbiMZhc+wbXo35s3hvU9LChAv3LjI/NqHZjR1cxaAZ1bpQbP7e7wZNtdlXY0C9AQggmse0J4aEPywDezohdpb/Tawteb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-2ebb468cbb4so4977370fac.2
        for <linux-sound@vger.kernel.org>; Wed, 30 Jul 2025 04:43:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753875832; x=1754480632;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U4ePll4jKSmfhPgvgCV4Exq68RfI1ZOKQgfk5nSLlbo=;
        b=u4T0EnoH8YnQzvW8M6FKEEZkbwWbHOeZx06nAKn2zYOcka+ne5c9Ldt8tzvKBM28a0
         rfya1+Tx/9PklTGcam+Tol4Mq7SZj823SztfdKwF8e3uKH8JMSmQ1LtJLXmxG156wi/+
         c+dB5EqIURx7uam5r5e5aR1QOg6q6vyY7jEK5o+8kHI/8yaeKbTJxczGceWv9smxBXAr
         oc6M8Xb8/fXn0Nvpk1FPRyBUWZX+vmVyoWAFgaa3RC7Layib7qN4+An3ATKL+DoANO/c
         Wrry0gFlqYpzcOkQqtrquc1Pj5BKWzakaIKLOZs6G8urzSxiFBlwon4j5/y2cDGyYJDM
         oSQw==
X-Forwarded-Encrypted: i=1; AJvYcCWUEd8hcm8IkGZJpQWMPtIG85kfP1W1VCIakk6Q+2x1RXZsHBBrHQaKE9uLgzh3bvXYQgOk0aj2QMLAew==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhtmTgpQJBNFGgsXVD+Tks6uJdP8zIOkMkiD0tY4OxLTemwUQA
	8WZxkevkzoY0iW1/FFjHx+Juq0fDXCLtNfXo4yIRt2rLDyB5AbLMOB2UIqPoJ9gmhb8=
X-Gm-Gg: ASbGncs23U+KQpaBIom3c4sKuJyByjkSY+Zmb2D7zrx4D/9fcHrPGiHaft9+AFdqdfn
	bRp5cbEnAIivt3CZqtLaKOz/3pC5kmYDvlRIvViuHttlpm3ngTWYuVQSQAmFlTpS7HUK9GGStPC
	Vfuzq9hr8QioV8ptM8dJUFqiOc0XKt6YUbb4L3MFMOUtODn0SxcghI+f1qwAwBPaZ4L1hpX3N7g
	eRGcXy/3ZPfnlD15+7UQpT0wHSkWAi/+da2uTx4VRFpDFK/w7UTS3ei1Anxr73IQSiWepikdKz2
	rsFTejVglwmMjQpt7BEohbdz/ZzsStJ6beIRoJTam5XeecF3e+SpXLvBm7AWgMXYKOb9cykHMe2
	9caVEoWGL2cX/pCkV4rtYHElMHr7XyAtTv5JEQgxYVJpeh0Q8gk3Y0Tch9YUNypK3
X-Google-Smtp-Source: AGHT+IEpUI7W1o5UnqHtgqSEHCZmrYrNUbtP3DTG6sOTozJXzzIlD3O57MGGKCx6CBSvjPVM3M+Pdg==
X-Received: by 2002:a05:6870:ce81:b0:302:5dba:5ae1 with SMTP id 586e51a60fabf-30785cea042mr2139925fac.29.1753875832424;
        Wed, 30 Jul 2025 04:43:52 -0700 (PDT)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com. [209.85.167.171])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-74147f4c128sm1995783a34.11.2025.07.30.04.43.51
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 04:43:52 -0700 (PDT)
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-41c3addd37cso4295220b6e.3
        for <linux-sound@vger.kernel.org>; Wed, 30 Jul 2025 04:43:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUBJoXnsRtuLJyawwA827CAsIaBX0agfXb7pcTgwL/15XqU+7WzifjrITsvBnijiHi1cwk0a0erIE2kIQ==@vger.kernel.org
X-Received: by 2002:a05:6102:c01:b0:4fa:d2c:4fe with SMTP id
 ada2fe7eead31-4fbe87cc1edmr1946587137.26.1753875497254; Wed, 30 Jul 2025
 04:38:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com> <875xh46x99.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <875xh46x99.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 30 Jul 2025 13:38:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXOWCSa+c2p=G_gUqK0c_Bd4D1LjKYgE+XX0oq1xtvpeQ@mail.gmail.com>
X-Gm-Features: Ac12FXzMyAn_EM-Ac9XZSSThhYy4mU09f3TqewhRuK6XXySOawiZuhCkIFOh6i0
Message-ID: <CAMuHMdXOWCSa+c2p=G_gUqK0c_Bd4D1LjKYgE+XX0oq1xtvpeQ@mail.gmail.com>
Subject: Re: [PATCH 29/37] ASoC: generic: Standardize ASoC menu
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
	=?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andrei Simion <andrei.simion@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Cezary Rojewski <cezary.rojewski@intel.com>, 
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Paul Cercueil <paul@crapouillou.net>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Heiko Stuebner <heiko@sntech.de>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Olivier Moysan <olivier.moysan@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Michal Simek <michal.simek@amd.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Mario Limonciello <mario.limonciello@amd.com>, Yu-Chun Lin <eleanor15x@gmail.com>, 
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Nikita Shubin <nikita.shubin@maquefel.me>, 
	Arnd Bergmann <arnd@arndb.de>, Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Vinod Koul <vkoul@kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>, 
	Binbin Zhou <zhoubinbin@loongson.cn>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Alexandre Mergnat <amergnat@baylibre.com>, =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Sameer Pujar <spujar@nvidia.com>, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Morimoto-san,

On Tue, 10 Jun 2025 at 06:23, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> Current Kconfig menu at [ALSA for SoC audio support] has no rules.
> So, some venders are using menu style, some venders are listed each drivers
> on top page, etc. It is difficult to find target vender and/or drivers
> because it is very random.
>
> Let's standardize ASoC menu
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for your patch, which is now commit acc84d15e45393fb ("ASoC:
generic: Standardize ASoC menu") upstream.

> --- a/sound/soc/Kconfig
> +++ b/sound/soc/Kconfig
> @@ -111,6 +111,7 @@ source "sound/soc/bcm/Kconfig"
>  source "sound/soc/cirrus/Kconfig"
>  source "sound/soc/dwc/Kconfig"
>  source "sound/soc/fsl/Kconfig"
> +source "sound/soc/generic/Kconfig"

This sort of hides the generic menu in between the Freescale and Google
hardware-specific menus in the "# All the supported SoCs" section.
What about moving it either before or after "# All the supported SoCs"?

>  source "sound/soc/google/Kconfig"
>  source "sound/soc/hisilicon/Kconfig"
>  source "sound/soc/jz4740/Kconfig"
> @@ -146,8 +147,5 @@ source "sound/soc/codecs/Kconfig"
>
>  source "sound/soc/sdw_utils/Kconfig"
>
> -# generic frame-work
> -source "sound/soc/generic/Kconfig"
> -
>  endif  # SND_SOC
>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
