Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5668C12CDBE
	for <linux-sound@vger.kernel.org>; Wed, 15 Apr 2026 12:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776255943; cv=none; b=cOufMky9qWZidIHFNTxQ3EKPXenGi91AnjFgImCFKNYIQebbhK4y7UlqpvuDFuxEIHUiery+iroC7WGYXOH1ztvuFEKwoyMNOCaskVhiL9eG9NDWfAhjqixtxUkkkrsepXV1GqXdEmEFRy9/oVXrA1fxV7SWY8eCVFwJXHo93ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776255943; c=relaxed/simple;
	bh=FcX+4n26ZSjteg3lgYCm/1JNb92JIyJv0G44eDequ/s=;
	h=Date:Message-ID:From:To:Cc:Subject:MIME-Version:Content-Type; b=ie08X24nyQKa0GoKjlRy2T+1t0vyrX4gjIytQtHRsk2L4NLDUdETHqipVJKF9X0LkjBUXVbUreZbA8AgkI5Abq8DslCclThqMSrSqUkhJCyIunZy+th/TpTfaZzUgC0whAbJL1rCKJ5pRvsxvqtvHtFGXsTLMnHdVpw82lUklHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ibwwX8KB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=k9XXBWH0; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ibwwX8KB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=k9XXBWH0; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ibwwX8KB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="k9XXBWH0";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ibwwX8KB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="k9XXBWH0"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A78C95BD31;
	Wed, 15 Apr 2026 12:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776255938; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=m9PzARhCWnNtDQFm1/imhERd7sZEoROf65TYp5sn4zc=;
	b=ibwwX8KBWi8dqHCqGwhonYjIHWeF60jOS/GsD6s/rYW3auhI6sD30faCbVpW0ZnCx9kWsq
	jY+k+I3vi8Gwhy4D4vPErp9SD2Az4QeaQ2tSwR8Zgx3QFqvmpPFDaGPClareBR4j6QKg/E
	vzLbbsa/WHKyAwskAu43FXNbGAD6tpU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776255938;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=m9PzARhCWnNtDQFm1/imhERd7sZEoROf65TYp5sn4zc=;
	b=k9XXBWH0Ci4L4b5p6siMzxuujx4SQ9ToRN7GoeeAxK0ZD51Ifr3pqoTVfK4r3MGqHFC7rP
	6r1KQeZTZIAYSFAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776255938; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=m9PzARhCWnNtDQFm1/imhERd7sZEoROf65TYp5sn4zc=;
	b=ibwwX8KBWi8dqHCqGwhonYjIHWeF60jOS/GsD6s/rYW3auhI6sD30faCbVpW0ZnCx9kWsq
	jY+k+I3vi8Gwhy4D4vPErp9SD2Az4QeaQ2tSwR8Zgx3QFqvmpPFDaGPClareBR4j6QKg/E
	vzLbbsa/WHKyAwskAu43FXNbGAD6tpU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776255938;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=m9PzARhCWnNtDQFm1/imhERd7sZEoROf65TYp5sn4zc=;
	b=k9XXBWH0Ci4L4b5p6siMzxuujx4SQ9ToRN7GoeeAxK0ZD51Ifr3pqoTVfK4r3MGqHFC7rP
	6r1KQeZTZIAYSFAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 89E3B4B9E2;
	Wed, 15 Apr 2026 12:25:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 7rsPIcKD32n9JQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 15 Apr 2026 12:25:38 +0000
Date: Wed, 15 Apr 2026 14:25:33 +0200
Message-ID: <87o6jkfm0y.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] sound updates for 7.1-rc1
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

Linus,

please pull sound updates for v7.1-rc1 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.1-rc1

The topmost commit is e0da8a8cac74f4b9f577979d131f0d2b88a84487

----------------------------------------------------------------

sound updates for 7.1-rc1

Nothing too thrilling here, but we see lots of driver updates and
bug fixes, including quirk additions and refactoring works, while
there have been little changes in the core functionality.
Here are some highlights:

* Core:
- Add validation for the control API put callback
- Fixes in compress-offload API timestamp handling
- Continued ASoC core API cleanups

* ASoC:
- Add support for bus keepers (for Apple devices in future)
- Enhancements to the SDCA support, including retaskable jacks
- Test improvements for Cirrus Logic drivers
- Lots of fixes for the NXP, nVidia and Qualcomm
- Support for AMD RPL DMIC, Cirrus Logic CS42L43 and CS47L47, nVidia
  machines with CPCAP and WM8962

* USB-audio:
- Quirks for Huawei Headset, Focusrite Novation, MV-Silicon,
  Studio 1824, Arturia AF16Rig, Hotone Audio, Feaulle Rainbow,
  PreSonus AudioBox, Moondrop Ju Jiu, Scarlett 18i20, etc
- Extended mixer volume quirk handling
- UAF and other fixes for us144mkii, 6fire and caiaq drivers

* HD-audio:
- Add quirks or fixes for Acer, Lenovo, HP, ASUS machines
- Fixes & cleanups of GPIO helper code

* Misc:
- Add suspend/resume support for multiple legacy ISA and Apple
  drivers
- Further regression fixes for ctxfi driver

----------------------------------------------------------------

Abhinav Mahadevan (1):
      ALSA: usb-audio: Add quirk for PreSonus AudioBox USB

Alexey Charkov (1):
      ASoC: rockchip: rockchip_sai: Set slot width for non-TDM mode

Anushka Badhe (1):
      ASoC: dt-bindings: rockchip: convert rk3399-gru-sound to DT Schema

Aravind Anilraj (4):
      ASoC: Intel: bytcr_rt5640: Fix MCLK leak on platform_clock_control error
      ASoC: Intel: bytcr_rt5651: Fix MCLK leak on platform_clock_control error
      ASoC: Intel: cht_bsw_rt5672: Fix MCLK leak on platform_clock_control error
      ASoC: Intel: Standardize MCLK error logs across RT boards

Arnd Bergmann (1):
      ASoC: wm_adsp: select CONFIG_SND_SOC_WM_ADSP from all users

Bard Liao (5):
      ASoC: add snd_soc_lookup_component_by_name helper
      ASoC: soc_sdw_utils: partial match the codec name
      ASoC: soc_sdw_utils: remove index from sdca codec name
      ASoC: soc_sdw_utils: remove cs42l45 SmartMic codec name index
      ASoC: soc_sdw_utils: remove codec name index of snd_soc_sdca codecs

Ben Copeland (1):
      selftests: ALSA: Skip utimer test when CONFIG_SND_UTIMER is not enabled

Ben Dooks (3):
      ASoC: SOF: sof-audio: pcm_id is __le32
      ASoC: soc-topology: fix __le32 conversion in printed values
      ASoC: SOF: sof-audio: pcm_id is __le32

Berk Cem Goksel (2):
      ALSA: 6fire: fix use-after-free on disconnect
      ALSA: caiaq: take a reference on the USB device in create_card()

Cen Zhang (1):
      ALSA: pcm: oss: use proper stream lock for runtime->state access

Cezary Rojewski (6):
      ALSA: control: Verify put() result when in debug mode
      ASoC: Intel: catpt: Synchronize stream access
      ASoC: Intel: catpt: New volume and mute control operations
      ASoC: Intel: catpt: Simplify procedure of applying user settings
      ASoC: Intel: catpt: Do not wake DSP just for volume setup
      ASoC: Intel: catpt: Migrate to the new control operations

Chaitanya Sabnis (1):
      ASoC: dt-bindings: hisilicon: Convert hi6210 I2S to dt-schema

Chancel Liu (1):
      ASoC: imx-rpmsg: Add DSD format support with dynamic DAI format switching

