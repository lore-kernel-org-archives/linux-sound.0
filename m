Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C6D383
	for <linux-sound@vger.kernel.org>; Fri, 13 Dec 2024 13:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734096061; cv=none; b=iKn70mh8hAe4J3qdO6aH9s5oAJ1kVhHU9QKtHcswgS9yaDB3uD7e2HeYVd9tXaz3NOj0fvoRLss7sRxdaPnUQQ8Gx5frxdQ+dVK5BmNPL9FdEBfhRLz5QEB4zmQtiMBfy6KPyzTdh/n6gIOWY61ut0jwqljEB6HipYQ6RzK/iP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734096061; c=relaxed/simple;
	bh=C9Y46S4AfEk1gM98jjPJ9bTjuY0uBt9aC2kbpqODics=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OJeRpKMJiYde5+mWbfiyfeJD5qNimEBo7MGZy7vuz8pABz6854li4BBKW92RUSUPHlYRGT9RadoCVkzYiA/zl96Tk8i62ZYokqQ6hxvmFLoK7+Dsi7ExBRnVj5mFPJmK+99e2XloCWjYBvhmxtapPTQsQOXMM6iE7K7WyYzKdYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UqR4SOsR; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UqR4SOsR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734096060; x=1765632060;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=C9Y46S4AfEk1gM98jjPJ9bTjuY0uBt9aC2kbpqODics=;
  b=UqR4SOsRuCu4Wvp3kEfd5tHy1LPRonML/fRgv822bvQUn2n/1WTaumGj
   hi8tBJ6EWiuPAofBThvUa7KYsVWD8JWG5jZvVDoXeQPUfIvYStFS0R/8m
   KXzemA4elZyToaRv6OMFYf93Ewgaz4eqMqjzM0fhdMCuYqcum8+TLUQxM
   cj+ZZLhKVSK8SW6QMOFU+el9U2/EWbalb2Ec/GT57EQZACMWjvFrOd7tl
   NG0+7aGJ8ANYyI7sy5Zy9WML/sPvAkNtXQ3S0/K4Kk/Wgq1aQxyCl+l9R
   duw8GEFHD27AQwrBe+3/7tRQ61ijX3Vb1u+EhoTmQm6VwFIPxPMVz6ZgC
   Q==;
X-CSE-ConnectionGUID: TDElYmEHQ5eUggdC4R+UnA==
X-CSE-MsgGUID: uYxOMJC8QVmIuAZXjp7KpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="38323902"
X-IronPort-AV: E=Sophos;i="6.12,231,1728975600"; 
   d="scan'208";a="38323902"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2024 05:20:59 -0800
X-CSE-ConnectionGUID: 3KhxPhV0R+Wvba25e/P1gg==
X-CSE-MsgGUID: 8kgUoaWjSo6CRsf22ekBMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,231,1728975600"; 
   d="scan'208";a="96426500"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.245.190])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2024 05:20:56 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	liam.r.girdwood@intel.com
Subject: [PATCH] ASoC: SOF: ipc4-topology: Use macro to set the EXT_PARAM_SIZE in widget setup
Date: Fri, 13 Dec 2024 15:21:10 +0200
Message-ID: <20241213132110.27800-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the SOF_IPC4_MOD_EXT_PARAM_SIZE() macro to set the param size in the
extension part of the IPC message for clarity.

No Functional change as the PARMA_SIZE offset is at 0.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index b55eb977e443..c04c62478827 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -2827,7 +2827,7 @@ static int sof_ipc4_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget
 		msg->primary |= SOF_IPC4_MOD_INSTANCE(swidget->instance_id);
 
 		msg->extension &= ~SOF_IPC4_MOD_EXT_PARAM_SIZE_MASK;
-		msg->extension |= ipc_size >> 2;
+		msg->extension |= SOF_IPC4_MOD_EXT_PARAM_SIZE(ipc_size >> 2);
 
 		msg->extension &= ~SOF_IPC4_MOD_EXT_PPL_ID_MASK;
 		msg->extension |= SOF_IPC4_MOD_EXT_PPL_ID(pipe_widget->instance_id);
-- 
2.47.1

