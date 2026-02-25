Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93EE5324712
	for <linux-sound@vger.kernel.org>; Wed, 25 Feb 2026 08:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772009563; cv=none; b=NL2VZiz2aiyiPPoK1GmgEeU+8BXXmOU4i2EmgYsCDy8uklK0/nCEB1qasa7ppanZYa0n9POetJa3SFD7Ts6W28GLQwdCKWMOPh5sS4mibGLvhaEPmuJP+FgqfuJ6MSsjLFoVJV/VnItXkepqQdZCxwSXuR8AQ6fpmkFXeLTtuyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772009563; c=relaxed/simple;
	bh=KyMe15IQPgefq40gh/1DE8uUd0rW1ZVlngRY2WksZzk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dxzTCPplQ3t7xNwLHoGMOQmKp5KH1UAzlvkvqYbEaYTTwP8+nz2MwqcPFBRFRQ8yhRNcGSmsrogcFY0+MGb7wsLmlWxaMkQtxHMCVlE8RjZcR1Lx/xgidnxI1rVlQygidkcLJSo0kGGkJmxDvbsOi7lDROcsGQsd4Zv2fB3gVS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zueuwr8E; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YsMa5rn7; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zueuwr8E; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YsMa5rn7; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zueuwr8E";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YsMa5rn7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zueuwr8E";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YsMa5rn7"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9E5A85BD61;
	Wed, 25 Feb 2026 08:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772009555; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=buh9PiYDEhTYnuu9cXXgKrntZm0Yt330mjt3JiIDswo=;
	b=zueuwr8E9Kg22DHubejEGScG1XTWau9d7nCMCVrXsFRwysG7zkVgrBwliZ9/JrlWh7fZai
	BFVDo1BLCOSOaU8/rm22e8+GlW2lu0Ppuydg6Jfsf1+f0jKxfv/7G6DmqHk8Sben7lKd8n
	VGmtyksV0XTw8xikdXW7XkDLPNz+AR8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772009555;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=buh9PiYDEhTYnuu9cXXgKrntZm0Yt330mjt3JiIDswo=;
	b=YsMa5rn7w0E6QAcSEQ1fmHNpwipLix0JW6benQjQKHo2vM1cR8SfUlA7jlcFcoN0tC6pHq
	zdYavE9VkIddv/BA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=zueuwr8E;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=YsMa5rn7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772009555; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=buh9PiYDEhTYnuu9cXXgKrntZm0Yt330mjt3JiIDswo=;
	b=zueuwr8E9Kg22DHubejEGScG1XTWau9d7nCMCVrXsFRwysG7zkVgrBwliZ9/JrlWh7fZai
	BFVDo1BLCOSOaU8/rm22e8+GlW2lu0Ppuydg6Jfsf1+f0jKxfv/7G6DmqHk8Sben7lKd8n
	VGmtyksV0XTw8xikdXW7XkDLPNz+AR8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772009555;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=buh9PiYDEhTYnuu9cXXgKrntZm0Yt330mjt3JiIDswo=;
	b=YsMa5rn7w0E6QAcSEQ1fmHNpwipLix0JW6benQjQKHo2vM1cR8SfUlA7jlcFcoN0tC6pHq
	zdYavE9VkIddv/BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 783583EA65;
	Wed, 25 Feb 2026 08:52:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8HLlG1O4nmlTcgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 25 Feb 2026 08:52:35 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 3/4] ALSA: usb-audio: Avoid implicit feedback mode on DIYINHK USB Audio 2.0
Date: Wed, 25 Feb 2026 09:52:30 +0100
Message-ID: <20260225085233.316306-4-tiwai@suse.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260225085233.316306-1-tiwai@suse.de>
References: <20260225085233.316306-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Queue-Id: 9E5A85BD61
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 

Although DIYINHK USB Audio 2.0 (ID 20b1:2009) shows the implicit
feedback source for the capture stream, this would cause several
problems for the playback.  Namely, the device can get wMaxPackSize
1024 for 24/32 bit format with 6 channels, and when a high sample rate
like 352.8kHz or 384kHz is played, the packet size overflows the max
limit.  Also, the device has another two playback altsets, and those
aren't properly handled with the implicit feedback.

Since the device has been working well even before introducing the
implicit feedback, we can assume that it works fine in the async mode.
This patch adds the explicit skip of the implicit fb detection to make
the playback running in the async mode.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=221076
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/quirks.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index fbceed8e8d36..c6a78efbcaa3 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2365,6 +2365,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_SHARE_MEDIA_DEVICE | QUIRK_FLAG_ALIGN_TRANSFER),
 	DEVICE_FLG(0x2040, 0x7281, /* Hauppauge HVR-950Q-MXL */
 		   QUIRK_FLAG_SHARE_MEDIA_DEVICE | QUIRK_FLAG_ALIGN_TRANSFER),
+	DEVICE_FLG(0x20b1, 0x2009, /* XMOS Ltd DIYINHK USB Audio 2.0 */
+		   QUIRK_FLAG_SKIP_IMPLICIT_FB | QUIRK_FLAG_DSD_RAW),
 	DEVICE_FLG(0x2040, 0x8200, /* Hauppauge Woodbury */
 		   QUIRK_FLAG_SHARE_MEDIA_DEVICE | QUIRK_FLAG_ALIGN_TRANSFER),
 	DEVICE_FLG(0x21b4, 0x0081, /* AudioQuest DragonFly */
-- 
2.53.0

