Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532901FEFDF
	for <linux-sound@vger.kernel.org>; Wed, 13 Nov 2024 11:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731496255; cv=none; b=g87PPKgqPJXoSZHvHo6nnmoUmB7MkYH81ZuLGM1itrR7cmMbL2hdoWaZGGzQ0m1qiTvKqOdEuoHgmMSnQQX0HuqSFVTsAkTLjrBOwpX91ezX9gUFx0BZD/naO2xIt0scDGWlenpI95bwPnQ6py20m4BiNRrBgLz7jAkljoL99WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731496255; c=relaxed/simple;
	bh=SHFRqUBjU4SvvOhAbHK9FlcP6pDBs1xP/EGXgCblm+s=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QRzVO5UMyivmgm1dg+AUFH6wwkJK4Vfge2anyDnKpSEZt+d+wPvgUwAE0AEvYncnFc73pHxkXVPhxJLq1Ri7j5Orwkxf9RjLiyTZGt96tpnC1TEcl18bR/1YcPZVCQ2h6piG1wzPiFJcLKtv1MBeuKeFjNyYLBa7YFZ6/fTNDaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OoNT9188; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5nZNH6L2; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OoNT9188; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5nZNH6L2; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OoNT9188";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5nZNH6L2";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OoNT9188";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5nZNH6L2"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 27DE5211CD;
	Wed, 13 Nov 2024 11:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1731496246; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FEYrPZzHtT3fJElWHZ8R4mXX1v7sCAViocUahfORo98=;
	b=OoNT9188NhmpVIWUYD/g7LrfbjzZtOIP7nyQ1TsInAxzGyf7naWMEzvveKSvmJAkIwPHPq
	yZF5hzNNdACBnAHHamQJvfL+lOEXarRdRhDC/Dcy7CBzZ+cqGu7vkHUOC6QFaKiQXUye+w
	E2wircEAnHv1+it4HPEqBC2XHK8/NPc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1731496246;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FEYrPZzHtT3fJElWHZ8R4mXX1v7sCAViocUahfORo98=;
	b=5nZNH6L2QWxj8GUBIZeb877eZz2HFWIaoFA9b3c5XzgPnJd0kcgXu8xFKYsGh/xx+TD7aV
	6pjzwl71XLr2nkDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1731496246; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FEYrPZzHtT3fJElWHZ8R4mXX1v7sCAViocUahfORo98=;
	b=OoNT9188NhmpVIWUYD/g7LrfbjzZtOIP7nyQ1TsInAxzGyf7naWMEzvveKSvmJAkIwPHPq
	yZF5hzNNdACBnAHHamQJvfL+lOEXarRdRhDC/Dcy7CBzZ+cqGu7vkHUOC6QFaKiQXUye+w
	E2wircEAnHv1+it4HPEqBC2XHK8/NPc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1731496246;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FEYrPZzHtT3fJElWHZ8R4mXX1v7sCAViocUahfORo98=;
	b=5nZNH6L2QWxj8GUBIZeb877eZz2HFWIaoFA9b3c5XzgPnJd0kcgXu8xFKYsGh/xx+TD7aV
	6pjzwl71XLr2nkDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0F36813AE3;
	Wed, 13 Nov 2024 11:10:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id oHtfAjaJNGe3UgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 13 Nov 2024 11:10:46 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 1/5] ALSA: usx2y: Use snd_card_free_when_closed() at disconnection
Date: Wed, 13 Nov 2024 12:10:35 +0100
Message-ID: <20241113111042.15058-2-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241113111042.15058-1-tiwai@suse.de>
References: <20241113111042.15058-1-tiwai@suse.de>
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
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[syzkaller.appspot.com:url,suse.de:email,suse.de:mid];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Flag: NO

The USB disconnect callback is supposed to be short and not too-long
waiting.  OTOH, the current code uses snd_card_free() at
disconnection, but this waits for the close of all used fds, hence it
can take long.  It eventually blocks the upper layer USB ioctls, which
may trigger a soft lockup.

An easy workaround is to replace snd_card_free() with
snd_card_free_when_closed().  This variant returns immediately while
the release of resources is done asynchronously by the card device
release at the last close.

Fixes: 230cd5e24853 ("[ALSA] prevent oops & dead keyboard on usb unplugging while the device is be ing used")
Reported-by: syzbot+73582d08864d8268b6fd@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=73582d08864d8268b6fd
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/usx2y/usbusx2y.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/usx2y/usbusx2y.c b/sound/usb/usx2y/usbusx2y.c
index 2f9cede242b3..5f81c68fd42b 100644
--- a/sound/usb/usx2y/usbusx2y.c
+++ b/sound/usb/usx2y/usbusx2y.c
@@ -422,7 +422,7 @@ static void snd_usx2y_disconnect(struct usb_interface *intf)
 	}
 	if (usx2y->us428ctls_sharedmem)
 		wake_up(&usx2y->us428ctls_wait_queue_head);
-	snd_card_free(card);
+	snd_card_free_when_closed(card);
 }
 
 static int snd_usx2y_probe(struct usb_interface *intf,
-- 
2.43.0

