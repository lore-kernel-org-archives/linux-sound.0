Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B183ACA70
	for <linux-sound@vger.kernel.org>; Wed, 25 Feb 2026 13:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772027422; cv=none; b=YVJkKV4cbS+dzarFLFYiePKIQauBaia1eFsUAGkjDWXIjDtjBuQJP9AuJYhiJr85w0uip9LTZoWPN9Yf+HEXRpQk7UCuDibkXgxFRwCjOCufG40M3wI5xWS3TAXqCzQX3KzXzBcYLCMSkCHgMMW9CSy+YTVQBXDNXUXVejNIsf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772027422; c=relaxed/simple;
	bh=axcF2V0fSOUZngFXeJwqsXYhmFG27pRaLSGoY4y9xnU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e6f2kjMqj64LWcgi5/4V+xwZJsDa1yG8eZySH63SMlb6BbhNDtt0kd3T1jaROuUXNUdgGTzzjiVJchbYSNb+RkING5UC4JqR0HzB6PQpL2m/bcBZISqMPlkqYf0nevkBpkGoidQgIuH1XeQILQYB8UqmzFm8Nws/yk8FqSIIpxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CmVsOkHK; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CmVsOkHK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772027421; x=1803563421;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=axcF2V0fSOUZngFXeJwqsXYhmFG27pRaLSGoY4y9xnU=;
  b=CmVsOkHK0ldfOZ/lm2XREXDiTetrmD9XWs4LHdk9knPCaaqxqxAIFwWy
   IS1R2Jh6DB7gM/IQ+ru0J9oLJxHYjaywR+ijGvnMWvFMuOuZWxCYLJZDl
   vp25Hc/FShS3rxDc78slHbmkI9XaFPtMBmFKX3wgV2m6gQbhzgCkeCw/S
   OowDaT2RkTeMxdqkPj8010HlKR/LzpXDoycE+AKjhEHpzyT9TjKkGqbq7
   mOSenTpc4036ps682qRJkwQvZvMcpsx1sAfPooC68bK4fO49b60dmJ+5u
   aVxEdLhVCSzyEEiVRXEJDGhEBQSCI8Hvfe8lEiqnaYxL8jZL/opX6suUL
   g==;
X-CSE-ConnectionGUID: aYbFMN/jSKi68NIay8h+fQ==
X-CSE-MsgGUID: lec0RJpcQu2dKx4ghoWk+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="73037453"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; 
   d="scan'208";a="73037453"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 05:50:20 -0800
X-CSE-ConnectionGUID: OsgfaPJETxWT88J4d6u7NQ==
X-CSE-MsgGUID: Ck7AyGviTC+MEbK0jZIjSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; 
   d="scan'208";a="214352153"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 05:50:19 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com,
	Deep.Harsora@Dell.com
Subject: [PATCH 3/3] ASoC: soc_sdw_utils: remove index from sdca codec name
Date: Wed, 25 Feb 2026 21:50:04 +0800
Message-ID: <20260225135004.2322987-4-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260225135004.2322987-1-yung-chuan.liao@linux.intel.com>
References: <20260225135004.2322987-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The index is not fixed and it will lead to the DAI link can't bind the
codec component with the name when the index is different from the
predefined one.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sdw_utils/soc_sdw_utils.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index 821eb9720f6f..e624988958e8 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -729,7 +729,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 		.dais = {
 			{
 				.direction = {true, false},
-				.codec_name = "snd_soc_sdca.UAJ.1",
+				.codec_name = "snd_soc_sdca.UAJ",
 				.dai_name = "IT 41",
 				.dai_type = SOC_SDW_DAI_TYPE_JACK,
 				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
@@ -745,7 +745,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 			},
 			{
 				.direction = {false, true},
-				.codec_name = "snd_soc_sdca.UAJ.1",
+				.codec_name = "snd_soc_sdca.UAJ",
 				.dai_name = "OT 36",
 				.dai_type = SOC_SDW_DAI_TYPE_JACK,
 				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
@@ -754,7 +754,7 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 		.dai_num = 3,
 		.auxs = {
 			{
-				.codec_name = "snd_soc_sdca.HID.2",
+				.codec_name = "snd_soc_sdca.HID",
 			},
 		},
 		.aux_num = 1,
-- 
2.43.0

