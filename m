Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA9C397E91;
	Wed, 19 Aug 2026 07:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787123132; cv=none; b=R1E+xRjb8DzjmLgUYQhxVlBq7qebpf5t1Hhpy7am0FPn8dqRv+Hn/5uScmxTWB3T00dUFYDKYtJoz/naWvglEKC5J+7PMpEAL1ggas4q1ZU/EN2bV6XOhtFGW1iI1zOtiFajGGOiZgPd2zDOtn1tqIqPWLo+Uzy+X736Ie3iGu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787123132; c=relaxed/simple;
	bh=yPlGMjozzMAfkAxJslAMo0stHpAPTjHhAiFF9X9EjS8=;
	h=Date:Message-ID:From:To:Cc:Subject:MIME-Version:Content-Type; b=Ro92m2W0tSs7oJ19qgr/b0QRbOwKGAoBNsQCLbH6JVMXZ2c7dEi9uQdmsY5nnu14rC7GH3BNgvjDJMwcOX2W+SdabUxz2d+YKq+dYOgxf/SBpLXJhStACVG08KauFr9RLc4m4isUABYRO2Mye0BP0E6FFEvXViMN9HKKNWPpQiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KzIRz40W; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mOQcB5zP; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HaLd1RE+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mgu+QUOQ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KzIRz40W";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mOQcB5zP";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HaLd1RE+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mgu+QUOQ"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id ADE49849B1;
	Wed, 19 Aug 2026 07:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787123119; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gGuwGpYqi3M+RS9ViFZQ0LSXILXo9rKAvX2LrZP0BP0=;
	b=KzIRz40WSszBeyFfmGU0yAar8G7zaCHBL8WyICz+wZzRxhFDc2wvuYFE86RFDWAn1ZbMTz
	OuH6KF72j4nf7HYGop1SlvENIlX3CNZ9XSD68bYqhGFEijH3eUPhLjVmriRKjS8lC6ryIJ
	3d+XOiggW3MFXVAYerZRloUSS34F4+g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787123119;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gGuwGpYqi3M+RS9ViFZQ0LSXILXo9rKAvX2LrZP0BP0=;
	b=mOQcB5zP23FJzIoEPS7Ij7mqr3RTYlui+Qx0AknsoUmL7I87fPn55GUxm4B8tWjC5/hchX
	lMdz/91pa7aWB8AQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787123115; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gGuwGpYqi3M+RS9ViFZQ0LSXILXo9rKAvX2LrZP0BP0=;
	b=HaLd1RE+qf8GZHe9XtXBePGhL2Dw6WQH9flZxyHfDXl4eS+MwH58ZDPvHnGkn5z4qHO9AF
	Pg1/toKLJLdGuNAUUAwIJfd23J8H44+IheFgwvhLU/mdzRvZbqoLPYZL1k4tPF8Jdf2pIH
	4bCfswF1nYZQvWlKfcZNgqaOoPxCzRc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787123115;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gGuwGpYqi3M+RS9ViFZQ0LSXILXo9rKAvX2LrZP0BP0=;
	b=mgu+QUOQINVuxLlpNDAktnOL+MdKR4WlcyCzQXUNOxZX760RYWkHI5k9/u4Y2XL6Ugqv5n
	KXqGP+64IdkJZxAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 77CFC2F81;
	Wed, 19 Aug 2026 07:05:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id lKYWHKtVhWqTIwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 19 Aug 2026 07:05:15 +0000
Date: Wed, 19 Aug 2026 09:05:15 +0200
Message-ID: <87y0e2oaj8.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] sound updates for 7.3-rc1
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
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

please pull sound updates for v7.3-rc1 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.3-rc1

The topmost commit is c139e7e44f58a6f8ddc9d850ea9924d34963b5da

----------------------------------------------------------------

sound updates for 7.3-rc1

It was a fairly busy development cycle -- the changes spread over from
the core side to leaf drivers, with lots of cleanups and enhancements.
Here we go, some highlights:

* ALSA core:
- Extension of ALSA control component list ABI
- Locking optimization and RCU conversion of ALSA sequencer core
- A few hardening fixes for UMP and sequencer core
- Drop __bitwise and __force prefix from UAPI definitions

* ASoC:
- Automatic DAI format selection code deployment across many drivers
- Sorting of register default tables to prevent ordering issues in
  many drivers
- Lots of code cleanups and refactoring
- Updates in Qualcomm driver stack
- New platforms: AMD ACP7.B/F, Cirrus Logic CS35L62, Loongson 2K0300,
  Meson GX, Qualcomm LPI MI2S, SM8475, WSA855X, Realtek RT1321 VA1/2
  and RT766/7

* HD-audio:
- Support for AW88399 HD-audio side codec for Lenovo Legion laptops
- Support for Hygon and Lisuan HDMI controllers
- Robustness fixes for wild device binding
- Lots of quirks/fixups: Realtek and Conexant codecs for ASUS, Lenovo,
  Acer, etc

* USB-audio:
- Support for Pioneer DJ DJM-S11
- Scarlett2/FCP private URB notification fixes
- Extended quirk_flags to 64bit
- Hardening fixes for 6fire, bcd2000, usx2y
- Device-specific quirks for Mackie, Valeton, SPACETOUCH

* General:
- Auto-cleanup for put_device() and firmware loading across multiple
  platforms

----------------------------------------------------------------

Aaron Fan (1):
      ALSA: hda/realtek: Add quirk for LG gram 16 (16Z90TR)

Aaron Ma (2):
      ALSA: hda/realtek: Fix headset mic on Legion AW88399 laptops
      ALSA: hda/realtek: Limit Legion AW88399 playback to stereo

Adam Skladowski (2):
      ASoC: dt-bindings: pm8916-wcd-analog-codec: Document pm8950/pm8953
      ASoC: msm8916-wcd-analog: add pm8950 codec

Ajay Kumar Nandam (8):
      ASoC: codecs: lpass-wsa-macro: Switch to PM clock framework for runtime PM
      ASoC: codecs: lpass-va-macro: Switch to PM clock framework for runtime PM
      ASoC: codecs: lpass-wsa-macro: Use devm_clk_hw_register() for MCLK output
      ASoC: codecs: lpass-tx-macro: switch to PM clock framework for runtime PM
      ASoC: codecs: lpass-rx-macro: switch to PM clock framework for runtime PM
      ASoC: codecs: lpass-{tx,rx}-macro: check clk_set_rate() return value
      ASoC: codecs: lpass-wsa-macro: check clk_set_rate() return value
      ASoC: codecs: lpass-va-macro: check clk_set_rate() return value

Ajrat Makhmutov (1):
      ALSA: hda/realtek: Enable headset mic on F+ FLAPTOP r

Aleksandr Nogikh (1):
      ALSA: core: Fix use-after-free in snd_card_do_free()

Andrey Golovko (2):
      ASoC: tas2783-sdw: drop stale regcache on uninitialized re-attach
      ASoC: tas2783-sdw: do not treat read-only Controls as writable

Andy Shevchenko (1):
      ASoC: SOF: Intel: Don't use "proxy" headers

Arun Raghavan (1):
      ALSA: hda/core: Log stream DMA errors on interrupt

Baojun Xu (1):
      ALSA: hda/tas2781: Add new quirk for HP new project (Messi)

Bard Liao (9):
      ASoC: SOF: add Intel UAOL sof_ipc_dai_type
      ASoC: SOF: Intel: reset spib_addr before disabling SPIB
      ASoC: SOF: Intel: Disable SPIB in non ICCMAX stream
      ASoC: Intel: add snd_soc_acpi_intel_rt712_vb_no_function_topology machine check function
      ASoC: soc-acpi-intel-ptl-match: add machine check for machines can't use function topology
      ASoC: soc-acpi-intel-ptl-match: use function topology by default
      ASoC: soc-acpi-intel-lnl-match: use function topology by default
      ASoC: soc-acpi-intel-arl-match: use function topology by default
      ASoC: soc-acpi-intel-mtl-match: use function topology by default

Baul Lee (3):
      ALSA: 6fire: bound the MIDI event length from the device
      ALSA: bcd2000: clear the URB pointers on disconnect
      ALSA: FCP: do not copy out an uninitialised init response

Bhargav Joshi (1):
      ASoC: dt-bindings: ti,omap4-dmic: Convert to DT schema

Binbin Zhou (9):
      ASoC: loongson: Fix error handling in ACPI property parsing
      ASoC: dt-bindings: loongson,ls2k1000-i2s: Document Loongson-2K0300 compatible
      ASoC: loongson: Add Loongson-2K0300 I2S controller support
      ASoC: dt-bindings: loongson,ls-audio-card: Use common sound card
      ASoC: dt-bindings: loongson,ls-audio-card: Add ctcisz forever pi compatible
      ASoC: loongson: Add Loongson-2K0300 CTCISZ Forever Pi sound card support
      ASoC: dt-bindings: loongson,ls-audio-card: Add ATK-DL2K0300B compatible
      ASoC: loongson: Add headphone jack detection and DAPM routing
      ASoC: es8328: Add DAPM routes from MIC inputs to Mic Bias

Bob Song (6):
      ALSA: hda: Check snd_hda_power_pm construct error before executing verb
      ALSA: hda/realtek: add missing error checks for COEF index reads in alc269
      ALSA: hda/realtek: add missing NULL check for codec->bus->pci
      ALSA: hda: simplify match functions and remove unreachable return
      ALSA: hda/ca0132: set codec->spec to NULL after freeing
      ALSA: hda/ca0132: replace sprintf() with snprintf()

Bramwel Barack (1):
      ALSA: hda/realtek: Add mute LED quirk for HP 250 G8 (0x85f3)

Brian Koebbe (1):
      ALSA: hda/realtek: Fix quiet 3.5mm jacks on Beelink SER6

Carl Quist (1):
      ALSA: hda/realtek: Enable mute LED on HP Laptop 15-dy0xxx

Cen Zhang (1):
      ALSA: usb-audio: Release components on probe errors

Cezary Rojewski (9):
      ASoC: Intel: catpt: Wrap the store firmware-context procedure
      ASoC: Intel: catpt: Drop redundant else-if
      ASoC: Intel: catpt: Drop redundant signature argument
      ASoC: Intel: catpt: Rename module header struct
      ASoC: Intel: catpt: Rename firmware loading functions
      ASoC: Intel: catpt: Streamline wording of offset variables
      ASoC: Intel: catpt: Streamline runtime-variables naming
      ASoC: Intel: catpt: Streamline control-variables naming
      ASoC: Intel: Remove obsolete UAPI headers

Chancel Liu (6):
      ASoC: dt-bindings: wlf,wm8524: Add audio-graph port support
      ASoC: dt-bindings: fsl,micfil: Add audio-graph port support
      ASoC: dt-bindings: dmic-codec: Add audio-graph port support
      ASoC: fsl-asoc-card: Drop mclk management for nau8822
      ASoC: fsl-asoc-card: Move static compatible data to platform data
      ASoC: fsl-asoc-card: Move bound-component setup to late_probe

Charles Keepax (11):
      ASoC: SDCA: Add missing stub for sdca_fdl_free_state()
      ASoC: es9356: Remove unused headers
      ASoC: dt-bindings: cirrus,cs42l43: Add CS42L44 variant
      ASoC: SDCA: Tidy up error message
      ASoC: SDCA: Remove unused dev pointer argument
      ASoC: SDCA: Move HID registration to IRQ time
      ASoC: SDCA: Move HID descriptors to function
      ASoC: SDCA: Update HID DisCo parsing
      ASoC: SDCA: Add missing destroy for HID device
      ASoC: SDCA: Add missing HID kernel doc
      ASoC: SDCA: Pass swft table through sdca_dev_register()

Chen-Yu Tsai (1):
      ASoC: sun4i-codec: Sort sound related #include statements

Christopher Höner (1):
      ALSA: hda/realtek: Enable internal speakers on Razer Blade 16 (2025)

Colin Ian King (1):
      ALSA: aloop: make read-only array texts static const

David Heidelberg (1):
      ASoC: dt-bindings: Convert cirrus,cs35l36 to DT schema

Denis Batishchev (1):
      ALSA: hda/realtek: Enable micmute LED on HP EliteBook 6 G1a p/n: AD3Q9ET#UUG

Diogo Ivo (2):
      ASoC: rt5677: Add GPIO .get_direction() callback
      ASoC: rt5677: Enable standalone compilation for generic card use

Dmitry Torokhov (10):
      ASoC: wcd9335: switch to using sleeping variants of gpiod API
      ASoC: ti: omap-twl4030: drop support for platform data
      ASoC: ti: omap-twl4030: use per-device instance of headset jack gpio
      ASoC: tlv320aic32x4: remove global header with platform data
      ASoC: tlv320aic32x4: do not allocate gpio config separately
      ASoC: tlv320aic32x4: consolidate programming functions
      ASoC: tlv320aic32x4: move regmap_config into i2c and spi drivers
      ASoC: tlv320aic32x4: do not make clocks bulk data static
      ASoC: tlv320aic32x4: factor out rate configuration helper
      ASoC: tlv320aic32x4: clean up driver code formatting and logging

Dmytro Moroziuk (1):
      ALSA: hda/conexant: Add mute LED quirk for HP ProBook 440 G5

Edson Juliano Drosdeck (1):
      ALSA: hda/realtek: Limit mic boost on Positivo N15RPE-S

Eric Naim (9):
      ALSA: hda/realtek: Remove ALC294_FIXUP_CS35L41_I2C_2
      ALSA: hda/realtek: Add ALC269_FIXUP_THINKPAD_LIMIT_INT_MIC_BOOST quirk
      ALSA: hda/realtek: Unchain ALC269_FIXUP_THINKPAD_ACPI from ALC269_FIXUP_LIMIT_INT_MIC_BOOST
      ALSA: hda/realtek: Remove ALC233_FIXUP_INTEL_NUC8_BOOST
      ALSA: hda/realtek: Remove ALC269_FIXUP_STARLABS_LIMIT_INT_MIC_BOOST
      ALSA: hda/realtek: Add ALC285_FIXUP_YOGA_SPEAKER2_TO_DAC1
      ALSA: hda/realtek: Unchain ALC269_FIXUP_THINKPAD_ACPI from ALC285_FIXUP_SPEAKER2_TO_DAC1
      ALSA: hda/realtek: Remove ALC294_FIXUP_ASUS_ALLY_SPEAKER
      ALSA: hda/realtek: Remove ALC285_FIXUP_ASUS_GA605K_I2C_SPEAKER2_TO_DAC1

