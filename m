Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D501F0E2D
	for <linux-sound@vger.kernel.org>; Thu, 20 Feb 2025 11:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740050075; cv=none; b=bOSkWHABniF7oEO1W3cwbTqLIvUYg3GG25EwAYjNNWhp2kZZJaldrTZn10uSJb96ooPSQ2w2NYCg6K1PWRmrf8hneelUOwvoRz0/TlNwn9hbSoVJs72C6qiZyACXbuB8FoNKi1MH06Xq9szfoDOTokDuepezxZFv6Db0Baw+gI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740050075; c=relaxed/simple;
	bh=5mdVbk3ShjAm2uuV99hD3bLJYXMjh+WuU4x7wUeKbsQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eJYqO3XYmRJrKG/VW1rGRHGXeM/jxpr/VbJ6piVK33cKUojEjEvjJzCPHCvvLk3bd/ypaFCJIHKLSzIvYbiRqYBbftJJUeEn48SQqx2y1KP9HuMIaWi7oIJsn8psWVLBTIwwLERv6TKJ+i03gYbY+2+Ts0OhyM+J9Wk6Adh493Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UISmcu3N; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UISmcu3N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740050074; x=1771586074;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5mdVbk3ShjAm2uuV99hD3bLJYXMjh+WuU4x7wUeKbsQ=;
  b=UISmcu3NW0ouKpT/j2ARhGiOYd3XqeSVYy6YbkS9hBMqFqyIZzUbsKlN
   Ccr3fQy6t5T1SscApLJ0RPx5Qg/OxQ2QBJePqNuzwo9E17L2n+3LXBRig
   glDgUvItVLNKte9EsRqVyFlDr3nnygh3OHVg75e4cA90AWvFWrE7Gq0ZT
   Jh+99lT0lx8dmmEQsmhMBf1z2RMZ1Saumm02Tc+GOCEIvS8cpnBpcpO9v
   RBWj7ZqApF/IuxoV/WgcNjMKw7XVAsnQQLKC8Z7Z7B7Za6lzuE/jcME1O
   brn9syfCQ5UquZwBXeaFkQzvXT7MnzUELMJTNHGL+A+yAYM9ErFTgb/+S
   w==;
X-CSE-ConnectionGUID: sAD01FKOQ6OSE2aUb2KBFw==
X-CSE-MsgGUID: PQWLQJC/TkmUjsOPVBq68w==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="51808240"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="51808240"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 03:14:34 -0800
X-CSE-ConnectionGUID: ZJOkK2kwQNqEWSMBxQJLMQ==
X-CSE-MsgGUID: pW5f2uZpSDiexrBhApT6NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="114865329"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa010.jf.intel.com with ESMTP; 20 Feb 2025 03:14:32 -0800
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
Subject: [PATCH 09/24] ASoC: codecs: rt5514: Fix definition of device_id tables
Date: Thu, 20 Feb 2025 12:26:28 +0100
Message-Id: <20250220112643.3813295-10-cezary.rojewski@intel.com>
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
 sound/soc/codecs/rt5514.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/rt5514.c b/sound/soc/codecs/rt5514.c
index 2b3c0f9e178c..69141a5773bb 100644
--- a/sound/soc/codecs/rt5514.c
+++ b/sound/soc/codecs/rt5514.c
@@ -1207,15 +1207,15 @@ MODULE_DEVICE_TABLE(i2c, rt5514_i2c_id);
 #if defined(CONFIG_OF)
 static const struct of_device_id rt5514_of_match[] = {
 	{ .compatible = "realtek,rt5514", },
-	{},
+	{}
 };
 MODULE_DEVICE_TABLE(of, rt5514_of_match);
 #endif
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id rt5514_acpi_match[] = {
-	{ "10EC5514", 0},
-	{},
+	{ "10EC5514" },
+	{}
 };
 MODULE_DEVICE_TABLE(acpi, rt5514_acpi_match);
 #endif
-- 
2.25.1

