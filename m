Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866CD22AE7A
	for <linux-sound@vger.kernel.org>; Fri, 30 May 2025 13:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748613251; cv=none; b=gULFeBAQbrhlH0XVmeLzE7wjPaEkHT6mOUMsy1xd8Y+EK4/jjJtJ3Sml2+VeMDDy2Z6mCjxWaBsX5mYed1DHGfK/czKnReoqMFPW8hgwsmSR+Vcv32N9lfmel9uT720OGuH4UZeRm3JNhCGPyPGorKacU4ccPPQyBvO+HEmLY4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748613251; c=relaxed/simple;
	bh=rSngarSZv9Vc2aY5Wgywpda4sz4TVFea1H3mypciQfE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LFMpvJzrij4uCI8Z9lnBgn6bXYbzVZNCQn6QHfV10VOed0H/tukgegfWqtA9vgT53s5U4RuqalqodIb2+8x+HSXNrUQl4mSDNKm00zWqro2IkXCpkA1pFSBYfeJiJKdBB/VhOIppnXfu0KWdb2ZU4k32anSUAR7sbhs91LuJNGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HEhpVQ0R; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HEhpVQ0R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748613250; x=1780149250;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rSngarSZv9Vc2aY5Wgywpda4sz4TVFea1H3mypciQfE=;
  b=HEhpVQ0RYcu8oW6cxXT9oBbwuPHD3Fop8z0HYMgK5ET79jn7sov0tvmj
   x5VKCtlVMIqS0E00B2CvPsejQMBhYk6RCFV5UYuaCDUuHDuXz8m6dDGXt
   AA274kC+AwAJYUmN0RT7MihfoTdwDSHU4q+0dNyvgBM4M8LgBAVegysNG
   E4fnPj9Qacmf26pEpSR6cUqrUM+rquAgUpoThaNP+LQB2uKSIOotj+Sa4
   Vf2EnKbwLuBXcL8ftknvTJ8cH2wooLghrBxSz6a6Mc0ixBEvFCLHdCeCJ
   OGzoV6w1KRheiJK/GcLojKRJUUl3KH1R7bYb+5W+NH1B1p8r022bdZCek
   w==;
X-CSE-ConnectionGUID: 2TDF4OscTwyKqZpkhiIJPA==
X-CSE-MsgGUID: z5dRL+GHSvySv013i5vKNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="68256220"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="68256220"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 06:54:10 -0700
X-CSE-ConnectionGUID: p10EdLS3Re6hPvz75XYekg==
X-CSE-MsgGUID: 5VHHVYxpQNyDoZvCQ0wVHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="174763475"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa001.fm.intel.com with ESMTP; 30 May 2025 06:54:09 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 9/9] ASoC: Intel: avs: Include missing string.h
Date: Fri, 30 May 2025 16:10:25 +0200
Message-Id: <20250530141025.2942936-10-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250530141025.2942936-1-cezary.rojewski@intel.com>
References: <20250530141025.2942936-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

File loader.c utilizes strscpy().

Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/loader.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/intel/avs/loader.c b/sound/soc/intel/avs/loader.c
index 138e4e9de5e3..353e343b1d28 100644
--- a/sound/soc/intel/avs/loader.c
+++ b/sound/soc/intel/avs/loader.c
@@ -9,6 +9,7 @@
 #include <linux/firmware.h>
 #include <linux/module.h>
 #include <linux/slab.h>
+#include <linux/string.h>
 #include <sound/hdaudio.h>
 #include <sound/hdaudio_ext.h>
 #include "avs.h"
-- 
2.25.1

