Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9AB3B4EA5
	for <linux-sound@vger.kernel.org>; Fri,  5 Jun 2026 10:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780654715; cv=none; b=EUEBmH7mxOxrXI4d4hS4nr/SQV64JnNtclE1vxZ3db0VPafFaIxIWHx/AzT4qnhXGCN5TSniFeSfcZWo8RfBY4Z03o9BwX6Y5/vkZQvLgr1OqjkOLDeJ0D9t9r89GA6RCAOQm5ai+K/ayh7Sh6Nezx7DicS1SaIOy0DzDOjmot0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780654715; c=relaxed/simple;
	bh=2ZQnwWjkQ8LaUQYlRS0V7AaW75YAR3ldmYFC4dvY8lA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GomHUu+EDXVNaaRKbsxGo0Bf2gJ/hYrA8huRePrhnpCMM0neJXflpReIvAw5k1H/56vFanguDrQLU9qjRy82kErcYh8poLBWNMIQkW+vfCF+5rJUAe1RaUuOTy98pu1lk3epqxfExo1Sa9gkwSj/q3mjEcoAH6i+C7Hz8CaNcbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nfZT/akU; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nfZT/akU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780654714; x=1812190714;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2ZQnwWjkQ8LaUQYlRS0V7AaW75YAR3ldmYFC4dvY8lA=;
  b=nfZT/akUZnweq22LeddLEJcTMgxrIJFi0qe6M/xJIYV/jMDKqP8gX0V4
   qEizTwDdJ6ciasWboM/DUrQVlbzLDn1yA4gJUkC1JUTZ3wDOIbAKg+2D+
   lXLqEDgiH+uto8VfP07Bj4o7+9fEmuBM+Jzo8US/hVrhGkMZSXbQ8VQAv
   gPta+mmY8V3MFetx9BezUP1rq4clHMEJv+d14A2md5USgYRCKC8O5uQt9
   zsubBpb9UazIrUmhiwbVhPKzGnwMb5iEw/wZ9JN+PZnqP6N7rh91FySWe
   rSrj3MEfCF4lentXvDjlRPwRFauc29Kexrgt+D/I/Uu75+i/dv4cZ+rGS
   g==;
X-CSE-ConnectionGUID: +w/EV4ZtRWaERUYDa/eVyg==
X-CSE-MsgGUID: UYFe58R5SCeaPjLv8dxCEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="81610304"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="81610304"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 03:18:34 -0700
X-CSE-ConnectionGUID: A4qKAogBQqG/je/YzQyX/w==
X-CSE-MsgGUID: 3Bpp0qiMQ7+AqgUtJ8GtSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="243972175"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 03:18:33 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 2/2] ASoC: SOF: Intel: Use codec_info_list.is_amp directly
Date: Fri,  5 Jun 2026 18:18:05 +0800
Message-ID: <20260605101805.121428-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605101805.121428-1-yung-chuan.liao@linux.intel.com>
References: <20260605101805.121428-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Now we set is_amp to all amp type codecs. We can use the flag directly
instead of using a local flag to check if the codec is an AMP type.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/sof/intel/hda.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 8662b422eb80..dc85903b8d46 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -1159,7 +1159,6 @@ static struct snd_soc_acpi_adr_device *find_acpi_adr_device(struct device *dev,
 	struct snd_soc_acpi_adr_device *adr_dev;
 	const char *name_prefix = "";
 	int index = link->num_adr;
-	bool is_amp = true; /* Set it to false if the codec wiah any NON-AMP DAI type */
 	int ep_index = 0;
 	int i, j;
 
@@ -1216,7 +1215,6 @@ static struct snd_soc_acpi_adr_device *find_acpi_adr_device(struct device *dev,
 				endpoints[ep_index].aggregated = 0;
 				endpoints[ep_index].group_id = 0;
 				endpoints[ep_index].group_position = 0;
-				is_amp = false;
 			}
 			ep_index++;
 		}
@@ -1230,16 +1228,6 @@ static struct snd_soc_acpi_adr_device *find_acpi_adr_device(struct device *dev,
 		return NULL;
 	}
 
-	/*
-	 * codec_info_list[].is_amp is a codec-level override: for multi-function
-	 * codecs we must treat the whole codec as an AMP when it is described as
-	 * such in the codec info table, even if some endpoints were detected as
-	 * non-AMP above. Callers/UCM rely on this to keep name_prefix and AMP
-	 * indexing stable and backwards compatible.
-	 */
-	if (codec_info_list[i].is_amp)
-		is_amp = true;
-
 	adr_dev[index].adr = ((u64)sdw_device->id.class_id & 0xFF) |
 			((u64)sdw_device->id.part_id & 0xFFFF) << 8 |
 			((u64)sdw_device->id.mfg_id & 0xFFFF) << 24 |
@@ -1247,7 +1235,7 @@ static struct snd_soc_acpi_adr_device *find_acpi_adr_device(struct device *dev,
 			((u64)(sdw_device->id.sdw_version & 0xF) << 44) |
 			((u64)(sdw_device->bus->link_id & 0xF) << 48);
 
-	if (!is_amp) {
+	if (!codec_info_list[i].is_amp) {
 		/* For non-amp codecs, get name_prefix from codec_info_list[] */
 		adr_dev[index].name_prefix = devm_kasprintf(dev, GFP_KERNEL, "%s", name_prefix);
 		goto done_name_prefix;
-- 
2.43.0

