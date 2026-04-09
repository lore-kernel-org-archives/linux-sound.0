Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E8438239F
	for <linux-sound@vger.kernel.org>; Thu,  9 Apr 2026 09:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775727516; cv=none; b=aypU9o3O+lSJwNavFOMCuJwJmoUsBMREct7dyNA5eWAH1+7+NgSXUh6GPtAyEVR/zhR2UhEDd0ky7zqAz0mr5waWO44MMUGx6tQ44g/09Q0Hc47LGwIt9qnZXL77EyAK9CGuxNtAxE4uD2en529Qnvl2S0ABhgCKtj88SVUjDEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775727516; c=relaxed/simple;
	bh=CyyHLVXlOhQzZmbO2TSdGLN0UO6YxwAFTchnIHmcoy4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZmDzFaDB4lpZHqMLzFpVAOFrgVVVcxp1Kmey0TzqP4zKU2K++mWvI5puuY2uMl5Kc/HiLlX+259mPcS694ruERY3Z1fzOmQ8E6Nz8Lkg3pDp2yiobUhSP9hbE+5/MFbHleIvWh0nlvHLbuuGUKNvUHLFD5JNf3ccYFbUvZpdZfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HePZg0Qu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vNybTHEd; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HePZg0Qu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vNybTHEd; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HePZg0Qu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vNybTHEd";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HePZg0Qu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vNybTHEd"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 836F35BD20;
	Thu,  9 Apr 2026 09:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775727510; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A33WQd5cLxdtEGTxyCiJPVYqtxgiGDqfM2TwPnEmCtE=;
	b=HePZg0QuId6O81ocpsirynP/vLaZpa9oSTXpFHF/PryXxIm6+sxBjipW/KnXzaK5cYaE2q
	sxZNraeswLQvuudXL4HX1wG9hD6I7S0u5cUD+L3TknMVKuQPKafokAD/lgeTO/t1RnFNvG
	PIJtZa5gZ+Q3+YJWvZcMzFJvDfRhXYo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775727510;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A33WQd5cLxdtEGTxyCiJPVYqtxgiGDqfM2TwPnEmCtE=;
	b=vNybTHEdejnBMcWy+Dl9Flc2Xe/UTguoOPgFQGVHip1UwVeAPvJXAkUQZK+2WSX6afHuis
	jHQjeL0Kcwxf3zDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=HePZg0Qu;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=vNybTHEd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775727510; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A33WQd5cLxdtEGTxyCiJPVYqtxgiGDqfM2TwPnEmCtE=;
	b=HePZg0QuId6O81ocpsirynP/vLaZpa9oSTXpFHF/PryXxIm6+sxBjipW/KnXzaK5cYaE2q
	sxZNraeswLQvuudXL4HX1wG9hD6I7S0u5cUD+L3TknMVKuQPKafokAD/lgeTO/t1RnFNvG
	PIJtZa5gZ+Q3+YJWvZcMzFJvDfRhXYo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775727510;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A33WQd5cLxdtEGTxyCiJPVYqtxgiGDqfM2TwPnEmCtE=;
	b=vNybTHEdejnBMcWy+Dl9Flc2Xe/UTguoOPgFQGVHip1UwVeAPvJXAkUQZK+2WSX6afHuis
	jHQjeL0Kcwxf3zDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6AEF44A0B3;
	Thu,  9 Apr 2026 09:38:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iL/0GJZz12mdWgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 09 Apr 2026 09:38:30 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 04/10] ALSA: hda/alc662: Simplify the quirk for CSL Unity BF24B
Date: Thu,  9 Apr 2026 11:38:17 +0200
Message-ID: <20260409093826.1317626-5-tiwai@suse.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260409093826.1317626-1-tiwai@suse.de>
References: <20260409093826.1317626-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_NONE(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 836F35BD20

The previous implementation of the quirk for CSL Unity BF24B in commit
de65275fc94e ("ALSA: hda/realtek: Add quirk for CSL Unity BF24B")
introduced the unnecessary GPIO caching which leads to a superfluous
write at each init/resume.

Use the new helper to write GPIO bits directly for optimization.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/codecs/realtek/alc662.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/sound/hda/codecs/realtek/alc662.c b/sound/hda/codecs/realtek/alc662.c
index 3abe41c7315c..2cf3664a35ff 100644
--- a/sound/hda/codecs/realtek/alc662.c
+++ b/sound/hda/codecs/realtek/alc662.c
@@ -258,19 +258,11 @@ static void alc_fixup_headset_mode_alc668(struct hda_codec *codec,
 static void alc662_fixup_csl_amp(struct hda_codec *codec,
 				 const struct hda_fixup *fix, int action)
 {
-	struct alc_spec *spec = codec->spec;
-
-	switch (action) {
-	case HDA_FIXUP_ACT_PRE_PROBE:
-		spec->gpio_mask |= 0x03;
-		spec->gpio_dir |= 0x03;
-		break;
-	case HDA_FIXUP_ACT_INIT:
+	if (action == HDA_FIXUP_ACT_INIT) {
 		/* need to toggle GPIO to enable the amp */
-		alc_update_gpio_data(codec, 0x03, true);
+		snd_hda_codec_set_gpio(codec, 0x03, 0x03, 0x03, 0);
 		msleep(100);
-		alc_update_gpio_data(codec, 0x03, false);
-		break;
+		snd_hda_codec_set_gpio(codec, 0x03, 0x03, 0x00, 0);
 	}
 }
 
-- 
2.53.0

