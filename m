Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40CC16EC02
	for <linux-sound@vger.kernel.org>; Tue,  7 May 2024 15:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715097341; cv=none; b=tcuYrw1Y5M0Cv4/L+EUYSyCHXgdNYeNJXkRhmXvlKwufHjD6Inpm0Ew4bDg4O2kwkKkYmCPtA5RELyD0mHgyUu5NaigsCWV7iOpJ8xQsYkimKPpaPWUCiko0p4FhSXFp4wCcaCQA+IRvq8DV5g8/APdQnqBEgAap8F4PqgFNvjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715097341; c=relaxed/simple;
	bh=4BNfPsnZD5P0U/nZZg2iru4Hf3duGBIwuYwUlZ7p8kg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b1teN23xy9eJRVgFtv3BfBYBvFznWkHEukUnGMreYXGZyClphzFawUpJL6OMLc/olsdzoNCdYSi85DFu7XW0UoZZH6/S4Ft2Sy8SdBg32YAxz38g8jjOnGmoD3kvW+M8wPR7S2l+FmglM8KRrnjtqo8HjhIm4Cq1cY9IpRnCExY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6A4722217A;
	Tue,  7 May 2024 15:55:34 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 48F8A13A3A;
	Tue,  7 May 2024 15:55:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id sNeUEPZOOmaNXQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 07 May 2024 15:55:34 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 24/34] ASoC: SOF: Use *-y instead of *-objs in Makefile
Date: Tue,  7 May 2024 17:55:28 +0200
Message-ID: <20240507155540.24815-25-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 6A4722217A

*-objs suffix is reserved rather for (user-space) host programs while
usually *-y suffix is used for kernel drivers (although *-objs works
for that purpose for now).

Let's correct the old usages of *-objs in Makefiles.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/sof/Makefile                 | 30 +++++++++++++-------------
 sound/soc/sof/amd/Makefile             | 10 ++++-----
 sound/soc/sof/imx/Makefile             |  8 +++----
 sound/soc/sof/intel/Makefile           | 30 +++++++++++++-------------
 sound/soc/sof/mediatek/mt8186/Makefile |  2 +-
 sound/soc/sof/mediatek/mt8195/Makefile |  2 +-
 sound/soc/sof/xtensa/Makefile          |  2 +-
 7 files changed, 42 insertions(+), 42 deletions(-)

diff --git a/sound/soc/sof/Makefile b/sound/soc/sof/Makefile
index 3624124575af..b0b22e6ebc03 100644
--- a/sound/soc/sof/Makefile
+++ b/sound/soc/sof/Makefile
@@ -1,44 +1,44 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
 
-snd-sof-objs := core.o ops.o loader.o ipc.o pcm.o pm.o debug.o topology.o\
+snd-sof-y := core.o ops.o loader.o ipc.o pcm.o pm.o debug.o topology.o\
 		control.o trace.o iomem-utils.o sof-audio.o stream-ipc.o\
 		fw-file-profile.o
 
 # IPC implementations
 ifneq ($(CONFIG_SND_SOC_SOF_IPC3),)
-snd-sof-objs +=	ipc3.o ipc3-loader.o ipc3-topology.o ipc3-control.o ipc3-pcm.o\
+snd-sof-y +=	ipc3.o ipc3-loader.o ipc3-topology.o ipc3-control.o ipc3-pcm.o\
 		ipc3-dtrace.o
 endif
 ifneq ($(CONFIG_SND_SOC_SOF_IPC4),)
-snd-sof-objs += ipc4.o ipc4-loader.o ipc4-topology.o ipc4-control.o ipc4-pcm.o\
+snd-sof-y += ipc4.o ipc4-loader.o ipc4-topology.o ipc4-control.o ipc4-pcm.o\
 		ipc4-mtrace.o ipc4-telemetry.o
 endif
 
 # SOF client support
 ifneq ($(CONFIG_SND_SOC_SOF_CLIENT),)
-snd-sof-objs += sof-client.o
+snd-sof-y += sof-client.o
 endif
 
 snd-sof-$(CONFIG_SND_SOC_SOF_COMPRESS) += compress.o
 
-snd-sof-pci-objs := sof-pci-dev.o
-snd-sof-acpi-objs := sof-acpi-dev.o
-snd-sof-of-objs := sof-of-dev.o
+snd-sof-pci-y := sof-pci-dev.o
+snd-sof-acpi-y := sof-acpi-dev.o
+snd-sof-of-y := sof-of-dev.o
 
