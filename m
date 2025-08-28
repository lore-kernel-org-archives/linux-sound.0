Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA573112D8
	for <linux-sound@vger.kernel.org>; Thu, 28 Aug 2025 13:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756387693; cv=none; b=gysSCdvXBFWJ4i2iMMz99xHFeeIppJWXNdze6snyWXwcKt5YdX1vx2bwy7M+ecWCKjLWCPvax/aKsE5/tQRuKdFecYMZOGgOawoQ80fzeT9Uwx6m/xhh9eARuNq/JxT0BKoYX9d4XgzQvNfG4sd7RL2MfW1BzPcQ/4TsXm2UyuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756387693; c=relaxed/simple;
	bh=nq3Lai/jaQTyUZha5JbNwf76KIn3nNfbS+rFrIVQfic=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CxUug+f7tGTP8Lj4osC2ah5pUresbvTGxBDy/4mBIW3qrEEU+U0bmKGEUIQRrqH2uBh4IvE/8jwYBB/uopSh4Ze0uK2bb52xDvnib43N6uiKxzpHvVrjPOcCDl3jpPs+/Q3/P15xgul/ES59UJLPhV6U4seE0zVp4q9P2MfumWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NoEb23wH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+NCdFvZn; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NoEb23wH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+NCdFvZn; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NoEb23wH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+NCdFvZn";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NoEb23wH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+NCdFvZn"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4932320BE9;
	Thu, 28 Aug 2025 13:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756387689; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=yCghZY3WSBHmQad2JAL4Ef+AgXSqjQEKJ/o3pglzpA4=;
	b=NoEb23wHBuV5Y5nxJIBKyGvmehnB0Bu2oPQnAExcX2Y6fWwfGfE1293Zcfpu3lFSoD+opH
	WB0C08Hs8vAwCh5Df3KUBE/oXFPRqZtR3yL8G2XA4ZLLAxiICAk4fBbnZ3G3WxQNYuocDg
	XYxcw/95aaZ83/x4Ygg/PBnVwT2xkds=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756387689;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=yCghZY3WSBHmQad2JAL4Ef+AgXSqjQEKJ/o3pglzpA4=;
	b=+NCdFvZnfraMr3S1SLm4xX32iw7dlvcVa+5pOmBhVhy2Pw+0XrtHf7bM2KceS2dBqWdsXb
	PTica1ehm8WN0yCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756387689; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=yCghZY3WSBHmQad2JAL4Ef+AgXSqjQEKJ/o3pglzpA4=;
	b=NoEb23wHBuV5Y5nxJIBKyGvmehnB0Bu2oPQnAExcX2Y6fWwfGfE1293Zcfpu3lFSoD+opH
	WB0C08Hs8vAwCh5Df3KUBE/oXFPRqZtR3yL8G2XA4ZLLAxiICAk4fBbnZ3G3WxQNYuocDg
	XYxcw/95aaZ83/x4Ygg/PBnVwT2xkds=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756387689;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=yCghZY3WSBHmQad2JAL4Ef+AgXSqjQEKJ/o3pglzpA4=;
	b=+NCdFvZnfraMr3S1SLm4xX32iw7dlvcVa+5pOmBhVhy2Pw+0XrtHf7bM2KceS2dBqWdsXb
	PTica1ehm8WN0yCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1953D13326;
	Thu, 28 Aug 2025 13:28:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 7Bn1BGlZsGgmDgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 28 Aug 2025 13:28:09 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Clemens Ladisch <clemens@ladisch.de>
Subject: [PATCH v2 00/19] ALSA: firewire: Use auto-cleanup macros
Date: Thu, 28 Aug 2025 15:27:04 +0200
Message-ID: <20250828132802.9032-1-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80

This is another patch set for cleaning up the code with the recent
auto-cleanup macros like guard() & co, applied to FireWire sound
drivers.

Only code refactoring, and no behavior changes intended.


Takashi

v1->v2:
* Fix missing subject prefix for digi00x
* Drop superfluous blank lines in scoped_work blocks

===

