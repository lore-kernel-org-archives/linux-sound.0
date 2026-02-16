Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB3029ACC0
	for <linux-sound@vger.kernel.org>; Mon, 16 Feb 2026 14:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771251155; cv=none; b=KxUM4qGKXSjRbMzWJY8rXdfP75/ej0ZvNOFtQ+nGRxthbPwSGm/xifWiRYEW6zGEU0hfjaicI6yW4TQQNP7jBVluRE0ZpEdAIfqksEM1xx7LEVHK7UFg/aJoBGBCFFXbymkaa3p5jKEFNDBFAYYsOpq2A91IMAh719J+jtueglw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771251155; c=relaxed/simple;
	bh=oQ93S+rJLsCPv0ljgTIx+qyWyPVbWgzQEcoIVXgSh3w=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K4BOOCB+T3C7T1P77Swu27dShyPgtooLITS8V6i8DRKywVAst2EHmFwm3+3R4iSGlv9GOVkJxH1vXLWaD1KrzOQfEah5I8wyf/0A56KhBGNW5dwzQ9JARsiKhM0ldjWL5maxXr1gp0Jpb+LBun0g0b2SAV5U3pLeniNMrfarHfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nBpUtt2X; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Iqjdc5Ps; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nBpUtt2X; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Iqjdc5Ps; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nBpUtt2X";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Iqjdc5Ps";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nBpUtt2X";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Iqjdc5Ps"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 03FCB3E86E;
	Mon, 16 Feb 2026 14:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771251136; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d6gTfYbm8e+PlPPXBJRGETTJcsh2ZYL4799glhkRKgA=;
	b=nBpUtt2XrdIUSEBPdkVnhLI5HAqwhOzhlxuejvTklhXN53mm2fQ5z1mdkoXfLZQu2iWwEF
	JOworM0GqtynbRPo0XQfNtM3uQP4lsUm5Da2pol+jojHSbC97Ts/irZnwqzwUdr1/Wb6C2
	VbkMPw9sT/XaPGlrn4Kvw9JXTRjaSEY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771251136;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d6gTfYbm8e+PlPPXBJRGETTJcsh2ZYL4799glhkRKgA=;
	b=Iqjdc5PsIGJDDUaTtpvs5katXYGdnIz3yREm4TzeDuOHVDI+EsQTx0jJM2j1a5P67Uq7DA
	5CHzPvjR0xZWXuAA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=nBpUtt2X;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Iqjdc5Ps
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771251136; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d6gTfYbm8e+PlPPXBJRGETTJcsh2ZYL4799glhkRKgA=;
	b=nBpUtt2XrdIUSEBPdkVnhLI5HAqwhOzhlxuejvTklhXN53mm2fQ5z1mdkoXfLZQu2iWwEF
	JOworM0GqtynbRPo0XQfNtM3uQP4lsUm5Da2pol+jojHSbC97Ts/irZnwqzwUdr1/Wb6C2
	VbkMPw9sT/XaPGlrn4Kvw9JXTRjaSEY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771251136;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d6gTfYbm8e+PlPPXBJRGETTJcsh2ZYL4799glhkRKgA=;
	b=Iqjdc5PsIGJDDUaTtpvs5katXYGdnIz3yREm4TzeDuOHVDI+EsQTx0jJM2j1a5P67Uq7DA
	5CHzPvjR0xZWXuAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D02583EA64;
	Mon, 16 Feb 2026 14:12:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id oB6NMb8lk2kTGwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 16 Feb 2026 14:12:15 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 3/4] ALSA: usb-audio: Add sanity check for OOB writes at silencing
Date: Mon, 16 Feb 2026 15:12:07 +0100
Message-ID: <20260216141209.1849200-4-tiwai@suse.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260216141209.1849200-1-tiwai@suse.de>
References: <20260216141209.1849200-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_NONE(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Rspamd-Queue-Id: 03FCB3E86E
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 

At silencing the playback URB packets in the implicit fb mode before
the actual playback, we blindly assume that the received packets fit
with the buffer size.  But when the setup in the capture stream
differs from the playback stream (e.g. due to the USB core limitation
of max packet size), such an inconsistency may lead to OOB writes to
the buffer, resulting in a crash.

For addressing it, add a sanity check of the transfer buffer size at
prepare_silent_urb(), and stop the data copy if the received data
overflows.  Also, report back the transfer error properly from there,
too.

Note that this doesn't fix the root cause of the playback error
itself, but this merely covers the kernel Oops.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=221076
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/endpoint.c | 37 +++++++++++++++++++++----------------
 1 file changed, 21 insertions(+), 16 deletions(-)

diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index 08cc2ee5707d..6e443f762de8 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -275,8 +275,8 @@ static inline bool has_tx_length_quirk(struct snd_usb_audio *chip)
 	return chip->quirk_flags & QUIRK_FLAG_TX_LENGTH;
 }
 
-static void prepare_silent_urb(struct snd_usb_endpoint *ep,
-			       struct snd_urb_ctx *ctx)
+static int prepare_silent_urb(struct snd_usb_endpoint *ep,
+			      struct snd_urb_ctx *ctx)
 {
 	struct urb *urb = ctx->urb;
 	unsigned int offs = 0;
@@ -289,28 +289,34 @@ static void prepare_silent_urb(struct snd_usb_endpoint *ep,
 		extra = sizeof(packet_length);
 
 	for (i = 0; i < ctx->packets; ++i) {
-		unsigned int offset;
-		unsigned int length;
-		int counts;
+		int length;
 
-		counts = snd_usb_endpoint_next_packet_size(ep, ctx, i, 0);
-		length = counts * ep->stride; /* number of silent bytes */
-		offset = offs * ep->stride + extra * i;
-		urb->iso_frame_desc[i].offset = offset;
+		length = snd_usb_endpoint_next_packet_size(ep, ctx, i, 0);
+		if (length < 0)
+			return length;
+		length *= ep->stride; /* number of silent bytes */
+		if (offs + length + extra > ctx->buffer_size)
+			break;
+		urb->iso_frame_desc[i].offset = offs;
 		urb->iso_frame_desc[i].length = length + extra;
 		if (extra) {
 			packet_length = cpu_to_le32(length);
-			memcpy(urb->transfer_buffer + offset,
+			memcpy(urb->transfer_buffer + offs,
 			       &packet_length, sizeof(packet_length));
+			offs += extra;
 		}
-		memset(urb->transfer_buffer + offset + extra,
+		memset(urb->transfer_buffer + offs,
 		       ep->silence_value, length);
-		offs += counts;
+		offs += length;
 	}
 
-	urb->number_of_packets = ctx->packets;
-	urb->transfer_buffer_length = offs * ep->stride + ctx->packets * extra;
+	if (!offs)
+		return -EPIPE;
+
+	urb->number_of_packets = i;
+	urb->transfer_buffer_length = offs;
 	ctx->queued = 0;
+	return 0;
 }
 
 /*
@@ -332,8 +338,7 @@ static int prepare_outbound_urb(struct snd_usb_endpoint *ep,
 		if (data_subs && ep->prepare_data_urb)
 			return ep->prepare_data_urb(data_subs, urb, in_stream_lock);
 		/* no data provider, so send silence */
-		prepare_silent_urb(ep, ctx);
-		break;
+		return prepare_silent_urb(ep, ctx);
 
 	case SND_USB_ENDPOINT_TYPE_SYNC:
 		if (snd_usb_get_speed(ep->chip->dev) >= USB_SPEED_HIGH) {
-- 
2.53.0

