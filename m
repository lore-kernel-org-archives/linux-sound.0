Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDAB21A316A
	for <linux-sound@vger.kernel.org>; Thu, 24 Apr 2025 09:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487897; cv=none; b=rbRG9ZYVJoFemk8lt5Uig78WNLe/ZCKkJbeyxyrY1S3LgMYkQyLPnr0L0kWyjpW8Y+vW+r1j1ScSZ1nKxu8CvjoGlOjld2Arx6MDMQaM0NsGaUZlBThLTQ8YvdmasEbFrSny2y446sG0lua0X+n/LdF/RF+jbTw7DTd6jESGA+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487897; c=relaxed/simple;
	bh=7NYJhU4y9C5ky1stWiYJH+Q6lVk+1FhBJnXjHqhRmVg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=Z9oBhCYcd/kfWP/GLgh1mnXGXGD9jMTffVHD2ppPjLuwZM3qpBFDEW/5j3JeddX5SQwucMnRoYyqww8dghNz1ORJmzE9dBPpy4L89VMIL/F04JucMnoN9iIlJwsylEdVXMcjXTobdK3HlaI4dgOBa2Jj12bD1hl0TkFZ+lH6bGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KIcoJoMf; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KIcoJoMf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745487896; x=1777023896;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7NYJhU4y9C5ky1stWiYJH+Q6lVk+1FhBJnXjHqhRmVg=;
  b=KIcoJoMfaYOJu+q3E1KmPQ1em0mAfxfPJLQQXLSBiXQ86s5/fLRTfwR5
   /dZ/YD3s/IHo5NorqjgRCapUJHnLumVsjIVdlwWT0Nv9eSQJXOcBdB38s
   X1VpWzCRSt7I/bdP/vTqZ1cBF2MAxPVgdg0wKXDBf+kQ45cV6ToAodv8r
   HOM/0FpYdEjDW8sBiRh5lJgxmYKmBGt1ECt3rbfyQJLU7OsikRNbKKB5x
   /V+D8N1gSIJ2swJW9AfkGsXosQi4S/oaMkt0x3ydmb1AlDafNoe13vyMt
   jN+4ZrJBW00R+QOpBngj4HAGW06rsq2IdkrWOugmTKRqkg80PZ2gWs6KA
   A==;
X-CSE-ConnectionGUID: pwZjbeSXR+mYH+FwHIX1hA==
X-CSE-MsgGUID: +AWTwsAWRRKtTBLI4XlDNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="47127163"
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; 
   d="scan'208";a="47127163"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 02:44:50 -0700
X-CSE-ConnectionGUID: Wtx/kY9URoeRwfhiq1Io5Q==
X-CSE-MsgGUID: aSGueZSWSCS7CNrWqsyBKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; 
   d="scan'208";a="133097131"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by orviesa007.jf.intel.com with ESMTP; 24 Apr 2025 02:44:44 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH] ASoC: Intel: avs: Fix NULL pointer dereference
Date: Thu, 24 Apr 2025 11:46:00 +0200
Message-Id: <20250424094600.1678051-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Due to unfortunate interaction between two recent patchsets, avs driver
ends up dereferencing NULL pointer when registering i2s boards.

Commit [1] does a call to avs_mach_ssp_tdm() which requires mach->pdata,
however due to another change in [2], mach->pdata is initialized after
the call. Reshuffle code to initialise mach->pdata before calling
avs_mach_ssp_tdm().

[1]
Link: https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/commit/sound/soc/intel/avs?id=79138dbff53ab0e9891ebdfce8d7b298c3783cd1
[2]
Link: https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/commit/sound/soc/intel/avs?id=7d859189de13f06fdc511761c745f3b302bed7b6
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/board_selection.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/intel/avs/board_selection.c b/sound/soc/intel/avs/board_selection.c
index 6f6137c3a02c8..636315060eb47 100644
--- a/sound/soc/intel/avs/board_selection.c
+++ b/sound/soc/intel/avs/board_selection.c
@@ -472,14 +472,6 @@ static int avs_register_i2s_board(struct avs_dev *adev, struct snd_soc_acpi_mach
 		return -ENODEV;
 	}
 
-	uid = mach->mach_params.i2s_link_mask;
-	if (avs_mach_singular_ssp(mach))
-		uid = (uid << AVS_CHANNELS_MAX) + avs_mach_ssp_tdm(mach, avs_mach_ssp_port(mach));
-
-	name = devm_kasprintf(adev->dev, GFP_KERNEL, "%s.%d-platform", mach->drv_name, uid);
-	if (!name)
-		return -ENOMEM;
-
 	pdata = mach->pdata;
 	if (!pdata)
 		pdata = devm_kzalloc(adev->dev, sizeof(*pdata), GFP_KERNEL);
@@ -488,6 +480,14 @@ static int avs_register_i2s_board(struct avs_dev *adev, struct snd_soc_acpi_mach
 	pdata->obsolete_card_names = obsolete_card_names;
 	mach->pdata = pdata;
 
+	uid = mach->mach_params.i2s_link_mask;
+	if (avs_mach_singular_ssp(mach))
+		uid = (uid << AVS_CHANNELS_MAX) + avs_mach_ssp_tdm(mach, avs_mach_ssp_port(mach));
+
+	name = devm_kasprintf(adev->dev, GFP_KERNEL, "%s.%d-platform", mach->drv_name, uid);
+	if (!name)
+		return -ENOMEM;
+
 	ret = avs_i2s_platform_register(adev, name, mach->mach_params.i2s_link_mask, pdata->tdms);
 	if (ret < 0)
 		return ret;
-- 
2.34.1

