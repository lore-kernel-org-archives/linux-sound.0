Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380942F5468
	for <linux-sound@vger.kernel.org>; Fri, 12 Dec 2025 12:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765541486; cv=none; b=FyJ92UpKpsYz7YbJtOyMMm5xq4W4L2KobT95vuPnFrmUU4snA4D39adEYolRqN4c2DfdrMBNtDaDXSdRz8T09jn0OlZpjZgC/rP4pmjK67HLEwRjHbO47o9rFpylfEZGuDw3WsZG6GpJmdKEN7EKzlnbAjathuAuBlZTESC8xuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765541486; c=relaxed/simple;
	bh=2m1u57RlmzvuktHdOKHRSxQc/D41278jbP3fwhkgSrs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YbuWDkiNLGxf9hsHvucMku1z754IgcCk0904yAp7p4sFxkM20VQbToUafpuCDQM0PEiGuNw3MV7Zdmyd9x1aha0O9z9v8TJ7Zrsov7/xy6nZy+mDaqHAuXV8LKKy6pC54dUvxXA/btwr7x1bM4AcmoBKWPc6nuaNOMqcO5mik0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YFS/8MHe; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YFS/8MHe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765541484; x=1797077484;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2m1u57RlmzvuktHdOKHRSxQc/D41278jbP3fwhkgSrs=;
  b=YFS/8MHe+ebPC5xDtvlHdaY0lXdkZFTFi6TU1gwsBwbu5h32zGrujI+w
   KN3OsNc60tT6H+pzcE0fNkq7QGf5/wrhWGURSnn5xAL9T/teFeldwPhPc
   AYRIBTPwcd/wtuJRI//9TUd/qjumstcwqqtqAdErIz+VC4ue2tBM9yXxu
   1DDcpMmGIhPk4glZjh8++aellOMLlubbyxC4wNBlY2ExTdQLs0fP5TvQp
   jD0hg6E0ZdXsDaio+/5pY8g24X691cpb8riDfWqiZXNzmLH9heQXlKhZu
   V2gAHsDxv/O1HOqiLhBQeWFIDAZcY6r0FKPDx6XSyd4PyJk4tVjt68bvO
   A==;
X-CSE-ConnectionGUID: YkH3PWVxQfSjetcvNU1Evw==
X-CSE-MsgGUID: 06Db8aeGR5ezfubI/pe8BA==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="93021085"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="93021085"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 04:11:24 -0800
X-CSE-ConnectionGUID: wcGDm8/VTKScFcYbqhFegg==
X-CSE-MsgGUID: hr+hWo3yTcSDYiMQ6tCxWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="227745408"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 04:11:22 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com,
	Vijendar.Mukunda@amd.com,
	ckeepax@opensource.cirrus.com
Subject: [PATCH] ASoC: sdw_utils: subtract the endpoint that is not present
Date: Fri, 12 Dec 2025 20:11:12 +0800
Message-ID: <20251212121112.3313017-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When asoc_sdw_count_sdw_endpoints() count the num_ends, it doesn't skip
the unpresented endpoints. But, asoc_sdw_parse_sdw_endpoints() will skip
the unpresented endpoints either by quirk or the SDCA function doesn't
show up the endpoint. The endpoint number mismatches between count and
parse and the machine driver will show up a warning about it.

Fixes: 26ee34d2f5c7 ("ASoC: sdw_utils: Add codec_conf for every DAI")
Closes: https://github.com/thesofproject/linux/issues/5620
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/sdw_utils/soc_sdw_utils.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index 6c656b2f7f3a..f169d95895ea 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -1534,8 +1534,10 @@ int asoc_sdw_parse_sdw_endpoints(struct snd_soc_card *card,
 					 * endpoint check is not necessary
 					 */
 					if (dai_info->quirk &&
-					    !(dai_info->quirk_exclude ^ !!(dai_info->quirk & ctx->mc_quirk)))
+					    !(dai_info->quirk_exclude ^ !!(dai_info->quirk & ctx->mc_quirk))) {
+						(*num_devs)--;
 						continue;
+					}
 				} else {
 					/* Check SDCA codec endpoint if there is no matching quirk */
 					ret = is_sdca_endpoint_present(dev, codec_info, adr_link, i, j);
@@ -1543,8 +1545,10 @@ int asoc_sdw_parse_sdw_endpoints(struct snd_soc_card *card,
 						return ret;
 
 					/* The endpoint is not present, skip */
-					if (!ret)
+					if (!ret) {
+						(*num_devs)--;
 						continue;
+					}
 				}
 
 				dev_dbg(dev,
-- 
2.43.0

