Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D677227FD7C
	for <linux-sound@vger.kernel.org>; Fri,  9 Jan 2026 09:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767950273; cv=none; b=FIHl/kiVDhlUDhvg2CB5/0ui2bqai2ngc35mwVpOPWcagUA8IW/SoFZNWML5spYjEzQnX8nVqv3lHvCd4iAKnOnii/Wzdz4NXAQgchpnlAVPD+cXbNyVDDhfxdC89WdTW7KHOWi8Vz7XnL/Hfu2sfs490pIzkz3FLBFNUFL3zbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767950273; c=relaxed/simple;
	bh=jkqlllI9ujtp5Lp2sMuPyxtkYPfIHeWqGg5EZxuyct8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TGw/fz4nimusRCLxmBDiQX3kMR+vJBGphxFsZObwxOF0XueyvVrqRdf0v93dIIGzUXWIfq+lttN6dgj+sTB6/ki455OEgc5l47qgMrbmI7quyQEPh2Qiahrk0Gk7rmrWhnVrTUtZZIcsYuBreLJoA6PVzkgDn+LkWdrz2e4yvWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4f1b147eaa9so32549531cf.3
        for <linux-sound@vger.kernel.org>; Fri, 09 Jan 2026 01:17:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767950271; x=1768555071;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1QsH4NCArTeh+pgn8C011Ry8KvjvdWLiGEJ42XE3z1Q=;
        b=FRaGTriDh6VmpChNVbQR7TKUyT4Dz5yWG8+rgJfYCNZDbnSeU6a2P/pioLawTC8pXC
         9YmUlTix+SBHE0c9BfiuPwraNuQ8XwvYOkbgVdMd5rL0IrwKKNOkp7n7OnC3EepFNePX
         PTG4zoZ1663PMgi5UXgyZw6rVRn9TL8rJm+n4N9R1Ij0QVzlDPOcsbwc4Ja4Mt+HD5HF
         dfr6ki+on+urOxu30jlK5dYtSZjnA/+dYavlnDadx9ChXrxld5+b9MzPFOyIyoEAcpN2
         Gwpu58xX84OYA/GBHcXjxCw7MUE4WRzLR7uMP5ofYdBSRLiRzL0RGccq6HVkLE+A9ui/
         PaJg==
X-Forwarded-Encrypted: i=1; AJvYcCWtPTtGBsveGtG/p0zG7SwkShNPXQmFzxj4OdqVEs09mFUwNXQYjl4/PtMuu1pW6BN5qzODZDak6SFLUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyI9b1LEN2puqNM3rcP9tOIRQMHPZg5M6NEAmnq0GO8wumqzUHT
	3C1DrQFraNojNyRQ/pgBwVKO19fkTE3o6ksqLzwBYd1ITI35RW73XGwOunkPhIZ8
X-Gm-Gg: AY/fxX7B5b8PjkUStHW8at5aD/WOUdB6VejPIX2fZmkdCVP8VzDprPb8z8lekQDjy6q
	LqHOkNHEZafQ8kenLc9jP9xaG5P3cWluOq+O+MGYvmhoimTogdjto3DL7jutQWyEN0/MRx8h0Ep
	N4vt783Yjwc63yQszbTZJaJIRuoNR7DMQ7gJ1d0zuMDUiyt2SsvTZ55s1YSuKNm3dJXUIA5sS20
	bcNmXwWgWXvzThat4Mq+OpFZ+BCB68isLTfLUlwEXQjgJkKBVpS8zP4rEqX5o4tjzTB6jdKD0oV
	4UQrxMybFtWwWYc8h+/3Tk0Q0qGCN6K2tzAlvQ1PTzB+IF0QD2k9WsEJTZ0b7soWFUawcB94esP
	KWBd5F245LhqAveFEciaAepOqdgunnckQybCK8XDJghdx3SSbpS+85hDr1hc86wJqVL4Qwauadr
	LCZHxJcsfQ9ee0/VoB/okCuJjeUBz3wvGZV5qmtKZuK8xxKuoALKT9
X-Google-Smtp-Source: AGHT+IGdOmNCxkac60Rsw4CQS6XdDnXtNN1jwiVemLMepOoR34d8MipErLFslmpJH1c3E8Ntc1FkbQ==
X-Received: by 2002:ac8:7fc6:0:b0:4ee:1676:faa6 with SMTP id d75a77b69052e-4ffb4958b6emr126240031cf.20.1767950270744;
        Fri, 09 Jan 2026 01:17:50 -0800 (PST)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com. [209.85.222.173])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ffa8d38e12sm65565011cf.3.2026.01.09.01.17.50
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 01:17:50 -0800 (PST)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8b1e54aefc5so355021285a.1
        for <linux-sound@vger.kernel.org>; Fri, 09 Jan 2026 01:17:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWb0f3PlwhGrS5LwNf053Pf9mlpIqznMQsQ2z5oWLPp57eAfOiX6nCwcq6bavnEjzoAKbVz16vnmO55eg==@vger.kernel.org
