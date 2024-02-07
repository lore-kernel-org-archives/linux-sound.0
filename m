Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668C680BE6
	for <linux-sound@vger.kernel.org>; Wed,  7 Feb 2024 15:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707321130; cv=none; b=dlMNRXPujOn+9oxe4B+r19HDwU0RcW4uvPrGc0hdwaDWlitA2Tir/2zfJdjUKHbRvOK5yKlleiwX3wFMey4EiXYd4n84hRGwEDZKeqw5R8qiI6yb/rU9ryZCkMcI4ELng38UU706Z6lPkQx5dJLnHvLT668jjbEUUoSOcK7nzV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707321130; c=relaxed/simple;
	bh=TtULtGEypVyIrr2BOIIU4bONm0RjM3rTVPB/BWs4gDk=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tn704O6Hzfc1TPTPcBEf2O+xHmSB/jL5ACdnUm96k5PvrTAYLEVMnuZMykiziKIgGZnBqC/mawQ+7AQDRqNKUGK3EQx1NUIZaGt3j0PVehvtKuci4MSS++Yw2Pjg56evZcr10zpm9KTp7zfb4jhmZ/cDoawS3W9PJ5DG4nHLcQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=f4yF34cF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hXPDeptT; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=f4yF34cF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hXPDeptT; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="f4yF34cF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hXPDeptT";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="f4yF34cF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hXPDeptT"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3259F1FC30;
	Wed,  7 Feb 2024 15:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707321121; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HDo72WBboH+JOvfy8J/FoBdZHbIOVqhIZaF9fkVE0Ts=;
	b=f4yF34cFAJKLu5ej63ziiCT3uiGp3CIUlSEtg1dcP9h/aeDLvRT/zEhhn9UG1pdxRJouAT
	LdbKtKvJP7ZWt+xacZBDpePSrSvLHNzs5mp9DT1YGndEiXTfsmzlcSBjICZFN36IkNgj0s
	f/z62zK/c/F44kfen+AgThILOm/JiQc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707321121;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HDo72WBboH+JOvfy8J/FoBdZHbIOVqhIZaF9fkVE0Ts=;
	b=hXPDeptTgSYwBpPNppe+rRGajSy4BMa40SbhK/O8gcv+nCB13qLbckJNXGYKd1Exs1obtT
	77knPew73dwEPOBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707321121; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HDo72WBboH+JOvfy8J/FoBdZHbIOVqhIZaF9fkVE0Ts=;
	b=f4yF34cFAJKLu5ej63ziiCT3uiGp3CIUlSEtg1dcP9h/aeDLvRT/zEhhn9UG1pdxRJouAT
	LdbKtKvJP7ZWt+xacZBDpePSrSvLHNzs5mp9DT1YGndEiXTfsmzlcSBjICZFN36IkNgj0s
	f/z62zK/c/F44kfen+AgThILOm/JiQc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707321121;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HDo72WBboH+JOvfy8J/FoBdZHbIOVqhIZaF9fkVE0Ts=;
	b=hXPDeptTgSYwBpPNppe+rRGajSy4BMa40SbhK/O8gcv+nCB13qLbckJNXGYKd1Exs1obtT
	77knPew73dwEPOBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 13DA6139D8;
	Wed,  7 Feb 2024 15:52:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6KVQAyGnw2UsRAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Feb 2024 15:52:01 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 20/29] ALSA: echoaudio: Simplify with DEFINE_SIMPLE_DEV_PM_OPS()
Date: Wed,  7 Feb 2024 16:51:31 +0100
Message-Id: <20240207155140.18238-21-tiwai@suse.de>
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
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=f4yF34cF;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=hXPDeptT
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
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -0.01
X-Rspamd-Queue-Id: 3259F1FC30
X-Spam-Flag: NO

Use the new DEFINE_SIMPLE_DEV_PM_OPS() instead of SIMPLE_DEV_PM_OPS()
for code-simplification.  We need no longer CONFIG_PM_SLEEP ifdefs.

This ends up with the allocation of firmware caches if it's not really
used without CONFIG_PM, but the code simplification should justify the
cost.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/echoaudio/echoaudio.c | 21 ++-------------------
 sound/pci/echoaudio/echoaudio.h |  2 --
 2 files changed, 2 insertions(+), 21 deletions(-)

