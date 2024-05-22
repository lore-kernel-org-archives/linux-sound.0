Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2935C7BAFF
	for <linux-sound@vger.kernel.org>; Wed, 22 May 2024 07:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716361473; cv=none; b=QZwj1nl3HZiTx9sOFbzausSQ8w8uhFoT45TYNaxTQALdOglDeNR1JW3rbs6ivtP3l/Q4MqEd7nPPSnhVi8BVPUI+9zY/xo7ubyr1xnF22uaF6kCswubU4/I1bowtQ55ehO5KCK70Lt8WtirTxiqKGp5oRyHGaHqKFzbBj9lMeRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716361473; c=relaxed/simple;
	bh=yGDQFHicqXL+8Sqj0IPSxxnbweB6sq9s3vL6ESdPLwU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CJGwtxUch00zOTXmHSpdmREx4W4zvjXuvf+VfYEoIojeakOd/5z/tj1h4Ku/VTPAywtnSK11k+WwUkT4+h2O+WNir4co6dhEOfotzFDUwgCxDpxURumcF/Tn0uLHmKiSY9f7e6JM3InXfcx2CdE0oo71fEpaidax9tW+fELI3PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TOIVEtan; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SYzJ62T0; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=C+ShgW47; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nXRoQQ5R; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TOIVEtan";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SYzJ62T0";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="C+ShgW47";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nXRoQQ5R"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0A8F734BC6;
	Wed, 22 May 2024 07:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1716361470; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ciBsmAmVfdIfqxOZmwf0E0wS4Uq6o8a7C0wgDJuG2dM=;
	b=TOIVEtaneuIUwOo/FAPPahGfzM9yOpJKOdcjIubPPvjB5EcLYB3Z3tZz9ZKm+7cW57/q42
	Jvlfr3ZtGXtMkSZAErJ5O2Rh3fzg9v76fo6J74fVWCy+Ryl8GQuDb6Zqp/qN7KSONJfto0
	BuiVoK6v9/MpoDQKp0mSFlG5wsalYx4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1716361470;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ciBsmAmVfdIfqxOZmwf0E0wS4Uq6o8a7C0wgDJuG2dM=;
	b=SYzJ62T0qR440dGoSHulWOEsdFcIvDrpqCVGsxxrGPj37OCUQ5Fro87r6jfvCatXYqlMWw
	UBcw3dV8lQLPOEBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1716361469; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ciBsmAmVfdIfqxOZmwf0E0wS4Uq6o8a7C0wgDJuG2dM=;
	b=C+ShgW47Tp4rqew8yYlEL+LFgtXtxAKftsA9+pe0gecUgnopOjKKNuNpbo28ZmAzgowgdL
	K+dZo9zfd5Y2G95s42WbcRaY3FZu7WUPQMCeKrOTC7Vj4GZeCOeTg1IqFZcYptXpjjcm7a
	e1xAA9bjdIDTiWo1/rJOqHTfJeCERCY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1716361469;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ciBsmAmVfdIfqxOZmwf0E0wS4Uq6o8a7C0wgDJuG2dM=;
	b=nXRoQQ5R02ShSbqNJQfoud6BJQS9VOYlWXgv29e9frilB5ZNkQ3pRE/rhJSZSozJde8acU
	CUt67jJqLmO7N7Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E0A5E13A1E;
	Wed, 22 May 2024 07:04:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id jI6fNfyYTWZOGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 22 May 2024 07:04:28 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Xu Yang <xu.yang_2@nxp.com>
Subject: [PATCH 1/2] ALSA: core: Fix NULL module pointer assignment at card init
Date: Wed, 22 May 2024 09:04:39 +0200
Message-ID: <20240522070442.17786-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,nxp.com:email];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Flag: NO

The commit 81033c6b584b ("ALSA: core: Warn on empty module")
introduced a WARN_ON() for a NULL module pointer passed at snd_card
object creation, and it also wraps the code around it with '#ifdef
MODULE'.  This works in most cases, but the devils are always in
details.  "MODULE" is defined when the target code (i.e. the sound
core) is built as a module; but this doesn't mean that the caller is
also built-in or not.  Namely, when only the sound core is built-in
(CONFIG_SND=y) while the driver is a module (CONFIG_SND_USB_AUDIO=m),
the passed module pointer is ignored even if it's non-NULL, and
card->module remains as NULL.  This would result in the missing module
reference up/down at the device open/close, leading to a race with the
code execution after the module removal.

For addressing the bug, move the assignment of card->module again out
of ifdef.  The WARN_ON() is still wrapped with ifdef because the
module can be really NULL when all sound drivers are built-in.

Note that we keep 'ifdef MODULE' for WARN_ON(), otherwise it would
lead to a false-positive NULL module check.  Admittedly it won't catch
perfectly, i.e. no check is performed when CONFIG_SND=y.  But, it's no
real problem as it's only for debugging, and the condition is pretty
rare.

Fixes: 81033c6b584b ("ALSA: core: Warn on empty module")
Reported-by: Xu Yang <xu.yang_2@nxp.com>
Closes: https://lore.kernel.org/r/20240520170349.2417900-1-xu.yang_2@nxp.com
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/init.c b/sound/core/init.c
index 6b127864a1a3..ac072614d1ea 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -313,8 +313,8 @@ static int snd_card_init(struct snd_card *card, struct device *parent,
 	card->number = idx;
 #ifdef MODULE
 	WARN_ON(!module);
-	card->module = module;
 #endif
+	card->module = module;
 	INIT_LIST_HEAD(&card->devices);
 	init_rwsem(&card->controls_rwsem);
 	rwlock_init(&card->ctl_files_rwlock);
-- 
2.43.0

