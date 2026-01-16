Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D30136C5BA
	for <linux-sound@vger.kernel.org>; Fri, 16 Jan 2026 12:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768565048; cv=none; b=oalanXoFlcLF+AtbRvBNzXQw/qwY+ozfVCZ5FXpnSlHFN35gHhTYsl/D12HrrRIX/ZBZqU28u6txphAAlX+OuTATN1y1OGas7xmFEFd/FlcXoUAvOI5wZxxddQ9fZ/6g6v0STOYcjeZpNmLG9RQM8GbfbblX7V7Y7htjjJZQuVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768565048; c=relaxed/simple;
	bh=nyDPU0t/x4fxv4toVd4xLHa2qrNmtzcK1wGiU90ItAQ=;
	h=Date:Message-ID:From:To:Cc:Subject:MIME-Version:Content-Type; b=YPHnYO846f0eTpgjPK0YRE9mNL7KdHluJJLZjglV3g6VctOyyvAxmmCIv6Pz5qN/eZ07rzwUxF0522kzNvYSe4uXg3GlL1nI1K524tbB8lFcwGuSNMykUPyoWGQUjZxn9MgEH+b/r75psDde6e/x9Uw1EwfV8x6kMRteE4hE6oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=K3vVJ9t7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vBJgjVFE; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=K3vVJ9t7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vBJgjVFE; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="K3vVJ9t7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vBJgjVFE";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="K3vVJ9t7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vBJgjVFE"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3E2A95BE12;
	Fri, 16 Jan 2026 12:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1768565045; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=fnkaeFg0O90iuBNm7oUFbI+G4WPz4QpRBQ7NM1x6StA=;
	b=K3vVJ9t7e2ih5UfTeGfxSRGP2Aiev8K8wqA5M/hwuNlkdd5nAmhs9AbAvcFpzlujicACl2
	5YSOySEy5773yGFCro05qXtvSQ5TUB+4KLn0NxMk6XyQKJOwRGAX+nCxEvAoYJO/Te7y11
	YO4Vnvxgj3pLSbrvR0Aa5fSCP3amoBU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1768565045;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=fnkaeFg0O90iuBNm7oUFbI+G4WPz4QpRBQ7NM1x6StA=;
	b=vBJgjVFEURLEQ6VE2JS7qgl8cZ6gcrft6tVNRhPfDp1oPGrqw7O6ZUY7NfBn8zdzQwTmMi
	DoIW4PIJ3bTdTqCw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=K3vVJ9t7;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=vBJgjVFE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1768565045; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=fnkaeFg0O90iuBNm7oUFbI+G4WPz4QpRBQ7NM1x6StA=;
	b=K3vVJ9t7e2ih5UfTeGfxSRGP2Aiev8K8wqA5M/hwuNlkdd5nAmhs9AbAvcFpzlujicACl2
	5YSOySEy5773yGFCro05qXtvSQ5TUB+4KLn0NxMk6XyQKJOwRGAX+nCxEvAoYJO/Te7y11
	YO4Vnvxgj3pLSbrvR0Aa5fSCP3amoBU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1768565045;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=fnkaeFg0O90iuBNm7oUFbI+G4WPz4QpRBQ7NM1x6StA=;
	b=vBJgjVFEURLEQ6VE2JS7qgl8cZ6gcrft6tVNRhPfDp1oPGrqw7O6ZUY7NfBn8zdzQwTmMi
	DoIW4PIJ3bTdTqCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 125623EA63;
	Fri, 16 Jan 2026 12:04:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ycYnAzUpammsWAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 16 Jan 2026 12:04:05 +0000
Date: Fri, 16 Jan 2026 13:04:04 +0100
Message-ID: <87zf6ddarv.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] sound fixes for 6.19-rc6
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Rspamd-Queue-Id: 3E2A95BE12
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 

Linus,

please pull sound fixes for v6.19-rc6 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-6.19-rc6

The topmost commit is 46b8d0888f01f250fbd24d00ff80b755c3c42cd4

----------------------------------------------------------------

sound fixes for 6.19-rc6

This PR became a bit larger than wished, often seen as a bump at the
middle, but almost all changes are small device-specific fixes, so the
risk must be pretty low.

- SoundWire fix for missing symbol export
- Fixes for device-tree bindings
- A fix for OOB access in USB-audio, spotted by fuzzer
- Quirks for HD-audio, SoundWire, AMD ACP
- A series of ASoC tlv320 and wsa codec fixes
- Other misc fixes in PCM OSS error-handling, Cirrus scodec test,
  ASoC ops endianess, davinci, simple-card, and tegra.

----------------------------------------------------------------

Aleksandrs Vinarskis (1):
      ALSA: hda/realtek: Add quirk for Asus Zephyrus G14 2025 using CS35L56, fix speakers

