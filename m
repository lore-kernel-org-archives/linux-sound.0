Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mi9sOO4y"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FBAE194
	for <linux-sound@vger.kernel.org>; Mon, 27 Nov 2023 07:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701099319; x=1732635319;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XN9Bit659jWYf1A4adc2T7hIVcb934urLyq20ChKjNQ=;
  b=mi9sOO4yAsGyyjzAl2AZr0G2RHbT5MuCp5vEWMdn703Wlg4moP9Ei0Jl
   NlHiDVgmgqqeHvO/hHx1awo22+6wUKHMDIxZdfxQwHlLWlVNhSTEWVYna
   84LwqJhwtzVw+5APmJGOa8Dr1boynOHsX2GjfUqhgzE6x0AVs1EYmjQgr
   gA8gUiX2ecknvKn0/nko2zq6piDxYzxOQgk7jJhxJOydR6vNkwSqrD/b/
   jpzPxPSQf7bnGZb6fZgNsoQGosVpyS/jzTyZccHyPBP1/Z7UBpBhBuPqc
   VrApb0lHE9Q1aFrWVnPiwZihKZU8wOmQr9mAEUmS8Mn5dL1/zoFSHOcHH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="372894400"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="372894400"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 07:26:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="771956326"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="771956326"
Received: from acornagl-mobl.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.58.144])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 07:26:30 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	chao.song@linux.intel.com
Subject: [PATCH 04/27] ASoC: Intel: cht_bsw_rt5672: check return value
Date: Mon, 27 Nov 2023 17:26:31 +0200
Message-ID: <20231127152654.28204-5-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231127152654.28204-1-peter.ujfalusi@linux.intel.com>
References: <20231127152654.28204-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chao Song <chao.song@linux.intel.com>

Set codec sysclk could fail and return error, add
error check for it.

Signed-off-by: Chao Song <chao.song@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/intel/boards/cht_bsw_rt5672.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/cht_bsw_rt5672.c b/sound/soc/intel/boards/cht_bsw_rt5672.c
index f6da24f3c466..8cf0b33cc02e 100644
--- a/sound/soc/intel/boards/cht_bsw_rt5672.c
+++ b/sound/soc/intel/boards/cht_bsw_rt5672.c
@@ -93,8 +93,12 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
 		 * when codec is runtime suspended. Codec needs clock for jack
 		 * detection and button press.
 		 */
-		snd_soc_dai_set_sysclk(codec_dai, RT5670_SCLK_S_RCCLK,
-				       48000 * 512, SND_SOC_CLOCK_IN);
+		ret = snd_soc_dai_set_sysclk(codec_dai, RT5670_SCLK_S_RCCLK,
+					     48000 * 512, SND_SOC_CLOCK_IN);
+		if (ret < 0) {
+			dev_err(card->dev, "failed to set codec sysclk: %d\n", ret);
+			return ret;
+		}
 
 		if (ctx->mclk)
 			clk_disable_unprepare(ctx->mclk);
-- 
2.43.0

