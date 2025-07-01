Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FB6270551
	for <linux-sound@vger.kernel.org>; Tue,  1 Jul 2025 13:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751376844; cv=none; b=O62xhWchzcNZZxTtrtxHNPqsEqYzO4LSSaBo5WrfS9Erw5T6sNb05rbSQa/APkl0Y52pqI5+MvieFYrLD2nn2FZ0eyajd4PB+TxYn5pl3jFQ8dZK2uM4E06Q1UnYqwMGx0cW8IpBqxvwNT5rKBWq3j9rESDU1IaurT7VxSvTGnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751376844; c=relaxed/simple;
	bh=XnCPOpgL+RbqiVcZT3VI/ogEb4n8kyy7+LGcc+G9AWs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=drvhX6/7UlYwOMUPEMbFSwHc0f/NOp+cTjc2XPOb7MJhr72Lov9fgXW7K0COlHBrRABR2vEm7cz5lTuN7Z4oQ45B8jisrHy+d2PNWVw1h30SGCC1f32lUaS/ipXQXugpFE2MDIkERTwngFZLiBq3P1QrxmVQiT3fy/4FApsC7Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=avwmcFIR; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="avwmcFIR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751376843; x=1782912843;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=XnCPOpgL+RbqiVcZT3VI/ogEb4n8kyy7+LGcc+G9AWs=;
  b=avwmcFIRmklEjVvhBTiFjmtihlEPEvirn+/RYz3IdZ5FYLLwPTO09vJr
   g35rl7TAM162AFQB+dfVVTCOzsw7matQS3Ukj6uuiEJi2GQqItqoZtE0R
   d5E+cXnJfO4/efzpcMcSKVWL4U3pnyGTGxfLXbeLaumU1iT4DX5qWV5vF
   gLbSNGZJlN7xwPASRRne/e/v3sHZ9To2/v9j9rOrrNkMzuqu8G/H1k7Vn
   pKRkrrmfhs9X4qOjIOl0hsz6hRWkoInnpp7LmdLVIebtyd2ATSKuC+Isw
   IcnLey/ZtMPgs8LBLEM3DL1OkJbMXogo0yNSVJtiD5oEvIZpzzypz9dVb
   A==;
X-CSE-ConnectionGUID: FU2JBpR9SDShF9RhcgidKQ==
X-CSE-MsgGUID: uDXrO0pyRyySdY9LuDZK2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="56269409"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="56269409"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 06:34:02 -0700
X-CSE-ConnectionGUID: Fj5nuxLdS0uUvtyecw2e1A==
X-CSE-MsgGUID: 1OYp+aEwQ2OQoh5FowqXGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="159284687"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.240])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 06:34:01 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: tiwai@suse.com,
	perex@perex.cz
Cc: kailang@realtek.com,
	linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek: Add quirk for ASUS ExpertBook B9403CVAR
Date: Tue,  1 Jul 2025 16:34:11 +0300
Message-ID: <20250701133411.25275-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ASUS ExpertBook B9403CVAR needs the ALC294_FIXUP_ASUS_HPE for the
headphones to work.

Closes: https://github.com/thesofproject/linux/issues/5472
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 614306db2cb6..acb121ac96d3 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -11064,6 +11064,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x1e63, "ASUS H7606W", ALC285_FIXUP_ASUS_GU605_SPI_SPEAKER2_TO_DAC1),
 	SND_PCI_QUIRK(0x1043, 0x1e83, "ASUS GA605W", ALC285_FIXUP_ASUS_GU605_SPI_SPEAKER2_TO_DAC1),
 	SND_PCI_QUIRK(0x1043, 0x1e8e, "ASUS Zephyrus G15", ALC289_FIXUP_ASUS_GA401),
+	SND_PCI_QUIRK(0x1043, 0x1e93, "ASUS ExpertBook B9403CVAR", ALC294_FIXUP_ASUS_HPE),
 	SND_PCI_QUIRK(0x1043, 0x1eb3, "ASUS Ally RCLA72", ALC287_FIXUP_TAS2781_I2C),
 	SND_PCI_QUIRK(0x1043, 0x1ed3, "ASUS HN7306W", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x1043, 0x1ee2, "ASUS UM6702RA/RC", ALC287_FIXUP_CS35L41_I2C_2),
-- 
2.50.0

