Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256A1472067
	for <linux-sound@vger.kernel.org>; Thu,  8 Oct 2026 09:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791450027; cv=none; b=W3yooeWKbmfiEz/+LAEWpOM4WkWMtA/TIEWIfU64gqi6GKoJ28dMOWcKala+Tljd1G/2Yz/xHaEkM+to12zEr49s7MMvdwzdTVKknxsh5/rtxp/x6cKf+ti9iOTdGaXivtSZ0AfXcGV7HHvVYLkL22ovmZiBiY60JWGSb0tt8F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791450027; c=relaxed/simple;
	bh=jlC1R+o3q8Vlpqcj+OGI6engr1bVhRfSnFRmu6LMEUs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iVY74EBwRxr99Sh1X4bHmhqC7Gt3GTL1QE2iGxkSSmBue9TZUef0mL4cJSdNCd7fy2o/4WBBAzTeqzDKuQJP18wbt7ABdNO9ODYl3E3j3Tdb1l/M/nkNmINIxxs64nIBzN069NDBigUdT616OO9hmSFcnqw5/zdMrYr2IxtygM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jpItnfrw; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jpItnfrw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791450026; x=1822986026;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=jlC1R+o3q8Vlpqcj+OGI6engr1bVhRfSnFRmu6LMEUs=;
  b=jpItnfrw8NpEhmgdDhtcY0QtCcg+eOcOKdtpP3CtKVXTA8BXVYA+ZFAA
   ZKjttlXpX5Gucqi0WEi7yaks07jCUqAU3oW8/9y/jOYIK977grZF/QgPP
   0JgXjlzyaEhx45+oiF5FqHsZKL1Ty1ZfyRBM6OUgY1f0waMoirJTB+URk
   //Y72mFxpz8X0hifVND+nAvHtUITW8e1tXFduhRhxZJ/saqRsuwzZy5tT
   ZBP+Swi9t0Y2f42418vaUwdED7q2s5jrENZRIYc2piWD6EuNSbIVwjowT
   w+zczHp2liOAUk7cKRxcMsDE2Kr6NDP0W4cGo2ZZa2frP9qclDRk8whhe
   A==;
X-CSE-ConnectionGUID: xNyOzqpBQZmj/2MGp/QL1A==
X-CSE-MsgGUID: qEbXw5rPR9Oul6QJkrHX5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="247471"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="247471"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 02:00:25 -0700
X-CSE-ConnectionGUID: lAe+ILRTQseFdcS7hlYq3A==
X-CSE-MsgGUID: bmoQ2piKQ3KaXSmG5WpqMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="443914"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.245.74])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 02:00:23 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev
Subject: [PATCH] ASoC: SOF: Intel: Make sure that link and host DMA is coupled after use
Date: Thu,  8 Oct 2026 12:00:45 +0300
Message-ID: <20261008090045.15008-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Couple the Host and Link DMA when the stream is put.
When the hda_dsp_stream_hw_free() is called the Link DMA might be still
locked and we would leave the DMAs decoupled.
hda_dsp_stream_hw_free() is not called for code loader use or in case of
probes or trace use for example.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/intel/hda-stream.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
index c95230487a1b..759719cf8ab0 100644
--- a/sound/soc/sof/intel/hda-stream.c
+++ b/sound/soc/sof/intel/hda-stream.c
@@ -293,9 +293,8 @@ static int _hda_dsp_stream_put(struct snd_sof_dev *sdev, int direction, int stre
 {
 	const struct sof_intel_dsp_desc *chip_info =  get_chip_info(sdev->pdata);
 	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
+	struct hdac_ext_stream *hext_stream_match = NULL;
 	struct hdac_bus *bus = sof_to_bus(sdev);
-	struct sof_intel_hda_stream *hda_stream;
-	struct hdac_ext_stream *hext_stream;
 	struct hdac_ext_stream *link_stream;
 	struct hdac_stream *s;
 	bool dmi_l1_enable = true;
@@ -308,6 +307,9 @@ static int _hda_dsp_stream_put(struct snd_sof_dev *sdev, int direction, int stre
 	 * that are DMI L1 incompatible.
 	 */
 	list_for_each_entry(s, &bus->stream_list, list) {
+		struct sof_intel_hda_stream *hda_stream;
+		struct hdac_ext_stream *hext_stream;
+
 		hext_stream = stream_to_hdac_ext_stream(s);
 		hda_stream = container_of(hext_stream, struct sof_intel_hda_stream, hext_stream);
 
@@ -315,6 +317,7 @@ static int _hda_dsp_stream_put(struct snd_sof_dev *sdev, int direction, int stre
 			continue;
 
 		if (s->direction == direction && s->stream_tag == stream_tag) {
+			hext_stream_match = hext_stream;
 			s->opened = false;
 			found = true;
 			if (pair)
@@ -324,6 +327,20 @@ static int _hda_dsp_stream_put(struct snd_sof_dev *sdev, int direction, int stre
 		}
 	}
 
+	if (!sdev->dspless_mode_selected && !pair && hext_stream_match) {
+		/*
+		 * Couple host and link DMA if link DMA is unused
+		 * In case of channel pair the snd_hdac_ext_stream_release() will
+		 * take care of coupling te HDA channel.
+		 */
+		if (!hext_stream_match->link_locked) {
+			u32 mask = BIT(hext_stream_match->hstream.index);
+
+			snd_sof_dsp_update_bits(sdev, HDA_DSP_PP_BAR,
+						SOF_HDA_REG_PP_PPCTL, mask, 0);
+		}
+	}
+
 	spin_unlock_irq(&bus->reg_lock);
 
 	/* Enable DMI L1 if permitted */
-- 
2.56.0

