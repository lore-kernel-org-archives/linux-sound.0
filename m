Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CEC424EF73
	for <linux-sound@vger.kernel.org>; Mon,  7 Apr 2025 12:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744029674; cv=none; b=Nhid4C81H6JHDibwZ0krH76ShlR4KJdoTWgeg0mdvoRBtDSfhjAnUBOLjO0wlA3iUBAbzemcFeiqOvV+Vs3D9ys2DvCaPmSO48+NonZ82Y/eWYC/8BH0AeGI/teh79HapMMshN3+vNK1G5sqrl/v5GiIxOpoiu1C+0fWvPbbBOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744029674; c=relaxed/simple;
	bh=FmLUxGQFBwPe4AmYIR9hOcTDFnwbCTD47xrnTkEbT7o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MWR34QX+05CVsh5JF/k1bOm/oFhPuNAnoMsm23VIfsANI2r9ScdGZ4xIOyMGqR5B6rYv9DaOLKPXqEQgXtpjHbZN7SY1KNc31OrL1P5tjHf8WHmo9iImy4BCBZ3RkSUm2zGrlCbk6M2j/H73rc6Qw3FaHpn9AA2TPzMvatTIwOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l3FGY4SK; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l3FGY4SK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744029673; x=1775565673;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FmLUxGQFBwPe4AmYIR9hOcTDFnwbCTD47xrnTkEbT7o=;
  b=l3FGY4SKk4I7oiHohPb2suyzGqYU6N9DNoeCJGdjPO9GIWzUEu/I4UDN
   vXsrTMwsKSVoXnkYYgCvtb+k22ZeV2c8XkG2QHWoNpHSMRHVq9ZwowGa5
   JbjecJnzCplne9zVQb4oyl84pavvnokEA136h2AtFa6p8UayivKHTlVz/
   WXFlrvJm6HmsFMjuZq6/lI/Cf6wleJ+S6o2f9LDXLKsuG58joD1Qlxbsq
   Vkjp+PdRAUN83vnWBv5V83D7h1QmYB+GEJgt5Byg968T3DrS4ZQbri17E
   xy8kAJTkJIiUmfz4mz4b/uJ70r9zYdG6lRCvJnjfWnYeFHRhTmkreDPcI
   w==;
X-CSE-ConnectionGUID: +BbTD3zdTxyo2eL67Bv0iw==
X-CSE-MsgGUID: rMO3CSPCQAeBkYaPfnbP5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56779107"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="56779107"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 05:41:13 -0700
X-CSE-ConnectionGUID: UQdXABnaSBeBIwhfWWnBBw==
X-CSE-MsgGUID: ybwIDg4BQDq0wNlGnnqU0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="151134283"
Received: from dev2.igk.intel.com ([10.237.148.94])
  by fmviesa002.fm.intel.com with ESMTP; 07 Apr 2025 05:41:11 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 18/20] ASoC: Intel: avs: boards: Change rt5663 card name
Date: Mon,  7 Apr 2025 14:41:52 +0200
Message-Id: <20250407124154.1713039-19-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250407124154.1713039-1-amadeuszx.slawinski@linux.intel.com>
References: <20250407124154.1713039-1-amadeuszx.slawinski@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Rename FE from "avs_rt5663" to "AVS I2S ALC5663".

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/boards/rt5663.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/boards/rt5663.c b/sound/soc/intel/avs/boards/rt5663.c
index e3310b3268baa..37aa2559a8e3c 100644
--- a/sound/soc/intel/avs/boards/rt5663.c
+++ b/sound/soc/intel/avs/boards/rt5663.c
@@ -198,6 +198,7 @@ static int avs_rt5663_probe(struct platform_device *pdev)
 {
 	struct snd_soc_dai_link *dai_link;
 	struct snd_soc_acpi_mach *mach;
+	struct avs_mach_pdata *pdata;
 	struct snd_soc_card *card;
 	struct rt5663_private *priv;
 	struct device *dev = &pdev->dev;
@@ -206,6 +207,7 @@ static int avs_rt5663_probe(struct platform_device *pdev)
 
 	mach = dev_get_platdata(dev);
 	pname = mach->mach_params.platform;
+	pdata = mach->pdata;
 
 	ret = avs_mach_get_ssp_tdm(dev, mach, &ssp_port, &tdm_slot);
 	if (ret)
@@ -222,7 +224,12 @@ static int avs_rt5663_probe(struct platform_device *pdev)
 	if (!priv || !card)
 		return -ENOMEM;
 
-	card->name = "avs_rt5663";
+	if (pdata->obsolete_card_names) {
+		card->name = "avs_rt5663";
+	} else {
+		card->driver_name = "avs_rt5663";
+		card->long_name = card->name = "AVS I2S ALC5640";
+	}
 	card->dev = dev;
 	card->owner = THIS_MODULE;
 	card->suspend_pre = avs_card_suspend_pre;
-- 
2.34.1

