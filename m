Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C0016DEBA
	for <linux-sound@vger.kernel.org>; Tue,  7 May 2024 15:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715097338; cv=none; b=Vp/IaJUesYPjRThWGtK02sF7Or3oiPzOhjOhllbtZzPQnb8hi1an+yqSLNELQ2hIsJ3fuKTAwJuMEesasenlvjqosZtK49pdzmZOIcIVpL9e6oQQZDfj3zUIWWt9Gdyg3gIEWVKSly2LmPO9kA8Nqv27uFtpSTa/EvC9BZZJKfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715097338; c=relaxed/simple;
	bh=tATBT6/YwJW5ATmcsssGPMTTc7um9KAs0hOv5gi637Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fT2W+niRxCRD0HgqxG+/NZqy/0pU5BFS+DM52UlXUJny4AtOT9J6MKJtw5ez6RHUDiNMMlWNmTUMlyZyqTCDOlc9Ef2Sp8XCItvW/E97V9uu4KIuqWl4uU/jdPSV6rAJpsSWx9zk6a2MSsMOW0+SaIkz2RsjaYB4WUC3/QUMgqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2A49320C96;
	Tue,  7 May 2024 15:55:33 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0923A13A2D;
	Tue,  7 May 2024 15:55:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id uMMFAfVOOmaNXQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 07 May 2024 15:55:33 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 16/34] ASoC: mediatek: Use *-y instead of *-objs in Makefile
Date: Tue,  7 May 2024 17:55:20 +0200
Message-ID: <20240507155540.24815-17-tiwai@suse.de>
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
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: 2A49320C96
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action

*-objs suffix is reserved rather for (user-space) host programs while
usually *-y suffix is used for kernel drivers (although *-objs works
for that purpose for now).

Let's correct the old usages of *-objs in Makefiles.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/mediatek/common/Makefile | 4 ++--
 sound/soc/mediatek/mt2701/Makefile | 2 +-
 sound/soc/mediatek/mt6797/Makefile | 2 +-
 sound/soc/mediatek/mt7986/Makefile | 2 +-
 sound/soc/mediatek/mt8183/Makefile | 2 +-
 sound/soc/mediatek/mt8186/Makefile | 2 +-
 sound/soc/mediatek/mt8188/Makefile | 2 +-
 sound/soc/mediatek/mt8192/Makefile | 2 +-
 sound/soc/mediatek/mt8195/Makefile | 2 +-
 9 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/sound/soc/mediatek/common/Makefile b/sound/soc/mediatek/common/Makefile
index 363cc258a3d5..c90d276cf4ed 100644
--- a/sound/soc/mediatek/common/Makefile
+++ b/sound/soc/mediatek/common/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 # platform driver
-snd-soc-mtk-common-objs := mtk-afe-platform-driver.o mtk-afe-fe-dai.o mtk-dsp-sof-common.o mtk-soundcard-driver.o
-snd-soc-mtk-common-objs += mtk-dai-adda-common.o
+snd-soc-mtk-common-y := mtk-afe-platform-driver.o mtk-afe-fe-dai.o mtk-dsp-sof-common.o mtk-soundcard-driver.o
+snd-soc-mtk-common-y += mtk-dai-adda-common.o
 
 obj-$(CONFIG_SND_SOC_MEDIATEK) += snd-soc-mtk-common.o
 
diff --git a/sound/soc/mediatek/mt2701/Makefile b/sound/soc/mediatek/mt2701/Makefile
index 21d5e697cfa7..507fa26c3945 100644
--- a/sound/soc/mediatek/mt2701/Makefile
+++ b/sound/soc/mediatek/mt2701/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 # platform driver
-snd-soc-mt2701-afe-objs := mt2701-afe-pcm.o mt2701-afe-clock-ctrl.o
+snd-soc-mt2701-afe-y := mt2701-afe-pcm.o mt2701-afe-clock-ctrl.o
 obj-$(CONFIG_SND_SOC_MT2701) += snd-soc-mt2701-afe.o
 
 # machine driver
