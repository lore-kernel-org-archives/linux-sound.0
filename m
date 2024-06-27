Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B59513C9D9
	for <linux-sound@vger.kernel.org>; Thu, 27 Jun 2024 10:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719483500; cv=none; b=iiB7MLIuyGPHBw0ssNza3GhhzQLlMoyW411zEmLiAVT8cFnFvhfS8B+GTOX7rE3CiouVNI1v/KDZ/2pwmXyQ3Zp4aUpBwhwQJPHaHbhG/ZeitbK+cR1qaeF1KiU1/o8RyiEBM6LIop9GY9pRVXePLFYQJFQ3men5LTmM4rVgkDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719483500; c=relaxed/simple;
	bh=vaSHlE11GGCI6hcWIEjCBQr+nTUhmZIOlw0Pkp4y+Ok=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GiV6Qtb1OpQuiV57y3k51LtW9eIlcbZesTu8IJ3Un7u+V/5hsZytwprkYgX5Np3KwZ7ZAgNQvladPX06SnkIqXW82YvC6nEOx7bLjaUw5JcLnGBX2vl8AKrU08iXRrhA82yHZ8dB91MnZuHXwaXkpPtm5t4/Eua0wEBH2mAcYE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f1W58dHF; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f1W58dHF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719483499; x=1751019499;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vaSHlE11GGCI6hcWIEjCBQr+nTUhmZIOlw0Pkp4y+Ok=;
  b=f1W58dHFOCoda/3GYhWZFc2nJF9ZfxffUaNClnTyCNFxUL1WTu6Dd/Zn
   V8bX763efcX5gc538g6JhfC6yta4i9BCOWGODNGATlJSax87erBdI6jpM
   XpmNlFkJkp0T3fOiwSWlWjo8CQXCtufPTudYYyfxufidrmcM2obmF7Dmn
   YhIFECp6bUk0pkcBTY6Liz6M3278aTQMwaBcBK1qUDwjF9hA1n6DGFw0y
   SZcmZOcmxLmbFuKPe+eAn1etQE/kTZkiw8cQ4NZ+lXbOc9SNs/Y7I1TQL
   ekCUdHCheskYs7S/p+n4mYmWh2PG1ij4/4Puur+xukpfF29VH9NP+ziiG
   w==;
X-CSE-ConnectionGUID: yHNI303XSYO7N4ia2cveSQ==
X-CSE-MsgGUID: /pZ5CHWSS7yXUnzho6F11Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="19487579"
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; 
   d="scan'208";a="19487579"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2024 03:18:19 -0700
X-CSE-ConnectionGUID: hMy5mUDXTyeYkWN7yebTbQ==
X-CSE-MsgGUID: Wv4AMbgiQCuioyAtUYMYeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; 
   d="scan'208";a="45079980"
Received: from dev2.igk.intel.com ([10.237.148.94])
  by orviesa008.jf.intel.com with ESMTP; 27 Jun 2024 03:18:17 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 03/13] ASoC: topology: Properly initialize soc_enum values
Date: Thu, 27 Jun 2024 12:18:40 +0200
Message-Id: <20240627101850.2191513-4-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240627101850.2191513-1-amadeuszx.slawinski@linux.intel.com>
References: <20240627101850.2191513-1-amadeuszx.slawinski@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

soc_tplg_denum_create_values() should properly set its values field.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/soc-topology.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index bd29b40acb991..15c006c47d804 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -847,6 +847,8 @@ static int soc_tplg_denum_create_values(struct soc_tplg *tplg, struct soc_enum *
 		se->dobj.control.dvalues[i] = le32_to_cpu(ec->values[i]);
 	}
 
+	se->items = le32_to_cpu(ec->items);
+	se->values = (const unsigned int *)se->dobj.control.dvalues;
 	return 0;
 }
 
-- 
2.34.1

