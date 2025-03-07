Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582002192FC
	for <linux-sound@vger.kernel.org>; Fri,  7 Mar 2025 11:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741346886; cv=none; b=TMJ6jma8b1nN/JYYPojrCCOhSYnRti8MW73aDf1nBQDSPmqQBCl8NffvLJykyLdLU3328AH2m8uKH8dNbjNkr6Pg4kLVN2F+hx5uBLbRXQcUg5XevOIYI6O8dB3R24cp6cJluiIXu3N7oLcQ3cz4i31ZVpApo/QfN84AjnRAsX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741346886; c=relaxed/simple;
	bh=5hYS0wPolyf1ZN4Ynbwm86Z88R7AeoYO9JE6c4Fl0mo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K4VSFUD9jbzoT01fGVvQsImuD1QmhlZcFoQR3A1St8zRfQ4x6FSMzgrzkYIuJTTxkfU80fl+yQjAbPaqw7GUfqRvNqJNBE4aiczGe4Bs5Tt74IVsM2fX86rQ23GM93i08gaN8uTcCAkAqicZ1dGAjMWlEXKaH0phz8U6+Dcxqkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FPUPqFTu; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FPUPqFTu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741346884; x=1772882884;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5hYS0wPolyf1ZN4Ynbwm86Z88R7AeoYO9JE6c4Fl0mo=;
  b=FPUPqFTutEcuPvZ44vWR5vO4UV6enXJXgG0SPVSvr6LpxNxtLVI2XptV
   XmVMzHOrpYpFD8oQJnCt1H45NvjyvePkkyKsso2Kps6pj0JJQUoEQgroW
   8d2S+3qqFgmKiZpE0qSrgVib5z76g8r/WOLCkRrL0iGc3RmrbEuBph5mI
   wrIWaGJ+W3Z4n7+PAwi8kp8A7fya6kxv+HheEPPObFsWnQfQHfGYAzv7N
   mwbKBpNNQikezGcTe39PkZRyMi1dqoxf0G6t6sjbzIQn9fW54j1Sx6WNB
   Ua2InW2Lkwnt7mB4w7Ogew+qhlvStGc4r+ipnhNnU0TOpMgtGAU4o0FOY
   w==;
X-CSE-ConnectionGUID: Ihhv9pPiR+ingsBQOpL7rQ==
X-CSE-MsgGUID: XilH/DkEQ5KVXETL+KUbKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="29972320"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="29972320"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 03:28:04 -0800
X-CSE-ConnectionGUID: mQoM/IqfRz6ZTLfupFhEXg==
X-CSE-MsgGUID: WL1aDZ98QZCtFxWTvpFoIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="124390712"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.249.140])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 03:28:01 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	liam.r.girdwood@intel.com,
	amadeuszx.slawinski@linux.intel.com
Subject: [PATCH v2 6/8] ASoC: SOF: Intel: hda-mlink: Add support for mic privacy in VS SHIM registers
Date: Fri,  7 Mar 2025 13:28:14 +0200
Message-ID: <20250307112816.1495-7-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250307112816.1495-1-peter.ujfalusi@linux.intel.com>
References: <20250307112816.1495-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

New register has been introduced with PTL in the vendor specific SHIM
registers, outside of the IPs itself for microphone privacy status handling.

Via the PVCCS register the current microphone privacy status can be checked
and the interrupt generation on status change can be enabled/disabled.
The status change interrupt is routed to the owner of the interface
(DSP/host).

The PVCCS is provided for each sublink under the IP to make it possible to
control the interrupt generation per sublink.
On status change the MDSTSCHG bit needs to be cleared for all sublink of
the interface to be able to detect future changes in privacy.

The status bit (MDSTS) is volatile in all PVCCS register, it reflects the
current state of the GPIO signal.

Microphone privacy is a hardware feature (if enabled and configured that
way), the host has only passive, monitoring role.

The added functions are generic to be future proof if the mic privacy
support is extended beyond Soundwire and DMIC links.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 include/sound/hda-mlink.h       |  25 +++++++
 sound/soc/sof/intel/hda-mlink.c | 127 ++++++++++++++++++++++++++++++++
 2 files changed, 152 insertions(+)

diff --git a/include/sound/hda-mlink.h b/include/sound/hda-mlink.h
index 6774f4b9e5fc..4327317be6af 100644
--- a/include/sound/hda-mlink.h
+++ b/include/sound/hda-mlink.h
@@ -62,6 +62,12 @@ struct mutex *hdac_bus_eml_get_mutex(struct hdac_bus *bus, bool alt, int elid);
 
 int hdac_bus_eml_enable_offload(struct hdac_bus *bus, bool alt, int elid, bool enable);
 
