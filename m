Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5E11465B4
	for <linux-sound@vger.kernel.org>; Fri,  5 Apr 2024 09:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712308099; cv=none; b=t3vyHPdwF447SwOTe5DDG4+KB9p+3sMlhlDsh1xzCQbz+jYC8eqd8ktqqBWLYBK+Rn9pJgD2UZL2ZVJzVxwjGuIC3higdvnHU/rwhYaY3yrdEPeBT0cDvZmFS6k/AAVGF8W2WFz/mn2v89wmkwyHO+izb1x/KiCIbWEEaJcyl98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712308099; c=relaxed/simple;
	bh=7o8XbCGvId3xPxY/IVwzWfcwOdaHK6AoLQbT+r4Ziy0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oIa5ArNT12bwIiavkyjvhQ2WpnWv4375buPwEETBGuPvjRKvWZHBPN3kgzWYWJ2V+1S2divjED8H5h9ysT4LJksH6Yux+4I1iROQ6q4e939vOu1UUWuz/fLFA+BONsY8imq5FYSyh/D5Oy/pP3vWdK7tgKQt5Vn/h6OP2jw7o9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SvT+TcVK; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SvT+TcVK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712308098; x=1743844098;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7o8XbCGvId3xPxY/IVwzWfcwOdaHK6AoLQbT+r4Ziy0=;
  b=SvT+TcVKMOW90Pgbk5G5YAxOHJva+bj6Di2sXsxnFmiYdkrd/jrbsQl4
   03Iw83K3gEUwqaPcpx/ljNJhZFfXWfgvmA1Ri29BHrjSU1oDVkZ4jhVD9
   POGLpwHXvQn0BpQXjZGAJein/SUgYnYeSBpWxdREyItBBrBnKldp+/4Ob
   bRSnImEmGA3jJk9Mbrd/NEZtj0c3FzwNLoTHRQcU3vj+4ouPmmaU/xT3j
   fPukVYw85TNa5So+1ae46BXTwxWTHNbArS1SkBEs2acFliFJsmqsrmlA1
   EpqpUDg2tdAlLUjTro740IqhSOkFJF9WORzdXnPvxjal5JR5Ij5WfcQ9u
   A==;
X-CSE-ConnectionGUID: 3e3SS7pSR3OL2o6CeUXG7A==
X-CSE-MsgGUID: aBLXQfWSSFqCNN7EKaNegw==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7787441"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="7787441"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 02:08:18 -0700
X-CSE-ConnectionGUID: ae6VOqs8TWSObeFA2A55zA==
X-CSE-MsgGUID: GkZWwU/wTmC+y2HQTvtLXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="19042430"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orviesa009.jf.intel.com with ESMTP; 05 Apr 2024 02:08:16 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 06/13] ASoC: Intel: avs: Replace risky functions with safer variants
Date: Fri,  5 Apr 2024 11:09:22 +0200
Message-Id: <20240405090929.1184068-7-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240405090929.1184068-1-cezary.rojewski@intel.com>
References: <20240405090929.1184068-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

strscpy() and snprintf() are the recommended equivalents of their
riskier friends.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/loader.c | 4 ++--
 sound/soc/intel/avs/pcm.c    | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/avs/loader.c b/sound/soc/intel/avs/loader.c
index 8e34d3536082..57370f0905dc 100644
--- a/sound/soc/intel/avs/loader.c
+++ b/sound/soc/intel/avs/loader.c
@@ -535,7 +535,7 @@ int avs_dsp_load_libraries(struct avs_dev *adev, struct avs_tplg_library *libs,
 		if (ret)
 			return ret;
 
-		strncpy(adev->lib_names[id], man->name, AVS_LIB_NAME_SIZE);
+		strscpy(adev->lib_names[id], man->name, AVS_LIB_NAME_SIZE);
 		id++;
 next_lib:
 		i++;
@@ -698,7 +698,7 @@ int avs_dsp_first_boot_firmware(struct avs_dev *adev)
 	}
 
 	/* basefw always occupies slot 0 */
-	strcpy(&adev->lib_names[0][0], "BASEFW");
+	strscpy(adev->lib_names[0], "BASEFW", AVS_LIB_NAME_SIZE);
 
 	ida_init(&adev->ppl_ida);
 
diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index 72f1bc3b7b1f..405de1d58178 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -1420,7 +1420,7 @@ static void avs_component_hda_unregister_dais(struct snd_soc_component *componen
 
 	mach = dev_get_platdata(component->card->dev);
 	codec = mach->pdata;
-	sprintf(name, "%s-cpu", dev_name(&codec->core.dev));
+	snprintf(name, sizeof(name), "%s-cpu", dev_name(&codec->core.dev));
 
 	for_each_component_dais_safe(component, dai, save) {
 		int stream;
-- 
2.25.1

