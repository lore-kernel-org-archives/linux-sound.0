Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB7848F018
	for <linux-sound@vger.kernel.org>; Wed,  9 Sep 2026 09:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788945017; cv=none; b=SL+fr01ltqw/5Mb+fP80Q87u0JR/CKxv17dFJsrnfPW3VBR3Vv3TAwPS4fGj44EFJYXStjXTiNM0tQp6iTklWa2OoofJS9BX/VX9HDuVoV+FPzNTKDJlTMNG59na8PE3qh9YvypjJmD6t58UGv3mCjKOCCZO09IBZ23ZlsLyLWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788945017; c=relaxed/simple;
	bh=QYjadz/6N7Hx/yXP2qkHRBdGt6/ECOhqw6xlOSy1PwQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f/qFDzTfunUzWgzuiSydqt+Pf5N+VRBmbSxH6secMTfWhAJBkzjA2yeJzX4Mii0OPeU/e7gNdmh1czi4PpYIVpK41cZixWEkF604gSzU8YgxrgK3lYPYvgwLVBbTFoW1bG2lu9WrfaaiwgHqKvYer47ft0o5WK4laGkWToYqY8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RtMansyz; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RtMansyz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788945016; x=1820481016;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QYjadz/6N7Hx/yXP2qkHRBdGt6/ECOhqw6xlOSy1PwQ=;
  b=RtMansyzbd7a9BOxZ2e3/rqGEepw+wd4IjRxCqsxthb9IM5NulHLI0h0
   4bUTRjk4ujGP+LzqaaKVSDOEuk2Tk+i/kE6Xv+5/t5mOhucXPpWe7bTVZ
   eTfnninEFwI3Qar3ocWfcpHnVMrNfvzToceid05j/oX9scK74w290vQ7u
   Dw9CWgtaPJFP8rfVUZrpGuOz7qS7i9zaokH/GvVQuM8IjPo49nq3KgV3h
   MqZMfUvnvLKGe/TtGIj0t0e5kyrnt9mZlcbEDoV2eL3zT/BVebON3/0Tp
   Cy3LJyUrLEgtn9bLTCkKtaslt3V9x00XdnBwKmP4gFbOXW3rvT501TllL
   A==;
X-CSE-ConnectionGUID: YTPqlVwBSlyWMA3w0pInGg==
X-CSE-MsgGUID: khgjindFS8i3ytX7foN7jA==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89200714"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="89200714"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 02:10:16 -0700
X-CSE-ConnectionGUID: 8H80RgQ2RO6h6AeMyDVgVQ==
X-CSE-MsgGUID: T/cvHWeZR1CGiUvkgT8/qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="266973023"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.252])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 02:10:12 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: vkoul@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	srinivas.kandagatla@oss.qualcomm.com
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	daniel.baluta@nxp.com
Subject: [PATCH v2 12/24] ASoC: SOF: intel: hda-stream: Clear the current position when releasing stream
Date: Wed,  9 Sep 2026 12:09:37 +0300
Message-ID: <20260909090949.7503-13-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909090949.7503-1-peter.ujfalusi@linux.intel.com>
References: <20260909090949.7503-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

After the host DMA ID is released, reset the curr_pos to 0 for a clean
start for subsequent stream starts. This is not needed for PCM streams
but for compressed streams.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 sound/soc/sof/intel/hda-stream.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
index c95230487a1b..5097a497188d 100644
--- a/sound/soc/sof/intel/hda-stream.c
+++ b/sound/soc/sof/intel/hda-stream.c
@@ -317,6 +317,7 @@ static int _hda_dsp_stream_put(struct snd_sof_dev *sdev, int direction, int stre
 		if (s->direction == direction && s->stream_tag == stream_tag) {
 			s->opened = false;
 			found = true;
+			s->curr_pos = 0;
 			if (pair)
 				link_stream = hext_stream;
 		} else if (!(hda_stream->flags & SOF_HDA_STREAM_DMI_L1_COMPATIBLE)) {
-- 
2.55.0

