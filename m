Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E473F216E39
	for <linux-sound@vger.kernel.org>; Thu,  9 Jan 2025 12:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736424510; cv=none; b=gR7B8Ok4aO29UjIEJJRpZDOTUlrSgk1ENVhFJexs1Z6oNwTMaBVrqlHgRbKHwPZU4peW2cHGYsGl9t8y4CDLeBRPBi9sJbJ33JVFoifJ3/Nn0AUl2Q9LbdZofZg+5JEIBfkqx2wMztkeL/Pa6mNE1WBuGSxsFAdKf9ZQmGEcsiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736424510; c=relaxed/simple;
	bh=6nQT3t5eXtdwRp5a1gqM7dTRJxYSL22xW0hR3ArMxh0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d+BAp90TfUtArrgVRmFtH+IHX2cLO8z09Jqae0TF3SzppauOAc8qB77Ekhh6Wp7xB/isFmu9wSUytPoAwXl1hV6gc50dQOrlZ6T+1HDOBho8Bp4/KsJwzmMq08XvX6UnfDTgiUKpwKlULMoeJs5773NzkHAzqV4GY6T/ip3bqnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fxEqeUjl; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fxEqeUjl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736424509; x=1767960509;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6nQT3t5eXtdwRp5a1gqM7dTRJxYSL22xW0hR3ArMxh0=;
  b=fxEqeUjlYIgWDhvEaPNeSVwvJlnkW4FsNnKVng5LfoHmsczGgxxHsiic
   EnFdV6KIFPSHCJZkwylW0++0+RNkTW3KWrbXE+ahrmsuArHPGN7O+5sRp
   FnmLLvzWRjWwttW6x/EwmCwORdQe3wGfOG7EePzm7w4/XNDMmwDE7Pi9c
   2CEGJp6aa6uPqYDlhbazACd4GZ2Pizrhl3jrLfbEEUeNdtm4+grn0Byj7
   QsQDhhWGOkGNQn+KS8QOgaTjoDgWSQ31/2u40Pdwajo5+L+ckgzwofOO1
   fXp5/2SyBT/LkoY1EFtjy/v23SHFttRcJ3GI+qb/fXvuOQo4JKppU0yN4
   w==;
X-CSE-ConnectionGUID: Z4GdYnAwQqKfbetDTEyhJg==
X-CSE-MsgGUID: 5lKRB3yqSEG6usSLSoC0MA==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="47179606"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="47179606"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 04:08:29 -0800
X-CSE-ConnectionGUID: oyfz2IK0SzG3zr9+eihPbA==
X-CSE-MsgGUID: 84I4MUCYTI6PLuPBsvKZ5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="140710380"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa001.jf.intel.com with ESMTP; 09 Jan 2025 04:08:27 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 10/13] ASoC: Intel: avs: Update ASRC definition
Date: Thu,  9 Jan 2025 13:22:13 +0100
Message-Id: <20250109122216.3667847-11-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250109122216.3667847-1-cezary.rojewski@intel.com>
References: <20250109122216.3667847-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

To support ASRC for playback streams, update its descriptor.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/messages.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/intel/avs/messages.h b/sound/soc/intel/avs/messages.h
index d0bdb7d9266c..0378633c7f96 100644
--- a/sound/soc/intel/avs/messages.h
+++ b/sound/soc/intel/avs/messages.h
@@ -859,8 +859,7 @@ static_assert(sizeof(struct avs_aec_cfg) == 92);
 struct avs_asrc_cfg {
 	struct avs_modcfg_base base;
 	u32 out_freq;
-	u32 rsvd0:1;
-	u32 mode:1;
+	u32 mode:2;
 	u32 rsvd2:2;
 	u32 disable_jitter_buffer:1;
 	u32 rsvd3:27;
-- 
2.25.1

