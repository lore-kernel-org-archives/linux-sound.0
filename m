Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C54D2D3233
	for <linux-sound@vger.kernel.org>; Mon, 23 Jun 2025 17:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750700707; cv=none; b=WKsv/eZ7i5LksTX34DIMgpu8Qcxhmp8igy2uo32yxQ0sjIxQOhc/bzQyTyuLBqDy7LebZBqVDha9zX2SHfrMV8nJ9+o8ofXbNbCauS8e7LBdl97954LzbaQJQ+8i6TOK9vKBbpj6X0yVLbZqnTi7BcT5VX9Rl3ATTI67r9WmyiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750700707; c=relaxed/simple;
	bh=ptG/RCTCN5TcK07jrWnGGn7ImSBbzq+HdoyGmxzukg8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dy9N1Z8iKj7xHyodKxykygWPqL/0nn4TRKbNrKfwufBNbQOck1kziUHVhupMAa3Fxggl47c4RHs9DNy1Ui8BEPnjDJZW4pbP46UI17fuY4sTpmS/9AuWQmChTXNlSpbW7SPwD5sYeRP96mVDm61j4GPreS4rfRd0p/ja7jDZJik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QqCxsJnU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QqCxsJnU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31E11C4CEEA;
	Mon, 23 Jun 2025 17:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750700707;
	bh=ptG/RCTCN5TcK07jrWnGGn7ImSBbzq+HdoyGmxzukg8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QqCxsJnU3hZZP5GOD4orm0SRil5Pex6wUAoYt+cv3AxtMzUvU4R0y/AKbc9OjX/2/
	 rMgyMoAeeE3vNJ1VUW/cXo42WPeicfiCh+v0FYRt4ZvF4bBYSGkzpb+DZaN8lXPQVF
	 uVzdhJQBCfLcBlUUUxVr06QPMSFcKw0Pbd0YQj2WWx8W+otG/jNQJf68GIILEBxvWY
	 pX9Sn6ZRjkDlrTktyTJkAhfNgJzlgfmK8XoqEIEYjgijfhD9oFXiG5Iz5J0RKCWOaT
	 ja1hV51yoGTluxolmKxjGr5QWjzCc+8txMpmCEfTcTBKD7Xnxc9BPAP6yzCAvW4jn5
	 dmkej5oE7nJSw==
Date: Mon, 23 Jun 2025 18:44:53 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	=?utf-8?Q?=22Martin_Povifff=C5=A1er=22?= <povik+lin@cutebit.org>,
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
	Paul Cercueil <paul@crapouillou.net>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Srinivas Kandagatla <srini@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
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
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 36/39] ASoC: rockchip: Standardize ASoC menu
Message-ID: <354ff629-0278-4dd1-9e73-145364abead5@sirena.org.uk>
References: <875xh120u3.wl-kuninori.morimoto.gx@renesas.com>
 <87plf9ybqp.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JRE+VolGl1ETxqH/"
Content-Disposition: inline
In-Reply-To: <87plf9ybqp.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: I had pancake makeup for brunch!


--JRE+VolGl1ETxqH/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 01:44:46AM +0000, Kuninori Morimoto wrote:
> Current Kconfig menu at [ALSA for SoC audio support] has no rules.
> So, some venders are using menu style, some venders are listed each drive=
rs
> on top page, etc. It is difficult to find target vender and/or drivers
> because it is very random.
>=20
> Let's standardize ASoC menu

I'm not sure it's actually this patch, and I need to try to dig into
this more, but with at least parts of this series appled I'm seeing
some of the sound cards in at least the RK3399 based Renegade Elite fail
to probe with arm64 defconfig:

  https://lava.sirena.org.uk/scheduler/job/1501747#L968

Looking at the diff between the config I get for this patch and that for
v6.16-rc3 I see we've lost a bunch of devices, including some of the
Rockchip ones.  It's possible the incremental builds my testing does as
it walks along the branches didn't regenerate the config properly...

