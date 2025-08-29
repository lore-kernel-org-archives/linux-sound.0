Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9753218B5
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 15:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756479634; cv=none; b=FJeBvGPiORwycEbhCWsQxHzmNaUrhmdMhOTz1k+CYsCEagpvn5cGI+IaxQqXGwc7iYKJjhxcK48ef8B8z6a86eLd9yxgKEutEcKd0Od2Buv0kiE3iZ4VuoqKBzh4w7kTBmEBXMzDy6qtqZbmaXPTzOHHdruvC7d9ZQ4W36WfTfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756479634; c=relaxed/simple;
	bh=TTFaU7J1phBMM7FjbXdf7i3iYCwSiB3JYR9YG7PHTvw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=HyMiKYeA6veypXnbcbqIUopJwoK0705XbZAsoE4IOyJDPPhjozjodC9cIqPK0cQ0nVuMZxGFlEM7XmqMTrKMvFdo/K/4f7UAFiN0gozLhbvKpilWyhQHfJKLTxZmoBqj4j6FyKzk29H7Vy3HJ0dAOqzHErgK6VebainLHYxQeFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tNz158St; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=C+TwoBKD; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tNz158St; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=C+TwoBKD; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tNz158St";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="C+TwoBKD";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tNz158St";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="C+TwoBKD"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5AFCA2077C;
	Fri, 29 Aug 2025 15:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756479631; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=wZpJ2spnT8YWeeHG3uxT9rAyG3aKGeDf4FLrVfRY1qE=;
	b=tNz158StO4fSKaKj5EsvRyTgu8l6B1rzRtzPIkz8JPrNMjvLhzKjnaQ0M3wKYxxD3CTjEM
	JvLtdpEaNI2+YGi/l50rpeS27sV85gQI9rXwr4TI8OfcAm3ZU+1vmGKHcaSw0dhGWWIZ2/
	zeSmNLYtIG5+j5XJgZaaCVfXylmBDQk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756479631;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=wZpJ2spnT8YWeeHG3uxT9rAyG3aKGeDf4FLrVfRY1qE=;
	b=C+TwoBKD1BAySrbmNZSDGyaWw/ptIBRKInrnxwPKSUarlaRdcazn1WQ73Wwivs/Bb+2OlL
	BDfL4CEuLXfPKxCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756479631; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=wZpJ2spnT8YWeeHG3uxT9rAyG3aKGeDf4FLrVfRY1qE=;
	b=tNz158StO4fSKaKj5EsvRyTgu8l6B1rzRtzPIkz8JPrNMjvLhzKjnaQ0M3wKYxxD3CTjEM
	JvLtdpEaNI2+YGi/l50rpeS27sV85gQI9rXwr4TI8OfcAm3ZU+1vmGKHcaSw0dhGWWIZ2/
	zeSmNLYtIG5+j5XJgZaaCVfXylmBDQk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756479631;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=wZpJ2spnT8YWeeHG3uxT9rAyG3aKGeDf4FLrVfRY1qE=;
	b=C+TwoBKD1BAySrbmNZSDGyaWw/ptIBRKInrnxwPKSUarlaRdcazn1WQ73Wwivs/Bb+2OlL
	BDfL4CEuLXfPKxCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4000C13326;
	Fri, 29 Aug 2025 15:00:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id xDRZDo/AsWjjHQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 15:00:31 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 00/13] ALSA: Use auto-cleanup macros for generic drivers
Date: Fri, 29 Aug 2025 17:00:11 +0200
Message-ID: <20250829150026.6379-1-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80

This is yet another patch set for applying the auto-cleanup macros to
sound/drivers/* code.  Merely code refactoring, and no functional
changes expected.


Takashi

===

Takashi Iwai (13):
  ALSA: aloop: Use guard() for mutex locks
  ALSA: aloop: Use guard() for spin locks
  ALSA: opl3: Use guard() for mutex locks
  ALSA: opl3: Use guard() for spin locks
  ALSA: opl4: Use guard() for mutex locks
  ALSA: opl4: Use guard() for spin locks
  ALSA: vx: Use guard() for mutex locks
  ALSA: dummy: Use guard() for spin locks
  ALSA: mpu401: Use guard() for spin locks
  ALSA: mtpav: Use guard() for spin locks
  ALSA: mts64: Use guard() for spin locks
  ALSA: portman2x4: Use guard() for spin locks
  ALSA: serial-u16550: Use guard() for spin locks

 sound/drivers/aloop.c              | 276 ++++++++++++++---------------
 sound/drivers/dummy.c              |  40 ++---
 sound/drivers/mpu401/mpu401_uart.c |  41 ++---
 sound/drivers/mtpav.c              |  59 +++---
 sound/drivers/mts64.c              |  57 ++----
 sound/drivers/opl3/opl3_lib.c      |  26 +--
 sound/drivers/opl3/opl3_midi.c     |  51 ++----
 sound/drivers/opl3/opl3_seq.c      |  27 ++-
 sound/drivers/opl4/opl4_lib.c      |  10 +-
 sound/drivers/opl4/opl4_mixer.c    |   8 +-
 sound/drivers/opl4/opl4_proc.c     |  10 +-
 sound/drivers/opl4/opl4_seq.c      |  28 ++-
 sound/drivers/opl4/opl4_synth.c    |  81 ++++-----
 sound/drivers/portman2x4.c         |  12 +-
 sound/drivers/serial-u16550.c      |  48 ++---
 sound/drivers/vx/vx_core.c         |  19 +-
 sound/drivers/vx/vx_mixer.c        |  57 ++----
 sound/drivers/vx/vx_pcm.c          |   3 +-
 sound/drivers/vx/vx_uer.c          |  17 +-
 19 files changed, 331 insertions(+), 539 deletions(-)

-- 
2.50.1

