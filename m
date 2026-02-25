Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F75F31B830
	for <linux-sound@vger.kernel.org>; Wed, 25 Feb 2026 08:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772009563; cv=none; b=FL3PQ0ecfzt7izH8pwPnXHaf3gmbaKdwqGMaekqxZtjJTObJTi1SMOFcg+h4oPtsYkHx4xW9dYbAUDHJLC89rcNfDd6VnIYVbdRU7r5dLpJGgL9kHDbb4lnv/AKIbynUU3Z1dr42FFW8NDimHuhr2GaRKvW1q2YXCYuow6XyQZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772009563; c=relaxed/simple;
	bh=oQF/8BkXCsQQMNUyLnqiRQ3A3VkWGMjEMn4YkaNWuMo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=nF5nuXizkpRCTwgIX2ZhEgVF+MMPju2ZBrx8N+8FyO8mY/XDn/q9qQ0rlOrDQaEqljxSDIJ4KlZUmrsV7rUzLAJujJPhrvgRRsbnbYA2kokiRtNX1C4lyX7rONPhCNqX2qzK42FfweiXNRODQJRIRMUl7WST5CC0AnwvD/+Jb94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wyQghK7Z; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hxJPcuEU; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wyQghK7Z; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hxJPcuEU; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wyQghK7Z";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hxJPcuEU";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wyQghK7Z";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hxJPcuEU"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 39AA23F6F6;
	Wed, 25 Feb 2026 08:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772009555; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=3Xh2dmF/hHECjO+jISOmpwfAQG1CR3mFclyLYAGDp/4=;
	b=wyQghK7Zi4cuxxpQSTxZieAa6ELpe6V0AUJ/l+rlHngrK/KpHvmohZCjfiqITXTuEu6FP0
	UvqUpUlLkX4K8L5XLqwEW0lZVE5AaXNvd0TWsZKWCLwyYyH+qzUkHMJFha6Txl7P7BD73A
	vBMJe4surlavFhDgQnF+dn6f0/WqxGw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772009555;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=3Xh2dmF/hHECjO+jISOmpwfAQG1CR3mFclyLYAGDp/4=;
	b=hxJPcuEUdXhR4KLKXqo1bUqOb9/yQUu23Ve3990mvv8m0bQf0NVGiYFIMv1+ziO8PPwaE3
	EFlr6O086U2XxPBg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=wyQghK7Z;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=hxJPcuEU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772009555; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=3Xh2dmF/hHECjO+jISOmpwfAQG1CR3mFclyLYAGDp/4=;
	b=wyQghK7Zi4cuxxpQSTxZieAa6ELpe6V0AUJ/l+rlHngrK/KpHvmohZCjfiqITXTuEu6FP0
	UvqUpUlLkX4K8L5XLqwEW0lZVE5AaXNvd0TWsZKWCLwyYyH+qzUkHMJFha6Txl7P7BD73A
	vBMJe4surlavFhDgQnF+dn6f0/WqxGw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772009555;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=3Xh2dmF/hHECjO+jISOmpwfAQG1CR3mFclyLYAGDp/4=;
	b=hxJPcuEUdXhR4KLKXqo1bUqOb9/yQUu23Ve3990mvv8m0bQf0NVGiYFIMv1+ziO8PPwaE3
	EFlr6O086U2XxPBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 154DE3EA65;
	Wed, 25 Feb 2026 08:52:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id CREgA1O4nmlTcgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 25 Feb 2026 08:52:35 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 0/4] ALSA: usb-audio: some more fixes
Date: Wed, 25 Feb 2026 09:52:27 +0100
Message-ID: <20260225085233.316306-1-tiwai@suse.de>
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
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_ONE(0.00)[1];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	TO_DN_NONE(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 39AA23F6F6

The packet sizes may be limited by the device or the controller than
expected, but the current driver code ignores the limit in some cases.
This results in an error from USB core at submitting URBs.

Also, a device DIYNHK USB Audio 2.0 showed such a reduced packet size
for 24/32 bit format, although it declares to be an implicit feedback.
This doesn't work because of the implicit feedback mechanism.
Since the device itself has been working even before the implicit fb
is used, so we can safely assume that we can skip the implicit fb for
this device.

Last but not least, there was an overlook in the previous conversion
for inclusive terms, and fixed now.


Takashi

===

Takashi Iwai (4):
  ALSA: usb-audio: Cap the packet size pre-calculations
  ALSA: usb-audio: Check max frame size for implicit feedback mode, too
  ALSA: usb-audio: Avoid implicit feedback mode on DIYINHK USB Audio 2.0
  ALSA: usb-audio: Use inclusive terms

 sound/usb/endpoint.c | 10 +++++++---
 sound/usb/quirks.c   |  2 ++
 2 files changed, 9 insertions(+), 3 deletions(-)

-- 
2.53.0

