Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD438003C
	for <linux-sound@vger.kernel.org>; Wed,  7 Feb 2024 15:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707321131; cv=none; b=EpQefTssKkBF9p/FVCJvYmLHaA/jKUhji891uWs4CFw3zOP4E0P1RCWGqZDby2hQYvkE91p4XrtF7fQWCw97pRJnXR2iPeB4elMWSoDdWJfdfwEYIgV77T6OAmh2yUcjbD4oc30nVydiF6f4z7sY9dZJw548S0HyZqlgHGcjRqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707321131; c=relaxed/simple;
	bh=oA2eRU1rfSombLJpOwoQjJ8faH4IyOwrjWL2x8RVX+E=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YVypbNN9TfyJNJYhEddns33YEiBxQ/WDYa98Zvj0vyz0nyuoavxO13lvrjl13Q7jIVDwVdalQ8nEb6ocXH4OxM0S46kpRFdmUgyDG9Qa75vIDGzR81axDjOGN6dH0ROgYyXAVA+LVpz3ERCOkgYVcVmMFDeCh6ms2RXRA20RtxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OMyRHSxZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=iZHhMqFN; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OMyRHSxZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=iZHhMqFN; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OMyRHSxZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iZHhMqFN";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OMyRHSxZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iZHhMqFN"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7E8FB1FC06;
	Wed,  7 Feb 2024 15:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707321121; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0X112EvfeOD2uEGnx1mO044CRoezx82FC0EzphY8bgM=;
	b=OMyRHSxZNyhIiSw0K35YGSIcFlmveeUgyZvk4r+H1hv6a6q6aSGcUrSJyJIH6peYd3igIa
	wYQC0PVeaZyOkRBMQ2pCoHLig3lmPRyuxBH1n+hAgCF3nQDwqKtOZmfOkh2gm3AOOsuW0c
	+nmvG11tHnly6J96fBoabATHwT7B44c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707321121;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0X112EvfeOD2uEGnx1mO044CRoezx82FC0EzphY8bgM=;
	b=iZHhMqFNB6sM+FgdR+C6DJ/CfJXe5S+CVViQjTPR+rH8HhhSYnjuWa0fKNtOTG9mbnnARH
	hytnLei16l729hDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707321121; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0X112EvfeOD2uEGnx1mO044CRoezx82FC0EzphY8bgM=;
	b=OMyRHSxZNyhIiSw0K35YGSIcFlmveeUgyZvk4r+H1hv6a6q6aSGcUrSJyJIH6peYd3igIa
	wYQC0PVeaZyOkRBMQ2pCoHLig3lmPRyuxBH1n+hAgCF3nQDwqKtOZmfOkh2gm3AOOsuW0c
	+nmvG11tHnly6J96fBoabATHwT7B44c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707321121;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0X112EvfeOD2uEGnx1mO044CRoezx82FC0EzphY8bgM=;
	b=iZHhMqFNB6sM+FgdR+C6DJ/CfJXe5S+CVViQjTPR+rH8HhhSYnjuWa0fKNtOTG9mbnnARH
	hytnLei16l729hDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 61E17139D8;
	Wed,  7 Feb 2024 15:52:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UOoxFiGnw2UsRAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Feb 2024 15:52:01 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 22/29] ALSA: es1968: Simplify with DEFINE_SIMPLE_DEV_PM_OPS()
Date: Wed,  7 Feb 2024 16:51:33 +0100
Message-Id: <20240207155140.18238-23-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240207155140.18238-1-tiwai@suse.de>
References: <20240207155140.18238-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=OMyRHSxZ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=iZHhMqFN
X-Spamd-Result: default: False [4.68 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 FROM_HAS_DN(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_DN_NONE(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_ONE(0.00)[1];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.01)[50.14%]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: 4.68
X-Rspamd-Queue-Id: 7E8FB1FC06
X-Spam-Level: ****
X-Spam-Flag: NO
X-Spamd-Bar: ++++

Use the new DEFINE_SIMPLE_DEV_PM_OPS() instead of SIMPLE_DEV_PM_OPS()
for code-simplification.  We need no longer CONFIG_PM_SLEEP ifdefs.

This ends up with the allocation of a few additional bytes for the
register dumps even if it's not really used, but the code
simplification should justify the cost.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/es1968.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/sound/pci/es1968.c b/sound/pci/es1968.c
index 4bc0f53c223b..c6c018b40c69 100644
--- a/sound/pci/es1968.c
+++ b/sound/pci/es1968.c
@@ -473,9 +473,7 @@ struct esschan {
 	/* linked list */
 	struct list_head list;
 
-#ifdef CONFIG_PM_SLEEP
 	u16 wc_map[4];
-#endif
 };
 
 struct es1968 {
@@ -526,9 +524,7 @@ struct es1968 {
 	struct list_head substream_list;
 	spinlock_t substream_lock;
 
-#ifdef CONFIG_PM_SLEEP
 	u16 apu_map[NR_APUS][NR_APU_REGS];
-#endif
 
 #ifdef SUPPORT_JOYSTICK
 	struct gameport *gameport;
@@ -689,9 +685,7 @@ static void __apu_set_register(struct es1968 *chip, u16 channel, u8 reg, u16 dat
 {
 	if (snd_BUG_ON(channel >= NR_APUS))
 		return;
-#ifdef CONFIG_PM_SLEEP
 	chip->apu_map[channel][reg] = data;
-#endif
 	reg |= (channel << 4);
 	apu_index_set(chip, reg);
 	apu_data_set(chip, data);
@@ -976,9 +970,7 @@ static void snd_es1968_program_wavecache(struct es1968 *chip, struct esschan *es
 	/* set the wavecache control reg */
 	wave_set_register(chip, es->apu[channel] << 3, tmpval);
 
-#ifdef CONFIG_PM_SLEEP
 	es->wc_map[channel] = tmpval;
-#endif
 }
 
 
@@ -2356,7 +2348,6 @@ static void snd_es1968_start_irq(struct es1968 *chip)
 	outw(w, chip->io_port + ESM_PORT_HOST_IRQ);
 }
 
-#ifdef CONFIG_PM_SLEEP
 /*
  * PM support
  */
@@ -2418,11 +2409,7 @@ static int es1968_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(es1968_pm, es1968_suspend, es1968_resume);
-#define ES1968_PM_OPS	&es1968_pm
-#else
-#define ES1968_PM_OPS	NULL
-#endif /* CONFIG_PM_SLEEP */
+static DEFINE_SIMPLE_DEV_PM_OPS(es1968_pm, es1968_suspend, es1968_resume);
 
 #ifdef SUPPORT_JOYSTICK
 #define JOYSTICK_ADDR	0x200
@@ -2852,7 +2839,7 @@ static struct pci_driver es1968_driver = {
 	.id_table = snd_es1968_ids,
 	.probe = snd_es1968_probe,
 	.driver = {
-		.pm = ES1968_PM_OPS,
+		.pm = &es1968_pm,
 	},
 };
 
-- 
2.35.3

