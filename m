Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC07827A934
	for <linux-sound@vger.kernel.org>; Tue, 10 Jun 2025 07:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749539133; cv=none; b=eivXMiNOrSR0spoQDFG9hbZZ8r070T1nZ5kwcpfe9Z2fF+ZT8wh0d7+kKVccr0BkLLlcH2eRY7+FRujNPIAmiXr6qnwUtzNUGn3LnZgPLajFVGP+pfC8L2ysqUuy0Hu4pBuudX3UkiHZJ4YTJs9MqmBzGBhxnHv2rHmgtWvsyGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749539133; c=relaxed/simple;
	bh=gBA8JafE95MWlxs5sZ2KInpyqleCRi68o0Dh5EdscbQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mg+p04U7HewY2p0Pv4Dc/1XDoskF9mRze3AgoBPua08+cgeaMEnq+SBkeENDAdKyCxDG3/B7wfMkdaDnXfRa/3XgAowkmcfJkt38iFs5Gzcv9X5p6C9Ag16+UT1GOj+msVGUO58VWhKWoq6aH14dUnMtqsImGs43Pfu5b/fxIEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=es7OQgSj; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="es7OQgSj"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a525eee2e3so3795662f8f.2
        for <linux-sound@vger.kernel.org>; Tue, 10 Jun 2025 00:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749539130; x=1750143930; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QEa70IJ+MkoA2RIUjQbX1SaNZIKdi90h/AeST+XgJ1A=;
        b=es7OQgSjPknmEp/2EgIYFz14j5RCKFB49W+b4vFMpv6wElZvPhF1q+IJGAncbGWnMy
         LcOkBAja3zjpfWy9IFrXM9LvnCB+VXuVwVA9OTR3hH3wpFzKGBI5Td+yuQml6Q4vBvvo
         IfS0qT1wqY/SpTxS4AJ89vqo9oMaBnWt2AWegLsB8Rdv4CLR6J1BtSU2N8zKDLnM7kK2
         ++akAEa7P5c5GtqVrO5W/f0t/Axj+Upjy8bHOEKaq17GZqZZ2Pj9e0BVhzLGkRMnFrN6
         EQ5C0BWYmcpKYPB0D9YuXcdjbES6wiSOca8Xqbr6y7Dl4MIJ9tS79kVgT3R6791CCgVl
         X2pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749539130; x=1750143930;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QEa70IJ+MkoA2RIUjQbX1SaNZIKdi90h/AeST+XgJ1A=;
        b=KOIXLNkAs5lACZye61tBbjZujqzITNoJtiHIdncSg3Q/9AD6v/aCgQ0CkD6NhLx8Bo
         cWk5Y+91vqqmDZUN9CnkNTqdVnqkYfZfoyWoiVEWve6bWeWS1LUWgvtQs1vQ7MMrkeWk
         yStXaAsXY7ZvBlc4tOtTtnOQx+oIxQtnFO6s+l8SAG6qJKpFvFWslMdu7CDwh53bu5J4
         vxCE3hzZzDMIlgHOaL0P3d2WzFtvPHESW9HYDjv0+NlQn1Mto4eFaCE6oVdx0K9uaYqi
         lcqdAn7/wnsWHQMP1QUSx7xg48xLJFqrtkDD4TO0HlR9zFKWMUObYlyiJUo3xVDsr3o1
         0mqQ==
X-Gm-Message-State: AOJu0YxNSvoGkUCGI1UgToHfCWEUonSVpmnIyi4RJu9RNrxKKzgSLv/O
	aVod/q0ZYL3AtgoRlKjv00wb+f86z3HRrjeVW0wnRlttoT+qkjnquUnL
X-Gm-Gg: ASbGncvHqXguZ5AYoPM7dNJTRRtb5c8D7u2ByYRX3dlp/DrsuOp2I4QnMDAW2H5YC4S
	E9dDk6dy5xAJ4P0TfUpeegAP09ZzKVLhik6xplOxLtVB1CV4zHhLsdXCrp/2YHlveACdVmr3f4Y
	CYSxShB+Iw8GwBbObb4cmkNwOxEPg6lo5ckA2PNxKR3v718TrV7tZnTBrzhHDfEE4OalTpbAaTs
	UixdE+N65dgys9rMHPQdECRKiFqfZFDKlRCUJpXoiJeO+pyhvTXL6iJwtYQxbaseiFqn6kLC5Ny
	x6RyiB1CrybZOQK/7NZUaTqOsOQzo4UF3vIpXAdUmaraQDbpUVYhP9qNKs9vO+sPa880x5QNSq2
	CFHYqaGLse4xizPtVkZfTc8fN83GNnh0z/jfrpA==
X-Google-Smtp-Source: AGHT+IHQgetGkKt8zRxMITHBgsMBGSi/nB20WB4xa8Aac8TZNnDAE/9ALfyf2EtrGo48lKeErzF+fQ==
X-Received: by 2002:a5d:64cd:0:b0:3a5:27ba:47ba with SMTP id ffacd0b85a97d-3a5319b5e30mr10051449f8f.44.1749539129798;
        Tue, 10 Jun 2025 00:05:29 -0700 (PDT)
Received: from [192.168.178.112] (p5dc22aab.dip0.t-ipconnect.de. [93.194.42.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5323ad414sm11585118f8f.31.2025.06.10.00.05.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 00:05:28 -0700 (PDT)
Message-ID: <2f9e2735-a95c-4839-ac8b-ad5d5fdc4012@gmail.com>
Date: Tue, 10 Jun 2025 09:05:26 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 32/37] ASoC: mediatek: Standardize ASoC menu
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Andrei Simion <andrei.simion@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Paul Cercueil <paul@crapouillou.net>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Heiko Stuebner <heiko@sntech.de>,
 Daniel Baluta <daniel.baluta@nxp.com>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Michal Simek <michal.simek@amd.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Yu-Chun Lin <eleanor15x@gmail.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Nikita Shubin <nikita.shubin@maquefel.me>, Arnd Bergmann <arnd@arndb.de>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
 Binbin Zhou <zhoubinbin@loongson.cn>, Keguang Zhang
 <keguang.zhang@gmail.com>, Alexandre Mergnat <amergnat@baylibre.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Sameer Pujar <spujar@nvidia.com>
Cc: linux-sound@vger.kernel.org
References: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
 <871prs6x8s.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-GB
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <871prs6x8s.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/6/25 06:23, Kuninori Morimoto wrote:
> Current Kconfig menu at [ALSA for SoC audio support] has no rules.
> So, some venders are using menu style, some venders are listed each drivers
> on top page, etc. It is difficult to find target vender and/or drivers
> because it is very random.
> 
> Let's standardize ASoC menu
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

I wonder if we really need to split this up into patch per vendor if we 
could do the whole thing in one go. Anyway for the MediaTek part:

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   sound/soc/mediatek/Kconfig | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
> index 90e367586493d..9dfaf3d1dde66 100644
> --- a/sound/soc/mediatek/Kconfig
> +++ b/sound/soc/mediatek/Kconfig
> @@ -1,4 +1,6 @@
>   # SPDX-License-Identifier: GPL-2.0-only
> +menu "ASoC support for Mediatek"
> +
>   config SND_SOC_MEDIATEK
>   	tristate
>   	select REGMAP_MMIO
> @@ -319,3 +321,5 @@ config SND_SOC_MT8365_MT6357
>   	  boards with the MT6357 PMIC codec.
>   	  Select Y if you have such device.
>   	  If unsure select "N".
> +
> +endmenu

