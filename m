Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9731F2C15BC
	for <linux-sound@vger.kernel.org>; Wed, 27 Aug 2025 07:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756279796; cv=none; b=Rk93099QqDG52aFalO48E5aQL5yh2n98+C/4O1BHic1QHlq0bCxFBxdT8N23qmb1SV9nlVDQgV9znaHa3RJAvnJ0UpjcZ48CxCfOQAPMnbeG5TnsmvTkUIJIv8H+sKxdy6Xj3FoQ+3GfmzIuouzkiqnewZnYjlkVdPFKYpIT+H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756279796; c=relaxed/simple;
	bh=i9kX8z1AtFfc/64vCFYo2dPLIJ/Whfi92C2mExlB1I0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iQ40taIuWgyuTL+vuRTgMd8aM1qQNX95NJylf+pkf1InKP5akke102YSlDdVl2R3lM0dyD2vrE6tKeTy0jfO43rWTfsU+9IyxV56vd1txUM72I4n+/2rHoXQhrKbjVYlXEyhDUWCX8VNhk60eX79wEW2DgLGfzkYfRtb+JutgX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VCJheE5p; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wcOO8ROD; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VCJheE5p; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wcOO8ROD; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VCJheE5p";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wcOO8ROD";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VCJheE5p";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wcOO8ROD"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 156861FEF3;
	Wed, 27 Aug 2025 07:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756279761; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=55rWyTtLfvg2uQrV6gLgGau64HQxt1HRyKYy6Unq6XU=;
	b=VCJheE5px+OGt4sXYQIbLOXLtAsutFxyq2/qrDb7t/s/9KOpGklXXUDWPi4k0VD1WqRrEq
	wT4pSAKaM/keyJhS41RJvpGQRuHYzz96ptcPaFFBIZ7EdRruRwQQ7PPHnrCBYsssRhEKTA
	gYTwiTu8E00DIV4NPn761qbdWRxIJ88=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756279761;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=55rWyTtLfvg2uQrV6gLgGau64HQxt1HRyKYy6Unq6XU=;
	b=wcOO8RODolI53ZVm+loF7XWfdTnwfQyPmaUUq3ZcoL7T8nSafnZkA1+yhI9TXmMN/YdP2K
	oV8jr2jYvJUL1nAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756279761; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=55rWyTtLfvg2uQrV6gLgGau64HQxt1HRyKYy6Unq6XU=;
	b=VCJheE5px+OGt4sXYQIbLOXLtAsutFxyq2/qrDb7t/s/9KOpGklXXUDWPi4k0VD1WqRrEq
	wT4pSAKaM/keyJhS41RJvpGQRuHYzz96ptcPaFFBIZ7EdRruRwQQ7PPHnrCBYsssRhEKTA
	gYTwiTu8E00DIV4NPn761qbdWRxIJ88=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756279761;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=55rWyTtLfvg2uQrV6gLgGau64HQxt1HRyKYy6Unq6XU=;
	b=wcOO8RODolI53ZVm+loF7XWfdTnwfQyPmaUUq3ZcoL7T8nSafnZkA1+yhI9TXmMN/YdP2K
	oV8jr2jYvJUL1nAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EE99013A31;
	Wed, 27 Aug 2025 07:29:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2BkCOdCzrmjoagAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 27 Aug 2025 07:29:20 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2 11/25] ALSA: hda/realtek: Use guard() for mutex locks and COEF locks
Date: Wed, 27 Aug 2025 09:28:51 +0200
Message-ID: <20250827072916.31933-12-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250827072916.31933-1-tiwai@suse.de>
References: <20250827072916.31933-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80

Replace the manual mutex lock/unlock pairs with guard().

Also, introduce the guard() for coef_mutex_lock() and _unlock() pairs,
and replace accordingly, too.  The coef_mutex_lock() and *_unlock()
are moved to readtek.h as static inline functions along with it.

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/codecs/realtek/alc268.c  |  3 +--
 sound/hda/codecs/realtek/realtek.c | 37 ++++--------------------------
 sound/hda/codecs/realtek/realtek.h | 21 +++++++++++++++++
 3 files changed, 27 insertions(+), 34 deletions(-)

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
index b6feccfd45a9..d40de0e8a9a3 100644
--- a/sound/hda/codecs/realtek/realtek.c
+++ b/sound/hda/codecs/realtek/realtek.c
@@ -7,26 +7,6 @@
 #include <linux/module.h>
 #include "realtek.h"
 
