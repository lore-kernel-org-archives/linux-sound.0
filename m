Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59DAC8F5C
	for <linux-sound@vger.kernel.org>; Wed, 26 Jun 2024 14:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719413478; cv=none; b=n2Byoij0niS+m1AVcR4lrjrRU0K1kQ7QOc6axE0lPmrqvGqzEEl2bNzmlSeRqZrRM/EW/DVruAXk2QCTCBwrYuVYof8nZY68TQKK6CD5TwORK4VnR4avpc9dRAZWw0SqrMN5hchidAqjsBaiqg5LilY1V7V98bTqxf+tw4HKz2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719413478; c=relaxed/simple;
	bh=rtOA0mh0Y0hYm3zIamAI18Lm3RxjLwFTj3gOeQqZNnk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=GYeFHpF6cSHxvCQMW11LX9iMU/nTZ9mfyE8ghZoJTxy6cMSPTLmiAKRNLUzRj1pI6jIahVph3x0ebJBtR0kL3uvjmc91VmWAyEckkGmkIGmJxNnahhNk3crBey/BMq/xqBc66Iihd66MIROUAHukbD+naJcJ9zTVuxnxGkUhVrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BdWEzD9c; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=N4c/Cotv; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BdWEzD9c; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=N4c/Cotv; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BdWEzD9c";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="N4c/Cotv";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BdWEzD9c";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="N4c/Cotv"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5110421ACB;
	Wed, 26 Jun 2024 14:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1719413475; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=7vBH510316Y9zp+Fop0ykBx48Up2cGE+QtFP7X3/E+g=;
	b=BdWEzD9cueVVwtv8V0w6YE+lEIZth7EnF3c8i9c5hFQvmGLDypj9ThAnnRJCcNYt610XYM
	q5O/QkBmZ/6z1pf7c9xW+jvqspfNj2DwdT8K3vHFnAcavxOsWrCSLmHr/RbN99V1WuIPej
	+vCjNJslB+DP4nm1V3JBPx/x4B4sktw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1719413475;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=7vBH510316Y9zp+Fop0ykBx48Up2cGE+QtFP7X3/E+g=;
	b=N4c/CotvDxEkq7OUB0J5dqoUEKHFeb9MU0W8KRYy6XiRhGsKQBNvat7aRV0REobUk9nKpt
	NOlEXIdO+VW43JDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1719413475; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=7vBH510316Y9zp+Fop0ykBx48Up2cGE+QtFP7X3/E+g=;
	b=BdWEzD9cueVVwtv8V0w6YE+lEIZth7EnF3c8i9c5hFQvmGLDypj9ThAnnRJCcNYt610XYM
	q5O/QkBmZ/6z1pf7c9xW+jvqspfNj2DwdT8K3vHFnAcavxOsWrCSLmHr/RbN99V1WuIPej
	+vCjNJslB+DP4nm1V3JBPx/x4B4sktw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1719413475;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=7vBH510316Y9zp+Fop0ykBx48Up2cGE+QtFP7X3/E+g=;
	b=N4c/CotvDxEkq7OUB0J5dqoUEKHFeb9MU0W8KRYy6XiRhGsKQBNvat7aRV0REobUk9nKpt
	NOlEXIdO+VW43JDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 37741139C2;
	Wed, 26 Jun 2024 14:51:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id hIFjDOMqfGbXXAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 26 Jun 2024 14:51:15 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: seq: Fix missing MSB in MIDI2 SPP conversion
Date: Wed, 26 Jun 2024 16:51:13 +0200
Message-ID: <20240626145141.16648-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]

The conversion of SPP to MIDI2 UMP called a wrong function, and the
secondary argument wasn't taken.  As a result, MSB of SPP was always
zero.  Fix to call the right function.

Fixes: e9e02819a98a ("ALSA: seq: Automatic conversion of UMP events")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_ump_convert.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/seq/seq_ump_convert.c b/sound/core/seq/seq_ump_convert.c
index 6687efdceea1..e90b27a135e6 100644
--- a/sound/core/seq/seq_ump_convert.c
+++ b/sound/core/seq/seq_ump_convert.c
@@ -1020,7 +1020,7 @@ static int system_2p_ev_to_ump_midi2(const struct snd_seq_event *event,
 				     union snd_ump_midi2_msg *data,
 				     unsigned char status)
 {
-	return system_1p_ev_to_ump_midi1(event, dest_port,
+	return system_2p_ev_to_ump_midi1(event, dest_port,
 					 (union snd_ump_midi1_msg *)data,
 					 status);
 }
-- 
2.43.0

