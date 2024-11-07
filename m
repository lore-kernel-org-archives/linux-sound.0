Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A064720EA46
	for <linux-sound@vger.kernel.org>; Thu,  7 Nov 2024 13:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730987404; cv=none; b=k1CdfoEzH3CTy5BzC7B+5eJgHwkhWdqFhpoxnsYkEkkl2rpTPdgpZKRT53u9/fbyffL0HmXuyFxoz8rxnX3KYP2VH6p6pJN3P4dm7z5+kHzpXLwLsBKL80PFhoqKF6EveS10OPc4URPpEWL8Po+mc+p52Dc4+ShmFBKjCTjcGQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730987404; c=relaxed/simple;
	bh=7QkbMc6dJh4mA4b21eP094swHMsQE4UwCowCiQUWnWw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ltFy5h8c+1Xwf+1I51X12UhAt1pwt5ZQyaYVzSE88oOkrbdTlN7s97SXXR4s4qvNt3cc1f3JAbHcQXvrvC3i7mv1/tJgN8f8uuRs0/ZxT7qHguhRE3ATf1+mrID3ft7vuSS0k7U/7yjeAT8/sZrGY7Uhfc5dd3ZNsz2lF4+pQYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cdCjsqJH; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cdCjsqJH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730987403; x=1762523403;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7QkbMc6dJh4mA4b21eP094swHMsQE4UwCowCiQUWnWw=;
  b=cdCjsqJHfZUHxwPYAOysxaUCP//uUCj+U2NGDvMY4cBfnnaMqnP0vMl6
   JpfQsxsGbWoKh/ifaw2vFbCv4TRkTr+QrkVtHAReKj/BBd+jaipF9jNP2
   cX/PHAgpHGshon85ON4L+MQ6rXjnv7ysqGhjsNnPNZvDZVbO2gSZrLHC+
   6RDFq5w7F6LmmQIt6mraxi9BBffFRJ1zoIamhm6EeyOInwL+6Wagjy38a
   HOfdpsETwCFYAFHGVkszydq8J0AQYHYD9JSiMs6f8ZFewbmD46GgtUm3Z
   iIJFAG1caMxsm7ahm3bjhCF4qJ9OdxiTAp9vlmSPBgeJhmw1YJcBeoihA
   g==;
X-CSE-ConnectionGUID: 1pEcMrn1TgKyVd9rzrjkhA==
X-CSE-MsgGUID: l92GgOGXQO6x/co52mVhdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34523143"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="34523143"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 05:50:03 -0800
X-CSE-ConnectionGUID: 8jwgWJcAQDCSEPDt79gm4g==
X-CSE-MsgGUID: xZrWNL5WSm6UgrBCfo8cow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,266,1728975600"; 
   d="scan'208";a="115922001"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.205])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 05:50:00 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	fred.oh@linux.intel.com
Subject: [PATCH] ASoC: SOF: Intel: hda: handle only paused streams in hda_dai_suspend()
Date: Thu,  7 Nov 2024 15:49:57 +0200
Message-ID: <20241107134957.25160-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

hda_dai_suspend() was added to handle paused stream during system
suspend. But as a side effect, it also ends up cleaning up the DMA
data for those streams that were prepared but not triggered before a
system suspend. Since these streams will not receive the prepare
callback after resuming, we need to preserve the DMA data during suspend.
So, add the check to handle only those streams that are in the paused
state to avoid losing the DMA data for all other streams.

Link: https://github.com/thesofproject/linux/issues/5080
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Fred Oh <fred.oh@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index ac505c7ad342..ee274d445515 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -646,6 +646,10 @@ static int hda_dai_suspend(struct hdac_bus *bus)
 			sdai = swidget->private;
 			ops = sdai->platform_private;
 
+			if (rtd->dpcm[hext_stream->link_substream->stream].state !=
+			    SND_SOC_DPCM_STATE_PAUSED)
+				continue;
+
 			/* for consistency with TRIGGER_SUSPEND  */
 			if (ops->post_trigger) {
 				ret = ops->post_trigger(sdev, cpu_dai,
-- 
2.47.0

