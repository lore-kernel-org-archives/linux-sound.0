Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC26221717
	for <linux-sound@vger.kernel.org>; Thu, 19 Jun 2025 10:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750329950; cv=none; b=stMPl+U2z7E4eWS+qy9l8PdZCKWcyCIIRCxmaw5xjB8wi82+rlVTLqejDE7GzsBVw6GmwZM+av64ldHTe7B4EG8tPd7OTje9SzLpAFuDHKImT/44R5L74VJvX6ZLOavawM5gu43MYqFd4kzmEN4MSmMDeJFPHBA21FCyqM0zF0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750329950; c=relaxed/simple;
	bh=n3bb25l3ROUykoNkOGxcqX94iy99zrN7+hekeg17EnA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u5wca9c/bNFm835lq6ttzo1Z+59YxcYM5wfs7wxJxsWJnexgZOe/AgcpE6wu0m1qGMY4z7lceItBB4sAMjyNUHJE7b5AGRYwB0YgoDHPsqQsOAq4IFWn2F4zbTcONPec2bd6bKro9I2bK4L0U/v60DfzR4M7WTzGDNIoV0plhuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JsLSQO3s; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JsLSQO3s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750329949; x=1781865949;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=n3bb25l3ROUykoNkOGxcqX94iy99zrN7+hekeg17EnA=;
  b=JsLSQO3sR6wVUG87Nx211uv45ow4EabFjQVEzbrPOPbIm7Gysov6o54z
   PPCj+SOHXQOOBVgetDRx759d0QvhZEP9ATjG4YQAJ/Aqdb3R8648Rl38w
   yo5szDvTv/Vc0jr+hkAiOOG3yst/p4ebK+VSKHoEfSYvlFfZwHGq+qR99
   3ek4P6JbjbSe3FBW3qvPnptpqAnF9usMgTDQ7X7yKrZJgypz6/p9WVLJd
   ANrK8sTGAW09yW+tuaMZv14OidnuKPiPvoaAbkkzaUMoqkF5PUAlAAMXN
   dxHtbIClJnb7V6gEktsoD4leDbS/qYLorVbzKStwWGDIS9WvBV7Be+bHq
   Q==;
X-CSE-ConnectionGUID: pf/rLEUCSUCd+WgpG9YvWA==
X-CSE-MsgGUID: iAvIL6jRSSeSeZpZwUk7GQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52547792"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="52547792"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 03:45:48 -0700
X-CSE-ConnectionGUID: kdbPmoCJQimxSAkDQ6iIug==
X-CSE-MsgGUID: wcarP2PjTRKWuBfJz2snBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="154879217"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.182])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 03:45:46 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev
Subject: [PATCH] ASoC: SOF: pcm: Reverse check for prepared stream in sof_pcm_hw_params()
Date: Thu, 19 Jun 2025 13:45:51 +0300
Message-ID: <20250619104551.25912-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reduce the number of checks needed with the simple and most common audio
sequence when the stream is started then stopped.

If the stream has not been prepared there is no need to check if we have
pcm_ops and pcm_ops->hw_free() callback as it does not matter.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index d584a72e6f52..deeb1fd8392a 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -144,7 +144,7 @@ static int sof_pcm_hw_params(struct snd_soc_component *component,
 	 * Handle repeated calls to hw_params() without free_pcm() in
 	 * between. At least ALSA OSS emulation depends on this.
 	 */
-	if (pcm_ops && pcm_ops->hw_free && spcm->prepared[substream->stream]) {
+	if (spcm->prepared[substream->stream] && pcm_ops && pcm_ops->hw_free) {
 		ret = pcm_ops->hw_free(component, substream);
 		if (ret < 0)
 			return ret;
-- 
2.49.0

