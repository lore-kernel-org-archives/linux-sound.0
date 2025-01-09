Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5A81E531
	for <linux-sound@vger.kernel.org>; Thu,  9 Jan 2025 12:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736426284; cv=none; b=oA6F8lfgkPNyWdDng6qPPiJrY8fa3F034LbB+WXmEvZMe57z1DcPSAZrHgtKo+iPyFLk/aV4FTNSO/Y/srW4SiZtlNxarLP20Pw/45++rsE1N8ypQAqHuZilNRxzwHYf6A+AUTiVqz4H6dLWwkey/17n9jF/sDfoZk0SSDn6O2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736426284; c=relaxed/simple;
	bh=NVfIqmO0JXExlYZ7gWv0lOOr3mWwUDJyOFWcaMGhjIc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NanviFGuZ8z4ErmcyusJ1aVRfcKZgkS06VYmm5wo/TAD5MEMN6krHQnYzdMttv4Fj3UfdMpUA7oHGcfFYO45KQLXTFW5uZpbhhFYKcSBwlbO9KylnEPjnG+2HnYHNig1EeN1t6s0fNSO6Ziwe30LZ/zXvNexb7diyiQwIsSMG0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cSTCfs5W; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cSTCfs5W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736426284; x=1767962284;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NVfIqmO0JXExlYZ7gWv0lOOr3mWwUDJyOFWcaMGhjIc=;
  b=cSTCfs5WkAGNU43stMxVBy4GCR91rxL3j1Wz9bHIfTDuKuQpyXuT3uYQ
   2+2c9RlBXt3i15GYduuFvaoScDx6ZQMHVxD40qcPAyY6ZyDHDa3HWGxOz
   TGJIy4ihLMRPs1A1PUN9vo+iVYg9UUTbqLmd5Y+cS/5di3wTYLhjDp9dt
   +A5op5qqK5D6tXFs7CGaPvHb2eZHmmSwzPy+MWKG5atsKF5zYSt4ReBqk
   bxMMXkB0iQVyrc6YJFxGcEGzlE5e8qAJKQZJgBUOYJ1GJItSsHz+fO1sj
   yBeVDWOdbd3TZocg/a2xXTCKK2Sl9U6h0pMtiMLv3bQ/BDhjpoARJAWJl
   A==;
X-CSE-ConnectionGUID: HDsR6Q/uSd2LnjC1l975Fg==
X-CSE-MsgGUID: wBeo8RdQS8CZv2zQja2t7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="40449779"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="40449779"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 04:38:01 -0800
X-CSE-ConnectionGUID: in2tJQ2tTuueheSfkm0ycw==
X-CSE-MsgGUID: JH/JsAmZTi6N243rrBpy1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="103194325"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by fmviesa006.fm.intel.com with ESMTP; 09 Jan 2025 04:37:59 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	broonie@kernel.org,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 1/3] ALSA: hda: Fix compilation of snd_hdac_adsp_xxx() helpers
Date: Thu,  9 Jan 2025 13:52:02 +0100
Message-Id: <20250109125204.3668961-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250109125204.3668961-1-cezary.rojewski@intel.com>
References: <20250109125204.3668961-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The snd_hdac_adsp_xxx() wrap snd_hdac_reg_xxx() helpers to simplify
register access for AudioDSP drivers e.g.: the avs-driver. Byte- and
word-variants of said helps do not expand to bare readx/writex()
operations but functions instead and, due to pointer type
incompatibility, cause compilation to fail.

As AudioDSP drivers e.g.: the avs-driver utilize struct hda_bus (and
thus struct hdac_bus) as the base structure, add casts to address the
problem.

Fixes: c19bd02e9029 ("ALSA: hda: Add helper macros for DSP capable devices")
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/sound/hdaudio_ext.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/include/sound/hdaudio_ext.h b/include/sound/hdaudio_ext.h
index 957295364a5e..79a010dd0062 100644
--- a/include/sound/hdaudio_ext.h
+++ b/include/sound/hdaudio_ext.h
@@ -120,21 +120,21 @@ int snd_hdac_ext_bus_link_put(struct hdac_bus *bus, struct hdac_ext_link *hlink)
 void snd_hdac_ext_bus_link_power(struct hdac_device *codec, bool enable);
 
 #define snd_hdac_adsp_writeb(chip, reg, value) \
-	snd_hdac_reg_writeb(chip, (chip)->dsp_ba + (reg), value)
+	snd_hdac_reg_writeb((struct hdac_bus *)(chip), (chip)->dsp_ba + (reg), value)
 #define snd_hdac_adsp_readb(chip, reg) \
-	snd_hdac_reg_readb(chip, (chip)->dsp_ba + (reg))
+	snd_hdac_reg_readb((struct hdac_bus *)(chip), (chip)->dsp_ba + (reg))
 #define snd_hdac_adsp_writew(chip, reg, value) \
-	snd_hdac_reg_writew(chip, (chip)->dsp_ba + (reg), value)
+	snd_hdac_reg_writew((struct hdac_bus *)(chip), (chip)->dsp_ba + (reg), value)
 #define snd_hdac_adsp_readw(chip, reg) \
-	snd_hdac_reg_readw(chip, (chip)->dsp_ba + (reg))
+	snd_hdac_reg_readw((struct hdac_bus *)(chip), (chip)->dsp_ba + (reg))
 #define snd_hdac_adsp_writel(chip, reg, value) \
-	snd_hdac_reg_writel(chip, (chip)->dsp_ba + (reg), value)
+	snd_hdac_reg_writel((struct hdac_bus *)(chip), (chip)->dsp_ba + (reg), value)
 #define snd_hdac_adsp_readl(chip, reg) \
-	snd_hdac_reg_readl(chip, (chip)->dsp_ba + (reg))
+	snd_hdac_reg_readl((struct hdac_bus *)(chip), (chip)->dsp_ba + (reg))
 #define snd_hdac_adsp_writeq(chip, reg, value) \
-	snd_hdac_reg_writeq(chip, (chip)->dsp_ba + (reg), value)
+	snd_hdac_reg_writeq((struct hdac_bus *)(chip), (chip)->dsp_ba + (reg), value)
 #define snd_hdac_adsp_readq(chip, reg) \
-	snd_hdac_reg_readq(chip, (chip)->dsp_ba + (reg))
+	snd_hdac_reg_readq((struct hdac_bus *)(chip), (chip)->dsp_ba + (reg))
 
 #define snd_hdac_adsp_updateb(chip, reg, mask, val) \
 	snd_hdac_adsp_writeb(chip, reg, \
-- 
2.25.1

