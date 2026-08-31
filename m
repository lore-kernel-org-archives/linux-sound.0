Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F01F3DCD85
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 09:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788168720; cv=none; b=nBmbAHoKaVkvY0JUimN0otSmB2OcWqc6BzwCrPj6deqMxO+4LsnKQCFDSIuhto9mhhFfrq02i1CflgsotgHyqFpfkDAhYcYD6t14UiVbf8Ow5SAfe5p/HKb6c/EJgRBDS8ed+S+zQtMezIZX3WfzMMKbitLLmIpovTvKVciVnmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788168720; c=relaxed/simple;
	bh=3Vrm6uu6gvM9tNsTVN4vWJraWnnow/aTvTWRljhMO/Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=n1n/3a83pWlwYGkvj4vXhc3yCVvw6JDXYcvJtkdpdBMvssDY+GXK/ucwu2n5tlm/3RMHqHeBwAqrOTjMb0Hs2SU2/Ht6DiqdidcQRZgrPOPAtYqBiDSc7SXDoSzS0wGMktkHb3p9evXqqOUhkQSTtRNi/yxNTtOyuJN3ncZs528=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z2pZEbkl; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z2pZEbkl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788168719; x=1819704719;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3Vrm6uu6gvM9tNsTVN4vWJraWnnow/aTvTWRljhMO/Q=;
  b=Z2pZEbkl24C5w/RdcdHDEFqfI94yI+VXRCo0ze6QHqBxC0ltQ4T8LBvl
   u0uH/8AfpdJ+h8GXwPld53Lu0e9yHC6Vsyb4HWadm0bFBI5IDUvEUU+iO
   FjDXimtRNkHvY132mJSe8qn8WDVXLBTMVX0LLZHVxj9yCQ7+YxLGC+r6n
   e8/EHW67TWftM7ERL7hAI3+fch8FG+RyHzJ3KW3Wd7TSWjWIasohV55j1
   A4HMRuaynhYfhh4wgvofZwufy3va6/NPTapFem1nln4qgYS7hhQaXlcst
   0FNsxPyGh4Jp3PE2xNMdMQ7tn+xPfOR2YjXTxG+5ENB2mj5sD3f7zqsI+
   Q==;
X-CSE-ConnectionGUID: NUmNauc8S7uM/s+u9yjlMQ==
X-CSE-MsgGUID: xPMEMv51TnSixtSjWKup3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="88332800"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="88332800"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 02:31:59 -0700
X-CSE-ConnectionGUID: ISoKtfIxR8edKGVufPWD/w==
X-CSE-MsgGUID: 3QyfGGYiTe6cHfWh8V4pjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="265507899"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa007.fm.intel.com with ESMTP; 31 Aug 2026 02:31:57 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 03/11] ALSA: hda: ext: Clean up streams if their initialization fails
Date: Mon, 31 Aug 2026 11:36:07 +0200
Message-Id: <20260831093615.1117987-4-cezary.rojewski@intel.com>
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

