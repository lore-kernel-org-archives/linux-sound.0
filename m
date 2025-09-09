Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F552322A15
	for <linux-sound@vger.kernel.org>; Tue,  9 Sep 2025 12:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757421818; cv=none; b=SvmdVm0G3q33J6sKHCcdL5HCGzr8gfhd3EY+N4Uqao0gcA23Ms9SYhEkRwntyBEYVYO8KybWuL2owl2vHfstdkq4d4P4cVw57ABs23FK5i9Izc8EJzTVM5hCLI/9vXy3+URs3Rd4zxGdibAXuplYV8WEbjMxbPP0VN9RrV64RtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757421818; c=relaxed/simple;
	bh=c8SAr6KGDqglqEG9MmaxEG8b96wTowGavX+453yhi3U=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=UGLV2EHcn1uggdi60m2IYacELWIUq2mn6W6FDn7ca0Vu70N909xJGiIcuJp81I0Pv06qxiNxXA4FgZ/l5eZmasE3HwqWXhihoVPB6/z4DXZ89lalAG/7gpCZyKIze+15pfBpFxLI7yCjWjo5HXgzmZw7c/MYB/4w72xygA4qTHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fN7xYHUj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kh9l/M1t; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fN7xYHUj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kh9l/M1t; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fN7xYHUj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kh9l/M1t";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fN7xYHUj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kh9l/M1t"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4A399338B6;
	Tue,  9 Sep 2025 12:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1757421814; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=/ZtjXJXiqA3qOCrNiP6Dyv0RE+pmBMWL7d7k2T+bnAo=;
	b=fN7xYHUjcexn/QMbFAjAqc6m/XzZzucXsnu0TL0PuMI3iv5UCJZ+rRy/z6FNQh6JImibKd
	cAY0QjlxGdOzdTp8Dzw5XMhbtUMbeaW4rJU1go4duH1xl4kes7q8FEqC5HapWa2JRj4Jo8
	0hPVbHjkogzbCqFJCh5gq4u86k/GukE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1757421814;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=/ZtjXJXiqA3qOCrNiP6Dyv0RE+pmBMWL7d7k2T+bnAo=;
	b=kh9l/M1tAcGZtanRd14MlhbdSlawen4Xu6S32eRasF+wcZILXKYW3DsXs3VZBJKblPz0vS
	Mk53QVln6pr1SGCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1757421814; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=/ZtjXJXiqA3qOCrNiP6Dyv0RE+pmBMWL7d7k2T+bnAo=;
	b=fN7xYHUjcexn/QMbFAjAqc6m/XzZzucXsnu0TL0PuMI3iv5UCJZ+rRy/z6FNQh6JImibKd
	cAY0QjlxGdOzdTp8Dzw5XMhbtUMbeaW4rJU1go4duH1xl4kes7q8FEqC5HapWa2JRj4Jo8
	0hPVbHjkogzbCqFJCh5gq4u86k/GukE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1757421814;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=/ZtjXJXiqA3qOCrNiP6Dyv0RE+pmBMWL7d7k2T+bnAo=;
	b=kh9l/M1tAcGZtanRd14MlhbdSlawen4Xu6S32eRasF+wcZILXKYW3DsXs3VZBJKblPz0vS
	Mk53QVln6pr1SGCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3B4901388C;
	Tue,  9 Sep 2025 12:43:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id k37qDfYgwGi6TgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 09 Sep 2025 12:43:34 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 00/14] ALSA: Use guard() for spin locks (for the rest legacy stuff)
Date: Tue,  9 Sep 2025 14:43:20 +0200
Message-ID: <20250909124331.10670-1-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid];
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

