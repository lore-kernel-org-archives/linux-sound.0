Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C0A205ABE
	for <linux-sound@vger.kernel.org>; Mon,  3 Feb 2025 13:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738591027; cv=none; b=r8CkxS3U91TUrR5cNtFzPLl7VeHFCglqqf45b6ftoQsnMAAyG5iqhdBQ0FBM0ZjNuo6mCr3QLLcKCZysYiXt2khAzbRd5l9cquu9GoUfNCDIxFtFXasxOOHW4BsKvvncysN2XHRz6ZQ0GYbrtY10/ZQSarcd+cXzkJcL/VR7OqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738591027; c=relaxed/simple;
	bh=PqG3ZBpKC7whP9e1RnMw4SJw/XVO/fWuN3obFwVNTV4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WwNuFiNOzt9trKBzTlsf93xbe7VyWrAU2g0rExAnTOnh93mRH6ub3O4MSlL01j9/BNRTm2eNnj+UQWXmq/KN1UjbaCEnfNxy0lCQcRWyCvisBVndYhnHxqnN5W1CWlO/uLyc0RnPtXJhyu/Z9sTx+ybwedXzF/wIJUUzoCwBRBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EpUJz8uO; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EpUJz8uO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738591026; x=1770127026;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PqG3ZBpKC7whP9e1RnMw4SJw/XVO/fWuN3obFwVNTV4=;
  b=EpUJz8uOiHfLfrNVPqoAZBNKO+fs+LKPK0KvCaqpCPP4TfGHMCo27sQ8
   P8EhRTHPqy3pK/KJYXBr7d3RkVCLGPsCC8R+e1VZ5rjhL3/wKLtHqdpEA
   cKZjzSw2SEyhKcj0seuo1cfBRwHvqsOBfezYEueBYAsX3eDUYMxCN1n9a
   3RBMlpjWzmMbRisdTfd/g5S2uMghFt/PikPDv0FJICe1Cl5Py08IfmUEP
   x43pxIMCZQ2fdOaZ5GbzfFvYeraHyBuRvC1rHOHfJbppdTBxtyS0Jkc1h
   HsJT/3pk3OQFtldpZGa1mYAltf3DGy/T8kkwtu4QNsT6ESIfHDGLdoQJf
   w==;
X-CSE-ConnectionGUID: 4cQhB3hVRQOPRuV2KYr/9Q==
X-CSE-MsgGUID: em0VOT9vR66rnMKaY2u+CQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="56511786"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="56511786"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 05:57:05 -0800
X-CSE-ConnectionGUID: 5zuTj6hET2GX04mG/f982w==
X-CSE-MsgGUID: /zcWnEdTT/ek0KfJD2s6QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="110057857"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa009.jf.intel.com with ESMTP; 03 Feb 2025 05:57:02 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	shenghao-ding@ti.com,
	kevin-lu@ti.com,
	baojun.xu@ti.com,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v3 01/11] ASoC: codecs: pcm3168a: Add ACPI match table
Date: Mon,  3 Feb 2025 15:10:41 +0100
Message-Id: <20250203141051.2361323-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250203141051.2361323-1-cezary.rojewski@intel.com>
References: <20250203141051.2361323-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Support ACPI-based systems by adding relevant match table.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/codecs/pcm3168a-i2c.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/codecs/pcm3168a-i2c.c b/sound/soc/codecs/pcm3168a-i2c.c
index 7052cc0c97d1..4da608ba514d 100644
--- a/sound/soc/codecs/pcm3168a-i2c.c
+++ b/sound/soc/codecs/pcm3168a-i2c.c
@@ -10,6 +10,7 @@
 #include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/module.h>
+#include <linux/mod_devicetable.h>
 
 #include <sound/soc.h>
 
@@ -37,6 +38,13 @@ static const struct i2c_device_id pcm3168a_i2c_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, pcm3168a_i2c_id);
 
+static const struct acpi_device_id pcm3168a_acpi_match[] = {
+	{ "PCM3168A" },
+	{ "104C3168" },
+	{}
+};
+MODULE_DEVICE_TABLE(acpi, pcm3168a_acpi_match);
+
 static const struct of_device_id pcm3168a_of_match[] = {
 	{ .compatible = "ti,pcm3168a", },
 	{ }
@@ -49,6 +57,7 @@ static struct i2c_driver pcm3168a_i2c_driver = {
 	.id_table	= pcm3168a_i2c_id,
 	.driver		= {
 		.name	= "pcm3168a",
+		.acpi_match_table = pcm3168a_acpi_match,
 		.of_match_table = pcm3168a_of_match,
 		.pm		= &pcm3168a_pm_ops,
 	},
-- 
2.25.1

