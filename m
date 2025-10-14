Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A747A3043C0
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 07:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760426031; cv=none; b=itpHhs81AZ3fJ3Mn6khSjtwS+9uEGGvu2cSYL+TPH+d5/bU4iEb88yTmpBW7t4GK0NM2bicMtbeUlti5+Q1FlbJxYFxzbAirZC1vR5Bcl+gGHQPMMTlCQ3osQ/cMrrIBGo+UfJmPWTAJITFHf7YXUunVOj9bKGop2lE3OeGm3yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760426031; c=relaxed/simple;
	bh=9x4qkwbqX1w8KnD8PIzGJpeTkx0sO6sDlzdhbznRWJw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fq3YE8J2ZrNMO7YOfOdw2Vldwf2Tcs6aJKgrDqrfJYlEmqNMFFqEYbGKiEdK5OckL6gnLg15FR+9VVYHhzh+1BgO/o1Qw+YRN/58SXBr956VfVvns9IlS9qHo2vzTK+gNiFbIjqX3rMz/Np7CYa8btDIaxNvpd+KDHzya+bkqro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=arxZztlc; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="arxZztlc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760426029; x=1791962029;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9x4qkwbqX1w8KnD8PIzGJpeTkx0sO6sDlzdhbznRWJw=;
  b=arxZztlcTV+o9OF1RBvXXRedTm75DpfimpGYO7Zy4BXUHXxVvBVTgcGo
   YP4cJecLrMlK63ou/KUQa3tPkntGsmAzQ8ORezEHXCZTMO7vScW5/+f7y
   ps2bJ2bryUDmbhp4NbeQ0kCQJKCJxMYgSVIclP0EEH6F/OKECRdkOZZg2
   XdBZO8NTWObq9hT6i+ZV9P9WLYLMmGgzD7jGRhJLc+/Le8E1XEhyKc/B0
   hg5u8ZXuyxtU0gRi+GitCd+PWWOuHR9/LpHIzRYPemLGBjKhvbrEnoUFs
   r4avYVt7GckFVkSDLBfPsErLc7EM5kWuWHV/DCxYAx62D/DC5SQm9vK5V
   w==;
X-CSE-ConnectionGUID: PTsSpWUzQ0Wc2Nlw8+heTQ==
X-CSE-MsgGUID: xO5/eTpuS8WIJrKYSEb5oQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="66233654"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; 
   d="scan'208";a="66233654"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 00:13:49 -0700
X-CSE-ConnectionGUID: xvWZK3FiQCqrVsfaPJsuIw==
X-CSE-MsgGUID: 7lOEjWQiQmCdIE7iXfjp2g==
X-ExtLoop1: 1
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 00:13:46 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com,
	niranjan.hy@ti.com,
	sbinding@opensource.cirrus.com
Subject: [PATCH v2 1/9] ASoC: SOF: Don't print the monolithic topology name if function topology may be used
Date: Tue, 14 Oct 2025 15:13:27 +0800
Message-ID: <20251014071335.3844631-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014071335.3844631-1-yung-chuan.liao@linux.intel.com>
References: <20251014071335.3844631-1-yung-chuan.liao@linux.intel.com>
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

