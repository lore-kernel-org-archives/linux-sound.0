Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78844320CBF
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 14:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756478782; cv=none; b=URmtnhPQWAK7+0+nOxuI7hf3G+onkbYroJFfrRTGYIs4i865ZGBryRA4OFJAzclvE3etEHKUvRmGOeDkBzYqUP9F2VJDtRannypj3z1thrL6l0zH2h9ZQBv1+KA/k5aIYYtDppBcBlstkTTzLSF5dcMc9QiB6Ct6qgQ3iO977l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756478782; c=relaxed/simple;
	bh=eW/eweRIs8xGWtmdHRZUrqoFcwRyNEnExmMPW/8+1bc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oNdlU9j0hJKoUogxtKzqxs02Pu6CU5m7H1DXteyMS4PHCRNDDO0F0sGRq3erxvuPCTdQpqVh521MoJGV3tvXxbwA0tG5hY8tSK4X6ayEv/pvjV+AnhV8OWzNeJY2Gep8vy0gchH13AjhjdOdKGAEIotJKesxmnEwgAEDHvwJ0ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zCkgTJjM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lDOrDym4; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BzD/nczj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ov0J3uYY; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zCkgTJjM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lDOrDym4";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BzD/nczj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ov0J3uYY"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id EAEF333ED6;
	Fri, 29 Aug 2025 14:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478644; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zBSKsxxxEOOQ/vMvFNpF08M4nwrk2noUEzGvQBP5nBA=;
	b=zCkgTJjMSCatfRmks7UKP4UYOKMEEEA/UIXKXmhlZmrlush1/iw0fVZgkccK9hi0Wpgmhi
	ZzVC1VZ9NNU/DBMOUhaoFrrmWpCwXG6u9kPPxJRIh+mTDptDbKS+KWI78UiLGDP78Efqk3
	r0IWkFvi6cGEvdd1PElsxPTo+GPyI3A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478644;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zBSKsxxxEOOQ/vMvFNpF08M4nwrk2noUEzGvQBP5nBA=;
	b=lDOrDym4IbgzzI9l3NRmHFU6T+HHaH3NBJFTF6f2NoQRAMEx6cq/W6DcyPp4pCOx54CUu8
	L/RPqD3O76F9kTCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478643; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zBSKsxxxEOOQ/vMvFNpF08M4nwrk2noUEzGvQBP5nBA=;
	b=BzD/nczj8/tObr+JHdmzX6i1cdx2srcIqQScebJFFhceQLu6cQE5LLIn8c8E7Kb/6dEELD
	dttMFDL3O+hv7oQ/v2wxuYEcX5LQftH52DTCs+QJND48xUObYeTERqLE25IoQZSQpYBfvD
	Wp6/Gjtor1lhFVBP6k6joRKGGfn2Wko=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478643;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zBSKsxxxEOOQ/vMvFNpF08M4nwrk2noUEzGvQBP5nBA=;
	b=ov0J3uYYBv0yu/YXeDtRgOz+mWTbA3BdvCGHWqwnJCyZxxsBOLu0/YRh6laC8y5KkcP9cs
	BEpeg727bKx8dODg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D2E6B13A3E;
	Fri, 29 Aug 2025 14:44:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IAkYMrO8sWi6GAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 14:44:03 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 57/61] ALSA: trident: Use guard() for mutex locks
Date: Fri, 29 Aug 2025 16:43:32 +0200
Message-ID: <20250829144342.4290-58-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829144342.4290-1-tiwai@suse.de>
References: <20250829144342.4290-1-tiwai@suse.de>
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
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLsqo7dymd5dgmoaprf5rep8is)];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80

Replace the manual mutex lock/unlock pairs with guard() for code
simplification.

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/trident/trident_memory.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/sound/pci/trident/trident_memory.c b/sound/pci/trident/trident_memory.c
index 4a36f194c7f8..81f6348191dc 100644
--- a/sound/pci/trident/trident_memory.c
+++ b/sound/pci/trident/trident_memory.c
@@ -172,12 +172,10 @@ snd_trident_alloc_sg_pages(struct snd_trident *trident,
 
 	
 
-	mutex_lock(&hdr->block_mutex);
+	guard(mutex)(&hdr->block_mutex);
 	blk = search_empty(hdr, runtime->dma_bytes);
-	if (blk == NULL) {
-		mutex_unlock(&hdr->block_mutex);
+	if (blk == NULL)
 		return NULL;
-	}
 			   
 	/* set TLB entries */
 	idx = 0;
@@ -186,12 +184,10 @@ snd_trident_alloc_sg_pages(struct snd_trident *trident,
 		dma_addr_t addr = snd_pcm_sgbuf_get_addr(substream, ofs);
 		if (!is_valid_page(trident, addr)) {
 			__snd_util_mem_free(hdr, blk);
-			mutex_unlock(&hdr->block_mutex);
 			return NULL;
 		}
 		set_tlb_bus(trident, page, addr);
 	}
-	mutex_unlock(&hdr->block_mutex);
 	return blk;
 }
 
@@ -216,12 +212,10 @@ snd_trident_alloc_cont_pages(struct snd_trident *trident,
 	if (snd_BUG_ON(!hdr))
 		return NULL;
 
-	mutex_lock(&hdr->block_mutex);
+	guard(mutex)(&hdr->block_mutex);
 	blk = search_empty(hdr, runtime->dma_bytes);
-	if (blk == NULL) {
-		mutex_unlock(&hdr->block_mutex);
+	if (blk == NULL)
 		return NULL;
-	}
 			   
 	/* set TLB entries */
 	addr = runtime->dma_addr;
@@ -229,12 +223,10 @@ snd_trident_alloc_cont_pages(struct snd_trident *trident,
 	     addr += SNDRV_TRIDENT_PAGE_SIZE) {
 		if (!is_valid_page(trident, addr)) {
 			__snd_util_mem_free(hdr, blk);
-			mutex_unlock(&hdr->block_mutex);
 			return NULL;
 		}
 		set_tlb_bus(trident, page, addr);
 	}
-	mutex_unlock(&hdr->block_mutex);
 	return blk;
 }
 
@@ -267,12 +259,11 @@ int snd_trident_free_pages(struct snd_trident *trident,
 		return -EINVAL;
 
 	hdr = trident->tlb.memhdr;
-	mutex_lock(&hdr->block_mutex);
+	guard(mutex)(&hdr->block_mutex);
 	/* reset TLB entries */
 	for (page = firstpg(blk); page <= lastpg(blk); page++)
 		set_silent_tlb(trident, page);
 	/* free memory block */
 	__snd_util_mem_free(hdr, blk);
-	mutex_unlock(&hdr->block_mutex);
 	return 0;
 }
-- 
2.50.1

