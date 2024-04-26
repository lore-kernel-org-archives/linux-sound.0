Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E44115623B
	for <linux-sound@vger.kernel.org>; Fri, 26 Apr 2024 15:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714145409; cv=none; b=RKCSCO5dkBMM87noLyUGbeSAl0rQe9HFr73Zq4eIZ1qt8hJLBS5MK5P286F9AIoT2XzDFzhKT8Lg4f457fcolTxVNnmc1AtWNvPY9p3OzxyaCX6pigkXnLMWt6rGeDbXEPeWEDPQcdy/dMVHurmyM9DQRNkiD9TjY4QdijdZ/fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714145409; c=relaxed/simple;
	bh=E8SBpjlUE0ziTNnq8DnhOzI49IUmjroDksM8NxVFNMM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bZzQFw49wSO9LoT6BWu2Y3bEbA7EoppTWY2sY6CItiyqi9w4hmn4R/76vAW//cAMmgPMoXYuEn+JdO3wia7bZoa34tt+IetI+3W/8FMxiyVFYMuwdyXeJO/oqF3GfjDGBmpjbEGvHoXRUcLpQiJQXcUjdgkeZoiSQGmH0Fxo3hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cOdphpC8; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cOdphpC8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714145409; x=1745681409;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=E8SBpjlUE0ziTNnq8DnhOzI49IUmjroDksM8NxVFNMM=;
  b=cOdphpC8RNN+VFgsPxJPyw05ypDPiUDJ261AeH6XQDcCXPrwp4iXbQOO
   bZ8vX1Q5ulF1gNJuChAxDXU/0Oe/azI2MBT6+oWxcdiFGR7LKs9st5R4r
   MZrYxH+VqkUdSRPaao5yGlaMvYhTY38u8KuYBdWhhvYzP9mGNwp/JMTyO
   BtP3UQ7XNqNTlpJ2+XwXl73z3OFA9IqqRB+6+DtDFteCAXBmzHb2dUvcu
   +7BOJKCZXDIXiobUiWyIe9aSDrItkU+AXXGARsNn6YOwmgoPfcqeQFhOZ
   7KQkNff+vAT7fIINSCePWLJen+ThkDok+RXQ/E294lIhJSRTau8SGWFyA
   A==;
X-CSE-ConnectionGUID: ufwHHG1rRwuZehLtbJvbew==
X-CSE-MsgGUID: thgSVHVwScyBOFe8sgAN4A==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="27339936"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="27339936"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:29:57 -0700
X-CSE-ConnectionGUID: /8m65k2+SQG1LP+9NRX2wQ==
X-CSE-MsgGUID: /rhV1HVyTmmPASL0YTTFvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="25332806"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.33.33])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:29:56 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH] ASoC: cs35l56: fix usages of device_get_named_child_node()
Date: Fri, 26 Apr 2024 10:29:39 -0500
Message-Id: <20240426152939.38471-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The documentation for device_get_named_child_node() mentions this
important point:

"
The caller is responsible for calling fwnode_handle_put() on the
returned fwnode pointer.
"

Add fwnode_handle_put() to avoid leaked references.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/cs35l56.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index dfd703d9e12f..758dfdf9d3ea 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -1361,6 +1361,7 @@ static int cs35l56_try_get_broken_sdca_spkid_gpio(struct cs35l56_private *cs35l5
 				    "spk-id-gpios", ACPI_TYPE_PACKAGE, &obj);
 	if (ret) {
 		dev_dbg(cs35l56->base.dev, "Could not get spk-id-gpios package: %d\n", ret);
+		fwnode_handle_put(af01_fwnode);
 		return -ENOENT;
 	}
 
@@ -1368,6 +1369,7 @@ static int cs35l56_try_get_broken_sdca_spkid_gpio(struct cs35l56_private *cs35l5
 	if (obj->package.count != 4) {
 		dev_warn(cs35l56->base.dev, "Unexpected spk-id element count %d\n",
 			 obj->package.count);
+		fwnode_handle_put(af01_fwnode);
 		return -ENOENT;
 	}
 
@@ -1382,6 +1384,7 @@ static int cs35l56_try_get_broken_sdca_spkid_gpio(struct cs35l56_private *cs35l5
 		 */
 		ret = acpi_dev_add_driver_gpios(adev, cs35l56_af01_spkid_gpios_mapping);
 		if (ret) {
+			fwnode_handle_put(af01_fwnode);
 			return dev_err_probe(cs35l56->base.dev, ret,
 					     "Failed to add gpio mapping to AF01\n");
 		}
@@ -1389,14 +1392,17 @@ static int cs35l56_try_get_broken_sdca_spkid_gpio(struct cs35l56_private *cs35l5
 		ret = devm_add_action_or_reset(cs35l56->base.dev,
 					       cs35l56_acpi_dev_release_driver_gpios,
 					       adev);
-		if (ret)
+		if (ret) {
+			fwnode_handle_put(af01_fwnode);
 			return ret;
+		}
 
 		dev_dbg(cs35l56->base.dev, "Added spk-id-gpios mapping to AF01\n");
 	}
 
 	desc = fwnode_gpiod_get_index(af01_fwnode, "spk-id", 0, GPIOD_IN, NULL);
 	if (IS_ERR(desc)) {
+		fwnode_handle_put(af01_fwnode);
 		ret = PTR_ERR(desc);
 		return dev_err_probe(cs35l56->base.dev, ret, "Get GPIO from AF01 failed\n");
 	}
@@ -1405,9 +1411,12 @@ static int cs35l56_try_get_broken_sdca_spkid_gpio(struct cs35l56_private *cs35l5
 	gpiod_put(desc);
 
 	if (ret < 0) {
+		fwnode_handle_put(af01_fwnode);
 		dev_err_probe(cs35l56->base.dev, ret, "Error reading spk-id GPIO\n");
 		return ret;
-		}
+	}
+
+	fwnode_handle_put(af01_fwnode);
 
 	dev_info(cs35l56->base.dev, "Got spk-id from AF01\n");
 
-- 
2.40.1

