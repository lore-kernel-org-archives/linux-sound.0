Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADCDF4F218
	for <linux-sound@vger.kernel.org>; Mon,  6 May 2024 12:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714997433; cv=none; b=J/9QpX7LOUIaK/ZvQo1wCe8xqTaWDKIvnsYTotuJ42v2poJaavUD3+acFJq0/JxQf98K1SlTgnt72DpsFNeHnvqZqwKnO4Swl1vDccy7bcqHtOySdsOvIpbCV469FFWXiTevDG6zk5RZnkc8zlR3punxmPQaMUhKu+05muW9Gso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714997433; c=relaxed/simple;
	bh=5F831Z1wy0b/p56+Y1qBr7mGK/DpXpQ/FDOxaBHXJl4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=oOErqDyLqp9lL1WVHvqjVc3szF2CWkWVjVdayKyDoXIuTJc5u/2j5yLXsO0AS7QYQ7gZi7WY6NslEWSxnzaRoo8wIfioTBo+eyEYKw/0Ht8Mnp7ZB3aYdVUESnlQjV+zuFujVOBxSMq4jwCJRh2gnSxkCjn1/ELy1ziRxuhA6wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FhpMVlKB; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FhpMVlKB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714997432; x=1746533432;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5F831Z1wy0b/p56+Y1qBr7mGK/DpXpQ/FDOxaBHXJl4=;
  b=FhpMVlKBgitF7XKnVaWc8BMeXuRTj4476nbpOT0iSwoDpP3ZIlXhtNhx
   y7ZdRGTNQ5IpMHuV354Q31Ejqzm6iCw50evx2lDFKCynigfZpGafi8rcb
   wHuUz4ls5NYs34SUQnaRCcRP86VmYj5MwIZ9un6rtWOqpeI+gfJVkl3Cd
   qc3rZNL2LCsFZQf2HBv25Sw0Xn5P0n1FyJ+6C+ud8tME76556xTUqCN7N
   gK0GN73jG6c/mokm0eTncZFYrKdkoEC9KArM6rzr0MO70KV9VGQz52K5P
   VRhuBl2A3xkppAfQfNyWIQMo3oSojqPhf3Wze+sE3jyGNIgEVEB6d1Uui
   A==;
X-CSE-ConnectionGUID: P4+7/wTOQ122UtMarbZDEQ==
X-CSE-MsgGUID: IKB/j+phR7uKljFdiVRalw==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="10664982"
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; 
   d="scan'208";a="10664982"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 05:10:31 -0700
X-CSE-ConnectionGUID: E4K9X5sLSJ2mQXz5tyGIfQ==
X-CSE-MsgGUID: 6tFQnvHRQJ6C2eMALS2Yhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; 
   d="scan'208";a="59019862"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by orviesa002.jf.intel.com with ESMTP; 06 May 2024 05:10:29 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?=C5=81ukasz=20Majczak?= <lma@chromium.org>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH v2] ASoC: Intel: avs: boards: Properly name input device
Date: Mon,  6 May 2024 14:11:06 +0200
Message-Id: <20240506121106.3792340-1-amadeuszx.slawinski@linux.intel.com>
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

v2:
 - Rebase on top of correct tree.

---
 sound/soc/intel/avs/boards/es8336.c  | 2 +-
 sound/soc/intel/avs/boards/nau8825.c | 2 +-
 sound/soc/intel/avs/boards/rt274.c   | 3 ++-
 sound/soc/intel/avs/boards/rt286.c   | 4 ++--
 sound/soc/intel/avs/boards/rt298.c   | 4 ++--
 5 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/sound/soc/intel/avs/boards/es8336.c b/sound/soc/intel/avs/boards/es8336.c
index ff3bd15132694..f4919a6abc278 100644
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
 
-- 
2.34.1

