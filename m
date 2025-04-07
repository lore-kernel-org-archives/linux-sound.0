Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B22624EF73
	for <linux-sound@vger.kernel.org>; Mon,  7 Apr 2025 12:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744029671; cv=none; b=RY9804dQmkSDQtk3WiBV3vzy0PDyIkYwb2GufKezwdHD+c5V7PoQti8U3z1gmxiacdKgzxSk6icim8rg1kX1TDIDOMitQAHZGKlxDItJ6yTh/nR92MPwL0bjy5AwM/a26s4IEBxKdTiUF6KYK5imoIFkD6PeNGf5w3z7Sn8TaiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744029671; c=relaxed/simple;
	bh=LkDFLrW0bdiBGbtQG8jvvFWCtRZA8D1EY3l3/nmDFL4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mqQC2yLzwqu+olILaE9Crd7/ZP5Ibdpn1YxCudo360r8C47H3xxgir2XEvz0CW/JoLPGWo38GMdyGUCXSNNyJrwMAKmeLwypTnhv00BnaLwVtUk1a+dVT5PIAquJoLpXHDYJUPHqXyzx9o6n1/wDarYNhOT0DUY6eCbyNnVeA6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WznVaVfe; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WznVaVfe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744029671; x=1775565671;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LkDFLrW0bdiBGbtQG8jvvFWCtRZA8D1EY3l3/nmDFL4=;
  b=WznVaVfebTimXdAzi6arki5JQ/hWfAsvdjamURlnPKnSHuzopTO7j0WP
   +KU4XsPjLz84ISHrejDdCVNKe/2Ma+kyWy1lBJq7tRrEfir0BLZ/jvs5v
   QyObFtOT1KweKTUC/jU+l7sifQR2J1DA3V02yvquzauVTsuW11ufiTJX4
   GAQM2JpqDe3RbXLb9FmCo3h0gqdVms5FmKlAoxP20XtUinmmRBWNSa4t1
   oDTSFA5H8uGz0BjDhgwSVXNV+Blo4PFhxtwiq52hPUBMf+T+bTUD33TTS
   6JWPtD1cHIlXqJCWKcrJqb7h2nw1sAbVS+VtqW0fLfj+R2YPmp5AUqcvC
   w==;
X-CSE-ConnectionGUID: 7nxUkjzdR1uANp2fRiMpPg==
X-CSE-MsgGUID: TynBrHpeQjGPMFgsMKVqrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56779089"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="56779089"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 05:41:10 -0700
X-CSE-ConnectionGUID: 3Lq5kdB/Q0une7Q1yIfIhg==
X-CSE-MsgGUID: wzWQxKwXTL6htiKQ98BJjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="151134262"
Received: from dev2.igk.intel.com ([10.237.148.94])
  by fmviesa002.fm.intel.com with ESMTP; 07 Apr 2025 05:41:08 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 16/20] ASoC: Intel: avs: boards: Change rt298 card name
Date: Mon,  7 Apr 2025 14:41:50 +0200
Message-Id: <20250407124154.1713039-17-amadeuszx.slawinski@linux.intel.com>
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

Rename FE from "avs_rt298" to "AVS I2S ALC298".

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/boards/rt298.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/boards/rt298.c b/sound/soc/intel/avs/boards/rt298.c
index a7a463d6f8521..a7b4973cd481b 100644
--- a/sound/soc/intel/avs/boards/rt298.c
+++ b/sound/soc/intel/avs/boards/rt298.c
@@ -199,6 +199,7 @@ static int avs_rt298_probe(struct platform_device *pdev)
 {
 	struct snd_soc_dai_link *dai_link;
 	struct snd_soc_acpi_mach *mach;
+	struct avs_mach_pdata *pdata;
 	struct snd_soc_card *card;
 	struct snd_soc_jack *jack;
 	struct device *dev = &pdev->dev;
@@ -207,6 +208,7 @@ static int avs_rt298_probe(struct platform_device *pdev)
 
 	mach = dev_get_platdata(dev);
 	pname = mach->mach_params.platform;
+	pdata = mach->pdata;
 
 	ret = avs_mach_get_ssp_tdm(dev, mach, &ssp_port, &tdm_slot);
 	if (ret)
@@ -223,7 +225,12 @@ static int avs_rt298_probe(struct platform_device *pdev)
 	if (!jack || !card)
 		return -ENOMEM;
 
-	card->name = "avs_rt298";
+	if (pdata->obsolete_card_names) {
+		card->name = "avs_rt298";
+	} else {
+		card->driver_name = "avs_rt298";
+		card->long_name = card->name = "AVS I2S ALC298";
+	}
 	card->dev = dev;
 	card->owner = THIS_MODULE;
 	card->suspend_pre = avs_card_suspend_pre;
-- 
2.34.1

