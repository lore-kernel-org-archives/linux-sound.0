Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C075D1F193D
	for <linux-sound@vger.kernel.org>; Thu, 20 Feb 2025 11:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740050107; cv=none; b=VWSizFmpDRbqQQ+lY76rukBBkZHsicQgKLNc6Gx1sX8PRMJy7SGNC3gEZfm0RY64fbEG6qqBKa/Xw2O9mzQ2WeTmfT89/A3EucZI7lXkzMjhRJnaLWO5lkxcF64fBQaTi4Qz3Mb8wPc1UoZHMfb/0XDegm2sgeVc3I2VlmNDJKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740050107; c=relaxed/simple;
	bh=3oqexYrDkoV9DmaNPFqdO5hb+VnrO8CDYttcf7zFgeU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Wrs5Wk6uVsSH9BVKEyTd50Dpib9BPipFgnvzdgiB01Rw3x7mehABXVACYYXGyMizu1fimh6wC8g4qgzi3tdZ19j8MNFQRaEddyqex1B9DL73+/uby75Xzt5f5gphMJOVSDt3PnXVuDzikMZegxmk80Jwhchv/2dItgJsKFnF3is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OMmdvQEt; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OMmdvQEt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740050106; x=1771586106;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3oqexYrDkoV9DmaNPFqdO5hb+VnrO8CDYttcf7zFgeU=;
  b=OMmdvQEtCHap4ey/FiVxN9DdJ6fG9J670VoIzIQSB5IycsBQKHcpg8/U
   0/hZEmN6Jfh9Fxhcfttt4mEGfc/mvYgV3E1kF6K2W1e3r2yE+6roHWfAr
   ugqxePwAWrMn+/TqpKDUsfTaEmzc99v87Sti6UmcIlZUDdV1djHlM8N5h
   u5+S6kBAlkVq+xG7OG6cvmbT9S5NHDBB865DZ1//3+9CHGoOGaKsU0Mlg
   wDRDtygB53VbZFbBlyDEmv1a+peLh21AxFwGbqkxOcHg+xTAXSgjewuL0
   xDKWE3bUTTVHl2YaAIOGp/HUeGAZlOQGhFz2Jlrzwb35DPjcxg8Q8NxLR
   A==;
X-CSE-ConnectionGUID: oEC8IpImSrijYngMQ3o0VQ==
X-CSE-MsgGUID: DPfTPI5JQza/4gaOSbbOLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="51808377"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="51808377"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 03:15:06 -0800
X-CSE-ConnectionGUID: fwro8iFqQFmwymDJ+lzPUQ==
X-CSE-MsgGUID: JqRtFtp+SZOKrN/aiBsItA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="114865499"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa010.jf.intel.com with ESMTP; 20 Feb 2025 03:15:03 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	oder_chiou@realtek.com,
	flove@realtek.com,
	andriy.shevchenko@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 22/24] ASoC: codecs: rt298: Update definition of device_id tables
Date: Thu, 20 Feb 2025 12:26:41 +0100
Message-Id: <20250220112643.3813295-23-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250220112643.3813295-1-cezary.rojewski@intel.com>
References: <20250220112643.3813295-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Follow PCI-based format (10ECxxxx) for ACPI IDs by adding relevant
entries to the existing table.

While at it, there shall be no comma after the terminator entry and
initializing fields with 0 for statically defined structs is redundant.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/codecs/rt298.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt298.c b/sound/soc/codecs/rt298.c
index 13aef6c5e91c..37c234f1109a 100644
--- a/sound/soc/codecs/rt298.c
+++ b/sound/soc/codecs/rt298.c
@@ -1144,8 +1144,9 @@ MODULE_DEVICE_TABLE(i2c, rt298_i2c_id);
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id rt298_acpi_match[] = {
-	{ "INT343A", 0 },
-	{},
+	{ "10EC0298" },
+	{ "INT343A" },
+	{}
 };
 MODULE_DEVICE_TABLE(acpi, rt298_acpi_match);
 #endif
-- 
2.25.1

