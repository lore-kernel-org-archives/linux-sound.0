Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1D02076A5
	for <linux-sound@vger.kernel.org>; Thu,  7 Nov 2024 13:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730986785; cv=none; b=VLgtWMSVfntb48X33NHljpJCgiRrCVqC/VzfBNI4ZGvuGAS3+NbOH6w1BXmiV2W73kaU4shkNMgpvdMju7hRmrrws3ylqf1SJr+sZLR7xGSOZO6b6xl/XRWC9Grctsu4GwLzs6DXwSW9DiD2H/iPx9xkq0G95V48zn0AADCjpLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730986785; c=relaxed/simple;
	bh=LqqhwPlxcO2JxdSrcs3Lu3AmePjO62vwDBMdtAmA4fk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WG0zkcnlKzP7tWRz4HtgOS1kvbZ5CUIhUBkxUN6IKdpqrjag+foh2eYOQ8ivbrUxnHKsvaOPQyRrb737ULdr7p9dVAUbuC/uZwfHq1hywiDOx4Fam/izHPi7sDQBQvsUC08fPlJI2jjY56yTM80/bTCR+10fJWpK0cl2FZw+QQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QE2lDjKv; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QE2lDjKv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730986784; x=1762522784;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LqqhwPlxcO2JxdSrcs3Lu3AmePjO62vwDBMdtAmA4fk=;
  b=QE2lDjKvm0JwQd1If4SdbotWXAqqwnjFvRWcvTNK/an+9csCTofHLa6j
   tBfop5T8BpeTSKfrsWBT85yE8qIZEwPTC00vaCxpx3Gd9BBGy0fLh4KhX
   n5Hpqm6ud6b/3cA9R5fZXZL5rOyFL5V3UOzyvOewS1ofmJyy6PCCIAcqJ
   7wS4AoPJU0bzWMDsum4C7hNR/GJrr2wPy4b6iNvcow+Ktgu3x/rVh3cqy
   1kVOgbfcG3B3QTcSddfTGklGLhs6KJAmAaKauFd1xWIGjBZyfx2NZeDgh
   ltyavN05lI5yxAJau7YmLej6Vv5sxILGzCFx4QMXpD6eBg7BrQYMJ+BVo
   g==;
X-CSE-ConnectionGUID: F5UCJUI9TRuaaqoU4TWJMQ==
X-CSE-MsgGUID: uN9MIWitR+G3z5xgONQVFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="30711604"
X-IronPort-AV: E=Sophos;i="6.12,266,1728975600"; 
   d="scan'208";a="30711604"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 05:39:43 -0800
X-CSE-ConnectionGUID: yVrT9gsxTJOx1LXQqIW/sw==
X-CSE-MsgGUID: QsJ/swakReuAnibDCDU3NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,266,1728975600"; 
   d="scan'208";a="90205106"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.205])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 05:39:41 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	liam.r.girdwood@intel.com,
	cujomalainey@chromium.org,
	daniel.baluta@nxp.com
Subject: [PATCH 2/2] ASoC: SOF: pcm: Clear the susbstream pointer to NULL on close
Date: Thu,  7 Nov 2024 15:39:32 +0200
Message-ID: <20241107133932.23252-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241107133932.23252-1-peter.ujfalusi@linux.intel.com>
References: <20241107133932.23252-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The spcm->stream[substream->stream].substream is set during open and was
left untouched. After the first PCM stream it will never be NULL and we
have code which checks for substream NULLity as indication if the stream is
active or not.
For the compressed cstream pointer the same has been done, this change will
correct the handling of PCM streams.

Fixes: ef8ba9f79953 ("ASoC: SOF: Add support for compress API for stream data/offset")
Cc: stable@vger.kernel.org
Reported-by: Curtis Malainey <cujomalainey@chromium.org>
Closes: https://github.com/thesofproject/linux/pull/5214
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Curtis Malainey <cujomalainey@chromium.org>
---
 sound/soc/sof/pcm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index 35a7462d8b69..c5c6353f18ce 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -511,6 +511,8 @@ static int sof_pcm_close(struct snd_soc_component *component,
 		 */
 	}
 
+	spcm->stream[substream->stream].substream = NULL;
+
 	return 0;
 }
 
-- 
2.47.0

