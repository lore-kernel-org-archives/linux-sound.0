Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7273CB8E3
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 07:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779780908; cv=none; b=uE5zJvrCjVo/gfMGCJUy8pIyWQHrRkN8rJLberkZoJGRMSHQxm7i5N0pRDpqcPErLDqTi5fxEaIiALLJ7B8myvskww75iNcWdUbiRKC46p80gN7AO/Xwqxm5IdFVobUVAJLIosw995a/dM1LshbyXQ5Z1s4D0pEUZvFs/4NKJ8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779780908; c=relaxed/simple;
	bh=Ushy4Ylq5GNc8n8FXdKmtoYpGkXrC2FBgrzODvxj6tA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=j7PFUgaoUeI5qITLJMPmoUHYoygTUF7Pk3XkgbC4GxIcr5FggmZAQmUs+gFu3QCCQC4wdqtPwlMCM+OHM+Ufn9U6gk5K+40cju39NaoLL92DqojijSBa8dqqY51lMymxsHI2y0hhlOgwDLsdplVHTYuM+WVDREOKco4rheyvdzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=DPamDBm7; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="DPamDBm7"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso86763075e9.0
        for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 00:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779780905; x=1780385705; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0fBI1nWTJFqqlwGF/lWAIDboXe2QMBGB7s+bipEyCmQ=;
        b=DPamDBm7+EoG7kzyijAfEFVQG3zacOTq+LF+tpE/inBuMljtLMRY0yvg1dTBahc6LL
         r6cSWxNNwNG3bxYON2bmEUNl9RcnEe286/u6Z5imccy1cvhw4NjNQu2rFjWCCGACdZeZ
         N4ZGRUIEG4Bd7y1ffvGY1P3X9pW4bwI112rRhcohe8P5AMBZ9YaZiPz9I6kH6TjHtuDE
         U01nFRoOTdCBpPBNo+FJlo9jkq3ad8dFeSrLcv2jGIuBLkKAbogtYPo+ySjcFeP2ZdCH
         Br4A9SGoSN7Ih2CV+Y6+ztGj8nTmu2/CChmhBKL+JcTDTg9qVlsVCm1DVWrKohX6OisE
         kQ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779780905; x=1780385705;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0fBI1nWTJFqqlwGF/lWAIDboXe2QMBGB7s+bipEyCmQ=;
        b=sv05EtB+EG+loAi/M2f8tW4PI1HA2vap6bDQxfOZgsZ01ixGTnRZdRUF5U9ZqOlPWW
         Cq71MoLosR9IFVqbLeWtNwKtyJp3Hw3lNrW+8MrLW1S0babj04g4L/6dpCSMPYIKJIvD
         /1JOx2scfi2u/poovNZ9yzopTiTEFckhRAx6qHaBFXsnu6SUeC+BNlqmyI5o1cBr8q5r
         uuZq28A9qbRMLr3XFY9ihLgq/Zi6j9zZ6uXgyMhhpcAtFxmbqr3aX4RnUtDJ3MDnI6Sc
         lSIDoZNSEXHMCbBbXmXuRYP6rs5sOaSFvklrW+q1IbrJOYk3k0FUebKHo/AER4I4+f2P
         Fm8g==
X-Forwarded-Encrypted: i=1; AFNElJ8esM0TmhA4R9cNh/ViL51m31YKnrGl2kW2VKeopVcyT5QZNUWARFLB/Z7hRQ7T70B2n3S4DBERuf7GYA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNdAnI87tCG/SkEGVzOA+YSL1xoqUmvzJJ6+boa8MsMdibdc4/
	1f4g/XWhhX6KHYySri7lIBpjANFdukFyrBWKZZtt1X2u0r5fHd3IlrqJL6SQSctEZBg=
