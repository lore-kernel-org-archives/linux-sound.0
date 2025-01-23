Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF6A320B;
	Thu, 23 Jan 2025 13:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737639861; cv=none; b=OdEYfcBOaYZR2G23XtkzE9YAiuaowx2xWYoJ7Qhz3YNMomY/CD97VtMyAgiTI9w+ZxcGhsINk0SKvW08zG0AeT3y17axeOv+zRum8EPX/qjWP4kA+tuyr6SZ0+NCNbv+agVxCAsEjQKE68I0Kz8M3CxT8d9ZOFBTE0aGuHk84Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737639861; c=relaxed/simple;
	bh=b6sXlFga9cqg86NRd2nVq/xWp9/RTlzRSzqluBrqYnw=;
	h=Date:Message-ID:From:To:Cc:Subject:MIME-Version:Content-Type; b=QyuHvDFxbOD3z0uJpL/Eid+/Y1nDyXu9oOZuRuXLrAQ/mk0kZ7+CoAHN7e1WL8LEJ1cqnb/yN1jDdO+3kl7rx3MacYaLWNLJ3459uQNlyik4hwNa6uVqWZEz5DtweabA5Q0SepV0ujqJSyqpiNpYRNG7m0oslQak/aCh3yaH5T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=AlwT9UdP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=EkPnrL79; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QJoQbC3H; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mWXMW/vM; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="AlwT9UdP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="EkPnrL79";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QJoQbC3H";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mWXMW/vM"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id EB58C21170;
	Thu, 23 Jan 2025 13:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1737639857; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gGmLrN/HhNWq4tVCialktEAJKY8UHrL0F721X1OnWzg=;
	b=AlwT9UdPlrg5hf7EBgh6MH5KQMBihT7Qe/fFDLYAQzxIgsSzzgleg+0LlnGZhgiRWUf1Rg
	++I/KkF/9L1nQ+lA1CGbgNEJ2fKtpVgjvuOvtsCcBqqD+8vqoyOHCvutssJDOP+CKYpX0+
	lhGq5vTUdI1ahmGLMnkbK9E+pzvUZIc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737639857;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gGmLrN/HhNWq4tVCialktEAJKY8UHrL0F721X1OnWzg=;
	b=EkPnrL79debfkYYrq/C28r6LXVGT48Salzko9m8s4kPj6AvzUunSK8JIvPmeIN1XoVOWfP
	ik64iu/Kz6chGEBA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=QJoQbC3H;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="mWXMW/vM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1737639856; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gGmLrN/HhNWq4tVCialktEAJKY8UHrL0F721X1OnWzg=;
	b=QJoQbC3HbBqryz/P1C0LICBhR3RdhU68gQKyZA4qoVQYb4aAfMca4hz6mKEAf1PDFdOOzr
	Hu8Zxp5xxM832MI2CZJNOGZescSTSEfOXyycscr4/Qm7D2nHjbzUq1tBpozrnJ2/kiHezi
	mj6GZsfrrpJXKHfkrG+JySV/ARAbMO8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737639856;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gGmLrN/HhNWq4tVCialktEAJKY8UHrL0F721X1OnWzg=;
	b=mWXMW/vMyRGuDIA1VfcYpRdP4ln9yUMFskHY5nzDS9/50waDaKzn1KA+83rm3g1ASHJtiX
	dY+bAkpK9Dn+HkBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B5ABC1351A;
	Thu, 23 Jan 2025 13:44:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id xU0vK7BHkmetRwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 23 Jan 2025 13:44:16 +0000
Date: Thu, 23 Jan 2025 14:44:16 +0100
Message-ID: <87tt9p4pcf.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] sound updates for 6.14-rc1
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: EB58C21170
X-Spam-Score: -3.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim];
	TO_DN_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

Linus,

please pull sound updates for v6.14-rc1 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-6.14-rc1

The topmost commit is 6aa96f780204bfdac225eb4c8f51f86c38cc1a26

----------------------------------------------------------------

sound updates for 6.14-rc1

This was a relatively calm cycle, and most of changes are rather small
device-specific fixes.  Here are highlights:

* Core:
- Further enhancements of ALSA rawmidi and sequencer APIs for MIDI 2.0
- compress-offload API extensions for ASRC support

* ASoC:
- Allow clocking on each DAI in an audio graph card to be configured
  separately
- Improved power management for Renesas RZ-SSI
- KUnit testing for the Cirrus DSP framework
- Memory to meory operation support for Freescale/NXP platforms
- Support for pause operations in SOF
- Support for Allwinner suinv F1C100s, Awinc AW88083, Realtek
  ALC5682I-VE

* HD- and USB-audio:
- Add support for Focusrite Scarlett 4th Gen 16i16, 18i16, and 18i20
  interfaces via new FCP driver
- TAS2781 SPI HD-audio sub-codec support
- Various device-specific quirks as usual

----------------------------------------------------------------

Alexey Klimov (1):
      ASoC: qcom: sdm845: add handling of secondary MI2S clock

Amadeusz S³awiñski (4):
      ASoC: Intel: avs: Fix init-config parsing
      ASoC: Intel: avs: Print IPC error messages in lower layer
      ASoC: Intel: avs: Add MODULE_FIRMWARE to inform about FW
      ASoC: Intel: avs: Update ASRC definition

