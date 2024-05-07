Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 200D016DEB4
	for <linux-sound@vger.kernel.org>; Tue,  7 May 2024 15:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715097335; cv=none; b=ROceSNofy6JUzw5p+E2r1Z3zNb7rNtFClUngORL9hkHuzQBCnl88OaInoK3Jm/UjaJlz0VVqpH8OdflGo+M6gLV7SSB1NxdVqrVxTIRgurtP5oUdK47M9b3V8AaSBbxeUpdLWQzENtyZ2V4Gwant6OxhumXbFGLzREVgEmj6shE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715097335; c=relaxed/simple;
	bh=2VzBqHLn7k9WWjfgOeVAQVnLTtNV/GtI9EN9/4+FKt4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gkc8F19H5WYOsQZbvo68LZklnQTrP6B+sb7gcRqUTKlrqsFKe1OnNtTfJjHOEhDv9Ey86LCTzGJ8hg3f6FuklEdjDy6MohP3WgPcxQzBTk/VSXnxn5deVPQH2QnXrvRQL+JzFC74jPx8xWZVIZ6Lkm4A7qkWwhave8rriheZsZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ze0cqeio; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6k9qJBCs; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ze0cqeio; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6k9qJBCs; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ze0cqeio";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6k9qJBCs";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ze0cqeio";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6k9qJBCs"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8967F21CBE;
	Tue,  7 May 2024 15:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715097330; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JG67kNB8JKaSIbc+Jw94OCcObvWxW3YhRIPBPpvrDt0=;
	b=Ze0cqeiodG9HBJO6cZQcBh7329spVVHjMyKNx6dScD485ns2io/wwOt+2pCWIQzb6qYov/
	xn5FB2REg7Dr+1knJNBvzQMFzscrUQpnyY0ZYb8YNJ3dPaMcVXLo8k7JOUY7S5USc5OVZn
	QEiOg+ytYVByqQKfbrPlZJPNBN591LU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715097330;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JG67kNB8JKaSIbc+Jw94OCcObvWxW3YhRIPBPpvrDt0=;
	b=6k9qJBCshWTyf3uV0/gvXKi8bY5F7BM0zh/uLRJZaMlnGgoLJwQFwa/92vu4N4QMJoiPgJ
	3JeBLYBtEYS0UtAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715097330; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JG67kNB8JKaSIbc+Jw94OCcObvWxW3YhRIPBPpvrDt0=;
	b=Ze0cqeiodG9HBJO6cZQcBh7329spVVHjMyKNx6dScD485ns2io/wwOt+2pCWIQzb6qYov/
	xn5FB2REg7Dr+1knJNBvzQMFzscrUQpnyY0ZYb8YNJ3dPaMcVXLo8k7JOUY7S5USc5OVZn
	QEiOg+ytYVByqQKfbrPlZJPNBN591LU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715097330;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JG67kNB8JKaSIbc+Jw94OCcObvWxW3YhRIPBPpvrDt0=;
	b=6k9qJBCshWTyf3uV0/gvXKi8bY5F7BM0zh/uLRJZaMlnGgoLJwQFwa/92vu4N4QMJoiPgJ
	3JeBLYBtEYS0UtAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 69EE313A3A;
	Tue,  7 May 2024 15:55:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id WARZGPJOOmaNXQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 07 May 2024 15:55:30 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 01/34] ASoC: core: Use *-y instead of *-objs in Makefile
Date: Tue,  7 May 2024 17:55:05 +0200
Message-ID: <20240507155540.24815-2-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240507155540.24815-1-tiwai@suse.de>
References: <20240507155540.24815-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -6.80
X-Spam-Flag: NO

*-objs suffix is reserved rather for (user-space) host programs while
usually *-y suffix is used for kernel drivers (although *-objs works
for that purpose for now).

Let's correct the old usages of *-objs in Makefiles.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/Makefile | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/Makefile b/sound/soc/Makefile
index f90f5300b36e..fd61847dd1eb 100644
--- a/sound/soc/Makefile
+++ b/sound/soc/Makefile
@@ -1,14 +1,14 @@
 # SPDX-License-Identifier: GPL-2.0
-snd-soc-core-objs := soc-core.o soc-dapm.o soc-jack.o soc-utils.o soc-dai.o soc-component.o
-snd-soc-core-objs += soc-pcm.o soc-devres.o soc-ops.o soc-link.o soc-card.o
+snd-soc-core-y := soc-core.o soc-dapm.o soc-jack.o soc-utils.o soc-dai.o soc-component.o
+snd-soc-core-y += soc-pcm.o soc-devres.o soc-ops.o soc-link.o soc-card.o
 snd-soc-core-$(CONFIG_SND_SOC_COMPRESS) += soc-compress.o
 
 ifneq ($(CONFIG_SND_SOC_TOPOLOGY),)
-snd-soc-core-objs += soc-topology.o
+snd-soc-core-y += soc-topology.o
 endif
 
 ifneq ($(CONFIG_SND_SOC_TOPOLOGY_KUNIT_TEST),)
-# snd-soc-test-objs := soc-topology-test.o
+# snd-soc-test-y := soc-topology-test.o
 obj-$(CONFIG_SND_SOC_TOPOLOGY_KUNIT_TEST) += soc-topology-test.o
 endif
 
@@ -17,20 +17,20 @@ obj-$(CONFIG_SND_SOC_CARD_KUNIT_TEST) += soc-card-test.o
 endif
 
 ifneq ($(CONFIG_SND_SOC_UTILS_KUNIT_TEST),)
-# snd-soc-test-objs := soc-utils-test.o
+# snd-soc-test-y := soc-utils-test.o
 obj-$(CONFIG_SND_SOC_UTILS_KUNIT_TEST) += soc-utils-test.o
 endif
 
 ifneq ($(CONFIG_SND_SOC_GENERIC_DMAENGINE_PCM),)
-snd-soc-core-objs += soc-generic-dmaengine-pcm.o
+snd-soc-core-y += soc-generic-dmaengine-pcm.o
 endif
 
 ifneq ($(CONFIG_SND_SOC_AC97_BUS),)
-snd-soc-core-objs += soc-ac97.o
+snd-soc-core-y += soc-ac97.o
 endif
 
 ifneq ($(CONFIG_SND_SOC_ACPI),)
-snd-soc-acpi-objs := soc-acpi.o
+snd-soc-acpi-y := soc-acpi.o
 endif
 
 obj-$(CONFIG_SND_SOC_ACPI) += snd-soc-acpi.o
-- 
2.43.0