X-Received: by 2002:a05:6102:3e1b:b0:5db:d60a:6b24 with SMTP id
 ada2fe7eead31-5ecb68a5bcamr3135494137.22.1767949965924; Fri, 09 Jan 2026
 01:12:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260108203004.3538449-1-andriy.shevchenko@linux.intel.com> <20260108203004.3538449-5-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20260108203004.3538449-5-andriy.shevchenko@linux.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 Jan 2026 10:12:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXHpePT_0wRMqFy=UsyQpMsUGWTG30_S95n7yePEr89Ug@mail.gmail.com>
X-Gm-Features: AZwV_Qiu4QT5egiVF0kpOh1nKIX91ZXppU1wZ2LC7e1cFqlECMypgggSHOEO-14
Message-ID: <CAMuHMdXHpePT_0wRMqFy=UsyQpMsUGWTG30_S95n7yePEr89Ug@mail.gmail.com>
Subject: Re: [PATCH v1 4/4] spi: Drop duplicate device_set_node() call
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>, 
	Varshini Rajendran <varshini.rajendran@microchip.com>, 
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sunny Luo <sunny.luo@amlogic.com>, 
	Janne Grunau <j@jannau.net>, Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, 
	CL Wang <cl634@andestech.com>, Manikandan Muralidharan <manikandan.m@microchip.com>, 
	David Lechner <dlechner@baylibre.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Jonas Gorski <jonas.gorski@gmail.com>, Hang Zhou <929513338@qq.com>, Jun Guo <jun.guo@cixtech.com>, 
	Philipp Stanner <phasta@kernel.org>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, =?UTF-8?Q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
	Shiji Yang <yangshiji66@outlook.com>, James Clark <james.clark@linaro.org>, 
	Jonathan Marek <jonathan@marek.ca>, Carlos Song <carlos.song@nxp.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Xianwei Zhao <xianwei.zhao@amlogic.com>, 
	Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>, 
	Sergio Perez Gonzalez <sperezglz@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Qianfeng Rong <rongqianfeng@vivo.com>, Haibo Chen <haibo.chen@nxp.com>, 
	Gabor Juhos <j4g8y7@gmail.com>, Md Sadre Alam <quic_mdalam@quicinc.com>, 
	Rosen Penev <rosenp@gmail.com>, Luis de Arquer <luis.dearquer@inertim.com>, 
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Longbin Li <looong.bin@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, 
	Alessandro Grassi <alessandro.grassi@mailbox.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Darshan R <rathod.darshan.0896@gmail.com>, Aaron Kling <webgeek1234@gmail.com>, 
	Vishwaroop A <va@nvidia.com>, Haixu Cui <quic_haixcui@quicinc.com>, 
	Darshan Rathod <darshanrathod475@gmail.com>, linux-spi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, asahi@lists.linux.dev, 
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-rpi-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, imx@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, virtualization@lists.linux.dev, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Ray Liu <ray.liu@airoha.com>, Sven Peter <sven@kernel.org>, 
	Neal Gompa <neal@gompa.dev>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Ryan Wanner <ryan.wanner@microchip.com>, 
	Michael Hennerich <michael.hennerich@analog.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Kamal Dasu <kamal.dasu@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, William Zhang <william.zhang@broadcom.com>, 
	Kursad Oney <kursad.oney@broadcom.com>, Anand Gore <anand.gore@broadcom.com>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Vladimir Oltean <olteanv@gmail.com>, Frank Li <Frank.Li@nxp.com>, Jean-Marie Verdun <verdun@hpe.com>, 
	Nick Hawkins <nick.hawkins@hpe.com>, Yang Shen <shenyang39@huawei.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Lixu Zhang <lixu.zhang@intel.com>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, Han Xu <han.xu@nxp.com>, 
	Yogesh Gaur <yogeshgaur.83@gmail.com>, Linus Walleij <linusw@kernel.org>, 
	Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Chris Packham <chris.packham@alliedtelesis.co.nz>, 
	Heiko Stuebner <heiko@sntech.de>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Paul Walmsley <pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Li-hao Kuo <lhjeff911@gmail.com>, 
	Masahisa Kojima <masahisa.kojima@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>, 
	Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	=?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	Michal Simek <michal.simek@amd.com>, Max Filippov <jcmvbkbc@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 8 Jan 2026 at 21:30, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> The SPI core provides the default fwnode for the controller,
> assigned by device_set_node(). No need to repeat it in the driver.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

>  drivers/spi/spi-rzv2h-rspi.c        | 2 --
>  drivers/spi/spi-rzv2m-csi.c         | 2 --

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # renesas


Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
