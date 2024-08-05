Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10BC81E480
	for <linux-sound@vger.kernel.org>; Mon,  5 Aug 2024 13:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722862856; cv=none; b=TsiBIXrU5BmuKZlgJ3n57OGBIM366edCrixbv5w1NEG1aqmJJlGAynzQLDMaEp3XT6J1ujBFruuldJ6rN+Q3xU6Ul1gWFHpEBZnSuDse2K9a1Fn5x7Y4hqG8Lk8KEhTTkrOFYDxTfeBaIFsel9pQjDokramPNKJ7aK5hBHRarmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722862856; c=relaxed/simple;
	bh=it/9TQj09E1uiMvs9gCdXLjrI9r47lIJ5e7krLeeu6A=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=Vxx4vpVm1zG6O4PjjQp1x/z84Q/B+UK7kXxi7w3mS1xz9KtRmBosjjcHGhLPoeZ4FZuCbnGDbiIVi59e963tHnEdzguWsmlXQltuv3/kG6SllD2/sDcTGNgs0Ls8U7A3+Pk6x5ritiye795BmAMPnEDEwWfW09QiSpdT+c0wh4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CTl9X+GR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jxwT2brf; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CTl9X+GR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jxwT2brf; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CTl9X+GR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jxwT2brf";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CTl9X+GR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jxwT2brf"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 167361F841;
	Mon,  5 Aug 2024 13:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722862853; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=wYQZS2bIQ1xkBC7vm42xw6NH2Cmc/Q9P91th9EEjOco=;
	b=CTl9X+GRD+U61jiF2gj9tCDSN0wBVSSEqaRyzrQXrjaZJen0+8drV5L9gMELhl0ESM7RwW
	MQTvwq5wdE42MrO5YqiyMgxuFJw5v4FG2Ns9TcuENCDS6eHe03Vl/kxHuWhSzKfL0BfiGN
	KwVmn5UfrJcZRIcFCt0CpvOyF8NxuM8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722862853;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=wYQZS2bIQ1xkBC7vm42xw6NH2Cmc/Q9P91th9EEjOco=;
	b=jxwT2brfkL2mBqiLaKO+ZYaHaEI+lYgYgqcx0EZRgJG6RjArMFw+rYjlyAr9MLxlTxX8AM
	M3bAyLnKJ2gXQXCg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=CTl9X+GR;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=jxwT2brf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722862853; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=wYQZS2bIQ1xkBC7vm42xw6NH2Cmc/Q9P91th9EEjOco=;
	b=CTl9X+GRD+U61jiF2gj9tCDSN0wBVSSEqaRyzrQXrjaZJen0+8drV5L9gMELhl0ESM7RwW
	MQTvwq5wdE42MrO5YqiyMgxuFJw5v4FG2Ns9TcuENCDS6eHe03Vl/kxHuWhSzKfL0BfiGN
	KwVmn5UfrJcZRIcFCt0CpvOyF8NxuM8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722862853;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=wYQZS2bIQ1xkBC7vm42xw6NH2Cmc/Q9P91th9EEjOco=;
	b=jxwT2brfkL2mBqiLaKO+ZYaHaEI+lYgYgqcx0EZRgJG6RjArMFw+rYjlyAr9MLxlTxX8AM
	M3bAyLnKJ2gXQXCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F10F613ACF;
	Mon,  5 Aug 2024 13:00:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id H7ucOQTNsGY0MQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 05 Aug 2024 13:00:52 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: line6: Fix racy access to midibuf
Date: Mon,  5 Aug 2024 15:01:28 +0200
Message-ID: <20240805130129.10872-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spam-Score: -5.01
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 167361F841
X-Spamd-Result: default: False [-5.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	TO_DN_NONE(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

There can be concurrent accesses to line6 midibuf from both the URB
completion callback and the rawmidi API access.  This could be a cause
of KMSAN warning triggered by syzkaller below (so put as reported-by
here).

This patch protects the midibuf call of the former code path with a
spinlock for avoiding the possible races.

Reported-by: syzbot+78eccfb8b3c9a85fc6c5@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/00000000000000949c061df288c5@google.com
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/line6/driver.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/usb/line6/driver.c b/sound/usb/line6/driver.c
index f4437015d43a..9df49a880b75 100644
--- a/sound/usb/line6/driver.c
+++ b/sound/usb/line6/driver.c
@@ -286,12 +286,14 @@ static void line6_data_received(struct urb *urb)
 {
 	struct usb_line6 *line6 = (struct usb_line6 *)urb->context;
 	struct midi_buffer *mb = &line6->line6midi->midibuf_in;
+	unsigned long flags;
 	int done;
 
 	if (urb->status == -ESHUTDOWN)
 		return;
 
 	if (line6->properties->capabilities & LINE6_CAP_CONTROL_MIDI) {
+		spin_lock_irqsave(&line6->line6midi->lock, flags);
 		done =
 			line6_midibuf_write(mb, urb->transfer_buffer, urb->actual_length);
 
@@ -300,12 +302,15 @@ static void line6_data_received(struct urb *urb)
 			dev_dbg(line6->ifcdev, "%d %d buffer overflow - message skipped\n",
 				done, urb->actual_length);
 		}
+		spin_unlock_irqrestore(&line6->line6midi->lock, flags);
 
 		for (;;) {
+			spin_lock_irqsave(&line6->line6midi->lock, flags);
 			done =
 				line6_midibuf_read(mb, line6->buffer_message,
 						   LINE6_MIDI_MESSAGE_MAXLEN,
 						   LINE6_MIDIBUF_READ_RX);
+			spin_unlock_irqrestore(&line6->line6midi->lock, flags);
 
 			if (done <= 0)
 				break;
-- 
2.43.0