Esteban Urrutia (2):
      ASoC: dt-bindings: qcom,sm8250: Add compatible string for SM8475
      ASoC: qcom: sc8280xp: Add support for SM8475

Ethan Tidmore (1):
      ASoC: codecs: ES8389: Remove redundant comparison

Evgenii Burenchev (2):
      ALSA: via82xx: Remove unreachable branch in snd_via686_pcm_pointer()
      ALSA: hpi: Check transport errors during HPI6000 adapter initialization

Federico Beffa (1):
      ALSA: usb-audio: Add support for Pioneer DJ DJM-S11

Frank Li (1):
      ASoC: dt-bindings: Convert eukrea-tlv320.txt to yaml

Fu Hao (2):
      ALSA: hda: Add support for Hygon family 18h model 5h HD-Audio
      ALSA: hda: Fix single byte writing issue for Hygon family 18h model 5h

Garrett Blackmon (1):
      ALSA: hda/realtek: Fix speakers on ASUS ROG Zephyrus G14 GA403UM

Geoffrey D. Bennett (2):
      ALSA: FCP: Use a private URB for the notification endpoint
      ALSA: scarlett2: Use a private URB for the notification endpoint

Giulio Gualtierotti (1):
      ALSA: hda/realtek: Add micmute LED quirk for Acer Aspire A515-57

Haoxiang Li (4):
      ASoC: fsl: mpc5200-i2s: Free DMA resources on probe failure
      AsoC: intel: sst: fix PCI device reference leak on probe failure
      ASoC: hdac_hda: Fix hlink refcount leak on component registration failure
      ASoC: hdac_hdmi: Fix resource cleanup on probe failure

Hector Martin (2):
      ASoC: apple: mca: Do not mark clocks in use for non-providers
      ASoC: apple: mca: Add delay after configuring clock

Hongyang Zhao (3):
      ASoC: dt-bindings: es8316: Add regulator supplies
      ASoC: codecs: es8316: Add regulator support
      ASoC: dt-bindings: es8316: Fix supply property constraints

HyeongJun An (3):
      ALSA: ump: Fix corrupted data bytes at MIDI 1.0 SysEx to UMP conversion
      ALSA: seq: Don't leak the extension cell pointer in the bounce payload
      ALSA: seq: Drop the dead struct snd_seq_event_bounce

Ivaylo Dimitrov (2):
      ASoC: cpcap: Remove modem-specific voice call support
      ASoC: codecs: cpcap: set voice DAI format as specified in DT

JJ Macalinao (1):
      ALSA: usb-audio: add QUIRK_FLAG_ALWAYS_SET_RATE for Mackie DLZ Creator XS

Jack Yu (1):
      ASoC: rt1320-sdw: Add settings to support more base clock frequency

Jackie Dong (1):
      ALSA: hda/realtek: ALC269 fixup for Yoga/Legion Mic noise

James Calligeros (1):
      ASoC: apple: mca: increase SERDES reset delay

Jeremie Pardou (1):
      ALSA: hda/realtek: Enable jack detection on Minisforum AI X1 Pro

Jerome Brunet (1):
      ASoC: meson: aiu: make aiu_formatter_i2s_drv static

Jiri Slaby (SUSE) (1):
      ASoC: pm4125: Switch to irq_domain_create_linear()

John Keeping (1):
      ALSA: seq: midi: Serialize input teardown with event_input

Jorijn van der Graaf (2):
      ASoC: codecs: aw88261: only check PLL and clock state at power-up
      ASoC: qcom: q6apm: keep the graph start count in sync with the DSP

Julia Lawall (1):
      ASoC: wm8940: drop unneeded semicolon

Julian Braha (1):
      ASoC: codecs: cleanup kconfig indentations

Jyri Sarha (6):
      ASoC: SOF: ipc4-topology: Remove dp_ from all module memory attributes
      ASoC: SOF: ipc4-topology: Fix SOF_TKN_COMP_STACK_BYTES_REQUIREMENT id
      ASoC: SOF: ipc4: Add SOF_IPC4_GLB_CREATE_PIPELINE payload macros and structs
      ASoC: SOF: ipc4-topology: Add payload to pipeline create messages
      ASoC: SOF: ipc4-topology: Fix sof_ipc4_mod_init_ext_dp_memory_data comments
      ASoC: SOF: ipc4-topology: Refactor sof_ipc4_widget_mod_init_msg_payload()

Kailang Yang (1):
      ALSA: hda/realtek - Add quirk to another Razer Blade 16

Krzysztof Kozlowski (3):
      ASoC: renesas: adg: Drop redundant NULL check on clk_get and clk_register_fixed_rate
      ASoC: codecs: es9356: Constify regmap_sdw_mbq_cfg
      ASoC: dt-bindings: Correct white-space style

Kuninori Morimoto (69):
      ASoC: codecs: max98090: add missing describe "data" for max98090_set_jack()
      ASoC: au1x: psc-ac97: remove unused chans
      ASoC: sdw_utils: tidyup .count_sidecar
      ASoC: sdw_utils: tidyup asoc_sdw_parse_sdw_endpoints()
      ASoC: mediatek: mt8173-rt5650: tidyup error message
      ASoC: sof: topology: use for_each_card_rtds()
      ASoC: sof: nocodec: tidyup sof_nocodec_bes_setup()
      ASoC: sof: nocodec: tidyup sof_nocodec_setup()
      ASoC: mediatek: mt8365-mt6357: tidyup mach_priv
      ASoC: amd: acp6x-mach: tidyup strange alignment
      ASoC: amd: use .auto_selectable_formats
      ASoC: codecs: pcm*: use .auto_selectable_formats
      ASoC: meson: use .auto_selectable_formats
      ASoC: spacemit: use .auto_selectable_formats
      ASoC: simple-card: move simple_parse_of()
      ASoC: simple-card: merge extra method into simple_parse_of()
      ASoC: audio-graph-card2: Tidyup audio_graph2_parse_of() around error
      ASoC: audio-graph-card: Tidyup audio_graph_parse_of() around error
      ASoC: simple_card_utils: add simple_util_parse_property()
      ASoC: simple_card_utils: add simple_util_parse_aux_devs()
      ASoC: simple-card: tidyup simple_util_parse_xxx() in simple_parse_of()
      ASoC: audio-graph-card: tidyup simple_util_parse_xxx() in audio_graph_parse_of()
      ASoC: audio-graph-card2: tidyup simple_util_parse_xxx() in audio_graph2_parse_of()
      ASoC: simple-card-utils: tidyup simple_util_init_aux_jacks()
      ASoC: simple-card-utils: tidyup simple_util_clean_reference()
      ASoC: generic: Card name parsing should be called after xxx_for_each_link()
      ASoC: amd: acp-sdw-legacy-mach: use &pdev->dev instead of card->dev
      ASoC: amd: acp-sdw-sof-mach: use &pdev->dev instead of card->dev
      ASoC: qcom: common: use dev
      ASoC: qcom: sdm845: remove unused card
      ASoC: qcom: storm: use dev instead of card on storm_parse_of()
      ASoC: mediatek: mt8192-mt6359-rt1015-rt5682: use *dev in mt8192_mt6359_card_set_be_link()
      ASoC: mediatek: common/mtk-dsp-sof-common: use for_each_card_prelinks()
      ASoC: mediatek: mt8196-nau8825: remove unnecessary declaration
      ASoC: mediatek: mt8365-mt6357: remove useless assignment
      ASoC: intel: sof_sdw: use &pdev->dev instead of card->dev
      ASoC: fsl: p1022_ds: add card_to_mdata() macro
      ASoC: fsl: p1022_rdk: add card_to_mdata() macro
      ASoC: meson: axg-card: tidyup not to use card->dev
      ASoC: meson: gx-card: tidyup not to use card->dev
      ASoC: meson: meson-card-utils: tidyup not to use card->dev
      ASoC: atmel: atmel_wm8904: use dev in atmel_asoc_wm8904_dt_init()
      ASoC: ti: omap-hdmi: remove unused *card
      ASoC: ti: tidyup not to use *card on rx51_soc_probe()
      ASoC: ti: ams-delta: use &pdev->dev instead of card->dev
      ASoC: ux500: mop500: tidyup mop500_of_probe() parameter
      ASoC: ux500: mop500_ab8500: tidyup mop500_ab8500_remove()
      ASoC: apple: use .auto_selectable_formats
      ASoC: atmel: use .auto_selectable_formats
      ASoC: au1x: use .auto_selectable_formats
      ASoC: bcm: use .auto_selectable_formats
      ASoC: cirrus: use .auto_selectable_formats
      ASoC: soc-component: move soc_component_field_shift()
      ASoC: soc-component: add snd_soc_component_alloc()
      ASoC: soc-component: add snd_soc_register_component_{c/d}()
      ASoC: soc-component: add snd_soc_component_{set_}name()
      ASoC: soc-component: add snd_soc_component_{set/to}_priv()
      ASoC: intel: avs: use snd_soc_register_component()
      ASoC: intel: avs: probes: use snd_soc_register_component()
      ASoC: intel: catpt: pcm: use snd_soc_register_component()
      ASoC: soc-generic-dmaengine-pcm: use snd_soc_register_component()
      ASoC: soc-topology-test: use snd_soc_register_component()
      ASoC: soc-core: makes snd_soc_component_initialize() / snd_soc_add_component() local
      ASoC: soc-core: remove dev from soc_component_initialize()
      ASoC: codecs: ad1*: use .auto_selectable_formats
      ASoC: codecs: adav80x: use .auto_selectable_formats
      ASoC: codecs: cros_ec_codec: use .auto_selectable_formats
      ASoC: codecs: lochnagar-sc: use .auto_selectable_formats
      ASoC: codecs: madera: use .auto_selectable_formats

Le Qi (1):
      ASoC: qcom: sc8280xp: configure codec sysclk for QCS615

Leo Tsai (1):
      ALSA: hda/cm9825: Add IBP support for DFI

LiangCheng Wang (1):
      ASoC: fsl-asoc-card: defer probe when the CPU DAI device is not ready

Lianqin Hu (1):
      ALSA: usb-audio: Add delay quirk for SPACETOUCH USB Audio

Linmao Li (2):
      ASoC: meson: Keep link pointers valid on realloc failure
      ASoC: Intel: avs: da7219: Remove redundant DAI link name allocation

Luca Castaldini (1):
      ALSA: hda/realtek: Add mute LED support for HP Pavilion 15-eh2xxx

Luca Leonardo Scorcia (1):
      ASoC: dt-bindings: mtk-btcvsd-snd: Convert to DT Schema

Maciej Strozek (2):
      ALSA: control: tidy up whitespaces
      ALSA: control: add ioctl to retrieve full card components

Marco Giunta (10):
      ASoC: aw88399: extract shared device library
      ASoC: aw88399: derive channel from I2C address on ACPI systems
      ASoC: aw88399: add per-instance BSTS status bypass flag
      ASoC: aw88399: add firmware reload flag for resume
      ASoC: aw88399: add channel setter for HDA side codec
      ACPI/platform: add AWDZ8399 to serial-multi-instantiate
      ALSA: hda/scodec: add AW88399 HDA side codec driver
      ALSA: hda/realtek: enable AW88399 on Lenovo Legion Pro
      ALSA: hda/realtek: enable AW88399 on Lenovo Legion R9000P ADR10H
      ALSA: hda/realtek: enable headset buttons on Lenovo Yoga Pro 7 14ASP10

Marek Szyprowski (1):
      ASoC: samsung: i2s: drop secondary DAI for i2sv7 hardware variant

Mark Brown (1):
      ASoC: simple-card: Fix clang build

Markus Elfring (1):
      ASoC: SOF: topology: Use more common error handling code in sof_link_load()

Martin Povi¹er (4):
      ASoC: apple: mca: Separate data & clock port setup
      ASoC: apple: mca: Factor out mca_be_get_fe
      ASoC: apple: mca: Support FEs being clock consumers
      ASoC: apple: mca: Support capture on multiples BEs

Mauricio Orozco (1):
      ALSA: hda/realtek: Add quirk for ASUS VivoBook M515DA/X515DAP

Mert Seftali (1):
      ASoC: SOF: ipc4-topology: Return error for invalid number of formats

Michal Pecio (1):
      ALSA: usx2y: Stop clearing urb->hcpriv before submission

Mohammad Rafi Shaik (3):
      ASoC: dt-bindings: qcom,q6apm-lpass-dais: Document DAI subnode
      ASoC: qcom: q6apm-lpass-dais: Add MI2S clock control
      ASoC: qcom: sc8280xp: enhance machine driver for board-specific config

Narasimharao Vadlamudi (1):
      ASoC: renesas: fsi: Propagate platform_get_irq() errors

Neil Andrews (1):
      ALSA: usb-audio: Rename the Audient iD14 monitor mix volume control

Neil Armstrong (5):
      ASoC: qcom: sc8280xp: allow setting m2is clocks for SM8[456]50 boards
      ASoC: qcom: audioreach: compute active channel maps from channel_map
      ASoC: dt-bindings: qcom,sm8250: Add Ayaneo Pocket S2 sound card
      ASoC: qcom: sc8280xp: add Ayaneo Pocket S2 card with special WSA channel mapping
      ASoC: qcom: qdsp6: q6prm: add the missing MCLK clock IDs

Nickolay Goppen (1):
      ASoC: dt-bindings: qcom,sm8250: add compatible for sdm660

Ninad Naik (1):
      ALSA: docs: fix dead link to Intel HD-audio spec

