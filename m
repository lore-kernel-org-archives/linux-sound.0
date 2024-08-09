Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1553918C341
	for <linux-sound@vger.kernel.org>; Fri,  9 Aug 2024 07:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723190186; cv=none; b=Qx2wUR7QSD/IFn+d4BJKtwKUCEgtX+9LNNIUyZkXvps++VNBT+vKdhwRCvnqoi7J4K2QIJpidzaNThKB4tjv4eo5xDRGdgbEMbpUsjSiLJK2Rx3DbuucPKWm7gGRqeqzknVK1yYmGk7ITkvvSeGKPc73Dzyg51wGy54ckLLZ3Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723190186; c=relaxed/simple;
	bh=fTuh6JVy1EFxAjI7n3vU5i91OsVVDDj/U5PirwltkdM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=AqfI0+plFEo3uMim5RVBXamA0HPLaW8gGBqIfYLlQv1+B3Vqe0veIyZA1w9UH1vUAUMpElWIv34KKw1q5BXXBcL8uUFqAcdxiqlhZhJsAGbY3UArQeyloeGv1J3fkDlzCkNHOcvakTQfgQUrjRtkVKMrI3d0p55DKQbMRZ1iLbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wpz/PdOL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RaAYsLaf; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tQpzF47c; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cmpvMxAl; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wpz/PdOL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RaAYsLaf";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tQpzF47c";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cmpvMxAl"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id F147721DC2;
	Fri,  9 Aug 2024 07:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723190183; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=CTWHt9+HanYggxpCst1yVPLE8QDyJezqm4n/lpiQLVs=;
	b=wpz/PdOLFfjgmqy0dq4R2WdvdyP6jKmYJ1bkS57sIO77zLMx9ryNkzrZ63FhQ7/aRMrqoh
	xxjhvbJJlUsHtsxH9twlB7ExJUkfv2TE5NLW7Lr6ILN1NsdXgtkQxvLQ0xKsoYKiP/8Ztg
	JSrvVASEzr3TjgY0JG47IY0vM6ofVEA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723190183;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=CTWHt9+HanYggxpCst1yVPLE8QDyJezqm4n/lpiQLVs=;
	b=RaAYsLafMl/NRwh1l8IPdft57jX6Qv2UONPs5JbEJTYYgVleVdpfYT5RbuBrSLw8UpOHoX
	QQzAaTzxfaMZ1jBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723190182; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=CTWHt9+HanYggxpCst1yVPLE8QDyJezqm4n/lpiQLVs=;
	b=tQpzF47cRaCub3Bil7gKarx5a+Ef9b1arMJcAxz5vw6FEjpOIrOKuArE1OgbDFuyiKDuDb
	jp1z90NRicWQU7I1sA5LwFTF8zmoCLN+vnceb8H0itoNzhj00jSDOMeUczmVHmlZMZiOaK
	iFcFRDShmK46bt0Fo8Bjcc3F+ZMXyug=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723190182;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=CTWHt9+HanYggxpCst1yVPLE8QDyJezqm4n/lpiQLVs=;
	b=cmpvMxAl+Dnt/tN73n5p3GvfAlKPGhX2S1M836xCKXUBF4elQWAw1ty8kIXi8hbZEC+hbW
	PLKm+oTGp7uLfrDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D4E161379A;
	Fri,  9 Aug 2024 07:56:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6VysMqbLtWZnGgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 09 Aug 2024 07:56:22 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: usx2y: Drop no longer used variable
Date: Fri,  9 Aug 2024 09:56:59 +0200
Message-ID: <20240809075700.7320-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [0.20 / 50.00];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,intel.com:email,suse.de:email];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: 0.20

The recent conversion to the standard print API included some cleanups
and that changed the code no longer referring to a variable iters at
usb_stream_start().  This caused a compiler warning in the end.
Let's drop the unused variable.

Fixes: f8466d91f36d ("ALSA: usx2y: Use standard print API")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202408090249.8LE9qrae-lkp@intel.com/
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/usx2y/usb_stream.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/usb/usx2y/usb_stream.c b/sound/usb/usx2y/usb_stream.c
index 66ea610aa433..3122cf653273 100644
--- a/sound/usb/usx2y/usb_stream.c
+++ b/sound/usb/usx2y/usb_stream.c
@@ -665,7 +665,7 @@ static void i_playback_start(struct urb *urb)
 int usb_stream_start(struct usb_stream_kernel *sk)
 {
 	struct usb_stream *s = sk->s;
-	int frame = 0, iters = 0;
+	int frame = 0;
 	int u, err;
 	int try = 0;
 
@@ -700,7 +700,6 @@ int usb_stream_start(struct usb_stream_kernel *sk)
 			frame = usb_get_current_frame_number(dev);
 			do {
 				now = usb_get_current_frame_number(dev);
-				++iters;
 			} while (now > -1 && now == frame);
 		}
 		err = usb_submit_urb(inurb, GFP_ATOMIC);
-- 
2.43.0

