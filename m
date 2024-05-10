Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7678120309
	for <linux-sound@vger.kernel.org>; Fri, 10 May 2024 07:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715326609; cv=none; b=QDHnuiEVVhun3mFJJbH9Q3f1YArx75tjTgsaWhytc+O4JxANgRDnoH0SBUskejoSlCtiWBrlvc6b1cKxKyFVwbr/8pA+dqPtUoZMnfaU31iekR8KAGU7sUrWS+Cyc2sbKSHKCLFA8C+mdoAEBldmIBzGP/V6GUjXVvuGS3TGBaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715326609; c=relaxed/simple;
	bh=rFniTbdxJv9J4xb0eLRjarxQmcqC0EDI5w2ya/aWCoo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vb0g9B4+bV68+KwNiQmBoRDpumhjQW/SZWcVd9TnOgJ1qzWnkb0Dky8Fm+NFf/1qHeu8tyUwB5Lk06OOR8xgwuvdW68vElkvHA/adlP8Iyk2cb5l4T9KwKVhVeX34a2HfjxjP2cab6ihGuw1gKqkbTJlaZUUGArmI65fUsGDeWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=An91gEvY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=OfNDs0Yf; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=An91gEvY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=OfNDs0Yf; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="An91gEvY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OfNDs0Yf";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="An91gEvY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OfNDs0Yf"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6A0C03E8E8;
	Fri, 10 May 2024 07:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715326606; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=m9QgMGuU78DPcf5YY6y/wkmwMn+npUgIXk7mBA7g474=;
	b=An91gEvYQ836Ldqv2UsbuwcdIqVFfiFxjaO9Qn4Bx8tBa3my7UQP/hmk8831mEI5moVl6j
	pPkX6gnnOaPcLwnBA1lVhbRjKbV9H92wQT4fiBN3kzglTXpGG14ForC3zs4sQZuasrB1/r
	UPau/QWFsdRsgJ1Uv3YwUrrEhPosi+E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715326606;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=m9QgMGuU78DPcf5YY6y/wkmwMn+npUgIXk7mBA7g474=;
	b=OfNDs0YfQ7+FAQtQPHS0u74uc9ZbljOrSpyw+RgpiuYNMDrLz9jQQPzRSu5QiphdZ86Zek
	pIvgJTgPxm6VX7Cw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715326606; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=m9QgMGuU78DPcf5YY6y/wkmwMn+npUgIXk7mBA7g474=;
	b=An91gEvYQ836Ldqv2UsbuwcdIqVFfiFxjaO9Qn4Bx8tBa3my7UQP/hmk8831mEI5moVl6j
	pPkX6gnnOaPcLwnBA1lVhbRjKbV9H92wQT4fiBN3kzglTXpGG14ForC3zs4sQZuasrB1/r
	UPau/QWFsdRsgJ1Uv3YwUrrEhPosi+E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715326606;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=m9QgMGuU78DPcf5YY6y/wkmwMn+npUgIXk7mBA7g474=;
	b=OfNDs0YfQ7+FAQtQPHS0u74uc9ZbljOrSpyw+RgpiuYNMDrLz9jQQPzRSu5QiphdZ86Zek
	pIvgJTgPxm6VX7Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3DD88139AA;
	Fri, 10 May 2024 07:36:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id obWRDY7OPWZVFAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 10 May 2024 07:36:46 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH] ASoC: SOF: amd: Fix build error with built-in config
Date: Fri, 10 May 2024 09:36:54 +0200
Message-ID: <20240510073656.23491-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,auug.org.au:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_TLS_ALL(0.00)[]

Makefile in AMD ACP driver has a line substitution with "=" instead of
"+="; this overrides the preexisting item, hence it broke the build
after the recent change to replace *-objs with *-y.

This patch corrects the line.

Fixes: 1a74b21ce59f ("ASoC: SOF: amd: Add Probe functionality support for amd platforms.")
Fixes: 9c2f5b6eb8b7 ("ASoC: SOF: Use *-y instead of *-objs in Makefile")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/r/20240510170305.03b67d9f@canb.auug.org.au
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/sof/amd/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/amd/Makefile b/sound/soc/sof/amd/Makefile
index 380a9769c321..d1424c09172d 100644
--- a/sound/soc/sof/amd/Makefile
+++ b/sound/soc/sof/amd/Makefile
@@ -5,7 +5,7 @@
 # Copyright(c) 2021, 2023 Advanced Micro Devices, Inc. All rights reserved.
 
 snd-sof-amd-acp-y := acp.o acp-loader.o acp-ipc.o acp-pcm.o acp-stream.o acp-trace.o acp-common.o
-snd-sof-amd-acp-$(CONFIG_SND_SOC_SOF_ACP_PROBES) = acp-probes.o
+snd-sof-amd-acp-$(CONFIG_SND_SOC_SOF_ACP_PROBES) += acp-probes.o
 snd-sof-amd-renoir-y := pci-rn.o renoir.o
 snd-sof-amd-rembrandt-y := pci-rmb.o rembrandt.o
 snd-sof-amd-vangogh-y := pci-vangogh.o vangogh.o
-- 
2.43.0

