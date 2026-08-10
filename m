Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EAB33033E1;
	Mon, 10 Aug 2026 13:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786369046; cv=none; b=OR0zxksSijasGgosFgYV71ePN7UVdSBa6Vn03m+ZecxAa79Cq5o/knKZWP5DgGvum5kX74VfDKkte0ZvpBgSi+q9cFswBJxk65X74zb27EbDTY1hgif+9ce4s7KPQJLxpkbdkHfD9xwMznPMSSJyBcsl316M9iYCWnRskaPKp4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786369046; c=relaxed/simple;
	bh=+FWBDScucpziU2z9A9x2iC1wOtqm67OIkq4r0gHMT6g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Au2DyHigyZADdixKx2clWF57cE+UNPjnjkNu6eMRg9cjortC86YgzLQD7DvjtMnpcjDYasZjyADyeogqzp4Oif97HmKXneOIkzAsuyfT8JJhRaXQfVL6bdiQCc0103E/xjcushHQAdVLTxTDmOaWwbtc7o56Gh8AvUbXwY8bA6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ToLaXIGU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tgswSL1U; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=H5wc9nCl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=NoLo2Wj/; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ToLaXIGU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tgswSL1U";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="H5wc9nCl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NoLo2Wj/"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 766BC80B87;
	Mon, 10 Aug 2026 13:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786369037; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZXPz0TSCQKboRGn8TAG6fDM7fbs06XQsUwIy57kHkaY=;
	b=ToLaXIGUXx6id1gwN9QA8RarCtPg+Jf3TCIwgetnp6bfovLRaQdHD00FpDOVfmlcPRIUUL
	5F6XvHQmvBrGmDZxVieOXQ2p/H03eWc0oVhsXJ8jKlM4tN5e1doJ6oEuexW9EzYm3EtJe6
	/ekksDOxnIijiQOBvHsiQ/6jH8G28jI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786369037;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZXPz0TSCQKboRGn8TAG6fDM7fbs06XQsUwIy57kHkaY=;
	b=tgswSL1UGWaF9G1FSn8iFq9iECOaY4iTKsHCVT08GkQCHWRUXQT6Mh5UsMUFIpCOeZvRd+
	/O5omISOWniyWmAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786369033; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZXPz0TSCQKboRGn8TAG6fDM7fbs06XQsUwIy57kHkaY=;
	b=H5wc9nCl2MCRdfOQRYLZUp4uacavTSDmWfW91Vqz64j35pqTlb/P4pbIm+imPoaNemCQby
	drzHLSqTIi8NL6fVRulz3lSy5AlUYtMNiEaqB7rfVMfr+Gp0P8JzQY4fAxHg6KOebMRc+d
	+PlQ2cc8xlaK7ZeUA6DNncZvynpAtrg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786369033;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZXPz0TSCQKboRGn8TAG6fDM7fbs06XQsUwIy57kHkaY=;
	b=NoLo2Wj/VwHCL+9Y6pz/SgScGC2c6KjdDB5lCGDjNmrNZJzXJ4J1WwZH4qrHIJetbbdJj/
	jCR7lqizv6XQFgAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4D05E779C0;
	Mon, 10 Aug 2026 13:37:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id WHmuEQnUeWq3HwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 10 Aug 2026 13:37:13 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] ALSA: seq: Use RCU for the virmidi file list
Date: Mon, 10 Aug 2026 15:37:05 +0200
Message-ID: <20260810133711.42483-5-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260810133711.42483-1-tiwai@suse.de>
References: <20260810133711.42483-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 

Each virmidi device keeps a list of its opened input files (filelist)
protected by both an rwlock (filelist_lock) and a rw_semaphore
(filelist_sem).  snd_virmidi_dev_receive_event() walks the list on the
sequencer event input path -- read_lock() when the event is delivered in
atomic context, down_read() otherwise -- decoding each incoming event
into the file's rawmidi buffer.  The writers (input open/close) take both
locks to add/remove entries.

This is another typical dual-lock read-mostly pattern as the port
subscriber list: files are opened/closed rarely while the receive
callback runs per event.  Let's convert the traversal to RCU and drop
the rwlock; the existing filelist_sem keeps serializing the writers.
The atomic input path now runs lock-free under rcu_read_lock(), and
both readers share a single list_for_each_entry_rcu() (valid under the
rwsem via lockdep_is_held()).  The writers switch to
list_add_tail_rcu() / list_del_rcu().