Niranjan H Y (2):
      ASoC: tac5xx2-sdw: add rev_id 0x30 support
      ASoC: tac5xx2-sdw: remove firmware check restriction

Nícolas F. R. A. Prado (1):
      ALSA: hda: Force resume if acomp notified during system suspend

Padhia Luo (1):
      ALSA: hda/realtek: Fix speaker mute LED on Lenovo ThinkBook 14 G8+ IPH

Pengpeng Hou (41):
      ASoC: sma1303: remove fault-check sysfs group on remove
      ASoC: tlv320aic26: remove keyclick sysfs file
      ASoC: codecs: max98390: Propagate regcache_sync() errors
      ASoC: codecs: cs42l42-sdw: Propagate regcache_sync() errors
      ASoC: codecs: max98927: Propagate regcache_sync() errors
      ASoC: codecs: uda1342: Leave cache-only mode before syncing
      ASoC: codecs: max98363: Propagate regcache_sync() errors
      ASoC: codecs: max98373-sdw: Propagate regcache_sync() errors
      ASoC: codecs: pm4125-sdw: Propagate regcache_sync() errors
      ASoC: codecs: rt5645: Propagate regcache_sync() errors
      ASoC: codecs: wcd937x-sdw: Propagate regcache_sync() errors
      ASoC: codecs: wcd939x-sdw: Propagate regcache_sync() errors
      ASoC: codecs: wsa883x: Propagate regcache_sync() errors
      ASoC: codecs: wsa884x: Propagate regcache_sync() errors
      ASoC: codecs: rt712-sdca-dmic: Propagate regcache_sync() errors
      ASoC: codecs: rt712-sdca-sdw: Propagate regcache_sync() errors
      ASoC: codecs: rt721-sdca-sdw: Propagate regcache_sync() errors
      ASoC: codecs: rt1017-sdca-sdw: Propagate regcache_sync() errors
      ASoC: codecs: rt1316-sdw: Propagate regcache_sync() errors
      ASoC: codecs: rt722-sdca-sdw: Propagate regcache_sync() errors
      ASoC: codecs: wsa881x: Propagate regcache_sync() errors
      ASoC: codecs: rt5514: Propagate bias restore errors
      ASoC: codecs: lpass-rx-macro: Propagate regcache_sync() errors
      ASoC: codecs: lpass-tx-macro: Propagate regcache_sync() errors
      ASoC: codecs: max98373: Propagate regcache_sync() errors
      ASoC: codecs: max98388: Propagate regcache_sync() errors
      ASoC: codecs: rt1318-sdw: Propagate regcache_sync() errors
      ASoC: codecs: rt9120: Propagate regcache_sync() errors
      ASoC: codecs: tas2552: Propagate regcache_sync() errors
      ASoC: codecs: tas2783-sdw: Propagate regcache_sync() errors
      ASoC: codecs: wcd938x-sdw: Propagate regcache_sync() errors
      ASoC: codecs: cs35l32: Propagate regcache_sync() errors
      ASoC: codecs: wm2200: Propagate regcache_sync() errors
      ASoC: codecs: wm5100: Propagate regcache_sync() errors
      ASoC: codecs: wm8962: Propagate regcache_sync() errors
      ASoC: codecs: cs4349: Propagate regcache_sync() errors
      ASoC: codecs: rt1320-sdw: Propagate regcache_sync() errors
      ASoC: codecs: rt5682-sdw: Propagate regcache_sync() errors
      ASoC: codecs: max98396: Unwind supplies on resume failure
      ASoC: codecs: max98090: Propagate runtime regcache_sync() errors
      ASoC: SOF: validate topology volume range before allocation

Peter Ujfalusi (46):
      ASoC: SOF: ipc4: Add decoder for RESOURCE_EVENT notifications from firmware
      ASoC: SOF: Intel: hda-stream: clear hstream->running flag in hw_params
      ASoC: SOF: Intel: hda: Power down DSP if it is left enabled in pre_fw_run()
      ASoC: SOF: Intel: mtl: Power down DSP if it is left enabled in pre_fw_run()
      ASoC: SOF: Intel: hda: Fold mlink enumeration into hda_dsp_ctrl_init_chip()
      ASoC: SOF: Intel: hda: Keep non-alt mlinks powered at probe on ACE2+
      ASoC: SOF: Intel: hda: Remove unused hda_bus_ml_put_all()
      ASoC: SOF: Intel: hda: Avoid ACE2+ link DMA stream allocation hazards
      ASoC: SOF: ipc4-topology: Store the params change between input/output of a module
      ASoC: SOF: ipc4-topology: Correct the process module's output lookup
      ASoC: SOF: ipc4-topology: Update the pipeline_params of prepared modules
      ASoC: adau1761: sort the register default table
      ASoC: rt274: sort the register default table
      ASoC: rt286: sort the register default table
      ASoC: rt298: sort the register default table
      ASoC: rt700: drop duplicate reg_default entry
      ASoC: rt700: sort the register default table
      ASoC: rt711: sort the register default table
      ASoC: rt711-sdca: sort the register default tables
      ASoC: rt712-sdca-dmic: sort the register default table
      ASoC: rt712-sdca-sdw: sort the register default table
      ASoC: rt715: sort the register default table
      ASoC: rt715-sdca: drop duplicate reg_default entries
      ASoC: rt715-sdca: sort the register default tables
      ASoC: rt721-sdca-sdw: sort the register default table
      ASoC: rt1017-sdca-sdw: sort the register default table
      ASoC: rt1316-sdw: sort the register default table
      ASoC: rt1318: sort the register default table
      ASoC: rt1318-sdw: sort the register default table
      ASoC: pm4125-sdw: sort the register default table
      ASoC: tas2783-sdw: drop duplicate reg_default entry
      ASoC: tas2783-sdw: sort the register default table
      ASoC: pcm512x: sort the register default table
      ASoC: tas2552: sort the register default table
      ASoC: tas2764: sort the register default table
      ASoC: tas2780: sort the register default table
      ASoC: tas675x: sort the register default table
      ASoC: sgtl5000: sort the register default table
      ASoC: fsl_easrc: sort the register default table
      ASoC: tegra210_i2s: sort the register default table
      ASoC: tegra210_i2s: sort the Tegra264 register default table
      ASoC: tegra210_mixer: sort the register default table
      ASoC: ml26124: sort the register default table
      ASoC: cx2072x: sort the register default table
      ASoC: max9860: sort the register default table
      ASoC: sti-sas: sort the register default table

Prasad Kumpatla (17):
      ASoC: qcom: qdsp6: Remove unused Q6AFE_MAX_CLK_ID define
      ASoC: dt-bindings: qcom,sm8250: Add Hawi sound card
      ASoC: qcom: sc8280xp: Add support for Hawi
      ASoC: dt-bindings: qcom: add LPASS LPR vote clock ID
      ASoC: qcom: qdsp6: Increase Q6DSP_MAX_CLK_ID for LPASS LPR vote clock
      ASoC: qcom: q6prm: add support for LPASS LPR resource voting
      ASoC: dt-bindings: qcom,wsa8855: add Qualcomm WSA8855 speaker amplifier
      ASoC: codecs: add Qualcomm WSA885X codec driver
      ASoC: qcom: qdsp6: add topology-driven Audio IF support
      ASoC: qcom: q6apm-lpass-dais: add TDM DAI operations
      dt-bindings: sound: qcom,q6dsp-lpass-ports: add Audio IF clocks
      ASoC: qcom: q6prm: add Audio IF clock IDs
      dt-bindings: sound: qcom,sm8250: allow TDM slot properties
      ASoC: qcom: common: add DAI-node TDM slot helpers
      ASoC: qcom: sc8280xp: add TDM hw_params support
      ASoC: dt-bindings: qcom,sm8250: Add Maili sound card
      ASoC: qcom: sc8280xp: Add Maili sound card support

Randy Dunlap (16):
      ALSA: ac97: use struct keyword for kernel-doc comments
      ALSA: hda: regmap: fix all kernel-doc warnings
      ALSA: firewire: fix all kernel-doc warnings
      ALSA: usb-audio: um144mkii: use "var" keyword for data
      ASoC: SOF: don't use "/**" for non-kernel-doc comments
      ASoC: SOF: ipc4-topology: repair struct kernel-doc comments
      ASoC: codecs: NeoFidelity: repair the kernel-doc format
      ASoC: fsl_asrc: avoid kernel-doc warnings
      ASoC: fsl-dma: fix all kernel-doc warnings
      ASoC: fsl_easrc: use struct keyword on structs
      ASoC: fsl: mpc5200_psc_i2s: avoid kernel-doc warnings
      ASoC: uniphier: don't use "/**" for non-kernel-doc comment
      ASoC: SDCA: correct enum names and add a missing struct field
      ASoC: soc-acpi: fix all kernel-doc warnings
      ASoC: qcom: audioreach: use C-style "/*" comment
      ASoC: wm8904: don't use "/**" for non-kernel-doc comments

Richard Acayan (11):
      ASoC: dt-bindings: qcom: q6dsp: add support for lpi mi2s ports 5-6
      ASoC: dt-bindings: pm8916-analog-codec: Add PM660L compatible
      ASoC: dt-bindings: msm8916-digital-codec: Add SDM660 compatible
      ASoC: qdsp6: q6dsp-lpass-ports: add support for lpi mi2s ports 5-6
      ASoC: qdsp6: q6afe: add internal mi2s support
      ASoC: qdsp6: q6afe-dai: add internal mi2s support
      ASoC: qdsp6: q6routing: add lpi mi2s support
      ASoC: qdsp6: common: support headphone jacks connected to lpi mi2s
      ASoC: qcom: sm8250: add support for LPI_MI2S_RX_0 and LPI_MI2S_TX_3
      ASoC: qcom: sm8250: add SDM660 compatible
      ASoC: msm8916-wcd-analog: add quirk for cajon 2.0

Richard Fitzgerald (7):
      ASoC: cs35l56: Remove unnecessary goto in cs35l56_runtime_resume_common()
      ASoC: cs35l56: Sort table of sdw_device_id
      firmware: cs_dsp: Fix mock register default typo in KUnit test
      ASoC: cs35l56: Request IRQ in cs35l56_common_probe()
      ASoC: cs35l56: Move cs35l56_irq_request() after cs35l56_irq()
      soundwire: bus_type: Create IRQ mapping before calling driver probe()
      ASoC: cs35l56: Use IRQ provided by the SoundWire core

Rosen Penev (12):
      ASoC: mediatek: mt2701: add COMPILE_TEST
      ALSA: sis7019: Use pcim_iomap_region() for MMIO BAR
      ALSA: atmel: ac97c: use platform helpers and devm cleanup
      ASoC: fsl: mpc5200_dma: use platform helpers and devm cleanup
      ASoC: fsl: dma: use platform helpers and devm cleanup
      ASoC: amd: acp: Use pcim_iomap_region() in acp-pci
      ASoC: xilinx: replace OF with device handlers
      ASoC: amd: acp: return irq error directly
      ALSA: pci: asihpi: use pcim_iomap for managed PCI memory mapping
      ASoC: xilinx: formatter_pcm: fix stream_data leak on open error
      ASoC: mediatek: mt8365: use devm_platform_ioremap_resource helpers
      ASoC: amd: acp: pass audio_drv_data to dma_irq_handler

Runyu Xiao (3):
      ASoC: rt700-sdw: always drain jack work on remove
      ASoC: cs35l33: drain threaded IRQ before runtime suspend
      ASoC: cs35l34: drain threaded IRQ before runtime suspend

Sang-Heon Jeon (5):
      ASoC: remove conditional return with no effect
      ASoC: amd: acp: remove conditional return with no effect
      ASoC: Intel: atom: remove conditional return with no effect
      ASoC: samsung: smdk_spdif: remove conditional return with no effect
      ASoC: SOF: Intel: remove conditional return with no effect

Sean Rhodes (2):
      ALSA: hda/realtek: Limit Star Labs internal mic boost
      ALSA: hda/realtek: Add StarFighter HDA SSID

Seppo Ingalsuo (1):
      ASoC: dapm: Add encoder and decoder widget types to kcontrol handling

Shang En Sim (1):
      ALSA: hda/realtek: Enable mute LEDs on HP Spectre x360 16-aa0xxx

Shenghao Ding (4):
      ASoC: tas2781: Optimize calibration to avoid full device reboot after calibration
      ASoC: tas2781: add capture_profile_id field and update the tuning_switch function
      ASoC: tas2781: Fix compiling warning for tasdevice_set_capture_profile_id()
      ASoC: tas2781: Refactor calibration start kcontrol creation to separate helper

Shengjiu Wang (2):
      ASoC: fsl_audmix: rework runtime PM handling in probe
      ASoC: fsl_easrc: fix missing return on success in runtime_resume

Shuming Fan (6):
      ASoC: rt1321: move DSP status checking into a helper function
      ASoC: rt1321: add support for rt1321 VA1/VA2
      ASoC: SDCA: export sdca_find_entity_by_label() helper
      ASoC: SDCA: export sdca_asoc_populate_rate_format() helper
      ASoC: rt722: reinitialize rt722_sdca_jack_init() after reset
      ASoC: rt766: add RT766/RT767 SDCA driver

Srinivas Kandagatla (3):
      ASoC: qcom: sc8280xp: tolerate -ENOTSUPP from codec set_sysclk
      ASoC: qcom: sc8280xp: rename snd_soc_common to qcom_snd_soc_common
      ASoC: qcom: sc8280xp: add monaco/monza controls for qcs8275

Stefan Binding (2):
      ASoC: cs35l56: Add support for CS35L62 for SoundWire
      ASoC: sdw_utils: Add codec info for CS35L62

