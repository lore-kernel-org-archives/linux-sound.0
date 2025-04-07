Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8065230981
	for <linux-sound@vger.kernel.org>; Mon,  7 Apr 2025 12:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744029665; cv=none; b=tspksQQmTle5HIRZtObjcf67mvhF3bDtfZv59ySn2HHgIaHC4eO72ElA/B3bwlRrapNlzbKPZLInkFK8YnlOSnydRDPi21pdcuyrAKNzvcOoY0tIBmpaaaXUzam9NIbbRBrC0ywZTNfFZVrvI/6jcJ/HYUhGYRlFJmV1ch9OoHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744029665; c=relaxed/simple;
	bh=r+hsD7ymnvF0yiB95T96lnnpSTK7C4IH7a4OZREcP4Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iXaYjDKB+edNUZGTgEdAPnoomKQEziZFbzvzMTDmpFutu+Sl3ktZa+gYHHAeLHKbusyu3vTKeF3SPdUOJNJsvX9h5e02WtZjiMfXvofINX+yqEyq6P0suY9PyJbW9gcDGbJwTXdUVyqZMcFT+sg3qX+j3loZJsA5UJw0WQc3wyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LYOadws0; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LYOadws0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744029664; x=1775565664;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=r+hsD7ymnvF0yiB95T96lnnpSTK7C4IH7a4OZREcP4Y=;
  b=LYOadws0RkOkVl54kC5PiYHHejNfODOsFOJ+oLBpB2VgPOOpkrf2JRbl
   3KWOY+gZXuxl2tWLNvUacQNKpjJhjviQUAdsKWG4VTJMl/0pRptvC8YtF
   +wIuoBYUOiy1v4VDI+xviKXEQoZH5f0mQR+/MhcbaA7Usvv93UkXLsngo
   rxMo3wY82V2BmYuHCsstcj36mebRbChysKtrNiO9l9bISReRF1Lnks8QS
   TE1i/BYhkhgdcxWFGG0xAfglrOMFdK5eiVA2kMU8LtwZ9ETzxZaIkgNLf
   8CRQCvkncebeeSFrqv1WrCsqhBWwr0XYqMDeAJi58W1pJ+OkKzfOVq1Va
   g==;
X-CSE-ConnectionGUID: MzQqodunQFCcnS2MkJH1YQ==
X-CSE-MsgGUID: VUDeMaxvSwGn0XDpOGXFoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56779050"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="56779050"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 05:41:03 -0700
X-CSE-ConnectionGUID: aW6yzHmWR7C1u0VNFCKV6A==
X-CSE-MsgGUID: piomnBe+ShKLjK2GSY4NEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="151134193"
Received: from dev2.igk.intel.com ([10.237.148.94])
  by fmviesa002.fm.intel.com with ESMTP; 07 Apr 2025 05:41:01 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 12/20] ASoC: Intel: avs: boards: Change pcm3168a card name
Date: Mon,  7 Apr 2025 14:41:46 +0200
Message-Id: <20250407124154.1713039-13-amadeuszx.slawinski@linux.intel.com>
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

Rename FE from "avs_pcm3168a" to "AVS I2S PCM3168A".

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/boards/pcm3168a.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/boards/pcm3168a.c b/sound/soc/intel/avs/boards/pcm3168a.c
index 5d0e7a5bdc749..1ebbc92df6b63 100644
--- a/sound/soc/intel/avs/boards/pcm3168a.c
+++ b/sound/soc/intel/avs/boards/pcm3168a.c
@@ -11,6 +11,8 @@
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
+#include <sound/soc-acpi.h>
+#include "../utils.h"
 
 static const struct snd_soc_dapm_widget card_widgets[] = {
 	SND_SOC_DAPM_HP("CPB Stereo HP 1", NULL),
@@ -95,10 +97,15 @@ static int avs_create_dai_links(struct device *dev, struct snd_soc_dai_link **li
 
 static int avs_pcm3168a_probe(struct platform_device *pdev)
 {
+	struct snd_soc_acpi_mach *mach;
+	struct avs_mach_pdata *pdata;
 	struct device *dev = &pdev->dev;
 	struct snd_soc_card *card;
 	int ret;
 
+	mach = dev_get_platdata(dev);
+	pdata = mach->pdata;
+
 	card = devm_kzalloc(dev, sizeof(*card), GFP_KERNEL);
 	if (!card)
 		return -ENOMEM;
@@ -107,7 +114,12 @@ static int avs_pcm3168a_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	card->name = "avs_pcm3168a";
+	if (pdata->obsolete_card_names) {
+		card->name = "avs_pcm3168a";
+	} else {
+		card->driver_name = "avs_pcm3168a";
+		card->long_name = card->name = "AVS I2S PCM3168A";
+	}
 	card->dev = dev;
 	card->owner = THIS_MODULE;
 	card->dapm_widgets = card_widgets;
-- 
2.34.1

