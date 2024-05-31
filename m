Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F3A158A3B
	for <linux-sound@vger.kernel.org>; Fri, 31 May 2024 12:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717159020; cv=none; b=FqyYom1hcFyjMyp0wXqnHLN8GtXVqdp/pPTr9eeTLW1NCA4i5jrqokvYE72JYl/5toLLDlSD499AD1tEB5ZdTvjzup0+YWQ0QSFeIuuNE256rnxT3qbBXBcHlOihu9zu1rSXhB3xnMgYp0UKC4pX3ue5Vy5J5sVhhFx90ujF0eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717159020; c=relaxed/simple;
	bh=zrh1EiXely6OILjRan3woojwR8sOVSqb3WENwO0TtCo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=Dn4urt+5PDRq89k4jhqX4UkMCmM4PYaP41byNyymvKooCH79njYGQxFBOjbeKfZb7I3dn8eshyrYomGfioxcej2WLEgt5tBUgHMuezW3dHNDYlpzL8fg7PnIjBMLVTWsomGEV/LjEYA0gU1HvTLJ1xPfStTOlWtg7zESh+kXEG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SiY4FGV1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=aqI++Puk; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SiY4FGV1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=aqI++Puk; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SiY4FGV1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="aqI++Puk";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SiY4FGV1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="aqI++Puk"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7E3EC21BC4;
	Fri, 31 May 2024 12:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1717159016; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=8M18N0DXsz+mVlFsvpXaMDFHm7V8UyVGu1rR/Y0k9p0=;
	b=SiY4FGV1TXVZRuiEc4fjWdSq6McvXkfdabdf+VccKolTPVYnP2s0IbA0txwiG3VRPPBKLL
	bJ2g5IjerhTrtSuLCsv2ZS+6+rJLXtKd12pQ4dxvrKVrJybypcUvK33y5/g7vLd6LO1b0I
	OvZF0AlJPsZWaa+YyLVITIn1OETsWCU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1717159016;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=8M18N0DXsz+mVlFsvpXaMDFHm7V8UyVGu1rR/Y0k9p0=;
	b=aqI++Puk+5tY4M9Gp7YJzBmkaMZA9nJNp0B8jOVmNoFA12Sv1+iv3wWGxxWKdFauRrhJvL
	FFtPOJx56Yh9WPDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1717159016; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=8M18N0DXsz+mVlFsvpXaMDFHm7V8UyVGu1rR/Y0k9p0=;
	b=SiY4FGV1TXVZRuiEc4fjWdSq6McvXkfdabdf+VccKolTPVYnP2s0IbA0txwiG3VRPPBKLL
	bJ2g5IjerhTrtSuLCsv2ZS+6+rJLXtKd12pQ4dxvrKVrJybypcUvK33y5/g7vLd6LO1b0I
	OvZF0AlJPsZWaa+YyLVITIn1OETsWCU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1717159016;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=8M18N0DXsz+mVlFsvpXaMDFHm7V8UyVGu1rR/Y0k9p0=;
	b=aqI++Puk+5tY4M9Gp7YJzBmkaMZA9nJNp0B8jOVmNoFA12Sv1+iv3wWGxxWKdFauRrhJvL
	FFtPOJx56Yh9WPDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 64766137C3;
	Fri, 31 May 2024 12:36:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 35hAF2jEWWZLVQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 31 May 2024 12:36:56 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: seq: ump: Fix missing System Reset message handling
Date: Fri, 31 May 2024 14:37:17 +0200
Message-ID: <20240531123718.13420-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]

The conversion from System Reset event to UMP was missing.
Add the entry for a conversion to a proper UMP System message.

Fixes: e9e02819a98a ("ALSA: seq: Automatic conversion of UMP events")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_ump_convert.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/core/seq/seq_ump_convert.c b/sound/core/seq/seq_ump_convert.c
index 171fb75267af..d81f776a4c3d 100644
--- a/sound/core/seq/seq_ump_convert.c
+++ b/sound/core/seq/seq_ump_convert.c
@@ -1075,6 +1075,8 @@ static const struct seq_ev_to_ump seq_ev_ump_encoders[] = {
 	  system_ev_to_ump_midi1, system_ev_to_ump_midi2 },
 	{ SNDRV_SEQ_EVENT_SENSING, UMP_SYSTEM_STATUS_ACTIVE_SENSING,
 	  system_ev_to_ump_midi1, system_ev_to_ump_midi2 },
+	{ SNDRV_SEQ_EVENT_RESET, UMP_SYSTEM_STATUS_RESET,
+	  system_ev_to_ump_midi1, system_ev_to_ump_midi2 },
 };
 
 static const struct seq_ev_to_ump *find_ump_encoder(int type)
-- 
2.43.0

