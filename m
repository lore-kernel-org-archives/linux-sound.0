Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ca5Btytg"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C52E8D54
	for <linux-sound@vger.kernel.org>; Fri,  8 Dec 2023 05:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702041710; x=1733577710;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=INYEZxBxqRaIsm66kA/f8L3nXnHuIjoICI5+h0zKKFM=;
  b=ca5BtytgJRB0zfpdZqePWHdSMCeEEhLaQ9s57qjqvtVX0Eaj7XmA3f2t
   8Flyv8hNVuf6NMyO+ptRkFAEX+7j2JsVEgYh/gXiHfOvlGC+vc8S6RlcJ
   odoG+1o6BQcKvJVwAnwE2MZkKDcGy1xZEtRCPJMMbEDLLwKu4aDgrOhuR
   KyAo5X1rZ7YRswZlJ817GxVUPjC/Z2sB26xpP6xPGL634Pornu5oB/2VI
   3jvWJvBA1unxcYoBXhJDoaAptopoFHS6A8TO32jsOFdPD6YSB+W+fNr1L
   Ipo4Su9fhTSub/woxYkxYaZQ+qWId5vAD+8xEZ5T4C6ubqydiZ6Fcqhgi
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="394141776"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; 
   d="scan'208";a="394141776"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2023 05:21:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="915948520"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; 
   d="scan'208";a="915948520"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
  by fmsmga001.fm.intel.com with ESMTP; 08 Dec 2023 05:21:48 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: linux-sound@vger.kernel.org,
	tiwai@suse.de
Cc: kai.vehmanen@linux.intel.com,
	alsa-devel@alsa-project.org,
	=?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
	Jani Saarinen <jani.saarinen@intel.com>
Subject: [PATCH 1/2] ALSA: hda/hdmi: add force-connect quirk for NUC5CPYB
Date: Fri,  8 Dec 2023 15:21:26 +0200
Message-ID: <20231208132127.2438067-2-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231208132127.2438067-1-kai.vehmanen@linux.intel.com>
References: <20231208132127.2438067-1-kai.vehmanen@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add one more older NUC model that requires quirk to force all pins to be
connected. The display codec pins are not registered properly without
the force-connect quirk. The codec will report only one pin as having
external connectivity, but i915 finds all three connectors on the
system, so the two drivers are not in sync.

Issue found with DRM igt-gpu-tools test kms_hdmi_inject@inject-audio.

Link: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/3
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Jani Saarinen <jani.saarinen@intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/pci/hda/patch_hdmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index dff2d7221982..88d7e037a57c 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -1994,6 +1994,7 @@ static const struct snd_pci_quirk force_connect_list[] = {
 	SND_PCI_QUIRK(0x103c, 0x8711, "HP", 1),
 	SND_PCI_QUIRK(0x103c, 0x8715, "HP", 1),
 	SND_PCI_QUIRK(0x1462, 0xec94, "MS-7C94", 1),
+	SND_PCI_QUIRK(0x8086, 0x2060, "Intel NUC5CPYB", 1),
 	SND_PCI_QUIRK(0x8086, 0x2081, "Intel NUC 10", 1),
 	{}
 };
-- 
2.43.0

