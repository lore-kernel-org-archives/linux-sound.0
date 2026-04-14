Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19F41F8723
	for <linux-sound@vger.kernel.org>; Tue, 14 Apr 2026 13:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776172944; cv=none; b=uORuZuoU99jNGySCMdzgtW5p+BFUaxotnX5vTHKH5epLhHIWLW7KTaJXZD/I1bcg2EpvOXJn34NU79MvrXRgPW+q289y1EsAIEZoF2agodP5ot3SHdiaSMfsS6OaWBh3qGSNG7d1JKelJDxwxnYioom6ZXitvhjBDbgvVzv1K9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776172944; c=relaxed/simple;
	bh=Yrw7OeGeBZkQChJPLwFNoXRdU9QBCT9PXECCKQpaGso=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=kJE5kkK9VUITyned8Xt3RrE5UthRqd7Jz+47kUa6ugLS67PmIgqze6GCl5nnXohckHowsp5Ax8WQ4jII8/CeEWTmYHfIdg3RP9SnzvU2RggnNdyokxXiUys6U/LhEl+a6HgysD5B3o7x8+F0K+qGjoC/5HU3vcAMJo8qvrVMbbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RCguTJ2o; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eo/LK7Bw; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RCguTJ2o; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eo/LK7Bw; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RCguTJ2o";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eo/LK7Bw";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RCguTJ2o";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eo/LK7Bw"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 267536A921;
	Tue, 14 Apr 2026 13:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776172941; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=vgMRS6cUi3shFeXGGP7t8R95HfqzHbRMr7ZqFO/XiSg=;
	b=RCguTJ2onjD6p4YosHVBJdFTwBYoC94F+wCdYSmvokehYZChHhsoZwNWvN0I8BD136vbcX
	aL2pTJG/eQIahygUkLqh3JhRf6wvFcM7n5atxXTwEwA5aA8X9bQ2lAOQ2N9pwPYjkVnhjK
	gGerr5WciP6jyCeRXlOGUAvA3GytcyU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776172941;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=vgMRS6cUi3shFeXGGP7t8R95HfqzHbRMr7ZqFO/XiSg=;
	b=eo/LK7Bwb679hwCfMcf1HOwICtt27YsafXjva6SfEVDzOJsxV/TBbIgKvXvIJL1fpF+jOi
	RVFVw0YD35vm9JCQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=RCguTJ2o;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="eo/LK7Bw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776172941; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=vgMRS6cUi3shFeXGGP7t8R95HfqzHbRMr7ZqFO/XiSg=;
	b=RCguTJ2onjD6p4YosHVBJdFTwBYoC94F+wCdYSmvokehYZChHhsoZwNWvN0I8BD136vbcX
	aL2pTJG/eQIahygUkLqh3JhRf6wvFcM7n5atxXTwEwA5aA8X9bQ2lAOQ2N9pwPYjkVnhjK
	gGerr5WciP6jyCeRXlOGUAvA3GytcyU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776172941;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=vgMRS6cUi3shFeXGGP7t8R95HfqzHbRMr7ZqFO/XiSg=;
	b=eo/LK7Bwb679hwCfMcf1HOwICtt27YsafXjva6SfEVDzOJsxV/TBbIgKvXvIJL1fpF+jOi
	RVFVw0YD35vm9JCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 01E484B476;
	Tue, 14 Apr 2026 13:22:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +RTEOow/3mnbOgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 14 Apr 2026 13:22:20 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 0/4] ALSA: 6fire: More hardening and cleanups
Date: Tue, 14 Apr 2026 15:22:10 +0200
Message-ID: <20260414132218.411013-1-tiwai@suse.de>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Queue-Id: 267536A921
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 

While reviewing the recent fix patch for 6fire driver, I noticed that
the driver code needs further hardening and cleanups.  Here is the
resultant patch set doing that.


Takashi

===

Takashi Iwai (4):
  ALSA: 6fire: Cover the whole probe and disconnect calls with
    register_mutex
  ALSA: 6fire: Fix leftover global pointers after probe failures
  ALSA: 6fire: Reduce multi-level conditionals in
    usb6fire_chip_disconnect()
  ALSA: 6fire: Drop unnecessary NULL checks

 sound/usb/6fire/chip.c | 113 ++++++++++++++++++++---------------------
 1 file changed, 54 insertions(+), 59 deletions(-)

-- 
2.53.0

