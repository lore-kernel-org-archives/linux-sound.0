Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF47134D3AA
	for <linux-sound@vger.kernel.org>; Sun,  9 Nov 2025 09:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762679546; cv=none; b=fEAu+QXkljbATDbbOMPnPB/5lYHSHUeK5tInMKj/8PnPlCM0dHO7OqAIZH3GIIhq2Q6yboHfa6gWeCkzpw2bMNNWLXkSHMSvdleHhGrgnb49IK1hLtIufwPv5VOwHCTof2tognwQ8uepni+KEnB1DIkOuum9WWVKq/hEQpFwaw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762679546; c=relaxed/simple;
	bh=pMg3b1WU84Zaoo8p7FE0P2BzDgKCquxnKGbMieqXRZs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SCViEfEq2VGWCQpn8vuIJs8d+JqxWT/ic9WOBElHRKjhSWkFWrke9MI3jYoJo2Q9APmakmFMDpFOk3HsIsNWTP5oKu8V9OOmYSw4lDY282IEBj48ymk0/BCtkIO4xwfWxTzXjXcSVYv+l506atlT8SGmF6utXljfe+E9GLaoej8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=x5t/lZo1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TBTrKx4T; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=x5t/lZo1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TBTrKx4T; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="x5t/lZo1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TBTrKx4T";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="x5t/lZo1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TBTrKx4T"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BFF8F1F7FD;
	Sun,  9 Nov 2025 09:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1762679536; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=hfe+s7HAoH7zIs4scwr9YXtHLT/GQUxzxYMNivemx0E=;
	b=x5t/lZo1NkF4FCZZBtd4/FrXo3Uvl3CSvcILzLa0DfSLMn2QvrZso3JGVk52/4ADFNqse7
	4cEY2VNWzRSTctSc/Rcuuipy56nubung4A+P2ItttE/ADp0mMrizYBlCwJe/837swGvHW6
	iUbbdIhZR0RsB6D/OdNHyJQ/D8ymVjA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1762679536;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=hfe+s7HAoH7zIs4scwr9YXtHLT/GQUxzxYMNivemx0E=;
	b=TBTrKx4T8Xhzrpc2gEqV5K0xF7EEUvW+maFXMn9rRMMwGJeR9bMSKLmCrVJk6lOmIy3mIp
	wOlszrl8q+C2myBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1762679536; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=hfe+s7HAoH7zIs4scwr9YXtHLT/GQUxzxYMNivemx0E=;
	b=x5t/lZo1NkF4FCZZBtd4/FrXo3Uvl3CSvcILzLa0DfSLMn2QvrZso3JGVk52/4ADFNqse7
	4cEY2VNWzRSTctSc/Rcuuipy56nubung4A+P2ItttE/ADp0mMrizYBlCwJe/837swGvHW6
	iUbbdIhZR0RsB6D/OdNHyJQ/D8ymVjA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1762679536;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=hfe+s7HAoH7zIs4scwr9YXtHLT/GQUxzxYMNivemx0E=;
	b=TBTrKx4T8Xhzrpc2gEqV5K0xF7EEUvW+maFXMn9rRMMwGJeR9bMSKLmCrVJk6lOmIy3mIp
	wOlszrl8q+C2myBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9FBA413E53;
	Sun,  9 Nov 2025 09:12:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id beHAJfBaEGnfQQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 09 Nov 2025 09:12:16 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Lizhi Xu <lizhi.xu@windriver.com>
Subject: [PATCH] ALSA: usb-audio: Fix potential overflow of PCM transfer buffer
Date: Sun,  9 Nov 2025 10:12:07 +0100
Message-ID: <20251109091211.12739-1-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
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
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80

The PCM stream data in USB-audio driver is transferred over USB URB
packet buffers, and each packet size is determined dynamically.  The
packet sizes are limited by some factors such as wMaxPacketSize USB
descriptor.  OTOH, in the current code, the actually used packet sizes
are determined only by the rate and the PPS, which may be bigger than
the size limit above.  This results in a buffer overflow, as reported
by syzbot.

Basically when the limit is smaller than the calculated packet size,
it implies that something is wrong, most likely a weird USB
descriptor.  So the best option would be just to return an error at
the parameter setup time before doing any further operations.

This patch introduces such a sanity check, and returns -EINVAL when
the packet size is greater than maxpacksize.  The comparison with
ep->packsize[1] alone should suffice since it's always equal or
greater than ep->packsize[0].

Reported-by: syzbot+bfd77469c8966de076f7@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=bfd77469c8966de076f7
Link: https://lore.kernel.org/690b6b46.050a0220.3d0d33.0054.GAE@google.com
Cc: Lizhi Xu <lizhi.xu@windriver.com>
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/endpoint.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index 880f5afcce60..cc15624ecaff 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -1362,6 +1362,11 @@ int snd_usb_endpoint_set_params(struct snd_usb_audio *chip,
 	ep->sample_rem = ep->cur_rate % ep->pps;
 	ep->packsize[0] = ep->cur_rate / ep->pps;
 	ep->packsize[1] = (ep->cur_rate + (ep->pps - 1)) / ep->pps;
+	if (ep->packsize[1] > ep->maxpacksize) {
+		usb_audio_dbg(chip, "Too small maxpacksize %u for rate %u / pps %u\n",
+			      ep->maxpacksize, ep->cur_rate, ep->pps);
+		return -EINVAL;
+	}
 
 	/* calculate the frequency in 16.16 format */
 	ep->freqm = ep->freqn;
-- 
2.50.1

