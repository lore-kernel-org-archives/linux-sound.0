Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B8629E110
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 14:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756479200; cv=none; b=r91Iwyf1gBitGE7Cv8SnJTuetuWBcy2qTPphFhmiy5opG783Cv4FDCdfAvzPQ+h+7Nw1qmGjwgw/7qQ3d5WXYI7BUkbDWORC60C4uvWOlEOtc4LQW9drulVZANhx+EFRxmINeGxtAbwzE/M47U2aXI3jObkC6r9+B1OJuFCEOrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756479200; c=relaxed/simple;
	bh=EmKeJNYpyZwm0vUSjsd++oVude1fVw8SVa3vA6fIENQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V3T9qYCxlrWMqvdIuhSkVMSrBgHdd7S4zIxKSm90uqn5QsZj5GilQ3z4Tk8KfNtVB1jQGn5QFXkJH+nUvNy7JxhseSWOip7tNp1zzsjnpHm/PfV1A53QABRipcAXnzTSIE5eapu4+Dt7jvCg1OLqexn8+y6kpwrZ+8P+E+2B/VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mlHBq1UZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=OJMWSJx3; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mlHBq1UZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=OJMWSJx3; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mlHBq1UZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OJMWSJx3";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mlHBq1UZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OJMWSJx3"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 109275C241;
	Fri, 29 Aug 2025 14:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756479191; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JVQg+Z+r96q6l6goo/9N8e71aKSUFbayi/JLLd288hE=;
	b=mlHBq1UZ1vd3hNjbwe67xx9NJo/zoFBDgWCMhJWgfoyxO9qxkM5G2YYp7Qlp89yhCUQl6P
	vLt0QliZGmRem0iYgW+fotTveNNaVvexXhxzWvyk58+RbT/sKLlbe7TUpVXesHIo6lw8VQ
	sv1bZeyb4I7rLqTa+NU7AAvsJPgLlyU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756479191;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JVQg+Z+r96q6l6goo/9N8e71aKSUFbayi/JLLd288hE=;
	b=OJMWSJx3bqKvRPSS5LIGnWWakAtzdAEXP1ZzpFhPzcYm/+p2GPobeHhK1UkHE3ufB+NPya
	kaqNo29zxWtrvUBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=mlHBq1UZ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=OJMWSJx3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756479191; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JVQg+Z+r96q6l6goo/9N8e71aKSUFbayi/JLLd288hE=;
	b=mlHBq1UZ1vd3hNjbwe67xx9NJo/zoFBDgWCMhJWgfoyxO9qxkM5G2YYp7Qlp89yhCUQl6P
	vLt0QliZGmRem0iYgW+fotTveNNaVvexXhxzWvyk58+RbT/sKLlbe7TUpVXesHIo6lw8VQ
	sv1bZeyb4I7rLqTa+NU7AAvsJPgLlyU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756479191;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JVQg+Z+r96q6l6goo/9N8e71aKSUFbayi/JLLd288hE=;
	b=OJMWSJx3bqKvRPSS5LIGnWWakAtzdAEXP1ZzpFhPzcYm/+p2GPobeHhK1UkHE3ufB+NPya
	kaqNo29zxWtrvUBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id ECDCA13A72;
	Fri, 29 Aug 2025 14:53:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kHehONa+sWhzGwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 14:53:10 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 03/18] ALSA: cs423x: Use guard() for mutex locks
Date: Fri, 29 Aug 2025 16:52:43 +0200
Message-ID: <20250829145300.5460-4-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829145300.5460-1-tiwai@suse.de>
References: <20250829145300.5460-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 109275C241
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
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
 sound/isa/cs423x/cs4236_lib.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/isa/cs423x/cs4236_lib.c b/sound/isa/cs423x/cs4236_lib.c
index eaaf39aae526..bf5b0ffb9273 100644
--- a/sound/isa/cs423x/cs4236_lib.c
+++ b/sound/isa/cs423x/cs4236_lib.c
@@ -956,7 +956,7 @@ static int snd_cs4236_put_iec958_switch(struct snd_kcontrol *kcontrol, struct sn
 	
 	enable = ucontrol->value.integer.value[0] & 1;
 
-	mutex_lock(&chip->mce_mutex);
+	guard(mutex)(&chip->mce_mutex);
 	snd_wss_mce_up(chip);
 	spin_lock_irqsave(&chip->reg_lock, flags);
 	val = (chip->image[CS4231_ALT_FEATURE_1] & ~0x0e) | (0<<2) | (enable << 1);
@@ -969,7 +969,6 @@ static int snd_cs4236_put_iec958_switch(struct snd_kcontrol *kcontrol, struct sn
 	snd_cs4236_ctrl_out(chip, 4, val);
 	spin_unlock_irqrestore(&chip->reg_lock, flags);
 	snd_wss_mce_down(chip);
-	mutex_unlock(&chip->mce_mutex);
 
 #if 0
 	dev_dbg(chip->card->dev,
-- 
2.50.1

