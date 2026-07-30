Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802963976BB
	for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 12:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785415879; cv=none; b=mTIavlk0whFx3M1qB9+zBWM1tLVvckTJZFwO/XXMVeDlagoDioN29BSOr6iJIMh6bJzgWsTR1iZaMtQRNCchk21Iq6irpS8BbzPERc/xXGY4mAYtX6W65NTH7xgvV1NOBmDJTVRo3878HWK72uNkAYfdlXOhJjq0mSDnDDp8/Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785415879; c=relaxed/simple;
	bh=5HVLMpuF3lBbGfawHvS/HUh/V54Nubz9fajeKF2BFEY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u6jQ/n6p4hIdQrOBiIXZgoiqD6IWNCb0b30hVF0C3TyqS1BmRhsMRYP7bIMPYshzhIjPGoh259O4LbwCDN+R1EW0ur4YZ8F0Wl7gcEOrDgh3r045MrKdcrx8uqL3pEeyb+6FryxJf6UxTtU2QueW/ASpeTx0jNxCUyCNqZ/jwZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XHN2LVIg; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XHN2LVIg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785415870; x=1816951870;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5HVLMpuF3lBbGfawHvS/HUh/V54Nubz9fajeKF2BFEY=;
  b=XHN2LVIgIQkn9XhcUtkws5dEMpw+hw14SsznevtzODG448VF3ynAez8Q
   CyDk4N7Yu+7VRtFIDmmUtbrcFdadwVNLxhmA8AvIzMzvQ4WyI8KcY2hdz
   yT20+Mee7ejSybYn/qIJ+ES0qCggMDaETbWuVrpzr2PK8DzZqTF/bDZDF
   scybS3h72Xd3VTRp7QY4rZotIaWPKGAwBz5f9LxloSC+a3KHQa5nGBBNP
   wtD+T7z5W/IwSvkfs46pmygqa74hHzbchnqR3mg8CqzYKCTXOCk/bcb3f
   YjVbXuT3Vc45gMTcZJ/2NTh3P41NpbLctCDbvZmJws7ZoFDdqrnDnwsu6
   Q==;
X-CSE-ConnectionGUID: lN4q/5HhTmGZasLE9laHiQ==
X-CSE-MsgGUID: eOljitb4SOe89L0KW0gxaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="103439274"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="103439274"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 05:51:03 -0700
X-CSE-ConnectionGUID: nLdGoABETViD6j3pMlDLCw==
X-CSE-MsgGUID: K29u0+HoSZGUlAoZpr5SkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="283638691"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.79])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 05:51:00 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	liam.r.girdwood@intel.com
Subject: [PATCH 3/4] ASoC: SOF: Intel: hda: Remove unused hda_bus_ml_put_all()
Date: Thu, 30 Jul 2026 15:51:29 +0300
Message-ID: <20260730125130.29887-4-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260730125130.29887-1-peter.ujfalusi@linux.intel.com>
References: <20260730125130.29887-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The helper became unused after probe no longer drops all non-alt
links, so remove the dead API and implementation.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 include/sound/hda-mlink.h       |  2 --
 sound/soc/sof/intel/hda-mlink.c | 13 -------------
 2 files changed, 15 deletions(-)

diff --git a/include/sound/hda-mlink.h b/include/sound/hda-mlink.h
index fed69998c93f..d9789b048c61 100644
--- a/include/sound/hda-mlink.h
+++ b/include/sound/hda-mlink.h
@@ -49,7 +49,6 @@ int hdac_bus_eml_sdw_set_lsdiid(struct hdac_bus *bus, int sublink, int dev_num);
 int hdac_bus_eml_sdw_map_stream_ch(struct hdac_bus *bus, int sublink, int y,
 				   int channel_mask, int stream_id, int dir);
 
-void hda_bus_ml_put_all(struct hdac_bus *bus);
 void hda_bus_ml_reset_losidv(struct hdac_bus *bus);
 int hda_bus_ml_resume(struct hdac_bus *bus);
 int hda_bus_ml_suspend(struct hdac_bus *bus);
@@ -169,7 +168,6 @@ hdac_bus_eml_sdw_map_stream_ch(struct hdac_bus *bus, int sublink, int y,
 	return 0;
 }
 
-static inline void hda_bus_ml_put_all(struct hdac_bus *bus) { }
 static inline void hda_bus_ml_reset_losidv(struct hdac_bus *bus) { }
 static inline int hda_bus_ml_resume(struct hdac_bus *bus) { return 0; }
 static inline int hda_bus_ml_suspend(struct hdac_bus *bus) { return 0; }
diff --git a/sound/soc/sof/intel/hda-mlink.c b/sound/soc/sof/intel/hda-mlink.c
index ca8551befdb5..e0107cbd06e6 100644
--- a/sound/soc/sof/intel/hda-mlink.c
+++ b/sound/soc/sof/intel/hda-mlink.c
@@ -884,19 +884,6 @@ int hdac_bus_eml_sdw_map_stream_ch(struct hdac_bus *bus, int sublink, int y,
 	return 0;
 } EXPORT_SYMBOL_NS(hdac_bus_eml_sdw_map_stream_ch, "SND_SOC_SOF_HDA_MLINK");
 
-void hda_bus_ml_put_all(struct hdac_bus *bus)
-{
-	struct hdac_ext_link *hlink;
-
-	list_for_each_entry(hlink, &bus->hlink_list, list) {
-		struct hdac_ext2_link *h2link = hdac_ext_link_to_ext2(hlink);
-
-		if (!h2link->alt)
-			snd_hdac_ext_bus_link_put(bus, hlink);
-	}
-}
-EXPORT_SYMBOL_NS(hda_bus_ml_put_all, "SND_SOC_SOF_HDA_MLINK");
-
 void hda_bus_ml_reset_losidv(struct hdac_bus *bus)
 {
 	struct hdac_ext_link *hlink;
-- 
2.55.0

