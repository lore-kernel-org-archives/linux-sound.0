Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C75405E5
	for <linux-sound@vger.kernel.org>; Thu, 22 Feb 2024 11:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708600519; cv=none; b=NMoAtT4dbUpuslcEQ/0IyzUL0u5eDbTiREt2AZWpvLfbRIaerFyF9/Y59zhXu8Mu+mYDqRCfwkK+V+0WEbDIhsBpMmpcGTxp54LG8CUVRmGl7U/sOSPa6Cf8anadSBDlNaqUxJ2wVFrdGzJABebx+u42q0SVemGj6sZLRbxr0+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708600519; c=relaxed/simple;
	bh=L1Vw4RnR6ChbgXpliIWgz5jTVLJWdUDQG6s5OFsUTdo=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cigGWb34bDZL0Iw2XGnlRo9hw6MEfViyojUN3z61qlUVzXyRnVpffLH2rlN9AmKqK7NQoYSy+64vTZ6F/+D3kqNByDv+nDFoURSmv4eJ10hjwBr/j404DE/+BttK3LMz3AxEIJm1h3eDrlAGbi9VFs/XJOa2C4Pk3lV8dbXKcLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yyc34CGO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KPzsvAva; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yyc34CGO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KPzsvAva; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yyc34CGO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KPzsvAva";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yyc34CGO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KPzsvAva"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 321431FB9D;
	Thu, 22 Feb 2024 11:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708600516; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D5DB2baQhkxHtpTxvCM6YBAy7UqFgsPQEOJ8JFpOX5o=;
	b=yyc34CGO7hcQCZULmpEe2nzRCWctWITMJYFNJWJCctsZCur3VAG/4U04vB67XItlQpU6BJ
	oyC/SC3lR4+Tey20vu4IxMlH+p4YJ6YxfE2Ysd8L+2uQTBNeY6HJRxApG9UUt2RNFP39ZL
	kwedq3+WURAdbYn9SgXnIQJ4oVvVwuI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708600516;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D5DB2baQhkxHtpTxvCM6YBAy7UqFgsPQEOJ8JFpOX5o=;
	b=KPzsvAvau8/bkIDagMoMsZrQpbG7vWmxVN+VF2DFq0B2x3TDaq3iHwpkYwhVG4QjpfeTjU
	9udjKgZdIAdF/7DA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708600516; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D5DB2baQhkxHtpTxvCM6YBAy7UqFgsPQEOJ8JFpOX5o=;
	b=yyc34CGO7hcQCZULmpEe2nzRCWctWITMJYFNJWJCctsZCur3VAG/4U04vB67XItlQpU6BJ
	oyC/SC3lR4+Tey20vu4IxMlH+p4YJ6YxfE2Ysd8L+2uQTBNeY6HJRxApG9UUt2RNFP39ZL
	kwedq3+WURAdbYn9SgXnIQJ4oVvVwuI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708600516;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D5DB2baQhkxHtpTxvCM6YBAy7UqFgsPQEOJ8JFpOX5o=;
	b=KPzsvAvau8/bkIDagMoMsZrQpbG7vWmxVN+VF2DFq0B2x3TDaq3iHwpkYwhVG4QjpfeTjU
	9udjKgZdIAdF/7DA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 19F2213A8C;
	Thu, 22 Feb 2024 11:15:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4K01BcQs12UFGgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 22 Feb 2024 11:15:16 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 7/9] ALSA: seq: virmidi: Use automatic cleanup of kfree()
Date: Thu, 22 Feb 2024 12:15:07 +0100
Message-Id: <20240222111509.28390-8-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240222111509.28390-1-tiwai@suse.de>
References: <20240222111509.28390-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [4.90 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_DN_NONE(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_ONE(0.00)[1];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.00)[14.07%]
X-Spam-Level: ****
X-Spam-Score: 4.90
X-Spam-Flag: NO

There are common patterns where a temporary buffer is allocated and
freed at the exit, and those can be simplified with the recent cleanup
mechanism via __free(kfree).

No functional changes, only code refactoring.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_virmidi.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/sound/core/seq/seq_virmidi.c b/sound/core/seq/seq_virmidi.c
index 1678737f11be..35f93b43dd2a 100644
--- a/sound/core/seq/seq_virmidi.c
+++ b/sound/core/seq/seq_virmidi.c
@@ -363,26 +363,22 @@ static int snd_virmidi_dev_attach_seq(struct snd_virmidi_dev *rdev)
 {
 	int client;
 	struct snd_seq_port_callback pcallbacks;
-	struct snd_seq_port_info *pinfo;
+	struct snd_seq_port_info *pinfo __free(kfree) = NULL;
 	int err;
 
 	if (rdev->client >= 0)
 		return 0;
 
 	pinfo = kzalloc(sizeof(*pinfo), GFP_KERNEL);
-	if (!pinfo) {
-		err = -ENOMEM;
-		goto __error;
-	}
+	if (!pinfo)
+		return -ENOMEM;
 
 	client = snd_seq_create_kernel_client(rdev->card, rdev->device,
 					      "%s %d-%d", rdev->rmidi->name,
 					      rdev->card->number,
 					      rdev->device);
-	if (client < 0) {
-		err = client;
-		goto __error;
-	}
+	if (client < 0)
+		return client;
 	rdev->client = client;
 
 	/* create a port */
@@ -410,15 +406,11 @@ static int snd_virmidi_dev_attach_seq(struct snd_virmidi_dev *rdev)
 	if (err < 0) {
 		snd_seq_delete_kernel_client(client);
 		rdev->client = -1;
-		goto __error;
+		return err;
 	}
 
 	rdev->port = pinfo->addr.port;
-	err = 0; /* success */
-
- __error:
-	kfree(pinfo);
-	return err;
+	return 0; /* success */
 }
 
 
-- 
2.35.3

