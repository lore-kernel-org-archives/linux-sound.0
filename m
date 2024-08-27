Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19261BC073
	for <linux-sound@vger.kernel.org>; Tue, 27 Aug 2024 12:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724761953; cv=none; b=db4vpDFd7IEdQ2HTaZDHzeggnwwN0f/5AMMfKvGKrP5X/ZMKjKzHKy4sgUsjorH5hf7hDl+PBe0w8C0QTxKJ4qzo90uIjIFAAJXcNm0WY95UfysXw7sDX2ogI2UgNzVA5KBSWRnjpbNl88xEo8v76e2Iwo7zkohbp4T19UMES98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724761953; c=relaxed/simple;
	bh=hnAANfMFW0xmLVKd2Pe610xJ63d/vRJrR6+877isFbk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DfE50w3clbjXT29lKi0HNzUm8Jl+haqgq/ije9W213iLnCjDyS92xhXSc8iwHDYGduY6HHTrDfsYclnsbHXNuVB1cqwUJDJf/XbEdXdMSIY8HtI0I4jmIJ52hRcXS25TPTWEaCAK++45aFnhNZNMthkAFkZN4FPqSxF6DJU6bqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wk2vldTK; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wk2vldTK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724761952; x=1756297952;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hnAANfMFW0xmLVKd2Pe610xJ63d/vRJrR6+877isFbk=;
  b=Wk2vldTK9asLraLugHCnAra6AlHAg9n5s4dvCT/rpawN3xpSOej5Ypeo
   YjAr8pNOB00z6XMTF/OSFywZx8u5f6OBxuilsJtF5wCbkYiZ0A1ilKgn9
   Df3hZ8Rdo5CKtDSoXruHk231S5uI/VlwB7YpYTGZq87abLl+LrPrw7tRb
   J+3FwbbUCjKNdtZWcWlekSna1z5TtGfCn0f5icM0916skReFT2EF6xziv
   5+NIbJfgur88bOKO9hT2enc63KP8VRI80628AMJ3wcP9zSFzexkscKdqY
   G1AX+/m754lOf/ALwRGk8syQjtRadSMZfRqEtcy3v6T5ri+Id9Hh+Cbid
   g==;
X-CSE-ConnectionGUID: MdlKyQp7QdqxpQDg5T9xJg==
X-CSE-MsgGUID: Q18e7FcASbKR8k/2e/eP6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="13235485"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; 
   d="scan'208";a="13235485"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 05:32:31 -0700
X-CSE-ConnectionGUID: uFlYLTGdQ7W+T8jHP3b3fQ==
X-CSE-MsgGUID: kaO6SmEuTwSsO0lU4dFsoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; 
   d="scan'208";a="62676762"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.118.39])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 05:32:29 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH v2 01/17] ASoC: Intel: sof_sdw: make sof_sdw_quirk static
Date: Tue, 27 Aug 2024 20:31:59 +0800
Message-ID: <20240827123215.258859-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240827123215.258859-1-yung-chuan.liao@linux.intel.com>
References: <20240827123215.258859-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

There's no need to make this variable visible at a higher level.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c        | 2 +-
 sound/soc/intel/boards/sof_sdw_common.h | 2 --
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index b1fb6fabd3b7..9b642c6883b0 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -17,7 +17,7 @@
 #include "sof_sdw_common.h"
 #include "../../codecs/rt711.h"
 
-unsigned long sof_sdw_quirk = RT711_JD1;
+static unsigned long sof_sdw_quirk = RT711_JD1;
 static int quirk_override = -1;
 module_param_named(quirk, quirk_override, int, 0444);
 MODULE_PARM_DESC(quirk, "Board-specific quirk override");
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index c10d2711b730..3aa1dcec5172 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -58,8 +58,6 @@ struct intel_mc_ctx {
 	unsigned int sdw_pin_index[SDW_INTEL_MAX_LINKS];
 };
 
-extern unsigned long sof_sdw_quirk;
-
 /* generic HDMI support */
 int sof_sdw_hdmi_init(struct snd_soc_pcm_runtime *rtd);
 
-- 
2.43.0

