Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E1C6216C
	for <linux-sound@vger.kernel.org>; Mon,  4 Mar 2024 19:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709579070; cv=none; b=p9V3GCy6XWChj6k3Z9JtNYfW7ug7rL3af+zBsp9QcE/1LIdCKLn3NhZBz0khGjL6B5WcoUuRc+fLJf0abT/SxdYQtUvr3YyXBUPZI34pmLmzmimr/YwaNwSaBbOshbnfSBh/jsKw1NUFrlyx0CLfPbFhqtHC8UPMYE1h73hCZmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709579070; c=relaxed/simple;
	bh=IGtLZonsM9HIqBfRp5gPX4on64P1EIL/CQLv8R7f7l4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jeobW9h1Sf5onnD3ZsO2WQvOntcvFwc02QTtGgNjljlTiUvpTsoV8UDtM6SLmzlgl8xm10Mzsu48KvOjsECek/hKfLguMhfNhgegVef7PIUJPHlMmreydEVhbblro6Nuy/NepoiMaHiGIBuXt1rk9rN/bIzCcKtuCI5jWSzGFNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c5dj1LR9; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c5dj1LR9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709579069; x=1741115069;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IGtLZonsM9HIqBfRp5gPX4on64P1EIL/CQLv8R7f7l4=;
  b=c5dj1LR9coiSWf4YNd4JxYneDYTY8S+eofIq/0kxjAV9LTgs08CC6rVl
   RVvkSf6wy9xfLQO/Cg4ANSmxP1Ua/7SaM1QO0mh9bYpTMZBW/lZV+IGEw
   i4ypr60/onifvKvc+miXvj1MffJI8AOSND6BOqn4RADHMyPPhyum573+w
   s+y8GI67TvD2J5wmcj0V+D9lYfbWhgNyGVcrnLohBAyTXaPsc01B7hk+u
   zcb79hEwN9+Ww9zhOHPcHUzCyRQUI3M/DMWQEIeUNXbVgW1YCmxmmyE4P
   iTrny1OnSRMyYonAR+QYW154/94Izyy3H/ZkKwwSERHso82eg9m9crZ0G
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4257273"
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="4257273"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 11:04:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="13788282"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orviesa005.jf.intel.com with ESMTP; 04 Mar 2024 11:04:26 -0800
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
Subject: [PATCH 2/5] ASoC: topology: Do not ignore route checks when parsing graphs
Date: Mon,  4 Mar 2024 20:05:33 +0100
Message-Id: <20240304190536.1783332-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240304190536.1783332-1-cezary.rojewski@intel.com>
References: <20240304190536.1783332-1-cezary.rojewski@intel.com>
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
 sound/soc/soc-topology.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index d6d368837235..778f539d9ff5 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -1083,8 +1083,9 @@ static int soc_tplg_dapm_graph_elems_load(struct soc_tplg *tplg,
 			break;
 		}
 
-		/* add route, but keep going if some fail */
-		snd_soc_dapm_add_routes(dapm, route, 1);
+		ret = snd_soc_dapm_add_routes(dapm, route, 1);
+		if (ret && !dapm->card->disable_route_checks)
+			break;
 	}
 
 	return ret;
-- 
2.25.1

