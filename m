Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D819914037B
	for <linux-sound@vger.kernel.org>; Fri, 23 Feb 2024 17:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708710621; cv=none; b=f7aLvzyzIn7VqRIz6ZE6nnRsrG7rUwlar324T+ZkyzddMGoHbdVyA/QdEFMsa18ufi+IPST1YoJZCuyaMJI6tjHxZOMIKEDKrIfJ0ifXi0wsYxzhjtgSqsC08kmsSSQu5TDBU4S1ej8PvaEqSQSi338UY8tqNPiH3T1oj190IZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708710621; c=relaxed/simple;
	bh=L3Z6tFZWH/11EnKGcD80oUidpfbs8ozwJPif2MFq82w=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=V5TP0Zn1VHU1UCXMdN13jPVLbeQCnxOte7Ek08cLoGAKgVfmFJ8eN9shVY7HY4jT1dlSkXQxqOuySbvwdE6D9ZxEufEddSfA3N3AVhRS4coOCkDlW2fD6Bo0011i0Rh47wkdat/KQtBKvfCcdPDKaQTHaUsA55TPGOQPgr17N4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RfVBiQwU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=55Ya8Er3; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RfVBiQwU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=55Ya8Er3; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RfVBiQwU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="55Ya8Er3";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RfVBiQwU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="55Ya8Er3"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B96B51FD42;
	Fri, 23 Feb 2024 17:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708710613; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0yDggWGYSo1B6qJHvxDJ8RSVsB9I+nuYnA/S+jhaUPA=;
	b=RfVBiQwUFfe6TOPzU5mh77105hmXm3muOiZ+HtYwhh+N7p2QRQi+EIraFxvSxaJ0ZuSZFs
	hNssPKCBUpIaN0UOeWAy24jbvC9bvK7aiemdKTMZZc8E47QywUTYzWy0vLPBAs/i4Im48m
	tS3sDHk6+l+J8ELRWZlr+3hjXgs9jxk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708710613;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0yDggWGYSo1B6qJHvxDJ8RSVsB9I+nuYnA/S+jhaUPA=;
	b=55Ya8Er3iVYvPRtBX1jFwDksnupw/q7CCgezo5rfl6GsM0XnAPdFxUPh4FCQn9rF2Zhcc4
	cpLtbGAA9MM3LvBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708710613; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0yDggWGYSo1B6qJHvxDJ8RSVsB9I+nuYnA/S+jhaUPA=;
	b=RfVBiQwUFfe6TOPzU5mh77105hmXm3muOiZ+HtYwhh+N7p2QRQi+EIraFxvSxaJ0ZuSZFs
	hNssPKCBUpIaN0UOeWAy24jbvC9bvK7aiemdKTMZZc8E47QywUTYzWy0vLPBAs/i4Im48m
	tS3sDHk6+l+J8ELRWZlr+3hjXgs9jxk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708710613;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0yDggWGYSo1B6qJHvxDJ8RSVsB9I+nuYnA/S+jhaUPA=;
	b=55Ya8Er3iVYvPRtBX1jFwDksnupw/q7CCgezo5rfl6GsM0XnAPdFxUPh4FCQn9rF2Zhcc4
	cpLtbGAA9MM3LvBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9C8EB132C7;
	Fri, 23 Feb 2024 17:50:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ECa0JNXa2GW6RAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 23 Feb 2024 17:50:13 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2 19/24] ALSA: seq: virmidi: Use guard() for locking
Date: Fri, 23 Feb 2024 18:49:56 +0100
Message-Id: <20240223175001.24375-20-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240223175001.24375-1-tiwai@suse.de>
References: <20240223175001.24375-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Bar: /
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=RfVBiQwU;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=55Ya8Er3
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [0.72 / 50.00];
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
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-2.77)[98.99%]
X-Spam-Score: 0.72
X-Rspamd-Queue-Id: B96B51FD42
X-Spam-Flag: NO

We can simplify the code gracefully with new guard() macro and co for
automatic cleanup of locks.

Only the code refactoring, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_virmidi.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/sound/core/seq/seq_virmidi.c b/sound/core/seq/seq_virmidi.c
index 35f93b43dd2a..b4672613c261 100644
--- a/sound/core/seq/seq_virmidi.c
+++ b/sound/core/seq/seq_virmidi.c
@@ -199,11 +199,10 @@ static int snd_virmidi_input_open(struct snd_rawmidi_substream *substream)
 	vmidi->client = rdev->client;
 	vmidi->port = rdev->port;	
 	runtime->private_data = vmidi;
-	down_write(&rdev->filelist_sem);
-	write_lock_irq(&rdev->filelist_lock);
-	list_add_tail(&vmidi->list, &rdev->filelist);
-	write_unlock_irq(&rdev->filelist_lock);
-	up_write(&rdev->filelist_sem);
+	scoped_guard(rwsem_write, &rdev->filelist_sem) {
+		guard(write_lock_irq)(&rdev->filelist_lock);
+		list_add_tail(&vmidi->list, &rdev->filelist);
+	}
 	vmidi->rdev = rdev;
 	return 0;
 }
@@ -243,11 +242,10 @@ static int snd_virmidi_input_close(struct snd_rawmidi_substream *substream)
 	struct snd_virmidi_dev *rdev = substream->rmidi->private_data;
 	struct snd_virmidi *vmidi = substream->runtime->private_data;
 
-	down_write(&rdev->filelist_sem);
-	write_lock_irq(&rdev->filelist_lock);
-	list_del(&vmidi->list);
-	write_unlock_irq(&rdev->filelist_lock);
-	up_write(&rdev->filelist_sem);
+	scoped_guard(rwsem_write, &rdev->filelist_sem) {
+		guard(write_lock_irq)(&rdev->filelist_lock);
+		list_del(&vmidi->list);
+	}
 	snd_midi_event_free(vmidi->parser);
 	substream->runtime->private_data = NULL;
 	kfree(vmidi);
-- 
2.35.3

