Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8397D3B7750
	for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 09:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781687270; cv=none; b=b3wrDThSSjDhIMinmpd4MF2YVYU1IDGToKDo6B51LADzXcLHDEsuEbLTRwUvbRWyPxtdScim3LW3sxLm4P7EybenTH5t29EztzBp2R0XQ4CpXR3i22A9BUipwAS+msroCZUwwbblZY5t02jiu/Oaxbo93ql2MaZXs7bf8MZkNA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781687270; c=relaxed/simple;
	bh=4gvj4b+0n5m8D29k0XD3aaUJScE6ujXhuzlxk6BUFRk=;
	h=Date:Message-ID:From:To:Cc:Subject:MIME-Version:Content-Type; b=a5xKeTCQ0Ym6c7mBeQ2UZa57qWpJ/BrEQFVV9+ExejEDm/eXtule8smDtGVkuXIdHbapcedrm4xC50BqqveYlCmd16ANnfymNVfGASqUD6PKVVAc/teIX53aG5wEzXufKIykGfVHD7KXccbS89Itr1vYQBFCcOVkIIaqC1md23c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TaOKKK3A; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=O9/bNbuR; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TaOKKK3A; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=O9/bNbuR; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TaOKKK3A";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="O9/bNbuR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TaOKKK3A";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="O9/bNbuR"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 83A726BB36;
	Wed, 17 Jun 2026 09:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781687255; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1StBa4+Wi2i/dVx3dxIY8vTk3DLOE9+cTvdCw++76rs=;
	b=TaOKKK3AG3TgPrC88zKMjmUzXjca8xfobBvFfc1Jek/ognSI+jbCQtRjv+TpFDljAtZMJP
	q7k2nXklqpKitcc5Ba2vkFniiKPhOpUCtgS5WhAs9V7HDoeW1wn0XA0edzsn6eU7Ow83hK
	ddibBvaCcgfxtau3FAS19cYCBqT+PNk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781687255;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1StBa4+Wi2i/dVx3dxIY8vTk3DLOE9+cTvdCw++76rs=;
	b=O9/bNbuRXS2uZ5xheHuTgcZAOuzV8Sr3AJocsKkSZcJJmG7kn16d8naX2I8uAGySm5InyJ
	P82gFiWkCoISx0Ag==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=TaOKKK3A;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="O9/bNbuR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781687255; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1StBa4+Wi2i/dVx3dxIY8vTk3DLOE9+cTvdCw++76rs=;
	b=TaOKKK3AG3TgPrC88zKMjmUzXjca8xfobBvFfc1Jek/ognSI+jbCQtRjv+TpFDljAtZMJP
	q7k2nXklqpKitcc5Ba2vkFniiKPhOpUCtgS5WhAs9V7HDoeW1wn0XA0edzsn6eU7Ow83hK
	ddibBvaCcgfxtau3FAS19cYCBqT+PNk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781687255;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1StBa4+Wi2i/dVx3dxIY8vTk3DLOE9+cTvdCw++76rs=;
	b=O9/bNbuRXS2uZ5xheHuTgcZAOuzV8Sr3AJocsKkSZcJJmG7kn16d8naX2I8uAGySm5InyJ
	P82gFiWkCoISx0Ag==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 38A47779A8;
	Wed, 17 Jun 2026 09:07:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id pBI2DNdjMmoaVAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 17 Jun 2026 09:07:35 +0000
Date: Wed, 17 Jun 2026 11:07:34 +0200
Message-ID: <87ldcdpmax.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] sound updates for 7.2-rc1
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 83A726BB36
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

Linus,

please pull sound fixes for v7.2-rc1 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.2-rc1

The topmost commit is c5e90e8844692deb7bbcd029e8b92b3a20441903

----------------------------------------------------------------

sound updates for 7.2-rc1

Unsurprisingly, we've had a fairly busy development cycle with
various fixes and enhancements.  While the majority of changes consist
of device-specific fixes, a significant number of cleanups, hardening,
and modernizations have been applied to the core frameworks as well.

Below are some highlights:

* ALSA Core:
- Hardening, race condition, and UAF/leak fixes in the ALSA timer and
  sequencer cores
- Widespread adoption of flexible array members across core structures
- Integration of new simple refcount helper functions to simplify code

* ASoC Core:
- Introduction of a unified SoundWire enumeration helper to clean up
  redundant device initialization across codecs
- Enhancements to SDCA support, including handling devices with
  multiple functions of the same type and proper jack reporting masks
- Continued refactoring of ASoC component debugfs and DAPM structures
- Simplification and improvements to the format auto-selection
  mechanism
- Added shared BCLK rate constraints for cross-DAI coordination

* ASoC Platforms & Codecs:
- Initial bring-up and power management support for AMD ACP 7.x
- Support for Everest Semi ES9356 (SDCA), Mediatek MT2701 (on-chip
  HDMI) and MT8196 SoCs, Renesas RZ/G3E, SpacemiT K3, and TI
  TAC5xx2/TAS67524
- Added a new generic driver for GPIO-driven amplifiers
- Continued mass conversion of locking code to guard() helpers across
  numerous platform drivers (MediaTek, Rockchip, STM32, Samsung, etc.)
- Cleanup of legacy non-DT platform data and rollbacks for obsolete SH
  Ecovec24/7724se boards

* HD- and USB-Audio:
- Device-specific hardware quirks and fixes for various Realtek
  HD-Audio devices (Lenovo, HP, ASUS, Acer, Clevo)
- Refinements to Qualcomm USB-audio offloading support
- Front-panel controls and autogain status support for Scarlett Gen 4
- Quirks for XIBERIA (K03S), Sennheiser (MOMENTUM 3), Edifier (MF200),
  Novation (Mininova), and Behringer (Flow 8) USB-audio devices
- Improved robustness by rolling back or propagating write errors to the
  mixer control caches (Babyface Pro, US-16x08, Scarlett)

* Others:
- Support for the HT-Omega eClaro PCI sound card in the Oxygen driver
- Robustness improvements and fixes for Virtio-audio, Xen-front, and
  legacy OSS dmasound drivers

----------------------------------------------------------------

Aaron Ma (3):
      ASoC: rt722-sdca: add FU06 Playback Switch for speaker mute control
      ASoC: amd: acp-sdw-legacy: Bound DAI link iteration
      ASoC: amd: acp-sdw-sof: Bound DAI link iteration

Alexey Charkov (2):
      ASoC: dt-bindings: nau8822: Add supply regulators
      ASoC: codecs: nau8822: add support for supply regulators

Andrei Faleichyk (1):
      ALSA: hda/realtek: Add quirk for ASUS VivoBook X509DAP

Andy Shevchenko (1):
      ASoC: Intel: cht_bsw_rt5672: Drop unneeded NULL checks

Anupama Kunkulagunta (2):
      ASoC: tegra: Add S8 PCM format support for MVC
      ASoC: rt5640: Handle nested IRQs

Arnd Bergmann (5):
      ASoC: arm: pxa2xx: remove platform_data processing
      ASoC: pxa2xx: push gpio usage into arch code
      ASoC: pxa: integrate sound/arm/pxa2xx into sound/soc/pxa2xx
      ASoC: SOF: Intel: select SND_SOC_SDW_UTILS=y from SND_SOC_SOF_HDA_GENERIC=y
      ASoC: SOF: Intel: hda-sdw-bpt: select SND_SOF_SOF_HDA_SDW_BPT properly

Baojun Xu (4):
      ASoC: dt-bindings: ti,tas2781: Add TAS2573 support
      ASoC: tas2781: Add TAS2573 support
      ALSA: hda/tas2781: Fix device-0 reset issue and handle -EXDEV in block data processing
      ASoC: sdw_utils: Add missed component_name strings for TI amps

Bard Liao (6):
      ASoC: sof-function-topology-lib: add virtual loop dai support
      ASoC: SOF: topology: allow user to add topologies
      ASoC: Intel: sof_sdw: append dai type to dai link name unconditionally
      ASoC: sdw_utils: return -EPROBE_DEFER if components are not registered yet
      ASoC: soc_sdw_utils: add is_amp flag to all amps
      ASoC: SOF: Intel: Use codec_info_list.is_amp directly

Binbin Zhou (4):
      MAINTAINERS: Add entry for Loongson ASoC driver
      ASoC: loongson: Combined regmap definitions
      ASoC: loongson: Use the `idma` identifier for internal DMA variables
      ASoC: loongson: Separate external shared DMA from the platform interface

Cameron Graham (1):
      ALSA: hda/hdmi: Add force-connect quirk for HP EliteDesk 800 G5 Mini

Cen Zhang (3):
      ALSA: pcm: use snd_pcm_get_state() in remaining ioctl checks
      ALSA: seq: oss: Serialize readq reset state with q->lock
      ALSA: seq: avoid stale FIFO cells during resize

Cezary Rojewski (14):
      ASoC: core: Move all users to deferrable card binding
      ASoC: Intel: catpt: Complete coredump handling
      ASoC: Intel: catpt: Add pretty-trace for large IPC payloads
      ASoC: Intel: catpt: Print error code if board-registration fails
      ASoC: codecs: pcm3168a: Prevent regulator double-disable in S4
      ASoC: codecs: pcm3168a: Drop redundant pm_runtime_idle()
      ASoC: codecs: pcm3168a: Drop CONFIG_PM-conditional preproc directive
      ASoC: Intel: catpt: Utilize lock-guard helper
      ASoC: Intel: catpt: Replace RAM-helpers with resource_xxx()
      ASoC: Intel: catpt: Simplify the RAM-navigation code
      ASoC: Intel: catpt: Simplify catpt_stream_find()
      ASoC: Intel: catpt: Remove unused WAVES controls
      ASoC: Intel: catpt: Drop manipulation of the obsolete direction flag
      ASoC: Intel: catpt: Cleanup components_kcontrols[]

Chaitanya Sabnis (1):
      ASoC: dt-bindings: cdns,xtfpga-i2s: Convert to dt-schema

Chancel Liu (9):
      ASoC: dt-bindings: imx-card: Complete the full list of supported DAI formats
      ASoC: dapm: Fix widget lookup with prefixed names across DAPM contexts
      ASoC: soc-core: Add core support for ignoring suspend on selected DAPM widgets
      ASoC: fsl: imx-rpmsg: Switch to core ignore-suspend-widgets support
      ASoC: dt-bindings: cirrus,cs42xx8: Add SPI bus support
      ASoC: cs42xx8: Add SPI bus support for CS42448/CS42888 codec
      ASoC: dt-bindings: fsl,rpmsg: Add hp-det-gpios property
      ASoC: imx-rpmsg: Support headphone jack detection
      ASoC: imx-rpmsg: Set driver_name for snd_soc_card

