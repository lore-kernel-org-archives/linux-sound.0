Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A283BA249
	for <linux-sound@vger.kernel.org>; Thu,  6 Aug 2026 14:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786024829; cv=none; b=UB0KbxelUUMXgtv0wTnpuXH+XJC2v9l0cg4pz0wGVYSYNYbeJ/hzkYMXChi7sM7W5DOq+pH8X1h4gOytBxi+VlaW0+bSDZ3IlGtRb+0QB95u4+h/r7pEEquJvvjLIjgMMJ/nxwjKYA7cJhqyUg3ZZPhrX2rzxuYqQsR9T6L7vYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786024829; c=relaxed/simple;
	bh=SoAzrj5Mk3nQ6ihlnCUI6r1qS4X5LHLB3Bv+wh5n4Ns=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zey+SbmZb7YNrk38Jv7QyQIkV+YEqqsSMuOYm8hzmflaQZ6A4Ve0OY6egtqNwDmnxsZspn77MOKpHTdyBfW8ylPIwQEg0kdOGiVAARUGmnQgp/kXZD4WfVH4HDZUcbgFnEUhSJjtKf7ZfDTQwIrgixUOi0txSEyeJNhvpggPZ6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=oCbJemmV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GQ7/boAp; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=aO2q+0FV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ixLM1ehe; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oCbJemmV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GQ7/boAp";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="aO2q+0FV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ixLM1ehe"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 83D4C800A8;
	Thu,  6 Aug 2026 14:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786024821; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cE/TMiiNabV6W7mQZVmvW6RDffKMo1/Ce2q+C/exER8=;
	b=oCbJemmVjYmAnL5Knvjc8CJpKaD4PPSTeZpKkoFo/R3A6DnbAZLnEr7Q4FPUErn15hkaWD
	/0kSk76VNFN6YJcP1vPt1Hy9OqpsYKWx2VUhrP7zcZ9PjDGaHJM8rBobydd2QBzoJpxsnj
	g2bGuOoK23qwVKLXm0chfrUtxHQj/zI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786024821;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cE/TMiiNabV6W7mQZVmvW6RDffKMo1/Ce2q+C/exER8=;
	b=GQ7/boAp8sskeM9ceATUwPPMnEenblDig9/iGZ2+WhbG2MlB5D4YSDnIIU+dN2Sj1PM04C
	0ov4ak20y98UVGAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786024817; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cE/TMiiNabV6W7mQZVmvW6RDffKMo1/Ce2q+C/exER8=;
	b=aO2q+0FVq6BqD8GwR8cdLBPK8inXidR6t9e9tv2vMJqI2NWWgLVfSGWT3CVJTY8oKsjVnD
	qezxcn/3M2Tw3L6cSIr4zZISBPutWBJN/oLsx2gK5TVQ/0a73LTNQtzz0kdfebH143/YqN
	d/kMQQI+BCnXvgJy1hZ5X5sa7wOe6nU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786024817;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cE/TMiiNabV6W7mQZVmvW6RDffKMo1/Ce2q+C/exER8=;
	b=ixLM1ehe87pMJEQcqfCUbjLfb0v+EQiX6SD2u2tLTwjWhlsIC3cbMGKklDhAQvE0hhfM8T
	hJzQy+K5M42r4zCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8F059779CD;
	Thu,  6 Aug 2026 14:00:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KFBrIWqTdGqbOwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 06 Aug 2026 14:00:10 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH v2 04/31] ASoC: aw88261: Use auto-cleanup for firmware loading
Date: Thu,  6 Aug 2026 15:59:36 +0200
Message-ID: <20260806140006.1412298-5-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 

Simplify the code to manage the firmware loading with __free(firmware)
auto-cleanup.

Only the code refactoring, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/aw88261.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/aw88261.c b/sound/soc/codecs/aw88261.c
index acbd7de2e40e..b8d06534bc8f 100644
--- a/sound/soc/codecs/aw88261.c
+++ b/sound/soc/codecs/aw88261.c
@@ -1149,7 +1149,7 @@ static int aw88261_dev_init(struct aw88261 *aw88261, struct aw_container *aw_cfg
 
 static int aw88261_request_firmware_file(struct aw88261 *aw88261)
 {
-	const struct firmware *cont = NULL;
+	const struct firmware *cont __free(firmware) = NULL;
 	struct aw_container *aw_cfg;
 	const char *fw_name;
 	int ret;
@@ -1169,13 +1169,11 @@ static int aw88261_request_firmware_file(struct aw88261 *aw88261)
 			fw_name, cont ? cont->size : 0);
 
 	aw_cfg = devm_kzalloc(aw88261->aw_pa->dev, struct_size(aw_cfg, data, cont->size), GFP_KERNEL);
-	if (!aw_cfg) {
-		release_firmware(cont);
+	if (!aw_cfg)
 		return -ENOMEM;
-	}
+
 	aw_cfg->len = (int)cont->size;
 	memcpy(aw_cfg->data, cont->data, cont->size);
-	release_firmware(cont);
 
 	aw88261->aw_cfg = aw_cfg;
 
-- 
2.55.0

