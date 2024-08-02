Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058DB1E2889
	for <linux-sound@vger.kernel.org>; Fri,  2 Aug 2024 12:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722602785; cv=none; b=jvXafwYgeDn1WWu4iACQIQzvwqWTxSrqYNPT6HOq16colPvucycclL/uuqw6xo/FMZvRVKvgeOkW0XkNvUZHYrcjj24HiCvxrFRPrq6VxSAFR+Xai4WBS4WEPXtmK0nfexFcKiBWCuB4EqdToiDuCxDFyQIxY5++1USXn8GOej0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722602785; c=relaxed/simple;
	bh=XBS9PxZs/DQyKy80vX3Y7aB81pdtJGCDeOOoRgQsmwY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Of1E0j4SwiwLdf2V3YhWRBIC2U1Q3CDi+gVEoH8U+vHs6ErwdoTFmU6UF0cnmjp/RwQP1DreuCzc9g46sJjMmwwv5fsgU0RyJfUJwlx896CE8reyvOlkhprbLykr5Ktc2CQ2oQuFLW9F06HFyctibxQNBZ42KfCyH2EH1mfgrqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G+zXYEkR; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G+zXYEkR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722602784; x=1754138784;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XBS9PxZs/DQyKy80vX3Y7aB81pdtJGCDeOOoRgQsmwY=;
  b=G+zXYEkRFb86Tzj3aYzBiPfaFlJhKakWXlaT4kkFAq3EHNAGFW11Rvv9
   7k4veShRT9suEj/xz5ImD1djtoEu38cFffROyBwf5BjE3kSxPyrMU3pHH
   e5GVp3DGjMPb/xOoXyiTi153JBOs+GqOBpXo2zGqzX0mTbXsKWfpth7nM
   afWEnTDhAyNN6RprtthttJGMJvpLtu4Xrk0c7gpZN3alE6IzLgfib89sC
   nyZ1r+3xro+sxsLwe2bNdtY4dPgUxf63j93ld988+l8N2jhrHOhkKfaX7
   JzQPCpvGsFZE1rAM+Q+7W2MW9ftp0TKveI45I1AuyeRt+EWpSUtJl5CJH
   Q==;
X-CSE-ConnectionGUID: 1MDTausRSUK8+jWwdolfOg==
X-CSE-MsgGUID: /1roylSRQVWp3tgwKhi5RQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="20199381"
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800"; 
   d="scan'208";a="20199381"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2024 05:46:24 -0700
X-CSE-ConnectionGUID: tOD1a0kvQaureISg0dzQ2A==
X-CSE-MsgGUID: fjelm9b1RTO/i455o8ZSIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800"; 
   d="scan'208";a="60407845"
Received: from ltuz-desk.ger.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.245.246.89])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2024 05:46:21 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Subject: [PATCH 1/4] ASoC: SOF: sof-priv.h: optimize snd_sof_platform_stream_params
Date: Fri,  2 Aug 2024 14:46:06 +0200
Message-ID: <20240802124609.188954-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240802124609.188954-1-pierre-louis.bossart@linux.intel.com>
References: <20240802124609.188954-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

reshuffle members to remove hole.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/sof-priv.h | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 4d6a1517f9b3..28179a573762 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -132,16 +132,17 @@ struct snd_sof_pdata;
 
 /**
  * struct snd_sof_platform_stream_params - platform dependent stream parameters
- * @stream_tag:		Stream tag to use
- * @use_phy_addr:	Use the provided @phy_addr for configuration
  * @phy_addr:		Platform dependent address to be used, if  @use_phy_addr
  *			is true
+ * @stream_tag:		Stream tag to use
+ * @use_phy_addr:	Use the provided @phy_addr for configuration
  * @no_ipc_position:	Disable position update IPC from firmware
+ * @cont_update_posn:	Continuous position update.
  */
 struct snd_sof_platform_stream_params {
+	u32 phy_addr;
 	u16 stream_tag;
 	bool use_phy_address;
-	u32 phy_addr;
 	bool no_ipc_position;
 	bool cont_update_posn;
 };
-- 
2.43.0

