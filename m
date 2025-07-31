Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9E4242D7E
	for <linux-sound@vger.kernel.org>; Thu, 31 Jul 2025 05:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753940240; cv=none; b=Qdag/XBJO4UaUpqBHzB3448T3QJartZzY/p2lbX71Y9IyDHPz7znQcRow/aqpAzvZpFfm5ke2VD1ObLJ6L8O3/HoNltcP0nAb0xBnk0pL2/AXGcG7qKiUjJ/s3kth1agfROIMwGWydVJZ+zKIU/y8+w5tSV0/8mCQVnaay48VRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753940240; c=relaxed/simple;
	bh=Qz+LPLfhKST8XJtNRlsMsPukealm32xRfCOjIcOuez4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PR0TP4Mm8mCBTOvHb3QqNU8QMHQgjESjocQ3hEykItMIg1loJaJw2poUbpknC8kya9lrrDWh/uEzb1q7Yb7xYARCiaKmFjoubO+4n8urCNmuyE8jSpPPW569PXAsYJo00Pp4kXfOlffFN57kgCW3mMCsrrdJQHEueQ+uJHK0qys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=aZ1gHB0l; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gZyYSeP7; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=aZ1gHB0l; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gZyYSeP7; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="aZ1gHB0l";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gZyYSeP7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="aZ1gHB0l";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gZyYSeP7"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B44531F814;
	Thu, 31 Jul 2025 05:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1753940235; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=JF2rxiGZ+ipI6gElAkLL/OlX8kX80pwlC+RG+A3qWSc=;
	b=aZ1gHB0l9gDq0myLJjIYMBNSUIiD1OcRV7p4SddMNOWGxiPKRpd82ixLJ0L0CFPoPdTdVf
	iilHgZZ+vpPEYKG0tkCuqlaptty3d9u1DCnjsCb9waC8dRuIfG01f0YUF91Ha+h407wchh
	zR2tY0Sckc8b9p1K7ATWM3HG356D5lE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1753940235;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=JF2rxiGZ+ipI6gElAkLL/OlX8kX80pwlC+RG+A3qWSc=;
	b=gZyYSeP7URzrTyWZ0dmmzay2YQF3OiZ6OZf6tgBVqvAvhqjC29obEg5Iq5qVqKyfLaTqax
	+Oy78d/E3pYIx3Dg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=aZ1gHB0l;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=gZyYSeP7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1753940235; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=JF2rxiGZ+ipI6gElAkLL/OlX8kX80pwlC+RG+A3qWSc=;
	b=aZ1gHB0l9gDq0myLJjIYMBNSUIiD1OcRV7p4SddMNOWGxiPKRpd82ixLJ0L0CFPoPdTdVf
	iilHgZZ+vpPEYKG0tkCuqlaptty3d9u1DCnjsCb9waC8dRuIfG01f0YUF91Ha+h407wchh
	zR2tY0Sckc8b9p1K7ATWM3HG356D5lE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1753940235;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=JF2rxiGZ+ipI6gElAkLL/OlX8kX80pwlC+RG+A3qWSc=;
	b=gZyYSeP7URzrTyWZ0dmmzay2YQF3OiZ6OZf6tgBVqvAvhqjC29obEg5Iq5qVqKyfLaTqax
	+Oy78d/E3pYIx3Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8D9521378C;
	Thu, 31 Jul 2025 05:37:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MSvnIAsBi2hOTwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 31 Jul 2025 05:37:15 +0000
From: Takashi Iwai <tiwai@suse.de>
To: "Geoffrey D . Bennett" <g@b4.vu>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: usb: scarlett2: Fix missing NULL check
Date: Thu, 31 Jul 2025 07:37:08 +0200
Message-ID: <20250731053714.29414-1-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: B44531F814
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email]
X-Spam-Score: -3.01

scarlett2_input_select_ctl_info() sets up the string arrays allocated
via kasprintf(), but it misses NULL checks, which may lead to NULL
dereference Oops.  Let's add the proper NULL check.

Fixes: 8eba063b5b2b ("ALSA: scarlett2: Simplify linked channel handling")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/mixer_scarlett2.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index 15bbdafc4894..1ec203cbbd94 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -3978,8 +3978,13 @@ static int scarlett2_input_select_ctl_info(
 		goto unlock;
 
 	/* Loop through each input */
-	for (i = 0; i < inputs; i++)
+	for (i = 0; i < inputs; i++) {
 		values[i] = kasprintf(GFP_KERNEL, "Input %d", i + 1);
+		if (!values[i]) {
+			err = -ENOMEM;
+			goto unlock;
+		}
+	}
 
 	err = snd_ctl_enum_info(uinfo, 1, i,
 				(const char * const *)values);
-- 
2.50.1

