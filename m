Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1383D6688
	for <linux-sound@vger.kernel.org>; Tue, 31 Mar 2026 08:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774944752; cv=none; b=RbV9amyKpmIDDJe9y1JLW2c2n9VVSmACn6UkdEtrnt3Y/qJnYGWDt7tJncwDGP37B8zrS4nyXHp4n4CdtVvapJsW+IFrNr0j9Y4GEZU8LrW8GnS9SJ+sOsNSmtRGQuWIsyKUQFErUMh2UYL3m6oQrUuFd8i1BihRy97n3MQ7Tvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774944752; c=relaxed/simple;
	bh=KvlPt8TMuPNekjKTi7dQXjqjOQpAe0Wulyt0CeZh/sM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y/qmJ5T2mPqFcCd+5KPBjSEhuw4gCUxgkaY8mZShtsB68PZbtRUCW8u1w+Y+VfASLf+S27/ffdi5IkrjxKJlsV3bIBgq3HIlboZHODR4zG1NYAuhJkK0OWS4FucpRCJlJORKF6pHPMtvjnR4FzhzIQ9Py00fdt8kngJENPT6A+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wJMSxpSN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tgViy+qM; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wJMSxpSN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tgViy+qM; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wJMSxpSN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tgViy+qM";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wJMSxpSN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tgViy+qM"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 639F94D557;
	Tue, 31 Mar 2026 08:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774944749; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Kv9B1NMVijYaziYZJp+YumWoDJQVYZbsWOM6A1XrS+A=;
	b=wJMSxpSNkpnoHOUBQCQ3bPjSLiPRs3NNUvcyXMgfIuL3GZirlI6TmjFjebuXtmQxpYcNSP
	sCazIYhgtgMbG3nIc8vG4WZ0SqqsDkrFbkEcfXkKkZp6bjigZzoLacek7Pc6+y+SwHCoEE
	WdWK7Lq3nbBO1TaRVTPLmG+HdsDAge4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774944749;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Kv9B1NMVijYaziYZJp+YumWoDJQVYZbsWOM6A1XrS+A=;
	b=tgViy+qMTCv31krQMQJz2pIeiWPoQtkpbIndfJFi495dQWLB9xLnE+hF/ZAhHPuunai564
	Y8HlHqYDe9nF3xDg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=wJMSxpSN;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=tgViy+qM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774944749; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Kv9B1NMVijYaziYZJp+YumWoDJQVYZbsWOM6A1XrS+A=;
	b=wJMSxpSNkpnoHOUBQCQ3bPjSLiPRs3NNUvcyXMgfIuL3GZirlI6TmjFjebuXtmQxpYcNSP
	sCazIYhgtgMbG3nIc8vG4WZ0SqqsDkrFbkEcfXkKkZp6bjigZzoLacek7Pc6+y+SwHCoEE
	WdWK7Lq3nbBO1TaRVTPLmG+HdsDAge4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774944749;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Kv9B1NMVijYaziYZJp+YumWoDJQVYZbsWOM6A1XrS+A=;
	b=tgViy+qMTCv31krQMQJz2pIeiWPoQtkpbIndfJFi495dQWLB9xLnE+hF/ZAhHPuunai564
	Y8HlHqYDe9nF3xDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 436CA4A0A2;
	Tue, 31 Mar 2026 08:12:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Yco6D+2By2mKBwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 31 Mar 2026 08:12:29 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Harin Lee <me@harin.net>
Subject: [PATCH] ALSA: ctxfi: Don't enumerate SPDIF1 at DAIO initialization
Date: Tue, 31 Mar 2026 10:12:17 +0200
Message-ID: <20260331081227.216134-1-tiwai@suse.de>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.com:url,suse.de:mid,suse.de:dkim,suse.de:email];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 639F94D557

The recent refactoring of xfi driver changed the assignment of
atc->daios[] at atc_get_resources(); now it loops over all enum
DAIOTYP entries while it looped formerly only a part of them.
The problem is that the last entry, SPDIF1, is a special type that
is used only for hw20k1 CTSB073X model (as a replacement of SPDIFIO),
and there is no corresponding definition for hw20k2.  Due to the lack
of the info, it caused a kernel crash on hw20k2, which was already
worked around by the commit b045ab3dff97 ("ALSA: ctxfi: Fix missing
SPDIFI1 index handling").

This patch addresses the root cause of the regression above properly,
simply by skipping the incorrect SPDIF1 type in the parser loop.

For making the change clearer, the code is slightly arranged, too.

Fixes: a2dbaeb5c61e ("ALSA: ctxfi: Refactor resource alloc for sparse mappings")
Cc: <stable@vger.kernel.org>
Link: https://bugzilla.suse.com/show_bug.cgi?id=1259925
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/ctxfi/ctatc.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/sound/pci/ctxfi/ctatc.c b/sound/pci/ctxfi/ctatc.c
index f122e396bc55..da2667cb2489 100644
--- a/sound/pci/ctxfi/ctatc.c
+++ b/sound/pci/ctxfi/ctatc.c
@@ -1427,10 +1427,14 @@ static int atc_get_resources(struct ct_atc *atc)
 	daio_mgr = (struct daio_mgr *)atc->rsc_mgrs[DAIO];
 	da_desc.msr = atc->msr;
 	for (i = 0; i < NUM_DAIOTYP; i++) {
-		if (((i == MIC) && !cap.dedicated_mic) || ((i == RCA) && !cap.dedicated_rca))
+		if (((i == MIC) && !cap.dedicated_mic) ||
+		    ((i == RCA) && !cap.dedicated_rca) ||
+		    i == SPDIFI1)
 			continue;
-		da_desc.type = (atc->model != CTSB073X) ? i :
-			     ((i == SPDIFIO) ? SPDIFI1 : i);
+		if (atc->model == CTSB073X && i == SPDIFIO)
+			da_desc.type = SPDIFI1;
+		else
+			da_desc.type = i;
 		da_desc.output = (i < LINEIM) || (i == RCA);
 		err = daio_mgr->get_daio(daio_mgr, &da_desc,
 					(struct daio **)&atc->daios[i]);
-- 
2.53.0

