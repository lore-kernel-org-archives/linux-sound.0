Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124BB225A29
	for <linux-sound@vger.kernel.org>; Tue,  8 Jul 2025 10:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751971727; cv=none; b=JLAHbhtIoILIZfHuWAu0wJqJ3dAhe+dS/JWpeWq7MX2UHJYLf3Qw62O0mueH8GLb4WC2HeE3ElmLaCH8+V/weyni12gNd/uhX3mvF2tWGqul5ZK1c9uCmqyJuI5TPOl3DtgahmidBa2i3ZnDFccHVG4AKNNg2gLTA7Pki1JR+14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751971727; c=relaxed/simple;
	bh=92m9mlRsoIBypsZmr16RPvgZ6u2+Pc+rxiDDmPQ3jLw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=JGImRss9b5sGOSkorifL6+12h0OkOCOSqC9ov4VcQl9nU3YKMyu8OliA7TnDE0eAOWQaCOl20Mr+qtHHkBLFRK23qPkSUW3ZEFIh7tTgWOc4BTFFGbcLvnWiUj311flqncmlhsW/7iWhCgHrdBEY5pcz2nuAxMAi12llgAXgtsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kMaXr9ZG; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kMaXr9ZG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751971726; x=1783507726;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=92m9mlRsoIBypsZmr16RPvgZ6u2+Pc+rxiDDmPQ3jLw=;
  b=kMaXr9ZG4Wce9OwDZZNo25/aXq+DFghfYrfF2U4DVG9ABu6TcAERKqFQ
   X6BYIvvyTCV2wfbnwpwVDUVlfHYiC7UAEdig/2W1u/SHZVOSAJmn+SVhb
   3+ckIhrjJ0Et9JvNS+dgJ1KWSIryMaB04XI1yzIKhjmcJdLlywIJGf7FE
   jjkEu8WyUuC7RDYtp+SbxhQglNkHUf1jckbgZf7lfwriS3tW6Oorz5MAR
   pZeK+QFisSh4JabG+XNxWYgx06M1Z076gYzV8bEyUXw1hUHo2+Jzl572z
   9bcqxdQPMh65lpqBg//UsyqDVm/Zs2Y3xWRDxjsBRsNmJYsPri3Zyxu8t
   A==;
X-CSE-ConnectionGUID: iuE7DFxRTKWMW0Yzp1h5uw==
X-CSE-MsgGUID: gRezjz38Q4+CP8Els9P1Zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="64454989"
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; 
   d="scan'208";a="64454989"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2025 03:48:46 -0700
X-CSE-ConnectionGUID: jnxGAClYRwCnn/g8otdlRA==
X-CSE-MsgGUID: KYK7liKAQ8S/r+n6HSm6Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; 
   d="scan'208";a="161022031"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by fmviesa004.fm.intel.com with ESMTP; 08 Jul 2025 03:48:44 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH] ASoC: Intel: avs: Fix NULL ptr deref on rmmod
Date: Tue,  8 Jul 2025 12:50:09 +0200
Message-Id: <20250708105009.1883627-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When uloading snd_soc_avs module there is NULL pointer dereference.
It happens, because codec was moved into pdata and
avs_component_hda_unregister_dais() was not updated.

Fixes: 1581d5c68208 ("ASoC: Intel: avs: boards: Add Kconfig option for obsolete card names")
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/pcm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index ccf90428126d8..0efe490024b06 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -1570,11 +1570,13 @@ static void avs_component_hda_unregister_dais(struct snd_soc_component *componen
 {
 	struct snd_soc_acpi_mach *mach;
 	struct snd_soc_dai *dai, *save;
+	struct avs_mach_pdata *pdata;
 	struct hda_codec *codec;
 	char name[32];
 
 	mach = dev_get_platdata(component->card->dev);
-	codec = mach->pdata;
+	pdata = mach->pdata;
+	codec = pdata->codec;
 	snprintf(name, sizeof(name), "%s-cpu", dev_name(&codec->core.dev));
 
 	for_each_component_dais_safe(component, dai, save) {
-- 
2.34.1