--- old	2025-06-23 18:37:19.473228422 +0100
+++ new	2025-06-23 18:34:50.750957175 +0100
@@ -6504,17 +6504,58 @@
 CONFIG_SND_SOC_GENERIC_DMAENGINE_PCM=3Dy
 CONFIG_SND_SOC_COMPRESS=3Dy
 CONFIG_SND_SOC_TOPOLOGY=3Dy
-# CONFIG_SND_SOC_ADI is not set
+
+#
+# Analog Devices
+#
+# CONFIG_SND_SOC_ADI_AXI_I2S is not set
+# CONFIG_SND_SOC_ADI_AXI_SPDIF is not set
+# end of Analog Devices
+
+#
+# AMD
+#
 # CONFIG_SND_SOC_AMD_ACP is not set
 # CONFIG_SND_AMD_ACP_CONFIG is not set
+# end of AMD
+
+#
+# Apple
+#
 # CONFIG_SND_SOC_APPLE_MCA is not set
-# CONFIG_SND_ATMEL_SOC is not set
+# end of Apple
+
+#
+# Atmel
+#
+# CONFIG_SND_SOC_MIKROE_PROTO is not set
+# end of Atmel
+
+#
+# Au1x
+#
+# end of Au1x
+
+#
+# Broadcom
+#
 CONFIG_SND_BCM2835_SOC_I2S=3Dm
 # CONFIG_SND_BCM63XX_I2S_WHISTLER is not set
+# end of Broadcom
+
+#
+# Cirrus Logic
+#
+# end of Cirrus Logic
+
+#
+# DesignWare
+#
 # CONFIG_SND_DESIGNWARE_I2S is not set
+# end of DesignWare
=20
 #
-# SoC Audio for Freescale CPUs
+# Freescale
 #
=20
 #
@@ -6547,19 +6588,63 @@
 # CONFIG_SND_SOC_IMX_HDMI is not set
 # CONFIG_SND_SOC_IMX_RPMSG is not set
 # CONFIG_SND_SOC_IMX_CARD is not set
-# end of SoC Audio for Freescale CPUs
+# end of Freescale
+
+#
+# Generic drivers
+#
+CONFIG_SND_SIMPLE_CARD_UTILS=3Dm
+CONFIG_SND_SIMPLE_CARD=3Dm
+CONFIG_SND_AUDIO_GRAPH_CARD=3Dm
+CONFIG_SND_AUDIO_GRAPH_CARD2=3Dm
+# CONFIG_SND_AUDIO_GRAPH_CARD2_CUSTOM_SAMPLE is not set
+# CONFIG_SND_TEST_COMPONENT is not set
+# end of Generic drivers
=20
+#
+# Google
+#
 # CONFIG_SND_SOC_CHV3_I2S is not set
+# end of Google
+
 # CONFIG_SND_I2S_HI6210_I2S is not set
+
+#
+# JZ4740
+#
+# end of JZ4740
+
+#
+# Kirkwood
+#
 # CONFIG_SND_KIRKWOOD_SOC is not set
+# end of Kirkwood
+
+#
+# Loongson
+#
+# end of Loongson
=20
 #
-# SoC Audio for Loongson CPUs
+# Imagination Technologies
 #
-# end of SoC Audio for Loongson CPUs
+# CONFIG_SND_SOC_IMG_I2S_IN is not set
+# CONFIG_SND_SOC_IMG_I2S_OUT is not set
+# CONFIG_SND_SOC_IMG_PARALLEL_OUT is not set
+# CONFIG_SND_SOC_IMG_SPDIF_IN is not set
+# CONFIG_SND_SOC_IMG_SPDIF_OUT is not set
+# CONFIG_SND_SOC_IMG_PISTACHIO_INTERNAL_DAC is not set
+# end of Imagination Technologies
=20
-# CONFIG_SND_SOC_IMG is not set
+#
+# Intel
+#
 # CONFIG_SND_SOC_INTEL_KEEMBAY is not set
