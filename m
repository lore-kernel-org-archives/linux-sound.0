Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B956320CBF
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 14:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756478777; cv=none; b=girqnsnWu184FhG9Xn8O/a/ddpA7y+Z5yUk68qzxSHGgndX90j2DoY7CEhNuFo5bNFIIYYu7PufmNlDZB/9BRyzIP2TFR6KbJTFhQWGb6e6qBoaP+G8Dl0MvohK8hipl79zYEEnUrZ50v/aNxZg8OZNRdyICEO4EL7v2blf9ZWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756478777; c=relaxed/simple;
	bh=UalRV1zJKTyT66wYTlXyapV7LRVI5b86SPsk1ruxAy4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QJ81NHRpdSXcoAQnqagpdyDjGcdb1FsS5PhXI+2QxsUhFSXqdr//QlQq4xe1/q+9t59PAwC/aDl/9/l+K749z3CdZe60W47vLVv+onnvvPFgVZbCheceisTD0cLSj/HMUdaOvWDceytPAdHStgn/MNuCfRyHz1HP2zSq7jMkNq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=saKdEinN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=k3C9jKqH; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=saKdEinN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=k3C9jKqH; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="saKdEinN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="k3C9jKqH";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="saKdEinN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="k3C9jKqH"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 86B3B5C101;
	Fri, 29 Aug 2025 14:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478641; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QU4+451WSeD5IJvSMS/ZkyLb24lX5s8WeIs3UNqSljo=;
	b=saKdEinN+/yMztZEL1skTsxSo4OmeiMw+ZTnzIEFeEC66qdew0FgrTpwWvFziro7gGku12
	GhGV9eMZDosBVZzqfNAAJ3toYq8VhIgUacvmwgQQcofEyCk8W2LakWqFNZ4pQq1kAZU2IY
	CMF4asd51lpSDXTkL5yaUoWQ75vAG1k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478641;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QU4+451WSeD5IJvSMS/ZkyLb24lX5s8WeIs3UNqSljo=;
	b=k3C9jKqHBVl+dP8DmirZZzNmUUMCuUVCy5ybWNPW8fxvuYl1XCGHJz3CNkASo6OWlUqayS
	MRyVUV7uRhIvj2CQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478641; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QU4+451WSeD5IJvSMS/ZkyLb24lX5s8WeIs3UNqSljo=;
	b=saKdEinN+/yMztZEL1skTsxSo4OmeiMw+ZTnzIEFeEC66qdew0FgrTpwWvFziro7gGku12
	GhGV9eMZDosBVZzqfNAAJ3toYq8VhIgUacvmwgQQcofEyCk8W2LakWqFNZ4pQq1kAZU2IY
	CMF4asd51lpSDXTkL5yaUoWQ75vAG1k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478641;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QU4+451WSeD5IJvSMS/ZkyLb24lX5s8WeIs3UNqSljo=;
	b=k3C9jKqHBVl+dP8DmirZZzNmUUMCuUVCy5ybWNPW8fxvuYl1XCGHJz3CNkASo6OWlUqayS
	MRyVUV7uRhIvj2CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6573713A54;
	Fri, 29 Aug 2025 14:44:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id aCezF7G8sWi6GAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 14:44:01 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 37/61] ALSA: korg1212: Use guard() for mutex locks
Date: Fri, 29 Aug 2025 16:43:12 +0200
Message-ID: <20250829144342.4290-38-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829144342.4290-1-tiwai@suse.de>
References: <20250829144342.4290-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLsqo7dymd5dgmoaprf5rep8is)];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80

Replace the manual mutex lock/unlock pairs with guard() for code
simplification.

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/korg1212/korg1212.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/sound/pci/korg1212/korg1212.c b/sound/pci/korg1212/korg1212.c
index 0a66d5cfc090..26c515ec76e9 100644
--- a/sound/pci/korg1212/korg1212.c
+++ b/sound/pci/korg1212/korg1212.c
@@ -606,13 +606,12 @@ static int snd_korg1212_OpenCard(struct snd_korg1212 * korg1212)
 {
 	K1212_DEBUG_PRINTK("K1212_DEBUG: OpenCard [%s] %d\n",
 			   stateName[korg1212->cardState], korg1212->opencnt);
-	mutex_lock(&korg1212->open_mutex);
+	guard(mutex)(&korg1212->open_mutex);
         if (korg1212->opencnt++ == 0) {
 		snd_korg1212_TurnOffIdleMonitor(korg1212);
 		snd_korg1212_setCardState(korg1212, K1212_STATE_OPEN);
 	}
 
-	mutex_unlock(&korg1212->open_mutex);
         return 1;
 }
 
@@ -621,11 +620,9 @@ static int snd_korg1212_CloseCard(struct snd_korg1212 * korg1212)
 	K1212_DEBUG_PRINTK("K1212_DEBUG: CloseCard [%s] %d\n",
 			   stateName[korg1212->cardState], korg1212->opencnt);
 
-	mutex_lock(&korg1212->open_mutex);
-	if (--(korg1212->opencnt)) {
-		mutex_unlock(&korg1212->open_mutex);
+	guard(mutex)(&korg1212->open_mutex);
+	if (--(korg1212->opencnt))
 		return 0;
-	}
 
         if (korg1212->cardState == K1212_STATE_SETUP) {
                 int rc = snd_korg1212_Send1212Command(korg1212, K1212_DB_SelectPlayMode,
@@ -633,10 +630,8 @@ static int snd_korg1212_CloseCard(struct snd_korg1212 * korg1212)
 		if (rc)
 			K1212_DEBUG_PRINTK("K1212_DEBUG: CloseCard - RC = %d [%s]\n",
 					   rc, stateName[korg1212->cardState]);
-		if (rc != K1212_CMDRET_Success) {
-			mutex_unlock(&korg1212->open_mutex);
+		if (rc != K1212_CMDRET_Success)
                         return 0;
-		}
         } else if (korg1212->cardState > K1212_STATE_SETUP) {
 		snd_korg1212_SendStopAndWait(korg1212);
         }
@@ -646,7 +641,6 @@ static int snd_korg1212_CloseCard(struct snd_korg1212 * korg1212)
                 snd_korg1212_setCardState(korg1212, K1212_STATE_READY);
 	}
 
-	mutex_unlock(&korg1212->open_mutex);
         return 0;
 }
 
-- 
2.50.1

