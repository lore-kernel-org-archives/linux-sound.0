Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8714F423A6B
	for <linux-sound@vger.kernel.org>; Wed,  3 Jun 2026 08:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780477026; cv=none; b=kgfOozk5n0Amusf+6jmoRLzwAqJdXamz7gdPyKkR3UN1TViOV/MU+hUgk5EC7/KNomosxcn+qaq3p1/TqvM6GYjkAWzFMfKgGGqKb6wQ67/yeXCAOOs9Y0zlNBB9XtviX9QVtLIjBUIDT9AuylIP/7JS0jaJJTdENp/eHLFjz1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780477026; c=relaxed/simple;
	bh=StTFVFuUJfHzXaOS0soeB516GnJhSKsyq1kCJ0THIEI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jxRA7q3l3i9RuLWCwXhoDyDvwINb8O2eJOAox3SRFWgDvKRhiwiMn0whohHS/XF1ihmS9eqjFGMhvYgnDTz0fEZ6y5jOxF0FBBaBu6ZSNq2P4L86q5YS9CbHLkxLe5+XqdUsylnmvFEkO3FRc0avDr2LbSyrGdt5tVXI7WUo3Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iGttVT4U; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iGttVT4U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780477026; x=1812013026;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=StTFVFuUJfHzXaOS0soeB516GnJhSKsyq1kCJ0THIEI=;
  b=iGttVT4UQ+ouxAHAwpEsfZh0hhtPdxfNjUTCSmcxe7hwUk9oLLYSHmsQ
   AGhjBAUMyLg+OxYChNSqcbyHzsUT1cM8ChbpPteW8nyHlqp9FmIJu7cLD
   zfQJLrSJRlqdyoslVa0sO+4dyQGIi2dQT5VDmp5DAuhLFmaXaMB7LGEj/
   suZbQt92f7hLvzrTn8aixZ2hdxXs4mBEcAZCgNd4m4EAHmOoiOKCBb7w3
   SpXkAqabYUP28ltWRxInRmOG78W0ObiAbLaryy3FawGkjk2Ax/p2cRkt5
   ofvIlDQVTUjSAlk0V0rsyuV48BGyLyL26XkETu2hmOegSTvP5kSi5siuU
   g==;
X-CSE-ConnectionGUID: XkbKoNPZQry7f7cuSP+u+g==
X-CSE-MsgGUID: HQ9S8AVnRnmEK2Wp5FUFyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="81182164"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="81182164"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 01:57:05 -0700
X-CSE-ConnectionGUID: CixHwGwgQwyCNvLWThL8zw==
X-CSE-MsgGUID: cJYEPVpJSuCsEbUL3mhFjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="248109372"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa003.jf.intel.com with ESMTP; 03 Jun 2026 01:57:03 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	andriy.shevchenko@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v3 7/7] ASoC: Intel: catpt: Cleanup components_kcontrols[]
Date: Wed,  3 Jun 2026 10:58:27 +0200
Message-Id: <20260603085827.1964796-8-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260603085827.1964796-1-cezary.rojewski@intel.com>
References: <20260603085827.1964796-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix alignment and drop redundant comments.
While at it, declare the mute-boolean explicitly.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/catpt/pcm.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/sound/soc/intel/catpt/pcm.c b/sound/soc/intel/catpt/pcm.c
index faa9c483c98e..8fb0efb67eb1 100644
--- a/sound/soc/intel/catpt/pcm.c
+++ b/sound/soc/intel/catpt/pcm.c
@@ -968,6 +968,7 @@ static int catpt_loopback_mute_put(struct snd_kcontrol *kctl, struct snd_ctl_ele
 	return 1;
 }
 
+static bool catpt_loopback_mute;
 static const SNDRV_CTL_TLVD_DECLARE_DB_SCALE(catpt_volume_tlv, -9000, 300, 1);
 
 #define CATPT_VOLUME_CTL(kname, pname) {		\
@@ -984,14 +985,12 @@ static const SNDRV_CTL_TLVD_DECLARE_DB_SCALE(catpt_volume_tlv, -9000, 300, 1);
 }
 
 static const struct snd_kcontrol_new component_kcontrols[] = {
-/* Master volume (mixer stream) */
-CATPT_VOLUME_CTL("Master Playback Volume", MIXER),
-/* Individual volume controls for offload and capture */
-CATPT_VOLUME_CTL("Media0 Playback Volume", OFFLOAD1),
-CATPT_VOLUME_CTL("Media1 Playback Volume", OFFLOAD2),
-CATPT_VOLUME_CTL("Mic Capture Volume", CAPTURE1),
-SOC_SINGLE_BOOL_EXT("Loopback Mute", (unsigned long)&(bool[1]) {0},
-		    catpt_loopback_mute_get, catpt_loopback_mute_put),
+	CATPT_VOLUME_CTL("Master Playback Volume", MIXER),
+	CATPT_VOLUME_CTL("Media0 Playback Volume", OFFLOAD1),
+	CATPT_VOLUME_CTL("Media1 Playback Volume", OFFLOAD2),
+	CATPT_VOLUME_CTL("Mic Capture Volume", CAPTURE1),
+	SOC_SINGLE_BOOL_EXT("Loopback Mute", (unsigned long)&catpt_loopback_mute,
+			    catpt_loopback_mute_get, catpt_loopback_mute_put),
 };
 
 static const struct snd_soc_dapm_widget component_widgets[] = {
-- 
2.34.1

