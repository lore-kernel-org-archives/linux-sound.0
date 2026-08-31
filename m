Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734983DB64D
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 09:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788168719; cv=none; b=o6ETWXdAi2mSptqPxy/OSqUEVycdrM9e9/hFC0GaubaJ4ar6XvsVpVuDNWEEHb+JVXHAO9bY2reqQovLStMXm5j69J0Fd2FBvS4mnrpSiRMqEKZH8Sbcm9/jcA/SwerQ6QU46QTQARuUkYUuLAilygF3102gpbT96iazkeh4EUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788168719; c=relaxed/simple;
	bh=KJEK+7WZ4CuvEdwm3UKj89YGPQBjzfCr3OdKXGnvzes=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GV5OUDYyVcasTQF6jXDVudn+lhLeTJ9lAtWEjoFck56cOwj5GqAWqQDvhnABADGQOB6O5tO8aAmNQ/AUohcQ4SfqrYkumKWSlVMjDyFLKcHgLGlVJuuK7K74ryYu1C1wdiOYV8CU3FumZKdfs2PSU5f/3/TaKIeMmMEFeQ7M8T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MbSneMhR; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MbSneMhR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788168717; x=1819704717;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KJEK+7WZ4CuvEdwm3UKj89YGPQBjzfCr3OdKXGnvzes=;
  b=MbSneMhRSu4S4iFks+VkVR7ckte+NQrDza/GmlV+lifyQYlnfw5ZDvdm
   G+ncacqaASSdjU5Pq0uSCrXbaFbSXZCNTwkB5ICnm7LVEKGfq51r871hK
   SSHkg+F0Bu5BWN/tsJC5FR29a9YepaZkwkORkd7MGDBRz1pWhWM/FolQ9
   /K3nx3XPVSK+k75qbSVWlPrT03OyyhWeSqOMVOJtHy4g4oa2G7xNP40tk
   0PXspeTKni6bjymNZ+XX77ejbTrA56jIPr+VblTviGBZHTOFzb+TApEnk
   vQ+oM8UEmwZ5xMECj9547YEREFO+2Q89sBXTkvZqxvVLK8Drl9eo/GKaf
   A==;
X-CSE-ConnectionGUID: xzIOGpnNSXWHDaoq6S+puQ==
X-CSE-MsgGUID: WzzL9q+QQ3a1acWAdzoOJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="88332767"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="88332767"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 02:31:57 -0700
X-CSE-ConnectionGUID: nlk+XERwT3a58SrMcFGB2w==
X-CSE-MsgGUID: U53y0h5SR7SXLuC0VZiTAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="265507877"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa007.fm.intel.com with ESMTP; 31 Aug 2026 02:31:55 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 02/11] ALSA: hda: ext: Clean up links if their initialization fails
Date: Mon, 31 Aug 2026 11:36:06 +0200
Message-Id: <20260831093615.1117987-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260831093615.1117987-1-cezary.rojewski@intel.com>
References: <20260831093615.1117987-1-cezary.rojewski@intel.com>
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

