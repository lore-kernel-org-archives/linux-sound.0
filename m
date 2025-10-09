Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC641862A
	for <linux-sound@vger.kernel.org>; Thu,  9 Oct 2025 09:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760002838; cv=none; b=r/lRCg4lQUTwFy1o1UGdzkdNyx9ht2GvJOcA29PCVGUM2x5j2rKBCGYM8AfBPyxJeUX9EwWXGM+kgbzBunlCmqvW71UC/muFG/bA84SdbFw3VjnkAxuVR3riPAVTSd4cncyVcnEfz3J5DA/deGJuY4xXEdYvrl3NAitAeiQc1F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760002838; c=relaxed/simple;
	bh=9x4qkwbqX1w8KnD8PIzGJpeTkx0sO6sDlzdhbznRWJw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SZ7k2eZXDY+5aQ9jqD4u+yQ/soo+ScXKJetn6eea+oKnarIDIRAbxpIZtonFGWk9QFqQoppv1kOOZ9zWlo6DvVY9YPENV8cUiZtm2O/hPjUeDLL4pknLe7sNUpMlCzZD+Wlm23mckmHleSuZTh9EEN5HP33AFHqel0mpVvKIoGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BzW/yEEW; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BzW/yEEW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760002836; x=1791538836;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9x4qkwbqX1w8KnD8PIzGJpeTkx0sO6sDlzdhbznRWJw=;
  b=BzW/yEEWAdQRdl14+XoqA7rHyw26HETo++8eFFwm+HsvnWvJDGaxbRtl
   2G9zonCkmHqtQkLlPxb1oPzZIYXjqe6jOwsvwE0xYjbAvBlJYVYEP8XHE
   20VFfGaJFBGFgQ7peQ+UEYfZOQR53wkBZzwY9ZopRvsq4kZdq7tF7xLZw
   LLGGAi02SEIM52VyTy/jTnNIptwAEkmtpM68Yanmvd71yopGRT6HbIaVn
   LKfgIMQ5uRLISnwHi3MQWsbVSCZHq1bPvKkxbALY4uEeDui8MGZKPa7ds
   h2U3LMedNXxw0+D2jhXoQom5ORu6GNu8iiSKj5LxYIMl+Wy0mzlwMLt9C
   Q==;
X-CSE-ConnectionGUID: j9YKpOcCSNG29nFxXPYUGg==
X-CSE-MsgGUID: twe9pZigSU6xFR0hIU7Qjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="62113202"
X-IronPort-AV: E=Sophos;i="6.19,215,1754982000"; 
   d="scan'208";a="62113202"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 02:40:35 -0700
X-CSE-ConnectionGUID: UTzvz3XXTwafhk95U3QNSQ==
X-CSE-MsgGUID: DjhAhN0AQSuowvl68SiMCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,215,1754982000"; 
   d="scan'208";a="181437938"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 02:40:33 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 1/9] ASoC: SOF: Don't print the monolithic topology name if function topology may be used
Date: Thu,  9 Oct 2025 17:40:15 +0800
Message-ID: <20251009094023.3474895-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251009094023.3474895-1-yung-chuan.liao@linux.intel.com>
References: <20251009094023.3474895-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It may confuse people if "Topology file:" is printed but the topology
file is not really used. We keep the print if the topology file is
missing thus user can know what topology is missed in the file system.
And increase the log level to info for the actual topology that is used.
So that user can get which topology is used.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Simon Trimmer <simont@opensource.cirrus.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/fw-file-profile.c | 8 +++++++-
 sound/soc/sof/topology.c        | 2 +-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/fw-file-profile.c b/sound/soc/sof/fw-file-profile.c
index 1c0eb13ae557..d2b232860091 100644
--- a/sound/soc/sof/fw-file-profile.c
+++ b/sound/soc/sof/fw-file-profile.c
@@ -266,6 +266,7 @@ static void sof_print_profile_info(struct snd_sof_dev *sdev,
 				   enum sof_ipc_type ipc_type,
 				   struct sof_loadable_file_profile *profile)
 {
+	struct snd_sof_pdata *plat_data = sdev->pdata;
 	struct device *dev = sdev->dev;
 
 	if (ipc_type != profile->ipc_type)
@@ -282,7 +283,12 @@ static void sof_print_profile_info(struct snd_sof_dev *sdev,
 
 	if (profile->fw_lib_path)
 		dev_info(dev, " Firmware lib path: %s\n", profile->fw_lib_path);
-	dev_info(dev, " Topology file:     %s/%s\n", profile->tplg_path, profile->tplg_name);
+
+	if (plat_data->machine->get_function_tplg_files && !plat_data->disable_function_topology)
+		dev_info(dev, " Topology file:     function topologies\n");
+	else
+		dev_info(dev, " Topology file:     %s/%s\n",
+			 profile->tplg_path, profile->tplg_name);
 }
 
 int sof_create_ipc_file_profile(struct snd_sof_dev *sdev,
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index b6d5c8024f8c..3404f1306494 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -2525,7 +2525,7 @@ int snd_sof_load_topology(struct snd_soc_component *scomp, const char *file)
 	if (!tplg_cnt) {
 		tplg_files[0] = file;
 		tplg_cnt = 1;
-		dev_dbg(scomp->dev, "loading topology: %s\n", file);
+		dev_info(scomp->dev, "loading topology: %s\n", file);
 	} else {
 		dev_info(scomp->dev, "Using function topologies instead %s\n", file);
 	}
-- 
2.43.0

