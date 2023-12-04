Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C+1yvY/z"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 987E6C0
	for <linux-sound@vger.kernel.org>; Mon,  4 Dec 2023 13:27:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701725245; x=1733261245;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NUzKxncryNH2Im6qdiDu5+lgKuMBNFJUzckQdOKZOCQ=;
  b=C+1yvY/zvCT/hxhLFJ3mDXj+8j2r7fB5TExnUSEeMJCQ8LfN0/F/bwJf
   sIswLj14HA87En6ouuoFhvoKlOlva2jbtkmCcnhWPN/W9iGcjis6a38Ig
   m6/RGkz1MJNTo3AEj+mDOAkKo9n64A6f+frxrbs24rgiOtwq3xokXoqNX
   Km66QuWWzXDyydDWThYoORnVDA+DAH39Z8ZKgXcUk7B7BWKNZG0kk51DZ
   xug/UFBHy68q70lXM2N2KUJbOc6kkaBpp+2KQQg1Spe8/iwpE1/mTNzzZ
   2SU4qaHDbuugIS4RrUt51vVs4Daq4doY/0v63ZrCJtsgQ3HN097peQzFh
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="479993041"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="479993041"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 13:27:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="12101194"
Received: from akashams-mobl.amr.corp.intel.com (HELO pbossart-mobl3.lan) ([10.255.231.189])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 13:27:24 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: [PATCH 4/5] ASoC: SOF: Intel: pci-mtl: fix ARL-S definitions
Date: Mon,  4 Dec 2023 15:27:09 -0600
Message-Id: <20231204212710.185976-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231204212710.185976-1-pierre-louis.bossart@linux.intel.com>
References: <20231204212710.185976-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The initial copy/paste from MTL was incorrect, the hardware is
different and requires different descriptors along with a dedicated
firmware binary.

Fixes: 3851831f529e ("ASoC: SOF: Intel: pci-mtl: use ARL specific firmware definitions")
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/intel/hda.h     |  1 +
 sound/soc/sof/intel/mtl.c     | 28 ++++++++++++++++++++++++++++
 sound/soc/sof/intel/pci-mtl.c | 12 ++++++------
 3 files changed, 35 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index d628d6a3a7e5..1592e27bc14d 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -882,6 +882,7 @@ extern const struct sof_intel_dsp_desc ehl_chip_info;
 extern const struct sof_intel_dsp_desc jsl_chip_info;
 extern const struct sof_intel_dsp_desc adls_chip_info;
 extern const struct sof_intel_dsp_desc mtl_chip_info;
+extern const struct sof_intel_dsp_desc arl_s_chip_info;
 extern const struct sof_intel_dsp_desc lnl_chip_info;
 
 /* Probes support */
