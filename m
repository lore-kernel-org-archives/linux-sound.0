Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367E57FBB1
	for <linux-sound@vger.kernel.org>; Tue,  2 Apr 2024 13:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712063198; cv=none; b=ZtASJZh/UxofcwF0K4Zlv6nnjCf2SASEyrd0APxk/DtXIHuFEv+KfR+OM2oJXPwSy/UT+dbDnrh3hwtk+AZ/VDKE9F8insAPwsq3C3yPInKZtH4olqOsjrnORgSK2/pkM6SjSV/sbmMWqx0aTNcQyaejHZQvTe1QqXTS/oqkRik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712063198; c=relaxed/simple;
	bh=0v6rngEthMxvAl73g2mRwH4CJnyfERYbHAvHtC5JS08=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=HSg8tSXRvrgb5VvomPIGBN4gzNQGkKgZnG/dwr+s9nHXDL2/nkrTl17raqfjsHsr/NCrO2qbfYnWPym4QCIxuyjz191xCaI6LBJHyr0MspnUDwNgmhD/udEwq8JopOjB8OyKn8BIo1h5yaCEwPuFTrI1qTC+M7YoSzXF66Alll8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ffQLlbpY; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ffQLlbpY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712063196; x=1743599196;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=0v6rngEthMxvAl73g2mRwH4CJnyfERYbHAvHtC5JS08=;
  b=ffQLlbpYRGMvc7FBJL2FHWUNcE2q260FrOdNTP+gCHmRdib6PzwPKgVI
   MR4AzTZpl25dPPF0ArwYx1kUKcyL/JkEDYO4jTJqrgPIRmlqVk7QdSSrO
   AxMeMa97DH8aSzslUpRj7gayhYxr7ccP1Uop46E213pa6Y6Dks+jQo2fb
   Zli7YO04iMHwr03Bw5/2hgFdHq9o1jb8R9u82a1spNyz6ov6v6VrCZiPt
   mstoWD64bPiCXbAW05YpO2yZdaz+2zK8POwf01pJrgQd9k46cvL5zUAzw
   /nSb3rKfrwiSNOkBaGI+W5U+9yAz4EI8nUzqfIvTP9ylyqQ8+TE0H/vOS
   w==;
X-CSE-ConnectionGUID: LCBDEAjQQZ68oHTFgqdiYw==
X-CSE-MsgGUID: a8WouUzURHKibMgjoxUG/g==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="7073912"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="7073912"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 06:06:27 -0700
X-CSE-ConnectionGUID: 4b+R3QH1TwGZaj92ZK/ZWg==
X-CSE-MsgGUID: 0oye78aMQV2AX3S3XvOsjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="22758988"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by orviesa005.jf.intel.com with ESMTP; 02 Apr 2024 06:06:25 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH] ASoC: Intel: avs: boards: Add modules description
Date: Tue,  2 Apr 2024 15:06:40 +0200
Message-Id: <20240402130640.3310999-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Modpost warns about missing module description, add it.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/boards/da7219.c    | 1 +
 sound/soc/intel/avs/boards/dmic.c      | 1 +
 sound/soc/intel/avs/boards/es8336.c    | 1 +
 sound/soc/intel/avs/boards/i2s_test.c  | 1 +
 sound/soc/intel/avs/boards/max98357a.c | 1 +
 sound/soc/intel/avs/boards/max98373.c  | 1 +
 sound/soc/intel/avs/boards/max98927.c  | 1 +
 sound/soc/intel/avs/boards/nau8825.c   | 1 +
 sound/soc/intel/avs/boards/probe.c     | 1 +
 sound/soc/intel/avs/boards/rt274.c     | 1 +
 sound/soc/intel/avs/boards/rt286.c     | 1 +
 sound/soc/intel/avs/boards/rt298.c     | 1 +
 sound/soc/intel/avs/boards/rt5514.c    | 1 +
 sound/soc/intel/avs/boards/rt5663.c    | 1 +
 sound/soc/intel/avs/boards/rt5682.c    | 1 +
 sound/soc/intel/avs/boards/ssm4567.c   | 1 +
 16 files changed, 16 insertions(+)