Takashi Iwai (89):
      ALSA: pcm: Notify disconnected state at mmap data fault, too
      ALSA: dummy: Use the standard PCM sync_stop callback for hrtimer
      ALSA: dummy: Implement sync_stop for systimer, too
      ALSA: dummy: Properly shutdown the systimer at freeing
      ALSA: docs: Add description of usb-audio playback_urb_fixup quirk
      ALSA: usb-audio: Extend quirk_flags to 64bit
      ALSA: usb-audio: Make some quirk-string helpers local
      ALSA: hda: Drop unneeded calculation of index at get_jack_mode_name()
      ALSA: hda: Drop index handling from snd_hda_get_pin_label()
      ALSA: hda: Add hda_append_suffix() local helper
      ALSA: 6fire: Use auto-cleanup for firmware loading
      ALSA: hda: ca0132: Use auto-cleanup for firmware loading
      ALSA: hda: intel: Use auto-cleanup for firmware loading
      ALSA: msnd: Use auto-cleanup for firmware loading
      ALSA: hda: cs35l41: Use auto-cleanup for firmware loading
      ALSA: hda: cs35l56: Use auto-cleanup for firmware loading
      ALSA: sscape: Use auto-cleanup for firmware loading
      ALSA: wavefront: Use auto-cleanup for firmware loading
      ALSA: asihpi: Use auto-cleanup for firmware loading
      ALSA: cs46xx: Use auto-cleanup for firmware loading
      ALSA: korg1212: Use auto-cleanup for firmware loading
      ALSA: mixart: Use auto-cleanup for firmware loading
      ALSA: pcxhr: Use auto-cleanup for firmware loading
      ALSA: sh: Use auto-cleanup for firmware loading
      ASoC: sdw_utils: Use auto-cleanup for put_device()
      ALSA: hda: aw88399: Use auto-cleanup for put_device()
      ALSA: hda: tas2781: Use auto-cleanup for put_device()
      ALSA: hda: cs35l41: Use auto-cleanup for put_device()
      ALSA: dummy: Check card index validity at probe
      ALSA: rawmidi: Work around false-positive mutex lockdep warning
      ALSA: hda: cix-ipbloq: Avoid build with 32bit archs
      ALSA: aloop: Check card index validity at probe
      ALSA: mpu401: Check card index validity at probe
      ALSA: serial-u16550: Check card index validity at probe
      ALSA: virmidi: Check card index validity at probe
      ALSA: mts64: Check card index validity at probe
      ALSA: portman2x4: Check card index validity at probe
      ASoC: aw87390: Use auto-cleanup for firmware loading
      ASoC: aw88081: Use auto-cleanup for firmware loading
      ASoC: aw88166: Use auto-cleanup for firmware loading
      ASoC: aw88261: Use auto-cleanup for firmware loading
      ASoC: aw88395: Use auto-cleanup for firmware loading
      ASoC: aw88399: Use auto-cleanup for firmware loading
      ASoC: fs-amp-lib: Use auto-cleanup for firmware loading
      ASoC: hdac_hda: Use auto-cleanup for firmware loading
      ASoC: max98390: Use auto-cleanup for firmware loading
      ASoC: ntpfw: Use auto-cleanup for firmware loading
      ASoC: pcm6240: Use auto-cleanup for firmware loading
      ASoC: peb2466: Use auto-cleanup for firmware loading
      ASoC: rt1320-sdw: Use auto-cleanup for firmware loading
      ASoC: rt5575: Use auto-cleanup for firmware loading
      ASoC: rt5677: Use auto-cleanup for firmware loading
      ASoC: rt722-sdca: Use auto-cleanup for firmware loading
      ASoC: sigmadsp: se auto-cleanup for firmware loading
      ASoC: sma1307: Use auto-cleanup for firmware loading
      ASoC: tas2781: Use auto-cleanup for firmware loading
      ASoC: tas5805m: Use auto-cleanup for firmware loading
      ASoC: tlv320aic31xx: Use auto-cleanup for firmware loading
      ASoC: wm0010: Use auto-cleanup for firmware loading
      ASoC: wm2000: Use auto-cleanup for firmware loading
      ASoC: zl38060: Use auto-cleanup for firmware loading
      ASoC: fsl: Use auto-cleanup for firmware loading
      ASoC: Intel: avs: Use auto-cleanup for firmware loading
      ASoC: Intel: catpt: Use auto-cleanup for firmware loading
      ASoC: qcom: Use auto-cleanup for firmware loading
      ASoC: renesas: Use auto-cleanup for firmware loading
      ASoC: SDCA: Use auto-cleanup for firmware loading
      ASoC: SOF: Use auto-cleanup for firmware loading
      ALSA: seq: Use RCU for the port subscriber list
      ALSA: seq: Use RCU for the client port list
      ALSA: seq: Use RCU for the client table
      ALSA: seq: Use RCU for the virmidi file list
      ALSA: seq: Use RCU for the UMP client output substream
      ALSA: uapi: Drop __bitwise and __force prefix
      ALSA: pcm: Drop __force casts
      ALSA: pcm: Avoid macros for SNDRV_PCM_FMTBIT and SNDRV_PCM_SUBFMTBIT
      ALSA: control: Drop __force casts
      ALSA: oss: Drop __force casts
      ALSA: kunit: Drop __force casts
      ALSA: aloop: Drop __force casts
      ALSA: hda: Drop __force casts
      ALSA: asihpi: Drop __force cast
      ALSA: emu10k1: Drop __force casts
      ASoC: fsl: Drop __force casts
      ASoC: Intel: avs: Drop __force cast
      ASoC: mediatek: Drop __force casts
      ASoC: meson: Drop __force cast
      ALSA: seq: midi: Optimize event_input locking with RCU
      ALSA: hda/intel: Add sanity check for BAR0 size

Trevor Vorhees (1):
      ALSA: usb-audio: Fix sample rates for PreSonus AudioBox USB

Troy Mitchell (2):
      ASoC: spacemit: rename clock inputs to match binding
      ASoC: dt-bindings: sound: spacemit,k1-i2s: allow 6 clocks for K3 i2s1

Uwe Kleine-König (The Capable Hub) (6):
      ASoC: codecs: mt6357: Drop unused assignment of platform_device_id driver data
      ASoC: renesas: fsi: Drop platform probing metadata
      ASoC: amd: acp: Use named initializers for platform_device_id arrays
      ASoC: amd: acp: Unify code style for platform_device_id array
      ASoC: Use named initializers for platform_device_id arrays
      ASOC: Unify code style for platform_device_id arrays

Valerio Setti (8):
      ASoC: meson: gx: add gx-formatter and gx-interface
      ASoC: meson: aiu-encoder-i2s: prepare for multiple streams
      ASoC: meson: aiu: introduce I2S output formatter
      ASoC: meson: aiu: use aiu-formatter-i2s to format I2S output data
      ASoC: meson: aiu-formatter-i2s: remove pipeline reset from prepare
      ASoC: meson: aiu-encoder-i2s: fix bs quirk incompatibility check
      ASoC: meson: aiu-encoder-i2s: reflect bs quirk in hw constraints
      ASoC: meson: aiu-encoder-i2s: use the core symmetric_rate handling

Vijendar Mukunda (17):
      ASoC: amd: acp: add ACPI machine table for ACP7.B/7.F SOF driver
      ASoC: SOF: amd: add base platform support for ACP7.B/7.F
      ASoC: SOF: amd: mask ACP7x PGFSM status poll
      ASoC: SOF: amd: refactor SW1 I2S error reason clear in acp_irq_handler
      ASoC: SOF: amd: add ACP7x probe and remove
      ASoC: SOF: amd: add ACP7x IRQ handler for DSP IPC
      ASoC: SOF: amd: extend signed firmware pre-run for ACP7x
      ASoC: SOF: amd: require full ACP header for ACP7 signed firmware
      ASoC: SOF: amd: validate SizeFWSigned before signed FW length on ACP7x
      ASoC: SOF: amd: add post-firmware-run delay for ACP7x
      ASoC: SOF: amd: extend configure_and_run_sha_dma for ACPI signed FW flag
      ASoC: SOF: amd: wire signed firmware load callback for ACP7x via ACPI
      ASoC: SOF: amd: load ACP7.B/7.F signed data firmware to SRAM
      ASoC: SOF: amd: add ACP I2S format field and topology token
      ASoC: SOF: amd: add ACP7x I2S DAI type and topology support
      ASoC: SOF: amd: add system and runtime PM ops for ACP7x
      ASoC: SOF: amd: add missing blank line between Kconfig entries

Ville Saarinen (2):
      ASoC: amd: acp-config: force SoundWire probe on HP OmniBook X Flip 14
      ASoC: amd: acp70: add HP OmniBook X Flip 14 SoundWire machine

Vladimir Lypak (1):
      ASoC: msm8916-wcd-analog: add pm8953 codec

WenTao Liang (1):
      ASoC: samsung: aries_audio_probe: double of_node_put due to direct assignment without of_node_get

Xu Rao (3):
      ALSA: hda/ext: preserve PPLCCTL bits when clearing reset
      ALSA: hda: Add Lisuan HDMI controller and codec support
      ALSA: hda: Fix connection list comparison in proc output

Yashraj Ghule (1):
      ALSA: hda/realtek: Fix mute LED for HP Victus 15-fa1xxx (MB 8C3F)

Yu-Hsuan Hsu (3):
      ALSA: aloop: Add 'hrtimer' option to timer_source
      ASoC: SOF: Use high-priority workqueue for PCM period elapsed
      ALSA: aloop: Fix spinlock deadlock in loopback_hrtimer_stop()

Zeliang Li (1):
      ALSA: hda/tas2781: Add hardware stabilization delay during firmware load retries

Zhang Heng (13):
      ALSA: usb-audio: Fix boot-time audio stuttering for USB Audio device
      ALSA: hda/realtek: Merge duplicate quirk entries for ASUS Strix G615
      ALSA: hda/realtek: Merge duplicate quirk entries for ASUS UM6702RA/RC
      ALSA: hda/realtek: Add quirk for Acer Nitro ANV16-42 headset mic
      ALSA: hda/realtek: Add quirk for Acer Gadget E10 ETBook left speaker
      ALSA: hda/realtek: Fix headset mic on ASUS Vivobook S14 S5406SA
      ALSA: hda/conexant: Add pin config quirk for Huawei Matebook
      ALSA: hda/realtek: Add quirk for Acer Predator PH16-71
      ALSA: hda/realtek: Add quirk for Lenovo Legion Pro 5 16ADR10
      ALSA: usb-audio: Fix popping noise on Valeton GP-200
      ALSA: hda/realtek: Rename Line Out control to Headphone on ThinkPad X1 Carbon 6th
      ALSA: hda/realtek: Drop duplicate quirk for Lenovo 0x17aa:0x38df
      ALSA: hda/realtek: Fix Lenovo Yoga Slim 7 14AKP10 quirk ordering

Zhang Yi (6):
      ASoC: codecs: ES8389: Modify volatile_register
      ASoC: codecs: ES8389: Fix the issue about mclk_src
      ASoC: codecs: ES8389: Modify the clock table
      ASoC: codecs: ES8389: Modify the initial configuration
      ASoC: codecs: ES8389: Add private members about HPF
      ASoC: codecs: ES8389: Add INPUTL MUX and INPUTR MUX

Zhao Dongdong (1):
      ALSA: hda/core: add cleanup in snd_hdac_bus_alloc_stream_pages()

