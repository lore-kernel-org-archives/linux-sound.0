Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C186B28D8E1
	for <linux-sound@vger.kernel.org>; Thu, 31 Jul 2025 09:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753953075; cv=none; b=YiwhZkAqv1f5ok9CkuyuW52NY0O9xdNI7E1rCnbLdgTJiSVGSCyhL1QVOT7Xz8QrnSHG0v/YubkVspLW2xQ5VAUqxmwB5ncoouBIufR+rv7eKt4A7t7eLE15DLc/Br73qPCS37JLCvKfo0fOgaxvCtD+qb0zC0ABOOMy8XEeg40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753953075; c=relaxed/simple;
	bh=7HwJeRgwrcUqc4THd+/N4X/eR0iN1ObS6e4CAfdkzcs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pe+di+Y0m1xwhPJRcjHmF87pU2cTi0vKkAxuYzKvSqi8XHl6ybAGWCJMuGYzaQVQRFa3S3twayab4Pq3+RqFPGuXWXXkTAwwhoidAGmuTxFd86R2MqAh4jXc19cl+mdvCoqPqx8lN558NFS4KJnLnVMASTm4BUwMboTR0cqGDNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cY8y4P6o; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=sDgHMX+L; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cY8y4P6o; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=sDgHMX+L; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cY8y4P6o";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sDgHMX+L";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cY8y4P6o";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sDgHMX+L"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E6F721F45A;
	Thu, 31 Jul 2025 09:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1753953071; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=rW6n9M+yh8MV8+LPpsvcTBbrcIHEHhQf4dAmjiUqA4M=;
	b=cY8y4P6oEUaQ94YU37U9bCHPGp5w5pw4KWt42M5pltLWJWHXMr2tJqYGH9el29xqsKAm3g
	5ABV6BwQdZ9s0KwjF3/z5c1DbhA31bHhgbscTJRENSqw2xtKWWOxlqJLIR5sOjcpJ9zJJJ
	b2QCLov6q+3xMd/gj4imEsEJhIUN1bs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1753953071;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=rW6n9M+yh8MV8+LPpsvcTBbrcIHEHhQf4dAmjiUqA4M=;
	b=sDgHMX+LHuBza9eXBJ9K8WcdGbJlMW2vQPUf5n3f4VnehEkbGyaNZaAhiMDznDW/YZVc5B
	XsbMFYSYahbsS2Bg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1753953071; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=rW6n9M+yh8MV8+LPpsvcTBbrcIHEHhQf4dAmjiUqA4M=;
	b=cY8y4P6oEUaQ94YU37U9bCHPGp5w5pw4KWt42M5pltLWJWHXMr2tJqYGH9el29xqsKAm3g
	5ABV6BwQdZ9s0KwjF3/z5c1DbhA31bHhgbscTJRENSqw2xtKWWOxlqJLIR5sOjcpJ9zJJJ
	b2QCLov6q+3xMd/gj4imEsEJhIUN1bs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1753953071;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=rW6n9M+yh8MV8+LPpsvcTBbrcIHEHhQf4dAmjiUqA4M=;
	b=sDgHMX+LHuBza9eXBJ9K8WcdGbJlMW2vQPUf5n3f4VnehEkbGyaNZaAhiMDznDW/YZVc5B
	XsbMFYSYahbsS2Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C6B5513876;
	Thu, 31 Jul 2025 09:11:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id XrdULy8zi2j6FQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 31 Jul 2025 09:11:11 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] ALSA: hda: Fix arch defconfigs
Date: Thu, 31 Jul 2025 11:11:04 +0200
Message-ID: <20250731091109.16901-1-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWO(0.00)[2];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80

This is a revised patch set for updating the arch defconfigs regarding
the recent HD-audio driver kconfig changes.

Since the updates are only in sound git tree as of now, I'm going to
pick those in sound git tree as well.


Takashi

v1: https://lore.kernel.org/20250731064813.1622-1-tiwai@suse.de
v1->v2: Select all Realtek codecs for loongson, enable most of HDMI
	codecs as well

===

Takashi Iwai (3):
  arm: Update HD-audio configs again
  LoongArch: Update HD-audio codec configs
  mips: Update HD-audio configs again

 arch/arm/configs/multi_v7_defconfig        |  4 +++-
 arch/arm/configs/tegra_defconfig           |  5 +++++
 arch/loongarch/configs/loongson3_defconfig | 15 +++++++++++++++
 arch/mips/configs/loongson2k_defconfig     | 11 +++++++++++
 arch/mips/configs/loongson3_defconfig      | 15 ++++++++++++++-
 5 files changed, 48 insertions(+), 2 deletions(-)

-- 
2.50.1