+# end of Intel
+
+#
+# Mediatek
+#
 CONFIG_SND_SOC_MEDIATEK=3Dm
 # CONFIG_SND_SOC_MT2701 is not set
 # CONFIG_SND_SOC_MT6797 is not set
@@ -6578,9 +6663,10 @@
 CONFIG_SND_SOC_MT8195_MT6359=3Dm
 CONFIG_SND_SOC_MT8365=3Dm
 CONFIG_SND_SOC_MT8365_MT6357=3Dm
+# end of Mediatek
=20
 #
-# ASoC support for Amlogic platforms
+# Amlogic
 #
 CONFIG_SND_MESON_AIU=3Dm
 CONFIG_SND_MESON_AXG_FIFO=3Dm
@@ -6600,7 +6686,12 @@
 CONFIG_SND_MESON_G12A_TOACODEC=3Dm
 CONFIG_SND_MESON_G12A_TOHDMITX=3Dm
 CONFIG_SND_SOC_MESON_T9015=3Dm
-# end of ASoC support for Amlogic platforms
+# end of Amlogic
+
+#
+# PXA
+#
+# end of PXA
=20
 CONFIG_SND_SOC_QCOM=3Dm
 CONFIG_SND_SOC_LPASS_CPU=3Dm
@@ -6638,24 +6729,28 @@
 CONFIG_SND_SOC_X1E80100=3Dm
=20
 #
-# SoC Audio support for Renesas SoCs
+# Renesas
 #
 # CONFIG_SND_SOC_SH4_FSI is not set
 CONFIG_SND_SOC_RCAR=3Dm
 CONFIG_SND_SOC_MSIOF=3Dm
 CONFIG_SND_SOC_RZ=3Dm
-# end of SoC Audio support for Renesas SoCs
+# end of Renesas
=20
-CONFIG_SND_SOC_ROCKCHIP=3Dm
-CONFIG_SND_SOC_ROCKCHIP_I2S=3Dm
-CONFIG_SND_SOC_ROCKCHIP_I2S_TDM=3Dm
+#
+# Rockchip
+#
+# CONFIG_SND_SOC_ROCKCHIP_I2S is not set
+# CONFIG_SND_SOC_ROCKCHIP_I2S_TDM is not set
 # CONFIG_SND_SOC_ROCKCHIP_PDM is not set
-CONFIG_SND_SOC_ROCKCHIP_SAI=3Dm
-CONFIG_SND_SOC_ROCKCHIP_SPDIF=3Dm
+# CONFIG_SND_SOC_ROCKCHIP_SAI is not set
+# CONFIG_SND_SOC_ROCKCHIP_SPDIF is not set
 # CONFIG_SND_SOC_ROCKCHIP_MAX98090 is not set
-CONFIG_SND_SOC_ROCKCHIP_RT5645=3Dm
+# CONFIG_SND_SOC_ROCKCHIP_RT5645 is not set
 # CONFIG_SND_SOC_RK3288_HDMI_ANALOG is not set
-CONFIG_SND_SOC_RK3399_GRU_SOUND=3Dm
+# CONFIG_SND_SOC_RK3399_GRU_SOUND is not set
+# end of Rockchip
+
 CONFIG_SND_SOC_SAMSUNG=3Dy
 # CONFIG_SND_SAMSUNG_PCM is not set
 # CONFIG_SND_SAMSUNG_SPDIF is not set
@@ -6668,33 +6763,34 @@
 # CONFIG_SND_SOC_ARNDALE is not set
 # CONFIG_SND_SOC_SAMSUNG_ARIES_WM8994 is not set
 # CONFIG_SND_SOC_SAMSUNG_MIDAS_WM1811 is not set
