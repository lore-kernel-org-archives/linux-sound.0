Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806A942188B
	for <linux-sound@vger.kernel.org>; Wed,  3 Jun 2026 08:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780477020; cv=none; b=mjvLdFyaL3Xd5n49/ZFThkbbRvPtzhUCwS0KBC4/ZTWOg3I/IFpnLQ+76QK7JGmAsUpDDsZisk5io15vjpkD9qkDIFMurIerk+ihaQ2uSOKWmQV83KX5mbuoTdDZrQl2renX9eLTNsyvtVAcS2rKJ1Zr38saKB5+kFS/Aw7B+F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780477020; c=relaxed/simple;
	bh=8xZmzeTNnhPsmb/LGMFtxmY0v9NT3iqd5UkoOn9ddsk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ju5ygO3FeSmWnJ9jfkQscNuDO/Ge1d5EUl6oiUtP+laJYJEusKG1hI3TM7nLMocyHP0UoTPjtPIRzV3jqwjsYb5Ekgid/cNHUREGDhpya324AoLXm4HD2Rof0GkLDW7rExVS7KqtICOL+T4oih2w9DxSFSuOZ3ShWwkTHq0Li9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AHKXvZ+f; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AHKXvZ+f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780477020; x=1812013020;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8xZmzeTNnhPsmb/LGMFtxmY0v9NT3iqd5UkoOn9ddsk=;
  b=AHKXvZ+fqnjnSR6JRMna3CEkJJglxoSg8H4odsk7jAtHu9HeOkwU5owT
   KbchXAH6kr4Q9Ljn43flaBzj/tbEkkeLa5DwYqho8hHInL4xCZrdhTcrA
   4yPo0h0lht4+WXTF1z8Ix+kKyh3Xccc1ndNxgquEZsqJK7K6kMwIaKZ1O
   gTWZOjppN5A5BP7vFNgTx2BT03I++45VlhwXDg/6eBhClUYsNmRbRA2AC
   hg06SV10WGjYmFSaM1Tbz36oEt9rISmVh7zqj6D3RuGbHsAFCbMHft/mR
   qmbugkLsl2pKtX9leGBy2sy98bzzJD2qKRgbHpi2MXaGEJG5gvEwQLY/X
   w==;
X-CSE-ConnectionGUID: Gfr9swGhRJeaLkTuE1J3Sg==
X-CSE-MsgGUID: +psZcTUSS3O5zRN++6zi2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="81182144"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="81182144"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 01:57:00 -0700
X-CSE-ConnectionGUID: IxOG9NGFR+yksfEhM/Qc9g==
X-CSE-MsgGUID: Mr4mQ/idQp63LwrnKp+awQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="248109342"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa003.jf.intel.com with ESMTP; 03 Jun 2026 01:56:57 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	andriy.shevchenko@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v3 4/7] ASoC: Intel: catpt: Simplify catpt_stream_find()
Date: Wed,  3 Jun 2026 10:58:24 +0200
Message-Id: <20260603085827.1964796-5-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260603085827.1964796-1-cezary.rojewski@intel.com>
References: <20260603085827.1964796-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Code line reduction and more transparent variable naming.
No functional changes.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/catpt/pcm.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/sound/soc/intel/catpt/pcm.c b/sound/soc/intel/catpt/pcm.c
index 7b2bab12c707..ba0c75f4b4e7 100644
--- a/sound/soc/intel/catpt/pcm.c
+++ b/sound/soc/intel/catpt/pcm.c
@@ -99,19 +99,15 @@ catpt_get_stream_template(struct snd_pcm_substream *substream)
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
+	list_for_each_entry(stream, &cdev->stream_list, node)
+		if (stream->info.stream_hw_id == stream_hw_id)
+			return stream;
 
-	return result;
+	return NULL;
 }
 
 /* Caller responsible for holding ->stream_mutex. */
-- 
2.34.1

