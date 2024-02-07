Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D0A80034
	for <linux-sound@vger.kernel.org>; Wed,  7 Feb 2024 15:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707321123; cv=none; b=hzjxL3rwyTAp4x1eoODkPUsxVZXWXtjhP4eQ8Ct2Y7Zk9br9BO0BWIp+KkQ8ZAZadqegpiT6ZNk9WTETVtuBF7B1SVhLn+7FEfd05fCCRGfyf5tsUpUZCLd5yd4eOYJsMZn9MmRXA4+8TSWYGQBLqg8lNgXjvC4OQ1m+b//rwfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707321123; c=relaxed/simple;
	bh=xQlriAHKLDtcjyjluVuwcZjNxisuyY2MER5fZnpqKk4=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NyGPNxZxpJ3cbmMElD4zuPu8K47/S43+EWlQItBC8ypP2vdqlxOZWUqy+jMuf2YMLOfr5z+udngQ8olPtBJjh8/GOkZuOsXjpMM2PmJbI8RBWpDOUFfY4E+m+NtpjUpljBvJAzutIimilfN7XoIpDs8DjUh5Ah+WfRvpMMxZKx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Pudm7jvJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tZ71l25M; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Pudm7jvJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tZ71l25M; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Pudm7jvJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tZ71l25M";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Pudm7jvJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tZ71l25M"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 34AB42233C;
	Wed,  7 Feb 2024 15:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707321119; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lbSLsh/ddHLZoH/PhuVGVKkIucz0essSka/S5+dSdrQ=;
	b=Pudm7jvJbJrTyozx+uhit3IbDLWij5BC5Ya/+usfIsYQoR1vRmANnCOvG/Z3dUcXqT77lU
	6fPuLHGwvuyn14WvFuQzSYF4dcLNBvsfueeP81dMhm29tjvtLaq0AML9SyTwNR4hOvHE1y
	I5EadSM6riVk/OuaM+oi9Ndr+qru+Hk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707321119;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lbSLsh/ddHLZoH/PhuVGVKkIucz0essSka/S5+dSdrQ=;
	b=tZ71l25M9Z3Nf2kArmpe6cYFF5/cNqWqfma95ELX8jsW4mHwMU7HmsnifYR0T/0qd8d1ya
	Lxt8QzOOBfBknxDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707321119; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lbSLsh/ddHLZoH/PhuVGVKkIucz0essSka/S5+dSdrQ=;
	b=Pudm7jvJbJrTyozx+uhit3IbDLWij5BC5Ya/+usfIsYQoR1vRmANnCOvG/Z3dUcXqT77lU
	6fPuLHGwvuyn14WvFuQzSYF4dcLNBvsfueeP81dMhm29tjvtLaq0AML9SyTwNR4hOvHE1y
	I5EadSM6riVk/OuaM+oi9Ndr+qru+Hk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707321119;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lbSLsh/ddHLZoH/PhuVGVKkIucz0essSka/S5+dSdrQ=;
	b=tZ71l25M9Z3Nf2kArmpe6cYFF5/cNqWqfma95ELX8jsW4mHwMU7HmsnifYR0T/0qd8d1ya
	Lxt8QzOOBfBknxDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 17AD4139D8;
	Wed,  7 Feb 2024 15:51:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YAwNBB+nw2UsRAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Feb 2024 15:51:59 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 08/29] ALSA: intel8x0: Replace with DEFINE_SIMPLE_DEV_PM_OPS()
Date: Wed,  7 Feb 2024 16:51:19 +0100
Message-Id: <20240207155140.18238-9-tiwai@suse.de>
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
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [4.90 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_DN_NONE(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_ONE(0.00)[1];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Level: ****
X-Spam-Score: 4.90
X-Spam-Flag: NO

Use the	new DEFINE_SIMPLE_DEV_PM_OPS() instead of SIMPLE_DEV_PM_OPS()
for code-simplification.  We need no longer CONFIG_PM_SLEEP ifdefs.
Just a cleanup, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/intel8x0.c  | 9 ++-------
 sound/pci/intel8x0m.c | 9 ++-------
 2 files changed, 4 insertions(+), 14 deletions(-)

diff --git a/sound/pci/intel8x0.c b/sound/pci/intel8x0.c
index ae285c0a629c..dae3e15ba534 100644
--- a/sound/pci/intel8x0.c
+++ b/sound/pci/intel8x0.c
@@ -2555,7 +2555,6 @@ static void snd_intel8x0_free(struct snd_card *card)
 		free_irq(chip->irq, chip);
 }
 
-#ifdef CONFIG_PM_SLEEP
 /*
  * power management
  */
@@ -2628,11 +2627,7 @@ static int intel8x0_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(intel8x0_pm, intel8x0_suspend, intel8x0_resume);
-#define INTEL8X0_PM_OPS	&intel8x0_pm
-#else
-#define INTEL8X0_PM_OPS	NULL
-#endif /* CONFIG_PM_SLEEP */
+static DEFINE_SIMPLE_DEV_PM_OPS(intel8x0_pm, intel8x0_suspend, intel8x0_resume);
 
 #define INTEL8X0_TESTBUF_SIZE	32768	/* enough large for one shot */
 
@@ -3200,7 +3195,7 @@ static struct pci_driver intel8x0_driver = {
 	.id_table = snd_intel8x0_ids,
 	.probe = snd_intel8x0_probe,
 	.driver = {
-		.pm = INTEL8X0_PM_OPS,
+		.pm = &intel8x0_pm,
 	},
 };
 
diff --git a/sound/pci/intel8x0m.c b/sound/pci/intel8x0m.c
index 653ecca78238..3d6f5b3cc73e 100644
--- a/sound/pci/intel8x0m.c
+++ b/sound/pci/intel8x0m.c
@@ -965,7 +965,6 @@ static void snd_intel8x0m_free(struct snd_card *card)
 		free_irq(chip->irq, chip);
 }
 
-#ifdef CONFIG_PM_SLEEP
 /*
  * power management
  */
@@ -1006,11 +1005,7 @@ static int intel8x0m_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(intel8x0m_pm, intel8x0m_suspend, intel8x0m_resume);
-#define INTEL8X0M_PM_OPS	&intel8x0m_pm
-#else
-#define INTEL8X0M_PM_OPS	NULL
-#endif /* CONFIG_PM_SLEEP */
+static DEFINE_SIMPLE_DEV_PM_OPS(intel8x0m_pm, intel8x0m_suspend, intel8x0m_resume);
 
 static void snd_intel8x0m_proc_read(struct snd_info_entry * entry,
 				   struct snd_info_buffer *buffer)
@@ -1236,7 +1231,7 @@ static struct pci_driver intel8x0m_driver = {
 	.id_table = snd_intel8x0m_ids,
 	.probe = snd_intel8x0m_probe,
 	.driver = {
-		.pm = INTEL8X0M_PM_OPS,
+		.pm = &intel8x0m_pm,
 	},
 };
 
-- 
2.35.3

