Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB4B30DEB5
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 07:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760426052; cv=none; b=XDUliABD4umxABjSRhVASirxOqj57DHgDJJ9xCs44rh2ewAfCcSTvYIDyCUh1JYxo2wtNlxX8DrdfRjDqvuI0voTFxMWMfzzmb1SER99A6PcIaAucTswQfQved2tDDyoIeh9SY7xFTixjus7TyXhOWetGbxsQwVE+G/NrbE6Sgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760426052; c=relaxed/simple;
	bh=Tuc4EKpIVGJQUc0UEnKjTH6lEc6a7Gb3r3Paq9Vc8V8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DZd6SRzG1A/TabLkrG36mFAOmSwBsbLP0ABrAUoky2RyMFto9KVM8JRfIQbcYkC2wt1q/F/nijDpGwJKART/8k8MVuRDheiL4lYx6QD8ElUzxw/DYk5TXKdIqVQsjQvZ6NtX7XduhOh10MMoSu4aeVo3xXDp/JVggjWsjBnJVxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hJiTcCLZ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hJiTcCLZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760426050; x=1791962050;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Tuc4EKpIVGJQUc0UEnKjTH6lEc6a7Gb3r3Paq9Vc8V8=;
  b=hJiTcCLZUgVp/JvRyBHVUF6tVe68jEOjLJYPXBKZnh7Tjb2eNRWE3L4u
   2BVDwX5U9Fyk/KJIw+a0prQA6qoUibS3+GVS+tmaPcpd7DfMyYVJFX9Rg
   7ME4cupC42gWdXyREMGHSfyMxnd3eTO23qhuHuqr3653vO8CY+kt+LxnL
   k7DGUeL19SLHxjFDRcZQdO+meW1qZgBTVqOSFK3E+Sxg2mHjllOLHXAsO
   P3YvKWelyKqQoaq6FZ164XO2TL6kDWSr5QiBPTouP+nSrNWoE6cnzdkYm
   OsSxOf884+A6bv5rG/DYbAhU/tiJ3RpBwQEh6tC4tSjxEjyvoyDzdpz7W
   Q==;
X-CSE-ConnectionGUID: eNOdUWY7TjGOVfvzYEMSQg==
X-CSE-MsgGUID: b7PwH6/ESTyBJZnMB0tYAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="66233721"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; 
   d="scan'208";a="66233721"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 00:14:08 -0700
X-CSE-ConnectionGUID: du6Nr7ccRUKUhU/aFuCMQQ==
X-CSE-MsgGUID: GqXDQhL8TRuELNOunn/9Jg==
X-ExtLoop1: 1
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 00:14:07 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com,
	niranjan.hy@ti.com,
	sbinding@opensource.cirrus.com
Subject: [PATCH v2 9/9] ASoC: sof-function-topology-lib: escalate the log when missing function topoplogy
Date: Tue, 14 Oct 2025 15:13:35 +0800
Message-ID: <20251014071335.3844631-10-yung-chuan.liao@linux.intel.com>
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

Function topology must be used if the ACPI match table is created based
on the reported ACPI table because the monolithic topology is not picked
for the audio configuration.
Escalate the log and ask the user to download the latest topologies.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Simon Trimmer <simont@opensource.cirrus.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/intel/common/sof-function-topology-lib.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/common/sof-function-topology-lib.c b/sound/soc/intel/common/sof-function-topology-lib.c
index f685c1c5c6f0..b10d4794159a 100644
--- a/sound/soc/intel/common/sof-function-topology-lib.c
+++ b/sound/soc/intel/common/sof-function-topology-lib.c
@@ -126,7 +126,11 @@ int sof_sdw_get_tplg_files(struct snd_soc_card *card, const struct snd_soc_acpi_
 		if (!ret) {
 			release_firmware(fw);
 		} else {
-			dev_dbg(card->dev, "Failed to open topology file: %s\n", (*tplg_files)[i]);
+			dev_warn(card->dev,
+				 "Failed to open topology file: %s, you might need to\n",
+				 (*tplg_files)[i]);
+			dev_warn(card->dev,
+				 "download it from https://github.com/thesofproject/sof-bin/\n");
 			return 0;
 		}
 	}
-- 
2.43.0

