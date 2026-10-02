Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4169B4E01F6
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 15:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790953670; cv=none; b=FmRDrLOuyo7p975+QnpA4he00cA95kr3wGbipif+46Tw1qKbfpKPrCNcw+PC6uynl2Y5dkR8Ho9N/RF9/WZuL3xu4Bbf4EeFuIzk7bY/MMGGN72TBJMxbDFb2jrDGPlOmk2tUYKRcvoB64Xs/YbUZ1sfIYnKtGz1ofEObG8UUzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790953670; c=relaxed/simple;
	bh=pkAqaAZsKzgYLRUeB+7zcHGjJgxEDKNWyf6QT5vyUBQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=JbpKsr6XiaOUPGANt6ObQFmp4nHwkhEIOTJfqISDk4Tfp/9EWAca+c0JOij8E+jNi3hGAAaaNCmDMoZ8Rp4lGDpDDpPPL4TsHxt20EA7dcO8IB7lvPmU7sMpG9nZ6hWahcH9jockyJpZ8wPX66eICDt/eh4fK7GI+GXRQgU6Q88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kdbZX49P; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6IIa2DAw; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YFbhQn48; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VhOx0XwY; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kdbZX49P";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6IIa2DAw";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YFbhQn48";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VhOx0XwY"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id EE9F221A0E;
	Fri,  2 Oct 2026 15:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790953662; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Nw/imnNlGWIY5aF3HUYWaICd+BChgc1xrFjkZ0cZq9U=;
	b=kdbZX49PUMPqn7Frv5kJLNYOAsnGG9xgyVXlGirl9nLc1+OiNzsK8r1wZ8lhXKhdXiAow/
	uUeZpDdNcS/QK7g/YQEl7f7Y2ggF/o1XymKrRT7UqDNNm/GoZcBcMbxXYXKapKHr3XVzCN
	mkj8JeVkunl9HfCNcEyMXdgEHf/b3YE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790953662;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Nw/imnNlGWIY5aF3HUYWaICd+BChgc1xrFjkZ0cZq9U=;
	b=6IIa2DAwhVanJSwplQaLw0wpNcq89zsj2yzLJlLUtOemyzNj35ai6wFuf7XGoBfHYuCm4p
	Ykgw6mkQtitTKECA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=YFbhQn48;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=VhOx0XwY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790953658; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Nw/imnNlGWIY5aF3HUYWaICd+BChgc1xrFjkZ0cZq9U=;
	b=YFbhQn48GsWTE6AhcP1KSExqQXzJRfgQ+jjXcHqy8oSh5aR0Q76DG0OyUwXfnNFMsDSQY2
	KB+rkFOEe/vEXU8ivWgCxG2ZSPGjaoA4nu5acun6rR3qRbrEmEmm9dD9ev/6s0+/NLQ4J4
	8bkO9D4fyYteZjODqzIHTOxIYRuPKxI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790953658;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Nw/imnNlGWIY5aF3HUYWaICd+BChgc1xrFjkZ0cZq9U=;
	b=VhOx0XwYWk6Dftx2b8gzO7dEmcKCLVEtsf9Y0HyiQT8VfrPwrdzk2sHrx5wJFuGQJozoXC
	czp6gx+RV/wWu8AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B5DC9139D1;
	Fri,  2 Oct 2026 15:07:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id bn6aIrnIv2qpZwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 02 Oct 2026 15:07:37 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 0/9] ALSA: Avoid manual calls of snd_card_free() at probe card error handling
Date: Fri,  2 Oct 2026 17:07:22 +0200
Message-ID: <20261002150733.880051-1-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: EE9F221A0E
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	URIBL_BLOCKED(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 

Hi,

this is another series of trivial cleanup patches to use the
auto-cleanup for error handling at probe in some sound drivers.

Merely a code cleanup, and no functional changes intended.


Takashi

===

Takashi Iwai (9):
  ALSA: als300: Avoid manual calls of snd_card_free() at probe card
    error handling
  ALSA: aw2: Avoid manual calls of snd_card_free() at probe card error
    handling
  ALSA: cmipci: Avoid manual calls of snd_card_free() at probe card
    error handling
  ALSA: cs46xx: Avoid manual calls of snd_card_free() at probe card
    error handling
  ALSA: korg1212: Avoid manual calls of snd_card_free() at probe card
    error handling
  ALSA: lx6464es: Avoid manual calls of snd_card_free() at probe card
    error handling
  ALSA: hdsp: Avoid manual calls of snd_card_free() at probe card error
    handling
  ALSA: hdspm: Avoid manual calls of snd_card_free() at probe card error
    handling
  ALSA: rme9652: Avoid manual calls of snd_card_free() at probe card
    error handling

 sound/pci/als300.c            | 11 ++++-------
 sound/pci/aw2/aw2-alsa.c      | 11 ++++-------
 sound/pci/cmipci.c            | 11 ++++-------
 sound/pci/cs46xx/cs46xx.c     | 25 +++++++++++--------------
 sound/pci/korg1212/korg1212.c | 11 ++++-------
 sound/pci/lx6464es/lx6464es.c | 11 ++++-------
 sound/pci/rme9652/hdsp.c      | 11 ++++-------
 sound/pci/rme9652/hdspm.c     | 12 ++++--------
 sound/pci/rme9652/rme9652.c   | 11 ++++-------
 9 files changed, 43 insertions(+), 71 deletions(-)

-- 
2.55.0

