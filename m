Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7592A1C280
	for <linux-sound@vger.kernel.org>; Mon, 27 May 2024 19:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716839106; cv=none; b=b6rbI6ZcZ5GRRm/VURg1dhRFPQIIU/nbMS8qfc+9tGd64WRwNAfHY6FMxqcGQXb26HotuSNuHbfJRSFWw08Qj7Iu53AtQtBqQEif661qQmO9eKBY/XZ92Sm57fAKqC6XZ3px+uxdUDkBZUKy8BCGj7oYp6DledjsvKGU7p0nJ3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716839106; c=relaxed/simple;
	bh=xm85HU+bJyfDh+V6EKJbC59iQosjDzquy/pZg3QMON0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qjtF8I/4tWv9RR5Gcgr/F5hHhChCrfwz6LO7C5QbKxRZDyjLVS+WyDzsYiEZ5q8xJWtYYyD9ZSdX/aV9XKLZRY9r9r27EDCKURsGt+9svvXB8ZS3rebBahtocVf/My5dDAt4ISkWup/ruEAkVsmNPSpsLnDC7tgGuiCAspnVlrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QvThRoc+; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QvThRoc+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716839105; x=1748375105;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xm85HU+bJyfDh+V6EKJbC59iQosjDzquy/pZg3QMON0=;
  b=QvThRoc+ywPbVrt6SQbYagbJvVSu0mNEwVwsXZoMp4jYHelFckZ5PkbM
   ifZKMCHNzuu41loveVeDatKk02lIiZRyili43Ii2zDmvYDzGAtY5o8Udx
   4Ov8WwMlXKucsxvwb/PS2cTHJaMAQUDdPbjJzUXdnii2sD2RRD7Hy12Od
   3vQ4rS0+IVdewUQ9mgNktdjJns9jtMrKJb7GYdPcnuAMIFQsWbdzNL/Nb
   TvdF2FII5or9dwfXCwTRihz98QGt+4EEd61+YmtSPgbK5pPo/evvBJI4A
   YXPhoMGcbKEQIjk7AwYbfDzlGl3SYKg0d7hzwxrxs5/QTE4FumsbTVhma
   Q==;
X-CSE-ConnectionGUID: IiiKfloRT9yxyhhpgYEY/g==
X-CSE-MsgGUID: HANxSkL6TTmW7NqAd/LpWw==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="30679490"
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="30679490"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 12:45:04 -0700
X-CSE-ConnectionGUID: QjZKROK0T9ycnmSnLeTsUQ==
X-CSE-MsgGUID: NoCHX2IFRUWYZyXfMSrsEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="39280547"
Received: from unknown (HELO pbossart-mobl6.lan) ([10.125.110.221])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 12:45:04 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Subject: [PATCH 3/4] ASoC: SOF: reorder MODULE_ definitions
Date: Mon, 27 May 2024 14:44:13 -0500
Message-ID: <20240527194414.166156-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240527194414.166156-1-pierre-louis.bossart@linux.intel.com>
References: <20240527194414.166156-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Follow the arbitrary Intel convention order to allow for easier grep.

MODULE_LICENSE
MODULE_DESCRIPTION
MODULE_IMPORT

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/amd/acp-common.c                 | 4 ++--
 sound/soc/sof/amd/acp.c                        | 2 +-
 sound/soc/sof/core.c                           | 2 +-
 sound/soc/sof/nocodec.c                        | 2 +-
 sound/soc/sof/sof-client-ipc-flood-test.c      | 2 +-
 sound/soc/sof/sof-client-ipc-kernel-injector.c | 2 +-
 sound/soc/sof/sof-client-ipc-msg-injector.c    | 2 +-
 sound/soc/sof/sof-client-probes.c              | 2 +-
 sound/soc/sof/xtensa/core.c                    | 2 +-
 9 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/sound/soc/sof/amd/acp-common.c b/sound/soc/sof/amd/acp-common.c
index b26fa471b431..81bb93e98358 100644
--- a/sound/soc/sof/amd/acp-common.c
+++ b/sound/soc/sof/amd/acp-common.c
@@ -258,8 +258,8 @@ const struct snd_sof_dsp_ops sof_acp_common_ops = {
 };
 EXPORT_SYMBOL_NS(sof_acp_common_ops, SND_SOC_SOF_AMD_COMMON);
 
+MODULE_LICENSE("Dual BSD/GPL");
+MODULE_DESCRIPTION("ACP SOF COMMON Driver");
 MODULE_IMPORT_NS(SND_SOC_SOF_AMD_COMMON);
 MODULE_IMPORT_NS(SND_SOC_SOF_XTENSA);
 MODULE_IMPORT_NS(SOUNDWIRE_AMD_INIT);
-MODULE_DESCRIPTION("ACP SOF COMMON Driver");
-MODULE_LICENSE("Dual BSD/GPL");
diff --git a/sound/soc/sof/amd/acp.c b/sound/soc/sof/amd/acp.c
index c12c7f820529..74fd5f2b148b 100644
--- a/sound/soc/sof/amd/acp.c
+++ b/sound/soc/sof/amd/acp.c
@@ -801,7 +801,7 @@ void amd_sof_acp_remove(struct snd_sof_dev *sdev)
 }
 EXPORT_SYMBOL_NS(amd_sof_acp_remove, SND_SOC_SOF_AMD_COMMON);
 
