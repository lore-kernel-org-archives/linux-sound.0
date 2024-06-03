Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A9A81AC7
	for <linux-sound@vger.kernel.org>; Mon,  3 Jun 2024 10:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717410468; cv=none; b=ec+BLXQRnSKPzIVMU2afM6KuxNPH+o+zd4UPJhsBvU/PQB1WTLk1FJL++/wim1K3vi3W0N6Ap8oflo7puFG+9rKFaXZBheThTyr/3edDobe8L5cwWoY+o+BxJL9ipiA8fD0RlC9PxwkCw41EBSqxYd30Atjn1Zd38OUzBEFjads=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717410468; c=relaxed/simple;
	bh=mrRMoWmxvzrAwR8G9TNIstf0By3PMvXmJHxrOKbXUJo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FrGGlMhSbYo0sGU1LaNn9H93UC7iWPGAGGvidmaVxzdWG9dEOEB6LNQVPYqEjvlqMSdSGPrzvspxehd28KhSkVJwKUqhE3n2uLj5h1QriXSIBGtViGzOpwQjQF+kmI3bwMIbcQOY0wglD1Rql+w30kXrIyPqkfayIGcR2jITLuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jET2CJyE; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jET2CJyE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717410467; x=1748946467;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mrRMoWmxvzrAwR8G9TNIstf0By3PMvXmJHxrOKbXUJo=;
  b=jET2CJyEGiXsSnnJruCzUne58nlGIIcAL/kdQzjscUNwxdvbeF9DZ948
   yJLDYJiFGjE7O01f3tCuTxusH7e8SXjKmuvQaFeSeCKolBu0ec1DEj0de
   IX5Spy/rtgUMpwm1/ZD+i+EORcCKJoY8gxH3gcKtjQ0ECQoUvjpnuB2YD
   lECMK4BgsPxMoaaFwUx5oVo7+M8OBox8ADPAhcxjlIe9iwvgqLPojO2fa
   DtiDUAQ/AnyMekiOlFC0UHTzatcNpvavKljlDI0iD4whyn+Xtkh2DJtCj
   xyXUrzKp5oLpZiK/52VqG/WySIIgFPD6xv2pQojDxhg3oLOf5xSUwoyDR
   g==;
X-CSE-ConnectionGUID: eSH/VXSESTGCcTarzaqNJg==
X-CSE-MsgGUID: 5ttlCMtDSXqdOt//8i5aHw==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="14017236"
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; 
   d="scan'208";a="14017236"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2024 03:27:47 -0700
X-CSE-ConnectionGUID: TwKTajOsQoiHfU0xQ+QXkA==
X-CSE-MsgGUID: 6/5mpYAsR/GfXFqanzGk5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; 
   d="scan'208";a="37430053"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by orviesa008.jf.intel.com with ESMTP; 03 Jun 2024 03:27:45 -0700
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
Subject: [PATCH 4/4] ASoC: topology: Clean up route loading
Date: Mon,  3 Jun 2024 12:28:18 +0200
Message-Id: <20240603102818.36165-5-amadeuszx.slawinski@linux.intel.com>
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

Instead of using very long macro name, assign it to shorter variable
and use it instead. While doing that, we can reduce multiple if checks
using this define to one.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/soc-topology.c | 26 ++++++++------------------
 1 file changed, 8 insertions(+), 18 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 1db540aaad451..2ac442644ed4f 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -1021,6 +1021,7 @@ static int soc_tplg_dapm_graph_elems_load(struct soc_tplg *tplg,
 	struct snd_soc_tplg_hdr *hdr)
 {
 	struct snd_soc_dapm_context *dapm = &tplg->comp->dapm;
+	const size_t maxlen = SNDRV_CTL_ELEM_ID_NAME_MAXLEN;
 	struct snd_soc_tplg_dapm_graph_elem *elem;
 	struct snd_soc_dapm_route *route;
 	int count, i;
@@ -1044,38 +1045,27 @@ static int soc_tplg_dapm_graph_elems_load(struct soc_tplg *tplg,
 		tplg->pos += sizeof(struct snd_soc_tplg_dapm_graph_elem);
 
 		/* validate routes */
-		if (strnlen(elem->source, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) ==
-			    SNDRV_CTL_ELEM_ID_NAME_MAXLEN) {
-			ret = -EINVAL;
-			break;
-		}
-		if (strnlen(elem->sink, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) ==
-			    SNDRV_CTL_ELEM_ID_NAME_MAXLEN) {
-			ret = -EINVAL;
-			break;
-		}
-		if (strnlen(elem->control, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) ==
-			    SNDRV_CTL_ELEM_ID_NAME_MAXLEN) {
+		if ((strnlen(elem->source, maxlen) == maxlen) ||
+		    (strnlen(elem->sink, maxlen) == maxlen) ||
+		    (strnlen(elem->control, maxlen) == maxlen)) {
 			ret = -EINVAL;
 			break;
 		}
 
 		route->source = devm_kmemdup(tplg->dev, elem->source,
-					     min(strlen(elem->source),
-						 SNDRV_CTL_ELEM_ID_NAME_MAXLEN),
+					     min(strlen(elem->source), maxlen),
 					     GFP_KERNEL);
 		route->sink = devm_kmemdup(tplg->dev, elem->sink,
-					   min(strlen(elem->sink), SNDRV_CTL_ELEM_ID_NAME_MAXLEN),
+					   min(strlen(elem->sink), maxlen),
 					   GFP_KERNEL);
 		if (!route->source || !route->sink) {
 			ret = -ENOMEM;
 			break;
 		}
 
-		if (strnlen(elem->control, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) != 0) {
+		if (strnlen(elem->control, maxlen) != 0) {
 			route->control = devm_kmemdup(tplg->dev, elem->control,
-						      min(strlen(elem->control),
-							  SNDRV_CTL_ELEM_ID_NAME_MAXLEN),
+						      min(strlen(elem->control), maxlen),
 						      GFP_KERNEL);
 			if (!route->control) {
 				ret = -ENOMEM;
-- 
2.34.1

