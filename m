Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9903AC2B
	for <linux-sound@vger.kernel.org>; Thu, 11 Apr 2024 22:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712873063; cv=none; b=mF+yNUZj9HbBgxgAZ+GZTglsrmuekiifSGw7t1fyme9eHxNhhkVBYMe10GjoUWQLHO3J6SIl8i0/zZsv/1wg5aawUMp5puH4YOU5NPwuxfiBNpFSr98DNgcg0T2B46Ij8ZB1IXel5d84BkqflC32kZwif9w8zaQtOP3D/G88BWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712873063; c=relaxed/simple;
	bh=9Qw2Cq3PH55dtnROwvZO0TlbYZU94NAm34n3h9nv0S4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XyU/N79rytrW/CrekY1QiBFqbjUjuJ9xMlbXhkrQWQyHg7La2lKDPe+W73zoZaPIGqaIMcaKyAHe0UYIxcZE5Bw6f0ZQAzs5HCH5j2IZ0CzTf4XfjSQXh5hEOW+fyJ9NMh7Q4I5h144Xxj1nWjlGqL5YC/KcdaF30w+4dr9v2VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IAoHva1s; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IAoHva1s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712873062; x=1744409062;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9Qw2Cq3PH55dtnROwvZO0TlbYZU94NAm34n3h9nv0S4=;
  b=IAoHva1s40GdTvclnnYo//mAKRwdAAvrxy8AzVxca5i/F+oojStOkztP
   i5EwJiO0pYxQ055SqKE+Sj/pGWmQdxomX8VUvVYMG7Klrhh9veIGTxiFN
   CUjdZ9S4eM9OTz75wIGny6o4dx8ttHtBrUNqL417eFhQ1ZiYhlljG0muV
   e2Q40O6PTW5t7ai/msT8OsJ9n+GB550qLrLiZFJONcTQOBD0d6VSSzT3+
   /j87EoT2yB01IxEPEN9tXELfIzQ/MtpgTQ5Rx0LK4VBUIy4YK+HHqMAc/
   je1I3FSgw+aUvwD4joLKjbiIL8JSi9s2uFNwVD0LQ1YuaWY7WCDhHwtqh
   Q==;
X-CSE-ConnectionGUID: qLPoR+ZOSOar34qY8zdclQ==
X-CSE-MsgGUID: x0cG63llQFCQuK1uadfg/w==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="19708393"
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000"; 
   d="scan'208";a="19708393"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 15:04:21 -0700
X-CSE-ConnectionGUID: K1q6XdaETSSlw34hX7IWuw==
X-CSE-MsgGUID: qAbqon27QxWe1zxH34SteQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000"; 
   d="scan'208";a="21628770"
Received: from aramana1-mobl.amr.corp.intel.com (HELO pbossart-mobl6.lan) ([10.213.177.233])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 15:04:21 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 12/12] ASoC: Intel: sof_rt5682: use RT5682S_PLL1 if needed
Date: Thu, 11 Apr 2024 17:03:47 -0500
Message-Id: <20240411220347.131267-13-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240411220347.131267-1-pierre-louis.bossart@linux.intel.com>
References: <20240411220347.131267-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bard Liao <yung-chuan.liao@linux.intel.com>

When 96KHz sample rate is used, and MCLK is 24.576MHz, we will need
pll_in = 24576000 and pll_out = 49152000 which is not supported by
RT5682S_PLL2. Use RT5682S_PLL1 in this case.
We don't test sample rate because RT5682S_PLL2 doesn't support 24.576MHz
input and in the MCLK = 24.576MHz, sample rate = 48KHz case, i.e.
pll_in == pll_out, PLL will not be used at all.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 735e07ea62bd..062012de3de2 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -340,8 +340,19 @@ static int sof_rt5682_hw_params(struct snd_pcm_substream *substream,
 		clk_id = RT5682_SCLK_S_PLL1;
 		break;
 	case CODEC_RT5682S:
-		pll_id = RT5682S_PLL2;
-		clk_id = RT5682S_SCLK_S_PLL2;
+		/*
+		 * For MCLK = 24.576MHz and sample rate = 96KHz case, use PLL1  We don't test
+		 * pll_out or params_rate() here since rt5682s PLL2 doesn't support 24.576MHz
+		 * input, so we have no choice but to use PLL1. Besides, we will not use PLL at
+		 * all if pll_in == pll_out. ex, MCLK = 24.576Mhz and sample rate = 48KHz
+		 */
+		if (pll_in == 24576000) {
+			pll_id = RT5682S_PLL1;
+			clk_id = RT5682S_SCLK_S_PLL1;
+		} else {
+			pll_id = RT5682S_PLL2;
+			clk_id = RT5682S_SCLK_S_PLL2;
+		}
 		break;
 	default:
 		dev_err(rtd->dev, "invalid codec type %d\n", ctx->codec_type);
-- 
2.40.1

