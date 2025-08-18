Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C785731579B
	for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 10:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755512439; cv=none; b=QQuc6FmbddCZRBkNFZZZKi1aB4/UH7gXlhbjBpkZ9c2yboLXfKdmmD8Om/+rBrQTX3gFvtZiEfAuo58TaJnS4yJrDAj+jUjeyXm763zRZrcONzCrRDBSf+oTM34fvHQHGWkG0k4EDInd8PRPAK/4AVVBmuqYj0QAhM4ZI5/+HIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755512439; c=relaxed/simple;
	bh=3VHsP3+NlOX3xPii01LUI7JnS02JV/lc67W2qIVZ50E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iDBXk2rI5e9QgRNR6oFs2qfcE6xGKr1v9pf/mh4Vi+HretT08vF4qsiViWp4hrBrIszee+MdLFyh7S4hxI1nhh9unNv6yj5QS4/ptW66EimYuXuB8MHtlystP88pAeW/ItumumHJAU8ktYB2/RYrxpiJ1YPh6NlEPhzHgbbQIcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DKoETQuJ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DKoETQuJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755512438; x=1787048438;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3VHsP3+NlOX3xPii01LUI7JnS02JV/lc67W2qIVZ50E=;
  b=DKoETQuJ/yXijBx1G70jjmOMwjRuaCysQ0FoLPmVnytq6L3Gu52gvaD+
   N7+sg7lYActo7/3W0cyiRQGBoPMFmWL15Gj4tVgTjLs0KvxLgMlXZ9+gz
   EjhU4pHHfCe/KBZpv+DTzA3UIukxLTyylikJAraBfo+rkL3cXsqCfKeuJ
   fIQqT8u4dOBTunYABCcthbSDbs7iom0CjUWKt/AhEIRDR9OXwuv2/NiKj
   YIpjvgjwP2UU7O5XGmRgl4hp1wXaav6eoMVfpEttza8T4Z8Is+4HLjXwS
   k36upDoQg2Po+wjZdN8uaQA+/fQOosS1rk4TnVKg9wjHiE7kWZlXZ9dVX
   w==;
X-CSE-ConnectionGUID: q7ydAOFcTNis1Y9C8roeCw==
X-CSE-MsgGUID: zbTh0w/+TbS/KhLF2XlyAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="68825907"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="68825907"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 03:20:37 -0700
X-CSE-ConnectionGUID: /o4WroBAS7iq5G5NhcDl/w==
X-CSE-MsgGUID: SeiL/WqISDKwuvDUBmVdeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="166717211"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa006.jf.intel.com with ESMTP; 18 Aug 2025 03:20:35 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 2/4] ASoC: Intel: avs: Drop pcm.h dependency for probes
Date: Mon, 18 Aug 2025 12:41:24 +0200
Message-Id: <20250818104126.526442-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250818104126.526442-1-cezary.rojewski@intel.com>
References: <20250818104126.526442-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The 'probe' machine board is not a typical one, it serves debug purpose
only and does not expect any kind of topology. The topology descriptor
pointer (acomp->tplg) is the only reason an avs-driver component would
utilize the pcm.c helpers and be described by a 'struct
avs_soc_component' instance rather than 'struct snd_soc_component' one.

Cut the line linking probes.c with pcm.h to avoid confusing readers.
And with that link gone, constify the component-driver again.

Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/probes.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/avs/probes.c b/sound/soc/intel/avs/probes.c
index 505ca4975e61..88c6d385c73c 100644
--- a/sound/soc/intel/avs/probes.c
+++ b/sound/soc/intel/avs/probes.c
@@ -285,7 +285,7 @@ static struct snd_soc_dai_driver probe_cpu_dais[] = {
 },
 };
 
-static struct snd_soc_component_driver avs_probe_component_driver = {
+static const struct snd_soc_component_driver avs_probe_component_driver = {
 	.name			= "avs-probe-compr",
 	.compress_ops		= &avs_probe_compress_ops,
 	.module_get_upon_open	= 1, /* increment refcount when a stream is opened */
@@ -293,6 +293,20 @@ static struct snd_soc_component_driver avs_probe_component_driver = {
 
 int avs_probe_platform_register(struct avs_dev *adev, const char *name)
 {
-	return avs_soc_component_register(adev->dev, name, &avs_probe_component_driver,
-					  probe_cpu_dais, ARRAY_SIZE(probe_cpu_dais));
+	struct snd_soc_component *component;
+	int ret;
+
+	component = devm_kzalloc(adev->dev, sizeof(*component), GFP_KERNEL);
+	if (!component)
+		return -ENOMEM;
+
+	component->name = devm_kstrdup(adev->dev, name, GFP_KERNEL);
+	if (!component->name)
+		return -ENOMEM;
+
+	ret = snd_soc_component_initialize(component, &avs_probe_component_driver, adev->dev);
+	if (ret)
+		return ret;
+
+	return snd_soc_add_component(component, probe_cpu_dais, ARRAY_SIZE(probe_cpu_dais));
 }
-- 
2.25.1

