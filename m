Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918BE2FA0C7
	for <linux-sound@vger.kernel.org>; Thu, 23 Apr 2026 07:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776930743; cv=none; b=oLW4p0FJp5GrHTHVEMJty4C9j07ev/Mp0CMbSwW2d8KrivKGRXXUhcdI8mzPqg2p3PXpsag38yUTVm44L21Aj7gZ8mfhaM/ZMryYd7/H06F7oKKVMkAHFcteJ2O5FP5oJmdQWDckkoMshj7Zp2fVYXXDFXRMCiEm11k0WxHqsWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776930743; c=relaxed/simple;
	bh=AVGP1wq7lg8q5U4F+OvjIbyXzPes12g+OQZUWNKy8jY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TAQLgEnr5GndsP16hJc/POQv8ciq/aNhxTlhJ/5fV0fj4g5j3K39k12qU8mlZQzvni6vY4wOtbGQ7zQzVH/2jzopD4sQxNuIMAIbRROO/S9CHhsF2vqHTmKfvtnypyekVB7r/i9xwChKtsQIfzD5OyIsx4X8l1WMIA/JKyB5+sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=y9FC5E/I; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ecpa8wyH; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=y9FC5E/I; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ecpa8wyH; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="y9FC5E/I";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ecpa8wyH";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="y9FC5E/I";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ecpa8wyH"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C3ECE5BCED;
	Thu, 23 Apr 2026 07:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776930734; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=tDQme583FPQGXR+lg9no3PypllhlGca+6ugKvIR90Ew=;
	b=y9FC5E/IZdmovc5IVb7UPF3ryM5w2HTb6c1Orv4jBopcsauyKDJL4CrkRy/TMC8JgKdYuV
	32jXYSOGrzIS7T9XWqvMlTax5q/Rn5B5XYzYZl+8f5K1p2FQntBA5wixRpADq1LyZ7kYbk
	1b8o/9UQH9a6h9wS/ALPjldGfWW+zhs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776930734;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=tDQme583FPQGXR+lg9no3PypllhlGca+6ugKvIR90Ew=;
	b=ecpa8wyHN47jSZspa4wBjsyGBZLSLM3tcX2GRrjZ6VgDdg3Jqz/VKKRyP/zQO1+GieH+wY
	JV5ANcJrhX+1KFCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776930734; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=tDQme583FPQGXR+lg9no3PypllhlGca+6ugKvIR90Ew=;
	b=y9FC5E/IZdmovc5IVb7UPF3ryM5w2HTb6c1Orv4jBopcsauyKDJL4CrkRy/TMC8JgKdYuV
	32jXYSOGrzIS7T9XWqvMlTax5q/Rn5B5XYzYZl+8f5K1p2FQntBA5wixRpADq1LyZ7kYbk
	1b8o/9UQH9a6h9wS/ALPjldGfWW+zhs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776930734;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=tDQme583FPQGXR+lg9no3PypllhlGca+6ugKvIR90Ew=;
	b=ecpa8wyHN47jSZspa4wBjsyGBZLSLM3tcX2GRrjZ6VgDdg3Jqz/VKKRyP/zQO1+GieH+wY
	JV5ANcJrhX+1KFCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A4BA3593A3;
	Thu, 23 Apr 2026 07:52:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 22EIJ67P6Wn7TQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 23 Apr 2026 07:52:14 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH] Revert "ALSA: pcmtest: fix reference leak on failed device registration"
Date: Thu, 23 Apr 2026 09:52:05 +0200
Message-ID: <20260423075211.3977366-1-tiwai@suse.de>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 

We'd like to address the problem rather in the error code path of
platform_device_register() itself instead of leaving it all callers,
since less than 1% of all callers of over 100
platform_device_register() do call platform_device_put() properly as
of now.

For making the work easier, revert the previous change commit
4ff036f95238 ("ALSA: pcmtest: fix reference leak on failed device
registration") again.

Link: https://lore.kernel.org/20260415193138.3861297-1-lgs201920130244@gmail.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/pcmtest.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/drivers/pcmtest.c b/sound/drivers/pcmtest.c
index fe31ff1e5b3c..5bfec4c7bf71 100644
--- a/sound/drivers/pcmtest.c
+++ b/sound/drivers/pcmtest.c
@@ -756,10 +756,8 @@ static int __init mod_init(void)
 	if (err)
 		goto err_free_patterns;
 	err = platform_device_register(&pcmtst_pdev);
-	if (err) {
-		platform_device_put(&pcmtst_pdev);
+	if (err)
 		goto err_clear_debug;
-	}
 	err = platform_driver_register(&pcmtst_pdrv);
 	if (err) {
 		platform_device_unregister(&pcmtst_pdev);
-- 
2.53.0

