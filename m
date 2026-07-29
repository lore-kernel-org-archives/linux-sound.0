Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898A43B83E3
	for <linux-sound@vger.kernel.org>; Wed, 29 Jul 2026 08:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785314300; cv=none; b=OOZzXcqMxoS29UUMWANT96qZ3Tjk33spv3TdQlOJeiCUo5pR241TblW8U+ZrowmNDYjdV0yZa3CuVTJQ7kbO9JbVJ0pKXKBHBK1kaRcRIQofCRFg47WFonR6ZogvqYgale4OdVV1tKBveKaDTnjRYKPXXkuQMz1vwq82eNWZ8Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785314300; c=relaxed/simple;
	bh=A7m92zgyDt+RLTvbbwnc/DtJFEwndbx21X06RQesz6M=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qz1ZBQJXSUD11w2QKr06fzvRkTlVvEYBlNmpwTWTNUXCT0SlzodpmhW9PW0pnSmVpOgzZK1iSU7+RayfB6IEKeyiIfxtrznnVyfcLI3TkvmPYmvihPUS5WX5+uf0rxbR5Lt1aid1bTWrCSyCbPLIfgleU4ZCkrESQNVQF7FwdXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=P1AxJ7B5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4hQjtB/o; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1ds0O1ac; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=AINSpJbl; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="P1AxJ7B5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4hQjtB/o";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1ds0O1ac";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AINSpJbl"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 135A87C9AC;
	Wed, 29 Jul 2026 08:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785314276; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SHNqnNqBuIlY3511H7N2omaoYQSM/Dx0WSNYHB5CjL4=;
	b=P1AxJ7B57GyekrYvUusLxJQeT2yhOASbUvy4W+xKhBpwxQvTLCGPLn3OOKYpdZJ6FTiIjX
	KOgy5SU8Yt6B6CPoIGZl4fbPXY/znsU5rW+9w06hUKAyNXWPWPHr82emES8KtLLMVzxx69
	mmd5WBwuaFnWtyiNDd6l+gCyzWk//x4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785314276;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SHNqnNqBuIlY3511H7N2omaoYQSM/Dx0WSNYHB5CjL4=;
	b=4hQjtB/oqCguL0EsXaerMZwNc6xvP5LLdeMWn/mLU6UOV9FFy2VK/l0aLBBsaf5RRWaPWP
	2sY9gBmSv62oiNCg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=1ds0O1ac;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=AINSpJbl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785314272; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SHNqnNqBuIlY3511H7N2omaoYQSM/Dx0WSNYHB5CjL4=;
	b=1ds0O1acdZkZi1r8e9Rq7/D5eQDhXaIJCadOPj4Ml9hp7vXC1vwkqtw3NKpP/e7oGAPHR1
	2CIfv3kXJAJPh+dqpndOqKWW4igdG9iu0kyY1rNrhw9wh8wnLz7OzOC1fvPgl9oCO67TOX
	zjCau9XWNO13uNzpcwZrPjbCvA/BYUU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785314272;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SHNqnNqBuIlY3511H7N2omaoYQSM/Dx0WSNYHB5CjL4=;
	b=AINSpJblkQGv5ZjuMCVJ+hjgY492mB3uRz0fPOsTcHo5Cv8/38z3lbIC8onzBFFHzGw4pP
	SN8NdX2Mw2OeeVCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C4AAA779CB;
	Wed, 29 Jul 2026 08:37:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8MfNLti7aWqCVwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 29 Jul 2026 08:37:44 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 10/14] ALSA: cs46xx: Use auto-cleanup for firmware loading
Date: Wed, 29 Jul 2026 10:37:28 +0200
Message-ID: <20260729083735.120219-11-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729083735.120219-1-tiwai@suse.de>
References: <20260729083735.120219-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid,suse.de:dkim];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Queue-Id: 135A87C9AC
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

Simplify the code to manage the firmware loading with __free(firmware)
auto-cleanup.

Only the code refactoring, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/cs46xx/cs46xx_lib.c | 30 ++++++++++--------------------
 1 file changed, 10 insertions(+), 20 deletions(-)

diff --git a/sound/pci/cs46xx/cs46xx_lib.c b/sound/pci/cs46xx/cs46xx_lib.c
index 1c11023184ac..19a6927c079d 100644
--- a/sound/pci/cs46xx/cs46xx_lib.c
+++ b/sound/pci/cs46xx/cs46xx_lib.c
@@ -387,7 +387,7 @@ static int load_firmware(struct snd_cs46xx *chip,
 	unsigned int nums, fwlen, fwsize;
 	const __le32 *fwdat;
 	struct dsp_module_desc *module = NULL;
-	const struct firmware *fw;
+	const struct firmware *fw __free(firmware) = NULL;
 	char fw_path[32];
 
 	sprintf(fw_path, "cs46xx/%s", fw_name);
@@ -395,10 +395,8 @@ static int load_firmware(struct snd_cs46xx *chip,
 	if (err < 0)
 		return err;
 	fwsize = fw->size / 4;
-	if (fwsize < 2) {
-		err = -EINVAL;
-		goto error;
-	}
+	if (fwsize < 2)
+		return -EINVAL;
 
 	err = -ENOMEM;
 	module = kzalloc_obj(*module);
@@ -454,14 +452,12 @@ static int load_firmware(struct snd_cs46xx *chip,
 	}
 
 	*module_ret = module;
-	release_firmware(fw);
 	return 0;
 
  error_inval:
 	err = -EINVAL;
  error:
 	free_module_desc(module);
-	release_firmware(fw);
 	return err;
 }
 
@@ -500,22 +496,18 @@ MODULE_FIRMWARE("cs46xx/ba1");
 
 static int load_firmware(struct snd_cs46xx *chip)
 {
-	const struct firmware *fw;
+	const struct firmware *fw __free(firmware) = NULL;
 	int i, size, err;
 
 	err = request_firmware(&fw, "cs46xx/ba1", &chip->pci->dev);
 	if (err < 0)
 		return err;
-	if (fw->size != sizeof(*chip->ba1)) {
-		err = -EINVAL;
-		goto error;
-	}
+	if (fw->size != sizeof(*chip->ba1))
+		return -EINVAL;
 
 	chip->ba1 = vmalloc(sizeof(*chip->ba1));
-	if (!chip->ba1) {
-		err = -ENOMEM;
-		goto error;
-	}
+	if (!chip->ba1)
+		return -ENOMEM;
 
 	memcpy_le32(chip->ba1, fw->data, sizeof(*chip->ba1));
 
@@ -524,11 +516,9 @@ static int load_firmware(struct snd_cs46xx *chip)
 	for (i = 0; i < BA1_MEMORY_COUNT; i++)
 		size += chip->ba1->memory[i].size;
 	if (size > BA1_DWORD_SIZE * 4)
-		err = -EINVAL;
+		return -EINVAL;
 
- error:
-	release_firmware(fw);
-	return err;
+	return 0;
 }
 
 static __maybe_unused int snd_cs46xx_download_image(struct snd_cs46xx *chip)
-- 
2.55.0

