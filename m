Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hHKx/vWW"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD3F4C4
	for <linux-sound@vger.kernel.org>; Mon,  4 Dec 2023 13:27:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701725245; x=1733261245;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vybfW8okOhKDKuqze7aphJNARldzBiKxM/kX5eE1GVY=;
  b=hHKx/vWWNpZtkWyiU/Jn9+1Y3inSEI7qFGeSJz8IiuH/52E53TmzoM/N
   DaX7GfBsVvZatq0lwATMSeBIAQP9uqab5f8+EJEePbdML8aQj4txlP6Im
   DwJQFBmdjI+EcQz+CYU4fXa8z6C2/tp3EHHLEhK50u3PQVao2JmS/WTFT
   g80pMAhcnPNsFmV3QizUBySEMjr7GhcxtvfiiQghkER+Yn1OHJbOZVhCM
   pCiTCzFFZZTltlee+KIfZbOAcdba6bmWBHSnJH7PTbtYm0/UVEC2L544K
   elary9LtjSYu+rG/d0i/Cu8JgpgN7yevNDXTTPp7O1GDC6gf2y3u+6O3u
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="479993044"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="479993044"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 13:27:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="12101203"
Received: from akashams-mobl.amr.corp.intel.com (HELO pbossart-mobl3.lan) ([10.255.231.189])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 13:27:24 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: [PATCH 5/5] ASoC: SOF: Intel: pci-mtl: add HDA_ARL PCI support
Date: Mon,  4 Dec 2023 15:27:10 -0600
Message-Id: <20231204212710.185976-6-pierre-louis.bossart@linux.intel.com>
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

Add yet another PCI ID - the hardware shares the same descriptors as
MTL but we use a dedicated firmware binary file to allow for different
signature keys.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/intel/pci-mtl.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/sound/soc/sof/intel/pci-mtl.c b/sound/soc/sof/intel/pci-mtl.c
index 60d5e73cdad2..cacc985d80f4 100644
--- a/sound/soc/sof/intel/pci-mtl.c
+++ b/sound/soc/sof/intel/pci-mtl.c
@@ -50,6 +50,36 @@ static const struct sof_dev_desc mtl_desc = {
 	.ops_free = hda_ops_free,
 };
 
+static const struct sof_dev_desc arl_desc = {
+	.use_acpi_target_states = true,
+	.machines               = snd_soc_acpi_intel_arl_machines,
+	.alt_machines           = snd_soc_acpi_intel_arl_sdw_machines,
+	.resindex_lpe_base      = 0,
+	.resindex_pcicfg_base   = -1,
+	.resindex_imr_base      = -1,
+	.irqindex_host_ipc      = -1,
+	.chip_info = &mtl_chip_info,
+	.ipc_supported_mask     = BIT(SOF_IPC_TYPE_4),
+	.ipc_default            = SOF_IPC_TYPE_4,
+	.dspless_mode_supported = true,         /* Only supported for HDaudio */
+	.default_fw_path = {
+		[SOF_IPC_TYPE_4] = "intel/sof-ipc4/arl",
+	},
+	.default_lib_path = {
+		[SOF_IPC_TYPE_4] = "intel/sof-ipc4-lib/arl",
+	},
+	.default_tplg_path = {
+		[SOF_IPC_TYPE_4] = "intel/sof-ace-tplg",
+	},
+	.default_fw_filename = {
+		[SOF_IPC_TYPE_4] = "sof-arl.ri",
+	},
+	.nocodec_tplg_filename = "sof-arl-nocodec.tplg",
+	.ops = &sof_mtl_ops,
+	.ops_init = sof_mtl_ops_init,
+	.ops_free = hda_ops_free,
+};
+
 static const struct sof_dev_desc arl_s_desc = {
 	.use_acpi_target_states = true,
 	.machines               = snd_soc_acpi_intel_arl_machines,
@@ -84,6 +114,7 @@ static const struct sof_dev_desc arl_s_desc = {
 static const struct pci_device_id sof_pci_ids[] = {
 	{ PCI_DEVICE_DATA(INTEL, HDA_MTL, &mtl_desc) },
 	{ PCI_DEVICE_DATA(INTEL, HDA_ARL_S, &arl_s_desc) },
+	{ PCI_DEVICE_DATA(INTEL, HDA_ARL, &arl_desc) },
 	{ 0, }
 };
 MODULE_DEVICE_TABLE(pci, sof_pci_ids);
-- 
2.39.2

