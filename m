Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6918913C9C3
	for <linux-sound@vger.kernel.org>; Tue, 26 Mar 2024 16:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711469141; cv=none; b=UPuS5qHeK5EZI8S02K0RKepPu7WTW4vxLoBH+G1u6J2yDfN7zLqQpHHP2/jJKIoNKv9OYkiSZ2NNUbFVqY6NO7+LkJxa1DkVP6aJzsrWSGVwJ3R1IHx3fkI2REa/wkxkpgo4dhHCA4nNxFjzd44B7+uSuR3c+jMDyFP0wSi6bIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711469141; c=relaxed/simple;
	bh=CGW9WwILyoWL0VUVn+vNHuA24fw6YkjS/KusTPXlIlk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HwYT3eHa4mD5XggWofbFW+9L2ahGzcpOB9/WXtQ+yT9Wq2I58z7XK6B3ThGMGZyBJzB9Ur6MpYp2YMwo3ByrlSear3a0ealdQD/KxI/hcEVPKV1TFiYya6lfB38hJiaR4iDrbaYsgJqY6EPs2nhB36a7IkMmqxAYGSwjjv/j3ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NmCA9hUm; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NmCA9hUm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711469140; x=1743005140;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CGW9WwILyoWL0VUVn+vNHuA24fw6YkjS/KusTPXlIlk=;
  b=NmCA9hUmeGXf/GurYXAcUn62HYlDsYabe1X+1shVgXfEGFrlXHNnIWLr
   IyjCwTyT+vtGBc1xHALwVLEuIDwUMN0DazPxn5nvJJ0EEvapWeBti7tyq
   zN+O5nTcZ7uCg9eqdof/PgH1bMw2kqDuKXDVtZfHMBR0zDD2P/L7BPxCK
   5maXQbXsVPIpNBFkaFiq5WYJP9rn9RmtF1B5yh1AhNRDPmzlkwZRR0M0C
   8eDSA6EzgH1JJrZNNGJW936JkIphwF5C+9KsNI8Ub+2MXHMvl+Fx0npak
   XOxbRGKxENU5YF9sZ93vjbt14tDO4V9MhcX3f9+gQoMx1LYcR9Pqe6TKo
   A==;
X-CSE-ConnectionGUID: ie5EYOJVT+6l1mTczRMSMw==
X-CSE-MsgGUID: Q7oLV8NZTJq/zc/dr4YtOQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17260528"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="17260528"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:05:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="20482438"
Received: from bhubbert-mobl.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.65.108])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:05:02 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shuming Fan <shumingf@realtek.com>,
	Jack Yu <jack.yu@realtek.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Bard liao <yung-chuan.liao@linux.intel.com>,
	Chao Song <chao.song@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 28/34] ASoC: rt715-sdca: rename dai name with rt715-sdca prefix
Date: Tue, 26 Mar 2024 11:04:23 -0500
Message-Id: <20240326160429.13560-29-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
References: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Bard Liao <yung-chuan.liao@linux.intel.com>

The dai name are the same as rt715 codec. Rename them with rt715-sdca
prefix allow machine driver to distinguish rt715 and rt715-sdca from
dai name.

Reviewed-by: Chao Song <chao.song@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/rt715-sdca.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt715-sdca.c b/sound/soc/codecs/rt715-sdca.c
index 3fb7b9adb61d..3a6dfe1f6c48 100644
--- a/sound/soc/codecs/rt715-sdca.c
+++ b/sound/soc/codecs/rt715-sdca.c
@@ -933,7 +933,7 @@ static const struct snd_soc_dai_ops rt715_sdca_ops = {
 
 static struct snd_soc_dai_driver rt715_sdca_dai[] = {
 	{
-		.name = "rt715-aif1",
+		.name = "rt715-sdca-aif1",
 		.id = RT715_AIF1,
 		.capture = {
 			.stream_name = "DP6 Capture",
@@ -945,7 +945,7 @@ static struct snd_soc_dai_driver rt715_sdca_dai[] = {
 		.ops = &rt715_sdca_ops,
 	},
 	{
-		.name = "rt715-aif2",
+		.name = "rt715-sdca-aif2",
 		.id = RT715_AIF2,
 		.capture = {
 			.stream_name = "DP4 Capture",
-- 
2.40.1

