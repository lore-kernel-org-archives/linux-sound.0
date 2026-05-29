Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7233546C2
	for <linux-sound@vger.kernel.org>; Fri, 29 May 2026 01:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780018996; cv=none; b=S4iihtt8DnWi4f8HTEkrG/4XtkI3pWKMhV7rO68WZe1X+McbuAm0GDm9oUV51ngQw1cWm7KtmxVftBnUN/CKgz/zvoJ6Zx/10T+BhCNGAfeqE9BRHJmSIQu6FoiPA9rxDAmzsGKIVgHNoXkHzcs5V/S9kaySGdpwLK+w/k4CGNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780018996; c=relaxed/simple;
	bh=AWoiiVg1rdA2SQfpIy3hATGkwBiWWlqUSvkVnCLfKsg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Y9Shio8cw0FxduvRZroHpOyhXVzBmQlYwrdU9ZjBzUQLM/qwTghEwgn2oGxHPg0AWi57/TTHqUlo7FSGdyHet9WBSoAOxtqHm6FRqmQ/TQ/fBF11ovfhO3iJyrUD8vUnX7LjM//64Eq154N16KVZX7Fh3TmzO2Y48ydnpZXGSHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UjQAhWLI; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UjQAhWLI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780018995; x=1811554995;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=AWoiiVg1rdA2SQfpIy3hATGkwBiWWlqUSvkVnCLfKsg=;
  b=UjQAhWLIx0o14KjUAW7MLiBKkQmK3nkLfyuTJ8VDT+F5et32WlsvTBu/
   PuwubwpA4bif314C7KNaOHAaPjvu0HnuADqhT9RknuT53tzU+d7R4kyVe
   EtmO5SxUP/5x3z1Qpe6Qiv31e6fdBulAK74NvpILVI7xo6j9xqXtRP3b4
   PCfS0NhogI/K54pl38D5PtkZWBJ0aBLShurc2YOdEZJeGIxwAHlbS8LPU
   Vh0PIvPs06vL8Jqgr45W5xDXBH738b/OTud890TJVPOCU/zRi3gLmsfcF
   wLrNi9x3jBE7N/68zjnsWuPNxbPZVvmf/dY3S15RX9khYjYJhvkSTshcQ
   A==;
X-CSE-ConnectionGUID: VKjcLblKRSmF39kwGZOycA==
X-CSE-MsgGUID: 0aGKb2Z+THS69TVrF0IUUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="91982339"
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; 
   d="scan'208";a="91982339"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 18:43:14 -0700
X-CSE-ConnectionGUID: P6v2zhWnTxinxFkd17G+cw==
X-CSE-MsgGUID: G+2E+CE7RCO2G8GOLi95mA==
X-ExtLoop1: 1
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 18:43:12 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH] ASoC: sdw_utils: return -EPROBE_DEFER if components are not registered yet
Date: Fri, 29 May 2026 09:42:59 +0800
Message-ID: <20260529014259.2528048-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

commit 42d99857d6f0 ("ASoC: core: Move all users to deferrable card binding")
converted the -EPROBE_DEFER return value of snd_soc_bind_card() to 0
which results in the machine driver probe return 0 and will not be
called again when any component is not yet registered.
We get the right component name from the registered components
and use it in the dai links. It will lead to bind fail if the default
component name is used. Return -EPROBE_DEFER to allow the machine driver
probe again after the components are registered.

Suggested-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/sdw_utils/soc_sdw_utils.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index 9d0768f21ba4..681452bb89f2 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -1629,7 +1629,9 @@ const char *asoc_sdw_get_codec_name(struct device *dev,
 				__func__, component->name, dai_info->codec_name);
 			return devm_kstrdup(dev, component->name, GFP_KERNEL);
 		} else {
-			return devm_kstrdup(dev, dai_info->codec_name, GFP_KERNEL);
+			dev_dbg(dev, "%s component %s is not registered yet\n",
+				__func__, dai_info->codec_name);
+			return ERR_PTR(-EPROBE_DEFER);
 		}
 	}
 
@@ -2021,7 +2023,9 @@ int asoc_sdw_parse_sdw_endpoints(struct snd_soc_card *card,
 						codec_info->auxs[j].codec_name);
 					soc_aux->dlc.name = component->name;
 				} else {
-					soc_aux->dlc.name = codec_info->auxs[j].codec_name;
+					dev_dbg(dev, "%s the aux component %s is not registered yet\n",
+						__func__, codec_info->auxs[j].codec_name);
+					return -EPROBE_DEFER;
 				}
 				soc_aux++;
 			}
@@ -2121,6 +2125,8 @@ int asoc_sdw_parse_sdw_endpoints(struct snd_soc_card *card,
 
 				codec_name = asoc_sdw_get_codec_name(dev, dai_info,
 								     adr_link, i);
+				if (IS_ERR(codec_name))
+					return PTR_ERR(codec_name);
 				if (!codec_name)
 					return -ENOMEM;
 
-- 
2.43.0

