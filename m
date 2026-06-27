Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91678395AF8
	for <linux-sound@vger.kernel.org>; Sat, 27 Jun 2026 14:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782571334; cv=none; b=vDmW0tLjSghaQ64mOn6Q410J+ItoWMhna+IDgPcQnQE+Qm3IB+qZ7fQIQAy7tZrbmT5Ey0f5ruedaGzJR2wopqi55HOTJgGd4uxSbcSjCSLB47SjCaO5kUjYBH3s7VWp0ks/wJBlzw9uF3KW9bYoNc1OagF+ZYZczy5g7hckgW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782571334; c=relaxed/simple;
	bh=hNB0jqnKx3wNSg8gp022UvNC9QRDjEtrj1Gd+z1BcxY=;
	h=Date:Message-ID:From:To:Cc:Subject:MIME-Version:Content-Type; b=NMbEv20rzY9QvP2QqV+zSKjotlKMVwRMl099EtmsX9DYB/02q6QX5M8rP6IdwnLB5NlS4C83VT/gVW87daHGuSYv9gGAd1DpOjhvllE2OAIUceqobh8aDYHSa3frq6pWKYpO9SVMVg8TDSYxSe73yV/yWiNxfTxW9J+XEQZrvNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0gMhqbq3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ApeALUc4; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0gMhqbq3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ApeALUc4; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0gMhqbq3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ApeALUc4";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0gMhqbq3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ApeALUc4"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 14AD4759AA;
	Sat, 27 Jun 2026 14:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782571325; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Umn4K4bsls8EgQZ36rXeRcOb1MCL6Wt7xD+qBPtU93s=;
	b=0gMhqbq3Y0/kFOGc2fjIhP8o0mRzvAP2MHAB+ItzvK0al3Gf/2Dn9eoFOqwvKLF/qls6Jc
	dn5/ta36YkjTn4Ydin50gyHqKp+7f6SkhiQ34XoqtDp9h5Gpx8FY68pikWLIH4dPIeWnSn
	ZItp6ZwixzWmHhkqJMy4a0gC+qi1NRw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782571325;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Umn4K4bsls8EgQZ36rXeRcOb1MCL6Wt7xD+qBPtU93s=;
	b=ApeALUc4ycLk2KLNP5QahvHn1NHN87m/bF5+N0sELAzHMvZkjOmBZLJ8vjtGe0D3VmRw/U
	qf019KsF84CUncDg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=0gMhqbq3;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ApeALUc4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782571325; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Umn4K4bsls8EgQZ36rXeRcOb1MCL6Wt7xD+qBPtU93s=;
	b=0gMhqbq3Y0/kFOGc2fjIhP8o0mRzvAP2MHAB+ItzvK0al3Gf/2Dn9eoFOqwvKLF/qls6Jc
	dn5/ta36YkjTn4Ydin50gyHqKp+7f6SkhiQ34XoqtDp9h5Gpx8FY68pikWLIH4dPIeWnSn
	ZItp6ZwixzWmHhkqJMy4a0gC+qi1NRw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782571325;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Umn4K4bsls8EgQZ36rXeRcOb1MCL6Wt7xD+qBPtU93s=;
	b=ApeALUc4ycLk2KLNP5QahvHn1NHN87m/bF5+N0sELAzHMvZkjOmBZLJ8vjtGe0D3VmRw/U
	qf019KsF84CUncDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DD059779A8;
	Sat, 27 Jun 2026 14:42:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mmOXMzzhP2p7JwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 27 Jun 2026 14:42:04 +0000
Date: Sat, 27 Jun 2026 16:42:04 +0200
Message-ID: <8733y8rqo3.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] sound fixes for 7.2-rc1
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 14AD4759AA
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

Linus,

please pull sound fixes for v7.2-rc1 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-fix-7.2-rc1

The topmost commit is e1e31e0ec8a609e17fd2e86b77bc00d9cbb24d7c

----------------------------------------------------------------

sound fixes for 7.2-rc1

A collection of small bug fixes accumulated over the last week.
Most are device-specific fixes while there are a few core fixes as
well.

Here are the highlights:

ALSA Core:
- A fix for an uninitialised heap leak in ALSA sequencer core
- A fix for error handling/resource leak in compress-offload API

USB-audio:
- A teardown-ordering fix in USB MIDI 2.0 to prevent use-after-free
- Bounds and length checks for packet data in Native Instruments caiaq
  / Traktor Kontrol input parsers
- Avoidance of expensive kobject path lookups in DualSense controller
  matches
