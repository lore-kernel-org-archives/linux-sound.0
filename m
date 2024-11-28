Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F0014658C
	for <linux-sound@vger.kernel.org>; Thu, 28 Nov 2024 08:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732781092; cv=none; b=nZ9nbG8S/BLt/gkaz164Au/geRI7NcW2tKsTnAQ8tqpTyynhaADQ5beHoZWTJ9nJvShg0pk50ja9idoUajJFgyp0e132jxTC2UcNtfrhIcgQQz63nUyyHxB9XUwKHtrVVzxSvozNuASp1kLIy6UM5JqAble1pMwucK8C4k9Z4WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732781092; c=relaxed/simple;
	bh=S+yr0L1ldqg0HML8a903fZcHx+E4nClmRArfKrFX8zw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FzATylQchM9gpNsz32aCmNIPC417NzGuv1uo5pF8zJRQ5o/N59+puy2WQmgEVWPLF+cRm9KlG1Ytv+r4W33OVNX1KZTqc6NR7eLviEZe+Q3e5Bgvuzai/qZrIv9h3rcZMTEwEPWc3UlUyLQn3ZNSguXIW8WLFvD2DmgO3vbLj48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SEsIcfWR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VA9igkpN; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SEsIcfWR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VA9igkpN; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SEsIcfWR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VA9igkpN";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SEsIcfWR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VA9igkpN"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3E8AE210FE;
	Thu, 28 Nov 2024 08:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732781088; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=CDg5sIKG/OFNsPMAcfdmcQ0ckbQWOl6HeoSkwMAVby8=;
	b=SEsIcfWRXO4J4Z44JypfqbGJSSha0tV9wAFFWV5QAhL/Ib5uCzImn+lNr0XGlNOQ846NbG
	u745g5Uq4MaXLt80LdXopbR/W2y9/FBWxji8Pz5BrWExqg4PPLfjOie2Np3DfLaSagr4pu
	O6oJHnHsTNhhFwaIXaxYzKAqMTFfoKs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732781088;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=CDg5sIKG/OFNsPMAcfdmcQ0ckbQWOl6HeoSkwMAVby8=;
	b=VA9igkpNo5dgQb4LdVViT6zIplBix9EZ4bxTUu4ggaVVjyeIvjPKs60fHv2BZVRiBuOuCC
	b+rs1L/4O2INNSDw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=SEsIcfWR;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=VA9igkpN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732781088; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=CDg5sIKG/OFNsPMAcfdmcQ0ckbQWOl6HeoSkwMAVby8=;
	b=SEsIcfWRXO4J4Z44JypfqbGJSSha0tV9wAFFWV5QAhL/Ib5uCzImn+lNr0XGlNOQ846NbG
	u745g5Uq4MaXLt80LdXopbR/W2y9/FBWxji8Pz5BrWExqg4PPLfjOie2Np3DfLaSagr4pu
	O6oJHnHsTNhhFwaIXaxYzKAqMTFfoKs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732781088;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=CDg5sIKG/OFNsPMAcfdmcQ0ckbQWOl6HeoSkwMAVby8=;
	b=VA9igkpNo5dgQb4LdVViT6zIplBix9EZ4bxTUu4ggaVVjyeIvjPKs60fHv2BZVRiBuOuCC
	b+rs1L/4O2INNSDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2057313974;
	Thu, 28 Nov 2024 08:04:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id F8u/BiAkSGfHHQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 28 Nov 2024 08:04:48 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Leonard Crestez <cdleonard@gmail.com>
Subject: [PATCH] ALSA: usb-audio: Notify xrun for low-latency mode
Date: Thu, 28 Nov 2024 09:04:16 +0100
Message-ID: <20241128080446.1181-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3E8AE210FE
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	FREEMAIL_CC(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

The low-latency mode of USB-audio driver uses a similar approach like
the implicit feedback mode but it has an explicit queuing at the
trigger start time.  The difference is, however, that no packet will
be handled any longer after all queued packets are handled but no
enough data is fed.  In the case of implicit feedback mode, the
capture-side packet handling triggers the re-queuing, and this checks
the XRUN.  OTOH, in the low-latency mode, it just stops without XRUN
notification unless any new action is taken from user-space via ack
callback.  For example, when you stop the stream in aplay, no XRUN is
reported.

This patch adds the XRUN check at the packet complete callback in the
case all pending URBs are exhausted.  Strictly speaking, this state
doesn't match really with XRUN; in theory the application may queue
immediately after this happens.  But such behavior is only for
1-period configuration, which the USB-audio driver doesn't support.
So we may conclude that this situation leads certainly to XRUN.

A caveat is that the XRUN should be triggered only for the PCM RUNNING
state, and not during DRAINING.  This additional state check is put in
notify_xrun(), too.

Fixes: d5f871f89e21 ("ALSA: usb-audio: Improved lowlatency playback support")
Reported-by: Leonard Crestez <cdleonard@gmail.com>
Link: https://lore.kernel.org/25d5b0d8-4efd-4630-9d33-7a9e3fa9dc2b@gmail.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/endpoint.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index 568099467dbb..a29f28eb7d0c 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -403,10 +403,15 @@ static int prepare_inbound_urb(struct snd_usb_endpoint *ep,
 static void notify_xrun(struct snd_usb_endpoint *ep)
 {
 	struct snd_usb_substream *data_subs;
+	struct snd_pcm_substream *psubs;
 
 	data_subs = READ_ONCE(ep->data_subs);
-	if (data_subs && data_subs->pcm_substream)
-		snd_pcm_stop_xrun(data_subs->pcm_substream);
+	if (!data_subs)
+		return;
+	psubs = data_subs->pcm_substream;
+	if (psubs && psubs->runtime &&
+	    psubs->runtime->state == SNDRV_PCM_STATE_RUNNING)
+		snd_pcm_stop_xrun(psubs);
 }
 
 static struct snd_usb_packet_info *
@@ -562,7 +567,10 @@ static void snd_complete_urb(struct urb *urb)
 			push_back_to_ready_list(ep, ctx);
 			clear_bit(ctx->index, &ep->active_mask);
 			snd_usb_queue_pending_output_urbs(ep, false);
-			atomic_dec(&ep->submitted_urbs); /* decrement at last */
+			/* decrement at last, and check xrun */
+			if (atomic_dec_and_test(&ep->submitted_urbs) &&
+			    !snd_usb_endpoint_implicit_feedback_sink(ep))
+				notify_xrun(ep);
 			return;
 		}
 
-- 
2.43.0

