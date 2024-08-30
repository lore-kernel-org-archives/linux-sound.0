Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93DB41531FE
	for <linux-sound@vger.kernel.org>; Fri, 30 Aug 2024 07:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725002715; cv=none; b=EgNhZbOxh1PvUTxUD2twjD8O7P9PaF36FX+zquMTK9JEAwwUNI5c8JA/oI/NbewKtFOCCkij+94bWAxu5oFN1y35YPSXJLazTuOck7Yxs628xaIRq3TdGJRuYqBjFoQhsuBGejvd3F2BRum7BnmUDTsPRZOIvqHoBipIVi3bzOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725002715; c=relaxed/simple;
	bh=hRtnmgq6/i+1ww35w6YdNWKJllCEkWo6iKOURc59qu4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RHBr4Cfbrb+6cKvlfeCCjWHHHqSrztV4zsrP05Jl1anm2pS/nHejNl1zVEl4QNEPCgInf+suuLe/izpHqk1aHQQiSTVorp1aZpjK4/8To75s8jnxsWuaM+brZ6IxvUxDq27x7eSXDE5y8cI6Ec2gMyZ8zdDB1Xdx/BnZK9WNlwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YoQLE0gY; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YoQLE0gY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725002714; x=1756538714;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=hRtnmgq6/i+1ww35w6YdNWKJllCEkWo6iKOURc59qu4=;
  b=YoQLE0gYV9XFXJE/zQaiy6FntJ45k3GcKPL9hmubV11DAwX+zmi42Y1/
   vdBtXBuUOl8bOvN9AqIJMKVRV9PAKoy3v6bprhFTVyN+FA3QUdLTyI/2s
   RxwNAyHYEmlvkQyKvxhsXizrX0aSq7QS8CqsW9cvPTAMJIJSNQLB9Ujw+
   02qoJfoCjM0SwiICPVi5j5y/mYbpv7+qYIyLGw518pLqckqfhc0uuHi7A
   C9HxtWe5bJJNXqhoe/BnK6tIFj+V2ri88o4ZfGlFqgrD02xPdDX0iFbRd
   3u8LbBPRq3fMT4tTIp5QLgpvwLA+NLH4pxSdsuGoceMEbv+au7PLuDtZt
   g==;
X-CSE-ConnectionGUID: e1r2uzPKTCaBrBaFc9sLyg==
X-CSE-MsgGUID: Vzi9brn7Szq2EdGhGy94jA==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="27392900"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="27392900"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 00:25:13 -0700
X-CSE-ConnectionGUID: ZRmqUAWcT8Cx6QCF48LLmA==
X-CSE-MsgGUID: q/9301tXQXK3R8a5srKGaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="101329396"
Received: from unknown (HELO yungchua-desk.intel.com) ([10.247.118.125])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 00:25:09 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH] ALSA: hda: add HDMI codec ID for Intel PTL
Date: Fri, 30 Aug 2024 15:24:58 +0800
Message-ID: <20240830072458.110831-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Kai Vehmanen <kai.vehmanen@linux.intel.com>

Add HDMI codec ID for Intel Panther Lake platform.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/pci/hda/patch_hdmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 78042ac2b71f..643e0496b093 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -4639,6 +4639,7 @@ HDA_CODEC_ENTRY(0x8086281d, "Meteor Lake HDMI",	patch_i915_adlp_hdmi),
 HDA_CODEC_ENTRY(0x8086281e, "Battlemage HDMI",	patch_i915_adlp_hdmi),
 HDA_CODEC_ENTRY(0x8086281f, "Raptor Lake P HDMI",	patch_i915_adlp_hdmi),
 HDA_CODEC_ENTRY(0x80862820, "Lunar Lake HDMI",	patch_i915_adlp_hdmi),
+HDA_CODEC_ENTRY(0x80862822, "Panther Lake HDMI",	patch_i915_adlp_hdmi),
 HDA_CODEC_ENTRY(0x80862880, "CedarTrail HDMI",	patch_generic_hdmi),
 HDA_CODEC_ENTRY(0x80862882, "Valleyview2 HDMI",	patch_i915_byt_hdmi),
 HDA_CODEC_ENTRY(0x80862883, "Braswell HDMI",	patch_i915_byt_hdmi),
-- 
2.43.0

