Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4386C145B1B
	for <linux-sound@vger.kernel.org>; Mon,  8 Apr 2024 19:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712605321; cv=none; b=Rn8PQT1bZVX23DOowKWcaETRGP3l4AKDSht9RhKo3g2mnlMgY9+2Y//i1HM1qk4iUNgtyuIFS4w+epTixCOczj7Z9DDU0tmVD3UuCUxBgMMGuuCdThAgdFLmOh/ZXFZZZCv/8Gb1WaPAxsCfpuI4KlEmKmOnmEbaBFvvB0LYbuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712605321; c=relaxed/simple;
	bh=4qtLV05lDjmjdiMZgc2NNyc/kZf7iepOU2DsqdEnfJY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q0oSDkAnlRBlNPkF1tTyyfUaKGXdaA6z87QEZWt8Oph37m8yistfdMNvY1TRk2wLyWpNGVnpbcvYDsnbfIe10X73ORpbPVJ6vElaypgmsCZMBHkie8TGgH3vKUdMxH1UdG/tp/y+yXbzeJbDAVtR67gnjGD6Mg0T8J6OO7wZvpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cfjxj2Gw; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cfjxj2Gw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712605320; x=1744141320;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4qtLV05lDjmjdiMZgc2NNyc/kZf7iepOU2DsqdEnfJY=;
  b=cfjxj2GweEcKiuBBNmx7k60NSYndKMaxMEJpBXkyAD6aYfhXKCZc1z42
   Hw2bkrFIIn6MSdZVV3k1s4VyahsIObFTTOgFUY8b2Si1ILDYY9/tLR8tR
   1Zjk7viLoCs7AhFwJdcc+OomgbpOX+DEDhE2AWt3qYjNPxu3w9AAr28sO
   hk2pEtZu1rKgLequ2t/mau8Hgbwtga5tvhuUkVTh5zkqHkBTqe12p2M7F
   eH6xQiY6Nf6iFsJv2BxBmJCtRAD1WqEa7DCFfc9s6epooPUmhCKcEN8TS
   9TZNVLIaLkv3wEMWl9Awqn3XpfhCgMOYoLuBi3TjNNyaVRs/4TzuX0EiA
   Q==;
X-CSE-ConnectionGUID: 7CJAlZNlR22FSs4/xtqisw==
X-CSE-MsgGUID: hBtdnYOUR2yn3AnnEOe7ew==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="30390464"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="30390464"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2024 12:41:58 -0700
X-CSE-ConnectionGUID: 5E3flx/pQbmZhNtM84gctg==
X-CSE-MsgGUID: ZN/MqZMzTjegvfrnUmxRjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="24776971"
Received: from aikuseru-mobl1.amr.corp.intel.com (HELO pbossart-mobl6.lan) ([10.212.40.188])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2024 12:41:58 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH 3/3] ASoC: SOF: debug: show firmware/topology prefix/names
Date: Mon,  8 Apr 2024 14:41:47 -0500
Message-Id: <20240408194147.28919-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240408194147.28919-1-pierre-louis.bossart@linux.intel.com>
References: <20240408194147.28919-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The SOF driver has multiple profiles to select firmware/topology
prefix/names depending on the platform and ipc_type, and each of those
fields can be overridden with kernel parameters. This results in some
cases in confusion on what configuration is actually used in a given
test.

We currently log the firmware and topology names in the kernel logs,
but there's been an ask to add the information in debugfs to simplify
test scripts used by developers and CI.

This isn't meant to be a stable ABI used by apps, changes will be
allowed as needed.

Closes: https://github.com/thesofproject/linux/issues/3867
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/debug.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/sound/soc/sof/debug.c b/sound/soc/sof/debug.c
index 937e51b02a24..cf282c8b18af 100644
--- a/sound/soc/sof/debug.c
+++ b/sound/soc/sof/debug.c
@@ -311,14 +311,32 @@ EXPORT_SYMBOL_GPL(snd_sof_dbg_memory_info_init);
 
 int snd_sof_dbg_init(struct snd_sof_dev *sdev)
 {
+	struct snd_sof_pdata *plat_data = sdev->pdata;
 	struct snd_sof_dsp_ops *ops = sof_ops(sdev);
 	const struct snd_sof_debugfs_map *map;
+	struct dentry *fw_profile;
 	int i;
 	int err;
 
 	/* use "sof" as top level debugFS dir */
 	sdev->debugfs_root = debugfs_create_dir("sof", NULL);
 
+	/* expose firmware/topology prefix/names for test purposes */
+	fw_profile = debugfs_create_dir("fw_profile", sdev->debugfs_root);
+
+	debugfs_create_str("fw_path", 0444, fw_profile,
+			   (char **)&plat_data->fw_filename_prefix);
+	debugfs_create_str("fw_lib_path", 0444, fw_profile,
+			   (char **)&plat_data->fw_lib_prefix);
+	debugfs_create_str("tplg_path", 0444, fw_profile,
+			   (char **)&plat_data->tplg_filename_prefix);
+	debugfs_create_str("fw_name", 0444, fw_profile,
+			   (char **)&plat_data->fw_filename);
+	debugfs_create_str("tplg_name", 0444, fw_profile,
+			   (char **)&plat_data->tplg_filename);
+	debugfs_create_u32("ipc_type", 0444, fw_profile,
+			   (u32 *)&plat_data->ipc_type);
+
 	/* init dfsentry list */
 	INIT_LIST_HEAD(&sdev->dfsentry_list);
 
-- 
2.40.1