Charles Keepax (13):
      ASoC: SDCA: Add default value for mipi-sdca-function-reset-max-delay
      ASoC: SDCA: Update counting of SU/GE DAPM routes
      ASoC: SDCA: Improve mapping of Q7.8 SDCA volumes
      ASoC: SDCA: Pull the Q7.8 volume helpers out of soc-ops
      ASoC: SDCA: Add support for the Cirrus Logic cs42l49
      ASoC: sdw_utils: Add codec_info for cs42l49
      ASoC: dapm: Add a named controls variant of a mux widget
      ASoC: SDCA: Use named control mux for GE/SU controls
      ASoC: wm_adsp: Fix crash in kunit tests on arm64
      ASoC: SDCA: Add RJ support to class driver
      ASoC: SDCA: Correct kernel doc for sdca_irq_cleanup()
      ASoC: SDCA: Tidy up irq_enable_flags()/sdca_irq_disable()
      ASoC: SDCA: Update text of FIXME

Chen-Yu Tsai (1):
      ASoC: sun4i-spdif: Make reset control non-optional and check for all errors

Christophe JAILLET (1):
      ALSA: aoa: Constify struct codec_connection

Christophe Leroy (CS GROUP) (1):
      ASoC: codecs: peb2466: Change the +/- 6dB switch to a volume

Cryolitia PukNgae (1):
      ALSA: usb-audio: apply quirk for MOONDROP JU Jiu

Cássio Gabriel (33):
      ALSA: usb-audio: map UAC3 front wide channels in convert_chmap_v3()
      ALSA: timer: keep a list of open masters for slave lookup
      ALSA: usb-audio: validate full match when resolving quirk aliases
      ALSA: pcm: Use pcm_lib_apply_appl_ptr() in x32 sync_ptr
      ALSA: usb-audio: rotate standard MIDI output port scan
      ALSA: seq_oss: return full count for successful SEQ_FULLSIZE writes
      ALSA: pcm: Serialize snd_pcm_suspend_all() with open_mutex
      ALSA: core: Validate compress device numbers without dynamic minors
      ALSA: hda/proc: show GPI and GPO state in codec proc output
      ALSA: hda: intel: Drop obsolete probe-work unlock workaround
      ALSA: aoa: i2sbus: fix OF node lifetime handling
      ASoC: generic: keep fallback dai_name stable across rebind
      ALSA: aoa: i2sbus: clear stale prepared state
      ALSA: es1688: add ISA suspend and resume callbacks
      ALSA: hda: Notify IEC958 Default PCM switch state changes
      ALSA: aoa: onyx: Update IEC958 sample-rate status for PCM playback
      ALSA: gus: add shared GF1 suspend and resume helpers
      ALSA: gusclassic: add ISA suspend and resume callbacks
      ALSA: gusextreme: add ISA suspend and resume callbacks
      ALSA: gusmax: add ISA suspend and resume callbacks
      ASoC: SOF: compress: return the configured codec from get_params
      ALSA: tea6330t: move snd_tea6330t_detect() EXPORT_SYMBOL
      ALSA: tea6330t: add mixer state restore helper
      ALSA: interwave: add ISA and PnP suspend and resume callbacks
      ALSA: i2c: ak4xxx-adda: implement AK4529 reset handling
      ALSA: i2c: ak4xxx-adda: seed AK5365 cache with reset defaults
      ALSA: msnd: prepare system sleep support
      ALSA: msnd: add ISA and PnP system sleep callbacks
      ALSA: sc6000: Keep the programmed board state in card-private data
      ALSA: sc6000: Restore board setup across suspend
      ALSA: interwave: guard PM-only restore helpers with CONFIG_PM
      ALSA: sscape: Cache per-card resources for board reinitialization
      ALSA: sscape: Add suspend and resume support

Cédric Bellegarde (1):
      ASoC: codecs: wcd-clsh: Always update buck/flyback on transitions on transitions

DanielePioGenovese (1):
      ASoC: amd: yc: Add MSI Thin A15 B7VF to quirk table

Denis Rastyogin (1):
      ASoC: rsnd: Fix potential out-of-bounds access of component_dais[]

Derek Fang (2):
      ASoC: SOF: Intel: Add a is_amp flag to fix the wrong name prefix
      ASoC: sdw_utils: add rt1320 and rt1321 dmic dai in codec_info_list

Eric Naim (1):
      ALSA: hda/realtek: Add quirk for Legion S7 15IMH

Ethan Tidmore (1):
      ASoC: SOF: Intel: hda: Place check before dereference

Fabio Estevam (1):
      ASoC: dt-bindings: rockchip: Convert rockchip-max98090.txt to yaml

Faye Nichols (1):
      ALSA: hda/realtek: Add quirk for Acer PT316-51S headset mic

Frederic Popp (1):
      ALSA: usb-audio: add Studio 1824 support

Geoffrey D. Bennett (1):
      ALSA: usb-audio: Exclude Scarlett 18i20 1st Gen from SKIP_IFACE_SETUP

Greg Kroah-Hartman (2):
      ALSA: usx2y: us144mkii: fix NULL deref on missing interface 0
      ALSA: fireworks: bound device-supplied status before string array lookup

Haoxiang Li (1):
      ASoC: mxs-sgtl5000: disable MCLK on error paths of mxs_sgtl5000_probe()

Harin Lee (5):
      ALSA: ctxfi: Rename SPDIFI1 to SPDIFI_BAY
      ALSA: ctxfi: Use correct DAIO type for da_desc
      ALSA: ctxfi: Precompute SRC allocation loop bound
      ALSA: ctxfi: Limit PTP to a single page
      ALSA: ctxfi: Add fallback to default RSR for S/PDIF

Ihor Uzlov (1):
      ASoC: amd: yc: Add MSI Vector A16 HX A8WHG to quirk table

Jack Yu (2):
      ASoC: rt1320-sdw: kcontrol for brown-out feature update
      ASoC: rt1320-sdw: Add an approach to get new hardware advance gain

James Calligeros (8):
      ASoC: dt-bindings: convert tdm-slot to YAML
      ASoC: dt-bindings: update tdm-slot.txt references to tdm-slot.yaml
      ASoC: dt-bindings: add TDM slot idle mode properties
      ASoC: soc-dai: define possible idle TDM slot modes
      ASoC: soc-dai: add common operation to set TDM idle mode
      ASoC: tas2764: expose SDOUT bus keeper via set_tdm_idle operation
      ASoC: tas2770: expose SDOUT bus keeper via set_tdm_idle
      ASoC: codecs: cs42l84: set up PLL for more sample rates

Jihed Chaibi (5):
      ASoC: fsl: mpc5200_dma: Convert to devm_ioremap()
      ASoC: samsung: spdif: Convert to devm_ioremap_resource()
      ASoC: jz4725b: Convert to devm_clk_get_enabled()
      ASoC: jz4760: Convert to devm_clk_get_enabled()
      ASoC: jz4770: Convert to devm_clk_get_enabled()

Jonas Schwöbel (1):
      ASoC: tegra: Support WM8962 by machine driver

Joseph Salisbury (1):
      ASoC: fsl_easrc: fix comment typo

Josh Poimboeuf (1):
      ASoC: codecs: wcd9335: Remove potential undefined behavior in wcd9335_slimbus_irq()

Kailang Yang (1):
      ALSA: hda/realtek - fixed speaker no sound update

Kexin Sun (2):
      ASoC: generic: update outdated comment for removed soc_bind_dai_link()
      ASoC: update outdated comments for removed snd_soc_new_pcms()

Khushal Chitturi (1):
      ASoC: dt-bindings: mediatek,mt8173-rt5650-rt5514: convert to DT schema