diff --git a/sound/soc/intel/avs/boards/da7219.c b/sound/soc/intel/avs/boards/da7219.c
index c018f84fe0252..fc072dc58968c 100644
--- a/sound/soc/intel/avs/boards/da7219.c
+++ b/sound/soc/intel/avs/boards/da7219.c
@@ -296,5 +296,6 @@ static struct platform_driver avs_da7219_driver = {
 
 module_platform_driver(avs_da7219_driver);
 
+MODULE_DESCRIPTION("Intel da7219 machine driver");
 MODULE_AUTHOR("Cezary Rojewski <cezary.rojewski@intel.com>");
 MODULE_LICENSE("GPL");
diff --git a/sound/soc/intel/avs/boards/dmic.c b/sound/soc/intel/avs/boards/dmic.c
index ba2bc7f689eb6..d9e5e85f52335 100644
--- a/sound/soc/intel/avs/boards/dmic.c
+++ b/sound/soc/intel/avs/boards/dmic.c
@@ -96,4 +96,5 @@ static struct platform_driver avs_dmic_driver = {
 
 module_platform_driver(avs_dmic_driver);
 
+MODULE_DESCRIPTION("Intel DMIC machine driver");
 MODULE_LICENSE("GPL");
diff --git a/sound/soc/intel/avs/boards/es8336.c b/sound/soc/intel/avs/boards/es8336.c
index 1090082e7d5bf..5c90a60075773 100644
--- a/sound/soc/intel/avs/boards/es8336.c
+++ b/sound/soc/intel/avs/boards/es8336.c
@@ -326,4 +326,5 @@ static struct platform_driver avs_es8336_driver = {
 
 module_platform_driver(avs_es8336_driver);
 
+MODULE_DESCRIPTION("Intel es8336 machine driver");
 MODULE_LICENSE("GPL");
diff --git a/sound/soc/intel/avs/boards/i2s_test.c b/sound/soc/intel/avs/boards/i2s_test.c
index 282256d18cc69..d419556856643 100644
--- a/sound/soc/intel/avs/boards/i2s_test.c
+++ b/sound/soc/intel/avs/boards/i2s_test.c
@@ -125,4 +125,5 @@ static struct platform_driver avs_i2s_test_driver = {
 
 module_platform_driver(avs_i2s_test_driver);
 
+MODULE_DESCRIPTION("Intel i2s test machine driver");
 MODULE_LICENSE("GPL");
diff --git a/sound/soc/intel/avs/boards/max98357a.c b/sound/soc/intel/avs/boards/max98357a.c
index a83b95f25129f..1ff85e4d8e160 100644
--- a/sound/soc/intel/avs/boards/max98357a.c
+++ b/sound/soc/intel/avs/boards/max98357a.c
@@ -154,4 +154,5 @@ static struct platform_driver avs_max98357a_driver = {
 
 module_platform_driver(avs_max98357a_driver)
 
+MODULE_DESCRIPTION("Intel max98357a machine driver");
 MODULE_LICENSE("GPL");
diff --git a/sound/soc/intel/avs/boards/max98373.c b/sound/soc/intel/avs/boards/max98373.c
index 3b980a025e6f6..8d31586b73eae 100644
--- a/sound/soc/intel/avs/boards/max98373.c
+++ b/sound/soc/intel/avs/boards/max98373.c
@@ -211,4 +211,5 @@ static struct platform_driver avs_max98373_driver = {
 
 module_platform_driver(avs_max98373_driver)
 
+MODULE_DESCRIPTION("Intel max98373 machine driver");
 MODULE_LICENSE("GPL");
diff --git a/sound/soc/intel/avs/boards/max98927.c b/sound/soc/intel/avs/boards/max98927.c
index 86dd2b228df3a..572ec58073d06 100644
--- a/sound/soc/intel/avs/boards/max98927.c
+++ b/sound/soc/intel/avs/boards/max98927.c
@@ -208,4 +208,5 @@ static struct platform_driver avs_max98927_driver = {
 
 module_platform_driver(avs_max98927_driver)
 
+MODULE_DESCRIPTION("Intel max98927 machine driver");
 MODULE_LICENSE("GPL");
diff --git a/sound/soc/intel/avs/boards/nau8825.c b/sound/soc/intel/avs/boards/nau8825.c
index 1c1e2083f474d..55db75efae414 100644
--- a/sound/soc/intel/avs/boards/nau8825.c
+++ b/sound/soc/intel/avs/boards/nau8825.c
@@ -313,4 +313,5 @@ static struct platform_driver avs_nau8825_driver = {
 
 module_platform_driver(avs_nau8825_driver)
 
+MODULE_DESCRIPTION("Intel nau8825 machine driver");
 MODULE_LICENSE("GPL");
diff --git a/sound/soc/intel/avs/boards/probe.c b/sound/soc/intel/avs/boards/probe.c
index a9469b5ecb402..8be6887bbc6e8 100644
--- a/sound/soc/intel/avs/boards/probe.c
+++ b/sound/soc/intel/avs/boards/probe.c
@@ -69,4 +69,5 @@ static struct platform_driver avs_probe_mb_driver = {
 
 module_platform_driver(avs_probe_mb_driver);
 
+MODULE_DESCRIPTION("Intel probe machine driver");
 MODULE_LICENSE("GPL");
diff --git a/sound/soc/intel/avs/boards/rt274.c b/sound/soc/intel/avs/boards/rt274.c
index bfcb8845fd15d..1cf5242160875 100644
--- a/sound/soc/intel/avs/boards/rt274.c
+++ b/sound/soc/intel/avs/boards/rt274.c
@@ -276,4 +276,5 @@ static struct platform_driver avs_rt274_driver = {
 
 module_platform_driver(avs_rt274_driver);
 
+MODULE_DESCRIPTION("Intel rt274 machine driver");
 MODULE_LICENSE("GPL");
diff --git a/sound/soc/intel/avs/boards/rt286.c b/sound/soc/intel/avs/boards/rt286.c
index 28d7d86b1cc99..4740bba105703 100644
--- a/sound/soc/intel/avs/boards/rt286.c
+++ b/sound/soc/intel/avs/boards/rt286.c
@@ -247,4 +247,5 @@ static struct platform_driver avs_rt286_driver = {
 
 module_platform_driver(avs_rt286_driver);
 
+MODULE_DESCRIPTION("Intel rt286 machine driver");
 MODULE_LICENSE("GPL");
diff --git a/sound/soc/intel/avs/boards/rt298.c b/sound/soc/intel/avs/boards/rt298.c
index 80f490b9e1184..6e409e29f6974 100644
--- a/sound/soc/intel/avs/boards/rt298.c
+++ b/sound/soc/intel/avs/boards/rt298.c
@@ -266,4 +266,5 @@ static struct platform_driver avs_rt298_driver = {
 
 module_platform_driver(avs_rt298_driver);
 
+MODULE_DESCRIPTION("Intel rt298 machine driver");
 MODULE_LICENSE("GPL");
diff --git a/sound/soc/intel/avs/boards/rt5514.c b/sound/soc/intel/avs/boards/rt5514.c
index 60105f453ae23..097ae5f73241e 100644
--- a/sound/soc/intel/avs/boards/rt5514.c
+++ b/sound/soc/intel/avs/boards/rt5514.c
@@ -192,4 +192,5 @@ static struct platform_driver avs_rt5514_driver = {
 
 module_platform_driver(avs_rt5514_driver);
 
+MODULE_DESCRIPTION("Intel rt5514 machine driver");
 MODULE_LICENSE("GPL");
diff --git a/sound/soc/intel/avs/boards/rt5663.c b/sound/soc/intel/avs/boards/rt5663.c
index b4762c2a7bf2d..1880c315cc4d1 100644
--- a/sound/soc/intel/avs/boards/rt5663.c
+++ b/sound/soc/intel/avs/boards/rt5663.c
@@ -265,4 +265,5 @@ static struct platform_driver avs_rt5663_driver = {
 
 module_platform_driver(avs_rt5663_driver);
 
+MODULE_DESCRIPTION("Intel rt5663 machine driver");
 MODULE_LICENSE("GPL");
diff --git a/sound/soc/intel/avs/boards/rt5682.c b/sound/soc/intel/avs/boards/rt5682.c
index 243f979fda98a..594a971ded9eb 100644
--- a/sound/soc/intel/avs/boards/rt5682.c
+++ b/sound/soc/intel/avs/boards/rt5682.c
@@ -341,5 +341,6 @@ static struct platform_driver avs_rt5682_driver = {
 
 module_platform_driver(avs_rt5682_driver)
 
+MODULE_DESCRIPTION("Intel rt5682 machine driver");
 MODULE_AUTHOR("Cezary Rojewski <cezary.rojewski@intel.com>");
 MODULE_LICENSE("GPL");
diff --git a/sound/soc/intel/avs/boards/ssm4567.c b/sound/soc/intel/avs/boards/ssm4567.c
index abb87bb88fffe..9e78a3b912087 100644
--- a/sound/soc/intel/avs/boards/ssm4567.c
+++ b/sound/soc/intel/avs/boards/ssm4567.c
@@ -197,4 +197,5 @@ static struct platform_driver avs_ssm4567_driver = {
 
 module_platform_driver(avs_ssm4567_driver)
 
+MODULE_DESCRIPTION("Intel ssm4567 machine driver");
 MODULE_LICENSE("GPL");
-- 
2.34.1

