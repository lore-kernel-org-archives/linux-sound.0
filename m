Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B499315623B
	for <linux-sound@vger.kernel.org>; Fri, 26 Apr 2024 15:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714145155; cv=none; b=HxkDeZNFHNCTLX9/HRpkz5mAUl3soLBmMgwlw0FGzbGSDPOTH8vqrTaf4bD+faaiPTSgWudLM5Oq4ujoHAWmQF55hQ017gXgXq7tXMDp5YcPSgEUX0+3gP/MsXftKbGA0aVLt/HZp2yA8w7KU17XHWCZSrvLuMIghobHKAHq0yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714145155; c=relaxed/simple;
	bh=j1ku1dWhFHuyquni9fCYrD3Jol58ijoJHLGyFSz6q/U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=O092KHd2lczfCgbWSnf0OiWedZFWgvAyteYqHxI0O+kLsFH7+F1o7nZQqCLtVbxbFT/b6JfZtFSZ1ZF3ZpTbCnbB6q0ivMy3zUhk092QTcS/qekzlZ36ryT/MT2fKwEQGgrCz4Tv5ibJTP/bb6Zf5oEUUE4YsanBIR5Vau9i3I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=habeQjHL; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="habeQjHL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714145154; x=1745681154;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=j1ku1dWhFHuyquni9fCYrD3Jol58ijoJHLGyFSz6q/U=;
  b=habeQjHLEK2NoFfp1YVKdoDbOH3+2VbkJWSzwX7BuxNVky8669MaEq4j
   hRI0sn8E2rf0Y15orlXjc0RPPsvUjwy58YlKF89ZljVRQ/cf+xfzjyJoV
   ySOwWunqBai4pQZCfE8QqKxExG8WeeBv9Yq1eDR7tXCEeaT+cySdy2eU0
   EtUjxZI0Dh164dGJtjRE4O/XB1V6EW80Szz2a7cM/6+MagN8bq/4neWbh
   aM6RZFmIfsH86kxrfQyjyKwHGBITX5SfRnwq7Y8EA9Bn8r5uT3JSvhRYA
   6V8Yinr4pe9BPBQGv7ZV/kGCf6XixjNlUjczopavfEfgsCTxdv5SPg1BT
   w==;
X-CSE-ConnectionGUID: KYLM1P24QaqUC7szYCiLqQ==
X-CSE-MsgGUID: /sjUeV+yTiKz5pe3+QDk+Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="21291368"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="21291368"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:25:53 -0700
X-CSE-ConnectionGUID: aoh48tzYRTS2TkAHVn0Ceg==
X-CSE-MsgGUID: 66pXMnfUTg2eFAj5AZchZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="30259619"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.33.33])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:25:53 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 22/23] ASoC: Intel: sof-rt5682: get bclk frequency from topology
Date: Fri, 26 Apr 2024 10:25:28 -0500
Message-Id: <20240426152529.38345-23-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240426152529.38345-1-pierre-louis.bossart@linux.intel.com>
References: <20240426152529.38345-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Brent Lu <brent.lu@intel.com>

A different bclk frequency 3.072MHz was introduced to tgl platform and
is used in mtl topologies. Use SOF API to get frequency from topology
instead of hardcoding.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 6a79dd5271cc..c3b026868653 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -317,7 +317,12 @@ static int sof_rt5682_hw_params(struct snd_pcm_substream *substream,
 			return -EINVAL;
 		}
 
-		pll_in = params_rate(params) * 50;
+		/* get the tplg configured bclk. */
+		pll_in = sof_dai_get_bclk(rtd);
+		if (pll_in <= 0) {
+			dev_err(rtd->dev, "invalid bclk freq %d\n", pll_in);
+			return -EINVAL;
+		}
 	}
 
 	pll_out = params_rate(params) * 512;
-- 
2.40.1

