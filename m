Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133171A08A4
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 11:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740568209; cv=none; b=FJbDImU9Hnl+AT4Dk+rYRgAkP0KvaDp69GRJOsJ15npwBRB5kSK71rMsVHYURNCVDCsbvhruFVl+VnLCYIAjJzHgAJuzpBCcYYKEZvEOenCQwcZ91ddRJnSwHKLn1j0XSy1jpzoXSG2DqZ3xU3LX9xZaeYt5OlYpACvRuzN+jNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740568209; c=relaxed/simple;
	bh=G2cjLDqlU0WCwdv/CO/qbO/YulO7kKWoXoX+OdSX1ec=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dPXfcN5W2N56LOMH78NNlpoM7W+D7DdVQQQlLugalj7f8wjOB//p+JkK68AmmqUBfVUUM3VsliT8aToyvSL57rNYRi/DjWOcaSB91eU6OmQOLgNkjvoGZSVKTPpqfDJqm6Rv2lWTyeSmzm6Z8PeZ5kT91Mnxlerw1Qyw02NRHkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vl3CtiaD; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vl3CtiaD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740568208; x=1772104208;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=G2cjLDqlU0WCwdv/CO/qbO/YulO7kKWoXoX+OdSX1ec=;
  b=Vl3CtiaD9Mev149sbbyGmZQctqnLn7BN/7dTtWI/A/mRCNSaGD7gszfc
   CWu6Sg7TIFaUHmCVAs92isRF+Vej67fzIBcDBijRFRU74GMxMaCpMtM2H
   XN69kyYJOvRnS8j9Azq4Iybx9p5EHcd4EtfeRQJd2TSxPUn6XOYWKJ+wg
   9IctNWzSld4BYR/U2wqXDiA2/n3VKp3B8MLMMSUA9dDtVsqya1OB7yNZl
   7T9si+c+SRnxKgnToTwfWK2KqZ9IEKP3qM5lIvJ1k5CV+Cf0L3bWzPAwG
   cCSiZIXL3EYCJD1BXWsIfTxK6OZ+URQ80gV18mZltWGcZ8uKQAC1UGGAD
   A==;
X-CSE-ConnectionGUID: tuZ+Fo8DTx2V2ofHIqg0rA==
X-CSE-MsgGUID: VdU30Ew2QKujLG8W737m+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="41111067"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="41111067"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 03:10:08 -0800
X-CSE-ConnectionGUID: wu1gS7RlQS+ahVrIrR5PoQ==
X-CSE-MsgGUID: frnsR6AsS4iubCWA6jsYbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="116685028"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa006.jf.intel.com with ESMTP; 26 Feb 2025 03:10:06 -0800
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
Subject: [PATCH v2 05/22] ASoC: codecs: rt1305: Fix definition of device_id tables
Date: Wed, 26 Feb 2025 12:25:55 +0100
Message-Id: <20250226112612.166989-6-cezary.rojewski@intel.com>
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
 sound/soc/codecs/rt1305.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/rt1305.c b/sound/soc/codecs/rt1305.c
index c2b55be8d165..59ddc4b21803 100644
--- a/sound/soc/codecs/rt1305.c
+++ b/sound/soc/codecs/rt1305.c
@@ -966,16 +966,16 @@ static const struct regmap_config rt1305_regmap = {
 static const struct of_device_id rt1305_of_match[] = {
 	{ .compatible = "realtek,rt1305", },
 	{ .compatible = "realtek,rt1306", },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, rt1305_of_match);
 #endif
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id rt1305_acpi_match[] = {
-	{"10EC1305", 0,},
-	{"10EC1306", 0,},
-	{},
+	{ "10EC1305" },
+	{ "10EC1306" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, rt1305_acpi_match);
 #endif
-- 
2.25.1

