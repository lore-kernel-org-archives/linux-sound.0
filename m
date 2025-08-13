Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8608A23ABB0
	for <linux-sound@vger.kernel.org>; Wed, 13 Aug 2025 15:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755099393; cv=none; b=VC7xUgIpxiPJ60K0oTr9J7NEo8pyOGURq6EBeZ69/6s69INZiWyBj2Oqjc4K7UxMjZCXx/epUAHyYu3yxiiLbJ0VyhN0L/ow54GqHj8rn+YP4I6sJIRL3X3+VP2noGNIl93q04ebxOmf5cQ3A2YVjidqKC6LG/CmO/ZdI4uhqR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755099393; c=relaxed/simple;
	bh=a/bUnC8Bleao9kvBrf2BovTL0s8jGe8y1cxbk/HYakM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=pVBCL62HUrhRnBTL2+M7ceYQ7pjlZuGsRj+lFlUXez/ZeEA6dzfOHRffjIdwBkbKw9o8+xgYwPADzfn9NCXCOcY8mxYgNeRuMhgJeTHFRkji/qPuRD1SAnDthj0wjfWUrCuL8GKkM/kW0iq/1xmjU+xsJKenbCEEsYBESLljuRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KZumD8CM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3RHgOKS8; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KZumD8CM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3RHgOKS8; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KZumD8CM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3RHgOKS8";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KZumD8CM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3RHgOKS8"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id AD93221A9A;
	Wed, 13 Aug 2025 15:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755099389; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=IDNDkw6GRhjDe5raaMBdogo2iSpjSyisvigY3uZn/AE=;
	b=KZumD8CMXVfoFo2NrgWDaZklW5T6mrwqydxXGp6oJYCf/+AFIXr+CeIt6UFI8QgeyqdTqr
	trHjVYOsCVv7uLr8MZhoq1D714bHsOnqi6940NRC2BhqXhTlguP7qE3fRbBZuq44Zvnkt6
	WXPidFWUrqENvOoD72hJMQO8RB9A3Y0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755099389;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=IDNDkw6GRhjDe5raaMBdogo2iSpjSyisvigY3uZn/AE=;
	b=3RHgOKS8JuKgJftHzhaz0HEKvwHtwikUIHCZWm2W0+W+0aYxjLGPauEakutqGPyfcHhwJa
	7Ad2QUPFb0wT9+Bg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1755099389; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=IDNDkw6GRhjDe5raaMBdogo2iSpjSyisvigY3uZn/AE=;
	b=KZumD8CMXVfoFo2NrgWDaZklW5T6mrwqydxXGp6oJYCf/+AFIXr+CeIt6UFI8QgeyqdTqr
	trHjVYOsCVv7uLr8MZhoq1D714bHsOnqi6940NRC2BhqXhTlguP7qE3fRbBZuq44Zvnkt6
	WXPidFWUrqENvOoD72hJMQO8RB9A3Y0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1755099389;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=IDNDkw6GRhjDe5raaMBdogo2iSpjSyisvigY3uZn/AE=;
	b=3RHgOKS8JuKgJftHzhaz0HEKvwHtwikUIHCZWm2W0+W+0aYxjLGPauEakutqGPyfcHhwJa
	7Ad2QUPFb0wT9+Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8F47413479;
	Wed, 13 Aug 2025 15:36:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id nSqyIf2wnGgeBAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 13 Aug 2025 15:36:29 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: azt3328: Put __maybe_unused for inline functions for gameport
Date: Wed, 13 Aug 2025 17:36:27 +0200
Message-ID: <20250813153628.12303-1-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
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
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80

Some inline functions are unused depending on kconfig, and the recent
change for clang builds made those handled as errors with W=1.
For avoiding pitfalls, mark those with __maybe_unused attributes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/azt3328.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/pci/azt3328.c b/sound/pci/azt3328.c
index c3bfccb4c468..6cdf76e2b7d2 100644
--- a/sound/pci/azt3328.c
+++ b/sound/pci/azt3328.c
@@ -412,25 +412,25 @@ snd_azf3328_ctrl_outl(const struct snd_azf3328 *chip, unsigned reg, u32 value)
 	outl(value, chip->ctrl_io + reg);
 }
 
-static inline void
+static inline void __maybe_unused
 snd_azf3328_game_outb(const struct snd_azf3328 *chip, unsigned reg, u8 value)
 {
 	outb(value, chip->game_io + reg);
 }
 
-static inline void
+static inline void __maybe_unused
 snd_azf3328_game_outw(const struct snd_azf3328 *chip, unsigned reg, u16 value)
 {
 	outw(value, chip->game_io + reg);
 }
 
-static inline u8
+static inline u8 __maybe_unused
 snd_azf3328_game_inb(const struct snd_azf3328 *chip, unsigned reg)
 {
 	return inb(chip->game_io + reg);
 }
 
-static inline u16
+static inline u16 __maybe_unused
 snd_azf3328_game_inw(const struct snd_azf3328 *chip, unsigned reg)
 {
 	return inw(chip->game_io + reg);
-- 
2.50.1

