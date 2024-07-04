Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D287F1AAE1E
	for <linux-sound@vger.kernel.org>; Thu,  4 Jul 2024 09:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720085021; cv=none; b=R+BN/bXqkM2NLjFhtKIrI9RADxsTwMJ4zGeMgkeQjSmvZ2CKNZS4FacXgiYf6uOMl2g63eFS//4i49HmvUTlAykpDp4OhJ4LdkQL8LBbMq6wYkXo4wCvjO7+Iwgp0A3Bp5+g3mmHrwB/OgF8EhX9g3OqEOlC1K+EBIPKfGtuP4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720085021; c=relaxed/simple;
	bh=uQqeoljhoOFWHFbzXg7Qf677Jf97Mi03dMjqHDsi5X0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qDuC5bkuTMW7Svx6Qe+olrCUsxj6b8l9DZ/49y953N3WxUy1b83GldiaxW0785h6+vga+IZQM/vznQd6WffVzvLD+LAyNh+F4okClRWvKQcOaZy1CVPjLYQU5154+DiKvl81p8d7Dy7bRnx/WY0tseMoaYTekmU0YtnxznxkkKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OG1+BW4s; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OG1+BW4s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720085020; x=1751621020;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=uQqeoljhoOFWHFbzXg7Qf677Jf97Mi03dMjqHDsi5X0=;
  b=OG1+BW4sTZsvW8MYecH4vmCsvZO/b8yGDirCaxY3WpaJjneuaPuMsl7F
   QNDI54rGHV2HUQLWp4ulK+ChTUfgNJ5+bpvBI+3bsjB2kTSOwvJgL3MOS
   k/HpXF1kaSYCz0ubU9FMpCDlYUcqAPFf+vdmldDQFSYrCl0X+wP7MpUYn
   AjpdGa6F/6rB1ifwbbRL0vBCfHt9RImHKZKJyYbPosHPXv3T4ld0ZKpL1
   8fxGGl+DVN/uGdBKdLiIZtxmT/CqYyRqH3sGg8KXP6tslSfGWdBhNNyFT
   DfNKNxgCqyEBofMAiiSnLtcpvJtKF8xxjfVfKtmbd0bQPnP2GM0Zo4rkJ
   w==;
X-CSE-ConnectionGUID: 8XAqF2MvT0STsxANFXcXYg==
X-CSE-MsgGUID: ON1VHJ/TSRqM5nAOrQWoCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="34802595"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="34802595"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 02:23:40 -0700
X-CSE-ConnectionGUID: yMbznU44TL2m8nljoqVXAA==
X-CSE-MsgGUID: KOeiKJKYQDeoJoWWtCreCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="84087981"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.119.127])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 02:23:37 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH] ASoC: rt711-sdw: add missing readable registers
Date: Thu,  4 Jul 2024 17:23:27 +0800
Message-ID: <20240704092327.652609-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Those registers will be used when JD source is RT711_JD2_1P8V_1PORT.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/rt711-sdw.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/rt711-sdw.c b/sound/soc/codecs/rt711-sdw.c
index 8ca8bcd177ab..dfda6bb5c6f8 100644
--- a/sound/soc/codecs/rt711-sdw.c
+++ b/sound/soc/codecs/rt711-sdw.c
@@ -38,7 +38,9 @@ static bool rt711_readable_register(struct device *dev, unsigned int reg)
 	case 0x8300 ... 0x83ff:
 	case 0x9c00 ... 0x9cff:
 	case 0xb900 ... 0xb9ff:
+	case 0x752008:
 	case 0x752009:
+	case 0x75200b:
 	case 0x752011:
 	case 0x75201a:
 	case 0x752045:
-- 
2.43.0

