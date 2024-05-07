Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5337B16C447
	for <linux-sound@vger.kernel.org>; Tue,  7 May 2024 15:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715097336; cv=none; b=LzyGpUKNJtGDSfquuoyzNu/bsRqNF/JnflwYYgIkz35sPU9Tod+un6zd01x4nxVFvcbZUEoC1NIh0urX+l1+bTOkreSciSrku4IpsIdUJg4rCEjWGY+2T2E8gCe/8eAbzImePQZHBUk528MIrbaI3TzUnvVCXUVwsWCDSfPgBD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715097336; c=relaxed/simple;
	bh=2TFyXGfG8dugeqaDM+9v8uoiknAS82ujTivHSDsVy5s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PaRKG8vYTQsgL1J3UoRk94xn2yai7yRYdsXBKkZrTblOXWesi2QNmFVlZ6d3DwwPwqUfndTLorkFWQul8Kawx6rC3HxX3aqnQ7wJZlokN7CTMTUb2Em8auJBMIf4HjdszMIFtEQ6HlfcSnV73MBB55RzO/wT6ClLSDUd7VWYOJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hVVHGBfY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=oBGDmcms; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hVVHGBfY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=oBGDmcms; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hVVHGBfY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oBGDmcms";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hVVHGBfY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oBGDmcms"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 765C320C94;
	Tue,  7 May 2024 15:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715097332; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d2M8eYUBK+yr/rAc1uaLtl/TiufBWB2MpN1ewqpgyg4=;
	b=hVVHGBfYVqORfAriY7t5cpMRbUQMbCSzUDBPVbVjVzxqS9HmoOQVy75zz9fbPO9+2Apprp
	0sWQVD8d68cfRLflSMBnsXOEf9I8Huv3sBeccDFDbcLpE2vFWF8gQmWOwcVXhNTEZO4rmG
	6h36wf3pEhpXIMixL07gQoTxPf4++d8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715097332;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d2M8eYUBK+yr/rAc1uaLtl/TiufBWB2MpN1ewqpgyg4=;
	b=oBGDmcmsrFOwh2yIGSL0BaGv1GLl7EIPx4KKG0Rg4lCfixNzXZJGUeZGdXSSATzC0GVS8X
	vKBsBg7PxApP5DCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715097332; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d2M8eYUBK+yr/rAc1uaLtl/TiufBWB2MpN1ewqpgyg4=;
	b=hVVHGBfYVqORfAriY7t5cpMRbUQMbCSzUDBPVbVjVzxqS9HmoOQVy75zz9fbPO9+2Apprp
	0sWQVD8d68cfRLflSMBnsXOEf9I8Huv3sBeccDFDbcLpE2vFWF8gQmWOwcVXhNTEZO4rmG
	6h36wf3pEhpXIMixL07gQoTxPf4++d8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715097332;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d2M8eYUBK+yr/rAc1uaLtl/TiufBWB2MpN1ewqpgyg4=;
	b=oBGDmcmsrFOwh2yIGSL0BaGv1GLl7EIPx4KKG0Rg4lCfixNzXZJGUeZGdXSSATzC0GVS8X
	vKBsBg7PxApP5DCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 56D6C13A2D;
	Tue,  7 May 2024 15:55:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id eCPnE/ROOmaNXQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 07 May 2024 15:55:32 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 12/34] ASoC: intel: Use *-y instead of *-objs in Makefile
Date: Tue,  7 May 2024 17:55:16 +0200
Message-ID: <20240507155540.24815-13-tiwai@suse.de>
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
X-Spam-Flag: NO
X-Spam-Score: -6.80
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[]

*-objs suffix is reserved rather for (user-space) host programs while
usually *-y suffix is used for kernel drivers (although *-objs works
for that purpose for now).

