Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB3A1F3B98
	for <linux-sound@vger.kernel.org>; Mon, 11 Aug 2025 10:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754906927; cv=none; b=BQ1gCB6v884hp1reHoQXkGmtI++PwvHJ3DVyeL5BJp5fqwknU4g71sydXL08T+y7O4ccr1mnUA6s3daZnzu5IdZHbMnFPA98Wf9dZbWkJuu7LWky2kmL845x3yO+Ix0yZtJUXXUOeZykT09qZjxQ7D33Pimc2CVlNES7xbQy5AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754906927; c=relaxed/simple;
	bh=i5c3LEuKzr/q2kUmhRCJNQBN21hcafU5BCfhu8aYmbc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=THlKHwCQYP8xwvD1zd3hdCH9Izcr9/s9i9Cd8rasl3fNPffVrwy9z1r/SGNfkjMirmU8rZcx8BHOVGJ/+FHIfTNW8Ho1K7bAURNrBMq8G4EpZHP4jbaxKyybiE2dvvKYkfPYoqi8zRHbw79R7oEtJG7DVsdgDNaXEmsyR9dwSUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=evnZnU6w; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lld/BarD; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=evnZnU6w; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lld/BarD; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="evnZnU6w";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lld/BarD";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="evnZnU6w";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lld/BarD"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A834D33E47;
	Mon, 11 Aug 2025 10:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754906895; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H96/R01Uc/PUNptjGvq5KHbOUWdPt4T3awFOJ7VdmTA=;
	b=evnZnU6wc0XoPOyC1Vj2A+HDTwlxQqmbxrggmjVBa7EOCQEbMKEN3Badh6OlFDvaKnZesh
	kHogZvzobHE3TipWkrt4VCCDe/RX4Qhg65DsAmaN65bVIkfZopNAWM7KcbunVq5thNbluC
	dlN+k6JNWc9G8BoZEZSk1Hzbz+9PvMQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754906895;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H96/R01Uc/PUNptjGvq5KHbOUWdPt4T3awFOJ7VdmTA=;
	b=lld/BarDqFXJsxFf1XyjNuHBRi5DsqWWgMLVlzKYlGGhfwuF6nuOMWnsjCWG9/pIdK1Wem
	fv9dNyHgCFSLkxDw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=evnZnU6w;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="lld/BarD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754906895; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H96/R01Uc/PUNptjGvq5KHbOUWdPt4T3awFOJ7VdmTA=;
	b=evnZnU6wc0XoPOyC1Vj2A+HDTwlxQqmbxrggmjVBa7EOCQEbMKEN3Badh6OlFDvaKnZesh
	kHogZvzobHE3TipWkrt4VCCDe/RX4Qhg65DsAmaN65bVIkfZopNAWM7KcbunVq5thNbluC
	dlN+k6JNWc9G8BoZEZSk1Hzbz+9PvMQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754906895;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H96/R01Uc/PUNptjGvq5KHbOUWdPt4T3awFOJ7VdmTA=;
	b=lld/BarDqFXJsxFf1XyjNuHBRi5DsqWWgMLVlzKYlGGhfwuF6nuOMWnsjCWG9/pIdK1Wem
	fv9dNyHgCFSLkxDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6FDEA13A7E;
	Mon, 11 Aug 2025 10:08:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GHwfGg/BmWiVBwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 11 Aug 2025 10:08:15 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	patches@opensource.cirrus.com,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>
Subject: [PATCH 11/25] ALSA: hda/realtek: Use guard() for mutex locks
Date: Mon, 11 Aug 2025 12:07:45 +0200
Message-ID: <20250811100807.7962-12-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250811100807.7962-1-tiwai@suse.de>
References: <20250811100807.7962-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[7];
	R_RATELIMIT(0.00)[to_ip_from(RLs9qncch5cpanyka9neihc978)];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: A834D33E47
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

Replace the manual mutex lock/unlock pairs with guard().
Also, introduce the guard() for coef_mutex_lock() and _unlock() pairs,
and replace accordingly, too.

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/codecs/realtek/alc268.c  |  3 +--
 sound/hda/codecs/realtek/realtek.c | 19 +++++++------------
 2 files changed, 8 insertions(+), 14 deletions(-)

