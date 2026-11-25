Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795615863;
	b=rpsf1Jp497m2+EnAbbNFXyfSDokmohQB9d+Cpw3jE4smg5qRlczKIeG9nUUt4f9uPPRi
	 v4Cdi6kRI71Vc+vJHYDPZ0n1zd/E9rvDxhBSMK72iaLSwnBEdEhcuRoonFq2f3KnWap0a
	 TAf6/mAvrjpPjNlfQN5TenQolYgJPkJ+7AlNHOoLyvnuLOsmrAYusARfcxl+HCtfazXFf
	 Hc2jc0FKxOpn2W0gPP7YLuQZqsKtBG3Zp+27JUabNIlCCRcRsU0V+JBn9fXqEn1ejZySj
	 4Z5qEqczfS7+DBm+vqk2ZIXeDdjPjEJlZrP9/wVecIUSvcmQwgz6I7KDStHu6MXsUfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795615863;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-Rspamd-Queue-Id:
	 X-Spam-Level:X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:
	 X-Spamd-Result:X-Spam-Score;
	bh=kMUPprzkb/xW/UwvGiS5x83c4LFUkbe20/iJlMpOVr0=;
	b=j3utqG02jV+6TKi7U62nEIKoh/h5HZW+TDvx3+nUlxknfxboEjYCkWu9cFyUbw7PenCI
	 HutUhlZJ+aN8tbkjQtIQXW+OmbJbLGLW9wCsl8pygcy1Z6x4OZVO36r+sd6hEHmX2CYLF
	 gdaV8XG4JXvUB+jiFnGLeV76SoaZZMxvQewb8cMqaJvCZH6Y68EwZbsHzRA5nzS31CC56
	 YDovHL5GXgu1PfOzdR9twFDc6MkAc8IDfUIlOXVRY2ynazntLFGOGiDPlAe34B4Zsaxvw
	 o5gQtnc4W7UeJq0O/IIf25xwdDyCQm7w6jp/Uux9YlI5EBedBCkMggONsZA8qoQTiSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=UJtvLx3z;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=jOb+0tDZ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=bMPoVTFO;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="Z/2k+/0v";
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1EA5606A68C
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 14:11:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1EA5606A68C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=UJtvLx3z;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=jOb+0tDZ;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=bMPoVTFO;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Z/2k+/0v
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3D9581F7E1;
	Wed, 25 Nov 2026 14:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795615861; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=kMUPprzkb/xW/UwvGiS5x83c4LFUkbe20/iJlMpOVr0=;
	b=UJtvLx3zuNurZf05bzgfelc5QRIxj/GDhWDDBsBEy/vmqNXgUKnLRb8pbV5wSiyhKWucYx
	xvqH51gBh9kwP1gewmcL6KKttdCjDnTMidFZLlO06qA4r9bEC1gdP2dmCYXGnGoxcBjKDr
	yN2MsJ56VCf6+Jsnn/eb9w9m9rlwhgI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795615861;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=kMUPprzkb/xW/UwvGiS5x83c4LFUkbe20/iJlMpOVr0=;
	b=jOb+0tDZgQFayfv+KY4OJ4wOEIroB4Q734p9j7Oq2+73R4U4TxuBsvt9DZh6KywQQIFMvS
	kS/+FO4CP8KzJACA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=bMPoVTFO;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="Z/2k+/0v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795615860; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=kMUPprzkb/xW/UwvGiS5x83c4LFUkbe20/iJlMpOVr0=;
	b=bMPoVTFONQ7S7Oim7hUmFihsS2hX24JfzuPPz4lL7iXA7wj5W2lBGgJHN/vjHwSQ9PR4Dg
	LxjoT1C9h3dEruw8F1OLbgQqTJN0HwX80utuE14fi4MYWn6++bzIdx/MQ4L2i5SZ+uGlhW
	W22ssMH9DVhCLdx8KCWKeOP5uwxFxdg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795615860;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=kMUPprzkb/xW/UwvGiS5x83c4LFUkbe20/iJlMpOVr0=;
	b=Z/2k+/0v7oRJogj5s5GvVJRIAEbdRKK0VlNXPfZn5E7S16wfoEh3137tdVY9HGTpHDw/GN
	SwHRzvmrIbZ9KJCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 05C49134E8;
	Wed, 25 Nov 2026 14:11:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OSRhM3PsBmuVUgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 25 Nov 2026 14:10:59 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: usb-audio: Don't queue playback URBs after stop
Date: Wed, 25 Nov 2026 15:10:56 +0100
Message-ID: <20261125141057.2094719-1-tiwai@suse.de>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3D9581F7E1
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-12.01 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FROM_EQ_ENVFROM(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:email];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -12.01

Although we've tried to address the corrupted ready_list for the
playback URBs due to the concurrent start/stop of streams, there seems
still a slight race: namely, in snd_complete_urb(), the driver checks
the EP check via ep_state_running() and process
push_back_to_ready_list() only when the EP isn't stopped.  But since
the EP state change can still happen between the EP state check and
push_back_to_ready_list(), push_back_to_ready_list() may queue the
URBs unexpectedly even after the EP gets stopped.  This may result in
a list corruption when the stream is restarted.

The addition to the list itself is properly protected by a lock, so as
a stop-gap, just add the EP state check again before actually adding
to the list.

In a long-term, we should reorganize the code to cover the EP state
changes more consistently, but this should suffice for the particular
race, at least.

Reported-by: Miloslav Brada <email@miloslavbrada.cz>
Closes: https://lore.kernel.org/awZs88beIhMcOchv@genesis.transkript.cz
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/endpoint.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index 8dd0b3525e4b..02f0049cacf3 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -449,6 +449,9 @@ static void push_back_to_ready_list(struct snd_usb_endpoint *ep,
 				    struct snd_urb_ctx *ctx)
 {
 	guard(spinlock_irqsave)(&ep->lock);
+	/* don't re-queue after stop_urbs() flushed the list */
+	if (!ep_state_running(ep))
+		return;
 	/* ctx may still be linked: a stale completion racing a stop/restart. */
 	if (list_empty(&ctx->ready_list))
 		list_add_tail(&ctx->ready_list, &ep->ready_playback_urbs);
-- 
2.53.0