Let's correct the old usages of *-objs in Makefiles.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/intel/atom/Makefile       |  2 +-
 sound/soc/intel/atom/sst/Makefile   |  6 +--
 sound/soc/intel/avs/Makefile        | 10 ++--
 sound/soc/intel/avs/boards/Makefile | 34 ++++++------
 sound/soc/intel/boards/Makefile     | 84 ++++++++++++++---------------
 sound/soc/intel/catpt/Makefile      |  2 +-
 sound/soc/intel/common/Makefile     |  8 +--
 sound/soc/intel/keembay/Makefile    |  2 +-
 sound/soc/intel/skylake/Makefile    |  6 +--
 9 files changed, 77 insertions(+), 77 deletions(-)

diff --git a/sound/soc/intel/atom/Makefile b/sound/soc/intel/atom/Makefile
index c66f03f5d8d6..38e4876025c7 100644
--- a/sound/soc/intel/atom/Makefile
+++ b/sound/soc/intel/atom/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
-snd-soc-sst-atom-hifi2-platform-objs :=	sst-mfld-platform-pcm.o \
+snd-soc-sst-atom-hifi2-platform-y :=	sst-mfld-platform-pcm.o \
 					sst-mfld-platform-compress.o \
 					sst-atom-controls.o
 
diff --git a/sound/soc/intel/atom/sst/Makefile b/sound/soc/intel/atom/sst/Makefile
index 5761d30a5f9d..16be0463424d 100644
--- a/sound/soc/intel/atom/sst/Makefile
+++ b/sound/soc/intel/atom/sst/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
-snd-intel-sst-core-objs := sst.o sst_ipc.o sst_stream.o sst_drv_interface.o sst_loader.o sst_pvt.o
-snd-intel-sst-pci-objs += sst_pci.o
-snd-intel-sst-acpi-objs += sst_acpi.o
+snd-intel-sst-core-y := sst.o sst_ipc.o sst_stream.o sst_drv_interface.o sst_loader.o sst_pvt.o
+snd-intel-sst-pci-y += sst_pci.o
+snd-intel-sst-acpi-y += sst_acpi.o
 
 obj-$(CONFIG_SND_SST_ATOM_HIFI2_PLATFORM) += snd-intel-sst-core.o
 obj-$(CONFIG_SND_SST_ATOM_HIFI2_PLATFORM_PCI) += snd-intel-sst-pci.o
diff --git a/sound/soc/intel/avs/Makefile b/sound/soc/intel/avs/Makefile
index 5480500337f8..5139a019a4ad 100644
--- a/sound/soc/intel/avs/Makefile
+++ b/sound/soc/intel/avs/Makefile
@@ -1,17 +1,17 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
-snd-soc-avs-objs := dsp.o ipc.o messages.o utils.o core.o loader.o \
+snd-soc-avs-y := dsp.o ipc.o messages.o utils.o core.o loader.o \
 		    topology.o path.o pcm.o board_selection.o control.o \
 		    sysfs.o
-snd-soc-avs-objs += cldma.o
-snd-soc-avs-objs += skl.o apl.o cnl.o icl.o tgl.o
+snd-soc-avs-y += cldma.o
+snd-soc-avs-y += skl.o apl.o cnl.o icl.o tgl.o
 
-snd-soc-avs-objs += trace.o
+snd-soc-avs-y += trace.o
 # tell define_trace.h where to find the trace header
 CFLAGS_trace.o := -I$(src)
 
 ifneq ($(CONFIG_DEBUG_FS),)
-snd-soc-avs-objs += probes.o debugfs.o
+snd-soc-avs-y += probes.o debugfs.o
 endif
 
 obj-$(CONFIG_SND_SOC_INTEL_AVS) += snd-soc-avs.o
