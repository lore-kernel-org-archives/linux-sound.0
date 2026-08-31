Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED003453A45
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 16:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788194317; cv=none; b=VxlHOnLYB0ov4hs5r3w1y0vS/z2ltdE0/o5kfrnqOjiuEaZLrv2fbYCBxKY55S07ZBuO7fFbGsGr7Lt2dkC7TNjqzU8ptEK0MP3mE6nCLHZN/l5Vvgg2OIhWQjf8Qbrc6ilqVlMXpeMaKacAgmO31ApBP5pfv5w1UBzCmW2XBZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788194317; c=relaxed/simple;
	bh=KJEK+7WZ4CuvEdwm3UKj89YGPQBjzfCr3OdKXGnvzes=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ghQvlX7U2lDgBlIBY2WIzk0+C28NA5EEZpyXBoXlmZl/U4gg+H6o7POFYrb2JKGlSEvDTM05c6KjmEPgyjjG2RnXXA8IdBHD2fqKuqxqpuj0uYwwzZ7KrCmi+cBh8jOQzcSogVBPTBb/0L0RxQ0K3J+e/6hHuvvHvwp+dCSMtK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iehnxDBW; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iehnxDBW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788194315; x=1819730315;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KJEK+7WZ4CuvEdwm3UKj89YGPQBjzfCr3OdKXGnvzes=;
  b=iehnxDBWvr/6p2KUjFisKHZpqgB/Y+JGE1+z5OCsHsodH9z5wDFbFDkA
   ebB+hVJSucFw2VDeKeTVUKcYH/68YeICxB49jtaUmvqDbrOKv20K/YGHm
   N84DbrxBMyqxqSUZvDzszVyGCGwPmxoS9dGkidlrm+oI2biBZpDIxWhkZ
   Y/LBmP86gDPrsciK1cHol/qme2QRFlsFnWV/7Xr6jqjpOwPgWS8BbD6zv
   CBNGGiMio7W3XThYYaA4IELJSZUw8ibuI7XlpzGNQs1WNaKu8z8swQgMU
   Ngyo+i9X4VwyJh4hn1jv/JCT04vpZruVOPI5ENWW7dJfPAJid5T966uOO
   A==;
X-CSE-ConnectionGUID: F+YUJqI0T9e1NKdPmXYQVQ==
X-CSE-MsgGUID: D5JOFhxPSCuxbfk15VW91g==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="111379709"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="111379709"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 09:38:35 -0700
X-CSE-ConnectionGUID: QhhvVc2oQWaj45w5mpc2sw==
X-CSE-MsgGUID: iJyfefYjS5Cswh0uM3rc1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="274111746"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa005.fm.intel.com with ESMTP; 31 Aug 2026 09:38:33 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v3 01/10] ALSA: hda: ext: Clean up links if their initialization fails
Date: Mon, 31 Aug 2026 18:42:24 +0200
Message-Id: <20260831164233.1487766-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260831164233.1487766-1-cezary.rojewski@intel.com>
References: <20260831164233.1487766-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

snd_hdac_ext_bus_get_ml_capabilities() allocates the hlink nodes
one-by-one but the procedure may fails due to -ENOMEM in the middle of
it. Clean up the list before returning the error code to simply the
function usage.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/hda/core/ext/controller.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/sound/hda/core/ext/controller.c b/sound/hda/core/ext/controller.c
index b1f1eff1d181..f75d3dcc6cb2 100644
--- a/sound/hda/core/ext/controller.c
+++ b/sound/hda/core/ext/controller.c
@@ -81,7 +81,7 @@ int snd_hdac_ext_bus_get_ml_capabilities(struct hdac_bus *bus)
 {
 	int idx;
 	u32 link_count;
-	struct hdac_ext_link *hlink;
+	struct hdac_ext_link *hlink, *save;
 	u32 leptr;
 
 	link_count = readl(bus->mlcap + AZX_REG_ML_MLCD) + 1;
@@ -91,7 +91,7 @@ int snd_hdac_ext_bus_get_ml_capabilities(struct hdac_bus *bus)
 	for (idx = 0; idx < link_count; idx++) {
 		hlink = kzalloc_obj(*hlink);
 		if (!hlink)
-			return -ENOMEM;
+			goto err_nomem;
 		hlink->index = idx;
 		hlink->bus = bus;
 		hlink->ml_addr = bus->mlcap + AZX_ML_BASE +
@@ -112,6 +112,13 @@ int snd_hdac_ext_bus_get_ml_capabilities(struct hdac_bus *bus)
 	}
 
 	return 0;
+
+err_nomem:
+	list_for_each_entry_safe(hlink, save, &bus->hlink_list, list) {
+		list_del(&hlink->list);
+		kfree(hlink);
+	}
+	return -ENOMEM;
 }
 EXPORT_SYMBOL_GPL(snd_hdac_ext_bus_get_ml_capabilities);
 
-- 
2.34.1

