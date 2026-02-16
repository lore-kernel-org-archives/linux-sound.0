Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801E922F01
	for <linux-sound@vger.kernel.org>; Mon, 16 Feb 2026 14:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771251138; cv=none; b=Ye8kqEXzqJ9lxYn50KY9kHvcHfiyouyLPWwCFbXSnGOptf8/Ospy39eGTwp/fqhAk3gV3vsBVbCDpTULVud2URi3kvRf7XlAtDKIFEPwbr5jKL6J5XeU4/pCBPKzJwrNOyVjGQE/VMp2bP3sZITRQkqvgrPZEQrCD+/RVcHmKQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771251138; c=relaxed/simple;
	bh=jTfhXWXuFyB+nSXTugiEADLw9LPkr9RnkKD2/yZjay8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LeTmeOjjqsksrHTsOHJwRHLLFIBM4JcPZw9ETiEpbEdRfHxXku2xve6SIlORjwzoj2CLsrIHUBzviA/SohGh0/mUlqhLJpufbIPxA6ThXXZKovANkIUjEQh9jJvaEPdBhHsV3KFTqYH+hXFuUX0bdNFMdU7UK73oaN9MCbVYZe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DfXnHqce; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MOy4lURE; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DfXnHqce; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MOy4lURE; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DfXnHqce";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MOy4lURE";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DfXnHqce";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MOy4lURE"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D122F5BE68;
	Mon, 16 Feb 2026 14:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771251135; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dRNN8zWFM8GthAu7jSxzUmgrIYu+Mt6hsb6pLu6n/NE=;
	b=DfXnHqceR91o1JVIU5XEXFqh+fHf5IWKqeP9kbtv+eA82kYtScNvUgd5carElRjDga1+AN
	1F4EIqjSkrSnaGeZmBd5xEFi2d7b3uyw7pc4SQ15LD6PJ+6xAuBp7l+fJyyAH5FTtNB/O0
	W0HfNPzMdkjq0+joW2QDaDubLSFA42w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771251135;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dRNN8zWFM8GthAu7jSxzUmgrIYu+Mt6hsb6pLu6n/NE=;
	b=MOy4lURE6ctwdZuelA/3r/fI8BLyMBf1mKdYQyaVj6jWZx7+eGzUaEZ3S8zwzQ6O4m1Tew
	wPh89gSUKCbu2nAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771251135; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dRNN8zWFM8GthAu7jSxzUmgrIYu+Mt6hsb6pLu6n/NE=;
	b=DfXnHqceR91o1JVIU5XEXFqh+fHf5IWKqeP9kbtv+eA82kYtScNvUgd5carElRjDga1+AN
	1F4EIqjSkrSnaGeZmBd5xEFi2d7b3uyw7pc4SQ15LD6PJ+6xAuBp7l+fJyyAH5FTtNB/O0
	W0HfNPzMdkjq0+joW2QDaDubLSFA42w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771251135;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dRNN8zWFM8GthAu7jSxzUmgrIYu+Mt6hsb6pLu6n/NE=;
	b=MOy4lURE6ctwdZuelA/3r/fI8BLyMBf1mKdYQyaVj6jWZx7+eGzUaEZ3S8zwzQ6O4m1Tew
	wPh89gSUKCbu2nAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A9F9D3EA62;
	Mon, 16 Feb 2026 14:12:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8HkEKL8lk2kTGwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 16 Feb 2026 14:12:15 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 2/4] ALSA: usb-audio: Optimize the copy of packet sizes for implicit fb handling
Date: Mon, 16 Feb 2026 15:12:06 +0100
Message-ID: <20260216141209.1849200-3-tiwai@suse.de>
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
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO

We did manual copies over loop for the packet data update of the
implicit feedback, but this can be optimized with a simple memcpy().

Along with it, change the data type of snd_usb_packet_info struct to
align with other (from uint32_t to int).

No functional changes but only code optimizations.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/card.h     | 2 +-
 sound/usb/endpoint.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/usb/card.h b/sound/usb/card.h
index 94404c24d240..e34d92d576a2 100644
--- a/sound/usb/card.h
+++ b/sound/usb/card.h
@@ -90,7 +90,7 @@ struct snd_usb_endpoint {
 	struct snd_urb_ctx urb[MAX_URBS];
 
 	struct snd_usb_packet_info {
-		uint32_t packet_size[MAX_PACKS_HS];
+		int packet_size[MAX_PACKS_HS];
 		int packets;
 	} next_packet[MAX_URBS];
 	unsigned int next_packet_head;	/* ring buffer offset to read */
diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index 27ade2aa16f5..08cc2ee5707d 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -462,7 +462,7 @@ int snd_usb_queue_pending_output_urbs(struct snd_usb_endpoint *ep,
 	while (ep_state_running(ep)) {
 		struct snd_usb_packet_info *packet;
 		struct snd_urb_ctx *ctx = NULL;
-		int err, i;
+		int err;
 
 		scoped_guard(spinlock_irqsave, &ep->lock) {
 			if ((!implicit_fb || ep->next_packet_queued > 0) &&
@@ -482,8 +482,8 @@ int snd_usb_queue_pending_output_urbs(struct snd_usb_endpoint *ep,
 		/* copy over the length information */
 		if (implicit_fb) {
 			ctx->packets = packet->packets;
-			for (i = 0; i < packet->packets; i++)
-				ctx->packet_size[i] = packet->packet_size[i];
+			memcpy(ctx->packet_size, packet->packet_size,
+			       packet->packets * sizeof(packet->packet_size[0]));
 		}
 
 		/* call the data handler to fill in playback data */
-- 
2.53.0

