Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FFD2205ADD
	for <linux-sound@vger.kernel.org>; Mon,  3 Feb 2025 13:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738591051; cv=none; b=oxuliZMbrbglXcCWHrCMPJM8U9xBBAhAdGpeaZlnWUolT9EjZirF8+ZhGfRHIwkHUQh1X29H5zx+J7eY3HuZWuhQCkFeNoFzfUlhRyWj7NwGeU1FsQNX/LTWpV4VoNIhM2w0UievQlCjRFUcRTlzHz51YU7/fop6J6VJQVcE6XE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738591051; c=relaxed/simple;
	bh=CtcjxbxSMe9+UWegxhwcaOmTq/vY0kvzO1AvhGKXPgk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=o+tuEhLbP65TTWYe96N+fJ3GaTzEtlZlvITQko0qQ1WbmqEFq98D1k6AQKvhGtclcbkLb0FBAfXZUcsHjeEE2wrZxauhKQUEhLzqQhovmNa0H4oL8RFqa7/z9JNKxYM8/rJjOr3TGNdtQjq2f468ZTrY4uzSe3zsLoAyT4MtbJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e3DwtCN8; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e3DwtCN8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738591050; x=1770127050;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CtcjxbxSMe9+UWegxhwcaOmTq/vY0kvzO1AvhGKXPgk=;
  b=e3DwtCN8qqWVc+LZztbm7vVZI0Bi6mq5XR3HXK9LR03xGXeo3SAHVC6n
   IzEhT/UpqwaCP8rQDtAmtCLk/f0VE7WLNLMJRjBY8/rxSoWLeAeKz6q5H
   4npUSbv8WTJYs3PWZxa8qGuEh4+J+SacM3QXCWhLIGfUp1oOlDZ8Q5nQY
   nWJlBMBZH8C46JsOjeJ/pWn7TzemYiJbwuStscmkcBViYxx2kO79QGaEK
   TLmCcA8FOqVWITnSGOfy+4gcYuIIxiy6BwTtJGWYtlu6CPi1y45FKyRxJ
   fJGivPMuhlHQJw7shrlX5fVY9kDJJ4UOZVXKoZYtXPOgT634mejecH7h8
   Q==;
X-CSE-ConnectionGUID: pGbEJNu5RSO1j/h9/pVDSg==
X-CSE-MsgGUID: vEISQFQdQDmWIxDPDCBPvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="56511876"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="56511876"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 05:57:29 -0800
X-CSE-ConnectionGUID: ZDSxW/AzQmCXDrnCz2ZcPQ==
X-CSE-MsgGUID: 9ga2+xlhQRebaD1n3UzMSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="110057946"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa009.jf.intel.com with ESMTP; 03 Feb 2025 05:57:27 -0800
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
Subject: [PATCH v3 11/11] ALSA: hda: Select avs-driver by default on MBL
Date: Mon,  3 Feb 2025 15:10:51 +0100
Message-Id: <20250203141051.2361323-12-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250203141051.2361323-1-cezary.rojewski@intel.com>
References: <20250203141051.2361323-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The avs-driver is the recommended solution for MalibouLake (MBL, also
known as RPL-M) platform.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/hda/intel-dsp-config.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/hda/intel-dsp-config.c b/sound/hda/intel-dsp-config.c
index f564ec7af194..9a8ead75be17 100644
--- a/sound/hda/intel-dsp-config.c
+++ b/sound/hda/intel-dsp-config.c
@@ -108,6 +108,10 @@ static const struct config_entry config_table[] = {
 			{}
 		}
 	},
+	{
+		.flags = FLAG_SST,
+		.device = PCI_DEVICE_ID_INTEL_HDA_RPL_M,
+	},
 #endif
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_APOLLOLAKE)
 	{
-- 
2.25.1

