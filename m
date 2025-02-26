Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8692A212FB0
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 11:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740568235; cv=none; b=ZvJrNdGCCP5iTf4wU3SAQUFchvKvdZkDzEj9ogKZ2LHc4dG8IA0LlD82Cz7rKWp+r9Lb964XgL2iDW3ICfAwkT05DrD1ctxqOfya9Eci+hqd1jdJBpvZFgBYqepd+e2yNEpuWHD6f6IdcF8UcC65kuVMFbpchV3VRgzkn4i4C+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740568235; c=relaxed/simple;
	bh=ePk3GgcxqrdlCZRgonbPH3o4YBbi+zTYbsaEpKG07Bg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Fw+3n+hmScTZ+pFaRxMD81H9ZGiEWLV9ME4OHPMcQ5q9oYzLyYyfoKl/S+TVkfzXfWvhqMDXA0CM2/AtK8+ftKsJ6CnxqgxhTxiFL0tFJdbqr8JULNcA2ccyuG7LBUqARjnFKAYLq07cxjBOA0Q+V0BCgZXHqC3NBfQrNOQwmvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XG2SzxP1; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XG2SzxP1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740568235; x=1772104235;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ePk3GgcxqrdlCZRgonbPH3o4YBbi+zTYbsaEpKG07Bg=;
  b=XG2SzxP1U0KQkqKV1zv/99Te9XNoLw0VAYasI/7t9ijOKH6Qxfv8oF6r
   +b9w/AvZHgKKuKkkZ2vlPQodHDJvdA362/gxKLyEkosCyoZn2h8V6VcnN
   zkhogYQMRV7SjScvc/Wiv440CgUkY3KxCfvPzjTRlGDFr2Gz8BuRCn99M
   furvKoMXtGxAATWftwg7gIW7+s/ZvsD2FpmbaWn6rAIwISqG/b/yhEo9a
   ddpRCL8137Qux96FAHka+hi0i+6qgyiz8IHER4LeanxPtMGI/n768QwgQ
   XJwhIeC18DNHaK/AUx3utcvnl33ggE7QBC+k8XN8nWoCb/kKRBpkf/oZ/
   A==;
X-CSE-ConnectionGUID: I8AxLHiLQWiCpQNy9k/a3A==
X-CSE-MsgGUID: nf+nwXMKQlOLwUHA3SAvTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="41111142"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="41111142"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 03:10:35 -0800
X-CSE-ConnectionGUID: zOFom90PRsqBL8XKRfSjzw==
X-CSE-MsgGUID: tpYdTBvVTreKQeCVYwC8IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="116685150"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa006.jf.intel.com with ESMTP; 26 Feb 2025 03:10:32 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	flove@realtek.com,
	oder_chiou@realtek.com,
	shumingf@realtek.com,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 15/22] ASoC: codecs: rt5663: Fix definition of device_id tables
Date: Wed, 26 Feb 2025 12:26:05 +0100
Message-Id: <20250226112612.166989-16-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250226112612.166989-1-cezary.rojewski@intel.com>
References: <20250226112612.166989-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There shall be no comma after the terminator entry and initializing
fields with 0 for statically defined structs is redundant.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/codecs/rt5663.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/rt5663.c b/sound/soc/codecs/rt5663.c
index 9d32debd3689..874c5ea3efb5 100644
--- a/sound/soc/codecs/rt5663.c
+++ b/sound/soc/codecs/rt5663.c
@@ -3315,15 +3315,15 @@ MODULE_DEVICE_TABLE(i2c, rt5663_i2c_id);
 #if defined(CONFIG_OF)
 static const struct of_device_id rt5663_of_match[] = {
 	{ .compatible = "realtek,rt5663", },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, rt5663_of_match);
 #endif
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id rt5663_acpi_match[] = {
-	{ "10EC5663", 0},
-	{},
+	{ "10EC5663" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, rt5663_acpi_match);
 #endif
-- 
2.25.1

