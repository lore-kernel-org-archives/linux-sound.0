Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B1D31B110
	for <linux-sound@vger.kernel.org>; Wed, 10 Sep 2025 11:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757502610; cv=none; b=Lh9OlWGSle2Q3ZsJDGaDPWpyzxIcRh0yLiIcm2P2R0fUcW119z6myP3wnLKOrVFWLzuKkv8oIXWVAfJrAkdCK/7EILGH2WtncudPZ+VmK2YIwI1d5W61s/4ZWeTFtSscuI/kDbRqhYal2K/vnh8vStO3iR11u1Ug2n+e5FaOj4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757502610; c=relaxed/simple;
	bh=ZLJ2Qjz3lREOmaa9tPU1Bj57fJ+klwyQl1PHDv+wfFQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=ZHk9MqpogJ/QFQjUPuw8RgVCydkQcxROZdJt5HDCorBfodEKeX8ft2RnSkPaaADLmSlseGFj81rDgb7x+oZRI06ICwrTlS5M3UTJVRzDiv9/xWPflBT5tgD+WyGmVOcWhwo3KSAbUXsmX+AOhMq/TAM2xttePyrGbLFOV47VXbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Gdzhfth2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=K07h8JuS; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Gdzhfth2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=K07h8JuS; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Gdzhfth2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="K07h8JuS";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Gdzhfth2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="K07h8JuS"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C1F7734B80;
	Wed, 10 Sep 2025 11:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1757502584; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=xBvAPmGPWqWj3pQdUtFEgGctjp9osDli83op/anFsmY=;
	b=Gdzhfth2heyQvtIiLm16wVlBDxBOemHh5vHQNhT2QVl2CTZrJ/0TWZTOQnA2E+qcXGhlsb
	PDRY/eCQxsfct2g5G+9LBJ6DNHOizGdDGrx4ucnEFxC60v8Jjo+KT9JSXeGVKe1ERUKz3O
	5dYX4j5gXOr37ox99PsrUsRZYTXAC9U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1757502584;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=xBvAPmGPWqWj3pQdUtFEgGctjp9osDli83op/anFsmY=;
	b=K07h8JuSZ3IuzHpgfPvxfxJTKMQUg6O6btVc6z/6I+t/ko4vPUn436cd8pRoDhaZTu2Uit
	XNR/DXQfK9F8EoAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1757502584; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=xBvAPmGPWqWj3pQdUtFEgGctjp9osDli83op/anFsmY=;
	b=Gdzhfth2heyQvtIiLm16wVlBDxBOemHh5vHQNhT2QVl2CTZrJ/0TWZTOQnA2E+qcXGhlsb
	PDRY/eCQxsfct2g5G+9LBJ6DNHOizGdDGrx4ucnEFxC60v8Jjo+KT9JSXeGVKe1ERUKz3O
	5dYX4j5gXOr37ox99PsrUsRZYTXAC9U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1757502584;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=xBvAPmGPWqWj3pQdUtFEgGctjp9osDli83op/anFsmY=;
	b=K07h8JuSZ3IuzHpgfPvxfxJTKMQUg6O6btVc6z/6I+t/ko4vPUn436cd8pRoDhaZTu2Uit
	XNR/DXQfK9F8EoAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A82F113301;
	Wed, 10 Sep 2025 11:09:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QhvQJ3hcwWi+YAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 10 Sep 2025 11:09:44 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH RESEND 00/14] ALSA: Use guard() for spin locks (for the rest legacy stuff)
Date: Wed, 10 Sep 2025 13:09:15 +0200
Message-ID: <20250910110932.15234-1-tiwai@suse.de>
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
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80

[ Resending the whole series since the half of patches didn't go out
  by some mistake, sorry for inconvenience! ]

Hi,

this is a gleaning work, the cleanup of manual spin locks with guard()
for the remaining legacy ALSA drivers.
It also has an additional code style fix for aoa driver, too.

All are about code cleanups, and three should be no functional
changes.


Takashi

===

Takashi Iwai (14):
  ALSA: aoa: Use guard() for spin locks
  ALSA: aoa: Don't split string across lines
  ALSA: arm: Use guard() for spin locks
  ALSA: sgio2audio: Use guard() for spin locks
  ALSA: snd-n64: Use guard() for spin locks
  ALSA: parisc: Use guard() for spin locks
  ALSA: snd_ps3: Use guard() for spin locks
  ALSA: ppc: Use guard() for spin locks
  ALSA: line6: Use guard() for spin locks
  ALSA: usb: fcp: Use guard() for spin locks
  ALSA: usb-audio: Use guard() for spin locks
  ALSA: sparc/amd7930: Use guard() for spin locks
  ALSA: sparc/cs4231: Use guard() for spin locks
  ALSA: sparc/dbri: Use guard() for spin locks

 sound/aoa/soundbus/i2sbus/core.c |   4 +-
 sound/aoa/soundbus/i2sbus/pcm.c  | 130 ++++++++----------
 sound/arm/aaci.c                 | 148 +++++++++-----------
 sound/mips/sgio2audio.c          |  20 +--
 sound/mips/snd-n64.c             |  17 +--
 sound/parisc/harmony.c           |  99 ++++++--------
 sound/ppc/awacs.c                |  24 +---
 sound/ppc/beep.c                 |  17 +--
 sound/ppc/burgundy.c             |  10 +-
 sound/ppc/pmac.c                 |  88 ++++++------
 sound/ppc/snd_ps3.c              |  21 +--
 sound/sparc/amd7930.c            | 110 ++++++---------
 sound/sparc/cs4231.c             | 204 +++++++++------------------
 sound/sparc/dbri.c               | 228 +++++++++++++++----------------
 sound/usb/fcp.c                  |  17 +--
 sound/usb/line6/capture.c        |   6 +-
 sound/usb/line6/driver.c         |  29 ++--
 sound/usb/line6/midi.c           |  10 +-
 sound/usb/line6/pcm.c            |  27 ++--
 sound/usb/pcm.c                  | 206 ++++++++++++++--------------
 20 files changed, 592 insertions(+), 823 deletions(-)

-- 
2.50.1

