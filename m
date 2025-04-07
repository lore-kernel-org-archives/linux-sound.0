Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE7F2376E4
	for <linux-sound@vger.kernel.org>; Mon,  7 Apr 2025 11:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744024016; cv=none; b=egoSIC3c8b0L3B5gt7iGn/6zvxmi18uvZWojrs9zhvN/WjItcQjScd6QsTuNp9fJocBPdrFF6E1NzytvHv0HJhR4t/DFxscQgJcn7MEFqJR2C5z7XglKS+vapVitOP/y5Fsx+0SeU7C/Y5E6SO3KnTA3UUZivrVpfFQktFZF6Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744024016; c=relaxed/simple;
	bh=CykydU6V8GV8kcti5V0Vx3SV5X7RFMFadj4aFoD0Zr8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kp0T/zH+OYJfhwAugaZ9b/Iy+t/bKJ27RHweJvOxOaeXMzTTgR0e1ECwQI3dbqvG6CxcCGli88rt9EIm2jSO300zCTjUQ3MX4/h9n8L383YymsMPQFKMacS5yyZKQZ2fquwrHHWVuF1/hM6b+Jkz1nevaHr0Ro0omJBNrl6YqXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gSNASGqO; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gSNASGqO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744024015; x=1775560015;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CykydU6V8GV8kcti5V0Vx3SV5X7RFMFadj4aFoD0Zr8=;
  b=gSNASGqOZEj4ls4HyR+SHJvHK5m3tsXT5hpjOaEvCX/9hkT2uMPGhJVU
   QwuMOvUg4YhWl4OmrXw29JrboUgdmafIMkIzA9icm5LWcUlNY+ir8YyU/
   vpnGcoYHY0SvvixKPOZoFiU4Z++PkUnedvDBta5nW5l36By1+COQX/KhY
   eZXKHr+TQ8SFR5FzC1s4YOMGFunTqU9pFJ4p9lRiqCedTR9V0YNJBxgtC
   XaUyTqcNH/gO89MlRo300HleSyBM6HX9nIYU4tFc1tNQWowuYvjf/nLAC
   V/LNsvwqjAq4QWTWgqRLmMIZbct/X+F6tu6JXIgZnYTRFzlkIzbuVmkys
   A==;
X-CSE-ConnectionGUID: 4rMvCVoZTVK8SR1kc7Xalw==
X-CSE-MsgGUID: N04jtNdCQ4m+nEu7j/s+Yw==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="49057324"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="49057324"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 04:06:54 -0700
X-CSE-ConnectionGUID: Vp++RMqKSD2A6zk5Q+9V1g==
X-CSE-MsgGUID: XVr/4dBJQZuxaOKCKA/qSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="127776257"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa006.fm.intel.com with ESMTP; 07 Apr 2025 04:06:52 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	liam.r.girdwood@intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 01/10] ALSA: hda: Allow to fetch hlink by ID
Date: Mon,  7 Apr 2025 13:23:43 +0200
Message-Id: <20250407112352.3720779-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250407112352.3720779-1-cezary.rojewski@intel.com>
References: <20250407112352.3720779-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Starting with LNL platform, Intel HDAudio Links carry IDs specifying
non-HDAudio transfer type they help facilitate e.g.: 0xC0 for I2S as
defined by AZX_REG_ML_LEPTR_ID_INTEL_SSP.

The mechanism accounts for LEPTR register as it is Reserved if
LCAP.ALT for given Link equals 0.

Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/sound/hdaudio_ext.h         |  5 +++++
 sound/hda/ext/hdac_ext_controller.c | 18 ++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/include/sound/hdaudio_ext.h b/include/sound/hdaudio_ext.h