+
+#
+# SoundWire (SDCA)
+#
 CONFIG_SND_SOC_SDCA_OPTIONAL=3Dy
-CONFIG_SND_SOC_SOF_TOPLEVEL=3Dy
-# CONFIG_SND_SOC_SOF_PCI is not set
-# CONFIG_SND_SOC_SOF_ACPI is not set
-CONFIG_SND_SOC_SOF_OF=3Dy
-CONFIG_SND_SOC_SOF_OF_DEV=3Dm
-CONFIG_SND_SOC_SOF_COMPRESS=3Dy
-CONFIG_SND_SOC_SOF=3Dm
-CONFIG_SND_SOC_SOF_IPC3=3Dy
-# CONFIG_SND_SOC_SOF_IMX_TOPLEVEL is not set
-CONFIG_SND_SOC_SOF_MTK_TOPLEVEL=3Dy
-CONFIG_SND_SOC_SOF_MTK_COMMON=3Dm
-CONFIG_SND_SOC_SOF_MT8186=3Dm
-CONFIG_SND_SOC_SOF_MT8195=3Dm
-CONFIG_SND_SOC_SOF_XTENSA=3Dm
+# end of SoundWire (SDCA)
+
+#
+# ST SPEAr
+#
+# end of ST SPEAr
+
+#
+# Spreadtrum
+#
 # CONFIG_SND_SOC_SPRD is not set
+# end of Spreadtrum
=20
 #
-# STMicroelectronics STM32 SOC audio support
+# STMicroelectronics STM32
 #
 # CONFIG_SND_SOC_STM32_SAI is not set
 # CONFIG_SND_SOC_STM32_I2S is not set
 # CONFIG_SND_SOC_STM32_SPDIFRX is not set
-# end of STMicroelectronics STM32 SOC audio support
+# end of STMicroelectronics STM32
=20
 #
-# Allwinner SoC Audio support
+# Allwinner
 #
 # CONFIG_SND_SUN4I_CODEC is not set
 CONFIG_SND_SUN8I_CODEC=3Dm
@@ -6704,8 +6800,11 @@
 CONFIG_SND_SUN4I_SPDIF=3Dm
 # CONFIG_SND_SUN50I_DMIC is not set
 CONFIG_SND_SUN8I_ADDA_PR_REGMAP=3Dm
-# end of Allwinner SoC Audio support
+# end of Allwinner
=20
+#
+# Tegra
+#
 CONFIG_SND_SOC_TEGRA=3Dm
 # CONFIG_SND_SOC_TEGRA20_AC97 is not set
 # CONFIG_SND_SOC_TEGRA20_DAS is not set
@@ -6737,9 +6836,10 @@
 # CONFIG_SND_SOC_TEGRA_MAX98088 is not set
 # CONFIG_SND_SOC_TEGRA_RT5677 is not set
 # CONFIG_SND_SOC_TEGRA_SGTL5000 is not set
+# end of Tegra
=20
 #
-# Audio support for Texas Instruments SoCs
+# Texas Instruments
 #
 CONFIG_SND_SOC_TI_EDMA_PCM=3Dm
 CONFIG_SND_SOC_TI_SDMA_PCM=3Dm
@@ -6754,13 +6854,38 @@
 # Audio support for boards with Texas Instruments SoCs
 #
 CONFIG_SND_SOC_J721E_EVM=3Dm
-# end of Audio support for Texas Instruments SoCs
+# end of Texas Instruments
=20
 # CONFIG_SND_SOC_UNIPHIER is not set
+
+#
+# Xilinx
+#
 # CONFIG_SND_SOC_XILINX_I2S is not set
 # CONFIG_SND_SOC_XILINX_AUDIO_FORMATTER is not set
 # CONFIG_SND_SOC_XILINX_SPDIF is not set
+# end of Xilinx
+
+#
+# Xtensa
+#
 # CONFIG_SND_SOC_XTFPGA_I2S is not set
