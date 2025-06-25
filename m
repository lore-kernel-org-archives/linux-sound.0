Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA88B2C3769
	for <linux-sound@vger.kernel.org>; Wed, 25 Jun 2025 17:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750873190; cv=none; b=WUROIwPwJG0NvBw74ZsAkLWBaqnUO1LFdcAVg+92+kMpD9FLQ5N6b7/JpfPCi1LydRidBc+2EfJyO2PzghZOTzTGw1DRJldOxoxT7+loLj0ucdZN5p0NlddHQvx/JUVjQKnNCgB6GDKghUP3VNMHRDvDjdbhamkAeRbY+tCu9/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750873190; c=relaxed/simple;
	bh=FQnIcDLVwCn5nG4Cc1XiSwJe+LQi94toHPOWj63mVns=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=b0avpa45+AGbuR1Y4dloVUpdfFvM6JNocXEarn/nZ9sxpR6Lpar2O57ccpIYvG+5UP8s9MOshUFNdD+4kpA975KgcLhyJW4fqCAo519gwUbbw3FkSkTfY0l4iLZwhKJN1EhNvXbD5YxxtceSzGhPG3bc9HPzl6i+T36ofjdzsWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KS/29S6C; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KS/29S6C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9CB2C4CEEE;
	Wed, 25 Jun 2025 17:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750873189;
	bh=FQnIcDLVwCn5nG4Cc1XiSwJe+LQi94toHPOWj63mVns=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KS/29S6CjjClrSVjmOPTc6psg3eYDHDMmebzjdbuvVaz5KAnOnVGWHbgnEtiMJeFA
	 7hWCcim+UU1U0B6GqLL8wB9zNWz7hQIAYftb7+d/A/k7dliEae7IMlvFs+Lv57v6oq
	 Yz1OxhyY9LZ66O4CEaTCKRn02Sy9Ey6bLe6Wc0lFXlnEYUt3ly2RAbgK6RC4mWV1ev
	 FYiHeeO+K+cp7uAaM1qmRH1bg7ju5dXNbMSG8CdycFV7UGxeC/OUnNyh1tTLK10faR
	 QIMEvk0XhS3yQXEycSL8KSzb0i3UcUEqi1F5hu5eRVPIjrana9K926X0YOkaElaIJS
	 AuA+FNkC6Qw9g==
From: Mark Brown <broonie@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 =?utf-8?q?Martin_Povifff=C5=A1er?= <povik+lin@cutebit.org>, 
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
 Paul Cercueil <paul@crapouillou.net>, Jerome Brunet <jbrunet@baylibre.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Mack <daniel@zonque.org>, 
 Haojian Zhuang <haojian.zhuang@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, 
 Srinivas Kandagatla <srini@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Olivier Moysan <olivier.moysan@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
 Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <875xh120u3.wl-kuninori.morimoto.gx@renesas.com>
References: <875xh120u3.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2 00/39] ASoC: Standardize ASoC menu
Message-Id: <175087317943.198995.16324682092066651860.b4-ty@kernel.org>
Date: Wed, 25 Jun 2025 18:39:39 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-08c49

On Thu, 12 Jun 2025 10:41:24 +0900, Kuninori Morimoto wrote:
> Current Kconfig menu at [ALSA for SoC audio support] has no rules.
> So, some venders are using menu style, some venders are listed each drivers
> on top page, etc. It is difficult to find target vender and/or drivers
> because it is very random.
> 
> Let's standardize ASoC menu, like below
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/39] ASoC: ti: Standardize ASoC menu
        commit: 6469fb5c8b2dc88c3840eced9ccdd3ddc97213b2
[02/39] ASoC: adi: Standardize ASoC menu
        commit: 652dd81c7a66843db0afbe0866537492c965a3cc
[03/39] ASoC: amd: Standardize ASoC menu
        commit: 6895deb5f25f92a9a8f7cf52977b0e8ef18baebb
[04/39] ASoC: bcm: Standardize ASoC menu
        commit: da65de541568cb9beb0feaa302a91d6af2f0258a
[05/39] ASoC: dwc: Standardize ASoC menu
        commit: bb0b8820527eb32b5f9cc1405e855a33eca2d83b
[06/39] ASoC: fsl: Standardize ASoC menu
        commit: 71951375b0ea03671a1752991cbeab0b9bc3f365
[07/39] ASoC: img: Standardize ASoC menu
        commit: b13f7eef9ff82e0163c6af8ac262fc2607161390
