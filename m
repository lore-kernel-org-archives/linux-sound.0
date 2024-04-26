Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4717149C62
	for <linux-sound@vger.kernel.org>; Fri, 26 Apr 2024 15:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714144905; cv=none; b=DCgoUUU8OJWyCbYlSmfp9uBMAvEzFfH5MM/tf+Mptecq+R02/eMxknsenUbG1HHxZ2H1+BTo4Fb/drnEB8dwxznQW3dA5X4LhU1JyHRqImA/iix23KURGXmBIuuJqOybNxv7BYOsYGoJDLPYZxEOGBpmgg1zLGgi5VxTWdIv9/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714144905; c=relaxed/simple;
	bh=EN06Qbj+h6vmWB7m/IpZGvOt02dFoebcBQ4VHz/TBPQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Fck02RQ1+tyPtzoCfVp5W/32VZc9mN7ZpHIjoDruRiL9BI+wM7MF9MNaV0KEfZyucsHLkvkrdNagq+wfUqsSuIVo9ELaxPnRSXwmxRN8SS+xA+NISq4/MGTdzpdyxFJJ5DhHKYlTckgb1ntKmJ1ZQuLloAPrsJhtaKqZlfXQktI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ep2v5ZmS; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ep2v5ZmS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714144904; x=1745680904;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EN06Qbj+h6vmWB7m/IpZGvOt02dFoebcBQ4VHz/TBPQ=;
  b=ep2v5ZmSsLNz4qGWR/5NJ2pyQhMzlx8ZymuRWj2GiqoYFMkbReMf7Fi8
   4UoZaws3oe0sEqzhA5GjsAMIqxuMCLBK1Dwo/h80RNJw48NboBn7Hsihy
   JPmdHukr57h6hQt6TT2ZtmW/So4nyOm+b7Vhln8nLqg0JJmduAFYSy8JL
   OFu06T65YD+BP6eX/IvkY92Ro3lvXQKBCbWLyWx67mqQYx+IU77nnIStL
   vTklLSIOYBcgNtnhZz1dT4a75NxIENO/thHyRtdAMcaLXOyFK6/osQSX9
   NPF+j63rPK0T73oJtD7CcmeeiZU8p29Cj1aq+PykR+Fw9bTKBeH4zuDkq
   A==;
X-CSE-ConnectionGUID: 0RvL/NPXQLWdPMhFzJTjYg==
X-CSE-MsgGUID: TRF+b+39QqCv3Kt0RH1wpg==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="21290623"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="21290623"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:21:43 -0700
X-CSE-ConnectionGUID: vsV7XhHgRo25bOlE0XUwRw==
X-CSE-MsgGUID: UB9LVCLCQZGb4I0qHSboiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="30259032"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.33.33])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:21:43 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH 07/12] ASoC: Intel: sof-sdw: don't set card long_name
Date: Fri, 26 Apr 2024 10:21:18 -0500
Message-Id: <20240426152123.36284-8-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240426152123.36284-1-pierre-louis.bossart@linux.intel.com>
References: <20240426152123.36284-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

UCM can load a board-specific file based on the card long_name. Remove
the constant "Intel Soundwire SOF" long_name so that the ASoC core can
set the long_name based on DMI information.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 384c3d41a9ad..b9a5fcb42847 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1879,9 +1879,6 @@ static int sof_sdw_card_late_probe(struct snd_soc_card *card)
 	return ret;
 }
 
-/* SoC card */
-static const char sdw_card_long_name[] = "Intel Soundwire SOF";
-
 /* helper to get the link that the codec DAI is used */
 static struct snd_soc_dai_link *mc_find_codec_dai_used(struct snd_soc_card *card,
 						       const char *dai_name)
@@ -1999,8 +1996,6 @@ static int mc_probe(struct platform_device *pdev)
 			return -ENOMEM;
 	}
 
-	card->long_name = sdw_card_long_name;
-
 	/* Register the card */
 	ret = devm_snd_soc_register_card(card->dev, card);
 	if (ret) {
-- 
2.40.1