diff --git a/sound/soc/intel/avs/boards/Makefile b/sound/soc/intel/avs/boards/Makefile
index 0ff21d55be24..4fbd936ffb3e 100644
--- a/sound/soc/intel/avs/boards/Makefile
+++ b/sound/soc/intel/avs/boards/Makefile
@@ -1,22 +1,22 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
-snd-soc-avs-da7219-objs := da7219.o
-snd-soc-avs-dmic-objs := dmic.o
-snd-soc-avs-es8336-objs := es8336.o
-snd-soc-avs-hdaudio-objs := hdaudio.o
-snd-soc-avs-i2s-test-objs := i2s_test.o
-snd-soc-avs-max98927-objs := max98927.o
-snd-soc-avs-max98357a-objs := max98357a.o
-snd-soc-avs-max98373-objs := max98373.o
-snd-soc-avs-nau8825-objs := nau8825.o
-snd-soc-avs-probe-objs := probe.o
-snd-soc-avs-rt274-objs := rt274.o
-snd-soc-avs-rt286-objs := rt286.o
-snd-soc-avs-rt298-objs := rt298.o
-snd-soc-avs-rt5514-objs := rt5514.o
-snd-soc-avs-rt5663-objs := rt5663.o
-snd-soc-avs-rt5682-objs := rt5682.o
-snd-soc-avs-ssm4567-objs := ssm4567.o
+snd-soc-avs-da7219-y := da7219.o
+snd-soc-avs-dmic-y := dmic.o
+snd-soc-avs-es8336-y := es8336.o
+snd-soc-avs-hdaudio-y := hdaudio.o
+snd-soc-avs-i2s-test-y := i2s_test.o
+snd-soc-avs-max98927-y := max98927.o
+snd-soc-avs-max98357a-y := max98357a.o
+snd-soc-avs-max98373-y := max98373.o
+snd-soc-avs-nau8825-y := nau8825.o
+snd-soc-avs-probe-y := probe.o
+snd-soc-avs-rt274-y := rt274.o
+snd-soc-avs-rt286-y := rt286.o
+snd-soc-avs-rt298-y := rt298.o
+snd-soc-avs-rt5514-y := rt5514.o
+snd-soc-avs-rt5663-y := rt5663.o
+snd-soc-avs-rt5682-y := rt5682.o
+snd-soc-avs-ssm4567-y := ssm4567.o
 
 obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_DA7219) += snd-soc-avs-da7219.o
 obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_DMIC) += snd-soc-avs-dmic.o
diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
index 963005055730..dc6fe110f279 100644
--- a/sound/soc/intel/boards/Makefile
+++ b/sound/soc/intel/boards/Makefile
@@ -1,40 +1,40 @@
 # SPDX-License-Identifier: GPL-2.0-only
