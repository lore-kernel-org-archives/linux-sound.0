Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431F826460D
	for <linux-sound@vger.kernel.org>; Thu, 19 Jun 2025 08:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750322546; cv=none; b=cYyYboei2p5VnlNoXpPxheDNjRxw6JhVWi6ZQCAbVKeh0Ikoh2ZodveUWNhzhdEK5zDD5EssDjguURCEVcnDA5nczcdhOmBlVQn7Y0Wpl1eyBKsmIx/nRQDGXZ7f3RQjcI+TBchBOjv0/Jszs/n8lk0/a0LYf34hqQK9+KKopK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750322546; c=relaxed/simple;
	bh=xNesR7Ww6on63md5B5ebmM1Ja57M6tTuwIjWkuIv7js=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=er2ONDnVJb74rKln4tLWSI0UhHCJB0rN8hh5Hwd4rnVK5n7WNxon3kX/WwjmoYbry1UenSdQ2tnVAueLLrZBHZlw/cgVxHOzRkiR0pP5zZi2TG2AaIMn1vsyPyi9CnlEJyX9jaFGlSOobs+59AeUQIKxzKoYHqtYv3GO0mDddoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VUCYOQU2; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VUCYOQU2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750322545; x=1781858545;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xNesR7Ww6on63md5B5ebmM1Ja57M6tTuwIjWkuIv7js=;
  b=VUCYOQU2wliwL+D4Lr1lOyr64dXLtw3qrSOgGejCVJYMvNhMfObbwvIa
   SCodK8AkKsoquhPzQf1nz55chr2zChvX2JicGnIv5WfvjiXMRWS9fAgN6
   AgW7q44d1FMwttR7pwzVHo/p+2kJUE1/6xQf89elDEtYrZScK6JaGvdgt
   /hC3MEs3KzY9ExpJwHfUzlv3c9it+pUQxhbe4DTRhL+499kVRni6o2wmS
   SttB4fdGxCXg60LkakbM3jGUQV9o2YMbonRxXXvCwW2HuUPNsOw/1DNTf
   PEEhxhywUgflxp66kGqaM/pjNOm9/tD7Q5jlJVuTpbtQu/1hf8uRI8ls/
   A==;
X-CSE-ConnectionGUID: btrEPNvKQzKTSnmbHTnNjw==
X-CSE-MsgGUID: F8IxBlSOTW+Ub3jir8MJng==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52491129"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="52491129"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 01:42:25 -0700
X-CSE-ConnectionGUID: FB9tHFHcSbSIMZ7/wpbKZg==
X-CSE-MsgGUID: kpyrAwKiRdGUI+HXCNEMsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="151224999"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.182])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 01:42:22 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev
Subject: [PATCH 2/4] ASoC: core: Check for rtd == NULL in snd_soc_remove_pcm_runtime()
Date: Thu, 19 Jun 2025 11:42:20 +0300
Message-ID: <20250619084222.559-3-peter.ujfalusi@linux.intel.com>
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

snd_soc_remove_pcm_runtime() might be called with rtd == NULL which will
leads to null pointer dereference.
This was reproduced with topology loading and marking a link as ignore
due to missing hardware component on the system.
On module removal the soc_tplg_remove_link() would call
snd_soc_remove_pcm_runtime() with rtd == NULL since the link was ignored,
no runtime was created.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/soc-core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index cfafdabcdc88..1ffabac1fb6b 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1139,6 +1139,9 @@ static int snd_soc_compensate_channel_connection_map(struct snd_soc_card *card,
 void snd_soc_remove_pcm_runtime(struct snd_soc_card *card,
 				struct snd_soc_pcm_runtime *rtd)
 {
+	if (!rtd)
+		return;
+
 	lockdep_assert_held(&client_mutex);
 
 	/*
-- 
2.49.0

