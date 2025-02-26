Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1512147EA
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 11:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740568251; cv=none; b=eOB+CtZo3lZ8d2y6KoNSJVFsG0FYLewNa1Dwd3WVqTpr2bELlRu6z4Szu+A7jUnRcU+GumMu/Ey67siWWakrk7KDWZW4c3PVhqCyRg7vJlcmJKtA7t8KMqdQ8mDIX/nOmxmC+IQmK9zD0NaPT1CJWAzplrwRP9jjpkPk245hh5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740568251; c=relaxed/simple;
	bh=CsYmwdM4K4i5hkFeQerNDLtCd6nmRJ8Bop1F49Ux+D8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZQAqqvs6566wvBje7xFlyLuyJ7WAAjfVmabpMuUzoH3JwIVMIe8HiR19w0K2wYSs7sttlBveP28lGzVfQmVsIy6oeH+s9ul95QKJ+Dnx38R6MS27zJAjVEdxCGpJfkvWufyQrNvKGZKHYNex0kosSj6hL34r98llkXKL3TQabBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Txyd8J7R; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Txyd8J7R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740568251; x=1772104251;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CsYmwdM4K4i5hkFeQerNDLtCd6nmRJ8Bop1F49Ux+D8=;
  b=Txyd8J7RHv4L03CeeIY7szfdDcupzBN/1KTM6lVWTgFYGdGPzh7Hs7hA
   iuz7mmiJe1/BI3q7a85UuIt5IPp1v6/YGdqS/VQ9yoqHB5MBtLK24ug+/
   vcoCWl4IXk4J5RRLXMzc/+0sPU3LYahIW7jJ6Ts9gt9L6vBuQE+UVvNeq
   vTSw+SkY3sAPqf8fW+ta5HfRp+m8hjCmiHyoqBXvufdEtzNQjeJy2LpQl
   Llx+jwH2zjqGknzPZuKZhK9andWQSP/rRr9Lw5JDyjGYQ7HWbsbAYpVXC
   n0NmqTk8XESh5fZ6S5vi750pBmqpRwWIrL4lWmV1MYMc4pMIh5ALwAhUz
   g==;
X-CSE-ConnectionGUID: NH7zKUUmTDKgtCcmBUIL2A==
X-CSE-MsgGUID: Ww6dXKUKT+mM9WxrjUrAiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="41111236"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="41111236"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 03:10:51 -0800
X-CSE-ConnectionGUID: JOhKqOOmTw6/UNOJXejcIA==
X-CSE-MsgGUID: w6jgN0ysQBazBWZaie1wNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="116685221"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa006.jf.intel.com with ESMTP; 26 Feb 2025 03:10:48 -0800
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
Subject: [PATCH v2 21/22] ASoC: codecs: rt298: Update definition of device_id tables
Date: Wed, 26 Feb 2025 12:26:11 +0100
Message-Id: <20250226112612.166989-22-cezary.rojewski@intel.com>
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

Follow PCI-based format (10ECxxxx) for ACPI IDs by adding relevant
entries to the existing table.

While at it, there shall be no comma after the terminator entry and
initializing fields with 0 for statically defined structs is redundant.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/codecs/rt298.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt298.c b/sound/soc/codecs/rt298.c
index 13aef6c5e91c..dd2d27515e7e 100644
--- a/sound/soc/codecs/rt298.c
+++ b/sound/soc/codecs/rt298.c
@@ -1144,8 +1144,9 @@ MODULE_DEVICE_TABLE(i2c, rt298_i2c_id);
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id rt298_acpi_match[] = {
-	{ "INT343A", 0 },
-	{},
+	{ "10EC0298" },
+	{ "INT343A" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, rt298_acpi_match);
 #endif
-- 
2.25.1

