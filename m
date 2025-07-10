Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87BD2D6413
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142334; cv=none; b=cp1R82nNDGUYU2DLZJ6uW/89OW7ewVAw9Qq2zaPqUDLGcVXvCztRiL/1ORGagkyJ36x5LZF+IocniRLFFpjQXbfTGqw/SJtK1mYzxsgRv/CcUDgMZZ/YGLed2uG0Guu337dRKvLJaSWl1LbJALuKpA9jH2IlSQ0ep/iOhRKdoec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142334; c=relaxed/simple;
	bh=F6CmFkUY7jZRGZoXNJlBVOQXmgPYJrYHSNzkzOKUwAE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hDvi1NzQYo5dNwIrL6TtRTEAzMMAO/SLhRTt7bWD1bkdwHRCQyoGHArdqb6sQ0c1ZGOm2+/y9Y89JGVP0YpKv47BQUG1s2Sq+XKJjEBnJ40Ii4QTSIRvAu1PO61o+TkYhUInP79mgR5ocNFfWrQLg1vIcmXnhh1Sa5TtDmucj8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=q+hQg4dR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Nlvi85yD; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=q+hQg4dR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Nlvi85yD; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="q+hQg4dR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Nlvi85yD";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="q+hQg4dR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Nlvi85yD"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B832A1F78F;
	Thu, 10 Jul 2025 10:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142070; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OPRpEDQumAsqW1YW/QnGF0vInf+8dNRgIa0HUMdn7P8=;
	b=q+hQg4dRY3gvVU076shweKIEO05wWDvGtPooAusjNtBO/1A4ByuRRf7oUqnkaX4St2dzX2
	Nw83sksh8+8UDA5SCYgjc0k3KC0gGflX2+yvSlD1Cjy4/dB6OjM8/7cB4A6cXMogICFpB/
	lzCJ6SCesOzbzZFGWXh5t0kCKexl9ZY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142070;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OPRpEDQumAsqW1YW/QnGF0vInf+8dNRgIa0HUMdn7P8=;
	b=Nlvi85yD23EUSJiJwPwFmi97wY2/fokw1IoYFBH5pEJnVziz5NQBLZ0JI+UytRi371rvxP
	PTqKavKtbyqMwsBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=q+hQg4dR;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Nlvi85yD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142070; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OPRpEDQumAsqW1YW/QnGF0vInf+8dNRgIa0HUMdn7P8=;
	b=q+hQg4dRY3gvVU076shweKIEO05wWDvGtPooAusjNtBO/1A4ByuRRf7oUqnkaX4St2dzX2
	Nw83sksh8+8UDA5SCYgjc0k3KC0gGflX2+yvSlD1Cjy4/dB6OjM8/7cB4A6cXMogICFpB/
	lzCJ6SCesOzbzZFGWXh5t0kCKexl9ZY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142070;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OPRpEDQumAsqW1YW/QnGF0vInf+8dNRgIa0HUMdn7P8=;
	b=Nlvi85yD23EUSJiJwPwFmi97wY2/fokw1IoYFBH5pEJnVziz5NQBLZ0JI+UytRi371rvxP
	PTqKavKtbyqMwsBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A071213A70;
	Thu, 10 Jul 2025 10:07:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id cOnzJfaQb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:50 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 103/103] ALSA: core: Copy string more safely
Date: Thu, 10 Jul 2025 12:07:25 +0200
Message-ID: <20250710100727.22653-104-tiwai@suse.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250710100727.22653-1-tiwai@suse.de>
References: <20250710100727.22653-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLe1mc1hwayk397878n5a1j337)];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: B832A1F78F
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

Replace the remaining strcpy() and sprintf() usages in the ALSA core
code with the safer versions.

The first strcpy() points actually to card->id, hence just use
strscpy() with card->id instead.

The append of suffix string is slightly rewritten so that we can use
scnprintf() and strscpy().

Only for safety, no actual behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/init.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/sound/core/init.c b/sound/core/init.c
index 114fb87de990..c372b3228785 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -723,27 +723,25 @@ static void snd_card_set_id_no_lock(struct snd_card *card, const char *src,
 	 * ("card" conflicts with proc directories)
 	 */
 	if (!*id || !strncmp(id, "card", 4)) {
-		strcpy(id, "Default");
+		strscpy(card->id, "Default");
 		is_default = true;
 	}
 
 	len = strlen(id);
 	for (loops = 0; loops < SNDRV_CARDS; loops++) {
-		char *spos;
 		char sfxstr[5]; /* "_012" */
-		int sfxlen;
+		int sfxlen, slen;
 
 		if (card_id_ok(card, id))
 			return; /* OK */
 
 		/* Add _XYZ suffix */
-		sprintf(sfxstr, "_%X", loops + 1);
-		sfxlen = strlen(sfxstr);
+		sfxlen = scnprintf(sfxstr, sizeof(sfxstr), "_%X", loops + 1);
 		if (len + sfxlen >= sizeof(card->id))
-			spos = id + sizeof(card->id) - sfxlen - 1;
+			slen = sizeof(card->id) - sfxlen - 1;
 		else
-			spos = id + len;
-		strcpy(spos, sfxstr);
+			slen = len;
+		strscpy(id + slen, sfxstr, sizeof(card->id) - slen);
 	}
 	/* fallback to the default id */
 	if (!is_default) {
@@ -801,7 +799,7 @@ static ssize_t id_store(struct device *dev, struct device_attribute *attr,
 	guard(mutex)(&snd_card_mutex);
 	if (!card_id_ok(NULL, buf1))
 		return -EEXIST;
-	strcpy(card->id, buf1);
+	strscpy(card->id, buf1);
 	snd_info_card_id_change(card);
 
 	return count;
-- 
2.50.0

