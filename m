Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B57E31CA50
	for <linux-sound@vger.kernel.org>; Thu, 20 Nov 2025 09:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763631623; cv=none; b=kulM4JSpBfTEdU6SMt4b/jJ04umebh1iEdRCyR3MTWGhxw/f+wwbnT/Ycz1cfkEegSu7vNB/JdvgROd4Az7fS6KVdf/lWCRaL0aeklAwXElV5T9Lnm28F5J/nNhrVm+mvwMtpiMxzwSb82oTEt9Ba4wMXEAJGdNjBR6f6iReurw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763631623; c=relaxed/simple;
	bh=ps2FH5oRyQN1B8CvRhGeJRpOC6DTDIqhewd44NVMYgA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=V6Y62nL0mf6fhmcJIZp0Qlp7+R60HHqfb7a8RDseK2bhD1A2pIpQagc7S4zRParO0i/vr1pK0awk65/4GpqrQRzvBlBLRIzd0QzBMugcLhri1Bkn56KUsaaeddItbCIQjvxIAMPcSjH4mlF/oKiLR6JS8m9uyPN7HBhaw+4tS7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UPWmdbDg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UPWmdbDg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFB81C4CEF1;
	Thu, 20 Nov 2025 09:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763631621;
	bh=ps2FH5oRyQN1B8CvRhGeJRpOC6DTDIqhewd44NVMYgA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=UPWmdbDgqQF82Z7F6vGKEYZwhC1Lo3TNDDp4FRZoHA3DlogQqgVXISYdI1rGpRhPm
	 dSX+3/jiikPM1xVKfEva3sApi6R+0Tq4R2H+6fDuaxFzG+TirYbLp9rdYWucwUnEqK
	 edoRsVnVJzeFt9LRuULqrT9bXOUpSL80n2eHo2msaxAc+2ezlce2deEyO58Nhp68NP
	 UtEsB/6Tuq0DpFCO3IWH20bZ8k2+z10EoWJtFqoAgzKMSoAft8sIm/ydAqCftHZrDX
	 VZYEXP33DzZiszMmmvzs+mryGUk23MxG+/wCUDE4B0Zh+MkAFooByFys4B7B7sfMuh
	 CBT+OtsNfcViw==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 000/292] ASoC: convert to snd_soc_dapm_xxx()
Message-Id: <176363161970.559933.14503273962095971487.b4-ty@kernel.org>
Date: Thu, 20 Nov 2025 09:40:19 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-a6db3

