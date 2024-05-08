Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5547440B
	for <linux-sound@vger.kernel.org>; Wed,  8 May 2024 09:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715159487; cv=none; b=flm6HyS0EN6UrOjFogjUypDDjE1mXrhmJRaj8/GtfM/1XgsL6idbzPSA0UfAt5aJ0a3lEa5DA2Ys7HY076Z6AUjbQ9qrv6OTnwKxDx09gkNgiIhkJHbzGU1pQgDgdhDtWRohx+0oNNSObqikWoFNQt3Pt4w/cWHAzgwqVgOke4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715159487; c=relaxed/simple;
	bh=kN8+6rPcm8GIY6M4T1G8keeav5Tfp+M2NwflyPnInkQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J09zuqxj2eMr8qORomnVe2hz0b2D/Do6wYJC12HLinroNji3kjAjvQ3HjZ5Nf0GD5cw6DMD+cUjqb6dV1pgjx8/Mscp80XV+eFKF60Ckiumwz0iG0N78wtc9mY/Zys9P7JKNC90DnVmeMBmmyWuiTkqHW9tdkQFzOtNjuoyJedw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=O9kyfw8W; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CFB+1lsU; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=O9kyfw8W; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CFB+1lsU; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="O9kyfw8W";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CFB+1lsU";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="O9kyfw8W";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CFB+1lsU"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6BE512209C;
	Wed,  8 May 2024 09:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715159478; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=87BtsOUYGKmagZ5Luc26sb3E0qFtqEMKDwxJJ96R7JU=;
	b=O9kyfw8WfAeS9PtDPZOUMrKlx+BTzfC6SAMOrZL5seeF+qLmOAuz005jSxz5ENDHTtDQIi
	fDLfovyYF5WL6on9jhGhWVDZN6ltjTSSJMHsiIUvnKGjpiQtGwD9/ozP81Z5gY35PTYQzg
	hoszbnPphMfOyYwrI19S02yyo+rEmRk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715159478;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=87BtsOUYGKmagZ5Luc26sb3E0qFtqEMKDwxJJ96R7JU=;
	b=CFB+1lsUL70CxQW0uTQzorhPu0yeTZpyixFsLSEh+IBt0jZA6KYM97pRxlGKLTcvc0F+yn
	EKrwXywwmPbzY0Aw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=O9kyfw8W;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=CFB+1lsU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715159478; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=87BtsOUYGKmagZ5Luc26sb3E0qFtqEMKDwxJJ96R7JU=;
	b=O9kyfw8WfAeS9PtDPZOUMrKlx+BTzfC6SAMOrZL5seeF+qLmOAuz005jSxz5ENDHTtDQIi
	fDLfovyYF5WL6on9jhGhWVDZN6ltjTSSJMHsiIUvnKGjpiQtGwD9/ozP81Z5gY35PTYQzg
	hoszbnPphMfOyYwrI19S02yyo+rEmRk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715159478;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=87BtsOUYGKmagZ5Luc26sb3E0qFtqEMKDwxJJ96R7JU=;
	b=CFB+1lsUL70CxQW0uTQzorhPu0yeTZpyixFsLSEh+IBt0jZA6KYM97pRxlGKLTcvc0F+yn
	EKrwXywwmPbzY0Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3EAA213A3D;
	Wed,  8 May 2024 09:11:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iAgWDrZBO2YcFwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 08 May 2024 09:11:18 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 7/7] sound: oss: dmasound: Add missing module descriptions
Date: Wed,  8 May 2024 11:11:26 +0200
Message-ID: <20240508091128.25274-8-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240508091128.25274-1-tiwai@suse.de>
References: <20240508091128.25274-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.96 / 50.00];
	BAYES_HAM(-2.95)[99.78%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 6BE512209C
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Score: -2.96

Now that make W=1 starts complaining the lack of MODULE_DESCRIPTION(),
let's add the missing information.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Link: https://lore.kernel.org/r/ZjpQm-hxLQtpgkUx@smile.fi.intel.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/oss/dmasound/dmasound_atari.c | 2 ++
 sound/oss/dmasound/dmasound_paula.c | 1 +
 2 files changed, 3 insertions(+)

diff --git a/sound/oss/dmasound/dmasound_atari.c b/sound/oss/dmasound/dmasound_atari.c
index 81c6a9830727..6188469de8af 100644
--- a/sound/oss/dmasound/dmasound_atari.c
+++ b/sound/oss/dmasound/dmasound_atari.c
@@ -1618,4 +1618,6 @@ static void __exit dmasound_atari_cleanup(void)
 
 module_init(dmasound_atari_init);
 module_exit(dmasound_atari_cleanup);
+
+MODULE_DESCRIPTION("Atari TT and Falcon DMA Sound Driver");
 MODULE_LICENSE("GPL");
diff --git a/sound/oss/dmasound/dmasound_paula.c b/sound/oss/dmasound/dmasound_paula.c
index 3a593da09280..b8fad12f9e5f 100644
--- a/sound/oss/dmasound/dmasound_paula.c
+++ b/sound/oss/dmasound/dmasound_paula.c
@@ -740,5 +740,6 @@ static struct platform_driver amiga_audio_driver __refdata = {
 
 module_platform_driver_probe(amiga_audio_driver, amiga_audio_probe);
 
+MODULE_DESCRIPTION("Amiga Paula DMA Sound Driver");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS("platform:amiga-audio");
-- 
2.43.0

