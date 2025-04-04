Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB2F1A5B8A
	for <linux-sound@vger.kernel.org>; Fri,  4 Apr 2025 08:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743756411; cv=none; b=ksZKd7YADcuqhwivYHLEjqKbFUhQuum3LD8to5c2qdOrn7SuXUaQt8T1F9odjm5rOBvESO8gq8++gdafWxI4ubvz98V+RY2NS4nbbD/i9R6JKaKqCybMUlm2PkgetsjyZUTvI5sqaMMxK6tvI7RXzvTBfVE4d/b6psvdXl4/kiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743756411; c=relaxed/simple;
	bh=jX6+uVyJQFQ5otAvIQmCy2vwNbWsg1A3CVQNea9ixHw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HmTAvqdhjmKbXqX/6JXPfsazdL+EFXNy0m+6IH2onKIimYhTnsBRMk7SHEMElBsmncumdc90r+Rqzi9Pf/wbDFeU24SVFtJ79OyYcWQW/8SPOMpYtp/qOU6BUIEda856inaysEUC91dkNnoHrzN0jSO4wSyeopytgPugIOvZt/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OF4skqRO; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OF4skqRO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743756409; x=1775292409;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jX6+uVyJQFQ5otAvIQmCy2vwNbWsg1A3CVQNea9ixHw=;
  b=OF4skqROdwdkHLfW7mVnLW1Ek04Xr92GOtYZ6y8gdSK4gzceHHlO9Nzz
   4UV7tegLbGit50G8fzSk0Nb8ZkaP16ruA0hkmMl/kqiZcP427X4hTrM0Z
   hjVFU12NR1E2n+6CdEjOLlBXA0bGY0eX3+zGdHUGV9DYcKBB/q4FSqhA9
   rJG0beFe3wM39SFuWmWLLbAzo5z5l53KgASvT7OFml4xCH6FtjJsbPjat
   VHEiEvCAGRHeoUZwHp9M2W3s3C31MVvo/JtVNxbpzd2E/hQqvs3Aj7vZH
   57ZdrItFvVQyMoCBunAyf7yT1Q6tMxfuAzvhie9A5TFOCvTDUmQJud1gG
   w==;
X-CSE-ConnectionGUID: uzo5tbURQumBQTrCS7a+mQ==
X-CSE-MsgGUID: MH9TZh8zSlKpTgjVxcBgpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="55854572"
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; 
   d="scan'208";a="55854572"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 01:46:49 -0700
X-CSE-ConnectionGUID: yulYaKI4Sz+sSqxPW07jaw==
X-CSE-MsgGUID: w10/Ee73TFG2OVWaiIkrfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; 
   d="scan'208";a="164464228"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa001.jf.intel.com with ESMTP; 04 Apr 2025 01:46:47 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 2/8] ALSA: hda: Allow for 16 channels configuration
Date: Fri,  4 Apr 2025 11:03:31 +0200
Message-Id: <20250404090337.3564117-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250404090337.3564117-1-cezary.rojewski@intel.com>
References: <20250404090337.3564117-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

As per HDAudio specification, up to 16 channels are supported. Reflect
that in the code.

Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/hda/hdac_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/hda/hdac_device.c b/sound/hda/hdac_device.c
index 3fbb9793dcfc..0053831eed2d 100644
--- a/sound/hda/hdac_device.c
+++ b/sound/hda/hdac_device.c
@@ -801,7 +801,7 @@ unsigned int snd_hdac_stream_format(unsigned int channels, unsigned int bits, un
 	if (!rate_bits[i].hz)
 		return 0;
 
-	if (channels == 0 || channels > 8)
+	if (channels == 0 || channels > 16)
 		return 0;
 	val |= channels - 1;
 
-- 
2.25.1

