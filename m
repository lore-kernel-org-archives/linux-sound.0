Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3896C3B8BBB
	for <linux-sound@vger.kernel.org>; Mon, 27 Apr 2026 12:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777293506; cv=none; b=j5JoR/9MO/UrGIqa0QavGnriiJcTgZFPXHy47KCkdkdf7v4mhvIer2TNYnZsfpoK2kPHYlVuc7K8E86WZZ+26j1quY4Esg0NnjS3Fj0cH51FfMnsRdbgLOBzHKfarsQKj++vlKzfdvapgyKxQoIHv4y0YY1JGHTo/CK/TiO8S4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777293506; c=relaxed/simple;
	bh=bJFsm0m+QVK2BjGkaw9k4XCx5OQ5usUFmnfvRlnLUDg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n/jbl2N88E/5qHyKQ+Tbgj4opJ2dDTAHluZSu9L+qJdsY+LTPe5eL6mSPU1N7KsUlqhL5BHl95agjSfciH0MYr0X52xOQK2YeeZgurgK4zsXiRmV6g2+tUctn0wXwGE+tgTgABz8dPx3iwBU5kBi/u0+HyHlLqvrza5wlIHcAGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GmkPDiTW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=89deiyHU; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GmkPDiTW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=89deiyHU; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GmkPDiTW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="89deiyHU";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GmkPDiTW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="89deiyHU"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6132B5BD23;
	Mon, 27 Apr 2026 12:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777293503; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=7xBcMfc/bZeMuAFfdXkE3gka1iKsDtGrPE7K/usBVPM=;
	b=GmkPDiTWx68LPQswP7QZ6HxEle/eNJgmIF9XXxJwK8Two/fDB5OWLd2fzzw9MXhhwxiCAG
	zYP+BiHC6LC5xu4ZJGbQ+35/ZtplTxG+k5Y5hI6VyllCDi/pevRgJLMqp7igpDHuYaElRH
	3J+YoJD8LLZ/kabliM+fX2fS8vUzYic=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777293503;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=7xBcMfc/bZeMuAFfdXkE3gka1iKsDtGrPE7K/usBVPM=;
	b=89deiyHUy5gsv5xebjMfUFMZ/ieg4Z7qoUwxuHyGV3bTItQdCizkv0AP17QDinLmrEstSU
	lWy9WRIiqDc8nRAg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=GmkPDiTW;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=89deiyHU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777293503; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=7xBcMfc/bZeMuAFfdXkE3gka1iKsDtGrPE7K/usBVPM=;
	b=GmkPDiTWx68LPQswP7QZ6HxEle/eNJgmIF9XXxJwK8Two/fDB5OWLd2fzzw9MXhhwxiCAG
	zYP+BiHC6LC5xu4ZJGbQ+35/ZtplTxG+k5Y5hI6VyllCDi/pevRgJLMqp7igpDHuYaElRH
	3J+YoJD8LLZ/kabliM+fX2fS8vUzYic=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777293503;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=7xBcMfc/bZeMuAFfdXkE3gka1iKsDtGrPE7K/usBVPM=;
	b=89deiyHUy5gsv5xebjMfUFMZ/ieg4Z7qoUwxuHyGV3bTItQdCizkv0AP17QDinLmrEstSU
	lWy9WRIiqDc8nRAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4274A593B0;
	Mon, 27 Apr 2026 12:38:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ZmwBD79Y72k4IwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 27 Apr 2026 12:38:23 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: caiaq: Fix potentially leftover ep1_in_urb at error path
Date: Mon, 27 Apr 2026 14:37:53 +0200
Message-ID: <20260427123819.890185-1-tiwai@suse.de>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_NONE(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 6132B5BD23

The previous fix for handling the error from setup_card() missed that
an internal URB cdev->ep1_in_urb might have been already submitted
beforehand.  In the normal case, this URB gets killed at the
disconnection, but in the error path, we didn't do it, hence there can
be a potential leak.

Fix it in the error path for setup_card(), too.

Fixes: 28abd224db4a ("ALSA: caiaq: Handle probe errors properly")
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/caiaq/device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/caiaq/device.c b/sound/usb/caiaq/device.c
index ad9f744b496b..1afd91e27396 100644
--- a/sound/usb/caiaq/device.c
+++ b/sound/usb/caiaq/device.c
@@ -514,7 +514,7 @@ static int init_card(struct snd_usb_caiaqdev *cdev)
 
 	err = setup_card(cdev);
 	if (err < 0)
-		return err;
+		goto err_kill_urb;
 
 	return 0;
 
-- 
2.53.0