On Tue, 11 Nov 2025 00:17:02 +0000, Kuninori Morimoto wrote:
> This patch-set convert many functions to snd_soc_dapm_xxx().
> This is preparation to move struct snd_soc_dapm_context into soc-dapm.c.
> 
> For backport easy, this patch-set is added for each drivers.
> 
> Kuninori Morimoto (292):
>   ASoC: arizona-haptics: convert to snd_soc_dapm_xxx()
>   ASoC: arizona-micsupp: convert to snd_soc_dapm_xxx()
>   ASoC: audio_codec: convert to snd_soc_dapm_xxx()
>   ASoC: audio_helper: convert to snd_soc_dapm_xxx()
>   ASoC: audio_topology: convert to snd_soc_dapm_xxx()
>   ASoC: soc.h: convert to snd_soc_dapm_xxx()
>   ASoC: asoc.h: convert to snd_soc_dapm_xxx()
>   ASoC: amd: acp-mach-common: convert to snd_soc_dapm_xxx()
>   ASoC: amd: acp3x-es83xx: convert to snd_soc_dapm_xxx()
>   ASoC: amd: acp5x-mach: convert to snd_soc_dapm_xxx()
>   ASoC: atmel: sam9g20_wm8731: convert to snd_soc_dapm_xxx()
>   ASoC: atmel: tse850-pcm5142: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: ab8500: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: 88pm860x: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: ad1836: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: ad193x: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: adau1761: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: adau1781: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: adau17x1: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: adau1977: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: adau7118: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: adav80x: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: ak4641: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: alc5623: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: arizona-jack: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: arizona: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: audio-iio-aux: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: aw88261: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: aw88395: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: cpcap: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: cs35l33: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: cs35l41: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: cs35l45: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: cs35l56: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: cs4234: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: cs42l43-jack: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: cs42l43: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: cs42l51: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: cs42l52: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: cs42l56: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: cs42l73: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: cs42xx8: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: cs47l15: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: cs47l24: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: cs47l35: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: cs47l85: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: cs47l90: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: cs47l92: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: cs48l32: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: cs530x: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: cs53l30: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: cx20442: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: cs2072x: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: da7213: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: da7218: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: da7219-aad: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: da7219: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: da732x: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: da9055: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: es7134: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: es8311: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: es8316: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: es8326: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: es8328: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: es8389: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: hda: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: hdac_hda: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: hdac_hdmi: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: hdmi-codec: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: jz4740: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: jz4760: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: jz4770: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: lm49453: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: lpass-rx-macro: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: lpass-tx-macro: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: lpass-va-macro: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: lpass-wsa-macro: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: madera: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: max98088: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: max98090: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: max98095: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: max98373: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: max98390: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: max98396: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: max9850: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: max9867: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: ml26124: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: mt6357: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: mt6358: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: mt6359: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: nau8810: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: nau8821: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: nau8822: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: nau8824: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: nau8825: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: pcm186x: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: pcm512x: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: rk3308: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: rt1011: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: rt1015: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: rt274: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: rt286: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: rt298: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: rt5514: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: rt5516: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: rt5631: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: rt5640: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: rt5645: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: rt5651: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: rt5659: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: rt5660: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: rt5663: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: rt5665: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: rt5668: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: rt5670: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: rt5677: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: rt5682: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: rt5682s: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: rt700: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: rt711-sdca: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: rt711: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: rt712-sdca-dmic: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: rt712-sdca: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: rt715-sdca: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: rt715: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: rt721-sdca: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: simple-mux: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: sma1303: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: sma1307: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: ssm2518: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: ssm2602: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: ssm4567: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: sta32x: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: sta350: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: sta529: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: tas571x: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: tas6424: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: tlv320adc3xxx: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: tlv320aic31xx: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: tlv320aic32x4: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: tlv320aic3x: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: tlv320dac33: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: twl4030: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: twl6040: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: uda1380: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: wcd9335: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: wcd934x: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: wcd937x: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: wm0010: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: wm5100: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: wm5102: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: wm5110: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: wm8350: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: wm8400: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: wm8510: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: wm8523: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: wm8580: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: wm8711: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: wm8728: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: wm8731: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: wm8737: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: wm8750: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: wm8753: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: wm8770: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: wm8776: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: wm8804: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: wm8900: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: wm8903: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: wm8904: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: wm8940: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: wm8955: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: wm8960: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: wm8961: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: wm8962: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: wm8971: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: wm8974: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: wm8978: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: wm8983: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: wm8985: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: wm8988: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: wm8990: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: wm8991: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: wm8993: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: wm8994: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: wm8995: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: wm8996: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: wm8997: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: wm8998: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: wm9081: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: wm9090: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: wm9712: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: wm9713: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: wm_adsp: convert to snd_soc_dapm_xxx()
>   ASoC: codecs: wm_hubs: convert to snd_soc_dapm_xxx()
>   ASoC: fsl: fsl-asoc-card: convert to snd_soc_dapm_xxx()
>   ASoC: fsl: imx-rpmsg: convert to snd_soc_dapm_xxx()
>   ASoC: generic: audio-graph-card: convert to snd_soc_dapm_xxx()
>   ASoC: intel: atom: sst-atom-controls: convert to snd_soc_dapm_xxx()
>   ASoC: intel: avs: da7219: convert to snd_soc_dapm_xxx()
>   ASoC: intel: avs: es8336: convert to snd_soc_dapm_xxx()
>   ASoC: intel: avs: nau8825: convert to snd_soc_dapm_xxx()
>   ASoC: intel: avs: rt274: convert to snd_soc_dapm_xxx()
>   ASoC: intel: avs: rt5514: convert to snd_soc_dapm_xxx()
>   ASoC: intel: avs: rt5640: convert to snd_soc_dapm_xxx()
>   ASoC: intel: avs: control: convert to snd_soc_dapm_xxx()
>   ASoC: intel: avs: pcm: convert to snd_soc_dapm_xxx()
>   ASoC: intel: boards: bdw-rt5677: convert to snd_soc_dapm_xxx()
>   ASoC: intel: boards: bytcht_cx2072x: convert to snd_soc_dapm_xxx()
>   ASoC: intel: boards: bytcht_es8316: convert to snd_soc_dapm_xxx()
>   ASoC: intel: boards: bytcr_rt5640: convert to snd_soc_dapm_xxx()
>   ASoC: intel: boards: bytcr_rt5651: convert to snd_soc_dapm_xxx()
>   ASoC: intel: boards: bytcr_wm5102: convert to snd_soc_dapm_xxx()
>   ASoC: intel: boards: cht_bsw_max98090_ti: convert to
>     snd_soc_dapm_xxx()
>   ASoC: intel: boards: cht_bsw_rt5645: convert to snd_soc_dapm_xxx()
>   ASoC: intel: boards: cht_bsw_rt5672: convert to snd_soc_dapm_xxx()
>   ASoC: intel: boards: sof_board_helpers: convert to snd_soc_dapm_xxx()
>   ASoC: intel: boards: sof_cirrus_common: convert to snd_soc_dapm_xxx()
>   ASoC: intel: boards: sof_da7219: convert to snd_soc_dapm_xxx()
>   ASoC: intel: boards: sof_es8336: convert to snd_soc_dapm_xxx()
>   ASoC: intel: boards: sof_maxim_common: convert to snd_soc_dapm_xxx()
>   ASoC: intel: boards: sof_nau8825: convert to snd_soc_dapm_xxx()
>   ASoC: intel: boards: sof_nuvoton_common: convert to snd_soc_dapm_xxx()
>   ASoC: intel: boards: sof_pcm512x: convert to snd_soc_dapm_xxx()
>   ASoC: intel: boards: sof_realtek_common: convert to snd_soc_dapm_xxx()
>   ASoC: intel: boards: sof_rt5682: convert to snd_soc_dapm_xxx()
>   ASoC: mediatek: mtk-afe-platform-driver: convert to snd_soc_dapm_xxx()
>   ASoC: mediatek: mtk-dsp-sof-common: convert to snd_soc_dapm_xxx()
>   ASoC: mediatek: mt8186-mt6366-common: convert to snd_soc_dapm_xxx()
>   ASoC: mediatek: mt8186-mt6366: convert to snd_soc_dapm_xxx()
>   ASoC: mediatek: mt8188-mt6359: convert to snd_soc_dapm_xxx()
>   ASoC: mediatek: mt8195-mt6359: convert to snd_soc_dapm_xxx()
>   ASoC: mediatek: mt8365-afe-pcm: convert to snd_soc_dapm_xxx()
>   ASoC: meson: aiu-acodec-ctrl: convert to snd_soc_dapm_xxx()
>   ASoC: meson: aiu-codec-ctrl: convert to snd_soc_dapm_xxx()
>   ASoC: meson: axg-spdifout: convert to snd_soc_dapm_xxx()
>   ASoC: meson: axg-tdm-interface: convert to snd_soc_dapm_xxx()
>   ASoC: meson: g12a-toacodec: convert to snd_soc_dapm_xxx()
>   ASoC: meson: g12a-tohdmitx: convert to snd_soc_dapm_xxx()
>   ASoC: meson: t9015: convert to snd_soc_dapm_xxx()
>   ASoC: pxa: spitz: convert to snd_soc_dapm_xxx()
>   ASoC: qcom: q6routing: convert to snd_soc_dapm_xxx()
>   ASoC: qcom: q6usb: convert to snd_soc_dapm_xxx()
>   ASoC: qcom: topology: convert to snd_soc_dapm_xxx()
>   ASoC: qcom: sc7180: convert to snd_soc_dapm_xxx()
>   ASoC: rockchip: rk3288_hdmi_analog: convert to snd_soc_dapm_xxx()
>   ASoC: rockchip: rockchip_max98090: convert to snd_soc_dapm_xxx()
>   ASoC: samsung: aries_wm8994: convert to snd_soc_dapm_xxx()
>   ASoC: samsung: bells: convert to snd_soc_dapm_xxx()
>   ASoC: samsung: littlemill: convert to snd_soc_dapm_xxx()
>   ASoC: samsung: lowland: convert to snd_soc_dapm_xxx()
>   ASoC: samsung: midas_wm1811: convert to snd_soc_dapm_xxx()
>   ASoC: samsung: smdk_wm8994: convert to snd_soc_dapm_xxx()
>   ASoC: samsung: speyside: convert to snd_soc_dapm_xxx()
>   ASoC: samsung: tm2_wm5110: convert to snd_soc_dapm_xxx()
>   ASoC: samsung: tobermory: convert to snd_soc_dapm_xxx()
>   ASoC: sdca: sdca_asoc: convert to snd_soc_dapm_xxx()
>   ASoC: sdw_utils: soc_sdw_bridge_cs35l56: convert to snd_soc_dapm_xxx()
>   ASoC: sdw_utils: soc_sdw_cs42l42: convert to snd_soc_dapm_xxx()
>   ASoC: sdw_utils: soc_sdw_cs42l43: convert to snd_soc_dapm_xxx()
>   ASoC: sdw_utils: soc_sdw_cs_amp: convert to snd_soc_dapm_xxx()
>   ASoC: sdw_utils: soc_sdw_dmic: convert to snd_soc_dapm_xxx()
>   ASoC: sdw_utils: soc_sdw_maxim: convert to snd_soc_dapm_xxx()
>   ASoC: sdw_utils: soc_sdw_rt5682: convert to snd_soc_dapm_xxx()
>   ASoC: sdw_utils: soc_sdw_rt700: convert to snd_soc_dapm_xxx()
>   ASoC: sdw_utils: soc_sdw_rt711: convert to snd_soc_dapm_xxx()
>   ASoC: sdw_utils: soc_sdw_rt_amp: convert to snd_soc_dapm_xxx()
>   ASoC: sdw_utils: soc_sdw_rt_mf_sdca: convert to snd_soc_dapm_xxx()
>   ASoC: sdw_utils: soc_sdw_rt_sdca_jack_common: convert to
>     snd_soc_dapm_xxx()
>   ASoC: sdw_utils: soc_sdw_ti_amp: convert to snd_soc_dapm_xxx()
>   ASoC: sdw_utils: soc_sdw_utils: convert to snd_soc_dapm_xxx()
>   ASoC: soc-core: convert to snd_soc_dapm_xxx()
>   ASoC: soc-dapm: convert to snd_soc_dapm_xxx()
>   ASoC: soc-jack: convert to snd_soc_dapm_xxx()
>   ASoC: soc-pcm: convert to snd_soc_dapm_xxx()
>   ASoC: soc-topology: convert to snd_soc_dapm_xxx()
>   ASoC: sof-client-probes: convert to snd_soc_dapm_xxx()
>   ASoC: sunxi: sun4i-codec: convert to snd_soc_dapm_xxx()
>   ASoC: sunxi: sun50i-codec-analog: convert to snd_soc_dapm_xxx()
>   ASoC: sunxi: sun8i-codec-analog: convert to snd_soc_dapm_xxx()
>   ASoC: sunxi: sun8i-codec: convert to snd_soc_dapm_xxx()
>   ASoC: tegra: tegra210_ahub: convert to snd_soc_dapm_xxx()
>   ASoC: tegra: tegra_asoc_machine: convert to snd_soc_dapm_xxx()
>   ASoC: tegra: tegra_wm8903: convert to snd_soc_dapm_xxx()
>   ASoC: ti: ams-delta: convert to snd_soc_dapm_xxx()
>   ASoC: ti: davinci-evm: convert to snd_soc_dapm_xxx()
>   ASoC: ti: j721e-evm: convert to snd_soc_dapm_xxx()
>   ASoC: ti: n810: convert to snd_soc_dapm_xxx()
>   ASoC: ti: omap-abe-twl6040: convert to snd_soc_dapm_xxx()
>   ASoC: ti: omap-twl4030: convert to snd_soc_dapm_xxx()
>   ASoC: ti: omap3pandora: convert to snd_soc_dapm_xxx()
>   ASoC: ti: rx51: convert to snd_soc_dapm_xxx()
>   ASoC: ux500: mop500_ab8500: convert to snd_soc_dapm_xxx()
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[001/292] ASoC: arizona-haptics: convert to snd_soc_dapm_xxx()
          commit: d6b8ebab363bf3dd46cf4d64727910d648bd35cf
[002/292] ASoC: arizona-micsupp: convert to snd_soc_dapm_xxx()
          commit: 91f20e5167d38eb943a087e3087927d1ce7a5c78
