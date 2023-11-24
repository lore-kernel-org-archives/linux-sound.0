Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XiiSyV+H"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 224E710E3
	for <linux-sound@vger.kernel.org>; Fri, 24 Nov 2023 04:39:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700829584; x=1732365584;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7oyvAhqwIw36JhLEwCTsP3TdOY5MW9YSR4T3MJ6kSos=;
  b=XiiSyV+HA18+qOrXIkzPuy1KWwALoKwTCL4/xJ649TXTJw0RsmRBCng0
   90VN7yg9OAbY51dmNT0jfYvOtiG3+zsXJo79OnN0idwTUpETeCNL0//TE
   7dzw/mOIAOIRBKmLCt73a/B56MNAJsYX/HK/qAA/gKYufiiYcjRSMrTdR
   NO1cD8gACB6egSx6Vmw37A5xf2w69kGrjm8/R1jFf+Vl+75n/+vh4l5Zb
   yX9C4c2pKy1+A2hvxesWBfCuHmsGbWuEsZC5oSmOuk2p96SwcQDBA0lrt
   pkfO8YO+gJENgZIZjYnaFur4TS5txg50gd3jfwB/0uFwB71YKT1plJKpt
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="478626436"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="478626436"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 04:39:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="833686192"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="833686192"
Received: from barumuga-mobl1.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.58.182])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 04:39:41 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	cezary.rojewski@intel.com,
	ranjani.sridharan@linux.intel.com
Subject: [PATCH] ASoC: Intel: skl_hda_dsp_generic: Drop HDMI routes when HDMI is not available
Date: Fri, 24 Nov 2023 14:40:15 +0200
Message-ID: <20231124124015.15878-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.42.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the HDMI is not present due to disabled display support
we will use dummy codec and the HDMI routes will refer to non existent
DAPM widgets.

Trim the route list from the HDMI routes to be able to probe the card even
if the HDMI dais are not registered.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/skl_hda_dsp_generic.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/intel/boards/skl_hda_dsp_generic.c b/sound/soc/intel/boards/skl_hda_dsp_generic.c
index 6c6ef63cd5d9..6e172719c979 100644
--- a/sound/soc/intel/boards/skl_hda_dsp_generic.c
+++ b/sound/soc/intel/boards/skl_hda_dsp_generic.c
@@ -154,6 +154,8 @@ static int skl_hda_fill_card_info(struct snd_soc_acpi_mach_params *mach_params)
 		card->dapm_widgets = skl_hda_widgets;
 		card->num_dapm_widgets = ARRAY_SIZE(skl_hda_widgets);
 		if (!ctx->idisp_codec) {
+			card->dapm_routes = &skl_hda_map[IDISP_ROUTE_COUNT];
+			num_route -= IDISP_ROUTE_COUNT;
 			for (i = 0; i < IDISP_DAI_COUNT; i++) {
 				skl_hda_be_dai_links[i].codecs = &snd_soc_dummy_dlc;
 				skl_hda_be_dai_links[i].num_codecs = 1;
-- 
2.42.1

