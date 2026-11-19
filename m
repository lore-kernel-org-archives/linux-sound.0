Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795105390;
	b=1QpNiRI87DoG9Eq5vo/9HrcWC07UdLWzcFYcAEYduAEXr4r27xYWEsY8Eo72bojIDYu/
	 o5I8pejNDiYXFLUEZCHh7OPs5Xm+xj8ySGAPBnlQvQzlgJB/UGFwR2P31jpIFZzKix4XS
	 T082EIWCR8HUVZjYU+r9zfOPFnL/ZVcwfNeOocF4tkELHIaNCpUa6RQ1fcSRgNyFLdTz/
	 R0EOs76ORPCYBAzh4+fl149tAA+fZF9uvJXdeMB4Vevfvhge1MwVu2FYKDNSXv2Fv2I/C
	 F23OzSytKX+EP7O7UK1LBQ1uWkzBXzCN4VZPlX1us7hQp/VQIvvHH6R7RSi5iP/I4Rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795105390;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=1YaK3ViuV2sJB3NB3hiYhK7dZmsOxgmGMfZhzPFJ6/g=;
	b=AmDnpLx8wXYb5mPl0MofnZcXZjCm9goqZmswYUe8u2nELpalAYY1NDj/kPE6tVQs8BM1
	 fkbdnV87x6dlPw+jRUZ8jMFb71P7pikjPi/FxIvZs4s7olcLBOz6G6l+ohqYBMZWZMmCa
	 1Xe2tf/7eBfuv8rTYwkR2DN6ZmrIfZlT4Lo5mFsOoSB2O1xRs+NuKjitNo8UVUa74J2YU
	 WflUuj2ARro/WYX0vmsfvMlrgVVST6IixEtv1ismxPLQ9cFzmVSuNfSHnPK2fhyhoGIls
	 5w97I/SNv+EfitSmRGkkxYd4brLyflzR+nDmKUuIMoAjOqP4OC/aBh80uVD7pdtU/2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="NTM6Yle/";
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D1E606A331
	for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 16:23:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4D1E606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NTM6Yle/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795105389; x=1826641389;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=W5j656+uB7sb1duxfp8eIjtEgbKhItxlItyNO5v2TRM=;
  b=NTM6Yle/U9DaQSEFr++Jzzqf+KU9H8L12H7ecxHtGhAMp1CQQw/SSMv4
   gIpAmvHMvP5xOFiyC8mbNuinufKJAUmzAFVq2xdM3Pmdp8mFdsNECOtiH
   cQeXYPlVCdjEF4JQ1aOTIXvP9/ermVD6EIcLHErvd/yI8H++pXi8QcUiQ
   QbnfDFegcliHMIcSggqLDf7VN9JfG+sdZwxclhml5ZrjR3cIUwVw12ReW
   dfVKdZeaLCCXba+uaznv9p+Zu6Ufabg+iGbKnwMgEgGAis3llRZODg4Vy
   2sPA33oIqOVy2TDDkMafesc2rQjsrJl+PHjFibLglCUPALb3oZAY98q9O
   A==;
X-CSE-ConnectionGUID: H6Kitm4vSCWDDiKeeBUgOg==
X-CSE-MsgGUID: jGm6MyeVTxGoKmJO2N9JqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3878193"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3878193"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 08:23:06 -0800
X-CSE-ConnectionGUID: BNo13wbcSaSWDJYFAQLkAA==
X-CSE-MsgGUID: G/QHwvJNSqShGNBcxE2Cew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10457625"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kvehmane-desk1.ger.corp.intel.com) ([10.245.245.109])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 08:23:02 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: linux-sound@vger.kernel.org,
	tiwai@suse.com,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: kai.vehmanen@linux.intel.com,
	Michal Grzelak <michal.grzelak@intel.com>
Subject: [PATCH] ALSA: hda: intel: Release i915 component when delayed probe fails
Date: Thu, 19 Nov 2026 18:22:53 +0200
Message-ID: <20261119162253.1779252-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit fbaccb1b19c7 ("ALSA: hda: intel: Don't free card in the probe
work") stopped freeing the card from azx_probe_work() when the delayed
probe fails, and only disconnects it, leaving the free to azx_remove().
This avoids the double free, but the resources that were released by
the card free via azx_free() are now kept until the PCI device is
unbound. In particular the display power reference and the audio
component binding to the graphics driver stay held for a controller
that will never become operational. This blocks unloading of the i915
driver, which breaks display driver reload.

Release the display power and the i915 audio component in the probe
work error path. Both snd_hdac_display_power() and snd_hdac_acomp_exit()
are safe to repeat, so the later azx_free() call from azx_remove() is
not affected. azx_free() can't be called directly here as it would
run before the codec instances are released by the card free.

Fixes: fbaccb1b19c7 ("ALSA: hda: intel: Don't free card in the probe work")
Link: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/17751
Reported-by: Michal Grzelak <michal.grzelak@intel.com>
Tested-by-by: Michal Grzelak <michal.grzelak@intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/hda/controllers/intel.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/sound/hda/controllers/intel.c b/sound/hda/controllers/intel.c
index 0a62723b3454..73ff42faccb7 100644
--- a/sound/hda/controllers/intel.c
+++ b/sound/hda/controllers/intel.c
@@ -1740,9 +1740,21 @@ static void azx_probe_work(struct work_struct *work)
 	struct hda_intel *hda = container_of(work, struct hda_intel, probe_work.work);
 
 	if (azx_probe_continue(&hda->chip, false) < 0) {
+		struct azx *chip = &hda->chip;
+
 		hda->init_failed = 1;
 		complete_all(&hda->probe_wait);
-		snd_card_disconnect(hda->chip.card);
+		snd_card_disconnect(chip->card);
+
+		/*
+		 * The card itself is left to azx_remove() to free, but the
+		 * graphics driver must not be kept bound to a controller that
+		 * will never become operational; this would e.g. block
+		 * unloading i915. Both calls are safe to repeat from azx_free().
+		 */
+		display_power(chip, false);
+		if (chip->driver_caps & AZX_DCAPS_I915_COMPONENT)
+			snd_hdac_i915_exit(azx_bus(chip));
 	}
 }
 

base-commit: ec925d3740159f4b4bd3b7640be5d0d2b4664106
-- 
2.43.0

