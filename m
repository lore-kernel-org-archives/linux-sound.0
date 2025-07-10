Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12B82D5C77
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142236; cv=none; b=mYf8U93ZtelqUdsO03q0WlduxUXOIxdLZDMaqxAh3FTvX2cvi/leh8ie6sNVDEBnvs7iQNqdC/VN2loDJmqxWFWE28++SIllUeosllbfacuVNahXFYjY7yEEX1VmG3Z/dq+sik5jFcZDRvcMZpBdfuXp5A35jGw52KKS8kd/Vxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142236; c=relaxed/simple;
	bh=WKIlis1z7E69T4hDltsVSMi0cZbZfiiagZ8CWMTQEqI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ePWH4LdGwTPuxnZA7GPibGKd8pSwEICoeJtjGm/jqK6rzSS6N9xpZmBnp76dg7hKr3pWaoxWrqRQxBB9DXEA813LYAcBipi1YPxLPE49EqJCciLFp81F/6kJzTyyb5ffNBCavFAjSv8g9QVS2QCS6IbCyqfyPWrXVruOlM9z3fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Zo0MsVEA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pRjhXu09; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Zo0MsVEA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pRjhXu09; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Zo0MsVEA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pRjhXu09";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Zo0MsVEA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pRjhXu09"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 946981F750;
	Thu, 10 Jul 2025 10:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142066; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hzTOqoQxd5S8nRDuvDm6bQZrIqiVK5KicoGXxvp/MPs=;
	b=Zo0MsVEA+G8Sr35+HZyTeWeUj7faVk2Gt3eU5txmhJtoR5EJjnAIioW5i2CYoZ52e8OVHP
	jevxVZXXOMxg4v3pSNpO/2OPRCD1LBBSkwmMmDHGzk0PRurVs32CRr747MSM1Lhmdid02H
	RrhrrNZ5hIIgC8XPBJtd3Cn9+mQ/I/s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142066;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hzTOqoQxd5S8nRDuvDm6bQZrIqiVK5KicoGXxvp/MPs=;
	b=pRjhXu09ZDYCfRlhMrfYzbtK/5n0I1Tal+VXNEvbcgcQZZnwbkbEQG89NkfsqEVcnB7UCF
	/JGIKftNdU5bIpAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142066; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hzTOqoQxd5S8nRDuvDm6bQZrIqiVK5KicoGXxvp/MPs=;
	b=Zo0MsVEA+G8Sr35+HZyTeWeUj7faVk2Gt3eU5txmhJtoR5EJjnAIioW5i2CYoZ52e8OVHP
	jevxVZXXOMxg4v3pSNpO/2OPRCD1LBBSkwmMmDHGzk0PRurVs32CRr747MSM1Lhmdid02H
	RrhrrNZ5hIIgC8XPBJtd3Cn9+mQ/I/s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142066;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hzTOqoQxd5S8nRDuvDm6bQZrIqiVK5KicoGXxvp/MPs=;
	b=pRjhXu09ZDYCfRlhMrfYzbtK/5n0I1Tal+VXNEvbcgcQZZnwbkbEQG89NkfsqEVcnB7UCF
	/JGIKftNdU5bIpAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 712AA13A70;
	Thu, 10 Jul 2025 10:07:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GMxlGvKQb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:46 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 073/103] ALSA: mixart: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:06:55 +0200
Message-ID: <20250710100727.22653-74-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLsqo7dymd5dgmoaprf5rep8is)];
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
 sound/pci/mixart/mixart.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/pci/mixart/mixart.c b/sound/pci/mixart/mixart.c
index 7ceaf6a7a77e..cdc0ba5dd1ad 100644
--- a/sound/pci/mixart/mixart.c
+++ b/sound/pci/mixart/mixart.c
@@ -970,7 +970,7 @@ static int snd_mixart_pcm_analog(struct snd_mixart *chip)
 
 	pcm->info_flags = 0;
 	pcm->nonatomic = true;
-	strcpy(pcm->name, name);
+	strscpy(pcm->name, name);
 
 	preallocate_buffers(chip, pcm);
 
@@ -1004,7 +1004,7 @@ static int snd_mixart_pcm_digital(struct snd_mixart *chip)
 
 	pcm->info_flags = 0;
 	pcm->nonatomic = true;
-	strcpy(pcm->name, name);
+	strscpy(pcm->name, name);
 
 	preallocate_buffers(chip, pcm);
 
@@ -1330,7 +1330,7 @@ static int snd_mixart_probe(struct pci_dev *pci,
 			return err;
 		}
 
-		strcpy(card->driver, CARD_NAME);
+		strscpy(card->driver, CARD_NAME);
 		snprintf(card->shortname, sizeof(card->shortname),
 			 "Digigram miXart [PCM #%d]", i);
 		snprintf(card->longname, sizeof(card->longname),
-- 
2.50.0

