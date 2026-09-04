Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31F3396D19
	for <linux-sound@vger.kernel.org>; Fri,  4 Sep 2026 07:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788507107; cv=none; b=NV6K5djd0KDLgHF+b4Z92FA2OpgjR+dyedoVv3qRWjSo7mdbOrUUT12H+cYM96++ufNYGEkHTA/+Rsd5D3i4g632YjZ6lHCsEmqmeQO4Sps/UVmLgVTRjHhFwZ0ECEI2UM/O1kgtj1X+KUJIg7H8xlZnw2LR/P5rfjUPLX/9A9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788507107; c=relaxed/simple;
	bh=P+RuimrdMTczVZxqZB4FD+2zCcZV3rdNcjANHOvBfmY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l1fs9u+qNIWEdDb68/Tk7FXKbzbLEYd7kpxtj60ZRf3TL7NXXdQ5T/t+75uVhNiaPh+pPpXIJSf//5MJjemyHZ974Xhm9KAM4VrJ9HSFWTLX//f7eEerGMI41SDViiGC325W78WJ8Q41XG5IVqAYRc5wXnXTJa1wyw4ZuY3QVFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gHBrNmlb; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gHBrNmlb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788507106; x=1820043106;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=P+RuimrdMTczVZxqZB4FD+2zCcZV3rdNcjANHOvBfmY=;
  b=gHBrNmlb1j12mmLDaZ2HbWR8rK5Kp3oZY7l0Xy0Y0djMGZ/yzFbCC2Ae
   fLfxTRb3ft40tJNvK8KBgEn+ToguaGlJYlWGrhmoHomDn1YP1Jlcrs4C1
   2wR6mk9Jqvb84UWkS9NvQCJNt+qQifDtWCtkWAbvgEiveXaJNSFBudia/
   T+aypy4vHuVVLXWnKeiachmq2jzIpCcE7q0aJp/mgYF0VHOsyVn36jPpY
   3x+jlGvSYq41qa9IZbHIdnTeaCNZmOK/eXI2AWxSDQe62sVG+pygkQzvt
   TotUoZLCabUgXFBlSosMMe6YZ/UqwK9c8IFkmgIfBsm98vG2YQ/dOWpKV
   g==;
X-CSE-ConnectionGUID: 7MS2/kdSSmSnZFgXXqOblQ==
X-CSE-MsgGUID: +/nh/wLQTDSaSeQhwVj/2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="111777839"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="111777839"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 00:31:44 -0700
X-CSE-ConnectionGUID: sMuy7vwBSsKUZ+FCh778QQ==
X-CSE-MsgGUID: Wc1PxTqqT+uAK2aCkb/qnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="293480559"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.213])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 00:31:41 -0700
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
	daniel.baluta@nxp.com,
	Vijendar.Mukunda@amd.com
Subject: [PATCH 05/23] ASoC: soc-compress: Stop running dpcm on free
Date: Fri,  4 Sep 2026 10:31:16 +0300
Message-ID: <20260904073134.29648-6-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260904073134.29648-1-peter.ujfalusi@linux.intel.com>
References: <20260904073134.29648-1-peter.ujfalusi@linux.intel.com>
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
index f0529f6eeefe..b562a634d107 100644
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

