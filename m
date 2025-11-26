Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3AA62E8E0C
	for <linux-sound@vger.kernel.org>; Wed, 26 Nov 2025 09:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764149719; cv=none; b=fVVkuyuIjlbeZFF2NY5I+VKS7Czu3xWPToulT90/RCiQESTzuBAJjY/nRc4pgeerZxTFobwF/Z35domkTLmC/4c1ZiVEIfQAB7GCMP0IOKn1qbdfJTsbdtsjetYNI0hRsVt1HgIWjCElxEmhTwW7SBe2CvRpxvtG5NCwZb66iK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764149719; c=relaxed/simple;
	bh=LXm8zmcJdSr51kN9AzCtdPB6F5WtLUVwbeD77l6i9dg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fcq1UNOTYR8fWrvharIbb3JF2+W9DZ5JtynbxrduMJOSKRGGpHmjkRDZx5m1SKWipwnvVLjmrNw4glk7puA7yp8PZD7R+uuZ/CzCGctTkbp5kaqov3hrHbhlTo8BJupJgwywfGq9PAzuVcYxrtSzR6iZ75qMkb8teDS+FFF37Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OUQihoCD; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OUQihoCD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764149717; x=1795685717;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LXm8zmcJdSr51kN9AzCtdPB6F5WtLUVwbeD77l6i9dg=;
  b=OUQihoCDus+ykOpNflIAsYXvxLUX5bWxUPnE1UvSPfz8rUGtQlrLwFuB
   6vjtNNjkBSc+a0hXVwDZTrwK+sM11cuS26cNj+i6l/rZviXaezY7EHXby
   kt55THBbJrTfs7YuJYvvHl+Es7gq7TybcZ2M8BE1DHzR94dWmwHBQvlRs
   m2FLkK/sR0HBTIwU1Az0ucCkcjZ1Bj6Uh+NEctrbDT2L1j3rxF1/hOf7l
   g9mFiAwxiZZLHd1jNi1bxxhhF0PkfilpsPdVEboSvxKj8b0D1ChzGVlxL
   ueDqXa7wa4XjZ4R8s0CtBeLDC13KLMUcI2DO2uUmKVc9vDBNQuh+f6x6i
   Q==;
X-CSE-ConnectionGUID: SpD2hZYVQQyAwbLt5Czwqw==
X-CSE-MsgGUID: NWDB70+FQA6oiaq77sAFkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="68769299"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="68769299"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 01:35:17 -0800
X-CSE-ConnectionGUID: 9eTN8WCvQamohvVoDgbZPA==
X-CSE-MsgGUID: GZ9rFCnRQeO7fngQWAc2Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="216251706"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa002.fm.intel.com with ESMTP; 26 Nov 2025 01:35:16 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	andriy.shevchenko@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 3/6] ASoC: Intel: catpt: Fix error path in hw_params()
Date: Wed, 26 Nov 2025 10:55:20 +0100
Message-Id: <20251126095523.3925364-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251126095523.3925364-1-cezary.rojewski@intel.com>
References: <20251126095523.3925364-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Do not leave any resources hanging on the DSP side if
applying user settings fails.

Fixes: 768a3a3b327d ("ASoC: Intel: catpt: Optimize applying user settings")
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/catpt/pcm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/catpt/pcm.c b/sound/soc/intel/catpt/pcm.c
index f15385683d9c..9baaad13a273 100644
--- a/sound/soc/intel/catpt/pcm.c
+++ b/sound/soc/intel/catpt/pcm.c
@@ -417,8 +417,10 @@ static int catpt_dai_hw_params(struct snd_pcm_substream *substream,
 		return CATPT_IPC_ERROR(ret);
 
 	ret = catpt_dai_apply_usettings(dai, stream);
-	if (ret)
+	if (ret) {
+		catpt_ipc_free_stream(cdev, stream->info.stream_hw_id);
 		return ret;
+	}
 
 	stream->allocated = true;
 	return 0;
-- 
2.25.1

