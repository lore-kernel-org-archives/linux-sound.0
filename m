Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1CE29D19
	for <linux-sound@vger.kernel.org>; Tue, 10 Jun 2025 19:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749583256; cv=none; b=G8wrMz/mv7qyexCY10ReOdesCk75rM7O0aF8MJROllU6YtF162uQEqR9Z4uaKd+HlkloPkJwXiLY87hiRedHoUBVAvoOrL2nul5wefXRabx/MCZjnJ/STYhl1Q6P3Redi90rM93TMDf/HxHItXXNN6pa4Shlmh70rLJ/CsIXx+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749583256; c=relaxed/simple;
	bh=28Io3l7WGBI63HaRoxfh5pLtvR4Ou+326spmLKBn5SA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XsU6yojRuI1uM+mjg+iMgV6jbVUIdYHyjypUA8RBOuSoVEe7xImzRejDN+7ocsRcsxXaqTiO9OOexTZY6ZKYOrBh5eHBvWZOhd99PMOz0AVUbLJCoocE/PRkuHKoCUgAKnDeaaHIQ2BgUBXjwnBiA4GC38tCmQ8SOK4B7UIvg+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dzXwzfxC; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dzXwzfxC"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a4f72cba73so111615f8f.1
        for <linux-sound@vger.kernel.org>; Tue, 10 Jun 2025 12:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749583252; x=1750188052; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5qbdguUBoksiA0TbGE9QOfjLmHrXyDm5ah6hhIfpV3k=;
        b=dzXwzfxCCCHKXV4g0T3tYOpPPtHEfueBY7iHK4IrhtPJHZxXGsiyQ82Eb7PrcoBtuR
         KFBgTTzyGM3gCk0lEVYIHDi9EAhfCpM6YVP8Kfkry84TILaq3gloWsQnE881TQJbpU+C
         w4W9V9IAV1RbaJjXTrMIscvmE/ae8owUkOSEGN4LlDjApjrXHNzI/dXnUrNSyIyx1XzK
         q2ZwxfQ3/xYU2Bf2ujjr0uBgkc+k1qi9Xg6lMb0PbtVIrq5NR/Tc/d3PMfLN9f1mKuH9
         uRcYtgHOfDy+0lvqAzJ5FIA5cThhR0edWzTBzdlriUt1ZUP+jrKAzichh9nd9iG1uw6h
         /L6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749583252; x=1750188052;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5qbdguUBoksiA0TbGE9QOfjLmHrXyDm5ah6hhIfpV3k=;
        b=AiyRd70Q7Lh2V+IVd1RFkCh35RVKW61vDyCoa0qU6jaMhACOc5y3quq/Txs1a/hBMr
         CMv8efxJrdNylwE5HSNPk+x+ob13da4UjxdCC1A0NwbzZSya48cnraVUDcUen8DAAt/+
         KkXWEBaZSbE3hCutRsFxR9lpZ7ryUXo8M+KY/auoBBA5bgr2slkcCcMZjgugnMYsKvdD
         Ao0Fy2l3yQaCQIQm6soRPky7+RrqNVgkOzixWG/AcU9WhLwr+HumqoX3/O97e3jpOWjn
         /KoQjfG8uNVVOC1N9WeA9mccdI+7H9a1qgKB5Qw8vwaVBp+gufpjDqbPeGp3LRyVXXfI
         WeRA==
X-Gm-Message-State: AOJu0YwjwY5gi7wFWi2hXQ+lJv2N4woA12Q9iwxUO+qQ5+/CwOLrqy9G
	c+4+mKsLGEEV1MLMKp1L7VCB7y/FDQitX7rFVJPQWdGt3aK7f3p2b3K5
X-Gm-Gg: ASbGncsQv+0Oip818A+SBy8AxFcg2sri+3JD+XpLfQbjp6zmNXI0Nl/XxuZ1NOnFV14
	QuNYoNUKVImBpxEHP7byLnaFygj2Ox9pxMQ1vOy/Vrt0hMCZ5dHshiCOFOryjOCzrDfNfyt+CwJ
	TbpPWZal+jGbjjPP/Sh90VtMqZKhd8oZXpWIxT51gGbDncs7MydM+kJxRkyuGkjGbUtvIDelCen
	gS6kXNbNz6UY0XEf24RIzAzxMbqOBsYndlA6bIp+g44VJbwFRdRRh7brHpwD1E+9/TVGOw057zA
	q+/c1CXkMqrIOz/3npaqcFilC67UFNWfPiwE9CrIE9kUlt5+VQaeVNcjDyjw6hVomOY52cgpvNV
	guTjtPw==
