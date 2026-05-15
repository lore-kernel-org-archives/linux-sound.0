Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9991434403F
	for <linux-sound@vger.kernel.org>; Fri, 15 May 2026 08:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778835371; cv=none; b=OXT15vh3VjCeItckeDUSZI7Lsv0ulFlu23B/1z2nelOa9vvEu78+UmdSm9F6IsI1ZsGVuspsg6bFgyyjqP99m1Ol21nrlJ9dIHb+8Pt+IMajCYpp6QpeszkZDrXD2jBgCoRfSUoy80MDN/6o5ENTynpp6wqn9WkD8qgy719GrsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778835371; c=relaxed/simple;
	bh=uMo+jhVl3HTL4JEzMo86G0mOJEAs+cnwuUZS/XWxeY4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ow7NhBwqA9qd/yhkfc/kWz+Xitph3CrtMKTjFs/gK7n7bZ4InhsV/bpjqHzA/bfE0c+CLm6KLEZ/PaXHMKteufQw1UVw7RiOkAzXOHx0tF+gWOF4/s80hc4XoticY0otA2FBvSk8YytYRheTVH1eGb2hyQ3R6ce8nBg54qAtUzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ri6UXcte; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2uJu+LL5; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ri6UXcte; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2uJu+LL5; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ri6UXcte";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2uJu+LL5";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ri6UXcte";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2uJu+LL5"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C7829630E0;
	Fri, 15 May 2026 08:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778835368; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Pj5SLHNNSrWm6UglsH28bmztO3MW6EE5o5t6P1Zqg68=;
	b=ri6UXcteBxag/HldwQ0R27DjAtKTpzBD5JwfpiSXN8N3qPD45mMy8ziOrZePzGNIXk5HPR
	tREod6fCr4t58YsZUL0LjSwEbRL0FGO8TRS/+gy614KO69UlCn9xYO114gizruOoPrF2oj
	IiiTIVoINsKbRDIu8Hn5cTUVUBUawAA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778835368;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Pj5SLHNNSrWm6UglsH28bmztO3MW6EE5o5t6P1Zqg68=;
	b=2uJu+LL5D1AyDGq5V9FT83gNLYsfLYcXLb2yCBPaMHBucKRYEXm+vasluicUarnY4OvSy6
	u9Mt4aWwbcJhCxAQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ri6UXcte;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=2uJu+LL5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778835368; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Pj5SLHNNSrWm6UglsH28bmztO3MW6EE5o5t6P1Zqg68=;
	b=ri6UXcteBxag/HldwQ0R27DjAtKTpzBD5JwfpiSXN8N3qPD45mMy8ziOrZePzGNIXk5HPR
	tREod6fCr4t58YsZUL0LjSwEbRL0FGO8TRS/+gy614KO69UlCn9xYO114gizruOoPrF2oj
	IiiTIVoINsKbRDIu8Hn5cTUVUBUawAA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778835368;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Pj5SLHNNSrWm6UglsH28bmztO3MW6EE5o5t6P1Zqg68=;
	b=2uJu+LL5D1AyDGq5V9FT83gNLYsfLYcXLb2yCBPaMHBucKRYEXm+vasluicUarnY4OvSy6
	u9Mt4aWwbcJhCxAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9B6F8593A9;
	Fri, 15 May 2026 08:56:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id v6q3JKjfBmrKTQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 15 May 2026 08:56:08 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: asihpi: Fix potential OOB array access at reading cache
Date: Fri, 15 May 2026 10:55:58 +0200
Message-ID: <20260515085606.242284-1-tiwai@suse.de>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,sashiko.dev:url,suse.de:email,suse.de:dkim,suse.de:mid];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	URIBL_BLOCKED(0.00)[sashiko.dev:url,suse.de:email,suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: C7829630E0
X-Spam-Level: 

find_control() to retrieve a cached info accesses the array with the
given index blindly, which may lead to an OOB array access.
Add a sanity check for avoiding it.

Link: https://sashiko.dev/#/patchset/20260511230121.28606-1-rosenp%40gmail.com
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/asihpi/hpicmn.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/pci/asihpi/hpicmn.c b/sound/pci/asihpi/hpicmn.c
index 0674fd854cc8..5f69c04c672a 100644
--- a/sound/pci/asihpi/hpicmn.c
+++ b/sound/pci/asihpi/hpicmn.c
@@ -276,6 +276,12 @@ static short find_control(u16 control_index,
 		return 0;
 	}
 
+	if (control_index >= p_cache->control_count) {
+		HPI_DEBUG_LOG(VERBOSE, "control_index out of bounce %d\n",
+			control_index);
+		return 0;
+	}
+
 	*pI = p_cache->p_info[control_index];
 	if (!*pI) {
 		HPI_DEBUG_LOG(VERBOSE, "Uncached Control %d\n",
-- 
2.54.0

