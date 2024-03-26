Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9375913C8F7
	for <linux-sound@vger.kernel.org>; Tue, 26 Mar 2024 16:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711469122; cv=none; b=kT6c1wJwiaSg8OKRc3lULO9XvDjeuVn7VwYPUzAkL5/zEyE5bFgW5y6Dx2LAhwiA/kFK8/jUCN1iAtQ62xWTuL2MN28i7BrsDclLOSY3j6dR7f4mpAEyLbpnaC9LYGjJuZ/JI9Q7ONz9x8TGzvZnii+HTWWku1WzMM0BfzFHy+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711469122; c=relaxed/simple;
	bh=6SlSTg+Vo1TIgstqNm9sEWuuniZN2L+wo5SBrGWgI60=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=h0oIDLe7aTjqjUpm6iQBPB+M1yUbqHABLS5kodX0LfEfSwflFwUlFA1lqS8ub1ZJyzZaLHQ4QDuojP6CjfUHVpy02x8CEIsoSFQPtZAbidZqfI+Zo9N02f6wsU37PRE0j3hrj8+/aM0RhsmmBVZqqKb/YmyOmUlZOVy3q8if0CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sd1jzDi/; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sd1jzDi/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711469120; x=1743005120;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6SlSTg+Vo1TIgstqNm9sEWuuniZN2L+wo5SBrGWgI60=;
  b=Sd1jzDi/3+d+icmrmOBHh+8yAB5sIMr/6HQSUn4ucvfqS1kx0g/mzHTq
   3X6tNQ5GRO9lQGqd5PuxT5fzWdnOJZYL8NqpdGV//N0BX6T5Ov30+RXdU
   LvkCax5dq2CAJ12gUYABcm4R7La77erOrPh4SBgExuvmSEbSn0i8uBZeO
   0eAW1BJACD7t04x+z4tKKfCE4kukSfG68QgMz36f6OYROtz+vcjghMGcK
   Ul0qLrZostOYmMrdCuw41p7txDOTHO0H+5VuYmneIuSvj/bNIoAnax8Su
   xJbdRnBPBD6oM+L5xDpGGmbBCdrk8tsfwhjUflP7ECjntp4saX/A8FabA
   A==;
X-CSE-ConnectionGUID: CKnHnbg7SdWrtwOdRJvA5A==
X-CSE-MsgGUID: 8TLVnt2mS/i+tCMuVLqf0Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17260340"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="17260340"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:04:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="20482125"
Received: from bhubbert-mobl.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.65.108])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:04:43 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shuming Fan <shumingf@realtek.com>,
	Jack Yu <jack.yu@realtek.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Bard liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 03/34] ASoC: intel: sof_sdw: Make find_codec_info_dai() return a pointer
Date: Tue, 26 Mar 2024 11:03:58 -0500
Message-Id: <20240326160429.13560-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
References: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Charles Keepax <ckeepax@opensource.cirrus.com>

Rather than returning an index simply return a pointer to the
located codec info, this simplifies all the callers which only
want to access the codec info structure. Also remove the inline
specifier the function is fairly large for an inline function,
let the compiler decide. And move the function such that it is
located with the other find_codec_info_*() functions.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 39 ++++++++++++++++----------------
 1 file changed, 19 insertions(+), 20 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 517ff44de1f0..4bd9f62c48fc 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1090,6 +1090,23 @@ static struct sof_sdw_codec_info *find_codec_info_acpi(const u8 *acpi_id)
 	return NULL;
 }
 
+static struct sof_sdw_codec_info *find_codec_info_dai(const char *dai_name,
+						      int *dai_index)
+{
+	int i, j;
+
+	for (i = 0; i < ARRAY_SIZE(codec_info_list); i++) {
+		for (j = 0; j < codec_info_list[i].dai_num; j++) {
+			if (!strcmp(codec_info_list[i].dais[j].dai_name, dai_name)) {
+				*dai_index = j;
+				return &codec_info_list[i];
+			}
+		}
+	}
+
+	return NULL;
+}
+
 /*
  * get BE dailink number and CPU DAI number based on sdw link adr.
  * Since some sdw slaves may be aggregated, the CPU DAI number
@@ -1403,37 +1420,19 @@ static void set_dailink_map(struct snd_soc_dai_link_ch_map *sdw_codec_ch_maps,
 	}
 }
 
-static inline int find_codec_info_dai(const char *dai_name, int *dai_index)
-{
-	int i, j;
-
-	for (i = 0; i < ARRAY_SIZE(codec_info_list); i++) {
-		for (j = 0; j < codec_info_list[i].dai_num; j++) {
-			if (!strcmp(codec_info_list[i].dais[j].dai_name, dai_name)) {
-				*dai_index = j;
-				return i;
-			}
-		}
-	}
-
-	return -EINVAL;
-}
-
 static int sof_sdw_rtd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct sof_sdw_codec_info *codec_info;
 	struct snd_soc_dai *dai;
-	int codec_index;
 	int dai_index;
 	int ret;
 	int i;
 
 	for_each_rtd_codec_dais(rtd, i, dai) {
-		codec_index = find_codec_info_dai(dai->name, &dai_index);
-		if (codec_index < 0)
+		codec_info = find_codec_info_dai(dai->name, &dai_index);
+		if (!codec_info)
 			return -EINVAL;
 
-		codec_info = &codec_info_list[codec_index];
 		/*
 		 * A codec dai can be connected to different dai links for capture and playback,
 		 * but we only need to call the rtd_init function once.
-- 
2.40.1