Krzysztof Kozlowski (3):
      ASoC: dt-bindings: ti,tas2770: Switch to undeprecated reset-gpios
      ASoC: dt-bindings: mediatek,mt2701-wm8960: Correctly use additionalProperties
      ASoC: dt-bindings: mediatek: Adjust style of blocks placement

Kuninori Morimoto (42):
      ASoC: soc-compress: use function to clear symmetric params
      ASoC: remove snd_soc_pcm_subclass
      ASoC: soc-core: Use guard()/scoped_guard() for mutex lock
      ASoC: soc-component: re-add pcm_new()/pcm_free()
      ASoC: amd: name back to pcm_new()/pcm_free()
      ASoC: apple: name back to pcm_new()/pcm_free()
      ASoC: atmel: name back to pcm_new()/pcm_free()
      ASoC: au1x: name back to pcm_new()/pcm_free()
      ASoC: bcm: name back to pcm_new()/pcm_free()
      ASoC: codecs: cros_ec_codec: name back to pcm_new()/pcm_free()
      ASoC: codecs: rt5xxx-spi: name back to pcm_new()/pcm_free()
      ASoC: dwc: name back to pcm_new()/pcm_free()
      ASoC: fsl: name back to pcm_new()/pcm_free()
      ASoC: generic: name back to pcm_new()/pcm_free()
      ASoC: google: name back to pcm_new()/pcm_free()
      ASoC: intel: name back to pcm_new()/pcm_free()
      ASoC: kirkwood: name back to pcm_new()/pcm_free()
      ASoC: loongson: name back to pcm_new()/pcm_free()
      ASoC: mediatek: name back to pcm_new()/pcm_free()
      ASoC: pxa: name back to pcm_new()/pcm_free()
      ASoC: qcom: name back to pcm_new()/pcm_free()
      ASoC: renesas: name back to pcm_new()/pcm_free()
      ASoC: samsung: name back to pcm_new()/pcm_free()
      ASoC: soc-generic-dmaengine-pcm: name back to pcm_new()/pcm_free()
      ASoC: sof: name back to pcm_new()/pcm_free()
      ASoC: sprd: name back to pcm_new()/pcm_free()
      ASoC: stm: name back to pcm_new()/pcm_free()
      ASoC: tegra: name back to pcm_new()/pcm_free()
      ASoC: uniphier: name back to pcm_new()/pcm_free()
      ASoC: xilinx: name back to pcm_new()/pcm_free()
      ASoC: xtensa: name back to pcm_new()/pcm_free()
      ASoC: soc-component: remove pcm_construct()/pcm_destruct()
      ASoC: soc-component: add snd_soc_component_regmap_val_bytes()
      ASoC: tegra: use snd_soc_component_regmap_val_bytes()
      ASoC: soc-ops: use snd_soc_component_regmap_val_bytes()
      ASoC: soc-component: remove component->val_bytes
      ASoC: soc-core: remove unused dobj_list
      ASoC: soc-core: remove duplicate snd_soc_flush_all_delayed_work()
      ASoC: soc.h: remove snd_soc_of_parse_audio_prefix()
      ASoC: ak5558: remove unused snd_soc_component
      ASoC: soc.h: remove unused card->pmdown_time
      ASoC: amd: acp-da7219-max98357a: tidyup acp_soc_is_rltk_max()

Lei Huang (2):
      ALSA: hda/realtek: fix bad indentation for alc269
      ALSA: hda/realtek: fix code style (ERROR: else should follow close brace '}')

Leonard Lausen (1):
      ALSA: hda: cs35l41: Fix boost type for HP Dragonfly 13.5 inch G4

Lianqin Hu (1):
      ALSA: usb-audio: Add iface reset and delay quirk for HUAWEI USB-C HEADSET

Linus Walleij (10):
      ASoC: amd: acp-da7291-max98357a: Drop unused include
      ASoC: amd: acp-es8336: Drop unused include
      ASoC: amd: acp-rt5645: Drop unused include
      ASoC: amd: acp3x-es83x: Drop unused include
      ASoC: amd: acp3x-rt5682-max9836: Drop unused include
      ASoC: codec: arizona: Convert to use GPIO descriptors
      ASoC: rt1318: Drop unused include
      ASoC: nau8315: Drop unused include
      ASoC: ts3a227e: Drop unused include
      ASoC: uda1380: Modernize the driver

Luca Weiss (2):
      ASoC: dt-bindings: awinic,aw88395: Document firmware-name property
      ASoC: codecs: aw88261: Add firmware-name support

Mac Chiang (1):
      ASoC: Intel: soc-acpi-intel-ptl-match: drop rt722 monolithic match tables

Maciej Strozek (5):
      ASoC: sdw_utils: Add CS42L43B codec info
      ASoC: dt-bindings: cirrus,cs42l43: Add CS42L43B variant
      mfd: cs42l43: Add support for the B variant
      ASoC: cs42l43: Add support for the B variant
      ASoC: intel: sof_sdw: Prepare for configuration without a jack

Marek Vasut (1):
      ASoC: tas2552: Allow audio enable GPIO to sleep

Mark Brown (3):
      ALSA: compress: Refuse to update timestamps for unconfigured streams
      ALSA: compress: Pay attention if drivers error out retrieving pointers
      ASoC: SOF: Don't allow pointer operations on unconfigured streams

Mingyou Chen (3):
      ASoC: Add DMIC support for the AMD RPL platform
      ASoC: Drop RPL driver
      ASoC: Add quirk for Lecoo Bellator N176

Mohammad Rafi Shaik (1):
      ASoC: qcom: q6dsp: Add Senary MI2S audio interface support

Niranjan H Y (2):
      ASoC: sdw_utils: add vendor_id to asoc_sdw_codec_info
      ASoC: SDCA: Export Q7.8 volume control helpers

Panagiotis Petrakopoulos (1):
      ALSA: scarlett2: Add missing sentinel initializer field

Pei Xiao (1):
      ASoC: rt5575: Remove redundant assignment to .owner

Pengpeng Hou (2):
      ASoC: da7219: scope AAD suspend and resume helpers to CONFIG_PM
      ALSA: asihpi: detect truncated control names

Phil Willoughby (2):
      ALSA: usb-audio: Add quirks for Arturia AF16Rig
      ALSA: usb-audio: tidy up the AF16Rig quirks

Piyush Patle (1):
      ASoC: dt-bindings: adi,ssm2305: Convert to DT schema

Qinghua Zhao (1):
      ASoC: tegra: Fix spelling error 'recieved' -> 'received'

Ravi Hothi (1):
      ASoC: qcom: audioreach: explicitly enable speaker protection modules

Ricardo Rivera-Matos (1):
      ASoC: cs35l45: Hibernate wm_adsp on runtime suspend

Richard Fitzgerald (27):
      ASoC: soc_sdw_utils: Add device info for CS47L47
      ASoC: SDCA: Add CS47L47 to class driver
      ASoC: cs-amp-lib-test: Stop including platform_device.h
      firmware: cs_dsp: Mark KUnit test suites KUNIT_SPEED_SLOW
      ASoC: cs35l56-test: Add test cases without onchip pulls defined
      ASoC: cs35l56: KUnit tests for setting dsp.system_name
      ASoC: cs35l56: Some KUnit testing of cs35l56_get_speaker_id()
      ASoC: cs35l56: KUnit tests for reading speaker ID from host GPIOs
      ASoC: cs35l56-test: Remove pointless duplicate loop counters
      ASoC: cs35l56: Put OTP register defines in correct address order
      ASoC: wm_adsp: Make wm_adsp_fw_text[] const
      ASoC: wm_adsp: Remove unused argument to wm_adsp_release_firmware_files()
      ASoC: wm_adsp: Add KUnit redirection stubs for firmware file search
      ASoC: wm_adsp: Export function for KUnit test to get firmware filenames
      ASoC: wm_adsp: Add kunit test for firmware file search
      ASoC: wm_adsp: Remove duplicated code to find firmware file
      ASoC: wm_adsp: Use consistent error checks in wm_adsp_request_firmware_files()
      ASoC: wm_adsp: Convert '/' to '-' when normalizing firmware filenames
      ASoC: wm_adsp: Add KUnit test cases for '/' in firmware filenames
      ASoC: wm_adsp: Use a struct to pass around firmware struct and filename
      ASoC: wm_adsp: Combine some similar code in firmware file search
      firmware: cs_dsp: Simplify suppressing log messages during KUnit testing
      ASoC: cs35l56: Support clock stop mode 1 if enabled in ACPI
      ASoC: soc.h: Add SOC_SINGLE_BOOL_EXT_ACC() to allow setting access flags
      ASoC: cs35l56: Allow factory calibration through ALSA controls
      ASoC: wm_adsp_fw_find_test: Fix missing NULL terminator on file name list
      ASoC: SDCA: Fix cleanup inversion in class driver

