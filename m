Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9959E2C69A
	for <linux-sound@vger.kernel.org>; Mon,  8 Apr 2024 08:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712564221; cv=none; b=idGlpbb2SUoHsjTL8vu0V1W3qi5TrW/6FoCIIdiXOJsMTx1bgiY09QbtVxc7C6xcUOGakcVASJ+G1S8OxLTLD5aJgLuH+qWK3TMKfLAQOSMr56jUwP5wJrHLkPs7QyHNDw4xMqWsNPRjtJXOre1VASN+dGyYpsKRtoQ/XbBkh6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712564221; c=relaxed/simple;
	bh=hWpkCqxGQaDmaI3UrlCyIJvMhWnM4kJOUrQsdH+VEMk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=geRoOqs0nUCmrGHQIN9HthgE14Tx131LQTOzBHZPNplZJl3tJ6BdU8pk215T3tTwEYXZReaCYQ5YN78Qfvz91yr8Ip3JE3WSAkyip5xi2faSf9AyeniN8TMkXvIxB34+7idVA9c8ldUPWARnLoJMl8pi7Q8/peOjg+k139WpxWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EKNStiL1; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EKNStiL1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712564219; x=1744100219;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=hWpkCqxGQaDmaI3UrlCyIJvMhWnM4kJOUrQsdH+VEMk=;
  b=EKNStiL1fZPTHq0M0IVgXngf6rrTzfUlmpLMd9B2DpEnOZE/aTSzRrcp
   xPMmT0he14v7BJ6U2tDQJkY22INsxCtnwpxipEdEnea1a/Sy0BebDcda5
   VFDYQiFIxKhXCh4bI95xyHK/umXJLGdpk4MIx/dGoiRpfSCnodJMCKkay
   ev7aeABryMcTZ2HRfQYxYr3Me2V63f1/w8LwaJNAc8FU77MpZz8PTY/ZO
   R13SgyEE0y0bcbug8kPNnHvEM3GU1qbBMYAJ9bhPdJDma97Z1wPUXI4tV
   DlStVSQzdaeQ/7Cj9T1QMym3plVKIpXcY+M9DooiZ1B4OVP2Ez5xpz0zm
   w==;
X-CSE-ConnectionGUID: G6YO0+64RdSxTgp/vt8nZw==
X-CSE-MsgGUID: e7XSlhmqSl+3JysiZEUKiA==
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="8407052"
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; 
   d="scan'208";a="8407052"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2024 01:16:59 -0700
X-CSE-ConnectionGUID: ff6g1z8fRSCirK/jH6WeiQ==
X-CSE-MsgGUID: Nv3cBT3JR0uaBRu065JJxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; 
   d="scan'208";a="20245004"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orviesa007.jf.intel.com with ESMTP; 08 Apr 2024 01:16:56 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] ASoC: Intel: avs: Fix debug window description
Date: Mon,  8 Apr 2024 10:18:40 +0200
Message-Id: <20240408081840.1319431-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Recent changes addressed PAGE_SIZE ambiguity in 2/3 locations for struct
avs_icl_memwnd2. The unaddressed one causes build errors when
PAGE_SIZE != SZ_4K.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202404070100.i3t3Jf7d-lkp@intel.com/
Fixes: 275b583d047a ("ASoC: Intel: avs: ICL-based platforms support")
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---

Follow up to the recent series for the avs-driver [1]. With
static_asserts() added [2], build problems occur when
PAGE_SIZE != SZ_4K. Patch fixing memory window description [3] fixed
only 2/3 offending spots.

[1]: https://lore.kernel.org/alsa-devel/20240405090929.1184068-1-cezary.rojewski@intel.com/
[2]: https://lore.kernel.org/alsa-devel/20240405090929.1184068-13-cezary.rojewski@intel.com/
[3]: https://lore.kernel.org/alsa-devel/20240405090929.1184068-3-cezary.rojewski@intel.com/

 sound/soc/intel/avs/icl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/icl.c b/sound/soc/intel/avs/icl.c
index e8b4983e03e9..7a1ecf241856 100644
--- a/sound/soc/intel/avs/icl.c
+++ b/sound/soc/intel/avs/icl.c
@@ -66,7 +66,7 @@ static_assert(sizeof(struct avs_icl_memwnd2_desc) == 12);
 struct avs_icl_memwnd2 {
 	union {
 		struct avs_icl_memwnd2_desc slot_desc[AVS_ICL_MEMWND2_SLOTS_COUNT];
-		u8 rsvd[PAGE_SIZE];
+		u8 rsvd[SZ_4K];
 	};
 	u8 slot_array[AVS_ICL_MEMWND2_SLOTS_COUNT][SZ_4K];
 } __packed;

base-commit: 1f58d8580e5da64669d923ced99cb3e29832273b
-- 
2.25.1