diff --git a/sound/hda/codecs/realtek/alc268.c b/sound/hda/codecs/realtek/alc268.c
index e489cdc98eb8..4b565fb7bd1c 100644
--- a/sound/hda/codecs/realtek/alc268.c
+++ b/sound/hda/codecs/realtek/alc268.c
@@ -12,7 +12,7 @@ static int alc268_beep_switch_put(struct snd_kcontrol *kcontrol,
 	unsigned long pval;
 	int err;
 
-	mutex_lock(&codec->control_mutex);
+	guard(mutex)(&codec->control_mutex);
 	pval = kcontrol->private_value;
 	kcontrol->private_value = (pval & ~0xff) | 0x0f;
 	err = snd_hda_mixer_amp_switch_put(kcontrol, ucontrol);
@@ -21,7 +21,6 @@ static int alc268_beep_switch_put(struct snd_kcontrol *kcontrol,
 		err = snd_hda_mixer_amp_switch_put(kcontrol, ucontrol);
 	}
 	kcontrol->private_value = pval;
-	mutex_unlock(&codec->control_mutex);
 	return err;
 }
 
diff --git a/sound/hda/codecs/realtek/realtek.c b/sound/hda/codecs/realtek/realtek.c
index b6feccfd45a9..1d0f9d16e6c0 100644
--- a/sound/hda/codecs/realtek/realtek.c
+++ b/sound/hda/codecs/realtek/realtek.c
@@ -27,6 +27,8 @@ static void coef_mutex_unlock(struct hda_codec *codec)
 	snd_hda_power_down_pm(codec);
 }
 
+DEFINE_GUARD(coef_mutex, struct hda_codec *, coef_mutex_lock(_T), coef_mutex_unlock(_T))
+
 static int __alc_read_coefex_idx(struct hda_codec *codec, hda_nid_t nid,
 				 unsigned int coef_idx)
 {
@@ -40,12 +42,8 @@ static int __alc_read_coefex_idx(struct hda_codec *codec, hda_nid_t nid,
 int alc_read_coefex_idx(struct hda_codec *codec, hda_nid_t nid,
 			unsigned int coef_idx)
 {
-	unsigned int val;
-
-	coef_mutex_lock(codec);
-	val = __alc_read_coefex_idx(codec, nid, coef_idx);
-	coef_mutex_unlock(codec);
-	return val;
+	guard(coef_mutex)(codec);
+	return __alc_read_coefex_idx(codec, nid, coef_idx);
 }
 EXPORT_SYMBOL_NS_GPL(alc_read_coefex_idx, "SND_HDA_CODEC_REALTEK");
 
@@ -59,9 +57,8 @@ static void __alc_write_coefex_idx(struct hda_codec *codec, hda_nid_t nid,
 void alc_write_coefex_idx(struct hda_codec *codec, hda_nid_t nid,
 			  unsigned int coef_idx, unsigned int coef_val)
 {
-	coef_mutex_lock(codec);
+	guard(coef_mutex)(codec);
 	__alc_write_coefex_idx(codec, nid, coef_idx, coef_val);
-	coef_mutex_unlock(codec);
 }
 EXPORT_SYMBOL_NS_GPL(alc_write_coefex_idx, "SND_HDA_CODEC_REALTEK");
 
@@ -80,9 +77,8 @@ void alc_update_coefex_idx(struct hda_codec *codec, hda_nid_t nid,
 			   unsigned int coef_idx, unsigned int mask,
 			   unsigned int bits_set)
 {
-	coef_mutex_lock(codec);
+	guard(coef_mutex)(codec);
 	__alc_update_coefex_idx(codec, nid, coef_idx, mask, bits_set);
-	coef_mutex_unlock(codec);
 }
 EXPORT_SYMBOL_NS_GPL(alc_update_coefex_idx, "SND_HDA_CODEC_REALTEK");
 
@@ -99,7 +95,7 @@ EXPORT_SYMBOL_NS_GPL(alc_get_coef0, "SND_HDA_CODEC_REALTEK");
 
 void alc_process_coef_fw(struct hda_codec *codec, const struct coef_fw *fw)
 {
-	coef_mutex_lock(codec);
+	guard(coef_mutex)(codec);
 	for (; fw->nid; fw++) {
 		if (fw->mask == (unsigned short)-1)
 			__alc_write_coefex_idx(codec, fw->nid, fw->idx, fw->val);
@@ -107,7 +103,6 @@ void alc_process_coef_fw(struct hda_codec *codec, const struct coef_fw *fw)
 			__alc_update_coefex_idx(codec, fw->nid, fw->idx,
 						fw->mask, fw->val);
 	}
-	coef_mutex_unlock(codec);
 }
 EXPORT_SYMBOL_NS_GPL(alc_process_coef_fw, "SND_HDA_CODEC_REALTEK");
 
-- 
2.50.1