Ben Dooks (1):
      ASoC: ops: fix pointer types to be big-endian

Cole Leavitt (1):
      ASoC: sdw_utils: cs42l43: Enable Headphone pin for LINEOUT jack type

Deep Harsora (1):
      ASoC: Intel: sof_sdw: Add new quirks for PTL on Dell with CS42L43

Dimitrios Katsaros (1):
      ASoC: tlv320adcx140: Propagate error codes during probe

Edward Adam Davis (1):
      ALSA: usb-audio: Prevent excessive number of frames

Emil Svendsen (3):
      ASoC: tlv320adcx140: invert DRE_ENABLE
      ASoC: tlv320adcx140: fix null pointer
      ASoC: tlv320adcx140: fix word length

Jaroslav Kysela (1):
      ALSA: pcm: Improve the fix for race of buffer access at PCM OSS layer

Johan Hovold (4):
      ASoC: codecs: wsa883x: fix unnecessary initialisation
      ASoC: codecs: wsa881x: fix unnecessary initialisation
      ASoC: codecs: wsa884x: fix codec initialisation
      ASoC: codecs: wsa883x: suppress variant printk

Jon Hunter (3):
      ASoC: dt-bindings: realtek,rt5640: Document mclk
      ASoC: dt-bindings: realtek,rt5640: Update jack-detect
      ASoC: dt-bindings: realtek,rt5640: Document port node

Kery Qi (1):
      ASoC: davinci-evm: Fix reference leak in davinci_evm_probe

Mark Brown (1):
      ASoC: rt5640: Fix duplicate clock properties in DT binding

Matthew Schwartz (1):
      ALSA: hda/tas2781: Skip UEFI calibration on ASUS ROG Xbox Ally X

Radhi Bajahaw (1):
      ASoC: amd: yc: Fix microphone on ASUS M6500RE

Richard Fitzgerald (4):
      ALSA: hda/cirrus_scodec_test: Fix incorrect setup of gpiochip
      ALSA: hda/cirrus_scodec_test: Fix test suite name
      soundwire: Add missing EXPORT for sdw_slave_type
      ASoC: sdw_utils: Call init callbacks on the correct codec DAI

Rob Herring (Arm) (4):
      ASoC: dt-bindings: everest,es8316: Add interrupt support
      ASoC: dt-bindings: realtek,rt5640: Add missing properties/node
      ASoC: dt-bindings: realtek,rt5640: Allow 7 for realtek,jack-detect-source
      ASoC: dt-bindings: rockchip-spdif: Allow "port" node

Shenghao Ding (1):
      ALSA: hda/tas2781: Add newly-released HP laptop

Shengjiu Wang (1):
      ASoC: simple-card-utils: Check device node before overwrite direction

Zhang Heng (1):
      ALSA: hda/realtek: Add quirk for HP Pavilion x360 to enable mute LED

sheetal (1):
      ASoC: tegra: Revert fix for uninitialized flat cache warning in tegra210_ahub

---
 .../devicetree/bindings/sound/everest,es8316.yaml  |  4 ++
 .../devicetree/bindings/sound/realtek,rt5640.yaml  | 11 ++++++
 .../devicetree/bindings/sound/rockchip-spdif.yaml  |  3 ++
 drivers/soundwire/slave.c                          |  1 +
 include/sound/pcm.h                                |  2 +-
 sound/core/oss/pcm_oss.c                           |  4 +-
 sound/core/pcm_native.c                            |  9 ++++-
 sound/hda/codecs/realtek/alc269.c                  |  2 +
 sound/hda/codecs/side-codecs/cirrus_scodec_test.c  |  3 +-
 sound/hda/codecs/side-codecs/tas2781_hda_i2c.c     | 18 ++++++++-
 sound/soc/amd/yc/acp6x-mach.c                      |  7 ++++
 sound/soc/codecs/tlv320adcx140.c                   | 13 ++++---
 sound/soc/codecs/wsa881x.c                         |  9 +++++
 sound/soc/codecs/wsa883x.c                         | 26 +++++++++----
 sound/soc/codecs/wsa884x.c                         |  3 +-
 sound/soc/generic/simple-card-utils.c              |  4 +-
 sound/soc/intel/boards/sof_sdw.c                   |  8 ++++
 sound/soc/sdw_utils/soc_sdw_cs42l43.c              |  2 +-
 sound/soc/sdw_utils/soc_sdw_utils.c                | 43 +++++++++++++++++++++-
 sound/soc/soc-ops.c                                |  4 +-
 sound/soc/tegra/tegra210_ahub.c                    |  6 +--
 sound/soc/ti/davinci-evm.c                         | 39 ++++++++++++++++----
 sound/usb/pcm.c                                    |  2 +-
 23 files changed, 182 insertions(+), 41 deletions(-)

