Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E9D15575F
	for <linux-sound@vger.kernel.org>; Fri, 26 Apr 2024 15:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714145151; cv=none; b=BuP1j78LuFwuEmjFJmHv8SpUeB45pxLyQH7IPpBJ9tB3OyGGuPcGuPWhzLyxXz0EP4bjpd/zexC+irFxMipAva74Gj6kMgHHPDFyr+fJOQg+wUys/HfdjPnZ+7nvb/KlHWJzTIe9sPM2Pu4z1vOGUbTy7cmYyhCpbnaaO1TbBlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714145151; c=relaxed/simple;
	bh=8xb9CTljEsAsammvjDjYTYN3LOKkRjHFFUmPijaKb2w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KAYCuokJSkttqJwU9v3LU1AjZqrhxx8u5HjXC+g88f2l55lrXFFc/T4sFwWctfj1ELeDdZts6n1wbtaifPvsmxJIhNdbJRGmDjqr3TV5rhyrMQY3koxnmvrQE1SEFzvJCkBJUAyDrSc0/EAzVCNXRX82fGGwj79aHup/3bVjIu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FDu4tHX2; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FDu4tHX2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714145150; x=1745681150;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8xb9CTljEsAsammvjDjYTYN3LOKkRjHFFUmPijaKb2w=;
  b=FDu4tHX2EK6yDWgD0i9Rr9wRTIO40ZZGflUmJJkwGthpi6EYXiUB0AnB
   JAHj8Kgwd1PPT2AjysmQoHnODHX0TPJLp9DQBSYartOkhfytcnD9DF4vp
   fp3U3Wy7hXj4KKqkxoRpr3yUirnikoJWtqpW9Mhkei2uuXX+5SA3nAk0+
   cGjyQGn48jyWLoVCFiJgyylolMLP2OK+e1kEIWqzpHdTE7FMmzqqMS6zR
   rbCj+ulTzOU/tQmZ3pZeaGmbHu7SAMz/s8xUfKbJAPmSQCSDCV1oY3bsh
   fg3csC9jNswFMMq3GqVBlOnwojm5Igx/WbbwxVjKWD2hdAVqEAGxClLj7
   w==;
X-CSE-ConnectionGUID: 1xQQ+asdQsOZxmjrO5uWIg==
X-CSE-MsgGUID: Z/zf/7IeTsCbCv1XeTqHDA==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="21291347"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="21291347"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:25:50 -0700
X-CSE-ConnectionGUID: ydVepSTTRdKbktrdkQFcbg==
X-CSE-MsgGUID: Ph6QY0G4Sl+hIZeL177Nmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="30259598"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.33.33])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:25:49 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 17/23] ASoC: Intel: sof-rt5682: add mclk_en to sof_rt5682_private
Date: Fri, 26 Apr 2024 10:25:23 -0500
Message-Id: <20240426152529.38345-18-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240426152529.38345-1-pierre-louis.bossart@linux.intel.com>
References: <20240426152529.38345-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Brent Lu <brent.lu@intel.com>

Add a variable mclk_en to sof_rt5682_private structure to reduce
global variable access. No functional change.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_board_helpers.h | 2 ++
 sound/soc/intel/boards/sof_rt5682.c        | 7 +++++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/sof_board_helpers.h b/sound/soc/intel/boards/sof_board_helpers.h
index 644f6b4a1b7b..dfcc2c5c25cc 100644
--- a/sound/soc/intel/boards/sof_board_helpers.h
+++ b/sound/soc/intel/boards/sof_board_helpers.h
@@ -101,10 +101,12 @@ struct sof_da7219_private {
  *
  * @mclk: mclk clock data
  * @is_legacy_cpu: true for BYT/CHT boards
+ * @mclk_en: true for mclk pin is connected
  */
 struct sof_rt5682_private {
 	struct clk *mclk;
 	bool is_legacy_cpu;
+	bool mclk_en;
 };
 
 /*
diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index efca7604040e..654c2428f625 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -165,7 +165,7 @@ static int sof_rt5682_codec_init(struct snd_soc_pcm_runtime *rtd)
 	int extra_jack_data;
 	int ret, mclk_freq;
 
-	if (sof_rt5682_quirk & SOF_RT5682_MCLK_EN) {
+	if (ctx->rt5682.mclk_en) {
 		mclk_freq = sof_dai_get_mclk(rtd);
 		if (mclk_freq <= 0) {
 			dev_err(rtd->dev, "invalid mclk freq %d\n", mclk_freq);
@@ -278,7 +278,7 @@ static int sof_rt5682_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	int pll_id, pll_source, pll_in, pll_out, clk_id, ret;
 
-	if (sof_rt5682_quirk & SOF_RT5682_MCLK_EN) {
+	if (ctx->rt5682.mclk_en) {
 		if (sof_rt5682_quirk & SOF_RT5682_MCLK_BYTCHT_EN) {
 			ret = clk_prepare_enable(ctx->rt5682.mclk);
 			if (ret < 0) {
@@ -728,6 +728,9 @@ static int sof_audio_probe(struct platform_device *pdev)
 		}
 	}
 
+	if (sof_rt5682_quirk & SOF_RT5682_MCLK_EN)
+		ctx->rt5682.mclk_en = true;
+
 	/* need to get main clock from pmc */
 	if (sof_rt5682_quirk & SOF_RT5682_MCLK_BYTCHT_EN) {
 		ctx->rt5682.mclk = devm_clk_get(&pdev->dev, "pmc_plt_clk_3");
-- 
2.40.1

