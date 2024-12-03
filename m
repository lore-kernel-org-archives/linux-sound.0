Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56EF41EE01F
	for <linux-sound@vger.kernel.org>; Tue,  3 Dec 2024 13:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733233977; cv=none; b=lQ9I9TGqqgfaFaWK12FYkgjaeMUKMBIr2Fiosl/DPQup/u9tRy+p8FpMrZkljjFchNJcOhWN07daF0ptKUOyzbFS/KhK0rrtqNNZzr2reQFxp5GL7oyuHQxSvqywAILN2wnLu2YFZwSzUTwyogzIDsf5BWwZCbLcrBeZk7p8zUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733233977; c=relaxed/simple;
	bh=mSMHsV6JtOaztdeI7o0MGz0TDS9p3QG1+Tmr1e+EwBM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=b+WILIcCTg4yp7ES8W4rC0oQrdC2O0xSxziXPXXGZFebZtB8TMPRWMZnmsVG2mx0NuFc94C/36jfm5IBWo9bXrR9OXz8poqFioy86iJYWI4xInFal/RA7S1YFB70npgvLfEixg6LylUPx4UJ7VK1sVcVFbD6zUUe1HkNpmQ532U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=oXM3iCyM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bOe42vGY; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=oXM3iCyM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bOe42vGY; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oXM3iCyM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bOe42vGY";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oXM3iCyM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bOe42vGY"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 595A421166;
	Tue,  3 Dec 2024 13:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1733233973; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=wvHHyn8ON0Y2l5hKXpxTfZwUgZD+saC4XsYe9Rb5J8k=;
	b=oXM3iCyMC75Y0cUklhUPaPQFu8pMwlIFLCCMlR8nztYEZE5m9IQ7/I48fzHveM+oNS2G1Q
	8A68ojRDbRwYCD8yUT1VM0arMs3giNzOpdc7iSkVQYR0recrZvNOzBlL5W3gB/DXOWv95i
	5S3TWb0Aox+Y8ti3OrMz1bqHcpCtFWo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733233973;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=wvHHyn8ON0Y2l5hKXpxTfZwUgZD+saC4XsYe9Rb5J8k=;
	b=bOe42vGY6rBpuQTApS94xkZ6fvbWfszVoW466K2Xl5kQQuDkED+KDJtT+RYPtH9gDLue6H
	7XuGm2ADRX5T+CAw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=oXM3iCyM;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=bOe42vGY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1733233973; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=wvHHyn8ON0Y2l5hKXpxTfZwUgZD+saC4XsYe9Rb5J8k=;
	b=oXM3iCyMC75Y0cUklhUPaPQFu8pMwlIFLCCMlR8nztYEZE5m9IQ7/I48fzHveM+oNS2G1Q
	8A68ojRDbRwYCD8yUT1VM0arMs3giNzOpdc7iSkVQYR0recrZvNOzBlL5W3gB/DXOWv95i
	5S3TWb0Aox+Y8ti3OrMz1bqHcpCtFWo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733233973;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=wvHHyn8ON0Y2l5hKXpxTfZwUgZD+saC4XsYe9Rb5J8k=;
	b=bOe42vGY6rBpuQTApS94xkZ6fvbWfszVoW466K2Xl5kQQuDkED+KDJtT+RYPtH9gDLue6H
	7XuGm2ADRX5T+CAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4AFB213A15;
	Tue,  3 Dec 2024 13:52:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YQy5ETUNT2cnKAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 03 Dec 2024 13:52:53 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: hda: Always check capability at opening a hwdep
Date: Tue,  3 Dec 2024 14:52:47 +0100
Message-ID: <20241203135248.19840-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 595A421166
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	URIBL_BLOCKED(0.00)[suse.de:email,suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

We have a capability check at hda_hwdep_open(), but it's applied only
conditionally and the check is skipped when CONFIG_SND_DEBUG_VERBOSE
is set.  This is rather inconsistent behavior, and we should apply the
check always no matter which config is chosen.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/hda_hwdep.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/pci/hda/hda_hwdep.c b/sound/pci/hda/hda_hwdep.c
index 727f39acedfc..9325e5c3cbe6 100644
--- a/sound/pci/hda/hda_hwdep.c
+++ b/sound/pci/hda/hda_hwdep.c
@@ -84,10 +84,8 @@ static int hda_hwdep_ioctl_compat(struct snd_hwdep *hw, struct file *file,
 
 static int hda_hwdep_open(struct snd_hwdep *hw, struct file *file)
 {
-#ifndef CONFIG_SND_DEBUG_VERBOSE
 	if (!capable(CAP_SYS_RAWIO))
 		return -EACCES;
-#endif
 	return 0;
 }
 
-- 
2.43.0

