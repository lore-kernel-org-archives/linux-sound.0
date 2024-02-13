Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A96217994
	for <linux-sound@vger.kernel.org>; Tue, 13 Feb 2024 08:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707811454; cv=none; b=JOwYkRDjU5ZmiPh/Tt9ilMTv5I6bzUg5qtkfFOs5XeBxtr6DYqwOGz4Sk04+3cus0xj1pqnsKTtU2lvDJFhJEA9pMNxSb5QyUwZuUIpLgRpuBQxVqW0BRjmhUKyJXp5odPel/swPc2Ou8kD33clpWFmEnNeCdyvmcq0T9MW7f8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707811454; c=relaxed/simple;
	bh=+F5APTa72uFet9YvOEz+MxaX8GzSvPLtOZl7q05UN6c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ncczd6fka+e7748W4aPZNt8xKwrvL8fuC2x9aIF9J0Jvk6uOs1t3FwEfbQRj3IM5MdGuUfeaAONOG9y27Oz7tc8rESR3GkD92f7ChcTF8Gwv2Fm+1u95ER/0dCj8YaIrYOwxnNOYMapivgUpTUB/qtPAC+O97I1XFJivv1jkbRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X/kJpSy2; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X/kJpSy2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707811453; x=1739347453;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+F5APTa72uFet9YvOEz+MxaX8GzSvPLtOZl7q05UN6c=;
  b=X/kJpSy2xmxpKSzpLQcaxfOgeowVtqQalDUsiyNDBmBZZXghjlYVvclw
   9TgGSzZV5NkUKxeqqGNhFczhLoMaVkwwITjbY5oqcb1KhtdVM9kVpJBt9
   221flkQrrl4BhndY4ONQokw+Z6673kOUwRnpflweEeMu/sLu5GIqkbI4W
   eILImjaFBYZx0ZXGU2/qVd9pQc1UfRs/ZW3foKm8ObzC0q9ht+2jD/53B
   sHn1+eCqNTG79LnLfQZRrXJdgcvHb6wDNkRRLXJ8o6aopVe4uFGMDfzc9
   1/laHyDwXyNs8LZDe1K0nCp1wG+7wjzzPhaPox6V+9M16ttNjsDbbj3gT
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1713098"
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="1713098"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 00:04:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="2804332"
Received: from dcoroian-mobl.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.249.42.253])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 00:04:11 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH 1/2] ASoC: SOF: Intel: pci-tgl: Change the default paths and firmware names
Date: Tue, 13 Feb 2024 10:04:17 +0200
Message-ID: <20240213080418.21256-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240213080418.21256-1-peter.ujfalusi@linux.intel.com>
References: <20240213080418.21256-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The currently used paths and firmware name reflects the reference firmware
convention:

default_fw_path:     intel/avs/{platform_name}
default_lib_path:    intel/avs-lib/{platform_name}
default_tplg_path:   intel/avs-tplg
default_fw_filename: dsp_basefw.bin

The SOF supports building the firmware for cAVS2.5 platforms using IPC4 and
it is the preferred IPC4 implementation to be used on these devices.

Change the paths and firmware names to reflect this:

default_fw_path:     intel/sof-ipc4/{platform_name}
default_lib_path:    intel/sof-ipc4-lib/{platform_name}
default_tplg_path:   intel/sof-ipc4-tplg
default_fw_filename: sof-{platform_name}.ri

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/pci-tgl.c | 64 +++++++++++++++++------------------
 1 file changed, 32 insertions(+), 32 deletions(-)

