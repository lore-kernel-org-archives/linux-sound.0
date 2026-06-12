Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875123DBD48
	for <linux-sound@vger.kernel.org>; Fri, 12 Jun 2026 11:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781264041; cv=none; b=q8rr4yg2UaLxjABarNbNqGnAe6GeTa+8GzOjCmg+ANg25zfw10i3eIGZcTvgBUJLu1bkXY+nkS3+66H3XrI2W56+RvO3nyFFa4VYU9XGoSjUFvpSJt/S+9LUhrd6Gat84MLZYuEhnU1/9dTa0pQX/UiRoHPIpXGzKK/LDdyCUnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781264041; c=relaxed/simple;
	bh=Xqs5MyTbKz7nAdnLV85iK3m/83NTw6FijDwcxAwL51k=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=iJ0dmT7UYOHEvcYwFkcsu/PDYz0QJ2r5PoNC7SMRwMkgAIbyW2DGRufpz3OvAoJaZ3hz+U0+9aWYQirraBAOvLMq04TAuHMsAJpfZIYrfuaLRzpQiApYXpCFPvEBt6xbqOdL7WtJFyr2ifhueA9xr4VFgH0tGcotHlpoVlK1sg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zOTAgJbA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=aPkHAUvF; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zOTAgJbA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=aPkHAUvF; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zOTAgJbA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="aPkHAUvF";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zOTAgJbA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="aPkHAUvF"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8987C6C56A;
	Fri, 12 Jun 2026 11:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781264034; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=EVU+Pl7p1p8VFjoUOAtp0sXmWdmcnxc1PctFWAizgaA=;
	b=zOTAgJbARSs9oH3cJQiGomcp469XLnR0SK5Jgl7GkS4chbmSmEeRgkLvuZY8I4STNUvXCm
	TV5HqbhQFXqhmAKPNkTJoi7YyatppIX1kuOuV+6gVgIOHIKgXhni5biG7fHOxyByYco+uC
	b8UMzWmNeY4g9U+bD+9w711YsiBvnbU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781264034;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=EVU+Pl7p1p8VFjoUOAtp0sXmWdmcnxc1PctFWAizgaA=;
	b=aPkHAUvFyGF0QPQ/auPrZGTqlSiVHUyJGGE8cj4Dyv5E/ANvjV4fwEOwSRAkfJ5w/N4wyK
	6GJOs4wFPqOr9uBw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=zOTAgJbA;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=aPkHAUvF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781264034; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=EVU+Pl7p1p8VFjoUOAtp0sXmWdmcnxc1PctFWAizgaA=;
	b=zOTAgJbARSs9oH3cJQiGomcp469XLnR0SK5Jgl7GkS4chbmSmEeRgkLvuZY8I4STNUvXCm
	TV5HqbhQFXqhmAKPNkTJoi7YyatppIX1kuOuV+6gVgIOHIKgXhni5biG7fHOxyByYco+uC
	b8UMzWmNeY4g9U+bD+9w711YsiBvnbU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781264034;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=EVU+Pl7p1p8VFjoUOAtp0sXmWdmcnxc1PctFWAizgaA=;
	b=aPkHAUvFyGF0QPQ/auPrZGTqlSiVHUyJGGE8cj4Dyv5E/ANvjV4fwEOwSRAkfJ5w/N4wyK
	6GJOs4wFPqOr9uBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6D3AC779A7;
	Fri, 12 Jun 2026 11:33:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 5YVOGaLuK2r+eQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 12 Jun 2026 11:33:54 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: seq: Don't re-bounce the error event
Date: Fri, 12 Jun 2026 13:33:45 +0200
Message-ID: <20260612113350.407465-1-tiwai@suse.de>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Rspamd-Action: no action
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
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 8987C6C56A
X-Spam-Score: -3.01

The error bouncing may fail again, and we have no check for
re-bouncing.  For avoiding the loop, add the event type check at
bouncing, and stop re-bouncing if it's already a bounce error.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_clientmgr.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/core/seq/seq_clientmgr.c b/sound/core/seq/seq_clientmgr.c
index 0ac6d92058d9..28782e1776fa 100644
--- a/sound/core/seq/seq_clientmgr.c
+++ b/sound/core/seq/seq_clientmgr.c
@@ -536,6 +536,10 @@ static int bounce_error_event(struct snd_seq_client *client,
 	    ! client->accept_input)
 		return 0; /* ignored */
 
+	if (event->type == SNDRV_SEQ_EVENT_BOUNCE ||
+	    event->type == SNDRV_SEQ_EVENT_KERNEL_ERROR)
+		return err; /* avoid re-bouncing */
+
 	/* set up quoted error */
 	memset(&bounce_ev, 0, sizeof(bounce_ev));
 
-- 
2.54.0

