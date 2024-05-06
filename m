Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E116142E8F
	for <linux-sound@vger.kernel.org>; Mon,  6 May 2024 11:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714996237; cv=none; b=FmbcuWNGK72nOut9qh02G8SCqHvu+a46RYPTukrS4qxY8hU5SR8zJsEDWlgV0ppY5WQhbuvxU4y+GBdpbgoh1qF0Ou+KyUwrf4Vjq/ZEBGV2iZbmozrO6sXWsdPObuEfG/2x0MaWSwvcjuu95cwZhTvCvEoVQKJhjKtT+zEJpiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714996237; c=relaxed/simple;
	bh=mBLK0MUQ/HcVL9wLI47JM6TB+GZw4U2WKLwf5kIZPPw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=ZGD/HTH45qol9QZqxu+SHE4iHOFe8BD0GQZaaPYina9+Yam1YtxIZ7XyBXk5hQsKebWTbncjfvktk2Z3ag0lVAciYgbqVylpYGF+/aj2xio0s4/GniIMoRyJ90b4Ua5rhR7YZgREyIUw9ZoOnynaTTzY//2itq/isimGa1TncCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n6/g+zW5; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n6/g+zW5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714996236; x=1746532236;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mBLK0MUQ/HcVL9wLI47JM6TB+GZw4U2WKLwf5kIZPPw=;
  b=n6/g+zW5zaqsYS7P/+SnlWoCz5DqIj7HPagT9pVq7rLiTKpb9I9bW3ZN
   iYlbJ7KKHFumptWZGVSoyiR8wBjyARmupjf0oNBpPrNAJdC9wyeyslY4Q
   MNR4Ck6aZEGKFapznD/NrZ2GBPfGtyZus2yNGsehEP2HFATzH1obJubft
   QoBdSNLtYWEH9KnD9aSMsXC3Ao/hNF/0YFi2yD4r6szUsSz4aPtT8YeIM
   cG0O/st04YhXpSGwlZo8sYsr3wTJGsTWf73+vewej2jiFj8YNRgLa98pc
   zN5oPaEJiKlPB/69pQLp77eEm4bUhHV7dAPETUAXXKY2QrwQTe0LYM2mr
   A==;
X-CSE-ConnectionGUID: Mm+uJoiHSHaa78j5jfSd9Q==
X-CSE-MsgGUID: e0LvOdUBRymrETYT5rS3mA==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="36122424"
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; 
   d="scan'208";a="36122424"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 04:50:35 -0700
X-CSE-ConnectionGUID: Zd9krN7ySumkUpLdbxTDdQ==
X-CSE-MsgGUID: Z6NW9O9sQsu5mHDzipVQlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; 
   d="scan'208";a="32814693"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by orviesa003.jf.intel.com with ESMTP; 06 May 2024 04:50:33 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?=C5=81ukasz=20Majczak?= <lma@chromium.org>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH] ASoC: Intel: avs: boards: Properly name input device
Date: Mon,  6 May 2024 13:51:11 +0200
Message-Id: <20240506115111.3717095-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Machine boards expose input device for use with userspace. Current name
in some cases is incorrect, fix it.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/boards/es8336.c  | 2 +-
 sound/soc/intel/avs/boards/nau8825.c | 2 +-
 sound/soc/intel/avs/boards/rt274.c   | 3 ++-
 sound/soc/intel/avs/boards/rt286.c   | 4 ++--
 sound/soc/intel/avs/boards/rt298.c   | 4 ++--
 sound/soc/intel/avs/boards/rt5640.c  | 3 ++-
 6 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/sound/soc/intel/avs/boards/es8336.c b/sound/soc/intel/avs/boards/es8336.c
index 3d77bc3344702..6440a46e795ec 100644
--- a/sound/soc/intel/avs/boards/es8336.c
+++ b/sound/soc/intel/avs/boards/es8336.c
@@ -113,7 +113,7 @@ static int avs_es8336_codec_init(struct snd_soc_pcm_runtime *runtime)
 	if (!pins)
 		return -ENOMEM;
 
