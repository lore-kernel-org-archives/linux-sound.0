Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCEE1369BB
	for <linux-sound@vger.kernel.org>; Wed,  3 Apr 2024 09:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712136676; cv=none; b=a0/+CmdaUH/i/hM3yScjrBb6DMc8ypu16Qx73TwjC9BL5cJfOj6v/Yfd8YQL4UMFO4POVu8aQC5wTr84AfzTnAnfHEDdXfegJefq4wT7UFeMklN55GUUY6BYY0Uuw1ySeAinlTV7V+ABGYT+ANlu6RKDm3VbBXkC05DWfWb/DdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712136676; c=relaxed/simple;
	bh=dyAOo+VFBsweUHd5Xag2bd447ewOnMyY3G3yMPwcU1o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HeX96YVnS3pMEeKCfHVWRjwe02zvGxSmuZEABwRu1JYqrxzhboTRhZQlj8E5x9O5ABvUWvKQ8kWfLD8IqpWcXz0uxWtnTX2+feDrrr8ZIyvLqwL1ycbXfCO+1/dOVSm+hhU657xGQOBcoueoG51pnTHBaN3OBrQ0dJDBiDVDOJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NdD7e7zo; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NdD7e7zo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712136675; x=1743672675;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dyAOo+VFBsweUHd5Xag2bd447ewOnMyY3G3yMPwcU1o=;
  b=NdD7e7zo0YlsPWrPP726Uk/c9mMVmZVi7Ua+CED6+3N92+tSNlXZcCVX
   CqLWv3io+Y4E8XFhyj049cwMMXBEeBWZsc1WqL5h6T0f5PSsXoZ5pmcKa
   NW5+vPbWuINW2bs3P2jCu8RBfb3XzqqoG/vBmsZhaQRDfxPgfEDnm3yPL
   YPoZRoDmHdnBTKQRb0XuEzl5vIH4dS1RmH3cvBzVLTEXKWGYqJx/qmNmf
   6liWOiV8DEHNgU3N5WY2/+2nY989WirmFci10hZ9qO0/U1l/7y+pCSJ4T
   ceV4LUl1W9u34y7T5XDAIJBnbcHraXmEjCN5F8pYGCTULUmPzs1t63gYI
   Q==;
X-CSE-ConnectionGUID: ekxQ/kxSRbKsvDNqOROgtw==
X-CSE-MsgGUID: UCg6Y4K1TIeMmDstQtCQHQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7218681"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="7218681"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 02:31:15 -0700
X-CSE-ConnectionGUID: 947EalOQQeisSw3SqC2xCA==
X-CSE-MsgGUID: r9tbWrhFRaCAYbzC1MClhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="18797535"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by orviesa007.jf.intel.com with ESMTP; 03 Apr 2024 02:31:13 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 01/10] ASoC: Intel: avs: hdaudio: Use devm_kstrdup_const
Date: Wed,  3 Apr 2024 11:31:36 +0200
Message-Id: <20240403093145.3375857-2-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240403093145.3375857-1-amadeuszx.slawinski@linux.intel.com>
References: <20240403093145.3375857-1-amadeuszx.slawinski@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

HDA codec name is constant and we just duplicate it, use const variant
of devm_kstrdup to possibly save a bit of memory.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/boards/hdaudio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/avs/boards/hdaudio.c b/sound/soc/intel/avs/boards/hdaudio.c
index 79b4aca413338..2de703b909c30 100644
--- a/sound/soc/intel/avs/boards/hdaudio.c
+++ b/sound/soc/intel/avs/boards/hdaudio.c
@@ -54,7 +54,7 @@ static int avs_create_dai_links(struct device *dev, struct hda_codec *codec, int
 		if (!dl[i].cpus->dai_name)
 			return -ENOMEM;
 
-		dl[i].codecs->name = devm_kstrdup(dev, cname, GFP_KERNEL);
+		dl[i].codecs->name = devm_kstrdup_const(dev, cname, GFP_KERNEL);
 		if (!dl[i].codecs->name)
 			return -ENOMEM;
 
@@ -191,7 +191,7 @@ static int avs_hdaudio_probe(struct platform_device *pdev)
 	if (!binder->platforms || !binder->codecs)
 		return -ENOMEM;
 
-	binder->codecs->name = devm_kstrdup(dev, dev_name(&codec->core.dev), GFP_KERNEL);
+	binder->codecs->name = devm_kstrdup_const(dev, dev_name(&codec->core.dev), GFP_KERNEL);
 	if (!binder->codecs->name)
 		return -ENOMEM;
 
-- 
2.34.1

