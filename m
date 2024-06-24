Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E902513B59C
	for <linux-sound@vger.kernel.org>; Mon, 24 Jun 2024 12:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719231102; cv=none; b=dlSiJbhSryi/clwTMGoRKs58oiZtTS5R2T2BbKJHCUPdFfITwqQyTpCHPHhWDC8/CJ/l37XvOA9AJWlIOTujSprnIVV5bw/jUcoa51+aRW4eeEAuArqjEDVVI1EmRjm3FXyJMSYu/gXkrQe8UW2KIaMTyOSNa1mG9zlXSIKQEC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719231102; c=relaxed/simple;
	bh=E4Fl9zHfo9CGU+x5houj6BkjHZoBUCL5ihfYUxwUujU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dcunGbXthbZKH+txfj/7z+3DSW7nYnYdRog0wqhjBN2UOp107FbolH8FJMOgBh58wqLmQNqoR4AHzQq7QOd/+a8m6LBscIpV/cvu73LyEGvguhQkPg/3TislYlyWyRw4wavxOVFfySOUL9rPkJhyq4uRiI3+X5s/FCUycS7u2oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I0ll/qX5; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I0ll/qX5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719231101; x=1750767101;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=E4Fl9zHfo9CGU+x5houj6BkjHZoBUCL5ihfYUxwUujU=;
  b=I0ll/qX5dhlZXYQTBmUCQAMETJuf0V16FIoFE7cCh4dHdD8t9HWOg5Cc
   E3E8h9SlZkPTueywhMjlhr+zFPN+OR/Rw71q2P6u9Chstz+2KSXO8sBLi
   suq9jT/1mIqy34bB+jqm7BppySkmioS3cUflFqI8zraGUbnXrCyvQ8pO3
   Jh8KwOg8sWO1+GKBUqDZ3MNxGWFCK6Xc+CIlZ7rffFQpyCrKPRbyn5Eof
   /rRBxaNAZUg64xnlpBzpkzc+5rjLdciGJw3r2QqbcXJYe9ZUDouzVG89F
   /7HE2Et+rIzOznTHRu49r/FVErOKZiHEganXyP9tt62Yc0XmojtmNte33
   Q==;
X-CSE-ConnectionGUID: sS/WCr/uQCGw86GjbwqEhQ==
X-CSE-MsgGUID: p1uByqa/SwOxTizNIbmA6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="15887549"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; 
   d="scan'208";a="15887549"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2024 05:11:40 -0700
X-CSE-ConnectionGUID: 91UDQNYqQ8musUgYCZJfmA==
X-CSE-MsgGUID: y9Wh9RELQNuqNqAcb2zHew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; 
   d="scan'208";a="43091219"
Received: from ksztyber-mobl2.ger.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.245.246.230])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2024 05:11:38 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH 3/4] ASoC: Intel: sof_sdw: add quirk for Dell SKU 0B8C
Date: Mon, 24 Jun 2024 14:11:18 +0200
Message-ID: <20240624121119.91552-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240624121119.91552-1-pierre-louis.bossart@linux.intel.com>
References: <20240624121119.91552-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Jack detection needs to rely on JD2, as most other Dell
AlderLake-based devices.

Closes: https://github.com/thesofproject/linux/issues/5021
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 89b92a061489..e94849b84a6b 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -406,6 +406,15 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 		/* No Jack */
 		.driver_data = (void *)SOF_SDW_TGL_HDMI,
 	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0B8C"),
+		},
+		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
+					RT711_JD2),
+	},
 	{
 		.callback = sof_sdw_quirk_cb,
 		.matches = {
-- 
2.43.0