Rong Zhang (13):
      Revert "ALSA: usb: Increase volume range that triggers a warning"
      ALSA: usb-audio: Add helper function for volume range checks
      ALSA: usb-audio: Improve volume range checks
      ALSA: usb-audio: Support string-descriptor-based quirk table entry
      ALSA: usb-audio: Deconflict VID between Focusrite Novation & MV-SILICON
      ALSA: usb-audio: Add QUIRK_FLAG_MIXER_{PLAYBACK,CAPTURE}_LINEAR_VOL
      ALSA: usb-audio: Add linear volume quirk for Hotone Audio Pulze Mini
      ALSA: usb-audio: Apply linear volume quirk on MV-SILICON devices
      ALSA: usb-audio: Refine string-descriptor-based quirk matching
      ALSA: usb-audio: Add quirk flags for Feaulle Rainbow
      ALSA: usb-audio: Add error checks against get_min_max*()
      ALSA: usb-audio: Move volume control resolution check into a function
      ALSA: usb-audio: Do not expose sticky mixers

Rosen Penev (2):
      ASoC: SOF: topology: use kzalloc_flex
      ASoC: codecs: tlv320dac33: remove kmemdup_array

Sachin Mokashi (1):
      ASoC: Intel: ehl_rt5660: remove unused macro definitions

Sander Vanheule (2):
      ASoC: sti: Return errors from regmap_field_alloc()
      ASoC: sti: use managed regmap_field allocations

Sen Wang (3):
      ASoC: ti: davinci-mcasp: Add system suspend/resume support
      ASoC: ti: davinci-mcasp: extract mcasp_is_auxclk_enabled() helper
      ASoC: ti: davinci-mcasp: improve aux_div selection for mid-range dividers

Sheetal (17):
      ASoC: tegra: Use dev_err_probe() in tegra186_asrc probe
      ASoC: tegra: Use dev_err_probe() in tegra186_dspk probe
      ASoC: tegra: Add error logging in tegra210_adx driver
      ASoC: tegra: Use dev_err_probe() in tegra210_ahub probe
      ASoC: tegra: Add error logging in tegra210_amx driver
      ASoC: tegra: Use dev_err_probe() in tegra210_dmic probe
      ASoC: tegra: Add error logging in tegra210_i2s driver
      ASoC: tegra: Use dev_err_probe() in tegra210_mixer probe
      ASoC: tegra: Use dev_err_probe() in tegra210_mvc probe
      ASoC: tegra: Use dev_err_probe() in tegra210_sfc probe
      ASoC: tegra: Use dev_err_probe() in tegra_asoc_machine probe
      ASoC: tegra: Use dev_err_probe() in tegra_audio_graph_card probe
      ASoC: tegra: Add error logging in tegra210_admaif driver
      ASoC: tegra: Use dev_err_probe() in OPE, PEQ and MBDRC drivers
      ASoC: tegra: Use dev_err_probe() for regmap init failures
      ASoC: tegra: Use dev_err_probe() in tegra_asoc_machine probe
      ASoC: rt5640: Handle 0Hz sysclk during stream shutdown

Shenghao Ding (1):
      ASoC: tas2781: Explicit association of Device, Device Name, and Device ID

Shengjiu Wang (15):
      ASoC: cs42xx8: add error checks for constraints in TDM mode
      ASoC: fsl_utils: Add snd_kcontrol functions for specific cases
      ASoC: fsl_sai: add bitcount and timestamp controls
      ASoC: fsl_xcvr: add bitcount and timestamp controls
      ASoC: fsl_micfil: Add access property for "VAD Detected"
      ASoC: fsl_micfil: Fix event generation in hwvad_put_enable()
      ASoC: fsl_micfil: Fix event generation in hwvad_put_init_mode()
      ASoC: fsl_micfil: Fix event generation in micfil_range_set()
      ASoC: fsl_micfil: Fix event generation in micfil_put_dc_remover_state()
      ASoC: fsl_micfil: Fix event generation in micfil_quality_set()
      ASoC: fsl_xcvr: Fix event generation in fsl_xcvr_arc_mode_put()
      ASoC: fsl_xcvr: Fix event generation in fsl_xcvr_mode_put()
      ASoC: fsl_easrc: Check the variable range in fsl_easrc_iec958_put_bits()
      ASoC: fsl_easrc: Fix value type in fsl_easrc_iec958_get_bits()
      ASoC: fsl_easrc: Change the type for iec958 channel status controls

Shuming Fan (1):
      ASoC: SDCA: fix the register to ctl value conversion for Q7.8 format

Srinivas Kandagatla (12):
      ASoC: qcom: q6apm: move component registration to unmanaged version
      ASoC: qcom: q6apm: remove child devices when apm is removed
      ASoC: qcom: qdsp6: topology: check widget type before accessing data
      ASoC: qcom: q6apm-lpass-dai: Fix multiple graph opens
      ASoC: qcom: q6apm-dai: reset queue ptr on trigger stop
      ASoC: dt-bindings: qcom: add LPASS LPI MI2S dai ids
      ASoC: qcom: common: validate cpu dai id during parsing
      ASoC: qcom: qdsp6: lpass-ports: add support for LPASS LPI MI2S dais
      ASoC: qcom: qdapm-lpass-dai: correct the error message
      ASoC: qcom: q6apm-lpass-dai: move graph start to trigger
      ASoC: qcom: qdsp6: remove search for module iid in hot path
      ASoC: qcom: q6apm: Add support for early buffer mapping on DSP

Stefan Binding (5):
      firmware: cs_dsp: Add API to hibernate the DSP
      ASoC: codecs: wm_adsp: Allow wm_adsp to hibernate without stopping DSP
      ASoC: cs35l41: Hibernate wm_adsp on runtime suspend
      ALSA: hda/realtek: Add support for HP Laptops
      ALSA: hda/realtek: Add support for ASUS 2026 Commercial laptops using CS35L41 HDA

Stefano Radaelli (1):
      ASoC: simple-card-utils: add sysclk ordering support

Svyatoslav Ryhel (4):
      ASoC: dt-bindings: nvidia,tegra-audio: document CPCAP CODEC
      ASoC: tegra: Support CPCAP by machine driver
      ASoC: dt-bindings: nvidia,tegra-audio: document WM8962 CODEC
      ASoC: dt-bindings: nvidia,tegra-audio-max9808x: document additional board pins

Syed Saba Kareem (1):
      ASoC: amd: ps: fix the pcm device numbering for acp pdm dmic

