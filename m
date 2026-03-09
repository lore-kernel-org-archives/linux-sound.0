Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E349DAD5A
	for <linux-sound@vger.kernel.org>; Mon,  9 Mar 2026 10:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773053199; cv=none; b=T9h/zO1W7nc8J3ijfuT3azE9AFECeLK0otmmIgxOSIH34uyyETs6JWol79ToeSTYbd6FIW5BK16DrdOZOvdIq0sQPjr18sB/q0mqnLxxPXNk8VQGkSSW2wD54Tihe5vVjJDhlvry0xbaA5Z6WhLUeq93i/LX4lnJ4cMa5E73KIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773053199; c=relaxed/simple;
	bh=hDKx4pd/kHaAfGQIYq18KjAOJN2FXtLSnI8oPtW14II=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U0pHSXsVInqgLjCAY7V7w8cqgyHWtIFKQXJdCVvNnz5AvJIg6eNVHDI57xXk5rwP7RYar2aR91H8u6gpZDMriP9CqZVs+wfh6cvf0zjpWi8/+BHLhxSeZmw8uU8LzeghNijnia7SwfLxiIL/r9v0IXK/A1ZW1yEKIlWGIB9M3/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vnxxzCp9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vKzJ/SUH; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vnxxzCp9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vKzJ/SUH; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vnxxzCp9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vKzJ/SUH";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vnxxzCp9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vKzJ/SUH"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0296F4D216;
	Mon,  9 Mar 2026 10:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773053196; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=IwBiSXDvb8/CfihF5UWo8RJB1b4Xx7mPTsGIO1EEk7Q=;
	b=vnxxzCp9JYmzX8SKxweSR6dJ4oirCoMfGExjbKwa5ePji2rPwPxLujuo+HnW1ZfE9WRyZt
	TnSZze+pdePueXPbWLCj51+MdqC08l5KFV40ecNOgylx/mCUSbw0wlyQSpzTArq0XasXA5
	I7cirVnRCFgr9HnpjiyAm160CrHHpwE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773053196;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=IwBiSXDvb8/CfihF5UWo8RJB1b4Xx7mPTsGIO1EEk7Q=;
	b=vKzJ/SUHwh27hadbL4LuQ8MfHi3Cmu3Nthv0sLDPYQgUW4Oysr/q+3SiA7OYkWw9Ri3ZLv
	eL61bt1ovwCUi1BQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=vnxxzCp9;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="vKzJ/SUH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773053196; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=IwBiSXDvb8/CfihF5UWo8RJB1b4Xx7mPTsGIO1EEk7Q=;
	b=vnxxzCp9JYmzX8SKxweSR6dJ4oirCoMfGExjbKwa5ePji2rPwPxLujuo+HnW1ZfE9WRyZt
	TnSZze+pdePueXPbWLCj51+MdqC08l5KFV40ecNOgylx/mCUSbw0wlyQSpzTArq0XasXA5
	I7cirVnRCFgr9HnpjiyAm160CrHHpwE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773053196;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=IwBiSXDvb8/CfihF5UWo8RJB1b4Xx7mPTsGIO1EEk7Q=;
	b=vKzJ/SUHwh27hadbL4LuQ8MfHi3Cmu3Nthv0sLDPYQgUW4Oysr/q+3SiA7OYkWw9Ri3ZLv
	eL61bt1ovwCUi1BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D02653EE66;
	Mon,  9 Mar 2026 10:46:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 47WVMQulrmniTgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 09 Mar 2026 10:46:35 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Edward Adam Davis <eadavis@qq.com>,
	"Geoffrey D . Bennett" <g@b4.vu>
Subject: [PATCH] ALSA: usb-audio: Check endpoint numbers at parsing Scarlett2 mixer interfaces
Date: Mon,  9 Mar 2026 11:46:27 +0100
Message-ID: <20260309104632.141895-1-tiwai@suse.de>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_CC(0.00)[qq.com,b4.vu];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_THREE(0.00)[3];
	FREEMAIL_ENVRCPT(0.00)[qq.com]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 0296F4D216

The Scarlett2 mixer quirk in USB-audio driver may hit a NULL
dereference when a malformed USB descriptor is passed, since it
assumes the presence of an endpoint in the parsed interface in
scarlett2_find_fc_interface(), as reported by fuzzer.

For avoiding the NULL dereference, just add the sanity check of
bNumEndpoints and skip the invalid interface.

Reported-by: syzbot+8f29539ef9a1c8334f42@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/69acbbe1.050a0220.310d8.0001.GAE@google.com
Reported-by: syzbot+ae893a8901067fde2741@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/69acf72a.050a0220.310d8.0004.GAE@google.com
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/mixer_scarlett2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index ef3150581eab..fd1fb668929a 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -8251,6 +8251,8 @@ static int scarlett2_find_fc_interface(struct usb_device *dev,
 
 		if (desc->bInterfaceClass != 255)
 			continue;
+		if (desc->bNumEndpoints < 1)
+			continue;
 
 		epd = get_endpoint(intf->altsetting, 0);
 		private->bInterfaceNumber = desc->bInterfaceNumber;
-- 
2.53.0

