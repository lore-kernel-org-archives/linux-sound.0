Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BpYnb9ep"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BA75DE
	for <linux-sound@vger.kernel.org>; Mon, 27 Nov 2023 05:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701092157; x=1732628157;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XMJbAFksP411ofVpMDO/KVwjonxDCGm52V+AjTcAeY0=;
  b=BpYnb9epJ8OeTmN78gZ1nVsHn7o2VxS7MvmLQG0qH7T5ifZGn1kibxil
   0VrvsjPQpDkHsaHWbmYXUku+JzpM8R3lHxbc7CYBOVgT6nScxvLy+0ovl
   7VO7g7qTIK8xQgwbYodYm53olFt0m1iBsFNUzqPzO7q3TVNb5Whfz/H4y
   SgP9g1DF7zjABdFunUPdqSHSWg3eJUXu8Rm+DNlI1IwHOAw9o4cftJv5N
   EUkgD124IfHo853Iknr2Ddy8eMhGFaGy0Ah5wuJ0JLWrRbotLIYzZm35z
   /aoZ0PC7ll7bVALGvIgPgxmcG2BStTGvLJ9ENWwQTer3zQYamLVEWJ7LX
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="391578528"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="391578528"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 05:34:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="891743760"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="891743760"
Received: from acornagl-mobl.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.58.144])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 05:34:21 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	cezary.rojewski@intel.com,
	yung-chuan.liao@linux.intel.com,
	ckeepax@opensource.cirrus.com,
	yong.zhi@intel.com,
	chao.song@linux.intel.com
Subject: [PATCH 2/7] ASoC: Intel: sof_sdw: remove unused function declaration
Date: Mon, 27 Nov 2023 15:34:43 +0200
Message-ID: <20231127133448.18449-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231127133448.18449-1-peter.ujfalusi@linux.intel.com>
References: <20231127133448.18449-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Chao Song <chao.song@linux.intel.com>

The functions sof_sdw_rt712_sdca_init() and sof_sdw_rt712_sdca_exit()
declared in header file are never implemented and used, remove them.

Signed-off-by: Chao Song <chao.song@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw_common.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index e6b98523b4e7..9528f147b719 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -138,12 +138,6 @@ int sof_sdw_rt_sdca_jack_init(struct snd_soc_card *card,
 int sof_sdw_rt_sdca_jack_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link);
 
 /* RT712-SDCA support */
-int sof_sdw_rt712_sdca_init(struct snd_soc_card *card,
-			    const struct snd_soc_acpi_link_adr *link,
-			    struct snd_soc_dai_link *dai_links,
-			    struct sof_sdw_codec_info *info,
-			    bool playback);
-int sof_sdw_rt712_sdca_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link);
 int sof_sdw_rt712_spk_init(struct snd_soc_card *card,
 			   const struct snd_soc_acpi_link_adr *link,
 			   struct snd_soc_dai_link *dai_links,
-- 
2.43.0