-snd-sof-ipc-flood-test-objs := sof-client-ipc-flood-test.o
-snd-sof-ipc-msg-injector-objs := sof-client-ipc-msg-injector.o
-snd-sof-ipc-kernel-injector-objs := sof-client-ipc-kernel-injector.o
-snd-sof-probes-objs := sof-client-probes.o
+snd-sof-ipc-flood-test-y := sof-client-ipc-flood-test.o
+snd-sof-ipc-msg-injector-y := sof-client-ipc-msg-injector.o
+snd-sof-ipc-kernel-injector-y := sof-client-ipc-kernel-injector.o
+snd-sof-probes-y := sof-client-probes.o
 ifneq ($(CONFIG_SND_SOC_SOF_IPC3),)
-snd-sof-probes-objs += sof-client-probes-ipc3.o
+snd-sof-probes-y += sof-client-probes-ipc3.o
 endif
 ifneq ($(CONFIG_SND_SOC_SOF_IPC4),)
-snd-sof-probes-objs += sof-client-probes-ipc4.o
+snd-sof-probes-y += sof-client-probes-ipc4.o
 endif
 
-snd-sof-nocodec-objs := nocodec.o
+snd-sof-nocodec-y := nocodec.o
 
-snd-sof-utils-objs := sof-utils.o
+snd-sof-utils-y := sof-utils.o
 
 obj-$(CONFIG_SND_SOC_SOF) += snd-sof.o
 obj-$(CONFIG_SND_SOC_SOF_NOCODEC) += snd-sof-nocodec.o
diff --git a/sound/soc/sof/amd/Makefile b/sound/soc/sof/amd/Makefile
index ad25f4206177..380a9769c321 100644
--- a/sound/soc/sof/amd/Makefile
+++ b/sound/soc/sof/amd/Makefile
@@ -4,12 +4,12 @@
 #
 # Copyright(c) 2021, 2023 Advanced Micro Devices, Inc. All rights reserved.
 
-snd-sof-amd-acp-objs := acp.o acp-loader.o acp-ipc.o acp-pcm.o acp-stream.o acp-trace.o acp-common.o
+snd-sof-amd-acp-y := acp.o acp-loader.o acp-ipc.o acp-pcm.o acp-stream.o acp-trace.o acp-common.o
 snd-sof-amd-acp-$(CONFIG_SND_SOC_SOF_ACP_PROBES) = acp-probes.o
-snd-sof-amd-renoir-objs := pci-rn.o renoir.o
-snd-sof-amd-rembrandt-objs := pci-rmb.o rembrandt.o
-snd-sof-amd-vangogh-objs := pci-vangogh.o vangogh.o
-snd-sof-amd-acp63-objs := pci-acp63.o acp63.o
+snd-sof-amd-renoir-y := pci-rn.o renoir.o
+snd-sof-amd-rembrandt-y := pci-rmb.o rembrandt.o
+snd-sof-amd-vangogh-y := pci-vangogh.o vangogh.o
+snd-sof-amd-acp63-y := pci-acp63.o acp63.o
 
 obj-$(CONFIG_SND_SOC_SOF_AMD_COMMON) += snd-sof-amd-acp.o
 obj-$(CONFIG_SND_SOC_SOF_AMD_RENOIR) +=snd-sof-amd-renoir.o
diff --git a/sound/soc/sof/imx/Makefile b/sound/soc/sof/imx/Makefile
index 798b43a415bf..be0bf0736dfa 100644
--- a/sound/soc/sof/imx/Makefile
+++ b/sound/soc/sof/imx/Makefile
@@ -1,9 +1,9 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
-snd-sof-imx8-objs := imx8.o
-snd-sof-imx8m-objs := imx8m.o
-snd-sof-imx8ulp-objs := imx8ulp.o
+snd-sof-imx8-y := imx8.o
+snd-sof-imx8m-y := imx8m.o
+snd-sof-imx8ulp-y := imx8ulp.o
 
-snd-sof-imx-common-objs := imx-common.o
+snd-sof-imx-common-y := imx-common.o
 
 obj-$(CONFIG_SND_SOC_SOF_IMX8) += snd-sof-imx8.o
 obj-$(CONFIG_SND_SOC_SOF_IMX8M) += snd-sof-imx8m.o
diff --git a/sound/soc/sof/intel/Makefile b/sound/soc/sof/intel/Makefile
index 806df08e3fd5..b56fa5530b8b 100644
--- a/sound/soc/sof/intel/Makefile
+++ b/sound/soc/sof/intel/Makefile
@@ -1,22 +1,22 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
 
-snd-sof-acpi-intel-byt-objs := byt.o
-snd-sof-acpi-intel-bdw-objs := bdw.o
+snd-sof-acpi-intel-byt-y := byt.o
+snd-sof-acpi-intel-bdw-y := bdw.o
 
-snd-sof-intel-hda-common-objs := hda-loader.o hda-stream.o hda-trace.o \
+snd-sof-intel-hda-common-y := hda-loader.o hda-stream.o hda-trace.o \
 				 hda-dsp.o hda-ipc.o hda-ctrl.o hda-pcm.o \
 				 hda-dai.o hda-dai-ops.o hda-bus.o \
 				 telemetry.o tracepoints.o
 
