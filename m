Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693513AEB5F
	for <linux-sound@vger.kernel.org>; Thu,  6 Aug 2026 14:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786024842; cv=none; b=sFRBwftQSZE6MKKu1Bm3li+yXO02lb60KSTmQYeYqxla5U1/NvRgh9ajBwrA53RqsqSfc/g+7lY4Xle/970ehe1X2gxyosZy7D4WFajdwHXvFKsy8s5Rh2FN1OlMBQehX9IZniUrCAvZLpF+5QaYasT7UlBt0LgoSL5lWWgSmj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786024842; c=relaxed/simple;
	bh=+OjMTp5NyZ97l1/TGWfcK92Ob9Am397probQYFXo/Zc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I+NufBiOPYmoeZbsR5Da/ySULYD+b2b/zaCxTQf6TmqJZMzKtaTxUfVOP6qcptQVIhbdtdx+yWPudhbeAWS0d1iVsMMcF3OQWiT49Xz8dls0qRhxm2c99ZpRzjL+xUw2DZFdVUZNuhISO+HhSwi4J+B1jmPwuQRDqd76OxBnKFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0Y3A9c8c; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FQ31FMJr; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ji6s8sF+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=u7puM4Lq; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0Y3A9c8c";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FQ31FMJr";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ji6s8sF+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="u7puM4Lq"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0C272800E0;
	Thu,  6 Aug 2026 14:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786024831; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h60vDJUhvJ2oq/HWXBR9xeNJ2Zg2fmBJIj/n4KhixQs=;
	b=0Y3A9c8cz/WRevIgRD+eEaNfKZmC5I5D+QsCj6KHkd1JTYpJwaxsEDMkaXvbE3mlSMZFxQ
	eOTs3HO78uqaCEd5qgs8KOM+z9+4UoG8vJRD4ffFw6ejLPNc4cU0bSsIvvHHURutxJxGHX
	O/TM7REGqwIhs8XhVYMQyLUAvR7tcl8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786024831;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h60vDJUhvJ2oq/HWXBR9xeNJ2Zg2fmBJIj/n4KhixQs=;
	b=FQ31FMJrk/mYXkdJAPKlYm81Au8zNK3wPEguvnRzOUhnhH4eifKIvwxti5Qe0uSkY2Y5ul
	EfBDm7+IOXbIneAQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Ji6s8sF+;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=u7puM4Lq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786024827; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h60vDJUhvJ2oq/HWXBR9xeNJ2Zg2fmBJIj/n4KhixQs=;
	b=Ji6s8sF+fTBLINFwTi+hKOxoIQKiyt+ysZ98Msw1k6iENZ+fynrDrOU/3vAsW/qaLNnEYc
	dQ8q7A+stEKQAOQF0SMIBFlzPfiMGCjGvfmjm6pV4HpyehXC31B/SkCYgNV++sIWf74AyY
	rbxkWVs6AbxGejJOw2ZnAv4iMJUX8cE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786024827;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h60vDJUhvJ2oq/HWXBR9xeNJ2Zg2fmBJIj/n4KhixQs=;
	b=u7puM4LqYTIE9hY3TqH/HjzNqI2mcW+uOPbclgDt1YrmTnkD8YQ5W7yMjgTo+px4W6SOg3
	z9ocpguLAnP0nxBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0367D77A26;
	Thu,  6 Aug 2026 14:00:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mPtjOm+TdGqbOwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 06 Aug 2026 14:00:15 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 27/31] ASoC: Intel: catpt: Use auto-cleanup for firmware loading
Date: Thu,  6 Aug 2026 15:59:59 +0200
Message-ID: <20260806140006.1412298-28-tiwai@suse.de>
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
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,intel.com:email];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Queue-Id: 0C272800E0
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

Simplify the code to manage the firmware loading with __free(firmware)
auto-cleanup.

Only the code refactoring, no functional changes.

Cc: Cezary Rojewski <cezary.rojewski@intel.com>
Acked-by: Cezary Rojewski <cezary.rojewski@intel.com>
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

