Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701711DE4E4
	for <linux-sound@vger.kernel.org>; Fri,  6 Dec 2024 07:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733471958; cv=none; b=BaayBYEFqWkGK+/EgsMlqaHvlv2o2aGoogGAaPbri2zGRVbwGAHwN8D2RddE6oY275YTvi7xcMGMe3pgf8koCJ5t0Uwj4mWGTgIAJ15N4YjYl+XgAkQgdOmdN7foUy6241X5mG3iDPnn/mpz86DfGRdgLrP+MoIANjFdP4ENi68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733471958; c=relaxed/simple;
	bh=wLy/wZWrNny6GW+mcW2Dmc754xzduH6mmbcD46wOXjk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KAFkCRaKI0XL+FjY/NYDBRQOdnRK7mpzj6gE5ZAVlIi+hrJXqVpUIild8DXm+7H4tPzOWR7q92tbchvYrZeX97CAVuz4844g8nUZJibTPv3oBBhOb2GwCRFwpgLp4Gk8MccwO3vPathd2ZbdyyW1lK9bSt5CSewbuXSRRf/Gp7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OKcSuhgN; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OKcSuhgN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733471957; x=1765007957;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wLy/wZWrNny6GW+mcW2Dmc754xzduH6mmbcD46wOXjk=;
  b=OKcSuhgNZM8itUfD+b3UEAAwRzlRqG6T6XXyh6+aYBmyaQoWMqnmF353
   WsJVyKiwXLzeBG2C97MN3eSyx6zbbuPo0bz4CHm5nDqkrnuP41xPgWE/Q
   LMAQfvGj4WA++6Vk8AOl+wf9GMJwEmDT/cfly+Ak5Q+a9HhxF/b/9Ixfn
   i5MuXe9GX871FruL5tWT5XyjvhUB3TrlBlnw6MmJoFngIz8v6apbH5qGX
   UD0Bx066Am9hIZgjUG6kC0txmr1g8Gl357YLfPAU8HtaAKrJUbRRqViHj
   J7lWmoOB6E0fngVjfCXWHeNnQ0g+5ezuY5g5hEJ+FCN90YAMe2QpqVeco
   Q==;
X-CSE-ConnectionGUID: rR0sjVcKTb2xzRg1rNw8QA==
X-CSE-MsgGUID: /J3I8T9vR2eiRlAO99mNNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="45192776"
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; 
   d="scan'208";a="45192776"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 23:59:17 -0800
X-CSE-ConnectionGUID: dF85TEqERI6vl96r5gOGWw==
X-CSE-MsgGUID: EfbbtILsS2+AtVe0jyzklQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; 
   d="scan'208";a="94144385"
Received: from ssimmeri-mobl2.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.220.179])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 23:59:16 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 02/10] ASoC: Intel: sof_sdw: reduce log level for not using internal dmic
Date: Fri,  6 Dec 2024 15:58:55 +0800
Message-ID: <20241206075903.195730-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241206075903.195730-1-yung-chuan.liao@linux.intel.com>
References: <20241206075903.195730-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

ctx->ignore_internal_dmic is set when there is a dedicated SoundWire
DMIC is in the system. In other words, ignoring internal DMIC is
expected, not an error.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index b58b9d85b56e..d9fdd17a9650 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1109,7 +1109,7 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 
 	/* enable dmic01 & dmic16k */
 	if (ctx->ignore_internal_dmic) {
-		dev_warn(dev, "Ignoring internal DMIC\n");
+		dev_dbg(dev, "SoundWire DMIC is used, ignoring internal DMIC\n");
 		mach_params->dmic_num = 0;
 	} else if (mach_params->dmic_num) {
 		dmic_num = 2;
-- 
2.43.0