-snd-sof-intel-hda-generic-objs := hda.o hda-common-ops.o
+snd-sof-intel-hda-generic-y := hda.o hda-common-ops.o
 
-snd-sof-intel-hda-mlink-objs := hda-mlink.o
+snd-sof-intel-hda-mlink-y := hda-mlink.o
 
 snd-sof-intel-hda-common-$(CONFIG_SND_SOC_SOF_HDA_PROBES) += hda-probes.o
 
-snd-sof-intel-hda-objs := hda-codec.o
+snd-sof-intel-hda-y := hda-codec.o
 
-snd-sof-intel-atom-objs := atom.o
+snd-sof-intel-atom-y := atom.o
 
 obj-$(CONFIG_SND_SOC_SOF_INTEL_ATOM_HIFI_EP) += snd-sof-intel-atom.o
 obj-$(CONFIG_SND_SOC_SOF_BAYTRAIL) += snd-sof-acpi-intel-byt.o
@@ -26,14 +26,14 @@ obj-$(CONFIG_SND_SOC_SOF_HDA_GENERIC) += snd-sof-intel-hda-generic.o
 obj-$(CONFIG_SND_SOC_SOF_HDA_MLINK) += snd-sof-intel-hda-mlink.o
 obj-$(CONFIG_SND_SOC_SOF_HDA) += snd-sof-intel-hda.o
 
-snd-sof-pci-intel-tng-objs := pci-tng.o
-snd-sof-pci-intel-skl-objs := pci-skl.o skl.o hda-loader-skl.o
-snd-sof-pci-intel-apl-objs := pci-apl.o apl.o
-snd-sof-pci-intel-cnl-objs := pci-cnl.o cnl.o
-snd-sof-pci-intel-icl-objs := pci-icl.o icl.o
-snd-sof-pci-intel-tgl-objs := pci-tgl.o tgl.o
-snd-sof-pci-intel-mtl-objs := pci-mtl.o mtl.o
-snd-sof-pci-intel-lnl-objs := pci-lnl.o lnl.o
+snd-sof-pci-intel-tng-y := pci-tng.o
+snd-sof-pci-intel-skl-y := pci-skl.o skl.o hda-loader-skl.o
+snd-sof-pci-intel-apl-y := pci-apl.o apl.o
+snd-sof-pci-intel-cnl-y := pci-cnl.o cnl.o
+snd-sof-pci-intel-icl-y := pci-icl.o icl.o
+snd-sof-pci-intel-tgl-y := pci-tgl.o tgl.o
+snd-sof-pci-intel-mtl-y := pci-mtl.o mtl.o
+snd-sof-pci-intel-lnl-y := pci-lnl.o lnl.o
 
 obj-$(CONFIG_SND_SOC_SOF_MERRIFIELD) += snd-sof-pci-intel-tng.o
 obj-$(CONFIG_SND_SOC_SOF_INTEL_SKL) += snd-sof-pci-intel-skl.o
diff --git a/sound/soc/sof/mediatek/mt8186/Makefile b/sound/soc/sof/mediatek/mt8186/Makefile
index c1f5fc4e2495..022f415afac9 100644
--- a/sound/soc/sof/mediatek/mt8186/Makefile
+++ b/sound/soc/sof/mediatek/mt8186/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
-snd-sof-mt8186-objs := mt8186.o mt8186-clk.o mt8186-loader.o
+snd-sof-mt8186-y := mt8186.o mt8186-clk.o mt8186-loader.o
 obj-$(CONFIG_SND_SOC_SOF_MT8186) += snd-sof-mt8186.o
 
diff --git a/sound/soc/sof/mediatek/mt8195/Makefile b/sound/soc/sof/mediatek/mt8195/Makefile
index afc4f21fccc5..f5eeda380b50 100644
--- a/sound/soc/sof/mediatek/mt8195/Makefile
+++ b/sound/soc/sof/mediatek/mt8195/Makefile
@@ -1,3 +1,3 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
-snd-sof-mt8195-objs := mt8195.o mt8195-clk.o mt8195-loader.o
+snd-sof-mt8195-y := mt8195.o mt8195-clk.o mt8195-loader.o
 obj-$(CONFIG_SND_SOC_SOF_MT8195) += snd-sof-mt8195.o
diff --git a/sound/soc/sof/xtensa/Makefile b/sound/soc/sof/xtensa/Makefile
index b8376ea04bcf..b9e6e8f5a7f6 100644
--- a/sound/soc/sof/xtensa/Makefile
+++ b/sound/soc/sof/xtensa/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
 
-snd-sof-xtensa-dsp-objs := core.o
+snd-sof-xtensa-dsp-y := core.o
 
 obj-$(CONFIG_SND_SOC_SOF_XTENSA) += snd-sof-xtensa-dsp.o
-- 
2.43.0