Charles Keepax (33):
      ASoC: SDCA: Add correct masks whilst reporting SDCA jack status
      ASoC: SDCA: Remove sdca_function_data duplication
      ASoC: SDCA: Support devices with multiple functions of identical type
      ASoC: SDCA: Fix bad move of jack_state initialisation
      soundwire: Add a helper function to wait for device initialisation
      ASoC: cs35l56: Use new SoundWire enumeration helper
      ASoC: cs42l42: Use new SoundWire enumeration helper
      ASoC: max98363: Use new SoundWire enumeration helper
      ASoC: max98373: Use new SoundWire enumeration helper
      ASoC: rt700: Use new SoundWire enumeration helper
      ASoC: rt711: Use new SoundWire enumeration helper
      ASoC: rt712: Use new SoundWire enumeration helper
      ASoC: rt715: Use new SoundWire enumeration helper
      ASoc: rt721: Use new SoundWire enumeration helper
      ASoC: rt722: Use new SoundWire enumeration helper
      ASoC: rt1017: Use new SoundWire enumeration helper
      ASoC: rt1308: Use new SoundWire enumeration helper
      ASoC: rt1316: Use new SoundWire enumeration helper
      ASoC: rt1318: Use new SoundWire enumeration helper
      ASoC: rt1320: Use new SoundWire enumeration helper
      ASoC: rt5682: Use new SoundWire enumeration helper
      ASoC: tas2783: Use new SoundWire enumeration helper
      ASoC: tac5xx2-sdw: Use new SoundWire enumeration helper
      ASoC: es9356: Use new SoundWire enumeration helper
      soundwire: Always wait for initialisation of unattached devices
      ASoC: wsa881x: Use new SoundWire enumeration helper
      ASoC: rt5682: Use new SoundWire enumeration helper
      ASoC: pm4125: Use new SoundWire enumeration helper
      ASoC: wcd937x: Use new SoundWire enumeration helper
      ASoC: wcd938x: Use new SoundWire enumeration helper
      ASoC: wcd939x: Use new SoundWire enumeration helper
      ASoC: SDCA: Use new SoundWire enumeration helper
      ASoC: cs35l56: Remove unnecessary conditionals waiting for enumeration

Chia-Lin Kao (AceLan) (1):
      ASoC: sdw_utils: fix missing component_name for cs42l43 part_id 0x2A3B

Colin Ian King (1):
      ALSA: hda/tas2781: Fix spelling mistake: "Froce" -. "Force"

Colton Jones (1):
      ALSA: hda/realtek: Add CS35L41 I2C quirk for ASUS UM3405GA

Cássio Gabriel (47):
      ALSA: opti9xx: restore snd-miro state after resume
      ALSA: usb-audio: Propagate write errors in generic mixer put callbacks
      ALSA: usb-audio: Propagate errors in scarlett_ctl_enum_put()
      ALSA: usb-audio: Propagate US-16x08 write errors in route/mix EQ-switch put callbacks
      ALSA: usb-audio: Update US-16x08 EQ/comp shadow state after successful writes
      ALSA: wavefront: add suspend and resume support
      sound: oss: dmasound: kick queued output before extending tail fragment
      ALSA: usb-audio: Roll back quirk control caches on write errors
      ALSA: usb-audio: Update Babyface Pro control caches only after successful writes
      firmware_loader: Add cancel helper for async requests
      ALSA: hda/tas2781: Cancel async firmware request at unbind
      ASoC: docs: Fix stale and misspelled references
      ALSA: virtio: Validate control metadata from the device
      ALSA: hda/cs35l41: Fix firmware load work teardown
      ALSA: virtio: Add missing 384 kHz PCM rate mapping
      ALSA: ctxfi: Keep line/mic notification controls per mixer
      ASoC: mediatek: mt8196: Fix probe resource cleanup
      ALSA: ice1724: Fix blocking open for independent surround PCMs
      ALSA: usx2y: Drain pending US-428 pipe-4 output commands
      ASoC: mediatek: mt8189: Fix probe resource cleanup
      ALSA: seq: Remove arbitrary prioq insertion limit
      ALSA: xen-front: Reset event channel state on stream clear
      ALSA: xen-front: Connect event channel after stream prepare
      ALSA: seq: Use flexible array for device arguments
      ALSA: core: Use flexible array for card private data
      ASoC: rockchip: i2s: Use managed hclk and runtime PM cleanup
      ASoC: codecs: rk3328: Use managed GPIO and clock helpers
      ASoC: mediatek: mt8183: Release reserved memory on cleanup
      ASoC: mediatek: mt8183: Check runtime resume during probe
      ASoC: mediatek: mt8192: Release reserved memory on cleanup
      ASoC: mediatek: mt8192: Check runtime resume during probe
      ALSA: seq: Restore created port information after insertion
      ALSA: seq: oss: Reject reads that cannot fit the next event
      ALSA: control: Use scoped cleanup for user control buffers
      ALSA: core: Add scoped cleanup helper for card references
      ALSA: seq: oss: Use scoped cleanup for temporary MIDI use lock
      ALSA: usb-audio: qcom: Initialize offload control return value
      ALSA: pcm: Fix unlocked runtime state reads in xfer ioctls
      ASoC: sma1307: Fix uevent string leaks in fault worker
      ASoC: SOF: topology: validate vendor array size before parsing
      ALSA: pcm: Fix unlocked state reads in read/write file ops
      ASoC: topology: Check PCM and DAI name strings before use
      ALSA: usb-audio: qcom: Guard sideband endpoint removal
      ALSA: pcxhr: Share PLL frequency register calculation
      ASoC: qcom: common: use scoped OF node handling
      ASoC: fsl: fsl_qmc_audio: use scoped child node loop
      ASoC: bcm: cygnus: use scoped child node loop

Daniel Golle (6):
      ASoC: dt-bindings: mt2701-afe-pcm: add HDMI audio path clocks
      ASoC: dt-bindings: mediatek,mt2701-hdmi-audio: add MT2701 HDMI audio
      ASoC: mediatek: mt2701: add AFE HDMI register definitions
      ASoC: mediatek: mt2701: add optional HDMI audio path clocks
      ASoC: mediatek: mt2701: add HDMI audio memif, FE and BE DAIs
      ASoC: mediatek: mt2701: add machine driver for on-chip HDMI codec

Darren Ye (10):
      ASoC: mediatek: common: modify mtk afe platform driver for mt8196
      ASoC: mediatek: mt8196: add common header
      ASoC: mediatek: mt8196: support audio clock control
      ASoC: mediatek: mt8196: support ADDA in platform driver
      ASoC: mediatek: mt8196: support I2S in platform driver
      ASoC: mediatek: mt8196: support TDM in platform driver
      ASoC: dt-bindings: mediatek,mt8196-afe: add audio AFE
      ASoC: mediatek: mt8196: add platform driver
      ASoC: dt-bindings: mediatek,mt8196-nau8825: Add audio sound card
      ASoC: mediatek: mt8196: add machine driver with nau8825

Diederik de Haas (1):
      ASoC: dt-bindings: everest,es8389: Document audio graph port

Dirga Yuza (1):
      ALSA: hda/realtek: Add micmute quirk to Acer Nitro AN515-58

Ethan Nelson-Moore (4):
      ASoC: ti: omap3pandora: update board check to use DT compatible
      ASoC: ti: rx51: remove stale reference to machine_is_nokia_rx51()
      ASoC: fsl: eukrea-tlv320: update board checks to use the DT
      ASoC: tas2783A: remove unused tas25xx_(de)register_misc() functions

Ethan Tidmore (1):
      ASoC: cs35l56-shared-test: Fix possible null pointer dereference

Evelyn Ali (1):
      ALSA: hda/realtek: ALC882: Fixup for Clevo P775TM1

Ezio Galeazzi (1):
      ALSA: hda/ca0132: add QUIRK_GENERIC path for Gigabyte GA-Z170X-Gaming G1

Ferus Castor (1):
      ALSA: oxygen: add HT-Omega eClaro (7284:9783) support

Furst Blumier (1):
      ALSA: hda/realtek: Add quirk for HP 255 15.6 inch G9 Notebook PC

Gabriel Jacob Perin (1):
      ASoC: atmel: Change manual bitfield manipulation to use FIELD_PREP()

Geoffrey D. Bennett (5):
      ALSA: scarlett2: Allow selecting config_set by firmware version
      ALSA: scarlett2: Fold min_firmware_version into config_sets
      ALSA: scarlett2: Update offsets for 2i2 Gen 4 firmware 2417
      ALSA: scarlett2: Add Gen 4 firmware 2417 autogain status text
      ALSA: scarlett2: Add Gen 4 firmware 2417 front-panel controls

Gordon Chen (1):
      ALSA: usb-audio: add IFB_SILENCE_ON_EMPTY quirk for Behringer Flow 8

Guangshuo Li (1):
      ASoC: adau1372: Clear PLL_EN on failed PLL lock without reset GPIO

HanQuan (1):
      ALSA: seq: Fix kernel heap address leak in bounce_error_event()

Herve Codina (17):
      of: Introduce of_property_read_s32_index()
      ASoC: dt-bindings: Add support for the GPIOs driven amplifier
      ASoC: simple-amplifier: Remove DRV_NAME defined value
      ASoC: simple-amplifier: Add missing headers
      ASoC: simple-amplifier: Remove CONFIG_OF flag and of_match_ptr()
      ASoC: simple-amplifier: Rename drv_event() function
      ASoC: simple-amplifier: Use 'simple_amp' variable name instead of 'priv'
      ASoC: simple-amplifier: Remove DAPM widgets and routes from the ASoC component driver
      ASoC: simple-amplifier: Introduce support for gpio-audio-amp
      ASoC: simple-amplifier: gpio-audio-amp: Add support for extra power supplies
      ASoC: simple-amplifier: gpio-audio-amp: Add support for mute gpio
      ASoC: simple-amplifier: gpio-audio-amp: Add support for bypass gpio
      ASoC: simple-amplifier: gpio-audio-amp: Add support for basic gain
      ASoC: simple-amplifier: gpio-audio-amp: Add support for gain-ranges
      ASoC: simple-amplifier: gpio-audio-amp: Add support for gain-labels
      ASoC: simple-amplifier: Update author and copyright
      MAINTAINERS: Add the ASoC gpio audio amplifier entry

Huacai Chen (1):
      ALSA: hda/hdmi: Use 'AC_PINSENSE_ELDV' to detect pinsense for Loongson

HyeongJun An (5):
      ALSA: seq: Fix partial userptr event expansion
      ASoC: codecs: hdac_hdmi: Validate written enum value
      ASoC: meson: aiu: Validate written enum values
      ASoC: fsl: fsl_audmix: Validate written enum values
      ASoC: tegra: tegra210_ahub: Validate written enum value

Jack Yu (1):
      ASoC: rt722-sdca: Add a control to support CAE firmware update

Jackie Dong (1):
      ALSA: hda/realtek:ALC269 fixup for Yoga Pro 7 15ASH11 mic mute LED

Janusz Krzysztofik (1):
      ASoC: ti: ams-delta: Stop (ab)using card->pop_time

John Madieu (18):
      ASoC: dt-bindings: sound: Add DT binding for RZ/G3E sound
      ASoC: rsnd: Fix RSND_SOC_MASK width to single nibble
      ASoC: rsnd: Add reset controller support to rsnd_mod
      ASoC: rsnd: Support hyphen or dot in indexed clock and reset names
      ASoC: rsnd: Add RZ/G3E SoC probing and register map
      ASoC: rsnd: Add audmapp clock and reset support for RZ/G3E
      ASoC: rsnd: Refactor DMA address tables with named structs
      ASoC: rsnd: Add RZ/G3E DMA address calculation support
      ASoC: rsnd: ssiu: Add shared SSI reset controller support
      ASoC: rsnd: ssiu: Add RZ/G3E BUSIF support
      ASoC: rsnd: Add SSI reset support for RZ/G3E platform
      ASoC: rsnd: Add ADG reset support for RZ/G3E
      ASoC: rsnd: adg: Add per-SSI ADG and SSIF supply clock management
      ASoC: rsnd: adg: Look up RZ/G3E clkin under audio-clk{a,b,c,i}
      ASoC: rsnd: src: Acquire shared SCU clocks for RZ/G3E
      ASoC: rsnd: src: Add SRC reset support for RZ/G3E
      ASoC: rsnd: Support unprefixed DT node names for RZ/G3E
      ASoC: rsnd: Add system suspend/resume support

Johny Lin (1):
      ALSA: hda: cs35l41: imply SERIAL_MULTI_INSTANTIATE

