Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6E11A27D
	for <linux-sound@vger.kernel.org>; Wed, 20 Mar 2024 06:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710916054; cv=none; b=A/1Yf7KON+8J40gXu22T7hFhdZ/WFj0sR0sAb/P8T17lGudYC6r/Jtlz0cEySebRs56lW8DFwjzoo0l+VFGymmZeMowdLSeRKIexDn7bFMPof6Veb9aaJiUtGHnz62xaeH8F0woHY3mkMsQGg32j+YkhLeYHpVX8Z0Au40DBerM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710916054; c=relaxed/simple;
	bh=2MQa0ZWpQcCeWTiatibGL+FRLuxUldns28eiqb2WlR4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qWNoq78YhMc1Oxf/gkratRIwhBuBaNZw1uNoOlTfyHFnDfITXxt5c83vv9P47aFhUUTERJxW8tpESQdjBEnl8TNqDrpTlsfRaavg/8T9FWJixyDc63EjcLZyG0owsZ6vIPeaMvQlGeCLV4qckTQIl8PI5KPJoUJpkRJmjcOEGes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=c3r2vh6P; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rlXZaYI6; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=c3r2vh6P; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rlXZaYI6; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="c3r2vh6P";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rlXZaYI6";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="c3r2vh6P";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rlXZaYI6"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9CDD4208B0;
	Wed, 20 Mar 2024 06:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1710916048; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=VmUaZENwOhUEE8yOLt6hCM9T+m6BX8zcHhL+IZV3t2E=;
	b=c3r2vh6PGXDmKEwXxPmye7TnfOin1sPdehnIy39FNT6yTpP6p7IygADFIzsw5ho5uwP+8R
	M82B/S0ses/inWqSorFKox/EzrxJB/Mbl9hFzqgkeg9CsJYGlIEkj9U7IavvbUZAfYZG7/
	WSaZp2Lg6Aw74SEksZu5jqhYXoY7F6M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1710916048;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=VmUaZENwOhUEE8yOLt6hCM9T+m6BX8zcHhL+IZV3t2E=;
	b=rlXZaYI6Pz/xDZux7iRVJiutu2WXM2SKBQADhao3LZ/zn9Dmr8mH135lPPoQYOl6VcPi2A
	VHjWhHOER5i05qCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1710916048; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=VmUaZENwOhUEE8yOLt6hCM9T+m6BX8zcHhL+IZV3t2E=;
	b=c3r2vh6PGXDmKEwXxPmye7TnfOin1sPdehnIy39FNT6yTpP6p7IygADFIzsw5ho5uwP+8R
	M82B/S0ses/inWqSorFKox/EzrxJB/Mbl9hFzqgkeg9CsJYGlIEkj9U7IavvbUZAfYZG7/
	WSaZp2Lg6Aw74SEksZu5jqhYXoY7F6M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1710916048;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=VmUaZENwOhUEE8yOLt6hCM9T+m6BX8zcHhL+IZV3t2E=;
	b=rlXZaYI6Pz/xDZux7iRVJiutu2WXM2SKBQADhao3LZ/zn9Dmr8mH135lPPoQYOl6VcPi2A
	VHjWhHOER5i05qCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 79022136D6;
	Wed, 20 Mar 2024 06:27:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ZnGqF9CB+mWlGQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 20 Mar 2024 06:27:28 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>
Subject: [PATCH] ALSA: control: Fix unannotated kfree() cleanup
Date: Wed, 20 Mar 2024 07:27:20 +0100
Message-ID: <20240320062722.31325-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: 3.64
X-Spamd-Result: default: False [3.64 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 NEURAL_HAM_LONG(-0.99)[-0.993];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCPT_COUNT_TWO(0.00)[2];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.07)[61.98%]
X-Spam-Level: ***
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Flag: NO

The recent conversion to the automatic kfree() forgot to mark a
variable with __free(kfree), leading to memory leaks.  Fix it.

Fixes: 1052d9882269 ("ALSA: control: Use automatic cleanup of kfree()")
Reported-by: Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>
Closes: https://lore.kernel.org/r/c1e2ef3c-164f-4840-9b1c-f7ca07ca422a@alu.unizg.hr
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/control.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/core/control.c b/sound/core/control.c
index 8367fd485371..fb0c60044f7b 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -1275,12 +1275,12 @@ static int snd_ctl_elem_read(struct snd_card *card,
 static int snd_ctl_elem_read_user(struct snd_card *card,
 				  struct snd_ctl_elem_value __user *_control)
 {
-	struct snd_ctl_elem_value *control;
+	struct snd_ctl_elem_value *control __free(kfree) = NULL;
 	int result;
 
 	control = memdup_user(_control, sizeof(*control));
 	if (IS_ERR(control))
-		return PTR_ERR(control);
+		return PTR_ERR(no_free_ptr(control));
 
 	result = snd_ctl_elem_read(card, control);
 	if (result < 0)
-- 
2.43.0