[003/292] ASoC: audio_codec: convert to snd_soc_dapm_xxx()
          commit: 64f90b329ffadae00b187ac797837ba598289707
[004/292] ASoC: audio_helper: convert to snd_soc_dapm_xxx()
          commit: ed71deee195d5d2478363d606b0fbe5665e99d7f
[005/292] ASoC: audio_topology: convert to snd_soc_dapm_xxx()
          commit: ee0f171f4b9d21af0b202cec35c44c1eaf6e0beb
[006/292] ASoC: soc.h: convert to snd_soc_dapm_xxx()
          commit: 4d5c668c268b7812ff15452d303974ce247ad378
[007/292] ASoC: asoc.h: convert to snd_soc_dapm_xxx()
          commit: 8855eb7d29400fb7b2882da33725db2801c410e4
[008/292] ASoC: amd: acp-mach-common: convert to snd_soc_dapm_xxx()
          commit: 6b1b50ed3c9409a85ff28335ca9b471ed399e652
[009/292] ASoC: amd: acp3x-es83xx: convert to snd_soc_dapm_xxx()
          commit: 170bc7a0e26ca3d36f543db4111cb7195137c145
[010/292] ASoC: amd: acp5x-mach: convert to snd_soc_dapm_xxx()
          commit: b42c7f40d2aa8be24601eaa80c672e2c34742c18
[011/292] ASoC: atmel: sam9g20_wm8731: convert to snd_soc_dapm_xxx()
          commit: f3e9bca581321403c9614a075002e29d8e29c60d
[012/292] ASoC: atmel: tse850-pcm5142: convert to snd_soc_dapm_xxx()
          commit: 6d2188983a12e036531ecc67d89c6e1388855ea1
[013/292] ASoC: codecs: ab8500: convert to snd_soc_dapm_xxx()
          commit: cdc8feb84f7f22a9b21483b706382cea3cd248cd
[014/292] ASoC: codecs: 88pm860x: convert to snd_soc_dapm_xxx()
          commit: 946d58ae54f8cd9ead30571a71c75a3981d7862a
[015/292] ASoC: codecs: ad1836: convert to snd_soc_dapm_xxx()
          commit: e765581ceba401ef62329a4699403d00cb17ce2b
[016/292] ASoC: codecs: ad193x: convert to snd_soc_dapm_xxx()
          commit: 696713199ea5128a3d031a45f275bbfd275b87db
[017/292] ASoC: codecs: adau1761: convert to snd_soc_dapm_xxx()
          commit: 4a9eb06f9b36ca43106e6e12231b5171a660e4ce
[018/292] ASoC: codecs: adau1781: convert to snd_soc_dapm_xxx()
          commit: f7a7e796a36f487758a9444408cef41f94460158
[019/292] ASoC: codecs: adau17x1: convert to snd_soc_dapm_xxx()
          commit: 09ff5df2edbea67256209eb814bca4570436b7c6
[020/292] ASoC: codecs: adau1977: convert to snd_soc_dapm_xxx()
          commit: bdd43845598cae0591f0203d6e70f510c4af852d
[021/292] ASoC: codecs: adau7118: convert to snd_soc_dapm_xxx()
          commit: 31f28cda703d442b75c4ae9f3d0855d787c6e909
[022/292] ASoC: codecs: adav80x: convert to snd_soc_dapm_xxx()
          commit: 87bb65464be16f83e5a7a6642f33084b6ce22d2d
[023/292] ASoC: codecs: ak4641: convert to snd_soc_dapm_xxx()
          commit: 7a7ecd8d0a428e96f9271ea59b067b2a5c318de9
[024/292] ASoC: codecs: alc5623: convert to snd_soc_dapm_xxx()
          commit: 797e4164fe55a03db19930ae94d021173c8e726b
[025/292] ASoC: codecs: arizona-jack: convert to snd_soc_dapm_xxx()
          commit: 335f0d947f52113110e2ed2ad2c030050d220ad8
[025/292] ASoC: codecs: arizona-jack: convert to snd_soc_dapm_xxx()
          commit: 335f0d947f52113110e2ed2ad2c030050d220ad8
[027/292] ASoC: codecs: audio-iio-aux: convert to snd_soc_dapm_xxx()
          commit: 0ad0505f61402ddcd08d3a6c8f741f0e1487bdc0
[028/292] ASoC: codecs: aw88261: convert to snd_soc_dapm_xxx()
          commit: 7bb1edac96067d523a30b4ef5808d21c86725f64
[029/292] ASoC: codecs: aw88395: convert to snd_soc_dapm_xxx()
          commit: 57bea9f5f02e76cb81d84de17576faf336526167
[030/292] ASoC: codecs: cpcap: convert to snd_soc_dapm_xxx()
          commit: cc1bb5d435d601035be92d98295cea0b973ae5c2
[031/292] ASoC: codecs: cs35l33: convert to snd_soc_dapm_xxx()
          commit: 436a4d82d2460926aa2a772acf5399accedfbc00
[032/292] ASoC: codecs: cs35l41: convert to snd_soc_dapm_xxx()
          commit: f0962b1a35043b8d0e3384b7004f3785b7c7ffd0
[033/292] ASoC: codecs: cs35l45: convert to snd_soc_dapm_xxx()
          commit: 4bac87b4742d479384ee133c0b591db9234acf0e
[034/292] ASoC: codecs: cs35l56: convert to snd_soc_dapm_xxx()
          commit: bccf1a2e2a7819f2f9caebd5a135fe119f09dbd1
[035/292] ASoC: codecs: cs4234: convert to snd_soc_dapm_xxx()
          commit: efdc8c78a5191c85096ee772a36330ca280873ce
[036/292] ASoC: codecs: cs42l43-jack: convert to snd_soc_dapm_xxx()
          commit: 098931e46c0ed4e0203bcdc626ff94bcd58dbf36
[037/292] ASoC: codecs: cs42l43: convert to snd_soc_dapm_xxx()
          commit: 5dc2dcbb10614ca77b32340d88d24cef47cd8d58
[038/292] ASoC: codecs: cs42l51: convert to snd_soc_dapm_xxx()
          commit: c9ba54d36ac20fd94c9479e8b82b32610a4cb979
[039/292] ASoC: codecs: cs42l52: convert to snd_soc_dapm_xxx()
          commit: 4d01421647562d3f16319d79197d2afa8f3f1c84
[040/292] ASoC: codecs: cs42l56: convert to snd_soc_dapm_xxx()
          commit: 770f17143988f1804d24cb5ab5a4bb9087a715b2
[041/292] ASoC: codecs: cs42l73: convert to snd_soc_dapm_xxx()
          commit: 2bed4e2a81bcc1e59eb747d0a51e46a24bf3a1b3
[042/292] ASoC: codecs: cs42xx8: convert to snd_soc_dapm_xxx()
          commit: 75dc6bf1d4dd08d78dd9568eeb041a3e0787084d
[043/292] ASoC: codecs: cs47l15: convert to snd_soc_dapm_xxx()
          commit: 4db61b8cd50441c846ac8e6afb53781f62f92029
[044/292] ASoC: codecs: cs47l24: convert to snd_soc_dapm_xxx()
          commit: 729a995620ca34f589135f9852d2ef1c9ee7ebb2
[045/292] ASoC: codecs: cs47l35: convert to snd_soc_dapm_xxx()
          commit: 80ac220583627912ef478a25e22b02bd813d5268
[046/292] ASoC: codecs: cs47l85: convert to snd_soc_dapm_xxx()
          commit: ce99b1dd71340e78d5f8f94af1fdf929bc386b61
[047/292] ASoC: codecs: cs47l90: convert to snd_soc_dapm_xxx()
          commit: 638d7077e67f03926f94201f5508c886d0683adc
[048/292] ASoC: codecs: cs47l92: convert to snd_soc_dapm_xxx()
          commit: 4c0f28830a4f96487cccfb0e8b78efd628766d91
[049/292] ASoC: codecs: cs48l32: convert to snd_soc_dapm_xxx()
          commit: 97062ef891393c82107cf44a0eb50c6e1a399e18
[050/292] ASoC: codecs: cs530x: convert to snd_soc_dapm_xxx()
          commit: 7fdcd1d1add9c3abc1379563c98bcfcc5ce26343
[051/292] ASoC: codecs: cs53l30: convert to snd_soc_dapm_xxx()
          commit: fa2defb800d7c7b67fa7d9fa95824b7780a90575
