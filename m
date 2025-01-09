Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF940217668
	for <linux-sound@vger.kernel.org>; Thu,  9 Jan 2025 12:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736426286; cv=none; b=D4Ikw824KQaV3HcCBJwrTWmzCkFO/JII1wt35SODgG1EKTpmMpFRKXNrMQlJdrNaPNgktwGna2VEcA8KM1KTbV7y11W8T95yE+hrIMzYpZLGAImocwtgoC/U0sAlsDRMskXKkErnze5xMn4O/hqSdUwNv4e3zlOyREIRR0tR45s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736426286; c=relaxed/simple;
	bh=l2zrBulFLMUNmXK8A8FxgFjLViM7ne+P/mUgPIQzjFI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CCL0kqgCBC3V1ZkVk99XLcEBg5v12cVtuEENypL3c3RQF4FPL60cDDIZHDH2+5NsCuP/WvtfInsZWzoCrsW19RgJe45a+OWimRptZQ1BK4CAQItfSkwl5NL4FcHn7Nw2I+w99yeuig1B9Hq3dbDgI1S+oRQQsOq08TEj3jGXPEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jh+XZHGf; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jh+XZHGf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736426285; x=1767962285;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=l2zrBulFLMUNmXK8A8FxgFjLViM7ne+P/mUgPIQzjFI=;
  b=jh+XZHGfbBvcIPyf0DG4LaBgkn/eohYlgbQvw7bG1dDIS4JXAcmYjRpl
   +W0DmSWGTFtLb7ur5uoi19DMbDpUbAio6ZpjmOKcEqR2labyHkAQqHFyg
   IUISrs/a7+bNiNhFTKH0XGtIRniOjhlY+nFArdG/MASEUZkewdRZi97x7
   S7Sy0hnoPhqb6utsRi/dK3nKRjH/4BbXxQ0N61ixoeLz3QJD8FY12kyng
   aSm80XwzzA5BDzj+AtXYgxh4u9Eq/7vAWsdMWKFzS/OZvVba5znzlNSBv
   fyY1nFJyLNoQcLPXhuCOWAmkvWFnEmnMGKjRHQiddgcI1i/AOlTdfrNg7
   A==;
X-CSE-ConnectionGUID: S1ONI6SESiinb4rjI3kATQ==
X-CSE-MsgGUID: nMUJ2J5fSmyV5YAAELHBBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="40449794"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="40449794"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 04:38:05 -0800
X-CSE-ConnectionGUID: VnAJdbZDSDGWsoegsx4CyQ==
X-CSE-MsgGUID: /ShiI/amQtqI9S3y688z5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="103194363"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by fmviesa006.fm.intel.com with ESMTP; 09 Jan 2025 04:38:03 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	broonie@kernel.org,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 3/3] ALSA: control: Fix argument type mismatch
Date: Thu,  9 Jan 2025 13:52:04 +0100
Message-Id: <20250109125204.3668961-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250109125204.3668961-1-cezary.rojewski@intel.com>
References: <20250109125204.3668961-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

strscpy() expects argument of type "char *", not "unsigned char *".
Found out by Coverity static analyzer.

Fixes: 68fa05d4a82b ("ALSA: control: Introduce snd_ctl_find_id_mixer()")
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/sound/control.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/sound/control.h b/include/sound/control.h
index e07f6b960641..f7e18a1d144f 100644
--- a/include/sound/control.h
+++ b/include/sound/control.h
@@ -161,7 +161,7 @@ snd_ctl_find_id_mixer(struct snd_card *card, const char *name)
 	struct snd_ctl_elem_id id = {};
 
 	id.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
-	strscpy(id.name, name, sizeof(id.name));
+	strscpy((char *)id.name, name, sizeof(id.name));
 	return snd_ctl_find_id(card, &id);
 }
 
-- 
2.25.1

