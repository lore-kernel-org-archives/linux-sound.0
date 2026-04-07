Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9328813959D
	for <linux-sound@vger.kernel.org>; Tue,  7 Apr 2026 08:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775551996; cv=none; b=SBKDbqiuPBPHJNVVXbZmGE9XyJsifsDb3Yl8jqG8qA6d4S4HG0ClpGWuxkb7gcpFu4+C6NZnNIlN94oe3qVC3r/q0usxf5UOkFYcS6uaie/FmKq6gEL4Qtq4FWB0D7Sa9iu/lEJH0Bh7/KDrgZjzDZhLv4bI9MyW0zK3qqZETTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775551996; c=relaxed/simple;
	bh=jcoB9FnGXJlymoTysqF8AlgxbfqWh4O7+GWkZmYcz9w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ohH/sMhyaUPcO6lTFImkjWy2xt6W/8ELNd8z9eLa0YaTExXNidXTwdP1uoFWXdUhmOm12+Yedwajj+DOFqGzcDRXlC+glchqaZ9i+CRD89o4YTAtxh4P8WENCkWKgYIjSwc7PqFqYuACUHFRg88b//RJ9MRKpQzRZVijeAVjg2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GOu5XH+0; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GOu5XH+0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775551996; x=1807087996;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jcoB9FnGXJlymoTysqF8AlgxbfqWh4O7+GWkZmYcz9w=;
  b=GOu5XH+0cuDPwc+IZzHXXWRRgJbBtGjzUSmEQodnLnzCRYYTnRDxAgl5
   qYxygN2CBomwVCscdeuOIaqZB2CwYDBhTSr/b6pMEucK1MhqzHb6T/Twe
   J+cczHs5zFLbSfOD/Wyamc6tpq+jKxYAsae1N8HQzsdThyB6w76tsRqxl
   uYTwlp5GA3ByNEW344xs7DZqKP2bbtwGLsEJLJxK1vsDWFr8t1oAyJpLB
   N8q8+kH754K33/1IKQejHkU3XY0zgMlEE1/MWyWVmOgAyGPtWaSZruNWP
   QGFhq1eK+W40dMhsW9ur9T/SuVDh3H7RLCUxPmtVDwLIxE06ujLR/4EGZ
   g==;
X-CSE-ConnectionGUID: z0uOb6QcR467oAE8MeBqrw==
X-CSE-MsgGUID: ltONOJc0TPC/PTZP1MwaAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="87133633"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="87133633"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 01:53:16 -0700
X-CSE-ConnectionGUID: ZOsGP2FVRbe7L+d0I0FfLw==
X-CSE-MsgGUID: gkW6pVJRQ9OuupxD8nblmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="266093337"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa001.jf.intel.com with ESMTP; 07 Apr 2026 01:53:14 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 2/2] ASoC: Intel: avs: Fix type warning in avs_probe_compr_set_params()
Date: Tue,  7 Apr 2026 10:54:59 +0200
Message-Id: <20260407085459.400628-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260407085459.400628-1-cezary.rojewski@intel.com>
References: <20260407085459.400628-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Expected argument type is snd_pcm_format_t.
Found out by sparse.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---

This is a continuation of topic "ASoC: Intel: avs: Set of streaming
fixes" from last year [1]. The warning keeps popping out in the scans,
time to get rid of it.

[1]: https://lore.kernel.org/linux-sound/dd089b21-571c-41e2-bcea-d666ee7af882@intel.com/


 sound/soc/intel/avs/probes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/probes.c b/sound/soc/intel/avs/probes.c
index 74096236984a..099119ad28b3 100644
--- a/sound/soc/intel/avs/probes.c
+++ b/sound/soc/intel/avs/probes.c
@@ -144,7 +144,7 @@ static int avs_probe_compr_set_params(struct snd_compr_stream *cstream,
 	ret = snd_compr_malloc_pages(cstream, rtd->buffer_size);
 	if (ret < 0)
 		return ret;
-	bps = snd_pcm_format_physical_width(params->codec.format);
+	bps = snd_pcm_format_physical_width((__force snd_pcm_format_t)params->codec.format);
 	if (bps < 0)
 		return bps;
 	format_val = snd_hdac_stream_format(params->codec.ch_out, bps, params->codec.sample_rate);
-- 
2.34.1

