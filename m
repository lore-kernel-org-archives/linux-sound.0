Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F7273463
	for <linux-sound@vger.kernel.org>; Sun, 14 Jun 2026 09:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781427921; cv=none; b=GkfMaHRqpRFNZG49yqhho5oWH2Ji5no3KaQ910bRa/AHR+bf2LL7HBDwPxNEP36H+R1ONHE6zk6ZgJLNF12inuKrCLt57Aqf1732UjlA++Da8ZFfVzAj0K2IIszqtk4SVcVBPkSI8KHzAhSCnXwsOjICXChdpEohhqU8zrv4Vb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781427921; c=relaxed/simple;
	bh=xyLqePwJr8YgLCFofi9BbrqwNN24bqXpzYrSJOz+m8k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QS2DNk7zAkQJLm8HfgBFfSSIVukSN/2lDgwQ6jlNG2fZmB+iDqAKBBs+c4Ed3k03HivMjkDsWG4OCplbPo+LnsRRtuCUQ1DCfPe6AJjcxCyakeMTrr/wbJDBVlJhsrDs05RsiDB/6Y6trnNdxzEiJTz2zx28ZtzYbb4KA+xLHBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0HuayWRH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=53MdCwcE; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0HuayWRH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=53MdCwcE; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0HuayWRH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="53MdCwcE";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0HuayWRH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="53MdCwcE"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 164947584F;
	Sun, 14 Jun 2026 09:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781427912; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=IgJrQ97JWfZ08i7VGX+L+5DZZ3pOtrSIcukPRkIrZ6I=;
	b=0HuayWRHkCE7SMpuoJbO5pPzu8KakINqF6HZII+/iWwoPZUlgDpwiWtTmubx2zvE7xQQkX
	gZ0QBw/cwUdalfxMjqqYckJC85AMugpy1sJQ/sItWLSumBbtZ0LvWoCNmO7cZKh2Pxt3kT
	xL7JnGJAyRR27AhJuoisZK9HRK1zGOs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781427912;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=IgJrQ97JWfZ08i7VGX+L+5DZZ3pOtrSIcukPRkIrZ6I=;
	b=53MdCwcE2+mclQXcYxasP3Lvs/tdRECRPCbycCWq6tREW2Dra1zGPEmnzvs+KdOnNT3d94
	IZAiMZvLlzT9ugDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781427912; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=IgJrQ97JWfZ08i7VGX+L+5DZZ3pOtrSIcukPRkIrZ6I=;
	b=0HuayWRHkCE7SMpuoJbO5pPzu8KakINqF6HZII+/iWwoPZUlgDpwiWtTmubx2zvE7xQQkX
	gZ0QBw/cwUdalfxMjqqYckJC85AMugpy1sJQ/sItWLSumBbtZ0LvWoCNmO7cZKh2Pxt3kT
	xL7JnGJAyRR27AhJuoisZK9HRK1zGOs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781427912;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=IgJrQ97JWfZ08i7VGX+L+5DZZ3pOtrSIcukPRkIrZ6I=;
	b=53MdCwcE2+mclQXcYxasP3Lvs/tdRECRPCbycCWq6tREW2Dra1zGPEmnzvs+KdOnNT3d94
	IZAiMZvLlzT9ugDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E0C84779A7;
	Sun, 14 Jun 2026 09:05:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id TfVoNcduLmrPaQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 14 Jun 2026 09:05:11 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	WenTao Liang <vulab@iscas.ac.cn>
Subject: [PATCH] ALSA: core: Fix unintuitive behavior of snd_power_ref_and_wait()
Date: Sun, 14 Jun 2026 11:05:05 +0200
Message-ID: <20260614090507.772540-1-tiwai@suse.de>
X-Mailer: git-send-email 2.54.0
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
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 
X-Spam-Score: -2.80

snd_power_ref_and_wait() takes the power refcount and doesn't leave it
no matter whether it returns an error or not.  However, the majority
of callers don't expect but just returns without unreferencing in the
caller side upon errors.

For addressing the potential refcount unbalance, rather correct the
behavior of snd_power_ref_wait() to unreference upon returning an
error.

Note that the problem above is likely negligible; the function returns
an error only when the sound card is being shutdown, hence it doesn't
matter about the power refcount any longer at such a state.

Fixes: e94fdbd7b25d ("ALSA: control: Track in-flight control read/write/tlv accesses")
Reported-by: WenTao Liang <vulab@iscas.ac.cn>
Closes: https://lore.kernel.org/20260612022121.14329-1-vulab@iscas.ac.cn
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/init.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/sound/core/init.c b/sound/core/init.c
index ed5af4e0ec10..56dde5bd73c4 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -1139,7 +1139,7 @@ EXPORT_SYMBOL(snd_card_file_remove);
  * typically around calling control ops.
  *
  * The caller needs to pull down the refcount via snd_power_unref() later
- * no matter whether the error is returned from this function or not.
+ * when this function returns 0.
  *
  * Return: Zero if successful, or a negative error code.
  */
@@ -1152,7 +1152,11 @@ int snd_power_ref_and_wait(struct snd_card *card)
 		       card->shutdown ||
 		       snd_power_get_state(card) == SNDRV_CTL_POWER_D0,
 		       snd_power_unref(card), snd_power_ref(card));
-	return card->shutdown ? -ENODEV : 0;
+	if (card->shutdown) {
+		snd_power_unref(card);
+		return  -ENODEV;
+	}
+	return 0;
 }
 EXPORT_SYMBOL_GPL(snd_power_ref_and_wait);
 
@@ -1169,7 +1173,8 @@ int snd_power_wait(struct snd_card *card)
 	int ret;
 
 	ret = snd_power_ref_and_wait(card);
-	snd_power_unref(card);
+	if (!ret)
+		snd_power_unref(card);
 	return ret;
 }
 EXPORT_SYMBOL(snd_power_wait);
-- 
2.54.0

