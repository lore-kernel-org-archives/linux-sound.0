Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC76241F9
	for <linux-sound@vger.kernel.org>; Tue, 13 Feb 2024 10:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707819180; cv=none; b=UTrosf/Iuk/TDy2taBOn9zxZjEg7rpglGgWKuMLSE9rWiqyxrX2TNYrtnpd2bZRyQ/zqCbZ6K0gbs0X+M0xcKTQbVt3ROemt7mcKtuah6973o+NzkCmGBdtfF+pBOIfn9mLfF1v1DlGsu8xLOm71EcxbRDv9d5DF3fjFVEqDIBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707819180; c=relaxed/simple;
	bh=s20BkwWFKH3CAnnbarh9/rQnsPrNNa2mojYPxw0xgis=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ikW1SMQrLtX3+sdPsmdW2IMytx6rdsbzTS1/X/XUj1/iVmlSJ+IbI1fa9+29EWl9Bl6PciD7+UVBftDWHe4Nd4A6nS/wp6E/CUKYF/H73hHKCq9kFMRK59pbO9T+jeYZiwbqIi0j9hSt4PX5kBGwKiAYoEncbOGToZSFoN6oKP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DLn9Zj1/; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DLn9Zj1/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707819179; x=1739355179;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=s20BkwWFKH3CAnnbarh9/rQnsPrNNa2mojYPxw0xgis=;
  b=DLn9Zj1/zjRBnXXx/DI4DpzF9vwOMfyP0N17MmaR44e/wpjDqX4UhIWl
   MSc3yUZxSaO5ZmA7WlK/JT8MdpJ0NmDXqQ7dPwPInGKmkunmx0Le91+FU
   JsRsBxbDV26resvYhVx50/aI0UBz45GTc4F960WyAOHEHkdWhYx/EwfBX
   dBZf2ygCbJQ156O3H3hFERd2xJhbanNTkT/XPTw1RDDAZaggxD/agWMhx
   hCiZNnvjjD0/xtE75za8xAmyrhKqTVB97PxSxLg3FzGLGnQP67UMaV0En
   SB6R0PclV1IHsiVRJa1RbYCXXMUlDWPW0Ed6AK/ZyMUorqwfjHio+HxO/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="27260177"
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="27260177"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 02:12:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="7498060"
Received: from dcoroian-mobl.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.249.42.253])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 02:12:56 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH 08/15] ASoC: SOF: Intel: hda-dai: remove dspless special case
Date: Tue, 13 Feb 2024 12:12:40 +0200
Message-ID: <20240213101247.28887-9-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240213101247.28887-1-peter.ujfalusi@linux.intel.com>
References: <20240213101247.28887-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

The existing code forces a parameter to be NULL but that parameter is
not used yet. Remove the special case in preparation for additional
changes.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index f4cbc0ad5de3..4bffd9ea21a9 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -83,12 +83,8 @@ hda_dai_get_ops(struct snd_pcm_substream *substream, struct snd_soc_dai *cpu_dai
 
 	sdev = widget_to_sdev(w);
 
-	/*
-	 * The swidget parameter of hda_select_dai_widget_ops() is ignored in
-	 * case of DSPless mode
-	 */
 	if (sdev->dspless_mode_selected)
-		return hda_select_dai_widget_ops(sdev, NULL);
+		return hda_select_dai_widget_ops(sdev, swidget);
 
 	sdai = swidget->private;
 
-- 
2.43.0

