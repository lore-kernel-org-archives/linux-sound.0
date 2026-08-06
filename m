Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312663DA7DF
	for <linux-sound@vger.kernel.org>; Thu,  6 Aug 2026 14:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786024842; cv=none; b=aMRzXiaOOOPGV5O/ARqwEDsD8lHnoPUK0f3W9GQLD91Oiw1hzM8LdRAkLZy7dP9h2BPrug0RkONS9vi8x+9nFVR6a3UesH3xFWm7UrasX7e/hRQskIUxSlJSzg5wXMUREizwnFPFlbR+yNAFqyr071IML9qYctYK4c9M1YfXr/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786024842; c=relaxed/simple;
	bh=bnTUhT33frgDJhUiZJLHLkw98Xlzu6s3rj+fr9RbX5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FNwxgaeR3dFVP5U3Ju9uBL7JbqOIb/4TuRVAct6aDSFPM13gDoQOe4udU4lmXT3qRp3sfET2PD2kmwBfnpMx5w6QNhtqT7bplic+nqhEW3saqJVMYEkqQlbRXqhrO8cpGdJE6aPrY61QFMaXcoA8++xmXoZcR4kY+7P2a89Mgps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Yp6evPPc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XrtNSu/1; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gjbsoYMq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=EyXZJPLc; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Yp6evPPc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XrtNSu/1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gjbsoYMq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="EyXZJPLc"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 17E5A800E1;
	Thu,  6 Aug 2026 14:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786024831; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZOjua0OdSLzmZx4yjj3ISQz4EQ1MytlJlwFxqB8mgUM=;
	b=Yp6evPPcUnfEyWalDA8EUSVke4qTfKFGPc7NICeBD9sMVWHevGOvxw/k8iAqdGjKxB0XM7
	uBXa6UJq5xvHFxEcLF+KydSandITPYx4IRjkJMStSLDT9DbNgLEUQtUbjfY7XO4bIXvlSc
	mJVpsA1XbD3W231L+v/xXY4fUSKtJSk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786024831;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZOjua0OdSLzmZx4yjj3ISQz4EQ1MytlJlwFxqB8mgUM=;
	b=XrtNSu/1niEj83ZNKhj3Lb17n4SCZxCAPcs2PnPrkqsEgWbTEZLeJwqC4uNJeRmpjTssOT
	VQecBxgOuRtx5ABg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786024827; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZOjua0OdSLzmZx4yjj3ISQz4EQ1MytlJlwFxqB8mgUM=;
	b=gjbsoYMqY1r7HC113ZMtLutO4nukFqunJ2wmHfJNcVvgtj50ZUhtLoPOCekPDZ/XrlC1tv
	lmmTQrSuNSSWR0wj0WdkTweFmTnH6WcaqXxqHLzldwz2pAIXfG+g02isyTA4hxMLR7sHHm
	IVyJUnPzXMHU5474s+8DUAZPLCom9Kc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786024827;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZOjua0OdSLzmZx4yjj3ISQz4EQ1MytlJlwFxqB8mgUM=;
	b=EyXZJPLcHBAWjFNiJCpbIlCGpApKij03KFtiC6n3CNVCYf0zckLSE56n0R/TqPeKU72gk8
	lY5uwcBGyqejXNBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7576077A28;
	Thu,  6 Aug 2026 14:00:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id aJvhGnCTdGqbOwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 06 Aug 2026 14:00:16 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH v2 29/31] ASoC: renesas: Use auto-cleanup for firmware loading
Date: Thu,  6 Aug 2026 16:00:01 +0200
Message-ID: <20260806140006.1412298-30-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260806140006.1412298-1-tiwai@suse.de>
References: <20260806140006.1412298-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]

Simplify the code to manage the firmware loading with __free(firmware)
auto-cleanup.

Only the code refactoring, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/renesas/siu_dai.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/renesas/siu_dai.c b/sound/soc/renesas/siu_dai.c
index 039b1264d90d..85dee9025710 100644
--- a/sound/soc/renesas/siu_dai.c
+++ b/sound/soc/renesas/siu_dai.c
@@ -715,7 +715,6 @@ static struct snd_soc_dai_driver siu_i2s_dai = {
 
 static int siu_probe(struct platform_device *pdev)
 {
-	const struct firmware *fw_entry;
 	struct resource *res, *region;
 	struct siu_info *info;
 	int ret;
@@ -726,6 +725,7 @@ static int siu_probe(struct platform_device *pdev)
 	siu_i2s_data = info;
 	info->dev = &pdev->dev;
 
+	const struct firmware *fw_entry __free(firmware) = NULL;
 	ret = request_firmware(&fw_entry, "siu_spb.bin", &pdev->dev);
 	if (ret)
 		return ret;
@@ -736,8 +736,6 @@ static int siu_probe(struct platform_device *pdev)
 	 */
 	memcpy(&info->fw, fw_entry->data, fw_entry->size);
 
-	release_firmware(fw_entry);
-
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res)
 		return -ENODEV;
-- 
2.55.0

