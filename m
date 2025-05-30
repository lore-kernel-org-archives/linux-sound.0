Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3DE2222C0
	for <linux-sound@vger.kernel.org>; Fri, 30 May 2025 14:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748613887; cv=none; b=ri1saXBC6QFbNIJNeA/MdDdfu+pgJx+bEixG4wBEXIqk8q/zHv3szXB1M2uV0dIYpNzVRSJ0tCyoDbp+W3M7a92uH+qQVebZdzap5avOlVBHlkdcSXlhNdk5Ymi5UHVA9KSsKmJGb1lII47C8OpsK8kqw/RW9FCcieFJLOEe7/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748613887; c=relaxed/simple;
	bh=yPFk9RTUHrD6mQ4UK67aUdb5PKUji98l2nL6qbRqowA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TWbQhCRVsrbLb4YPlNQenA9lr/NKYne78iHnxGN8nnsQ3uPkEJy2dWcAYNVWCeWWvjpw2iRL1xDIr9qB7u773cRflIK/+hz9T/jL7IsgHsbmULIbBvv6p7ISAM0m+EwX6iQGm2FTIKAQzpy9MTVF9Ng0JNQj2GFNC42zZ14Iwuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fxy0QQqI; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fxy0QQqI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748613886; x=1780149886;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yPFk9RTUHrD6mQ4UK67aUdb5PKUji98l2nL6qbRqowA=;
  b=Fxy0QQqIkQdlP86Jn7A9ldl3VXbM3AKfaVujwkJtwcP6hxsxCJZzpwkZ
   wap1lRDTJ1YnvSZM0epCNmIogUeZMOvYhaE1B3VdtlPPddmfDBkF/ZxUT
   UqiaqAl8GmHV2Wa29LBqItW4VhCH9B9bRCJzPSz7APJ2XYn2a5IBQeHPk
   dRgdyWjKPFcFRG9QH7UsS2T/J6mNZJ0wFwwSLK8DLZekyDCfjHqKI/DUd
   e3DKiD3w/dEbrl6RlGuWg/Hm6hGj+zY8XNv6Oc3WnOiOvoKIHavr+DEfY
   giyo6jP5tC4crVDS6X4b9FarTyyhWD39ePXGgaAVQ/oqT/97b4Dmo6eDx
   A==;
X-CSE-ConnectionGUID: jh7777kpQMO6V+j75T0rTA==
X-CSE-MsgGUID: kgeqDET+T/GZKPEvLcc+QQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="53336543"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="53336543"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 07:04:45 -0700
X-CSE-ConnectionGUID: m9ovGDSNRI++swEzXbZKZg==
X-CSE-MsgGUID: 0W3dL7rVTRy/+x8Oj8fS4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="144357404"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa010.fm.intel.com with ESMTP; 30 May 2025 07:04:43 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	Xinxin Wan <xinxin.wan@intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 2/3] ASoC: codecs: rt5640: Retry DEVICE_ID verification
Date: Fri, 30 May 2025 16:21:19 +0200
Message-Id: <20250530142120.2944095-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250530142120.2944095-1-cezary.rojewski@intel.com>
References: <20250530142120.2944095-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Xinxin Wan <xinxin.wan@intel.com>

To be more resilient to codec-detection failures when the hardware
powers on slowly, add retry mechanism to the device verification check.
Similar pattern is found throughout a number of Realtek codecs. Our
tests show that 60ms delay is sufficient to address readiness issues on
rt5640 chip.

Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Xinxin Wan <xinxin.wan@intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/codecs/rt5640.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/codecs/rt5640.c b/sound/soc/codecs/rt5640.c
index 265b30856faf..f50e771db24b 100644
--- a/sound/soc/codecs/rt5640.c
+++ b/sound/soc/codecs/rt5640.c
@@ -3013,6 +3013,11 @@ static int rt5640_i2c_probe(struct i2c_client *i2c)
 	}
 
 	regmap_read(rt5640->regmap, RT5640_VENDOR_ID2, &val);
+	if (val != RT5640_DEVICE_ID) {
+		usleep_range(60000, 100000);
+		regmap_read(rt5640->regmap, RT5640_VENDOR_ID2, &val);
+	}
+
 	if (val != RT5640_DEVICE_ID) {
 		dev_err(&i2c->dev,
 			"Device with ID register %#x is not rt5640/39\n", val);
-- 
2.25.1

