Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE052D5A06
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142143; cv=none; b=c1M4Ike+Rtrge569bjQ872P3ashNe/zvje506qMP29yAJWxGqOtadGuApneTyll9SaXKZ3Btvz688oYgwqxnBwv/gR/Hp+QdgDOizT+CEE3twRDV9mh/gwr0wbStQdyyGfgr+2uyg1gY/jdOgGnqtU8h949UuMzmJgVsQWWdleM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142143; c=relaxed/simple;
	bh=3HnkzWRiiOCqomgZ+ILTChCmEIzlHUKO9YH86HLU5Z8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NMp2UFQTWjABm1Gk5mzAWzHCoiLKb6S68CnJlVt1k5wg18Qv77zGj28HPZllllR/JTLY2DXSImv9SH1fnCWBB6RKQHnZwesyGClgkqp/rUazfkOh37jrubcHEu+aMlQb+0nFYGXNwh6CrrnnZKJsd4TVHSmbBWPopXAMD0Do3Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zo16a7Gv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=F7V0YBUU; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YJjQk4ZY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PNmwtGZ9; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zo16a7Gv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="F7V0YBUU";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YJjQk4ZY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PNmwtGZ9"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id F09021F45E;
	Thu, 10 Jul 2025 10:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142062; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hitg5EEyYZbJuhyomPyXbDbE/TQj7tpuT0V9lCpuHIc=;
	b=zo16a7GvhKBdd5R+QH6OoEic3329N1sW+9fBe6MRmYruZZmakZgW5RY4HRu6kziIfN/4qg
	uKb67pr9VBgAnECmqqzIuMPrcEzcNbboUWKGzR/VkdC6pQ0Of63ZKDn6vvb2Or9huKCRkD
	dhXj5cfjjBjnsa16DnaaM/321KkTbO4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142062;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hitg5EEyYZbJuhyomPyXbDbE/TQj7tpuT0V9lCpuHIc=;
	b=F7V0YBUUS8aA7WSlnkAT9+rKyvguysFBmRlWzkUeUU+Akp5rzKgdudBmsx/Y3CkfeZ/vFA
	1nSX7WxMy10JSPBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=YJjQk4ZY;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=PNmwtGZ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142061; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hitg5EEyYZbJuhyomPyXbDbE/TQj7tpuT0V9lCpuHIc=;
	b=YJjQk4ZY1xO6XwlNIX/gB5+i/ix9ehfCTgTr8j1A2zoRXmoifm0gTUp3juUhP1Q1rsq7RK
	ioPKtqRugcCr9czyqWXucxodQhky1lMkYZI54zsHpwb/bNBzqPl5ch43SzNgmDsmjQTC8n
	hEnQAjBHoLAPM8qoz1WCZk7qT5pHYKk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142061;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hitg5EEyYZbJuhyomPyXbDbE/TQj7tpuT0V9lCpuHIc=;
	b=PNmwtGZ9goROgUYf+CcGeDm19iPno6a3PNtyg7Hl63qo0RSsW9JYEanf9elevJ3N2VRJ48
	IaA0V5sktBZiLKDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D61CD13A70;
	Thu, 10 Jul 2025 10:07:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IG4WM+2Qb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:41 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 039/103] ALSA: mips: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:06:21 +0200
Message-ID: <20250710100727.22653-40-tiwai@suse.de>
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
X-Spam-Flag: NO
X-Rspamd-Queue-Id: F09021F45E
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLe1mc1hwayk397878n5a1j337)];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01

Use a safer function strscpy() instead of strcpy() for copying to
arrays.

Only idiomatic code replacement, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/mips/hal2.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/mips/hal2.c b/sound/mips/hal2.c
index 991793e6bda9..f88e6a6733a5 100644
--- a/sound/mips/hal2.c
+++ b/sound/mips/hal2.c
@@ -706,7 +706,7 @@ static int hal2_pcm_create(struct snd_hal2 *hal2)
 		return err;
 
 	pcm->private_data = hal2;
-	strcpy(pcm->name, "SGI HAL2");
+	strscpy(pcm->name, "SGI HAL2");
 
 	/* set operators */
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK,
@@ -862,8 +862,8 @@ static int hal2_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	strcpy(card->driver, "SGI HAL2 Audio");
-	strcpy(card->shortname, "SGI HAL2 Audio");
+	strscpy(card->driver, "SGI HAL2 Audio");
+	strscpy(card->shortname, "SGI HAL2 Audio");
 	sprintf(card->longname, "%s irq %i",
 		card->shortname,
 		SGI_HPCDMA_IRQ);
-- 
2.50.0

