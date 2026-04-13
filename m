Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33CF939151A
	for <linux-sound@vger.kernel.org>; Mon, 13 Apr 2026 06:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776060495; cv=none; b=rfTh/vIYHwfz/32HcTPdTWkjAZ2uCnmyqE4GEAS+GrayYB/JOC1jO0TFNJew63UtD+KSCjqEnV3DtdfepaTGCAiXpNWJblkyaSCRyGqQ/lAfdN1oLFXXyp+jW1w4R6G0cSHYJY7ArTqiehXSdU6X5gSge/5U61Tzk4m4jmtCU/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776060495; c=relaxed/simple;
	bh=FVe16ymqUPpE2WebZn5q2MqVZEQX+XsqqXlGB1G30Ig=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Amu1kj0/bpX4fH7L6OsepA/zQV5SiUQ7XCtw/SN6R3F1nnhyJB7x1SiWzX62klX3xnpNtys9rN3qZL/W7auxC8DjOn588f2hAIMJulIlByjD1cyRlp8rshbaXdvOEjE//m4VOJZZmUzHoeGcpZUftjLqrW+cNTWG+4Ka7fCAXPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FY1tv7Me; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FY1tv7Me"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776060494; x=1807596494;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FVe16ymqUPpE2WebZn5q2MqVZEQX+XsqqXlGB1G30Ig=;
  b=FY1tv7Me6dX1AjZtohomxEHGuziR5u6Uksxkvjxx06VTMSfo3y+wuYz7
   9YXNYqFADWDBpWtU8H+l2EHsXa8LCZqWOLqUq04wsJBiRtfdu/7RUcGxY
   XQm5ieO7eI8ZETrjIRFSQtO6s8FRX5a9nYHntgGbqkE3ACraJ6yX9fnAC
   dWXWYfbgEuFJQMH+sJFKOfihhAaoo1F8TcIppQHBtxmj6p1RXxtoo9l72
   LiAv8FriWREJxypsKQ5//SWwCweOWg2VOB8hPMj+CkT9K4v+z3Y7w+8zx
   BTrciVrtNFniGCIR6gBfggoL5zy0wxSyq81oi5yiu5YmveaMVg4GF8mid
   A==;
X-CSE-ConnectionGUID: TFG3h85/S0iM4MYJvm/BTA==
X-CSE-MsgGUID: QALCsMwgSwW/kavF7hX/Vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11757"; a="64517602"
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; 
   d="scan'208";a="64517602"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2026 23:08:13 -0700
X-CSE-ConnectionGUID: uyLPSpnvRVitoYoFjOBpWQ==
X-CSE-MsgGUID: UL2dQCuSRp2z35X3E+r0VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; 
   d="scan'208";a="231415213"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2026 23:08:11 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 1/2] ASoC: SOF: Intel: NVL: add platform name
Date: Mon, 13 Apr 2026 14:07:59 +0800
Message-ID: <20260413060800.3156425-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260413060800.3156425-1-yung-chuan.liao@linux.intel.com>
References: <20260413060800.3156425-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The platform name will be used in the topology name.

Fixes: 1800bcdc68ead ("ASoC: SOF: Intel: add support for Nova Lake NVL")
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/nvl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sof/intel/nvl.c b/sound/soc/sof/intel/nvl.c
index 0d763998558f..0ee3507824e5 100644
--- a/sound/soc/sof/intel/nvl.c
+++ b/sound/soc/sof/intel/nvl.c
@@ -48,6 +48,7 @@ const struct sof_intel_dsp_desc nvl_chip_info = {
 	.power_down_dsp = mtl_power_down_dsp,
 	.disable_interrupts = lnl_dsp_disable_interrupts,
 	.hw_ip_version = SOF_INTEL_ACE_4_0,
+	.platform = "nvl",
 };
 
 const struct sof_intel_dsp_desc nvl_s_chip_info = {
-- 
2.43.0

