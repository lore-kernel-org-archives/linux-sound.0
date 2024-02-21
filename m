Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF3B80609
	for <linux-sound@vger.kernel.org>; Wed, 21 Feb 2024 15:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708529035; cv=none; b=qYMd72a6EnE8V5mept9rziwMbS3swli2aJgO/K38oAZiFFZoe2lq0aH3LyV8KTslYEaaepnHuWDefTV+1kLtvyN2YtyJojm/DSez2bqes4Bsv1SsBAb4e3d4MEQsV0BCtQGsCo1ENJXerSYIJtcMF+FyxT4RB4DF3Mgz6xELeCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708529035; c=relaxed/simple;
	bh=Qtg3t5Qo59zUGmKkh1SsQQK/Vt6TCkwJIxrRq/xMrnI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tyf7Lkp2uDHsiRpVWvp8TsDr7JIjLSm9o6cfQKdJHz5j3yyt1WbrAFm6yYf3u0emyW+DYzqdHcGjGL1CJlZfxphj+x+b2TAwSMl5P9meKXSH731R6bdF1yq9cfVX4hYJBuiglHdKf4i8wgBxQRm/QbVIK05SZ6QP7NsLUsU4v/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IvomuOK+; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IvomuOK+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708529034; x=1740065034;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Qtg3t5Qo59zUGmKkh1SsQQK/Vt6TCkwJIxrRq/xMrnI=;
  b=IvomuOK+tkKLgGHOLnqU+2I3rDYVIT5GSbUuSxNz2pUeAdhKfkplJjTN
   HKbIvEL+dzxfAVtnJGcUHshJnI268rbZ1I2bDnfzYIL0LS1rMwDzCh5IE
   xqHhIyyYdllVryH9Lr4AUA6bDaexq4piPqj/+5ewm9mppLB9v7hWWdKiG
   0uw6Ovx3JKq3ulMhHNsEqlDStWdGTHuPOoZYzY7X7EAIZCsv47rERjH5c
   IoB+XmiqFr8vw2F6gg8zWEt5yS+Qx671FKoCybXUXpu8uWt4UeMyQd2lu
   5bs6EzTjPdmXgTu9Vx7tEPIKiRqYz5P39QJ2J8YXhI+WZvXAn4OwkR1CN
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="14104811"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="14104811"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 07:23:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="5374278"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmviesa006.fm.intel.com with ESMTP; 21 Feb 2024 07:23:51 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 4/6] ASoC: codecs: rt5616: Simplify mclk initialization
Date: Wed, 21 Feb 2024 16:25:14 +0100
Message-Id: <20240221152516.852353-5-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240221152516.852353-1-cezary.rojewski@intel.com>
References: <20240221152516.852353-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Most of clk_xxx() functions do check if provided clk-pointer is
non-NULL. These do not check if the pointer is an error-pointer.
Providing such to a clk_xxx() results in a panic.

By utilizing _optional() variant of devm_clk_get() the driver code is
both simplified and more robust. There is no need to remember about
IS_ERR(clk) checks each time mclk is accessed.

Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/codecs/rt5616.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/rt5616.c b/sound/soc/codecs/rt5616.c
index c13108b51eaf..e7aa60e73961 100644
--- a/sound/soc/codecs/rt5616.c
+++ b/sound/soc/codecs/rt5616.c
@@ -1174,9 +1174,6 @@ static int rt5616_set_bias_level(struct snd_soc_component *component,
 		 * away from ON. Disable the clock in that case, otherwise
 		 * enable it.
 		 */
-		if (IS_ERR(rt5616->mclk))
-			break;
-
 		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_ON) {
 			clk_disable_unprepare(rt5616->mclk);
 		} else {
@@ -1225,9 +1222,9 @@ static int rt5616_probe(struct snd_soc_component *component)
 	struct rt5616_priv *rt5616 = snd_soc_component_get_drvdata(component);
 
 	/* Check if MCLK provided */
-	rt5616->mclk = devm_clk_get(component->dev, "mclk");
-	if (PTR_ERR(rt5616->mclk) == -EPROBE_DEFER)
-		return -EPROBE_DEFER;
+	rt5616->mclk = devm_clk_get_optional(component->dev, "mclk");
+	if (IS_ERR(rt5616->mclk))
+		return PTR_ERR(rt5616->mclk);
 
 	rt5616->component = component;
 
-- 
2.25.1

