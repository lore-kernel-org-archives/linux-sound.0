Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D594524DB
	for <linux-sound@vger.kernel.org>; Fri,  8 Mar 2024 09:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709888610; cv=none; b=PbIOI6M/jtO/GKXgl+qxjUQOoruyJsIhLEmTLAOB1BwceSzVZJjX4rpK23ll7E70e7mXhWXezRLn6u5VVOKZOKQbC7dadofj93EctSPTKg2al5ssWmA3VW2z9lWZMpZ9e4AKkpwgmwA046iBlMzYRYtP3oGtOzI6meLctCHXEEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709888610; c=relaxed/simple;
	bh=987J4jSN2YeS8t+dPex97AJlbaCIYqZsrW1RFXkxa5c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uaJR8+tZzcpgn3tqiFWJrHlruijsALAjA4fdEV/sIh0P5OzCdSJTGusdP8t9jC2vEpSJ+D7Rh5RixmolSZxiH0zSvRCTXKJdRyDcRTUZ54n//JOkL2GPXdjZZ1RI2Re4jnc21G30LQbn1nQTdkd0i6olWwT8bCrSwNC5X2uo0Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MyJBFXvt; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MyJBFXvt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709888609; x=1741424609;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=987J4jSN2YeS8t+dPex97AJlbaCIYqZsrW1RFXkxa5c=;
  b=MyJBFXvtvx98LQoOBpmeHCXdxpPg181prBYCkKOyNm/2CnDDxlHtGGQR
   vAv0ud8zcz3+s3r09Dpu3GrJ6IwUHdWC8YCjm/unZcr1JHRiiTzP2HbXS
   KUIkIsYDS6a1YISWDU0z5DJSFq59IORsWZoCz6Iw41CMp94qgUThi8G7K
   gOJXgIZk/ohdpxFktL9eUI/LE7uG+bdW8O2cT7HSHJhWo+3YK80uwB3j/
   lAK/+iyT2GrGCj53u3gGr0A0GbDcZV/JyMFTJO2RmngShKKpmcV3iTG7+
   Pi6f2XpNU3r55pvYXYwnwxHqVIu6ip8L6Cbq2O2MBS38Dy3BbtlUwuNf1
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="15247000"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="15247000"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 01:03:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="10419269"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orviesa010.jf.intel.com with ESMTP; 08 Mar 2024 01:03:26 -0800
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
Subject: [PATCH v2 2/5] ASoC: topology: Do not ignore route checks when parsing graphs
Date: Fri,  8 Mar 2024 10:04:59 +0100
Message-Id: <20240308090502.2136760-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240308090502.2136760-1-cezary.rojewski@intel.com>
References: <20240308090502.2136760-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

One of the framework responsibilities is to ensure that the enumerated
DPCMs are valid i.e.: a valid BE is connected to a valid FE DAI. While
the are checks in soc-core.c and soc-pcm.c that verify this, a component
driver may attempt to workaround this by loading an invalid graph
through the topology file.

Be strict and fail topology loading when invalid graph is encountered.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/soc-topology.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index d6d368837235..90ca37e008b3 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -1083,8 +1083,15 @@ static int soc_tplg_dapm_graph_elems_load(struct soc_tplg *tplg,
 			break;
 		}
 
-		/* add route, but keep going if some fail */
-		snd_soc_dapm_add_routes(dapm, route, 1);
+		ret = snd_soc_dapm_add_routes(dapm, route, 1);
+		if (ret) {
+			if (!dapm->card->disable_route_checks) {
+				dev_err(tplg->dev, "ASoC: dapm_add_routes failed: %d\n", ret);
+				break;
+			}
+			dev_info(tplg->dev,
+				 "ASoC: disable_route_checks set, ignoring dapm_add_routes errors\n");
+		}
 	}
 
 	return ret;
-- 
2.25.1