- Robustness/memory leak fixes for Qualcomm USB offload driver
- Focusrite Control Protocol (FCP) NULL-pointer dereference fix and a
  new device quirk (ISA C8X)
- Device-specific quirks for Yamaha CDS3000 and SC13A

HD-Audio:
- A bunch of quirks and mute/mic-mute LED fixups for various laptops
  (Acer, Clevo, Lenovo, HP)

ASoC & SoundWire:
- Avoid failing card registration if the device_link creation fails
- A workaround for SoundWire randconfig build failures by making
  helper functions static inline
- Corrected MCLK reference validation for CS530x codecs
- Clean up of untested, problematic guard() macro replacements in
  Rockchip SAI driver
- Fix for eDMA maxburst misalignment with channel count in Freescale
  ASRC
- Miscellaneous hardware-specific fixes (qcom, rt5650, tlv320aic3x,
  tas2781/3)

Others:
- Bounds and length checks for packet data in Apple iSight

----------------------------------------------------------------

Aaron Erhardt (1):
      ALSA: hda/realtek: Fix noisy mic for Clevo V6xxAW

Ahmad Fatoum (1):
      ASoC: cs530x: Fix expected MCLK rates for CS5302/4/8

Ai Chao (1):
      ALSA: usb-audio: Add quirk flags for SC13A

Alvin ©ipraga (1):
      ASoC: audio-graph-card2: Drop warning for manually selected DAI formats

Baojun Xu (1):
      ASoC: tas2781: Update default register address to TAS2563

Bartosz Juraszewski (1):
      ASoC: tas2783: Update loaded firmware names to linux-firmware 20260519

Ben Dooks (1):
      ALSA: pcm: fix __le32 cast warning in snd_pcm_set_sync_per_card

Cen Zhang (1):
      ALSA: usb-audio: Kill MIDI 2.0 URBs before freeing endpoints

Charles Keepax (5):
      soundwire: Move wait for initialisation helper to header
      ASoC: es9356: Add back local call to sdw_show_ping_status()
      ASoC: max98373: Add back local call to sdw_show_ping_status()
      ASoC: ti: Add back local call to sdw_show_ping_status()
      ASoC: realtek: Add back local call to sdw_show_ping_status()

Chris Aherin (1):
      ALSA: hda/realtek: Add quirk for Lenovo Yoga 7 16IAP7

Christian Hewitt (1):
      ASoC: codecs: pcm512x: only print info once on no sclk

Cássio Gabriel (1):
      ALSA: compress: Fix task creation error unwind

Darvell Long (1):
      ALSA: usb-audio: avoid kobject path lookup in DualSense match

Dirk Su (1):
      ALSA: hda/realtek: Add LED fixup for HP EliteBook 6 G2i Laptops

Galen Hassen (1):
      ALSA: hda/conexant: Add pin config quirk for Lenovo IdeaPad Slim 5 16AKP10

Geoffrey D. Bennett (1):
      ALSA: FCP: Add Focusrite ISA C8X support

Haowen Tu (1):
      ALSA: hda/realtek: Add headset mic quirk for Acer S40-54

HyeongJun An (2):
      ASoC: SDCA: Validate written enum value in ge_put_enum_double()
      ALSA: seq: Fix uninitialised heap leak in snd_seq_event_dup()

Jean-Louis Colaco (1):
      ALSA: usb-audio: Add quirk for YAMAHA CDS3000

Jiaming Zhang (1):
      ALSA: FCP: Fix NULL pointer dereference in interface lookup

Kamlesh Chhetty (1):
      ALSA: hda: Add Lenovo Legion 7i 16IAX7 17AA3874 quirk

Maoyi Xie (3):
      ALSA: caiaq: fix out-of-bounds read in the Traktor Kontrol S4 input parser
      ALSA: caiaq: bound the length in the EP1 input parsers
      ALSA: firewire: isight: bound the sample count to the packet payload

Markus Elfring (2):
      ALSA: sh: Use more common error handling code in snd_aica_probe()
      ALSA: emu10k1: Use common error handling code in snd_emu10k1_playback_open()

Michael Bommarito (2):
      ALSA: usb-audio: qcom: reject stream disable with no active interface
      ALSA: usb-audio: qcom: clear opened when stream enable fails

Nicolas Frattaroli (1):
      ASoC: rockchip: Drop problematic guard() changes

Oder Chiou (1):
      ASoC: rt5575: Use __le32 for SPI burst write address

Oleg Kucheryavenko (2):
      ALSA: hda/realtek: Add quirk for Acer Nitro ANV15-41
      ALSA: hda/realtek: Update Acer Nitro ANV15-41 quirk to enable mute LED

