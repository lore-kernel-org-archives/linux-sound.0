Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211992D6607
	for <linux-sound@vger.kernel.org>; Thu,  9 Oct 2025 09:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760002848; cv=none; b=G/5np1wUOOk9FytANiY4XrxYM674VBclB1WVj40gd0aOKpcxDee6tJTLz8pjfIa5cxoB27JwFx5W2opcZL68zXTJupCD2anBtv7mdT9iuEYNaUIEVj5AGRc4IrlRdfTfVR4vuOI+QPCkvYtpRFx2oT+L9QKM/ESwYkbQ1RiqbkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760002848; c=relaxed/simple;
	bh=Tuc4EKpIVGJQUc0UEnKjTH6lEc6a7Gb3r3Paq9Vc8V8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HK9hqEWFl4p22DHDIotKEUgxnfv1y/FX2+slh52iSpIt+1i25Zg1OotvjQjD5pC1JytcMmEVXSKMwc+JbRKPT7H9P9wFPCQMK0YxIAKzVs8L079RmwTwI9TbJMb+1sasMOo+yr4k4cjgMlkIVPfyOi4bJLFWgWil4v5sVz8tA74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IGn/TqP7; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IGn/TqP7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760002847; x=1791538847;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Tuc4EKpIVGJQUc0UEnKjTH6lEc6a7Gb3r3Paq9Vc8V8=;
  b=IGn/TqP7CVhhPG/cGg52/inxhcCT+8zwnJB1ZDDtOS0brj0uDnoZmGcB
   Mzy/TbCWtNv6eSiiUFpuX18vdxxPsOQmbvQLeMs26oy+joN/6RT28W4a+
   /GYWzqCFt/FmpRSOPi1yT1VwyQ48OcXAD+RDZ4N79kjwe/0o1RxSujDP+
   s2uCHPeVsPojEy0nFaNVsV7fBvSUmgYGEZrZzcuOrMrV/07dS91oOXlQN
   F248vy7Cw5zkLRdkjeFklldTFigS7/lTWyd2UXbLfntnLcSQ9W3p3u/HQ
   gWkbH1LyRewYA6KApY3egvkPloNQ+VkVMxBH4nDVSlxJUiBslXFVqiT0K
   A==;
X-CSE-ConnectionGUID: Wzip2XsJRwSTsgWae3iAhg==
X-CSE-MsgGUID: J9xCHSZASbyoi4NT5YkNzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="62113266"
X-IronPort-AV: E=Sophos;i="6.19,215,1754982000"; 
   d="scan'208";a="62113266"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 02:40:47 -0700
X-CSE-ConnectionGUID: GsAHL8jSQEy+VSphZccwlw==
X-CSE-MsgGUID: bGD2707TQH+JPARhYy2o8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,215,1754982000"; 
   d="scan'208";a="181438020"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 02:40:45 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 9/9] ASoC: sof-function-topology-lib: escalate the log when missing function topoplogy
Date: Thu,  9 Oct 2025 17:40:23 +0800
Message-ID: <20251009094023.3474895-10-yung-chuan.liao@linux.intel.com>
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

