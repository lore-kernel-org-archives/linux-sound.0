Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253133FB1F
	for <linux-sound@vger.kernel.org>; Thu, 22 Feb 2024 11:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708600518; cv=none; b=a5nkpn4It5Ciq6GMe5pFCR24fLtV4qq8QHoj3CakqutA2hVnFdp1k3s/UkXmJIHn6gO72iKuOAoM3V8rvSfp6uTaqa4wGXUt3cuqN3Py//YX1ZYLd54h+S+oJGrKBOJHQnjFfa+susYQyu+leF8ljO4pE13RbxL1r2glw3fhPQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708600518; c=relaxed/simple;
	bh=/mQ8ZyRt031SOhgozimu6zGwadtj4OpcEAS1Goeb+cw=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=OarQ9SQkmCF0J80i8a60IoFEXrmMqTlaCrZSA1YrYeZZyXMTpqm1ZRkuhmk0QnVHHy//Lr05sVHJw3QURlirp7wV9lr2ZoLPMaCzlOScynvwnrFI2RYLiBEBqAU+BHGTOG5CpkgD84u2eAa4Oz02baXeEwz6B4pJlo47rgO32Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=L6uCF7++; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=boFbw5Ly; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=L6uCF7++; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=boFbw5Ly; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="L6uCF7++";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="boFbw5Ly";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="L6uCF7++";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="boFbw5Ly"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 53D351F457;
	Thu, 22 Feb 2024 11:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708600515; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Ouc3lNGSuGQiGtBIBs95oseihJ4e9h+H8RTTdKtYrwU=;
	b=L6uCF7++6f6IZPTWNWMSnOGnBZFyeYVaL1Gmk0NYXefs97KhOy2auzIMKFOCnhJIQyO2na
	oqDZiT1oYQTSNzheEgBlYf/L168krFM4JDaFYcjbJLkt1cDBC7tSpqzrj3MpsTjmaUotbl
	U+8Y26Tl9/7HQvDDdbqTpMJUHMKy3Ho=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708600515;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Ouc3lNGSuGQiGtBIBs95oseihJ4e9h+H8RTTdKtYrwU=;
	b=boFbw5Ly8847c0XvDEj/cQg6gbCrxyMs3GF7G6uI+M0wWFdrlhcsSay3QHqrkPiVKrK7Ox
	BzUTCO/einuKxECA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708600515; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Ouc3lNGSuGQiGtBIBs95oseihJ4e9h+H8RTTdKtYrwU=;
	b=L6uCF7++6f6IZPTWNWMSnOGnBZFyeYVaL1Gmk0NYXefs97KhOy2auzIMKFOCnhJIQyO2na
	oqDZiT1oYQTSNzheEgBlYf/L168krFM4JDaFYcjbJLkt1cDBC7tSpqzrj3MpsTjmaUotbl
	U+8Y26Tl9/7HQvDDdbqTpMJUHMKy3Ho=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708600515;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Ouc3lNGSuGQiGtBIBs95oseihJ4e9h+H8RTTdKtYrwU=;
	b=boFbw5Ly8847c0XvDEj/cQg6gbCrxyMs3GF7G6uI+M0wWFdrlhcsSay3QHqrkPiVKrK7Ox
	BzUTCO/einuKxECA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3932F13A8C;
	Thu, 22 Feb 2024 11:15:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id tlfLDMMs12UFGgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 22 Feb 2024 11:15:15 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 0/9] ALSA: Use automatic cleanup of kfree()
Date: Thu, 22 Feb 2024 12:15:00 +0100
Message-Id: <20240222111509.28390-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=L6uCF7++;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=boFbw5Ly
X-Spamd-Result: default: False [4.69 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 FROM_HAS_DN(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_DN_NONE(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_ONE(0.00)[1];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.00)[42.86%]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: 4.69
X-Rspamd-Queue-Id: 53D351F457
X-Spam-Level: ****
X-Spam-Flag: NO
X-Spamd-Bar: ++++

Hi,

this is a series of patches for ALSA core code to use the new cleanup
mechanism for temporary buffers.
Merely a cleanup using cleanup, no functional changes.
I confirmed that there is no significant resultant size grow by this,
too.


Takashi

===

Takashi Iwai (9):
  ALSA: pcm: Use automatic cleanup of kfree()
  ALSA: control: Use automatic cleanup of kfree()
  ALSA: compress_offload: Use automatic cleanup of kfree()
  ALSA: timer: Use automatic cleanup of kfree()
  ALSA: vmaster: Use automatic cleanup of kfree()
  ALSA: seq: oss: Use automatic cleanup of kfree()
  ALSA: seq: virmidi: Use automatic cleanup of kfree()
  ALSA: seq: ump: Use automatic cleanup of kfree()
  ALSA: seq: core: Use automatic cleanup of kfree()

 sound/core/compress_offload.c     | 36 ++++-------
 sound/core/control.c              | 23 +++----
 sound/core/control_compat.c       | 69 ++++++++-------------
 sound/core/pcm.c                  |  4 +-
 sound/core/pcm_compat.c           | 29 ++++-----
 sound/core/pcm_native.c           | 99 ++++++++++++-------------------
 sound/core/seq/oss/seq_oss_init.c | 15 ++---
 sound/core/seq/oss/seq_oss_midi.c | 11 +---
 sound/core/seq/seq_compat.c       | 12 ++--
 sound/core/seq/seq_midi.c         | 14 +----
 sound/core/seq/seq_ump_client.c   | 33 ++++-------
 sound/core/seq/seq_virmidi.c      | 22 +++----
 sound/core/timer.c                | 13 ++--
 sound/core/vmaster.c              | 19 ++----
 14 files changed, 142 insertions(+), 257 deletions(-)

-- 
2.35.3

