Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E763B42EF
	for <linux-sound@vger.kernel.org>; Fri,  9 Oct 2026 05:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791523763; cv=none; b=HyOy0hH3Wi3XOx1X+x7VP0OEczylC47nUQOr0CdIqXLBYQoKgCB94ZIwhfZnXIWkRY5Jv1cXEgaq3X9K0wJxBLdnDxO0HVpqCQ8MW6PbAmorqTDzHqFMoLnc4t5unvIUvkzqRNtvXO9G8sDLNfIlfUuGGQIDckeKEPJSY0zolxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791523763; c=relaxed/simple;
	bh=xEt623mbOHSwaFq66vECQz5Pq42Q/pvIJN53haS9+hQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SvUY4EQfAvs43H1gf7cJHEid9bkZx9wOQYUkcwpIEF48vM0Muw2G0ShzFJ536N08YmAccEuDQile0QZw36IK6ldnbecSPZP272aKDXNkmPGqJohE65+SumR2C/FQYyX0ZuVdyXPLtWIQTrM7/79iyd8pBJ0lpLV/9yR7s/x5Fko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BpDUQQIB; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BpDUQQIB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791523762; x=1823059762;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=xEt623mbOHSwaFq66vECQz5Pq42Q/pvIJN53haS9+hQ=;
  b=BpDUQQIBzDwK8OVj11HM4l4bETC6IUhgNk/ciFizxLcfffyPV1KiuA/7
   xr4Ddpf7PfPErz0iewxO0EOos0WeK4Qi9FaXJ3zmUa1Io7QoIoPVk/X/s
   UpWqXhhacqNVjDEzEgvs2C4/eItWdII0U2YfSXAZsMQ1cEFr9JwtaRwqG
   m0pJGaUwvb9J2fdk8ZUmE0NpAtrZFvSorUpT6Hu0vQW+gO7SGbvQ/MrpP
   4pzsbVOXycy6s6IGCnZLhGlwJl5MryYuG8SeTlt5iGFwSwma5oI94tgX7
   3aRck//b8AMD0puMVXkwk6x1EfqwB1CUS3HD3w9Tq567jLv/5P4UrSL8i
   g==;
X-CSE-ConnectionGUID: DOssU3Y5RKibNWe0iN1J5w==
X-CSE-MsgGUID: u/KVTG0bRfu/wOU+LEaj9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="325060"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="325060"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 22:29:22 -0700
X-CSE-ConnectionGUID: vTT37w0DRBybKXKKlfLW8w==
X-CSE-MsgGUID: ldJlaU0SRtm5jiOePV14lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="548969"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.245.221])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 22:29:19 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev
Subject: [PATCH v2] ASoC: SOF: Intel: Make sure that link and host DMA is coupled after use
Date: Fri,  9 Oct 2026 08:29:42 +0300
Message-ID: <20261009052942.17346-1-peter.ujfalusi@linux.intel.com>
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
Hi,

Changes since v1:
- rebased on for-next

2271de29a097 ("ASoC: SOF: intel: hda-stream: Clear the current position when releasing stream")
from the compressed support series added a line to cause clean apply to fail,
the patch remains uncahnged other than that.

Regards,
Peter

 sound/soc/sof/intel/hda-stream.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
index ac2a62c4e41f..bdd4831e050c 100644
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
 			s->curr_pos = 0;
@@ -325,6 +328,20 @@ static int _hda_dsp_stream_put(struct snd_sof_dev *sdev, int direction, int stre
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

