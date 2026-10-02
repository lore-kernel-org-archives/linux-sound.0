Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5623BA246
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 08:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790929118; cv=none; b=CL0+fPW0hporIeYo5Dwd6UzsnYGQy0W+pHEQKAPDY+LA/Bj0AZlHTaVMhVgPKgUzKEDWHA52/PMifYh5+OCkfwLkH0ulER254mQvzXXhIR5IOqU6lrqp/r6rGF/NWkydsGwEQbN0YhKIGamJPXwFHdK0D6erIQkv7CAffWSe9NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790929118; c=relaxed/simple;
	bh=s6J0iiRfmIStYq3HBf79CgD/OVCbdyV1d0EdRlmI1rU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=dKUwHBG3VBs2ODnRJT8adEHQqqa0Dj7SX6L+civFElBhJ8RwlmccQtp+d7Mb956JNTAN434b5gCJ9piytNwD9bihm+EekRt4XYerZeCP/o/79zmRvFHBsITVFtV6J0IKE6GNcl72rulp7gOHw1atx1LhDG5meM6hwgkWwmsCkW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xZD7hwVs; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PZ1SVUmA; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Oaw4COLC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jiSJv5Rk; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xZD7hwVs";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PZ1SVUmA";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Oaw4COLC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jiSJv5Rk"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3096E21F7B;
	Fri,  2 Oct 2026 08:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790929110; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=K3pqDNDrGLQVqCCxnG+/BqAEwyunmFn+vjr2uOdD0vM=;
	b=xZD7hwVs4APvd9Na8VIb30wKJSU2Ivr5mB+6QxLU+aV0D/q3bgm1lSTjbJ92/UcEZyTY/e
	CQB6W+hMom1bZ3xzkIXhO8K/IVmgO5EGkojafGhWFttn/yzc+Q7GSc8rhwpW2nQZKwhF+2
	Xlm5XBPJOWosXzd6kzGXnLaTXSWqVXw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790929110;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=K3pqDNDrGLQVqCCxnG+/BqAEwyunmFn+vjr2uOdD0vM=;
	b=PZ1SVUmANy6OekzueNBpBk4HhyzLqpwHPAl4AKNZbk6QEaQn2WJhk/mKPALfPxOHvquVjB
	eqCbzInFPJRijsDQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790929106; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=K3pqDNDrGLQVqCCxnG+/BqAEwyunmFn+vjr2uOdD0vM=;
	b=Oaw4COLCqk/h5ngDR0hTDE0z4+JY8UMOJijkKDymCXYZMij0VKGsiKpX1ewudqB6aCVpIh
	vb5tionk+hn3tsT87ZGJ+FUuh3WR+PopkcGTtY/TTiuVrwF8Nado1QyDgkEZ585vRg846d
	79uJ+cCjbiCAhOK05Usho+39WrgmHW8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790929106;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=K3pqDNDrGLQVqCCxnG+/BqAEwyunmFn+vjr2uOdD0vM=;
	b=jiSJv5RkDqTQFpAbwTZLcBpVErjvdapeYSGSSC/wXfsCxmhh5g/Hv0q66Ji+UDLmO7HiHD
	4IcO4S6A8NApoQAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DB9C413691;
	Fri,  2 Oct 2026 08:18:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8+gXKtFov2qGMQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 02 Oct 2026 08:18:25 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: ump: Avoid dereference with max_src_size=0
Date: Fri,  2 Oct 2026 10:18:22 +0200
Message-ID: <20261002081823.680131-1-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 

safe_copy_string() refers the source pointer for a NUL terminator
before verifying the source size.  When max_src_size=0, it may
dereference wrongly.  Fix the verification order.

Only hypothetical hardening, and we see no actual issue in the current
code, as they are all valid sources.

Fixes: e3f035edadcc ("ALSA: ump: Copy FB name string more safely")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/ump.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/ump.c b/sound/core/ump.c
index 3d1a2ed3b476..f6482a9bfe61 100644
--- a/sound/core/ump.c
+++ b/sound/core/ump.c
@@ -66,7 +66,7 @@ static void safe_copy_string(void *dst, size_t max_dst_size,
 
 	if (!max_dst_size--)
 		return;
-	for (s = src; max_dst_size && *s && max_src_size--; s++) {
+	for (s = src; max_dst_size && max_src_size-- && *s; s++) {
 		if (!isascii(*s) || !isprint(*s))
 			continue;
 		*d++ = *s;
-- 
2.55.0

