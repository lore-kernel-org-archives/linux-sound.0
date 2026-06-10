Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028E24D2EC0
	for <linux-sound@vger.kernel.org>; Wed, 10 Jun 2026 15:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781106362; cv=none; b=NOVurkFcTrsdCG8Siv78JVLt4DG3cd016v+nKKER7/FDtwKSpRexvrK7inAtnioPBBXaYPWOP3D5btyo1yY8HRJAEWIRKnHoCQKTVihfJoKAG6IRUS0btrlFjWV3H33yTi8/ERLz2HxuNv/XbnYGjJrxZToWoIVfIKmILXvv+/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781106362; c=relaxed/simple;
	bh=ObT+sah7uqsRFdLpxLWrTDQiKXFwNYsPa/5JwdxNsdo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r/eYF3MWTwHaVYAZ4jZYTfp+YJ2RRoSrq2OqlPC40p+vjp5jME9NE0JjL6srO92x+dlUZo+OL1V+zQHBCWIfaPxY17c4z1YYvErDTZNIX78haV6WE/XtUhSXvnvdVpL+zBEUr9XYdXwTzmk5UCZrDufHsx04svJ38T+W/fN25TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FTFY99ks; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Zx0ebPEs; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FTFY99ks; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Zx0ebPEs; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FTFY99ks";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Zx0ebPEs";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FTFY99ks";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Zx0ebPEs"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8297775D56;
	Wed, 10 Jun 2026 15:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781106342; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2bMHFbjzDu3oi4CEqxroIPZysv4ayzz+RSa2gaM/x7U=;
	b=FTFY99ksHxMVX2Uy0Sl37q201/eII8I8qfqzEDv5NIxd74s8wA+sbSD0QL+ToA3lRsdtrl
	DzRxkcGBYfcsbxpHWyTxTg4UkcjZsxfaLUt14ezBt8CUEBtaNF10zv/f0PNAQpBA0wpRzk
	I1cTiAdo2xz+HsMLK82pt470tjgxWeA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781106342;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2bMHFbjzDu3oi4CEqxroIPZysv4ayzz+RSa2gaM/x7U=;
	b=Zx0ebPEslJfAlQP7QflL4DBQgzpHyqlT6EKBxgOLhv/tqsTRnprM+ae95vX4AVxQZEG7K3
	fOdqo1F7dWMdRYBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781106342; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2bMHFbjzDu3oi4CEqxroIPZysv4ayzz+RSa2gaM/x7U=;
	b=FTFY99ksHxMVX2Uy0Sl37q201/eII8I8qfqzEDv5NIxd74s8wA+sbSD0QL+ToA3lRsdtrl
	DzRxkcGBYfcsbxpHWyTxTg4UkcjZsxfaLUt14ezBt8CUEBtaNF10zv/f0PNAQpBA0wpRzk
	I1cTiAdo2xz+HsMLK82pt470tjgxWeA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781106342;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2bMHFbjzDu3oi4CEqxroIPZysv4ayzz+RSa2gaM/x7U=;
	b=Zx0ebPEslJfAlQP7QflL4DBQgzpHyqlT6EKBxgOLhv/tqsTRnprM+ae95vX4AVxQZEG7K3
	fOdqo1F7dWMdRYBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 62F35779A9;
	Wed, 10 Jun 2026 15:45:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SDDpFqaGKWo5MwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 10 Jun 2026 15:45:42 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org,
	linux-kernel@vber.kernel.org
Subject: [PATCH 3/5] ALSA: hda: Use the new helper for PCM instance refcount
Date: Wed, 10 Jun 2026 17:45:33 +0200
Message-ID: <20260610154538.51076-4-tiwai@suse.de>
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
X-Spam-Score: -2.80

HD-audio core driver has some open-code for managing the refcount for
PCM instances, and it can be replaced gracefully with the new helpers.
Only a code cleanup, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/hda_codec.h | 10 ++++++----
 sound/hda/common/bind.c   |  3 +--
 sound/hda/common/codec.c  | 14 +++-----------
 3 files changed, 10 insertions(+), 17 deletions(-)

