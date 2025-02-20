Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B601EF096
	for <linux-sound@vger.kernel.org>; Thu, 20 Feb 2025 11:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740050063; cv=none; b=LLQqtF53kiyA6zWQBbI0ON/HKbeJPiZaecKGrxB3nSsF2uI3z3tw+y+cHM4j04hnNrjnToZ+6HmNn3coMQDHKeqFCcmlvmNdjWaQk2LyLsqkbJRQ+itb8u3lw0aPNiQrSmPZd1ktQW7yOY4mR1vLpoTsSwMdPDiwka7c+f7Ju4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740050063; c=relaxed/simple;
	bh=ea2+SMnXEblSpgKbVDxVf7SDj72c5OBn75M25KoNjS8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DjTUi3BHxtOiRrWrInJItdt3FdjFrHkrzU9qv7uAgMaoQYyx7hhLhqoAzf/5Z8G4mKeKpBXCDUj1nFih52g1qx9g2VsYfgPTzeOqgMDQyppTbSwoGp/R0EsGWpJ0POkaKZT02BAC1WYYAQmLnQKUsbzYnfZvO+SO6EewbWG9pHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RCndIrCn; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RCndIrCn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740050062; x=1771586062;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ea2+SMnXEblSpgKbVDxVf7SDj72c5OBn75M25KoNjS8=;
  b=RCndIrCnKJodCLRQtGq0I7b54GkmjmukaU9MgynNwm+GcjrjdHD0kzoS
   lzh/zQGBJea+V7Z6lxAh5FzF6N3VXpA3kfCwxmsbxXdhVXcNpXbYWzjmS
   ZCd2Wb9rj98BGy7WlR18DYRGKEv5nYt/UQGEc4ZCz+vdHGaqKVqSVf1Hc
   A0+eV+T7r6ahHpItqQZRpjoK1H2Web1kSXmKAackwE+Fp3ijdnxWw8Jg4
   22PR2KOi+Az8fNYnb/tW3sIrqWYGQOM3nE96DhSQys4tqDDqMct/kU7y3
   il4OUTxEYaLDP5nQjge31iQpMZJHgTSuqp8obZ3dAQo21iUjxBfzJx8Dk
   A==;
X-CSE-ConnectionGUID: JdNauzEBRpKhqaBtU6bL6g==
X-CSE-MsgGUID: 4PDl5F1vRWGgl1mhaVv1Pw==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="51808178"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="51808178"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 03:14:20 -0800
X-CSE-ConnectionGUID: OrSQdAKcSIOaFvnZy+c3lQ==
X-CSE-MsgGUID: lyD6tTIsTXSazSsNgHKaMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="114865280"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa010.jf.intel.com with ESMTP; 20 Feb 2025 03:14:18 -0800
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
Subject: [PATCH 03/24] ASoC: codecs: rt1016: Fix definition of device_id tables
Date: Thu, 20 Feb 2025 12:26:22 +0100
Message-Id: <20250220112643.3813295-4-cezary.rojewski@intel.com>
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
 sound/soc/codecs/rt1016.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/rt1016.c b/sound/soc/codecs/rt1016.c
index fed4da23cba2..2cbeb06b15da 100644
--- a/sound/soc/codecs/rt1016.c
+++ b/sound/soc/codecs/rt1016.c
@@ -616,15 +616,15 @@ MODULE_DEVICE_TABLE(i2c, rt1016_i2c_id);
 #if defined(CONFIG_OF)
 static const struct of_device_id rt1016_of_match[] = {
 	{ .compatible = "realtek,rt1016", },
-	{},
+	{}
 };
 MODULE_DEVICE_TABLE(of, rt1016_of_match);
 #endif
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id rt1016_acpi_match[] = {
-	{"10EC1016", 0,},
-	{},
+	{ "10EC1016" },
+	{}
 };
 MODULE_DEVICE_TABLE(acpi, rt1016_acpi_match);
 #endif
-- 
2.25.1