+MODULE_LICENSE("Dual BSD/GPL");
 MODULE_DESCRIPTION("AMD ACP sof driver");
 MODULE_IMPORT_NS(SOUNDWIRE_AMD_INIT);
 MODULE_IMPORT_NS(SND_AMD_SOUNDWIRE_ACPI);
-MODULE_LICENSE("Dual BSD/GPL");
diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index 0a4917136ff9..83fe0401baf8 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -769,7 +769,7 @@ void sof_machine_unregister(struct snd_sof_dev *sdev, void *pdata)
 EXPORT_SYMBOL(sof_machine_unregister);
 
 MODULE_AUTHOR("Liam Girdwood");
-MODULE_DESCRIPTION("Sound Open Firmware (SOF) Core");
 MODULE_LICENSE("Dual BSD/GPL");
+MODULE_DESCRIPTION("Sound Open Firmware (SOF) Core");
 MODULE_ALIAS("platform:sof-audio");
 MODULE_IMPORT_NS(SND_SOC_SOF_CLIENT);
diff --git a/sound/soc/sof/nocodec.c b/sound/soc/sof/nocodec.c
index fdcbe33d3dcf..b12b3d865ae3 100644
--- a/sound/soc/sof/nocodec.c
+++ b/sound/soc/sof/nocodec.c
@@ -110,7 +110,7 @@ static struct platform_driver sof_nocodec_audio = {
 };
 module_platform_driver(sof_nocodec_audio)
 
+MODULE_LICENSE("Dual BSD/GPL");
 MODULE_DESCRIPTION("ASoC sof nocodec");
 MODULE_AUTHOR("Liam Girdwood");
-MODULE_LICENSE("Dual BSD/GPL");
 MODULE_ALIAS("platform:sof-nocodec");
diff --git a/sound/soc/sof/sof-client-ipc-flood-test.c b/sound/soc/sof/sof-client-ipc-flood-test.c
index 435614926092..e7d2001140e8 100644
--- a/sound/soc/sof/sof-client-ipc-flood-test.c
+++ b/sound/soc/sof/sof-client-ipc-flood-test.c
@@ -394,6 +394,6 @@ static struct auxiliary_driver sof_ipc_flood_client_drv = {
 
 module_auxiliary_driver(sof_ipc_flood_client_drv);
 
-MODULE_DESCRIPTION("SOF IPC Flood Test Client Driver");
 MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("SOF IPC Flood Test Client Driver");
 MODULE_IMPORT_NS(SND_SOC_SOF_CLIENT);
diff --git a/sound/soc/sof/sof-client-ipc-kernel-injector.c b/sound/soc/sof/sof-client-ipc-kernel-injector.c
index 6973b6690df4..d3f541069b24 100644
--- a/sound/soc/sof/sof-client-ipc-kernel-injector.c
+++ b/sound/soc/sof/sof-client-ipc-kernel-injector.c
@@ -157,6 +157,6 @@ static struct auxiliary_driver sof_msg_inject_client_drv = {
 
 module_auxiliary_driver(sof_msg_inject_client_drv);
 
-MODULE_DESCRIPTION("SOF IPC Kernel Injector Client Driver");
 MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("SOF IPC Kernel Injector Client Driver");
 MODULE_IMPORT_NS(SND_SOC_SOF_CLIENT);
diff --git a/sound/soc/sof/sof-client-ipc-msg-injector.c b/sound/soc/sof/sof-client-ipc-msg-injector.c
index af22e6421029..d0f8beb9d000 100644
--- a/sound/soc/sof/sof-client-ipc-msg-injector.c
+++ b/sound/soc/sof/sof-client-ipc-msg-injector.c
@@ -335,6 +335,6 @@ static struct auxiliary_driver sof_msg_inject_client_drv = {
 
 module_auxiliary_driver(sof_msg_inject_client_drv);
 
-MODULE_DESCRIPTION("SOF IPC Message Injector Client Driver");
 MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("SOF IPC Message Injector Client Driver");
 MODULE_IMPORT_NS(SND_SOC_SOF_CLIENT);
diff --git a/sound/soc/sof/sof-client-probes.c b/sound/soc/sof/sof-client-probes.c
index b8f297307565..ccc7d38ddc38 100644
--- a/sound/soc/sof/sof-client-probes.c
+++ b/sound/soc/sof/sof-client-probes.c
@@ -540,6 +540,6 @@ static struct auxiliary_driver sof_probes_client_drv = {
 
 module_auxiliary_driver(sof_probes_client_drv);
 
-MODULE_DESCRIPTION("SOF Probes Client Driver");
 MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("SOF Probes Client Driver");
 MODULE_IMPORT_NS(SND_SOC_SOF_CLIENT);
diff --git a/sound/soc/sof/xtensa/core.c b/sound/soc/sof/xtensa/core.c
index ccbc3fcdadd5..3cf8c84beff9 100644
--- a/sound/soc/sof/xtensa/core.c
+++ b/sound/soc/sof/xtensa/core.c
@@ -151,5 +151,5 @@ const struct dsp_arch_ops sof_xtensa_arch_ops = {
 };
 EXPORT_SYMBOL_NS(sof_xtensa_arch_ops, SND_SOC_SOF_XTENSA);
 
-MODULE_DESCRIPTION("SOF Xtensa DSP support");
 MODULE_LICENSE("Dual BSD/GPL");
+MODULE_DESCRIPTION("SOF Xtensa DSP support");
-- 
2.43.0

