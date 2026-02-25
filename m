Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7AC3B8D43
	for <linux-sound@vger.kernel.org>; Wed, 25 Feb 2026 13:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772027421; cv=none; b=dyTtlCz27fubD8mD99Y2SnjRREer8NNnTLfB+Ck5yK9Iboqctr583Q8Y+p3wqliOyTC+Qojfs5P24M+9ak8tISziJNeXQivQAWAaNG91P7X2jI4/u2G8dvVr+lDW2qYQgThQIC5npUnza0fz3mWbU6wTocn3KnwqTdYCpFLNm6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772027421; c=relaxed/simple;
	bh=/SlnaFDr6NL4KAINDaBaBIKfctE2gPjhxCXaFUMNgng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZB9q8eWUBITMn7DecoAkNk8LoGSJT8+eEjXMeGtyMVlrrxHKJtlRLuK1ZkqGyfCIUtL/s+jb8hSVEOv12c44FwOyaoJt1BjksvcG0SQWB0uhGZksuOETO0e8EBSKlJFRLJG2GFv2rA9QseJ8mBHdUVkYkcZlG6oqH0s4YsP0ajQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EyDDqKUu; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EyDDqKUu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772027419; x=1803563419;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/SlnaFDr6NL4KAINDaBaBIKfctE2gPjhxCXaFUMNgng=;
  b=EyDDqKUuvFe3KzPfowvgi3QcajVgoARfFeguHnZBTViIUx8WCpJWkbq7
   ZjqabQLcE1YDNr48h9K3sMuLQ1ZmhKbt0eg5F9yEdKWH6uS4gnldMQbMl
   5iZz+alop6NApVtwjJXct+0Vnl00Lh/mxE4QyEsAsn+H4LTKbo6v1+eYg
   I7YaGl0wbJk/gP6iJ33fYca2DIFIXORI3yYFZfvYbF4LiUjpVaFQsWSK9
   sTnlAS03daep/PITgxhIUOur6DSKW6Ljyq72MunQFil3noT1aHOuW2lbb
   Tg2m426pBUlUJnAgpmz98QLiLeSgCAo0VIXULjBwpPuI9CgJdo1z57ESh
   g==;
X-CSE-ConnectionGUID: iQDFbgHZRuurk+4bBKBIqg==
X-CSE-MsgGUID: GnDCXdeNSWKTKeUrxxRXhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="73037447"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; 
   d="scan'208";a="73037447"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 05:50:18 -0800
X-CSE-ConnectionGUID: 7P4vLtC9RYS0kEb2rKSbVQ==
X-CSE-MsgGUID: 7+8yWHxJSdaPT5CcQvkcig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; 
   d="scan'208";a="214352139"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 05:50:17 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com,
	Deep.Harsora@Dell.com
Subject: [PATCH 2/3] ASoC: soc_sdw_utils: partial match the codec name
Date: Wed, 25 Feb 2026 21:50:03 +0800
Message-ID: <20260225135004.2322987-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260225135004.2322987-1-yung-chuan.liao@linux.intel.com>
References: <20260225135004.2322987-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Currently, we can set codec name in the dai info which will be set as
the codec component name in a DAI link. However, the codec name may
not be fixed. For example, there is an index in a SDCA codec name and
that is not fixed. Lookup the fixed codec name string from the component
list to get the right component name to ensure the DAI link will bind
to the right codec component.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sdw_utils/soc_sdw_utils.c | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index 0e67d9f34cba..821eb9720f6f 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -1215,8 +1215,18 @@ const char *asoc_sdw_get_codec_name(struct device *dev,
 				    const struct snd_soc_acpi_link_adr *adr_link,
 				    int adr_index)
 {
-	if (dai_info->codec_name)
-		return devm_kstrdup(dev, dai_info->codec_name, GFP_KERNEL);
+	if (dai_info->codec_name) {
+		struct snd_soc_component *component;
+
+		component = snd_soc_lookup_component_by_name(dai_info->codec_name);
+		if (component) {
+			dev_dbg(dev, "%s found component %s for codec_name %s\n",
+				__func__, component->name, dai_info->codec_name);
+			return devm_kstrdup(dev, component->name, GFP_KERNEL);
+		} else {
+			return devm_kstrdup(dev, dai_info->codec_name, GFP_KERNEL);
+		}
+	}
 
 	return _asoc_sdw_get_codec_name(dev, adr_link, adr_index);
 }
@@ -1528,7 +1538,17 @@ int asoc_sdw_parse_sdw_endpoints(struct snd_soc_card *card,
 				return -EINVAL;
 
 			for (j = 0; j < codec_info->aux_num; j++) {
-				soc_aux->dlc.name = codec_info->auxs[j].codec_name;
+				struct snd_soc_component *component;
+
+				component = snd_soc_lookup_component_by_name(codec_info->auxs[j].codec_name);
+				if (component) {
+					dev_dbg(dev, "%s found component %s for aux name %s\n",
+						__func__, component->name,
+						codec_info->auxs[j].codec_name);
+					soc_aux->dlc.name = component->name;
+				} else {
+					soc_aux->dlc.name = codec_info->auxs[j].codec_name;
+				}
 				soc_aux++;
 			}
 
-- 
2.43.0

