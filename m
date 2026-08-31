Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF1B4A3865
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 16:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788194318; cv=none; b=t+wdQT5haPdLTTH2pN0jd6VwvDb95yhGfdmZ43EjzwM8cO9LgCQOJRNQe5TTz0xA5uxbX5AFYEGiHEwFgtZsBHx+bWFTDZIsNDpbuvkR9BozK+q322g71xxQMDqdrclh0MlAnPsli4H4l4RqBzKQyP6AX4TJDrvvTid3dkWpF0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788194318; c=relaxed/simple;
	bh=wJFZUuMIAm9mhDweM/YwVpnEVP6A0DEftVGbt/9Rzrw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oz5BV66ZP/lJ+vSo+w46i/JxVRhrSLum5pjTa6ZGax/TEYGhJJZTUhOAcXBXdKh9Kjf+35SCg2/s79rMnAnPnSvcK0n97Yive+4aS4wryYBNx3gbIAez7ljhs2C1WyPNmqb0fQ1vmKyvQucOgT9eiT8Tz9sO6Z8/awOTs4Vvhto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YXrlX24c; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YXrlX24c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788194317; x=1819730317;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wJFZUuMIAm9mhDweM/YwVpnEVP6A0DEftVGbt/9Rzrw=;
  b=YXrlX24cFADb/WWRyPb6fRIOPmjCiWK1M8913GVNqLga/UgmEYwqw1eh
   /sZ4+jgDmiS2CHfQoJBT/7e/qGYhOvDynrCkwjymZcdujuLalWiLKdWms
   kZhG4bIch0fFRficn1kTYrb3ZrEAaH5pNXiPrVo4y4cBHHTBeE5dVMMa7
   /CFz4sO+d0Gv8ld22qXEerhBj1BT1VEISpb3HhoQ7Zw/FE76IvjTDsnr5
   QtLRzrecgCwEVz81319N3Osglh0+PcjlQ3Mpv0JTxzezT1ZOYnDsDxjlj
   iVT0fP62E4nrWrF4NIr6nC85eLLr0OEzQ4U4O4tmjf7IFVMad7LyrzEht
   Q==;
X-CSE-ConnectionGUID: 8yogtdEvQ6mYmixNqLv0Ug==
X-CSE-MsgGUID: k8GvMuWoTmi6Gf0nExd2kA==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="111379715"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="111379715"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 09:38:36 -0700
X-CSE-ConnectionGUID: /LaIZQRnR4qcBOJnFv455A==
X-CSE-MsgGUID: DrGwbmMMQPCl0JReua+BWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="274111758"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa005.fm.intel.com with ESMTP; 31 Aug 2026 09:38:35 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v3 02/10] ALSA: hda: ext: Clean up streams if their initialization fails
Date: Mon, 31 Aug 2026 18:42:25 +0200
Message-Id: <20260831164233.1487766-3-cezary.rojewski@intel.com>
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

snd_hdac_ext_stream_init_all() does not rollback changes done when
the allocation fails. Fix that to simplify its usage.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/hda/core/ext/stream.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/sound/hda/core/ext/stream.c b/sound/hda/core/ext/stream.c
index 517bd151fcc3..51adc42587b3 100644
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

