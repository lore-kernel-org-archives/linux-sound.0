Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E4F1A0BFA
	for <linux-sound@vger.kernel.org>; Tue, 10 Jun 2025 06:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749537808; cv=none; b=GMsv9BUZmO8Ri61bwRzy0FuXdhUUjSzYQF0NWa1BvnNcqyOOaimasBI6O8aZwhJpnL28a2BrXWfzsSSvVto9wocti0zGF97kYYEwubVS0k5nNf+Laka3qrv/sYLRA5/XVatb/NbtXLgeDSyWnSrp0C7NcAR7qDzvX7kGvifpwCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749537808; c=relaxed/simple;
	bh=5xfJgMizGSV+vJ+ZMIVWtNrG6/94dhL9eQGh4Iw+zSE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=UUOM/qbMP2NashJfJN0xRJxUxXQopQL+8lu6XkU3+OnxWZ7FttdeENJVAxnf62hY75exuGJALZW2U/7brr73KyUSMNllg3qIpN5u1OModMRcrscpCS5SIGsZbzAgyXKM+PbI8MY4AFhOPEuLFEXjek8WvPHN4kXx79RgrDFnuos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kzssdAsA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2duGg2Fj; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kzssdAsA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2duGg2Fj; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kzssdAsA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2duGg2Fj";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kzssdAsA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2duGg2Fj"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9CD001F38F;
	Tue, 10 Jun 2025 06:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749537804; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=BbjOUClsjMsN4tF++1Il/0dneE6Z2Rs2MKgGv63zKP0=;
	b=kzssdAsA46ta9PkfYCVyuSNc7SA4zJbdP/Egv+JH/5vn/rDHWTUDM87NeK6SOOn6zDjMZ9
	TcDi6pjQPp6KtFjNuNnI1YOIqDDvhKBcMNeR/YCLRFFKSCgiU4x1ad2vXEoeXVQqwO0gPo
	+g+h6aqAQNoJBR4ovU4nJiMP84aIrOw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749537804;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=BbjOUClsjMsN4tF++1Il/0dneE6Z2Rs2MKgGv63zKP0=;
	b=2duGg2FjhOcT0iInMXkPUqwkR/xMHSczXX9MNIteaAam0YYh33pDJIU9PX6VVTVIWELH1G
	p947wHHTZMXRq5Cw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=kzssdAsA;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=2duGg2Fj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749537804; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=BbjOUClsjMsN4tF++1Il/0dneE6Z2Rs2MKgGv63zKP0=;
	b=kzssdAsA46ta9PkfYCVyuSNc7SA4zJbdP/Egv+JH/5vn/rDHWTUDM87NeK6SOOn6zDjMZ9
	TcDi6pjQPp6KtFjNuNnI1YOIqDDvhKBcMNeR/YCLRFFKSCgiU4x1ad2vXEoeXVQqwO0gPo
	+g+h6aqAQNoJBR4ovU4nJiMP84aIrOw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749537804;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=BbjOUClsjMsN4tF++1Il/0dneE6Z2Rs2MKgGv63zKP0=;
	b=2duGg2FjhOcT0iInMXkPUqwkR/xMHSczXX9MNIteaAam0YYh33pDJIU9PX6VVTVIWELH1G
	p947wHHTZMXRq5Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7C8C0139E2;
	Tue, 10 Jun 2025 06:43:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id S0jZHAzUR2iqdAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 10 Jun 2025 06:43:24 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 1/2] ALSA: sb: Don't allow changing the DMA mode during operations
Date: Tue, 10 Jun 2025 08:43:19 +0200
Message-ID: <20250610064322.26787-1-tiwai@suse.de>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 9CD001F38F
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_NONE(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim,suse.de:email];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01
X-Spam-Level: 

When a PCM stream is already running, one shouldn't change the DMA
mode via kcontrol, which may screw up the hardware.  Return -EBUSY
instead.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=218185
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/sb/sb16_main.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/isa/sb/sb16_main.c b/sound/isa/sb/sb16_main.c
index 74db11525003..c4930efd44e3 100644
--- a/sound/isa/sb/sb16_main.c
+++ b/sound/isa/sb/sb16_main.c
@@ -703,6 +703,9 @@ static int snd_sb16_dma_control_put(struct snd_kcontrol *kcontrol, struct snd_ct
 	unsigned char nval, oval;
 	int change;
 	
+	if (chip->mode & (SB_MODE_PLAYBACK | SB_MODE_CAPTURE))
+		return -EBUSY;
+
 	nval = ucontrol->value.enumerated.item[0];
 	if (nval > 2)
 		return -EINVAL;
-- 
2.49.0