bui duc phuc (182):
      ASoC: meson: Use dev_err_probe() for device reset failures
      ASoC: fsl_asrc: Use guard() for spin locks
      ASoC: fsl_audmix: Use guard() for spin locks
      ASoC: fsl_easrc: Use guard() for spin locks
      ASoC: fsl_esai: Use guard() for spin locks
      ASoC: fsl_spdif: Use guard() for spin locks
      ASoC: fsl_ssi: Use guard() for mutex locks
      ASoC: fsl_xcvr: Use guard() for spin locks
      ASoC: imx-audio-rpmsg: Use guard() for spin locks
      ASoC: fsl_rpmsg: Use guard() for mutex & spin locks
      ASoC: fsl: mpc5200_dma: Use guard() for spin locks
      ASoC: fsl: mpc5200_psc_ac97: Use guard() for mutex locks
      ASoC: Intel: avs: Use guard() for locking
      ASoC: Intel: avs: Use scoped_guard() for scoped locking
      ASoC: intel: atom: Use __free(kfree) for stream pointer
      ASoC: Intel: atom: Use guard() for locking
      ASoC: Intel: atom: Use scoped_guard() for scoped locking
      ASoC: samsung: i2s: Avoid mixing goto with guard()
      ASoC: ti: j721e-evm: Avoid mixing goto with guard()
      ASoC: samsung: spdif: Preserve the original clock acquisition error
      ALSA: control: Drop redundant stream_open() return check
      ALSA: mixer: oss: Drop redundant nonseekable_open() return check
      ALSA: pcm: oss: Drop redundant nonseekable_open() return check
      ALSA: pcm: Drop redundant nonseekable_open() return check
      ALSA: rawmidi: Drop redundant stream_open() return check
      ALSA: seq: Drop redundant stream_open() return check
      ALSA: timer: Drop redundant stream_open() return check
      ALSA: core: propagate actual error code from register_chrdev
      ASoC: samsung: i2s: Use dev_err_probe() for iis clock error
      ALSA: core: use ARRAY_SIZE() in snd_minor_info_read()
      ALSA: control: Return -ENODEV instead of -EFAULT in snd_ctl_open()
      ALSA: hwdep: Return -ENODEV instead of -EFAULT in snd_hwdep_open()
      ALSA: info: Return -ENODEV instead of -EFAULT in alloc_info_private()
      ALSA: mixer: oss: Return -ENODEV instead of -EFAULT in snd_mixer_oss_open()
      ALSA: pcm: oss: Return -ENODEV instead of -EFAULT in snd_pcm_oss_open()
      ALSA: pcm: Return -ENODEV instead of -EFAULT in snd_pcm_open()
      ALSA: control: preserve snd_card_file_add() error code in snd_ctl_open()
      ASoC: xtensa: Use dev_err_probe() and drop redundant error handling
      ASoC: xilinx: xlnx_i2s: Use dev_err_probe() and drop redundant error handling
      ASoC: xilinx: xlnx_spdif: Preserve devm_request_irq() error codes
      ASoC: xilinx: xlnx_spdif: Use dev_err_probe() and drop redundant error handling
      ALSA: core: Clean up file_operations definitions
      ASoC: codecs: ab8500: Use guard() for mutex locks
      ASoC: codecs: ak4613: Use guard() for mutex locks
      ASoC: codecs: arizona-jack: Use guard() cleanup helpers
      ASoC: codecs: arizona: Use guard() for mutex locks
      ASoC: codecs: aw87390: Use guard() for mutex locks
      ASoC: codecs: aw88081: Use guard() for mutex locks
      ASoC: codecs: aw88166: Use guard() for mutex locks
      ASoC: codecs: aw88261: Use guard() for mutex locks
      ASoC: codecs: aw88395: Use guard() for mutex locks
      ASoC: codecs: aw88399: Use guard() for mutex locks
      ASoC: codecs: cros_ec_codec: Use guard() for mutex locks
      ASoC: codecs: cs-amp-lib: Use guard() for mutex locks
      ASoC: codecs: cs35l56: Use guard() and PM runtime scope helpers
      ASoC: codecs: cs42l42: Use guard() cleanup helpers
      ASoC: codecs: cs42l43: Use guard() and PM runtime scope helpers
      ASoC: codecs: cs42l84: Use guard() for mutex locks
      ASoC: codecs: cs43130: Use guard() for mutex locks
      ASoC: codecs: cs47l15: Use guard() for mutex locks
      ASoC: codecs: cs47l35: Use guard() for mutex locks
      ASoC: codecs: cs47l85: Use guard() for mutex locks
      ASoC: codecs: cs47l90: Use guard() for mutex locks
      ASoC: codecs: cs47l92: Use guard() for mutex locks
      ASoC: codecs: cs48l32: Use guard() for mutex locks
      ASoC: codecs: cx2072x: Use guard() for mutex locks
      ASoC: tegra: tegra20_das: Use dev_err_probe() for error handling
      ASoC: tegra: tegra210_adx: Return the original error directly
      ASoC: tegra: tegra210_amx: Return the original error directly
      ASoC: tegra: tegra210: Use devm_clk_get_optional() for sync_input clock
      ASoC: uniphier: Drop redundant error messages in probe
      ASoC: codecs: da7213: Use guard() for mutex locks
      ASoC: codecs: da7219: Use guard() for mutex locks
      ASoC: codecs: es8316: Use guard() for mutex locks
      ASoC: codecs: es8326: Use guard() for mutex locks
      ASoC: codecs: es9356: Use guard() for mutex locks
      ASoC: codecs: fs210x: Use guard() for mutex locks
      ASoC: codecs: hdac_hdmi: Use guard() for mutex locks
      ASoC: codecs: hdmi-codec: Use guard() for mutex locks
      ASoC: codecs: idt821034: Use guard() for mutex locks
      ASoC: codecs: lpass-macro: Use guard() for mutex locks
      ASoC: codecs: madera: Use guard() for mutex locks
      ASoC: codecs: max98095: Use guard() for mutex locks
      ASoC: codecs: mt6359-accdet: Use guard() for mutex locks
      ASoC: codecs: pcm512x: Use guard() for mutex locks
      ASoC: codecs: pcm6240: Use guard() for mutex locks
      ASoC: codecs: peb2466: Use guard() for mutex locks
      ASoC: codecs: rt5514-spi: Use guard() for mutex locks
      ASoC: codecs: rt5645: Use guard() for mutex locks
      ASoC: codecs: rt5665: Use guard() for mutex locks
      ASoC: codecs: rt5668: Use guard() for mutex locks
      ASoC: codecs: rt5677: Use guard() for mutex locks
      ASoC: codecs: rt5682: Use guard() for mutex locks
      ASoC: codecs: rt700: Use guard() for mutex locks
      ASoC: codecs: rt711: Use guard() for mutex locks
      ASoC: codecs: rt712-sdca-sdw: Simplify regcache error handling in resume
      ASoC: codecs: rt712: Use guard() for mutex locks
      ASoC: codecs: rt721-sdca-sdw: Simplify regcache error handling in resume
      ASoC: codecs: rt721: Use guard() for mutex locks
      ASoC: codecs: rt722: Use guard() for mutex locks
      ASoC: soc-generic-dmaengine: Handle DMA channel request failures correctly
      ASoC: ti: ams-delta: Use dev_err_probe() for error handling
      ASoC: ti: davinci-evm: Use dev_err_probe() for error handling
      ASoC: ti: j721e-evm: Return the original error from card name parsing
      ASoC: ti: omap-abe-twl6040: Preserve error code and drop redundant log
      ASoC: ti: omap-abe-twl6040: Use dev_err_probe() for error handling
      ASoC: ti: omap-dmic: Use dev_err_probe() for error handling
      ASoC: ti: omap-hdmi: Use dev_err_probe() for error handling
      ASoC: ti: omap-twl4030: Return the original error code
      ASoC: ti: omap-twl4030: Use dev_err_probe() for error handling
      ASoC: ti: rx51: Use dev_err_probe() for error handling
      ASoC: sunxi: sun4i-codec: Use dev_err_probe() for probe error handling
      ASoC: sunxi: sun4i-codec: Drop redundant error messages
      ASoC: sunxi: sun4i-i2s: Use dev_err_probe() for probe error handling
      ASoC: sunxi: sun4i-spdif: Use dev_err_probe() for probe error handling
      ASoC: sunxi: sun50i-codec-analog: Improve probe error handling
      ASoC: sunxi: sun8i-codec-analog: Improve probe error handling
      ASoC: stm: stm32_adfsdm: Drop redundant error message
      ASoC: stm: stm32_i2s: Drop redundant error messages
      ASoC: stm: stm32_sai_sub: Drop redundant error messages
      ASoC: stm: stm32_spdifrx: Drop redundant error messages
      ASoC: starfive: jh7110-pwmdac: Remove unnecessary goto
      ASoC: starfive: jh7110-pwmdac: Drop redundant error messages
      ASoC: starfive: jh7110_tdm: Remove unnecessary goto
      ASoC: starfive: jh7110_tdm: Drop redundant error messages
      ASoC: sprd: sprd-mcdt: Drop redundant error messages
      ASoC: sprd: sprd-pcm-dma: Drop redundant error messages
      ASoC: codecs: sigmadsp: Use guard() for mutex locks
      ASoC: codecs: sta350: Use guard() for mutex locks
      ASoC: codecs: sta32x: Use guard() for mutex locks
      ASoC: codecs: tas2781: Use guard() for mutex locks
      ASoC: codecs: tas2783: Use guard() for mutex locks
      ASoC: codecs: tas5805m: Use guard() for mutex locks
      ASoC: codecs: tlv320dac33: Use guard() for mutex & spin locks
      ASoC: codecs: tscs42xx: Use guard() for mutex locks
      ASoC: codecs: tscs454: Use guard() for mutex locks
      ASoC: codecs: twl6040: Use guard() for mutex locks
      ASoC: codecs: wcd934x: Use guard() for mutex locks
      ASoC: codecs: wcd937x: Use guard() for mutex locks
      ASoC: codecs: wcd938x: Use guard() for mutex locks
      ASoC: codecs: wcd939x: Use guard() for mutex locks
      ASoC: codecs: wm0010: Use guard() for mutex & spin locks
      ASoC: codecs: wm2000: Use guard() for mutex locks
      ASoC: codecs: wm5102: Use guard() for mutex locks
      ASoC: codecs: wm8731: Use guard() for mutex locks
      ASoC: codecs: wm8903: Use guard() for mutex locks
      ASoC: codecs: wm8958: Use guard() for mutex locks
      ASoC: codecs: wm8962: Use guard() for mutex locks
      ASoC: codecs: wm8994: Use guard() for mutex locks
      ASoC: codecs: wm971x: Use guard() for mutex locks
      ASoC: codecs: wm_adsp: Use guard() for mutex locks
      ASoC: codecs: wsa88xx: Use guard() for mutex locks
      ASoC: spear: spdif_in: Drop redundant error messages
      ASoC: spear: spdif_in: Switch to snd_soc_dai_dma_data_set_capture()
      ASoC: spear: spdif_in: Move DAI probe callback to snd_soc_dai_ops
      ASoC: spear: spdif_out: Move DAI probe callback to snd_soc_dai_ops
      ASoC: spacemit: Drop redundant error messages
      ASoC: sophgo: Drop redundant error messages
      ASoC: sophgo: remove unneeded devm_kmemdup() for DAI driver
      ASoC: dwc: Propagate -EPROBE_DEFER from IRQ lookup
      ASoC: Intel: KMB: Propagate -EPROBE_DEFER from IRQ lookup
      ASoC: ti: omap-twl4030: Check for missing card name after parsing
      ASoC: pxa: Use devm_clk_get_optional() for extclk clock
      ASoC: pxa: Drop redundant probe error messages
      ASoC: mxs-saif: Use dev_err_probe() for error handling
      ASoC: mxs-saif: Drop redundant probe error messages
      ASoC: mxs-sgtl5000: Drop redundant probe error messages
      ASoC: spacemit: advertise only DMA-backed DAI streams
      ASoC: rockchip: rk3288_hdmi_analog: Drop redundant probe error messages
      ASoC: rockchip: rk3288_hdmi_analog: Use dev_err_probe() for error handling
      ASoC: rockchip: rockchip_i2s: Use dev_err_probe() for error handling
      ASoC: rockchip: rockchip_i2s: Drop redundant probe error messages
      ASoC: rockchip: rockchip_i2s: Propagate -EPROBE_DEFER from devm_pinctrl_get()
      ASoC: rockchip: i2s-tdm: Inline PTR_ERR() in dev_err_probe()
      ASoC: rockchip: i2s-tdm: Drop redundant probe error messages
      ASoC: rockchip: rockchip_max98090: Drop redundant probe error messages
      ASoC: rockchip: rockchip_pdm: Drop redundant probe error messages
      ASoC: rockchip: rockchip_rt5645: Drop redundant probe error messages
      ASoC: rockchip: rockchip_sai: Propagate -EPROBE_DEFER from IRQ lookup
      ASoC: rockchip: rockchip_sai: Return the original error code
      ASoC: rockchip: rockchip_sai: Drop redundant probe error messages
      ASoC: rockchip: spdif: Return the original error code

shaikh.kamal (1):
      ASoC: dt-bindings: fix spelling errors

wangdicheng (4):
      ASoC: mediatek: mt8189: Remove redundant else-if branch with identical body
      ASoC: fsl_easrc: Use div64_u64 for 64-by-64 division
      ALSA: sparc/dbri: Fix "possible condition with no effect" warning
      ALSA: hda/conexant: Add NULL check for dc_mode_path