diff --git a/sound/pci/echoaudio/echoaudio.c b/sound/pci/echoaudio/echoaudio.c
index c70c3ac4e99a..7484de255a3e 100644
--- a/sound/pci/echoaudio/echoaudio.c
+++ b/sound/pci/echoaudio/echoaudio.c
@@ -34,7 +34,6 @@ static int get_firmware(const struct firmware **fw_entry,
 	int err;
 	char name[30];
 
-#ifdef CONFIG_PM_SLEEP
 	if (chip->fw_cache[fw_index]) {
 		dev_dbg(chip->card->dev,
 			"firmware requested: %s is cached\n",
@@ -42,7 +41,6 @@ static int get_firmware(const struct firmware **fw_entry,
 		*fw_entry = chip->fw_cache[fw_index];
 		return 0;
 	}
-#endif
 
 	dev_dbg(chip->card->dev,
 		"firmware requested: %s\n", card_fw[fw_index].data);
@@ -51,10 +49,8 @@ static int get_firmware(const struct firmware **fw_entry,
 	if (err < 0)
 		dev_err(chip->card->dev,
 			"get_firmware(): Firmware not available (%d)\n", err);
-#ifdef CONFIG_PM_SLEEP
 	else
 		chip->fw_cache[fw_index] = *fw_entry;
-#endif
 	return err;
 }
 
@@ -63,18 +59,13 @@ static int get_firmware(const struct firmware **fw_entry,
 static void free_firmware(const struct firmware *fw_entry,
 			  struct echoaudio *chip)
 {
-#ifdef CONFIG_PM_SLEEP
 	dev_dbg(chip->card->dev, "firmware not released (kept in cache)\n");
-#else
-	release_firmware(fw_entry);
-#endif
 }
 
 
 
 static void free_firmware_cache(struct echoaudio *chip)
 {
-#ifdef CONFIG_PM_SLEEP
 	int i;
 
 	for (i = 0; i < 8 ; i++)
@@ -82,8 +73,6 @@ static void free_firmware_cache(struct echoaudio *chip)
 			release_firmware(chip->fw_cache[i]);
 			dev_dbg(chip->card->dev, "release_firmware(%d)\n", i);
 		}
-
-#endif
 }
 
 
@@ -2146,8 +2135,6 @@ static int snd_echo_probe(struct pci_dev *pci,
 }
 
 
-#if defined(CONFIG_PM_SLEEP)
-
 static int snd_echo_suspend(struct device *dev)
 {
 	struct echoaudio *chip = dev_get_drvdata(dev);
@@ -2237,11 +2224,7 @@ static int snd_echo_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(snd_echo_pm, snd_echo_suspend, snd_echo_resume);
-#define SND_ECHO_PM_OPS	&snd_echo_pm
-#else
-#define SND_ECHO_PM_OPS	NULL
-#endif /* CONFIG_PM_SLEEP */
+static DEFINE_SIMPLE_DEV_PM_OPS(snd_echo_pm, snd_echo_suspend, snd_echo_resume);
 
 /******************************************************************************
 	Everything starts and ends here
@@ -2253,7 +2236,7 @@ static struct pci_driver echo_driver = {
 	.id_table = snd_echo_ids,
 	.probe = snd_echo_probe,
 	.driver = {
-		.pm = SND_ECHO_PM_OPS,
+		.pm = &snd_echo_pm,
 	},
 };
 
diff --git a/sound/pci/echoaudio/echoaudio.h b/sound/pci/echoaudio/echoaudio.h
index d51de3e4edfa..511f2fcc0fb9 100644
--- a/sound/pci/echoaudio/echoaudio.h
+++ b/sound/pci/echoaudio/echoaudio.h
@@ -422,9 +422,7 @@ struct echoaudio {
 	u32 __iomem *dsp_registers;		/* DSP's register base */
 	u32 active_mask;			/* Chs. active mask or
 						 * punks out */
-#ifdef CONFIG_PM_SLEEP
 	const struct firmware *fw_cache[8];	/* Cached firmwares */
-#endif
 
 #ifdef ECHOCARD_HAS_MIDI
 	u16 mtc_state;				/* State for MIDI input parsing state machine */
-- 
2.35.3

