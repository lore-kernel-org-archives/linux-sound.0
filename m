Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201BD16DEB6
	for <linux-sound@vger.kernel.org>; Tue,  7 May 2024 15:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715097334; cv=none; b=NeRPP0gIMmuIHImmDJIx9yPZwEEipV61oXd9dlgaLdP5TSc/B4nzZS3xSK46VMCm0VDSvkbW1rQ8ifOlWKoiVyEn0/WHQIK5dA5HmEjPA6HvpR6r6Pq0ecXqHFzcDVe18l7CZ2+mBJARpax3ag1gtsArLZxNAlbEWMttJtJK7Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715097334; c=relaxed/simple;
	bh=RsmWdNg+n+PlzocEKkaBPlGBLxv8EssgzIE7RT/XR4c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SgAHPvogmPNKZgQJU7yZkxGc73EdeQrK6hUx0JNQ38rul5dORiGietdEDrjLvq039TpFF1aeICILSRSnxMD00UvVRXLU5GKz+81DG3fGLl/NqZ4EINHE1HWm3/8cjEQqs3ypQsgyR9Y77sIl6z03gOUeT4YmvMrS7oIyCTwIiaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6A41B21CEE;
	Tue,  7 May 2024 15:55:31 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4861513A2D;
	Tue,  7 May 2024 15:55:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2NPfD/NOOmaNXQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 07 May 2024 15:55:31 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 06/34] ASoC: atmel: Use *-y instead of *-objs in Makefile
Date: Tue,  7 May 2024 17:55:10 +0200
Message-ID: <20240507155540.24815-7-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 6A41B21CEE
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
 sound/soc/atmel/Makefile | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/sound/soc/atmel/Makefile b/sound/soc/atmel/Makefile
index 043097a08ea8..03d9c419c93f 100644
--- a/sound/soc/atmel/Makefile
+++ b/sound/soc/atmel/Makefile
@@ -1,13 +1,13 @@
 # SPDX-License-Identifier: GPL-2.0
 # AT91 Platform Support
-snd-soc-atmel-pcm-pdc-objs := atmel-pcm-pdc.o
-snd-soc-atmel-pcm-dma-objs := atmel-pcm-dma.o
-snd-soc-atmel_ssc_dai-objs := atmel_ssc_dai.o
-snd-soc-atmel-i2s-objs := atmel-i2s.o
-snd-soc-mchp-i2s-mcc-objs := mchp-i2s-mcc.o
-snd-soc-mchp-spdiftx-objs := mchp-spdiftx.o
-snd-soc-mchp-spdifrx-objs := mchp-spdifrx.o
-snd-soc-mchp-pdmc-objs := mchp-pdmc.o
+snd-soc-atmel-pcm-pdc-y := atmel-pcm-pdc.o
+snd-soc-atmel-pcm-dma-y := atmel-pcm-dma.o
+snd-soc-atmel_ssc_dai-y := atmel_ssc_dai.o
+snd-soc-atmel-i2s-y := atmel-i2s.o
+snd-soc-mchp-i2s-mcc-y := mchp-i2s-mcc.o
+snd-soc-mchp-spdiftx-y := mchp-spdiftx.o
+snd-soc-mchp-spdifrx-y := mchp-spdifrx.o
+snd-soc-mchp-pdmc-y := mchp-pdmc.o
 
 # pdc and dma need to both be built-in if any user of
 # ssc is built-in.
@@ -25,13 +25,13 @@ obj-$(CONFIG_SND_MCHP_SOC_SPDIFRX) += snd-soc-mchp-spdifrx.o
 obj-$(CONFIG_SND_MCHP_SOC_PDMC) += snd-soc-mchp-pdmc.o
 
 # AT91 Machine Support
-snd-soc-sam9g20-wm8731-objs := sam9g20_wm8731.o
-snd-atmel-soc-wm8904-objs := atmel_wm8904.o
-snd-soc-sam9x5-wm8731-objs := sam9x5_wm8731.o
-snd-atmel-soc-classd-objs := atmel-classd.o
-snd-atmel-soc-pdmic-objs := atmel-pdmic.o
-snd-atmel-soc-tse850-pcm5142-objs := tse850-pcm5142.o
-snd-soc-mikroe-proto-objs := mikroe-proto.o
+snd-soc-sam9g20-wm8731-y := sam9g20_wm8731.o
+snd-atmel-soc-wm8904-y := atmel_wm8904.o
+snd-soc-sam9x5-wm8731-y := sam9x5_wm8731.o
+snd-atmel-soc-classd-y := atmel-classd.o
+snd-atmel-soc-pdmic-y := atmel-pdmic.o
+snd-atmel-soc-tse850-pcm5142-y := tse850-pcm5142.o
+snd-soc-mikroe-proto-y := mikroe-proto.o
 
 obj-$(CONFIG_SND_AT91_SOC_SAM9G20_WM8731) += snd-soc-sam9g20-wm8731.o
 obj-$(CONFIG_SND_ATMEL_SOC_WM8904) += snd-atmel-soc-wm8904.o
-- 
2.43.0

