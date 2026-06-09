Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F293EB81E
	for <linux-sound@vger.kernel.org>; Tue,  9 Jun 2026 08:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780993837; cv=none; b=raVUn69n5FKjtQtkOouMLqB356h36G5rEq/Zd9rEYRDMQ4JSU6m5psrsgSl6OMNwLEXxl3HQ4eBPzQZ+3FylB23l8Jd3hNgbyamc6UZQ7zBSNCyrQTyvtthNIbmxNpMTnrLz8nyIibHhXlxsuvHz+x6Vp9C2gWm7uXs1sYr8K0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780993837; c=relaxed/simple;
	bh=YESu969DSnildw5CzSiCTkZ+hCpvgQUXMSOZGBWj6NA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b2evDEnX6FIgkh6qqFdfVkFJUJC86+u3yaImhKnIdWFn20Q6VVQSJqwnX8/NjABu9dcFHBCAw7dJgoq+rs9bNuVEUHH3X5fPt9NVG3Bwp5SUmOCamNB/qwORSPMHB3Tb5HsTeB/tGlaxrMq23WNt8kHmgKogpH1GfXK8jfAoj6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pt1c7Fcs; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pt1c7Fcs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780993836; x=1812529836;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YESu969DSnildw5CzSiCTkZ+hCpvgQUXMSOZGBWj6NA=;
  b=Pt1c7FcsXvchrQBKh+/F2kUN0broocabhA2i8H8KUwOvFP5Eh5bYUeeQ
   SQwBAeYsu4d60SlCx4ZvDiRwV8mWlVo0KtZxeCz5N7tY7auW84QokmSOa
   I+tkWkBH4r/pxXkR/zZTdNkx66RhO+ztdTGV6bIJ1oLIKkMAfqPrBShCI
   QwCHsR7NcgkqpH5ze4hxJ4b51NIHea7XwI5FToWHNrbTUXpaavzWeHFlR
   IBOUC3DJMOMdfFGF2MEmqvPbJm7oYK1/ncjmQExFBXDGKlUgjGmtDWL0u
   WAxlzg6fPNOGpg1H3ojYEueEIN1UY8qhJHRHaj+SvxdIFYQMsfNa51w71
   A==;
X-CSE-ConnectionGUID: Q/sMBSmiQ3qwGHl6wLQyoA==
X-CSE-MsgGUID: r+y226hfQCqDby3TyPtPmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="81600390"
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; 
   d="scan'208";a="81600390"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 01:30:36 -0700
X-CSE-ConnectionGUID: jHTcvcp8RBKHpPQ0FrmkOw==
X-CSE-MsgGUID: 7pDrWcEiQJ+fmKAn3qFTQQ==
X-ExtLoop1: 1
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.253])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 01:30:34 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	liam.r.girdwood@intel.com
Subject: [PATCH 1/6] ASoC: SOF: ipc4-control: Fix TOCTOU in sof_ipc4_bytes_put
Date: Tue,  9 Jun 2026 11:30:36 +0300
Message-ID: <20260609083041.29093-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609083041.29093-1-peter.ujfalusi@linux.intel.com>
References: <20260609083041.29093-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In sof_ipc4_bytes_put(), the copy size is derived from the old
data->size in the buffer rather than the incoming new data's size
field from ucontrol. If the new data has a different size, the copy
uses the wrong length: it may truncate valid data or copy stale bytes.

Fix by validating and using the incoming data's sof_abi_hdr.size from
ucontrol before copying.

Fixes: a062c8899fed ("ASoC: SOF: ipc4-control: Add support for bytes control get and put")
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/ipc4-control.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/ipc4-control.c b/sound/soc/sof/ipc4-control.c
index 4ce821f96a91..aa31eed05730 100644
--- a/sound/soc/sof/ipc4-control.c
+++ b/sound/soc/sof/ipc4-control.c
@@ -554,6 +554,8 @@ static int sof_ipc4_bytes_put(struct snd_sof_control *scontrol,
 	struct snd_soc_component *scomp = scontrol->scomp;
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	struct sof_abi_hdr *data = cdata->data;
+	const struct sof_abi_hdr *new_hdr =
+		(const struct sof_abi_hdr *)ucontrol->value.bytes.data;
 	size_t size;
 	int ret;
 
@@ -564,15 +566,16 @@ static int sof_ipc4_bytes_put(struct snd_sof_control *scontrol,
 		return -EINVAL;
 	}
 
-	/* scontrol->max_size has been verified to be >= sizeof(struct sof_abi_hdr) */
-	if (data->size > scontrol->max_size - sizeof(*data)) {
+	/* Validate the new data's size, not the old one */
+	if (new_hdr->size > scontrol->max_size - sizeof(*new_hdr)) {
 		dev_err_ratelimited(scomp->dev,
 				    "data size too big %u bytes max is %zu\n",
-				    data->size, scontrol->max_size - sizeof(*data));
+				    new_hdr->size,
+				    scontrol->max_size - sizeof(*new_hdr));
 		return -EINVAL;
 	}
 
-	size = data->size + sizeof(*data);
+	size = new_hdr->size + sizeof(*new_hdr);
 
 	/* copy from kcontrol */
 	memcpy(data, ucontrol->value.bytes.data, size);
-- 
2.54.0

