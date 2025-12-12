Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F5421E091
	for <linux-sound@vger.kernel.org>; Fri, 12 Dec 2025 17:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765561637; cv=none; b=gIB/wxkp/h7spQ8hc7Q2HcCdl+xw2jbY1Kkq6XAP05/LRnqnkEOj3h/5l+/pgOdkZoDneKjGUJv9js6clQhgCb5j1pMZuqpcmMmJjnUqyQn5cgcEmane9BENhGFkJQsbySXir0peMwjs4x0jg1OUyNmWLDL9pJL6S7+OmK2XV0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765561637; c=relaxed/simple;
	bh=IM1IBO+kbzu/d4XSHpTAqRqxUfz/BLHNNEbmz3aFEoU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BET1lpvGtCAZwtedRQJogEWxr/L25352sQLKSVE9wpv4MwrfPwvo9cEly8wiKpOwVoVWpeAWGJb2POIfE8GBi3czlrVOa/34K2+bcPUTsW84a9XO3jlLt+7N8ZlqiBm9uzqAdIeu8bHAMbZ6unXSbmnbsKXSVjaRP52npvHYU+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i8BAElzO; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i8BAElzO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765561636; x=1797097636;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=IM1IBO+kbzu/d4XSHpTAqRqxUfz/BLHNNEbmz3aFEoU=;
  b=i8BAElzOsv3TcooGC8VTqzmQr3CIDbo+bdRVKh8hw0iLotVCpPBzb3Ml
   4xx47L4t7DPRGpblSNcXgH2bxU7TgGSs5hiAD5AmAk/M+HFOSMbclW/HN
   w0P5cCZJ2YHzhjwX8naD9IDBbXGucp2yAnY6OxgAbuBSWX6kDIVFZ894Z
   swCp3VKCzl9W7YXrYPUDBaDyt7bR/rZ7QV/ULfndwj1NEinvHNBUeLWwK
   rjAUfUkEkwmvm5dgO+uZKrih10mI9/qroPzTWShuxh5Ndy7TVyzPor9Gs
   ReTwH/DFyWjRLQXHaue+JXauBP4h6sjGIk1kOadsXRBnAHAllY8yp3M8K
   w==;
X-CSE-ConnectionGUID: yJ3CS7JpRHOVmUSZEdnaLA==
X-CSE-MsgGUID: 4z4XXP2vTo+3uXXv2h0Y0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="67640942"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="67640942"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 09:47:15 -0800
X-CSE-ConnectionGUID: +UEvY6ReQKmZml7bZEDWsw==
X-CSE-MsgGUID: iPXSgIgYQUiu4q3krNDL5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="202074060"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kvehmane-desk1..) ([10.245.245.125])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 09:47:13 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: tiwai@suse.de
Cc: Jaroslav Kysela <perex@perex.cz>,
	Kailang Yang <kailang@realtek.com>,
	Chris Chiu <chris.chiu@canonical.com>,
	Edip Hazuri <edip@medip.dev>,
	linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	davplsm <davpal@yahoo.com>
Subject: [PATCH] ALSA: hda/realtek: enable woofer speakers on Medion NM14LNL
Date: Fri, 12 Dec 2025 19:46:58 +0200
Message-ID: <20251212174658.752641-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ALC233 codec on these Medion NM14LNL (SPRCHRGD 14 S2) systems
requires a quirk to enable all speakers.

Tested-by: davplsm <davpal@yahoo.com>
Link: https://github.com/thesofproject/linux/issues/5611
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 171a71457ec3..c8a9b9b15cb4 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7296,6 +7296,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1d72, 0x1901, "RedmiBook 14", ALC256_FIXUP_ASUS_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1d72, 0x1945, "Redmi G", ALC256_FIXUP_ASUS_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1d72, 0x1947, "RedmiBook Air", ALC255_FIXUP_XIAOMI_HEADSET_MIC),
+	SND_PCI_QUIRK(0x1e39, 0xca14, "MEDION NM14LNL", ALC233_FIXUP_MEDION_MTL_SPK),
 	SND_PCI_QUIRK(0x1ee7, 0x2078, "HONOR BRB-X M1010", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1f66, 0x0105, "Ayaneo Portable Game Player", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x2014, 0x800a, "Positivo ARN50", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),

base-commit: fd324768eb2c132bb111ba76675b4c72406251d9
-- 
2.43.0

