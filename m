Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F87318C02E
	for <linux-sound@vger.kernel.org>; Tue, 10 Sep 2024 11:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725967859; cv=none; b=I7Xv/m4b8+8vi5mOzRAJOLJTUN2HRfZu4F0ot9mcGJbPaYUctn3jTZuOtPq06ucTAZbEASSGY3xVLPVvaJ/gQSFmOBoTFBOItDkaFzQZI0meL3OPIc83zI8Ndduo8I4DUXdzuXO2DXvYMKyVQgdYKsx+8h9DB4skbfIbL8ey98M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725967859; c=relaxed/simple;
	bh=8z/W7DXQMNT3n4aRNW4C9dBfuYUFMMZ39FF+ZqLknGg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=e5cuuAs7Bm81P5CQcgqlYV1IH8mOLi005XWbXIEJtRnaPfXKCCSbVvVimweoTKo7WxCdgfDKvjnuz9JiD7es6GPkKOOcq2SSE7U777QBD9g7WsSmfetgdIZlsTwu6Jb+1pD+nJN0tWQZcczieTCEVSBPlCwMjUsJ+yxLXDH5llY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vfxEF2/f; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mTt5pH7z; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HAxsaQz3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kR+QuXag; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vfxEF2/f";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mTt5pH7z";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HAxsaQz3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kR+QuXag"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0394421A25;
	Tue, 10 Sep 2024 11:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1725967856; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=EF+KY4b6oIoE9TlDldJWcVJZDHVjpPF/CZzvMlZMGaU=;
	b=vfxEF2/fpNgiiBHuWsTir+PwQD9JtkIxMCT3OSLMuVdvdcjr8nCq4xOwwU878Gl3+hzWKB
	ZK4hIisy+x6toeqolZKzg0NdA3lFO5DykA7PAIfIT4KqH/jKqYbmoWjh+WoYcqBt3I2/yB
	mo7ptLFfzH5IuoRcurlN5qTay5kgl9E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725967856;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=EF+KY4b6oIoE9TlDldJWcVJZDHVjpPF/CZzvMlZMGaU=;
	b=mTt5pH7zgLYy0q/lfTGwUq0w9i9yeKIdsGKikG0hNTgiByLk8Y15YtdKNWKTAUpRGRgMPL
	dG7XPTxq7rzbhbAw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=HAxsaQz3;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=kR+QuXag
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1725967855; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=EF+KY4b6oIoE9TlDldJWcVJZDHVjpPF/CZzvMlZMGaU=;
	b=HAxsaQz354VQMDAHiSHAQBZzYBLqh73Gr1N6XqB/JK1NYW/wyVq3c0bFaqHG4uVGw1Lm1l
	Hx+3AAVoMfyQpzji4Eu+fCA85KhYLoymXYEnSuO4duhXbTu3UGaEVdtQdj5IAJhBJx0uTD
	GPVDo/+rAj85eBgIzSBkQCzjNreTAF4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725967855;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=EF+KY4b6oIoE9TlDldJWcVJZDHVjpPF/CZzvMlZMGaU=;
	b=kR+QuXag6vsqFhpbW4xLeSc1t2RMbzGlfUprjrtN8RtXQVfymqxYYww06621lYx4ZnmrPS
	suubpWg/eNgRTXCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E8E7213A3A;
	Tue, 10 Sep 2024 11:30:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id y4hNOO4t4GYOdQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 10 Sep 2024 11:30:54 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: memalloc: Move snd_malloc_ops definition into memalloc.c again
Date: Tue, 10 Sep 2024 13:31:41 +0200
Message-ID: <20240910113141.32618-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 0394421A25
X-Spam-Level: 
X-Spamd-Result: default: False [-5.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	TO_DN_NONE(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -5.01
X-Spam-Flag: NO

The definition of struct snd_malloc_ops was moved out to
memalloc_local.h since there was another code for S/G buffer
allocation referring to the struct.  But since the code change to use
non-contiguous allocators, it's solely referred in memalloc.c, hence
it makes little sense to have a separate header file.

Let's move it back to memalloc.c.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/memalloc.c       | 12 +++++++++++-
 sound/core/memalloc_local.h | 16 ----------------
 2 files changed, 11 insertions(+), 17 deletions(-)
 delete mode 100644 sound/core/memalloc_local.h

diff --git a/sound/core/memalloc.c b/sound/core/memalloc.c
index 1d931c24fa35..b21dba4b374a 100644
--- a/sound/core/memalloc.c
+++ b/sound/core/memalloc.c
@@ -17,7 +17,17 @@
 #include <asm/set_memory.h>
 #endif
 #include <sound/memalloc.h>
-#include "memalloc_local.h"
+
+struct snd_malloc_ops {
+	void *(*alloc)(struct snd_dma_buffer *dmab, size_t size);
+	void (*free)(struct snd_dma_buffer *dmab);
+	dma_addr_t (*get_addr)(struct snd_dma_buffer *dmab, size_t offset);
+	struct page *(*get_page)(struct snd_dma_buffer *dmab, size_t offset);
+	unsigned int (*get_chunk_size)(struct snd_dma_buffer *dmab,
+				       unsigned int ofs, unsigned int size);
+	int (*mmap)(struct snd_dma_buffer *dmab, struct vm_area_struct *area);
+	void (*sync)(struct snd_dma_buffer *dmab, enum snd_dma_sync_mode mode);
+};
 
 #define DEFAULT_GFP \
 	(GFP_KERNEL | \
diff --git a/sound/core/memalloc_local.h b/sound/core/memalloc_local.h
deleted file mode 100644
index 8b19f3a68a4b..000000000000
--- a/sound/core/memalloc_local.h
+++ /dev/null
@@ -1,16 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-#ifndef __MEMALLOC_LOCAL_H
-#define __MEMALLOC_LOCAL_H
-
-struct snd_malloc_ops {
-	void *(*alloc)(struct snd_dma_buffer *dmab, size_t size);
-	void (*free)(struct snd_dma_buffer *dmab);
-	dma_addr_t (*get_addr)(struct snd_dma_buffer *dmab, size_t offset);
-	struct page *(*get_page)(struct snd_dma_buffer *dmab, size_t offset);
-	unsigned int (*get_chunk_size)(struct snd_dma_buffer *dmab,
-				       unsigned int ofs, unsigned int size);
-	int (*mmap)(struct snd_dma_buffer *dmab, struct vm_area_struct *area);
-	void (*sync)(struct snd_dma_buffer *dmab, enum snd_dma_sync_mode mode);
-};
-
-#endif /* __MEMALLOC_LOCAL_H */
-- 
2.43.0