X-Gm-Gg: Acq92OG5KDjz8T13+ZVlOHMib7fnjTPElibL+jWTszCxZHeneGnfSfDAt9DCZnbFk5d
	aTUmFZU05MIK9B1/4fUR9KyeAvrB/FEE5f0NAvVYxApuXTZ7ITvBOrah38dMKKbK1wMsJwpFBgx
	55M02EI4xNuaRD7636cWUF6Q06L3jwxeqKdVP3LdngwCZE2RHjKkp8Q35eF+kn5QVqkbZbuJnYB
	DM99OCvUxroYTP4fZvzP7wG97OImeKJ0s8WnMR/rrglyzdMDhksMYk9BoqnMWoZTcSs//M66v3w
	cCCYbJLG1Efe0DwXxcKJmGFpgaUeNuoyf9BTCR76+S4164cr8xCeP9N1491WEXNIvSCNIx6yy75
	CDjwq0yt1wVquHy6m0IsHJgQbkLl36lf48SDTn6fdOrI6U34AwLxwMfxi7ezZwpXJjoLz85fYtz
	mbhCV3RopIBwDXIbUcNEFElcfiaulMXrUj
X-Received: by 2002:a05:600d:6450:20b0:48f:e245:394e with SMTP id 5b1f17b1804b1-490426dd0f7mr197920035e9.27.1779780905344;
        Tue, 26 May 2026 00:35:05 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:4a0c:b15a:3467:f4ed])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4904561f2dfsm287872015e9.12.2026.05.26.00.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 00:35:04 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: =?utf-8?Q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>,  "J.M.B. Downing"
 <jonathan.downing@nautel.com>,  =?utf-8?Q?Martin_Povi=C5=A1er?=
 <povik+lin@cutebit.org>,
  =?utf-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,  =?utf-8?Q?Uwe_Kleine-K?=
 =?utf-8?Q?=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>,  Alexandre Belloni
 <alexandre.belloni@bootlin.com>,  Alexandre Torgue
 <alexandre.torgue@foss.st.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,  Arnaud Pouliquen
 <arnaud.pouliquen@foss.st.com>,  Baojun Xu <baojun.xu@ti.com>,  Bartosz
 Golaszewski <brgl@kernel.org>,  Ben Bright <ben.bright@cirrus.com>,
  Benson Leung <bleung@chromium.org>,  Biju Das
 <biju.das.jz@bp.renesas.com>,  Binbin Zhou <zhoubinbin@loongson.cn>,  Bram
 Vlerick <bram.vlerick@openpixelsystems.org>,  Charles Keepax
 <ckeepax@opensource.cirrus.com>,  Chen-Yu Tsai <wens@kernel.org>,
  Cheng-Yi Chiang <cychiang@chromium.org>,  Claudiu Beznea
 <claudiu.beznea@tuxon.dev>,  Cristian Ciocaltea
 <cristian.ciocaltea@collabora.com>,  Daniel Mack <daniel@zonque.org>,
  Dario Binacchi <dario.binacchi@amarulasolutions.com>,  David Rhodes
 <david.rhodes@cirrus.com>,  Fabio Estevam <festevam@gmail.com>,  Florian
 Fainelli <florian.fainelli@broadcom.com>,  Frank Li <Frank.Li@nxp.com>,
  Fred Treven <fred.treven@cirrus.com>,  Geert Uytterhoeven
 <geert+renesas@glider.be>,  Guenter Roeck <groeck@chromium.org>,  Guoqing
 Jiang <guoqing.jiang@canonical.com>,  Haojian Zhuang
 <haojian.zhuang@gmail.com>,  HariKrishna Sagala <hariconscious@gmail.com>,
  Heiko Stuebner <heiko@sntech.de>,  Herve Codina
 <herve.codina@bootlin.com>,  Hsieh Hung-En <hungen3108@gmail.com>,  James
 Ogletree <jogletre@opensource.cirrus.com>,  Jarkko Nikula
 <jarkko.nikula@bitmer.com>,  Jaroslav Kysela <perex@perex.cz>,  Jernej
 Skrabec <jernej.skrabec@gmail.com>,  Jihed Chaibi
 <jihed.chaibi.dev@gmail.com>,  Jonathan Hunter <jonathanh@nvidia.com>,
  Kevin Cernekee <cernekee@chromium.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Kevin Lu <kevin-lu@ti.com>,  Kirill Marinushkin
 <k.marinushkin@gmail.com>,  Kiseok Jo <kiseok.jo@irondevice.com>,
  Krzysztof Kozlowski <krzk@kernel.org>,  Kunihiko Hayashi
 <hayashi.kunihiko@socionext.com>,  Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>,  Lars-Peter Clausen
 <lars@metafoo.de>,  Liam Girdwood <lgirdwood@gmail.com>,  Luca Ceresoli
 <luca.ceresoli@bootlin.com>,  M R Swami Reddy <mr.swami.reddy@ti.com>,
  Mark Brown <broonie@kernel.org>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  Masami Hiramatsu
 <mhiramat@kernel.org>,  Matthias Brugger <matthias.bgg@gmail.com>,  Max
 Filippov <jcmvbkbc@gmail.com>,  Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,  Neil Armstrong <neil.armstrong@linaro.org>,
  Nicolas Ferre <nicolas.ferre@microchip.com>,  Nicolas Frattaroli
 <frattaroli.nicolas@gmail.com>,  Nicolin Chen <nicoleotsuka@gmail.com>,
  Oder Chiou <oder_chiou@realtek.com>,  Olivier Moysan
 <olivier.moysan@foss.st.com>,  Paul Cercueil <paul@crapouillou.net>,
  Peter Rosin <peda@lysator.liu.se>,  Piotr Wojtaszczyk
 <piotr.wojtaszczyk@timesys.com>,  Qianfeng Rong <rongqianfeng@vivo.com>,
  Ray Jui <rjui@broadcom.com>,  Richard Fitzgerald
 <rf@opensource.cirrus.com>,  Robert Jarzmik <robert.jarzmik@free.fr>,
  Samuel Holland <samuel@sholland.org>,  Sascha Hauer
 <s.hauer@pengutronix.de>,  Scott Branden <sbranden@broadcom.com>,  Sen
 Wang <sen@ti.com>,  Sharique Mohammad <sharq0406@gmail.com>,  Shenghao
 Ding <shenghao-ding@ti.com>,  Shengjiu Wang <shengjiu.wang@gmail.com>,
  Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,  Support Opensource
 <support.opensource@diasemi.com>,  Sylwester Nawrocki
 <s.nawrocki@samsung.com>,  Takashi Iwai <tiwai@suse.com>,  Thierry Reding
 <thierry.reding@kernel.org>,  Tim Bird <tim.bird@sony.com>,  Troy Mitchell
 <troy.mitchell@linux.spacemit.com>,  Tzung-Bi Shih <tzungbi@kernel.org>,
  Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,  Vijendar Mukunda
 <Vijendar.Mukunda@amd.com>,  Vishwas A Deshpande
 <vishwas.a.deshpande@ti.com>,  Vladimir Zapolskiy <vz@mleia.com>,  Xiubo
 Li <Xiubo.Lee@gmail.com>,  Yixun Lan <dlan@kernel.org>,  Zhang Yi
 <zhangyi@everest-semi.com>,  linux-sound@vger.kernel.org
