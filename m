Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2905D2E41A
	for <linux-sound@vger.kernel.org>; Fri, 23 Feb 2024 16:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708705701; cv=none; b=PrkW5jKhqrtAF64OpXNU0pD93BCx6xDG8AW3EXku/WpJeizOLA+tCEABVyfpTSx25cjfYvyxAEXx7LU4wZUXG8IcY11Qu2gfQ9xmaGPs0Iq7ZwYqvbqzwtbxoUbptFHgGiCcrZHax60Gk6ddvyYxsOXBpevjgWMHQLM3R6/DsDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708705701; c=relaxed/simple;
	bh=a5sX208YUYR2/HMfPs61eibipCeRdBZtslhL+DMVbiY=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=EbZyZivk9vbGStWyUTECav0LeP+vmIKvGP7mIMNM/jPTLmnKI7f+ZqsAJ7CPDLDud2KnQo3MWxJIfYmEfUEg4V/uD+jjxbwK5vETDg7bplW2t5sJwn8vc9hil7mtV6LJvMTLRq+WwR2ssWDdDh2sYtZXk3daNYYRCiY2KWhJlMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=izMK3AoB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CYwTDxxf; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=izMK3AoB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CYwTDxxf; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="izMK3AoB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CYwTDxxf";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="izMK3AoB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CYwTDxxf"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5BA8C21F03;
	Fri, 23 Feb 2024 16:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708705698; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=lcSj1Mvg0Ayp1oWR22CxlKfLBK2+BQGBuTRwfKpXf4o=;
	b=izMK3AoBf4U2ujPRhXSzodNcGAn5nWK+3bVhgFl/YHUpOE26OueCGFL+RVTNOa96Gp1N2a
	PRGrmzOrGDnF7b5ZCjrLoFrPSNg0YMgUTWaWGpd7xBE/jMP75GmFUc/i1KlctFp2LmHBQL
	ybskdrOXba3HffOTEDqwaJqCRD5ivvk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708705698;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=lcSj1Mvg0Ayp1oWR22CxlKfLBK2+BQGBuTRwfKpXf4o=;
	b=CYwTDxxfCG8UIMlDzELzF7017wCLbVFhZnhHfXRon3S7WZ4XUieFMfQ4bFcv3yPPa1oC2Y
	RfdKeFA/4BaYORCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708705698; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=lcSj1Mvg0Ayp1oWR22CxlKfLBK2+BQGBuTRwfKpXf4o=;
	b=izMK3AoBf4U2ujPRhXSzodNcGAn5nWK+3bVhgFl/YHUpOE26OueCGFL+RVTNOa96Gp1N2a
	PRGrmzOrGDnF7b5ZCjrLoFrPSNg0YMgUTWaWGpd7xBE/jMP75GmFUc/i1KlctFp2LmHBQL
	ybskdrOXba3HffOTEDqwaJqCRD5ivvk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708705698;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=lcSj1Mvg0Ayp1oWR22CxlKfLBK2+BQGBuTRwfKpXf4o=;
	b=CYwTDxxfCG8UIMlDzELzF7017wCLbVFhZnhHfXRon3S7WZ4XUieFMfQ4bFcv3yPPa1oC2Y
	RfdKeFA/4BaYORCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3F8D0133DC;
	Fri, 23 Feb 2024 16:28:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id B3zdDaLH2GWaMQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 23 Feb 2024 16:28:18 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 00/24] Clean up locking with guard() in ALSA core
Date: Fri, 23 Feb 2024 17:27:46 +0100
Message-Id: <20240223162810.32302-1-tiwai@suse.de>
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
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=izMK3AoB;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=CYwTDxxf
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-1.51 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 FROM_HAS_DN(0.00)[];
	 DWL_DNSWL_MED(-2.00)[suse.de:dkim];
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
	 NEURAL_HAM_SHORT(-0.20)[-0.994];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Spam-Score: -1.51
X-Rspamd-Queue-Id: 5BA8C21F03
X-Spam-Flag: NO

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
 sound/core/control.c            | 429 +++++++++++++-------------------
 sound/core/control_led.c        | 150 +++++------
 sound/core/hrtimer.c            |  24 +-
 sound/core/hwdep.c              |  49 ++--
 sound/core/info.c               |  93 +++----
 sound/core/info_oss.c           |  10 +-
 sound/core/init.c               | 199 +++++++--------
 sound/core/jack.c               |  25 +-
 sound/core/oss/mixer_oss.c      | 153 +++++-------
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
 sound/core/timer.c              | 429 +++++++++++++-------------------
 sound/core/timer_compat.c       |   7 +-
 sound/core/ump.c                |  35 +--
 33 files changed, 1244 insertions(+), 1881 deletions(-)

-- 
2.35.3

