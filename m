Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70458F5E
	for <linux-sound@vger.kernel.org>; Mon, 22 Jul 2024 14:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721657141; cv=none; b=C6cdoK3Vw4DUthGJNI/l7l8kFaHkHH6Y7wSBxj6iUiB7E38pT8j/0H2eseP2LfR1hAoQekjiWkkEeGc9HfqVfkMahB+TCC4HZTQq6IexbydB9Iqzujup2dAXlv4aj15GZbY/1l+r2RrkzkfnWXSekt1lpJA2tWieVGCR1loDxdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721657141; c=relaxed/simple;
	bh=r8jyv7ECWouLJb5MEJpMEld3y21J6KEslZwDNxqPxc8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=B0yjXzVaInCDtuk/C5MixbaRSG+61gGKJMnpA54KgKqeDUl3g9RLaiKNw7Xm9o/DNFe/oqUbBIhM5aJOuP4xUVelMNB8fDQSD+HE8Vw93/JMl7A0jGku2ky1way4XX1gFNy/Jr8AwXrahVvCjVMYfRDeFpig+ES3X8z6RuxywG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RHMjN0Va; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xztucMXf; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RHMjN0Va; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xztucMXf; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RHMjN0Va";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xztucMXf";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RHMjN0Va";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xztucMXf"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 11EC11FB6F;
	Mon, 22 Jul 2024 14:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1721657138; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=75IC8k363+R0hKnFzBkYVn43DI4p2KDIVo+bgp8Xxo8=;
	b=RHMjN0VaA+DHreWBeBgy6QFAthwzby1nPf6CCugWsj7yABhPih6oHzWZTin6dfKR4yFupR
	jiRrr6KX/E3iEXF2spgjVDprv/4793S3zG5KMDclI8MaZQ5tpnkC5CKG+n4w9q9rlzLM8u
	BjhN0XOtzgQ0mbzf6xfg8Y5bI/vDh60=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1721657138;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=75IC8k363+R0hKnFzBkYVn43DI4p2KDIVo+bgp8Xxo8=;
	b=xztucMXfXwiubnRgAzTeOoRomWdw6yhpIhbt4aL/Mx2tGsbh4xFgIrOyz/cjwadFUktOJA
	2BL0/srlFLJESjDQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=RHMjN0Va;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=xztucMXf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1721657138; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=75IC8k363+R0hKnFzBkYVn43DI4p2KDIVo+bgp8Xxo8=;
	b=RHMjN0VaA+DHreWBeBgy6QFAthwzby1nPf6CCugWsj7yABhPih6oHzWZTin6dfKR4yFupR
	jiRrr6KX/E3iEXF2spgjVDprv/4793S3zG5KMDclI8MaZQ5tpnkC5CKG+n4w9q9rlzLM8u
	BjhN0XOtzgQ0mbzf6xfg8Y5bI/vDh60=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1721657138;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=75IC8k363+R0hKnFzBkYVn43DI4p2KDIVo+bgp8Xxo8=;
	b=xztucMXfXwiubnRgAzTeOoRomWdw6yhpIhbt4aL/Mx2tGsbh4xFgIrOyz/cjwadFUktOJA
	2BL0/srlFLJESjDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id ECFA6138A7;
	Mon, 22 Jul 2024 14:05:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Hk2HODFnnmYkRAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 22 Jul 2024 14:05:37 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: ump: Force 1 Group for MIDI1 FBs
Date: Mon, 22 Jul 2024 16:06:06 +0200
Message-ID: <20240722140610.10845-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.81
X-Rspamd-Action: no action
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 11EC11FB6F
X-Spamd-Result: default: False [-2.81 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_ONE(0.00)[1];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO

When a Function Block declares it being a legacy MIDI1 device, it has
to be only with a single UMP Group.  Correct the attribute when a
device declares it wrongly.

Fixes: 37e0e14128e0 ("ALSA: ump: Support UMP Endpoint and Function Block parsing")
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/ump.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/core/ump.c b/sound/core/ump.c
index 3f61220c23b4..4b10aa5819bf 100644
--- a/sound/core/ump.c
+++ b/sound/core/ump.c
@@ -733,6 +733,12 @@ static void fill_fb_info(struct snd_ump_endpoint *ump,
 		info->block_id, info->direction, info->active,
 		info->first_group, info->num_groups, info->midi_ci_version,
 		info->sysex8_streams, info->flags);
+
+	if ((info->flags & SNDRV_UMP_BLOCK_IS_MIDI1) && info->num_groups != 1) {
+		info->num_groups = 1;
+		ump_dbg(ump, "FB %d: corrected groups to 1 for MIDI1\n",
+			info->block_id);
+	}
 }
 
 /* check whether the FB info gets updated by the current message */
-- 
2.43.0

