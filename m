Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C12C7E775
	for <linux-sound@vger.kernel.org>; Wed,  7 Feb 2024 15:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707321123; cv=none; b=EAC08fn1CEVRYNDbvR+Dcuf7L0tO1AbKM8zcsAs13JPwbxeXdtTmey/5vuz2b9oJlAl+PIq1CFKOIKjJ9XkRvNBuS0dRc08yiznlv2CXgN1NZNde592E6U8lDVC3z80yvoXCGcT06bGD4XfKCUrPBbEwhFRO5BmrHibsiZ9ju3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707321123; c=relaxed/simple;
	bh=aesraOsiJTvlpBpgSIEzmFW/aaH8s6B+4242eN/6wbA=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HJeItox2kR1cYv5fbc440YfFMj96NZrqAuMnL8gIhM3i4iKKUJuTaOFCkEqCdFE4rUzHDL+G3w/nVGuIlGYMHsnAPzDlNuyGN1nGbc8UuKGM1Oq1qkhYiBAO1Jw1sC2DtV/r+lMGb/S+RBxL7rKRnHmY8ODgPuPYJYiqwuX4nBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XFKyL+ce; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LnEyqVNk; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XFKyL+ce; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LnEyqVNk; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XFKyL+ce";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LnEyqVNk";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XFKyL+ce";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LnEyqVNk"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 82C681FC2A;
	Wed,  7 Feb 2024 15:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707321119; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C/tT5aabcSrmTAs7ZFmkhG3GeXQDSk1ej4tU7HQtXdQ=;
	b=XFKyL+ce9FK5nrILsKVIYBNDf1pLvkFBGuVkCMsQ6/4MqVBHKuajTyoyhF2bsXEzG9SqwK
	GWx/c7FvfQ139ZenfBZ4UIe6bH5OaLveSWG8yZrLqoexG6ctcK7W3NZq9LR2nx+khNjTHX
	/FHSp79Or4d9zKpn929Ml+oxm/BvoYg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707321119;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C/tT5aabcSrmTAs7ZFmkhG3GeXQDSk1ej4tU7HQtXdQ=;
	b=LnEyqVNks3jWrx0OdTbuUqh++va4r3ceRfXw85kVkwo01ZSNOYA5ONFytWSt6AsSd1jL8y
	DTefTkqFjUID3PBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707321119; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C/tT5aabcSrmTAs7ZFmkhG3GeXQDSk1ej4tU7HQtXdQ=;
	b=XFKyL+ce9FK5nrILsKVIYBNDf1pLvkFBGuVkCMsQ6/4MqVBHKuajTyoyhF2bsXEzG9SqwK
	GWx/c7FvfQ139ZenfBZ4UIe6bH5OaLveSWG8yZrLqoexG6ctcK7W3NZq9LR2nx+khNjTHX
	/FHSp79Or4d9zKpn929Ml+oxm/BvoYg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707321119;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C/tT5aabcSrmTAs7ZFmkhG3GeXQDSk1ej4tU7HQtXdQ=;
	b=LnEyqVNks3jWrx0OdTbuUqh++va4r3ceRfXw85kVkwo01ZSNOYA5ONFytWSt6AsSd1jL8y
	DTefTkqFjUID3PBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 655B1139D8;
	Wed,  7 Feb 2024 15:51:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ICIkFx+nw2UsRAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Feb 2024 15:51:59 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 10/29] ALSA: aoa: Replace with DEFINE_SIMPLE_DEV_PM_OPS()
Date: Wed,  7 Feb 2024 16:51:21 +0100
Message-Id: <20240207155140.18238-11-tiwai@suse.de>
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
X-Spam-Score: 3.26
X-Spamd-Result: default: False [3.26 / 50.00];
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
	 BAYES_HAM(-0.44)[78.61%]
X-Spam-Flag: NO

Use the new DEFINE_SIMPLE_DEV_PM_OPS() instead of SIMPLE_DEV_PM_OPS()
for code-simplification.  We need no longer CONFIG_PM_SLEEP ifdefs.
Just a cleanup, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/aoa/fabrics/layout.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/sound/aoa/fabrics/layout.c b/sound/aoa/fabrics/layout.c
index 0cd19a05db19..e68b4cb4df29 100644
--- a/sound/aoa/fabrics/layout.c
+++ b/sound/aoa/fabrics/layout.c
@@ -1126,7 +1126,6 @@ static void aoa_fabric_layout_remove(struct soundbus_dev *sdev)
 	sdev->pcmname = NULL;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int aoa_fabric_layout_suspend(struct device *dev)
 {
 	struct layout_dev *ldev = dev_get_drvdata(dev);
@@ -1147,11 +1146,9 @@ static int aoa_fabric_layout_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(aoa_fabric_layout_pm_ops,
+static DEFINE_SIMPLE_DEV_PM_OPS(aoa_fabric_layout_pm_ops,
 	aoa_fabric_layout_suspend, aoa_fabric_layout_resume);
 
-#endif
-
 static struct soundbus_driver aoa_soundbus_driver = {
 	.name = "snd_aoa_soundbus_drv",
 	.owner = THIS_MODULE,
@@ -1159,9 +1156,7 @@ static struct soundbus_driver aoa_soundbus_driver = {
 	.remove = aoa_fabric_layout_remove,
 	.driver = {
 		.owner = THIS_MODULE,
-#ifdef CONFIG_PM_SLEEP
 		.pm = &aoa_fabric_layout_pm_ops,
-#endif
 	}
 };
 
-- 
2.35.3