Takashi Iwai (19):
  ALSA: firewire: bebob: Use guard() for mutex locks
  ALSA: firewire: dice: Use guard() for mutex locks
  ALSA: firewire: digi00x: Use guard() for mutex locks
  ALSA: firewire: fireworks: Use guard() for mutex locks
  ALSA: firewire: motu: Use guard() for mutex locks
  ALSA: firewire: oxfw: Use guard() for mutex locks
  ALSA: firewire: tascam: Use guard() for mutex locks
  ALSA: firewire: fireface: Use guard() for mutex locks
  ALSA: firewire: isight: Use guard() for mutex locks
  ALSA: firewire: lib: Use guard() for mutex locks
  ALSA: firewire: bebob: Use guard() for spin locks
  ALSA: firewire: dice: Use guard() for spin locks
  ALSA: firewire: digi00x: Use guard() for spin locks
  ALSA: firewire: fireface: Use guard() for spin locks
  ALSA: firewire: fireworks: Use guard() for spin locks
  ALSA: firewire: motu: Use guard() for spin locks
  ALSA: firewire: oxfw: Use guard() for spin locks
  ALSA: firewire: tascam: Use guard() for spin locks
  ALSA: firewire: lib: Use guard() for spin locks

 sound/firewire/amdtp-stream.c                 | 28 ++----
 sound/firewire/bebob/bebob.c                  | 36 ++++---
 sound/firewire/bebob/bebob_hwdep.c            | 37 ++------
 sound/firewire/bebob/bebob_maudio.c           | 42 +++------
 sound/firewire/bebob/bebob_midi.c             | 34 +++----
 sound/firewire/bebob/bebob_pcm.c              | 68 ++++++--------
 sound/firewire/bebob/bebob_stream.c           | 21 ++---
 sound/firewire/cmp.c                          | 37 ++------
 sound/firewire/dice/dice-hwdep.c              | 37 ++------
 sound/firewire/dice/dice-midi.c               | 38 +++-----
 sound/firewire/dice/dice-pcm.c                | 91 ++++++++----------
 sound/firewire/dice/dice-stream.c             | 21 ++---
 sound/firewire/dice/dice-transaction.c        |  7 +-
 sound/firewire/dice/dice.c                    |  3 +-
 sound/firewire/digi00x/digi00x-hwdep.c        | 37 ++------
 sound/firewire/digi00x/digi00x-midi.c         | 34 +++----
 sound/firewire/digi00x/digi00x-pcm.c          | 73 ++++++--------
 sound/firewire/digi00x/digi00x-stream.c       | 21 ++---
 sound/firewire/digi00x/digi00x-transaction.c  |  8 +-
 sound/firewire/digi00x/digi00x.c              |  3 +-
 sound/firewire/fcp.c                          | 19 ++--
 sound/firewire/fireface/ff-hwdep.c            | 37 ++------
 sound/firewire/fireface/ff-midi.c             | 10 +-
 sound/firewire/fireface/ff-pcm.c              | 92 ++++++++----------
 sound/firewire/fireface/ff-stream.c           | 21 ++---
 sound/firewire/fireface/ff-transaction.c      |  4 +-
 sound/firewire/fireworks/fireworks.c          | 39 ++++----
 sound/firewire/fireworks/fireworks_command.c  | 16 ++--
 sound/firewire/fireworks/fireworks_hwdep.c    | 41 +++-----
 sound/firewire/fireworks/fireworks_midi.c     | 37 +++-----
 sound/firewire/fireworks/fireworks_pcm.c      | 65 ++++++-------
 sound/firewire/fireworks/fireworks_stream.c   | 21 ++---
 .../fireworks/fireworks_transaction.c         | 39 +++-----
 sound/firewire/isight.c                       | 20 ++--
 sound/firewire/iso-resources.c                | 66 ++++++-------
 .../motu/motu-command-dsp-message-parser.c    |  9 +-
 sound/firewire/motu/motu-hwdep.c              | 30 ++----
 sound/firewire/motu/motu-midi.c               | 38 +++-----
 sound/firewire/motu/motu-pcm.c                | 94 +++++++++----------
 .../motu/motu-register-dsp-message-parser.c   | 18 +---
 sound/firewire/motu/motu-stream.c             | 21 ++---
 sound/firewire/motu/motu-transaction.c        |  7 +-
 sound/firewire/oxfw/oxfw-hwdep.c              | 37 ++------
 sound/firewire/oxfw/oxfw-midi.c               | 62 +++++-------
 sound/firewire/oxfw/oxfw-pcm.c                | 90 ++++++++----------
 sound/firewire/oxfw/oxfw-stream.c             | 21 ++---
 sound/firewire/oxfw/oxfw.c                    |  3 +-
 sound/firewire/tascam/amdtp-tascam.c          | 15 ++-
 sound/firewire/tascam/tascam-hwdep.c          | 37 ++------
 sound/firewire/tascam/tascam-midi.c           | 10 +-
 sound/firewire/tascam/tascam-pcm.c            | 69 ++++++--------
 sound/firewire/tascam/tascam-stream.c         | 21 ++---
 sound/firewire/tascam/tascam.c                |  3 +-
 53 files changed, 657 insertions(+), 1131 deletions(-)

-- 
2.50.1