Takashi Iwai (17):
      ALSA: usb-audio: Use strings in struct usb_dev for manufacturer & co
      ALSA: usb-audio: Replace hard-coded number with MAX_CHANNELS
      ALSA: usb-audio: Extend max number of channels to 64
      ALSA: hda: Add missing SET_GPI_* and SET_GPO_* verb definitions
      ALSA: hda: Add sync version of snd_hda_codec_write()
      ALSA: hda: Add a simple GPIO setup helper function
      ALSA: hda/realtek: Clean up with snd_hda_codec_set_gpio()
      ALSA: hda/alc662: Simplify the quirk for CSL Unity BF24B
      ALSA: hda/analog: Fix GPIO verb orders
      ALSA: hda/sigmatel: Clean up with the new GPIO helper
      ALSA: hda/ca0132: Clean up with the new GPIO helper
      ALSA: hda/cirrus: Clean up with the new GPIO helper
      ALSA: hda/conexant: Clean up with the new GPIO helper
      ALSA: hda/senarytech: Clean up with the new GPIO helper
      ALSA: hda/alc269: Drop superfluous GPIO write at resume
      ALSA: usb-audio: Evaluate packsize caps at the right place
      ALSA: usb-audio: Fix missing error handling for get_min_max*()

Teguh Sobirin (1):
      ASoC: codecs: aw88166: Support device specific firmware

Thorsten Blum (2):
      ALSA: aoa: Skip devices with no codecs in i2sbus_resume()
      ASoC: codecs: inline i2c_check_functionality checks

Tim Bird (1):
      ASoC: Add SPDX ids to many soc files

Vijendar Mukunda (3):
      ASoC: amd: acp: update dmic_num logic for acp pdm dmic
      ASoC: amd: acp-sdw-legacy: rename the dmic component name
      ASoC: amd: acp-sdw-legacy: remove unnecessary condition check

Wenyuan Li (2):
      ASoC: uda1380: fix missing return value checks for I2C operations
      ASoC: uda1380: use dev_err() and %pe for better error reporting

Yauhen Kharuzhy (7):
      ASoC: rt5677: Add 10EC5677 ACPI ID as supported
      ASoC: rt5677: Allow it to be defined as an I2C board
      ASoC: rt5677: Fix typo in the header file
      ASoC: rt5677: Report error if the ID register cannot be read
      ASoC: rt5677: Set up ACPI GPIO pins mapping table
      ASoC: rt5677: Reset the codec during probing
      ASoC: rt5677-spi: Add SPI device ID matching table

Zhang Heng (1):
      ALSA: hda/realtek: Add quirk for CSL Unity BF24B

Ziqing Chen (1):
      ALSA: control: Validate buf_len before strnlen() in snd_ctl_elem_init_enum_names()

songxiebing (6):
      ASoC: renesas: Fix non-static global variable
      ALSA: core/seq: Optimize the return logic in cc_ev_to_ump_midi2
      ALSA: hda/realtek: Fix code style error
      ASoC: intel: avs: Fix type mismatch in variable assignment
      ALSA: usb-audio: qcom: Fix incorrect type in enable_audio_stream
      ALSA: hda/realtek: Add quirk for HP Spectre x360 14-ea

wangdicheng (6):
      ALSA: hda/senary: Add hardware init verbs and fixup framework
      ALSA: hda/senary: Fix beep error handling and optimize EAPD switching
      ALSA: hda/cs8409: Fix error message in cs8409_i2c_bulk_read()
      ALSA: hda/cmedia: Remove duplicate pin configuration parsing
      ALSA: aoa/tas: Fix OF node leak on probe failure
      ALSA: aoa/onyx: Fix OF node leak on probe failure

