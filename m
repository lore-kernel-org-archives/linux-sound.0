Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1543C5DDD
	for <linux-sound@vger.kernel.org>; Thu,  7 May 2026 10:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778149764; cv=none; b=hUi3xSov8c5VTqFRUMwYBeAf6jvyt2dcoRXK5EhRqarwtDMRqgsA8yjO3O/PdNo0Jl/7H6E/i7akUBLv2d65cvDyOP+yDshjjpuqBKslQi4rXyeqPAgF0hZ9RdWquId9v11330tpWVTKDKuHmL7aUPJe0+/XeugjoPjfl8JsiIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778149764; c=relaxed/simple;
	bh=jZDV+cq/PbI/B2pl9HRL9XRvC5DGLbujL1XBb/ZgYm0=;
	h=Date:Message-ID:From:To:Cc:Subject:MIME-Version:Content-Type; b=GVFAL0YEG4Tj3/k5J+Ysd6S55RJ58GHyPT7MYI4grj4wdOHniDqhGi5cCTVFY94OqFGCa1YUpLjUgq24PxmVYEa5MwDWcc5H//4E4Z30B+ApMQXBIzYStc8nrIpkjdw7xx5U06AN0AUpUGpAYoISaTtk6NsHGc4ROusvFVxTWaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RkEdfQXo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LA7Cte21; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RkEdfQXo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LA7Cte21; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RkEdfQXo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LA7Cte21";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RkEdfQXo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LA7Cte21"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B89886C25F;
	Thu,  7 May 2026 10:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778149760; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=drPg/8/LCOfxf1ZWe+iNTWR89m3WJBUgfINfCVltlOE=;
	b=RkEdfQXoWcpE6lDFfBYaO0Oka7ZbzngiX60FDy6XRBjQ26j6o9KRpeWbygTel7op2/e+yY
	I4aPGUrjqxhuXMPHx2T/haGvuaeUQxy8Esmp2WN6kMvJw/18nfGIwlrwZsUH4lgpNHRSxv
	8AhVzQ5Lj2BUN+lnipk33AjB4HYVMms=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778149760;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=drPg/8/LCOfxf1ZWe+iNTWR89m3WJBUgfINfCVltlOE=;
	b=LA7Cte210R+MzIzg0w3a1T3UcDjzkxGXN959JPPlXVVb+6hXKDowLoKCrVZgD4ZZYl8f8i
	nvyxdOjFRuNLzQDg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=RkEdfQXo;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=LA7Cte21
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778149760; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=drPg/8/LCOfxf1ZWe+iNTWR89m3WJBUgfINfCVltlOE=;
	b=RkEdfQXoWcpE6lDFfBYaO0Oka7ZbzngiX60FDy6XRBjQ26j6o9KRpeWbygTel7op2/e+yY
	I4aPGUrjqxhuXMPHx2T/haGvuaeUQxy8Esmp2WN6kMvJw/18nfGIwlrwZsUH4lgpNHRSxv
	8AhVzQ5Lj2BUN+lnipk33AjB4HYVMms=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778149760;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=drPg/8/LCOfxf1ZWe+iNTWR89m3WJBUgfINfCVltlOE=;
	b=LA7Cte210R+MzIzg0w3a1T3UcDjzkxGXN959JPPlXVVb+6hXKDowLoKCrVZgD4ZZYl8f8i
	nvyxdOjFRuNLzQDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8A41E593A7;
	Thu,  7 May 2026 10:29:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ycFpIIBp/GkCQAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 07 May 2026 10:29:20 +0000
Date: Thu, 07 May 2026 12:29:20 +0200
Message-ID: <87bjerqzr3.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Linux Sound Mailing List <linux-sound@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] sound fixes for 7.1-rc3
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
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
X-Rspamd-Queue-Id: B89886C25F
X-Spam-Level: 

Linus,

please pull sound fixes for v7.1-rc3 from:

  git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-7.1-rc3

The topmost commit is 06bc7ff0a1e0f2b0102e1314e3527a7ec0997851

----------------------------------------------------------------

sound fixes for 7.1-rc3

Again a collection of small fixes, mostly for device-specific ones.
The only big LOC is about the removal of pretty old dead code in
ab8500 codec driver, while the rest all nice small changes.

* Core / API:
- Fix race in deferred fasync state checks
- Fix UMP group filtering in sequencer

* ASoC:
- cs35l56: fixes for driver cleanup and error paths
- tas2764/2770: workaround for bogus temperature readings
- wm_adsp: fixes for firmware unit tests
- amd-yc: more DMI quirks for laptops
- Minor fixes for fsl_xcvr and spacemit