diff --git a/sound/soc/mediatek/mt6797/Makefile b/sound/soc/mediatek/mt6797/Makefile
index bf6e179ea93f..150021495e94 100644
--- a/sound/soc/mediatek/mt6797/Makefile
+++ b/sound/soc/mediatek/mt6797/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
 # platform driver
-snd-soc-mt6797-afe-objs := \
+snd-soc-mt6797-afe-y := \
 	mt6797-afe-pcm.o \
 	mt6797-afe-clk.o \
 	mt6797-dai-pcm.o \
diff --git a/sound/soc/mediatek/mt7986/Makefile b/sound/soc/mediatek/mt7986/Makefile
index fc4c82559b29..4b54bbe88683 100644
--- a/sound/soc/mediatek/mt7986/Makefile
+++ b/sound/soc/mediatek/mt7986/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
 # platform driver
-snd-soc-mt7986-afe-objs := \
+snd-soc-mt7986-afe-y := \
 	mt7986-afe-pcm.o \
 	mt7986-dai-etdm.o
 
diff --git a/sound/soc/mediatek/mt8183/Makefile b/sound/soc/mediatek/mt8183/Makefile
index c0a3bbc2c1f6..0d0dcdde00fc 100644
--- a/sound/soc/mediatek/mt8183/Makefile
+++ b/sound/soc/mediatek/mt8183/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
 # platform driver
-snd-soc-mt8183-afe-objs := \
+snd-soc-mt8183-afe-y := \
 	mt8183-afe-pcm.o \
 	mt8183-afe-clk.o \
 	mt8183-dai-i2s.o \
diff --git a/sound/soc/mediatek/mt8186/Makefile b/sound/soc/mediatek/mt8186/Makefile
index fa2f0efce815..ab3f5b763df8 100644
--- a/sound/soc/mediatek/mt8186/Makefile
+++ b/sound/soc/mediatek/mt8186/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
 # platform driver
-snd-soc-mt8186-afe-objs := \
+snd-soc-mt8186-afe-y := \
 	mt8186-afe-pcm.o \
 	mt8186-audsys-clk.o \
 	mt8186-afe-clk.o \
diff --git a/sound/soc/mediatek/mt8188/Makefile b/sound/soc/mediatek/mt8188/Makefile
index 781e61cbb22b..1178bce45c50 100644
--- a/sound/soc/mediatek/mt8188/Makefile
+++ b/sound/soc/mediatek/mt8188/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
 # platform driver
-snd-soc-mt8188-afe-objs := \
+snd-soc-mt8188-afe-y := \
 	mt8188-afe-clk.o \
 	mt8188-afe-pcm.o \
 	mt8188-audsys-clk.o \
diff --git a/sound/soc/mediatek/mt8192/Makefile b/sound/soc/mediatek/mt8192/Makefile
index 8b27d82626ea..d60c36bcdcce 100644
--- a/sound/soc/mediatek/mt8192/Makefile
+++ b/sound/soc/mediatek/mt8192/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
 # platform driver
-snd-soc-mt8192-afe-objs := \
+snd-soc-mt8192-afe-y := \
 	mt8192-afe-pcm.o \
 	mt8192-afe-clk.o \
 	mt8192-afe-gpio.o \
diff --git a/sound/soc/mediatek/mt8195/Makefile b/sound/soc/mediatek/mt8195/Makefile
index aae673ec751b..014e93dace26 100644
--- a/sound/soc/mediatek/mt8195/Makefile
+++ b/sound/soc/mediatek/mt8195/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
 # platform driver
-snd-soc-mt8195-afe-objs := \
+snd-soc-mt8195-afe-y := \
 	mt8195-audsys-clk.o \
 	mt8195-afe-clk.o \
 	mt8195-afe-pcm.o \
-- 
2.43.0

