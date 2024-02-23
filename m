Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9293513DB8E
	for <linux-sound@vger.kernel.org>; Fri, 23 Feb 2024 17:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708710616; cv=none; b=d2UvTuuBFln4fuDuDIy7H8k3uORbOIH8zm7mz3YYbhZxsR6Hd+ikf8/MI9iCmkKSE/jCrwEd9Go9uzDts/TDVq7JtenfiC1Dt7HkJm62iDEHNMDwj+Z1iAcQQTSjrhy/UIJH7WlgdpLjeWJePaFZRGtqnrE2A9Ksq3FOdE9ckgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708710616; c=relaxed/simple;
	bh=qVocd8oST5aBx84bfEVtYO4TEsJpD3lMD+g8OQMtT+w=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=e192lUzKiS9z/zWXyBVFa7gpZAy21bKFGxbaLOA32mNEygEiz1IBL6rxbsMWDbzMGYoJDiVYAxnPl7jAMKBbTQHpjqEKGiG/+ftnw4psJYQO8AzuWsLXqR41P8ic2uNGMGV6F11mPHXDqg0UX1VPPb2D36Xl1vVJfjv511mVcTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=meLs7f/z; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gmIuVWWY; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=meLs7f/z; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gmIuVWWY; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="meLs7f/z";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gmIuVWWY";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="meLs7f/z";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gmIuVWWY"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8A9651FC26;
	Fri, 23 Feb 2024 17:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708710610; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Okpqs7vmrHR3n5w67TlwOscp4Jdey70ddZ68ykgFtCg=;
	b=meLs7f/z5DgXd8T7Lmp5gAzKMT6Nf9PDhAY8n8Guv1cxqPkaXkQvAjBiQig8YXIhK0Aauq
	t2Layz7rLTuWwqvgXnxigwZZaGNb141FslsDuCAdxeqtOQdvfqJgyaxx15Tn4tbra38CtA
	jbb8/Juf39qp4AOnrfrnUYtLj9O2YAw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708710610;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Okpqs7vmrHR3n5w67TlwOscp4Jdey70ddZ68ykgFtCg=;
	b=gmIuVWWY60Ey47wZnd0i+wjluPPVPoTVLWZxOIVXyVSGrQqhqURJfG5BxCDZ2guoKYfu2Y
	t9MKSno+gaD2rgAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708710610; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Okpqs7vmrHR3n5w67TlwOscp4Jdey70ddZ68ykgFtCg=;
	b=meLs7f/z5DgXd8T7Lmp5gAzKMT6Nf9PDhAY8n8Guv1cxqPkaXkQvAjBiQig8YXIhK0Aauq
	t2Layz7rLTuWwqvgXnxigwZZaGNb141FslsDuCAdxeqtOQdvfqJgyaxx15Tn4tbra38CtA
	jbb8/Juf39qp4AOnrfrnUYtLj9O2YAw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708710610;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Okpqs7vmrHR3n5w67TlwOscp4Jdey70ddZ68ykgFtCg=;
	b=gmIuVWWY60Ey47wZnd0i+wjluPPVPoTVLWZxOIVXyVSGrQqhqURJfG5BxCDZ2guoKYfu2Y
	t9MKSno+gaD2rgAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6A62C132C7;
	Fri, 23 Feb 2024 17:50:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Del3GNLa2GW6RAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 23 Feb 2024 17:50:10 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2 00/24] Clean up locking with guard() in ALSA core
Date: Fri, 23 Feb 2024 18:49:37 +0100
Message-Id: <20240223175001.24375-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Bar: /
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="meLs7f/z";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=gmIuVWWY
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [0.49 / 50.00];
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
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Spam-Score: 0.49
X-Rspamd-Queue-Id: 8A9651FC26
X-Spam-Flag: NO

[ I submitted v1 patches from a wrong old branch; here is the
  resubmission of the proper patches, sorry for inconvenience ]

Hi,

this is a patch set for cleaning up the locking code in ALSA core with
the recently introduced guard() macros, i.e. the automatic cleanup
mechanism.

I started poking it in a few days ago, and since then I was very
impressed by how easily and well it simplifies the code.  It'd help
for avoiding leaking unbalanced locks, and reduce the LOC.

Most of changes are pretty systematic, just replacing the lock/unlock
with guard() or scoped_guard().  Some unnecessary variable
substitutions could be reduced by the reduction of unlock.
Also, some got slight code refactoring so that guard() macro can be
applied more cleanly, too.

The remaining lock/unlock are mostly for the cases where temporary
re-locking happens, for example in read/write or open loops.
Those could be improved in future.  Let's see.

The patches cover only the ALSA core area.  The other drivers can
receive benefits in a similar way, I suppose.


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
 sound/core/hwdep.c              |  49 ++--
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
 sound/core/rawmidi.c            | 232 ++++++-----------
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
 34 files changed, 1275 insertions(+), 1945 deletions(-)

-- 
2.35.3

