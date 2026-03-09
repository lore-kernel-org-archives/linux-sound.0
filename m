Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199CF24DCF9
	for <linux-sound@vger.kernel.org>; Mon,  9 Mar 2026 09:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773047774; cv=none; b=dFIVHZqcQ0c2mFhNbF0Cc/n7e0X2/G9mmwU1AXDb/D7SRNLRvLTdB90xf94CzE+067O8DoB7UQKzU4NW+zpS0cptwpZEsStfhkmqaxF7nvSaCoG9FXDjhUoARKxgiJtieWQNESoYAXJ/TNpryL7z94XiO0lqQW/1/ER4hhxkFeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773047774; c=relaxed/simple;
	bh=dj54rGY386raQx8WZgRPraFSLpoKY83TyM+OcffM2I4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bXUjjCPDOwLEPmJcyQNCyoI6CRXZp4OO7Y74IeVjLe+i+chSucrMJtz2MO/l4yeQgM5ThtmRbsLAnP1YW/ePTjxzsc9ItJsh96PNTQRujzSLYgvTxUixXHnvm0KKd89IhsPMK0fhgC0afWRwYIrOYGWPlhYbLbTqs9eKir+9fsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nMU5qWPE; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nMU5qWPE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773047773; x=1804583773;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dj54rGY386raQx8WZgRPraFSLpoKY83TyM+OcffM2I4=;
  b=nMU5qWPE4Qe8UesUxwEau2OzaFkHuQxAYUOxLS6QsC08dzVPHV6WybHz
   y5qD9sEdnnK8CcZkTFRKT5UnpBOIYl5QFRPBtb7SLIhnMT5dyLJy5DQP9
   zGAgP1X8AutPXcVwCkGN50Z2V9bMRsS4sMNkUbcot5ELzCfHHP5XOee0B
   D9Y6U8yclHehaDQHkgG+nr2+0bp9dngx0MgYXeI81Qkqjx7iED9oJpLkb
   A5UZ0kLtrMXB2SiamMXJljRHU0wMqpVPEON2UR1reawLZJDgVoSZJJYWk
   ygK9mC9dLMFW+FnlU1Rltb3bzC6a5CsXm27e4YiKQMuwksP0JKhGMomgx
   g==;
X-CSE-ConnectionGUID: OEHpkzBeQuK2MUCx0lYTUg==
X-CSE-MsgGUID: BqjL8Z36Tp2xLHxhGae8jQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="84776997"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="84776997"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 02:16:13 -0700
X-CSE-ConnectionGUID: b1mN0aCRRMKay0liRsThMw==
X-CSE-MsgGUID: MlBtvcnoQfWUQKYVU5oeMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="245688630"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa001.fm.intel.com with ESMTP; 09 Mar 2026 02:16:11 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 4/5] ASoC: Intel: catpt: Do not wake DSP just for volume setup
Date: Mon,  9 Mar 2026 10:16:04 +0100
Message-Id: <20260309091605.896307-5-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260309091605.896307-1-cezary.rojewski@intel.com>
References: <20260309091605.896307-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With the new control-operations in place, the controls no longer wake
the DSP just for the sake of updating volume (or mute) settings on the
firmware side. The values are cached and actual update occurs only when
streams are being opened for streaming or are already running. In those
cases the DSP must already be woken up and we avoid unnecessary power
consumption.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/catpt/pcm.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/intel/catpt/pcm.c b/sound/soc/intel/catpt/pcm.c
index 3074b6c958fa..2ed9df7bc434 100644
--- a/sound/soc/intel/catpt/pcm.c
+++ b/sound/soc/intel/catpt/pcm.c
@@ -388,6 +388,15 @@ static int catpt_apply_mute(struct catpt_dev *cdev, struct snd_soc_card *card)
 static int catpt_apply_controls(struct catpt_dev *cdev, struct snd_soc_card *card,
 				struct catpt_stream_runtime *stream)
 {
+	int ret;
+
+	/* Update the master volume when the first stream is opened. */
+	if (list_empty(&cdev->stream_list)) {
+		ret = catpt_apply_volume(cdev, card, "Master Playback Volume");
+		if (ret)
+			return ret;
+	}
+
 	/* Only selected streams have individual controls. */
 	switch (stream->info.stream_hw_id) {
 	case CATPT_PIN_ID_OFFLOAD1:
-- 
2.34.1