-snd-soc-hsw-rt5640-objs := hsw_rt5640.o
-snd-soc-sst-bdw-rt5650-mach-objs := bdw-rt5650.o
-snd-soc-sst-bdw-rt5677-mach-objs := bdw-rt5677.o
-snd-soc-bdw-rt286-objs := bdw_rt286.o
-snd-soc-sst-bxt-da7219_max98357a-objs := bxt_da7219_max98357a.o
-snd-soc-sst-bxt-rt298-objs := bxt_rt298.o
-snd-soc-sst-sof-pcm512x-objs := sof_pcm512x.o
-snd-soc-sst-sof-wm8804-objs := sof_wm8804.o
-snd-soc-sst-bytcr-rt5640-objs := bytcr_rt5640.o
-snd-soc-sst-bytcr-rt5651-objs := bytcr_rt5651.o
-snd-soc-sst-bytcr-wm5102-objs := bytcr_wm5102.o
-snd-soc-sst-cht-bsw-rt5672-objs := cht_bsw_rt5672.o
-snd-soc-sst-cht-bsw-rt5645-objs := cht_bsw_rt5645.o
-snd-soc-sst-cht-bsw-max98090_ti-objs := cht_bsw_max98090_ti.o
-snd-soc-sst-cht-bsw-nau8824-objs := cht_bsw_nau8824.o
-snd-soc-sst-byt-cht-cx2072x-objs := bytcht_cx2072x.o
-snd-soc-sst-byt-cht-da7213-objs := bytcht_da7213.o
-snd-soc-sst-byt-cht-es8316-objs := bytcht_es8316.o
-snd-soc-sst-byt-cht-nocodec-objs := bytcht_nocodec.o
-snd-soc-sof_rt5682-objs := sof_rt5682.o
-snd-soc-sof_cs42l42-objs := sof_cs42l42.o
-snd-soc-sof_es8336-objs := sof_es8336.o
-snd-soc-sof_nau8825-objs := sof_nau8825.o
-snd-soc-sof_da7219-objs := sof_da7219.o
-snd-soc-kbl_da7219_max98357a-objs := kbl_da7219_max98357a.o
-snd-soc-kbl_da7219_max98927-objs := kbl_da7219_max98927.o
-snd-soc-kbl_rt5663_max98927-objs := kbl_rt5663_max98927.o
-snd-soc-kbl_rt5663_rt5514_max98927-objs := kbl_rt5663_rt5514_max98927.o
-snd-soc-kbl_rt5660-objs := kbl_rt5660.o
-snd-soc-skl_rt286-objs := skl_rt286.o
-snd-soc-skl_hda_dsp-objs := skl_hda_dsp_generic.o skl_hda_dsp_common.o
-snd-skl_nau88l25_max98357a-objs := skl_nau88l25_max98357a.o
-snd-soc-skl_nau88l25_ssm4567-objs := skl_nau88l25_ssm4567.o
-snd-soc-ehl-rt5660-objs := ehl_rt5660.o
-snd-soc-sof-ssp-amp-objs := sof_ssp_amp.o
-snd-soc-sof-sdw-objs += sof_sdw.o				\
+snd-soc-hsw-rt5640-y := hsw_rt5640.o
+snd-soc-sst-bdw-rt5650-mach-y := bdw-rt5650.o
+snd-soc-sst-bdw-rt5677-mach-y := bdw-rt5677.o
+snd-soc-bdw-rt286-y := bdw_rt286.o
+snd-soc-sst-bxt-da7219_max98357a-y := bxt_da7219_max98357a.o
+snd-soc-sst-bxt-rt298-y := bxt_rt298.o
+snd-soc-sst-sof-pcm512x-y := sof_pcm512x.o
+snd-soc-sst-sof-wm8804-y := sof_wm8804.o
+snd-soc-sst-bytcr-rt5640-y := bytcr_rt5640.o
+snd-soc-sst-bytcr-rt5651-y := bytcr_rt5651.o
+snd-soc-sst-bytcr-wm5102-y := bytcr_wm5102.o
+snd-soc-sst-cht-bsw-rt5672-y := cht_bsw_rt5672.o
+snd-soc-sst-cht-bsw-rt5645-y := cht_bsw_rt5645.o
+snd-soc-sst-cht-bsw-max98090_ti-y := cht_bsw_max98090_ti.o
+snd-soc-sst-cht-bsw-nau8824-y := cht_bsw_nau8824.o
+snd-soc-sst-byt-cht-cx2072x-y := bytcht_cx2072x.o
+snd-soc-sst-byt-cht-da7213-y := bytcht_da7213.o
+snd-soc-sst-byt-cht-es8316-y := bytcht_es8316.o
+snd-soc-sst-byt-cht-nocodec-y := bytcht_nocodec.o
+snd-soc-sof_rt5682-y := sof_rt5682.o
+snd-soc-sof_cs42l42-y := sof_cs42l42.o
+snd-soc-sof_es8336-y := sof_es8336.o
+snd-soc-sof_nau8825-y := sof_nau8825.o
+snd-soc-sof_da7219-y := sof_da7219.o
+snd-soc-kbl_da7219_max98357a-y := kbl_da7219_max98357a.o
+snd-soc-kbl_da7219_max98927-y := kbl_da7219_max98927.o
+snd-soc-kbl_rt5663_max98927-y := kbl_rt5663_max98927.o
+snd-soc-kbl_rt5663_rt5514_max98927-y := kbl_rt5663_rt5514_max98927.o
+snd-soc-kbl_rt5660-y := kbl_rt5660.o
+snd-soc-skl_rt286-y := skl_rt286.o
+snd-soc-skl_hda_dsp-y := skl_hda_dsp_generic.o skl_hda_dsp_common.o
+snd-skl_nau88l25_max98357a-y := skl_nau88l25_max98357a.o
+snd-soc-skl_nau88l25_ssm4567-y := skl_nau88l25_ssm4567.o
+snd-soc-ehl-rt5660-y := ehl_rt5660.o
+snd-soc-sof-ssp-amp-y := sof_ssp_amp.o
+snd-soc-sof-sdw-y += sof_sdw.o				\
 			sof_sdw_maxim.o sof_sdw_rt_amp.o	\
 			bridge_cs35l56.o			\
 			sof_sdw_rt5682.o sof_sdw_rt700.o	\