[052/292] ASoC: codecs: cx20442: convert to snd_soc_dapm_xxx()
          commit: 78ad27bc554d33963fa829632c789ab8fb191a09
[053/292] ASoC: codecs: cs2072x: convert to snd_soc_dapm_xxx()
          commit: e6f48607ac801864b99ff93e5193f3f422d55f7b
[054/292] ASoC: codecs: da7213: convert to snd_soc_dapm_xxx()
          commit: 0a87517ae3e7af2019f80e32df01252dd8604080
[055/292] ASoC: codecs: da7218: convert to snd_soc_dapm_xxx()
          commit: 12223b4534dd70bc13d792a836f53369db89caa1
[056/292] ASoC: codecs: da7219-aad: convert to snd_soc_dapm_xxx()
          commit: aaf1f90c99d920f8ab95413cab7abc627316fdf6
[057/292] ASoC: codecs: da7219: convert to snd_soc_dapm_xxx()
          commit: 96b0a24773849ca2d051a552a19eee262f1f7444
[058/292] ASoC: codecs: da732x: convert to snd_soc_dapm_xxx()
          commit: 476fb171ed43ce544d54cd082ec56df2e8f8aa5d
[059/292] ASoC: codecs: da9055: convert to snd_soc_dapm_xxx()
          commit: 464ac2a1085749dbfeee899ac06d51bea7ef1041
[060/292] ASoC: codecs: es7134: convert to snd_soc_dapm_xxx()
          commit: 82e5de78dbdeec04257d8bdba8465217ad9447d9
[061/292] ASoC: codecs: es8311: convert to snd_soc_dapm_xxx()
          commit: c475f3468361bb37815aa5beaac056568d18fb56
[062/292] ASoC: codecs: es8316: convert to snd_soc_dapm_xxx()
          commit: 1505741d727e210650c7f2cbe16ab450f0b1b0bf
[063/292] ASoC: codecs: es8326: convert to snd_soc_dapm_xxx()
          commit: eec3b674f2a5c2334d2f1a2200b231975277e2c9
[064/292] ASoC: codecs: es8328: convert to snd_soc_dapm_xxx()
          commit: a5511a6e10f1e1462d61aec8420d6ac4cd9e3efe
[065/292] ASoC: codecs: es8389: convert to snd_soc_dapm_xxx()
          commit: 2e20e32c2e3ac17aae4f53ce6205a5d8bf34e895
[066/292] ASoC: codecs: hda: convert to snd_soc_dapm_xxx()
          commit: 4b9ac2be5fc62ea65c032c3e6e554e60757e5944
[067/292] ASoC: codecs: hdac_hda: convert to snd_soc_dapm_xxx()
          commit: a3151663d0274f79c52bb7ae11e69c0dad1f2267
[068/292] ASoC: codecs: hdac_hdmi: convert to snd_soc_dapm_xxx()
          commit: f2d57e22b51c0aa1b2d222b30c07cdf80e4a6ca5
[069/292] ASoC: codecs: hdmi-codec: convert to snd_soc_dapm_xxx()
          commit: b4403cf77e39c2d0e2694b1cf5311683cbfac789
[070/292] ASoC: codecs: jz4740: convert to snd_soc_dapm_xxx()
          commit: f4435734559b8b4bd2dd6c457705b8a22baca0a9
[071/292] ASoC: codecs: jz4760: convert to snd_soc_dapm_xxx()
          commit: f7e9d040d2b3243f9682c21ac7dda77a54b03c62
[072/292] ASoC: codecs: jz4770: convert to snd_soc_dapm_xxx()
          commit: daaf102aee4069d2fcaa4da60949b6e02f845c37
[073/292] ASoC: codecs: lm49453: convert to snd_soc_dapm_xxx()
          commit: 45da4a452aeb4f5f44bcbf50079291b70bec9dc5
[074/292] ASoC: codecs: lpass-rx-macro: convert to snd_soc_dapm_xxx()
          commit: 16d4e8616e78e5edbcb99268050b431afcfe4610
[075/292] ASoC: codecs: lpass-tx-macro: convert to snd_soc_dapm_xxx()
          commit: 3df33a9e0faae857dc4c594a915404afa6a7a8f8
[076/292] ASoC: codecs: lpass-va-macro: convert to snd_soc_dapm_xxx()
          commit: 5328d3d6b68d1819c199555aff88edad3ccd8bf3
[077/292] ASoC: codecs: lpass-wsa-macro: convert to snd_soc_dapm_xxx()
          commit: af9a1da6c3ae130fc44f218293410859f39bbd80
[078/292] ASoC: codecs: madera: convert to snd_soc_dapm_xxx()
          commit: 0682c592ec98ba18ac65d1cd4b9c345e2995c121
[079/292] ASoC: codecs: max98088: convert to snd_soc_dapm_xxx()
          commit: 9c3c02de4883862fdccbc38943ade051fc0de0e2
[080/292] ASoC: codecs: max98090: convert to snd_soc_dapm_xxx()
          commit: 6ef8e2f7e5eb6933e0897575e7869741ac34e302
[081/292] ASoC: codecs: max98095: convert to snd_soc_dapm_xxx()
          commit: 2e20be4b48c1d2886ff11147b302caab76f3c4b7
[082/292] ASoC: codecs: max98373: convert to snd_soc_dapm_xxx()
          commit: 2dcb4f1d27e9c7a610ca40ac37d2dd177db35a52
[083/292] ASoC: codecs: max98390: convert to snd_soc_dapm_xxx()
          commit: f97289522b7910921d771af00b7c0ec915f4e21f
[084/292] ASoC: codecs: max98396: convert to snd_soc_dapm_xxx()
          commit: bbbd507ab3c76f0ed262a29af89f36177a43d65b
[085/292] ASoC: codecs: max9850: convert to snd_soc_dapm_xxx()
          commit: a7ab96cf1366f2e35d05b1e773db2a4c1b5e4a45
[086/292] ASoC: codecs: max9867: convert to snd_soc_dapm_xxx()
          commit: 46fb094b54c89ddf314f7e807e5457be9b185bbc
[087/292] ASoC: codecs: ml26124: convert to snd_soc_dapm_xxx()
          commit: e195aad3cd473030ff696fdecb76a04d11f1d3b4
[088/292] ASoC: codecs: mt6357: convert to snd_soc_dapm_xxx()
          commit: 4ddf34b148dfb08d47b3e920fdf831eabd973130
[089/292] ASoC: codecs: mt6358: convert to snd_soc_dapm_xxx()
          commit: ea9d164c67245f5d94da8d46eac1de25fd1059d6
[090/292] ASoC: codecs: mt6359: convert to snd_soc_dapm_xxx()
          commit: f72c526d2e7a512ab969c3492a365633f5ff2f33
[091/292] ASoC: codecs: nau8810: convert to snd_soc_dapm_xxx()
          commit: 588dc19b1246fc05bd62b3471a01b19cafdc3809
[092/292] ASoC: codecs: nau8821: convert to snd_soc_dapm_xxx()
          commit: 0314d78729a936de02f97daabd8756eb361922d4
[093/292] ASoC: codecs: nau8822: convert to snd_soc_dapm_xxx()
          commit: 8000e233e920062dc08222fc6911e13c193d7719
[094/292] ASoC: codecs: nau8824: convert to snd_soc_dapm_xxx()
          commit: 3eca632e86ac79012fbbeb3b7753d345f0baad04
[095/292] ASoC: codecs: nau8825: convert to snd_soc_dapm_xxx()
          commit: 42f4ff0c0b21ac72ae3af23c67ce51209809e2a4
[096/292] ASoC: codecs: pcm186x: convert to snd_soc_dapm_xxx()
          commit: d1b06d4a37c301a09403746f1d12bdcaeed40830
[097/292] ASoC: codecs: pcm512x: convert to snd_soc_dapm_xxx()
          commit: 02dbbb7e982a6873f81e69e4fef59a42decb7b1a
[098/292] ASoC: codecs: rk3308: convert to snd_soc_dapm_xxx()
          commit: 2d8a091725e6f71c87a7ae35e51550693afdef77
[099/292] ASoC: codecs: rt1011: convert to snd_soc_dapm_xxx()
          commit: 5b35bb517f27fc2401ec3cfd8c02a127627a0188
[100/292] ASoC: codecs: rt1015: convert to snd_soc_dapm_xxx()
          commit: 8b1c56ae39d3bf304ab0c8de456e8f02081be9ed
[101/292] ASoC: codecs: rt274: convert to snd_soc_dapm_xxx()
          commit: 7d6ca6db9b6ee95adfdfabe84819b3b1900dfc05