diff --git a/sound/soc/sof/intel/pci-tgl.c b/sound/soc/sof/intel/pci-tgl.c
index 0660d4b2ac96..a361ee9d1107 100644
--- a/sound/soc/sof/intel/pci-tgl.c
+++ b/sound/soc/sof/intel/pci-tgl.c
@@ -33,18 +33,18 @@ static const struct sof_dev_desc tgl_desc = {
 	.dspless_mode_supported	= true,		/* Only supported for HDaudio */
 	.default_fw_path = {
 		[SOF_IPC_TYPE_3] = "intel/sof",
-		[SOF_IPC_TYPE_4] = "intel/avs/tgl",
+		[SOF_IPC_TYPE_4] = "intel/sof-ipc4/tgl",
 	},
 	.default_lib_path = {
-		[SOF_IPC_TYPE_4] = "intel/avs-lib/tgl",
+		[SOF_IPC_TYPE_4] = "intel/sof-ipc4-lib/tgl",
 	},
 	.default_tplg_path = {
 		[SOF_IPC_TYPE_3] = "intel/sof-tplg",
-		[SOF_IPC_TYPE_4] = "intel/avs-tplg",
+		[SOF_IPC_TYPE_4] = "intel/sof-ipc4-tplg",
 	},
 	.default_fw_filename = {
 		[SOF_IPC_TYPE_3] = "sof-tgl.ri",
-		[SOF_IPC_TYPE_4] = "dsp_basefw.bin",
+		[SOF_IPC_TYPE_4] = "sof-tgl.ri",
 	},
 	.nocodec_tplg_filename = "sof-tgl-nocodec.tplg",
 	.ops = &sof_tgl_ops,
@@ -66,18 +66,18 @@ static const struct sof_dev_desc tglh_desc = {
 	.dspless_mode_supported	= true,		/* Only supported for HDaudio */
 	.default_fw_path = {
 		[SOF_IPC_TYPE_3] = "intel/sof",
-		[SOF_IPC_TYPE_4] = "intel/avs/tgl-h",
+		[SOF_IPC_TYPE_4] = "intel/sof-ipc4/tgl-h",
 	},
 	.default_lib_path = {
-		[SOF_IPC_TYPE_4] = "intel/avs-lib/tgl-h",
+		[SOF_IPC_TYPE_4] = "intel/sof-ipc4-lib/tgl-h",
 	},
 	.default_tplg_path = {
 		[SOF_IPC_TYPE_3] = "intel/sof-tplg",
-		[SOF_IPC_TYPE_4] = "intel/avs-tplg",
+		[SOF_IPC_TYPE_4] = "intel/sof-ipc4-tplg",
 	},
 	.default_fw_filename = {
 		[SOF_IPC_TYPE_3] = "sof-tgl-h.ri",
-		[SOF_IPC_TYPE_4] = "dsp_basefw.bin",
+		[SOF_IPC_TYPE_4] = "sof-tgl-h.ri",
 	},
 	.nocodec_tplg_filename = "sof-tgl-nocodec.tplg",
 	.ops = &sof_tgl_ops,
@@ -98,18 +98,18 @@ static const struct sof_dev_desc ehl_desc = {
 	.dspless_mode_supported	= true,		/* Only supported for HDaudio */
 	.default_fw_path = {
 		[SOF_IPC_TYPE_3] = "intel/sof",
-		[SOF_IPC_TYPE_4] = "intel/avs/ehl",
+		[SOF_IPC_TYPE_4] = "intel/sof-ipc4/ehl",
 	},
 	.default_lib_path = {
-		[SOF_IPC_TYPE_4] = "intel/avs-lib/ehl",
+		[SOF_IPC_TYPE_4] = "intel/sof-ipc4-lib/ehl",
 	},
 	.default_tplg_path = {
 		[SOF_IPC_TYPE_3] = "intel/sof-tplg",
-		[SOF_IPC_TYPE_4] = "intel/avs-tplg",
+		[SOF_IPC_TYPE_4] = "intel/sof-ipc4-tplg",
 	},
 	.default_fw_filename = {
 		[SOF_IPC_TYPE_3] = "sof-ehl.ri",
-		[SOF_IPC_TYPE_4] = "dsp_basefw.bin",
+		[SOF_IPC_TYPE_4] = "sof-ehl.ri",
 	},
 	.nocodec_tplg_filename = "sof-ehl-nocodec.tplg",
 	.ops = &sof_tgl_ops,
@@ -131,18 +131,18 @@ static const struct sof_dev_desc adls_desc = {
 	.dspless_mode_supported	= true,		/* Only supported for HDaudio */
 	.default_fw_path = {
 		[SOF_IPC_TYPE_3] = "intel/sof",
-		[SOF_IPC_TYPE_4] = "intel/avs/adl-s",
+		[SOF_IPC_TYPE_4] = "intel/sof-ipc4/adl-s",
 	},
 	.default_lib_path = {
-		[SOF_IPC_TYPE_4] = "intel/avs-lib/adl-s",
+		[SOF_IPC_TYPE_4] = "intel/sof-ipc4-lib/adl-s",
 	},
 	.default_tplg_path = {
 		[SOF_IPC_TYPE_3] = "intel/sof-tplg",
-		[SOF_IPC_TYPE_4] = "intel/avs-tplg",
+		[SOF_IPC_TYPE_4] = "intel/sof-ipc4-tplg",
 	},
 	.default_fw_filename = {
 		[SOF_IPC_TYPE_3] = "sof-adl-s.ri",
-		[SOF_IPC_TYPE_4] = "dsp_basefw.bin",
+		[SOF_IPC_TYPE_4] = "sof-adl-s.ri",
 	},
 	.nocodec_tplg_filename = "sof-adl-nocodec.tplg",
 	.ops = &sof_tgl_ops,
@@ -164,18 +164,18 @@ static const struct sof_dev_desc adl_desc = {
 	.dspless_mode_supported	= true,		/* Only supported for HDaudio */
 	.default_fw_path = {
 		[SOF_IPC_TYPE_3] = "intel/sof",
-		[SOF_IPC_TYPE_4] = "intel/avs/adl",
+		[SOF_IPC_TYPE_4] = "intel/sof-ipc4/adl",
 	},
 	.default_lib_path = {
-		[SOF_IPC_TYPE_4] = "intel/avs-lib/adl",
+		[SOF_IPC_TYPE_4] = "intel/sof-ipc4-lib/adl",
 	},
 	.default_tplg_path = {
 		[SOF_IPC_TYPE_3] = "intel/sof-tplg",
-		[SOF_IPC_TYPE_4] = "intel/avs-tplg",
+		[SOF_IPC_TYPE_4] = "intel/sof-ipc4-tplg",
 	},
 	.default_fw_filename = {
 		[SOF_IPC_TYPE_3] = "sof-adl.ri",
-		[SOF_IPC_TYPE_4] = "dsp_basefw.bin",
+		[SOF_IPC_TYPE_4] = "sof-adl.ri",
 	},
 	.nocodec_tplg_filename = "sof-adl-nocodec.tplg",
 	.ops = &sof_tgl_ops,
@@ -197,18 +197,18 @@ static const struct sof_dev_desc adl_n_desc = {
 	.dspless_mode_supported	= true,		/* Only supported for HDaudio */
 	.default_fw_path = {
 		[SOF_IPC_TYPE_3] = "intel/sof",
-		[SOF_IPC_TYPE_4] = "intel/avs/adl-n",
+		[SOF_IPC_TYPE_4] = "intel/sof-ipc4/adl-n",
 	},
 	.default_lib_path = {
-		[SOF_IPC_TYPE_4] = "intel/avs-lib/adl-n",
+		[SOF_IPC_TYPE_4] = "intel/sof-ipc4-lib/adl-n",
 	},
 	.default_tplg_path = {
 		[SOF_IPC_TYPE_3] = "intel/sof-tplg",
-		[SOF_IPC_TYPE_4] = "intel/avs-tplg",
+		[SOF_IPC_TYPE_4] = "intel/sof-ipc4-tplg",
 	},
 	.default_fw_filename = {
 		[SOF_IPC_TYPE_3] = "sof-adl-n.ri",
-		[SOF_IPC_TYPE_4] = "dsp_basefw.bin",
+		[SOF_IPC_TYPE_4] = "sof-adl-n.ri",
 	},
 	.nocodec_tplg_filename = "sof-adl-nocodec.tplg",
 	.ops = &sof_tgl_ops,
@@ -230,18 +230,18 @@ static const struct sof_dev_desc rpls_desc = {
 	.dspless_mode_supported	= true,		/* Only supported for HDaudio */
 	.default_fw_path = {
 		[SOF_IPC_TYPE_3] = "intel/sof",
-		[SOF_IPC_TYPE_4] = "intel/avs/rpl-s",
+		[SOF_IPC_TYPE_4] = "intel/sof-ipc4/rpl-s",
 	},
 	.default_lib_path = {
-		[SOF_IPC_TYPE_4] = "intel/avs-lib/rpl-s",
+		[SOF_IPC_TYPE_4] = "intel/sof-ipc4-lib/rpl-s",
 	},
 	.default_tplg_path = {
 		[SOF_IPC_TYPE_3] = "intel/sof-tplg",
-		[SOF_IPC_TYPE_4] = "intel/avs-tplg",
+		[SOF_IPC_TYPE_4] = "intel/sof-ipc4-tplg",
 	},
 	.default_fw_filename = {
 		[SOF_IPC_TYPE_3] = "sof-rpl-s.ri",
-		[SOF_IPC_TYPE_4] = "dsp_basefw.bin",
+		[SOF_IPC_TYPE_4] = "sof-rpl-s.ri",
 	},
 	.nocodec_tplg_filename = "sof-rpl-nocodec.tplg",
 	.ops = &sof_tgl_ops,
@@ -263,18 +263,18 @@ static const struct sof_dev_desc rpl_desc = {
 	.dspless_mode_supported	= true,		/* Only supported for HDaudio */
 	.default_fw_path = {
 		[SOF_IPC_TYPE_3] = "intel/sof",
-		[SOF_IPC_TYPE_4] = "intel/avs/rpl",
+		[SOF_IPC_TYPE_4] = "intel/sof-ipc4/rpl",
 	},
 	.default_lib_path = {
-		[SOF_IPC_TYPE_4] = "intel/avs-lib/rpl",
+		[SOF_IPC_TYPE_4] = "intel/sof-ipc4-lib/rpl",
 	},
 	.default_tplg_path = {
 		[SOF_IPC_TYPE_3] = "intel/sof-tplg",
-		[SOF_IPC_TYPE_4] = "intel/avs-tplg",
+		[SOF_IPC_TYPE_4] = "intel/sof-ipc4-tplg",
 	},
 	.default_fw_filename = {
 		[SOF_IPC_TYPE_3] = "sof-rpl.ri",
-		[SOF_IPC_TYPE_4] = "dsp_basefw.bin",
+		[SOF_IPC_TYPE_4] = "sof-rpl.ri",
 	},
 	.nocodec_tplg_filename = "sof-rpl-nocodec.tplg",
 	.ops = &sof_tgl_ops,
-- 
2.43.0

