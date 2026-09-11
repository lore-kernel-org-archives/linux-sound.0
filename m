Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03423466B57
	for <linux-sound@vger.kernel.org>; Fri, 11 Sep 2026 11:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789125758; cv=none; b=b+cf1//AHNWmTzu6X7fFAr6lSTfTn0YT6B8M6G9uQEgYH3SX0Wsd3cqph8E5Im3tWte8PqA0e4eP7fx2QCNB2m3N0k+wjuUBZIpcfUQazbxxKrUig6H41L4ws+8ryFNbqTXY1TNQ4vFjElV/fYGnz3LxM//kL01WY9Fvgqn166s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789125758; c=relaxed/simple;
	bh=sl1wjSeZ4tWMtIsKbkuVNDS/IGCWT0sOgECjhh26zWk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NfJQvJgsc5oUDfHO96tBGZTCyKRXVpGATRNl0yZwkyFr7hXPY1JDFdXAUcFxBPrVy8OTCUQuv8PG17tsJjJ9+dhOoRLovsRrJE3XjPAVhBf7v4Mt9nwxZzmt/CHFlAdzrDzCw/ynU+tzx+f6fUerQcaNiEHDZhn7X+jd5Jiuzq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OgXYjDAj; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OgXYjDAj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789125748; x=1820661748;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sl1wjSeZ4tWMtIsKbkuVNDS/IGCWT0sOgECjhh26zWk=;
  b=OgXYjDAj4TzA2OMn/blgjV9QvtM9PuYweQ2sAcZMdMf3IpMwnmZq8KLg
   sv8QDJiq7HZ9dG5U3bpgnYel0KncUkzJB7jNpZOr4HB8q+PcvyrXmsVAn
   egAN4B1WWqNbKQbm7+l6FsyWk3SF3MZvI3J+RClfxvUgefNUJfk3WF/Fm
   hua+J2gOJ7/QWRpU+d1rUZ3/v99WTzLWGkU+dDTAp2Y5eo0oPA1TR1Hmr
   oXW++K3rHBV+ZP1M5HKiMBwhG7LNExf3wLdiXgsDlFW+oCu75u3vEhvf9
   9RS0239i/0kAHTcvu1QdiABryEuio8Q6ynmTmQ4pzCxJppB+mvkKUzHcj
   A==;
X-CSE-ConnectionGUID: eibF0hrISqGlOyvoEb5inA==
X-CSE-MsgGUID: 0QabsJgqSIeweDiyCT9r8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="100749943"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="100749943"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 04:22:11 -0700
X-CSE-ConnectionGUID: sxWWR7e4TcunZ6Hye2TBUA==
X-CSE-MsgGUID: wRQ/1gbYSzisJriltiUa0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="268213296"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.83])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 04:22:08 -0700
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
Subject: [PATCH v3 09/26] ASoC: SOF: sof-audio: Fix the pipeline_list population
Date: Fri, 11 Sep 2026 14:21:35 +0300
Message-ID: <20260911112152.28528-10-peter.ujfalusi@linux.intel.com>
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

Two issues with the way sof_set_up_widgets_in_path() adds a pipeline to
the list of pipelines to be triggered:

The count is incremented before the array entry is written, so the last
entry of the list is NULL for a short window. A concurrent user of the
list, like sof_ipc4_trigger_pipelines(), can see the incremented count
with the entry still unset.

A widget which is not part of a pipeline has no spipe, but it is still
added to the list, resulting in a NULL entry within the count.

Store the entry before incrementing the count and skip the widgets
without a pipeline.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/sof-audio.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index d244e90a734b..850eb2bc2b44 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -629,6 +629,10 @@ static int sof_set_up_widgets_in_path(struct snd_sof_dev *sdev, struct snd_soc_d
 		if (!pipeline_list->pipelines)
 			goto sink_setup;
 
+		/* a widget which is not part of a pipeline has nothing to trigger */
+		if (!swidget->spipe)
+			goto sink_setup;
+
 		/*
 		 * Add the widget's pipe_widget to the list of pipelines to be triggered if not
 		 * already in the list. This will result in the pipelines getting added in the
@@ -641,8 +645,8 @@ static int sof_set_up_widgets_in_path(struct snd_sof_dev *sdev, struct snd_soc_d
 		}
 
 		if (i == pipeline_list->count) {
-			pipeline_list->count++;
 			pipeline_list->pipelines[i] = swidget->spipe;
+			pipeline_list->count++;
 		}
 	}
 
-- 
2.55.0

