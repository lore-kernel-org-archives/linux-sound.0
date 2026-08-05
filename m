Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A4E474265
	for <linux-sound@vger.kernel.org>; Wed,  5 Aug 2026 13:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785937996; cv=none; b=nRioISSFefu82aK2q6Kg9Ch/yJ/vLHnbqCWQR0L8QP2yhZIEioZYRKIXneJ9LAEnymAys5NTmmLT6abMJEuPvSi8waLt6QkXpOs+RhChIk+Pym4nUA5o3BUzOWg+CLk9wcGDOoL4YNWDs/6p5TB0egotYPNUbtcDh2805es/e9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785937996; c=relaxed/simple;
	bh=Lac8XGdCK118N2gtHH5oMuwZzygjCf6rQN91OJ7BOwc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NYazdxGVxBbisCzPCpom+W676R6LnmtqgEVKtyMjIAtjLx6KXqw5jGti0Hh4Pg9401YCUDRviWbdlaOG5UFdn6G4/1bNslDAi2DAU+fSUE1nDOtzTs0VR4MrhvDLMMvjiej40+O5iPDkvdURJvq91MTuFDsvgr+Z9qWm0TPrUk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=C0q+nU6U; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Toj03u3A; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OSIY3f2U; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QmtIUEKo; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="C0q+nU6U";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Toj03u3A";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OSIY3f2U";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QmtIUEKo"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D2CD27F0A8;
	Wed,  5 Aug 2026 13:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785937988; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vLcR9brRv5EgVVCeq9AlEFcitCd/uek2s6ziVKAQZEM=;
	b=C0q+nU6USp1f+QXJ5NSm9ZVi8Epvsdqe8VIHdlW7lNH/Lsalna1XMZYD3zvHeOyap/7Aov
	AK/7ixgP2Hm0vmCpN9l31FHsEZ+V/lXMdPBfQ3kZFNNv5/wmjH6/SSzA1qb5EwFEZWn0Qz
	dQ6522JLRthgXcYw6X8VB3av52mN5No=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785937988;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vLcR9brRv5EgVVCeq9AlEFcitCd/uek2s6ziVKAQZEM=;
	b=Toj03u3A7pzq04dHbzNETZXsGX/VorrbdF51/xHbcDglZOsiS4Fz1LyFupKSW4Czojxi6X
	mFleVkvMs6IXwmBQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=OSIY3f2U;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=QmtIUEKo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785937983; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vLcR9brRv5EgVVCeq9AlEFcitCd/uek2s6ziVKAQZEM=;
	b=OSIY3f2UAX2o+OTAGp9C3QDVpJJ26xklPyquNvNtLP7DTdHvBkqkxK3feqYkyRA6rIe8n4
	pSI+W14PM0bSMCQ0Fp3MyEsT654E3NwX9IRyNbWgbPfzO+Bg5rAaMqpZd7mr1V5v/3IFnx
	57HoayQVE0ujaXhL+VyxYBPM34+LZF8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785937983;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vLcR9brRv5EgVVCeq9AlEFcitCd/uek2s6ziVKAQZEM=;
	b=QmtIUEKoaWLL+UCNWPtq9YoD3nfOwX1elMs+lFDkx7jzNhKLuWPd642wtq1k5iMt005fvs
	g0BkJ7qPB5syUnDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0D793779EE;
	Wed,  5 Aug 2026 13:52:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iIgfAjhAc2ouSQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 05 Aug 2026 13:52:56 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH 05/31] ASoC: aw88395: Use auto-cleanup for firmware loading
Date: Wed,  5 Aug 2026 15:52:06 +0200
Message-ID: <20260805135247.670693-6-tiwai@suse.de>
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
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: D2CD27F0A8
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

Simplify the code to manage the firmware loading with __free(firmware)
auto-cleanup.

Only the code refactoring, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/aw88395/aw88395.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/aw88395/aw88395.c b/sound/soc/codecs/aw88395/aw88395.c
index e9ff2c79ac15..2f4108624d13 100644
--- a/sound/soc/codecs/aw88395/aw88395.c
+++ b/sound/soc/codecs/aw88395/aw88395.c
@@ -457,7 +457,7 @@ static void aw88395_hw_reset(struct aw88395 *aw88395)
 
 static int aw88395_request_firmware_file(struct aw88395 *aw88395)
 {
-	const struct firmware *cont = NULL;
+	const struct firmware *cont __free(firmware) = NULL;
 	struct aw_container *aw_cfg;
 	int ret;
 
@@ -473,13 +473,11 @@ static int aw88395_request_firmware_file(struct aw88395 *aw88395)
 			AW88395_ACF_FILE, cont ? cont->size : 0);
 
 	aw_cfg = devm_kzalloc(aw88395->aw_pa->dev, struct_size(aw_cfg, data, cont->size), GFP_KERNEL);
-	if (!aw_cfg) {
-		release_firmware(cont);
+	if (!aw_cfg)
 		return -ENOMEM;
-	}
+
 	aw_cfg->len = (int)cont->size;
 	memcpy(aw_cfg->data, cont->data, cont->size);
-	release_firmware(cont);
 
 	aw88395->aw_cfg = aw_cfg;
 
-- 
2.55.0

