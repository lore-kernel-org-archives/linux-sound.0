Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BB219F115
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 14:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756478791; cv=none; b=SUe8Kg3JFHjDq7RnnsA9fVDj/q2O+njDEgGVLKxUQr57WmtDUNWRuSCfyZFGf+dfQIFkCn9lJxENxggvbQW6ujeOhhrkgIH6jytrLGX9a3peBdbrP8hcW+Tfh1GtBGTjAuPxezCSnPnaji2Ze7/dJ7WVXFbTTYi4g46JAVaq1mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756478791; c=relaxed/simple;
	bh=5OAYaiocrw/RsYDL6lnQ76xgj469gGCoI1nsc+PdECo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cWiuDs/mEjxyp+KNxLHYTBCu9ZC7rl2kmuGwcwjTumkkA9HUqGJNajRI4QTBydAA9XQMS42yolSOmLsys6t4D9BkbqvSHhlbdMpKA7iD4dycrduz7547A1XI4VKye8QyPv6FMcOHKGYyS6szJ4TnTe6zwAOVRQmsgHjZ2nlR4yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ijv1UmQW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=B+2vslFl; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ijv1UmQW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=B+2vslFl; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ijv1UmQW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="B+2vslFl";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ijv1UmQW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="B+2vslFl"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D4AB05C23A;
	Fri, 29 Aug 2025 14:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478641; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7Wm6+hkXc5tFhZw8Uot/nSYWPqamPLwDLCnvOXP6ttU=;
	b=Ijv1UmQW81UIkDw57ZFvCqyEoKrbUIRZ/HSIfbq+vLNgSaQkjm/YtGYL1NIBabIlCkRUqE
	paZLXV0ncw1FwPfA9rTo+WrfNf1oPbYeE8f25zNKvQoRUKljKsiaNO9ZJRFX9GnzdYu6/A
	bpUvK65KxAnEKa+wahML+jDPJaOmpfs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478641;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7Wm6+hkXc5tFhZw8Uot/nSYWPqamPLwDLCnvOXP6ttU=;
	b=B+2vslFlX59U6VtV1gjwSZXlhAH0n3mhv7+3V3xAzjbF7dBoAQGgAGZQJIVMQwjes9Zsnp
	k6ZiAcdz67ufDGBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478641; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7Wm6+hkXc5tFhZw8Uot/nSYWPqamPLwDLCnvOXP6ttU=;
	b=Ijv1UmQW81UIkDw57ZFvCqyEoKrbUIRZ/HSIfbq+vLNgSaQkjm/YtGYL1NIBabIlCkRUqE
	paZLXV0ncw1FwPfA9rTo+WrfNf1oPbYeE8f25zNKvQoRUKljKsiaNO9ZJRFX9GnzdYu6/A
	bpUvK65KxAnEKa+wahML+jDPJaOmpfs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478641;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7Wm6+hkXc5tFhZw8Uot/nSYWPqamPLwDLCnvOXP6ttU=;
	b=B+2vslFlX59U6VtV1gjwSZXlhAH0n3mhv7+3V3xAzjbF7dBoAQGgAGZQJIVMQwjes9Zsnp
	k6ZiAcdz67ufDGBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BD5DA13A6A;
	Fri, 29 Aug 2025 14:44:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ABUnLbG8sWi6GAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 14:44:01 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 40/61] ALSA: lola: Use guard() for spin locks
Date: Fri, 29 Aug 2025 16:43:15 +0200
Message-ID: <20250829144342.4290-41-tiwai@suse.de>
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
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLsqo7dymd5dgmoaprf5rep8is)];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80

Clean up the code using guard() for spin locks.

Merely code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/lola/lola.c     | 4 +---
 sound/pci/lola/lola_pcm.c | 3 +--
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/sound/pci/lola/lola.c b/sound/pci/lola/lola.c
index 8d927ecba165..34a3ba17deb4 100644
--- a/sound/pci/lola/lola.c
+++ b/sound/pci/lola/lola.c
@@ -74,7 +74,6 @@ static int corb_send_verb(struct lola *chip, unsigned int nid,
 			  unsigned int verb, unsigned int data,
 			  unsigned int extdata)
 {
-	unsigned long flags;
 	int ret = -EIO;
 
 	chip->last_cmd_nid = nid;
@@ -83,7 +82,7 @@ static int corb_send_verb(struct lola *chip, unsigned int nid,
 	chip->last_extdata = extdata;
 	data |= (nid << 20) | (verb << 8);
 
-	spin_lock_irqsave(&chip->reg_lock, flags);
+	guard(spinlock_irqsave)(&chip->reg_lock);
 	if (chip->rirb.cmds < LOLA_CORB_ENTRIES - 1) {
 		unsigned int wp = chip->corb.wp + 1;
 		wp %= LOLA_CORB_ENTRIES;
@@ -95,7 +94,6 @@ static int corb_send_verb(struct lola *chip, unsigned int nid,
 		smp_wmb();
 		ret = 0;
 	}
-	spin_unlock_irqrestore(&chip->reg_lock, flags);
 	return ret;
 }
 
diff --git a/sound/pci/lola/lola_pcm.c b/sound/pci/lola/lola_pcm.c
index 35e919d240bf..6c046ecd6e08 100644
--- a/sound/pci/lola/lola_pcm.c
+++ b/sound/pci/lola/lola_pcm.c
@@ -523,7 +523,7 @@ static int lola_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 	 */
 	sync_streams = (start && snd_pcm_stream_linked(substream));
 	tstamp = lola_get_tstamp(chip, !sync_streams);
-	spin_lock(&chip->reg_lock);
+	guard(spinlock)(&chip->reg_lock);
 	snd_pcm_group_for_each_entry(s, substream) {
 		if (s->pcm->card != substream->pcm->card)
 			continue;
@@ -536,7 +536,6 @@ static int lola_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 		str->paused = !start;
 		snd_pcm_trigger_done(s, substream);
 	}
-	spin_unlock(&chip->reg_lock);
 	return 0;
 }
 
-- 
2.50.1