Subject: Re: [PATCH 69/83] ASoC: meson: use .auto_selectable_formats
In-Reply-To: <87a4tmgb4p.wl-kuninori.morimoto.gx@renesas.com> (Kuninori
	Morimoto's message of "Tue, 26 May 2026 02:25:43 +0000")
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
	<87a4tmgb4p.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 26 May 2026 09:35:03 +0200
Message-ID: <1jfr3e62u0.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On mar. 26 mai 2026 at 02:25, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> wrote:

> We can use .auto_selectable_formats. Let's adds it.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  sound/soc/meson/t9015.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/sound/soc/meson/t9015.c b/sound/soc/meson/t9015.c
> index da1a93946d679..085f771eb244f 100644
> --- a/sound/soc/meson/t9015.c
> +++ b/sound/soc/meson/t9015.c
> @@ -78,8 +78,14 @@ static int t9015_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
>  	return 0;
>  }
>  
> +static const u64 t9015_dai_selectable_formats =
> +	SND_SOC_POSSIBLE_DAIFMT_I2S	|
> +	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
> +
>  static const struct snd_soc_dai_ops t9015_dai_ops = {
>  	.set_fmt = t9015_dai_set_fmt,
> +	.auto_selectable_formats = &t9015_dai_selectable_formats,
> +	.num_auto_selectable_formats = 1,
>  };
>  
>  static struct snd_soc_dai_driver t9015_dai = {

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
