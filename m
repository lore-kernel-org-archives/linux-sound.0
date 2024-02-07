Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15BC07FBDC
	for <linux-sound@vger.kernel.org>; Wed,  7 Feb 2024 15:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707321129; cv=none; b=fWLyhc5P2R8cIJfdnCRNnd/JqIpqaFYtIhbmcAJ3kr/Y5Xdoc2GeuNjym9mqHWEyPVWgzEbyQDIND/rcyITvhPinovBKtQoS6cS9/+GoSynk2woZNBQvTjRVj9tfdTm8GzglQWMKZoaA3A+35nBZ50oT2v2OFsDtBGoOgNaG2rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707321129; c=relaxed/simple;
	bh=E/+76UeEkut8jxhwCVdgyUdUTx57aQfg4oF77neXrSk=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OXeTq/lOneC6zFygzrD/BJa7FAw6+UNP6aCnNFMXNnjAxE1jOs33eLFJ/22kUbppfBbaDienJ0FwUUmREykyJBj+/5Gf5yr6A+8DQpOWceQUMeg1VVzPNgPSU4htBfTGIBvQq4aoWRH7PIZrZlupbh9OS+O79TPBcEA2TC5vD0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WFlFU7rP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HdTN0WHS; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WFlFU7rP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HdTN0WHS; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WFlFU7rP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HdTN0WHS";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WFlFU7rP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HdTN0WHS"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 517F222309;
	Wed,  7 Feb 2024 15:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707321122; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qV4ChzjQFMPlmt38RsQ3MCYl5IxshswibUGUlRnpYHw=;
	b=WFlFU7rPYYoGkdL0p2OS06yAYS86nlrWSYOFCffZIa9o/Z8F5dbaJeEPJ7kEPrFQ/35RXR
	RKbnaHehKLKOzQEsEknrJXyjPEaE1nym/KcGfaxMTQpKQ1vO1wSn5amrTUAvws65q0M0lx
	FEHKL0Nv7dK4mVu/paxh6dYtbQnhBTU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707321122;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qV4ChzjQFMPlmt38RsQ3MCYl5IxshswibUGUlRnpYHw=;
	b=HdTN0WHSXfk9nftRqtVwXLEGNUQtwv15BGC805kOO3zzbEH7PEOmFg++Qy3txTB1EHDTA2
	/oGG61J57kPR/HAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707321122; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qV4ChzjQFMPlmt38RsQ3MCYl5IxshswibUGUlRnpYHw=;
	b=WFlFU7rPYYoGkdL0p2OS06yAYS86nlrWSYOFCffZIa9o/Z8F5dbaJeEPJ7kEPrFQ/35RXR
	RKbnaHehKLKOzQEsEknrJXyjPEaE1nym/KcGfaxMTQpKQ1vO1wSn5amrTUAvws65q0M0lx
	FEHKL0Nv7dK4mVu/paxh6dYtbQnhBTU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707321122;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qV4ChzjQFMPlmt38RsQ3MCYl5IxshswibUGUlRnpYHw=;
	b=HdTN0WHSXfk9nftRqtVwXLEGNUQtwv15BGC805kOO3zzbEH7PEOmFg++Qy3txTB1EHDTA2
	/oGG61J57kPR/HAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2979713A41;
	Wed,  7 Feb 2024 15:52:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SNe5CCKnw2UsRAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Feb 2024 15:52:02 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 27/29] ALSA: sis7019: Simplify with DEFINE_SIMPLE_DEV_PM_OPS()
Date: Wed,  7 Feb 2024 16:51:38 +0100
Message-Id: <20240207155140.18238-28-tiwai@suse.de>
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
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=WFlFU7rP;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=HdTN0WHS
X-Spamd-Result: default: False [4.64 / 50.00];
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
	 BAYES_HAM(-0.05)[59.73%]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: 4.64
X-Rspamd-Queue-Id: 517F222309
X-Spam-Level: ****
X-Spam-Flag: NO
X-Spamd-Bar: ++++

Use the new DEFINE_SIMPLE_DEV_PM_OPS() instead of SIMPLE_DEV_PM_OPS()
for code-simplification.  We need no longer CONFIG_PM_SLEEP ifdefs.

This ends up with the allocation of all 4 pages no matter with
CONFIG_PM, but the code simplification should justify the cost.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/sis7019.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/sound/pci/sis7019.c b/sound/pci/sis7019.c
index fabe393607f8..53206beb2cb5 100644
--- a/sound/pci/sis7019.c
+++ b/sound/pci/sis7019.c
@@ -90,11 +90,7 @@ struct voice {
  * we're not doing power management, we still need to allocate a page
  * for the silence buffer.
  */
-#ifdef CONFIG_PM_SLEEP
 #define SIS_SUSPEND_PAGES	4
-#else
-#define SIS_SUSPEND_PAGES	1
-#endif
 
 struct sis7019 {
 	unsigned long ioport;
@@ -1152,7 +1148,6 @@ static int sis_chip_init(struct sis7019 *sis)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int sis_suspend(struct device *dev)
 {
 	struct snd_card *card = dev_get_drvdata(dev);
@@ -1231,11 +1226,7 @@ static int sis_resume(struct device *dev)
 	return -EIO;
 }
 
-static SIMPLE_DEV_PM_OPS(sis_pm, sis_suspend, sis_resume);
-#define SIS_PM_OPS	&sis_pm
-#else
-#define SIS_PM_OPS	NULL
-#endif /* CONFIG_PM_SLEEP */
+static DEFINE_SIMPLE_DEV_PM_OPS(sis_pm, sis_suspend, sis_resume);
 
 static int sis_alloc_suspend(struct sis7019 *sis)
 {
@@ -1397,7 +1388,7 @@ static struct pci_driver sis7019_driver = {
 	.id_table = snd_sis7019_ids,
 	.probe = snd_sis7019_probe,
 	.driver = {
-		.pm = SIS_PM_OPS,
+		.pm = &sis_pm,
 	},
 };
 
-- 
2.35.3

