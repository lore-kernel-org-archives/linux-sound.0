Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC200145321
	for <linux-sound@vger.kernel.org>; Mon,  8 Apr 2024 19:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712605320; cv=none; b=f5dFRY1wKy34kYUdFjsUmn8nBj1sqO0WUh9ePh0sY2FP9BzNEfwtmw6RnETHGjCThpfK3kFk+sKbpGAE061P+4cTzoVItE2U+/dBAViTIIKF41uffkveG/X5neErc4HAtK7fu/zX9/1jsF8AVtRE7j/hpi30gG91WMoboGj4kmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712605320; c=relaxed/simple;
	bh=5VYQbJzHtePmAsZ7fybcYiPbcVVJUhOwXJpqC9isW64=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qGE//DhYtZin1m3c/lVf4nCTOmoPBIzOZ65qsC7uEQry1my7fOYEVy33vsu0UYqdRCk7XfHOGpZ9yPj0XLADHOKv3mhpj9BqbiEjsthkIZwqXh46T6lKhVeeo0e4FzwBSBr9ScC3PQQfyuKXh8uHRt9so0gjC19wuZbgHAQwTEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CIjHNGg2; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CIjHNGg2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712605318; x=1744141318;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5VYQbJzHtePmAsZ7fybcYiPbcVVJUhOwXJpqC9isW64=;
  b=CIjHNGg2tanMjKDB9ebvfvsh6/m5yQvcyPFNxX7LJGF2kPMvluJnJjwi
   PIs/EjvmDJoCVxzwYON+X85mRpiLeJurclyRCtw7StuBjVhBQ/gzS6+Op
   kv0YKdpWS1nFm+A62k0AT/VDrlv1eOZwZQQ10VyOWZ6OL7jjPAzF/yRif
   ZDNvDXrDi3zpBHFCk9dx3a3n+KgpU2J0TI7d1VrxpTOv0/MzaYcBzw27E
   6iXCno748D658J1+5pM+BPvcPjMKisT+VSv0cTEuROUrNQ9Io3h7WppAD
   6MiikCRqPiNhW8Z57oV+80LgLd1ThWMYpI9VUhOuyK2mV6BlrGbFJKwqt
   w==;
X-CSE-ConnectionGUID: 0E6MA5HtTlKVvuL7S3EWNg==
X-CSE-MsgGUID: ZNuafGHQQA6O0v6rgBwDvA==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="30390454"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="30390454"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2024 12:41:57 -0700
X-CSE-ConnectionGUID: Q+7yzZQBSk6uKTX5XEmz9A==
X-CSE-MsgGUID: vauK4FXEQjWVkabfMbP5Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="24776958"
Received: from aikuseru-mobl1.amr.corp.intel.com (HELO pbossart-mobl6.lan) ([10.212.40.188])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2024 12:41:57 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH 1/3] ASoC: SOF: Intel: add default firmware library path for LNL
Date: Mon,  8 Apr 2024 14:41:45 -0500
Message-Id: <20240408194147.28919-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240408194147.28919-1-pierre-louis.bossart@linux.intel.com>
References: <20240408194147.28919-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The commit cd6f2a2e6346 ("ASoC: SOF: Intel: Set the default firmware
library path for IPC4") added the default_lib_path field for all
platforms, but this was missed when LunarLake was later introduced.

Fixes: 64a63d9914a5 ("ASoC: SOF: Intel: LNL: Add support for Lunarlake platform")
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/intel/pci-lnl.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/sof/intel/pci-lnl.c b/sound/soc/sof/intel/pci-lnl.c
index b26ffe767fab..b14e508f1f31 100644
--- a/sound/soc/sof/intel/pci-lnl.c
+++ b/sound/soc/sof/intel/pci-lnl.c
@@ -35,6 +35,9 @@ static const struct sof_dev_desc lnl_desc = {
 	.default_fw_path = {
 		[SOF_IPC_TYPE_4] = "intel/sof-ipc4/lnl",
 	},
+	.default_lib_path = {
+		[SOF_IPC_TYPE_4] = "intel/sof-ipc4-lib/lnl",
+	},
 	.default_tplg_path = {
 		[SOF_IPC_TYPE_4] = "intel/sof-ipc4-tplg",
 	},
-- 
2.40.1