[08/39] ASoC: mxs: Standardize ASoC menu
        commit: 01f7d179a7348c252c5f26e1521bc1df81fadcd2
[09/39] ASoC: pxa: Standardize ASoC menu
        commit: bcd02da3721967c006c90b1b58536d34765283a5
[10/39] ASoC: sti: Standardize ASoC menu
        commit: afd1bff53b48d1431fefe57887017207c3df6bf5
[11/39] ASoC: stm: Standardize ASoC menu
        commit: 53696514d72fab66025afca531a1668bee635abf
[12/39] ASoC: sof: Standardize ASoC menu
        commit: 3b2a8a3c5769e2e02bf6f2cd7444847056087984
[13/39] ASoC: au1x: Standardize ASoC menu
        commit: 335c898312f3b2366123c10b7bca56ca8cea1781
[14/39] ASoC: sdca: Standardize ASoC menu
        commit: 36e6420440db119943b28b84523b8e0e77cae08b
[15/39] ASoC: sprd: Standardize ASoC menu
        commit: 1d9ac30a8df639169ab97576cb5b1d48bb403e8b
[16/39] ASoC: qcom: Standardize ASoC menu
        commit: 8ada023e996ca7131d9a42b2dd915e1966870d4a
[17/39] ASoC: meson: Standardize ASoC menu
        commit: 58e490935f20e38a4de156f705e89f7f13838aad
[18/39] ASoC: apple: Standardize ASoC menu
        commit: 68a8fd461a564f8b5957944f4b056f44de5dfabc
[19/39] ASoC: atmel: Standardize ASoC menu
        commit: 4f30f84feb7757f09aeecba120a05e1145b8f264
[20/39] ASoC: intel: Standardize ASoC menu
        commit: c153c508e5b41405db3ac9ce32169af6961aa878
[21/39] ASoC: spear: Standardize ASoC menu
        commit: 7798775a033e7d19270e20bcd105c29e373b8bad
[22/39] ASoC: sunxi: Standardize ASoC menu
        commit: c0262c187a0b8473169156f4cf3aad0f41b08d00
[23/39] ASoC: tegra: Standardize ASoC menu
        commit: 41b94a6f2debeb0483d8cda0558df860c0a26969
[24/39] ASoC: ux500: Standardize ASoC menu
        commit: 5b8b93e695bb8b5aa0d6432f397e8126faf56f5f
[25/39] ASoC: cirrus: Standardize ASoC menu
        commit: 8a40e95a1328b8045094b1037c457358c56700cb
[26/39] ASoC: google: Standardize ASoC menu
        commit: c6ddacab374702ed187359f103a95ad187d16d94
[27/39] ASoC: jz4740: Standardize ASoC menu
        commit: 099ae845c6b23ea2865a3912be3f51408f62f334
[28/39] ASoC: xilinx: Standardize ASoC menu
        commit: 69fa5909b3dc8b7968192d110e0d7ec8ef8dfd45
[29/39] ASoC: xtensa: Standardize ASoC menu
        commit: 41d88bb7546e445806febf45c971b854ba4bc3d7
[30/39] ASoC: renesas: Standardize ASoC menu
        commit: a549459a05c0a46aaf6fdf0d21a42ff09cbac91a
[31/39] ASoC: generic: Standardize ASoC menu
        commit: acc84d15e45393fbbe87758c5fed25d01c83ef92
[32/39] ASoC: samsung: Standardize ASoC menu
        commit: 0fa7adb638f6c4e8e458056adbcfc028a8085cf8
[33/39] ASoC: kirkwood: Standardize ASoC menu
        commit: 9fad9eb0371b11af1cea3e32cb423913cd10582a
[34/39] ASoC: loongson: Standardize ASoC menu
        commit: 9c0169922db5cec50a9f470df098dd835477c388
[35/39] ASoC: mediatek: Standardize ASoC menu
        commit: 05016f7e481e3d8d9ea539c05a0e8aba2c4f22ee
[36/39] ASoC: rockchip: Standardize ASoC menu
        commit: cae3cc435db56f2896be1d114952b4da0ac2eda8
[37/39] ASoC: starfive: Standardize ASoC menu
        commit: acc317e5254a739eedf60b53aaf31f69f55e3dc8
[38/39] ASoC: uniphier: Standardize ASoC menu
        commit: ac131c4148bcfa682104628d2174e8e38e03fd25
[39/39] ASoC: hisilicon: Standardize ASoC menu
        commit: 68fbc70ece40139380380dce74059afa592846b3

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

