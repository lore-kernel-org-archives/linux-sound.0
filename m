Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F52917BD3
	for <linux-sound@vger.kernel.org>; Thu, 24 Oct 2024 06:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729749737; cv=none; b=imSdm1MBS2HedH6EdZimKg6LPB9k/LodduH+1qx0/Bjr/PpHCJwtu6GgLtv3ZPDjOWeMKD4nJKYFWkGK2a5Van+mhcd4AosoeGozwG0R93X6eYTbiknEQRKCpgUx7FygQClsytQjbOFzw+s5WX9zZlI7zR4b6zTGrlKN+W86PUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729749737; c=relaxed/simple;
	bh=tg6StdCcuBjY//Kxp5TGxik1uX24/nU8i5l0LoBt0a8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I5MKA/a9pXvunw2yeiezQsPVdRtYyQ2r111z2XS/VnqhUsNj0l7104lNmT6BLNntZCoHpkdZ2ka+L2PLPrkv9+UhP3sje/EAcglFDTWMYzNcmLNHvXSICzB5C+5sLz1zWsuefk9XscazyeUmCfg44R6L5SIP1jHIinM3Po4ofpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bCo9mFbv; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bCo9mFbv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729749735; x=1761285735;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=tg6StdCcuBjY//Kxp5TGxik1uX24/nU8i5l0LoBt0a8=;
  b=bCo9mFbvOoO+MHKFSP1bkCM5JjF2Tcu9C1rQnuL8IjCYIkHkD5HeOVRt
   8GFj9Q6RazKW2cC4YXOhVmFxLI34Bal6lNQlTUVjDueu2QwV34FhRwW3o
   e4qWk4fDHUaUVdtjpvmcNnUqayaRc3qAJsFit3/EyzQHiju9G3ol0SMYB
   iNdZl+bKrh9FFeVam/yZS2Vqb9VeC764bDbYPgn3jbSUvVTRRFNZMnrij
   ru2rNMt+W8QnXCxypTPmDA4pBWB6ONiWVbDB8vNSMR5LeON6edh7G/+Uv
   Iw+UvC648zyVo4K035br2dGfH0tfxEyDpc3OMkC7j7qs2WLc85r0/Mmmh
   A==;
X-CSE-ConnectionGUID: MnQLMMEYTKeUyJqifkEsAg==
X-CSE-MsgGUID: 56wrVPhkR+u6fsRAJkwP5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="39975452"
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; 
   d="scan'208";a="39975452"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 23:02:14 -0700
X-CSE-ConnectionGUID: F6hjrzDASXm5GYqlUX8YDw==
X-CSE-MsgGUID: 6tTRpqPpRY+2FzQ1cdxvmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; 
   d="scan'208";a="85099914"
Received: from gargmani-mobl1.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.221.91])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 23:02:13 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH] ASoC: rt-sdw-common: fix rt_sdca_index_update_bits function parameter description
Date: Thu, 24 Oct 2024 14:02:05 +0800
Message-ID: <20241024060205.20201-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the mismatch between function parameter and description.
Below warning are reported with W=1.
warning: Function parameter or struct member 'val' not described in
'rt_sdca_index_update_bits'
warning: Excess function parameter 'value' description in
'rt_sdca_index_update_bits'

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt-sdw-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt-sdw-common.c b/sound/soc/codecs/rt-sdw-common.c
index 9f51fec383f9..ad61943ce75f 100644
--- a/sound/soc/codecs/rt-sdw-common.c
+++ b/sound/soc/codecs/rt-sdw-common.c
@@ -76,7 +76,7 @@ EXPORT_SYMBOL_GPL(rt_sdca_index_read);
  * @nid: Realtek-defined ID.
  * @reg: register.
  * @mask: Bitmask to change
- * @value: New value for bitmask
+ * @val: New value for bitmask
  *
  * A value of zero will be returned on success, a negative errno will
  * be returned in error cases.
-- 
2.43.0