@@ -83,20 +83,20 @@ obj-$(CONFIG_SND_SOC_INTEL_SOUNDWIRE_SOF_MACH) += snd-soc-sof-sdw.o
 obj-$(CONFIG_SND_SOC_INTEL_SOF_SSP_AMP_MACH) += snd-soc-sof-ssp-amp.o
 
 # common modules
-snd-soc-intel-hda-dsp-common-objs := hda_dsp_common.o
+snd-soc-intel-hda-dsp-common-y := hda_dsp_common.o
 obj-$(CONFIG_SND_SOC_INTEL_HDA_DSP_COMMON) += snd-soc-intel-hda-dsp-common.o
 
-snd-soc-intel-sof-maxim-common-objs += sof_maxim_common.o
+snd-soc-intel-sof-maxim-common-y += sof_maxim_common.o
 obj-$(CONFIG_SND_SOC_INTEL_SOF_MAXIM_COMMON) += snd-soc-intel-sof-maxim-common.o
 
-snd-soc-intel-sof-realtek-common-objs += sof_realtek_common.o
+snd-soc-intel-sof-realtek-common-y += sof_realtek_common.o
 obj-$(CONFIG_SND_SOC_INTEL_SOF_REALTEK_COMMON) += snd-soc-intel-sof-realtek-common.o
 
-snd-soc-intel-sof-cirrus-common-objs += sof_cirrus_common.o
+snd-soc-intel-sof-cirrus-common-y += sof_cirrus_common.o
 obj-$(CONFIG_SND_SOC_INTEL_SOF_CIRRUS_COMMON) += snd-soc-intel-sof-cirrus-common.o
 
-snd-soc-intel-sof-nuvoton-common-objs += sof_nuvoton_common.o
+snd-soc-intel-sof-nuvoton-common-y += sof_nuvoton_common.o
 obj-$(CONFIG_SND_SOC_INTEL_SOF_NUVOTON_COMMON) += snd-soc-intel-sof-nuvoton-common.o
 
-snd-soc-intel-sof-board-helpers-objs += sof_board_helpers.o
+snd-soc-intel-sof-board-helpers-y += sof_board_helpers.o
 obj-$(CONFIG_SND_SOC_INTEL_SOF_BOARD_HELPERS) += snd-soc-intel-sof-board-helpers.o
diff --git a/sound/soc/intel/catpt/Makefile b/sound/soc/intel/catpt/Makefile
index c393a45795da..f5f6a7e956ce 100644
--- a/sound/soc/intel/catpt/Makefile
+++ b/sound/soc/intel/catpt/Makefile
@@ -1,4 +1,4 @@
-snd-soc-catpt-objs := device.o dsp.o loader.o ipc.o messages.o pcm.o sysfs.o
+snd-soc-catpt-y := device.o dsp.o loader.o ipc.o messages.o pcm.o sysfs.o
 
 # tell define_trace.h where to find the trace header
 CFLAGS_device.o := -I$(src)
