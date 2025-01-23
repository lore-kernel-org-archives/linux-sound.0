Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C14A212FA4
	for <linux-sound@vger.kernel.org>; Thu, 23 Jan 2025 16:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737649379; cv=none; b=ch0chwS99Q/flYVW1aEuYHwaa4R1lYzNCRXno5cqk7L5TWeeuOvXn0AywhOO0OBm7EYFVJSaKevdFi1eiSIn9RFRxNhPXjQedeGH74Agh3wyHgbjQtJ7XILukVItOTV4Rq4ywVbjf3NktNgU4RqwDWHYCIviKvjRAjCEdapZUMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737649379; c=relaxed/simple;
	bh=PqG3ZBpKC7whP9e1RnMw4SJw/XVO/fWuN3obFwVNTV4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RbBleoiFJUk+WFUGNiOXENFkDPjhT7dGoLnr2vOq/oBRMfPOQAkIhreciI0Efxv80Yw+mRhwVkkeKl2EjJFdDl+eyIf2F4W/5mMHkkp2iRhTfLg5Qa9t0SWmQOQkirHKWw8sLWjdpeOBlsw5Ced3bgj6k4lvCzJNhobW5G29Q4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MtDBw5+T; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MtDBw5+T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737649379; x=1769185379;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PqG3ZBpKC7whP9e1RnMw4SJw/XVO/fWuN3obFwVNTV4=;
  b=MtDBw5+T5Sp3UqXYFuVYwnWohR4O5fBEBRkh1jXpO8wYrtjbvlSaiFPi
   /npaMBNATH7WcIw+k8anWARABCQWomxE03pwRVatvQssbOulTWfJKQU8q
   eL2wPZ/G6aK2dfVrs+1gWWwG0acuEbYnTzRTQgEzfgEKiv/3dBL1q0BgO
   YNY+zhut6i505P6EPXw1a0G3NwcHkIFY5b0poU4ZH0Y/IyswBgRtbwyNp
   fwC5KqrvIrSqN4n/KQ6OSmG/yHPLATiegtEIVh+YDDSImOrTV3fNq2yPQ
   WID3vHSqI9nDleqcrT9BIhAd1ofzBKGMk9IkklEVa/1vk4UqO0hWRhQ33
   Q==;
X-CSE-ConnectionGUID: 5s4VmH88RQC2dWkS4K+OFw==
X-CSE-MsgGUID: 0V9r1Wf3Qd+E+SbLiifuEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="55572468"
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; 
   d="scan'208";a="55572468"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 08:22:59 -0800
X-CSE-ConnectionGUID: kB8ksy9YQR6OirliSAiKfg==
X-CSE-MsgGUID: S0gp4ZK9QMeFNEeoTHJIOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="107346693"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa010.jf.intel.com with ESMTP; 23 Jan 2025 08:22:56 -0800
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
Subject: [PATCH v2 01/11] ASoC: codecs: pcm3168a: Add ACPI match table
Date: Thu, 23 Jan 2025 17:36:24 +0100
Message-Id: <20250123163634.1451237-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250123163634.1451237-1-cezary.rojewski@intel.com>
References: <20250123163634.1451237-1-cezary.rojewski@intel.com>
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

