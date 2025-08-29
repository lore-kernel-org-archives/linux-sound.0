Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6380B313E0A
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 14:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756478742; cv=none; b=MahlpBY/7eHiRr8f9ruhmUvfEwUofU/8iZi6VNpA2JbhibjfNts2+nckiGUpKIPZo6M6+7ckI7aV7YQf2Fcvg1sPpn2UpC2Ok9bdWl21xrTTv3EGdY/XuRcz+G9pd3M9u+i+rd+Kgc9lifDsVa9gWZk5IeAgkXa2kn4Jwgtz5Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756478742; c=relaxed/simple;
	bh=YD27yBYgF6b379riPt6jhPmZRtg0CCRFIOXbhIU+xCY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U6SslaJUWR+sSjEK2IoGkpj1cWG9ZWH2wgxtWwJMaxFiIRY6qhknD/JOHN/c3JqVws2ZFQDcolr56ZDFXseS27JUmZswXMmsnVJlX2PmAufioU78shxEpogQqOyMzaxsGxd1HPaUeyEfZ71DD2O+Hz4RZI74MrRmj8XgiW7JNKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TIMHJvAJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=sIE0cntp; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TIMHJvAJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=sIE0cntp; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TIMHJvAJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sIE0cntp";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TIMHJvAJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sIE0cntp"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B96D833ED0;
	Fri, 29 Aug 2025 14:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478641; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kzKXFwsh3aX+fc5m8rBJercHc6VD3ugJe4dtfVCX2PQ=;
	b=TIMHJvAJIQgFZ9xbTikcU9qA0SPhZCIn8uPRBSwLqM+FAxl54t3iFwKwdeG98Lfx2wIGdn
	LGeMASZlw9PxpJIOP3WxRYGNZDxwLqFx+hdcaLI2MVoe0WTsmYbLxXVHwAqhgK0ulZ4fuM
	CS7kBH4kbQFrsOowYTXQTdbggNScIao=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478641;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kzKXFwsh3aX+fc5m8rBJercHc6VD3ugJe4dtfVCX2PQ=;
	b=sIE0cntpSjs18Ka8+S1CNTHBXaiDUQGAP/XGjNYhGkj+Bq84ek+5s3RGkySewY6RiFhee2
	W227S/YraSNIbOAw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=TIMHJvAJ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=sIE0cntp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478641; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kzKXFwsh3aX+fc5m8rBJercHc6VD3ugJe4dtfVCX2PQ=;
	b=TIMHJvAJIQgFZ9xbTikcU9qA0SPhZCIn8uPRBSwLqM+FAxl54t3iFwKwdeG98Lfx2wIGdn
	LGeMASZlw9PxpJIOP3WxRYGNZDxwLqFx+hdcaLI2MVoe0WTsmYbLxXVHwAqhgK0ulZ4fuM
	CS7kBH4kbQFrsOowYTXQTdbggNScIao=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478641;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kzKXFwsh3aX+fc5m8rBJercHc6VD3ugJe4dtfVCX2PQ=;
	b=sIE0cntpSjs18Ka8+S1CNTHBXaiDUQGAP/XGjNYhGkj+Bq84ek+5s3RGkySewY6RiFhee2
	W227S/YraSNIbOAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A033E13A54;
	Fri, 29 Aug 2025 14:44:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AIQAJrG8sWi6GAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 14:44:01 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 39/61] ALSA: lola: Use guard() for mutex locks
Date: Fri, 29 Aug 2025 16:43:14 +0200
Message-ID: <20250829144342.4290-40-tiwai@suse.de>
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
X-Spam-Flag: NO
X-Rspamd-Queue-Id: B96D833ED0
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLe1mc1hwayk397878n5a1j337)];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01

Replace the manual mutex lock/unlock pairs with guard() for code
simplification.

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/lola/lola_pcm.c | 33 +++++++++++++--------------------
 1 file changed, 13 insertions(+), 20 deletions(-)

diff --git a/sound/pci/lola/lola_pcm.c b/sound/pci/lola/lola_pcm.c
index 32193fae978d..35e919d240bf 100644
--- a/sound/pci/lola/lola_pcm.c
+++ b/sound/pci/lola/lola_pcm.c
@@ -214,11 +214,9 @@ static int lola_pcm_open(struct snd_pcm_substream *substream)
 	struct lola_stream *str = lola_get_stream(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 
-	mutex_lock(&chip->open_mutex);
-	if (str->opened) {
-		mutex_unlock(&chip->open_mutex);
+	guard(mutex)(&chip->open_mutex);
+	if (str->opened)
 		return -EBUSY;
-	}
 	str->substream = substream;
 	str->master = NULL;
 	str->opened = 1;
@@ -239,7 +237,6 @@ static int lola_pcm_open(struct snd_pcm_substream *substream)
 				   chip->granularity);
 	snd_pcm_hw_constraint_step(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
 				   chip->granularity);
-	mutex_unlock(&chip->open_mutex);
 	return 0;
 }
 
@@ -261,7 +258,7 @@ static int lola_pcm_close(struct snd_pcm_substream *substream)
 	struct lola *chip = snd_pcm_substream_chip(substream);
 	struct lola_stream *str = lola_get_stream(substream);
 
-	mutex_lock(&chip->open_mutex);
+	guard(mutex)(&chip->open_mutex);
 	if (str->substream == substream) {
 		str->substream = NULL;
 		str->opened = 0;
@@ -270,7 +267,6 @@ static int lola_pcm_close(struct snd_pcm_substream *substream)
 		/* release sample rate */
 		chip->sample_rate = 0;
 	}
-	mutex_unlock(&chip->open_mutex);
 	return 0;
 }
 
@@ -291,10 +287,9 @@ static int lola_pcm_hw_free(struct snd_pcm_substream *substream)
 	struct lola_pcm *pcm = lola_get_pcm(substream);
 	struct lola_stream *str = lola_get_stream(substream);
 
-	mutex_lock(&chip->open_mutex);
+	guard(mutex)(&chip->open_mutex);
 	lola_stream_reset(chip, str);
 	lola_cleanup_slave_streams(pcm, str);
-	mutex_unlock(&chip->open_mutex);
 	return 0;
 }
 
@@ -457,18 +452,16 @@ static int lola_pcm_prepare(struct snd_pcm_substream *substream)
 	unsigned int bufsize, period_bytes, format_verb;
 	int i, err;
 
-	mutex_lock(&chip->open_mutex);
-	lola_stream_reset(chip, str);
-	lola_cleanup_slave_streams(pcm, str);
-	if (str->index + runtime->channels > pcm->num_streams) {
-		mutex_unlock(&chip->open_mutex);
-		return -EINVAL;
+	scoped_guard(mutex, &chip->open_mutex) {
+		lola_stream_reset(chip, str);
+		lola_cleanup_slave_streams(pcm, str);
+		if (str->index + runtime->channels > pcm->num_streams)
+			return -EINVAL;
+		for (i = 1; i < runtime->channels; i++) {
+			str[i].master = str;
+			str[i].opened = 1;
+		}
 	}
-	for (i = 1; i < runtime->channels; i++) {
-		str[i].master = str;
-		str[i].opened = 1;
-	}
-	mutex_unlock(&chip->open_mutex);
 
 	bufsize = snd_pcm_lib_buffer_bytes(substream);
 	period_bytes = snd_pcm_lib_period_bytes(substream);
-- 
2.50.1

