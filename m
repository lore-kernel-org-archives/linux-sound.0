Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21735C60F
	for <linux-sound@vger.kernel.org>; Fri, 23 Feb 2024 11:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708688702; cv=none; b=lhhH9p6WjhZM0H1rtiVx2KZED2VitkzHxpdFEsrrSgIhVgRseniv/x6a/32hAH8S+se0Nzm+keF90HzNNtAeadQPZIGS1bUCATmVkbbScsAVtuu2h/Ird5KxWMN5L2qF5Rp4okrwFtDws6s1NZBmfVHsj4q2RAdfxXTBUZTgtuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708688702; c=relaxed/simple;
	bh=qOmiPs34pCUiDLhuSNi0Chuyh6/urNG1iNBP3mIBQVU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=McDX1+ySM+U7/eMVxa712qJmF6B9T/2UCyy3mg/Ik/MElB18WhFWPgfhgZTqG05Mu8jL/Pk+nBDnnRFfORwn8OKYeivHO6/x20bJHows0iAo0QpyWnlWD9WexhPOaRErshYqXbqhrcYfo4koOnqgIXWiatc9cdVMayp1rGuCej8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OzmqeSI1; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OzmqeSI1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708688701; x=1740224701;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qOmiPs34pCUiDLhuSNi0Chuyh6/urNG1iNBP3mIBQVU=;
  b=OzmqeSI1q8ibPiCRmBhLf0Z6+xEWVqNtoRJQL/Q87JeN0H/GLUy5wV4R
   VWehkXJ7Och+8G10Uf9iitHnxwZ7xEAlVPI0aEoesX4gRjHgoSB0jF4YX
   1YsMJjzx/FI1munmnKzrwnHlWpU3u5vJf+5DnHRMAitn/bR5zth58XwhA
   M2OD8mftR9yFySJKpwNjasDYh67VElsYvOCF1M2+62gOaY/ZKLQp2kE7t
   0X1FlUdR0UUSbj4cbyUZgSz8BJokFdn1JPWqMMJujS9hwBOCxhNG5ZSLF
   TzhYvVSF5OmYFjZvIo8tjpORDxbYO1hKfm/OgEr9hFViuDcWsU42zfrSB
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="3504612"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="3504612"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2024 03:45:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="6092915"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmviesa006.fm.intel.com with ESMTP; 23 Feb 2024 03:44:57 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	jani.nikula@linux.intel.com,
	joonas.lahtinen@linux.intel.com,
	rodrigo.vivi@intel.com,
	tvrtko.ursulin@linux.intel.com,
	intel-gfx@lists.freedesktop.org,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 3/4] ASoC: codecs: hda: Cleanup error messages
Date: Fri, 23 Feb 2024 12:46:25 +0100
Message-Id: <20240223114626.1052784-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240223114626.1052784-1-cezary.rojewski@intel.com>
References: <20240223114626.1052784-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Be cohesive and use same pattern in each error message.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/codecs/hda.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/hda.c b/sound/soc/codecs/hda.c
index d9e7cd8aada2..8a9d0674555e 100644
--- a/sound/soc/codecs/hda.c
+++ b/sound/soc/codecs/hda.c
@@ -198,19 +198,19 @@ static int hda_codec_probe(struct snd_soc_component *component)
 	ret = snd_hda_codec_device_new(codec->bus, component->card->snd_card, hdev->addr, codec,
 				       false);
 	if (ret < 0) {
-		dev_err(&hdev->dev, "create hda codec failed: %d\n", ret);
+		dev_err(&hdev->dev, "codec create failed: %d\n", ret);
 		goto device_new_err;
 	}
 
 	ret = snd_hda_codec_set_name(codec, codec->preset->name);
 	if (ret < 0) {
-		dev_err(&hdev->dev, "name failed %s\n", codec->preset->name);
+		dev_err(&hdev->dev, "set name: %s failed: %d\n", codec->preset->name, ret);
 		goto err;
 	}
 
 	ret = snd_hdac_regmap_init(&codec->core);
 	if (ret < 0) {
-		dev_err(&hdev->dev, "regmap init failed\n");
+		dev_err(&hdev->dev, "regmap init failed: %d\n", ret);
 		goto err;
 	}
 
@@ -223,13 +223,13 @@ static int hda_codec_probe(struct snd_soc_component *component)
 
 	ret = patch(codec);
 	if (ret < 0) {
-		dev_err(&hdev->dev, "patch failed %d\n", ret);
+		dev_err(&hdev->dev, "codec init failed: %d\n", ret);
 		goto err;
 	}
 
 	ret = snd_hda_codec_parse_pcms(codec);
 	if (ret < 0) {
-		dev_err(&hdev->dev, "unable to map pcms to dai %d\n", ret);
+		dev_err(&hdev->dev, "unable to map pcms to dai: %d\n", ret);
 		goto parse_pcms_err;
 	}
 
-- 
2.25.1