João (1):
      ASoC: mchp-spdifrx: Replace manual bitfield manipulations with macros and typo correction

Krzysztof Kozlowski (2):
      ASoC: tegra: Move MODULE_DEVICE_TABLE next to the table itself
      ASoC: rockchip: Move MODULE_DEVICE_TABLE next to the table itself

Kuninori Morimoto (32):
      ASoC: soc-dapm: move card->pop_time to soc-dapm.c
      ASoC: soc-card: add snd_soc_card_set_topology_name()
      ASoC: amd: acp3x-rn: remove unused machine
      ASoC: amd: acp6x-mach: remove unused machine
      ASoC: amd: ps-mach: remove unused machine
      ASoC: soc-core: remove card->dmi_longname
      sh: ecovec24: remove FSI/DA7210/Simple-Audio-Card support
      sh: 7724se: remove FSI/AK4642/Simple-Audio-Card support
      ASoC: simple-card: remove platform data style
      sh: roll back Ecovec24/7724se Sound support
      ASoC: renesas: fsi: remove platform data style support
      ASoC: soc-component: remove CONFIG_DEBUG_FS for debugfs_prefix
      ASoC: fsl: imx-pcm-rpmsg: set debugfs_prefix via Component driver
      ASoC: soc-generic-dmaengine: set debugfs_prefix via Component driver
      ASoC: stm: stm32_adfsdm: set debugfs_prefix via Component driver
      ASoC: mediatek: mt8173-afe-pcm: set debugfs_prefix via Component driver
      ASoC: soc-component: remove .debugfs_prefix from Component
      ASoC: mediatek: cleanup mtk_sof_dailink_parse_of() param
      ASoC: mediatek: mtk-soundcard-driver: tidyup set_card_codec_info()
      ASoC: mediatek: mtk-soundcard-driver: tidyup set_dailink_daifmt()
      ASoC: mediatek: mt8186-mt6366: tidyup mt8186_mt6366_card_set_be_link()
      ASoC: mediatek: mt8186-mt6366: use *dev in mt8186_mt6366_soc_card_probe()
      ASoC: mediatek: mt8365_mt6357: use *dev in mt8365_mt6357_gpio_probe()
      ASoC: remove SND_SOC_POSSIBLE_xBx_xFx
      ASoC: codecs: framer-codec: don't use array if single pattern
      ASoC: codecs: idt821034: don't use array if single pattern
      ASoC: codecs: peb2466: don't use array if single pattern
      ASoC: codecs: ak4619: update auto select format
      ASoC: codecs: pcm3168a: update auto select format
      ASoC: renesas: rcar: update auto select format
      ASoC: update auto format selection method
      ASoC: audio-graph-card2: recommend to use auto select DAI format

Kyle Zeng (1):
      ALSA: seq: Clear variable event pointer on read

Len Bao (3):
      ALSA: isa: Mark '*_registered' variables as __ro_after_init
      ALSA: core: Mark some variables as __ro_after_init
      ALSA: drivers: Mark some variables as __ro_after_init

Lianqin Hu (1):
      ALSA: usb-audio: Add iface reset and delay quirk for XIBERIA K03S

Lucas Poupeau (1):
      ALSA: ac97: clean up whitespace and move EXPORT_SYMBOLs

Maciej Strozek (2):
      ASoC: soc_sdw_utils: skip aux device if it is not present
      ASoC: soc_sdw_utils: Change comment into proper kernel doc

Manish Baing (1):
      ASoC: dt-bindings: mediatek,mt6351: convert to DT schema

Marco Crivellari (2):
      ASoC: cs42l43: Move long delayed work on system_dfl_long_wq
      ASoC: codecs: rt5640: Move long delayed work on system_dfl_long_wq

Marek Vasut (3):
      ASoC: tlv320aic3x: Add multi endpoint support
      ASoC: dt-bindings: fsl-sai: Document RX/TX BCLK swap support
      ASoC: fsl_sai: Add RX/TX BCLK swap support

Mark Brown (1):
      ASoC: ops: Log unknown controls in snd_soc_limit_volume()

Markus Elfring (1):
      ALSA: 6fire: Use common error handling code in usb6fire_control_init()

Md Shofiqul Islam (1):
      ASoC: nau8825: Fix typos in comments

Moritz Baron (1):
      ALSA: hda/realtek: Add quirk for Lenovo Yoga Pro 7 14IRH8

Nathan Chancellor (3):
      ASoC: SDCA: Make CONFIG_SND_SOC_SDCA a user selectable symbol
      ASoC: codecs: Adjust indentation in CONFIG_SND_SOC_ES9356 definition
      ASoC: es9356-sdca: Depend on CONFIG_SND_SOC_SDCA

Niranjan H Y (5):
      ASoC: SDCA: Add PDE verification reusable helper
      ASoC: tac5xx2-sdw: add soundwire based codec driver
      ASoC: sdw_utils: TI amp utility for tac5xx2 family
      ASoC: tac5xx2-sdw: ACPI match for intel mtl platform
      ASoC: sdw_utils: Remove dead code in asoc_sdw_ti_add_tac5xx2_routes()

Oliver Hartkopp (1):
      ALSA: hda: fix Kconfig dependency of HD Audio PCI

Peter Ujfalusi (14):
      ASoC: SOF: ipc4-topology: Handle SOF_DBG_DISABLE_MULTICORE flag for pipelines
      ASoC: SOF: Validate and correct the core id against the number of cores of the DSP
      ASoC: SOF: ipc4-control: Use local copy of IPC message for sending
      ASoC: SOF: Intel: hda-mlink/lnl: Convert offload enable functions to void
      ASoC: SOF: Intel: lnl: Enable offload for UAOL link
      ASoC: SOF: ipc4-topology: Print for format type in dbg_audio_format
      ASoC: SOF: ipc4-topology: Validate the number of in/out formats for src/asrc
      ASoC: SOF: ipc4-topology: Allow the use of multiple formats for src output
      ASoC: SOF: ipc4-control: Fix TOCTOU in sof_ipc4_bytes_put
      ASoC: SOF: ipc4-control: Validate notification payload size
      ASoC: SOF: ipc3-control: Use overflow checks in control_update size calc
      ASoC: SOF: ipc3-control: Validate size in snd_sof_update_control
      ASoC: SOF: ipc3-control: Fix TOCTOU in bytes_put and bytes_get
      ASoC: SOF: ipc3-control: Fix heap overflow in bytes_ext put/get

Piyush Patle (2):
      ASoC: tegra210_adx: simplify byte map get/put logic
      ASoC: tegra210_amx: simplify byte map get/put logic

Randy Dunlap (1):
      ASoC: docs: fix TAS675x doc build warnings

Richard Fitzgerald (17):
      ASoC: cs35l56: Abort TDM mask loop at maximum channel shift
      ASoC: cs35l56-shared-test: Subtract reg_base offset in dummy regmap
      ASoC: cs35l56: Use reg_base to offset addresses on SoundWire
      ASoC: cs35l56: Use standard SoundWire regmap implementation
      ASoC: cs35l56-shared-test: Subtract reg_base offset in dummy regmap
      ASoC: cs35l56: Use reg_base to offset addresses on SoundWire
      ASoC: cs35l56: Use standard SoundWire regmap implementation
      ASoC: cs-amp-lib: Simplify overcomplicated error return
      ASoC: cs35l56: Share common SoundWire interrupt enable/disable code
      ASoC: cs35l56: Increase pm_runtime autosuspend delay
      ASoC: cs35l56: Fix missing calls to wm_adsp2_remove()
      ASoC: cs35l56: Prevent double-free of debugfs
      ASoC: cs35l56: Cleanup if component_probe fails
      ASoC: cs35l56: Don't leave parent IRQ disabled if system_suspend fails
      ASoC: cs35l56: Fix possible uninitialized value in cs35l56_spi_system_reset()
      ASoC: soc-core: Create device_link to ensure correct suspend order
      ASoC: cs35l56: Fix wrong error test on simple_write_to_buffer()

Rob Herring (Arm) (1):
      ASoC: dt-bindings: Fix RT5677 "realtek,gpio-config" type

Rong Zhang (4):
      ALSA: doc: usb-audio: Add doc for QUIRK_FLAG_IFB_SILENCE_ON_EMPTY
      ALSA: usb-audio: Add QUIRK_FLAG_MIXER_GET_CUR_BROKEN
      ALSA: usb-audio: Add quirk flag for Sennheiser MOMENTUM 3
      ALSA: usb-audio: Add quirk flag for Edifier MF200

Rosen Penev (19):
      ALSA: ctxfi: simplify mixer allocation
      ASoC: ti: j721e-evm: allocate dai_links with priv
      ALSA: seq: oss/rw: allocate evrec with main struct
      ASoC: tegra: ADMAIF: allocate with a single kzalloc
      ASoC: tegra: tegra210-mixer: Use div_u64() for 64-bit division
      ALSA: seq: Use flexible array for MIDI channels
      ALSA: ctxfi: Use flexible array for SRCIMP imappers
      ALSA: asihpi: Use flexible array for control cache
      ASoC: pcm6240: Use flexible array for config blocks
      ASoC: sigmadsp: Use flexible array for control cache
      ALSA: oss: Use flexible allocation for PCM plugins
      ALSA: usb-audio: Use flexible allocation for FCP packets
      ALSA: usb-audio: Use flexible allocation for Scarlett2 packets
      ASoC: fsl: Allow MPC5200 PSC audio compile testing
      ASoC: uda1380: remove kmemdup_array
      ASoC: mediatek: mt2701: allocate i2s_path with priv
      ASoC: mediatek: mt2701: fix snprintf bounds
      ASoC: aw88395: use struct_size() and __counted_by() for aw_container
      ASoC: tegra: ADX: use of_device_get_match_data

Ruoyu Wang (1):
      ALSA: es18xx: check control allocation before private data setup

Sachin Mokashi (1):
      ASoC: Intel: cht_bsw_rt5672: Simplify probe() with local 'dev' pointer

Sen Wang (5):
      ASoC: dt-bindings: Add ti,tas67524
      ASoC: codecs: Add TAS67524 quad-channel audio amplifier driver
      Documentation: sound: Add TAS675x codec mixer controls documentation
      MAINTAINERS: add entry for TAS67524 audio amplifier
      ASoC: ti: davinci-mcasp: Add audio-graph-card2 and DPCM support

Seppo Ingalsuo (1):
      ASoC: SOF: ipc4-topology: Enable deep buffer capture

Sheetal (2):
      ASoC: tegra: Add per-stream Mixer Fade controls
      ASoC: tegra: tegra210-mixer: Reject too-short fade durations

Shengjiu Wang (6):
      ASoC: fsl_micfil: Add DC output remover control
      ASoC: fsl-asoc-card: enable dpcm_merged_chan flag for ASRC frontend
      ASoC: fsl-asoc-card: enable ignore_pmdown_time for ASRC case
      ASoC: fsl-asoc-card: add channel and rate constraints for CS42888
      ASoC: fsl-asoc-card: exclude S20_3LE format for WM8960/WM8962 + SAI
      ASoC: fsl-asoc-card: reduce WM8904 PLL ratio to meet frequency limit

Simon Wood (1):
      ALSA: M-Audio C600 disable Output Gain Knob

Srinivas Kandagatla (8):
      ASoC: mt8173-max98090: use standard callback to set jack
      ASoC: codecs: max98090: use component set_jack callback
      ASoC: qcom: audioreach: use cached shared memory module IID
      ASoC: qcom: q6apm: return error code to consumers on failures
      ASoC: qcom: q6apm: remove shared memory IID helpers
      ASoC: qcom: audioreach: Add support for shared memory push/pull modules
      ASoC: qcom: q6apm: add watermark event support
      ASoC: qcom: q6apm-dai: add push-pull and watermark event support

