Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8535B81AC7
	for <linux-sound@vger.kernel.org>; Mon,  3 Jun 2024 10:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717410464; cv=none; b=mU/0GcR1i5O0l2jcHxxi3F8akLG7d/viLFYd/GXWYaP4tAvRhoRGRXwxNnRIRWnB0u4+nb1pxYUBRtzHqNCGsKqo3Rq9d7BlKge9cZw4ohz9XHhUAw2XLvz4MjnEGc+RuA3ZQLrPkiD14mS5uJskb7e5h9IEtsyDsWeHP0N3JUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717410464; c=relaxed/simple;
	bh=67gZRlZBaTdb8h6ch3REGCduvNYrqRietV9ZHi2R820=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S3m0M0i0bNgvw7eYN3FM7d/WkqtyeaaCupE+cVAnmuySi15PGIDSHHy8PATfaSux6Tq3A6xtuhhzRr7VSfyJGKCLkfd2vSrNkUxEIypU/yGljee+AJH4YvMYjKpcYNscdxNhNB83OUjg/fb1GQsccBexnwwwVm3/pJcKQrPKnjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MLqEymbT; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MLqEymbT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717410463; x=1748946463;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=67gZRlZBaTdb8h6ch3REGCduvNYrqRietV9ZHi2R820=;
  b=MLqEymbT4+5qQmIeE5OYAmBa6B30ik38ODHr/3Kfg+Fui7swTmHKZRnF
   AdkED2ANmB3rmuqgUWLDK4/FhdR4+/gxO5ob+bkZid9ETFevtIcESMf5g
   ENouYFD6TqunOOFHnPxKL653PiZJF6AApH1hscW985QHSrHur5q/8PZbD
   ixVsRmzGRqqgeW4ai/zAMYkynt8PWQTYz3SNNvmQMLUuC7HUTjaE0NDQk
   BA+CyGd13Phf7W2b84i5JpwMBP2+VHMrMRPj2fIUpOojmplRI+a0R9VWB
   /H07eOj9rsXM50q4EvBqb8+28wsPyS8n42q6APRC5WjJMgf3wWW6he+uv
   A==;
X-CSE-ConnectionGUID: uvwf2POiRnKojQVxBIh8ag==
X-CSE-MsgGUID: s7wfsD5sRdG2M2Wt2g0DIQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="14017219"
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; 
   d="scan'208";a="14017219"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2024 03:27:42 -0700
X-CSE-ConnectionGUID: IKnj8+OsS4m1S9+F3bv42g==
X-CSE-MsgGUID: zuxYrlauT5e6p3GtU3jHtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; 
   d="scan'208";a="37430042"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by orviesa008.jf.intel.com with ESMTP; 03 Jun 2024 03:27:40 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	Jason Montleon <jmontleo@redhat.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 2/4] ASoC: Intel: avs: Fix route override
Date: Mon,  3 Jun 2024 12:28:16 +0200
Message-Id: <20240603102818.36165-3-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240603102818.36165-1-amadeuszx.slawinski@linux.intel.com>
References: <20240603102818.36165-1-amadeuszx.slawinski@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Instead of overriding existing memory strings that may be too short,
just allocate needed memory and point the route at it.

Reported-by: Jason Montleon <jmontleo@redhat.com>
Link: https://github.com/thesofproject/avs-topology-xml/issues/22#issuecomment-2127892605
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/topology.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/avs/topology.c b/sound/soc/intel/avs/topology.c
index 02bae207f6ece..b6c5d94a15548 100644
--- a/sound/soc/intel/avs/topology.c
+++ b/sound/soc/intel/avs/topology.c
@@ -1545,8 +1545,8 @@ static int avs_route_load(struct snd_soc_component *comp, int index,
 {
 	struct snd_soc_acpi_mach *mach = dev_get_platdata(comp->card->dev);
 	size_t len = SNDRV_CTL_ELEM_ID_NAME_MAXLEN;
-	char buf[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
 	int ssp_port, tdm_slot;
+	char *buf;
 
 	/* See parse_link_formatted_string() for dynamic naming when(s). */
 	if (!avs_mach_singular_ssp(mach))
@@ -1557,13 +1557,24 @@ static int avs_route_load(struct snd_soc_component *comp, int index,
 		return 0;
 	tdm_slot = avs_mach_ssp_tdm(mach, ssp_port);
 
+	buf = devm_kzalloc(comp->card->dev, len, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
 	avs_ssp_sprint(buf, len, route->source, ssp_port, tdm_slot);
-	strscpy((char *)route->source, buf, len);
+	route->source = buf;
+
+	buf = devm_kzalloc(comp->card->dev, len, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
 	avs_ssp_sprint(buf, len, route->sink, ssp_port, tdm_slot);
-	strscpy((char *)route->sink, buf, len);
+	route->sink = buf;
+
 	if (route->control) {
+		buf = devm_kzalloc(comp->card->dev, len, GFP_KERNEL);
+		if (!buf)
+			return -ENOMEM;
 		avs_ssp_sprint(buf, len, route->control, ssp_port, tdm_slot);
-		strscpy((char *)route->control, buf, len);
+		route->control = buf;
 	}
 
 	return 0;
-- 
2.34.1

