Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4856447045A
	for <linux-sound@vger.kernel.org>; Thu, 27 Aug 2026 13:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787836286; cv=none; b=eZ8h52rVBIR6h19aCFojo1w4voBOpov4km8F3e63EP7Ff4Iwp8PaWV1+uCY7RcZargH6c4GBuWbv1Fi1iwdNO4bchVqflM3MexCKzIJcuUzJVWEDZmCjExA+QWFPoYXt+xldhLVS7kjfYFG3GlId7tVdii8vKw2tUj0HdODN6Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787836286; c=relaxed/simple;
	bh=KJEK+7WZ4CuvEdwm3UKj89YGPQBjzfCr3OdKXGnvzes=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KWL/8IXniubJEaiZ8Zq21C90poGJYuRJrtVCNVpYj1NGLeoXNeKxqkXom7ZCPQZG8geILvHVrGGFTBdLd65whdAYqHVA7POM817/78CwakCzOrl85V51HaEcZp7ZUEWp12FBoCqV1xAXC8iV8NaSCc4vUTqntgiUEquWBTX4XVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OmRbCMpE; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OmRbCMpE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787836276; x=1819372276;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KJEK+7WZ4CuvEdwm3UKj89YGPQBjzfCr3OdKXGnvzes=;
  b=OmRbCMpEfP+QLwGtpBk1vOslfaJ8JchBccupKRhSaCDCpf28mCLAdOh/
   mfUrbjlI+3LTT42vIyZjZ77hSn4bE9UrRrENTrIg3+ZIx8jTRBQd3s8C2
   5v13pm0i8Mhd3OgvpoTKXmDk2UQWBx91cCHmmNobT/3hdwIlD3/Jj4nPR
   sFIm++sA3cTz7fu7EdbZp2I+BO8O7EhGL3E5jwB3qMQFrKvwvv8AVflRE
   dEw1D2pr+yzoPPj7Va0hmc2NtmVCe03b8NHgdbNwv/jrzHR3JhWx9EMN0
   eXALYWMN7cg2DntlfzzTdeCYThfQgxiC8dWzbtC+i3e9z0Xh+/dmDKh1z
   A==;
X-CSE-ConnectionGUID: LFFKhXv5TpCHEyzeLArC0A==
X-CSE-MsgGUID: lW8p4078QG+5jKVxoah4yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88539038"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="88539038"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 06:10:54 -0700
X-CSE-ConnectionGUID: wne9L2n2Toit7KSSTZRWpQ==
X-CSE-MsgGUID: BchaIDbxQU22fHo80ej/RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="263589328"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa006.fm.intel.com with ESMTP; 27 Aug 2026 06:10:48 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 01/10] ALSA: hda: ext: Clean up links if their initialization fails
Date: Thu, 27 Aug 2026 15:15:01 +0200
Message-Id: <20260827131510.1014084-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260827131510.1014084-1-cezary.rojewski@intel.com>
References: <20260827131510.1014084-1-cezary.rojewski@intel.com>
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

