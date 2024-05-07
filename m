Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFF416EC00
	for <linux-sound@vger.kernel.org>; Tue,  7 May 2024 15:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715097341; cv=none; b=SoREY11wF9JLliYOv/M2+NShBMPnKQFG1OrbJzPtSmv16pJnAgf8+mdkzsdWqJuzn8nfglfKc1gzF0pSH8YtNT8jAWv1RZ0c7dbgzpQ08VG6ZJCKoHpf0Qoo8na9bEux1cZVwi3EQa30e8vPclv+Zk74yons+TyMpFgEMrvxv/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715097341; c=relaxed/simple;
	bh=sYF0mHC88+gSJPbZ8lLa0mrCZr4Zwy9NZtVneQe4Qcs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kCRJtSylz57tDPdaaC3QkE1FXMdRntP5Po3LcjCQFZAiIPX5B69fo7T4Wx3RDh5vOl+zQRGUC35EMeP4nUY8mdZfxx0RgrbO/2nOEJtxah5RuHRzSIgCXHhiwZQP47R3twx2YG16Hi74WlqPtq6aGWYbCOsNMY4Whl1nM5/1cIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1C73A2216F;
	Tue,  7 May 2024 15:55:34 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F0F6813A2D;
	Tue,  7 May 2024 15:55:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gAKoOfVOOmaNXQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 07 May 2024 15:55:33 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 22/34] ASoC: samsung: Use *-y instead of *-objs in Makefile
Date: Tue,  7 May 2024 17:55:26 +0200
Message-ID: <20240507155540.24815-23-tiwai@suse.de>
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
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: 1C73A2216F

*-objs suffix is reserved rather for (user-space) host programs while
usually *-y suffix is used for kernel drivers (although *-objs works
for that purpose for now).

Let's correct the old usages of *-objs in Makefiles.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/samsung/Makefile | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/sound/soc/samsung/Makefile b/sound/soc/samsung/Makefile
index f5d327b90a4e..8d5f09147900 100644
--- a/sound/soc/samsung/Makefile
+++ b/sound/soc/samsung/Makefile
@@ -1,10 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0
 # S3c24XX Platform Support
-snd-soc-s3c-dma-objs := dmaengine.o
-snd-soc-idma-objs := idma.o
-snd-soc-samsung-spdif-objs := spdif.o
-snd-soc-pcm-objs := pcm.o
-snd-soc-i2s-objs := i2s.o
+snd-soc-s3c-dma-y := dmaengine.o
+snd-soc-idma-y := idma.o
+snd-soc-samsung-spdif-y := spdif.o
+snd-soc-pcm-y := pcm.o
+snd-soc-i2s-y := i2s.o
 
 obj-$(CONFIG_SND_SOC_SAMSUNG) += snd-soc-s3c-dma.o
 obj-$(CONFIG_SND_SAMSUNG_SPDIF) += snd-soc-samsung-spdif.o
@@ -13,20 +13,20 @@ obj-$(CONFIG_SND_SAMSUNG_I2S) += snd-soc-i2s.o
 obj-$(CONFIG_SND_SAMSUNG_I2S) += snd-soc-idma.o
 
 # S3C24XX Machine Support
-snd-soc-smdk-wm8994-objs := smdk_wm8994.o
-snd-soc-snow-objs := snow.o
-snd-soc-smdk-spdif-objs := smdk_spdif.o
-snd-soc-smdk-wm8994pcm-objs := smdk_wm8994pcm.o
-snd-soc-speyside-objs := speyside.o
-snd-soc-tobermory-objs := tobermory.o
-snd-soc-lowland-objs := lowland.o
-snd-soc-littlemill-objs := littlemill.o
-snd-soc-bells-objs := bells.o
-snd-soc-odroid-objs := odroid.o
-snd-soc-arndale-objs := arndale.o
-snd-soc-tm2-wm5110-objs := tm2_wm5110.o
-snd-soc-aries-wm8994-objs := aries_wm8994.o
-snd-soc-midas-wm1811-objs := midas_wm1811.o
+snd-soc-smdk-wm8994-y := smdk_wm8994.o
+snd-soc-snow-y := snow.o
+snd-soc-smdk-spdif-y := smdk_spdif.o
+snd-soc-smdk-wm8994pcm-y := smdk_wm8994pcm.o
+snd-soc-speyside-y := speyside.o
+snd-soc-tobermory-y := tobermory.o
+snd-soc-lowland-y := lowland.o
+snd-soc-littlemill-y := littlemill.o
+snd-soc-bells-y := bells.o
+snd-soc-odroid-y := odroid.o
+snd-soc-arndale-y := arndale.o
+snd-soc-tm2-wm5110-y := tm2_wm5110.o
+snd-soc-aries-wm8994-y := aries_wm8994.o
+snd-soc-midas-wm1811-y := midas_wm1811.o
 
 obj-$(CONFIG_SND_SOC_SAMSUNG_SMDK_WM8994) += snd-soc-smdk-wm8994.o
 obj-$(CONFIG_SND_SOC_SNOW) += snd-soc-snow.o
-- 
2.43.0

