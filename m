Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6692880BE7
	for <linux-sound@vger.kernel.org>; Wed,  7 Feb 2024 15:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707321128; cv=none; b=dLCAhvSLKr1hlIm9vST/WommHwmpptzV9WNyNBmmY1pIVzCWj89FubdIDYhbpP2lsy7aBf3Zd08LGQy3+dQpPoyZS1LqJljpOTboD7LQFq2kR1twtoF2GLhNjN41YsB/cRKu21iaCATEKl9oX00eVtCCAg95iMTIWOL6L0teW+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707321128; c=relaxed/simple;
	bh=9IOPuf/YlnoCiqYIm2jIXNvZZS5WqkQzmX8zewXrD/Y=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=T8PXLz4GnPlu5K+C4pg4KajyiL65WPkglU6aKx1fmWT2iOfS1J3mG/OBhYujnXsvV/g6eys1Qq+I/+l3VlvmwABZJswFmCaBJEErWHPHy+hEOmD2TiydeUmROdb0QUT4Qm8HtPZ2dj5rX/sxrr+dZu1rWDQPR0WyzSoDhiAVp+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=O2YfXGSk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=iWIzCHzw; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=O2YfXGSk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=iWIzCHzw; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="O2YfXGSk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iWIzCHzw";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="O2YfXGSk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iWIzCHzw"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B17DE1FC25;
	Wed,  7 Feb 2024 15:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707321120; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tbh/wztk8t2SV2JJ032ndvlCsQzLmQfvmKVf0/WVhLE=;
	b=O2YfXGSkT1jJ163zxkyMDHX2xVS53f/PpHcSsqJr0rO4/vHwAlP/Pmm+uKdO0bfhL1Ni6p
	0v0E4qmq0rMQ+g4WBubRLVcWl+JHtDkwHnUrAoyaayNE4YxvS/Dv+KC6QrREnFtDxo1T9S
	fGn7nK1Ktepfv0wPMGnCZjUD+MIGezQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707321120;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tbh/wztk8t2SV2JJ032ndvlCsQzLmQfvmKVf0/WVhLE=;
	b=iWIzCHzwiN6JP6TpwdmWRjHa+h1db5Rgi89kc4CQ+KuA99Ofo2Jfd+QZDqOLXZU2iIzUpP
	iYGh9XdpXVbqUcBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707321120; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tbh/wztk8t2SV2JJ032ndvlCsQzLmQfvmKVf0/WVhLE=;
	b=O2YfXGSkT1jJ163zxkyMDHX2xVS53f/PpHcSsqJr0rO4/vHwAlP/Pmm+uKdO0bfhL1Ni6p
	0v0E4qmq0rMQ+g4WBubRLVcWl+JHtDkwHnUrAoyaayNE4YxvS/Dv+KC6QrREnFtDxo1T9S
	fGn7nK1Ktepfv0wPMGnCZjUD+MIGezQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707321120;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tbh/wztk8t2SV2JJ032ndvlCsQzLmQfvmKVf0/WVhLE=;
	b=iWIzCHzwiN6JP6TpwdmWRjHa+h1db5Rgi89kc4CQ+KuA99Ofo2Jfd+QZDqOLXZU2iIzUpP
	iYGh9XdpXVbqUcBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 92E05139B9;
	Wed,  7 Feb 2024 15:52:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id oIEbIiCnw2UsRAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Feb 2024 15:52:00 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 17/29] ALSA: azt3328: Simplify with DEFINE_SIMPLE_DEV_PM_OPS()
Date: Wed,  7 Feb 2024 16:51:28 +0100
Message-Id: <20240207155140.18238-18-tiwai@suse.de>
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
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=O2YfXGSk;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=iWIzCHzw
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
	 BAYES_HAM(-0.01)[50.86%]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: 4.68
X-Rspamd-Queue-Id: B17DE1FC25
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
 sound/pci/azt3328.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/sound/pci/azt3328.c b/sound/pci/azt3328.c
index 431f0026b507..84989c291cd7 100644
--- a/sound/pci/azt3328.c
+++ b/sound/pci/azt3328.c
@@ -295,7 +295,6 @@ struct snd_azf3328 {
 	 * CONFIG_PM register storage below, but that's slightly difficult. */
 	u16 shadow_reg_ctrl_6AH;
 
-#ifdef CONFIG_PM_SLEEP
 	/* register value containers for power management
 	 * Note: not always full I/O range preserved (similar to Win driver!) */
 	u32 saved_regs_ctrl[AZF_ALIGN(AZF_IO_SIZE_CTRL_PM) / 4];
@@ -303,7 +302,6 @@ struct snd_azf3328 {
 	u32 saved_regs_mpu[AZF_ALIGN(AZF_IO_SIZE_MPU_PM) / 4];
 	u32 saved_regs_opl3[AZF_ALIGN(AZF_IO_SIZE_OPL3_PM) / 4];
 	u32 saved_regs_mixer[AZF_ALIGN(AZF_IO_SIZE_MIXER_PM) / 4];
-#endif
 };
 
 static const struct pci_device_id snd_azf3328_ids[] = {
@@ -2517,7 +2515,6 @@ snd_azf3328_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 	return snd_card_free_on_error(&pci->dev, __snd_azf3328_probe(pci, pci_id));
 }
 
-#ifdef CONFIG_PM_SLEEP
 static inline void
 snd_azf3328_suspend_regs(const struct snd_azf3328 *chip,
 			 unsigned long io_addr, unsigned count, u32 *saved_regs)
@@ -2633,18 +2630,14 @@ snd_azf3328_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(snd_azf3328_pm, snd_azf3328_suspend, snd_azf3328_resume);
-#define SND_AZF3328_PM_OPS	&snd_azf3328_pm
-#else
-#define SND_AZF3328_PM_OPS	NULL
-#endif /* CONFIG_PM_SLEEP */
+static DEFINE_SIMPLE_DEV_PM_OPS(snd_azf3328_pm, snd_azf3328_suspend, snd_azf3328_resume);
 
 static struct pci_driver azf3328_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_azf3328_ids,
 	.probe = snd_azf3328_probe,
 	.driver = {
-		.pm = SND_AZF3328_PM_OPS,
+		.pm = &snd_azf3328_pm,
 	},
 };
 
-- 
2.35.3