Andrew Davis (21):
      ASoC: ad193x: Remove use of i2c_match_id()
      ASoC: adau1761: Remove use of i2c_match_id()
      ASoC: adau1781: Remove use of i2c_match_id()
      ASoC: adau1977: Remove use of i2c_match_id()
      ASoC: alc5623: Remove use of i2c_match_id()
      ASoC: alc5632: Remove use of i2c_match_id()
      ASoC: max98088: Remove use of i2c_match_id()
      ASoC: max98090: Remove use of i2c_match_id()
      ASoC: max98095: Remove use of i2c_match_id()
      ASoC: pcm186x: Remove use of i2c_match_id()
      ASoc: pcm6240: Remove use of i2c_match_id()
      ASoC: ssm2602: Remove use of i2c_match_id()
      ASoC: tas2562: Remove use of i2c_match_id()
      ASoC: tas2781: Remove use of i2c_match_id()
      ASoC: tas5720: Remove use of i2c_match_id()
      ASoC: tlv320adc3xxx: Remove use of i2c_match_id()
      ASoC: tlv320aic31xx: Remove use of i2c_match_id()
      ASoC: tlv320aic3x: Remove use of i2c_match_id()
      ASoC: tpa6130a2: Remove use of i2c_match_id()
      ASoC: wm8904: Remove use of i2c_match_id()
      ASoC: wm8985: Remove use of i2c_match_id()

Andy Shevchenko (1):
      ASoc: mediatek: mt8365: Don't use "proxy" headers

Arnd Bergmann (1):
      firmware: cs_dsp: avoid large local variables

Baojun Xu (1):
      ALSA: hda/tas2781: Add tas2781 hda SPI driver

Bard Liao (7):
      ASoC: SOF: Intel: hda-dai: Ensure DAI widget is valid during params
      ASoC: Intel: sof_sdw: correct mach_params->dmic_num
      ASoC: Intel: sof_sdw: reduce log level for not using internal dmic
      ASoC: Intel: sof_sdw: improve the log of DAI link numbers
      ASoC: Intel: soc-acpi-intel-ptl-match: add rt712_vb + rt1320 support
      ASoC: Intel: soc-acpi-intel-lnl-match: add rt713_vb_l2_rt1320_l13 support
      ASoC: Intel: soc-acpi-intel-ptl-match: add rt713_vb_l2_rt1320_l13 support

Bence Csókás (1):
      ASoC: sun4i-codec: Use new devm clk and reset APIs

Cezary Rojewski (11):
      ASoC: Intel: avs: Do not readq() u32 registers
      ASoC: Intel: avs: Fix the minimum firmware version numbers
      ASoC: Intel: avs: Fix theoretical infinite loop
      ASoC: Intel: avs: Update hda component teardown sequences
      ASoC: Intel: avs: Clearly state assumptions of hw_params()
      ASoC: Intel: avs: Improve logging of firmware loading
      ASoC: Intel: avs: Adjust DSP status register names
      ASoC: Intel: avs: Adjust IPC traces
      ASoC: Intel: avs: Add missing includes
      ALSA: hda: Fix compilation of snd_hdac_adsp_xxx() helpers
      ALSA: hda: Transfer firmware in two chunks

Chancel Liu (4):
      ASoC: fsl_utils: Add function to constrain rates
      ASoC: fsl_micfil: Switch to common sample rate constraint function
      ASoC: fsl_xcvr: Add sample rate constraint
      ASoC: fsl_sai: Add sample rate constraint

Charles Keepax (5):
      ASoC: SDCA: Add missing header includes
      ASoC: SDCA: Clean up error messages
      ASoC: SDCA: Add bounds check for function address
      ASoC: SDCA: Add missing function type names
      ASoC: SDCA: Split function type patching and function naming

Christophe JAILLET (1):
      ASoC: cs42l51: Constify struct i2c_device_id

Claudiu Beznea (16):
      ASoC: renesas: rz-ssi: Terminate all the DMA transactions
      ASoC: renesas: rz-ssi: Use only the proper amount of dividers
      ASoC: renesas: rz-ssi: Fix typo on SSI_RATES macro comment
      ASoC: renesas: rz-ssi: Remove pdev member of struct rz_ssi_priv
      ASoC: renesas: rz-ssi: Remove the rz_ssi_get_dai() function
      ASoC: renesas: rz-ssi: Remove the first argument of rz_ssi_stream_is_play()
      ASoC: renesas: rz-ssi: Use readl_poll_timeout_atomic()
      ASoC: renesas: rz-ssi: Use temporary variable for struct device
      ASoC: renesas: rz-ssi: Use goto label names that specify their actions
      ASoC: renesas: rz-ssi: Rely on the ASoC subsystem to runtime resume/suspend the SSI
      ASoC: renesas: rz-ssi: Enable runtime PM autosuspend support
      ASoC: renesas: rz-ssi: Add runtime PM support
      ASoC: renesas: rz-ssi: Issue software reset in hw_params API
      ASoC: renesas: rz-ssi: Add suspend to RAM support
      ASoC: dt-bindings: renesas,rz-ssi: Remove DMA description
      ASoC: dt-bindings: renesas,rz-ssi: Document the Renesas RZ/G3S SoC

Colin Ian King (1):
      ASoC: soc-core: remove redundant assignment to variable ret

Csókás Bence (1):
      ASoC: dt-bindings: Add Allwinner suniv F1C100s Audio Codec