[102/292] ASoC: codecs: rt286: convert to snd_soc_dapm_xxx()
          commit: c2b942fbf952d734646352ff56f04bea6c151d3a
[103/292] ASoC: codecs: rt298: convert to snd_soc_dapm_xxx()
          commit: 11c256c49d75c3d795339c93f52a19a202db5a15
[104/292] ASoC: codecs: rt5514: convert to snd_soc_dapm_xxx()
          commit: ca6cd3d3f1d7f98908dbc8342a28663346067b9a
[105/292] ASoC: codecs: rt5516: convert to snd_soc_dapm_xxx()
          commit: cffb8638191684198b4e696393c678498791c590
[106/292] ASoC: codecs: rt5631: convert to snd_soc_dapm_xxx()
          commit: ab7963a3adc1dec9dd6efb9f4755fedb9b56d35d
[107/292] ASoC: codecs: rt5640: convert to snd_soc_dapm_xxx()
          commit: c3282edee7bd18cde6cfdf31a918dbd112dd794b
[108/292] ASoC: codecs: rt5645: convert to snd_soc_dapm_xxx()
          commit: cd0cd7e57d2b300d3d63cb9befa9edcf3e05ad68
[109/292] ASoC: codecs: rt5651: convert to snd_soc_dapm_xxx()
          commit: d6abe1e31fef77aab57f252c842acb92517ba9d3
[110/292] ASoC: codecs: rt5659: convert to snd_soc_dapm_xxx()
          commit: 2049f715599eb677722a2e91d3616c4feff0e1fc
[111/292] ASoC: codecs: rt5660: convert to snd_soc_dapm_xxx()
          commit: 453dfd1c9b486f2289d60871ee11fa05809303ab
[112/292] ASoC: codecs: rt5663: convert to snd_soc_dapm_xxx()
          commit: 82d779d150ed27232c940a7908c0f42c248a981f
[113/292] ASoC: codecs: rt5665: convert to snd_soc_dapm_xxx()
          commit: 0c8392fd64e8be4fab28d8f568582f4cd7092196
[114/292] ASoC: codecs: rt5668: convert to snd_soc_dapm_xxx()
          commit: 60b6a547a88313022ca10af6a3029891bc638b1d
[115/292] ASoC: codecs: rt5670: convert to snd_soc_dapm_xxx()
          commit: 9bcc76f58217c1701deeb4b4092e54dc64ce38bc
[116/292] ASoC: codecs: rt5677: convert to snd_soc_dapm_xxx()
          commit: 6ad9058c495691f004e8e697e1acbb2b4775c7e2
[117/292] ASoC: codecs: rt5682: convert to snd_soc_dapm_xxx()
          commit: cf3937987c18980c3dffc456c91fc1f7b1cec4ca
[118/292] ASoC: codecs: rt5682s: convert to snd_soc_dapm_xxx()
          commit: e727c8d01a5d6049e756fc15dfec08fbf4f7b0cf
[119/292] ASoC: codecs: rt700: convert to snd_soc_dapm_xxx()
          commit: 1b30118264fc75f164ebf8a9888a16ddd2ebb3d4
[120/292] ASoC: codecs: rt711-sdca: convert to snd_soc_dapm_xxx()
          commit: 49a22e9811e1524cf4ee6c84e795526104f4fc3c
[121/292] ASoC: codecs: rt711: convert to snd_soc_dapm_xxx()
          commit: 6db8ba3439c995a08def399f9eda4e1d2b95afa8
[122/292] ASoC: codecs: rt712-sdca-dmic: convert to snd_soc_dapm_xxx()
          commit: 52239c555cbd7369b4009dbf72791f0bb56469b6
[123/292] ASoC: codecs: rt712-sdca: convert to snd_soc_dapm_xxx()
          commit: 24bca18098187d56257a938dfcae2673f8fa847a
[124/292] ASoC: codecs: rt715-sdca: convert to snd_soc_dapm_xxx()
          commit: 6254032a219c7581df8203b31480f06a2babd46d
[125/292] ASoC: codecs: rt715: convert to snd_soc_dapm_xxx()
          commit: bdc210a4485b640b65f3cf9cfd6fbe1e564e7645
[126/292] ASoC: codecs: rt721-sdca: convert to snd_soc_dapm_xxx()
          commit: 46db12032942a47d6c2b1158633514a739f780eb
[127/292] ASoC: codecs: simple-mux: convert to snd_soc_dapm_xxx()
          commit: 128cd2206689ebddb6f7a9682f5671190a570a56
[128/292] ASoC: codecs: sma1303: convert to snd_soc_dapm_xxx()
          commit: 636819c3962b9a2377bfdd3baa11e187cba39916
[129/292] ASoC: codecs: sma1307: convert to snd_soc_dapm_xxx()
          commit: 5d9958b2eff8ef283bb70fd0ae82cc6e65372876
[130/292] ASoC: codecs: ssm2518: convert to snd_soc_dapm_xxx()
          commit: 12cdef76abbbd5209829e73cc58d44a0921deeda
[131/292] ASoC: codecs: ssm2602: convert to snd_soc_dapm_xxx()
          commit: b637319d1fdc3686b669ab9c0ec6faee5e8954c2
[132/292] ASoC: codecs: ssm4567: convert to snd_soc_dapm_xxx()
          commit: 664ae39314732223786b1c94ac6031b01886fc84
[133/292] ASoC: codecs: sta32x: convert to snd_soc_dapm_xxx()
          commit: 8454435315e5a6e2f8e531b5ec038c6db4d6ebfe
[134/292] ASoC: codecs: sta350: convert to snd_soc_dapm_xxx()
          commit: f8b494b28806efc8e6dece1f66f30c371376788c
[135/292] ASoC: codecs: sta529: convert to snd_soc_dapm_xxx()
          commit: ca7f864f91bff158a697349dae2c81afae2b3073
[136/292] ASoC: codecs: tas571x: convert to snd_soc_dapm_xxx()
          commit: 88539900888437c446f44b8248797b958e10d14f
[137/292] ASoC: codecs: tas6424: convert to snd_soc_dapm_xxx()
          commit: a9b239d098dbbfa8dd0cc56001cfc80053da1317
[138/292] ASoC: codecs: tlv320adc3xxx: convert to snd_soc_dapm_xxx()
          commit: eeb152d9636f3a1355ce1d2bdc481cb70e0ca2bb
[139/292] ASoC: codecs: tlv320aic31xx: convert to snd_soc_dapm_xxx()
          commit: 1ddafb83a431b2d4c847b2640b352cfca0d1b077
[140/292] ASoC: codecs: tlv320aic32x4: convert to snd_soc_dapm_xxx()
          commit: 0da5d1fb00c1108e543fa94c92419006a1008d84
[141/292] ASoC: codecs: tlv320aic3x: convert to snd_soc_dapm_xxx()
          commit: cf61841233bd0c905b3493f879b45fa9f7d44ff4
[142/292] ASoC: codecs: tlv320dac33: convert to snd_soc_dapm_xxx()
          commit: 3affdae134871f7be7d28fe5a763f2a17d1c18ab
[143/292] ASoC: codecs: twl4030: convert to snd_soc_dapm_xxx()
          commit: 00246ae603ef2ee4765fd71923519849a1690286
[144/292] ASoC: codecs: twl6040: convert to snd_soc_dapm_xxx()
          commit: c5b5f6d75ecc87eb543ca8e867ca1585c03b242a
[145/292] ASoC: codecs: uda1380: convert to snd_soc_dapm_xxx()
          commit: 697f92e637d1c0de9ec9d1dc31a6fa3c921be831
[146/292] ASoC: codecs: wcd9335: convert to snd_soc_dapm_xxx()
          commit: 46f360c51cfeb7b29340815885e4a7e82b411bc8
[147/292] ASoC: codecs: wcd934x: convert to snd_soc_dapm_xxx()
          commit: 7b10c284495c7f9a666f7057351e67d6bc9c54bd
[148/292] ASoC: codecs: wcd937x: convert to snd_soc_dapm_xxx()
          commit: 2416360daf6e17c10af12f40139bfa84c99f7f2f
[149/292] ASoC: codecs: wm0010: convert to snd_soc_dapm_xxx()
          commit: c13e3d24dbe84b398bc9e5ea767e4d3515b06771
[150/292] ASoC: codecs: wm5100: convert to snd_soc_dapm_xxx()
          commit: 0ba0819b8fb4ea27d700e5784e150217e2d9f295
