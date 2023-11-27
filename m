Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eKu5R2Zq"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D7D49B
	for <linux-sound@vger.kernel.org>; Mon, 27 Nov 2023 07:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701099318; x=1732635318;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=c5zk7aGDfWbjNCLheBXZ2WEzSvhU+9BDv+s0EYGulng=;
  b=eKu5R2ZqC+RLMC9dfezMrdlOK78WydBjn5+VbCe59cSNFrxSVa1OxGpc
   719lJw3mRp4VqAbici4gUS5pU+nBUThQdK1iuRd56Hat+k8sRjgK7cIcq
   0Cvt3teDZTzpyUF3uCmkkV9K7R5kQ4yZbVbf3n3tfliUW+1Rvp/kv8wuv
   msWmSGBVPIUPUYFpr5YoLL6Wgn2W+vNSl2GRDi3P6gNreGZds/hiZNF3W
   oRleIqi8DIbV5rli/lWEbPCk9P4KvmlZBCmli59ENtH6AxBWpv9HsT+6+
   +ZI1+mV3JmXsICH2AtKrGjuYTfGNkJOVufkzxKhuZtBBquJQPPVlS7s78
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="372894379"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="372894379"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 07:26:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="771956210"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="771956210"
Received: from acornagl-mobl.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.58.144])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 07:26:24 -0800
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
Subject: [PATCH 02/27] ASoC: Intel: sof_maxim_common: add else between 2 if test
Date: Mon, 27 Nov 2023 17:26:29 +0200
Message-ID: <20231127152654.28204-3-peter.ujfalusi@linux.intel.com>
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

if (!strcmp(codec_dai->component->name, MAX_98373_DEV0_NAME)) and
if (!strcmp(codec_dai->component->name, MAX_98373_DEV1_NAME)) can't be
true at the same time. Add an else to clarify it.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Chao Song <chao.song@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/intel/boards/sof_maxim_common.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/sof_maxim_common.c b/sound/soc/intel/boards/sof_maxim_common.c
index 3c00afc32805..f64124077ca7 100644
--- a/sound/soc/intel/boards/sof_maxim_common.c
+++ b/sound/soc/intel/boards/sof_maxim_common.c
@@ -67,8 +67,7 @@ static int max_98373_hw_params(struct snd_pcm_substream *substream,
 		if (!strcmp(codec_dai->component->name, MAX_98373_DEV0_NAME)) {
 			/* DEV0 tdm slot configuration */
 			snd_soc_dai_set_tdm_slot(codec_dai, 0x03, 3, 8, 32);
-		}
-		if (!strcmp(codec_dai->component->name, MAX_98373_DEV1_NAME)) {
+		} else if (!strcmp(codec_dai->component->name, MAX_98373_DEV1_NAME)) {
 			/* DEV1 tdm slot configuration */
 			snd_soc_dai_set_tdm_slot(codec_dai, 0x0C, 3, 8, 32);
 		}
-- 
2.43.0

