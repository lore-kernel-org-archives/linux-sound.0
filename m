Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973C475812
	for <linux-sound@vger.kernel.org>; Mon, 25 Mar 2024 22:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711404687; cv=none; b=VOlXhtnXpRv/09kB16HQRdbMpf0nF+b9twrj0nWtvgq45Us8+lIzluvsU5XpCHi7AW+0oriwQ1YEFMTw9iW+dXFFLhik2qx39fT63r5Lqtx+kFv6Bn/BBeoIpIW1o8NktxDhOkWCuBjlUQ4E8K3gquiG1Ua1y626L7R06HbauHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711404687; c=relaxed/simple;
	bh=DFPuc2K8UUJmDtViTOMBZVHUupgaVBLQVlGwzidkiy4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pUV96Ilv3FHFmPU8dOEUeYc2437iAq5m+35znuuZZfvBX3NjXX5WxQ3rN7HQMfl22J8Jebem3lrtM0qfYdtPVsqca+syGK/PTFBLsSL8dzQYQKYBECbMPeSSxv2qTlPOVS0TXbB0EbHH+u2K7S6q76OyUXpPKhPuaBVSA8ABSwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PLlDG/2X; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PLlDG/2X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711404686; x=1742940686;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DFPuc2K8UUJmDtViTOMBZVHUupgaVBLQVlGwzidkiy4=;
  b=PLlDG/2XsqiqyhlNVnnSYHcZxOe+cqa80PQsNZZkU11bAyIOFClCXDzn
   OZUza8x2zdqAPmVGIcda+lKNedZP8PhNGX+75EsW55iiIgdSRFcvaqGxQ
   heqFnQSojzx9GKcle4SAYDTgh0k1NNiVmV2LNOV4RO8vihm+KQdl+Eul7
   KZzkpgEC+onkQc45wAd2qdDQNVm3iYGsp+eCMbUeoleI12pBTNcjD0Nps
   kOfKR/shGOsFMMELMrQQKEbcsqmslG9757WR5HrePy/cd2YveCwz4D66+
   /kA5187FThObBSIEiFhFZCVzCcd1Vj4/cBJ/dmBNs5gdi+BJ+KRA5bfF2
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6643662"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; 
   d="scan'208";a="6643662"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 15:11:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; 
   d="scan'208";a="15722151"
Received: from jaimbres-mobl2.amr.corp.intel.com (HELO pbossart-mobl6.lan) ([10.212.98.109])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 15:11:23 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 14/21] ASoC: Intel: sof_da7219: add SOF_DA7219_MCLK_EN quirk
Date: Mon, 25 Mar 2024 17:10:52 -0500
Message-Id: <20240325221059.206042-15-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240325221059.206042-1-pierre-louis.bossart@linux.intel.com>
References: <20240325221059.206042-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Brent Lu <brent.lu@intel.com>

PLL bypass mode requires mclk to be present. However, mclk pin is not
connected in JSL boards. Here we add the SOF_DA7219_MCLK_EN quirk to
improve driver readability.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_board_helpers.h |  2 ++
 sound/soc/intel/boards/sof_da7219.c        | 13 ++++++++++---
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/boards/sof_board_helpers.h b/sound/soc/intel/boards/sof_board_helpers.h
index 1701481ab6ae..2f27ad8726f8 100644
--- a/sound/soc/intel/boards/sof_board_helpers.h
+++ b/sound/soc/intel/boards/sof_board_helpers.h
@@ -87,10 +87,12 @@ enum {
  * sof_da7219_private: private data for da7219 machine driver
  *
  * @is_jsl_board: true for JSL boards
+ * @mclk_en: true for mclk pin is connected
  * @pll_bypass: true for PLL bypass mode
  */
 struct sof_da7219_private {
 	bool is_jsl_board;
+	bool mclk_en;
 	bool pll_bypass;
 };
 
diff --git a/sound/soc/intel/boards/sof_da7219.c b/sound/soc/intel/boards/sof_da7219.c
index 3d9c48107f58..4417e2b7adfd 100644
--- a/sound/soc/intel/boards/sof_da7219.c
+++ b/sound/soc/intel/boards/sof_da7219.c
@@ -20,6 +20,7 @@
 
 /* Driver-specific board quirks: from bit 0 to 7 */
 #define SOF_DA7219_JSL_BOARD			BIT(0)
+#define SOF_DA7219_MCLK_EN			BIT(1)
 
 #define DIALOG_CODEC_DAI	"da7219-hifi"
 
@@ -126,7 +127,8 @@ static int da7219_codec_init(struct snd_soc_pcm_runtime *rtd)
 	 * Use PLL bypass mode if MCLK is available, be sure to set the
 	 * frequency of MCLK to 12.288 or 24.576MHz on topology side.
 	 */
-	if (mclk_rate == 12288000 || mclk_rate == 24576000) {
+	if (ctx->da7219.mclk_en &&
+	    (mclk_rate == 12288000 || mclk_rate == 24576000)) {
 		/* PLL bypass mode */
 		dev_dbg(rtd->dev, "pll bypass mode, mclk rate %d\n", mclk_rate);
 
@@ -337,6 +339,9 @@ static int audio_probe(struct platform_device *pdev)
 		}
 	}
 
+	if (board_quirk & SOF_DA7219_MCLK_EN)
+		ctx->da7219.mclk_en = true;
+
 	/* update dai_link */
 	ret = sof_card_dai_links_create(&pdev->dev, &card_da7219, ctx);
 	if (ret)
@@ -383,7 +388,8 @@ static const struct platform_device_id board_ids[] = {
 	},
 	{
 		.name = "adl_mx98360_da7219",
-		.driver_data = (kernel_ulong_t)(SOF_SSP_PORT_CODEC(0) |
+		.driver_data = (kernel_ulong_t)(SOF_DA7219_MCLK_EN |
+					SOF_SSP_PORT_CODEC(0) |
 					SOF_SSP_PORT_AMP(1) |
 					SOF_NUM_IDISP_HDMI(4) |
 					SOF_SSP_PORT_BT_OFFLOAD(2) |
@@ -391,7 +397,8 @@ static const struct platform_device_id board_ids[] = {
 	},
 	{
 		.name = "rpl_mx98360_da7219",
-		.driver_data = (kernel_ulong_t)(SOF_SSP_PORT_CODEC(0) |
+		.driver_data = (kernel_ulong_t)(SOF_DA7219_MCLK_EN |
+					SOF_SSP_PORT_CODEC(0) |
 					SOF_SSP_PORT_AMP(1) |
 					SOF_NUM_IDISP_HDMI(4) |
 					SOF_SSP_PORT_BT_OFFLOAD(2) |
-- 
2.40.1

