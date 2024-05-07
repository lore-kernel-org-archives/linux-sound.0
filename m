Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91BDE16E874
	for <linux-sound@vger.kernel.org>; Tue,  7 May 2024 15:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715097339; cv=none; b=tiNFm4qaGYtZKeCkxPqOEeHhZDt7/ImPIriORt7vB/Lm4UUCXo7IMIfyAJVdZXjSY/teO+uyaEEuRspErQ8VYvnqtLW0UeyZDwDByrpH5BABN4FkvGaG3JHASd4HIuqhOfVWlHmxBwN6slfoI0t36TPLVS36N0kZP2B4iqGN+jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715097339; c=relaxed/simple;
	bh=4UIJ/cPfO750hRqpclPjc5lq288sbOKqYU/oVQ2MaxA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R+iay9fyKut+m6hjRXCAMifnAJy/fR05OJ7jMkGC71/+RelgaSzWLtxDJQpsUiD6gEk9tdN9Ha/Z03ukcloMi21P7uYGqm3tTYjsu/iWYqen+W4v4a2SOG3HPcVZlBaYR22JPSafoAOIE/wew1YE4uIzG3EmNXVwioDi49rWr04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 23BFF21D0C;
	Tue,  7 May 2024 15:55:32 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E619713A2D;
	Tue,  7 May 2024 15:55:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GHzuNvNOOmaNXQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 07 May 2024 15:55:31 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 10/34] ASoC: fsl: Use *-y instead of *-objs in Makefile
Date: Tue,  7 May 2024 17:55:14 +0200
Message-ID: <20240507155540.24815-11-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 23BFF21D0C
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
 sound/soc/fsl/Makefile | 52 +++++++++++++++++++++---------------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/sound/soc/fsl/Makefile b/sound/soc/fsl/Makefile
index b45eda80c196..2fe78eed3a48 100644
--- a/sound/soc/fsl/Makefile
+++ b/sound/soc/fsl/Makefile
@@ -1,30 +1,30 @@
 # SPDX-License-Identifier: GPL-2.0
 # P1022 DS Machine Support
-snd-soc-p1022-ds-objs := p1022_ds.o
+snd-soc-p1022-ds-y := p1022_ds.o
 obj-$(CONFIG_SND_SOC_P1022_DS) += snd-soc-p1022-ds.o
 
 # P1022 RDK Machine Support
-snd-soc-p1022-rdk-objs := p1022_rdk.o
+snd-soc-p1022-rdk-y := p1022_rdk.o
 obj-$(CONFIG_SND_SOC_P1022_RDK) += snd-soc-p1022-rdk.o
 
 # Freescale SSI/DMA/SAI/SPDIF Support
-snd-soc-fsl-audmix-objs := fsl_audmix.o
-snd-soc-fsl-asoc-card-objs := fsl-asoc-card.o
-snd-soc-fsl-asrc-objs := fsl_asrc.o fsl_asrc_dma.o
-snd-soc-fsl-sai-objs := fsl_sai.o
+snd-soc-fsl-audmix-y := fsl_audmix.o
+snd-soc-fsl-asoc-card-y := fsl-asoc-card.o
+snd-soc-fsl-asrc-y := fsl_asrc.o fsl_asrc_dma.o
+snd-soc-fsl-sai-y := fsl_sai.o
 snd-soc-fsl-ssi-y := fsl_ssi.o
 snd-soc-fsl-ssi-$(CONFIG_DEBUG_FS) += fsl_ssi_dbg.o
-snd-soc-fsl-spdif-objs := fsl_spdif.o
-snd-soc-fsl-esai-objs := fsl_esai.o
-snd-soc-fsl-micfil-objs := fsl_micfil.o
-snd-soc-fsl-utils-objs := fsl_utils.o
-snd-soc-fsl-dma-objs := fsl_dma.o
-snd-soc-fsl-mqs-objs := fsl_mqs.o
-snd-soc-fsl-easrc-objs := fsl_easrc.o
-snd-soc-fsl-xcvr-objs := fsl_xcvr.o
-snd-soc-fsl-aud2htx-objs := fsl_aud2htx.o
-snd-soc-fsl-rpmsg-objs := fsl_rpmsg.o
-snd-soc-fsl-qmc-audio-objs := fsl_qmc_audio.o
+snd-soc-fsl-spdif-y := fsl_spdif.o
+snd-soc-fsl-esai-y := fsl_esai.o
+snd-soc-fsl-micfil-y := fsl_micfil.o
+snd-soc-fsl-utils-y := fsl_utils.o
+snd-soc-fsl-dma-y := fsl_dma.o
+snd-soc-fsl-mqs-y := fsl_mqs.o
+snd-soc-fsl-easrc-y := fsl_easrc.o
+snd-soc-fsl-xcvr-y := fsl_xcvr.o
+snd-soc-fsl-aud2htx-y := fsl_aud2htx.o
+snd-soc-fsl-rpmsg-y := fsl_rpmsg.o
+snd-soc-fsl-qmc-audio-y := fsl_qmc_audio.o
 
 obj-$(CONFIG_SND_SOC_FSL_AUDMIX) += snd-soc-fsl-audmix.o
 obj-$(CONFIG_SND_SOC_FSL_ASOC_CARD) += snd-soc-fsl-asoc-card.o
@@ -53,7 +53,7 @@ obj-$(CONFIG_SND_MPC52xx_SOC_PCM030) += pcm030-audio-fabric.o
 obj-$(CONFIG_SND_MPC52xx_SOC_EFIKA) += efika-audio-fabric.o
 
 # i.MX Platform Support
-snd-soc-imx-audmux-objs := imx-audmux.o
+snd-soc-imx-audmux-y := imx-audmux.o
 obj-$(CONFIG_SND_SOC_IMX_AUDMUX) += snd-soc-imx-audmux.o
 
 obj-$(CONFIG_SND_SOC_IMX_PCM_FIQ) += imx-pcm-fiq.o
@@ -62,14 +62,14 @@ obj-$(CONFIG_SND_SOC_IMX_AUDIO_RPMSG) += imx-audio-rpmsg.o
 obj-$(CONFIG_SND_SOC_IMX_PCM_RPMSG) += imx-pcm-rpmsg.o
 
 # i.MX Machine Support
-snd-soc-eukrea-tlv320-objs := eukrea-tlv320.o
-snd-soc-imx-es8328-objs := imx-es8328.o
-snd-soc-imx-sgtl5000-objs := imx-sgtl5000.o
-snd-soc-imx-spdif-objs := imx-spdif.o
-snd-soc-imx-audmix-objs := imx-audmix.o
-snd-soc-imx-hdmi-objs := imx-hdmi.o
-snd-soc-imx-rpmsg-objs := imx-rpmsg.o
-snd-soc-imx-card-objs := imx-card.o
+snd-soc-eukrea-tlv320-y := eukrea-tlv320.o
+snd-soc-imx-es8328-y := imx-es8328.o
+snd-soc-imx-sgtl5000-y := imx-sgtl5000.o
+snd-soc-imx-spdif-y := imx-spdif.o
+snd-soc-imx-audmix-y := imx-audmix.o
+snd-soc-imx-hdmi-y := imx-hdmi.o
+snd-soc-imx-rpmsg-y := imx-rpmsg.o
+snd-soc-imx-card-y := imx-card.o
 
 obj-$(CONFIG_SND_SOC_EUKREA_TLV320) += snd-soc-eukrea-tlv320.o
 obj-$(CONFIG_SND_SOC_IMX_ES8328) += snd-soc-imx-es8328.o
-- 
2.43.0

