Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146391F181F
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 15:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774625462; cv=none; b=bZliukEHEZSY61K/oPathsfLort0BIQV8gbk54tT5bdma7yCZmmwWVTgZ2TpIw/wo5RWjNvivKVoOreA9LxYdBFpfPalfUNqUA/s0G68tJQcRQvg8oSwu+NsdtQkhTqr2nPj4jZYVgKPh0Y/oMs0v8r8Ah1eep0xd/1OuDvMT0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774625462; c=relaxed/simple;
	bh=1putJpbkIIyu8QgBm190FPbzvNv1COLG10zyxET/mwo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GYu48sfvy87EWCGha0uJK6xyLSQKLQUJGCqaN8xAMO90YNiIpWRDCsBc1skRtWaQggeKu3THEAwLgohs1ZUYDCgqg07L+eOI8QP7YvLL+dWw85LZS45kz+urtQ72o/vIuRR8GtIVcqHvGNA4u1aFV27/yEDBlve6NKyNHF0YFuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xlldbOlZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=39c/rDGq; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xlldbOlZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=39c/rDGq; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xlldbOlZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="39c/rDGq";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xlldbOlZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="39c/rDGq"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 71FE34D385;
	Fri, 27 Mar 2026 15:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774625459; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=GGXO1WJ3jmSrBNNztCNulauYYbzU1EMLKCVs++6K0i4=;
	b=xlldbOlZ0EWjSvWEYAdRvZKGffNNIXs+BUNvDxiU5PWhSO+eQ03fYPkwT43uOkuqG4O1MG
	00iiXiyaEM6suIczWkGQPOND0Wh+cqIaJlnmeuDYSOYGwgcZA2F7mbLPpU5X4Me69sNkjG
	zaRTocg8jcYSb4hhhA7E9s+h/Ct05q4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774625459;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=GGXO1WJ3jmSrBNNztCNulauYYbzU1EMLKCVs++6K0i4=;
	b=39c/rDGqb2ukbC3n9xQja68mz6Okus1uxB+brSHKn9hzuOq78/ukNIAq3QZ1048XykTVpl
	+oba+/n0id7/MaDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774625459; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=GGXO1WJ3jmSrBNNztCNulauYYbzU1EMLKCVs++6K0i4=;
	b=xlldbOlZ0EWjSvWEYAdRvZKGffNNIXs+BUNvDxiU5PWhSO+eQ03fYPkwT43uOkuqG4O1MG
	00iiXiyaEM6suIczWkGQPOND0Wh+cqIaJlnmeuDYSOYGwgcZA2F7mbLPpU5X4Me69sNkjG
	zaRTocg8jcYSb4hhhA7E9s+h/Ct05q4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774625459;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=GGXO1WJ3jmSrBNNztCNulauYYbzU1EMLKCVs++6K0i4=;
	b=39c/rDGqb2ukbC3n9xQja68mz6Okus1uxB+brSHKn9hzuOq78/ukNIAq3QZ1048XykTVpl
	+oba+/n0id7/MaDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 547DA4A0A2;
	Fri, 27 Mar 2026 15:30:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id XABqE7OixmmNEgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 27 Mar 2026 15:30:59 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Phil Willoughby <willerz@gmail.com>
Subject: [PATCH 1/2] ALSA: usb-audio: Replace hard-coded number with MAX_CHANNELS
Date: Fri, 27 Mar 2026 16:30:53 +0100
Message-ID: <20260327153056.691575-1-tiwai@suse.de>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO

One place in mixer.c still used a hard-coded number 16 instead of
MAX_CHANNELS.  Replace with it, so that we can extend the max number
of channels gracefully.

Link: https://lore.kernel.org/F1B104A5-CD6A-4A26-AB46-14BF233C0579@getmailspring.com
Tested-by: Phil Willoughby <willerz@gmail.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/mixer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index 7007e0c9489b..e764757979e0 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -1769,7 +1769,7 @@ static void __build_feature_ctl(struct usb_mixer_interface *mixer,
 		cval->master_readonly = readonly_mask;
 	} else {
 		int i, c = 0;
-		for (i = 0; i < 16; i++)
+		for (i = 0; i < MAX_CHANNELS; i++)
 			if (ctl_mask & BIT(i))
 				c++;
 		cval->channels = c;
-- 
2.53.0

