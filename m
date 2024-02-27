Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68EE8133297
	for <linux-sound@vger.kernel.org>; Tue, 27 Feb 2024 08:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709024003; cv=none; b=AxaQWe7JEroE/UIwobq8jML59Hd55r/n7Nm+LowuVFw/qe9/aFO/ZSrUPJqoLGDxojWCg/J0FMO6oXiKVZyq513f1VipFtQra/4bHbs4mvVqoIFf/fjrQE0TCAA+ZiBrALFrTOobAyb7lwzFAR2R7x4BNvF4tDmqc5xsckFtT0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709024003; c=relaxed/simple;
	bh=ovuVliyaOlyyJVzJUjMWesDEpjHleskBuiZiMzZ8p8Y=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=GibzpGf03EH4TrEY3TVCxCwz01gJXNHPzPNlsOAerQK6Z5dweVAPXohJkr9ExVHloir5j8vPHd3bOG0WjYATFN7lPXOo+aUNE6BVLLOpWOsddiCX7G63MlSeT0YY2DQ701n7ugQQfvoFSGFcGpJXn0L7m7fp2DcbmXYefgb8T0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EG0SoA4u; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Hp04JxYH; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EG0SoA4u; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Hp04JxYH; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EG0SoA4u";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Hp04JxYH";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EG0SoA4u";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Hp04JxYH"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 430B222768;
	Tue, 27 Feb 2024 08:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1709023994; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=F9cmDv75aRo2JbkXf+2vnOn+ntVquJJ5nb8al8h1/7Y=;
	b=EG0SoA4upi6FaUz1IsQgOsORgc09zERzjjo85GCiIUjprxPeM0ZtkRs/QRtfDG5LOVhH8m
	KDv3AVS/ejUvgaaP1i/77rkVAnDg6CxxNVBwwZeKM0MOQweX2CSJNFLsajXQ4IcVWorGRZ
	mKwL+mB1ShoAfc1lstRfUYbc+lOTYTY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709023994;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=F9cmDv75aRo2JbkXf+2vnOn+ntVquJJ5nb8al8h1/7Y=;
	b=Hp04JxYHfETBpBTFzy2oENOMhvo1MuamHnRKkqkVoixL2tLe7jPkMMdA43a/uyTcDVcN8v
	W/r0i/p0vjvwXeAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1709023994; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=F9cmDv75aRo2JbkXf+2vnOn+ntVquJJ5nb8al8h1/7Y=;
	b=EG0SoA4upi6FaUz1IsQgOsORgc09zERzjjo85GCiIUjprxPeM0ZtkRs/QRtfDG5LOVhH8m
	KDv3AVS/ejUvgaaP1i/77rkVAnDg6CxxNVBwwZeKM0MOQweX2CSJNFLsajXQ4IcVWorGRZ
	mKwL+mB1ShoAfc1lstRfUYbc+lOTYTY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709023994;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=F9cmDv75aRo2JbkXf+2vnOn+ntVquJJ5nb8al8h1/7Y=;
	b=Hp04JxYHfETBpBTFzy2oENOMhvo1MuamHnRKkqkVoixL2tLe7jPkMMdA43a/uyTcDVcN8v
	W/r0i/p0vjvwXeAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1D30D13A58;
	Tue, 27 Feb 2024 08:53:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id rbvXBfqi3WWeaQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 27 Feb 2024 08:53:14 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v3 00/24] Clean up locking with guard() in ALSA core
Date: Tue, 27 Feb 2024 09:52:42 +0100
Message-Id: <20240227085306.9764-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=EG0SoA4u;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Hp04JxYH
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-2.83 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 FROM_HAS_DN(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_DN_NONE(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 DWL_DNSWL_HI(-3.50)[suse.de:dkim];
	 RCPT_COUNT_ONE(0.00)[1];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 NEURAL_HAM_SHORT(-0.02)[-0.121];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Spam-Score: -2.83
X-Rspamd-Queue-Id: 430B222768
X-Spam-Flag: NO

Hi,

this is a revised patch set for cleaning up the locking code in ALSA
core with the recently introduced guard() macros, i.e. the automatic
cleanup mechanism.

v2->v3:
  Only addressed compile warnings from clang in a couple of patches.

v2: https://lore.kernel.org/r/20240223175001.24375-1-tiwai@suse.de


Takashi

===

Takashi Iwai (24):
  ALSA: ump: Use guard() for locking
  ALSA: compress_offload: Use guard() for locking
  ALSA: timer: Use guard() for locking
  ALSA: hrtimer: Use guard() for locking
  ALSA: hwdep: Use guard() for locking
  ALSA: info: Use guard() for locking
  ALSA: mixer_oss: Use guard() for locking
  ALSA: control: Use guard() for locking
  ALSA: rawmidi: Use guard() for locking
  ALSA: jack: Use guard() for locking
  ALSA: core: Use guard() for locking
  ALSA: seq: fifo: Use guard() for locking
  ALSA: seq: memory: Use guard() for locking
  ALSA: seq: ports: Use guard() for locking
  ALSA: seq: queue: Use guard() for locking
  ALSA: seq: timer: Use guard() for locking
  ALSA: seq: midi: Use guard() for locking
  ALSA: seq: ump: Use guard() for locking
  ALSA: seq: virmidi: Use guard() for locking
  ALSA: seq: prioq: Use guard() for locking
  ALSA: pcm: Use guard() for locking
  ALSA: pcm: Use guard() for PCM stream locks
  ALSA: pcm: oss: Use guard() for setup
  ALSA: control_led: Use guard() for locking

 include/sound/pcm.h             |  12 +
 sound/core/compress_offload.c   |  98 +++-----
 sound/core/control.c            | 431 +++++++++++++-------------------
 sound/core/control_compat.c     |  18 +-
 sound/core/control_led.c        | 150 +++++------
 sound/core/hrtimer.c            |  24 +-
 sound/core/hwdep.c              |  85 +++----
 sound/core/info.c               |  93 +++----
 sound/core/info_oss.c           |  10 +-
 sound/core/init.c               | 199 +++++++--------
 sound/core/jack.c               |  25 +-
 sound/core/oss/mixer_oss.c      | 228 +++++++----------
 sound/core/oss/pcm_oss.c        |  41 ++-
 sound/core/pcm.c                |  90 +++----
 sound/core/pcm_compat.c         |  66 +++--
 sound/core/pcm_lib.c            |  10 +-
 sound/core/pcm_memory.c         |  30 +--
 sound/core/pcm_native.c         | 340 +++++++++++--------------
 sound/core/rawmidi.c            | 253 +++++++------------
 sound/core/seq/seq_fifo.c       |  55 ++--
 sound/core/seq/seq_memory.c     |  28 +--
 sound/core/seq/seq_midi.c       |  16 +-
 sound/core/seq/seq_midi_event.c |  14 +-
 sound/core/seq/seq_ports.c      | 114 ++++-----
 sound/core/seq/seq_prioq.c      |  59 ++---
 sound/core/seq/seq_queue.c      |  78 +++---
 sound/core/seq/seq_timer.c      | 163 +++++-------
 sound/core/seq/seq_ump_client.c |  13 +-
 sound/core/seq/seq_virmidi.c    |  18 +-
 sound/core/sound.c              |  28 +--
 sound/core/sound_oss.c          |  17 +-
 sound/core/timer.c              | 429 +++++++++++++------------------
 sound/core/timer_compat.c       |   7 +-
 sound/core/ump.c                |  35 +--
 34 files changed, 1306 insertions(+), 1971 deletions(-)

-- 
2.35.3