+/* microphone privacy specific function supported by ACE3+ architecture */
+void hdac_bus_eml_set_mic_privacy_mask(struct hdac_bus *bus, bool alt, int elid,
+				       unsigned long mask);
+bool hdac_bus_eml_is_mic_privacy_changed(struct hdac_bus *bus, bool alt, int elid);
+bool hdac_bus_eml_get_mic_privacy_state(struct hdac_bus *bus, bool alt, int elid);
+
 #else
 
 static inline int
@@ -185,4 +191,23 @@ hdac_bus_eml_enable_offload(struct hdac_bus *bus, bool alt, int elid, bool enabl
 {
 	return 0;
 }
+
+static inline void
+hdac_bus_eml_set_mic_privacy_mask(struct hdac_bus *bus, bool alt, int elid,
+				  unsigned long mask)
+{
+}
+
+static inline bool
+hdac_bus_eml_is_mic_privacy_changed(struct hdac_bus *bus, bool alt, int elid)
+{
+	return false;
+}
+
+static inline bool
+hdac_bus_eml_get_mic_privacy_state(struct hdac_bus *bus, bool alt, int elid)
+{
+	return false;
+}
+
 #endif /* CONFIG_SND_SOC_SOF_HDA_MLINK */
diff --git a/sound/soc/sof/intel/hda-mlink.c b/sound/soc/sof/intel/hda-mlink.c
index fe627bcb0531..ce561fe52bd5 100644
--- a/sound/soc/sof/intel/hda-mlink.c
+++ b/sound/soc/sof/intel/hda-mlink.c
@@ -16,6 +16,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/module.h>
+#include <linux/string_choices.h>
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_MLINK)
 
@@ -42,6 +43,7 @@
  * @shim_offset:	offset to SHIM register base
  * @ip_offset:		offset to IP register base
  * @shim_vs_offset:	offset to vendor-specific (VS) SHIM base