-	ret = snd_soc_card_jack_new_pins(card, "Headset", SND_JACK_HEADSET | SND_JACK_BTN_0,
+	ret = snd_soc_card_jack_new_pins(card, "Headset Jack", SND_JACK_HEADSET | SND_JACK_BTN_0,
 					 &data->jack, pins, num_pins);
 	if (ret)
 		return ret;
diff --git a/sound/soc/intel/avs/boards/nau8825.c b/sound/soc/intel/avs/boards/nau8825.c
index 3164745b15167..eef718c6b8ad9 100644
--- a/sound/soc/intel/avs/boards/nau8825.c
+++ b/sound/soc/intel/avs/boards/nau8825.c
@@ -96,7 +96,7 @@ static int avs_nau8825_codec_init(struct snd_soc_pcm_runtime *runtime)
 	 * 4 buttons here map to the google Reference headset.
 	 * The use of these buttons can be decided by the user space.
 	 */
-	ret = snd_soc_card_jack_new_pins(card, "Headset", SND_JACK_HEADSET | SND_JACK_BTN_0 |
+	ret = snd_soc_card_jack_new_pins(card, "Headset Jack", SND_JACK_HEADSET | SND_JACK_BTN_0 |
 					 SND_JACK_BTN_1 | SND_JACK_BTN_2 | SND_JACK_BTN_3,
 					 jack, pins, num_pins);
 	if (ret)
diff --git a/sound/soc/intel/avs/boards/rt274.c b/sound/soc/intel/avs/boards/rt274.c
index e3aa28780df5a..51ebc790c6b4d 100644
--- a/sound/soc/intel/avs/boards/rt274.c
+++ b/sound/soc/intel/avs/boards/rt274.c
@@ -102,7 +102,8 @@ static int avs_rt274_codec_init(struct snd_soc_pcm_runtime *runtime)
 	if (!pins)
 		return -ENOMEM;
 
-	ret = snd_soc_card_jack_new_pins(card, "Headset", SND_JACK_HEADSET, jack, pins, num_pins);
+	ret = snd_soc_card_jack_new_pins(card, "Headset Jack", SND_JACK_HEADSET, jack, pins,
+					 num_pins);
 	if (ret)
 		return ret;
 
diff --git a/sound/soc/intel/avs/boards/rt286.c b/sound/soc/intel/avs/boards/rt286.c
index d24316fc4db9c..67fd362962c40 100644
--- a/sound/soc/intel/avs/boards/rt286.c
+++ b/sound/soc/intel/avs/boards/rt286.c
@@ -63,8 +63,8 @@ static int avs_rt286_codec_init(struct snd_soc_pcm_runtime *runtime)
 	if (!pins)
 		return -ENOMEM;
 
-	ret = snd_soc_card_jack_new_pins(card, "Headset", SND_JACK_HEADSET | SND_JACK_BTN_0, jack,
-					 pins, num_pins);
+	ret = snd_soc_card_jack_new_pins(card, "Headset Jack", SND_JACK_HEADSET | SND_JACK_BTN_0,
+					 jack, pins, num_pins);
 	if (ret)
 		return ret;
 
diff --git a/sound/soc/intel/avs/boards/rt298.c b/sound/soc/intel/avs/boards/rt298.c
index 7fd28544f7869..1003e8689eacc 100644
--- a/sound/soc/intel/avs/boards/rt298.c
+++ b/sound/soc/intel/avs/boards/rt298.c
@@ -74,8 +74,8 @@ static int avs_rt298_codec_init(struct snd_soc_pcm_runtime *runtime)
 	if (!pins)
 		return -ENOMEM;
 
-	ret = snd_soc_card_jack_new_pins(card, "Headset", SND_JACK_HEADSET | SND_JACK_BTN_0, jack,
-					 pins, num_pins);
+	ret = snd_soc_card_jack_new_pins(card, "Headset Jack", SND_JACK_HEADSET | SND_JACK_BTN_0,
+					 jack, pins, num_pins);
 	if (ret)
 		return ret;
 
diff --git a/sound/soc/intel/avs/boards/rt5640.c b/sound/soc/intel/avs/boards/rt5640.c
index 07cd8db4e6c2b..7c94680c4b3ad 100644
--- a/sound/soc/intel/avs/boards/rt5640.c
+++ b/sound/soc/intel/avs/boards/rt5640.c
@@ -62,7 +62,8 @@ static int avs_rt5640_codec_init(struct snd_soc_pcm_runtime *runtime)
 	if (!pins)
 		return -ENOMEM;
 
-	ret = snd_soc_card_jack_new_pins(card, "Headset", SND_JACK_HEADSET, jack, pins, num_pins);
+	ret = snd_soc_card_jack_new_pins(card, "Headset Jack", SND_JACK_HEADSET, jack, pins,
+					 num_pins);
 	if (ret)
 		return ret;
 
-- 
2.34.1

