Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAEC87FBBE
	for <linux-sound@vger.kernel.org>; Wed,  7 Feb 2024 15:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707321122; cv=none; b=pHKDg9dqd8eH0ZbSb+NbhiRwXwd6d6OhtyG3xSzjBwaN2uo7kVC7mMzbw0LyIX8yi/hXmhnJ5wb2NeCCYVB75H7+wN+LMsCmbizFBGCLGbWJJEFqXAfn3LfnfxpmrQqK1cJQAC1JNcxROoYx8afFyyDQ71l1/3mrvhh5pcq87MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707321122; c=relaxed/simple;
	bh=f453AFvgy2SPgfF+h6VLKnsQfN2YtxEVzflcQD8tOPk=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tih0MF5p6ATtz0UpyAvU9Zo/wplRoi4/7kPJFp2ueKQtINU/glMaYMGSllk//dN3lksA8dP9kxu9ZaQppEXVKB+fvCvoww3nBZGoyvrtDGVSxfyy77knZzFiyQtEgwVi1nlLY9bXrQjMf9VRk16XM2Q8kSKPNbI3tnDL+GFMu0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VpABIs4B; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xYqriqWM; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VpABIs4B; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xYqriqWM; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VpABIs4B";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xYqriqWM";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VpABIs4B";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xYqriqWM"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DC5341FC07;
	Wed,  7 Feb 2024 15:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707321118; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rG4RscVuKNFtfrHXTdl91jAByKplJdh4erLMdpvoRSI=;
	b=VpABIs4B2iF7FX4HSfpqySQNYdHi77UdkPgxJoEa7EYNwH2EKkXJSriPrtN/nRQH+69ZUk
	Lh9MX7XQAOK/q6ueuzgETdKNXqnYpSa/ONhjeF3V4ZgMSyiHUdoV5Cu2CjgQ7h5TTV7AL3
	GPyGE62AZNuCiCRyKegQA38pouAXo70=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707321118;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rG4RscVuKNFtfrHXTdl91jAByKplJdh4erLMdpvoRSI=;
	b=xYqriqWMOkhXjEvcPyz+TyGtepxEVbyvx8S2HqgLwiDdyt/szHSd5mCbYrHZ+RY9CEGtIT
	qRYrw3GGNDjcbiBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707321118; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rG4RscVuKNFtfrHXTdl91jAByKplJdh4erLMdpvoRSI=;
	b=VpABIs4B2iF7FX4HSfpqySQNYdHi77UdkPgxJoEa7EYNwH2EKkXJSriPrtN/nRQH+69ZUk
	Lh9MX7XQAOK/q6ueuzgETdKNXqnYpSa/ONhjeF3V4ZgMSyiHUdoV5Cu2CjgQ7h5TTV7AL3
	GPyGE62AZNuCiCRyKegQA38pouAXo70=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707321118;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rG4RscVuKNFtfrHXTdl91jAByKplJdh4erLMdpvoRSI=;
	b=xYqriqWMOkhXjEvcPyz+TyGtepxEVbyvx8S2HqgLwiDdyt/szHSd5mCbYrHZ+RY9CEGtIT
	qRYrw3GGNDjcbiBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BFCA5139D8;
	Wed,  7 Feb 2024 15:51:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QCBULR6nw2UsRAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Feb 2024 15:51:58 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 06/29] ALSA: atiixp: Replace with DEFINE_SIMPLE_DEV_PM_OPS()