Dan Carpenter (3):
      ASoC: renesas: rz-ssi: Add a check for negative sample_space
      ALSA: hda: tas2781-spi: Delete some dead code
      ALSA: hda: tas2781-spi: Fix error code in tas2781_read_acpi()

Derek Fang (1):
      ASoC: rt5682: Support the ALC5682I-VE codec

Dheeraj Reddy Jonnalagadda (1):
      ASoC: rockchip: i2s-tdm: Fix a useless call issue

Dr. David Alan Gilbert (1):
      ASoC: rt715: Remove unused hda_to_sdw

Edson Juliano Drosdeck (1):
      ALSA: hda/realtek: Enable headset mic on Positivo C6400

Ethan Carter Edwards (1):
      ALSA: ctxfi: Simplify dao_clear_{left,right}_input() functions

Geoffrey D. Bennett (2):
      ALSA: FCP: Add Focusrite Control Protocol driver
      ALSA: scarlett2: Add device_setup option to use FCP driver

George Lander (1):
      ASoC: sun4i-spdif: Add clock multiplier settings

Jackie Dong (1):
      ALSA: hda: Support for Ideapad hotkey mute LEDs

Kailang Yang (1):
      ALSA: hda/realtek - Fixed headphone distorted sound on Acer Aspire A115-31 laptop

Krzysztof Kozlowski (3):
      ASoC: codecs: wcd9335: Add define for number of DAIs
      ASoC: dt-bindings: qcom,wcd9335: Drop number of DAIs from the header
      ASoC: dt-bindings: Correct indentation and style in DTS example

Kuninori Morimoto (18):
      ASoC: simple-card-utils: use __free(device_node) for device node
      ASoC: simple-card-utils: check port reg first on graph_get_dai_id()
      ASoC: simple-card-utils: use for_each_of_graph_port() on graph_get_dai_id()
      ASoC: soc-core: tidyup ret handling for card->disable_route_checks
      ASoC: soc-pcm: don't use soc_pcm_ret() on .prepare callback
      ASoC: simple-card-utils: Unify clock direction by clk_direction
      ASoC: dt-bindings: renesas,rsnd: remove post-init-providers property
      ASoC: soc-card: remove card check
      ASoC: intel: remove disable_route_checks
      ASoC: remove disable_route_checks
      ASoC: audio-graph-card2: use __free(device_node) for device node
      ASoC: audio-graph-card: use __free(device_node) for device node
      ASoC: simple-card: use __free(device_node) for device node
      ASoC: soc-core: return 0 if np was NULL on snd_soc_daifmt_parse_clock_provider_raw()
      ASoC: audio-graph-card2: use of_graph_get_port_by_id() at graph_get_next_multi_ep()
      ASoC: soc-core: Enable to use extra format on each DAI
      ASoC: audio-graph-card2: Use extra format on each DAI
      ASoC: soc-dapm: remove !card check from snd_soc_dapm_set_bias_level()

Laurentiu Mihalcea (1):
      ASoC: simple-card-utils: fix priv->dai_props indexing

Lianqin Hu (1):
      ALSA: usb-audio: Add delay quirk for USB Audio Device

Marcus Cooper (2):
      ASoC: sun4i-spdif: Always set the valid data to be the MSB
      ASoC: sun4i-spdif: Add working 24bit audio support

Martin Blumenstingl (2):
      ASoC: soc-dai: add snd_soc_dai_prepare() and use it internally
      ASoC: dapm: add support for preparing streams

Maxim Kochetkov (1):
      ASoC: codecs: nau8824: fix max volume for Speaker output

Mesih Kilinc (2):
      ASoC: sun4i-codec: Add DMA Max Burst field
      ASoC: sun4i-codec: Add support for Allwinner suniv F1C100s

Michal Simek (1):
      ASoC: xilinx: xlnx_spdif: Simpify using devm_clk_get_enabled()

Nathan Chancellor (1):
      ALSA: hda: tas2781-spi: Fix -Wsometimes-uninitialized in tasdevice_spi_switch_book()

Neil Armstrong (1):
      ASoC: dt-bindings: convert rt5682.txt to dt-schema

Nícolas F. R. A. Prado (2):
      ASoC: dt-bindings: mediatek,mt8188-mt6359: Add compatible for mt8390 evk
      ASoC: dt-bindings: mediatek,mt8188-mt6359: Allow DL_SRC/UL_SRC dai-links

Peter Ujfalusi (4):
      ASoC: SOF: Add support for pause supported tokens from topology
      ASoC: SOF: Intel: hda-pcm: Follow the pause_supported flag to drop PAUSE support
      ASoC: SOF: ipc4-topology: Use macro to set the EXT_PARAM_SIZE in widget setup
      ASoC: SOF: sof-priv: Remove unused SOF_DAI_STREAM() and SOF_FORMATS

Qunqin Zhao (1):
      ALSA: hda: Add AZX_DCAPS_NO_TCSEL flag for Loongson HDA devices

