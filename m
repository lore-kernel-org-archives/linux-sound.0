Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88BAA36B05C
	for <linux-sound@vger.kernel.org>; Wed,  2 Sep 2026 08:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788336850; cv=none; b=Rt7vPZkrzRBZXfWDh+zoVntWhpZvLp6af5Pus06IsLs4Lwf/nUtmyYBPPdhegu9PVAbJPgznas+WgjbPNBONp9sdfjCp7Vxp/Zt/na0hG2rdAAC8Y0n20ZXodDqGNjkHZv6LeuEuTMgRsQWXymsmuqWhI0MxyXeBfzc2y/6V5m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788336850; c=relaxed/simple;
	bh=G70ARliYoUG3VCw+eScsZYM12L5vb91w53SyoI0+Hd8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GijAFGNHcTASo0G03DTE0BqR1a9SPoE9obNCR/VbEHN9SsoNspNPyT3G9jz6H0zTUWR97hEZQbVxQrtUANc41GglzSbi8BbQUn86ldBHzf78eu01k//EBEJA3S5JpNtOgBz2CL9480GXkQ0y0XqeoK08ayBR5q8Xni0ncogzdtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GAlR8+fz; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GAlR8+fz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788336848; x=1819872848;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=G70ARliYoUG3VCw+eScsZYM12L5vb91w53SyoI0+Hd8=;
  b=GAlR8+fz64T9R1WsMtLjVuvW65oFd4QSSAtz7Db8+1Ub8q0lafMwi/tz
   QfKIyHK3AKCDYUKcPfCdFOOEFMzTFV6FIohEHW0I8RsgFl9D00DLlIdZT
   3+yN2rHmbg0nr1i8IxXffkyRL05zBkixeV2RW+Xd8ub/OqBPW5yaZoUCg
   cIbCq9NQSirIOYsxNPQzEI6S28IlHECycdWOnissWJJMp3H39kqaV5ciH
   DTL6NiNosluiHBjxxiGwCOcwyk959bqeGuZN1za1OgWDy+el/rKRDmKWC
   HqoxA5Bpm52uqal4P2erOXV3Of4yb5dUh7Qx4JW+gKcwygtGUqUcx9gHH
   g==;
X-CSE-ConnectionGUID: yRayQcopQUSCpTsZAFnDOA==
X-CSE-MsgGUID: acF5qWkrSpyYiuPUgzi2CA==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="99120953"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="99120953"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 01:14:06 -0700
X-CSE-ConnectionGUID: jIdwkKY8R+OijKunCzkzMA==
X-CSE-MsgGUID: Ej6I68bZTp2+Y9pQYZmP2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="266099056"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa007.fm.intel.com with ESMTP; 02 Sep 2026 01:14:05 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v4 01/10] ALSA: hda: ext: Clean up links if their initialization fails
Date: Wed,  2 Sep 2026 10:18:05 +0200
Message-Id: <20260902081814.1590883-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260902081814.1590883-1-cezary.rojewski@intel.com>
References: <20260902081814.1590883-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

snd_hdac_ext_bus_get_ml_capabilities() allocates the hlink nodes
one-by-one but the procedure may fails due to -ENOMEM in the middle of
it. Clean up the list before returning the error code to simply the
function usage.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/hda/core/ext/controller.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/hda/core/ext/controller.c b/sound/hda/core/ext/controller.c
index b1f1eff1d181..6d0af7e6f63c 100644
--- a/sound/hda/core/ext/controller.c
+++ b/sound/hda/core/ext/controller.c
@@ -90,8 +90,10 @@ int snd_hdac_ext_bus_get_ml_capabilities(struct hdac_bus *bus)
 
 	for (idx = 0; idx < link_count; idx++) {
 		hlink = kzalloc_obj(*hlink);
-		if (!hlink)
+		if (!hlink) {
+			snd_hdac_ext_link_free_all(bus);
 			return -ENOMEM;
+		}
 		hlink->index = idx;
 		hlink->bus = bus;
 		hlink->ml_addr = bus->mlcap + AZX_ML_BASE +
-- 
2.34.1

