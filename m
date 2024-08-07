Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407EE201241
	for <linux-sound@vger.kernel.org>; Wed,  7 Aug 2024 13:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723037669; cv=none; b=Nf9kRpAIiYzUVtuwC1hXsqIAPNtSOhEknKKncU7NHvNiv1DpueTI4ThL6ePyyoDph64V+Wf/GWKjZ5oxJi46bfyZImJJyJVVaQdFZhUE1x3cnZ3whSufsvqYukFiW8bQsWEliPkt9iUzkN/e1l7+ZI74K4gnEbUVq+LDVe4VbTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723037669; c=relaxed/simple;
	bh=KASPyrgG7QeWWCUrE4g4qkDcAc8LgM/uacrkKVy/Rbo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jM/t9siXTEKqxGuqgGNApGs1499pTZkAtxlJGCdI4VGHY+uTiWXMHIKVy7jmDufj/JMOsi4jPDJE7k1SPVhm4CFse83mbVqisU9MrSgU8QGqrcrEQPdXpmXhn5b5xq6aBQIPs8mazGNgwTEE6zsvm6Cg/+afjHD5+P49+rC0pBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RPH4JeTE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HoOBvmux; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RPH4JeTE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HoOBvmux; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RPH4JeTE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HoOBvmux";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RPH4JeTE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HoOBvmux"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 56A2F1F396;
	Wed,  7 Aug 2024 13:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037662; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kJ/28Mz2vVlfoKZkj7L2w3jC6UIM8+W7kRudm4rgYf0=;
	b=RPH4JeTEVanuqQBz7A20R6nbEqMRZ9Eau2bMYYfUm454ucufq9ssV6SUBuHoTuwUkqz+c4
	jP0ww/olJRwCbb7Dp0lomByg1ck59YdTemZ8IMDcoin28FGmaX5RRfRocPvDYCHAIdHLFS
	Yrm7LvZpQzO/2sZVZ7By1TviNv6rb+8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037662;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kJ/28Mz2vVlfoKZkj7L2w3jC6UIM8+W7kRudm4rgYf0=;
	b=HoOBvmuxURhs7Iv9zni3iLNi0jiwdygw/RAlSG7H6L9zdNNhIIFbNYztWGuipRVY+Yd2Ss
	SEDgm9+vTFeQ9ODg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037662; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kJ/28Mz2vVlfoKZkj7L2w3jC6UIM8+W7kRudm4rgYf0=;
	b=RPH4JeTEVanuqQBz7A20R6nbEqMRZ9Eau2bMYYfUm454ucufq9ssV6SUBuHoTuwUkqz+c4
	jP0ww/olJRwCbb7Dp0lomByg1ck59YdTemZ8IMDcoin28FGmaX5RRfRocPvDYCHAIdHLFS
	Yrm7LvZpQzO/2sZVZ7By1TviNv6rb+8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037662;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kJ/28Mz2vVlfoKZkj7L2w3jC6UIM8+W7kRudm4rgYf0=;
	b=HoOBvmuxURhs7Iv9zni3iLNi0jiwdygw/RAlSG7H6L9zdNNhIIFbNYztWGuipRVY+Yd2Ss
	SEDgm9+vTFeQ9ODg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3F47413B03;
	Wed,  7 Aug 2024 13:34:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MORVDt53s2ZpVgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Aug 2024 13:34:22 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 42/54] ALSA: trident: Use standard print API
Date: Wed,  7 Aug 2024 15:34:32 +0200
Message-ID: <20240807133452.9424-43-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240807133452.9424-1-tiwai@suse.de>
References: <20240807133452.9424-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [0.21 / 50.00];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.19)[-0.953];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: 0.21

Use the standard print API with dev_*() instead of the old house-baked
one.  It gives better information and allows dynamically control of
debug prints.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/trident/trident_memory.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/pci/trident/trident_memory.c b/sound/pci/trident/trident_memory.c
index 05de2b9f4ed7..4a36f194c7f8 100644
--- a/sound/pci/trident/trident_memory.c
+++ b/sound/pci/trident/trident_memory.c
@@ -137,14 +137,14 @@ search_empty(struct snd_util_memhdr *hdr, int size)
 /*
  * check if the given pointer is valid for pages
  */
-static int is_valid_page(unsigned long ptr)
+static int is_valid_page(struct snd_trident *trident, unsigned long ptr)
 {
 	if (ptr & ~0x3fffffffUL) {
-		snd_printk(KERN_ERR "max memory size is 1GB!!\n");
+		dev_err(trident->card->dev, "max memory size is 1GB!!\n");
 		return 0;
 	}
 	if (ptr & (SNDRV_TRIDENT_PAGE_SIZE-1)) {
-		snd_printk(KERN_ERR "page is not aligned\n");
+		dev_err(trident->card->dev, "page is not aligned\n");
 		return 0;
 	}
 	return 1;
@@ -184,7 +184,7 @@ snd_trident_alloc_sg_pages(struct snd_trident *trident,
 	for (page = firstpg(blk); page <= lastpg(blk); page++, idx++) {
 		unsigned long ofs = idx << PAGE_SHIFT;
 		dma_addr_t addr = snd_pcm_sgbuf_get_addr(substream, ofs);
-		if (! is_valid_page(addr)) {
+		if (!is_valid_page(trident, addr)) {
 			__snd_util_mem_free(hdr, blk);
 			mutex_unlock(&hdr->block_mutex);
 			return NULL;
@@ -227,7 +227,7 @@ snd_trident_alloc_cont_pages(struct snd_trident *trident,
 	addr = runtime->dma_addr;
 	for (page = firstpg(blk); page <= lastpg(blk); page++,
 	     addr += SNDRV_TRIDENT_PAGE_SIZE) {
-		if (! is_valid_page(addr)) {
+		if (!is_valid_page(trident, addr)) {
 			__snd_util_mem_free(hdr, blk);
 			mutex_unlock(&hdr->block_mutex);
 			return NULL;
-- 
2.43.0

