Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1968A2D5A16
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142199; cv=none; b=a6ESDTDcJhYioiR4ejfqYmM3mMAWj1Zx2giJiQfELayxdjgyDLHsPhPtRi3hWy3zGBtJkCXkTF3xfLBUhPAVfwxIsos/8ohCqL+7z6CeGNO8S52Horb/ZMaEMCj8vHPCpT6fAcpD/z3JwBe/8Cr6SdN+fS2kHoh6li73lCvUnco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142199; c=relaxed/simple;
	bh=NQ017ZGcT9WA6oE9knRmEmh6+aZJAGoJmUrK77U2d68=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fxH4sqOIocHbZ46Smi7j2fgIxZHwqj/wDPa3KecuEtq5bkNv5hP9vJKqQ9zQqs0i+q1y7b3ZiRcBngO/9P2232KM+2jlkYTbTm4bmmoxrx+K+cvhUamfmi3cv+sjq5ouwAiZXjNq7Ci9tdJSwGU9N7mRLqr5PBwFl7wlMxf7B34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jhQGEBYX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=e36lJWbw; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jhQGEBYX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=e36lJWbw; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jhQGEBYX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="e36lJWbw";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jhQGEBYX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="e36lJWbw"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3654F21194;
	Thu, 10 Jul 2025 10:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142061; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ktZ/+kzbaAZJwH6nBuYEe6ji5HY6YIgUbh6cJrg1CRg=;
	b=jhQGEBYXrf0DxNDMKgW4NzzUnlQ+kCMF0t0b7Nnfg5cfSWgV4Olo5eVtr9DC0hDc10Un05
	WLdkPtIRWDimx9/U5TVMIyEcr1sn3oxuaL49+R5rnLxTze2mB1FjWMjlETpCWFLuk8n8OH
	ncv5/HmkDUPlwMKnHkYxE+9O1K3ONAo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142061;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ktZ/+kzbaAZJwH6nBuYEe6ji5HY6YIgUbh6cJrg1CRg=;
	b=e36lJWbwgS1vVI2YQTGTRBy8u7zpxCkA91j1jM02xRx5Uf00ONeT/k/nrt60QLDlrcBIHg
	ItkulhRQ3XH3txAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142061; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ktZ/+kzbaAZJwH6nBuYEe6ji5HY6YIgUbh6cJrg1CRg=;
	b=jhQGEBYXrf0DxNDMKgW4NzzUnlQ+kCMF0t0b7Nnfg5cfSWgV4Olo5eVtr9DC0hDc10Un05
	WLdkPtIRWDimx9/U5TVMIyEcr1sn3oxuaL49+R5rnLxTze2mB1FjWMjlETpCWFLuk8n8OH
	ncv5/HmkDUPlwMKnHkYxE+9O1K3ONAo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142061;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ktZ/+kzbaAZJwH6nBuYEe6ji5HY6YIgUbh6cJrg1CRg=;
	b=e36lJWbwgS1vVI2YQTGTRBy8u7zpxCkA91j1jM02xRx5Uf00ONeT/k/nrt60QLDlrcBIHg
	ItkulhRQ3XH3txAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1C96E13AAB;
	Thu, 10 Jul 2025 10:07:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AL/RBe2Qb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:41 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 033/103] ALSA: opl3sa2: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:06:15 +0200
Message-ID: <20250710100727.22653-34-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80

Use a safer function strscpy() instead of strcpy() for copying to
arrays.

Only idiomatic code replacement, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/opl3sa2.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/sound/isa/opl3sa2.c b/sound/isa/opl3sa2.c
index a5ed5aa0606f..5e8e1326d5c0 100644
--- a/sound/isa/opl3sa2.c
+++ b/sound/isa/opl3sa2.c
@@ -488,30 +488,30 @@ static int snd_opl3sa2_mixer(struct snd_card *card)
 	memset(&id2, 0, sizeof(id2));
 	id1.iface = id2.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
 	/* reassign AUX0 to CD */
-        strcpy(id1.name, "Aux Playback Switch");
-        strcpy(id2.name, "CD Playback Switch");
+        strscpy(id1.name, "Aux Playback Switch");
+        strscpy(id2.name, "CD Playback Switch");
 	err = snd_ctl_rename_id(card, &id1, &id2);
 	if (err < 0) {
 		dev_err(card->dev, "Cannot rename opl3sa2 control\n");
                 return err;
 	}
-        strcpy(id1.name, "Aux Playback Volume");
-        strcpy(id2.name, "CD Playback Volume");
+        strscpy(id1.name, "Aux Playback Volume");
+        strscpy(id2.name, "CD Playback Volume");
 	err = snd_ctl_rename_id(card, &id1, &id2);
 	if (err < 0) {
 		dev_err(card->dev, "Cannot rename opl3sa2 control\n");
                 return err;
 	}
 	/* reassign AUX1 to FM */
-        strcpy(id1.name, "Aux Playback Switch"); id1.index = 1;
-        strcpy(id2.name, "FM Playback Switch");
+        strscpy(id1.name, "Aux Playback Switch"); id1.index = 1;
+        strscpy(id2.name, "FM Playback Switch");
 	err = snd_ctl_rename_id(card, &id1, &id2);
 	if (err < 0) {
 		dev_err(card->dev, "Cannot rename opl3sa2 control\n");
                 return err;
 	}
-        strcpy(id1.name, "Aux Playback Volume");
-        strcpy(id2.name, "FM Playback Volume");
+        strscpy(id1.name, "Aux Playback Volume");
+        strscpy(id2.name, "FM Playback Volume");
 	err = snd_ctl_rename_id(card, &id1, &id2);
 	if (err < 0) {
 		dev_err(card->dev, "Cannot rename opl3sa2 control\n");
@@ -618,8 +618,8 @@ static int snd_opl3sa2_card_new(struct device *pdev, int dev,
 				sizeof(struct snd_opl3sa2), &card);
 	if (err < 0)
 		return err;
-	strcpy(card->driver, "OPL3SA2");
-	strcpy(card->shortname, "Yamaha OPL3-SA");
+	strscpy(card->driver, "OPL3SA2");
+	strscpy(card->shortname, "Yamaha OPL3-SA");
 	chip = card->private_data;
 	spin_lock_init(&chip->reg_lock);
 	chip->irq = -1;
-- 
2.50.0

