Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ABE9214802
	for <linux-sound@vger.kernel.org>; Wed, 22 Jan 2025 17:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737567644; cv=none; b=gBXoLpBPJTv2juWDDK1j4iVWSPBDX4jLWUKGp0kBCZByTrLz4Sf3AYnEegP5uqhJswGKFn0r0RNkOObZ/CCy/V3AiMhev3kyLE0Fm3KDCxJB13RzlzjwSG9/2UwWJtwAKuKq/pLtBtoukkzKuJDS+7DB+84tzo+EJvy2ttKEsDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737567644; c=relaxed/simple;
	bh=PqG3ZBpKC7whP9e1RnMw4SJw/XVO/fWuN3obFwVNTV4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pY2voK8mXh5l6ohre0SNnpZF1irIlZNvTpeTInhXs6T6QIqRutkjbofTI/c+Jx8P52gMftGVwhT8NjYJgqk+SnZNvZUYxISYd6vmQKtargNIBBfCljYifrCP+Ui1vHdJPfUywptosW/PFaHZse93piO2WNFlFd4AgNj3GGXC5Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m62QszPp; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m62QszPp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737567643; x=1769103643;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PqG3ZBpKC7whP9e1RnMw4SJw/XVO/fWuN3obFwVNTV4=;
  b=m62QszPpBYwItnZ9F2l0kZ/224PcwLYT9Mu3H2XsDbpCrxtXshRrE0bD
   qyMFL28mEuQ4pN9X61zHflY7GomVJk+SBfkHI/K6XKgXCwwgH6+v8Pn81
   Lm9itkLhN4ePsVSTMg2mkJ731TCgxWIuZsziOl+7Y6ar0BSA5FMS5Wn7D
   BKOWmGJ8895IrRMC/GRzX/1rOsiiUs0JgvvHSEaXiDMaaQcBFpK9HAYON
   sOl/GV63yT/uChfeLP9a2zYEas1oKYPgxhtBf5qkHWJ7udb0uKU11zSoz
   ovPcgTBRPBS2mbL8g/62TWzn0NP4ZRzqMcut4cyDk2sbA0AAl3NLMAUVl
   g==;
X-CSE-ConnectionGUID: HJ5wA6KsQhydjmyiWco1cg==
X-CSE-MsgGUID: MOVORIanRfm3kV4HqUsciw==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="49434721"
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; 
   d="scan'208";a="49434721"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 09:40:42 -0800
X-CSE-ConnectionGUID: JUVhB2q5SCGTSf43E9iO3w==
X-CSE-MsgGUID: ORbyResxS+6g0J+Laz6Y8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="112185205"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa003.jf.intel.com with ESMTP; 22 Jan 2025 09:40:40 -0800
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
Subject: [PATCH 01/11] ASoC: codecs: pcm3168a: Add ACPI match table
Date: Wed, 22 Jan 2025 18:54:16 +0100
Message-Id: <20250122175426.1369059-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250122175426.1369059-1-cezary.rojewski@intel.com>
References: <20250122175426.1369059-1-cezary.rojewski@intel.com>
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