X-Google-Smtp-Source: AGHT+IE9UvN4X+zOClDQ2auagsw6VVOgBVyRleK041W/FpbY5zljymRyGQfQzhfqbeJKZcVt8ZWdJQ==
X-Received: by 2002:a05:6000:430e:b0:3a4:cec5:b59c with SMTP id ffacd0b85a97d-3a55826b355mr512355f8f.25.1749583252155;
        Tue, 10 Jun 2025 12:20:52 -0700 (PDT)
Received: from giga-mm-5.home ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45324458214sm2973005e9.0.2025.06.10.12.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 12:20:51 -0700 (PDT)
Message-ID: <bf738d4c2a0cec7b216e4f4b258c32e3fbc419a8.camel@gmail.com>
Subject: Re: [PATCH 23/37] ASoC: cirrus: Standardize ASoC menu
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown	
 <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, "\"Martin"
 =?UTF-8?Q?Povi=C5=A1er=22?=	 <povik+lin@cutebit.org>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, Andrei Simion <andrei.simion@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Cezary Rojewski
 <cezary.rojewski@intel.com>, Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>, Bard Liao
 <yung-chuan.liao@linux.intel.com>, Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>,  Pierre-Louis Bossart
 <pierre-louis.bossart@linux.dev>, Paul Cercueil <paul@crapouillou.net>,
 Shawn Guo <shawnguo@kernel.org>,  Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam	
 <festevam@gmail.com>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang	
 <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Heiko
 Stuebner <heiko@sntech.de>, Daniel Baluta <daniel.baluta@nxp.com>, Orson
 Zhai <orsonzhai@gmail.com>,  Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Arnaud Pouliquen	
 <arnaud.pouliquen@foss.st.com>, Olivier Moysan
 <olivier.moysan@foss.st.com>,  Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai	
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland	
 <samuel@sholland.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan
 Hunter <jonathanh@nvidia.com>, Kunihiko Hayashi
 <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Michal Simek	
 <michal.simek@amd.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Mario
 Limonciello <mario.limonciello@amd.com>, Yu-Chun Lin	
 <eleanor15x@gmail.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Nikita
 Shubin <nikita.shubin@maquefel.me>, Arnd Bergmann <arnd@arndb.de>, Vinod
 Koul <vkoul@kernel.org>,  Shengjiu Wang <shengjiu.wang@nxp.com>, Piotr
 Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, Sudeep Holla	
 <sudeep.holla@arm.com>, Elinor Montmasson	
 <elinor.montmasson@savoirfairelinux.com>, Binbin Zhou
 <zhoubinbin@loongson.cn>,  Keguang Zhang <keguang.zhang@gmail.com>,
 Alexandre Mergnat <amergnat@baylibre.com>,  =?ISO-8859-1?Q?=22N=EDcolas?=
 "F. R. A. Prado\""	 <nfraprado@collabora.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Sameer Pujar <spujar@nvidia.com>
Cc: linux-sound@vger.kernel.org
Date: Tue, 10 Jun 2025 21:20:59 +0200
In-Reply-To: <87ecvs6xa7.wl-kuninori.morimoto.gx@renesas.com>
References: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
	 <87ecvs6xa7.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2025-06-10 at 04:22 +0000, Kuninori Morimoto wrote:
> Current Kconfig menu at [ALSA for SoC audio support] has no rules.
> So, some venders are using menu style, some venders are listed each drive=
rs
> on top page, etc. It is difficult to find target vender and/or drivers
> because it is very random.
>=20
> Let's standardize ASoC menu
>=20
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

A nitpick below, but other than that:

Reviewed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

> ---
> =C2=A0sound/soc/cirrus/Kconfig | 3 +++
> =C2=A01 file changed, 3 insertions(+)
>=20
> diff --git a/sound/soc/cirrus/Kconfig b/sound/soc/cirrus/Kconfig
> index 97def4e53fbc7..6c68c54baaf9a 100644
> --- a/sound/soc/cirrus/Kconfig
> +++ b/sound/soc/cirrus/Kconfig
> @@ -1,4 +1,6 @@
> =C2=A0# SPDX-License-Identifier: GPL-2.0-only
> +menu "ASoC support for Cirrus"
                          ^^^^^^
It could have been at least "Cirrus Logic".

> +
> =C2=A0config SND_EP93XX_SOC
> =C2=A0	tristate "SoC Audio support for the Cirrus Logic EP93xx series"
> =C2=A0	depends on ARCH_EP93XX || COMPILE_TEST
> @@ -31,3 +33,4 @@ config SND_EP93XX_SOC_I2S_WATCHDOG
> =C2=A0
> =C2=A0endif # if SND_EP93XX_SOC_I2S
> =C2=A0
> +endmenu

--=20
Alexander Sverdlin.