diff --git a/sound/soc/intel/common/Makefile b/sound/soc/intel/common/Makefile
index a86457674726..40a74a19c508 100644
--- a/sound/soc/intel/common/Makefile
+++ b/sound/soc/intel/common/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
-snd-soc-sst-dsp-objs := sst-dsp.o
-snd-soc-sst-ipc-objs := sst-ipc.o
-snd-soc-acpi-intel-match-objs := soc-acpi-intel-byt-match.o soc-acpi-intel-cht-match.o \
+snd-soc-sst-dsp-y := sst-dsp.o
+snd-soc-sst-ipc-y := sst-ipc.o
+snd-soc-acpi-intel-match-y := soc-acpi-intel-byt-match.o soc-acpi-intel-cht-match.o \
 	soc-acpi-intel-hsw-bdw-match.o \
 	soc-acpi-intel-skl-match.o soc-acpi-intel-kbl-match.o \
 	soc-acpi-intel-bxt-match.o soc-acpi-intel-glk-match.o \
@@ -15,7 +15,7 @@ snd-soc-acpi-intel-match-objs := soc-acpi-intel-byt-match.o soc-acpi-intel-cht-m
 	soc-acpi-intel-hda-match.o \
 	soc-acpi-intel-sdw-mockup-match.o
 
-snd-soc-acpi-intel-match-objs += soc-acpi-intel-ssp-common.o
+snd-soc-acpi-intel-match-y += soc-acpi-intel-ssp-common.o
 
 obj-$(CONFIG_SND_SOC_INTEL_SST) += snd-soc-sst-dsp.o snd-soc-sst-ipc.o
 obj-$(CONFIG_SND_SOC_ACPI_INTEL_MATCH) += snd-soc-acpi-intel-match.o
diff --git a/sound/soc/intel/keembay/Makefile b/sound/soc/intel/keembay/Makefile
index 9084e8c63854..3da9a6f9ba2a 100644
--- a/sound/soc/intel/keembay/Makefile
+++ b/sound/soc/intel/keembay/Makefile
@@ -1,4 +1,4 @@
-snd-soc-kmb_platform-objs := \
+snd-soc-kmb_platform-y := \
 	        kmb_platform.o
 
 obj-$(CONFIG_SND_SOC_INTEL_KEEMBAY) += snd-soc-kmb_platform.o
diff --git a/sound/soc/intel/skylake/Makefile b/sound/soc/intel/skylake/Makefile
index 1c4649bccec5..ad9be6168428 100644
--- a/sound/soc/intel/skylake/Makefile
+++ b/sound/soc/intel/skylake/Makefile
@@ -1,15 +1,15 @@
 # SPDX-License-Identifier: GPL-2.0-only
-snd-soc-skl-objs := skl.o skl-pcm.o skl-nhlt.o skl-messages.o skl-topology.o \
+snd-soc-skl-y := skl.o skl-pcm.o skl-nhlt.o skl-messages.o skl-topology.o \
 		skl-sst-ipc.o skl-sst-dsp.o cnl-sst-dsp.o skl-sst-cldma.o \
 		skl-sst.o bxt-sst.o cnl-sst.o skl-sst-utils.o
 
 ifdef CONFIG_DEBUG_FS
-  snd-soc-skl-objs += skl-debug.o
+  snd-soc-skl-y += skl-debug.o
 endif
 
 obj-$(CONFIG_SND_SOC_INTEL_SKYLAKE_COMMON) += snd-soc-skl.o
 
 #Skylake Clock device support
-snd-soc-skl-ssp-clk-objs := skl-ssp-clk.o
+snd-soc-skl-ssp-clk-y := skl-ssp-clk.o
 
 obj-$(CONFIG_SND_SOC_INTEL_SKYLAKE_SSP_CLK) += snd-soc-skl-ssp-clk.o
-- 
2.43.0

