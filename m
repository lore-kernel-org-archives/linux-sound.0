Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D364A1CFBC
	for <linux-sound@vger.kernel.org>; Wed, 30 Jul 2025 12:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753878486; cv=none; b=c2HovohAme2BKOTn2Z3qyPfRshzYriBaPJKT9tsNjPwKBhRGFPR4WOpPZURwc9MeG/T4pPQbonW/Qv9I3B17zLV4hYQKDSPGQagSSoxCeoxXN0NZqYe2LL+tolqS/5+zc1eayEkOZHsyxOLnoIuQos8XCeDXOemcePYBF37jljg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753878486; c=relaxed/simple;
	bh=hDtATlmaPDyE+MzNy29Xice5MIJktklWTUNry1jRU2E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=twAI0v/YZAaSUsWBMp76F445TVPjrCQ7iCLPMJXhNoNYvOQ+cpwtyiczyA+JdTRFNgOWLguxm0MiU0WFp3owXG5PolMPEjstzehKefAU7cTzBKcNXhiSx1ELyqQUk859TZzj2mjbrWLMJR2/nnmRzhm3a1q7nGmqvFJQmnziOEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b6UQ0oiR; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b6UQ0oiR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753878485; x=1785414485;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=hDtATlmaPDyE+MzNy29Xice5MIJktklWTUNry1jRU2E=;
  b=b6UQ0oiRbrHZRumo/7eTePw7StVh95EcPe52x3RbQMW0M/zYAzkCdMUU
   5Icw1hADVQX7yerIhjdxnoQZny694p3dC/lC2S9IUlYIcn47Nb1fwlge7
   gzsjnTcJ8k5yR+aGd1h7H+cANjgP8XN5Nln2PZP4kpAwq/4J6dhCRmmrI
   X5FnERSVB9I2Ng2KrSyEa932hk2GMfwH4QXNTTTjpAQxayNlqyB+rp21m
   P7WHjIbuRFUUUtZPjTkyEf9+/auSVeI0/YIsImOWfXUS3pDrdAyVNmc6S
   q98FE4nj16GGfSPh1g7UlHPTDylpmp30YURWp+40xCd81/lFv1X88+f1U
   A==;
X-CSE-ConnectionGUID: ubXgFnJWRsKuHFFMeWnNJw==
X-CSE-MsgGUID: mUN1Syg6T5qjV9kCpmhAbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="56323524"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="56323524"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 05:28:05 -0700
X-CSE-ConnectionGUID: srpRe9aoSVqsjvoeMCt6Og==
X-CSE-MsgGUID: qt+yAW/PTVemBzLZH9HWgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="167460623"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa004.jf.intel.com with ESMTP; 30 Jul 2025 05:28:03 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2] ASoC: Intel: avs: Fix uninitialized pointer error in probe()
Date: Wed, 30 Jul 2025 14:49:06 +0200
Message-Id: <20250730124906.351798-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

If pcim_request_all_regions() fails, error path operates on
uninitialized 'bus' pointer. Found out by Coverity static analyzer.

Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
Changes in v2:
- dropped the 1/2 patch:
  ASoC: Intel: avs: Synchronize happy and error paths in PCI probe
  as it held no real value. It's actually common in the drivers/ code to
  have pci_set_master() at the beginning of the probe() function, not at
  its end. And thus there's no need to fix the error path.

 sound/soc/intel/avs/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
index 5b21812be9d6..7b7acb523716 100644
--- a/sound/soc/intel/avs/core.c
+++ b/sound/soc/intel/avs/core.c
@@ -445,6 +445,8 @@ static int avs_pci_probe(struct pci_dev *pci, const struct pci_device_id *id)
 	adev = devm_kzalloc(dev, sizeof(*adev), GFP_KERNEL);
 	if (!adev)
 		return -ENOMEM;
+	bus = &adev->base.core;
+
 	ret = avs_bus_init(adev, pci, id);
 	if (ret < 0) {
 		dev_err(dev, "failed to init avs bus: %d\n", ret);
@@ -455,7 +457,6 @@ static int avs_pci_probe(struct pci_dev *pci, const struct pci_device_id *id)
 	if (ret < 0)
 		return ret;
 
-	bus = &adev->base.core;
 	bus->addr = pci_resource_start(pci, 0);
 	bus->remap_addr = pci_ioremap_bar(pci, 0);
 	if (!bus->remap_addr) {
-- 
2.25.1

