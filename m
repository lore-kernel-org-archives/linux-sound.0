Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792828821;
	b=WURT29GcPnaYVcNISAfrvj/Jr8lNd5Rga5FF1gtbHpQhc8SK5tNrIMmPkywrkedLFXva
	 JziwyMGJ+H9BqQXdBJIof1NpcAjcsaojwQ10/8bo9GO3KLPfEdoQ5i7JIHitLHAK0w3Ty
	 YEQt1/U10LQoQUd8hAOOYyhv49wOAl68zGkh6vpS1pwRDQmze4yNn4ne74NT8sCm4wUPm
	 V1jKp8EkLzR6cl2emF2TCoCqxCsUuRuPX+lh/XiYcWj1MBEZhZ5DBBJ4iJ2Mb2QCqMp2b
	 3/Jm29+L3S8Hvc4FWb8OxB2/qNyjt4HWulfbdKBwLLcFfQTsUp0R05wSHIUJBsbyJaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792828821;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-Rspamd-Queue-Id:
	 X-Spam-Level:X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:
	 X-Spamd-Result:X-Spam-Score;
	bh=PYwjlwxXGXJrFV4FocWYAmzIi11tMiTtGyylhbgaUz8=;
	b=zrlo4bmcpolI1fbMONoH5Z1qFBtlJDj/ftsFOEyMkvjdSjYA5/ZEU0hsMjzbWljFHIEB
	 RPzM1CjcjhiZiMbVzNBihRBF850Rpm23KaRShc4veY4zAbVsiMeTrb3lzhtdURjpWZ+Ne
	 EzvrhbAr8cEnkLjCboV/OSbLVkYHFo/jAlWsf5gKX6gbLO/GwQnm02deNoXo+l6gveLSv
	 R8iYElqUE1pxTJ6VvblLKN0xXhEsGCK+wVasaGQ7NUKCJwq81aQtO3Ewl6brEinm3a8NR
	 iI5/blsXva0oa5S47bFQxJqvviRMItkiLOUKFH9F+GJDf9FLejtEudWRcmQyzbaWR3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Fw6T19Wx;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=ydK+t22j;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Fw6T19Wx;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=ydK+t22j;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9B2606A31D
	for <linux-sound@vger.kernel.org>; Sat, 24 Oct 2026 08:00:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B9B2606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Fw6T19Wx;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=ydK+t22j;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Fw6T19Wx;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=ydK+t22j
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9206022489;
	Sat, 24 Oct 2026 08:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792828813; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=PYwjlwxXGXJrFV4FocWYAmzIi11tMiTtGyylhbgaUz8=;
	b=Fw6T19WxNR6qL4WanWW1FjZ+wUvwwQiul9pjKw7ocf+pXdmoVgTTOzF9An3kpIqX/43htp
	JonhcsR4ve28OW2n8rHH+GT+o5Nbv87qojbY5yk5R3x0+saySMyyNUHrk5rMYXXPrtBfNT
	ncAHmuBJxBZ/WeK2VPm7eXGExLhJlYc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792828813;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=PYwjlwxXGXJrFV4FocWYAmzIi11tMiTtGyylhbgaUz8=;
	b=ydK+t22jehWd9NniS/hu9Si3YrTWCjx4geEK1lRS77cGfh3hQzqphfOmwWNNa6b3+t1xX0
	jGTq7EmjuTSj2FCg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Fw6T19Wx;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ydK+t22j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792828813; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=PYwjlwxXGXJrFV4FocWYAmzIi11tMiTtGyylhbgaUz8=;
	b=Fw6T19WxNR6qL4WanWW1FjZ+wUvwwQiul9pjKw7ocf+pXdmoVgTTOzF9An3kpIqX/43htp
	JonhcsR4ve28OW2n8rHH+GT+o5Nbv87qojbY5yk5R3x0+saySMyyNUHrk5rMYXXPrtBfNT
	ncAHmuBJxBZ/WeK2VPm7eXGExLhJlYc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792828813;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=PYwjlwxXGXJrFV4FocWYAmzIi11tMiTtGyylhbgaUz8=;
	b=ydK+t22jehWd9NniS/hu9Si3YrTWCjx4geEK1lRS77cGfh3hQzqphfOmwWNNa6b3+t1xX0
	jGTq7EmjuTSj2FCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1085B1363A;
	Sat, 24 Oct 2026 08:00:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id c8vZN4xl3GrkQAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 24 Oct 2026 08:00:13 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Gergo Koteles <soyer@irl.hu>
Subject: [PATCH] ALSA: usb-audio: Correct a typo in UMC404HD model comment
Date: Sat, 24 Oct 2026 10:00:10 +0200
Message-ID: <20261024080011.2258391-1-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 9206022489
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-12.01 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:email];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -12.01

The recently added quirk code has a comment for 1397:0509 as if it
were UMC204HD, but it's UMC404HD.  Correct it.

Fixes: e88f4749c02f ("ALSA: usb-audio: Avoid applying boot quirk for Behringer UMC204HD")
Suggested-by: Gergo Koteles <soyer@irl.hu>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/quirks.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 6aa212c2cab6..b6be3a80d9c9 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1794,7 +1794,7 @@ int snd_usb_apply_boot_quirk_once(struct usb_device *dev,
 		/* the quirk seems breaking on some Behringer devices */
 		switch (id) {
 		case USB_ID(0x1397, 0x0508): /* UMC204HD */
-		case USB_ID(0x1397, 0x0509): /* UMC204HD */
+		case USB_ID(0x1397, 0x0509): /* UMC404HD */
 			return 0;
 		}
 		return snd_usb_cm1a_boot_quirk(dev);
-- 
2.55.0