diff --git a/include/sound/hda_codec.h b/include/sound/hda_codec.h
index 1a1fe7a904c3..17945ab5e6e2 100644
--- a/include/sound/hda_codec.h
+++ b/include/sound/hda_codec.h
@@ -188,8 +188,7 @@ struct hda_codec {
 
 	/* PCM to create, set by hda_codec_ops.build_pcms callback */
 	struct list_head pcm_list_head;
-	refcount_t pcm_ref;
-	wait_queue_head_t remove_sleep;
+	struct snd_refcount pcm_ref;
 
 	/* codec specific info */
 	void *spec;
@@ -439,9 +438,12 @@ void snd_hda_codec_cleanup_for_unbind(struct hda_codec *codec);
 
 static inline void snd_hda_codec_pcm_get(struct hda_pcm *pcm)
 {
-	refcount_inc(&pcm->codec->pcm_ref);
+	snd_refcount_get(&pcm->codec->pcm_ref);
+}
+static inline void snd_hda_codec_pcm_put(struct hda_pcm *pcm)
+{
+	snd_refcount_put(&pcm->codec->pcm_ref);
 }
-void snd_hda_codec_pcm_put(struct hda_pcm *pcm);
 
 int snd_hda_codec_prepare(struct hda_codec *codec,
 			  struct hda_pcm_stream *hinfo,
diff --git a/sound/hda/common/bind.c b/sound/hda/common/bind.c
index bb1090b65699..6a728a773556 100644
--- a/sound/hda/common/bind.c
+++ b/sound/hda/common/bind.c
@@ -162,8 +162,7 @@ static int hda_codec_driver_remove(struct device *dev)
 
 	snd_hda_codec_disconnect_pcms(codec);
 	snd_hda_jack_tbl_disconnect(codec);
-	if (!refcount_dec_and_test(&codec->pcm_ref))
-		wait_event(codec->remove_sleep, !refcount_read(&codec->pcm_ref));
+	snd_refcount_sync(&codec->pcm_ref);
 	snd_power_sync_ref(codec->bus->card);
 
 	if (driver->ops->remove)
diff --git a/sound/hda/common/codec.c b/sound/hda/common/codec.c
index 81f266b9b850..ef533770179b 100644
--- a/sound/hda/common/codec.c
+++ b/sound/hda/common/codec.c
@@ -689,13 +689,6 @@ get_hda_cvt_setup(struct hda_codec *codec, hda_nid_t nid)
 /*
  * PCM device
  */
-void snd_hda_codec_pcm_put(struct hda_pcm *pcm)
-{
-	if (refcount_dec_and_test(&pcm->codec->pcm_ref))
-		wake_up(&pcm->codec->remove_sleep);
-}
-EXPORT_SYMBOL_GPL(snd_hda_codec_pcm_put);
-
 struct hda_pcm *snd_hda_codec_pcm_new(struct hda_codec *codec,
 				      const char *fmt, ...)
 {
@@ -716,7 +709,7 @@ struct hda_pcm *snd_hda_codec_pcm_new(struct hda_codec *codec,
 	}
 
 	list_add_tail(&pcm->list, &codec->pcm_list_head);
-	refcount_inc(&codec->pcm_ref);
+	snd_hda_codec_pcm_get(pcm);
 	return pcm;
 }
 EXPORT_SYMBOL_GPL(snd_hda_codec_pcm_new);
@@ -787,7 +780,7 @@ void snd_hda_codec_cleanup_for_unbind(struct hda_codec *codec)
 	remove_conn_list(codec);
 	snd_hdac_regmap_exit(&codec->core);
 	codec->configured = 0;
-	refcount_set(&codec->pcm_ref, 1); /* reset refcount */
+	snd_refcount_init(&codec->pcm_ref); /* reset refcount */
 }
 EXPORT_SYMBOL_GPL(snd_hda_codec_cleanup_for_unbind);
 
@@ -927,8 +920,7 @@ snd_hda_codec_device_init(struct hda_bus *bus, unsigned int codec_addr,
 	INIT_LIST_HEAD(&codec->conn_list);
 	INIT_LIST_HEAD(&codec->pcm_list_head);
 	INIT_DELAYED_WORK(&codec->jackpoll_work, hda_jackpoll_work);
-	refcount_set(&codec->pcm_ref, 1);
-	init_waitqueue_head(&codec->remove_sleep);
+	snd_refcount_init(&codec->pcm_ref);
 
 	return codec;
 }
-- 
2.54.0

