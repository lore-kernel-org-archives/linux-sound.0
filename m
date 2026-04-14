Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19663C456D
	for <linux-sound@vger.kernel.org>; Tue, 14 Apr 2026 09:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776159221; cv=none; b=hDXI+zhnTbj5jBOgOmX/m3B8t86paCfhmgShoIhb7HtKzA99xT6QUw2qpZq59xjCz28LlhZ67RCUJ0qt89l/7MKgy1jLMLAk7A/GoorI6XIzC7o6N8VZfBaSPtDXu0PKS6Z/gnQF6EEAqnNeKQZoPlte1jwM92X2DMPAwTKctPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776159221; c=relaxed/simple;
	bh=CNdJX9lDRQgq57odqPeDDdJsY7Bog3fFgeLmlDbs/ck=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TKf9CxibvHMVowLI0nBj3PDx0mXCILWZYmbZDWa17HKPDsfR0QserApa77J3BqXHImM0U9IWTBeIUoCUXsrs1ryXfZNnyvMKoKrIXfXS/dJ39UAyCiQNS87mVJzDLDtyYrb+VL6uaQPHh8jnvh5RBW1bN19MspFHMNx06HyW27w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mYjkLokG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vha6ERlB; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mYjkLokG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vha6ERlB; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mYjkLokG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vha6ERlB";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mYjkLokG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vha6ERlB"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 96AEA5BDE2;
	Tue, 14 Apr 2026 09:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776159218; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=2dxne1ebhV4+aHjazQChbJT+LSjPbgnbqyF9z83b1IU=;
	b=mYjkLokGdmDwinqkEvCUayO1WP8UpltfDlg6c0FiW30jCwky6GQSPia0A7gd3nrDmleuK7
	3Mvvb9rxgwBLX0P5ZTby/j69NVgdxIDKYvniNR/PWaja/l4VQWaEcMSM+pjyXiO9qj+pNb
	jQ1zpJgN6ZFb8IYXrNj/Z7mePNirG0k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776159218;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=2dxne1ebhV4+aHjazQChbJT+LSjPbgnbqyF9z83b1IU=;
	b=vha6ERlBeNnUzX0nzaJrZjMXdssitQZG1dVYK+qkxSqaSCiAxtLSkd+bCkOvN4ZsiGNhTD
	GFkXHHM44a/+RUAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776159218; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=2dxne1ebhV4+aHjazQChbJT+LSjPbgnbqyF9z83b1IU=;
	b=mYjkLokGdmDwinqkEvCUayO1WP8UpltfDlg6c0FiW30jCwky6GQSPia0A7gd3nrDmleuK7
	3Mvvb9rxgwBLX0P5ZTby/j69NVgdxIDKYvniNR/PWaja/l4VQWaEcMSM+pjyXiO9qj+pNb
	jQ1zpJgN6ZFb8IYXrNj/Z7mePNirG0k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776159218;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=2dxne1ebhV4+aHjazQChbJT+LSjPbgnbqyF9z83b1IU=;
	b=vha6ERlBeNnUzX0nzaJrZjMXdssitQZG1dVYK+qkxSqaSCiAxtLSkd+bCkOvN4ZsiGNhTD
	GFkXHHM44a/+RUAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6E7064B395;
	Tue, 14 Apr 2026 09:33:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id PL2wGfIJ3mmtUwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 14 Apr 2026 09:33:38 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Dan Carpenter <error27@gmail.com>,
	Rong Zhang <i@rong.moe>
Subject: [PATCH] ALSA: usb-audio: Fix missing error handling for get_min_max*()
Date: Tue, 14 Apr 2026 11:33:34 +0200
Message-ID: <20260414093336.305464-1-tiwai@suse.de>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,rong.moe];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO

The recent fix to add the error return value check from get_min_max*()
missed one case in build_audio_procunit() where no error value is set.
This may lead to an uninitialized variable and confuse the caller
(although this wouldn't happen practically because err is set for the
loop of num_ins at the beginning of the funciton).

Fix it by setting "err = 0" properly at the missing case, too.

Fixes: 4f55a85cd4fc ("ALSA: usb-audio: Add error checks against get_min_max*()")
Reported-by: Dan Carpenter <error27@gmail.com>
Closes: https://lore.kernel.org/ad36dGpCBTGsyFr_@stanley.mountain
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/mixer.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index d4ef45bf53d7..aa6ea3be100a 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -2687,6 +2687,7 @@ static int build_audio_procunit(struct mixer_build *state, int unitid,
 				cval->max = control_spec[0];
 				cval->res = 1;
 				cval->initialized = 1;
+				err = 0;
 				break;
 			}
 
-- 
2.53.0

