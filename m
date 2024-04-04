Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A126D131BDE
	for <linux-sound@vger.kernel.org>; Thu,  4 Apr 2024 18:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712256903; cv=none; b=SCdqZ0SaY25w6ajRFz1DRYftjRU1H6YxE5GoIEpUTHXlQlh+LBAM6wFTJXqQD4F6ViG1AgC60IC645mDITF8UNXKbbNYWMinSXQsDMKoYhgsr2hzs1hpOHPj5yvJzlA1VL/g6+2nFeVQV1ujgpxVRv2j6qxs+yyf96s8MVCTnfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712256903; c=relaxed/simple;
	bh=afNioHGncXnRJlF/ZevFtsEpxu9GMprGXgRv6adODQM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tj1OJ5RceruDewKndM6WqkSDfxe/zx1Vfdfeb7WXJPO9k8WGBc1VVCWnpk/eKDJNF1ZjmAupLxvI+5BB/+j04vNsMNbFaMSH/d6vLdjmqbu3WA9gmbBvaOG0uqvMiNNRx2klJXgebmskefiz5cfzaX8f9G54Pl1mx03BOJFnhNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mcvOeqcb; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mcvOeqcb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712256902; x=1743792902;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=afNioHGncXnRJlF/ZevFtsEpxu9GMprGXgRv6adODQM=;
  b=mcvOeqcbuljAgMYcjr2hoSe30b4Mbz/DzDDaQDFzIobcKWBuBlXU7ad0
   MoQ/IO32hVCjvQp0o+jgsqvKBQtFmDQgZLlS/D8e2wmM8E8dq6Vvdcrz7
   DLSAGeWb4ccS9sS/GQ0cXtWbHUVK1m9igYEEKs0yoUXKeCwDBu8GvOFLK
   oKNJdts4Emaqs4SSS6ZaSO2LjBpDXKNQMco8GyH0SA1RmrQepjv8OYX1H
   KlFHe9fxjH1GJG0s+2rsnV/0WdNdPl+hUWZStgbGknjKp//Z9/G9j3GfK
   mfoIngkrWep2oR91z2Ia8ReNBcJKXhDWPwUhEemsWpubAAsC1GmZzvvbU
   Q==;
X-CSE-ConnectionGUID: POzUrt5SSziBN8HenznX8Q==
X-CSE-MsgGUID: A4ooBc4qSXe1xXO2/O5wzA==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7432811"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="7432811"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 11:55:01 -0700
X-CSE-ConnectionGUID: aHo12uyoSGS26cpp5olWEg==
X-CSE-MsgGUID: C10+nUKDTGuU152yUCmKqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="23574633"
Received: from sparrish-mobl1.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.119.106])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 11:55:00 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: [PATCH 4/4] ASoC: SOF: Intel: hda-stream: clarify comment
Date: Thu,  4 Apr 2024 13:54:48 -0500
Message-Id: <20240404185448.136157-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240404185448.136157-1-pierre-louis.bossart@linux.intel.com>
References: <20240404185448.136157-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Yoda grammar and multiple negatives are unclear.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda-stream.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
index 76c33795ade4..91b1371745e6 100644
--- a/sound/soc/sof/intel/hda-stream.c
+++ b/sound/soc/sof/intel/hda-stream.c
@@ -785,7 +785,7 @@ static bool hda_dsp_stream_check(struct hdac_bus *bus, u32 status)
 				continue;
 			}
 
-			/* Inform ALSA only in case not do that with IPC */
+			/* Inform ALSA only if the IPC position is not used */
 			if (s->substream && sof_hda->no_ipc_position) {
 				snd_sof_pcm_period_elapsed(s->substream);
 			} else if (s->cstream) {
-- 
2.40.1

