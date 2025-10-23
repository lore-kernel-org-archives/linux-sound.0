Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470C92FCBF7
	for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 09:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761210380; cv=none; b=cBb7MJqpBRkkKJ+jD9RB4KI9i4jyIG9xzod6CaFR8rqdFJ4uWEurXAsXiCAFEvsnKWdyea72bspuDV/Dl8nhOj/mSz5dAl69GTg6fJgRfRT9++yAnxRGKOpiVAd3UgKuK43GU5iU4+QgzNlBo/vT+1r+WEYkyz5YOJAjO36VGUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761210380; c=relaxed/simple;
	bh=wTd8TqSXwmmaE+8zwGcxJqxF52MK3yDzGCs5kWnJwuo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RhmcF/ICPX+M8kSmceAbuetnvslyEpSme3nxeA1jy9juKiSwsPFQynXeYgc6azm70xAD9LiLvlbztnKDE6Zgb7OE67+dATYowSM/LcTL4mqkSCCOvjdKhA7OcsK4X8bYdDxIAvkU0mBrT6e8FOVOhFaQGT+/BsRaarOT4MEeFS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KSRLDCXH; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KSRLDCXH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761210379; x=1792746379;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wTd8TqSXwmmaE+8zwGcxJqxF52MK3yDzGCs5kWnJwuo=;
  b=KSRLDCXHfHaN1NpSsXUQswR8uSCWSG7QQrQZaw1Tp5JcV8X+wxtp2LpM
   RCCQKvbEqu/pH8GrGVnS1xFO9gMkR1sV2Y3XAFfzep8upaoBmSxL8IBu5
   XbGl8Gte0SnkkJmAt5yXFso8EjfGQDPubE6hDEZNpr2F1Co7Ma+R0gCqK
   ABlgmdkjj2SII0MW7Ls/nHcvzqByC1ojbp6jFkkAyf2hSlCPj4mzWTGYf
   EX1TyTNjOY9+ShdF3jVDB/I9ksFkDg5LdHLe/BM0VhrH3dgYWlC8rb2ys
   eddvo6EuwgTYuckCsWus7/nyk16sBOw9NKcFpEFnkVIXIL8eUde2fQl3y
   A==;
X-CSE-ConnectionGUID: WqP6zsrnQ5uK0eXK7p7Kzg==
X-CSE-MsgGUID: 6rgWSlOIQqy42s5Ab40vKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62404295"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="62404295"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 02:06:18 -0700
X-CSE-ConnectionGUID: 4p42USUlR6SPu1X/Bt75Fw==
X-CSE-MsgGUID: WoiAuVA/QJ2rRvO4Lh4oLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="189372404"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa004.fm.intel.com with ESMTP; 23 Oct 2025 02:06:16 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeusz.slawinski@gmail.com,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 1/3] ASoC: Intel: avs: Unprepare a stream when XRUN occurs
Date: Thu, 23 Oct 2025 11:23:46 +0200
Message-Id: <20251023092348.3119313-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251023092348.3119313-1-cezary.rojewski@intel.com>
References: <20251023092348.3119313-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pcm->prepare() function may be called multiple times in a row by the
userspace, as mentioned in the documentation. The driver shall take that
into account and prevent redundancy. However, the exact same function is
called during XRUNs and in such case, the particular stream shall be
reset and setup anew.

Fixes: 9114700b496c ("ASoC: Intel: avs: Generic PCM FE operations")
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/pcm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index b8e5c05559b3..6af10046fd36 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -767,6 +767,8 @@ static int avs_dai_fe_prepare(struct snd_pcm_substream *substream, struct snd_so
 	data = snd_soc_dai_get_dma_data(dai, substream);
 	host_stream = data->host_stream;
 
+	if (runtime->state == SNDRV_PCM_STATE_XRUN)
+		hdac_stream(host_stream)->prepared = false;
 	if (hdac_stream(host_stream)->prepared)
 		return 0;
 
-- 
2.25.1

