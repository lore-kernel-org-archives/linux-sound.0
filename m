Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24533472F66
	for <linux-sound@vger.kernel.org>; Wed,  5 Aug 2026 13:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785938007; cv=none; b=hSWTUNng7s/2RU/aCoeND3o3tmE4pSn9oeZciAbUWoNEcJY3mool/HdqJirZzgdjvOXu3PynxkMjZxggniK+bZvLsvRtZdnh76+MOhmoRjSNM76eWvZra1d3SmEy7lc37XCjMwcYlTRL1JtmVaYMLKGAXGO9L8cut8zSHca92rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785938007; c=relaxed/simple;
	bh=WYfMQhrmoFbIn8s+hpdKRzrQ4H0gsImjrWMEGk/Msas=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QKI+J5DEw9naLp15yNdXplv6f6BoJdTccpvWfHYXhNPpLLp851oVTsz6iq/VQMXgM1zE4bS5ALG6mKlRtHSpkmFjDdNMtJtNc+0DlkpqmmzPbvMITHeHFoX4PY9S92PaPawbMJbkCLit1RkmQRngMcJJrnO0tpSgqPl2Pt4Jomk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=lxDiCPR5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=EOj2XY+2; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=E+bP0QeF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nRHB8KWw; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lxDiCPR5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="EOj2XY+2";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="E+bP0QeF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nRHB8KWw"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 91CC33E02;
	Wed,  5 Aug 2026 13:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785937996; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iABmszcpMb3HdaGAEwAh1/Rpua8ipbJ4yEPyVQZSddw=;
	b=lxDiCPR5s+vRpdxjGUO5gwP6TEdUk0/Uok9otdb0OJT+lTATGreEgt3jErDw/thYKrN7/e
	4QzU4iG4OP7RrTqyo//6J6Jrk4m/l/wzDmHIccKsP9TK7Zq5VZ/AI9G5YXdLLSlT6QeDcx
	eJBJXdnfmiOhKmTr36JbRKeYihUA2BQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785937996;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iABmszcpMb3HdaGAEwAh1/Rpua8ipbJ4yEPyVQZSddw=;
	b=EOj2XY+2LU4pHJrZY7OgTTvsowGj0CPD1gpGdPQSBicNTB3YVIXNIs/Y+CQN6GIv9zummy
	hItp+fapb6YDfcCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785937992; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iABmszcpMb3HdaGAEwAh1/Rpua8ipbJ4yEPyVQZSddw=;
	b=E+bP0QeF6lvvq3v322/8tGmK4wUBdqqBR0ZTdO/vjHFv8J3QON2rx182pyJMIYPLJN7ajV
	AGaq2R2h4RFWHLlKHmzFBZyx6u8cXf8PnPBS/WqrpxFo+/ZAXwn/NldzTTLLd6O9dTOcSj
	W1Dm+Us/mjKBkoL+2RLmx01cWUHa0MU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785937992;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iABmszcpMb3HdaGAEwAh1/Rpua8ipbJ4yEPyVQZSddw=;
	b=nRHB8KWwf1BEFP7Ogx/Q7rsHUstn6DV464RSaaHy2XY6IR0EkaPKgoRP1phZcUjPvVNd4h
	fk+ftaDCDPq7lhBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C46F077A04;
	Wed,  5 Aug 2026 13:52:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id oG/QLjtAc2ouSQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 05 Aug 2026 13:52:59 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 27/31] ASoC: Intel: catpt: Use auto-cleanup for firmware loading
Date: Wed,  5 Aug 2026 15:52:28 +0200
Message-ID: <20260805135247.670693-28-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260805135247.670693-1-tiwai@suse.de>
References: <20260805135247.670693-1-tiwai@suse.de>
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
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo,intel.com:email];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 

Simplify the code to manage the firmware loading with __free(firmware)
auto-cleanup.

Only the code refactoring, no functional changes.

Cc: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/intel/catpt/loader.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/sound/soc/intel/catpt/loader.c b/sound/soc/intel/catpt/loader.c
index e7ba9e1e60ae..724cbe337db4 100644
--- a/sound/soc/intel/catpt/loader.c
+++ b/sound/soc/intel/catpt/loader.c
@@ -568,27 +568,24 @@ static int catpt_request_load_firmware(struct catpt_dev *cdev, struct dma_chan *
 				       const char *name, bool restore)
 {
 	struct catpt_fw_hdr *fw;
-	struct firmware *img;
 	dma_addr_t paddr;
 	void *vaddr;
 	int ret;
 
-	ret = request_firmware((const struct firmware **)&img, name, cdev->dev);
+	const struct firmware *img __free(firmware) = NULL;
+	ret = request_firmware(&img, name, cdev->dev);
 	if (ret)
 		return ret;
 
 	fw = (struct catpt_fw_hdr *)img->data;
 	if (strncmp(fw->signature, FW_SIGNATURE, FW_SIGNATURE_SIZE)) {
 		dev_err(cdev->dev, "firmware signature mismatch\n");
-		ret = -EINVAL;
-		goto release_fw;
+		return -EINVAL;
 	}
 
 	vaddr = dma_alloc_coherent(cdev->dev, img->size, &paddr, GFP_KERNEL);
-	if (!vaddr) {
-		ret = -ENOMEM;
-		goto release_fw;
-	}
+	if (!vaddr)
+		return -ENOMEM;
 
 	memcpy(vaddr, img->data, img->size);
 	fw = (struct catpt_fw_hdr *)vaddr;
@@ -598,8 +595,6 @@ static int catpt_request_load_firmware(struct catpt_dev *cdev, struct dma_chan *
 		ret = catpt_load_firmware(cdev, chan, paddr, fw);
 
 	dma_free_coherent(cdev->dev, img->size, vaddr, paddr);
-release_fw:
-	release_firmware(img);
 	return ret;
 }
 
-- 
2.55.0

