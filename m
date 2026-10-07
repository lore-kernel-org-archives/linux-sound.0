Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB133448382
	for <linux-sound@vger.kernel.org>; Wed,  7 Oct 2026 08:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363010; cv=none; b=J46ZsS6nQkgThWrXkx7hUUWNdBweKA5Jn/3E1zGakGoXSTqQJg8UaPK6qunOTiMtZFUpUxywrMEoMVK57v+7kj5MOF8yAfCbohN/OqoNGDAt/a2NsMNTDP5XL6kq8v/rf112ofq3nCvbz6IBCkt0e9i84Z80OHrQk/xurvN7tak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363010; c=relaxed/simple;
	bh=Fyc9lhbVF/fKDL5q/xDFVMQGRcsn3LrahyQiiQ3b9b4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PppvcVT1o4v1tR7O93aFyp+OlQQqiLqxCwOZsj42cn3KJoYoDKKvac4s2Sf9JJOHX123irjSEijd/rqh8RzAWfzdfQufgtA0FbIfs6l01OEJJ9OtlHB1CVwct/00yEHFA0zryfMoKiK+ynxvUlrNysUimZvKh7Z2Lw4tQuarTaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VsJs00ad; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VsJs00ad"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791363009; x=1822899009;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Fyc9lhbVF/fKDL5q/xDFVMQGRcsn3LrahyQiiQ3b9b4=;
  b=VsJs00adBR90SzofpW8hS3XAEyDkdNhFAEd+AbV2SbsT2BrY36TqHsEd
   kjn8SXDjhbpToaHFZ6Hp9TVE8Ct9VzLHy0BLx8FkGUOkdd3J3Jesnje0o
   Qs8sINoK7D6Ft8D36eE0lcVMEAzLOcwP9acgjbFrSBuCVkwx1EGm3caeg
   RnrBiMgrtrEu4TPN2h7AutOAsZKXgK8G3HlhoKkxsJVj77WUWD2JYfZJ0
   uu+njRc7l9u1BDjgtnMwOMkN0hSeys2NGpm6dcY8IMl+OypBdWgDnOZW0
   S85jrTvPt4HLGZqQo611S3o98vgDlnokBAfM6VZ8THsSWNenuCiNMsmt5
   w==;
X-CSE-ConnectionGUID: sBEwyoHhTgmZRQB4Tjq9Ow==
X-CSE-MsgGUID: tlGGRnX5SJet1i+BLjdLrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="113922"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="113922"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 01:50:09 -0700
X-CSE-ConnectionGUID: 1OFpAWjhQA6GiRgCd9rzSQ==
X-CSE-MsgGUID: pP8WyMY+Q3Ka0uWyBBV9MA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="280670626"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.188])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 01:50:05 -0700
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
Subject: [PATCH v5 10/28] ASoC: SOF: sof-audio: Fix the pipeline_list population
Date: Wed,  7 Oct 2026 11:49:37 +0300
Message-ID: <20261007084955.1256-11-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261007084955.1256-1-peter.ujfalusi@linux.intel.com>
References: <20261007084955.1256-1-peter.ujfalusi@linux.intel.com>
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
2.56.0

