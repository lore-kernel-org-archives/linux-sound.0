Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C401F131C
	for <linux-sound@vger.kernel.org>; Tue,  7 Jan 2025 15:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736265420; cv=none; b=fqpFEtyXFXzX7B9tA2c3DGBybIjli6Sylhyw0WfdGrLs6vrZLKyWAxZoVU3pPI3F5OfDu6kfG5yNrxoIG7cQZVqY6F8fvLN9wGnhJepZZ4E3mTqpVEQbM73wFwHrDCu4qk4x8e3EA8VtHG/6zX7aKlYxbrhoi0so4efoc9YBspo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736265420; c=relaxed/simple;
	bh=yCfESsXSZM1VgIRsqTEaF6jFI2fAhlD5jflz2hXXFoU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sh5uNFOdy7sBV3gPiBBMubv8410gbHvBdPM/Dxqth4dTJz9jjP+g9nXJSUDUgWFLHbXAOswwne3GPiwBpAKymoxwBmkN2j5eQ/HrHQo35Z7ZLUx64qpxlnnAKLh52slWDU3VD5JeE3feXoKQS0Z3azmPm+jHXcd/r5A9pvAgkLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=y7oNGytB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JcZqd17/; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=y7oNGytB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JcZqd17/; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="y7oNGytB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JcZqd17/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="y7oNGytB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JcZqd17/"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 97F771F390;
	Tue,  7 Jan 2025 15:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736265415; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jk4ZvhLgACBLnZU6knZnBpFftV27uPNst31N69gUf5Y=;
	b=y7oNGytB9oTcf6ZMLofOV0AEt53Mk8aisIQmjUJu9Ck/5IiwRIPX6jdctmW45NmyutPg3S
	V5PiW+zI+EouXrC8H7MobUC9ob8yCv4I8e2Bs13hax7hrFKjrDhlxAnVKGqmRH13jf65IG
	WTSCl+ksncpSn/a9C7Uij68mHFVLnkI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736265415;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jk4ZvhLgACBLnZU6knZnBpFftV27uPNst31N69gUf5Y=;
	b=JcZqd17/M59CX970hqemabqjLkYTTArp0WnecPDGOWg+jHD7uudweB/60jNhbdUoapttCg
	Mi0ddxz1UbSA4MAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=y7oNGytB;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="JcZqd17/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736265415; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jk4ZvhLgACBLnZU6knZnBpFftV27uPNst31N69gUf5Y=;
	b=y7oNGytB9oTcf6ZMLofOV0AEt53Mk8aisIQmjUJu9Ck/5IiwRIPX6jdctmW45NmyutPg3S
	V5PiW+zI+EouXrC8H7MobUC9ob8yCv4I8e2Bs13hax7hrFKjrDhlxAnVKGqmRH13jf65IG
	WTSCl+ksncpSn/a9C7Uij68mHFVLnkI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736265415;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jk4ZvhLgACBLnZU6knZnBpFftV27uPNst31N69gUf5Y=;
	b=JcZqd17/M59CX970hqemabqjLkYTTArp0WnecPDGOWg+jHD7uudweB/60jNhbdUoapttCg
	Mi0ddxz1UbSA4MAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7DAAF13A6A;
	Tue,  7 Jan 2025 15:56:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id sGRuHcdOfWfNUwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 07 Jan 2025 15:56:55 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 6/7] ALSA: seq: oss: Simplify with str_enabled_disabled()
Date: Tue,  7 Jan 2025 16:56:36 +0100
Message-ID: <20250107155641.4435-7-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250107155641.4435-1-tiwai@suse.de>
References: <20250107155641.4435-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 97F771F390
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_NONE(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

Use the standard helper str_enabled_disabled() to simplify the code.
Only code refactoring, no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/oss/seq_oss_device.h | 4 ----
 sound/core/seq/oss/seq_oss_init.c   | 6 ------
 sound/core/seq/oss/seq_oss_synth.c  | 4 ++--
 3 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/sound/core/seq/oss/seq_oss_device.h b/sound/core/seq/oss/seq_oss_device.h
index c0b1cce127a3..6163a00bc8de 100644
--- a/sound/core/seq/oss/seq_oss_device.h
+++ b/sound/core/seq/oss/seq_oss_device.h
@@ -156,8 +156,4 @@ snd_seq_oss_fill_addr(struct seq_oss_devinfo *dp, struct snd_seq_event *ev,
 	ev->dest.port = dest_port;
 }
 
-
-/* misc. functions for proc interface */
-char *enabled_str(bool b);
-
 #endif /* __SEQ_OSS_DEVICE_H */
diff --git a/sound/core/seq/oss/seq_oss_init.c b/sound/core/seq/oss/seq_oss_init.c
index e0733efba027..e6d7d83ed0e7 100644
--- a/sound/core/seq/oss/seq_oss_init.c
+++ b/sound/core/seq/oss/seq_oss_init.c
@@ -449,12 +449,6 @@ snd_seq_oss_reset(struct seq_oss_devinfo *dp)
 /*
  * misc. functions for proc interface
  */
-char *
-enabled_str(bool b)
-{
-	return b ? "enabled" : "disabled";
-}
-
 static const char *
 filemode_str(int val)
 {
diff --git a/sound/core/seq/oss/seq_oss_synth.c b/sound/core/seq/oss/seq_oss_synth.c
index 02a90c960992..9de47e098b29 100644
--- a/sound/core/seq/oss/seq_oss_synth.c
+++ b/sound/core/seq/oss/seq_oss_synth.c
@@ -608,8 +608,8 @@ snd_seq_oss_synth_info_read(struct snd_info_buffer *buf)
 			    rec->synth_type, rec->synth_subtype,
 			    rec->nr_voices);
 		snd_iprintf(buf, "  capabilities : ioctl %s / load_patch %s\n",
-			    enabled_str((long)rec->oper.ioctl),
-			    enabled_str((long)rec->oper.load_patch));
+			    str_enabled_disabled((long)rec->oper.ioctl),
+			    str_enabled_disabled((long)rec->oper.load_patch));
 		snd_use_lock_free(&rec->use_lock);
 	}
 }
-- 
2.43.0