* HD-Audio:
- Mute LED and speaker quirks for HP, Lenovo, and Xiaomi laptops

* USB-audio:
- New device-specific quirks (Motu, JBL, AlphaTheta, Razer)
- Fix of MIDI2 playback on resume

* Others:
- Firewire-tascam control event fix
- Minor cleanups and fixes for sparc/dbri and pcmtest

----------------------------------------------------------------

Anton Swart (1):
      ALSA: usb-audio: Add quirk flags for AlphaTheta EUPHONIA

Bob Song (1):
      ASoC: amd: yc: Add DMI quirk for MSI Bravo 15 C7VE

Cássio Gabriel (6):
      ALSA: pcmtest: Return -EFAULT on pattern read copy failure
      ASoC: fsl_xcvr: Fix event generation for cached controls
      ALSA: firewire-tascam: Do not drop unread control events
      ALSA: usb-audio: midi2: Restart output URBs on resume
      ALSA: seq: Fix UMP group 16 filtering
      ALSA: core: Serialize deferred fasync state checks

Derek Fang (1):
      ASoC: sdw_utils: avoid the SDCA companion function not supported failure

Fernando Antunez Antonio (1):
      ALSA: hda/realtek: Fix mute and mic-mute LEDs for HP Envy X360 15-fh0xxx

James Calligeros (2):
      ASoC: tas2764: Deal with bogus initial temperature register value
      ASoC: tas2770: Deal with bogus initial temperature value

Nicola Lunghi (1):
      ALSA: usb-audio: add clock quirk for Motu 1248

Pauli Virtanen (1):
      ALSA: usb-audio: add min_mute quirk for Razer Nommo V2 X

Richard Fitzgerald (6):
      ASoC: cs35l56: Fix hibernate write in runtime resume error path
      ASoC: cs35l56: Fix out-of-bounds in dev_err() in cs35l56_read_onchip_spkid()
      ASoC: wm_adsp_fw_find_test: Redirect wm_adsp_release_firmware_files()
      ASoC: wm_adsp_fw_find_test: Clear searched_fw_files in find-by-index test
      ASoC: cs35l56: Don't use devres to unregister component
      ASoC: cs35l56: Destroy workqueue in probe error path

Rodrigo Faria (1):
      ALSA: hda/realtek: Add mute LED fixup for HP Pavilion 15-cs1xxx

Rong Zhang (1):
      ALSA: usb-audio: Add quirk flags for JBL Pebbles

Rosen Penev (1):
      ALSA: sparc/dbri: add missing fallthrough

Rámon van Raaij (1):
      ALSA: hda/realtek: Add codec SSID quirk for Lenovo Yoga Pro 9 16IMH9

Tommaso Soncin (1):
      ASoC: amd: yc: Add HP OMEN Gaming Laptop 16-ap0xxx product line in quirk table

Troy Mitchell (1):
      ASoC: spacemit: fix RX DMA params not set when TX is running

Uwe Kleine-König (The Capable Hub) (1):
      ASoC: codecs: ab8500: Remove suspicious code

Yuriy Padlyak (1):
      ALSA: hda/realtek: Fix speaker silence after S3 resume on Xiaomi Mi Laptop Pro 15

---
 sound/core/misc.c                       |   8 +-
 sound/core/seq/seq_clientmgr.c          |   2 +-
 sound/core/seq/seq_clientmgr.h          |   5 +-
 sound/core/seq/seq_ump_client.c         |   2 +-
 sound/drivers/pcmtest.c                 |   6 +-
 sound/firewire/tascam/tascam-hwdep.c    |   1 +
 sound/hda/codecs/realtek/alc269.c       |  53 +++++-
 sound/soc/amd/yc/acp6x-mach.c           |  21 +++
 sound/soc/codecs/ab8500-codec.c         | 304 +-------------------------------
 sound/soc/codecs/cs35l56-shared.c       |  11 +-
 sound/soc/codecs/cs35l56.c              |  11 +-
 sound/soc/codecs/tas2764.c              |  35 +++-
 sound/soc/codecs/tas2770.c              |  23 ++-
 sound/soc/codecs/wm_adsp_fw_find_test.c |  57 ++++--
 sound/soc/fsl/fsl_xcvr.c                |  17 +-
 sound/soc/sdw_utils/soc_sdw_utils.c     |   1 +
 sound/soc/spacemit/k1_i2s.c             |   7 +-
 sound/sparc/dbri.c                      |   1 +
 sound/usb/clock.c                       |  15 +-
 sound/usb/midi2.c                       |   9 +-
 sound/usb/quirks.c                      |   7 +
 21 files changed, 243 insertions(+), 353 deletions(-)