[151/292] ASoC: codecs: wm5102: convert to snd_soc_dapm_xxx()
          commit: eba22be8d911dea8132ae6bf8e83e26740e068b2
[152/292] ASoC: codecs: wm5110: convert to snd_soc_dapm_xxx()
          commit: a3de4a9c3e0627989efe88ea31f422f1da896dcc
[153/292] ASoC: codecs: wm8350: convert to snd_soc_dapm_xxx()
          commit: 62d12a8e945605468a8d119960c988014c44f6c0
[154/292] ASoC: codecs: wm8400: convert to snd_soc_dapm_xxx()
          commit: 863a396f09f559344e41ccaf2cab6aea12bcc3bc
[155/292] ASoC: codecs: wm8510: convert to snd_soc_dapm_xxx()
          commit: 098c486f07000c70fe18abd879a0abdb96ccfc23
[156/292] ASoC: codecs: wm8523: convert to snd_soc_dapm_xxx()
          commit: 8df50a4f2f9faaf336d3640174a828e9b979544b
[157/292] ASoC: codecs: wm8580: convert to snd_soc_dapm_xxx()
          commit: dde23aa355aa0fc1fbafd40dc53ffb2d67a7e8b9
[158/292] ASoC: codecs: wm8711: convert to snd_soc_dapm_xxx()
          commit: 9e1666651224267179d1e4f1e366cd526c384ae8
[159/292] ASoC: codecs: wm8728: convert to snd_soc_dapm_xxx()
          commit: 3f553ac8005e07e7c3d84edfdc08727439e4f5c7
[160/292] ASoC: codecs: wm8731: convert to snd_soc_dapm_xxx()
          commit: da9ad75afba487013bd4345d4b77477f35ed25ec
[161/292] ASoC: codecs: wm8737: convert to snd_soc_dapm_xxx()
          commit: 04b80a9aa21f2d02ac6ccbfacc33eb0827eb9899
[162/292] ASoC: codecs: wm8750: convert to snd_soc_dapm_xxx()
          commit: c153d6da9cde3efc5fbfcf39515d224c2b6ad48f
[163/292] ASoC: codecs: wm8753: convert to snd_soc_dapm_xxx()
          commit: 23805d059a597b001bd5e3655ee0bae652142944
[164/292] ASoC: codecs: wm8770: convert to snd_soc_dapm_xxx()
          commit: 92a3e4bb1813cd5eaba1050b9d82356b17daca2e
[165/292] ASoC: codecs: wm8776: convert to snd_soc_dapm_xxx()
          commit: acee6bda8872f715dcc6d3ff1fe387606d752661
[166/292] ASoC: codecs: wm8804: convert to snd_soc_dapm_xxx()
          commit: 1b6934ca2a68bca2d6a776497f47ba319419d7dd
[167/292] ASoC: codecs: wm8900: convert to snd_soc_dapm_xxx()
          commit: 4f9d291e6828aa92503988e319b175c0fa3303af
[168/292] ASoC: codecs: wm8903: convert to snd_soc_dapm_xxx()
          commit: 5b08edab386559a7d8549fa94688ea3878e9574f
[169/292] ASoC: codecs: wm8904: convert to snd_soc_dapm_xxx()
          commit: 3f2848403a817345c2d0984c49f128fc9dc28b3b
[170/292] ASoC: codecs: wm8940: convert to snd_soc_dapm_xxx()
          commit: a5a6abd02d100913327a150e764dbc29045970a1
[171/292] ASoC: codecs: wm8955: convert to snd_soc_dapm_xxx()
          commit: 5d1a88f50569d1c4637fe29620e6d194f7e50014
[172/292] ASoC: codecs: wm8960: convert to snd_soc_dapm_xxx()
          commit: aa57703fd738d0d9f1328d44bc6b9ee82daf0326
[173/292] ASoC: codecs: wm8961: convert to snd_soc_dapm_xxx()
          commit: 8d27adc88a5461b08990d33a16d215e3e7e890dc
[174/292] ASoC: codecs: wm8962: convert to snd_soc_dapm_xxx()
          commit: 58fc7681c470d39332f01aae88b2259e613e53e3
[175/292] ASoC: codecs: wm8971: convert to snd_soc_dapm_xxx()
          commit: 8efb94a90e6558a2aeffac518e7b7479fdaa14d9
[176/292] ASoC: codecs: wm8974: convert to snd_soc_dapm_xxx()
          commit: 8268a73d6c93b9cadf323bb9ef92fd01d4eb6529
[177/292] ASoC: codecs: wm8978: convert to snd_soc_dapm_xxx()
          commit: 21bb118ea37adc40027771b1f45a246eb3956265
[178/292] ASoC: codecs: wm8983: convert to snd_soc_dapm_xxx()
          commit: 19bf3fb9baf235cca9f9bb52cee488662e5bba0c
[179/292] ASoC: codecs: wm8985: convert to snd_soc_dapm_xxx()
          commit: d4ed7da08c767437400b2550092b7ea67cfac294
[180/292] ASoC: codecs: wm8988: convert to snd_soc_dapm_xxx()
          commit: 7881b033afa1a2f6ec587dabfe2e12d0bfdef022
[181/292] ASoC: codecs: wm8990: convert to snd_soc_dapm_xxx()
          commit: 4e111f49809959bd568cf68bea83155908872164
[182/292] ASoC: codecs: wm8991: convert to snd_soc_dapm_xxx()
          commit: 6f917e47db4984e784a5245b4e3f35ca16b01ccf
[183/292] ASoC: codecs: wm8993: convert to snd_soc_dapm_xxx()
          commit: 69532b4263a264c5bf9ad11046ad1acb2ab3534e
[184/292] ASoC: codecs: wm8994: convert to snd_soc_dapm_xxx()
          commit: 10d5d21a3379b56a0655609918fcc4b4ccb4909d
[185/292] ASoC: codecs: wm8995: convert to snd_soc_dapm_xxx()
          commit: 0e8d0789ded09e681cb3ba48beaceca125d441f5
[186/292] ASoC: codecs: wm8996: convert to snd_soc_dapm_xxx()
          commit: 9050b9a872a9bb78874ff6b7ba933ca0a90dcecd
[187/292] ASoC: codecs: wm8997: convert to snd_soc_dapm_xxx()
          commit: 1a8870e2e2eeb7819ad540f0027faec500833351
[188/292] ASoC: codecs: wm8998: convert to snd_soc_dapm_xxx()
          commit: 8a19eabf16304642a1c281f6676b7248b234ca1d
[189/292] ASoC: codecs: wm9081: convert to snd_soc_dapm_xxx()
          commit: fef5517fff15652903f56f153938eaf93c2c53a0
[190/292] ASoC: codecs: wm9090: convert to snd_soc_dapm_xxx()
          commit: 2cc325972373bf86f561eaec45680d4ab957e4eb
[191/292] ASoC: codecs: wm9712: convert to snd_soc_dapm_xxx()
          commit: c2bdc0301db723b67b9c6cbd572f8df4b473cc4a
[192/292] ASoC: codecs: wm9713: convert to snd_soc_dapm_xxx()
          commit: 2f558a84ced9e7ad6d5e53617d6848df9696ecd9
[193/292] ASoC: codecs: wm_adsp: convert to snd_soc_dapm_xxx()
          commit: 0e435dd54f5e3f4077ae3c8db1d1c3c2e5823a8a
[194/292] ASoC: codecs: wm_hubs: convert to snd_soc_dapm_xxx()
          commit: e70ef8a90d431157ad1b314a78125aab50eeda3e
[195/292] ASoC: fsl: fsl-asoc-card: convert to snd_soc_dapm_xxx()
          commit: 7fb390727decac201fc9370bb14b17d91c334da6
[196/292] ASoC: fsl: imx-rpmsg: convert to snd_soc_dapm_xxx()
          commit: 21838f53f47e2fa4dfdda71a9bc895f599e7cf9f
[197/292] ASoC: generic: audio-graph-card: convert to snd_soc_dapm_xxx()
          commit: 1014ec36b43a997a8d8fcf68728d1fd6c891b004
[198/292] ASoC: intel: atom: sst-atom-controls: convert to snd_soc_dapm_xxx()
          commit: 194c43841d9e5695837789f288889ca02c023074
[199/292] ASoC: intel: avs: da7219: convert to snd_soc_dapm_xxx()
          commit: 2988abc11bb7c4cf756b4197de0879ed92bb39bf
