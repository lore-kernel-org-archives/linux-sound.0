Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0411E991A
	for <linux-sound@vger.kernel.org>; Mon,  3 Mar 2025 06:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740984967; cv=none; b=bzmdLG883KLKfe3aOLZ4nAejY2FPBL4vtZhYIHPT1uFm4lYOsWuDU9RExsD3OviqwSyOtAYr03VOs/kLaavnDCH4Mbt9VIsMQF/womXy3YJgerhToLWHsfwcJ86SqMnipbMqYZKFsMLxqnN+PXYe1bybOCGTtP+RB8I6LixEqTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740984967; c=relaxed/simple;
	bh=XyLzD40AwwfiKF6E8dXCu61H9H1tXtoDJ0jMAA/j0a4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J3/JXB+5QjqfLy9vlmd2+YGrPdlEPqXS6GhBIo+DQsbksyfwq2UgkjP+uH+C0X+b2sZ9BoZM+QnQLoy2b75fY8PjToVWrEvAW4l4hsL9R5Zv4G/AGLpjcCPgLOZMt3InX7loGN9HiU7yUzcoISc5dhtIbwcO2diWk+vYQDnVyMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JrQnvU3W; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JrQnvU3W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740984966; x=1772520966;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=XyLzD40AwwfiKF6E8dXCu61H9H1tXtoDJ0jMAA/j0a4=;
  b=JrQnvU3W/6Hjlk7cU4AuR4WJVx7CRJA2/h3uWBVo90Dexfxm5R20DZl5
   wRVtBUvNhNCS7AnawJiWLw21GG+OseG6edXNyBtobe9GZhtYi0glkkwzh
   DNYCm9fWF/Doqwyvk25RcYRNEJl02veOdX1BslARrIjDc7ds0KFzpHu/2
   jp6VkXYt49zrTnyHYbkrtZp4JSQFLeuqLM2eKqvW/E4Xm9cyg1U0Q4QdT
   BDR0Acz6ecSx848oypID1YI7DFljPEXqUSZrRiWFT90Te6vZJGLceIF9V
   INeObvrJza/hAkaQ9FYEbXw0TiQ2nXLeXS0FQrqt2hzoRkGUgK9NMK1on
   A==;
X-CSE-ConnectionGUID: 8O3Ud7/1SXuvyNLHx7eR9g==
X-CSE-MsgGUID: 5ZfqGsAITia4McWI0vyefQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="67217779"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="67217779"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2025 22:56:04 -0800
X-CSE-ConnectionGUID: 6LwcbO8GS3qTlqMNmSsj/w==
X-CSE-MsgGUID: 9Ve5iJEARUqHwnQjn5KTLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="117720201"
Received: from sramkris-mobl1.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.221.173])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2025 22:56:03 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH] ASoC: Intel: sof_sdw: Fix unlikely uninitialized variable use in create_sdw_dailinks()
Date: Mon,  3 Mar 2025 14:55:52 +0800
Message-ID: <20250303065552.78328-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

Initialize current_be_id to 0 to handle the unlikely case when there are
no devices connected to a DAI.
In this case create_sdw_dailink() would return without touching the passed
pointer to current_be_id.

Found by gcc -fanalyzer

Fixes: 59bf457d8055 ("ASoC: intel: sof_sdw: Factor out SoundWire DAI creation")
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: stable@vger.kernel.org
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index c13064c77726..90dafa810b2e 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -954,7 +954,7 @@ static int create_sdw_dailinks(struct snd_soc_card *card,
 
 	/* generate DAI links by each sdw link */
 	while (sof_dais->initialised) {
-		int current_be_id;
+		int current_be_id = 0;
 
 		ret = create_sdw_dailink(card, sof_dais, dai_links,
 					 &current_be_id, codec_conf);
-- 
2.43.0

