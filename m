Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0A93AEB39
	for <linux-sound@vger.kernel.org>; Mon,  1 Jun 2026 14:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780322943; cv=none; b=S5HTv47llGpUhjgN0RpsLsZVcP/kMu57cW/5Altu+kFhNhBdcUa9e+PhxNI00WWuXVmdFUKuSv6y1cPZAmh8bIw4N2PnzsL8AAf5mkzsAC9bjAuBLqHhqgfBSC1B/iKLmxT6mDbWFlhu4kec0BgVkhSH7Sj05+zANxnMoetcrIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780322943; c=relaxed/simple;
	bh=ufzAQ5ZMBZH2DmJBprPZovjTuvKJAvdx/NTwhHCeo2M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FkeEut9NxC7UoQ99t/bFrMeIpFX1F26NQiuXUJmfmHcip48SyDhc4T/dP4Qa7X3dIJ9JQN6SgiGe4aIaZvOScVTjgHvcruju7jjxTPcytDm7vm6Wr17MbBybY3Fyc14zNwocpmVapv9+czxa0l0/qSArOi8T+FMRvkc2gzT4oP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ts7i3Udq; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ts7i3Udq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780322943; x=1811858943;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ufzAQ5ZMBZH2DmJBprPZovjTuvKJAvdx/NTwhHCeo2M=;
  b=Ts7i3UdqAeQIMV5dekQjki3EDenQJe0j3twudPTtzn+6Z1r2+Q8KpgoN
   Il9QP9jfMh34Yjqvn60lsMD+gYACjc5PfIWoQ6J674ZvF9hN/oTMub4DI
   zjZC9hDOVJ7pvwRWq37JWnQarDyDvi2vkdlwE1yezfydUr1yYtMx0ahqk
   2LOTRcp7IBCux6PjsvLsyZAhfjmkWZiyemVVrR9oPGgiV3tDia0e+YiMo
   BHdnF+WI5TJAV2HgZRFZ6xOOgCK54fctqkINiZy414c3p3vMZBIDcVNFB
   zuSAw4uUsk5+ghfzPvJr6ilNkjeeIgGJbOuDvJqKz3Cw9DPNFYA6udARz
   A==;
X-CSE-ConnectionGUID: MS9vIIvwRBWVoS4pqA8U9A==
X-CSE-MsgGUID: wiFS6WhaSxiq6H2z7FGXRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="81140278"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="81140278"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 07:09:03 -0700
X-CSE-ConnectionGUID: L03g8VW1QI2Q77nJG6veZA==
X-CSE-MsgGUID: nypQkRLPS/ys/KPWRXQACA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="243704995"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa007.jf.intel.com with ESMTP; 01 Jun 2026 07:09:00 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	andriy.shevchenko@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 4/7] ASoC: Intel: catpt: Simplify catpt_stream_find()
Date: Mon,  1 Jun 2026 16:10:28 +0200
Message-Id: <20260601141031.1606847-5-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260601141031.1606847-1-cezary.rojewski@intel.com>
References: <20260601141031.1606847-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Code line reduction and more transparent variable naming.
No functional changes.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/catpt/pcm.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/sound/soc/intel/catpt/pcm.c b/sound/soc/intel/catpt/pcm.c
index 7b2bab12c707..deb76eb79d18 100644
--- a/sound/soc/intel/catpt/pcm.c
+++ b/sound/soc/intel/catpt/pcm.c
@@ -99,19 +99,14 @@ catpt_get_stream_template(struct snd_pcm_substream *substream)
 }
 
 /* Caller responsible for holding ->stream_mutex. */
-struct catpt_stream_runtime *
-catpt_stream_find(struct catpt_dev *cdev, u8 stream_hw_id)
+struct catpt_stream_runtime *catpt_stream_find(struct catpt_dev *cdev, u8 stream_hw_id)
 {
-	struct catpt_stream_runtime *pos, *result = NULL;
+	struct catpt_stream_runtime *stream;
 
-	list_for_each_entry(pos, &cdev->stream_list, node) {
-		if (pos->info.stream_hw_id == stream_hw_id) {
-			result = pos;
-			break;
-		}
-	}
-
-	return result;
+	list_for_each_entry(stream, &cdev->stream_list, node)
+		if (stream->info.stream_hw_id == stream_hw_id)
+			return stream;
+	return NULL;
 }
 
 /* Caller responsible for holding ->stream_mutex. */
-- 
2.34.1

