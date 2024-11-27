Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91F513C816
	for <linux-sound@vger.kernel.org>; Wed, 27 Nov 2024 07:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732690866; cv=none; b=Gxyj1ztEAa50XnELhqiQVH2eTq5lQ+fOKDWaf/IksyZjqvmVcoxo9MEoSyK5Jl+avXd8PRGleqv4otfhHIT26RmqcjOYBfwFi2UupZbxWrEaK3Pn2yjSmIqQ7Gy8SRM9oXl99XAR9ymjOInXqNnZWcRUihttgrdxWiFmWesadUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732690866; c=relaxed/simple;
	bh=+sToUDOM0sgdPdu7MUtRyi/vk/wqTyIuDP2PH6M1rEc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=uKJBTbtT0k54pIJbgJDdFrOj8p2XReQ79Y7+Tpkjk2zcrNCfcoLqtVRWo6uyU7Hv7RrF7plMybJv+RoZ/TyghEQ0yy++wXCA38Q/iDvgkQYgul+3hR85b/Yn9zsyNCG4erHo6OGuB/uNNAyvfTd8jcJcUE6LINXWnFystAoDdI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ElL+Uppg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tfWV40jE; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ElL+Uppg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tfWV40jE; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ElL+Uppg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tfWV40jE";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ElL+Uppg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tfWV40jE"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0E6B31F74D;
	Wed, 27 Nov 2024 07:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732690862; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=V61XMpMofzz8pP1mcnyRKzFZiIAtOSr6bM2Dq/ftIDo=;
	b=ElL+UppgqlxIkGiwrvUOaIK5Gq0YnJ0ktswAh5coTCRtN1FdGVN1LPTTfKzCAc15HPVDrK
	e2DpYQWHdPjEZKoJVSMHNACLzof6ubVtud1HZhsdYw1Bf01SUZL5MqVr3iyB4IvRVcosgp
	tTpvpMJ4oQcADD9q06hCfNQuvgvc69I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732690862;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=V61XMpMofzz8pP1mcnyRKzFZiIAtOSr6bM2Dq/ftIDo=;
	b=tfWV40jEBnBuxFD9qadXTxMdIrSuJlCHIva9j/Zk/XEuMOi+OmfYbNRs41OQeP3/o7B90q
	YPXgCw0NxPdyt4CA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732690862; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=V61XMpMofzz8pP1mcnyRKzFZiIAtOSr6bM2Dq/ftIDo=;
	b=ElL+UppgqlxIkGiwrvUOaIK5Gq0YnJ0ktswAh5coTCRtN1FdGVN1LPTTfKzCAc15HPVDrK
	e2DpYQWHdPjEZKoJVSMHNACLzof6ubVtud1HZhsdYw1Bf01SUZL5MqVr3iyB4IvRVcosgp
	tTpvpMJ4oQcADD9q06hCfNQuvgvc69I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732690862;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=V61XMpMofzz8pP1mcnyRKzFZiIAtOSr6bM2Dq/ftIDo=;
	b=tfWV40jEBnBuxFD9qadXTxMdIrSuJlCHIva9j/Zk/XEuMOi+OmfYbNRs41OQeP3/o7B90q
	YPXgCw0NxPdyt4CA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E5CF313941;
	Wed, 27 Nov 2024 07:01:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id TxPdNq3DRmesEAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 27 Nov 2024 07:01:01 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: ump: Fix evaluation of MIDI 1.0 FB info
Date: Wed, 27 Nov 2024 08:00:58 +0100
Message-ID: <20241127070059.8099-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid]
X-Spam-Score: -2.80
X-Spam-Flag: NO

The m1.0 field of UMP Function Block info specifies whether the given
FB is a MIDI 1.0 port or not.  When implementing the UMP support on
Linux, I somehow interpreted as if it were bit flags, but the field is
actually an enumeration from 0 to 2, where 2 means MIDI 1.0 *and* low
speed.

This patch corrects the interpretation and sets the right bit flags
depending on the m1.0 field of FB Info.  This effectively fixes the
missing detection of MIDI 1.0 FB when m1.0 is 2.

Fixes: 37e0e14128e0 ("ALSA: ump: Support UMP Endpoint and Function Block parsing")
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/ump.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/core/ump.c b/sound/core/ump.c
index 5d4dd207e5ab..6d0aac6c763f 100644
--- a/sound/core/ump.c
+++ b/sound/core/ump.c
@@ -788,7 +788,10 @@ static void fill_fb_info(struct snd_ump_endpoint *ump,
 	info->ui_hint = buf->fb_info.ui_hint;
 	info->first_group = buf->fb_info.first_group;
 	info->num_groups = buf->fb_info.num_groups;
-	info->flags = buf->fb_info.midi_10;
+	if (buf->fb_info.midi_10 < 2)
+		info->flags = buf->fb_info.midi_10;
+	else
+		info->flags = SNDRV_UMP_BLOCK_IS_MIDI1 | SNDRV_UMP_BLOCK_IS_LOWSPEED;
 	info->active = buf->fb_info.active;
 	info->midi_ci_version = buf->fb_info.midi_ci_version;
 	info->sysex8_streams = buf->fb_info.sysex8_streams;
-- 
2.43.0