+ * @mic_privacy_mask:	bitmask of sublinks where mic privacy is applied
  */
 struct hdac_ext2_link {
 	struct hdac_ext_link hext_link;
@@ -65,6 +67,8 @@ struct hdac_ext2_link {
 	u32 shim_offset;
 	u32 ip_offset;
 	u32 shim_vs_offset;
+
+	unsigned long mic_privacy_mask;
 };
 
 #define hdac_ext_link_to_ext2(h) container_of(h, struct hdac_ext2_link, hext_link)
@@ -90,6 +94,13 @@ struct hdac_ext2_link {
 #define AZX_REG_INTEL_UAOL_IP_OFFSET			0x100
 #define AZX_REG_INTEL_UAOL_VS_SHIM_OFFSET		0xC00
 
+/* Microphone privacy */
+#define AZX_REG_INTEL_VS_SHIM_PVCCS			0x10
+#define AZX_REG_INTEL_VS_SHIM_PVCCS_MDSTSCHGIE		BIT(0)
+#define AZX_REG_INTEL_VS_SHIM_PVCCS_MDSTSCHG		BIT(8)
+#define AZX_REG_INTEL_VS_SHIM_PVCCS_MDSTS		BIT(9)
+#define AZX_REG_INTEL_VS_SHIM_PVCCS_FMDIS		BIT(10)
+
 /* HDAML section - this part follows sequences in the hardware specification,
  * including naming conventions and the use of the hdaml_ prefix.
  * The code is intentionally minimal with limited dependencies on frameworks or
@@ -696,6 +707,20 @@ static int hdac_bus_eml_power_up_base(struct hdac_bus *bus, bool alt, int elid,
 	}
 
 	ret = hdaml_link_init(hlink->ml_addr + AZX_REG_ML_LCTL, sublink);
+	if ((h2link->mic_privacy_mask & BIT(sublink)) && !ret) {
+		u16 __iomem *pvccs = h2link->base_ptr +
+				     h2link->shim_vs_offset +
+				     sublink * h2link->instance_offset +
+				     AZX_REG_INTEL_VS_SHIM_PVCCS;
+		u16 val = readw(pvccs);
+
+		writew(val | AZX_REG_INTEL_VS_SHIM_PVCCS_MDSTSCHGIE, pvccs);
+
+		if (val & AZX_REG_INTEL_VS_SHIM_PVCCS_MDSTS)
+			dev_dbg(bus->dev,
+				"sublink %d (%d:%d): Mic privacy is enabled\n",
+				sublink, alt, elid);
+	}
 
 skip_init:
 	if (eml_lock)
@@ -742,6 +767,16 @@ static int hdac_bus_eml_power_down_base(struct hdac_bus *bus, bool alt, int elid
 		if (--h2link->sublink_ref_count[sublink] > 0)
 			goto skip_shutdown;
 	}
+
+	if (h2link->mic_privacy_mask & BIT(sublink)) {
+		u16 __iomem *pvccs = h2link->base_ptr +
+				     h2link->shim_vs_offset +
+				     sublink * h2link->instance_offset +
+				     AZX_REG_INTEL_VS_SHIM_PVCCS;
+
+		writew(readw(pvccs) & ~AZX_REG_INTEL_VS_SHIM_PVCCS_MDSTSCHGIE, pvccs);
+	}
+
 	ret = hdaml_link_shutdown(hlink->ml_addr + AZX_REG_ML_LCTL, sublink);
 
 skip_shutdown:
@@ -987,6 +1022,98 @@ int hdac_bus_eml_enable_offload(struct hdac_bus *bus, bool alt, int elid, bool e
 }
 EXPORT_SYMBOL_NS(hdac_bus_eml_enable_offload, "SND_SOC_SOF_HDA_MLINK");
 
+void hdac_bus_eml_set_mic_privacy_mask(struct hdac_bus *bus, bool alt, int elid,
+				       unsigned long mask)
+{
+	struct hdac_ext2_link *h2link;
+
+	if (!mask)
+		return;
+
+	h2link = find_ext2_link(bus, alt, elid);
+	if (!h2link)
+		return;
+
+	if (__fls(mask) > h2link->slcount) {
+		dev_warn(bus->dev,
+			 "%s: invalid sublink mask for %d:%d, slcount %d: %#lx\n",
+			 __func__, alt, elid, h2link->slcount, mask);
+		return;
+	}
+
+	dev_dbg(bus->dev, "sublink mask for %d:%d, slcount %d: %#lx\n", alt,
+		elid, h2link->slcount, mask);
+
+	h2link->mic_privacy_mask = mask;
+}
+EXPORT_SYMBOL_NS(hdac_bus_eml_set_mic_privacy_mask, "SND_SOC_SOF_HDA_MLINK");
+
+bool hdac_bus_eml_is_mic_privacy_changed(struct hdac_bus *bus, bool alt, int elid)
+{
+	struct hdac_ext2_link *h2link;
+	bool changed = false;
+	u16 __iomem *pvccs;
+	int i;
+
+	h2link = find_ext2_link(bus, alt, elid);
+	if (!h2link)
+		return false;
+
+	/* The change in privacy state needs to be acked for each link */
+	for_each_set_bit(i, &h2link->mic_privacy_mask, h2link->slcount) {
+		u16 val;
+
+		if (h2link->sublink_ref_count[i] == 0)
+			continue;
+
+		pvccs = h2link->base_ptr +
+			h2link->shim_vs_offset +
+			i * h2link->instance_offset +
+			AZX_REG_INTEL_VS_SHIM_PVCCS;
+
+		val = readw(pvccs);
+		if (val & AZX_REG_INTEL_VS_SHIM_PVCCS_MDSTSCHG) {
+			writew(val, pvccs);
+			changed = true;
+		}
+	}
+
+	return changed;
+}
+EXPORT_SYMBOL_NS(hdac_bus_eml_is_mic_privacy_changed, "SND_SOC_SOF_HDA_MLINK");
+
+bool hdac_bus_eml_get_mic_privacy_state(struct hdac_bus *bus, bool alt, int elid)
+{
+	struct hdac_ext2_link *h2link;
+	u16 __iomem *pvccs;
+	bool state;
+	int i;
+
+	h2link = find_ext2_link(bus, alt, elid);
+	if (!h2link)
+		return false;
+
+	for_each_set_bit(i, &h2link->mic_privacy_mask, h2link->slcount) {
+		if (h2link->sublink_ref_count[i] == 0)
+			continue;
+
+		/* Return the privacy state from the first active link */
+		pvccs = h2link->base_ptr +
+			h2link->shim_vs_offset +
+			i * h2link->instance_offset +
+			AZX_REG_INTEL_VS_SHIM_PVCCS;
+
+		state = readw(pvccs) & AZX_REG_INTEL_VS_SHIM_PVCCS_MDSTS;
+		dev_dbg(bus->dev, "alt: %d, elid: %d: Mic privacy is %s\n", alt,
+			elid, str_enabled_disabled(state));
+
+		return state;
+	}
+
+	return false;
+}
+EXPORT_SYMBOL_NS(hdac_bus_eml_get_mic_privacy_state, "SND_SOC_SOF_HDA_MLINK");
+
 #endif
 
 MODULE_LICENSE("Dual BSD/GPL");
-- 
2.48.1

