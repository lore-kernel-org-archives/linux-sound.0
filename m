Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D55474BEC
	for <linux-sound@vger.kernel.org>; Fri, 19 Apr 2024 10:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713521462; cv=none; b=JI7wKBCNmN3t45WtYVvOw0eDIZ1d51asIOjGc34ElzjCXtuaONtiKmK2K09EJXJx/X8bk3ZR+sD3Y9JkJ9RyIBoPJFOgHZVzYcGFL/zKseCYHHHh837EFFGTTYy+E9XJs4TjJF7C5N2sqk70HOlsoFfGwIC38wzFA65V0ATXPoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713521462; c=relaxed/simple;
	bh=8orKvmnFE9AvjkEOhY/rxyBPWVFVjJv+kE17XJVqzJg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=N5c1qw1Vx1Nle/eGWWwrq2Tip2aC+JKC7qw9JQm2LuF4pb3AdSPPpq3mDtGp3hM45T2+Uyz3GlHzCZSzyIR7kDGBPD/GBh9JiBtyCi88f8w5HaEOdi7HRMxSBof7SPixaXVtSSnxPwZ6rOuiDjuDVpQHcphUEJ+5ZTToqiE5f9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mg/G4cyC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=OnHriLeH; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mg/G4cyC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=OnHriLeH; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mg/G4cyC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OnHriLeH";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mg/G4cyC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OnHriLeH"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 54EC637629;
	Fri, 19 Apr 2024 10:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1713521458; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=8Ugv1cWWk2SzlCfopgk0yrB2Cnnrb4Ymi2IL7h/UUp4=;
	b=mg/G4cyCN5yuPPTsswMATGvGYwMuZyok/RtJjfcQlJhncVGmp90wJZBCRIlH7dDwOEJxm3
	QGZM4CFQO1pQ4tW5zobXjIKTF94Xy+ssXI7ZgHSGYofwCiMqdSGv/BG0fOXUbLcT0O4yXg
	FUs72B3MvID5KO5rKiPmkibIywGJ3JU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1713521458;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=8Ugv1cWWk2SzlCfopgk0yrB2Cnnrb4Ymi2IL7h/UUp4=;
	b=OnHriLeHabvkucudmX7ZO9Uk1TdwypIIlnit06tvt5CLoYpfw5IWRgHcTg070jhG7XvH0M
	sY8OZzTwC75qmOAg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="mg/G4cyC";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=OnHriLeH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1713521458; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=8Ugv1cWWk2SzlCfopgk0yrB2Cnnrb4Ymi2IL7h/UUp4=;
	b=mg/G4cyCN5yuPPTsswMATGvGYwMuZyok/RtJjfcQlJhncVGmp90wJZBCRIlH7dDwOEJxm3
	QGZM4CFQO1pQ4tW5zobXjIKTF94Xy+ssXI7ZgHSGYofwCiMqdSGv/BG0fOXUbLcT0O4yXg
	FUs72B3MvID5KO5rKiPmkibIywGJ3JU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1713521458;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=8Ugv1cWWk2SzlCfopgk0yrB2Cnnrb4Ymi2IL7h/UUp4=;
	b=OnHriLeHabvkucudmX7ZO9Uk1TdwypIIlnit06tvt5CLoYpfw5IWRgHcTg070jhG7XvH0M
	sY8OZzTwC75qmOAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 35325136CF;
	Fri, 19 Apr 2024 10:10:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SijDCzJDImYoEAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 19 Apr 2024 10:10:58 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: seq: dummy: Allow UMP conversion
Date: Fri, 19 Apr 2024 12:11:02 +0200
Message-ID: <20240419101105.15571-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Spamd-Result: default: False [-0.45 / 50.00];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	BAYES_HAM(-0.44)[78.61%];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_NONE(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Queue-Id: 54EC637629
X-Spam-Flag: NO
X-Spam-Score: -0.45
X-Spamd-Bar: /

Although the purpose of dummy seq client is a direct pass-through,
it's sometimes helpful for debugging if it can convert to a certain
UMP MIDI version.  This patch adds an option to specify the UMP event
conversion.  As default, it skips the conversion and does
passthrough, while user can pass ump=1 or ump=2 to enforce the
conversion to UMP MIDI1 or MIDI2 format.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_dummy.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/sound/core/seq/seq_dummy.c b/sound/core/seq/seq_dummy.c
index 9308194b2d9a..783fc72c2ef6 100644
--- a/sound/core/seq/seq_dummy.c
+++ b/sound/core/seq/seq_dummy.c
@@ -58,6 +58,12 @@ MODULE_PARM_DESC(ports, "number of ports to be created");
 module_param(duplex, bool, 0444);
 MODULE_PARM_DESC(duplex, "create DUPLEX ports");
 
+#if IS_ENABLED(CONFIG_SND_SEQ_UMP)
+static int ump;
+module_param(ump, int, 0444);
+MODULE_PARM_DESC(ump, "UMP conversion (0: no convert, 1: MIDI 1.0, 2: MIDI 2.0)");
+#endif
+
 struct snd_seq_dummy_port {
 	int client;
 	int port;
@@ -152,7 +158,9 @@ static int __init
 register_client(void)
 {
 	struct snd_seq_dummy_port *rec1, *rec2;
+#if IS_ENABLED(CONFIG_SND_SEQ_UMP)
 	struct snd_seq_client *client;
+#endif
 	int i;
 
 	if (ports < 1) {
@@ -166,12 +174,24 @@ register_client(void)
 	if (my_client < 0)
 		return my_client;
 
-	/* don't convert events but just pass-through */
+#if IS_ENABLED(CONFIG_SND_SEQ_UMP)
 	client = snd_seq_kernel_client_get(my_client);
 	if (!client)
 		return -EINVAL;
-	client->filter = SNDRV_SEQ_FILTER_NO_CONVERT;
+	switch (ump) {
+	case 1:
+		client->midi_version = SNDRV_SEQ_CLIENT_UMP_MIDI_1_0;
+		break;
+	case 2:
+		client->midi_version = SNDRV_SEQ_CLIENT_UMP_MIDI_2_0;
+		break;
+	default:
+		/* don't convert events but just pass-through */
+		client->filter = SNDRV_SEQ_FILTER_NO_CONVERT;
+		break;
+	}
 	snd_seq_kernel_client_put(client);
+#endif
 
 	/* create ports */
 	for (i = 0; i < ports; i++) {
-- 
2.43.0

