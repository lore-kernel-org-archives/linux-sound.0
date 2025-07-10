Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3178D2D5436
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142088; cv=none; b=PZyluoMGWTdHeFbFQC6P3hMrqL7/KZQ+FJNC5i36P0RyknDa6p8oNKtk//KeQnMT5Jdg6U2hTGpAijjAhDnVgY/eoQ6nYif29ZSJusy9buieZJtnFtYmU6+44FGtz6RViBPvCYCqkIAeGS/uYm3Myj4OKUqGjX1oBQkLFVpppx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142088; c=relaxed/simple;
	bh=KLxe/S2845BX+U/nwhxxAdi2O6B2vBpNiKDz6pkpTF4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iOK01xdEa7BiomEiTuwbpEoa0NoFTXfHx+bf1TRMSu1YGgzXFVGOdyV4tIMHmmg69pQ2RgOJBrwerdPv+96jiog80IUAP6uhkKWKwXSKFwSkg+O83iDRME4bYMcuTkSWT79+SvYDKO4wk3PBvBdLYOhoEHLfvE8borusZbnK1dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=b3d4ls4T; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zfoUlVhc; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=b3d4ls4T; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zfoUlVhc; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="b3d4ls4T";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zfoUlVhc";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="b3d4ls4T";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zfoUlVhc"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 915F22117C;
	Thu, 10 Jul 2025 10:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142057; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JGooaGcQSRm4vPOJOdj11X7/KzDmaqYLqW7qFXeByxI=;
	b=b3d4ls4TzblhFXEJWfAZMRmgqP8h3QdhvYtfGdpnZp1KHCPPmPbqseBJOyXM2Of9P1ogTs
	3PGVxFqsxFo5js8Qf+Py43ukKoMgEL/UTWpxNYhtOnW7+O5npV0r8rRUueW7zeVSr975Wy
	SnNHb4PYLoiXaRzRGojisxv7Q+X66/w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142057;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JGooaGcQSRm4vPOJOdj11X7/KzDmaqYLqW7qFXeByxI=;
	b=zfoUlVhc/NGVqcsAWSc5lmHYGjTagrJ0z7rZlPTqhPsJcj+3K93FfWokbsE4ur3P99Ksdb
	MCmWIL9Y3bULorAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142057; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JGooaGcQSRm4vPOJOdj11X7/KzDmaqYLqW7qFXeByxI=;
	b=b3d4ls4TzblhFXEJWfAZMRmgqP8h3QdhvYtfGdpnZp1KHCPPmPbqseBJOyXM2Of9P1ogTs
	3PGVxFqsxFo5js8Qf+Py43ukKoMgEL/UTWpxNYhtOnW7+O5npV0r8rRUueW7zeVSr975Wy
	SnNHb4PYLoiXaRzRGojisxv7Q+X66/w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142057;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JGooaGcQSRm4vPOJOdj11X7/KzDmaqYLqW7qFXeByxI=;
	b=zfoUlVhc/NGVqcsAWSc5lmHYGjTagrJ0z7rZlPTqhPsJcj+3K93FfWokbsE4ur3P99Ksdb
	MCmWIL9Y3bULorAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 74C5C136DC;
	Thu, 10 Jul 2025 10:07:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6F1JG+mQb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:37 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 006/103] ALSA: opl4: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:05:48 +0200
Message-ID: <20250710100727.22653-7-tiwai@suse.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250710100727.22653-1-tiwai@suse.de>
References: <20250710100727.22653-1-tiwai@suse.de>
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
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80

Use a safer function strscpy() instead of strcpy() for copying to
arrays.

Only idiomatic code replacement, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/opl4/opl4_lib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/drivers/opl4/opl4_lib.c b/sound/drivers/opl4/opl4_lib.c
index 8fa61596875a..ef6b2d533958 100644
--- a/sound/drivers/opl4/opl4_lib.c
+++ b/sound/drivers/opl4/opl4_lib.c
@@ -152,7 +152,7 @@ static int snd_opl4_create_seq_dev(struct snd_opl4 *opl4, int seq_device)
 	opl4->seq_dev_num = seq_device;
 	if (snd_seq_device_new(opl4->card, seq_device, SNDRV_SEQ_DEV_ID_OPL4,
 			       sizeof(struct snd_opl4 *), &opl4->seq_dev) >= 0) {
-		strcpy(opl4->seq_dev->name, "OPL4 Wavetable");
+		strscpy(opl4->seq_dev->name, "OPL4 Wavetable");
 		*(struct snd_opl4 **)SNDRV_SEQ_DEVICE_ARGPTR(opl4->seq_dev) = opl4;
 		opl4->seq_dev->private_data = opl4;
 		opl4->seq_dev->private_free = snd_opl4_seq_dev_free;
-- 
2.50.0

