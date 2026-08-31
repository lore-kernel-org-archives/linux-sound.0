Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EAB33B6BE8
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 09:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788168719; cv=none; b=lXAtb2Ud9WYgnsq/AK3MSGH7dB/1vnSz2UfpirRGU2pGtVw02HVq5Y9zTZJqW6LNKNAurh+gJ3Sf0iMoBJHAAYfGJoHQzflvszA+MxwRfmJ90F0I78Lh+3UxantScBNSH1uSXg31CtG0gSZUqAEzBHhFiKeoaMxNUTLApNmur/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788168719; c=relaxed/simple;
	bh=BmulCiKGF+OSCtPoFGRDkyaqyy6MF64rBaYLjHU/yZw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DE6XreMlY1WzOYV4tveikeZTd9cJpoFcS+5MmYhnFd2japKDl7H/icr1xtZDzx0BYk+YS9dOal+tGoyTOhfrs/GObEOGaGkdMX9B3gxf2vK6g3Nq6e8q08bIhzkOG9bcZo+IhGQoumXRIOxpL6vtYbP3LupEhiXRiBRiF/0bx/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IHTMcnDf; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IHTMcnDf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788168716; x=1819704716;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BmulCiKGF+OSCtPoFGRDkyaqyy6MF64rBaYLjHU/yZw=;
  b=IHTMcnDfjQwH79SUEX+3dGd9rmUu8hhUun8Ms1uAudqA370HRF/ZzU8X
   bUiYhogZN4HXCJWDOwcVJGTqZ5r4V9IvZVEAkeDjeNt8uoHTCC/F1aZ4U
   l5vrSuPP6eBVmBBA42EWSk5x75L+vnKTOjoGQcYEpzZ8hyjIB+tA1/WIo
   WDk4+zmnVOOK8QWukLbsNslqYayZGo/r29KkP9MDBv5Ipt+/aw6AP9gA7
   WsTSIp2dbMqBwEaCZuutzA/CPt37r4mKwJSEZ5H1z33vDpPuSvwniR3Jr
   Ho2ZpAPwNwUFATRLEo0wGa7clCV33xRQB6GeoL2XepAw3nRzAPGf/R0lX
   w==;
X-CSE-ConnectionGUID: YUsh1qC/Qo24Mu15oxKw/w==
X-CSE-MsgGUID: hBhqECrWRHKHF+jWs6plSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="88332731"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="88332731"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 02:31:56 -0700
X-CSE-ConnectionGUID: 0mbYIJ/3RySLd5KcuVAN6w==
X-CSE-MsgGUID: x5gCg4mbSsqQiGXdnOfc6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="265507853"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa007.fm.intel.com with ESMTP; 31 Aug 2026 02:31:54 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 01/11] ALSA: hda: Clean up pages when stream buffers allocation fails
Date: Mon, 31 Aug 2026 11:36:05 +0200
Message-Id: <20260831093615.1117987-2-cezary.rojewski@intel.com>
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

snd_hdac_bus_alloc_stream_pages() does not clean up after itself when a
failure occurs in the middle of the function. Add a proper error path to
address that.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/hda/core/controller.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/sound/hda/core/controller.c b/sound/hda/core/controller.c
index 69e11d62bbfa..de9f7f047468 100644
--- a/sound/hda/core/controller.c
+++ b/sound/hda/core/controller.c
@@ -713,7 +713,7 @@ int snd_hdac_bus_alloc_stream_pages(struct hdac_bus *bus)
 					  BDL_SIZE, &s->bdl);
 		num_streams++;
 		if (err < 0)
-			return -ENOMEM;
+			goto err_bdl;
 	}
 
 	if (WARN_ON(!num_streams))
@@ -722,12 +722,22 @@ int snd_hdac_bus_alloc_stream_pages(struct hdac_bus *bus)
 	err = snd_dma_alloc_pages(dma_type, bus->dev,
 				  num_streams * 8, &bus->posbuf);
 	if (err < 0)
-		return -ENOMEM;
+		goto err_bdl;
 	list_for_each_entry(s, &bus->stream_list, list)
 		s->posbuf = (__le32 *)(bus->posbuf.area + s->index * 8);
 
 	/* single page (at least 4096 bytes) must suffice for both ringbuffes */
-	return snd_dma_alloc_pages(dma_type, bus->dev, PAGE_SIZE, &bus->rb);
+	err = snd_dma_alloc_pages(dma_type, bus->dev, PAGE_SIZE, &bus->rb);
+	if (err)
+		goto err_rb;
+	return 0;
+
+err_rb:
+	snd_dma_free_pages(&bus->posbuf);
+err_bdl:
+	list_for_each_entry_continue_reverse(s, &bus->stream_list, list)
+		snd_dma_free_pages(&s->bdl);
+	return err;
 }
 EXPORT_SYMBOL_GPL(snd_hdac_bus_alloc_stream_pages);
 
-- 
2.34.1