Takashi Iwai (16):
      ALSA: seq: Register kernel port with full information
      Revert "ALSA: scarlett2: Fix 2i2 Gen 4 direct monitor gain on firmware 2417"
      ALSA: seq: oss: Fix UAF at handling events with embedded SysEx data
      ALSA: usb: qcom: Drop unused variables
      ALSA: aloop: Drop superfluous break
      ALSA: timer: Manage timer object with kref
      Revert "ALSA: timer: Fix UAF at snd_timer_user_params()"
      ALSA: timer: Disable work at freeing timer object
      ALSA: Add simple refcount helper functions
      ALSA: core: Use the new helper for the power refcount
      ALSA: hda: Use the new helper for PCM instance refcount
      ALSA: aloop: Use the new helper for stop-count refcount
      ALSA: usb-audio: Use the new helper for shutdown refcount
      ALSA: seq: Don't re-bounce the error event
      ALSA: core: Fix unintuitive behavior of snd_power_ref_and_wait()
      ALSA: timer: Fix racy timeri->timer changes with rwlock

Thorsten Blum (2):
      ALSA: jack: use scnprintf to improve parse_mask_bits
      ALSA: usb-audio: simplify mixer control name handling

Troy Mitchell (5):
      ASoC: soc-dai: add shared BCLK clock for cross-DAI rate constraints
      ASoC: soc-pcm: add DEFINE_GUARD for snd_soc_card_mutex
      ASoC: soc-pcm: constrain hw_params when DAIs share the same BCLK
      ASoC: dt-bindings: add SpacemiT K3 SoC compatible
      ASoC: spacemit: add K3 SoC support with additional clocks

Tuo Li (1):
      ASoC: mediatek: mt8365-afe-pcm: fix possible NULL-pointer dereferences in mt8365_afe_suspend()

Uwe Kleine-König (The Capable Hub) (4):
      ALSA: Consistently define pci_device_ids using named initializers
      ASoC: Drop empty i2c remove callbacks
      ASoC: Use named initializers for arrays of i2c_device_data
      ALSA: Improve style of pnp_device_id array terminators

Uwe Küchler (1):
      ALSA: usb-audio: Add quirk for Novation Mininova

Val Packett (7):
      ASoC: codecs: aw88261: support changing sample rate and bit width
      ASoC: codecs: aw88261: add TDM support
      ASoC: codecs: aw88261: reduce log spam
      ASoC: codecs: aw88261: remove fade in/out on start/stop
      ASoC: codecs: aw88261: remove async start
      ASoC: codecs: aw88261: fix incorrect masks for boost regs
      ASoC: codecs: aw88261: make volume control usable

Vijendar Mukunda (7):
      include: sound: add register header file for acp7.x series
      ASoC: amd: acp7x: add ACP PCI driver probe/remove sequence
      ASoC: amd: acp7x: add helper functions and hw ops
      ASoC: amd: enable acp7.x drivers build
      ASoC: amd: acp7x: add system and runtime PM ops
      ASoC: amd: ps: honor machine_check in SoundWire machine select
      ASoC: SOF: amd: honor machine_check in SoundWire machine select

Viktor Menshin (1):
      ALSA: hda/realtek: Add quirk for Lenovo Xiaoxin 14 GT

Zhang Cen (1):
      ALSA: seq: midi: Serialize output teardown with event_input

Zhang Yi (5):
      ASoC: sdw_utils: add soc_sdw_es9356
      ASoC: sdw_utils: add ES9356 in codec_info_list
      ASoC: es9356-sdca: Add ES9356 SDCA driver
      ASoC: Intel: soc-acpi: arl: Add es9356 support
      ASoC: Intel: sof_sdw: add es9356 support

Zhao Dongdong (7):
      ALSA: es1938: check snd_ctl_new1() return value
      ALSA: gus: check snd_ctl_new1() return value
      ALSA: ice1712: check snd_ctl_new1() return value
      ALSA: ymfpci: check snd_ctl_new1() return value
      ALSA: cmipci: check snd_ctl_new1() return value
      ALSA: aoa: check snd_ctl_new1() return value
      ASoC: SOF: topology: fix memory leak in snd_sof_load_topology

bui duc phuc (57):
      ASoC: apple: mca: Use guard() for mutex locks
      ASoC: samsung: i2s: Use guard() for spin locks
      ASoC: samsung: idma: Use guard() for spin locks
      ASoC: samsung: odroid: Use guard() for spin locks
      ASoC: samsung: pcm: Use guard() for spin locks
      ASoC: samsung: spdif: Use guard() for spin locks
      ASoC: ux500: Use guard() for mutex locks
      ASoC: tegra: Use guard() for mutex locks
      ASoC: uniphier: aio-compress: Use guard() for spin locks
      ASoC: uniphier: aio-dma: Use guard() for spin locks
      ASoC: ti: j721e-evm: Use guard() for mutex locks
      ASoC: ti: omap-dmic: Use guard() for mutex locks
      ASoC: ti: omap-hdmi: Use guard() for mutex locks
      ASoC: ti: omap-mcpdm: Use guard() for mutex locks
      ASoC: ti: ams-delta: Use guard() for spin locks
      ASoC: ti: omap-mcbsp-st: Use guard() for spin locks
      ASoC: ti: omap-mcbsp: Simplify lock and resource handling
      ASoC: ti: omap-mcbsp: Remove mixed goto/scoped cleanup handling
      ASoC: stm: stm32_adfsdm: Use guard() for mutex locks
      ASoC: stm: stm32_i2s: Use guard() for spin locks
      ASoC: stm: stm32_sai_sub: Use guard() for mutex & spin locks
      ASoC: stm: stm32_spdifrx: Use guard() for spin locks
      ASoC: sti: uniperif_reader: Use guard() for spin locks
      ASoC: sti: uniperif_player: Use guard() for mutex & spin locks
      ASoC: sprd: sprd-mcdt: Use guard() for mutex & spin locks
      ASoC: dt-bindings: renesas,fsi: add support multiple clocks
      ASoC: renesas: fsi: Fix trigger stop ordering
      ASoC: renesas: fsi: Move fsi_stream_is_working()
      ASoC: renesas: fsi: Fix register access from in-flight IRQ after shutdown
      ASoC: renesas: fsi: Move fsi_clk_init()
      ASoC: renesas: fsi: Use devm_clk_get_optional() for optional clocks
      ASoC: renesas: fsi: refactor clock initialization
      ASoC: renesas: fsi: Add SPU clock support
      ASoC: renesas: fsi: add fsi_clk_prepare/unprepare()
      ASoC: renesas: fsi: Add SPU clock control in hw_startup/shutdown
      ASoC: meson: axg-tdm-formatter: Use guard() for mutex locks
      ASoC: img: img-spdif-in: Use guard() for spin locks
      ASoC: img: img-spdif-out: Use guard() for spin locks
      ASoC: dt-bindings: rockchip-spdif: Correct SPDIF clock descriptions
      ASoC: rockchip: spdif: Reorder clock enable sequence
      ASoC: rockchip: rockchip_pdm: Reorder clock enable sequence
      ASoC: rockchip: spdif: Restore regcache cache-only mode on sync failure
      ASoC: rockchip: rockchip_pdm: Handle runtime PM resume failures in set_fmt
      ASoC: rockchip: rockchip_i2s: Use guard() for spin locks
      ASoC: rockchip: i2s-tdm: Use guard() for spin locks
      ASoC: rockchip: rockchip_sai: Use guard() for spin locks
      ASoC: mediatek: common: mtk-afe-fe-dai: Use guard() for mutex locks
      ASoC: mediatek: common: mtk-btcvsd: Use guard() for spin locks
      ASoC: mediatek: mt8186: mt8186-afe-gpio: Use guard() for mutex locks
      ASoC: mediatek: mt8188: mt8188-afe-clk: Use guard() for spin locks
      ASoC: mediatek: mt8192: mt8192-afe-gpio: Use guard() for mutex locks
      ASoC: mediatek: mt8195: mt8195-afe-clk: Use guard() for spin locks
      ASoC: mediatek: mt8195: mt8195-dai-etdm: Use guard() for spin locks
      ASoC: mediatek: mt8195: mt8365-afe-clk: Use guard() for mutex & spin locks
      ASoC: mediatek: mt8195: mt8365-dai-adda: Use guard() for spin locks
      ASoC: mediatek: mt8195: mt8365-dai-i2s: Use guard() for spin locks
      ASoC: hisilicon: Use guard() for spin locks

wangdicheng (4):
      ALSA: usb-audio: qcom: Improve error logging in USB offload
      ALSA: usb-audio: qcom: Use snprintf for mixer control name formatting
      ALSA: usb-audio: qcom: Fix return value in qc_usb_audio_offload_fill_avail_pcms
      ALSA: usb-audio: qcom: Use PAGE_ALIGN macro for buffer size calculation