diff --git a/sound/soc/sof/intel/mtl.c b/sound/soc/sof/intel/mtl.c
index f941e2c49d78..bcf963976189 100644
--- a/sound/soc/sof/intel/mtl.c
+++ b/sound/soc/sof/intel/mtl.c
@@ -757,3 +757,31 @@ const struct sof_intel_dsp_desc mtl_chip_info = {
 	.hw_ip_version = SOF_INTEL_ACE_1_0,
 };
 EXPORT_SYMBOL_NS(mtl_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
+
+const struct sof_intel_dsp_desc arl_s_chip_info = {
+	.cores_num = 2,
+	.init_core_mask = BIT(0),
+	.host_managed_cores_mask = BIT(0),
+	.ipc_req = MTL_DSP_REG_HFIPCXIDR,
+	.ipc_req_mask = MTL_DSP_REG_HFIPCXIDR_BUSY,
+	.ipc_ack = MTL_DSP_REG_HFIPCXIDA,
+	.ipc_ack_mask = MTL_DSP_REG_HFIPCXIDA_DONE,
+	.ipc_ctl = MTL_DSP_REG_HFIPCXCTL,
+	.rom_status_reg = MTL_DSP_ROM_STS,
+	.rom_init_timeout	= 300,
+	.ssp_count = MTL_SSP_COUNT,
+	.ssp_base_offset = CNL_SSP_BASE_OFFSET,
+	.sdw_shim_base = SDW_SHIM_BASE_ACE,
+	.sdw_alh_base = SDW_ALH_BASE_ACE,
+	.d0i3_offset = MTL_HDA_VS_D0I3C,
+	.read_sdw_lcount =  hda_sdw_check_lcount_common,
+	.enable_sdw_irq = mtl_enable_sdw_irq,
+	.check_sdw_irq = mtl_dsp_check_sdw_irq,
+	.check_sdw_wakeen_irq = hda_sdw_check_wakeen_irq_common,
+	.check_ipc_irq = mtl_dsp_check_ipc_irq,
+	.cl_init = mtl_dsp_cl_init,
+	.power_down_dsp = mtl_power_down_dsp,
+	.disable_interrupts = mtl_dsp_disable_interrupts,
+	.hw_ip_version = SOF_INTEL_ACE_1_0,
+};
+EXPORT_SYMBOL_NS(arl_s_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
diff --git a/sound/soc/sof/intel/pci-mtl.c b/sound/soc/sof/intel/pci-mtl.c
index 0f378f45486d..60d5e73cdad2 100644
--- a/sound/soc/sof/intel/pci-mtl.c
+++ b/sound/soc/sof/intel/pci-mtl.c
@@ -50,7 +50,7 @@ static const struct sof_dev_desc mtl_desc = {
 	.ops_free = hda_ops_free,
 };
 
-static const struct sof_dev_desc arl_desc = {
+static const struct sof_dev_desc arl_s_desc = {
 	.use_acpi_target_states = true,
 	.machines               = snd_soc_acpi_intel_arl_machines,
 	.alt_machines           = snd_soc_acpi_intel_arl_sdw_machines,
@@ -58,21 +58,21 @@ static const struct sof_dev_desc arl_desc = {
 	.resindex_pcicfg_base   = -1,
 	.resindex_imr_base      = -1,
 	.irqindex_host_ipc      = -1,
-	.chip_info = &mtl_chip_info,
+	.chip_info = &arl_s_chip_info,
 	.ipc_supported_mask     = BIT(SOF_IPC_TYPE_4),
 	.ipc_default            = SOF_IPC_TYPE_4,
 	.dspless_mode_supported = true,         /* Only supported for HDaudio */
 	.default_fw_path = {
-		[SOF_IPC_TYPE_4] = "intel/sof-ipc4/arl",
+		[SOF_IPC_TYPE_4] = "intel/sof-ipc4/arl-s",
 	},
 	.default_lib_path = {
-		[SOF_IPC_TYPE_4] = "intel/sof-ipc4-lib/arl",
+		[SOF_IPC_TYPE_4] = "intel/sof-ipc4-lib/arl-s",
 	},
 	.default_tplg_path = {
 		[SOF_IPC_TYPE_4] = "intel/sof-ace-tplg",
 	},
 	.default_fw_filename = {
-		[SOF_IPC_TYPE_4] = "sof-arl.ri",
+		[SOF_IPC_TYPE_4] = "sof-arl-s.ri",
 	},
 	.nocodec_tplg_filename = "sof-arl-nocodec.tplg",
 	.ops = &sof_mtl_ops,
@@ -83,7 +83,7 @@ static const struct sof_dev_desc arl_desc = {
 /* PCI IDs */
 static const struct pci_device_id sof_pci_ids[] = {
 	{ PCI_DEVICE_DATA(INTEL, HDA_MTL, &mtl_desc) },
-	{ PCI_DEVICE_DATA(INTEL, HDA_ARL_S, &arl_desc) },
+	{ PCI_DEVICE_DATA(INTEL, HDA_ARL_S, &arl_s_desc) },
 	{ 0, }
 };
 MODULE_DEVICE_TABLE(pci, sof_pci_ids);
-- 
2.39.2

