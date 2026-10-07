Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100701F192E
	for <linux-sound@vger.kernel.org>; Wed,  7 Oct 2026 08:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791362984; cv=none; b=oADYmmrB//rRg8m6afrDsOxUXHiYNq7bxgDW/kidV+t/MsLLickPmvIJ95yEnhCv2BqISBYtBuPwZU8ikGLvqwVw5opd+AIsA5+uO3w83BLORfuujjdsi6ctJ27+YDaIdKNQMw+X3a6J5GvFR1rydRtcaVVpOVJbgSXD2GBOfdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791362984; c=relaxed/simple;
	bh=Btxr+tG49wNpxF3sav++idcl66ZEbJ0Bk0ighg12Yv4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dXEWD/iPK0nXkwC7pS8R/BDpFs4o0yvkX2smbNFmW7gsJLl98/uGj6IR5mkQKbWW6CODvRD4EKaBDLte5tPP6KdNSfcBRMKVKGrCWhZrZMpkuBgKuUaA80Qyt3q7D+o967cSYltKrkY1NdzOUP1939st6mjJgxHWcuXtEZ4/50o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gQ2nRN3o; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gQ2nRN3o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791362983; x=1822898983;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Btxr+tG49wNpxF3sav++idcl66ZEbJ0Bk0ighg12Yv4=;
  b=gQ2nRN3oBw5kvb9nYqcijpqqdXZmEDoNpeobdJqu9CVpqyfGPnc+vjLy
   NaS6W5y+ySYaqvmK70mzDP2d6ZA7NI1gDRF0sbNZwuinen7JxrmkV/DRG
   LA3LxpwlPQ/BKNFfy9LEa///56bQY0zTL0LoteHyu+lA/zBnWAYukH7H6
   +zm0bTOXN1GttRZjizThCVo5mhO3Mo22E27e5iVRPryMLC8HJgspXEKrO
   HrbuI5noEcVDgE8Asg+SW3jPwrf7qhvT7IlVy6xu9RyEtIfBf2LLaCz/M
   u8sE8Z9wZN4O5ghihoGlM8isXkZV1tQOAIIOlJljD8naBCFX7BR0Ba+D2
   A==;
X-CSE-ConnectionGUID: ImgnYxZJTH+S3dDf82Wyqw==
X-CSE-MsgGUID: 8rHx3IBHT46yCQNpgj83Hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="113829"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="113829"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 01:49:43 -0700
X-CSE-ConnectionGUID: fkXFrIwiTGK7SJ56uClx9A==
X-CSE-MsgGUID: fsMa5EV/S7O2TbAPN9Fr+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="280670459"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.188])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 01:49:40 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: vkoul@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	srinivas.kandagatla@oss.qualcomm.com
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	daniel.baluta@nxp.com
Subject: [PATCH v5 02/28] ALSA: compress: register the open file with the card
Date: Wed,  7 Oct 2026 11:49:29 +0300
Message-ID: <20261007084955.1256-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261007084955.1256-1-peter.ujfalusi@linux.intel.com>
References: <20261007084955.1256-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The compress-offload device is the only ALSA character device family
which does not add its open files to the card's file list. Without it
the core cannot replace the file operations on disconnect, so syscalls
issued after the card is gone still reach the driver, and a card freed
with snd_card_free_when_closed() does not wait for the open compress
streams.

Call snd_card_file_add() at open and snd_card_file_remove() at release,
following the ordering used by the PCM, control, rawmidi and hwdep
devices.

Suggested-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/compress_offload.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index ba6cdfe64246..aaed865f8175 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -101,7 +101,14 @@ static int snd_compr_open(struct inode *inode, struct file *f)
 		return -ENODEV;
 	}
 
+	ret = snd_card_file_add(compr->card, f);
+	if (ret < 0) {
+		snd_card_unref(compr->card);
+		return ret;
+	}
+
 	if (!try_module_get(compr->card->module)) {
+		snd_card_file_remove(compr->card, f);
 		snd_card_unref(compr->card);
 		return -EFAULT;
 	}
@@ -144,6 +151,7 @@ static int snd_compr_open(struct inode *inode, struct file *f)
 		kfree(runtime);
 		kfree(data);
 		module_put(compr->card->module);
+		snd_card_file_remove(compr->card, f);
 	}
 	snd_card_unref(compr->card);
 	return ret;
@@ -153,6 +161,7 @@ static int snd_compr_free(struct inode *inode, struct file *f)
 {
 	struct snd_compr_file *data = f->private_data;
 	struct snd_compr_runtime *runtime = data->stream.runtime;
+	struct snd_compr *compr = data->stream.device;
 
 	cancel_delayed_work_sync(&data->stream.error_work);
 
@@ -174,6 +183,7 @@ static int snd_compr_free(struct inode *inode, struct file *f)
 	module_put(data->stream.device->card->module);
 	kfree(data->stream.runtime);
 	kfree(data);
+	snd_card_file_remove(compr->card, f);
 	return 0;
 }
 
-- 
2.56.0

