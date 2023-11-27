Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bIXxZ3ZG"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 328B7191
	for <linux-sound@vger.kernel.org>; Mon, 27 Nov 2023 07:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701099319; x=1732635319;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aVZx5EIhbQBJhRi0d0dJ2an+K0rSK/GJ6HT3ctw6O9M=;
  b=bIXxZ3ZGl/gqzhuatpB59b1jNdUKsbEc0xrgS0wfkybhhr8T8HiEB7Fr
   Ox0yw/zWs6E/T8OHsoaDGGi3Kf0AVc4ldf081NCTO2UJtvowMqqQbWLOk
   F1MCTvCUCF9n75twKe6duYW9OIA+Upiqk7sAGjN8TUT/G80CbRpguI6YL
   dYULSt3L+b2NGMlD6DteRJsMkz881aG6KF9O4LvP/XcBz/qRGo32wJ5uk
   6yVAkAniEqivFFYKpQAPeRY3L/qkXFfnquOrbH5EN8o8DzxPFCsj9N5uh
   qyeAvwz/vLtwcXteCKRsIveVpDEuKuASBrGVhhYQ6orMCUslazpwMbvpr
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="372894393"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="372894393"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 07:26:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="771956269"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="771956269"
Received: from acornagl-mobl.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.58.144])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 07:26:27 -0800
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
Subject: [PATCH 03/27] ASoC: Intel: sof_maxim_common: check return value
Date: Mon, 27 Nov 2023 17:26:30 +0200
Message-ID: <20231127152654.28204-4-peter.ujfalusi@linux.intel.com>
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

From: Bard Liao <yung-chuan.liao@linux.intel.com>

snd_soc_dai_set_tdm_slot() could return error.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Chao Song <chao.song@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/intel/boards/sof_maxim_common.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/sof_maxim_common.c b/sound/soc/intel/boards/sof_maxim_common.c
index f64124077ca7..cf2974718271 100644
--- a/sound/soc/intel/boards/sof_maxim_common.c
+++ b/sound/soc/intel/boards/sof_maxim_common.c
@@ -61,15 +61,21 @@ static int max_98373_hw_params(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *codec_dai;
+	int ret = 0;
 	int j;
 
 	for_each_rtd_codec_dais(rtd, j, codec_dai) {
 		if (!strcmp(codec_dai->component->name, MAX_98373_DEV0_NAME)) {
 			/* DEV0 tdm slot configuration */
-			snd_soc_dai_set_tdm_slot(codec_dai, 0x03, 3, 8, 32);
+			ret = snd_soc_dai_set_tdm_slot(codec_dai, 0x03, 3, 8, 32);
 		} else if (!strcmp(codec_dai->component->name, MAX_98373_DEV1_NAME)) {
 			/* DEV1 tdm slot configuration */
-			snd_soc_dai_set_tdm_slot(codec_dai, 0x0C, 3, 8, 32);
+			ret = snd_soc_dai_set_tdm_slot(codec_dai, 0x0C, 3, 8, 32);
+		}
+		if (ret < 0) {
+			dev_err(codec_dai->dev, "fail to set tdm slot, ret %d\n",
+				ret);
+			return ret;
 		}
 	}
 	return 0;
-- 
2.43.0

