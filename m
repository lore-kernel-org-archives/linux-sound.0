Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R3yYxnEp"
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2559BB9
	for <linux-sound@vger.kernel.org>; Mon,  4 Dec 2023 13:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701726135; x=1733262135;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8/7IZwoVhePzKrnt8KwA7NTdMTcvfYVDgJS9Dmp8ovA=;
  b=R3yYxnEpykuCgM4ufLsPdv97J5Um5o7J8XaEgXtKV9q6hIGFnMuXZ7VO
   7H2o9SGF72I02ilmLGIMOs2kXV5XnkLH6qM/mkfSYxZXVDUzQnTZQv/kg
   PA8jtbPTMQJxKbWgeSn/ooMV6KkfoAvZRK86O9wUjMFtnVSc+ZrdCA0tf
   UQuey+tWjGwOkPVX4JMi40a4e+N4bd+g0BqxEgW6YQ0ACjtWiCZpiM05M
   UjzYgUj3M65tGVMLg6YoDWkw2QIymcdl+bucll2yTFuV5Z8wSfVrpF2Fq
   E/bAFbPbYr0PEIPDIe63BXCeUDQ29M8IkqjA1Bp/TnrEX91USsnU8Ogn8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="859826"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="859826"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 13:42:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="764104383"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="764104383"
Received: from akashams-mobl.amr.corp.intel.com (HELO pbossart-mobl3.lan) ([10.255.231.189])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 13:42:14 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 5/5] ASoC: Intel: sof_sdw_rt_sdca_jack_common: check ctx->headset_codec_dev instead of playback
Date: Mon,  4 Dec 2023 15:42:00 -0600
Message-Id: <20231204214200.203100-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231204214200.203100-1-pierre-louis.bossart@linux.intel.com>
References: <20231204214200.203100-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Bard Liao <yung-chuan.liao@linux.intel.com>

'if (!playback)' will not work if the dai is only on capture dai link
or is on more than one playback dai links. Check 'if
(ctx->headset_codec_dev)' instead.

Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c b/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
index 1e5725f0ae33..d9c283829fc7 100644
--- a/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
+++ b/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
@@ -192,10 +192,10 @@ int sof_sdw_rt_sdca_jack_init(struct snd_soc_card *card,
 	int ret;
 
 	/*
-	 * headset should be initialized once.
-	 * Do it with dai link for playback.
+	 * Jack detection should be only initialized once for headsets since
+	 * the playback/capture is sharing the same jack
 	 */
-	if (!playback)
+	if (ctx->headset_codec_dev)
 		return 0;
 
 	sdw_dev = bus_find_device_by_name(&sdw_bus_type, NULL, dai_links->codecs[0].name);
-- 
2.39.2