---
 .../devicetree/bindings/sound/cdns,xtfpga-i2s.txt  |    18 -
 .../devicetree/bindings/sound/cdns,xtfpga-i2s.yaml |    48 +
 .../devicetree/bindings/sound/cirrus,cs42xx8.yaml  |    23 +
 .../devicetree/bindings/sound/everest,es8389.yaml  |     4 +
 .../devicetree/bindings/sound/fsl,rpmsg.yaml       |     4 +
 .../devicetree/bindings/sound/fsl,sai.yaml         |     7 +
 .../devicetree/bindings/sound/gpio-audio-amp.yaml  |   270 +
 .../devicetree/bindings/sound/imx-audio-card.yaml  |     6 +
 .../bindings/sound/mediatek,mt2701-audio.yaml      |    23 +
 .../bindings/sound/mediatek,mt2701-hdmi-audio.yaml |    48 +
 .../bindings/sound/mediatek,mt6351-sound.yaml      |    37 +
 .../bindings/sound/mediatek,mt8196-afe.yaml        |   113 +
 .../bindings/sound/mediatek,mt8196-nau8825.yaml    |   100 +
 Documentation/devicetree/bindings/sound/mt6351.txt |    16 -
 .../devicetree/bindings/sound/nuvoton,nau8822.yaml |    18 +
 .../devicetree/bindings/sound/realtek,rt5677.yaml  |     4 +-
 .../devicetree/bindings/sound/renesas,fsi.yaml     |    60 +-
 .../bindings/sound/renesas,r9a09g047-sound.yaml    |   800 ++
 .../devicetree/bindings/sound/rockchip-spdif.yaml  |     2 +-
 .../devicetree/bindings/sound/spacemit,k1-i2s.yaml |    31 +-
 .../devicetree/bindings/sound/ti,tas2781.yaml      |     5 +
 .../devicetree/bindings/sound/ti,tas67524.yaml     |   280 +
 Documentation/sound/alsa-configuration.rst         |    22 +-
 Documentation/sound/codecs/index.rst               |     1 +
 Documentation/sound/codecs/tas675x.rst             |   820 ++
 Documentation/sound/soc/index.rst                  |     2 +-
 Documentation/sound/soc/platform.rst               |     2 +-
 Documentation/sound/soc/usb.rst                    |     4 +-
 MAINTAINERS                                        |    20 +
 arch/arm/mach-pxa/pxa27x.c                         |     9 +-
 drivers/base/firmware_loader/main.c                |    68 +-
 drivers/soundwire/bus.c                            |    28 +
 include/linux/firmware.h                           |    10 +
 include/linux/of.h                                 |     7 +
 include/linux/platform_data/asoc-pxa.h             |    23 +-
 include/linux/soundwire/sdw.h                      |     8 +
 include/sound/ac97/codec.h                         |     5 +-
 include/sound/ac97/controller.h                    |     5 +-
 include/sound/acp7x_chip_offset_byte.h             |  2519 ++++
 include/sound/core.h                               |    35 +-
 include/sound/cs35l56.h                            |     2 +
 include/sound/emux_synth.h                         |     2 +-
 include/sound/hda-mlink.h                          |     5 +-
 include/sound/hda_codec.h                          |    11 +-
 include/sound/pxa2xx-lib.h                         |    50 +-
 include/sound/sdca.h                               |     4 +
 include/sound/sdca_asoc.h                          |     6 +
 include/sound/sdca_function.h                      |     1 -
 include/sound/sdca_jack.h                          |     3 +
 include/sound/seq_device.h                         |     3 +-
 include/sound/seq_midi_emul.h                      |     6 +-
 include/sound/snd_wavefront.h                      |     7 +
 include/sound/soc-card.h                           |     2 +
 include/sound/soc-component.h                      |     3 -
 include/sound/soc-dai.h                            |    22 +-
 include/sound/soc-dapm.h                           |     3 +
 include/sound/soc.h                                |    15 +-
 include/sound/soc_sdw_utils.h                      |    18 +
 include/sound/tas2781.h                            |     1 +
 include/sound/timer.h                              |     6 +
 sound/ac97/bus.c                                   |    26 +-
 sound/ac97_bus.c                                   |     4 +-
 sound/aoa/fabrics/layout.c                         |     6 +
 sound/arm/Kconfig                                  |     7 -
 sound/arm/Makefile                                 |     4 -
 sound/core/control.c                               |    36 +-
 sound/core/control_led.c                           |    11 +-
 sound/core/hrtimer.c                               |     2 +-
 sound/core/init.c                                  |    21 +-
 sound/core/jack.c                                  |    13 +-
 sound/core/misc.c                                  |    24 +
 sound/core/oss/pcm_oss.c                           |     4 +-
 sound/core/oss/pcm_plugin.c                        |     2 +-
 sound/core/pcm_compat.c                            |     4 +-
 sound/core/pcm_native.c                            |    41 +-
 sound/core/rawmidi.c                               |     4 +-
 sound/core/seq/oss/seq_oss_event.c                 |     6 +-
 sound/core/seq/oss/seq_oss_event.h                 |     4 +-
 sound/core/seq/oss/seq_oss_init.c                  |     4 +-
 sound/core/seq/oss/seq_oss_ioctl.c                 |     7 +-
 sound/core/seq/oss/seq_oss_midi.c                  |     6 +-
 sound/core/seq/oss/seq_oss_midi.h                  |     2 +-
 sound/core/seq/oss/seq_oss_readq.c                 |    90 +-
 sound/core/seq/oss/seq_oss_readq.h                 |     3 +-
 sound/core/seq/oss/seq_oss_rw.c                    |     7 +-
 sound/core/seq/seq_clientmgr.c                     |    47 +-
 sound/core/seq/seq_dummy.c                         |     2 +-
 sound/core/seq/seq_fifo.c                          |    52 +-
 sound/core/seq/seq_memory.c                        |     2 +-
 sound/core/seq/seq_midi.c                          |    55 +-
 sound/core/seq/seq_midi_emul.c                     |    38 +-
 sound/core/seq/seq_ports.c                         |    27 +-
 sound/core/seq/seq_ports.h                         |     8 +-
 sound/core/seq/seq_prioq.c                         |    14 +-
 sound/core/seq/seq_timer.c                         |    11 +-
 sound/core/seq_device.c                            |     5 +-
 sound/core/timer.c                                 |   125 +-
 sound/core/timer_compat.c                          |     5 +-
 sound/drivers/aloop.c                              |    14 +-
 sound/drivers/mpu401/mpu401.c                      |     4 +-
 sound/drivers/pcmtest.c                            |     4 +-
 sound/hda/codecs/Kconfig                           |     1 +
 sound/hda/codecs/ca0132.c                          |   111 +-
 sound/hda/codecs/hdmi/hdmi.c                       |     9 +-
 sound/hda/codecs/realtek/alc269.c                  |    41 +-
 sound/hda/codecs/realtek/alc882.c                  |    22 +
 sound/hda/codecs/side-codecs/Kconfig               |     2 +
 sound/hda/codecs/side-codecs/cs35l41_hda.c         |    77 +-
 sound/hda/codecs/side-codecs/cs35l41_hda.h         |     5 +
 sound/hda/codecs/side-codecs/cs35l41_hda_i2c.c     |     4 +-
 sound/hda/codecs/side-codecs/cs35l56_hda_i2c.c     |     8 +-
 sound/hda/codecs/side-codecs/tas2781_hda_i2c.c     |     7 +-
 sound/hda/codecs/side-codecs/tas2781_hda_spi.c     |    21 +-
 sound/hda/common/bind.c                            |     3 +-
 sound/hda/common/codec.c                           |    14 +-
 sound/hda/common/jack.c                            |     6 +
 sound/hda/controllers/Kconfig                      |     2 +-
 sound/hda/core/i915.c                              |    30 +-
 sound/isa/cmi8330.c                                |     4 +-
 sound/isa/cs423x/cs4236.c                          |     8 +-
 sound/isa/es18xx.c                                 |    12 +-
 sound/isa/gus/gus_pcm.c                            |     2 +
 sound/isa/gus/interwave.c                          |     4 +-
 sound/isa/msnd/msnd_pinnacle.c                     |     4 +-
 sound/isa/opl3sa2.c                                |     8 +-
 sound/isa/opti9xx/miro.c                           |   268 +-
 sound/isa/sb/sb16.c                                |     4 +-
 sound/isa/sscape.c                                 |     4 +-
 sound/isa/wavefront/wavefront.c                    |    65 +-
 sound/isa/wavefront/wavefront_midi.c               |    47 +-
 sound/isa/wavefront/wavefront_synth.c              |    96 +
 sound/oss/dmasound/dmasound_core.c                 |    10 +-
 sound/pci/ali5451/ali5451.c                        |     4 +-
 sound/pci/als300.c                                 |     6 +-
 sound/pci/als4000.c                                |     4 +-
 sound/pci/asihpi/asihpi.c                          |    17 +-
 sound/pci/asihpi/hpicmn.c                          |    16 +-
 sound/pci/asihpi/hpicmn.h                          |     4 +-
 sound/pci/asihpi/hpipcida.h                        |    18 +-
 sound/pci/atiixp.c                                 |    10 +-
 sound/pci/atiixp_modem.c                           |     6 +-
 sound/pci/au88x0/au8810.c                          |     4 +-
 sound/pci/au88x0/au8820.c                          |     4 +-
 sound/pci/au88x0/au8830.c                          |     4 +-
 sound/pci/aw2/aw2-alsa.c                           |     5 +-
 sound/pci/azt3328.c                                |     6 +-
 sound/pci/ca0106/ca0106_main.c                     |     4 +-
 sound/pci/cmipci.c                                 |    18 +-
 sound/pci/cs4281.c                                 |     4 +-
 sound/pci/cs46xx/cs46xx.c                          |     8 +-
 sound/pci/ctxfi/ctmixer.c                          |    44 +-
 sound/pci/ctxfi/ctmixer.h                          |     7 +-
 sound/pci/ctxfi/ctsrc.c                            |    15 +-
 sound/pci/ctxfi/ctsrc.h                            |     2 +-
 sound/pci/echoaudio/darla20.c                      |     4 +-
 sound/pci/echoaudio/darla24.c                      |     6 +-
 sound/pci/echoaudio/echo3g.c                       |     4 +-
 sound/pci/echoaudio/gina20.c                       |     4 +-
 sound/pci/echoaudio/gina24.c                       |    10 +-
 sound/pci/echoaudio/indigo.c                       |     4 +-
 sound/pci/echoaudio/indigodj.c                     |     4 +-
 sound/pci/echoaudio/indigodjx.c                    |     4 +-
 sound/pci/echoaudio/indigoio.c                     |     4 +-
 sound/pci/echoaudio/indigoiox.c                    |     4 +-
 sound/pci/echoaudio/layla20.c                      |     6 +-
 sound/pci/echoaudio/layla24.c                      |     4 +-
 sound/pci/echoaudio/mia.c                          |     6 +-
 sound/pci/echoaudio/mona.c                         |    20 +-
 sound/pci/emu10k1/emu10k1.c                        |     8 +-
 sound/pci/emu10k1/emu10k1x.c                       |     4 +-
 sound/pci/ens1370.c                                |    10 +-
 sound/pci/es1938.c                                 |     6 +-
 sound/pci/es1968.c                                 |    27 +-
 sound/pci/fm801.c                                  |    15 +-
 sound/pci/ice1712/aureon.c                         |     2 +
 sound/pci/ice1712/ice1712.c                        |    12 +-
 sound/pci/ice1712/ice1724.c                        |    29 +-
 sound/pci/intel8x0.c                               |   118 +-
 sound/pci/intel8x0m.c                              |    88 +-
 sound/pci/maestro3.c                               |    51 +-
 sound/pci/mixart/mixart.c                          |     4 +-
 sound/pci/nm256/nm256.c                            |     8 +-
 sound/pci/oxygen/oxygen.c                          |   270 +-
 sound/pci/pcxhr/pcxhr.c                            |    83 +-
 sound/pci/pcxhr/pcxhr.h                            |     2 +
 sound/pci/pcxhr/pcxhr_mix22.c                      |    33 +-
 sound/pci/rme32.c                                  |     8 +-
 sound/pci/rme96.c                                  |    10 +-
 sound/pci/sonicvibes.c                             |     4 +-
 sound/pci/trident/trident.c                        |    16 +-
 sound/pci/via82xx.c                                |     6 +-
 sound/pci/via82xx_modem.c                          |     4 +-
 sound/pci/vx222/vx222.c                            |     6 +-
 sound/pci/ymfpci/ymfpci.c                          |    14 +-
 sound/pci/ymfpci/ymfpci_main.c                     |     6 +
 sound/soc/amd/Kconfig                              |    10 +
 sound/soc/amd/Makefile                             |     1 +
 sound/soc/amd/acp/acp-sdw-legacy-mach.c            |     7 +-
 sound/soc/amd/acp/acp-sdw-sof-mach.c               |     7 +-
 sound/soc/amd/acp7x/Makefile                       |     5 +
 sound/soc/amd/acp7x/acp7x-common.c                 |   125 +
 sound/soc/amd/acp7x/acp7x.h                        |   110 +
 sound/soc/amd/acp7x/pci-acp7x.c                    |   168 +
 sound/soc/amd/ps/pci-ps.c                          |     3 +-
 sound/soc/amd/ps/ps-mach.c                         |     2 -
 sound/soc/amd/renoir/acp3x-rn.c                    |     2 -
 sound/soc/amd/yc/acp6x-mach.c                      |     2 -
 sound/soc/apple/mca.c                              |    14 +-
 sound/soc/atmel/atmel-classd.c                     |    41 +-
 sound/soc/atmel/mchp-spdifrx.c                     |    33 +-
 sound/soc/bcm/cygnus-ssp.c                         |    10 +-
 sound/soc/codecs/Kconfig                           |    40 +-
 sound/soc/codecs/Makefile                          |     8 +
 sound/soc/codecs/ad193x-i2c.c                      |     4 +-
 sound/soc/codecs/adau1372-i2c.c                    |     2 +-
 sound/soc/codecs/adau1372.c                        |     5 +
 sound/soc/codecs/adau1373.c                        |     2 +-
 sound/soc/codecs/adau1701.c                        |     8 +-
 sound/soc/codecs/adau1761-i2c.c                    |     8 +-
 sound/soc/codecs/adau1781-i2c.c                    |     4 +-
 sound/soc/codecs/adau1977-i2c.c                    |     6 +-
 sound/soc/codecs/adau7118-i2c.c                    |     4 +-
 sound/soc/codecs/adav803.c                         |     2 +-
 sound/soc/codecs/ak4118.c                          |     4 +-
 sound/soc/codecs/ak4535.c                          |     2 +-
 sound/soc/codecs/ak4613.c                          |     7 +-
 sound/soc/codecs/ak4619.c                          |    10 +-
 sound/soc/codecs/ak4642.c                          |     8 +-
 sound/soc/codecs/ak4671.c                          |     2 +-
 sound/soc/codecs/alc5623.c                         |     8 +-
 sound/soc/codecs/alc5632.c                         |     4 +-
 sound/soc/codecs/aw87390.c                         |     4 +-
 sound/soc/codecs/aw88081.c                         |    16 +-
 sound/soc/codecs/aw88166.c                         |     2 +-
 sound/soc/codecs/aw88261.c                         |   640 +-
 sound/soc/codecs/aw88261.h                         |   185 +-
 sound/soc/codecs/aw88395/aw88395.c                 |    13 +-
 sound/soc/codecs/aw88395/aw88395_device.h          |     2 +-
 sound/soc/codecs/aw88399.c                         |     2 +-
 sound/soc/codecs/cs-amp-lib.c                      |     5 +-
 sound/soc/codecs/cs35l32.c                         |     4 +-
 sound/soc/codecs/cs35l33.c                         |     4 +-
 sound/soc/codecs/cs35l34.c                         |     4 +-
 sound/soc/codecs/cs35l35.c                         |     4 +-
 sound/soc/codecs/cs35l36.c                         |     4 +-
 sound/soc/codecs/cs35l41-i2c.c                     |    10 +-
 sound/soc/codecs/cs35l45-i2c.c                     |     4 +-
 sound/soc/codecs/cs35l56-i2c.c                     |     6 +-
 sound/soc/codecs/cs35l56-sdw.c                     |   231 +-
 sound/soc/codecs/cs35l56-shared-test.c             |     6 +
 sound/soc/codecs/cs35l56-shared.c                  |     6 +-
 sound/soc/codecs/cs35l56.c                         |    91 +-
 sound/soc/codecs/cs35l56.h                         |     7 +-
 sound/soc/codecs/cs4265.c                          |     2 +-
 sound/soc/codecs/cs4270.c                          |     4 +-
 sound/soc/codecs/cs4271-i2c.c                      |     2 +-
 sound/soc/codecs/cs42l42-i2c.c                     |     4 +-
 sound/soc/codecs/cs42l42-sdw.c                     |    11 +-
 sound/soc/codecs/cs42l43-jack.c                    |     5 +-
 sound/soc/codecs/cs42l51-i2c.c                     |     2 +-
 sound/soc/codecs/cs42l52.c                         |     2 +-
 sound/soc/codecs/cs42l56.c                         |     2 +-
 sound/soc/codecs/cs42l73.c                         |     4 +-
 sound/soc/codecs/cs42l84.c                         |     4 +-
 sound/soc/codecs/cs42xx8-i2c.c                     |     6 +-
 sound/soc/codecs/cs42xx8-spi.c                     |   104 +
 sound/soc/codecs/cs42xx8.c                         |     3 +
 sound/soc/codecs/cs43130.c                         |    10 +-
 sound/soc/codecs/cs4341.c                          |     2 +-
 sound/soc/codecs/cs4349.c                          |     4 +-
 sound/soc/codecs/cs530x-i2c.c                      |    14 +-
 sound/soc/codecs/cs53l30.c                         |     4 +-
 sound/soc/codecs/cx20442.c                         |    11 +-
 sound/soc/codecs/cx20442.h                         |     5 +
 sound/soc/codecs/cx2072x.c                         |     6 +-
 sound/soc/codecs/da7210.c                          |     2 +-
 sound/soc/codecs/da7213.c                          |     7 +-
 sound/soc/codecs/da7218.c                          |     4 +-
 sound/soc/codecs/da7219.c                          |     2 +-
 sound/soc/codecs/da732x.c                          |     2 +-
 sound/soc/codecs/da9055.c                          |     2 +-
 sound/soc/codecs/es8311.c                          |     2 +-
 sound/soc/codecs/es8316.c                          |     4 +-
 sound/soc/codecs/es8323.c                          |     2 +-
 sound/soc/codecs/es8326.c                          |     4 +-
 sound/soc/codecs/es8328-i2c.c                      |     4 +-
 sound/soc/codecs/es8375.c                          |     2 +-
 sound/soc/codecs/es8389.c                          |     2 +-
 sound/soc/codecs/es9356.c                          |  1142 ++
 sound/soc/codecs/es9356.h                          |   208 +
 sound/soc/codecs/framer-codec.c                    |     8 +-
 sound/soc/codecs/fs210x.c                          |     6 +-
 sound/soc/codecs/hdac_hdmi.c                       |     4 +-
 sound/soc/codecs/idt821034.c                       |     9 +-
 sound/soc/codecs/isabelle.c                        |     2 +-
 sound/soc/codecs/lm4857.c                          |     2 +-
 sound/soc/codecs/lm49453.c                         |     2 +-
 sound/soc/codecs/max9768.c                         |     2 +-
 sound/soc/codecs/max98088.c                        |     4 +-
 sound/soc/codecs/max98090.c                        |    14 +-
 sound/soc/codecs/max98090.h                        |     3 -
 sound/soc/codecs/max98095.c                        |     2 +-
 sound/soc/codecs/max98363.c                        |    17 +-
 sound/soc/codecs/max98371.c                        |     2 +-
 sound/soc/codecs/max98373-i2c.c                    |     4 +-
 sound/soc/codecs/max98373-sdw.c                    |    18 +-
 sound/soc/codecs/max98388.c                        |     4 +-
 sound/soc/codecs/max98390.c                        |     4 +-
 sound/soc/codecs/max98396.c                        |     6 +-
 sound/soc/codecs/max9850.c                         |     2 +-
 sound/soc/codecs/max98504.c                        |     2 +-
 sound/soc/codecs/max98520.c                        |     4 +-
 sound/soc/codecs/max9860.c                         |     2 +-
 sound/soc/codecs/max9867.c                         |     2 +-
 sound/soc/codecs/max9877.c                         |     2 +-
 sound/soc/codecs/max98925.c                        |     2 +-
 sound/soc/codecs/max98926.c                        |     2 +-
 sound/soc/codecs/max98927.c                        |     4 +-
 sound/soc/codecs/ml26124.c                         |     2 +-
 sound/soc/codecs/mt6660.c                          |     4 +-
 sound/soc/codecs/nau8325.c                         |     2 +-
 sound/soc/codecs/nau8540.c                         |     2 +-
 sound/soc/codecs/nau8810.c                         |     6 +-
 sound/soc/codecs/nau8821.c                         |     2 +-
 sound/soc/codecs/nau8822.c                         |    48 +-
 sound/soc/codecs/nau8822.h                         |     3 +
 sound/soc/codecs/nau8824.c                         |     2 +-
 sound/soc/codecs/nau8825.c                         |    14 +-
 sound/soc/codecs/ntp8835.c                         |     4 +-
 sound/soc/codecs/ntp8918.c                         |     4 +-
 sound/soc/codecs/pcm1681.c                         |     4 +-
 sound/soc/codecs/pcm1789-i2c.c                     |     2 +-
 sound/soc/codecs/pcm179x-i2c.c                     |     2 +-
 sound/soc/codecs/pcm186x-i2c.c                     |     8 +-
 sound/soc/codecs/pcm3168a-i2c.c                    |     2 +-
 sound/soc/codecs/pcm3168a.c                        |    30 +-
 sound/soc/codecs/pcm512x-i2c.c                     |    14 +-
 sound/soc/codecs/pcm6240.c                         |    80 +-
 sound/soc/codecs/pcm6240.h                         |     2 +-
 sound/soc/codecs/peb2466.c                         |     9 +-
 sound/soc/codecs/pm4125.c                          |    11 +-
 sound/soc/codecs/rk3328_codec.c                    |    54 +-
 sound/soc/codecs/rt1011.c                          |     2 +-
 sound/soc/codecs/rt1015.c                          |     2 +-
 sound/soc/codecs/rt1016.c                          |     2 +-
 sound/soc/codecs/rt1017-sdca-sdw.c                 |    18 +-
 sound/soc/codecs/rt1019.c                          |     2 +-
 sound/soc/codecs/rt1305.c                          |     4 +-
 sound/soc/codecs/rt1308-sdw.c                      |    18 +-
 sound/soc/codecs/rt1308.c                          |     2 +-
 sound/soc/codecs/rt1316-sdw.c                      |    18 +-
 sound/soc/codecs/rt1318-sdw.c                      |    16 +-
 sound/soc/codecs/rt1318.c                          |     2 +-
 sound/soc/codecs/rt1320-sdw.c                      |    16 +-
 sound/soc/codecs/rt274.c                           |     4 +-
 sound/soc/codecs/rt286.c                           |     6 +-
 sound/soc/codecs/rt298.c                           |     4 +-
 sound/soc/codecs/rt5514.c                          |     2 +-
 sound/soc/codecs/rt5575.c                          |     2 +-
 sound/soc/codecs/rt5616.c                          |     6 +-
 sound/soc/codecs/rt5631.c                          |    10 +-
 sound/soc/codecs/rt5640.c                          |    43 +-
 sound/soc/codecs/rt5645.c                          |     4 +-
 sound/soc/codecs/rt5651.c                          |     2 +-
 sound/soc/codecs/rt5659.c                          |     4 +-
 sound/soc/codecs/rt5660.c                          |     2 +-
 sound/soc/codecs/rt5663.c                          |     4 +-
 sound/soc/codecs/rt5665.c                          |     4 +-
 sound/soc/codecs/rt5668.c                          |     4 +-
 sound/soc/codecs/rt5670.c                          |     6 +-
 sound/soc/codecs/rt5677.c                          |     2 +-
 sound/soc/codecs/rt5682-i2c.c                      |     4 +-
 sound/soc/codecs/rt5682-sdw.c                      |    16 +-
 sound/soc/codecs/rt5682.c                          |    14 +-
 sound/soc/codecs/rt5682s.c                         |     4 +-
 sound/soc/codecs/rt700-sdw.c                       |    18 +-
 sound/soc/codecs/rt711-sdca-sdw.c                  |    16 +-
 sound/soc/codecs/rt711-sdw.c                       |    14 +-
 sound/soc/codecs/rt712-sdca-dmic.c                 |    19 +-
 sound/soc/codecs/rt712-sdca-sdw.c                  |    16 +-
 sound/soc/codecs/rt715-sdca-sdw.c                  |    18 +-
 sound/soc/codecs/rt715-sdw.c                       |    18 +-
 sound/soc/codecs/rt721-sdca-sdw.c                  |    16 +-
 sound/soc/codecs/rt722-sdca-sdw.c                  |    55 +-
 sound/soc/codecs/rt722-sdca.c                      |   369 +-
 sound/soc/codecs/rt722-sdca.h                      |    27 +
 sound/soc/codecs/sgtl5000.c                        |     4 +-
 sound/soc/codecs/sigmadsp.c                        |     4 +-
 sound/soc/codecs/simple-amplifier.c                |   926 +-
 sound/soc/codecs/sma1303.c                         |     4 +-
 sound/soc/codecs/sma1307.c                         |    39 +-
 sound/soc/codecs/src4xxx-i2c.c                     |     2 +-
 sound/soc/codecs/ssm2518.c                         |     2 +-
 sound/soc/codecs/ssm2602-i2c.c                     |     6 +-
 sound/soc/codecs/ssm4567.c                         |     2 +-
 sound/soc/codecs/sta32x.c                          |     6 +-
 sound/soc/codecs/sta350.c                          |     8 +-
 sound/soc/codecs/sta529.c                          |     2 +-
 sound/soc/codecs/tac5xx2-sdw.c                     |  2037 ++++
 sound/soc/codecs/tac5xx2.h                         |   259 +
 sound/soc/codecs/tas2552.c                         |     2 +-
 sound/soc/codecs/tas2562.c                         |     6 +-
 sound/soc/codecs/tas2764.c                         |     2 +-
 sound/soc/codecs/tas2770.c                         |     2 +-
 sound/soc/codecs/tas2780.c                         |     2 +-
 sound/soc/codecs/tas2781-fmwlib.c                  |     7 +-
 sound/soc/codecs/tas2781-i2c.c                     |    49 +-
 sound/soc/codecs/tas2783-sdw.c                     |    26 +-
 sound/soc/codecs/tas2783.h                         |     8 -
 sound/soc/codecs/tas5086.c                         |    12 +-
 sound/soc/codecs/tas571x.c                         |    14 +-
 sound/soc/codecs/tas5720.c                         |     6 +-
 sound/soc/codecs/tas5805m.c                        |     2 +-
 sound/soc/codecs/tas6424.c                         |     2 +-
 sound/soc/codecs/tas675x.c                         |  2194 ++++
 sound/soc/codecs/tas675x.h                         |   367 +
 sound/soc/codecs/tda7419.c                         |     2 +-
 sound/soc/codecs/tfa9879.c                         |     2 +-
 sound/soc/codecs/tlv320adc3xxx.c                   |     6 +-
 sound/soc/codecs/tlv320adcx140.c                   |     8 +-
 sound/soc/codecs/tlv320aic23-i2c.c                 |     4 +-
 sound/soc/codecs/tlv320aic31xx.c                   |    16 +-
 sound/soc/codecs/tlv320aic32x4-i2c.c               |     6 +-
 sound/soc/codecs/tlv320aic3x-i2c.c                 |    10 +-
 sound/soc/codecs/tlv320aic3x.c                     |     7 +
 sound/soc/codecs/ts3a227e.c                        |     2 +-
 sound/soc/codecs/tscs42xx.c                        |     4 +-
 sound/soc/codecs/tscs454.c                         |     2 +-
 sound/soc/codecs/uda1342.c                         |     2 +-
 sound/soc/codecs/uda1380.c                         |    15 +-
 sound/soc/codecs/wcd937x.c                         |    11 +-
 sound/soc/codecs/wcd938x.c                         |    11 +-
 sound/soc/codecs/wcd939x.c                         |    11 +-
 sound/soc/codecs/wm1250-ev1.c                      |     2 +-
 sound/soc/codecs/wm2000.c                          |     2 +-
 sound/soc/codecs/wm2200.c                          |     2 +-
 sound/soc/codecs/wm5100.c                          |     2 +-
 sound/soc/codecs/wm8510.c                          |     2 +-
 sound/soc/codecs/wm8523.c                          |     2 +-
 sound/soc/codecs/wm8580.c                          |     4 +-
 sound/soc/codecs/wm8711.c                          |     2 +-
 sound/soc/codecs/wm8728.c                          |     2 +-
 sound/soc/codecs/wm8731-i2c.c                      |     2 +-
 sound/soc/codecs/wm8737.c                          |     2 +-
 sound/soc/codecs/wm8741.c                          |     2 +-
 sound/soc/codecs/wm8750.c                          |     4 +-
 sound/soc/codecs/wm8753.c                          |     2 +-
 sound/soc/codecs/wm8776.c                          |     4 +-
 sound/soc/codecs/wm8804-i2c.c                      |     2 +-
 sound/soc/codecs/wm8900.c                          |     8 +-
 sound/soc/codecs/wm8903.c                          |     2 +-
 sound/soc/codecs/wm8904.c                          |     6 +-
 sound/soc/codecs/wm8940.c                          |     2 +-
 sound/soc/codecs/wm8955.c                          |     2 +-
 sound/soc/codecs/wm8960.c                          |     2 +-
 sound/soc/codecs/wm8961.c                          |     2 +-
 sound/soc/codecs/wm8962.c                          |     2 +-
 sound/soc/codecs/wm8971.c                          |     2 +-
 sound/soc/codecs/wm8974.c                          |     2 +-
 sound/soc/codecs/wm8978.c                          |     2 +-
 sound/soc/codecs/wm8983.c                          |     2 +-
 sound/soc/codecs/wm8985.c                          |     4 +-
 sound/soc/codecs/wm8988.c                          |     2 +-
 sound/soc/codecs/wm8990.c                          |     2 +-
 sound/soc/codecs/wm8991.c                          |     2 +-
 sound/soc/codecs/wm8993.c                          |     2 +-
 sound/soc/codecs/wm8995.c                          |     4 +-
 sound/soc/codecs/wm8996.c                          |     2 +-
 sound/soc/codecs/wm9081.c                          |     8 +-
 sound/soc/codecs/wm9090.c                          |     4 +-
 sound/soc/codecs/wm_adsp.c                         |     7 +
 sound/soc/codecs/wsa881x.c                         |    10 +-
 sound/soc/fsl/Kconfig                              |     7 +-
 sound/soc/fsl/eukrea-tlv320.c                      |    11 +-
 sound/soc/fsl/fsl-asoc-card.c                      |   111 +-
 sound/soc/fsl/fsl_audmix.c                         |     6 +
 sound/soc/fsl/fsl_micfil.c                         |    79 +
 sound/soc/fsl/fsl_micfil.h                         |     1 +
 sound/soc/fsl/fsl_qmc_audio.c                      |     7 +-
 sound/soc/fsl/fsl_sai.c                            |     7 +-
 sound/soc/fsl/fsl_sai.h                            |     2 +
 sound/soc/fsl/imx-pcm-rpmsg.c                      |    12 +-
 sound/soc/fsl/imx-rpmsg.c                          |    38 +-
 sound/soc/generic/audio-graph-card2.c              |    12 +
 sound/soc/generic/simple-card.c                    |    61 +-
 sound/soc/generic/test-component.c                 |     7 -
 sound/soc/hisilicon/hi6210-i2s.c                   |     6 +-
 sound/soc/img/img-spdif-in.c                       |    70 +-
 sound/soc/img/img-spdif-out.c                      |    16 +-
 sound/soc/intel/boards/Kconfig                     |     1 +
 sound/soc/intel/boards/cht_bsw_rt5672.c            |    73 +-
 sound/soc/intel/boards/sof_sdw.c                   |    23 +-
 sound/soc/intel/catpt/Makefile                     |     3 +-
 sound/soc/intel/catpt/core.h                       |     1 -
 sound/soc/intel/catpt/device.c                     |    14 +-
 sound/soc/intel/catpt/dsp.c                        |    19 +-
 sound/soc/intel/catpt/ipc.c                        |    17 +-
 sound/soc/intel/catpt/loader.c                     |    10 +-
 sound/soc/intel/catpt/pcm.c                        |    63 +-
 sound/soc/intel/catpt/registers.h                  |    14 +
 sound/soc/intel/catpt/trace.c                      |    27 +
 sound/soc/intel/catpt/trace.h                      |    22 +-
 sound/soc/intel/common/soc-acpi-intel-arl-match.c  |    52 +
 sound/soc/intel/common/soc-acpi-intel-mtl-match.c  |   132 +
 sound/soc/intel/common/sof-function-topology-lib.c |    11 +-
 sound/soc/loongson/Makefile                        |     4 +-
 sound/soc/loongson/loongson_dma.c                  |   148 +-
 sound/soc/loongson/loongson_dma.h                  |     6 +-
 sound/soc/loongson/loongson_i2s.c                  |    56 +-
 sound/soc/loongson/loongson_i2s.h                  |     7 +-
 sound/soc/loongson/loongson_i2s_pci.c              |    59 +-
 sound/soc/loongson/loongson_i2s_plat.c             |    67 +-
 sound/soc/mediatek/Kconfig                         |    40 +
 sound/soc/mediatek/Makefile                        |     1 +
 sound/soc/mediatek/common/mtk-afe-fe-dai.c         |     8 +-
 .../soc/mediatek/common/mtk-afe-platform-driver.c  |    54 +-
 .../soc/mediatek/common/mtk-afe-platform-driver.h  |     2 +
 sound/soc/mediatek/common/mtk-btcvsd.c             |    81 +-
 sound/soc/mediatek/common/mtk-dsp-sof-common.c     |    13 +-
 sound/soc/mediatek/common/mtk-dsp-sof-common.h     |     5 +-
 sound/soc/mediatek/common/mtk-soundcard-driver.c   |    22 +-
 sound/soc/mediatek/mt2701/Makefile                 |     1 +
 sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.c  |    26 +-
 sound/soc/mediatek/mt2701/mt2701-afe-common.h      |     8 +-
 sound/soc/mediatek/mt2701/mt2701-afe-pcm.c         |   305 +-
 sound/soc/mediatek/mt2701/mt2701-hdmi.c            |   114 +
 sound/soc/mediatek/mt2701/mt2701-reg.h             |    29 +
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c         |    39 +-
 sound/soc/mediatek/mt8173/mt8173-max98090.c        |     4 +-
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c         |    23 +-
 sound/soc/mediatek/mt8186/mt8186-afe-gpio.c        |    13 +-
 sound/soc/mediatek/mt8186/mt8186-mt6366-common.c   |     6 +-
 sound/soc/mediatek/mt8186/mt8186-mt6366-common.h   |     2 +-
 sound/soc/mediatek/mt8186/mt8186-mt6366.c          |    18 +-
 sound/soc/mediatek/mt8188/mt8188-afe-clk.c         |    29 +-
 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c         |    38 +-
 sound/soc/mediatek/mt8192/mt8192-afe-gpio.c        |     4 +-
 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c         |    21 +-
 sound/soc/mediatek/mt8195/mt8195-afe-clk.c         |    42 +-
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c        |    16 +-
 sound/soc/mediatek/mt8196/Makefile                 |    14 +
 sound/soc/mediatek/mt8196/mt8196-afe-clk.c         |   581 +
 sound/soc/mediatek/mt8196/mt8196-afe-clk.h         |    64 +
 sound/soc/mediatek/mt8196/mt8196-afe-common.h      |   205 +
 sound/soc/mediatek/mt8196/mt8196-afe-pcm.c         |  2519 ++++
 sound/soc/mediatek/mt8196/mt8196-dai-adda.c        |   845 ++
 sound/soc/mediatek/mt8196/mt8196-dai-i2s.c         |  2613 ++++
 sound/soc/mediatek/mt8196/mt8196-dai-tdm.c         |   675 ++
 sound/soc/mediatek/mt8196/mt8196-interconnection.h |   121 +
 sound/soc/mediatek/mt8196/mt8196-nau8825.c         |   870 ++
 sound/soc/mediatek/mt8196/mt8196-reg.h             | 12068 +++++++++++++++++++
 sound/soc/mediatek/mt8365/mt8365-afe-clk.c         |    30 +-
 sound/soc/mediatek/mt8365/mt8365-afe-pcm.c         |    13 +-
 sound/soc/mediatek/mt8365/mt8365-dai-adda.c        |    10 +-
 sound/soc/mediatek/mt8365/mt8365-dai-i2s.c         |     5 +-
 sound/soc/mediatek/mt8365/mt8365-mt6357.c          |    10 +-
 sound/soc/meson/aiu-acodec-ctrl.c                  |     3 +
 sound/soc/meson/aiu-codec-ctrl.c                   |     3 +
 sound/soc/meson/axg-tdm-formatter.c                |    22 +-
 sound/soc/pxa/Kconfig                              |     6 +
 sound/soc/pxa/Makefile                             |     4 +-
 sound/soc/pxa/mmp-sspa.c                           |     2 +-
 sound/soc/pxa/pxa-ssp.c                            |     2 +-
 sound/{arm => soc/pxa}/pxa2xx-ac97-lib.c           |    41 +-
 sound/{arm => soc/pxa}/pxa2xx-ac97-regs.h          |     0
 sound/soc/pxa/pxa2xx-ac97.c                        |     6 +-
 sound/soc/pxa/pxa2xx-i2s.c                         |     2 +-
 sound/soc/pxa/pxa2xx-lib.h                         |    45 +
 sound/{arm => soc/pxa}/pxa2xx-pcm-lib.c            |    26 +-
 sound/soc/pxa/pxa2xx-pcm.c                         |     3 +-
 sound/soc/qcom/common.c                            |    47 +-
 sound/soc/qcom/qdsp6/audioreach.c                  |    79 +-
 sound/soc/qcom/qdsp6/audioreach.h                  |    96 +
 sound/soc/qcom/qdsp6/q6apm-dai.c                   |   148 +-
 sound/soc/qcom/qdsp6/q6apm.c                       |   222 +-
 sound/soc/qcom/qdsp6/q6apm.h                       |    13 +-
 sound/soc/renesas/fsi.c                            |   290 +-
 sound/soc/renesas/rcar/adg.c                       |   168 +-
 sound/soc/renesas/rcar/cmd.c                       |     2 +-
 sound/soc/renesas/rcar/core.c                      |   173 +-
 sound/soc/renesas/rcar/ctu.c                       |    29 +-
 sound/soc/renesas/rcar/dma.c                       |   280 +-
 sound/soc/renesas/rcar/dvc.c                       |    29 +-
 sound/soc/renesas/rcar/gen.c                       |   180 +
 sound/soc/renesas/rcar/mix.c                       |    29 +-
 sound/soc/renesas/rcar/msiof.c                     |     5 -
 sound/soc/renesas/rcar/rsnd.h                      |    73 +-
 sound/soc/renesas/rcar/src.c                       |    91 +-
 sound/soc/renesas/rcar/ssi.c                       |    49 +-
 sound/soc/renesas/rcar/ssiu.c                      |    92 +-
 sound/soc/rockchip/rk3399_gru_sound.c              |     2 +-
 sound/soc/rockchip/rockchip_i2s.c                  |   230 +-
 sound/soc/rockchip/rockchip_i2s_tdm.c              |    10 +-
 sound/soc/rockchip/rockchip_pdm.c                  |    16 +-
 sound/soc/rockchip/rockchip_sai.c                  |   274 +-
 sound/soc/rockchip/rockchip_spdif.c                |    11 +-
 sound/soc/samsung/i2s.c                            |   118 +-
 sound/soc/samsung/idma.c                           |    26 +-
 sound/soc/samsung/odroid.c                         |    21 +-
 sound/soc/samsung/pcm.c                            |    99 +-
 sound/soc/samsung/spdif.c                          |    25 +-
 sound/soc/sdca/Kconfig                             |     2 +-
 sound/soc/sdca/sdca_asoc.c                         |   106 +-
 sound/soc/sdca/sdca_class.c                        |    60 +-
 sound/soc/sdca/sdca_class.h                        |     4 -
 sound/soc/sdca/sdca_class_function.c               |    23 +-
 sound/soc/sdca/sdca_functions.c                    |    51 +-
 sound/soc/sdca/sdca_interrupts.c                   |     3 +-
 sound/soc/sdca/sdca_jack.c                         |    76 +-
 sound/soc/sdw_utils/Makefile                       |     1 +
 sound/soc/sdw_utils/soc_sdw_es9356.c               |   230 +
 sound/soc/sdw_utils/soc_sdw_ti_amp.c               |   134 +-
 sound/soc/sdw_utils/soc_sdw_utils.c                |   309 +-
 sound/soc/soc-card.c                               |    13 +
 sound/soc/soc-core.c                               |   349 +-
 sound/soc/soc-dai.c                                |   227 +-
 sound/soc/soc-dapm.c                               |   109 +-
 sound/soc/soc-devres.c                             |    28 +-
 sound/soc/soc-generic-dmaengine-pcm.c              |     5 +-
 sound/soc/soc-ops.c                                |     4 +
 sound/soc/soc-pcm.c                                |   119 +
 sound/soc/soc-topology.c                           |    37 +-
 sound/soc/soc-utils.c                              |     7 -
 sound/soc/sof/amd/acp-common.c                     |     3 +-
 sound/soc/sof/intel/Kconfig                        |     6 +-
 sound/soc/sof/intel/hda-mlink.c                    |    11 +-
 sound/soc/sof/intel/hda.c                          |    14 +-
 sound/soc/sof/intel/lnl.c                          |    40 +-
 sound/soc/sof/ipc3-control.c                       |    79 +-
 sound/soc/sof/ipc3-topology.c                      |    10 +-
 sound/soc/sof/ipc4-control.c                       |   124 +-
 sound/soc/sof/ipc4-topology.c                      |   151 +-
 sound/soc/sof/nocodec.c                            |     4 +-
 sound/soc/sof/topology.c                           |    71 +-
 sound/soc/spacemit/k1_i2s.c                        |    36 +-
 sound/soc/sprd/sprd-mcdt.c                         |    66 +-
 sound/soc/sti/uniperif_player.c                    |    73 +-
 sound/soc/sti/uniperif_reader.c                    |    20 +-
 sound/soc/stm/stm32_adfsdm.c                       |    29 +-
 sound/soc/stm/stm32_i2s.c                          |    65 +-
 sound/soc/stm/stm32_sai_sub.c                      |    29 +-
 sound/soc/stm/stm32_spdifrx.c                      |    44 +-
 sound/soc/tegra/tegra20_ac97.c                     |     2 +-
 sound/soc/tegra/tegra20_das.c                      |     2 +-
 sound/soc/tegra/tegra20_i2s.c                      |     2 +-
 sound/soc/tegra/tegra210_admaif.c                  |    28 +-
 sound/soc/tegra/tegra210_admaif.h                  |     2 +-
 sound/soc/tegra/tegra210_adx.c                     |    91 +-
 sound/soc/tegra/tegra210_adx.h                     |     5 +-
 sound/soc/tegra/tegra210_ahub.c                    |     4 +-
 sound/soc/tegra/tegra210_amx.c                     |    82 +-
 sound/soc/tegra/tegra210_amx.h                     |     5 +-
 sound/soc/tegra/tegra210_mixer.c                   |   288 +-
 sound/soc/tegra/tegra210_mixer.h                   |    21 +-
 sound/soc/tegra/tegra210_mvc.c                     |     3 +
 sound/soc/tegra/tegra30_ahub.c                     |     2 +-
 sound/soc/tegra/tegra30_i2s.c                      |     2 +-
 sound/soc/tegra/tegra_isomgr_bw.c                  |    20 +-
 sound/soc/ti/ams-delta.c                           |    47 +-
 sound/soc/ti/davinci-mcasp.c                       |   183 +-
 sound/soc/ti/j721e-evm.c                           |    47 +-
 sound/soc/ti/omap-dmic.c                           |    44 +-
 sound/soc/ti/omap-hdmi.c                           |    18 +-
 sound/soc/ti/omap-mcbsp-st.c                       |    26 +-
 sound/soc/ti/omap-mcbsp.c                          |    96 +-
 sound/soc/ti/omap-mcpdm.c                          |     8 +-
 sound/soc/ti/omap3pandora.c                        |     5 +-
 sound/soc/ti/rx51.c                                |     4 +-
 sound/soc/uniphier/aio-compress.c                  |    24 +-
 sound/soc/uniphier/aio-dma.c                       |    50 +-
 sound/soc/ux500/mop500_ab8500.c                    |    24 +-
 sound/synth/emux/emux_seq.c                        |    11 +-
 sound/usb/6fire/control.c                          |    13 +-
 sound/usb/card.c                                   |    14 +-
 sound/usb/endpoint.c                               |    10 +-
 sound/usb/fcp.c                                    |     4 +-
 sound/usb/mixer.c                                  |   118 +-
 sound/usb/mixer.h                                  |     1 +
 sound/usb/mixer_quirks.c                           |   107 +-
 sound/usb/mixer_scarlett.c                         |     4 +-
 sound/usb/mixer_scarlett2.c                        |   558 +-
 sound/usb/mixer_us16x08.c                          |   127 +-
 sound/usb/qcom/mixer_usb_offload.c                 |     6 +-
 sound/usb/qcom/qc_audio_offload.c                  |    29 +-
 sound/usb/quirks-table.h                           |     8 +
 sound/usb/quirks.c                                 |    10 +
 sound/usb/usbaudio.h                               |    26 +-
 sound/usb/usx2y/usbusx2y.c                         |    39 +-
 sound/virtio/virtio_kctl.c                         |    50 +
 sound/virtio/virtio_pcm.c                          |     3 +-
 sound/virtio/virtio_pcm_ops.c                      |     3 +-
 sound/xen/xen_snd_front_alsa.c                     |    17 +-
 sound/xen/xen_snd_front_evtchnl.c                  |    28 +-
 sound/xen/xen_snd_front_evtchnl.h                  |     6 +-
 694 files changed, 44951 insertions(+), 5641 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/cdns,xtfpga-i2s.txt
 create mode 100644 Documentation/devicetree/bindings/sound/cdns,xtfpga-i2s.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/gpio-audio-amp.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt2701-hdmi-audio.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt6351-sound.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8196-afe.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8196-nau8825.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/mt6351.txt
 create mode 100644 Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/ti,tas67524.yaml
 create mode 100644 Documentation/sound/codecs/tas675x.rst
 create mode 100644 include/sound/acp7x_chip_offset_byte.h
 create mode 100644 sound/soc/amd/acp7x/Makefile
 create mode 100644 sound/soc/amd/acp7x/acp7x-common.c
 create mode 100644 sound/soc/amd/acp7x/acp7x.h
 create mode 100644 sound/soc/amd/acp7x/pci-acp7x.c
 create mode 100644 sound/soc/codecs/cs42xx8-spi.c
 create mode 100644 sound/soc/codecs/es9356.c
 create mode 100644 sound/soc/codecs/es9356.h
 create mode 100644 sound/soc/codecs/tac5xx2-sdw.c
 create mode 100644 sound/soc/codecs/tac5xx2.h
 create mode 100644 sound/soc/codecs/tas675x.c
 create mode 100644 sound/soc/codecs/tas675x.h
 create mode 100644 sound/soc/intel/catpt/trace.c
 create mode 100644 sound/soc/mediatek/mt2701/mt2701-hdmi.c
 create mode 100644 sound/soc/mediatek/mt8196/Makefile
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-afe-clk.c
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-afe-clk.h
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-afe-common.h
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-dai-adda.c
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-dai-i2s.c
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-dai-tdm.c
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-interconnection.h
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-nau8825.c
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-reg.h
 rename sound/{arm => soc/pxa}/pxa2xx-ac97-lib.c (91%)
 rename sound/{arm => soc/pxa}/pxa2xx-ac97-regs.h (100%)
 create mode 100644 sound/soc/pxa/pxa2xx-lib.h
 rename sound/{arm => soc/pxa}/pxa2xx-pcm-lib.c (86%)
 create mode 100644 sound/soc/sdw_utils/soc_sdw_es9356.c

