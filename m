Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A47257D
	for <linux-sound@vger.kernel.org>; Sun, 19 Jan 2025 08:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737276844; cv=none; b=Wuf0I79aGCM/fwLVoHwAOWbezBrTOt4uTUc2xwh10H7D/nNRRbWKpqSFMehmB3Cwnq7YYlQtII1hTbPImG/Y0OkutVjNuBCAl6pGK3d7s8uNvG5rImpxwpzkMgZB1dEBJIw28lRwvB6A1rXn+eMXv54tn21WS8bEBI2lAIvIYY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737276844; c=relaxed/simple;
	bh=a53axqdG+V9+rcxfVvKN7Anibj3fTWdOuJZrjC9+osU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ijm20SOKgeOxlPUupbAYAXOv5mpSWhyyK16OplVXLKvSv0NhHGEqql3n3S4RxaIXi1BeKobVWzsX9rzhojkCC5LV+rh3CCexcy4Vc4S8Mk/5YAWuz6ucd3T7szy0W9fFlrYZPXHIQt10KTJwIfAxsIth9PmKJnO0RDwnJo0uxpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gCDzJn8k; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HP6U1pjr; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gCDzJn8k; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HP6U1pjr; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gCDzJn8k";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HP6U1pjr";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gCDzJn8k";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HP6U1pjr"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1863121193;
	Sun, 19 Jan 2025 08:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1737276840; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=AC8S5akhryILogxSJ/VSIUxeXP2iPWG70g0x/eCupDk=;
	b=gCDzJn8kNeusL+haGS/1FUYl+3zBJTrWu2Mq3kLfPNC9m7hCdi1l+FJizshjAPFA9VxCTV
	1NqBBb6DdqbuzbCckWmddx7qPKnCCbNsyhyjy3ESAloLvO8Xwpcj80H7YKtljeTT9Aa426
	NpJkCwLentU4RtOYsYutnRLQkU5/dAQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737276840;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=AC8S5akhryILogxSJ/VSIUxeXP2iPWG70g0x/eCupDk=;
	b=HP6U1pjrBoWy17JT5g7AaetoiT0MEcsagab2YtIds5v5gMuNBdY5U4Jb5rovfSmB8P1eem
	Ytsz6yvVDwpzNlDA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=gCDzJn8k;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=HP6U1pjr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1737276840; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=AC8S5akhryILogxSJ/VSIUxeXP2iPWG70g0x/eCupDk=;
	b=gCDzJn8kNeusL+haGS/1FUYl+3zBJTrWu2Mq3kLfPNC9m7hCdi1l+FJizshjAPFA9VxCTV
	1NqBBb6DdqbuzbCckWmddx7qPKnCCbNsyhyjy3ESAloLvO8Xwpcj80H7YKtljeTT9Aa426
	NpJkCwLentU4RtOYsYutnRLQkU5/dAQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737276840;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=AC8S5akhryILogxSJ/VSIUxeXP2iPWG70g0x/eCupDk=;
	b=HP6U1pjrBoWy17JT5g7AaetoiT0MEcsagab2YtIds5v5gMuNBdY5U4Jb5rovfSmB8P1eem
	Ytsz6yvVDwpzNlDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E7C84139CB;
	Sun, 19 Jan 2025 08:53:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2vL2Nqe9jGdxTgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 19 Jan 2025 08:53:59 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: "Geoffrey D . Bennett" <g@b4.vu>
Subject: [PATCH] ALSA: usb: fcp: Fix hwdep read ops argument
Date: Sun, 19 Jan 2025 09:53:28 +0100
Message-ID: <20250119085357.17735-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1863121193
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_TWO(0.00)[2];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

The hwdep read ops argument is long instead of ssize_t due to
historical reason.  Fix the build error.

Fixes: 46757a3e7d50 ("ALSA: FCP: Add Focusrite Control Protocol driver")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202501190536.A2CiOP0a-lkp@intel.com/
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/fcp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/fcp.c b/sound/usb/fcp.c
index 655e4f7338ed..eb6a5c1f9b21 100644
--- a/sound/usb/fcp.c
+++ b/sound/usb/fcp.c
@@ -816,7 +816,7 @@ static int fcp_hwdep_ioctl(struct snd_hwdep *hw, struct file *file,
 }
 
 static ssize_t fcp_hwdep_read(struct snd_hwdep *hw, char __user *buf,
-			      ssize_t count, loff_t *offset)
+			      long count, loff_t *offset)
 {
 	struct usb_mixer_interface *mixer = hw->private_data;
 	struct fcp_data *private = mixer->private_data;
-- 
2.43.0

