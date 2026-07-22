Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84380436BFE
	for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 09:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784711751; cv=none; b=spI+PgsQAUUJQup6H3Gj50irraAdUyeUxf3NhiPsYAg3jrM4HYlDvbVd0CwoQ5pZSGdR+sOIsyYvms2TP6qPKCIu7znbAfA6USKdGqZ+09hq1KaNnapcvh7H0ahvRvRNhvvV5KatWxtpFff5kRnFMN0f0oFZzLnNPvq3CTOqULs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784711751; c=relaxed/simple;
	bh=um4kfNdDWbp9uc5D89G02PpHbMvWJSolgKdKupThDR0=;
	h=Date:Message-ID:From:To:Cc:Subject:MIME-Version:Content-Type; b=d3/xWLvtZ1Q6yVytnKbvLGOkcPV5wmlRxzB+5YdCWFELfCGmZxCsT5f0UAC5il3dWA5Bq8uFUy7uZUxpJqZ22DxNvacY28xgFBkmvi9tekbYpqlsV5UNAYCxEVo/pmnp1toT7KNgOWbGZb5ro8ICaM/rmP7pVIpKQSavyZKMkkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dzelg/cV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MDXGZ/Vx; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=au3TGqFL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cW7E+m9U; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dzelg/cV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MDXGZ/Vx";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="au3TGqFL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cW7E+m9U"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BFA997A9E9;
	Wed, 22 Jul 2026 09:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784711741; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5Zo8bndnyFqzBbVaDGiCUk4rt4HY5PK45ST0QQ/ZWA4=;
	b=dzelg/cVjcOUxGQIKQ3ZlXmM2gNn/IjG9yFAcoYcrrFhG4HCoeTDHo6yaMENiSc97Ypbgq
	I4HzBVxDiu0DUdpXyzuyOi/R4HslR4tQPYgg4xIl6uDAVivopnYn6OLiowt1iAs4OUeXMA
	AAGwloZMM+9mLGnULdNG1tgpGdHrJT0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784711741;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5Zo8bndnyFqzBbVaDGiCUk4rt4HY5PK45ST0QQ/ZWA4=;
	b=MDXGZ/VxMhFKeniMVxeJlwcnktXVuznYkHI08Bb2x3NpH3ZHcLlpiYmce2pd66vcTItVfN
	lYXOs+rWGlRpuqCg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=au3TGqFL;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=cW7E+m9U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784711738; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5Zo8bndnyFqzBbVaDGiCUk4rt4HY5PK45ST0QQ/ZWA4=;
	b=au3TGqFLF7uxgbi/aGelFdRQVPErwWUTPH8Xda/pfiNAzbLZ9r21RznbxOXW2jDrqMNlsO
	VhltqaXLFG8i6hhKX4l5uW7jJPMcSGcg0/NTmQ+QJNHfnMN446UndSX6h0/8EgI/tDSDFJ
	gKkvxcbjQROftZQq1uUnvWg0hWUt6rc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784711738;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5Zo8bndnyFqzBbVaDGiCUk4rt4HY5PK45ST0QQ/ZWA4=;
	b=cW7E+m9UAtkL+MqCby7fytOb7IAe8Mo+LodQJceu3kdql91nLn9auHc4rRgiCLdbQd627f
	NhDGtdt8x1zPuyDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 937D7779B0;
	Wed, 22 Jul 2026 09:15:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ZW/JIjqKYGqPLgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 22 Jul 2026 09:15:38 +0000
Date: Wed, 22 Jul 2026 11:15:38 +0200
Message-ID: <87ldb3gzb9.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] sound fixes for 7.2-rc5
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
X-Rspamd-Queue-Id: BFA997A9E9
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
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

Linus,

please pull sound fixes for v7.2-rc5 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.2-rc5

The topmost commit is 9573818cc1b7ac22176d0a2b60bfbc440e94f7d5

----------------------------------------------------------------

sound fixes for 7.2-rc5

A collection of fixes that have been accumulated recently.
The amount is still "new normal", but all small fixes.
Mostly hardware-specific quirks, but including a few core fixes, too.

ALSA Core:
- Fix potential UAF and race fixes in ALSA timer core
- Fix sequencer queue timer cleanup to prevent leaks and double-free

HD-audio:
- Fix silent streams with Intel HDMI keep-alive silent mode
- Quirks for HP laptops (Pavilion x360, EliteBook 830 G8, ZBook 8
  G2a), Samsung 750XBE/730XBE, and Dell Pro QC1255, Alienware x16 R2,
  Lunnen Ground 14
- Properly validate ACPI mute object in CS35L41 HDA companion driver
- Reset calibration data size on failure in TAS2781 HDA driver.

USB-audio:
- Support FIXED_RATE quirk for JBL Quantum650 Wireless USB headset

ASoC:
- Intel SOF SoundWire board driver quirks for new Dell laptops
- DMI overrides and quirks for AMD ACP/YC platforms, including new
  ASUS TUF platforms and MSI Vector A16 HX laptops
