Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9A648CD50
	for <linux-sound@vger.kernel.org>; Wed,  9 Sep 2026 09:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788944988; cv=none; b=PpKcyoKp2zXbTAW7jaqGn3vl825FG+mpWOp1vZyyPS3mfAhIIW+rnvJIrOy4mGYN9AViy2CiVorJ+uGC2YSFtQ+cZcsiy8FAYewGSOC/kcVe8hrcXePCKbCKWYxBVB4mfmovEfAVSE7HLo4SGQYCYyheRxp7niIIuq90nG7odSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788944988; c=relaxed/simple;
	bh=NVrooox4dJ5f0i6hG1zkk82jRXEkoXkATDoF6Wl3p0c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ufVnmYUe+Ax+uqRE8JRm7scJV33QdGduu6vEAB6wigqMBQHzT9xY78O5914D1lz8R9dx978MPlIsybEdS1nW0qZh3BFcTmctB9yaQXjMpd/9YMCNV6scjg0cY2xgqZ0T8Bjy7xTu8NW6j/IeqbF1CHGqgQHN2pGMkPg4huBq8DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YGGkMxUT; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YGGkMxUT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788944987; x=1820480987;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NVrooox4dJ5f0i6hG1zkk82jRXEkoXkATDoF6Wl3p0c=;
  b=YGGkMxUTIGYCAo+iZAJ/BYg7d3ClU14DFoHgHcTxxpThDINexvd0LaHV
   8L5bud84l8fLuOBgFFExZDQHU4TCXf4UZ8FjVh8D/Gm70brARsag7WeB7
   NDr2wOe98n+QZjm3HQSRzjJzp74K+kICm1J2fT7Ey40clHJbTkcVDgRT4
   H4ygBaCK+6S0j6YbHVBecS/ldeG2w6ubBe76FJS5/TJUdjOWe5LZK9c4i
   tFm+l+QwV75JpS/OKcf2xRtc48c2T6l4rA3gVuFhGZnYdHRELPoW4d7VP
   m7v0Yx2ofjjx+GoURkOB0ue+bU7axfXByX0lUfuC9u7Ac9fkSzLmzaC27
   g==;
X-CSE-ConnectionGUID: Yxo6BFyFRdKK+S8pnORbXg==
X-CSE-MsgGUID: nr3PVuOoRTmppeidk8qyeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89200587"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="89200587"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 02:09:47 -0700
X-CSE-ConnectionGUID: /In5/q03SWu2PkUfsPUBmw==
X-CSE-MsgGUID: jXDAWPO9T8igZktmvuZWhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="266972791"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.252])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 02:09:44 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: vkoul@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	srinivas.kandagatla@oss.qualcomm.com
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	daniel.baluta@nxp.com
Subject: [PATCH v2 02/24] ALSA: compress: register the open file with the card
Date: Wed,  9 Sep 2026 12:09:27 +0300
Message-ID: <20260909090949.7503-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909090949.7503-1-peter.ujfalusi@linux.intel.com>
References: <20260909090949.7503-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The compress-offload device is the only ALSA character device family
which does not add its open files to the card's file list. Without it
the core cannot replace the file operations on disconnect, so syscalls
issued after the card is gone still reach the driver, and a card freed
with snd_card_free_when_closed() does not wait for the open compress
streams.

Call snd_card_file_add() at open and snd_card_file_remove() at release,
following the ordering used by the PCM, control, rawmidi and hwdep
devices.

Suggested-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/core/compress_offload.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index ba6cdfe64246..7b720603a9a8 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -101,7 +101,14 @@ static int snd_compr_open(struct inode *inode, struct file *f)
 		return -ENODEV;
 	}
 
+	ret = snd_card_file_add(compr->card, f);
+	if (ret < 0) {
+		snd_card_unref(compr->card);
+		return ret;
+	}
+
 	if (!try_module_get(compr->card->module)) {
+		snd_card_file_remove(compr->card, f);
 		snd_card_unref(compr->card);
 		return -EFAULT;
 	}
@@ -144,6 +151,7 @@ static int snd_compr_open(struct inode *inode, struct file *f)
 		kfree(runtime);
 		kfree(data);
 		module_put(compr->card->module);
+		snd_card_file_remove(compr->card, f);
 	}
 	snd_card_unref(compr->card);
 	return ret;
@@ -174,6 +182,7 @@ static int snd_compr_free(struct inode *inode, struct file *f)
 	module_put(data->stream.device->card->module);
 	kfree(data->stream.runtime);
 	kfree(data);
+	snd_card_file_remove(compr->card, f);
 	return 0;
 }
 
-- 
2.55.0

