Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB6221A453
	for <linux-sound@vger.kernel.org>; Thu,  9 Jan 2025 16:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736439804; cv=none; b=Vfdflhojy687/9Jgg4UryhtxYPw6iCUATO42uVW6kgv8msGsxHi5okpmWdqPnW8dH8YF/aph/+pQ4+VNbfOSU4SKTop1bTl/3hEdkgEX2VExRuUBtxBK6ukG5epqkh1nePuVzeWGhiLbzPQEyvZpJoR2A7vhc8zQkjAItHAO+Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736439804; c=relaxed/simple;
	bh=v2w/A4NSwBg2h/6NI0HADQLN6eX6RF73ibJqFKBjlxA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SWD+xHe0axdUbbumNTdmj3JMwTYB9Puj8vPa7653qr5p9XDAHSJKsu5beqJkZWgBQ6yVtc6U3qiWO1PWZS0VXoJZ2oVuGkkkqg9OIGwG7Ulwd1s+Hrjplhh8xX4+cbUmb0bkRJVPlc68+oYpV8clRNt3u9FJnF3X5WPAotlYczo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ogx1uvA6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=quub8SAw; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fk5tkhC6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pfpDuWxA; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ogx1uvA6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="quub8SAw";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fk5tkhC6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pfpDuWxA"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8A43A1F394;
	Thu,  9 Jan 2025 16:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736439801; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=6dLo+C63JSyrHwqhDD0qMyUXeEoDjKflb2AqhROp7zY=;
	b=ogx1uvA6/vGySv3udIIuN4Y7YdCq7HuEsh/x1DmVZPFPd105jwjJ5iB+KOiMHaB3B+op2H
	fWI73KmiDseJl79uoRwEE+XCbtcnjGbOKMSFPuigEKoLH1Rj+kDpqz2mNfXL+JvrjweqlU
	KtIM17jt+eUxAczPFwPn1ByMPA9crMI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736439801;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=6dLo+C63JSyrHwqhDD0qMyUXeEoDjKflb2AqhROp7zY=;
	b=quub8SAwV9XlB9NfiWIXE+61e/zd3oreeB209eTKeZz1vgAJxDrYUh8BGI8tlh+6CGmp8i
	bPlV6Dprs++C//BA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=fk5tkhC6;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=pfpDuWxA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736439800; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=6dLo+C63JSyrHwqhDD0qMyUXeEoDjKflb2AqhROp7zY=;
	b=fk5tkhC6llH9B3sEgagcHcTUa7FAZyfHIaBiNIuRamqxjzUcAW5YEDx/Lv8lwToBzAtIZQ
	clWjU/jhAJ+u6vbSoStSmdgWAONpqmvAc6BLbKj24M76xDdeYz71vzxvhdV5hGGgy792Bq
	OJwVy3zHEjhaY4s9ulNDG20tl2FOzkY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736439800;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=6dLo+C63JSyrHwqhDD0qMyUXeEoDjKflb2AqhROp7zY=;
	b=pfpDuWxAMkwkQC3M5RFcW7aB0bDsgW+nujL28KySXMn5s5JR1+fEjQBzZ178nyddyN9O1/
	QVKnEArlEoxtLIAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 65FBA139AB;
	Thu,  9 Jan 2025 16:23:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id jyH/Fvj3f2cCBgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 09 Jan 2025 16:23:20 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 0/2] ALSA: trivial cleanups with str_yes_no()
Date: Thu,  9 Jan 2025 17:23:15 +0100
Message-ID: <20250109162318.9172-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 8A43A1F394
X-Spam-Level: 
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
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

Another series of trivial cleanups with the standard helper function.


Takashi

===

Takashi Iwai (2):
  ALSA: hda/realtek: Simplify with str_yes_no()
  ALSA: rme9652: Simplify with str_yes_no()

 sound/pci/hda/patch_realtek.c | 2 +-
 sound/pci/rme9652/rme9652.c   | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

-- 
2.43.0

