Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B278322773
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 15:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756480473; cv=none; b=IA50uvRnWqJlObm/szgZHrg+JcARjFYEShlHlDRkHSJ1EYwnB7Hu7kGA5lAaG3yqhNrvXqamLcp54Mzi5wnfkoSuKSbWDfGpkJMYcSTg2x8EB3lL3UkWEEwXdtIOrNFpg6lEU/UCxmFH1qarm2IiDxG3xf9UpMh0IfkDmXqSgwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756480473; c=relaxed/simple;
	bh=ua0YoQZs81EFLUvCWhNPzVDH9hFRO/Jo6kczHHVD1F4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hlfzUsoDzu9CaZtwatouswgK6wJjO5irNNHIfgjHXjlrR05/3PXE9uRsxDEqyaCZKCjWrlZivGbTnTvOM162CyRCfMg7AX2mAPzIxfO+XB8vXhg0MpsYfzHhBdggIZnAyCe+Efrt/XOdES/qzacotxnsRQgQ189XfByyGnHVxl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Cl0DYX/L; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=DaBJQeQK; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Cl0DYX/L; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=DaBJQeQK; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Cl0DYX/L";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DaBJQeQK";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Cl0DYX/L";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DaBJQeQK"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4CD9C5C26F;
	Fri, 29 Aug 2025 15:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756480423; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PbdQATpnbDKiFRGxJs2L4NXPN/VmimEwmvYs92PZZoo=;
	b=Cl0DYX/LK9QG5URlrGigXYa3aRbwzwJmGX/dewj1MuZTVWFIXXTzgNMhWwy4U/GfDBvdtF
	hDZj6Wj/dFUDIV3BNvXvWtpMOmePA0bM7Sqcsv0+RFZ26FMqHARA74krqQzmvc2lW6fDRb
	AfSu0vpNVlrXieJ89t0Gs5Zbi2GxhRQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756480423;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PbdQATpnbDKiFRGxJs2L4NXPN/VmimEwmvYs92PZZoo=;
	b=DaBJQeQKOWGg/wVzIQVb6/UHRlB7TYGJ5T0kdIRjFqm22cT8o1WDZ/u8WJKoKxjxz8pErW
	QOjrWdqNOWzlC6Ag==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="Cl0DYX/L";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=DaBJQeQK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756480423; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PbdQATpnbDKiFRGxJs2L4NXPN/VmimEwmvYs92PZZoo=;
	b=Cl0DYX/LK9QG5URlrGigXYa3aRbwzwJmGX/dewj1MuZTVWFIXXTzgNMhWwy4U/GfDBvdtF
	hDZj6Wj/dFUDIV3BNvXvWtpMOmePA0bM7Sqcsv0+RFZ26FMqHARA74krqQzmvc2lW6fDRb
	AfSu0vpNVlrXieJ89t0Gs5Zbi2GxhRQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756480423;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PbdQATpnbDKiFRGxJs2L4NXPN/VmimEwmvYs92PZZoo=;
	b=DaBJQeQKOWGg/wVzIQVb6/UHRlB7TYGJ5T0kdIRjFqm22cT8o1WDZ/u8WJKoKxjxz8pErW
	QOjrWdqNOWzlC6Ag==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2606D13A72;
	Fri, 29 Aug 2025 15:13:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GHAQCKfDsWiQIQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 15:13:43 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 15/19] ALSA: pxa2xx: Use guard() for mutex locks
Date: Fri, 29 Aug 2025 17:13:29 +0200
Message-ID: <20250829151335.7342-16-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829151335.7342-1-tiwai@suse.de>
References: <20250829151335.7342-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 4CD9C5C26F
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
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01

Replace the manual mutex lock/unlock pairs with guard() for code
simplification.

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/arm/pxa2xx-ac97-lib.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/sound/arm/pxa2xx-ac97-lib.c b/sound/arm/pxa2xx-ac97-lib.c
index a03a3291de84..64510318091f 100644
--- a/sound/arm/pxa2xx-ac97-lib.c
+++ b/sound/arm/pxa2xx-ac97-lib.c
@@ -51,7 +51,7 @@ int pxa2xx_ac97_read(int slot, unsigned short reg)
 	if (slot > 0)
 		return -ENODEV;
 
-	mutex_lock(&car_mutex);
+	guard(mutex)(&car_mutex);
 
 	/* set up primary or secondary codec space */
 	if (cpu_is_pxa25x() && reg == AC97_GPIO_STATUS)
@@ -67,13 +67,12 @@ int pxa2xx_ac97_read(int slot, unsigned short reg)
 	gsr_bits = 0;
 	val = (readl(reg_addr) & 0xffff);
 	if (reg == AC97_GPIO_STATUS)
-		goto out;
+		return val;
 	if (wait_event_timeout(gsr_wq, (readl(ac97_reg_base + GSR) | gsr_bits) & GSR_SDONE, 1) <= 0 &&
 	    !((readl(ac97_reg_base + GSR) | gsr_bits) & GSR_SDONE)) {
 		printk(KERN_ERR "%s: read error (ac97_reg=%d GSR=%#lx)\n",
 				__func__, reg, readl(ac97_reg_base + GSR) | gsr_bits);
-		val = -ETIMEDOUT;
-		goto out;
+		return -ETIMEDOUT;
 	}
 
 	/* valid data now */
@@ -82,8 +81,6 @@ int pxa2xx_ac97_read(int slot, unsigned short reg)
 	val = (readl(reg_addr) & 0xffff);
 	/* but we've just started another cycle... */
 	wait_event_timeout(gsr_wq, (readl(ac97_reg_base + GSR) | gsr_bits) & GSR_SDONE, 1);
-
-out:	mutex_unlock(&car_mutex);
 	return val;
 }
 EXPORT_SYMBOL_GPL(pxa2xx_ac97_read);
@@ -93,7 +90,7 @@ int pxa2xx_ac97_write(int slot, unsigned short reg, unsigned short val)
 	u32 __iomem *reg_addr;
 	int ret = 0;
 
-	mutex_lock(&car_mutex);
+	guard(mutex)(&car_mutex);
 
 	/* set up primary or secondary codec space */
 	if (cpu_is_pxa25x() && reg == AC97_GPIO_STATUS)
@@ -114,7 +111,6 @@ int pxa2xx_ac97_write(int slot, unsigned short reg, unsigned short val)
 		ret = -EIO;
 	}
 
-	mutex_unlock(&car_mutex);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(pxa2xx_ac97_write);
-- 
2.50.1