Richard Fitzgerald (21):
      ASoC: cs35l56: Split SoundWire DAI into separate playback and capture
      ASoC: sdw_utils: cs_amp: Assign non-overlapping TDM masks for each codec on a bus
      firmware: cs_dsp: Add mock regmap for KUnit testing
      firmware: cs_dsp: Add mock DSP memory map for KUnit testing
      firmware: cs_dsp: Add mock wmfw file generator for KUnit testing
      firmware: cs_dsp: Add mock bin file generator for KUnit testing
      firmware: cs_dsp: Add KUnit testing of bin file download
      firmware: cs_dsp: Add KUnit testing of wmfw download
      firmware: cs_dsp: Add KUnit testing of control parsing
      firmware: cs_dsp: Add KUnit testing of control cache
      firmware: cs_dsp: Add KUnit testing of control read/write
      firmware: cs_dsp: Add KUnit testing of bin error cases
      firmware: cs_dsp: Add KUnit testing of wmfw error cases
      firmware: cs_dsp: Add KUnit testing of client callbacks
      ASoC: Intel: tgl-match: Add entries for CS35L56 on CDB35L56-EIGHT-C
      ASoC: Intel: mtl-match: Add CDB35L56-EIGHT-C with aggregated speakers
      ASoC: Intel: mtl-match: Add CDB35L56-EIGHT-C 8x CS35L56 without CS42L43
      firmware: cs_dsp: Fix kerneldoc typos in cs_dsp_mock_bin.c
      firmware: cs_dsp: Avoid using a u32 as a __be32 in cs_dsp_mock_mem_maps.c
      firmware: cs_dsp: Fix endianness conversion in cs_dsp_mock_wmfw.c
      firmware: cs_dsp: Delete redundant assignments in cs_dsp_test_bin.c

Rob Herring (Arm) (2):
      ASoC: Use of_property_present() for non-boolean properties
      ASoC: simple-card: Drop unnecessary "dai-tdm-slot-width-map" property presence check

Sebastian Wiese-Wagner (1):
      ALSA: hda/realtek: Enable Mute LED on HP Laptop 14s-fq1xxx

Shengjiu Wang (13):
      ASoC: fsl_xcvr: Use regmap for PHY and PLL registers
      ASoC: fsl_xcvr: Add suspend and resume support
      ALSA: compress: Add output rate and output format support
      ASoC: fsl_asrc: define functions for memory to memory usage
      ASoC: fsl_easrc: define functions for memory to memory usage
      ASoC: fsl_asrc_m2m: Add memory to memory function
      ASoC: fsl_asrc: register m2m platform device
      ASoC: fsl_easrc: register m2m platform device
      ASoC: fsl_asrc_m2m: force cast for snd_pcm_format_t type
      ASoC: fsl_mqs: Add i.MX943 platform support
      ASoC: dt-bindings: fsl,mqs: Add compatible string for i.MX943 platform
      ASoC: fsl_micfil: Add i.MX943 platform support
      ASoC: dt-bindings: fsl,micfil: Add compatible string for i.MX943 platform

Simon Trimmer (6):
      ASoC: Intel: sof_sdw: Correct quirk for Lenovo Yoga Slim 7
      ASoC: Intel: sof_sdw: Add a dev_dbg message for the SOC_SDW_CODEC_MIC quirk
      ASoC: Intel: soc-acpi: arl: Correct naming of a cs35l56 address struct
      ASoC: Intel: soc-acpi: arl: Add match entries for new cs42l43 laptops
      ASoC: Intel: sof_sdw: Fix DMI match for Lenovo 83LC
      ASoC: Intel: sof_sdw: Fix DMI match for Lenovo 83JX, 83MC and 83NM

Stephen Gordon (2):
      ASoC: simple_card: Improve debugging messages
      ASoC: simple_card: Show if link is unidirectional

Stephen Rothwell (1):
      ALSA: usb: fcp: Fix hwdep read ops types

Takashi Iwai (34):
      ALSA: seq: Notify client and port info changes
      ALSA: seq: Skip notifications unless subscribed to announce port
      ALSA: hda: Always check capability at opening a hwdep
      ASoC: cs40l50: Use *-y for Makefile
      ASoC: mediatek: mt8365: Use *-y for Makefile
      ASoC: SDCA: Use *-y for Makefile
      ASoC: cs42l84: Use *-y for Makefile
      ASoC: wcd937x: Use *-y for Makefile
      ALSA: Align the syntax of iov_iter helpers with standard ones
      ALSA: seq: oss: Send fragmented SysEx messages immediately
      ALSA: seq: Make dependency on UMP clearer
      ALSA: trident: Simplify with str_on_off()
      ALSA: sonicvibes: Simplify with str_off_on()
      ALSA: hdspm: Simplify with str_on_off()
      ALSA: emu10k1: Simplify with str_on_off()
      ALSA: seq: oss: Simplify with str_enabled_disabled()
      ALSA: hda: Simplify with str_enable_disable()
      ALSA: firewire: Simplify with str_on_off()
      ALSA: hda/realtek: Simplify with str_yes_no()
      ALSA: rme9652: Simplify with str_yes_no()
      ALSA: rawmidi: Expose the tied device number in info ioctl
      ALSA: rawmidi: Show substream activity in info ioctl
      ALSA: rawmidi: Bump protocol version to 2.0.5
      ALSA: ump: Copy FB name string more safely
      ALSA: ump: Copy safe string name to rawmidi
      ALSA: ump: Update rawmidi name per EP name update
      ALSA: seq: Allow system notification in atomic
      ALSA: seq: Notify UMP EP and FB changes
      ALSA: rawmidi: Make tied_device=0 as default / unknown
      ALSA: hda: tas2781-spi: select CRC32 instead of CRC32_SARWATE
      ALSA: usb: fcp: Fix meter_levels type to __le32
      ALSA: usb: fcp: Fix incorrect resp->opcode retrieval
      ALSA: usb: fcp: Fix return code from poll ops
      ALSA: hda: tas2781-spi: Fix bogus error handling in tas2781_hda_spi_probe()

