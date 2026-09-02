Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E18E373BF1
	for <linux-sound@vger.kernel.org>; Wed,  2 Sep 2026 08:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788336850; cv=none; b=nvII/m9E0OSgB5vwk4CblSgItS09JAJ3hMyOhaqStEMuAgQ4JCWaGrXjttX+qFxqTuRJHmvvXKTVCaAdGF/sz/0u7ZsHQCNNAiXAdvmUbgBhKkE47HWjvZUbmU2pyWZzFRZZMxcIyxyqF4E5xObPsJmVLBmt6dfrUXQiijObZKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788336850; c=relaxed/simple;
	bh=4VAQ6NCZteUP8/wD5dvAfboze3XDj5NY+2bSI0Mcifk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=H4aVesQFtCTskT3DdzIY9+WMu22LQL/IIdz/XT+9XdaKuHmDAbvoH7L2NednkG+P636VtRbA29/Sai35QjBdkTOMnncV/0faWxG585wXMo77lKxG4Cu+/7tdQOtqoS+fsXBGBaBRzcNAHFFEMpKmuj4dJBbNV0OQIi89RgplRUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B0mnx9gd; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B0mnx9gd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788336848; x=1819872848;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4VAQ6NCZteUP8/wD5dvAfboze3XDj5NY+2bSI0Mcifk=;
  b=B0mnx9gdyfHx/EGUny9GjsO85hsbqOTlKiEf5NzojKv99937UVq6HTIP
   PJTPyCKTYLKx+by1oAHf5nSrLUf48SdC59Zlqhl1cNUi/vWr/M5XyuAHg
   wVqm5rDuzzYp1G3P5rRwirdBik3ZudbL55EcD4f3HPjBZKlZcFbf2YN1C
   wv44VEFOeAc1ccbWRgBvbg9ez5n1pOMSDhL0M9bRSIycrjjGO1TvkPxt+
   V2pg5xB1yJN7fbw2Ydjw4AE3bEMCLo37Q9nAJoaixMo4YZl9y5F5oeHbQ
   G65+jHbjyVH39jHAsjqZtdZhimDtqDk2Ove3uRvRlVjV7d8uAl70eqm4B
   A==;
X-CSE-ConnectionGUID: qOJxOPi7SuK2ETRKU1bpWw==
X-CSE-MsgGUID: v3UAYAVDSV2aJNgd5TsB3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="99120960"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="99120960"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 01:14:08 -0700
X-CSE-ConnectionGUID: T6uiRr8wSmubXq/kiofnPw==
X-CSE-MsgGUID: diA1fZ2wRWWq460rXqfyzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="266099059"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa007.fm.intel.com with ESMTP; 02 Sep 2026 01:14:06 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v4 02/10] ALSA: hda: ext: Clean up streams if their initialization fails
Date: Wed,  2 Sep 2026 10:18:06 +0200
Message-Id: <20260902081814.1590883-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260902081814.1590883-1-cezary.rojewski@intel.com>
References: <20260902081814.1590883-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

snd_hdac_ext_stream_init_all() does not rollback changes done when
the allocation fails. Fix that to simplify its usage.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/hda/core/ext/stream.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/hda/core/ext/stream.c b/sound/hda/core/ext/stream.c
index 517bd151fcc3..1f96e0484660 100644
--- a/sound/hda/core/ext/stream.c
+++ b/sound/hda/core/ext/stream.c
@@ -102,8 +102,10 @@ int snd_hdac_ext_stream_init_all(struct hdac_bus *bus, int start_idx,
 
 	for (i = 0; i < num_stream; i++) {
 		struct hdac_ext_stream *hext_stream = kzalloc_obj(*hext_stream);
-		if (!hext_stream)
+		if (!hext_stream) {
+			snd_hdac_ext_stream_free_all(bus);
 			return -ENOMEM;
+		}
 		tag = ++stream_tag;
 		snd_hdac_ext_stream_init(bus, hext_stream, idx, dir, tag);
 		idx++;
@@ -111,7 +113,6 @@ int snd_hdac_ext_stream_init_all(struct hdac_bus *bus, int start_idx,
 	}
 
 	return 0;
-
 }
 EXPORT_SYMBOL_GPL(snd_hdac_ext_stream_init_all);
 
-- 
2.34.1

