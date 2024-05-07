Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EEF516DEA2
	for <linux-sound@vger.kernel.org>; Tue,  7 May 2024 15:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715097339; cv=none; b=ZU8GJxBSH1kVl6m7FjNeXb0bjCRLZ7d9makHCqAqvPtO032D4fF/fkgMy3to+NuUBMFpJFzE1+I92N6R/kkAxFfnb1zElc9O4aLGQwCbyy2aR2WlgXbEVoe9msxcc7iKBC69YnsLbR1hhpASO8y+cfX8C6Bsa6Zv5M1KYw02oeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715097339; c=relaxed/simple;
	bh=KSD3SU6IiNJfzTvEUQDAXppnQkpLRxG+I+y1a3gyTLU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RCm87VVr90sJ37xvdelpRugz0SIDpq+hcQj+b0O1UGa49HP81T7FDe34pdi5IvNF8N+/6ETw3U9sXX5IwJH4ZtaatXg1YEsNWFKoWrh3wj92ufkcQQbiZ7/LcQhjn9NwOFR+Ae+YyZpcgrApULbdlID6zqi4cgBdCmjpLON3DiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C1DC922154;
	Tue,  7 May 2024 15:55:33 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A511413A2D;
	Tue,  7 May 2024 15:55:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AHESJ/VOOmaNXQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 07 May 2024 15:55:33 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 20/34] ASoC: qcom: Use *-y instead of *-objs in Makefile
Date: Tue,  7 May 2024 17:55:24 +0200
Message-ID: <20240507155540.24815-21-tiwai@suse.de>
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
X-Rspamd-Queue-Id: C1DC922154

*-objs suffix is reserved rather for (user-space) host programs while
usually *-y suffix is used for kernel drivers (although *-objs works
for that purpose for now).

Let's correct the old usages of *-objs in Makefiles.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/qcom/Makefile       | 38 +++++++++++++++++------------------
 sound/soc/qcom/qdsp6/Makefile |  4 ++--
 2 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/sound/soc/qcom/Makefile b/sound/soc/qcom/Makefile
index 34f3fcb8ee9a..16db7b53ddac 100644
--- a/sound/soc/qcom/Makefile
+++ b/sound/soc/qcom/Makefile
@@ -1,13 +1,13 @@
 # SPDX-License-Identifier: GPL-2.0
 # Platform
-snd-soc-lpass-cpu-objs := lpass-cpu.o
-snd-soc-lpass-cdc-dma-objs := lpass-cdc-dma.o
-snd-soc-lpass-hdmi-objs := lpass-hdmi.o
-snd-soc-lpass-platform-objs := lpass-platform.o
-snd-soc-lpass-ipq806x-objs := lpass-ipq806x.o
-snd-soc-lpass-apq8016-objs := lpass-apq8016.o
-snd-soc-lpass-sc7180-objs := lpass-sc7180.o
-snd-soc-lpass-sc7280-objs := lpass-sc7280.o
+snd-soc-lpass-cpu-y := lpass-cpu.o
+snd-soc-lpass-cdc-dma-y := lpass-cdc-dma.o
+snd-soc-lpass-hdmi-y := lpass-hdmi.o
+snd-soc-lpass-platform-y := lpass-platform.o
+snd-soc-lpass-ipq806x-y := lpass-ipq806x.o
+snd-soc-lpass-apq8016-y := lpass-apq8016.o
+snd-soc-lpass-sc7180-y := lpass-sc7180.o
+snd-soc-lpass-sc7280-y := lpass-sc7280.o
 
 obj-$(CONFIG_SND_SOC_LPASS_CPU) += snd-soc-lpass-cpu.o
 obj-$(CONFIG_SND_SOC_LPASS_CDC_DMA) += snd-soc-lpass-cdc-dma.o
@@ -19,17 +19,17 @@ obj-$(CONFIG_SND_SOC_LPASS_SC7180) += snd-soc-lpass-sc7180.o
 obj-$(CONFIG_SND_SOC_LPASS_SC7280) += snd-soc-lpass-sc7280.o
 
 # Machine
-snd-soc-storm-objs := storm.o
-snd-soc-apq8016-sbc-objs := apq8016_sbc.o
-snd-soc-apq8096-objs := apq8096.o
-snd-soc-sc7180-objs := sc7180.o
-snd-soc-sc7280-objs := sc7280.o
-snd-soc-sdm845-objs := sdm845.o
-snd-soc-sm8250-objs := sm8250.o
-snd-soc-sc8280xp-objs := sc8280xp.o
-snd-soc-qcom-common-objs := common.o
-snd-soc-qcom-sdw-objs := sdw.o
-snd-soc-x1e80100-objs := x1e80100.o
+snd-soc-storm-y := storm.o
+snd-soc-apq8016-sbc-y := apq8016_sbc.o
+snd-soc-apq8096-y := apq8096.o
+snd-soc-sc7180-y := sc7180.o
+snd-soc-sc7280-y := sc7280.o
+snd-soc-sdm845-y := sdm845.o
+snd-soc-sm8250-y := sm8250.o
+snd-soc-sc8280xp-y := sc8280xp.o
+snd-soc-qcom-common-y := common.o
+snd-soc-qcom-sdw-y := sdw.o
+snd-soc-x1e80100-y := x1e80100.o
 
 obj-$(CONFIG_SND_SOC_STORM) += snd-soc-storm.o
 obj-$(CONFIG_SND_SOC_APQ8016_SBC) += snd-soc-apq8016-sbc.o
diff --git a/sound/soc/qcom/qdsp6/Makefile b/sound/soc/qcom/qdsp6/Makefile
index 3963bf234664..26b7c55c9c11 100644
--- a/sound/soc/qcom/qdsp6/Makefile
+++ b/sound/soc/qcom/qdsp6/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
-snd-q6dsp-common-objs := q6dsp-common.o q6dsp-lpass-ports.o q6dsp-lpass-clocks.o
-snd-q6apm-objs := q6apm.o audioreach.o topology.o
+snd-q6dsp-common-y := q6dsp-common.o q6dsp-lpass-ports.o q6dsp-lpass-clocks.o
+snd-q6apm-y := q6apm.o audioreach.o topology.o
 
 obj-$(CONFIG_SND_SOC_QDSP6_COMMON) += snd-q6dsp-common.o
 obj-$(CONFIG_SND_SOC_QDSP6_CORE) += q6core.o
-- 
2.43.0

