Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE09D3F23C2
	for <linux-sound@vger.kernel.org>; Wed, 21 Jan 2026 08:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768983633; cv=none; b=cRTd6PJSg/XfAqUcGHcklFqvxBQ1N0wruSD+1aXpbiAcMR7elgHTQeLtAMeDvYGaY5+i0OQq45Jet0wLjL1O87VtnpYRWcPeeHAjnFsKrZ6lCYEOeYwmJXMxFnxWWIYtmG2+WR6rX3nmAeZn5Q8ZzeNRojCJ9YCKqxTF199g2kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768983633; c=relaxed/simple;
	bh=qWRS9vZL7z4uICXfcGHxEHV5meM01aKlPDz3j235478=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=epcXdrpTz7kleHQTeYTwBdv3hoz8O0Pzwj/kmdsSHh1x65273sUogmsb+NGFUsSI9gYtcI/sPlaJIT0m6KmqzJbqG2o9t36rnGbex4HKfS9BZ3E1ZB7J449kvwUrUthXr8Aio7nMhgJzEwca27NAgTGDLmkdBFmGABgWtn1FsKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Zm+9rMwz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3enSI5mU; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Zm+9rMwz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3enSI5mU; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Zm+9rMwz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3enSI5mU";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Zm+9rMwz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3enSI5mU"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 93CCF5BCCA;
	Wed, 21 Jan 2026 08:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1768983628; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=pnpcFynuUl6nwMb9gEUHI4vEn+4zsi0vkNwNKZoZGh0=;
	b=Zm+9rMwzvh5KIQVSBJnLi+EpraW8BYo9LG4qcRE0L8/UNSkFWag/7zRKuFcbtnsmF90Mq0
	YJud959XZHiB0E2tSLh0oEs+k9sgHi0MvGKhRrQrP8EJJgPfKDxVuLjpAWsjtHyISdvLvX
	7Ul/couvlfknKGm0RaDJlKdoZOqv/pQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1768983628;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=pnpcFynuUl6nwMb9gEUHI4vEn+4zsi0vkNwNKZoZGh0=;
	b=3enSI5mU9AYZPXwLxwOhEEyeB0wDRjH+bF4CWDgo+RRAX42CUmCc3WSloOXTiFZQPSEyKN
	9zYTR9fbU5ju05Bg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Zm+9rMwz;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=3enSI5mU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1768983628; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=pnpcFynuUl6nwMb9gEUHI4vEn+4zsi0vkNwNKZoZGh0=;
	b=Zm+9rMwzvh5KIQVSBJnLi+EpraW8BYo9LG4qcRE0L8/UNSkFWag/7zRKuFcbtnsmF90Mq0
	YJud959XZHiB0E2tSLh0oEs+k9sgHi0MvGKhRrQrP8EJJgPfKDxVuLjpAWsjtHyISdvLvX
	7Ul/couvlfknKGm0RaDJlKdoZOqv/pQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1768983628;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=pnpcFynuUl6nwMb9gEUHI4vEn+4zsi0vkNwNKZoZGh0=;
	b=3enSI5mU9AYZPXwLxwOhEEyeB0wDRjH+bF4CWDgo+RRAX42CUmCc3WSloOXTiFZQPSEyKN
	9zYTR9fbU5ju05Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 771453EA63;
	Wed, 21 Jan 2026 08:20:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id I0rvG0yMcGnedQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 21 Jan 2026 08:20:28 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Edward Adam Davis <eadavis@qq.com>
Subject: [PATCH] ALSA: usb-audio: Use the right limit for PCM OOB check
Date: Wed, 21 Jan 2026 09:20:20 +0100
Message-ID: <20260121082025.718748-1-tiwai@suse.de>
X-Mailer: git-send-email 2.52.0
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
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[qq.com];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_CC(0.00)[qq.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Rspamd-Queue-Id: 93CCF5BCCA
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 

The recent fix commit for addressing the OOB access of PCM URB data
buffer caused a regression on Behringer UMC2020HD device, resulting in
choppy sound.  The fix used ep->max_urb_frames for the upper limit
check, and this is no right value to be referred.

Use the actual buffer size (ctx->buffer_size) as the upper limit
instead, which also avoids the regression on the device above.

Fixes: ef5749ef8b30 ("ALSA: usb-audio: Prevent excessive number of frames")
Link: https://bugzilla.kernel.org/show_bug.cgi?id=220997
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/pcm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index 263abb36bb2d..682b6c1fe76b 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -1553,7 +1553,8 @@ static int prepare_playback_urb(struct snd_usb_substream *subs,
 
 		for (i = 0; i < ctx->packets; i++) {
 			counts = snd_usb_endpoint_next_packet_size(ep, ctx, i, avail);
-			if (counts < 0 || frames + counts >= ep->max_urb_frames)
+			if (counts < 0 ||
+			    (frames + counts) * stride > ctx->buffer_size)
 				break;
 			/* set up descriptor */
 			urb->iso_frame_desc[i].offset = frames * stride;
-- 
2.52.0

