Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5A533F5A0
	for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 12:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785415871; cv=none; b=Q4Y3yZ3qCCY7huBsuXItLAttEYlCsIhUM46UEzIDNDPnQf5de9RKtz2acTsPCndvAAcpgMMv7CpoEbveJKQIthcq031kcpo0iYQRLMkAGdOnPoIseirEIieiQ9W0T1AY/zLYLgsOWytJU9fXDael9+n+anu6qye/xUTc+mBmn20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785415871; c=relaxed/simple;
	bh=41kOxf/iPvvEaKkSuRWcWy0j+OSp1xgTg6/v6luzu0o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T3aS1DzXtjILsvN8RXq1bCzfnMJ5JCGGi0oZ6cr58b3s608L2Rbg6qq0zJOolIlU0S8Kb+/CcIIB6LKq/aPbdi/ETnAzciyo140/HjUg/0GktKzoITHx9JPa+kFcErG48JjpnJOvoc6as49nIXpIVWUFVNf2B9/geo3XEYKH5gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lNdTAPWs; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lNdTAPWs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785415864; x=1816951864;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=41kOxf/iPvvEaKkSuRWcWy0j+OSp1xgTg6/v6luzu0o=;
  b=lNdTAPWsNtmiVJ0ddv1T0H1DN3BXvxBzTJAMwe1ljiq0W5r3uVOY0nDy
   jIcar3A/CN9Q3U7R4ci7OQ6g+vJAWSNlaECYoidg1+1DlLYn0oaxz1oD1
   K9a5iHULh+2sxlf1NTnTl1UDlu0dGFktDDY375o8LPMogm/9f4UC6Cfeh
   YM5VuhMHRXYF05Sv0YhhSfCzdlt6dV/YG81lRS1M/cr5utzwcr++nLfHi
   vCWtxQbP7a3IV3QEggwa1dCD/jWi8TmBr+6FofYzxud971Imw2JLC8smU
   f22AGbAvnLS54bgr7J89UCO+qQfwqFs1NltgiggUYalwyh7jvZlqM2SDp
   w==;
X-CSE-ConnectionGUID: 6zq86x/PS5enFxdEK+GjBA==
X-CSE-MsgGUID: gnRE3atvSFeIghucdBsoog==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="103439264"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="103439264"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 05:50:58 -0700
X-CSE-ConnectionGUID: +rSXfk8bT7ypLWn35HV0mA==
X-CSE-MsgGUID: lPKXhiQOR/awa07SeVA8Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="283638670"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.79])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 05:50:56 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	liam.r.girdwood@intel.com
Subject: [PATCH 1/4] ASoC: SOF: Intel: hda: Fold mlink enumeration into hda_dsp_ctrl_init_chip()
Date: Thu, 30 Jul 2026 15:51:27 +0300
Message-ID: <20260730125130.29887-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260730125130.29887-1-peter.ujfalusi@linux.intel.com>
References: <20260730125130.29887-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the hda_bus_ml_init() call from hda_init_caps() into
hda_dsp_ctrl_init_chip(), right after the HDA controller reset has
been de-asserted and unsolicited responses have been accepted.

hda_dsp_ctrl_init_chip() already calls hda_bus_ml_reset_losidv() at
the end of its sequence to clear the stream-to-link mapping. On first
boot this call was a no-op because the multi-link list had not yet
been populated: hda_bus_ml_init() only runs later in hda_init_caps().
Enumerating the links inside init_chip() makes the LOSIDV reset
effective on first boot as well, without adding a second reset call
from the probe path.

hda_bus_ml_init() now returns early when the hlink_list is already
populated, so the subsequent invocations from the D3 resume path
(hda_resume() -> hda_dsp_ctrl_init_chip(false)) are no-ops.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 sound/soc/sof/intel/hda-ctrl.c  | 8 ++++++++
 sound/soc/sof/intel/hda-mlink.c | 4 ++++
 sound/soc/sof/intel/hda.c       | 2 --
 3 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/hda-ctrl.c b/sound/soc/sof/intel/hda-ctrl.c
index 8332d4bda558..a9ead78d3fcb 100644
--- a/sound/soc/sof/intel/hda-ctrl.c
+++ b/sound/soc/sof/intel/hda-ctrl.c
@@ -223,6 +223,14 @@ int hda_dsp_ctrl_init_chip(struct snd_sof_dev *sdev, bool detect_codec)
 	/* Accept unsolicited responses */
 	snd_hdac_chip_updatel(bus, GCTL, AZX_GCTL_UNSOL, AZX_GCTL_UNSOL);
 
+	/* Perform a one-time enumeration of the Multi-Link capability */
+	ret = hda_bus_ml_init(bus);
+	if (ret < 0) {
+		dev_err(sdev->dev, "%s: failed to enumerate multi-links\n",
+			__func__);
+		goto err;
+	}
+
 	if (detect_codec)
 		hda_codec_detect_mask(sdev);
 
diff --git a/sound/soc/sof/intel/hda-mlink.c b/sound/soc/sof/intel/hda-mlink.c
index 92314e3b568a..ca8551befdb5 100644
--- a/sound/soc/sof/intel/hda-mlink.c
+++ b/sound/soc/sof/intel/hda-mlink.c
@@ -432,6 +432,10 @@ int hda_bus_ml_init(struct hdac_bus *bus)
 	if (!bus->mlcap)
 		return 0;
 
+	/* Enumeration is a one time operation, skip if already done */
+	if (!list_empty(&bus->hlink_list))
+		return 0;
+
 	link_count = readl(bus->mlcap + AZX_REG_ML_MLCD) + 1;
 
 	dev_dbg(bus->dev, "HDAudio Multi-Link count: %d\n", link_count);
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index dc85903b8d46..26db0e46b827 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -625,8 +625,6 @@ static int hda_init_caps(struct snd_sof_dev *sdev)
 		return ret;
 	}
 
-	hda_bus_ml_init(bus);
-
 	/* Skip SoundWire if it is not supported */
 	if (!(interface_mask & BIT(SOF_DAI_INTEL_ALH)))
 		goto skip_soundwire;
-- 
2.55.0

