Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B3A1E1043
	for <linux-sound@vger.kernel.org>; Thu,  7 Nov 2024 12:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730980999; cv=none; b=SrLJArUy0igHSBdDyrzmLHCBcHzoRsonPZAxAUjMpwF7PVyVQSY0X5IYBEp73UtzAFFPw2bywkAEqXXmRWBIFZbExHHxnM6DHHT0AELnk/aCa4o4S4kh8hkPGmEnH54EvHVVxQigSKdRcEI08Je5TeKF/iidT8NsxlbFAj2OjbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730980999; c=relaxed/simple;
	bh=/dWVdpdndmV6bjuGncYbiWrpYMc36X3/K44Z7JfFJgo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tkl0IFZSxFFEkT7Cw7H89lYMXwp2RukoaxW8x3GpGFPKm5mEa0srdqAIsm6+apldcHUGbEprYWCWMoW76FhqJrcZCYKd56ESCaIkz9NDIJV27qCR+mRwOe8mf9cjURivYDRsw8jY5mnJl+HXdHxHNXW82GiBo1WbOHEGYdcj9Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XtFi3XBQ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XtFi3XBQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730980997; x=1762516997;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/dWVdpdndmV6bjuGncYbiWrpYMc36X3/K44Z7JfFJgo=;
  b=XtFi3XBQcvS8oIC70HMiwi7v3Gl1O0dA7b+cBRA6xqtqruQ7UN+wESZd
   q39g5DSQFyvyCzPcKZxKNvyJYgrGXmIQOWPYlpBRbDDTgxaThp7EqZoNw
   LRQYMM11h50MrjzIFoEqhAHu7KoDt+bkORt0osKFnY2Q2h7EZXPa8o+Sj
   cDjoE84ncFvJQ2vNMBsMRCzqtXqnvJSvpSt0pu1bJVW4jiM7L03hJZaBt
   oKkCHSM4+7/6EUvzCBAamgQ8A5emKK7jvqzDy4I3HAQ/C2h3AbhEBL7nl
   r3zzTNHTEcKhylLLgEBuMk/lfymEfOnfk7wvsUP1y0g/4GkysAKpaVHOm
   w==;
X-CSE-ConnectionGUID: F52rPhv/Qi60uJnugSl6Gw==
X-CSE-MsgGUID: LdgwFZfdS1KTBQ7Qp9/n8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="41437390"
X-IronPort-AV: E=Sophos;i="6.12,265,1728975600"; 
   d="scan'208";a="41437390"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 04:03:16 -0800
X-CSE-ConnectionGUID: qcWyCD9JSou52rSAXjgbXA==
X-CSE-MsgGUID: HGz897HLQNuMzB3MqQOSMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,265,1728975600"; 
   d="scan'208";a="85849578"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.205])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 04:03:14 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	liam.r.girdwood@intel.com
Subject: [PATCH 2/2] ASoC: SOF: ipc3-loader: 'Handle' PROBE_INFO ext_manifest type when parsing
Date: Thu,  7 Nov 2024 14:03:06 +0200
Message-ID: <20241107120306.30680-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241107120306.30680-1-peter.ujfalusi@linux.intel.com>
References: <20241107120306.30680-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Every time when the firmware is loaded we see the following printed in
info level:
unknown sof_ext_man header type 3 size 0x30

This is the PROBE_INFO element, which is not parsed, but it is not
something that we should treat as surprise, aka unknown type.

Add an empty case with a debug print to 'handle' this ext_manifest type and
silence the confusing print in kernel log.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 sound/soc/sof/ipc3-loader.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/sof/ipc3-loader.c b/sound/soc/sof/ipc3-loader.c
index 35b89c2b9d4c..7e9c76d5b2c9 100644
--- a/sound/soc/sof/ipc3-loader.c
+++ b/sound/soc/sof/ipc3-loader.c
@@ -193,6 +193,9 @@ static size_t sof_ipc3_fw_parse_ext_man(struct snd_sof_dev *sdev)
 		case SOF_EXT_MAN_ELEM_CC_VERSION:
 			ret = ipc3_fw_ext_man_get_cc_info(sdev, elem_hdr);
 			break;
+		case SOF_EXT_MAN_ELEM_PROBE_INFO:
+			dev_dbg(sdev->dev, "Probe info (not parsed)\n");
+			break;
 		case SOF_EXT_MAN_ELEM_DBG_ABI:
 			ret = ipc3_fw_ext_man_get_dbg_abi_info(sdev, elem_hdr);
 			break;
-- 
2.47.0

