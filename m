Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A0A13AF6
	for <linux-sound@vger.kernel.org>; Fri, 15 Dec 2023 08:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R/nl844l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702628247; x=1734164247;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DELCmHn2rLPgGpXQonJqBtlZXcCxRqE5FP9uGZArDh0=;
  b=R/nl844lMrGFIKK9d9a+HSLoaiP+9aGDe9cfFeGKm67rGAu89iS9y9Ih
   OHB81ck9IrwSdX9BdghoxvxlphoEyQW0Gwib2qoYvjJVCFyAhwwWzgHqB
   rvJgP5bvhjm+cratRHlYheEcDhRNCrRNyHlpgde/McMF6us3WxbqGJXG5
   h6igrTDzGYxM7qk4DlErP1inqKo7hn5iR3oUbm+Et++1jSV8n0zFDdihS
   ayRQXTNpLP6c2CO5lzQnRxDsbKbl0nuVAjMSZiivDQxo/g50AfyV5unIi
   eXmEh2gPd/A2jBw0o8QdQxc+exSCnlMiQBne6q9kou6RkVFwNaMptjniF
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="2414128"
X-IronPort-AV: E=Sophos;i="6.04,278,1695711600"; 
   d="scan'208";a="2414128"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 00:17:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,278,1695711600"; 
   d="scan'208";a="16206829"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 00:17:25 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 2/3] ASoC: SOF: IPC4: query fw_context_save feature from fw
Date: Fri, 15 Dec 2023 16:31:01 +0800
Message-Id: <20231215083102.3064200-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231215083102.3064200-1-yung-chuan.liao@linux.intel.com>
References: <20231215083102.3064200-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Rander Wang <rander.wang@intel.com>

Driver queries fw_context_save feature when fw is ready and can skip
library reload with this feature since library is saved in persistent
memory. The default value of fw_context_save is true unless fw reports
false.

Signed-off-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/intel/lnl.c   | 2 ++
 sound/soc/sof/intel/mtl.c   | 2 ++
 sound/soc/sof/intel/tgl.c   | 2 ++
 sound/soc/sof/ipc4-loader.c | 3 +++
 sound/soc/sof/ipc4-priv.h   | 1 +
 5 files changed, 10 insertions(+)

diff --git a/sound/soc/sof/intel/lnl.c b/sound/soc/sof/intel/lnl.c
index dfbe4067a349..ec2a346100f3 100644
--- a/sound/soc/sof/intel/lnl.c
+++ b/sound/soc/sof/intel/lnl.c
@@ -156,6 +156,8 @@ int sof_lnl_ops_init(struct snd_sof_dev *sdev)
 
 	ipc4_data->mtrace_type = SOF_IPC4_MTRACE_INTEL_CAVS_2;
 
+	ipc4_data->fw_context_save = true;
+
 	/* External library loading support */
 	ipc4_data->load_library = hda_dsp_ipc4_load_library;
 
diff --git a/sound/soc/sof/intel/mtl.c b/sound/soc/sof/intel/mtl.c
index d4b666f125ea..df05dc77b8d5 100644
--- a/sound/soc/sof/intel/mtl.c
+++ b/sound/soc/sof/intel/mtl.c
@@ -718,6 +718,8 @@ int sof_mtl_ops_init(struct snd_sof_dev *sdev)
 
 	ipc4_data->mtrace_type = SOF_IPC4_MTRACE_INTEL_CAVS_2;
 
+	ipc4_data->fw_context_save = true;
+
 	/* External library loading support */
 	ipc4_data->load_library = hda_dsp_ipc4_load_library;
 
diff --git a/sound/soc/sof/intel/tgl.c b/sound/soc/sof/intel/tgl.c
index d890cac6cb01..c2bb04c89b9d 100644
--- a/sound/soc/sof/intel/tgl.c
+++ b/sound/soc/sof/intel/tgl.c
@@ -91,6 +91,8 @@ int sof_tgl_ops_init(struct snd_sof_dev *sdev)
 
 		ipc4_data->mtrace_type = SOF_IPC4_MTRACE_INTEL_CAVS_2;
 
+		ipc4_data->fw_context_save = true;
+
 		/* External library loading support */
 		ipc4_data->load_library = hda_dsp_ipc4_load_library;
 
diff --git a/sound/soc/sof/ipc4-loader.c b/sound/soc/sof/ipc4-loader.c
index eaa04762eb11..3539b0a66e1b 100644
--- a/sound/soc/sof/ipc4-loader.c
+++ b/sound/soc/sof/ipc4-loader.c
@@ -391,6 +391,9 @@ int sof_ipc4_query_fw_configuration(struct snd_sof_dev *sdev)
 				goto out;
 			}
 			break;
+		case SOF_IPC4_FW_CONTEXT_SAVE:
+			ipc4_data->fw_context_save = *tuple->value;
+			break;
 		default:
 			break;
 		}
diff --git a/sound/soc/sof/ipc4-priv.h b/sound/soc/sof/ipc4-priv.h
index fea93b693f4d..1d39836d5efa 100644
--- a/sound/soc/sof/ipc4-priv.h
+++ b/sound/soc/sof/ipc4-priv.h
@@ -81,6 +81,7 @@ struct sof_ipc4_fw_data {
 	u32 mtrace_log_bytes;
 	int max_num_pipelines;
 	u32 max_libs_count;
+	bool fw_context_save;
 
 	int (*load_library)(struct snd_sof_dev *sdev,
 			    struct sof_ipc4_fw_library *fw_lib, bool reload);
-- 
2.25.1