---
 .../devicetree/bindings/sound/adi,ssm2305.txt      |   14 -
 .../devicetree/bindings/sound/adi,ssm2305.yaml     |   46 +
 .../devicetree/bindings/sound/awinic,aw88395.yaml  |    4 +
 .../devicetree/bindings/sound/cirrus,cs42l43.yaml  |    3 +
 .../bindings/sound/hisilicon,hi6210-i2s.txt        |   42 -
 .../bindings/sound/hisilicon,hi6210-i2s.yaml       |   80 ++
 .../devicetree/bindings/sound/imx-audio-card.yaml  |    9 +-
 .../bindings/sound/mediatek,mt2701-wm8960.yaml     |    4 +-
 .../bindings/sound/mediatek,mt7986-wm8960.yaml     |    4 +-
 .../sound/mediatek,mt8173-rt5650-rt5514.yaml       |   41 +
 .../bindings/sound/mediatek,mt8188-mt6359.yaml     |    4 +-
 .../bindings/sound/mt8173-rt5650-rt5514.txt        |   15 -
 .../bindings/sound/nvidia,tegra-audio-cpcap.yaml   |   90 ++
 .../sound/nvidia,tegra-audio-max9808x.yaml         |    5 +
 .../bindings/sound/nvidia,tegra-audio-wm8962.yaml  |   88 ++
 .../bindings/sound/qcom,q6dsp-lpass-ports.yaml     |    5 +-
 .../bindings/sound/rockchip,rk3399-gru-sound.txt   |   22 -
 .../bindings/sound/rockchip,rk3399-gru-sound.yaml  |   60 +
 .../sound/rockchip,rockchip-audio-max98090.yaml    |   59 +
 .../bindings/sound/rockchip-max98090.txt           |   42 -
 .../devicetree/bindings/sound/simple-card.yaml     |   14 +-
 .../devicetree/bindings/sound/tdm-slot.txt         |   29 -
 .../devicetree/bindings/sound/tdm-slot.yaml        |   52 +
 .../devicetree/bindings/sound/ti,tas2770.yaml      |    4 +-
 Documentation/sound/alsa-configuration.rst         |    7 +
 arch/arm/mach-s3c/mach-crag6410-module.c           |    6 +-
 drivers/firmware/cirrus/cs_dsp.c                   |  117 +-
 drivers/firmware/cirrus/cs_dsp.h                   |    4 +-
 drivers/firmware/cirrus/test/cs_dsp_test_bin.c     |   25 +-
 .../firmware/cirrus/test/cs_dsp_test_bin_error.c   |   22 +-
 .../cirrus/test/cs_dsp_test_control_cache.c        |    5 +
 .../cirrus/test/cs_dsp_test_control_parse.c        |    5 +
 .../firmware/cirrus/test/cs_dsp_test_control_rw.c  |    5 +
 drivers/firmware/cirrus/test/cs_dsp_test_wmfw.c    |   32 +-
 .../firmware/cirrus/test/cs_dsp_test_wmfw_error.c  |   30 +-
 drivers/mfd/cs42l43-i2c.c                          |    7 +-
 drivers/mfd/cs42l43-sdw.c                          |    4 +-
 drivers/mfd/cs42l43.c                              |   93 +-
 drivers/mfd/cs42l43.h                              |    2 +-
 include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h |   12 +
 include/linux/firmware/cirrus/cs_dsp.h             |    3 +
 include/linux/mfd/arizona/pdata.h                  |   10 -
 include/linux/mfd/cs42l43-regs.h                   |   76 ++
 include/linux/mfd/cs42l43.h                        |    1 +
 include/sound/core.h                               |    3 +
 include/sound/cs35l56.h                            |    7 +-
 include/sound/gus.h                                |    8 +
 include/sound/hda_codec.h                          |   15 +
 include/sound/hda_verbs.h                          |   12 +-
 include/sound/pcm.h                                |    4 +
 include/sound/sdca_asoc.h                          |   43 +-
 include/sound/simple_card_utils.h                  |    6 +
 include/sound/soc-component.h                      |   11 +-
 include/sound/soc-dai.h                            |   22 +
 include/sound/soc-dapm.h                           |    1 +
 include/sound/soc.h                                |   33 +-
 include/sound/soc_sdw_utils.h                      |    5 +
 include/sound/tea6330t.h                           |    1 +
 include/sound/timer.h                              |    1 +
 include/sound/uda1380.h                            |   19 -
 sound/aoa/aoa.h                                    |    2 +-
 sound/aoa/codecs/onyx.c                            |   41 +-
 sound/aoa/codecs/tas.c                             |    1 +
 sound/aoa/fabrics/layout.c                         |   28 +-
 sound/aoa/soundbus/i2sbus/core.c                   |   12 +-
 sound/aoa/soundbus/i2sbus/pcm.c                    |   71 +-
 sound/core/Makefile                                |    1 +
 sound/core/compress_offload.c                      |   21 +-
 sound/core/control.c                               |   80 +-
 sound/core/control_trace.h                         |   55 +
 sound/core/init.c                                  |    8 +
 sound/core/oss/pcm_oss.c                           |   44 +-
 sound/core/pcm_compat.c                            |   10 +-
 sound/core/pcm_native.c                            |   29 +-
 sound/core/seq/oss/seq_oss_rw.c                    |    6 +-
 sound/core/seq/seq_ump_convert.c                   |   35 +-
 sound/core/sound.c                                 |    7 +
 sound/core/timer.c                                 |   29 +-
 sound/firewire/fireworks/fireworks_command.c       |    5 +-
 sound/hda/codecs/analog.c                          |   18 +-
 sound/hda/codecs/ca0132.c                          |   14 +-
 sound/hda/codecs/cirrus/cs420x.c                   |   11 +-
 sound/hda/codecs/cirrus/cs421x.c                   |   11 +-
 sound/hda/codecs/cirrus/cs8409.c                   |   24 +-
 sound/hda/codecs/cmedia.c                          |    7 -
 sound/hda/codecs/conexant.c                        |   14 +-
 sound/hda/codecs/generic.c                         |    2 +-
 sound/hda/codecs/hdmi/intelhdmi.c                  |    2 +-
 sound/hda/codecs/realtek/alc269.c                  |   46 +-
 sound/hda/codecs/realtek/alc662.c                  |   17 +
 sound/hda/codecs/realtek/realtek.c                 |   31 +-
 sound/hda/codecs/realtek/realtek.h                 |    2 -
 sound/hda/codecs/senarytech.c                      |   83 +-
 sound/hda/codecs/side-codecs/Kconfig               |    1 +
 .../hda/codecs/side-codecs/cs35l41_hda_property.c  |    6 +
 sound/hda/codecs/sigmatel.c                        |   10 +-
 sound/hda/common/codec.c                           |   86 +-
 sound/hda/common/hda_local.h                       |    1 +
 sound/hda/common/proc.c                            |  100 +-
 sound/hda/controllers/intel.c                      |   13 -
 sound/i2c/other/ak4xxx-adda.c                      |   34 +-
 sound/i2c/tea6330t.c                               |   41 +-
 sound/isa/es1688/es1688.c                          |   50 +-
 sound/isa/gus/gus_dma.c                            |   33 +
 sound/isa/gus/gus_main.c                           |   36 +
 sound/isa/gus/gus_pcm.c                            |    7 +-
 sound/isa/gus/gus_reset.c                          |   62 +-
 sound/isa/gus/gus_timer.c                          |   14 +
 sound/isa/gus/gus_uart.c                           |   47 +
 sound/isa/gus/gusclassic.c                         |   21 +-
 sound/isa/gus/gusextreme.c                         |   57 +-
 sound/isa/gus/gusmax.c                             |   28 +-
 sound/isa/gus/interwave.c                          |  178 ++-
 sound/isa/msnd/msnd.c                              |   72 +-
 sound/isa/msnd/msnd.h                              |    3 +
 sound/isa/msnd/msnd_pinnacle.c                     |   95 +-
 sound/isa/msnd/msnd_pinnacle_mixer.c               |    4 +
 sound/isa/sc6000.c                                 |  193 ++-
 sound/isa/sscape.c                                 |  327 ++++--
 sound/pci/asihpi/asihpi.c                          |   36 +-
 sound/pci/ctxfi/ctatc.c                            |   34 +-
 sound/pci/ctxfi/ctdaio.c                           |    5 +-
 sound/pci/ctxfi/ctdaio.h                           |    2 +-
 sound/pci/ctxfi/ctvmem.h                           |    2 +-
 sound/soc/amd/Kconfig                              |   10 -
 sound/soc/amd/Makefile                             |    1 -
 sound/soc/amd/acp-da7219-max98357a.c               |    5 +-
 sound/soc/amd/acp-es8336.c                         |    1 -
 sound/soc/amd/acp-pcm-dma.c                        |    2 +-
 sound/soc/amd/acp-rt5645.c                         |   22 +-
 sound/soc/amd/acp/acp-platform.c                   |    2 +-
 sound/soc/amd/acp/acp-sdw-legacy-mach.c            |   10 +-
 sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c      |    1 -
 sound/soc/amd/acp3x-rt5682-max9836.c               |    1 -
 sound/soc/amd/include/acp_2_2_d.h                  |   18 +-
 sound/soc/amd/include/acp_2_2_enum.h               |   18 +-
 sound/soc/amd/include/acp_2_2_sh_mask.h            |   18 +-
 sound/soc/amd/ps/ps-pdm-dma.c                      |    3 +-
 sound/soc/amd/ps/ps-sdw-dma.c                      |    2 +-
 sound/soc/amd/raven/acp3x-pcm-dma.c                |    2 +-
 sound/soc/amd/renoir/acp3x-pdm-dma.c               |    2 +-
 sound/soc/amd/rpl/Makefile                         |    5 -
 sound/soc/amd/rpl/rpl-pci-acp6x.c                  |  227 ----
 sound/soc/amd/rpl/rpl_acp6x.h                      |   36 -
 sound/soc/amd/rpl/rpl_acp6x_chip_offset_byte.h     |   30 -
 sound/soc/amd/vangogh/acp5x-pcm-dma.c              |    2 +-
 sound/soc/amd/yc/acp6x-mach.c                      |   28 +
 sound/soc/amd/yc/acp6x-pdm-dma.c                   |    2 +-
 sound/soc/amd/yc/pci-acp6x.c                       |   12 +
 sound/soc/apple/Kconfig                            |    1 +
 sound/soc/apple/Makefile                           |    1 +
 sound/soc/apple/mca.c                              |    4 +-
 sound/soc/atmel/atmel-pcm-pdc.c                    |    2 +-
 sound/soc/au1x/dbdma2.c                            |    2 +-
 sound/soc/au1x/dma.c                               |    2 +-
 sound/soc/bcm/bcm63xx-pcm-whistler.c               |    2 +-
 sound/soc/bcm/cygnus-pcm.c                         |    2 +-
 sound/soc/codecs/Kconfig                           |   64 +-
 sound/soc/codecs/Makefile                          |    2 +
 sound/soc/codecs/ak5558.c                          |    1 -
 sound/soc/codecs/arizona-jack.c                    |   95 +-
 sound/soc/codecs/arizona.h                         |    1 +
 sound/soc/codecs/aw87390.c                         |    3 +-
 sound/soc/codecs/aw88081.c                         |    3 +-
 sound/soc/codecs/aw88166.c                         |   12 +-
 sound/soc/codecs/aw88261.c                         |   16 +-
 sound/soc/codecs/cros_ec_codec.c                   |    2 +-
 sound/soc/codecs/cs-amp-lib-test.c                 |    1 -
 sound/soc/codecs/cs-amp-lib.c                      |    2 +
 sound/soc/codecs/cs35l41.c                         |    5 +
 sound/soc/codecs/cs35l45.c                         |    3 +
 sound/soc/codecs/cs35l56-sdw.c                     |   34 +-
 sound/soc/codecs/cs35l56-shared-test.c             |  240 ++++
 sound/soc/codecs/cs35l56-shared.c                  |    9 +
 sound/soc/codecs/cs35l56-test.c                    |  101 +-
 sound/soc/codecs/cs35l56.c                         |   99 +-
 sound/soc/codecs/cs35l56.h                         |    4 +
 sound/soc/codecs/cs4270.c                          |    6 +-
 sound/soc/codecs/cs42l43.c                         |  756 +++++++++---
 sound/soc/codecs/cs42l43.h                         |    4 +-
 sound/soc/codecs/cs42l84.c                         |   20 +-
 sound/soc/codecs/cs42xx8-i2c.c                     |    5 +-
 sound/soc/codecs/cs42xx8.c                         |   27 +-
 sound/soc/codecs/cs42xx8.h                         |    5 +-
 sound/soc/codecs/da7219-aad.c                      |    3 +-
 sound/soc/codecs/da7219-aad.h                      |    5 +
 sound/soc/codecs/jz4725b.c                         |   18 +-
 sound/soc/codecs/jz4760.c                          |   20 +-
 sound/soc/codecs/jz4770.c                          |   20 +-
 sound/soc/codecs/max98390.c                        |    6 +-
 sound/soc/codecs/max98520.c                        |    4 +-
 sound/soc/codecs/nau8315.c                         |    1 -
 sound/soc/codecs/peb2466.c                         |   19 +-
 sound/soc/codecs/rt1318.c                          |    1 -
 sound/soc/codecs/rt1320-sdw.c                      |   67 +-
 sound/soc/codecs/rt1320-sdw.h                      |   14 +
 sound/soc/codecs/rt5514-spi.c                      |    2 +-
 sound/soc/codecs/rt5575.c                          |    1 -
 sound/soc/codecs/rt5640.c                          |    5 +
 sound/soc/codecs/rt5677-spi.c                      |    9 +-
 sound/soc/codecs/rt5677.c                          |   40 +-
 sound/soc/codecs/rt5677.h                          |    2 +-
 sound/soc/codecs/sta529.c                          |    5 +-
 sound/soc/codecs/tas2552.c                         |   10 +-
 sound/soc/codecs/tas2764.c                         |   95 ++
 sound/soc/codecs/tas2764.h                         |   11 +
 sound/soc/codecs/tas2770.c                         |   75 ++
 sound/soc/codecs/tas2770.h                         |   12 +
 sound/soc/codecs/tas2781-i2c.c                     |  104 +-
 sound/soc/codecs/tlv320dac33.c                     |   10 +-
 sound/soc/codecs/ts3a227e.c                        |    1 -
 sound/soc/codecs/uda1380.c                         |  110 +-
 sound/soc/codecs/wcd-clsh-v2.c                     |    3 -
 sound/soc/codecs/wcd9335.c                         |    2 +-
 sound/soc/codecs/wm_adsp.c                         |  242 ++--
 sound/soc/codecs/wm_adsp.h                         |   20 +
 sound/soc/codecs/wm_adsp_fw_find_test.c            | 1223 ++++++++++++++++++++
 sound/soc/dwc/dwc-i2s.c                            |    5 +-
 sound/soc/dwc/dwc-pcm.c                            |    7 +-
 sound/soc/dwc/local.h                              |    5 +-
 sound/soc/fsl/efika-audio-fabric.c                 |    5 +-
 sound/soc/fsl/fsl_asrc_dma.c                       |    2 +-
 sound/soc/fsl/fsl_dma.c                            |   12 +-
 sound/soc/fsl/fsl_easrc.c                          |  125 +-
 sound/soc/fsl/fsl_micfil.c                         |   72 +-
 sound/soc/fsl/fsl_qmc_audio.c                      |    6 +-
 sound/soc/fsl/fsl_sai.c                            |   66 ++
 sound/soc/fsl/fsl_sai.h                            |    4 +
 sound/soc/fsl/fsl_utils.c                          |  131 +++
 sound/soc/fsl/fsl_utils.h                          |   48 +
 sound/soc/fsl/fsl_xcvr.c                           |   86 +-
 sound/soc/fsl/fsl_xcvr.h                           |   18 +
 sound/soc/fsl/imx-pcm-fiq.c                        |    4 +-
 sound/soc/fsl/imx-pcm-rpmsg.c                      |    2 +-
 sound/soc/fsl/imx-rpmsg.c                          |   48 +
 sound/soc/fsl/mpc5200_dma.c                        |   13 +-
 sound/soc/generic/audio-graph-card.c               |    2 +-
 sound/soc/generic/simple-card-utils.c              |   97 +-
 sound/soc/generic/simple-card.c                    |   52 +-
 sound/soc/generic/test-component.c                 |   12 +-
 sound/soc/google/chv3-i2s.c                        |    6 +-
 sound/soc/intel/atom/sst-mfld-platform-pcm.c       |    2 +-
 sound/soc/intel/avs/pcm.c                          |    8 +-
 sound/soc/intel/avs/probes.c                       |    2 +-
 sound/soc/intel/boards/bytcr_rt5640.c              |    4 +-
 sound/soc/intel/boards/bytcr_rt5651.c              |    4 +-
 sound/soc/intel/boards/cht_bsw_rt5672.c            |    6 +-
 sound/soc/intel/boards/ehl_rt5660.c                |    2 -
 sound/soc/intel/catpt/Makefile                     |    1 +
 sound/soc/intel/catpt/core.h                       |    2 +-
 sound/soc/intel/catpt/device.c                     |    2 +-
 sound/soc/intel/catpt/ipc.c                        |    3 +
 sound/soc/intel/catpt/loader.c                     |    2 +
 sound/soc/intel/catpt/messages.h                   |    3 +
 sound/soc/intel/catpt/pcm.c                        |  414 +++----
 sound/soc/intel/common/soc-acpi-intel-ptl-match.c  |  100 --
 sound/soc/intel/keembay/Makefile                   |    1 +
 sound/soc/intel/keembay/kmb_platform.c             |    2 +-
 sound/soc/kirkwood/kirkwood-dma.c                  |    2 +-
 sound/soc/loongson/loongson_dma.c                  |    2 +-
 .../soc/mediatek/common/mtk-afe-platform-driver.c  |    2 +-
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c         |    2 +-
 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c         |    4 +-
 sound/soc/mxs/mxs-sgtl5000.c                       |    5 +-
 sound/soc/pxa/pxa-ssp.c                            |    2 +-
 sound/soc/pxa/pxa2xx-ac97.c                        |    2 +-
 sound/soc/pxa/pxa2xx-i2s.c                         |    2 +-
 sound/soc/pxa/pxa2xx-pcm.c                         |    2 +-
 sound/soc/qcom/common.c                            |    6 +
 sound/soc/qcom/common.h                            |    3 +
 sound/soc/qcom/lpass-platform.c                    |    2 +-
 sound/soc/qcom/lpass.h                             |    3 +-
 sound/soc/qcom/qdsp6/audioreach.c                  |   65 +-
 sound/soc/qcom/qdsp6/audioreach.h                  |    5 +-
 sound/soc/qcom/qdsp6/q6afe-dai.c                   |    6 +
 sound/soc/qcom/qdsp6/q6afe.c                       |    8 +
 sound/soc/qcom/qdsp6/q6afe.h                       |    3 +-
 sound/soc/qcom/qdsp6/q6apm-dai.c                   |  115 +-
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c            |   48 +-
 sound/soc/qcom/qdsp6/q6apm.c                       |  184 ++-
 sound/soc/qcom/qdsp6/q6apm.h                       |   20 +-
 sound/soc/qcom/qdsp6/q6asm-dai.c                   |    2 +-
 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c           |   76 ++
 sound/soc/qcom/qdsp6/topology.c                    |    8 +-
 sound/soc/renesas/dma-sh7760.c                     |    5 +-
 sound/soc/renesas/fsi.c                            |    2 +-
 sound/soc/renesas/rcar/core.c                      |    2 +-
 sound/soc/renesas/rcar/msiof.c                     |    2 +-
 sound/soc/renesas/rz-ssi.c                         |    2 +-
 sound/soc/renesas/siu_pcm.c                        |    5 +-
 sound/soc/rockchip/rockchip_sai.c                  |    4 +
 sound/soc/samsung/idma.c                           |    4 +-
 sound/soc/samsung/spdif.c                          |   29 +-
 sound/soc/sdca/sdca_asoc.c                         |  118 +-
 sound/soc/sdca/sdca_class.c                        |   36 +-
 sound/soc/sdca/sdca_class_function.c               |   12 +-
 sound/soc/sdca/sdca_fdl.c                          |    5 -
 sound/soc/sdca/sdca_functions.c                    |    6 +-
 sound/soc/sdca/sdca_interrupts.c                   |   24 +-
 sound/soc/sdw_utils/Makefile                       |    1 +
 sound/soc/sdw_utils/soc_sdw_cs42l43.c              |   10 +-
 sound/soc/sdw_utils/soc_sdw_cs47l47.c              |   80 ++
 sound/soc/sdw_utils/soc_sdw_rt_dmic.c              |   46 +-
 sound/soc/sdw_utils/soc_sdw_utils.c                |  234 +++-
 sound/soc/soc-component.c                          |   25 +-
 sound/soc/soc-compress.c                           |    4 +-
 sound/soc/soc-core.c                               |   86 +-
 sound/soc/soc-dai.c                                |   40 +
 sound/soc/soc-dapm.c                               |   11 +
 sound/soc/soc-generic-dmaengine-pcm.c              |    4 +-
 sound/soc/soc-ops.c                                |   83 +-
 sound/soc/soc-pcm.c                                |    4 +-
 sound/soc/soc-topology.c                           |   73 +-
 sound/soc/sof/compress.c                           |   15 +-
 sound/soc/sof/intel/hda-stream.c                   |   10 +-
 sound/soc/sof/intel/hda.c                          |   17 +-
 sound/soc/sof/ipc4-topology.c                      |   13 +-
 sound/soc/sof/pcm.c                                |   10 +-
 sound/soc/sof/sof-audio.h                          |   13 +-
 sound/soc/sof/sof-priv.h                           |    2 +
 sound/soc/sof/topology.c                           |   36 +-
 sound/soc/spear/spdif_in.c                         |    5 +-
 sound/soc/spear/spdif_out.c                        |    5 +-
 sound/soc/spear/spear_pcm.c                        |    5 +-
 sound/soc/sprd/sprd-pcm-dma.c                      |    2 +-
 sound/soc/starfive/Makefile                        |    1 +
 sound/soc/sti/uniperif_player.c                    |    9 +-
 sound/soc/stm/stm32_adfsdm.c                       |    2 +-
 sound/soc/sunxi/sun4i-spdif.c                      |   13 +-
 sound/soc/tegra/Kconfig                            |   19 +
 sound/soc/tegra/Makefile                           |    2 +
 sound/soc/tegra/tegra186_asrc.c                    |   14 +-
 sound/soc/tegra/tegra186_dspk.c                    |   22 +-
 sound/soc/tegra/tegra20_spdif.h                    |    2 +-
 sound/soc/tegra/tegra210_admaif.c                  |   28 +-
 sound/soc/tegra/tegra210_adx.c                     |   20 +-
 sound/soc/tegra/tegra210_ahub.c                    |   33 +-
 sound/soc/tegra/tegra210_amx.c                     |   16 +-
 sound/soc/tegra/tegra210_dmic.c                    |   21 +-
 sound/soc/tegra/tegra210_i2s.c                     |   25 +-
 sound/soc/tegra/tegra210_mbdrc.c                   |   35 +-
 sound/soc/tegra/tegra210_mixer.c                   |   14 +-
 sound/soc/tegra/tegra210_mvc.c                     |   14 +-
 sound/soc/tegra/tegra210_ope.c                     |   22 +-
 sound/soc/tegra/tegra210_peq.c                     |   23 +-
 sound/soc/tegra/tegra210_sfc.c                     |   14 +-
 sound/soc/tegra/tegra_asoc_machine.c               |  143 ++-
 sound/soc/tegra/tegra_audio_graph_card.c           |   21 +-
 sound/soc/tegra/tegra_pcm.c                        |    6 +-
 sound/soc/tegra/tegra_pcm.h                        |    4 +-
 sound/soc/tegra/tegra_wm8962.c                     |  165 +++
 sound/soc/ti/davinci-mcasp.c                       |   47 +-
 sound/soc/uniphier/aio-dma.c                       |    2 +-
 sound/soc/xilinx/xlnx_formatter_pcm.c              |    2 +-
 sound/soc/xtensa/xtfpga-i2s.c                      |    2 +-
 sound/usb/6fire/chip.c                             |   17 +-
 sound/usb/caiaq/device.c                           |    4 +-
 sound/usb/card.c                                   |   44 +-
 sound/usb/endpoint.c                               |    6 +-
 sound/usb/format.c                                 |    4 +
 sound/usb/midi.c                                   |   12 +-
 sound/usb/midi2.c                                  |    6 +-
 sound/usb/mixer.c                                  |  246 +++-
 sound/usb/mixer.h                                  |    4 +-
 sound/usb/mixer_quirks.c                           |   59 +
 sound/usb/mixer_s1810c.c                           |    2 +
 sound/usb/mixer_scarlett2.c                        |    2 +-
 sound/usb/qcom/Makefile                            |    1 +
 sound/usb/qcom/qc_audio_offload.c                  |    2 +-
 sound/usb/quirks-table.h                           |  113 ++
 sound/usb/quirks.c                                 |   83 +-
 sound/usb/stream.c                                 |    8 +
 sound/usb/usbaudio.h                               |   12 +
 sound/usb/usx2y/us144mkii.c                        |    6 +-
 sound/x86/intel_hdmi_audio.h                       |   22 +-
 tools/testing/selftests/alsa/utimer-test.c         |   10 +-
 376 files changed, 9045 insertions(+), 3328 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/adi,ssm2305.txt
 create mode 100644 Documentation/devicetree/bindings/sound/adi,ssm2305.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/hisilicon,hi6210-i2s.txt
 create mode 100644 Documentation/devicetree/bindings/sound/hisilicon,hi6210-i2s.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650-rt5514.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/mt8173-rt5650-rt5514.txt
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-cpcap.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8962.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/rockchip,rk3399-gru-sound.txt
 create mode 100644 Documentation/devicetree/bindings/sound/rockchip,rk3399-gru-sound.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/rockchip,rockchip-audio-max98090.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/rockchip-max98090.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/tdm-slot.txt
 create mode 100644 Documentation/devicetree/bindings/sound/tdm-slot.yaml
 delete mode 100644 include/sound/uda1380.h
 create mode 100644 sound/core/control_trace.h
 delete mode 100644 sound/soc/amd/rpl/Makefile
 delete mode 100644 sound/soc/amd/rpl/rpl-pci-acp6x.c
 delete mode 100644 sound/soc/amd/rpl/rpl_acp6x.h
 delete mode 100644 sound/soc/amd/rpl/rpl_acp6x_chip_offset_byte.h
 create mode 100644 sound/soc/codecs/wm_adsp_fw_find_test.c
 create mode 100644 sound/soc/sdw_utils/soc_sdw_cs47l47.c
 create mode 100644 sound/soc/tegra/tegra_wm8962.c

