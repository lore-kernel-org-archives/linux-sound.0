Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C672144C67C
	for <linux-sound@vger.kernel.org>; Fri, 11 Sep 2026 11:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789125777; cv=none; b=esBR9iBYTPdgApr8qP8wvWdA5FyNd9dW5UzI5kSndF32tl+WJBIf4tGk68xczW8hn4JlJluKIn14FC0jz6krMaz6Fl+ueIEluOrsRJKy0u5MWhgLWwzL+yY86EfJqCaDc88V3mepXkYPD2jfHNjA9z/ewNVPpbk1w7UXJhrK4MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789125777; c=relaxed/simple;
	bh=QYjadz/6N7Hx/yXP2qkHRBdGt6/ECOhqw6xlOSy1PwQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F09WNkbssQFknyVT4Ds4GncaZThV761VftGezlR3meVArQDOYugzayTI0N5xGVm8jJ1C2ka8iinR57ANXwlqMFIlP3QDJlvG7Aj59BA7ng8/sQEzFAAwTuAG61rJG1hIjZZsfD/tFlXpGA9G0qnnX+4272a5kR5embrYrhbuVTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PV5ASouG; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PV5ASouG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789125765; x=1820661765;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QYjadz/6N7Hx/yXP2qkHRBdGt6/ECOhqw6xlOSy1PwQ=;
  b=PV5ASouGqLm/0sYCzhyGEIzkbcGXQqumtvGM2EDaswUZmXTjAOoT0XVE
   LGl71vsLk6OOVtTD9ojUAY89xVi5wEt6SAQsOHGGh+PxwbTCG/fxVrpba
   OGF7ixihNZMKgU3WZGU5N74uJIHlJJOf96V20hXnkpRzYTYefTbMF3eGI
   KP3ilzZdHNasIiTZMNnWXJPqX9U/YDUxTYESvNCR/uVTj9CV1fmzFeeBT
   +2/BE4Q2xnXyA36ggSmqfqNCeIsQ2vdR4G63fIkNW0gs3HAa8B811ZtOp
   kUdO+O3kVvHgWhNvORuvmAHwIb+lc97RHW91hXdDa7tcoxCyyug9CJ8WB
   A==;
X-CSE-ConnectionGUID: DjS6rCpBQ2ul1U0mXKqIQw==
X-CSE-MsgGUID: vWpppQPzTQ2AN0CUNgB9cQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="100749994"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="100749994"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 04:22:25 -0700
X-CSE-ConnectionGUID: Wx4j4H2YTlSjivOf/OpVqg==
X-CSE-MsgGUID: Degx+hNjRoW20e/3bVgZGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="268213332"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.83])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 04:22:22 -0700
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
Subject: [PATCH v3 14/26] ASoC: SOF: intel: hda-stream: Clear the current position when releasing stream
Date: Fri, 11 Sep 2026 14:21:40 +0300
Message-ID: <20260911112152.28528-15-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911112152.28528-1-peter.ujfalusi@linux.intel.com>
References: <20260911112152.28528-1-peter.ujfalusi@linux.intel.com>
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

