Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB19142E75
	for <linux-sound@vger.kernel.org>; Mon,  6 May 2024 05:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714973488; cv=none; b=CulBQjRRal4avjBox8LQFIhYz7E/Io9lDTibhybGbbc+MKFnVMg9+VACNmhavmjrYXboQbRIyuFjNRQIJ4GnW6uLTAZJk9GBbYTywG7X7a6Gl5CtYWwjcegzMaUBgdl/Z/vyzC2PlJfNKb+kADJiBzHZTjqrvzFfU1w2OYGYG9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714973488; c=relaxed/simple;
	bh=IMso6YyTi3Ak72iVWYL0ZEM1Ah8zdCqQp2wAuBynAv8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YtXVLHk1C9eUXjGRE2YKx6GUqhmTFsnumpEY0lV7AFTYHmnni4g6nsqN4X71wsPF4b40xZ52Fs8ONG64dUC8WwWgLP1pVVnFZWXmUCvM1RWnT8l+WogNBCcUajV5U0goAlBz1yU+xaAADX/DF+qWrV+aQgijXrLrC/zsQZJ5IjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a2JKgknk; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a2JKgknk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714973487; x=1746509487;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=IMso6YyTi3Ak72iVWYL0ZEM1Ah8zdCqQp2wAuBynAv8=;
  b=a2JKgknkimqxlAzAiI3Gz4qThs0Acs14qbYOjI3Ep0lHKPI150CxeryU
   nJhMeK3GRLLJlISjkuiuxnhyZxpu1w50Hw4z2NtchTupPCnTWdejYAsgJ
   AGtUw68iCMmCVSPQI8wt/Ktrxz0ud1xk0glU2uv4lzuTowyfJ25GOyWak
   +A9fAxtN8kek620uLMvZLyv78hT1Ga1RThcFm/Qq7GpzfAoVtuUuzfgKE
   qjrCSmTYXkTn3AseE0yOdSF8M3byhdurZ1lUgKCMaUstXg35gfjlsv1Fr
   6EJbQfL+kezlt/29wndQ2X5l2jXzAKHncOIsEsHsBruJFX+ssn3yoLDaJ
   A==;
X-CSE-ConnectionGUID: 60sfRDwbRtWRza0k9m7uEw==
X-CSE-MsgGUID: 4H1mmB7bQHWoIegB+G4sZw==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="22111323"
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; 
   d="scan'208";a="22111323"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2024 22:31:26 -0700
X-CSE-ConnectionGUID: j87jTdywRm6kqMl/PCqDyw==
X-CSE-MsgGUID: d8+dsFZKQ7qCqd4vz+rJzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; 
   d="scan'208";a="28162781"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
  by fmviesa006.fm.intel.com with ESMTP; 05 May 2024 22:31:24 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
	kai.vehmanen@linux.intel.com,
	uma.shankar@intel.com
Subject: [PATCH] ALSA: hda: Add Intel BMG PCI ID and HDMI codec vid
Date: Mon,  6 May 2024 10:55:31 +0530
Message-Id: <20240506052531.1150062-1-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add HD Audio PCI ID and HDMI codec vendor ID for Intel Battlemage.

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 include/linux/pci_ids.h    | 1 +
 include/sound/hdaudio.h    | 1 +
 sound/pci/hda/hda_intel.c  | 2 ++
 sound/pci/hda/patch_hdmi.c | 1 +
 4 files changed, 5 insertions(+)

diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
index a0c75e467df3..ae8e66242927 100644
--- a/include/linux/pci_ids.h
+++ b/include/linux/pci_ids.h
@@ -3106,6 +3106,7 @@
 #define PCI_DEVICE_ID_INTEL_HDA_CML_S	0xa3f0
 #define PCI_DEVICE_ID_INTEL_HDA_LNL_P	0xa828
 #define PCI_DEVICE_ID_INTEL_S21152BB	0xb152
+#define PCI_DEVICE_ID_INTEL_HDA_BMG	0xe2f7
 #define PCI_DEVICE_ID_INTEL_HDA_CML_R	0xf0c8
 #define PCI_DEVICE_ID_INTEL_HDA_RKL_S	0xf1c8
 
diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
index a73d7f34f4e5..07638111b28f 100644
--- a/include/sound/hdaudio.h
+++ b/include/sound/hdaudio.h
@@ -731,6 +731,7 @@ static inline unsigned int snd_array_index(struct snd_array *array, void *ptr)
 			{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_HDA_DG2_0) }, \
 			{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_HDA_DG2_1) }, \
 			{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_HDA_DG2_2) }, \
+			{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_HDA_BMG) }, \
 			{ } \
 		}, pci) || HDA_CONTROLLER_IS_HSW(pci))
 
diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 9ea5925401f9..1d8171b11720 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -2499,6 +2499,8 @@ static const struct pci_device_id azx_ids[] = {
 	{ PCI_DEVICE_DATA(INTEL, HDA_RPL_M, AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE) },
 	{ PCI_DEVICE_DATA(INTEL, HDA_RPL_PX, AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE) },
 	{ PCI_DEVICE_DATA(INTEL, HDA_MTL, AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE) },
+	/* Battlemage */
+	{ PCI_DEVICE_DATA(INTEL, HDA_BMG, AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE) },
 	/* Lunarlake-P */
 	{ PCI_DEVICE_DATA(INTEL, HDA_LNL_P, AZX_DRIVER_SKL | AZX_DCAPS_INTEL_SKYLAKE) },
 	/* Arrow Lake-S */
diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 495d63101186..0a00c5ea42e0 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -4642,6 +4642,7 @@ HDA_CODEC_ENTRY(0x8086281a, "Jasperlake HDMI",	patch_i915_icl_hdmi),
 HDA_CODEC_ENTRY(0x8086281b, "Elkhartlake HDMI",	patch_i915_icl_hdmi),
 HDA_CODEC_ENTRY(0x8086281c, "Alderlake-P HDMI", patch_i915_adlp_hdmi),
 HDA_CODEC_ENTRY(0x8086281d, "Meteor Lake HDMI",	patch_i915_adlp_hdmi),
+HDA_CODEC_ENTRY(0x8086281e, "Battlemage HDMI",	patch_i915_adlp_hdmi),
 HDA_CODEC_ENTRY(0x8086281f, "Raptor Lake P HDMI",	patch_i915_adlp_hdmi),
 HDA_CODEC_ENTRY(0x80862820, "Lunar Lake HDMI",	patch_i915_adlp_hdmi),
 HDA_CODEC_ENTRY(0x80862880, "CedarTrail HDMI",	patch_generic_hdmi),
-- 
2.25.1