---
 .../bindings/sound/amlogic,axg-sound-card.yaml     |    2 +-
 .../bindings/sound/amlogic,gx-sound-card.yaml      |    2 +-
 .../devicetree/bindings/sound/cirrus,cs35l36.yaml  |  240 +++
 .../devicetree/bindings/sound/cirrus,cs42l43.yaml  |    1 +
 .../devicetree/bindings/sound/cs35l36.txt          |  168 ---
 .../devicetree/bindings/sound/dmic-codec.yaml      |    4 +
 .../bindings/sound/eukrea,asoc-tlv320.yaml         |   61 +
 .../devicetree/bindings/sound/eukrea-tlv320.txt    |   26 -
 .../devicetree/bindings/sound/everest,es8316.yaml  |   28 +
 .../devicetree/bindings/sound/fsl,micfil.yaml      |    4 +
 .../bindings/sound/loongson,ls-audio-card.yaml     |   53 +-
 .../bindings/sound/loongson,ls2k1000-i2s.yaml      |   22 +-
 .../bindings/sound/mediatek,mtk-btcvsd-snd.yaml    |   59 +
 .../devicetree/bindings/sound/mtk-btcvsd-snd.txt   |   24 -
 .../bindings/sound/neofidelity,ntp8918.yaml        |    2 +-
 .../devicetree/bindings/sound/omap-dmic.txt        |   20 -
 .../sound/qcom,msm8916-wcd-digital-codec.yaml      |    8 +-
 .../sound/qcom,pm8916-wcd-analog-codec.yaml        |   11 +-
 .../bindings/sound/qcom,q6apm-lpass-dais.yaml      |   50 +
 .../bindings/sound/qcom,q6dsp-lpass-ports.yaml     |    4 +-
 .../devicetree/bindings/sound/qcom,sm8250.yaml     |   31 +
 .../devicetree/bindings/sound/qcom,wsa8855.yaml    |   93 ++
 .../devicetree/bindings/sound/realtek,rt1015.yaml  |    2 +-
 .../bindings/sound/renesas,r9a09g047-sound.yaml    |    2 +-
 .../devicetree/bindings/sound/spacemit,k1-i2s.yaml |   64 +-
 .../devicetree/bindings/sound/st,sta32x.txt        |    2 +-
 .../devicetree/bindings/sound/ti,omap4-dmic.yaml   |   58 +
 .../devicetree/bindings/sound/wlf,wm8524.yaml      |    4 +
 Documentation/sound/alsa-configuration.rst         |    5 +
 Documentation/sound/hd-audio/notes.rst             |    2 +-
 drivers/acpi/scan.c                                |    1 +
 drivers/firmware/cirrus/test/cs_dsp_mock_regmap.c  |    2 +-
 drivers/platform/x86/serial-multi-instantiate.c    |   10 +
 drivers/soundwire/bus_type.c                       |    6 +-
 include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h |   36 +-
 include/linux/platform_data/omap-twl4030.h         |   42 -
 include/sound/ac97/codec.h                         |    4 +-
 include/sound/asequencer.h                         |    3 -
 include/sound/aw88399.h                            |  621 ++++++++
 include/sound/control.h                            |    3 +
 include/sound/core.h                               |    4 +-
 include/sound/cs35l56.h                            |    1 -
 include/sound/dmaengine_pcm.h                      |    6 -
 include/sound/hda-mlink.h                          |   23 +-
 include/sound/hda_codec.h                          |    1 +
 include/sound/hda_regmap.h                         |   42 +-
 include/sound/pcm.h                                |  118 +-
 include/sound/pcm_params.h                         |   13 +-
 include/sound/rawmidi.h                            |   14 +-
 include/sound/sdca_asoc.h                          |   15 +-
 include/sound/sdca_fdl.h                           |    4 +
 include/sound/sdca_function.h                      |   32 +-
 include/sound/sdca_hid.h                           |   11 +-
 include/sound/seq_virmidi.h                        |    1 -
 include/sound/simple_card_utils.h                  |   37 +-
 include/sound/soc-acpi.h                           |   23 +-
 include/sound/soc-component.h                      |   11 +
 include/sound/soc.h                                |   15 +-
 include/sound/soc_sdw_utils.h                      |   31 +-
 include/sound/sof/dai-amd.h                        |    1 +
 include/sound/sof/dai.h                            |    3 +
 include/sound/sof/header.h                         |    4 +-
 include/sound/sof/ipc4/header.h                    |  133 +-
 include/sound/tas2781-dsp.h                        |    7 +-
 include/sound/tlv320aic32x4.h                      |   43 -
 include/sound/wm8904.h                             |    4 +-
 include/uapi/sound/asequencer.h                    |   18 +-
 include/uapi/sound/asound.h                        |  200 +--
 include/uapi/sound/firewire.h                      |   24 +-
 include/uapi/sound/skl-tplg-interface.h            |  168 ---
 include/uapi/sound/snd_ar_tokens.h                 |   95 +-
 include/uapi/sound/snd_sst_tokens.h                |  324 -----
 include/uapi/sound/sof/tokens.h                    |    5 +-
 sound/atmel/ac97c.c                                |   67 +-
 sound/core/compress_offload.c                      |   18 +-
 sound/core/control.c                               |   93 +-
 sound/core/control_compat.c                        |   15 +-
 sound/core/hwdep.c                                 |   25 +-
 sound/core/info.c                                  |    2 +-
 sound/core/init.c                                  |   67 +-
 sound/core/jack.c                                  |   38 +-
 sound/core/oss/mixer_oss.c                         |   19 +-
 sound/core/oss/pcm_oss.c                           |   43 +-
 sound/core/oss/pcm_plugin.c                        |   20 +-
 sound/core/pcm.c                                   |   12 +-
 sound/core/pcm_misc.c                              |   25 +-
 sound/core/pcm_native.c                            |   90 +-
 sound/core/rawmidi.c                               |   32 +-
 sound/core/seq/oss/seq_oss.c                       |   21 +-
 sound/core/seq/seq_clientmgr.c                     |  114 +-
 sound/core/seq/seq_clientmgr.h                     |    1 -
 sound/core/seq/seq_midi.c                          |   61 +-
 sound/core/seq/seq_ports.c                         |  103 +-
 sound/core/seq/seq_ports.h                         |    8 +-
 sound/core/seq/seq_ump_client.c                    |   38 +-
 sound/core/seq/seq_virmidi.c                       |   19 +-
 sound/core/sound.c                                 |   25 +-
 sound/core/sound_kunit.c                           |    4 +-
 sound/core/timer.c                                 |   30 +-
 sound/core/ump.c                                   |    9 +-
 sound/core/ump_convert.c                           |    1 +
 sound/drivers/aloop.c                              |  130 +-
 sound/drivers/dummy.c                              |   39 +-
 sound/drivers/mpu401/mpu401.c                      |    6 +
 sound/drivers/mts64.c                              |    6 +
 sound/drivers/portman2x4.c                         |    6 +
 sound/drivers/serial-u16550.c                      |    6 +
 sound/drivers/virmidi.c                            |    6 +
 sound/hda/codecs/ca0132.c                          |   33 +-
 sound/hda/codecs/cm9825.c                          |  148 +-
 sound/hda/codecs/conexant.c                        |   16 +-
 sound/hda/codecs/generic.c                         |   23 +-
 sound/hda/codecs/hdmi/hdmi.c                       |    5 +-
 sound/hda/codecs/helpers/razer_blade16_2025.c      |  820 +++++++++++
 sound/hda/codecs/realtek/alc269.c                  |  252 +++-
 sound/hda/codecs/realtek/alc662.c                  |    7 +
 sound/hda/codecs/side-codecs/Kconfig               |   18 +
 sound/hda/codecs/side-codecs/Makefile              |    4 +
 sound/hda/codecs/side-codecs/aw88399_hda.c         |  373 +++++
 sound/hda/codecs/side-codecs/aw88399_hda.h         |   36 +
 sound/hda/codecs/side-codecs/aw88399_hda_i2c.c     |   54 +
 sound/hda/codecs/side-codecs/cs35l41_hda.c         |   43 +-
 sound/hda/codecs/side-codecs/cs35l56_hda.c         |   35 +-
 sound/hda/codecs/side-codecs/tas2781_hda_i2c.c     |   16 +-
 sound/hda/codecs/side-codecs/tas2781_hda_spi.c     |   21 +-
 sound/hda/common/auto_parser.c                     |   66 +-
 sound/hda/common/codec.c                           |   13 +-
 sound/hda/common/hda_auto_parser.h                 |    2 +-
 sound/hda/common/hda_local.h                       |    7 +
 sound/hda/common/jack.c                            |    4 +-
 sound/hda/common/proc.c                            |    2 +-
 sound/hda/controllers/Kconfig                      |    1 +
 sound/hda/controllers/intel.c                      |   25 +-
 sound/hda/core/controller.c                        |   33 +-
 sound/hda/core/device.c                            |    3 +-
 sound/hda/core/ext/stream.c                        |    4 +-
 sound/hda/core/hda_bus_type.c                      |    9 +-
 sound/hda/core/stream.c                            |   40 +-
 sound/isa/msnd/msnd_pinnacle.c                     |   18 +-
 sound/isa/sscape.c                                 |    8 +-
 sound/isa/wavefront/wavefront_fx.c                 |   23 +-
 sound/isa/wavefront/wavefront_synth.c              |    4 +-
 sound/pci/asihpi/asihpi.c                          |    2 +-
 sound/pci/asihpi/hpi6000.c                         |    5 +
 sound/pci/asihpi/hpidspcd.c                        |   18 +-
 sound/pci/asihpi/hpioctl.c                         |   17 +-
 sound/pci/cs46xx/cs46xx_lib.c                      |   30 +-
 sound/pci/emu10k1/emufx.c                          |   18 +-
 sound/pci/korg1212/korg1212.c                      |    8 +-
 sound/pci/mixart/mixart_hwdep.c                    |    4 +-
 sound/pci/pcxhr/pcxhr_hwdep.c                      |    3 +-
 sound/pci/sis7019.c                                |   10 +-
 sound/pci/via82xx_modem.c                          |   26 +-
 sound/sh/aica.c                                    |    4 +-
 sound/soc/amd/acp-config.c                         |   19 +
 sound/soc/amd/acp-pcm-dma.c                        |    8 +-
 sound/soc/amd/acp/acp-i2s.c                        |    6 +
 sound/soc/amd/acp/acp-mach-common.c                |   11 +-
 sound/soc/amd/acp/acp-pci.c                        |   26 +-
 sound/soc/amd/acp/acp-sdw-legacy-mach.c            |   20 +-
 sound/soc/amd/acp/acp-sdw-sof-mach.c               |   16 +-
 sound/soc/amd/acp/acp-sof-mach.c                   |   14 +-
 sound/soc/amd/acp/amd-acp70-acpi-match.c           |   56 +
 sound/soc/amd/mach-config.h                        |    1 +
 sound/soc/amd/raven/acp3x-i2s.c                    |    6 +
 sound/soc/amd/vangogh/acp5x-i2s.c                  |    6 +
 sound/soc/amd/yc/acp6x-mach.c                      |   12 +-
 sound/soc/apple/mca.c                              |  323 +++--
 sound/soc/atmel/atmel-i2s.c                        |    4 +
 sound/soc/atmel/atmel_ssc_dai.c                    |    7 +
 sound/soc/atmel/atmel_wm8904.c                     |   13 +-
 sound/soc/atmel/mchp-i2s-mcc.c                     |    9 +
 sound/soc/atmel/mchp-pdmc.c                        |    4 +
 sound/soc/au1x/db1200.c                            |    2 +-
 sound/soc/au1x/i2sc.c                              |   11 +
 sound/soc/au1x/psc-ac97.c                          |    4 +-
 sound/soc/au1x/psc-i2s.c                           |   11 +
 sound/soc/bcm/bcm2835-i2s.c                        |   13 +
 sound/soc/bcm/cygnus-ssp.c                         |    7 +
 sound/soc/cirrus/ep93xx-i2s.c                      |   11 +
 sound/soc/codecs/Kconfig                           |   61 +-
 sound/soc/codecs/Makefile                          |    6 +
 sound/soc/codecs/ab8500-codec.c                    |   12 +-
 sound/soc/codecs/ad1836.c                          |    6 +
 sound/soc/codecs/ad193x.c                          |   10 +
 sound/soc/codecs/adau1761.c                        |   34 +-
 sound/soc/codecs/adau7118-hw.c                     |    2 +-
 sound/soc/codecs/adav80x.c                         |    8 +
 sound/soc/codecs/ak4613.c                          |   77 +-
 sound/soc/codecs/arizona-jack.c                    |  121 +-
 sound/soc/codecs/arizona.c                         |   26 +-
 sound/soc/codecs/aw87390.c                         |   17 +-
 sound/soc/codecs/aw88081.c                         |   27 +-
 sound/soc/codecs/aw88166.c                         |   32 +-
 sound/soc/codecs/aw88261.c                         |   35 +-
 sound/soc/codecs/aw88261.h                         |    6 -
 sound/soc/codecs/aw88395/aw88395.c                 |   32 +-
 sound/soc/codecs/aw88395/aw88395_device.c          |   40 +-
 sound/soc/codecs/aw88399-lib.c                     | 1409 ++++++++++++++++++
 sound/soc/codecs/aw88399.c                         | 1358 +----------------
 sound/soc/codecs/aw88399.h                         |  582 +-------
 sound/soc/codecs/bt-sco.c                          |   10 +-
 sound/soc/codecs/cpcap.c                           |  130 +-
 sound/soc/codecs/cros_ec_codec.c                   |   26 +-
 sound/soc/codecs/cs-amp-lib.c                      |   11 +-
 sound/soc/codecs/cs35l32.c                         |   10 +-
 sound/soc/codecs/cs35l33.c                         |   14 +-
 sound/soc/codecs/cs35l34.c                         |   14 +-
 sound/soc/codecs/cs35l56-i2c.c                     |   10 +-
 sound/soc/codecs/cs35l56-sdw.c                     |   71 +-
 sound/soc/codecs/cs35l56-shared.c                  |   69 +-
 sound/soc/codecs/cs35l56-spi.c                     |   10 +-
 sound/soc/codecs/cs35l56.c                         |   58 +-
 sound/soc/codecs/cs35l56.h                         |   11 +-
 sound/soc/codecs/cs40l50-codec.c                   |    4 +-
 sound/soc/codecs/cs42l42-sdw.c                     |   14 +-
 sound/soc/codecs/cs42l42.c                         |   56 +-
 sound/soc/codecs/cs42l43-jack.c                    |  138 +-
 sound/soc/codecs/cs42l43.c                         |   20 +-
 sound/soc/codecs/cs42l84.c                         |   10 +-
 sound/soc/codecs/cs43130.c                         |   72 +-
 sound/soc/codecs/cs4349.c                          |    8 +-
 sound/soc/codecs/cs47l15.c                         |   11 +-
 sound/soc/codecs/cs47l35.c                         |   11 +-
 sound/soc/codecs/cs47l85.c                         |   11 +-
 sound/soc/codecs/cs47l90.c                         |   11 +-
 sound/soc/codecs/cs47l92.c                         |   11 +-
 sound/soc/codecs/cs48l32.c                         |   26 +-
 sound/soc/codecs/cx2072x.c                         |  139 +-
 sound/soc/codecs/da7213.c                          |   37 +-
 sound/soc/codecs/da7219.c                          |   62 +-
 sound/soc/codecs/es8316.c                          |   44 +-
 sound/soc/codecs/es8326.c                          |   30 +-
 sound/soc/codecs/es8328.c                          |    5 +
 sound/soc/codecs/es8389.c                          |  236 ++-
 sound/soc/codecs/es8389.h                          |   11 +-
 sound/soc/codecs/es9356.c                          |   33 +-
 sound/soc/codecs/fs-amp-lib.c                      |    3 +-
 sound/soc/codecs/fs210x.c                          |   89 +-
 sound/soc/codecs/hdac_hda.c                        |    7 +-
 sound/soc/codecs/hdac_hdmi.c                       |  137 +-
 sound/soc/codecs/hdmi-codec.c                      |   15 +-
 sound/soc/codecs/idt821034.c                       |  144 +-
 sound/soc/codecs/lochnagar-sc.c                    |    8 +
 sound/soc/codecs/lpass-macro-common.c              |   12 +-
 sound/soc/codecs/lpass-rx-macro.c                  |  141 +-
 sound/soc/codecs/lpass-tx-macro.c                  |  130 +-
 sound/soc/codecs/lpass-va-macro.c                  |  139 +-
 sound/soc/codecs/lpass-wsa-macro.c                 |  144 +-
 sound/soc/codecs/madera.c                          |   51 +-
 sound/soc/codecs/max98090.c                        |    9 +-
 sound/soc/codecs/max98095.c                        |   35 +-
 sound/soc/codecs/max98363.c                        |    7 +-
 sound/soc/codecs/max98373-i2c.c                    |    9 +-
 sound/soc/codecs/max98373-sdw.c                    |    7 +-
 sound/soc/codecs/max98388.c                        |    8 +-
 sound/soc/codecs/max98390.c                        |   24 +-
 sound/soc/codecs/max98396.c                        |   24 +-
 sound/soc/codecs/max9860.c                         |    2 +-
 sound/soc/codecs/max98927.c                        |    8 +-
 sound/soc/codecs/ml26124.c                         |    4 +-
 sound/soc/codecs/msm8916-wcd-analog.c              |  144 +-
 sound/soc/codecs/mt6357.c                          |    4 +-
 sound/soc/codecs/mt6359-accdet.c                   |   13 +-
 sound/soc/codecs/ntpfw.c                           |   21 +-
 sound/soc/codecs/ntpfw.h                           |   11 +-
 sound/soc/codecs/pcm1681.c                         |    7 +
 sound/soc/codecs/pcm1754.c                         |    6 +
 sound/soc/codecs/pcm1789.c                         |    7 +
 sound/soc/codecs/pcm179x.c                         |    6 +
 sound/soc/codecs/pcm186x.c                         |    9 +
 sound/soc/codecs/pcm3060.c                         |    8 +
 sound/soc/codecs/pcm512x.c                         |   68 +-
 sound/soc/codecs/pcm6240.c                         |   41 +-
 sound/soc/codecs/peb2466.c                         |   23 +-
 sound/soc/codecs/pm4125-sdw.c                      |   10 +-
 sound/soc/codecs/pm4125.c                          |    3 +-
 sound/soc/codecs/rt1017-sdca-sdw.c                 |    7 +-
 sound/soc/codecs/rt1017-sdca-sdw.h                 |   10 +-
 sound/soc/codecs/rt1316-sdw.c                      |    9 +-
 sound/soc/codecs/rt1318-sdw.c                      |    9 +-
 sound/soc/codecs/rt1318.c                          |    4 +-
 sound/soc/codecs/rt1320-sdw.c                      |  882 +++++++++--
 sound/soc/codecs/rt1320-sdw.h                      |   19 +
 sound/soc/codecs/rt274.c                           |    8 +-
 sound/soc/codecs/rt286.c                           |   14 +-
 sound/soc/codecs/rt298.c                           |   14 +-
 sound/soc/codecs/rt5514-spi.c                      |   21 +-
 sound/soc/codecs/rt5514.c                          |   16 +-
 sound/soc/codecs/rt5575-spi.c                      |    3 +-
 sound/soc/codecs/rt5645.c                          |  180 +--
 sound/soc/codecs/rt5665.c                          |   15 +-
 sound/soc/codecs/rt5668.c                          |   10 +-
 sound/soc/codecs/rt5677-spi.c                      |   36 +-
 sound/soc/codecs/rt5677.c                          |  100 +-
 sound/soc/codecs/rt5682-sdw.c                      |   44 +-
 sound/soc/codecs/rt5682.c                          |    5 +-
 sound/soc/codecs/rt5682s.c                         |   17 +-
 sound/soc/codecs/rt700-sdw.c                       |   20 +-
 sound/soc/codecs/rt700-sdw.h                       |   11 +-
 sound/soc/codecs/rt711-sdca-sdw.c                  |   29 +-
 sound/soc/codecs/rt711-sdca-sdw.h                  |    6 +-
 sound/soc/codecs/rt711-sdca.c                      |    5 +-
 sound/soc/codecs/rt711-sdw.c                       |   24 +-
 sound/soc/codecs/rt711-sdw.h                       |   10 +-
 sound/soc/codecs/rt711.c                           |   50 +-
 sound/soc/codecs/rt712-sdca-dmic.c                 |   17 +-
 sound/soc/codecs/rt712-sdca-dmic.h                 |    6 +-
 sound/soc/codecs/rt712-sdca-sdw.c                  |   45 +-
 sound/soc/codecs/rt712-sdca-sdw.h                  |   11 +-
 sound/soc/codecs/rt712-sdca.c                      |    5 +-
 sound/soc/codecs/rt715-sdca-sdw.h                  |   48 +-
 sound/soc/codecs/rt715-sdw.h                       |   32 +-
 sound/soc/codecs/rt721-sdca-sdw.c                  |   44 +-
 sound/soc/codecs/rt721-sdca-sdw.h                  |   44 +-
 sound/soc/codecs/rt721-sdca.c                      |    5 +-
 sound/soc/codecs/rt722-sdca-sdw.c                  |   37 +-
 sound/soc/codecs/rt722-sdca.c                      |   16 +-
 sound/soc/codecs/rt766-sdca-sdw.c                  |  339 +++++
 sound/soc/codecs/rt766-sdca-sdw.h                  |   61 +
 sound/soc/codecs/rt766-sdca.c                      | 1378 ++++++++++++++++++
 sound/soc/codecs/rt766-sdca.h                      |  140 ++
 sound/soc/codecs/rt9120.c                          |    9 +-
 sound/soc/codecs/sgtl5000.c                        |    2 +-
 sound/soc/codecs/sigmadsp.c                        |   30 +-
 sound/soc/codecs/sma1303.c                         |    2 +
 sound/soc/codecs/sma1307.c                         |    6 +-
 sound/soc/codecs/sta32x.c                          |   21 +-
 sound/soc/codecs/sta350.c                          |   20 +-
 sound/soc/codecs/sti-sas.c                         |    2 +-
 sound/soc/codecs/tac5xx2-sdw.c                     |   90 +-
 sound/soc/codecs/tas2552.c                         |   24 +-
 sound/soc/codecs/tas2764.c                         |    2 +-
 sound/soc/codecs/tas2780.c                         |    2 +-
 sound/soc/codecs/tas2781-comlib-i2c.c              |    5 +-
 sound/soc/codecs/tas2781-fmwlib.c                  |   65 +-
 sound/soc/codecs/tas2781-i2c.c                     |  253 +++-
 sound/soc/codecs/tas2783-sdw.c                     |  316 ++--
 sound/soc/codecs/tas5805m.c                        |   30 +-
 sound/soc/codecs/tas675x.c                         |   18 +-
 sound/soc/codecs/tlv320aic26.c                     |    6 +
 sound/soc/codecs/tlv320aic31xx.c                   |    8 +-
 sound/soc/codecs/tlv320aic32x4-clk.c               |   68 +-
 sound/soc/codecs/tlv320aic32x4-i2c.c               |   21 +-
 sound/soc/codecs/tlv320aic32x4-spi.c               |   25 +-
 sound/soc/codecs/tlv320aic32x4.c                   |  468 +++---
 sound/soc/codecs/tlv320aic32x4.h                   |   32 +-
 sound/soc/codecs/tlv320dac33.c                     |   87 +-
 sound/soc/codecs/tscs42xx.c                        |   61 +-
 sound/soc/codecs/tscs454.c                         |  107 +-
 sound/soc/codecs/twl6040.c                         |    5 +-
 sound/soc/codecs/uda1342.c                         |    9 +-
 sound/soc/codecs/wcd9335.c                         |    4 +-
 sound/soc/codecs/wcd934x.c                         |   48 +-
 sound/soc/codecs/wcd937x-sdw.c                     |    8 +-
 sound/soc/codecs/wcd937x.c                         |   25 +-
 sound/soc/codecs/wcd938x-sdw.c                     |    8 +-
 sound/soc/codecs/wcd938x.c                         |   22 +-
 sound/soc/codecs/wcd939x-sdw.c                     |    8 +-
 sound/soc/codecs/wcd939x.c                         |   20 +-
 sound/soc/codecs/wm0010.c                          |   86 +-
 sound/soc/codecs/wm2000.c                          |   35 +-
 sound/soc/codecs/wm2200.c                          |   10 +-
 sound/soc/codecs/wm5100.c                          |   10 +-
 sound/soc/codecs/wm5102.c                          |   23 +-
 sound/soc/codecs/wm8731.c                          |    9 +-
 sound/soc/codecs/wm8903.c                          |    9 +-
 sound/soc/codecs/wm8940.c                          |    2 +-
 sound/soc/codecs/wm8958-dsp2.c                     |   10 +-
 sound/soc/codecs/wm8962.c                          |   22 +-
 sound/soc/codecs/wm8994.c                          |   30 +-
 sound/soc/codecs/wm9712.c                          |    5 +-
 sound/soc/codecs/wm9713.c                          |    5 +-
 sound/soc/codecs/wm_adsp.c                         |   77 +-
 sound/soc/codecs/wsa881x.c                         |    8 +-
 sound/soc/codecs/wsa883x.c                         |   19 +-
 sound/soc/codecs/wsa884x.c                         |   18 +-
 sound/soc/codecs/wsa885x.c                         | 1533 ++++++++++++++++++++
 sound/soc/codecs/zl38060.c                         |   11 +-
 sound/soc/dwc/dwc-i2s.c                            |    4 +-
 sound/soc/fsl/fsl-asoc-card.c                      |  730 ++++++----
 sound/soc/fsl/fsl_asrc.c                           |   12 +-
 sound/soc/fsl/fsl_asrc.h                           |    6 +-
 sound/soc/fsl/fsl_asrc_dma.c                       |    4 +-
 sound/soc/fsl/fsl_asrc_m2m.c                       |   10 +-
 sound/soc/fsl/fsl_audmix.c                         |   35 +-
 sound/soc/fsl/fsl_dma.c                            |   68 +-
 sound/soc/fsl/fsl_dma.h                            |    4 +-
 sound/soc/fsl/fsl_easrc.c                          |   45 +-
 sound/soc/fsl/fsl_easrc.h                          |    4 +-
 sound/soc/fsl/fsl_esai.c                           |   16 +-
 sound/soc/fsl/fsl_qmc_audio.c                      |    8 +-
 sound/soc/fsl/fsl_spdif.c                          |    8 +-
 sound/soc/fsl/fsl_ssi.c                            |   13 +-
 sound/soc/fsl/fsl_xcvr.c                           |   39 +-
 sound/soc/fsl/imx-audio-rpmsg.c                    |   25 +-
 sound/soc/fsl/imx-card.c                           |    4 +-
 sound/soc/fsl/imx-pcm-rpmsg.c                      |   75 +-
 sound/soc/fsl/mpc5200_dma.c                        |  114 +-
 sound/soc/fsl/mpc5200_psc_ac97.c                   |   38 +-
 sound/soc/fsl/mpc5200_psc_i2s.c                    |   12 +-
 sound/soc/fsl/p1022_ds.c                           |   14 +-
 sound/soc/fsl/p1022_rdk.c                          |   14 +-
 sound/soc/generic/audio-graph-card.c               |   16 +-
 sound/soc/generic/audio-graph-card2.c              |   35 +-
 sound/soc/generic/simple-card-utils.c              |   82 +-
 sound/soc/generic/simple-card.c                    |  127 +-
 sound/soc/intel/atom/sst-atom-controls.c           |   67 +-
 sound/soc/intel/atom/sst-mfld-platform-pcm.c       |   66 +-
 sound/soc/intel/atom/sst/sst_ipc.c                 |    5 +-
 sound/soc/intel/atom/sst/sst_pci.c                 |    4 +-
 sound/soc/intel/atom/sst/sst_pvt.c                 |    9 +-
 sound/soc/intel/avs/apl.c                          |    8 +-
 sound/soc/intel/avs/avs.h                          |    5 +-
 sound/soc/intel/avs/boards/da7219.c                |    7 +-
 sound/soc/intel/avs/boards/dmic.c                  |    6 +-
 sound/soc/intel/avs/boards/es8336.c                |    6 +-
 sound/soc/intel/avs/boards/hdaudio.c               |    6 +-
 sound/soc/intel/avs/boards/i2s_test.c              |    6 +-
 sound/soc/intel/avs/boards/max98357a.c             |    6 +-
 sound/soc/intel/avs/boards/max98373.c              |    6 +-
 sound/soc/intel/avs/boards/max98927.c              |    6 +-
 sound/soc/intel/avs/boards/nau8825.c               |    6 +-
 sound/soc/intel/avs/boards/pcm3168a.c              |    6 +-
 sound/soc/intel/avs/boards/probe.c                 |    2 +-
 sound/soc/intel/avs/boards/rt274.c                 |    2 +-
 sound/soc/intel/avs/boards/rt286.c                 |    2 +-
 sound/soc/intel/avs/boards/rt298.c                 |    2 +-
 sound/soc/intel/avs/boards/rt5514.c                |    2 +-
 sound/soc/intel/avs/boards/rt5640.c                |    2 +-
 sound/soc/intel/avs/boards/rt5663.c                |    2 +-
 sound/soc/intel/avs/boards/rt5682.c                |    2 +-
 sound/soc/intel/avs/boards/ssm4567.c               |    2 +-
 sound/soc/intel/avs/control.c                      |    7 +-
 sound/soc/intel/avs/core.c                         |    4 +-
 sound/soc/intel/avs/debug.h                        |   10 +-
 sound/soc/intel/avs/debugfs.c                      |   19 +-
 sound/soc/intel/avs/ipc.c                          |   59 +-
 sound/soc/intel/avs/loader.c                       |   15 +-
 sound/soc/intel/avs/path.c                         |   30 +-
 sound/soc/intel/avs/pcm.c                          |   19 +-
 sound/soc/intel/avs/probes.c                       |   18 +-
 sound/soc/intel/avs/topology.c                     |    3 +-
 sound/soc/intel/avs/utils.c                        |   45 +-
 sound/soc/intel/boards/sof_sdw.c                   |   16 +-
 sound/soc/intel/catpt/core.h                       |    4 +-
 sound/soc/intel/catpt/device.c                     |   33 +-
 sound/soc/intel/catpt/loader.c                     |  148 +-
 sound/soc/intel/catpt/pcm.c                        |   59 +-
 sound/soc/intel/common/soc-acpi-intel-arl-match.c  |    3 +
 sound/soc/intel/common/soc-acpi-intel-lnl-match.c  |   15 +-
 sound/soc/intel/common/soc-acpi-intel-mtl-match.c  |   18 +-
 sound/soc/intel/common/soc-acpi-intel-ptl-match.c  |    6 +-
 .../soc/intel/common/soc-acpi-intel-sdca-quirks.c  |    8 +
 .../soc/intel/common/soc-acpi-intel-sdca-quirks.h  |    1 +
 sound/soc/intel/keembay/kmb_platform.c             |    2 +
 sound/soc/loongson/loongson_card.c                 |  171 ++-
 sound/soc/loongson/loongson_i2s_plat.c             |   42 +-
 sound/soc/mediatek/Kconfig                         |    2 +-
 sound/soc/mediatek/common/mtk-dsp-sof-common.c     |    7 +-
 sound/soc/mediatek/mt8173/mt8173-rt5650.c          |    2 +-
 sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c |    4 +-
 .../mt8183/mt8183-mt6358-ts3a227-max98357.c        |    4 +-
 sound/soc/mediatek/mt8186/mt8186-mt6366.c          |    2 +-
 sound/soc/mediatek/mt8188/mt8188-mt6359.c          |    2 +-
 sound/soc/mediatek/mt8189/mt8189-dai-adda.c        |    2 -
 sound/soc/mediatek/mt8189/mt8189-nau8825.c         |    2 +-
 .../mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c  |   14 +-
 sound/soc/mediatek/mt8195/mt8195-mt6359.c          |    4 +-
 sound/soc/mediatek/mt8196/mt8196-nau8825.c         |    4 +-
 sound/soc/mediatek/mt8365/mt8365-afe-pcm.c         |   16 +-
 sound/soc/mediatek/mt8365/mt8365-mt6357.c          |   10 +-
 sound/soc/meson/Makefile                           |    2 +
 sound/soc/meson/aiu-encoder-i2s.c                  |  367 +++--
 sound/soc/meson/aiu-formatter-i2s.c                |  103 ++
 sound/soc/meson/aiu.c                              |   33 +-
 sound/soc/meson/aiu.h                              |    4 +
 sound/soc/meson/axg-card.c                         |   25 +-
 sound/soc/meson/g12a-toacodec.c                    |    2 +-
 sound/soc/meson/g12a-tohdmitx.c                    |    2 +-
 sound/soc/meson/gx-card.c                          |    6 +-
 sound/soc/meson/gx-formatter.c                     |  282 ++++
 sound/soc/meson/gx-formatter.h                     |   56 +
 sound/soc/meson/gx-interface.h                     |   42 +
 sound/soc/meson/meson-card-utils.c                 |   39 +-
 sound/soc/meson/meson-codec-glue.c                 |    2 +-
 sound/soc/meson/t9015.c                            |   12 +-
 sound/soc/mxs/mxs-saif.c                           |   21 +-
 sound/soc/mxs/mxs-sgtl5000.c                       |    2 -
 sound/soc/pxa/pxa-ssp.c                            |    7 +-
 sound/soc/pxa/pxa2xx-ac97-lib.c                    |    4 +-
 sound/soc/qcom/common.c                            |  164 ++-
 sound/soc/qcom/common.h                            |   16 +-
 sound/soc/qcom/qdsp6/audioreach.c                  |  140 +-
 sound/soc/qcom/qdsp6/audioreach.h                  |   90 ++
 sound/soc/qcom/qdsp6/q6afe-dai.c                   |   48 +
 sound/soc/qcom/qdsp6/q6afe.c                       |   56 +
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c            |  228 ++-
 sound/soc/qcom/qdsp6/q6apm.c                       |   12 +-
 sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c          |    2 +-
 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c           |    5 +
 sound/soc/qcom/qdsp6/q6prm-clocks.c                |   35 +
 sound/soc/qcom/qdsp6/q6prm.c                       |   16 +-
 sound/soc/qcom/qdsp6/q6prm.h                       |   44 +
 sound/soc/qcom/qdsp6/q6routing.c                   |   78 +-
 sound/soc/qcom/qdsp6/topology.c                    |  107 +-
 sound/soc/qcom/sc8280xp.c                          |  430 +++++-
 sound/soc/qcom/sdm845.c                            |    2 -
 sound/soc/qcom/sm8250.c                            |   17 +
 sound/soc/qcom/storm.c                             |   12 +-
 sound/soc/renesas/fsi.c                            |   13 +-
 sound/soc/renesas/rcar/adg.c                       |    8 +-
 sound/soc/renesas/siu_dai.c                        |    4 +-
 sound/soc/rockchip/rk3288_hdmi_analog.c            |   16 +-
 sound/soc/rockchip/rockchip_i2s.c                  |   30 +-
 sound/soc/rockchip/rockchip_i2s_tdm.c              |   15 +-
 sound/soc/rockchip/rockchip_max98090.c             |    5 +-
 sound/soc/rockchip/rockchip_pdm.c                  |    8 +-
 sound/soc/rockchip/rockchip_rt5645.c               |    5 +-
 sound/soc/rockchip/rockchip_sai.c                  |   15 +-
 sound/soc/rockchip/rockchip_spdif.c                |    4 +-
 sound/soc/samsung/aries_wm8994.c                   |    1 +
 sound/soc/samsung/i2s.c                            |   58 +-
 sound/soc/samsung/smdk_spdif.c                     |    8 +-
 sound/soc/samsung/spdif.c                          |    8 +-
 sound/soc/sdca/sdca_asoc.c                         |   18 +-
 sound/soc/sdca/sdca_class_function.c               |    2 +-
 sound/soc/sdca/sdca_fdl.c                          |    8 +-
 sound/soc/sdca/sdca_function_device.c              |    7 +-
 sound/soc/sdca/sdca_functions.c                    |  187 ++-
 sound/soc/sdca/sdca_hid.c                          |   48 +-
 sound/soc/sdca/sdca_interrupts.c                   |    6 +
 sound/soc/sdw_utils/soc_sdw_bridge_cs35l56.c       |    4 +-
 sound/soc/sdw_utils/soc_sdw_utils.c                |   72 +-
 sound/soc/soc-component.c                          |   53 +-
 sound/soc/soc-core.c                               |   44 +-
 sound/soc/soc-dapm.c                               |    6 +
 sound/soc/soc-generic-dmaengine-pcm.c              |   58 +-
 sound/soc/soc-topology-test.c                      |  133 +-
 sound/soc/sof/amd/Kconfig                          |   11 +
 sound/soc/sof/amd/Makefile                         |    2 +
 sound/soc/sof/amd/acp-dsp-offset.h                 |   17 +
 sound/soc/sof/amd/acp-ipc.c                        |   13 +-
 sound/soc/sof/amd/acp-loader.c                     |   37 +-
 sound/soc/sof/amd/acp.c                            |  267 +++-
 sound/soc/sof/amd/acp.h                            |   20 +
 sound/soc/sof/amd/acp7x.c                          |  185 +++
 sound/soc/sof/amd/pci-acp7x.c                      |  116 ++
 sound/soc/sof/fw-file-profile.c                    |   19 +-
 sound/soc/sof/intel/hda-ctrl.c                     |   19 +
 sound/soc/sof/intel/hda-dai-ops.c                  |   76 +-
 sound/soc/sof/intel/hda-dai.c                      |    2 +-
 sound/soc/sof/intel/hda-dsp.c                      |    6 +-
 sound/soc/sof/intel/hda-loader.c                   |   11 +-
 sound/soc/sof/intel/hda-mlink.c                    |   35 +-
 sound/soc/sof/intel/hda-sdw-bpt.c                  |    2 +-
 sound/soc/sof/intel/hda-stream.c                   |   18 +-
 sound/soc/sof/intel/hda.c                          |   18 +-
 sound/soc/sof/intel/hda.h                          |   31 +-
 sound/soc/sof/intel/icl.c                          |   10 +-
 sound/soc/sof/intel/mtl.c                          |   23 +
 sound/soc/sof/ipc3-pcm.c                           |    6 +
 sound/soc/sof/ipc3-topology.c                      |   39 +-
 sound/soc/sof/ipc4-topology.c                      |  382 ++++-
 sound/soc/sof/ipc4-topology.h                      |   12 +-
 sound/soc/sof/ipc4.c                               |   84 ++
 sound/soc/sof/nocodec.c                            |   16 +-
 sound/soc/sof/pcm.c                                |    2 +-
 sound/soc/sof/sof-audio.c                          |    5 +-
 sound/soc/sof/sof-audio.h                          |    8 +-
 sound/soc/sof/topology.c                           |   53 +-
 sound/soc/sophgo/cv1800b-tdm.c                     |   16 +-
 sound/soc/spacemit/k1_i2s.c                        |   47 +-
 sound/soc/spear/spdif_in.c                         |   12 +-
 sound/soc/spear/spdif_out.c                        |    2 +-
 sound/soc/sprd/sprd-mcdt.c                         |    4 +-
 sound/soc/sprd/sprd-pcm-dma.c                      |    2 -
 sound/soc/starfive/jh7110_pwmdac.c                 |   15 +-
 sound/soc/starfive/jh7110_tdm.c                    |   27 +-
 sound/soc/stm/stm32_adfsdm.c                       |    5 +-
 sound/soc/stm/stm32_i2s.c                          |    6 +-
 sound/soc/stm/stm32_sai_sub.c                      |    8 +-
 sound/soc/stm/stm32_spdifrx.c                      |    6 +-
 sound/soc/sunxi/sun4i-codec.c                      |   93 +-
 sound/soc/sunxi/sun4i-i2s.c                        |   28 +-
 sound/soc/sunxi/sun4i-spdif.c                      |   23 +-
 sound/soc/sunxi/sun50i-codec-analog.c              |   11 +-
 sound/soc/sunxi/sun8i-codec-analog.c               |   11 +-
 sound/soc/tegra/tegra20_das.c                      |    7 +-
 sound/soc/tegra/tegra210_adx.c                     |   12 +-
 sound/soc/tegra/tegra210_amx.c                     |   12 +-
 sound/soc/tegra/tegra210_i2s.c                     |   18 +-
 sound/soc/tegra/tegra210_mixer.c                   |    2 +-
 sound/soc/ti/ams-delta.c                           |    8 +-
 sound/soc/ti/davinci-evm.c                         |    3 +-
 sound/soc/ti/j721e-evm.c                           |   11 +-
 sound/soc/ti/omap-abe-twl6040.c                    |   15 +-
 sound/soc/ti/omap-dmic.c                           |    7 +-
 sound/soc/ti/omap-hdmi.c                           |    9 +-
 sound/soc/ti/omap-twl4030.c                        |  168 +--
 sound/soc/ti/rx51.c                                |   51 +-
 sound/soc/uniphier/aio-cpu.c                       |    8 +-
 sound/soc/uniphier/aio.h                           |    2 +-
 sound/soc/ux500/mop500.c                           |   12 +-
 sound/soc/ux500/mop500_ab8500.c                    |    2 +-
 sound/soc/xilinx/xlnx_formatter_pcm.c              |   16 +-
 sound/soc/xilinx/xlnx_i2s.c                        |   30 +-
 sound/soc/xilinx/xlnx_spdif.c                      |   39 +-
 sound/soc/xtensa/xtfpga-i2s.c                      |   60 +-
 sound/sparc/dbri.c                                 |    2 +
 sound/usb/6fire/comm.c                             |    9 +-
 sound/usb/6fire/firmware.c                         |   24 +-
 sound/usb/bcd2000/bcd2000.c                        |   11 +-
 sound/usb/card.c                                   |   72 +-
 sound/usb/clock.c                                  |   11 +-
 sound/usb/endpoint.c                               |    7 +-
 sound/usb/fcp.c                                    |   42 +-
 sound/usb/mixer.c                                  |    6 +
 sound/usb/mixer.h                                  |    2 +
 sound/usb/mixer_maps.c                             |   18 +
 sound/usb/mixer_quirks.c                           |   20 +
 sound/usb/mixer_scarlett2.c                        |   98 +-
 sound/usb/quirks-table.h                           |   77 +
 sound/usb/quirks.c                                 |   29 +-
 sound/usb/quirks.h                                 |    3 -
 sound/usb/usbaudio.h                               |   18 +-
 sound/usb/usx2y/us144mkii_pcm.h                    |    6 +-
 sound/usb/usx2y/usbusx2yaudio.c                    |    1 -
 628 files changed, 20569 insertions(+), 10121 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/cirrus,cs35l36.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/cs35l36.txt
 create mode 100644 Documentation/devicetree/bindings/sound/eukrea,asoc-tlv320.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/eukrea-tlv320.txt
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mtk-btcvsd-snd.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/mtk-btcvsd-snd.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/omap-dmic.txt
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wsa8855.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/ti,omap4-dmic.yaml
 delete mode 100644 include/linux/platform_data/omap-twl4030.h
 create mode 100644 include/sound/aw88399.h
 delete mode 100644 include/sound/tlv320aic32x4.h
 delete mode 100644 include/uapi/sound/skl-tplg-interface.h
 delete mode 100644 include/uapi/sound/snd_sst_tokens.h
 create mode 100644 sound/hda/codecs/helpers/razer_blade16_2025.c
 create mode 100644 sound/hda/codecs/side-codecs/aw88399_hda.c
 create mode 100644 sound/hda/codecs/side-codecs/aw88399_hda.h
 create mode 100644 sound/hda/codecs/side-codecs/aw88399_hda_i2c.c
 create mode 100644 sound/soc/codecs/aw88399-lib.c
 create mode 100644 sound/soc/codecs/rt766-sdca-sdw.c
 create mode 100644 sound/soc/codecs/rt766-sdca-sdw.h
 create mode 100644 sound/soc/codecs/rt766-sdca.c
 create mode 100644 sound/soc/codecs/rt766-sdca.h
 create mode 100644 sound/soc/codecs/wsa885x.c
 create mode 100644 sound/soc/meson/aiu-formatter-i2s.c
 create mode 100644 sound/soc/meson/gx-formatter.c
 create mode 100644 sound/soc/meson/gx-formatter.h
 create mode 100644 sound/soc/meson/gx-interface.h
 create mode 100644 sound/soc/sof/amd/acp7x.c
 create mode 100644 sound/soc/sof/amd/pci-acp7x.c

