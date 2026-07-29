Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D277372EF5
	for <linux-sound@vger.kernel.org>; Wed, 29 Jul 2026 08:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785314312; cv=none; b=ZSVJhE+b+sGWfWBv3HozxXEJXCDzhHT/ZXoPBFtnV0NvqNA8mccSQS0WMFSw89gNHWYcgRq7+1MqpyvtC0A2wrbZgbe1k5jL0h14EIPaLWP6DqHbA4NbadvCOiSiXdoGVFHQvKZC2QOeHuS1h6EIs3J5k6fHshFdCqRIOnT4b+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785314312; c=relaxed/simple;
	bh=ut2yFWBYPLcGwjh1OLbmlpGKJPMPiO34NkrSuBYRUvE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FyiexcwwEFGxNm/NOlOrP4lEbhJF0pbshSMiKnGYRhFkGY04xGlnrmLH9YxMjjbVmuBrGaYlHaNLHQNq7qUGfqHothxL+qW8Jf5xjEeQRlPG5a+/Emq/NdtmTPiddSvp8bPiXxZEa4ahviWjJQ0KCawFU4GY6glDB/Jl2w1H+9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NiTL4J5N; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vY7nUOcw; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VYRD5ezm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qfwP5rmg; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NiTL4J5N";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vY7nUOcw";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VYRD5ezm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qfwP5rmg"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 526437C9AE;
	Wed, 29 Jul 2026 08:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785314276; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=75h4p5fPAlvqL+SSieAZEcHhIUQt8U/7dzeG0Bo+0Ew=;
	b=NiTL4J5NwqN8T4uMsYt3Ajoe6qyYfvmic4Si9y7SyWlELa52eCWW1YJKoibStfB1NPPNQG
	hifBxDzALxJDH+/WFApOrqx+bZ/XoS+sFojcwZH5xPyyLxU4cQxEZCm0T4HEvi+jIaprYD
	2KzLkv+z2NZ76FgQcLT5iE4s0JtbBS4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785314276;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=75h4p5fPAlvqL+SSieAZEcHhIUQt8U/7dzeG0Bo+0Ew=;
	b=vY7nUOcwykzjz5TdvGVP874MoNsb7a0/sZiHM5wtzkT1mOd9QAbZbOTe0T5iAjYM3i3VY6
	EML0Hssbl2LVz4BA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=VYRD5ezm;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=qfwP5rmg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785314272; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=75h4p5fPAlvqL+SSieAZEcHhIUQt8U/7dzeG0Bo+0Ew=;
	b=VYRD5ezmhuNQNmPZh9Jj3gjHeZvhV5Lh9VBfRHEp38O3E9Acvrk4ENDacdA6ER1rX7A7/l
	535KRQAErs29VXFhjEbpMPcbn3vE4FZ4SyEz3KCvZ/GCzBGPJ926hSz3ISvK/NAwMsjpT3
	hHXAb0fQxDVPmUv4JQpv56xVnwQNVCg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785314272;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=75h4p5fPAlvqL+SSieAZEcHhIUQt8U/7dzeG0Bo+0Ew=;
	b=qfwP5rmgKmNqiLoA429hcUx7zGlSRESb/nL/48Bopql7AwE90IxEAgZdFV8to0Sm0BODUt
	J0+DrY2kqaamTQAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2F2B8779D4;
	Wed, 29 Jul 2026 08:37:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KNtMCtm7aWqCVwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 29 Jul 2026 08:37:45 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 13/14] ALSA: pcxhr: Use auto-cleanup for firmware loading
Date: Wed, 29 Jul 2026 10:37:31 +0200
Message-ID: <20260729083735.120219-14-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729083735.120219-1-tiwai@suse.de>
References: <20260729083735.120219-1-tiwai@suse.de>
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
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_NONE(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Queue-Id: 526437C9AE
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

Simplify the code to manage the firmware loading with __free(firmware)
auto-cleanup.

Only the code refactoring, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/pcxhr/pcxhr_hwdep.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/pci/pcxhr/pcxhr_hwdep.c b/sound/pci/pcxhr/pcxhr_hwdep.c
index 249805065f61..54f3950579aa 100644
--- a/sound/pci/pcxhr/pcxhr_hwdep.c
+++ b/sound/pci/pcxhr/pcxhr_hwdep.c
@@ -367,7 +367,6 @@ int pcxhr_setup_firmware(struct pcxhr_mgr *mgr)
 	};
 	char path[32];
 
-	const struct firmware *fw_entry;
 	int i, err;
 	int fw_set = mgr->fw_file_set;
 
@@ -375,6 +374,7 @@ int pcxhr_setup_firmware(struct pcxhr_mgr *mgr)
 		if (!fw_files[fw_set][i])
 			continue;
 		sprintf(path, "pcxhr/%s", fw_files[fw_set][i]);
+		const struct firmware *fw_entry __free(firmware) = NULL;
 		if (request_firmware(&fw_entry, path, &mgr->pci->dev)) {
 			dev_err(&mgr->pci->dev,
 				"pcxhr: can't load firmware %s\n",
@@ -383,7 +383,6 @@ int pcxhr_setup_firmware(struct pcxhr_mgr *mgr)
 		}
 		/* fake hwdep dsp record */
 		err = pcxhr_dsp_load(mgr, i, fw_entry);
-		release_firmware(fw_entry);
 		if (err < 0)
 			return err;
 		mgr->dsp_loaded |= 1 << i;
-- 
2.55.0

