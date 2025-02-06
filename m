Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFCD225A4E
	for <linux-sound@vger.kernel.org>; Thu,  6 Feb 2025 09:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738834079; cv=none; b=NLCHQHmiW7JtjTKSO91ea7uX+cG4+/7oHdTarTMTa1TcMcdKwGxFNz+Fxn3BDwwI05QiRdoOOScQV1rqh5+DftH0m3vO7vdyzjs/XAtl8vJO/n+ukw96h+dbeN7aiVPzPVzXzyQZmkyLBR98X9+dZBTEbR2QECxpX/EXEHHkUGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738834079; c=relaxed/simple;
	bh=DxyxacouotQtBnMJH6H32oUi+8qcOKbm1/AIETGsKO4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q20/PYP6Bayo4HmLqmLvSKTuaJqprPDzFBSb+z00ctkDJR+Em3eJWafT20sFYQIzRDNeyoOFtO0YxJCOtI0jb0+F3gledJX6nC9qVHAx9j19WnLiij6jVVQDS/r8yBON1hbTLwGHQPl6jbswSfsPjHnIEWJC7wGVK2IdhcVNQGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h4nKJgib; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h4nKJgib"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738834078; x=1770370078;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DxyxacouotQtBnMJH6H32oUi+8qcOKbm1/AIETGsKO4=;
  b=h4nKJgib2wfyuCyiPMnPoorwkcDCHlUlv5fpAKcdt4kRphmU/V79JN19
   E8wMMF+31JKpn8ML4ll3mQD4KhOGlCQ00O0pU75W/QY6OyKXz9REgditL
   5uy/WVL8+vF4ba5q28kdtGmQ2Agh5S8Bz6gi7nen+kBT26tKTu6kPVK81
   kbs+AjyFlnMeUq3+6zLn0mlFjEOJ/gJ+DQEpht764vDWmsVocSl6dUXxX
   FdjLL+ZK+ITON4GEvhsGAMsl3djqLcKMV+0tG8xf8AeNwl3orTaYhp+HC
   dFDOLZ/G55d0AkFuJ1WydfRWDBxoj4vGxQFFt2GBinYz9N2UtnDGMAzQh
   A==;
X-CSE-ConnectionGUID: prCxaG6uR7SdtzXlcRZ+8g==
X-CSE-MsgGUID: 2wxWF2tJTO6l5KzjefpYPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="43090015"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="43090015"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 01:27:58 -0800
X-CSE-ConnectionGUID: pEoUdUuCREe4ASTSYTQvWg==
X-CSE-MsgGUID: 6DaSO+IER76A63PuzZcywQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="148361992"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.33])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 01:27:55 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev
Subject: [PATCH 2/4] ASoC: SOF: pcm: Move period/buffer configuration print after platform open
Date: Thu,  6 Feb 2025 11:28:26 +0200
Message-ID: <20250206092828.7569-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250206092828.7569-1-peter.ujfalusi@linux.intel.com>
References: <20250206092828.7569-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The platform specific pcm_open call via snd_sof_pcm_platform_open() can
modify the initial buffer configuration via constraints.

Move the prints as last step in the sof_pcm_open() function to reflect the
final setup.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/pcm.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index 709baa1b0bd6..d09be241e95e 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -536,15 +536,6 @@ static int sof_pcm_open(struct snd_soc_component *component,
 	 */
 	runtime->hw.buffer_bytes_max = le32_to_cpu(caps->buffer_size_max);
 
-	dev_dbg(component->dev, "period min %zd max %zd bytes\n",
-		runtime->hw.period_bytes_min,
-		runtime->hw.period_bytes_max);
-	dev_dbg(component->dev, "period count %d max %d\n",
-		runtime->hw.periods_min,
-		runtime->hw.periods_max);
-	dev_dbg(component->dev, "buffer max %zd bytes\n",
-		runtime->hw.buffer_bytes_max);
-
 	/* set wait time - TODO: come from topology */
 	substream->wait_time = 500;
 
@@ -554,10 +545,21 @@ static int sof_pcm_open(struct snd_soc_component *component,
 	spcm->prepared[substream->stream] = false;
 
 	ret = snd_sof_pcm_platform_open(sdev, substream);
-	if (ret < 0)
+	if (ret < 0) {
 		dev_err(component->dev, "error: pcm open failed %d\n", ret);
+		return ret;
+	}
 
-	return ret;
+	dev_dbg(component->dev, "period bytes min %zd, max %zd\n",
+		runtime->hw.period_bytes_min,
+		runtime->hw.period_bytes_max);
+	dev_dbg(component->dev, "period count min %d, max %d\n",
+		runtime->hw.periods_min,
+		runtime->hw.periods_max);
+	dev_dbg(component->dev, "buffer bytes max %zd\n",
+		runtime->hw.buffer_bytes_max);
+
+	return 0;
 }
 
 static int sof_pcm_close(struct snd_soc_component *component,
-- 
2.48.1