Tang Bin (2):
      ASoC: mediatek: mt8192-afe-pcm: Simplify probe() with local dev variable
      ASoC: tas2781: Fix redundant logical jump

Thorsten Blum (11):
      ALSA: sonicvibes: Use str_on_off() helper in snd_sonicvibes_proc_read()
      ALSA: hdsp: Use str_on_off() and str_yes_no() helper functions
      ALSA: ad1889: Use str_enabled_disabled() helper function
      ALSA: AC97: Use str_on_off() helper in snd_ac97_proc_read_main()
      ASoC: SOF: Intel: Use str_yes_no() helper in atom_dump()
      ASoC: madera: Use str_enabled_disabled() helper function
      ALSA: ens137x: Use str_on_off() helper in snd_ensoniq_proc_read()
      ALSA: emu10k1: Use str_yes_no() helper
      ALSA: sb: Use str_enabled_disabled() helper in info_read()
      ASoC: SOF: Intel: Use str_yes_no() to improve bdw_dump()
      ASoC: codecs: Use ARRAY_SIZE() to calculate PEB2466_TLV_SIZE

Uwe Kleine-König (1):
      ASoC: Drop explicit initialization of struct i2c_device_id::driver_data to 0

Vijendar Mukunda (2):
      ASoC: amd: ps: update mach params subsystem_rev variable
      ASoC: amd: ps: add ZSC control register programming sequence

Weidong Wang (2):
      ASoC: dt-bindings: Add schema for "awinic,aw88083"
      ASoC: codecs: Add aw88083 amplifier driver

Wolfram Sang (1):
      ASoC: cs42l43: don't include '<linux/find.h>' directly

Yongzhen Zhang (1):
      ALSA: hda/realtek: Add a comment for alc_fixup_inv_dmic()

Yu-Chun Lin (1):
      ASoC: amd: Add ACPI dependency to fix build error

Zhu Jun (3):
      ALSA: hda: Fix typo in hda_sysfs.h
      ALSA: lola: Fix typo in lola_clock.c
      ALSA: seq: oss: fix typo in seq_oss_init.c

liujing (2):
      ALSA: ac97: Modify the incorrect format specifier
      ALSA: cmipci: Modify the incorrect format specifier