[200/292] ASoC: intel: avs: es8336: convert to snd_soc_dapm_xxx()
          commit: 8c827c1c78b7260bfdd33cd8ddf82e3c19c24bb2
[201/292] ASoC: intel: avs: nau8825: convert to snd_soc_dapm_xxx()
          commit: 84496142859a4c66aab3d82ce110952541614ef3
[202/292] ASoC: intel: avs: rt274: convert to snd_soc_dapm_xxx()
          commit: 2f8d6a86936e10bb65042f2c4da8c84e164b3693
[203/292] ASoC: intel: avs: rt5514: convert to snd_soc_dapm_xxx()
          commit: dd929092b3122a9cfd1f7115c4eecdb7944c45a8
[204/292] ASoC: intel: avs: rt5640: convert to snd_soc_dapm_xxx()
          commit: 4cc345c56b2458d449bf2479cb72afbb8e9dfc1c
[205/292] ASoC: intel: avs: control: convert to snd_soc_dapm_xxx()
          commit: 6603016167aace5d4c78bdfa5eb1f928a42d7e47
[206/292] ASoC: intel: avs: pcm: convert to snd_soc_dapm_xxx()
          commit: 738a0014640cc1a2ee75d66e13327db87fca8a58
[207/292] ASoC: intel: boards: bdw-rt5677: convert to snd_soc_dapm_xxx()
          commit: e3c9bc1f31214f33e24fae70ade0d748ed5cba95
[208/292] ASoC: intel: boards: bytcht_cx2072x: convert to snd_soc_dapm_xxx()
          commit: 9c082ab3ebb8baa1f9f17a5c4a85d2345f5b305c
[209/292] ASoC: intel: boards: bytcht_es8316: convert to snd_soc_dapm_xxx()
          commit: d02bbabec7e330346b85a43c0f89ee61144985a8
[210/292] ASoC: intel: boards: bytcr_rt5640: convert to snd_soc_dapm_xxx()
          commit: e6995aa8165571c0f85ca259de15edde713bfa7c
[211/292] ASoC: intel: boards: bytcr_rt5651: convert to snd_soc_dapm_xxx()
          commit: 575eb51c72251f73d21408829ed39b8b03e67894
[212/292] ASoC: intel: boards: bytcr_wm5102: convert to snd_soc_dapm_xxx()
          commit: 2990b658ed446abd3b509854e2b266eaef666ac5
[213/292] ASoC: intel: boards: cht_bsw_max98090_ti: convert to snd_soc_dapm_xxx()
          commit: 8c62a765be9ece320dd4da00dcd038f6b83ea2f2
[214/292] ASoC: intel: boards: cht_bsw_rt5645: convert to snd_soc_dapm_xxx()
          commit: 61907c9a0d25200ea4681a0ae6b2f7c7673ea5bb
[215/292] ASoC: intel: boards: cht_bsw_rt5672: convert to snd_soc_dapm_xxx()
          commit: be0c2c4010c2e641772408c2bce1649e5db20f2f
[216/292] ASoC: intel: boards: sof_board_helpers: convert to snd_soc_dapm_xxx()
          commit: a30381e9cc2d32d8e0d4077cfa6aab0c70d34105
[217/292] ASoC: intel: boards: sof_cirrus_common: convert to snd_soc_dapm_xxx()
          commit: 5969275804b8f033618ff8f7309b016deb5e5117
[218/292] ASoC: intel: boards: sof_da7219: convert to snd_soc_dapm_xxx()
          commit: 638d14a0a0658f7fd8b868ebb93289d21fb64006
[219/292] ASoC: intel: boards: sof_es8336: convert to snd_soc_dapm_xxx()
          commit: beb865ab8e5a2d92ae11daca23bdfa51aea587cb
[220/292] ASoC: intel: boards: sof_maxim_common: convert to snd_soc_dapm_xxx()
          commit: f1ead097d7ddb7014215518f290e49e7fc374266
[221/292] ASoC: intel: boards: sof_nau8825: convert to snd_soc_dapm_xxx()
          commit: 9defa941d828ad48bb24249363b0f956b3dd3770
[222/292] ASoC: intel: boards: sof_nuvoton_common: convert to snd_soc_dapm_xxx()
          commit: 9c95183d4e0cd557bcae21608b03ae9cf0eb87cb
[223/292] ASoC: intel: boards: sof_pcm512x: convert to snd_soc_dapm_xxx()
          commit: 85216ea34568352c7c06ba7152ab1e9ccc73eff7
[224/292] ASoC: intel: boards: sof_realtek_common: convert to snd_soc_dapm_xxx()
          commit: 8124fe3d5b254a0c17da853591616c8d8ee602e7
[225/292] ASoC: intel: boards: sof_rt5682: convert to snd_soc_dapm_xxx()
          commit: 5a3c54a94c9101ce126cae1fe21df0cab5d80c63
[226/292] ASoC: mediatek: mtk-afe-platform-driver: convert to snd_soc_dapm_xxx()
          commit: 063e91a9141e708fe07a2a06d50fb0b3ed1ecbea
[227/292] ASoC: mediatek: mtk-dsp-sof-common: convert to snd_soc_dapm_xxx()
          commit: b63f223ce0d402237ef339b8482ecc627320df3d
[228/292] ASoC: mediatek: mt8186-mt6366-common: convert to snd_soc_dapm_xxx()
          commit: aa851ed8746e20d4123efad82fa4ea3dd1f2b14e
[229/292] ASoC: mediatek: mt8186-mt6366: convert to snd_soc_dapm_xxx()
          commit: 771f522d64303751f976d888a9d6160a345042e2
[230/292] ASoC: mediatek: mt8188-mt6359: convert to snd_soc_dapm_xxx()
          commit: af535c76426ebbd3df12a804fa6da5b9e8c0339e
[231/292] ASoC: mediatek: mt8195-mt6359: convert to snd_soc_dapm_xxx()
          commit: 8d5a933224b59fa5a4d540f37b77fee5d22b3eb9
[232/292] ASoC: mediatek: mt8365-afe-pcm: convert to snd_soc_dapm_xxx()
          commit: ab947ebd0e06b1bba68702cadec93359371f0c16
[233/292] ASoC: meson: aiu-acodec-ctrl: convert to snd_soc_dapm_xxx()
          commit: 047191ae16d336b5343b3eec1ad3532dedacee2d
[234/292] ASoC: meson: aiu-codec-ctrl: convert to snd_soc_dapm_xxx()
          commit: 6c65a8c3ad82616e6654c82ec0da33233e6f4e02
[235/292] ASoC: meson: axg-spdifout: convert to snd_soc_dapm_xxx()
          commit: 32fc5bf2ea987504d10afe329727ab8c6fd8c836
[236/292] ASoC: meson: axg-tdm-interface: convert to snd_soc_dapm_xxx()
          commit: 0c02abd9f443565b00f79f5d84166d610200b1a5
[237/292] ASoC: meson: g12a-toacodec: convert to snd_soc_dapm_xxx()
          commit: 6a995aaaa4b63c324116f03adb94985654a6cb6e
[238/292] ASoC: meson: g12a-tohdmitx: convert to snd_soc_dapm_xxx()
          commit: 74c772546632500f64a4fc4b318cde9f87a29cf6
[239/292] ASoC: meson: t9015: convert to snd_soc_dapm_xxx()
          commit: a0593f6d1200bb17b69f85e89a9c6c6bcb2966b2
[240/292] ASoC: pxa: spitz: convert to snd_soc_dapm_xxx()
          commit: 22219a4af85457a7ab8fdfa925a1fa2bffe66dd2
[241/292] ASoC: qcom: q6routing: convert to snd_soc_dapm_xxx()
          commit: 8686dd09358b92c2d3dc7b6d0cc893d1d72ef628
[242/292] ASoC: qcom: q6usb: convert to snd_soc_dapm_xxx()
          commit: f74aa1e909e7ea960effb5d054cb9ff7e39d84b8
[243/292] ASoC: qcom: topology: convert to snd_soc_dapm_xxx()
          commit: a4230eea80ddb9d08e4098f980ddf1d22bbc18ef
[244/292] ASoC: qcom: sc7180: convert to snd_soc_dapm_xxx()
          commit: cacd21b61750c998f74e3d6aabfca1315298e699
[245/292] ASoC: rockchip: rk3288_hdmi_analog: convert to snd_soc_dapm_xxx()
          commit: 26de56c382450acd5d397631f490dc2d50e7a9c4
[246/292] ASoC: rockchip: rockchip_max98090: convert to snd_soc_dapm_xxx()
          commit: 256cfc79911658a90caa7655e88c255255068ad1
