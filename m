Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08872309F1D
	for <linux-sound@vger.kernel.org>; Mon, 19 Jan 2026 13:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768829538; cv=none; b=oQW3ckPHfzGXP/ufoqAgCYi0otBLXYI08JK2bR/dpR79pSnzilOVLF8nwyAJwAQkkH6PuUaqr5nEdLXLGsNHruMRggMOxiE1Mg0QzeOSgpWpva87PqvD64pegwNVG6V+c8rZi55SzaWFRl+HhXgjcJHhpp0G3RoloWgkw6dmF3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768829538; c=relaxed/simple;
	bh=z763+P9XMm/cmt/VYmFWpS459WKQJrE+G/3U1ndOZ8M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aUgWiYIfG+2ceF5oJsqnFSYgD8rrFlYwr8A1svPxaohV2y38vLTAbMKu9Pv5GwI6M0r3UL9BrdbzveU8GWKbBw2dVsMo4s7LW7HCY1LLGztmlWf9L+6guCz1xl1MY5JDMpYzuM+RrYAPyCxt6M6O2CoNwzDbIIetb8Hg3DdsBlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dFa8AhCm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SSD0vav3; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dFa8AhCm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SSD0vav3; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dFa8AhCm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SSD0vav3";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dFa8AhCm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SSD0vav3"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3F8F65BDB1;
	Mon, 19 Jan 2026 13:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1768829535; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=S/9oGHnAZyy9nIExvFop6U0yR6/Q2DZi3OzALmSH31Y=;
	b=dFa8AhCmD4W6YasLsUChQuiGLgSD/LFUAN+l++mDxctthxAR+g84gGTWSwMDXnqCQo/l9Y
	WIqOxOf1xLVnyVYijvJ3kU0rk9Na/J0nmqdOiYYb3BfkjtJhnYZlQZvEu6EUaSS+AbmuHL
	Q38TgeGvCXou3L4H0Ozc3Qe9NBRYZu4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1768829535;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=S/9oGHnAZyy9nIExvFop6U0yR6/Q2DZi3OzALmSH31Y=;
	b=SSD0vav3tCDEjhbC0o3ayWeB/uSzNvkiPFOEDZq7Din72kXcKi/oF8lnJzotO116/1OKcE
	YY+tTpxfBdDTLlCw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1768829535; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=S/9oGHnAZyy9nIExvFop6U0yR6/Q2DZi3OzALmSH31Y=;
	b=dFa8AhCmD4W6YasLsUChQuiGLgSD/LFUAN+l++mDxctthxAR+g84gGTWSwMDXnqCQo/l9Y
	WIqOxOf1xLVnyVYijvJ3kU0rk9Na/J0nmqdOiYYb3BfkjtJhnYZlQZvEu6EUaSS+AbmuHL
	Q38TgeGvCXou3L4H0Ozc3Qe9NBRYZu4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1768829535;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=S/9oGHnAZyy9nIExvFop6U0yR6/Q2DZi3OzALmSH31Y=;
	b=SSD0vav3tCDEjhbC0o3ayWeB/uSzNvkiPFOEDZq7Din72kXcKi/oF8lnJzotO116/1OKcE
	YY+tTpxfBdDTLlCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1D9F63EA63;
	Mon, 19 Jan 2026 13:32:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 1vOwBV8ybml/RgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 19 Jan 2026 13:32:15 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Salvatore Bonaccorso <carnil@debian.org>,
	Karsten Hohmeier <linux@hohmatik.de>
Subject: [PATCH] ALSA: ctxfi: Fix potential OOB access in audio mixer handling
Date: Mon, 19 Jan 2026 14:32:07 +0100
Message-ID: <20260119133212.189129-1-tiwai@suse.de>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo,hohmatik.de:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO

In the audio mixer handling code of ctxfi driver, the conf field is
used as a kind of loop index, and it's referred in the index callbacks
(amixer_index() and sum_index()).

As spotted recently by fuzzers, the current code causes OOB access at
those functions.
| UBSAN: array-index-out-of-bounds in /build/reproducible-path/linux-6.17.8/sound/pci/ctxfi/ctamixer.c:347:48
| index 8 is out of range for type 'unsigned char [8]'

After the analysis, the cause was found to be the lack of the proper
(re-)initialization of conj field.

This patch addresses those OOB accesses by adding the proper
initializations of the loop indices.

Reported-by: Salvatore Bonaccorso <carnil@debian.org>
Tested-by: Karsten Hohmeier <linux@hohmatik.de>
Closes: https://bugs.debian.org/1121535
Cc: <stable@vger.kernel.org>
Link: https://lore.kernel.org/all/aSk8KJI35H7gFru6@eldamar.lan/
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/ctxfi/ctamixer.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/pci/ctxfi/ctamixer.c b/sound/pci/ctxfi/ctamixer.c
index bb4658592636..c30162be27ee 100644
--- a/sound/pci/ctxfi/ctamixer.c
+++ b/sound/pci/ctxfi/ctamixer.c
@@ -205,6 +205,7 @@ static int amixer_rsc_init(struct amixer *amixer,
 
 	/* Set amixer specific operations */
 	amixer->rsc.ops = &amixer_basic_rsc_ops;
+	amixer->rsc.conj = 0;
 	amixer->ops = &amixer_ops;
 	amixer->input = NULL;
 	amixer->sum = NULL;
@@ -367,6 +368,7 @@ static int sum_rsc_init(struct sum *sum,
 		return err;
 
 	sum->rsc.ops = &sum_basic_rsc_ops;
+	sum->rsc.conj = 0;
 
 	return 0;
 }
-- 
2.52.0