-/*
- * COEF access helper functions
- */
-
-static void coef_mutex_lock(struct hda_codec *codec)
-{
-	struct alc_spec *spec = codec->spec;
-
-	snd_hda_power_up_pm(codec);
-	mutex_lock(&spec->coef_mutex);
-}
-
-static void coef_mutex_unlock(struct hda_codec *codec)
-{
-	struct alc_spec *spec = codec->spec;
-
-	mutex_unlock(&spec->coef_mutex);
-	snd_hda_power_down_pm(codec);
-}
-
 static int __alc_read_coefex_idx(struct hda_codec *codec, hda_nid_t nid,
 				 unsigned int coef_idx)
 {
@@ -40,12 +20,8 @@ static int __alc_read_coefex_idx(struct hda_codec *codec, hda_nid_t nid,
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
 
@@ -59,9 +35,8 @@ static void __alc_write_coefex_idx(struct hda_codec *codec, hda_nid_t nid,
 void alc_write_coefex_idx(struct hda_codec *codec, hda_nid_t nid,
 			  unsigned int coef_idx, unsigned int coef_val)
 {
-	coef_mutex_lock(codec);
+	guard(coef_mutex)(codec);
 	__alc_write_coefex_idx(codec, nid, coef_idx, coef_val);
-	coef_mutex_unlock(codec);
 }
 EXPORT_SYMBOL_NS_GPL(alc_write_coefex_idx, "SND_HDA_CODEC_REALTEK");
 
@@ -80,9 +55,8 @@ void alc_update_coefex_idx(struct hda_codec *codec, hda_nid_t nid,
 			   unsigned int coef_idx, unsigned int mask,
 			   unsigned int bits_set)
 {
-	coef_mutex_lock(codec);
+	guard(coef_mutex)(codec);
 	__alc_update_coefex_idx(codec, nid, coef_idx, mask, bits_set);
-	coef_mutex_unlock(codec);
 }
 EXPORT_SYMBOL_NS_GPL(alc_update_coefex_idx, "SND_HDA_CODEC_REALTEK");
 
@@ -99,7 +73,7 @@ EXPORT_SYMBOL_NS_GPL(alc_get_coef0, "SND_HDA_CODEC_REALTEK");
 
 void alc_process_coef_fw(struct hda_codec *codec, const struct coef_fw *fw)
 {
-	coef_mutex_lock(codec);
+	guard(coef_mutex)(codec);
 	for (; fw->nid; fw++) {
 		if (fw->mask == (unsigned short)-1)
 			__alc_write_coefex_idx(codec, fw->nid, fw->idx, fw->val);
@@ -107,7 +81,6 @@ void alc_process_coef_fw(struct hda_codec *codec, const struct coef_fw *fw)
 			__alc_update_coefex_idx(codec, fw->nid, fw->idx,
 						fw->mask, fw->val);
 	}
-	coef_mutex_unlock(codec);
 }
 EXPORT_SYMBOL_NS_GPL(alc_process_coef_fw, "SND_HDA_CODEC_REALTEK");
 
diff --git a/sound/hda/codecs/realtek/realtek.h b/sound/hda/codecs/realtek/realtek.h
index ee893da0c486..b2a919904c4c 100644
--- a/sound/hda/codecs/realtek/realtek.h
+++ b/sound/hda/codecs/realtek/realtek.h
@@ -295,4 +295,25 @@ void alc233_alc662_fixup_lenovo_dual_codecs(struct hda_codec *codec,
 void alc_fixup_dell_xps13(struct hda_codec *codec,
 			  const struct hda_fixup *fix, int action);
 
+/*
+ * COEF access helper functions
+ */
+static inline void coef_mutex_lock(struct hda_codec *codec)
+{
+	struct alc_spec *spec = codec->spec;
+
+	snd_hda_power_up_pm(codec);
+	mutex_lock(&spec->coef_mutex);
+}
+
+static inline void coef_mutex_unlock(struct hda_codec *codec)
+{
+	struct alc_spec *spec = codec->spec;
+
+	mutex_unlock(&spec->coef_mutex);
+	snd_hda_power_down_pm(codec);
+}
+
+DEFINE_GUARD(coef_mutex, struct hda_codec *, coef_mutex_lock(_T), coef_mutex_unlock(_T))
+
 #endif /* __HDA_REALTEK_H */
-- 
2.50.1

