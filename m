Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FEAC1F03FE
	for <linux-sound@vger.kernel.org>; Thu, 20 Feb 2025 11:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740050064; cv=none; b=COuaaIWoxBDTSxqqEmaE5JeRFCctRLmIV6DsglI3Jz06qzxsYiWW6Jj4EMBuZ+4kcQ7oKPA0Qe+pYamKLsbJwL35djecyOVkeQm5p3X0qPe4fNXsnEcpqZjkosfsbd8pAQYCkJkABbihTpDlw+g+QKDAL75QJYS43jCBkxnU8lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740050064; c=relaxed/simple;
	bh=p3GUbFav/XWtvWoYSNlwk/zQ2OQ5Vd+kRKb6gzjYt4E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Xh5MomtBQ6eVZhYQ9zyzSVVh0nrVgw3CVZmF9JIKHLutgADSQJIcIV6VIDaNhVurgayzK8gwTA5oScPdhlNCQflO4mKQ+ITyVoISBXr8KcqSwdDYQzL4tv9px51KTbSt7FD1iiPrQ+V+dYyUDJ163qaGDCB+rWY/KwCvuaOzaBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bu6fYmiY; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bu6fYmiY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740050063; x=1771586063;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=p3GUbFav/XWtvWoYSNlwk/zQ2OQ5Vd+kRKb6gzjYt4E=;
  b=Bu6fYmiYKCt6KUFgtDtmtF+ub6KQgCKxS52nFvEENN9ZVvCV+R4QmClj
   +248BGDw5RnpuQtIFSZLO1Lpn97wNkHZPKZ66bU7paOWn5qChanzAKgmK
   +Cu42zAL0VIUzlyacwuqf2KRot7EgpLFQhmXjpqGYJAjDqvn9wJTb1lFQ
   ej2nRmAb/3nLk2ZuAVRrXzffH/+SmAxUFNPeP4cxcvDgxekn6FLdLYvaD
   lnIwXc3bhggJzfUj70/TJ07WBzs1bfniaTgTbMb/YUAFRADvM6NK2L1uc
   UOCB9/mVoDzhcw1/Cdj/gQeUkOzV45tYPhOZTiuWgGSoLZKxzbZlroHps
   A==;
X-CSE-ConnectionGUID: 0ZOETWTaQz+jLRG0YdfAXw==
X-CSE-MsgGUID: zGasfYqqShC4vHraaGl8vg==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="51808185"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="51808185"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 03:14:22 -0800
X-CSE-ConnectionGUID: 2Fs/CjWjQb+yvkrMDQtYcg==
X-CSE-MsgGUID: B83pXgPFS1mnC64nAjvMUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="114865288"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa010.jf.intel.com with ESMTP; 20 Feb 2025 03:14:20 -0800
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
Subject: [PATCH 04/24] ASoC: codecs: rt1019: Fix definition of device_id tables
Date: Thu, 20 Feb 2025 12:26:23 +0100
Message-Id: <20250220112643.3813295-5-cezary.rojewski@intel.com>
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

There shall be no comma after the terminator entry and initializing
fields with 0 for statically defined structs is redundant.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/codecs/rt1019.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/rt1019.c b/sound/soc/codecs/rt1019.c
index d989d06a2614..2587e3742499 100644
--- a/sound/soc/codecs/rt1019.c
+++ b/sound/soc/codecs/rt1019.c
@@ -547,14 +547,14 @@ MODULE_DEVICE_TABLE(i2c, rt1019_i2c_id);
 
 static const struct of_device_id rt1019_of_match[] __maybe_unused = {
 	{ .compatible = "realtek,rt1019", },
-	{},
+	{}
 };
 MODULE_DEVICE_TABLE(of, rt1019_of_match);
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id rt1019_acpi_match[] = {
-	{ "10EC1019", 0},
-	{ },
+	{ "10EC1019" },
+	{}
 };
 MODULE_DEVICE_TABLE(acpi, rt1019_acpi_match);
 #endif
-- 
2.25.1