+# end of Xtensa
+
+CONFIG_SND_SOC_SOF_TOPLEVEL=3Dy
+# CONFIG_SND_SOC_SOF_PCI is not set
+# CONFIG_SND_SOC_SOF_ACPI is not set
+CONFIG_SND_SOC_SOF_OF=3Dy
+CONFIG_SND_SOC_SOF_OF_DEV=3Dm
+CONFIG_SND_SOC_SOF_COMPRESS=3Dy
+CONFIG_SND_SOC_SOF=3Dm
+CONFIG_SND_SOC_SOF_IPC3=3Dy
+# CONFIG_SND_SOC_SOF_IMX_TOPLEVEL is not set
+CONFIG_SND_SOC_SOF_MTK_TOPLEVEL=3Dy
+CONFIG_SND_SOC_SOF_MTK_COMMON=3Dm
+CONFIG_SND_SOC_SOF_MT8186=3Dm
+CONFIG_SND_SOC_SOF_MT8195=3Dm
+CONFIG_SND_SOC_SOF_XTENSA=3Dm
 CONFIG_SND_SOC_I2C_AND_SPI=3Dy
=20
 #
@@ -6897,12 +7022,9 @@
 # CONFIG_SND_SOC_RT1316_SDW is not set
 # CONFIG_SND_SOC_RT1318_SDW is not set
 # CONFIG_SND_SOC_RT1320_SDW is not set
-CONFIG_SND_SOC_RT5514=3Dm
-CONFIG_SND_SOC_RT5514_SPI=3Dm
 # CONFIG_SND_SOC_RT5616 is not set
 # CONFIG_SND_SOC_RT5631 is not set
 CONFIG_SND_SOC_RT5640=3Dm
-CONFIG_SND_SOC_RT5645=3Dm
 CONFIG_SND_SOC_RT5659=3Dm
 CONFIG_SND_SOC_RT5663=3Dm
 CONFIG_SND_SOC_RT5682=3Dm
@@ -7032,12 +7154,6 @@
 CONFIG_SND_SOC_LPASS_TX_MACRO=3Dm
 # end of CODEC drivers
=20
-CONFIG_SND_SIMPLE_CARD_UTILS=3Dm
-CONFIG_SND_SIMPLE_CARD=3Dm
-CONFIG_SND_AUDIO_GRAPH_CARD=3Dm
-CONFIG_SND_AUDIO_GRAPH_CARD2=3Dm
-# CONFIG_SND_AUDIO_GRAPH_CARD2_CUSTOM_SAMPLE is not set
-# CONFIG_SND_TEST_COMPONENT is not set
 # CONFIG_SND_XEN_FRONTEND is not set
 # CONFIG_SND_VIRTIO is not set
 CONFIG_HID_SUPPORT=3Dy

--JRE+VolGl1ETxqH/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhZkpQACgkQJNaLcl1U
h9CT+Qf/WWi14Z0xD0P++jOhWDpStNtdklRjpp9Ll0PKQVV0MTv9I0xd3vtf9Wat
wuSm8FEURM9+918Z+7VUI6AHsVVpyV5XwNjpI9n35iN9sa533eXD9zJTHBhvofHk
hTdy91yXN7ZdNVRVG4lfTBPbfEFt5wUevYLBo36Ah/IjQBdmukUaEcllclg6zR+Q
z4zsKYoUP8iZsh0PX3rVriHw6ZvT0ECO8qHi6gVMFY6wJrPtojWc9rF/mXnbC/0h
ZUCvHHEffHQ2YS877hktyP7N9ADEAi4eZ9dm1AOr2vcGNnTBuOZ+Eo+ZiYqMeTLY
XM96w3uLD8t9mZkXD/6RvS9r/a7MbQ==
=MGN7
-----END PGP SIGNATURE-----

--JRE+VolGl1ETxqH/--
