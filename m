Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B833396F4
	for <linux-sound@vger.kernel.org>; Tue, 28 Apr 2026 06:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777357085; cv=none; b=uzy8NQlee4peuEqz4wiMCYiZHeOdi/J0u3EC9j4gZDXH0RdSgsJ2Zx+8atFRZWL1/f+9hOTOS3WjfpTGZMGGplW9ZqbPObsItnfOLBl8ozuKumANf84fF76kI1g/u4+JKcNCthTQC13BmSTtaj74HOfTqGqQxh1R7Dgf018xgaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777357085; c=relaxed/simple;
	bh=hHuL+p1YKM/81k6Tp909cYXvYVi7uPois8gVaoebtxQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pMxJsnRPssx4cUePrh27TSEIkA5FPW6BdY3AO0ZSxc3vCMOtiSQF1OMbnt3Ptos43mWzwIStdbh3EZ0EuhKPp9DIBVEZw/36xzL6ZEDkburb9m+wJ4WUIkXtO+0Rly+wQoFK0NMIRgATy12pO3VBKy7wl7UQ/YTOQSt+xH04Ehs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=P36IbCQV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=48H2SVUY; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=P36IbCQV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=48H2SVUY; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="P36IbCQV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="48H2SVUY";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="P36IbCQV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="48H2SVUY"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9C51E5BD2E;
	Tue, 28 Apr 2026 06:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777357082; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=wowWNeGyeQK8DaMgEBdntWD0tbRmuq/DuzD3MGeAHig=;
	b=P36IbCQVS7ODg0YR3im2ENQNsQe08p/mLKhxAgI6cm97l9WGHiYWMSE/AmGmjEYjAnE+6I
	LxWg5RE3AWHI6IpcfuPSiVrywK6hMnL96BxBgea18QKRxVM9hwcIDvEtkaKgxcz7GAzf2k
	xQtHP7KO+k1aixckPyBmXuh2qtkXv9M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777357082;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=wowWNeGyeQK8DaMgEBdntWD0tbRmuq/DuzD3MGeAHig=;
	b=48H2SVUYAhlNs3xh+Sf/ZfhQQSXLQZ89sKkb6O0E56QJgEOrR+31Z4/yYVMTwPNIaMnsEk
	LsnvV9tkzez0xpCA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=P36IbCQV;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=48H2SVUY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777357082; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=wowWNeGyeQK8DaMgEBdntWD0tbRmuq/DuzD3MGeAHig=;
	b=P36IbCQVS7ODg0YR3im2ENQNsQe08p/mLKhxAgI6cm97l9WGHiYWMSE/AmGmjEYjAnE+6I
	LxWg5RE3AWHI6IpcfuPSiVrywK6hMnL96BxBgea18QKRxVM9hwcIDvEtkaKgxcz7GAzf2k
	xQtHP7KO+k1aixckPyBmXuh2qtkXv9M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777357082;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=wowWNeGyeQK8DaMgEBdntWD0tbRmuq/DuzD3MGeAHig=;
	b=48H2SVUYAhlNs3xh+Sf/ZfhQQSXLQZ89sKkb6O0E56QJgEOrR+31Z4/yYVMTwPNIaMnsEk
	LsnvV9tkzez0xpCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7680B593B0;
	Tue, 28 Apr 2026 06:18:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UlE4GxpR8Gk9MwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 28 Apr 2026 06:18:02 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: hda: Avoid WARN_ON() for HDMI chmap slot checks
Date: Tue, 28 Apr 2026 08:17:56 +0200
Message-ID: <20260428061800.80527-1-tiwai@suse.de>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Queue-Id: 9C51E5BD2E
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 

At parsing the channel mapping for HDMI, the current code may spew
WARN_ON() unnecessarily for the case where only invalid (zero) channel
maps are given from the hardware.  Drop WARN_ON() and reorganize the
code a bit for avoiding the hdmi_slot over the array size.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221390
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/core/hdmi_chmap.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/sound/hda/core/hdmi_chmap.c b/sound/hda/core/hdmi_chmap.c
index 7b276047f85a..c897fc443467 100644
--- a/sound/hda/core/hdmi_chmap.c
+++ b/sound/hda/core/hdmi_chmap.c
@@ -353,13 +353,16 @@ static void hdmi_std_setup_channel_mapping(struct hdac_chmap *chmap,
 	if (hdmi_channel_mapping[ca][1] == 0) {
 		int hdmi_slot = 0;
 		/* fill actual channel mappings in ALSA channel (i) order */
-		for (i = 0; i < ch_alloc->channels; i++) {
-			while (!WARN_ON(hdmi_slot >= 8) &&
-			       !ch_alloc->speakers[7 - hdmi_slot])
-				hdmi_slot++; /* skip zero slots */
+		for (i = 0; i < ch_alloc->channels && hdmi_slot < 8; i++) {
+			while (!ch_alloc->speakers[7 - hdmi_slot]) {
+				/* skip zero slots */
+				if (++hdmi_slot >= 8)
+					goto out;
+			}
 
 			hdmi_channel_mapping[ca][i] = (i << 4) | hdmi_slot++;
 		}
+	out:
 		/* fill the rest of the slots with ALSA channel 0xf */
 		for (hdmi_slot = 0; hdmi_slot < 8; hdmi_slot++)
 			if (!ch_alloc->speakers[7 - hdmi_slot])
-- 
2.54.0

