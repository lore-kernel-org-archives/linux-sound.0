Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9940216E39
	for <linux-sound@vger.kernel.org>; Thu,  9 Jan 2025 12:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736424508; cv=none; b=sUwLK0jyN+Eh05CczxlqtNiuspOs6nh04/Lx/oXoOnTBQAWz4C+TZimMH2kCWwbBXM7y+vrG9LP7zNA2ubaP7PYSsDB7M0Tn29eghXcN9W8n97X+OHQGs5bXtKqr6LFkd93EeeFnkNhpZM06CpsxlQpyWibsYe9mpVIG9M1LW1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736424508; c=relaxed/simple;
	bh=cujlS02oQb/0aiC0eyfrBWpjg/pvG6XiGOyfMjWxrkY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LIkqWSZeYfWSD9KIehmAHT18c7HFfzF/gkE/oLAcCoUUsjCMfKQEvkne3SIaTbKGuwHwO8P5jWufJ1v29og8De69IHKo4JGhfN5h1wqZuycqOOv6j5xrYtVmCEOdJIGoawNQlslEWbN/H8sq/y1+pCj6XUzV2ylZmRZI7MUk/S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NiP9T1jY; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NiP9T1jY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736424507; x=1767960507;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cujlS02oQb/0aiC0eyfrBWpjg/pvG6XiGOyfMjWxrkY=;
  b=NiP9T1jYf3LSUUAt2A3wzcDUAZ88tV8tb0+rZYhrz3kkP5pDUiydT6Rv
   8pcvMCtIALxz6LwUThurkPWsAGeKvQIUNEqWsNKtqj8AUT3XHnX/Q2ckK
   8kXyquWrY6Wvq95f1C1fbBonqyQ6FiOUAWqZXKDhxFrVQ6KinrLxDmvG2
   Z2UORVbfQXeSd2kR/TartvfNyT28O7SZHD/4VIhlENVUILPFcWNqTZI1M
   0znBct7xv18cHZhLEWkc924cJkfyCvsFz+TAIo7Oux3EnZvnQh+aEIQZU
   aXL0QMuvk/pVioeyELJ2wGMHNEjP2dFo/0z9ByKpDQLlPh0JP/0fnfZ6O
   w==;
X-CSE-ConnectionGUID: BLNXEnikSrCEC8JDYkkRBA==
X-CSE-MsgGUID: /ii4TjXORqOHDIfxKHrQsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="47179589"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="47179589"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 04:08:26 -0800
X-CSE-ConnectionGUID: SfKZBd3uQKmMKBIAzsI2RA==
X-CSE-MsgGUID: /SF+zG0lRAa9czYxCugKvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="140710336"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa001.jf.intel.com with ESMTP; 09 Jan 2025 04:08:19 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 06/13] ASoC: Intel: avs: Print IPC error messages in lower layer
Date: Thu,  9 Jan 2025 13:22:09 +0100
Message-Id: <20250109122216.3667847-7-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250109122216.3667847-1-cezary.rojewski@intel.com>
References: <20250109122216.3667847-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

It is preferred to send error message in handler itself instead of
leaving it to caller.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/loader.c   |  8 ++------
 sound/soc/intel/avs/messages.c | 22 ++++++++++++++++------
 2 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/sound/soc/intel/avs/loader.c b/sound/soc/intel/avs/loader.c
index 37de077a9983..4203b216ae13 100644
--- a/sound/soc/intel/avs/loader.c
+++ b/sound/soc/intel/avs/loader.c
@@ -675,16 +675,12 @@ int avs_dsp_first_boot_firmware(struct avs_dev *adev)
 	}
 
 	ret = avs_ipc_get_hw_config(adev, &adev->hw_cfg);
-	if (ret) {
-		dev_err(adev->dev, "get hw cfg failed: %d\n", ret);
+	if (ret)
 		return AVS_IPC_RET(ret);
-	}
 
 	ret = avs_ipc_get_fw_config(adev, &adev->fw_cfg);
-	if (ret) {
-		dev_err(adev->dev, "get fw cfg failed: %d\n", ret);
+	if (ret)
 		return AVS_IPC_RET(ret);
-	}
 
 	adev->core_refs = devm_kcalloc(adev->dev, adev->hw_cfg.dsp_cores,
 				       sizeof(*adev->core_refs), GFP_KERNEL);
diff --git a/sound/soc/intel/avs/messages.c b/sound/soc/intel/avs/messages.c
index ec458bd51b10..30b666f8909b 100644
--- a/sound/soc/intel/avs/messages.c
+++ b/sound/soc/intel/avs/messages.c
@@ -400,10 +400,12 @@ int avs_ipc_get_fw_config(struct avs_dev *adev, struct avs_fw_cfg *cfg)
 				       AVS_BASEFW_FIRMWARE_CONFIG, NULL, 0,
 				       &payload, &payload_size);
 	if (ret)
-		return ret;
+		goto err;
 	/* Non-zero payload expected for FIRMWARE_CONFIG. */
-	if (!payload_size)
-		return -EREMOTEIO;
+	if (!payload_size) {
+		ret = -EREMOTEIO;
+		goto err;
+	}
 
 	while (offset < payload_size) {
 		tlv = (struct avs_tlv *)(payload + offset);
@@ -502,6 +504,9 @@ int avs_ipc_get_fw_config(struct avs_dev *adev, struct avs_fw_cfg *cfg)
 
 	/* No longer needed, free it as it's owned by the get_large_config() caller. */
 	kfree(payload);
+err:
+	if (ret)
+		dev_err(adev->dev, "get fw cfg failed: %d\n", ret);
 	return ret;
 }
 
@@ -517,10 +522,12 @@ int avs_ipc_get_hw_config(struct avs_dev *adev, struct avs_hw_cfg *cfg)
 				       AVS_BASEFW_HARDWARE_CONFIG, NULL, 0,
 				       &payload, &payload_size);
 	if (ret)
-		return ret;
+		goto err;
 	/* Non-zero payload expected for HARDWARE_CONFIG. */
-	if (!payload_size)
-		return -EREMOTEIO;
+	if (!payload_size) {
+		ret = -EREMOTEIO;
+		goto err;
+	}
 
 	while (offset < payload_size) {
 		tlv = (struct avs_tlv *)(payload + offset);
@@ -590,6 +597,9 @@ int avs_ipc_get_hw_config(struct avs_dev *adev, struct avs_hw_cfg *cfg)
 exit:
 	/* No longer needed, free it as it's owned by the get_large_config() caller. */
 	kfree(payload);
+err:
+	if (ret)
+		dev_err(adev->dev, "get hw cfg failed: %d\n", ret);
 	return ret;
 }
 
-- 
2.25.1