Ramcharan Rajpurohit (1):
      ALSA: hda/realtek: Enable mute LED on HP EliteBook 840 G6

Richard Fitzgerald (1):
      ASoC: soc-core: Don't fail if device_link could not be created

Sen Wang (1):
      ASoC: tlv320aic3x: restrict CLKDIV bypass Q values in dual-rate mode

Shengjiu Wang (1):
      ASoC: fsl_asrc_dma: fix eDMA maxburst misalignment with channel count

Shuming Fan (1):
      ASoC: rt5650: enhance spk protection function

Srinivas Kandagatla (1):
      ASoC: qcom: q6apm: fix NULL pointer dereference in graph_callback

Uwe Kleine-König (The Capable Hub) (1):
      ASoC: rockchip: rockchip_sai: #include <linux/platform_device.h> explicitly

Xu Rao (2):
      ALSA: usb-audio: qcom: Free sideband sg_table objects
      ALSA: usb-audio: qcom: Free QMI handle

---
 drivers/soundwire/bus.c                            |  28 ---
 include/linux/soundwire/sdw.h                      |  38 ++-
 include/sound/soc-component.h                      |   4 +
 include/sound/tas2781.h                            |   4 +-
 sound/core/compress_offload.c                      |  13 +-
 sound/core/pcm_lib.c                               |   2 +-
 sound/core/seq/seq_memory.c                        |   2 +-
 sound/firewire/isight.c                            |   3 +-
 sound/hda/codecs/conexant.c                        |  12 +
 sound/hda/codecs/realtek/alc269.c                  |  10 +
 .../hda/codecs/side-codecs/cs35l41_hda_property.c  |   2 +
 sound/pci/emu10k1/emupcm.c                         |  18 +-
 sound/sh/aica.c                                    |   8 +-
 sound/soc/codecs/cs530x.c                          |  29 ++-
 sound/soc/codecs/cs530x.h                          |   6 -
 sound/soc/codecs/es9356.c                          |   4 +-
 sound/soc/codecs/max98373-sdw.c                    |   4 +-
 sound/soc/codecs/pcm512x.c                         |   2 +-
 sound/soc/codecs/rt1017-sdca-sdw.c                 |   4 +-
 sound/soc/codecs/rt1308-sdw.c                      |   4 +-
 sound/soc/codecs/rt1316-sdw.c                      |   4 +-
 sound/soc/codecs/rt5575-spi.c                      |   2 +-
 sound/soc/codecs/rt5645.c                          |   6 +-
 sound/soc/codecs/rt5645.h                          |   1 +
 sound/soc/codecs/rt5682-sdw.c                      |   4 +-
 sound/soc/codecs/rt700-sdw.c                       |   4 +-
 sound/soc/codecs/rt711-sdca-sdw.c                  |   4 +-
 sound/soc/codecs/rt712-sdca-dmic.c                 |   4 +-
 sound/soc/codecs/rt712-sdca-sdw.c                  |   4 +-
 sound/soc/codecs/rt715-sdca-sdw.c                  |   4 +-
 sound/soc/codecs/rt715-sdw.c                       |   4 +-
 sound/soc/codecs/rt721-sdca-sdw.c                  |   4 +-
 sound/soc/codecs/rt722-sdca-sdw.c                  |   4 +-
 sound/soc/codecs/tac5xx2-sdw.c                     |   4 +-
 sound/soc/codecs/tas2783-sdw.c                     |  77 ++++--
 sound/soc/codecs/tlv320aic3x.c                     |  25 +-
 sound/soc/fsl/fsl_asrc_dma.c                       |  20 ++
 sound/soc/generic/audio-graph-card2.c              |  12 -
 sound/soc/qcom/qdsp6/q6apm.c                       |   8 +
 sound/soc/rockchip/rockchip_sai.c                  | 275 +++++++++++----------
 sound/soc/sdca/sdca_asoc.c                         |   3 +
 sound/soc/soc-core.c                               |  35 ++-
 sound/usb/caiaq/input.c                            |  12 +-
 sound/usb/fcp.c                                    |   2 +
 sound/usb/midi2.c                                  |   5 +
 sound/usb/mixer_quirks.c                           |  41 +--
 sound/usb/qcom/qc_audio_offload.c                  |  16 +-
 sound/usb/quirks-table.h                           |  14 ++
 sound/usb/quirks.c                                 |   2 +
 49 files changed, 481 insertions(+), 316 deletions(-)

