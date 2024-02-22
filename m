Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9930405D4
	for <linux-sound@vger.kernel.org>; Thu, 22 Feb 2024 11:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708600519; cv=none; b=FSjhNwPLBcCbV6xbYI9Juj/8EUWzfkisWU796NDAoNXyfx8d/YMoJDYyC0fOot+SX018ZyJX0MOmiP6gFfMZrFOETFpJMOZJXPTNiGYTdag2QxvK4XDg8LleLNgGXzXFQW91fvlKrEsqzko3mQB0kM/U0QIX5nD8l/8hKFONN9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708600519; c=relaxed/simple;
	bh=A3P2uZS5hmUa2AdTY3ZNu56j3pmHpRoP25Jubpt2C10=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=V/VXACLsSmk/2Bbb3A3NcvZHy1y4dbVDdjCuKyWDDM9gir6/wIZwPIIItsdo60F3+hqCC9KoZdwZh/E/tHS3DTiU2e7FAT6nDU/p86ppD9OOLEEk23afGzTL408p6+W6WGgPSiMcTs29VCykXgX6LrnhJxQjLRgRwMe3wkH0HoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EXoQg5JU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=a+bbZ+nz; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EXoQg5JU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=a+bbZ+nz; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EXoQg5JU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="a+bbZ+nz";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EXoQg5JU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="a+bbZ+nz"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 14E2622352;
	Thu, 22 Feb 2024 11:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708600516; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e52XIjKziT17rvBGWssfA87es6z4phqkxFBGmSv1WJ0=;
	b=EXoQg5JUCEuKLDdnEyGrgFEyIEU+t1pCP9TjnyQJxiGmjk8i/8PtYpwxrG4fYM9ItBlaBk
	ShxI2e9RhlRiR9rT15SBhWnY2rnEgjVdQFPklGLR2rDJg+3uyKjja4ixzWNoHaC//YiO1+
	fHqbm4wYozYVr9R4zpbrHuGyC2suUEE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708600516;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e52XIjKziT17rvBGWssfA87es6z4phqkxFBGmSv1WJ0=;
	b=a+bbZ+nze/4hKiHi0oZdh/MRmItdU2dp23c7HdOEew3qX3ezimfOVHLKnli1+k3klwUGaR
	S//mJP0aW7elY+BA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708600516; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e52XIjKziT17rvBGWssfA87es6z4phqkxFBGmSv1WJ0=;
	b=EXoQg5JUCEuKLDdnEyGrgFEyIEU+t1pCP9TjnyQJxiGmjk8i/8PtYpwxrG4fYM9ItBlaBk
	ShxI2e9RhlRiR9rT15SBhWnY2rnEgjVdQFPklGLR2rDJg+3uyKjja4ixzWNoHaC//YiO1+
	fHqbm4wYozYVr9R4zpbrHuGyC2suUEE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708600516;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e52XIjKziT17rvBGWssfA87es6z4phqkxFBGmSv1WJ0=;
	b=a+bbZ+nze/4hKiHi0oZdh/MRmItdU2dp23c7HdOEew3qX3ezimfOVHLKnli1+k3klwUGaR
	S//mJP0aW7elY+BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F06CB13ADA;
	Thu, 22 Feb 2024 11:15:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id EJ+KOcMs12UFGgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 22 Feb 2024 11:15:15 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 6/9] ALSA: seq: oss: Use automatic cleanup of kfree()
Date: Thu, 22 Feb 2024 12:15:06 +0100
Message-Id: <20240222111509.28390-7-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240222111509.28390-1-tiwai@suse.de>
References: <20240222111509.28390-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: ***
X-Spamd-Bar: +++
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=EXoQg5JU;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=a+bbZ+nz
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [3.49 / 50.00];
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
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Score: 3.49
X-Rspamd-Queue-Id: 14E2622352
X-Spam-Flag: NO

There are common patterns where a temporary buffer is allocated and
freed at the exit, and those can be simplified with the recent cleanup
mechanism via __free(kfree).

No functional changes, only code refactoring.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/oss/seq_oss_init.c | 15 +++++----------
 sound/core/seq/oss/seq_oss_midi.c | 11 +++--------
 2 files changed, 8 insertions(+), 18 deletions(-)

diff --git a/sound/core/seq/oss/seq_oss_init.c b/sound/core/seq/oss/seq_oss_init.c
index 76bf41c26acd..676246fa02f1 100644
--- a/sound/core/seq/oss/seq_oss_init.c
+++ b/sound/core/seq/oss/seq_oss_init.c
@@ -63,20 +63,18 @@ int __init
 snd_seq_oss_create_client(void)
 {
 	int rc;
-	struct snd_seq_port_info *port;
+	struct snd_seq_port_info *port __free(kfree) = NULL;
 	struct snd_seq_port_callback port_callback;
 
 	port = kzalloc(sizeof(*port), GFP_KERNEL);
-	if (!port) {
-		rc = -ENOMEM;
-		goto __error;
-	}
+	if (!port)
+		return -ENOMEM;
 
 	/* create ALSA client */
 	rc = snd_seq_create_kernel_client(NULL, SNDRV_SEQ_CLIENT_OSS,
 					  "OSS sequencer");
 	if (rc < 0)
-		goto __error;
+		return rc;
 
 	system_client = rc;
 
@@ -104,14 +102,11 @@ snd_seq_oss_create_client(void)
 		subs.dest.port = system_port;
 		call_ctl(SNDRV_SEQ_IOCTL_SUBSCRIBE_PORT, &subs);
 	}
-	rc = 0;
 
 	/* look up midi devices */
 	schedule_work(&async_lookup_work);
 
- __error:
-	kfree(port);
-	return rc;
+	return 0;
 }
 
 
diff --git a/sound/core/seq/oss/seq_oss_midi.c b/sound/core/seq/oss/seq_oss_midi.c
index f2940b29595f..f8e247d9e5c9 100644
--- a/sound/core/seq/oss/seq_oss_midi.c
+++ b/sound/core/seq/oss/seq_oss_midi.c
@@ -64,16 +64,13 @@ static int send_midi_event(struct seq_oss_devinfo *dp, struct snd_seq_event *ev,
 int
 snd_seq_oss_midi_lookup_ports(int client)
 {
-	struct snd_seq_client_info *clinfo;
-	struct snd_seq_port_info *pinfo;
+	struct snd_seq_client_info *clinfo __free(kfree) = NULL;
+	struct snd_seq_port_info *pinfo __free(kfree) = NULL;
 
 	clinfo = kzalloc(sizeof(*clinfo), GFP_KERNEL);
 	pinfo = kzalloc(sizeof(*pinfo), GFP_KERNEL);
-	if (! clinfo || ! pinfo) {
-		kfree(clinfo);
-		kfree(pinfo);
+	if (!clinfo || !pinfo)
 		return -ENOMEM;
-	}
 	clinfo->client = -1;
 	while (snd_seq_kernel_client_ctl(client, SNDRV_SEQ_IOCTL_QUERY_NEXT_CLIENT, clinfo) == 0) {
 		if (clinfo->client == client)
@@ -83,8 +80,6 @@ snd_seq_oss_midi_lookup_ports(int client)
 		while (snd_seq_kernel_client_ctl(client, SNDRV_SEQ_IOCTL_QUERY_NEXT_PORT, pinfo) == 0)
 			snd_seq_oss_midi_check_new_port(pinfo);
 	}
-	kfree(clinfo);
-	kfree(pinfo);
 	return 0;
 }
 
-- 
2.35.3

