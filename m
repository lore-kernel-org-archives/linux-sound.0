Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58DF71F1928
	for <linux-sound@vger.kernel.org>; Tue,  7 Jan 2025 15:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736265420; cv=none; b=T4x82YEfDwYJLnEfI6y6G8X+FWxi964vY/e749bUgoZoqGgTsDA/UIwVHLOTHn+LH7/MJuhpPhv/jZZj4IN96+oLzP7GmfRbSogA7sT+eC9eWYdn8cPqVdoFJrpkT8w8x12rskPkdc/4PPjoTzOSyQ/c9RMZhS4tBHqsN/dkfuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736265420; c=relaxed/simple;
	bh=jtr5x5mHQBUnE1YPyLTFXDzvPeBUKSE8DCCtIAlIU0s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bPb8Pf3slp7ZcpISD4KbNczI8XEp8WH5+8cqm+61DPmLg7Har7vuyxJ8yW8CU9SpdFWJmhQEBve1nArLyM3IVLwgNOZL/LyNFGRwRYwX0zuFvCL8gbL7UDl3Zd44XGLpwyyc1x1llp2jpmVBgUzYV+HS6kNbsR1ifB+/KB3Sw9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fDUp+vxE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=DvzbXLy6; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fDUp+vxE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=DvzbXLy6; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fDUp+vxE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DvzbXLy6";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fDUp+vxE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DvzbXLy6"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 77A112115A;
	Tue,  7 Jan 2025 15:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736265415; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dg4/RrX4UFo/8m+8Uci8EOr9RT5Rc5Hm8aFblJGGfMk=;
	b=fDUp+vxE6wJ+k2KFSBmFK5zVXpBuTYl41oc+ZVPVSMna71QD5q6hV7X4Az27lOLt06jB0D
	yezvo3789WpCMYlyd5vb1FzFDXUsNQemz4dBDqHTKdIos/lGGrc9C2LiM8vtlMzABN2Q53
	VesF8ooh94JsIS4ES6dEZRz8xPyVgt8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736265415;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dg4/RrX4UFo/8m+8Uci8EOr9RT5Rc5Hm8aFblJGGfMk=;
	b=DvzbXLy6NqELfxoEPsJHAkt3RqOPNp4fATm9tnaPRNgllLdN7cVzLNgXN/2OXcGc7TwqIh
	ObwTJ08k9mArsyDw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=fDUp+vxE;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=DvzbXLy6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736265415; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dg4/RrX4UFo/8m+8Uci8EOr9RT5Rc5Hm8aFblJGGfMk=;
	b=fDUp+vxE6wJ+k2KFSBmFK5zVXpBuTYl41oc+ZVPVSMna71QD5q6hV7X4Az27lOLt06jB0D
	yezvo3789WpCMYlyd5vb1FzFDXUsNQemz4dBDqHTKdIos/lGGrc9C2LiM8vtlMzABN2Q53
	VesF8ooh94JsIS4ES6dEZRz8xPyVgt8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736265415;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dg4/RrX4UFo/8m+8Uci8EOr9RT5Rc5Hm8aFblJGGfMk=;
	b=DvzbXLy6NqELfxoEPsJHAkt3RqOPNp4fATm9tnaPRNgllLdN7cVzLNgXN/2OXcGc7TwqIh
	ObwTJ08k9mArsyDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 56DDE13A9E;
	Tue,  7 Jan 2025 15:56:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id oHvzE8dOfWfNUwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 07 Jan 2025 15:56:55 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Subject: [PATCH 5/7] ALSA: firewire: Simplify with str_on_off()
Date: Tue,  7 Jan 2025 16:56:35 +0100
Message-ID: <20250107155641.4435-6-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250107155641.4435-1-tiwai@suse.de>
References: <20250107155641.4435-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 77A112115A
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
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_TWO(0.00)[2];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

Use the standard helper str_on_off() to simplify the code.
Only code refactoring, no behavior change.

Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/firewire/fireface/ff-protocol-former.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/firewire/fireface/ff-protocol-former.c b/sound/firewire/fireface/ff-protocol-former.c
index efd59e9d9935..0907d0a2296f 100644
--- a/sound/firewire/fireface/ff-protocol-former.c
+++ b/sound/firewire/fireface/ff-protocol-former.c
@@ -135,13 +135,13 @@ static void dump_clock_config(struct snd_ff *ff, struct snd_info_buffer *buffer)
 
 	snd_iprintf(buffer, "Output S/PDIF format: %s (Emphasis: %s)\n",
 		    (data & 0x00000020) ? "Professional" : "Consumer",
-		    (data & 0x00000040) ? "on" : "off");
+		    str_on_off(data & 0x00000040));
 
 	snd_iprintf(buffer, "Optical output interface format: %s\n",
 		    (data & 0x00000100) ? "S/PDIF" : "ADAT");
 
 	snd_iprintf(buffer, "Word output single speed: %s\n",
-		    (data & 0x00002000) ? "on" : "off");
+		    str_on_off(data & 0x00002000));
 
 	snd_iprintf(buffer, "S/PDIF input interface: %s\n",
 		    (data & 0x00000200) ? "Optical" : "Coaxial");
-- 
2.43.0

