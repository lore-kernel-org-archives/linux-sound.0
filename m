Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795340404;
	b=klalOCffbXjnX4TfQTzJnlXHipWVFViPiOQDXUFUBdszF+ClDjqbnlyZIvVQWeBH/3Hi
	 pmhvLydb6kiiZ/2T0gnk4QIgYI3U4WJalXMekIbnP2DJfiIUxPRysi8Xet2p2g6nyWYlO
	 cNqPfGpp+3DRJPtWTyVoap5KzGuUvtsZW1iEiRwVJj0NCIasowMZxWcVI3342wFypA8fs
	 /TJQcVOoOuwWqMeXp+Ke4oTi7xrjxzhg1vpECkTHRTje31EpocLy3qG/TKZO75SL5FxiO
	 4Vod1Wd/HZ/9LEmoHtW6ZsS6gLOo8128RftQY39UdwCEc67h7zReLkjJB2tYi1z1MeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795340404;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=JOUUdrLpItYmqcAoZQUhihWymH/+lw6CahS8AWycB6I=;
	b=S+P8zRGkFL8IGooA8Ejm38gICPpNPHli7mQ2hOz8cC/xAA/ZFR0Z0aXyjPQa6KOZteYc
	 Z6fJpvOONl2LakZzdfEtZ7Bdx1a3rSuJ0yWGhLuxddrCd2BN9pIzgkXXrTIeAmV0B9mz+
	 zfO70hGNmcIvzsevgF7Jw7WldAOr07SMRqHfGZGMjPR6lSGHxf4pywc0AML38NpqGP6pA
	 kYIierDOLJw8NVNx7JuDul3ZvcCk8IXg9wiuI7vnlK5UkrFY7BfNbGrtz1+Y4H5ra9+96
	 PzGWzJjmmGk2CZCRO0MpA4Sb/JLGNuIAYm/K3E7nQsk7J1r9C9f1O9nISqVKJhC+jxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gqYUV52a;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92EF8606A32A
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 09:40:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92EF8606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gqYUV52a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795340404; x=1826876404;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=w4KJorzAZ3sytn1g2oy2Xzi9zhxITHlVZCZk+sJlTKU=;
  b=gqYUV52aW+U4ZmpA0HBmEf5B4vU+2tV1vU4CGekAuix87hoNZXtoZhO+
   4QzI1/HyHqLV8GvezwU0UIef0HffIsp3o+A3WTbRtc+VKYx2wl+ZBQkiV
   soqYdtcngd3n4ubQfJyP5BENn09ieY5JdOWwPHjbgo0Sdta3n1t/m3XBm
   PzqnbfTwwARf3B/Tzp14MkN+Qrdhyd7ZHdbM0DbkKFofbxRqZ3e0wo/P8
   gj5dJNwpbY9iPz7tIPagco1Jt1FXYnm/Pd0BzBJyBtMyijd8SXEFmAVQm
   jrhsJPnbs6bGp1zdydk2BD84yDdu3byr15yyA7bxYNZOZMSPJGqbybhx7
   g==;
X-CSE-ConnectionGUID: /d0yB+XsTBGFuXie2gSgvw==
X-CSE-MsgGUID: JSbhCeReQPuWtelozxq3yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4051555"
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="4051555"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 01:40:03 -0800
X-CSE-ConnectionGUID: KejWlex/SkSKnIHNF+eMpw==
X-CSE-MsgGUID: NWz2Wi94QyaOPNZFBWr1Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="12759955"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 01:40:02 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 3/3] ASoC: Intel: sof_sdw: Limit HDMI ignore to playback FE
Date: Sun, 22 Nov 2026 17:39:45 +0800
Message-ID: <20261122093945.2138118-4-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261122093945.2138118-1-yung-chuan.liao@linux.intel.com>
References: <20261122093945.2138118-1-yung-chuan.liao@linux.intel.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When iDisp is absent, limit the HDMI ignore check to playback FE links.

HDMI-In links use names such as SSP%d-HDMI, and their stream_name may
contain HDMI as well. Excluding BE and capture-only links prevents the
HDMI-In capture link from being ignored.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 1e5de71c0f21..b3e88dce0c25 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1447,7 +1447,8 @@ static int sof_sdw_add_dai_link(struct snd_soc_card *card,
 	struct intel_mc_ctx *intel_ctx = (struct intel_mc_ctx *)ctx->private;
 
 	/* Ignore the HDMI PCM link if iDisp is not present */
-	if (strstr(link->stream_name, "HDMI") && !intel_ctx->hdmi.idisp_codec)
+	if (strstr(link->stream_name, "HDMI") && !link->no_pcm &&
+	    !link->capture_only && !intel_ctx->hdmi.idisp_codec)
 		link->ignore = true;
 
 	return 0;
-- 
2.43.0

