Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED122276027
	for <linux-sound@vger.kernel.org>; Wed, 27 Aug 2025 09:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756286427; cv=none; b=jXeRp0XfHn/V8oreUFepgoS/h5JrdYi5xqbYCEcu75VyVqmcTNRMZleb3zj4ZwD2BeFNnKqBWi/+b6MnvgP3jhzfGKtpAn60japwK1pIdWZGFTUbsgh3fAv9bgO4qRgYkamnmXfDTjxImwZCieT1IR6qHek+g5cQI0laUCOvGe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756286427; c=relaxed/simple;
	bh=OErfP0Sysy33ccCJVhLkVq3oRZrwjTNn/il0226oj5o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D0JqsY6Ndkdxw+AtdXgQ3FCEgtSTN45pCWD3HLoP0thIvkokjjIpyT5zNtezbg7yu23AvwGVb1Yh71TW/v1KMufOs9Dd6yLN1tqQitwJpr/vRlM632e98P6Z2lZG9tE2haYRF2DyWWcnXQwgO2ouabSBydiJBw6kAKLYowW/HEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dxZX8zgu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pl39//z5; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dxZX8zgu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pl39//z5; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dxZX8zgu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pl39//z5";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dxZX8zgu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pl39//z5"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 277F61FFBD;
	Wed, 27 Aug 2025 09:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756286424; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=7LeLG/r/zJm4HlbqM4cXTf74PqM3lrxABV2PvxQ1nBM=;
	b=dxZX8zgujVpnol6dGxQF8Jcdx9cuBZ20U3QvKpXvfb+JA7/07UIlZl20igIOXJYS6QhVKJ
	0yD6lmqt5Bm5huec4kqq9RhxZDLbRVlPFVJgWXSI5BXuDbDJt1CbDCidkN7m4vp2t8bM16
	quvGG9lhcvU2fypqDHXhIVPe9Iu8f4o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756286424;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=7LeLG/r/zJm4HlbqM4cXTf74PqM3lrxABV2PvxQ1nBM=;
	b=pl39//z5kZABQO67fxtvGm8/8lJoNT2GOcdSr421DsNq9kREGAmYJZOyuJqrUVvun32aLg
	jN7D+3aQTIAwlmBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=dxZX8zgu;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="pl39//z5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756286424; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=7LeLG/r/zJm4HlbqM4cXTf74PqM3lrxABV2PvxQ1nBM=;
	b=dxZX8zgujVpnol6dGxQF8Jcdx9cuBZ20U3QvKpXvfb+JA7/07UIlZl20igIOXJYS6QhVKJ
	0yD6lmqt5Bm5huec4kqq9RhxZDLbRVlPFVJgWXSI5BXuDbDJt1CbDCidkN7m4vp2t8bM16
	quvGG9lhcvU2fypqDHXhIVPe9Iu8f4o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756286424;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=7LeLG/r/zJm4HlbqM4cXTf74PqM3lrxABV2PvxQ1nBM=;
	b=pl39//z5kZABQO67fxtvGm8/8lJoNT2GOcdSr421DsNq9kREGAmYJZOyuJqrUVvun32aLg
	jN7D+3aQTIAwlmBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 15C9D13867;
	Wed, 27 Aug 2025 09:20:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id eWfQBNjNrmiFEgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 27 Aug 2025 09:20:24 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Clemens Ladisch <clemens@ladisch.de>
Subject: [PATCH 00/19] ALSA: firewire: Use auto-cleanup macros
Date: Wed, 27 Aug 2025 11:19:54 +0200
Message-ID: <20250827092017.29014-1-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 277F61FFBD
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

This is another patch set for cleaning up the code with the recent
auto-cleanup macros like guard() & co, applied to FireWire sound
drivers.

Only code refactoring, and no behavior changes intended.


Takashi

===

Takashi Iwai (19):
  ALSA: firewire: bebob: Use guard() for mutex locks
  ALSA: firewire: dice: Use guard() for mutex locks
  ALSA: firewire: Use guard() for mutex locks
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
 sound/firewire/bebob/bebob_pcm.c              | 67 ++++++-------
 sound/firewire/bebob/bebob_stream.c           | 21 ++---
 sound/firewire/cmp.c                          | 37 ++------
 sound/firewire/dice/dice-hwdep.c              | 37 ++------
 sound/firewire/dice/dice-midi.c               | 38 +++-----
 sound/firewire/dice/dice-pcm.c                | 90 ++++++++----------
 sound/firewire/dice/dice-stream.c             | 21 ++---
 sound/firewire/dice/dice-transaction.c        |  7 +-
 sound/firewire/dice/dice.c                    |  3 +-
 sound/firewire/digi00x/digi00x-hwdep.c        | 37 ++------
 sound/firewire/digi00x/digi00x-midi.c         | 34 +++----
 sound/firewire/digi00x/digi00x-pcm.c          | 72 ++++++--------
 sound/firewire/digi00x/digi00x-stream.c       | 21 ++---
 sound/firewire/digi00x/digi00x-transaction.c  |  8 +-
 sound/firewire/digi00x/digi00x.c              |  3 +-
 sound/firewire/fcp.c                          | 19 ++--
 sound/firewire/fireface/ff-hwdep.c            | 37 ++------
 sound/firewire/fireface/ff-midi.c             | 10 +-
 sound/firewire/fireface/ff-pcm.c              | 91 ++++++++----------
 sound/firewire/fireface/ff-stream.c           | 21 ++---
 sound/firewire/fireface/ff-transaction.c      |  4 +-
 sound/firewire/fireworks/fireworks.c          | 39 ++++----
 sound/firewire/fireworks/fireworks_command.c  | 16 ++--
 sound/firewire/fireworks/fireworks_hwdep.c    | 41 +++-----
 sound/firewire/fireworks/fireworks_midi.c     | 37 +++-----
 sound/firewire/fireworks/fireworks_pcm.c      | 64 ++++++-------
 sound/firewire/fireworks/fireworks_stream.c   | 21 ++---
 .../fireworks/fireworks_transaction.c         | 39 +++-----
 sound/firewire/isight.c                       | 20 ++--
 sound/firewire/iso-resources.c                | 66 ++++++-------
 .../motu/motu-command-dsp-message-parser.c    |  9 +-
 sound/firewire/motu/motu-hwdep.c              | 30 ++----
 sound/firewire/motu/motu-midi.c               | 38 +++-----
 sound/firewire/motu/motu-pcm.c                | 93 +++++++++----------
 .../motu/motu-register-dsp-message-parser.c   | 18 +---
 sound/firewire/motu/motu-stream.c             | 21 ++---
 sound/firewire/motu/motu-transaction.c        |  7 +-
 sound/firewire/oxfw/oxfw-hwdep.c              | 37 ++------
 sound/firewire/oxfw/oxfw-midi.c               | 62 +++++--------
 sound/firewire/oxfw/oxfw-pcm.c                | 89 ++++++++----------
 sound/firewire/oxfw/oxfw-stream.c             | 21 ++---
 sound/firewire/oxfw/oxfw.c                    |  3 +-
 sound/firewire/tascam/amdtp-tascam.c          | 15 ++-
 sound/firewire/tascam/tascam-hwdep.c          | 37 ++------
 sound/firewire/tascam/tascam-midi.c           | 10 +-
 sound/firewire/tascam/tascam-pcm.c            | 68 ++++++--------
 sound/firewire/tascam/tascam-stream.c         | 21 ++---
 sound/firewire/tascam/tascam.c                |  3 +-
 53 files changed, 657 insertions(+), 1123 deletions(-)

-- 
2.50.1

