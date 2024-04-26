Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C412C148FF0
	for <linux-sound@vger.kernel.org>; Fri, 26 Apr 2024 15:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714145955; cv=none; b=tHxNrnlOxRUDaLWB7+evP38UqNnbw99a4YkoQI0VllS0VQKZEnE6xawuSQ9GkhY0u5LdgiLJM/81OZ26ToCkjQWQX8gfDrNuBhBFwjHeMT+/aQ0NZ9uIG901SS/pneXZ8w4rCULkVKG2htXhjfPULlEXU19D1/A+yihcIMagcBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714145955; c=relaxed/simple;
	bh=flcFCyFG2/t8hSowAIB01UznDgaflhSitPfuUrp0c60=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gtjPomVG6ijLCznAin7afiwHwyfV6UOHBcjP139W3m6QXXU5ry1yGuS/5OJxGWEha2Myi0079ztt3eXXG3hD5hBjC1n14cEEeOzk2bE841EhPUh97sCFS9L1zz0uVZlHLG31po7F2TmI/Lcge1kBUINo3fQFalFEO4osRm+ORwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M/MkhWr1; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M/MkhWr1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714145954; x=1745681954;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=flcFCyFG2/t8hSowAIB01UznDgaflhSitPfuUrp0c60=;
  b=M/MkhWr1w95CMeUS2P3BQw4DC6EqnuF/1jMv390CWkN9Br3v58/RPfCk
   mIxRtCAwdcWvYoxUqjdflpYpVbgacopPvXpivnubzIAzoWlpGBtOazO5U
   guVzWoiDjlSZQY/P94VLwVplLOInYnHiyE/dYdwpW+rcIFRXQiAD6E8+e
   IaRyQ+sAjI3Pt0zxwKaUdyhcy9kNVzEU22T/M0YMXKTPZg2lBa+pEh/24
   cuY81K7Uryx4Dd9fgsKJBgNyKobY7tj/B4gL4D5/YoENu2/xexrrDCns/
   6nbHhsf5I6gfbo2d76rnefc4j9eSCgLjbxQNtQnGvFuH2qYtT1OHVT1br
   w==;
X-CSE-ConnectionGUID: ORM25AwcSeOuAimZRC1L+Q==
X-CSE-MsgGUID: 4IqchcbzSmuq5DbktIhGLw==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="9718437"
X-IronPort-AV: E=Sophos;i="6.07,233,1708416000"; 
   d="scan'208";a="9718437"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:39:11 -0700
X-CSE-ConnectionGUID: WL7/LIeJRTSSuULWaJyWbA==
X-CSE-MsgGUID: cILyGG/0QEKLlCU1ZdfHEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,233,1708416000"; 
   d="scan'208";a="56623540"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.33.33])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:39:10 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Yong Zhi <yong.zhi@intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 2/5] ASoC: SOF: topology: remove incorrect widget id in error message
Date: Fri, 26 Apr 2024 10:38:59 -0500
Message-Id: <20240426153902.39560-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240426153902.39560-1-pierre-louis.bossart@linux.intel.com>
References: <20240426153902.39560-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yong Zhi <yong.zhi@intel.com>

In sof_widget_ready() function, the shift field of
struct snd_soc_tplg_dapm_widget is incorrectly used to print
widget id in dev_err(scomp->dev, "error: failed to add widget id %d ..",
this patch removes the useless tw->shift from the error output.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Yong Zhi <yong.zhi@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/topology.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index bcdb499c96a0..ec931a26b54f 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -1531,10 +1531,9 @@ static int sof_widget_ready(struct snd_soc_component *scomp, int index,
 	/* check token parsing reply */
 	if (ret < 0) {
 		dev_err(scomp->dev,
-			"error: failed to add widget id %d type %d name : %s stream %s\n",
-			tw->shift, swidget->id, tw->name,
-			strnlen(tw->sname, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) > 0
-				? tw->sname : "none");
+			"failed to add widget type %d name : %s stream %s\n",
+			swidget->id, tw->name, strnlen(tw->sname, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) > 0
+							? tw->sname : "none");
 		goto widget_free;
 	}
 
-- 
2.40.1

