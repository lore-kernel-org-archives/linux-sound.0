Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5D921C9E4
	for <linux-sound@vger.kernel.org>; Fri, 30 May 2025 13:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748613250; cv=none; b=MYxAIE+PrDREkJPbPAtfIHywTfCYoALJBsyR9+Yvgm3oBQ2dKiV/4vVbSBYbZVF2LfX7eBpiqUpFj/m4tiYQ9UZ96pv6wHyqhXQex7fGIk5ZoYG8SR0LdnR/LrXuSq+GOSP5q+DHsnEq2/w/NDjPKM5mGjwKBS9oiUGfi6QKsUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748613250; c=relaxed/simple;
	bh=Jc1zqvOz04Yc/TBj6VKRnvfCVbJE4O7S0CRCHWpLL9E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NStVy2yRjwDnlDmlh6k3HzvBnhkqSVCq/cV/425AM6L32mVziuiOoSPghq9Ds8RP3K+n7zFvtkuHGKaEdpiUGLijbCR0zlghtu1E0YIiEAwckE06ts/HSu2Njv8881E+ZIt4DGOupPJzRJgMGa7sflVVzj6k7iDKcDP4n9nkwLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oLAsBQKW; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oLAsBQKW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748613249; x=1780149249;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Jc1zqvOz04Yc/TBj6VKRnvfCVbJE4O7S0CRCHWpLL9E=;
  b=oLAsBQKWZ8Cj36IQ5qNIrZdjCcG6GYtafvMvVzOse108/J0S8OkckwCb
   AyRadw6gKGWQCkMu7cYHy1hzUFffWC5R9YaPzY8eWOYvu6d1PFGYgZ5CF
   p/vCq9/amjVsssLrmV3NpxgEa7UuVjLA7EWELUGqeIj2EflzwWEVojD55
   cO/0LBvVFBso95K57cnLyPZ1YuGNmxHcqOVSD1/PjjN+/Z/NeQf2xZneN
   Zrc7Mrhqo5DQawggzkB81Mp1cYQfehIs2DQmAxC6YlQ6EgpYZpkju32zs
   OEDNrG70Oat0zo1qiG2PXSNPTQEohxb2caJOV8+5dJDoqK///OaG/kOW6
   Q==;
X-CSE-ConnectionGUID: eIL58B4IRDaCHiFMwYa/Kw==
X-CSE-MsgGUID: ROJ0GnmrTmaZ5rLUwFYOfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="68256213"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="68256213"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 06:54:08 -0700
X-CSE-ConnectionGUID: J2pQhUqmQ9WseYiNYW5GnQ==
X-CSE-MsgGUID: RZKu5uJHS8+nHQyDdazYTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="174763468"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa001.fm.intel.com with ESMTP; 30 May 2025 06:54:07 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 8/9] ASoC: Intel: avs: Simplify verification of parse_int_array() result
Date: Fri, 30 May 2025 16:10:24 +0200
Message-Id: <20250530141025.2942936-9-cezary.rojewski@intel.com>
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

The function return either success or an error code, no need to involve
'<' operator.

Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/board_selection.c | 2 +-
 sound/soc/intel/avs/debugfs.c         | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/avs/board_selection.c b/sound/soc/intel/avs/board_selection.c
index 636315060eb4..673ccf162023 100644
--- a/sound/soc/intel/avs/board_selection.c
+++ b/sound/soc/intel/avs/board_selection.c
@@ -548,7 +548,7 @@ static int avs_register_i2s_test_boards(struct avs_dev *adev)
 	u32 *array, num_elems;
 
 	ret = parse_int_array(i2s_test, strlen(i2s_test), (int **)&array);
-	if (ret < 0) {
+	if (ret) {
 		dev_err(adev->dev, "failed to parse i2s_test parameter\n");
 		return ret;
 	}
diff --git a/sound/soc/intel/avs/debugfs.c b/sound/soc/intel/avs/debugfs.c
index 0e826ca20619..c625cf879f17 100644
--- a/sound/soc/intel/avs/debugfs.c
+++ b/sound/soc/intel/avs/debugfs.c
@@ -144,7 +144,7 @@ static ssize_t probe_points_write(struct file *file, const char __user *from, si
 	int ret;
 
 	ret = parse_int_array_user(from, count, (int **)&array);
-	if (ret < 0)
+	if (ret)
 		return ret;
 
 	num_elems = *array;
@@ -181,7 +181,7 @@ static ssize_t probe_points_disconnect_write(struct file *file, const char __use
 	int ret;
 
 	ret = parse_int_array_user(from, count, (int **)&array);
-	if (ret < 0)
+	if (ret)
 		return ret;
 
 	num_elems = *array;
@@ -369,7 +369,7 @@ static ssize_t trace_control_write(struct file *file, const char __user *from, s
 	int ret;
 
 	ret = parse_int_array_user(from, count, (int **)&array);
-	if (ret < 0)
+	if (ret)
 		return ret;
 
 	num_elems = *array;
-- 
2.25.1

