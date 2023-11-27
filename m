Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a7wNrXWX"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF5DBD0
	for <linux-sound@vger.kernel.org>; Mon, 27 Nov 2023 05:35:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701092151; x=1732628151;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jRaXOSXDE1K5341Pb1GB9MXvuna1NA6z35RR4HXhW9g=;
  b=a7wNrXWXFUV5gnBGT4Vb98O1Mo6On5m/Chj0fQ6fGgy+6iHtzWGjWfZg
   HWWEwsUFQhwpsqXko5njWFvRxn8BCtPPmecQLGApQ51FdrmAICK9Z0TY5
   cY37EB9GRu8iMI+xEaKpo3HeFkccfjwaTJKClzy5i5H9m/pQygi8oJ7+J
   WkP1luCnvAFoHwGVPLfStp4eILQxSR39Cl+t0HareSaggiVHQj5JF3uCc
   El3v9XajZbR0mLJGakibTgx8xNuqO7C0BB/Q4RRLdK5j8F5+hDVBPraOi
   HJiGuVukp37VqzxqFnWq3Dx21PdHwqA5xBLCn2pDqyugmzgydD4gS/xx2
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="391578516"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="391578516"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 05:34:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="891743752"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="891743752"
Received: from acornagl-mobl.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.58.144])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 05:34:17 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	cezary.rojewski@intel.com,
	yung-chuan.liao@linux.intel.com,
	ckeepax@opensource.cirrus.com,
	yong.zhi@intel.com,
	chao.song@linux.intel.com
Subject: [PATCH 1/7] ASoC: Intel: sof_sdw: Make use of dev_err_probe()
Date: Mon, 27 Nov 2023 15:34:42 +0200
Message-ID: <20231127133448.18449-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231127133448.18449-1-peter.ujfalusi@linux.intel.com>
References: <20231127133448.18449-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The devm_snd_soc_register_card() can return with
-EPROBE_DEFER and in that case the driver should not print
an error message.

Closes: https://github.com/thesofproject/linux/issues/4668
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Chao Song <chao.song@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 1e788859c863..13089182dc17 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1947,7 +1947,7 @@ static int mc_probe(struct platform_device *pdev)
 	/* Register the card */
 	ret = devm_snd_soc_register_card(card->dev, card);
 	if (ret) {
-		dev_err(card->dev, "snd_soc_register_card failed %d\n", ret);
+		dev_err_probe(card->dev, ret, "snd_soc_register_card failed %d\n", ret);
 		mc_dailink_exit_loop(card);
 		return ret;
 	}
-- 
2.43.0

