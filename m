Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2F31CCB2B
	for <linux-sound@vger.kernel.org>; Wed,  7 Aug 2024 09:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723022550; cv=none; b=cuUvVkgPZxWGYOnti2CvxkiAZrWJPWgLL/iViZMrowLnMUQ+w3xgo8O4O1uZ5++zBixZ/PWbmCXDN+++mALn/bscbwj8wj7u2eI3QEDNub0bKwpIEoDkEzHGceWl6GWzvT4uFoyMd2QoFQH4rcmw/270bO6yTBfrqRuVMFNQZ2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723022550; c=relaxed/simple;
	bh=vkwYBpyFJfjE1aeDnKoRNpZ2xAOc8lmaBfjtdJPnCRQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RjwxhGDzefaiUDaSJ3WgpI3Yt3Bl12qYkRnjEEuh9IrULd1E+lPKLXXd6oGojYiERh2Te6k7aultDWMXLrHvUudTmfZp/cecF61pBNLQuiD+x8vYgGgVIW5yB3i4Zm4EnS0zGt8k36Pm5uDbS5E5a6RDXQU4evr6OuhBPHFJVJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=F0GhOyrS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7cxrSDhD; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=F0GhOyrS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7cxrSDhD; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="F0GhOyrS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7cxrSDhD";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="F0GhOyrS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7cxrSDhD"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1C5BF21B52;
	Wed,  7 Aug 2024 09:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723022547; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CQjFVibdn4UHFTZLNk/7vHTCh1a1SfI0ep8aHUOnslo=;
	b=F0GhOyrSQmCQMT0xhGHL7NwuYNLPjxLQ2HwrarCiquL1jmSb9xGAUtcR0TSf/cpx3vDYNh
	dE2aBGIZ1OKzqVyNaFXx0VhBXsssHJaYHv+I9G/NbjxuCbi4IXudAQwHOJ8ygjiiEn4NF1
	zX2xNCHDjBnbM5SyOfkTHTVLDLMXBe4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723022547;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CQjFVibdn4UHFTZLNk/7vHTCh1a1SfI0ep8aHUOnslo=;
	b=7cxrSDhDC5hzwBMdWlITkqIaLfekIv31C4XkXXgh5hAHx9jB3dXPLJmQOuCAgRwKZ3PCB3
	aa3Tio0HePflZbBQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=F0GhOyrS;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=7cxrSDhD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723022547; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CQjFVibdn4UHFTZLNk/7vHTCh1a1SfI0ep8aHUOnslo=;
	b=F0GhOyrSQmCQMT0xhGHL7NwuYNLPjxLQ2HwrarCiquL1jmSb9xGAUtcR0TSf/cpx3vDYNh
	dE2aBGIZ1OKzqVyNaFXx0VhBXsssHJaYHv+I9G/NbjxuCbi4IXudAQwHOJ8ygjiiEn4NF1
	zX2xNCHDjBnbM5SyOfkTHTVLDLMXBe4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723022547;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CQjFVibdn4UHFTZLNk/7vHTCh1a1SfI0ep8aHUOnslo=;
	b=7cxrSDhDC5hzwBMdWlITkqIaLfekIv31C4XkXXgh5hAHx9jB3dXPLJmQOuCAgRwKZ3PCB3
	aa3Tio0HePflZbBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F36E713B05;
	Wed,  7 Aug 2024 09:22:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IPk9OtI8s2ZxCgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Aug 2024 09:22:26 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 2/6] ALSA: usb-audio: Accept multiple protocols in GTBs
Date: Wed,  7 Aug 2024 11:22:57 +0200
Message-ID: <20240807092303.1935-3-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240807092303.1935-1-tiwai@suse.de>
References: <20240807092303.1935-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 1C5BF21B52
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
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
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
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

It's valid to give different protocols via multiple GTBs; e.g. a MIDI
1.0 port is embedded in a MIDI 2.0 device that talks with MIDI 2.0
protocol.  However, the current driver implementation assumes only a
single protocol over the whole Endpoint, and it can't handle such a
scenario.

This patch changes the driver's behavior to parse GTBs to accept
multiple protocols.  Instead of switching to the last given protocol,
it adds the protocol capability bits now.  Meanwhile, the default
protocol is chosen by the first given protocol in GTBs.

Practically seen, this should be a minor issue, as new devices should
specify the protocols properly via UMP Endpoint Info messages, so this
is rather just covering a corner case.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/midi2.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/sound/usb/midi2.c b/sound/usb/midi2.c
index 820d3e4b672a..fa655aa4a56f 100644
--- a/sound/usb/midi2.c
+++ b/sound/usb/midi2.c
@@ -607,12 +607,8 @@ static int parse_group_terminal_block(struct snd_usb_midi2_ump *rmidi,
 		return 0;
 	}
 
-	if (ump->info.protocol && ump->info.protocol != protocol)
-		usb_audio_info(rmidi->umidi->chip,
-			       "Overriding preferred MIDI protocol in GTB %d: %x -> %x\n",
-			       rmidi->usb_block_id, ump->info.protocol,
-			       protocol);
-	ump->info.protocol = protocol;
+	if (!ump->info.protocol)
+		ump->info.protocol = protocol;
 
 	protocol_caps = protocol;
 	switch (desc->bMIDIProtocol) {
@@ -624,13 +620,7 @@ static int parse_group_terminal_block(struct snd_usb_midi2_ump *rmidi,
 		break;
 	}
 
-	if (ump->info.protocol_caps && ump->info.protocol_caps != protocol_caps)
-		usb_audio_info(rmidi->umidi->chip,
-			       "Overriding MIDI protocol caps in GTB %d: %x -> %x\n",
-			       rmidi->usb_block_id, ump->info.protocol_caps,
-			       protocol_caps);
-	ump->info.protocol_caps = protocol_caps;
-
+	ump->info.protocol_caps |= protocol_caps;
 	return 0;
 }
 
-- 
2.43.0

