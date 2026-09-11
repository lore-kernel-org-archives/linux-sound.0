Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE8D3CF678
	for <linux-sound@vger.kernel.org>; Fri, 11 Sep 2026 11:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789125724; cv=none; b=EqISxtZpDlAME+arwVHMBMnYh1ZHN/j73wDYYoSZs9RTTIXORefsaMGM8E1OUwCaUupjIqFn67wLB79LlGZZc7aBaK5GU19alfwvB3f0fIQFPuaa1hRtwsgcpCYRtPiYe39SoVRGYWWxhnlg2Pf4TRuu6sUrR1b6DEM4+LlOOP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789125724; c=relaxed/simple;
	bh=r7g1rATmpuvVxogSDojudDCwwCOkItqRieAkmDIL+Kg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KqMPYHMa1a3TQIxLuR73uKyWXt2ob19liWPbQ17stZAeL/3cWdPLDokqVhPIKUZlz7IEYTXZ+R5q7Cf3zdkYoej54b9PJ55yl/wIg4Z8X0gmtRr3zVRML5uAkiWvLWjgo/cxbpnxIc4sQPBY1Aa7FTWRzlK1N44bsDO3L5m6n6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WzVpVSpb; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WzVpVSpb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789125714; x=1820661714;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=r7g1rATmpuvVxogSDojudDCwwCOkItqRieAkmDIL+Kg=;
  b=WzVpVSpbyvdDIxDCWyi3EHQMfM0TJas11YNgNdWDviPjWFLlp6xCThjf
   lSG3nYspb0Sd7Gud+BnzUlZ0N0aupkYTOOuou26I0hFgKYtWgtwJCmmqj
   vRPtcEwj1XBCeH5IfWSKf1p4u0k6zpQgoz4EltExnGbWtQOvEB4qPCjac
   FJNdARUBW1AaVbwcrIR0zbPCX32emxneLK/SM/bkoQhaz/8IiHlaUb2Wp
   +cEihzHzllaZcB0HVJOwDcX5Fy92yM6i/p3cIQMVgCjO7BPc/5UPtAL9h
   XVrcWpCsWPuAiSpx2sl57N4F3/iprnXJsHeoD+yvbIRNWzegDUM+7/xC+
   w==;
X-CSE-ConnectionGUID: tH+VGBMRRFyK77TNzXVrgw==
X-CSE-MsgGUID: MBNBxU7xRd69JyJxlLWnYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="100749876"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="100749876"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 04:21:51 -0700
X-CSE-ConnectionGUID: gm5bIlJJT666mDeNoj+mLQ==
X-CSE-MsgGUID: MYT2KLTXRAKbx0xCbPrGjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="268213256"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.83])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 04:21:48 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: vkoul@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	srinivas.kandagatla@oss.qualcomm.com
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	daniel.baluta@nxp.com
Subject: [PATCH v3 02/26] ALSA: compress: register the open file with the card
Date: Fri, 11 Sep 2026 14:21:28 +0300
Message-ID: <20260911112152.28528-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911112152.28528-1-peter.ujfalusi@linux.intel.com>
References: <20260911112152.28528-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The compress-offload device is the only ALSA character device family
which does not add its open files to the card's file list. Without it
the core cannot replace the file operations on disconnect, so syscalls
issued after the card is gone still reach the driver, and a card freed
with snd_card_free_when_closed() does not wait for the open compress
streams.

Call snd_card_file_add() at open and snd_card_file_remove() at release,
following the ordering used by the PCM, control, rawmidi and hwdep
devices.

Suggested-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/compress_offload.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index ba6cdfe64246..7b720603a9a8 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -101,7 +101,14 @@ static int snd_compr_open(struct inode *inode, struct file *f)
 		return -ENODEV;
 	}
 
+	ret = snd_card_file_add(compr->card, f);
+	if (ret < 0) {
+		snd_card_unref(compr->card);
+		return ret;
+	}
+
 	if (!try_module_get(compr->card->module)) {
+		snd_card_file_remove(compr->card, f);
 		snd_card_unref(compr->card);
 		return -EFAULT;
 	}
@@ -144,6 +151,7 @@ static int snd_compr_open(struct inode *inode, struct file *f)
 		kfree(runtime);
 		kfree(data);
 		module_put(compr->card->module);
+		snd_card_file_remove(compr->card, f);
 	}
 	snd_card_unref(compr->card);
 	return ret;
@@ -174,6 +182,7 @@ static int snd_compr_free(struct inode *inode, struct file *f)
 	module_put(data->stream.device->card->module);
 	kfree(data->stream.runtime);
 	kfree(data);
+	snd_card_file_remove(compr->card, f);
 	return 0;
 }
 
-- 
2.55.0

