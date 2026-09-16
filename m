Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366C6381E83
	for <linux-sound@vger.kernel.org>; Wed, 16 Sep 2026 12:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789560258; cv=none; b=l4/p4R5HgunUp/WyAxGKd95GFb7TBxDqAT763w+AyUFOXYYC8+2cdRYzASoxyIeW38w8X7fjI7rObPAPuPGrT44YGAMOiuvbumVNpMIQWRYR9eRsMfdLlYkPZaDHaByUmDBREJ80KUwfJLu5hfMciIAF0K6APQSKpeWZZ8FP0Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789560258; c=relaxed/simple;
	bh=QYjadz/6N7Hx/yXP2qkHRBdGt6/ECOhqw6xlOSy1PwQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t44qoZFX15AkEENVIBgSKFY94QdiYA4w/z9UcZn2FKq/5oWgZLWpxnMfqXvFCnC3oZn/KSCtYiQ9TYngI/nKHR/0NIWs7OViH8aJ/n10fRMsda6qkCTbR5DDECj86ZX/3XbgK0F/odW8f0/sBneC8BmH/+xe0saTGW4Onxm5sYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=khaCJqa7; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="khaCJqa7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789560246; x=1821096246;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QYjadz/6N7Hx/yXP2qkHRBdGt6/ECOhqw6xlOSy1PwQ=;
  b=khaCJqa7qbDBnqhiqUdl8PqfaoUyJMjVOKai9gMjbFGd68ZXZXNvUDVx
   pGdlbyOLIDpRUeQdOuZY7YZ+pVKdUWnh//SSuA7N1mQb/aEu7k/EllCy3
   wU8mUsxjA2bkE9XgbE2eTJI98r83DNELau0KBdHEeb1MoDp+d8NJIampH
   7ZhDRrlKNF1oqCEhNv24caLq+XSsdqGQ/B11OvsK/0MIcLWjW2vctPPcH
   T5ot813HjyZL6RgQJUc8QtwJwfKY9azCZErHYaGwT7ZX51C8P6geS6Lxj
   4B5OPU9ICyEsfNBlcxyqncKrJwv84GFWz/uG6KcK5VkcA0dXFxiGQZlVB
   A==;
X-CSE-ConnectionGUID: //7x7xGvToGwKZf8lIrE4A==
X-CSE-MsgGUID: 90O02FhGQemH/eLXai1jAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77496422"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="77496422"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 05:03:53 -0700
X-CSE-ConnectionGUID: yZRTtOUnRWOMubqUo62JSw==
X-CSE-MsgGUID: JbFvnJcaSrCsO6egkortrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="273293466"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.100])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 05:03:51 -0700
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
Subject: [PATCH v4 14/26] ASoC: SOF: intel: hda-stream: Clear the current position when releasing stream
Date: Wed, 16 Sep 2026 15:03:08 +0300
Message-ID: <20260916120320.18318-15-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916120320.18318-1-peter.ujfalusi@linux.intel.com>
References: <20260916120320.18318-1-peter.ujfalusi@linux.intel.com>
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

