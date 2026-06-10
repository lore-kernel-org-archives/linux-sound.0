Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A444F29D27D
	for <linux-sound@vger.kernel.org>; Wed, 10 Jun 2026 15:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781106345; cv=none; b=gEnXpOgLU+OuTqLD7tMK0N8x9zVmg1fzW628sH3W8akdW8cNScTuESjsVUnqnDrDFavpNGtcT7rq1d2Zhml1eRDSszJULEkhM6Vd937yqbTw44Qj6IxjvTGu4O1qdzznZeq3AVOgGxBNkBOqKzcTmw82sZmdZuFhxelNFeITq5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781106345; c=relaxed/simple;
	bh=mSJBT9gw3g/YI3vzVEaslINgCKfkdg0I74ZF5D97mTA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OxTPtcFShPeeKvtHHOVhsKpMyov0NlUn1343xx+pkTxRGyKfqdOEWspHI7Oa08Yt4tBFOhTmxEDi18jRIQdl6p0bFGPLorZWWEieTpbDfkgU9dtZH3ISwrsuENBBVqUI3lGQGta1DXd77tg52iDKrxLB0VVZiOEXwwmEcwsPxlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DFaPISpR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pC9Mmj3K; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DFaPISpR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pC9Mmj3K; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DFaPISpR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pC9Mmj3K";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DFaPISpR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pC9Mmj3K"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2EB2C759AB;
	Wed, 10 Jun 2026 15:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781106342; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mZ3bOcoL4ROhprnLJ+d55aZaSwf+vwkKXvn8PcoXTtY=;
	b=DFaPISpRX0rCR6iY61HuUTZG2dtQlbJesRa4p2IjlBGt9Zus0vqi8NizNu5LXUN6jj0M8l
	4CSuQN4AASkIBd4BNjPPenmPImb+lSd7A8O/pYwZvsa04ki8lLkl3O/VKfI6B6gLUS093Q
	pkfxdl59Qn61xRQmvt/9b8AuqTvNmXA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781106342;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mZ3bOcoL4ROhprnLJ+d55aZaSwf+vwkKXvn8PcoXTtY=;
	b=pC9Mmj3Kabz4F4FsryRE31JReDDO2H5bum4GhHZ/MATAUbDuUV7LWDM34ZpCA6XJ3h0OLU
	qtUcdhZwkXnrVQAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781106342; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mZ3bOcoL4ROhprnLJ+d55aZaSwf+vwkKXvn8PcoXTtY=;
	b=DFaPISpRX0rCR6iY61HuUTZG2dtQlbJesRa4p2IjlBGt9Zus0vqi8NizNu5LXUN6jj0M8l
	4CSuQN4AASkIBd4BNjPPenmPImb+lSd7A8O/pYwZvsa04ki8lLkl3O/VKfI6B6gLUS093Q
	pkfxdl59Qn61xRQmvt/9b8AuqTvNmXA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781106342;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mZ3bOcoL4ROhprnLJ+d55aZaSwf+vwkKXvn8PcoXTtY=;
	b=pC9Mmj3Kabz4F4FsryRE31JReDDO2H5bum4GhHZ/MATAUbDuUV7LWDM34ZpCA6XJ3h0OLU
	qtUcdhZwkXnrVQAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0D10B779A9;
	Wed, 10 Jun 2026 15:45:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id uKDwAaaGKWo5MwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 10 Jun 2026 15:45:42 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org,
	linux-kernel@vber.kernel.org
Subject: [PATCH 1/5] ALSA: Add simple refcount helper functions
Date: Wed, 10 Jun 2026 17:45:31 +0200
Message-ID: <20260610154538.51076-2-tiwai@suse.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260610154538.51076-1-tiwai@suse.de>
References: <20260610154538.51076-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWO(0.00)[2];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 

There are many open-code to manage the same pattern for refcount +
wakeup sync at closing.  Let's provide the common helper functions to
replace the open-code.

- The recount is kept in struct snd_refcount, where it's initialized
by snd_refcount_init().
- The user can simply reference or unreference via snd_refcount_get()
and snd_refcount_put() functions
- The user can wait for the all usages gone by snd_refcount_sync()

Note that here we use atomic_t instead of refcount_t since the current
users allow reusing the refcount after sync again.  The design of
refcount_t prevents exactly this behavior, so it doesn't fit.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/core.h | 21 +++++++++++++++++++++
 sound/core/misc.c    | 24 ++++++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/include/sound/core.h b/include/sound/core.h
index 8b2ca95d13f7..a3f10294e834 100644
--- a/include/sound/core.h
+++ b/include/sound/core.h
@@ -75,6 +75,27 @@ struct snd_device {
 
 #define snd_device(n) list_entry(n, struct snd_device, list)
 
+/*
+ * A simple reference counter with a wait queue;
+ * typically used for usage counts, and you can synchronize at finishing
+ * via snd_refcount_sync(), which is woken up when the refcount reaches to
+ * zero again.
+ */
+struct snd_refcount {
+	atomic_t count;
+	wait_queue_head_t waiter;
+};
+
+void snd_refcount_init(struct snd_refcount *ref);
+
+static inline void snd_refcount_get(struct snd_refcount *ref)
+{
+	atomic_inc(&ref->count);
+}
+
+void snd_refcount_put(struct snd_refcount *ref);
+void snd_refcount_sync(struct snd_refcount *ref);
+
 /* main structure for soundcard */
 
 struct snd_card {
diff --git a/sound/core/misc.c b/sound/core/misc.c
index 833124c8e4fa..4772b2a3b808 100644
--- a/sound/core/misc.c
+++ b/sound/core/misc.c
@@ -174,3 +174,27 @@ void snd_fasync_free(struct snd_fasync *fasync)
 	kfree(fasync);
 }
 EXPORT_SYMBOL_GPL(snd_fasync_free);
+
+/*
+ * generic refcount helper
+ */
+
+void snd_refcount_init(struct snd_refcount *ref)
+{
+	atomic_set(&ref->count, 0);
+	init_waitqueue_head(&ref->waiter);
+}
+EXPORT_SYMBOL_GPL(snd_refcount_init);
+
+void snd_refcount_put(struct snd_refcount *ref)
+{
+	if (atomic_dec_and_test(&ref->count))
+		wake_up(&ref->waiter);
+}
+EXPORT_SYMBOL_GPL(snd_refcount_put);
+
+void snd_refcount_sync(struct snd_refcount *ref)
+{
+	wait_event(ref->waiter, !atomic_read(&ref->count));
+}
+EXPORT_SYMBOL_GPL(snd_refcount_sync);
-- 
2.54.0

