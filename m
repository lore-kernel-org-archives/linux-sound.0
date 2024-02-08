Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2BDC41C74
	for <linux-sound@vger.kernel.org>; Thu,  8 Feb 2024 16:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707410354; cv=none; b=fVK+INnx27ETfnuFoZXaml9Tw6eq3Df31be8+l+L2/jGNGqt5pdsu2Ub35ufH+O567QVhuuN+4H3L0qvk83vTTsXnZPVoDzasuOXr01pgHnAMp+azsJdAQ+7ukI1WTLXSALTvkaVWyuHtUD7e1M/qhDppJq6PSvUuNS0WDyUxBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707410354; c=relaxed/simple;
	bh=mqS9lw9rTFCFRqh4I38rzrLdGyE8889OqTSvXKvtVh0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=abdn1vpM6eSKMRG0H/mggV9lHNvoHeGWhRR5FOHBkrkP8sHqVwvAcZTxNqi+R2fQYoi/qxj4LE+QJmq+0G8NvIHovTqdYKNnadSpODUlzDIB1Fr1a2Dnjoc0kSZlr1Q+MfmPV4WAJVhLU3uJb01wxwISnYbmnz3iK1+DiKZNuf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K1UNRmHq; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K1UNRmHq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707410353; x=1738946353;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mqS9lw9rTFCFRqh4I38rzrLdGyE8889OqTSvXKvtVh0=;
  b=K1UNRmHquhIiZJ8/it8CKTma3cTriZBveZguHn4YN/mMan9izYJR08Oi
   QT09w4es6Q1w411Ekbdwh3zSxqSbH98Nl9GxI3+V1mGENorgZ4fMNb5NG
   Qvf6RCYP+rhboTYoXcz2ZHy21u0Hk3ZwkXGt+1SEcMynEd7Pp1x1scPnX
   G+VxBbwiCM8wLkHxmMDpfNV2O8yw8bzP8d8UHYo6F5riTGBeHnjr8fB2I
   1s3a+Iw5E6wa0UlS9le7og6Q3+sRFdpeqh1vxJRJSpzmjJUs5zKk7O2WX
   ao9qhj3kt92ZMRpn5mCMAlz0iyXVc1cYpuKQ5/yQtsLGDpZWgygGTNjza
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="1120319"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="1120319"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 08:39:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="2068825"
Received: from stang1-mobl1.amr.corp.intel.com (HELO localhost.localdomain) ([10.212.92.130])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 08:39:12 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	"Sayed, Karimuddin" <karimuddin.sayed@intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Sayed,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH] ALSA: hda/realtek: Add "Intel Reference board" SSID in the ALC256.
Date: Thu,  8 Feb 2024 10:39:04 -0600
Message-Id: <20240208163904.92977-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "Sayed, Karimuddin" <karimuddin.sayed@intel.com>

Add "Intel Reference board" SSID in the alc256.
Enable "power saving mode" and Enable "headset jack mode".

Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Sayed, Karimuddin <karimuddin.sayed@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index f6f16622f9cc..0052a654204d 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10081,6 +10081,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x10ec, 0x1252, "Intel Reference board", ALC295_FIXUP_CHROME_BOOK),
 	SND_PCI_QUIRK(0x10ec, 0x1254, "Intel Reference board", ALC295_FIXUP_CHROME_BOOK),
 	SND_PCI_QUIRK(0x10ec, 0x12cc, "Intel Reference board", ALC295_FIXUP_CHROME_BOOK),
+	SND_PCI_QUIRK(0x10ec, 0x12f6, "Intel Reference board", ALC295_FIXUP_CHROME_BOOK),
 	SND_PCI_QUIRK(0x10f7, 0x8338, "Panasonic CF-SZ6", ALC269_FIXUP_HEADSET_MODE),
 	SND_PCI_QUIRK(0x144d, 0xc109, "Samsung Ativ book 9 (NP900X3G)", ALC269_FIXUP_INV_DMIC),
 	SND_PCI_QUIRK(0x144d, 0xc169, "Samsung Notebook 9 Pen (NP930SBE-K01US)", ALC298_FIXUP_SAMSUNG_AMP),
-- 
2.40.1

