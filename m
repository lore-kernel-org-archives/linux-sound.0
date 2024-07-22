Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38B916CD33
	for <linux-sound@vger.kernel.org>; Mon, 22 Jul 2024 13:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721656740; cv=none; b=qMjJAKZne/ahkdOGk3pqqqGt/sCNha9NqRBGu4DiMO+DK32uGa9GAotamd8ixLLpE0rVHwXBumAXIiqqrRTydwNHkpl7WJ6l+6b9tTJMGtFDwLH133Yy2LAazdngtgx03d5nq64IDQIQz+lsC5dQO250Lt4gQ7FzCKGNBzlkq5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721656740; c=relaxed/simple;
	bh=OuD8aT6LAAFi3fUQh+CtRLXTYPG+5pbrQ7jcoeALQCY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=fBAS6jW14QMDP+UPUMHXorGmCNP3QT4A5XT7Wy5x9GjST9UkzGCBI6+L84wwkeqckH8jf8RCyjo6g7psMp2PEBg+j94YRSGNDnpcIYDeWipFVOr/TCnv+3tBOPmyLNxuqjHJ6Ci86giXNFvuoKClG75kf4xSUED7gIaQK/UH5Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=chfyC8Fh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FZRD0VWZ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=chfyC8Fh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FZRD0VWZ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="chfyC8Fh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FZRD0VWZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="chfyC8Fh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FZRD0VWZ"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0EDF121B9F;
	Mon, 22 Jul 2024 13:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1721656737; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=AJNYwFd+/Mj61w2gLAr6nIokjIAuYGdmHgJ3XEmXDqQ=;
	b=chfyC8FhJBTawCVgiV2fmey+03vhqZ2+Z1pQwnXDysDa2HuFguiomzMC1+c6JKR8daYatB
	/+5ZHzi2q3l3j6s0PuqzUqw9yO3YDvzH2szrDX8YTFZqoJkWxYoUjtblJdDFqxCgwGChcI
	PNeuwMrLZN6Y/Zyox0YLne32lnsVZAI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1721656737;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=AJNYwFd+/Mj61w2gLAr6nIokjIAuYGdmHgJ3XEmXDqQ=;
	b=FZRD0VWZGPXEk1M2eDTgDLMsD4G14I3lieJ58wR7aUQQCmtUpSvfDSN24zSu2ouX3sMqVN
	tu99B8YWGd9kInBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1721656737; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=AJNYwFd+/Mj61w2gLAr6nIokjIAuYGdmHgJ3XEmXDqQ=;
	b=chfyC8FhJBTawCVgiV2fmey+03vhqZ2+Z1pQwnXDysDa2HuFguiomzMC1+c6JKR8daYatB
	/+5ZHzi2q3l3j6s0PuqzUqw9yO3YDvzH2szrDX8YTFZqoJkWxYoUjtblJdDFqxCgwGChcI
	PNeuwMrLZN6Y/Zyox0YLne32lnsVZAI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1721656737;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=AJNYwFd+/Mj61w2gLAr6nIokjIAuYGdmHgJ3XEmXDqQ=;
	b=FZRD0VWZGPXEk1M2eDTgDLMsD4G14I3lieJ58wR7aUQQCmtUpSvfDSN24zSu2ouX3sMqVN
	tu99B8YWGd9kInBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E6256138A7;
	Mon, 22 Jul 2024 13:58:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id PCJZNqBlnmYTQgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 22 Jul 2024 13:58:56 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: ump: Don't update FB name for static blocks
Date: Mon, 22 Jul 2024 15:59:28 +0200
Message-ID: <20240722135929.8612-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.60
X-Spamd-Result: default: False [-2.60 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO

When a device tries to update the FB name string even if its Endpoint
is declared as static, we should skip it, just already done for the FB
info update reply.

Fixes: 37e0e14128e0 ("ALSA: ump: Support UMP Endpoint and Function Block parsing")
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/ump.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/core/ump.c b/sound/core/ump.c
index 3f61220c23b4..b325fcfa77d0 100644
--- a/sound/core/ump.c
+++ b/sound/core/ump.c
@@ -806,6 +806,13 @@ static int ump_handle_fb_name_msg(struct snd_ump_endpoint *ump,
 	if (!fb)
 		return -ENODEV;
 
+	if (ump->parsed &&
+	    (ump->info.flags & SNDRV_UMP_EP_INFO_STATIC_BLOCKS)) {
+		ump_dbg(ump, "Skipping static FB name update (blk#%d)\n",
+			fb->info.block_id);
+		return 0;
+	}
+
 	ret = ump_append_string(ump, fb->info.name, sizeof(fb->info.name),
 				buf->raw, 3);
 	/* notify the FB name update to sequencer, too */
-- 
2.43.0