---
 .../devicetree/bindings/sound/adi,ssm2518.yaml     |   20 +-
 .../bindings/sound/allwinner,sun4i-a10-codec.yaml  |   31 +
 .../devicetree/bindings/sound/awinic,aw88395.yaml  |    2 +
 .../devicetree/bindings/sound/everest,es71x4.yaml  |   10 +-
 .../devicetree/bindings/sound/everest,es7241.yaml  |   19 +-
 .../devicetree/bindings/sound/fsl,easrc.yaml       |   32 +-
 .../devicetree/bindings/sound/fsl,micfil.yaml      |    1 +
 .../devicetree/bindings/sound/fsl,mqs.yaml         |    2 +
 .../devicetree/bindings/sound/fsl,xcvr.yaml        |   34 +-
 .../bindings/sound/intel,keembay-i2s.yaml          |   32 +-
 .../bindings/sound/mediatek,mt8188-mt6359.yaml     |   16 +-
 .../bindings/sound/neofidelity,ntp8918.yaml        |   26 +-
 .../devicetree/bindings/sound/realtek,rt5682.yaml  |  156 +
 .../devicetree/bindings/sound/renesas,rsnd.yaml    |    6 -
 .../devicetree/bindings/sound/renesas,rz-ssi.yaml  |   19 +-
 Documentation/devicetree/bindings/sound/rt5682.txt |   98 -
 .../devicetree/bindings/sound/ti,pcm6240.yaml      |   32 +-
 .../devicetree/bindings/sound/ti,tas2562.yaml      |   30 +-
 .../devicetree/bindings/sound/ti,tas2770.yaml      |   34 +-
 .../devicetree/bindings/sound/ti,tas2781.yaml      |   36 +-
 .../devicetree/bindings/sound/ti,tas27xx.yaml      |   34 +-
 .../devicetree/bindings/sound/ti,tas57xx.yaml      |   34 +-
 Documentation/sound/designs/midi-2.0.rst           |   18 +
 MAINTAINERS                                        |   14 +-
 drivers/acpi/scan.c                                |    1 +
 drivers/firmware/cirrus/Kconfig                    |   20 +
 drivers/firmware/cirrus/Makefile                   |    2 +
 drivers/firmware/cirrus/test/Makefile              |   23 +
 drivers/firmware/cirrus/test/cs_dsp_mock_bin.c     |  199 ++
 .../firmware/cirrus/test/cs_dsp_mock_mem_maps.c    |  752 +++++
 drivers/firmware/cirrus/test/cs_dsp_mock_regmap.c  |  367 +++
 drivers/firmware/cirrus/test/cs_dsp_mock_utils.c   |   13 +
 drivers/firmware/cirrus/test/cs_dsp_mock_wmfw.c    |  473 +++
 drivers/firmware/cirrus/test/cs_dsp_test_bin.c     | 2556 +++++++++++++++
 .../firmware/cirrus/test/cs_dsp_test_bin_error.c   |  600 ++++
 .../firmware/cirrus/test/cs_dsp_test_callbacks.c   |  688 ++++
 .../cirrus/test/cs_dsp_test_control_cache.c        | 3282 ++++++++++++++++++++
 .../cirrus/test/cs_dsp_test_control_parse.c        | 1851 +++++++++++
 .../firmware/cirrus/test/cs_dsp_test_control_rw.c  | 2669 ++++++++++++++++
 drivers/firmware/cirrus/test/cs_dsp_test_wmfw.c    | 2211 +++++++++++++
 .../firmware/cirrus/test/cs_dsp_test_wmfw_error.c  | 1347 ++++++++
 drivers/firmware/cirrus/test/cs_dsp_tests.c        |   14 +
 drivers/platform/x86/serial-multi-instantiate.c    |   12 +
 include/dt-bindings/sound/qcom,wcd9335.h           |    1 -
 include/linux/firmware/cirrus/cs_dsp_test_utils.h  |  160 +
 include/sound/hdaudio_ext.h                        |   45 -
 include/sound/pcm.h                                |    7 +-
 include/sound/rawmidi.h                            |   11 +
 include/sound/sdca.h                               |    7 +-
 include/sound/sdca_function.h                      |    3 +
 include/sound/simple_card_utils.h                  |   15 +-
 include/sound/soc-dai.h                            |    3 +
 include/sound/soc.h                                |   12 +-
 include/sound/soc_sdw_utils.h                      |    2 +
 include/sound/ump.h                                |    1 +
 include/uapi/sound/asequencer.h                    |   12 +-
 include/uapi/sound/asound.h                        |    8 +-
 include/uapi/sound/compress_params.h               |   23 +-
 include/uapi/sound/fcp.h                           |  120 +
 include/uapi/sound/sof/tokens.h                    |    2 +
 include/uapi/sound/tlv.h                           |    2 +
 sound/core/memory.c                                |   41 +-
 sound/core/rawmidi.c                               |    3 +
 sound/core/seq/Kconfig                             |    4 +-
 sound/core/seq/oss/seq_oss_device.h                |    5 -
 sound/core/seq/oss/seq_oss_init.c                  |    8 +-
 sound/core/seq/oss/seq_oss_synth.c                 |   84 +-
 sound/core/seq/seq_clientmgr.c                     |   19 +-
 sound/core/seq/seq_system.c                        |   34 +-
 sound/core/seq/seq_system.h                        |   31 +-
 sound/core/seq/seq_ump_client.c                    |   42 +-
 sound/core/ump.c                                   |  112 +-
 sound/firewire/fireface/ff-protocol-former.c       |    4 +-
 sound/hda/hdac_component.c                         |    7 +-
 sound/hda/hdac_stream.c                            |   63 +-
 sound/isa/sb/sb16_csp.c                            |    5 +-
 sound/pci/ac97/ac97_codec.c                        |    2 +-
 sound/pci/ac97/ac97_proc.c                         |    8 +-
 sound/pci/ad1889.c                                 |    8 +-
 sound/pci/cmipci.c                                 |    2 +-
 sound/pci/ctxfi/ctdaio.c                           |   48 +-
 sound/pci/emu10k1/emuproc.c                        |   15 +-
 sound/pci/ens1370.c                                |    6 +-
 sound/pci/hda/Kconfig                              |   14 +
 sound/pci/hda/Makefile                             |    2 +
 sound/pci/hda/hda_hwdep.c                          |    2 -
 sound/pci/hda/hda_intel.c                          |    4 +-
 sound/pci/hda/hda_sysfs.c                          |    2 +-
 sound/pci/hda/ideapad_hotkey_led_helper.c          |   36 +
 sound/pci/hda/patch_conexant.c                     |   13 +-
 sound/pci/hda/patch_realtek.c                      |   42 +-
 sound/pci/hda/tas2781-spi.h                        |  158 +
 sound/pci/hda/tas2781_hda_spi.c                    | 1265 ++++++++
 sound/pci/hda/tas2781_spi_fwlib.c                  | 2006 ++++++++++++
 sound/pci/lola/lola_clock.c                        |    2 +-
 sound/pci/nm256/nm256.c                            |    8 +-
 sound/pci/rme32.c                                  |   13 +-
 sound/pci/rme96.c                                  |   13 +-
 sound/pci/rme9652/hdsp.c                           |   10 +-
 sound/pci/rme9652/hdspm.c                          |   15 +-
 sound/pci/rme9652/rme9652.c                        |    5 +-
 sound/pci/sonicvibes.c                             |    8 +-
 sound/pci/trident/trident_main.c                   |    4 +-
 sound/soc/amd/Kconfig                              |    2 +-
 sound/soc/amd/ps/pci-ps.c                          |   16 +-
 sound/soc/codecs/Kconfig                           |    2 +-
 sound/soc/codecs/Makefile                          |    8 +-
 sound/soc/codecs/ad193x-i2c.c                      |    3 +-
 sound/soc/codecs/adau1761-i2c.c                    |    5 +-
 sound/soc/codecs/adau1781-i2c.c                    |    5 +-
 sound/soc/codecs/adau1977-i2c.c                    |    5 +-
 sound/soc/codecs/alc5623.c                         |   10 +-
 sound/soc/codecs/alc5632.c                         |    6 +-
 sound/soc/codecs/aw88081.c                         |  333 +-
 sound/soc/codecs/aw88081.h                         |   43 +
 sound/soc/codecs/cs35l56.c                         |    8 +-
 sound/soc/codecs/cs42l43.c                         |    2 +-
 sound/soc/codecs/cs42l51-i2c.c                     |    6 +-
 sound/soc/codecs/cs42l84.c                         |    2 +-
 sound/soc/codecs/es8323.c                          |    2 +-
 sound/soc/codecs/madera.c                          |    7 +-
 sound/soc/codecs/max98088.c                        |    4 +-
 sound/soc/codecs/max98090.c                        |   18 +-
 sound/soc/codecs/max98095.c                        |    4 +-
 sound/soc/codecs/nau8824.c                         |    8 +-
 sound/soc/codecs/ntp8835.c                         |    2 +-
 sound/soc/codecs/ntp8918.c                         |    2 +-
 sound/soc/codecs/pcm186x-i2c.c                     |    3 +-
 sound/soc/codecs/pcm6240.c                         |    3 +-
 sound/soc/codecs/peb2466.c                         |    3 +-
 sound/soc/codecs/rt5682-i2c.c                      |    6 +
 sound/soc/codecs/rt5682.c                          |   12 +-
 sound/soc/codecs/rt5682.h                          |    2 +
 sound/soc/codecs/rt715-sdw.c                       |   41 -
 sound/soc/codecs/rt715.h                           |    3 -
 sound/soc/codecs/sma1307.c                         |    4 +-
 sound/soc/codecs/ssm2602-i2c.c                     |    5 +-
 sound/soc/codecs/tas2562.c                         |    4 +-
 sound/soc/codecs/tas2781-i2c.c                     |   71 +-
 sound/soc/codecs/tas5720.c                         |   10 +-
 sound/soc/codecs/tlv320adc3xxx.c                   |    4 +-
 sound/soc/codecs/tlv320aic31xx.c                   |    6 +-
 sound/soc/codecs/tlv320aic3x-i2c.c                 |    3 +-
 sound/soc/codecs/tpa6130a2.c                       |    4 +-
 sound/soc/codecs/uda1342.c                         |    2 +-
 sound/soc/codecs/wcd9335.c                         |    2 +
 sound/soc/codecs/wm8904.c                          |   13 +-
 sound/soc/codecs/wm8985.c                          |    4 +-
 sound/soc/fsl/Kconfig                              |    2 +
 sound/soc/fsl/Makefile                             |    2 +-
 sound/soc/fsl/fsl-asoc-card.c                      |    2 +-
 sound/soc/fsl/fsl_asrc.c                           |  179 +-
 sound/soc/fsl/fsl_asrc.h                           |    2 +
 sound/soc/fsl/fsl_asrc_common.h                    |   70 +
 sound/soc/fsl/fsl_asrc_m2m.c                       |  727 +++++
 sound/soc/fsl/fsl_easrc.c                          |  261 +-
 sound/soc/fsl/fsl_easrc.h                          |    4 +
 sound/soc/fsl/fsl_micfil.c                         |  131 +-
 sound/soc/fsl/fsl_micfil.h                         |    2 +-
 sound/soc/fsl/fsl_mqs.c                            |   28 +
 sound/soc/fsl/fsl_sai.c                            |    7 +-
 sound/soc/fsl/fsl_sai.h                            |    3 +
 sound/soc/fsl/fsl_utils.c                          |   45 +
 sound/soc/fsl/fsl_utils.h                          |    5 +
 sound/soc/fsl/fsl_xcvr.c                           |  404 ++-
 sound/soc/fsl/fsl_xcvr.h                           |   13 +
 sound/soc/fsl/imx-audmux.c                         |    2 +-
 sound/soc/fsl/imx-card.c                           |    2 +-
 sound/soc/fsl/imx-rpmsg.c                          |    2 +-
 sound/soc/generic/audio-graph-card.c               |   48 +-
 sound/soc/generic/audio-graph-card2.c              |  262 +-
 sound/soc/generic/simple-card-utils.c              |   89 +-
 sound/soc/generic/simple-card.c                    |   58 +-
 sound/soc/intel/avs/apl.c                          |    3 +-
 sound/soc/intel/avs/cnl.c                          |    1 +
 sound/soc/intel/avs/core.c                         |   24 +-
 sound/soc/intel/avs/debugfs.c                      |    1 +
 sound/soc/intel/avs/ipc.c                          |   25 +-
 sound/soc/intel/avs/loader.c                       |   36 +-
 sound/soc/intel/avs/messages.c                     |   22 +-
 sound/soc/intel/avs/messages.h                     |    3 +-
 sound/soc/intel/avs/pcm.c                          |    5 +-
 sound/soc/intel/avs/registers.h                    |   47 +-
 sound/soc/intel/avs/skl.c                          |    1 +
 sound/soc/intel/avs/topology.c                     |    4 +-
 sound/soc/intel/avs/trace.h                        |   38 +-
 sound/soc/intel/boards/skl_hda_dsp_generic.c       |    2 -
 sound/soc/intel/boards/sof_sdw.c                   |   56 +-
 sound/soc/intel/common/soc-acpi-intel-arl-match.c  |   45 +-
 sound/soc/intel/common/soc-acpi-intel-lnl-match.c  |   70 +
 sound/soc/intel/common/soc-acpi-intel-mtl-match.c  |  289 +-
 sound/soc/intel/common/soc-acpi-intel-ptl-match.c  |  148 +
 sound/soc/intel/common/soc-acpi-intel-tgl-match.c  |  194 ++
 sound/soc/intel/keembay/kmb_platform.c             |    2 +-
 sound/soc/mediatek/common/mtk-soundcard-driver.c   |    4 +-
 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c         |   19 +-
 sound/soc/mediatek/mt8365/Makefile                 |    2 +-
 sound/soc/mediatek/mt8365/mt8365-mt6357.c          |   11 +-
 sound/soc/qcom/common.c                            |    6 +-
 sound/soc/qcom/lpass-platform.c                    |    6 +-
 sound/soc/qcom/sc7180.c                            |    2 +-
 sound/soc/qcom/sdm845.c                            |    5 +-
 sound/soc/renesas/rz-ssi.c                         |  228 +-
 sound/soc/rockchip/rockchip_i2s_tdm.c              |   28 -
 sound/soc/sdca/Makefile                            |    2 +-
 sound/soc/sdca/sdca_device.c                       |    2 +
 sound/soc/sdca/sdca_functions.c                    |  154 +-
 sound/soc/sdw_utils/soc_sdw_cs_amp.c               |   46 +
 sound/soc/sdw_utils/soc_sdw_utils.c                |   13 +-
 sound/soc/soc-card.c                               |    4 +-
 sound/soc/soc-core.c                               |   58 +-
 sound/soc/soc-dai.c                                |   27 +-
 sound/soc/soc-dapm.c                               |   14 +-
 sound/soc/soc-pcm.c                                |   32 +-
 sound/soc/soc-topology.c                           |   10 +-
 sound/soc/sof/intel/atom.c                         |   16 +-
 sound/soc/sof/intel/bdw.c                          |   16 +-
 sound/soc/sof/intel/hda-dai.c                      |   12 +
 sound/soc/sof/intel/hda-pcm.c                      |   15 +
 sound/soc/sof/intel/hda.c                          |    5 +
 sound/soc/sof/ipc4-topology.c                      |    2 +-
 sound/soc/sof/sof-audio.h                          |    1 +
 sound/soc/sof/sof-priv.h                           |    8 -
 sound/soc/sof/topology.c                           |    4 +
 sound/soc/sunxi/sun4i-codec.c                      |  409 ++-
 sound/soc/sunxi/sun4i-spdif.c                      |   24 +-
 sound/soc/xilinx/xlnx_spdif.c                      |   38 +-
 sound/usb/Makefile                                 |    1 +
 sound/usb/fcp.c                                    | 1134 +++++++
 sound/usb/fcp.h                                    |    7 +
 sound/usb/mixer_quirks.c                           |    7 +
 sound/usb/mixer_scarlett2.c                        |    8 +
 sound/usb/quirks.c                                 |    2 +
 233 files changed, 27086 insertions(+), 1793 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/realtek,rt5682.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/rt5682.txt
 create mode 100644 drivers/firmware/cirrus/test/Makefile
 create mode 100644 drivers/firmware/cirrus/test/cs_dsp_mock_bin.c
 create mode 100644 drivers/firmware/cirrus/test/cs_dsp_mock_mem_maps.c
 create mode 100644 drivers/firmware/cirrus/test/cs_dsp_mock_regmap.c
 create mode 100644 drivers/firmware/cirrus/test/cs_dsp_mock_utils.c
 create mode 100644 drivers/firmware/cirrus/test/cs_dsp_mock_wmfw.c
 create mode 100644 drivers/firmware/cirrus/test/cs_dsp_test_bin.c
 create mode 100644 drivers/firmware/cirrus/test/cs_dsp_test_bin_error.c
 create mode 100644 drivers/firmware/cirrus/test/cs_dsp_test_callbacks.c
 create mode 100644 drivers/firmware/cirrus/test/cs_dsp_test_control_cache.c
 create mode 100644 drivers/firmware/cirrus/test/cs_dsp_test_control_parse.c
 create mode 100644 drivers/firmware/cirrus/test/cs_dsp_test_control_rw.c
 create mode 100644 drivers/firmware/cirrus/test/cs_dsp_test_wmfw.c
 create mode 100644 drivers/firmware/cirrus/test/cs_dsp_test_wmfw_error.c
 create mode 100644 drivers/firmware/cirrus/test/cs_dsp_tests.c
 create mode 100644 include/linux/firmware/cirrus/cs_dsp_test_utils.h
 create mode 100644 include/uapi/sound/fcp.h
 create mode 100644 sound/pci/hda/ideapad_hotkey_led_helper.c
 create mode 100644 sound/pci/hda/tas2781-spi.h
 create mode 100644 sound/pci/hda/tas2781_hda_spi.c
 create mode 100644 sound/pci/hda/tas2781_spi_fwlib.c
 create mode 100644 sound/soc/fsl/fsl_asrc_m2m.c
 create mode 100644 sound/usb/fcp.c
 create mode 100644 sound/usb/fcp.h