index 4c7a40e149a5..60ec12e3b72f 100644
--- a/include/sound/hdaudio_ext.h
+++ b/include/sound/hdaudio_ext.h
@@ -22,6 +22,7 @@ void snd_hdac_ext_bus_ppcap_enable(struct hdac_bus *chip, bool enable);
 void snd_hdac_ext_bus_ppcap_int_enable(struct hdac_bus *chip, bool enable);
 
 int snd_hdac_ext_bus_get_ml_capabilities(struct hdac_bus *bus);
+struct hdac_ext_link *snd_hdac_ext_bus_get_hlink_by_id(struct hdac_bus *bus, u32 id);
 struct hdac_ext_link *snd_hdac_ext_bus_get_hlink_by_addr(struct hdac_bus *bus, int addr);
 struct hdac_ext_link *snd_hdac_ext_bus_get_hlink_by_name(struct hdac_bus *bus,
 							 const char *codec_name);
@@ -97,12 +98,16 @@ struct hdac_ext_link {
 	void __iomem *ml_addr; /* link output stream reg pointer */
 	u32 lcaps;   /* link capablities */
 	u16 lsdiid;  /* link sdi identifier */
+	u32 id;
 
 	int ref_count;
 
 	struct list_head list;
 };
 
+#define hdac_ext_link_alt(link)		((link)->lcaps & AZX_ML_HDA_LCAP_ALT)
+#define hdac_ext_link_ofls(link)	((link)->lcaps & AZX_ML_HDA_LCAP_OFLS)
+
 int snd_hdac_ext_bus_link_power_up(struct hdac_ext_link *hlink);
 int snd_hdac_ext_bus_link_power_down(struct hdac_ext_link *hlink);
 int snd_hdac_ext_bus_link_power_up_all(struct hdac_bus *bus);
diff --git a/sound/hda/ext/hdac_ext_controller.c b/sound/hda/ext/hdac_ext_controller.c
index 6199bb60ccf0..2ec1531d1c1b 100644
--- a/sound/hda/ext/hdac_ext_controller.c
+++ b/sound/hda/ext/hdac_ext_controller.c
@@ -9,6 +9,7 @@
  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  */
 
+#include <linux/bitfield.h>
 #include <linux/delay.h>
 #include <linux/slab.h>
 #include <sound/hda_register.h>
@@ -81,6 +82,7 @@ int snd_hdac_ext_bus_get_ml_capabilities(struct hdac_bus *bus)
 	int idx;
 	u32 link_count;
 	struct hdac_ext_link *hlink;
+	u32 leptr;
 
 	link_count = readl(bus->mlcap + AZX_REG_ML_MLCD) + 1;
 
@@ -97,6 +99,11 @@ int snd_hdac_ext_bus_get_ml_capabilities(struct hdac_bus *bus)
 		hlink->lcaps  = readl(hlink->ml_addr + AZX_REG_ML_LCAP);
 		hlink->lsdiid = readw(hlink->ml_addr + AZX_REG_ML_LSDIID);
 
+		if (hdac_ext_link_alt(hlink)) {
+			leptr = readl(hlink->ml_addr + AZX_REG_ML_LEPTR);
+			hlink->id = FIELD_GET(AZX_REG_ML_LEPTR_ID, leptr);
+		}
+
 		/* since link in On, update the ref */
 		hlink->ref_count = 1;
 
@@ -125,6 +132,17 @@ void snd_hdac_ext_link_free_all(struct hdac_bus *bus)
 }
 EXPORT_SYMBOL_GPL(snd_hdac_ext_link_free_all);
 
+struct hdac_ext_link *snd_hdac_ext_bus_get_hlink_by_id(struct hdac_bus *bus, u32 id)
+{
+	struct hdac_ext_link *hlink;
+
+	list_for_each_entry(hlink, &bus->hlink_list, list)
+		if (hdac_ext_link_alt(hlink) && hlink->id == id)
+			return hlink;
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(snd_hdac_ext_bus_get_hlink_by_id);
+
 /**
  * snd_hdac_ext_bus_get_hlink_by_addr - get hlink at specified address
  * @bus: hlink's parent bus device
-- 
2.25.1

