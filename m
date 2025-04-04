Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911231A5B9E
	for <linux-sound@vger.kernel.org>; Fri,  4 Apr 2025 09:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743759175; cv=none; b=BgfBoJFrk305S68VUADKYeKDWAfy56izFLqa9VZSk32DNswyUnvB01uHzDh4Tg/S+JFKqUKZ4YoXqyiktnwSNpAg9yecfUckH7cgNptWEOcP+IimXyLHxJi9nz2MT5iqnsxArSKThWeBn+Q5phOBnCIaVLgNNTj7JaKZCo5U0fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743759175; c=relaxed/simple;
	bh=CykydU6V8GV8kcti5V0Vx3SV5X7RFMFadj4aFoD0Zr8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=msS3POMI+uZtI9SBVXrdNtjW1Oie9EqaQR9Q4B2hnGZVYdy5E6Wx3Hh46XjC44nng4q182/8Iztw5BhQYQ2JcCzdftrHRompNqJX2lojjYlIkNE9LAWVSfL9q5ZM9GeU3s2/nSYmReoIGe0WcNrhIZmRfSA5/ld0V3/2ojnos7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bG+Np4ZH; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bG+Np4ZH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743759174; x=1775295174;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CykydU6V8GV8kcti5V0Vx3SV5X7RFMFadj4aFoD0Zr8=;
  b=bG+Np4ZHY0guAV+cTMkexjgQZCompZW2Wk0nmMo0VsxJOJpQPMIs5/Ae
   TxCiqa5Y9GT09Ea5sDM72eyOyc08lAAq8fhrOR1TWst0oELZuewjwuVNM
   pFpZFAkYt6OfB0aF99xeOpoQXvXYppzkdF67t9rz+737QLnrRWPwxatvy
   R394X69rBNh/A4G497bhefYHqJvoBCfiEWrcAEe/cdF8dMMJQakztmHSs
   x2OxpSzUrCnwAAHq7URzDVjQ506qDKki+KneYOIV9ik/+Ep/QQgARsN/Q
   UjHgh4pTo21XtUzzlihVQbJgGNn68xKlaBA4CYZh7cwNildgRc8+Omi3p
   A==;
X-CSE-ConnectionGUID: m9pyATd0TDCtTrW7AKf29w==
X-CSE-MsgGUID: dyImPKM8Rtqo741mlA0pOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="70566316"
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; 
   d="scan'208";a="70566316"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 02:32:53 -0700
X-CSE-ConnectionGUID: Bw7QE4LUSlCQ5agk1FQMoQ==
X-CSE-MsgGUID: Bcm5lJLHQW+COjZOtth1Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; 
   d="scan'208";a="158248577"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa001.fm.intel.com with ESMTP; 04 Apr 2025 02:32:51 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 01/12] ALSA: hda: Allow to fetch hlink by ID
Date: Fri,  4 Apr 2025 11:49:42 +0200
Message-Id: <20250404094953.3657679-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250404094953.3657679-1-cezary.rojewski@intel.com>
References: <20250404094953.3657679-1-cezary.rojewski@intel.com>
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

