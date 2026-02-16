Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F6F29B200
	for <linux-sound@vger.kernel.org>; Mon, 16 Feb 2026 14:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771251149; cv=none; b=FGrz+ranoQWuhdJZChqjoqvMtxLIqEsS+x8YB7wxrz12VfyZDdwcBe4F+SUKNzTW28k4QhHZ52vKJq5MQ4kD14B15rLNtH3u8VgYSrxHsVVKJZxmpDyY5pIsYz/6E4GAQkYjfoiC6rxv4gk/N7E+i5q35aWh9mDgEYAe3gJdRKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771251149; c=relaxed/simple;
	bh=uL3srOxwhAFz/aZV8ZFlphuFt8KRjAYjxWsp6xEJQ3U=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cnD9gjni8juwmq0DhiyhlMR8WksVvqxfxVp4t6+EfTYjZX4qOhsOXf9AgsmQjsg09oHZMo75F8vDuSWStVcn9lHxGl/DMi+0OTOxsx98+2RoTee1w4ECmXUMmK4cIloFbK+hGdS0jWZPlUxvVZbTuFFE/8YdmmtPUjOySadaKeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wSX6N8Uq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gX0x82W2; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wSX6N8Uq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gX0x82W2; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wSX6N8Uq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gX0x82W2";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wSX6N8Uq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gX0x82W2"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id AA1623E870;
	Mon, 16 Feb 2026 14:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771251135; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8EK/GS9OiWsK901pgVW041aappt3nh7JwB4hDffVPk4=;
	b=wSX6N8UquIhwXfyzaTrYfhgGwLptgI/5nv5m+eX8uZwJyEYQTbH+QXhwRQM14PgypHN0YT
	4lQmCUUktZITBIAcVUYu5uyuraxewFD702c8uYmMyuF+6aHJ1D8d0inH8xNEU0aiLf8JoT
	sYqMt0JcdoqvHv6uFF8OZg2RRbTfepw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771251135;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8EK/GS9OiWsK901pgVW041aappt3nh7JwB4hDffVPk4=;
	b=gX0x82W2N0dhuAkcQEbBHk5jqemp8m5K4dh5vj04zn8YOlwmn/PPljKlgzdunHg5KLnmM9
	SGl9sW2YRt6bezBA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=wSX6N8Uq;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=gX0x82W2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771251135; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8EK/GS9OiWsK901pgVW041aappt3nh7JwB4hDffVPk4=;
	b=wSX6N8UquIhwXfyzaTrYfhgGwLptgI/5nv5m+eX8uZwJyEYQTbH+QXhwRQM14PgypHN0YT
	4lQmCUUktZITBIAcVUYu5uyuraxewFD702c8uYmMyuF+6aHJ1D8d0inH8xNEU0aiLf8JoT
	sYqMt0JcdoqvHv6uFF8OZg2RRbTfepw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771251135;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8EK/GS9OiWsK901pgVW041aappt3nh7JwB4hDffVPk4=;
	b=gX0x82W2N0dhuAkcQEbBHk5jqemp8m5K4dh5vj04zn8YOlwmn/PPljKlgzdunHg5KLnmM9
	SGl9sW2YRt6bezBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7FBD43EA64;
	Mon, 16 Feb 2026 14:12:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0KuEHb8lk2kTGwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 16 Feb 2026 14:12:15 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 1/4] ALSA: usb-audio: Update the number of packets properly at receiving
Date: Mon, 16 Feb 2026 15:12:05 +0100
Message-ID: <20260216141209.1849200-2-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim,suse.de:email]
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Rspamd-Queue-Id: AA1623E870
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 

At receiving the packets from the implicit feedback source, we didn't
update ctx->packets field but only the ctx->packet_size[] data.
In exceptional cases, this might lead to unexpectedly superfluous data
transfer (although this won't happen usually due to the nature of USB
isochronous transfer).  Fix it to update the field properly.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/endpoint.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index 8f9313857ee9..27ade2aa16f5 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -481,6 +481,7 @@ int snd_usb_queue_pending_output_urbs(struct snd_usb_endpoint *ep,
 
 		/* copy over the length information */
 		if (implicit_fb) {
+			ctx->packets = packet->packets;
 			for (i = 0; i < packet->packets; i++)
 				ctx->packet_size[i] = packet->packet_size[i];
 		}
-- 
2.53.0