[247/292] ASoC: samsung: aries_wm8994: convert to snd_soc_dapm_xxx()
          commit: 02697e7049ddca90e128a89ca276e3ccaeff447a
[248/292] ASoC: samsung: bells: convert to snd_soc_dapm_xxx()
          commit: 857c31f15cef81745855a53262b021bec95ca7a8
[249/292] ASoC: samsung: littlemill: convert to snd_soc_dapm_xxx()
          commit: c9d3bcafc711794efe493b7ad26ff704d560b725
[250/292] ASoC: samsung: lowland: convert to snd_soc_dapm_xxx()
          commit: eac123525d4214d4ef4d751cb48649130b4cf51f
[251/292] ASoC: samsung: midas_wm1811: convert to snd_soc_dapm_xxx()
          commit: 311c12f7031d845c27e383f2987e53a35b684e5c
[252/292] ASoC: samsung: smdk_wm8994: convert to snd_soc_dapm_xxx()
          commit: 620fd65ec496b4fe0f49f3b6bc1fd1f890432fd6
[253/292] ASoC: samsung: speyside: convert to snd_soc_dapm_xxx()
          commit: d1cca4a46f6dfad9a383e5aa30dd8a63833d7a82
[254/292] ASoC: samsung: tm2_wm5110: convert to snd_soc_dapm_xxx()
          commit: b6ba1a11ea626dd82672e06ffa7809beb671277a
[255/292] ASoC: samsung: tobermory: convert to snd_soc_dapm_xxx()
          commit: 1c4143ea606a60a11d623a0bd751c8b0af0119e0
[256/292] ASoC: sdca: sdca_asoc: convert to snd_soc_dapm_xxx()
          commit: 5a2b4ddc2cf7f150328f4d1ae617b62a3a3df45c
[257/292] ASoC: sdw_utils: soc_sdw_bridge_cs35l56: convert to snd_soc_dapm_xxx()
          commit: cb5aaf1bab5f7ef98f04eea303eb39ed05325dfe
[258/292] ASoC: sdw_utils: soc_sdw_cs42l42: convert to snd_soc_dapm_xxx()
          commit: 574a59412d32e8e094e636feeaa4d29b55d35410
[259/292] ASoC: sdw_utils: soc_sdw_cs42l43: convert to snd_soc_dapm_xxx()
          commit: 97a57e6ea996a773b278106755368755a9c2dc18
[260/292] ASoC: sdw_utils: soc_sdw_cs_amp: convert to snd_soc_dapm_xxx()
          commit: d0764e1476da99ad781745b5b6a7d583cbf1d7e5
[261/292] ASoC: sdw_utils: soc_sdw_dmic: convert to snd_soc_dapm_xxx()
          commit: fbada860c48112083c6212d2a0df5e4d919998c9
[262/292] ASoC: sdw_utils: soc_sdw_maxim: convert to snd_soc_dapm_xxx()
          commit: f39ee5784bb848d320e7e387ef2c11ef21c97e83
[263/292] ASoC: sdw_utils: soc_sdw_rt5682: convert to snd_soc_dapm_xxx()
          commit: 9abf16750a7bb052799229b5cff5b14459d3bb21
[264/292] ASoC: sdw_utils: soc_sdw_rt700: convert to snd_soc_dapm_xxx()
          commit: 6353596bb18588c5d24c96501081c1ef9cce5754
[265/292] ASoC: sdw_utils: soc_sdw_rt711: convert to snd_soc_dapm_xxx()
          commit: 5fca4f6a958c51f2c82d0838735b1cc6ba4da3dd
[266/292] ASoC: sdw_utils: soc_sdw_rt_amp: convert to snd_soc_dapm_xxx()
          commit: 805759446d9e8f278881f03d5b4b6bcacf9f0ce3
[267/292] ASoC: sdw_utils: soc_sdw_rt_mf_sdca: convert to snd_soc_dapm_xxx()
          commit: d10755f895eb295738c4db23ab970f8acaebd7ce
[268/292] ASoC: sdw_utils: soc_sdw_rt_sdca_jack_common: convert to snd_soc_dapm_xxx()
          commit: 2bcf4235819c22b8a6dcbae9d9101d6202ea949c
[269/292] ASoC: sdw_utils: soc_sdw_ti_amp: convert to snd_soc_dapm_xxx()
          commit: fdc5ce7f7272e59a1c32919b1ba8ab73d1bc28ab
[270/292] ASoC: sdw_utils: soc_sdw_utils: convert to snd_soc_dapm_xxx()
          commit: 5b54c4ae6c880024699a7c0391991e45ca053477
[271/292] ASoC: soc-core: convert to snd_soc_dapm_xxx()
          commit: e758b08d7170ee96e3461cec5c5b33e9aff5a75e
[272/292] ASoC: soc-dapm: convert to snd_soc_dapm_xxx()
          commit: b10489e9da2850bcaa53117df1331dc371df8d35
[273/292] ASoC: soc-jack: convert to snd_soc_dapm_xxx()
          commit: 0813e864070dd6fca79619bb4f99e38c97422383
[274/292] ASoC: soc-pcm: convert to snd_soc_dapm_xxx()
          commit: eb802ba07bcc1fbcf637b9ccf1ffcdc74277cca4
[275/292] ASoC: soc-topology: convert to snd_soc_dapm_xxx()
          commit: 088fa2cc7c4c4ec80a293692456f48c43b4da0e7
[276/292] ASoC: sof-client-probes: convert to snd_soc_dapm_xxx()
          commit: 49b476efceb52a8cefd4e1c74672b55826680c4e
[277/292] ASoC: sunxi: sun4i-codec: convert to snd_soc_dapm_xxx()
          commit: bc8ec019290f00d605423db6ba5fd9db81e83bac
[278/292] ASoC: sunxi: sun50i-codec-analog: convert to snd_soc_dapm_xxx()
          commit: fd73d62f5f8b61bd396e4e4185ba2f8ad3a712db
[279/292] ASoC: sunxi: sun8i-codec-analog: convert to snd_soc_dapm_xxx()
          commit: d4dfae0a980c30ecb4c9c3bd90d36171735dcc79
[280/292] ASoC: sunxi: sun8i-codec: convert to snd_soc_dapm_xxx()
          commit: f0762675a23396e80a30fdb6d71a89dcfb972154
[281/292] ASoC: tegra: tegra210_ahub: convert to snd_soc_dapm_xxx()
          commit: 0019f120bfe862a583aa1a4347c1761e947e0054
[282/292] ASoC: tegra: tegra_asoc_machine: convert to snd_soc_dapm_xxx()
          commit: 03258f7765e8c0210ea35b865f8e5c03fd9ccab9
[283/292] ASoC: tegra: tegra_wm8903: convert to snd_soc_dapm_xxx()
          commit: a6aa027dffef1b6d6ebc9ef87210493bcf7abf22
[284/292] ASoC: ti: ams-delta: convert to snd_soc_dapm_xxx()
          commit: cf3c9aa075313898ac1669d0214946f0af84d18b
[285/292] ASoC: ti: davinci-evm: convert to snd_soc_dapm_xxx()
          commit: 9188f03aa5157abbe8eba3130df4381245fe4cd0
[286/292] ASoC: ti: j721e-evm: convert to snd_soc_dapm_xxx()
          commit: a3fc90c52ad0d525918aa5039cb07d937dc1d841
[287/292] ASoC: ti: n810: convert to snd_soc_dapm_xxx()
          commit: 9b5a1d32da7e343e8fbdfbc536770544551ef59b
[288/292] ASoC: ti: omap-abe-twl6040: convert to snd_soc_dapm_xxx()
          commit: 4fb45e5d4abda09bfd805b08fa3446686aa3c6bb
[289/292] ASoC: ti: omap-twl4030: convert to snd_soc_dapm_xxx()
          commit: 42e142c842cb9c7dbde569ff137974e76d1a0e67
[290/292] ASoC: ti: omap3pandora: convert to snd_soc_dapm_xxx()
          commit: c69951603150c2b08f69feb8eb2475d58c1ef7cd
[291/292] ASoC: ti: rx51: convert to snd_soc_dapm_xxx()
          commit: fefd4e0b26392ab7676b13b597166b6478eec4c6
[292/292] ASoC: ux500: mop500_ab8500: convert to snd_soc_dapm_xxx()
          commit: 4422df6782eb7aa9725a3c09d9ba3c38ecc85df4

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