- Skip sysclk reset for active DAIs in shutdown for FSL imx-card
- Fix spurious BCLK on resume by clearing BYP in FSL SAI driver
- Add playback-only quirk for H616 codec in Allwinner driver
- Fix Cirrus Logic CS35L56 potential probe deadlock
- Fix cache write-through on resume in FS210X codec
- Bound firmware description string parsing in TAS2781 codec driver
- Fix duplicate DAPM widget names for wideband DAI in BT-SCO codec

----------------------------------------------------------------

Antonio Ignacio Campos Ruiz (1):
      ASoC: amd: yc: Add DMI quirk for MSI Vector A16 HX A8WIG

Chancel Liu (2):
      ASoC: fsl_sai: Fix spurious BCLK on resume by clearing BYP
      ASoC: fsl: imx-card: Skip sysclk reset for active DAIs in shutdown

Charles Keepax (1):
      ASoC: Intel: sof_sdw: Add quirks for new Dell laptops

Chen-Yu Tsai (1):
      ASoC: sun4i-codec: Set quirks.playback_only for H616 codec

Chris Chiu (1):
      ALSA: hda/realtek: Add inverted LED quirk for HP ZBook 8 G2a

Daniel C. Ribeiro (1):
      ALSA: usb-audio: Add FIXED_RATE quirk for JBL Quantum650 Wireless

Guangshuo Li (1):
      ALSA: hda: cs35l41: validate and free ACPI mute object

Kai Vehmanen (1):
      ALSA: hda: codecs: hdmi: disable keep-alive before audio format change

Kailang Yang (1):
      ALSA: hda/realtek - Add quirk for Dell Pro QC1255

Marcel K³os (1):
      ALSA: hda/realtek: Add quirk for HP EliteBook 830 G8 (8AB8) to enable mute LEDs

Mark Brown (1):
      ASoC: fs210x: Make cache write through again during resume

Nikita Maksimov (1):
      ALSA: hda/realtek: Fix speakers on Lunnen Ground 14

Norbert Szetei (3):
      ALSA: seq: close a re-opened queue timer in the destructor
      ALSA: timer: don't re-enter an instance callback that is still running
      ALSA: timer: drain a slave's callback before its master detaches it

Oliver Ohrt (1):
      ALSA: hda/realtek: Fix speakers on Alienware x16 R2

Pengpeng Hou (1):
      ASoC: tas2781: bound firmware description string parsing

Philipp Oster (1):
      ALSA: hda/tas2781: clear cali_data.total_sz when calibration read fails

Richard Fitzgerald (2):
      ASoC: cs35l56: Fix potential probe() deadlock
      ASoC: cs35l56: Use complete_all() to signal init_completion

Shengjiu Wang (1):
      ASoC: bt-sco: fix duplicate DAPM widget names for wideband DAI

Syed Saba Kareem (1):
      ASoC: amd: acp: add ACP70 DMI override for new ASUS TUF platforms

Takashi Iwai (1):
      ALSA: hda/realtek: Add quirk for HP Pavilion x360

Zhang Heng (1):
      ALSA: hda/realtek: Add HDA_CODEC_QUIRK for Samsung 750XBE/730XBE

---
 sound/core/seq/seq_timer.c                     | 13 ++++-
 sound/core/timer.c                             | 21 +++++--
 sound/hda/codecs/hdmi/hdmi.c                   |  3 +
 sound/hda/codecs/hdmi/hdmi_local.h             |  9 +++
 sound/hda/codecs/hdmi/intelhdmi.c              | 36 ++++++++++--
 sound/hda/codecs/realtek/alc269.c              | 76 +++++++++++++++++++++++++-
 sound/hda/codecs/side-codecs/cs35l41_hda.c     | 11 +++-
 sound/hda/codecs/side-codecs/tas2781_hda_i2c.c |  3 +
 sound/soc/amd/acp-config.c                     | 12 ++++
 sound/soc/amd/yc/acp6x-mach.c                  |  7 +++
 sound/soc/codecs/bt-sco.c                      | 10 +++-
 sound/soc/codecs/cs35l56-i2c.c                 |  4 +-
 sound/soc/codecs/cs35l56-spi.c                 |  4 +-
 sound/soc/codecs/cs35l56.c                     | 17 +++++-
 sound/soc/codecs/fs210x.c                      |  1 +
 sound/soc/codecs/tas2781-fmwlib.c              | 63 +++++++++++++++++++--
 sound/soc/fsl/fsl_sai.c                        | 29 ++++++++--
 sound/soc/fsl/imx-card.c                       | 12 ++--
 sound/soc/intel/boards/sof_sdw.c               |  2 +
 sound/soc/sunxi/sun4i-codec.c                  |  1 +
 sound/usb/quirks.c                             |  2 +
 21 files changed, 300 insertions(+), 36 deletions(-)