Date: Wed,  7 Feb 2024 16:51:17 +0100
Message-Id: <20240207155140.18238-7-tiwai@suse.de>
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
X-Spam-Level: 
X-Spamd-Bar: /
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=VpABIs4B;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=xYqriqWM
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-0.01 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 FROM_HAS_DN(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_DN_NONE(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 DWL_DNSWL_HI(-3.50)[suse.de:dkim];
	 RCPT_COUNT_ONE(0.00)[1];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.00)[26.40%]
X-Spam-Score: -0.01
X-Rspamd-Queue-Id: DC5341FC07
X-Spam-Flag: NO

Use the	new DEFINE_SIMPLE_DEV_PM_OPS() instead of SIMPLE_DEV_PM_OPS()
for code-simplification.  We need no longer CONFIG_PM_SLEEP ifdefs.
Just a cleanup, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/atiixp.c       | 12 ++----------
 sound/pci/atiixp_modem.c | 11 ++---------
 2 files changed, 4 insertions(+), 19 deletions(-)

diff --git a/sound/pci/atiixp.c b/sound/pci/atiixp.c
index 43d01f1847ed..df2fef726d60 100644
--- a/sound/pci/atiixp.c
+++ b/sound/pci/atiixp.c
@@ -520,7 +520,6 @@ static int snd_atiixp_aclink_reset(struct atiixp *chip)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int snd_atiixp_aclink_down(struct atiixp *chip)
 {
 	// if (atiixp_read(chip, MODEM_MIRROR) & 0x1) /* modem running, too? */
@@ -530,7 +529,6 @@ static int snd_atiixp_aclink_down(struct atiixp *chip)
 		     ATI_REG_CMD_POWERDOWN);
 	return 0;
 }
-#endif
 
 /*
  * auto-detection of codecs
@@ -1454,7 +1452,6 @@ static int snd_atiixp_mixer_new(struct atiixp *chip, int clock,
 }
 
 
-#ifdef CONFIG_PM_SLEEP
 /*
  * power management
  */
@@ -1499,12 +1496,7 @@ static int snd_atiixp_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(snd_atiixp_pm, snd_atiixp_suspend, snd_atiixp_resume);
-#define SND_ATIIXP_PM_OPS	&snd_atiixp_pm
-#else
-#define SND_ATIIXP_PM_OPS	NULL
-#endif /* CONFIG_PM_SLEEP */
-
+static DEFINE_SIMPLE_DEV_PM_OPS(snd_atiixp_pm, snd_atiixp_suspend, snd_atiixp_resume);
 
 /*
  * proc interface for register dump
@@ -1634,7 +1626,7 @@ static struct pci_driver atiixp_driver = {
 	.id_table = snd_atiixp_ids,
 	.probe = snd_atiixp_probe,
 	.driver = {
-		.pm = SND_ATIIXP_PM_OPS,
+		.pm = &snd_atiixp_pm,
 	},
 };
 
diff --git a/sound/pci/atiixp_modem.c b/sound/pci/atiixp_modem.c
index 8864c4c3c7e1..eb569539f322 100644
--- a/sound/pci/atiixp_modem.c
+++ b/sound/pci/atiixp_modem.c
@@ -496,7 +496,6 @@ static int snd_atiixp_aclink_reset(struct atiixp_modem *chip)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int snd_atiixp_aclink_down(struct atiixp_modem *chip)
 {
 	// if (atiixp_read(chip, MODEM_MIRROR) & 0x1) /* modem running, too? */
@@ -506,7 +505,6 @@ static int snd_atiixp_aclink_down(struct atiixp_modem *chip)
 		     ATI_REG_CMD_POWERDOWN);
 	return 0;
 }
-#endif
 
 /*
  * auto-detection of codecs
@@ -1094,7 +1092,6 @@ static int snd_atiixp_mixer_new(struct atiixp_modem *chip, int clock)
 }
 
 
-#ifdef CONFIG_PM_SLEEP
 /*
  * power management
  */
@@ -1128,11 +1125,7 @@ static int snd_atiixp_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(snd_atiixp_pm, snd_atiixp_suspend, snd_atiixp_resume);
-#define SND_ATIIXP_PM_OPS	&snd_atiixp_pm
-#else
-#define SND_ATIIXP_PM_OPS	NULL
-#endif /* CONFIG_PM_SLEEP */
+static DEFINE_SIMPLE_DEV_PM_OPS(snd_atiixp_pm, snd_atiixp_suspend, snd_atiixp_resume);
 
 /*
  * proc interface for register dump
@@ -1258,7 +1251,7 @@ static struct pci_driver atiixp_modem_driver = {
 	.id_table = snd_atiixp_ids,
 	.probe = snd_atiixp_probe,
 	.driver = {
-		.pm = SND_ATIIXP_PM_OPS,
+		.pm = &snd_atiixp_pm,
 	},
 };
 
-- 
2.35.3

