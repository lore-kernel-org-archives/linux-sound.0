Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F029816DEA2
	for <linux-sound@vger.kernel.org>; Tue,  7 May 2024 15:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715097341; cv=none; b=NRs9fwSrl5wx5BfLqCKFBx7F0NDMA7nNHtVaDqkiGWMlSsANnes9nzlZgAepNDiZDYtmk6Q6nLcLKRwVHmQFBswEc0k30dKgjf0FIgt+2qTP7T8PEawSkUtVd0cQVvOd4ukR7SZQRztfLfK3HkZe0MpWMh3IwWCN/1RhXLqaUYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715097341; c=relaxed/simple;
	bh=xy3tK2fNI3E1W+NI3Wf5PQ1dQQFm3uCkc9elHwL7BMI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cx9AzrNi1pAHb5Rhuyb8XQywB2W1MrBy03PD11XTyBf5gjgxps9sHo7nL1XnLTRGds0x3aBZ2Y0Vl+Ek/zavukv2nBqGZ/d+X3ara1EIrwXBQH4DkYZdpVRVpUoczmkVuQqrp/UlOtZmkFe61ZEqkEuSsp9uLBoKVpcLE+/9ijE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7355C221BC;
	Tue,  7 May 2024 15:55:35 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 47DB513A2D;
	Tue,  7 May 2024 15:55:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id EH7QD/dOOmaNXQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 07 May 2024 15:55:35 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 30/34] ASoC: ti: Use *-y instead of *-objs in Makefile
Date: Tue,  7 May 2024 17:55:34 +0200
Message-ID: <20240507155540.24815-31-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 7355C221BC

*-objs suffix is reserved rather for (user-space) host programs while
usually *-y suffix is used for kernel drivers (although *-objs works
for that purpose for now).

Let's correct the old usages of *-objs in Makefiles.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/ti/Makefile | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/sound/soc/ti/Makefile b/sound/soc/ti/Makefile
index 41cdcaec770d..421e13bc04db 100644
--- a/sound/soc/ti/Makefile
+++ b/sound/soc/ti/Makefile
@@ -1,20 +1,20 @@
 # SPDX-License-Identifier: GPL-2.0
 
 # Platform drivers
-snd-soc-ti-edma-objs := edma-pcm.o
-snd-soc-ti-sdma-objs := sdma-pcm.o
-snd-soc-ti-udma-objs := udma-pcm.o
+snd-soc-ti-edma-y := edma-pcm.o
+snd-soc-ti-sdma-y := sdma-pcm.o
+snd-soc-ti-udma-y := udma-pcm.o
 
 obj-$(CONFIG_SND_SOC_TI_EDMA_PCM) += snd-soc-ti-edma.o
 obj-$(CONFIG_SND_SOC_TI_SDMA_PCM) += snd-soc-ti-sdma.o
 obj-$(CONFIG_SND_SOC_TI_UDMA_PCM) += snd-soc-ti-udma.o
 
 # CPU DAI drivers
-snd-soc-davinci-asp-objs := davinci-i2s.o
-snd-soc-davinci-mcasp-objs := davinci-mcasp.o
-snd-soc-omap-dmic-objs := omap-dmic.o
-snd-soc-omap-mcbsp-objs := omap-mcbsp.o omap-mcbsp-st.o
-snd-soc-omap-mcpdm-objs := omap-mcpdm.o
+snd-soc-davinci-asp-y := davinci-i2s.o
+snd-soc-davinci-mcasp-y := davinci-mcasp.o
+snd-soc-omap-dmic-y := omap-dmic.o
+snd-soc-omap-mcbsp-y := omap-mcbsp.o omap-mcbsp-st.o
+snd-soc-omap-mcpdm-y := omap-mcpdm.o
 
 obj-$(CONFIG_SND_SOC_DAVINCI_ASP) += snd-soc-davinci-asp.o
 obj-$(CONFIG_SND_SOC_DAVINCI_MCASP) += snd-soc-davinci-mcasp.o
@@ -23,16 +23,16 @@ obj-$(CONFIG_SND_SOC_OMAP_MCBSP) += snd-soc-omap-mcbsp.o
 obj-$(CONFIG_SND_SOC_OMAP_MCPDM) += snd-soc-omap-mcpdm.o
 
 # Machine drivers
-snd-soc-davinci-evm-objs := davinci-evm.o
-snd-soc-n810-objs := n810.o
-snd-soc-rx51-objs := rx51.o
-snd-soc-omap3pandora-objs := omap3pandora.o
-snd-soc-omap-twl4030-objs := omap-twl4030.o
-snd-soc-omap-abe-twl6040-objs := omap-abe-twl6040.o
-snd-soc-ams-delta-objs := ams-delta.o
-snd-soc-omap-hdmi-objs := omap-hdmi.o
-snd-soc-osk5912-objs := osk5912.o
-snd-soc-j721e-evm-objs := j721e-evm.o
+snd-soc-davinci-evm-y := davinci-evm.o
+snd-soc-n810-y := n810.o
+snd-soc-rx51-y := rx51.o
+snd-soc-omap3pandora-y := omap3pandora.o
+snd-soc-omap-twl4030-y := omap-twl4030.o
+snd-soc-omap-abe-twl6040-y := omap-abe-twl6040.o
+snd-soc-ams-delta-y := ams-delta.o
+snd-soc-omap-hdmi-y := omap-hdmi.o
+snd-soc-osk5912-y := osk5912.o
+snd-soc-j721e-evm-y := j721e-evm.o
 
 obj-$(CONFIG_SND_SOC_DAVINCI_EVM) += snd-soc-davinci-evm.o
 obj-$(CONFIG_SND_SOC_NOKIA_N810) += snd-soc-n810.o
-- 
2.43.0

