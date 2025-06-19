Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E7726460D
	for <linux-sound@vger.kernel.org>; Thu, 19 Jun 2025 08:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750322544; cv=none; b=UPWMyqp2TehHGE0+tNoCrXbDXwfTwwcahDu/W/O+d0vfdAcXGMJITHniXPVaRCQ3TdOMYydaPtsjrlvgZQVnywc9RiprmQQ4F43aw9gJkPGtDXnlBzjX5CiMQgS24Wbr4XDLLz93GqumDs7PaqOu/0vRMmfhaiRfNJ6tNf917Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750322544; c=relaxed/simple;
	bh=FFMpxCvPDPL/Hhvs7Lt/lm9hbXy5zHu7Jlvo6YkuOpQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aSirxKdLUtVFDC+bYAoiRZpW9l3+ZRs1JLU2Sva+PNLVaIKZns3+bVn4NS2Jp3zPZRV3dKNQ8zPYfdvzbs6WEO88yvsgTcQmSjLfjjR6BwKlPYEgc4ECshBd3QxDX+zn73vlk2gmzZY17ROJ5jgNjSkmuJA5IFnafbvo/uUnzjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fg4Gf+tQ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fg4Gf+tQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750322543; x=1781858543;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FFMpxCvPDPL/Hhvs7Lt/lm9hbXy5zHu7Jlvo6YkuOpQ=;
  b=fg4Gf+tQWoZT5AdFarKc9ZfTqSGw+tDCoeRjXX/gTLCG4GSsjmuiTgNu
   yHY2hU3aSgRfW0uGRjxHKQo5Dz/5gWuHp8ps7448HewwLL68SpyXGKJxV
   sXzvDxMdv2md6VmNyB172aMR9FeKBSeWBmznKzcoMeqdlU2q6JthqKdqy
   f7OIYB680tsnCnvwp93YDGvZLBN2XGUZWBlqpGOiuNg5sYThlIrhns3KW
   7OGZ5rmQWmcZWcbDCVv+Uo2RTCn5ejQm83RDQU2N+fsuMZwJ7lRsDBv+l
   YyEUoZOAFm3tzVhWiY4B1HmqTJej7jRGD0FDPqdvfi9eCp0p7ZE0Slysz
   w==;
X-CSE-ConnectionGUID: obsZVqPAS8q3gXqE6Q5bIA==
X-CSE-MsgGUID: L1Mj1TWhQyKenb0ndcsV1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52491117"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="52491117"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 01:42:22 -0700
X-CSE-ConnectionGUID: 8zkbNG3HSSulymUmH4AYVQ==
X-CSE-MsgGUID: w9jKdg8yR8mQAwRJD9Gytw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="151224972"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.182])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 01:42:20 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev
Subject: [PATCH 1/4] ASoC: topology: Do not call snd_soc_remove_pcm_runtime() for ignored links
Date: Thu, 19 Jun 2025 11:42:19 +0300
Message-ID: <20250619084222.559-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250619084222.559-1-peter.ujfalusi@linux.intel.com>
References: <20250619084222.559-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If a link has been ignored then it is not even added.
The snd_soc_get_pcm_runtime() will return NULL as the runtime will does
not exist.
We can just skip this step to avoid performing a lookup to do nothing.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/soc-topology.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 7b0b8531bb32..44b60324eaa2 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -429,8 +429,11 @@ static void soc_tplg_remove_link(struct snd_soc_component *comp,
 		dobj->unload(comp, dobj);
 
 	list_del(&dobj->list);
-	snd_soc_remove_pcm_runtime(comp->card,
-			snd_soc_get_pcm_runtime(comp->card, link));
+
+	/* Ignored links do not need to be removed, they are not added */
+	if (!link->ignore)
+		snd_soc_remove_pcm_runtime(comp->card,
+				snd_soc_get_pcm_runtime(comp->card, link));
 }
 
 /* unload dai link */
-- 
2.49.0

