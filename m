Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E034D1E487
	for <linux-sound@vger.kernel.org>; Tue, 14 May 2024 18:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715711256; cv=none; b=YIbxPmgqz8S4F6H4IhPr/vBdzce02v11rGlbMZ3o+0jxbsEdpFWfqAJ1ZJZNnwD0p8T0F7zhwUuyCIDcl8OjivVLIgRFZIqIgunu6S6jDnn0gC3pmP5iDQizSsX9tMqGu4YQFTgoZWngMyU7s/dUiwtO5IH3y39yAGAVKPlgO5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715711256; c=relaxed/simple;
	bh=bMTnpdLdwyV314mIFhVTRBK8AUBwO/Us+1NX8Dsb3xI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=P/snJfVA8EPF6eeVAkkgJW61VAyN0pxCHhQZkNc/OVqnh2V1ox8T7ItKnL3NJ3D03NvgJ3nFW2Xsv4HanFMCaN5sLHPj9U57I61bnaCCbswV9zJDPGqmwNwGXCitUGDl3ffgbB/4B+n8f5tQqXZryH8hNmgOdf1V09CxjI+z8tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OkjvDck9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7fk8SE+U; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Sk4RavkU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=r9+y6k4J; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OkjvDck9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7fk8SE+U";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Sk4RavkU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="r9+y6k4J"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B2DCB211FE;
	Tue, 14 May 2024 18:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715711252; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=osIig9qPXhnaAlEX//3ZXezpnHzB94MDBQ97szp7CKE=;
	b=OkjvDck9UwSIoB878XRMV13RgOnTx6gMVjdSBsjDuxH3uWM4eXPPdRTWhiR2CETJwMsGGP
	HQLvuT8XYh/s/znAf6GGMyS8jSJMajXtTdSO6SB7gK7xuKCzvcXlEWtGzvt8UKBgvxSZjI
	4knoxk0aTgliLohlxxZEV+bb75a+BMY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715711252;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=osIig9qPXhnaAlEX//3ZXezpnHzB94MDBQ97szp7CKE=;
	b=7fk8SE+UEDq+3NhXq5NLTEn9qecBGqx/u0yQZiB6+b3chvhXRH6yB8+kESET9AtSakU7iY
	EjEm/8eci0grZZDQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715711251; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=osIig9qPXhnaAlEX//3ZXezpnHzB94MDBQ97szp7CKE=;
	b=Sk4RavkU6Xro7jhaOshyDQf/ijgD+ajdbWiwtcJIZb//5FPQyL4d/9QH1l7nEAfkeuxinn
	QmwR4oy3O4/bMbxo0uvA1FIl59JIFBzC9CCDDpZiqZiOJHpbM/ch4+NGMmGF5Y3H/MKHYu
	kwotAdGw8WSNLVOR5QJzYDyWmVRIaFU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715711251;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=osIig9qPXhnaAlEX//3ZXezpnHzB94MDBQ97szp7CKE=;
	b=r9+y6k4Jcz9ms1O8xgXA+tGbUzl34zZJZBkMiyfg/1hjcIPytixNqvpPxSJdRwkAALCAs7
	/QeFKntRSK6bG0Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 98FF61372E;
	Tue, 14 May 2024 18:27:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2aQaJBOtQ2aCAQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 14 May 2024 18:27:31 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: timer: Set lower bound of start tick time
Date: Tue, 14 May 2024 20:27:36 +0200
Message-ID: <20240514182745.4015-1-tiwai@suse.de>
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
	BAYES_HAM(-3.00)[100.00%];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,appspotmail.com:email,suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Flag: NO

Currently ALSA timer doesn't have the lower limit of the start tick
time, and it allows a very small size, e.g. 1 tick with 1ns resolution
for hrtimer.  Such a situation may lead to an unexpected RCU stall,
where  the callback repeatedly queuing the expire update, as reported
by fuzzer.

This patch introduces a sanity check of the timer start tick time, so
that the system returns an error when a too small start size is set.
As of this patch, the lower limit is hard-coded to 100us, which is
small enough but can still work somehow.

Reported-by: syzbot+43120c2af6ca2938cc38@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/r/000000000000fa00a1061740ab6d@google.com
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/timer.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/core/timer.c b/sound/core/timer.c
index 4d2ee99c12a3..d104adc75a8b 100644
--- a/sound/core/timer.c
+++ b/sound/core/timer.c
@@ -544,6 +544,14 @@ static int snd_timer_start1(struct snd_timer_instance *timeri,
 			     SNDRV_TIMER_IFLG_START))
 		return -EBUSY;
 
+	/* check the actual time for the start tick;
+	 * bail out as error if it's way too low (< 100us)
+	 */
+	if (start) {
+		if ((u64)snd_timer_hw_resolution(timer) * ticks < 100000)
+			return -EINVAL;
+	}
+
 	if (start)
 		timeri->ticks = timeri->cticks = ticks;
 	else if (!timeri->cticks)
-- 
2.43.0

