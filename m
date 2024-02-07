Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340068063E
	for <linux-sound@vger.kernel.org>; Wed,  7 Feb 2024 15:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707321129; cv=none; b=OS0qAByrZ6w2vTehPJ/VS0yDulovetFrQHQEM+dPLKRg/N2mNYvWDB2srmhIoVrf6rNzTYCfDt2zT6+zxCjXh0KW8jU0nGNOxAdRxv5LLosGfLSLajpDlQpShjSggM93zfmag+1GnEB5R/tyvEUj0Kl6y+PNcLypm+r6i37dwSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707321129; c=relaxed/simple;
	bh=kJZNfXGox3scysyR03uNMxn12kNjx9RlWjUIvqvsa6Y=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HFwVdb+nwVSmyEhrX/HPhi2LCKUCTIq5TkKag2c5HY6NzsQQgFaTct1UaU7zp0B2eQhKKXVf2VWCMqgMLqYnLnW0vBS37WH7tnm7yXWow7zRA2imm27UxklsFafX0WV9Ox0hx1vGBUKlYeeBHABNeiktwSQAIBQXkQU9tO/5vKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=D3akiQi2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=22e0uEk4; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=D3akiQi2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=22e0uEk4; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="D3akiQi2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="22e0uEk4";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="D3akiQi2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="22e0uEk4"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DA3B61FC26;
	Wed,  7 Feb 2024 15:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707321120; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bDyjS/cWS6agHOHrgreh3fHc9jxQJJ3F4g5ASprj+pg=;
	b=D3akiQi2nCJADrBBia20MTHwRja0WCDhi5eRLaQTME8vvphyR0U7+3Pb//PHnAwKFDOz+q
	2s28KeGAkXFrB4G74PLx3EvuyPVCeDPB1lM+UyrY3nUtkh+P/v+SNGnyxpbj+FePZ77dmO
	/Em8kt8F4bflnS95c7n32emp2LAcuL8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707321120;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bDyjS/cWS6agHOHrgreh3fHc9jxQJJ3F4g5ASprj+pg=;
	b=22e0uEk4KspwgOTjLoXwzVLSBqcZ3aAKu/qZGQVfCd/IsklYlgAtEZ6i1Wgl8l1rE+x06Z
	ZIypY/c5butFx0DQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707321120; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bDyjS/cWS6agHOHrgreh3fHc9jxQJJ3F4g5ASprj+pg=;
	b=D3akiQi2nCJADrBBia20MTHwRja0WCDhi5eRLaQTME8vvphyR0U7+3Pb//PHnAwKFDOz+q
	2s28KeGAkXFrB4G74PLx3EvuyPVCeDPB1lM+UyrY3nUtkh+P/v+SNGnyxpbj+FePZ77dmO
	/Em8kt8F4bflnS95c7n32emp2LAcuL8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707321120;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bDyjS/cWS6agHOHrgreh3fHc9jxQJJ3F4g5ASprj+pg=;
	b=22e0uEk4KspwgOTjLoXwzVLSBqcZ3aAKu/qZGQVfCd/IsklYlgAtEZ6i1Wgl8l1rE+x06Z
	ZIypY/c5butFx0DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BA3BD139D8;
	Wed,  7 Feb 2024 15:52:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id oOHPKyCnw2UsRAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Feb 2024 15:52:00 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 18/29] ALSA: cmipci: Simplify with DEFINE_SIMPLE_DEV_PM_OPS()
Date: Wed,  7 Feb 2024 16:51:29 +0100
Message-Id: <20240207155140.18238-19-tiwai@suse.de>
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
	none
X-Spam-Level: ***
X-Spam-Score: 3.69
X-Spamd-Result: default: False [3.69 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_DN_NONE(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_ONE(0.00)[1];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.01)[50.22%]
X-Spam-Flag: NO

Use the new DEFINE_SIMPLE_DEV_PM_OPS() instead of SIMPLE_DEV_PM_OPS()
for code-simplification.  We need no longer CONFIG_PM_SLEEP ifdefs.

This ends up with the allocation of a few additional bytes for the
register dumps even if it's not really used, but the code
simplification should justify the cost.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/cmipci.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/sound/pci/cmipci.c b/sound/pci/cmipci.c
index 08e34b184780..36014501f7ed 100644
--- a/sound/pci/cmipci.c
+++ b/sound/pci/cmipci.c
@@ -486,10 +486,8 @@ struct cmipci {
 
 	spinlock_t reg_lock;
 
-#ifdef CONFIG_PM_SLEEP
 	unsigned int saved_regs[0x20];
 	unsigned char saved_mixers[0x20];
-#endif
 };
 
 
@@ -3260,7 +3258,6 @@ static int snd_cmipci_probe(struct pci_dev *pci,
 	return err;
 }
 
-#ifdef CONFIG_PM_SLEEP
 /*
  * power management
  */
@@ -3324,18 +3321,14 @@ static int snd_cmipci_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(snd_cmipci_pm, snd_cmipci_suspend, snd_cmipci_resume);
-#define SND_CMIPCI_PM_OPS	&snd_cmipci_pm
-#else
-#define SND_CMIPCI_PM_OPS	NULL
-#endif /* CONFIG_PM_SLEEP */
+static DEFINE_SIMPLE_DEV_PM_OPS(snd_cmipci_pm, snd_cmipci_suspend, snd_cmipci_resume);
 
 static struct pci_driver cmipci_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_cmipci_ids,
 	.probe = snd_cmipci_probe,
 	.driver = {
-		.pm = SND_CMIPCI_PM_OPS,
+		.pm = &snd_cmipci_pm,
 	},
 };
 	
-- 
2.35.3