snd_virmidi_input_close() freed the entry (parser and struct)
immediately after list_del.  A concurrent lockless reader in the atomic
path may still be dereferencing it, so the close path now waits for an
RCU grace period after list_del_rcu() before freeing; synchronize_rcu()
is used rather than kfree_rcu() because the parser must also be released
after the grace period, not just the struct.  Non-atomic readers are
already excluded by the down_write, so only the atomic RCU readers need
the grace period.

Dropping write_lock_irq() from the writers is safe: no writer runs in
atomic/IRQ context, and the sole atomic reader now uses RCU, which is
IRQ-safe.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/seq_virmidi.h  |  1 -
 sound/core/seq/seq_virmidi.c | 19 +++++++++++--------
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/include/sound/seq_virmidi.h b/include/sound/seq_virmidi.h
index 56a3f38df8c3..359cb363369d 100644
--- a/include/sound/seq_virmidi.h
+++ b/include/sound/seq_virmidi.h
@@ -46,7 +46,6 @@ struct snd_virmidi_dev {
 	int client;			/* created/attached client */
 	int port;			/* created/attached port */
 	unsigned int flags;		/* SNDRV_VIRMIDI_* */
-	rwlock_t filelist_lock;
 	struct rw_semaphore filelist_sem;
 	struct list_head filelist;
 };
diff --git a/sound/core/seq/seq_virmidi.c b/sound/core/seq/seq_virmidi.c
index 982828650d41..6208bf7f57bf 100644
--- a/sound/core/seq/seq_virmidi.c
+++ b/sound/core/seq/seq_virmidi.c
@@ -78,10 +78,11 @@ static int snd_virmidi_dev_receive_event(struct snd_virmidi_dev *rdev,
 	int len;
 
 	if (atomic)
-		read_lock(&rdev->filelist_lock);
+		rcu_read_lock();
 	else
 		down_read(&rdev->filelist_sem);
-	list_for_each_entry(vmidi, &rdev->filelist, list) {
+	list_for_each_entry_rcu(vmidi, &rdev->filelist, list,
+				lockdep_is_held(&rdev->filelist_sem)) {
 		if (!READ_ONCE(vmidi->trigger))
 			continue;
 		if (ev->type == SNDRV_SEQ_EVENT_SYSEX) {
@@ -96,7 +97,7 @@ static int snd_virmidi_dev_receive_event(struct snd_virmidi_dev *rdev,
 		}
 	}
 	if (atomic)
-		read_unlock(&rdev->filelist_lock);
+		rcu_read_unlock();
 	else
 		up_read(&rdev->filelist_sem);
 
@@ -200,8 +201,7 @@ static int snd_virmidi_input_open(struct snd_rawmidi_substream *substream)
 	vmidi->port = rdev->port;	
 	runtime->private_data = vmidi;
 	scoped_guard(rwsem_write, &rdev->filelist_sem) {
-		guard(write_lock_irq)(&rdev->filelist_lock);
-		list_add_tail(&vmidi->list, &rdev->filelist);
+		list_add_tail_rcu(&vmidi->list, &rdev->filelist);
 	}
 	vmidi->rdev = rdev;
 	return 0;
@@ -243,9 +243,13 @@ static int snd_virmidi_input_close(struct snd_rawmidi_substream *substream)
 	struct snd_virmidi *vmidi = substream->runtime->private_data;
 
 	scoped_guard(rwsem_write, &rdev->filelist_sem) {
-		guard(write_lock_irq)(&rdev->filelist_lock);
-		list_del(&vmidi->list);
+		list_del_rcu(&vmidi->list);
 	}
+	/* wait for a grace period so that lockless readers in the atomic
+	 * delivery path (snd_virmidi_dev_receive_event()) are no longer
+	 * traversing this entry before its parser and memory are freed
+	 */
+	synchronize_rcu();
 	snd_midi_event_free(vmidi->parser);
 	substream->runtime->private_data = NULL;
 	kfree(vmidi);
@@ -508,7 +512,6 @@ int snd_virmidi_new(struct snd_card *card, int device, struct snd_rawmidi **rrmi
 	rdev->device = device;
 	rdev->client = -1;
 	init_rwsem(&rdev->filelist_sem);
-	rwlock_init(&rdev->filelist_lock);
 	INIT_LIST_HEAD(&rdev->filelist);
 	rdev->seq_mode = SNDRV_VIRMIDI_SEQ_DISPATCH;
 	rmidi->private_data = rdev;
-- 
2.55.0

