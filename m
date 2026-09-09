Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B46146E01D
	for <linux-sound@vger.kernel.org>; Wed,  9 Sep 2026 09:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788945000; cv=none; b=GgRV4fZMU9d1qiGQUqChmJU7I5HKwjydQs96pk97WZLA6tkc4ryP1UbNFopFKcZ8B26Viw/GRjrB2pJsBsRpE/bG5lmMoEI+EIUqcjaFGz7Kc1pM6sDP5ed/O9A3W+oHHs/wP/LAyI4qK+JMPJAfTSY7OZaDLP7bCIeqG+h3osk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788945000; c=relaxed/simple;
	bh=2fLmYNfV048rfCMKR0mPvJpV3tgt2QdrHTYX4DBPhko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uwIS6oE7RmBGhB2n9siW7Jx1eOrOLU9DHUgyfHrFZk+QzJKZBjT9n7pZYEkIOm8wTmtAk3akvA+R98m7NFf5V3ijhddwj5v7Hip58EDbSnDa5q8IeRFqVS8PN31tfn9FR2qxWHD+IO0d06l1v8/5lz14EbakJtmKE4PZ0PLMxII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NNFgFdPl; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NNFgFdPl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788944999; x=1820480999;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2fLmYNfV048rfCMKR0mPvJpV3tgt2QdrHTYX4DBPhko=;
  b=NNFgFdPl/6/636BiENQgXHOGHLINTbjEGihME/fmQYD/D7QkP4tk2Yr4
   zDWJBTXG6UINC80yolU1Zrs8I0G/PHzvjYIe85k0Tc07uQtYZFTW4gBbk
   XTNDtSAbFIp4BQTB8oK454A/6SzNXV+mOEa3g/NbuJYJeHwW2cCf+dzUW
   2YDvCHpLqNpJYtpMHHH206CcZxx/tzMC0SnTsaVnMeidPaxQ0ncVX+LtQ
   uf7QT23JBdA/5o4icxXRaaIAdFr9J5nswKYvNOvz5jFoV4CVUf5kqy2L9
   bai3B4yS8/yy1IcAr3szDqjWlo7X85x1yNjQMuWK1viFQeDhn1lUE4RjA
   Q==;
X-CSE-ConnectionGUID: DIupW4lmSgSxryhsJyUWGQ==
X-CSE-MsgGUID: 9NKuC/shQVGCdQhS/lxlGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89200643"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="89200643"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 02:09:59 -0700
X-CSE-ConnectionGUID: 7b5QqELNSXKqrAHQ2YYv7g==
X-CSE-MsgGUID: dzUpQG/VRe66hYwuQicd0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="266972876"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.252])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 02:09:55 -0700
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
Subject: [PATCH v2 06/24] ASoC: soc-compress: Stop running dpcm on free
Date: Wed,  9 Sep 2026 12:09:31 +0300
Message-ID: <20260909090949.7503-7-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909090949.7503-1-peter.ujfalusi@linux.intel.com>
References: <20260909090949.7503-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the last trigger that the compr device received is a DRAIN then the
DPCM is left in running state (no stop trigger is sent).
Before we execute the free we need to send a STOP trigger to make sure that
both BE and FE is in expected state and prepared for closing.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 sound/soc/soc-compress.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c
index e9f6ab8c1678..3e1c11c788ef 100644
--- a/sound/soc/soc-compress.c
+++ b/sound/soc/soc-compress.c
@@ -311,6 +311,16 @@ static int soc_compr_free_fe(struct snd_compr_stream *cstream)
 	struct snd_soc_dpcm *dpcm;
 	int stream = cstream->direction; /* SND_COMPRESS_xxx is same as SNDRV_PCM_STREAM_xxx */
 
+	/*
+	 * The core will not send a STOP trigger on free if the device is in
+	 * DRAIN state, but we need to stop BE and FE before we can proceed to
+	 * free the stream.
+	 * Run the STOP trigger if the DPCM state is START (DRAIN is not
+	 * changing the DPCM state).
+	 */
+	if (fe->dpcm[stream].state == SND_SOC_DPCM_STATE_START)
+		cstream->ops->trigger(cstream, SNDRV_PCM_TRIGGER_STOP);
+
 	snd_soc_card_mutex_lock(fe->card);
 
 	snd_soc_dpcm_mutex_lock(fe);
-- 
2.55.0

