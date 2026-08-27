Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FEDC20D4FC
	for <linux-sound@vger.kernel.org>; Thu, 27 Aug 2026 13:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787836287; cv=none; b=UeR6e9JrRKqSDRjekGzu5O9hcpYg5Kk5Vql6gqGyqi44tqG/MquYvQA/oxHtc/5wlDtEy9964mlvmxCbci4pi55ZIHwwmvJFQ8YgQECI/d51Ao9cDVT+zmyElD4Ycpqix3mqnsLXvinQ3ZIHLJh6/bvC9qF8YOD6O1tREICbhtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787836287; c=relaxed/simple;
	bh=3Vrm6uu6gvM9tNsTVN4vWJraWnnow/aTvTWRljhMO/Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JKOkg+mNSip5ZXnWbIGyUgPDsZ2UOoNGpiB4Gv7nox3aOKbCsOH6Bdk+CWCFubTLK/0/SEaOuhct69CNsrle33nxPuHrMEiDIDaIYFfnbxnIbSgIe+j8owRNQZYaypW+NuGTdAM7VHovOWZtfhbUYIthq2D7s+UnkwRNJiX0UzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DRaDGdBS; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DRaDGdBS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787836277; x=1819372277;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3Vrm6uu6gvM9tNsTVN4vWJraWnnow/aTvTWRljhMO/Q=;
  b=DRaDGdBSqM3kdwlkIIMzUY8qX1OHjCOn7YIqCqKRlt9y3xWNi94y8VQY
   PDvYqntgIfFP/An5J4VgW0+C40pZDkOOB4lciO5onWgc+0Nc2NAGsvoiC
   sEdFAIA7y3BAgGWbldmoa2bHobRwNyTpEzDl+hE4pTMSJewG0ZYq4Wk1w
   pEBnoCo3bMh/vMO7qORdyDvCZXhoucfCuUkjYdChfOcT7M8B+e4IJjPaP
   CPOVAQN1yn8Zdw2IRhsJoeBCtkIbEE51RrqWPKrtOBI8//dEjgGvVRwkA
   RX+pspzRTojq3IS/nOkd5YljFVWhHQ3O1tx4A5cPgMtPyBS8+3aqGeWny
   w==;
X-CSE-ConnectionGUID: S04Wkqj0T3GvU5l6CwZZQw==
X-CSE-MsgGUID: Gu9q6ETlT9OWzra8P8mcLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88539041"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="88539041"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 06:10:54 -0700
X-CSE-ConnectionGUID: 9/V8JDeTSZKArGJNYnJZ2A==
X-CSE-MsgGUID: HhhIkIKpTkW8Aq+LKTsVKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="263589333"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa006.fm.intel.com with ESMTP; 27 Aug 2026 06:10:50 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 02/10] ALSA: hda: ext: Clean up streams if their initialization fails
Date: Thu, 27 Aug 2026 15:15:02 +0200
Message-Id: <20260827131510.1014084-3-cezary.rojewski@intel.com>
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

snd_hdac_ext_stream_init_all() does not rollback changes done when
the allocation fails. Fix that to simplify its usage.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/hda/core/ext/stream.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/sound/hda/core/ext/stream.c b/sound/hda/core/ext/stream.c
index 4c7506d49f55..7237fd9bb4b6 100644
--- a/sound/hda/core/ext/stream.c
+++ b/sound/hda/core/ext/stream.c
@@ -94,6 +94,7 @@ int snd_hdac_ext_stream_init_all(struct hdac_bus *bus, int start_idx,
 	int (*setup_op)(struct hdac_stream *, bool);
 	int stream_tag = 0;
 	int i, tag, idx = start_idx;
+	struct hdac_stream *s, *_s;
 
 	if (pci->device == PCI_DEVICE_ID_INTEL_HDA_APL)
 		setup_op = snd_hdac_apl_host_stream_setup;
@@ -103,7 +104,7 @@ int snd_hdac_ext_stream_init_all(struct hdac_bus *bus, int start_idx,
 	for (i = 0; i < num_stream; i++) {
 		struct hdac_ext_stream *hext_stream = kzalloc_obj(*hext_stream);
 		if (!hext_stream)
-			return -ENOMEM;
+			goto err_nomem;
 		tag = ++stream_tag;
 		snd_hdac_ext_stream_init(bus, hext_stream, idx, dir, tag);
 		idx++;
@@ -112,6 +113,14 @@ int snd_hdac_ext_stream_init_all(struct hdac_bus *bus, int start_idx,
 
 	return 0;
 
+err_nomem:
+	list_for_each_entry_safe(s, _s, &bus->stream_list, list) {
+		struct hdac_ext_stream *hext_stream = stream_to_hdac_ext_stream(s);
+
+		list_del(&s->list);
+		kfree(hext_stream);
+	}
+	return -ENOMEM;
 }
 EXPORT_SYMBOL_GPL(snd_hdac_ext_stream_init_all);
 
-- 
2.34.1

