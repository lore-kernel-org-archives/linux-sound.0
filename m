Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7411F0E2D
	for <linux-sound@vger.kernel.org>; Thu, 20 Feb 2025 11:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740050097; cv=none; b=hFwEtAoiUbiuV3Dp7qo2a4fzbiaOFnoOjFEWz7N9VGXf3jZnbRy2Yz4ZXjiKvn0MrdcpCWESBL9ax8IFBgx/farfPVQ0Klw655ycAKpG80UqyhqknqwvDY4li/vxtcoWvfMcE/OzDY6hIF6Q2aR6Lj841FXybkUwXdisOFkjhHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740050097; c=relaxed/simple;
	bh=2S5oA9HtYHVsr7cVexzSEZxRpaNXWBBBLC468Hxo0Sk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MOVbmKchB28X/CBhGHYhB5IDBjjVYuy4tn7OXnelHTcCNdHxnFUkKjrN0XC+ybvhbbkszT+2A4fcuL8Wc+nR/HcEGfEVdxMg1LPbGXYxBL5SvZ5q/l4Kd0bjB+uorsx3/XTxUegg+zPRaCGAKFLtm5oVEg3/A3l2RwI1IXtGvDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZJy/OIIc; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZJy/OIIc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740050096; x=1771586096;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2S5oA9HtYHVsr7cVexzSEZxRpaNXWBBBLC468Hxo0Sk=;
  b=ZJy/OIIc3ZPSRU4DAdAigEGZuZJD320D79jn0TIZEjzIdpfAM3vP6I2H
   H6mab1eJfQ7uarZcOYQOy7SX9unW0D72Qf1n7Q0DpN0G667Ik+Ioxn0pL
   5FzQcYNXHRB68oBGn9J7YS8W1d/CO2X7D8Dd7pAGvRstpiYIFtDQCdCAO
   D7pUINxw1Ab+Om75CWu2XvMh9IK2FDIzP7TYpwkr04yEk2M8VIhKV5UU3
   Pv0RmFIsL8syflpd4VIMqO90FzEd3y2O4/z1cu2Z+u3TSXla/hrCuHqsg
   RVlco7EdMlbY1QoL6JQBd3fwC+88jdYZnzcUtLzrY8KSMHcmD50DnHqI1
   w==;
X-CSE-ConnectionGUID: H/Kr6Im9RGqKUGnKF0jCmg==
X-CSE-MsgGUID: iiTH15A6Q0ecYCqwfhjFEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="51808330"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="51808330"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 03:14:56 -0800
X-CSE-ConnectionGUID: LF8lqV8eQ8eBkiHsMxV0sQ==
X-CSE-MsgGUID: E+lL4C5XRdqtrz54+xVaUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="114865421"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa010.jf.intel.com with ESMTP; 20 Feb 2025 03:14:54 -0800
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
Subject: [PATCH 18/24] ASoC: codecs: rt5670: Fix definition of device_id tables
Date: Thu, 20 Feb 2025 12:26:37 +0100
Message-Id: <20250220112643.3813295-19-cezary.rojewski@intel.com>
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
 sound/soc/codecs/rt5670.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/rt5670.c b/sound/soc/codecs/rt5670.c
index 30bf96c35b58..f40c98920ce1 100644
--- a/sound/soc/codecs/rt5670.c
+++ b/sound/soc/codecs/rt5670.c
@@ -2880,10 +2880,10 @@ MODULE_DEVICE_TABLE(i2c, rt5670_i2c_id);
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id rt5670_acpi_match[] = {
-	{ "10EC5670", 0},
-	{ "10EC5672", 0},
-	{ "10EC5640", 0}, /* quirk */
-	{ },
+	{ "10EC5670" },
+	{ "10EC5672" },
+	{ "10EC5640" }, /* quirk */
+	{}
 };
 MODULE_DEVICE_TABLE(acpi, rt5670_acpi_match);
 #endif
-- 
2.25.1

