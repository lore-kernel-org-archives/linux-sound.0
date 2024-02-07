Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5089980025
	for <linux-sound@vger.kernel.org>; Wed,  7 Feb 2024 15:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707321124; cv=none; b=iwRRrBuuqUF6S00GHoTAfSfEfex8PhTuU/QIoEQN4UsXq4vIxre3xjABMxHOZc8C9eVbZRrxEq958Jk5Kn0hiMDxvfALs43RId6f5K2ks3LKvSy3SB0MiLOiS3XiPF342O+JlLgP4p8suUidRmbUqQS+9NyMukXQMId1PIPulpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707321124; c=relaxed/simple;
	bh=nN5xSet/mxw1jzwFhD1eVSiPXdl2wvuSLudaWsxeblU=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HShu9Mq3ocdfBbZxwOBjRDZlM7vaj3AYWmANG43ctCO1D3OhiCDsD9uREChDXK/wz49UYMKRgkoDKTHsPSmFU7CP3hUH55D0HR2Q5bS50Ynh4utFvNV+kzxC1XVpFIXmmz5jbaS63HzY0wBzmis/30nZOITb6Lu+LOnhYHcxceU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jdRZtcSu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=EYUq0Cqt; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jdRZtcSu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=EYUq0Cqt; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jdRZtcSu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="EYUq0Cqt";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jdRZtcSu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="EYUq0Cqt"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5CF2B2230B;
	Wed,  7 Feb 2024 15:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707321119; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K+h3uA8cduOd0NSKXWsTooK2h9e9BzwvV0ecxYOV5SY=;
	b=jdRZtcSurrgPNNR0AmHyjtKncgdCTsOoQLt74sqBRxWO5RqKGY18kiIPoi7BAQtXKM1YOj
	5tWku6DoJPqeDF3bkbYqA/iUfKUmRpVe0/DkYERpPapcF7evAjCpKOoLCjeJz53d4fmGNK
	xeQKMYhEb25ALW6YXQjbvT9BCIiXBQc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707321119;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K+h3uA8cduOd0NSKXWsTooK2h9e9BzwvV0ecxYOV5SY=;
	b=EYUq0CqtI8Mt8o2xU1ByNOyIC0wSQxZsOGKu3YBGZ9SoaGDykhSyeIQ+ZHDffdaC9um+mM
	Aom0pbSZM2ayXkCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707321119; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K+h3uA8cduOd0NSKXWsTooK2h9e9BzwvV0ecxYOV5SY=;
	b=jdRZtcSurrgPNNR0AmHyjtKncgdCTsOoQLt74sqBRxWO5RqKGY18kiIPoi7BAQtXKM1YOj
	5tWku6DoJPqeDF3bkbYqA/iUfKUmRpVe0/DkYERpPapcF7evAjCpKOoLCjeJz53d4fmGNK
	xeQKMYhEb25ALW6YXQjbvT9BCIiXBQc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707321119;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K+h3uA8cduOd0NSKXWsTooK2h9e9BzwvV0ecxYOV5SY=;
	b=EYUq0CqtI8Mt8o2xU1ByNOyIC0wSQxZsOGKu3YBGZ9SoaGDykhSyeIQ+ZHDffdaC9um+mM
	Aom0pbSZM2ayXkCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3E45B139B9;
	Wed,  7 Feb 2024 15:51:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id CJjKDR+nw2UsRAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Feb 2024 15:51:59 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 09/29] ALSA: nm256: Replace with DEFINE_SIMPLE_DEV_PM_OPS()
Date: Wed,  7 Feb 2024 16:51:20 +0100
Message-Id: <20240207155140.18238-10-tiwai@suse.de>
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
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=jdRZtcSu;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=EYUq0Cqt
X-Spamd-Result: default: False [4.48 / 50.00];
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
	 BAYES_HAM(-0.21)[71.70%]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: 4.48
X-Rspamd-Queue-Id: 5CF2B2230B
X-Spam-Level: ****
X-Spam-Flag: NO
X-Spamd-Bar: ++++

Use the	new DEFINE_SIMPLE_DEV_PM_OPS() instead of SIMPLE_DEV_PM_OPS()
for code-simplification.  We need no longer CONFIG_PM_SLEEP ifdefs.
Just a cleanup, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/nm256/nm256.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/sound/pci/nm256/nm256.c b/sound/pci/nm256/nm256.c
index 34f90829e656..11ba7d4eac2a 100644
--- a/sound/pci/nm256/nm256.c
+++ b/sound/pci/nm256/nm256.c
@@ -1356,7 +1356,6 @@ snd_nm256_peek_for_sig(struct nm256 *chip)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
 /*
  * APM event handler, so the card is properly reinitialized after a power
  * event.
@@ -1400,11 +1399,7 @@ static int nm256_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(nm256_pm, nm256_suspend, nm256_resume);
-#define NM256_PM_OPS	&nm256_pm
-#else
-#define NM256_PM_OPS	NULL
-#endif /* CONFIG_PM_SLEEP */
+static DEFINE_SIMPLE_DEV_PM_OPS(nm256_pm, nm256_suspend, nm256_resume);
 
 static void snd_nm256_free(struct snd_card *card)
 {
@@ -1660,7 +1655,7 @@ static struct pci_driver nm256_driver = {
 	.id_table = snd_nm256_ids,
 	.probe = snd_nm256_probe,
 	.driver = {
-		.pm = NM256_PM_OPS,
+		.pm = &nm256_pm,
 	},
 };
 
-- 
2.35.3

