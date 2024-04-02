Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84AC812BEB8
	for <linux-sound@vger.kernel.org>; Tue,  2 Apr 2024 15:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712070018; cv=none; b=leE7h/nShyM77Mejf0XIZ1kNiWznLJFECE5VshvbaTl+Kpu3gXbtA8rbkZIGZL4RzHKyn2oKtAqo1fWwWKzTe/jmcjF81gO1+A8bbb5bk51Lrs5N/3bNaXULGy7jPccSWJG8cAT5bmoRcqybF/6Op6pJAwmP5ry7/tzGWHmPkmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712070018; c=relaxed/simple;
	bh=7SUUzrMM9vVUTGjyOMCz5njlZv6H/FWKf1uf9PfnM48=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WM7+NsCAc/wH8l4PT/yra60d5BuqlDxPWHEA6obEp5AC29ICKhlo5Kr/hCRzzyNvSVJ7qiuI2jhWnaXAxbETu1CoWiXZVEypa1/7/p7kQ101IndfbABoYnt3PHyNIi+KvOqre/D4m4Y8InfNTW7x7lsYS+e8SA8TDEVy6GbBtd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hV3idLRw; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hV3idLRw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712070015; x=1743606015;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7SUUzrMM9vVUTGjyOMCz5njlZv6H/FWKf1uf9PfnM48=;
  b=hV3idLRwnUyvVkf8mhI9ctb2Dwhwhq5zuhtJwuyx4GuKAxh9h9xdZeo9
   6YY0el/azEypv4lPcGgx258+r6oukpelz6F3FLVFhIRN7GBxjT43HVqYz
   TiqJDpx1P5lJclB+xu22x8DQh7si6oM5JoF2YUomzJZgEpdbctBwVucCf
   jo7DtfKHCt2qiGdWtxA6vsprzEpqcYeCXa+da3L1nDjtSUVeuAcC8+vs7
   QFNQN0gptWmi6nRZVzOthaMX7xbkQmP/B9z26Z5FvW1Z6WlGbJcidqSNY
   33mTReLi/QhoihBzrnX9Tzi0vanPH3wOCdpbVCm/HZTDT6gdPv5eA3c8H
   A==;
X-CSE-ConnectionGUID: /cDsgz7AQue3zPlsyFi5zQ==
X-CSE-MsgGUID: /PjG4sk4QUKEmLhuWaUNUQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7433830"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="7433830"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 08:00:13 -0700
X-CSE-ConnectionGUID: 6QlY+RSbSYimAso6nlNcmQ==
X-CSE-MsgGUID: KsKYp1ZhRAqBurZSVlwiDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="22558029"
Received: from skhare-mobl5.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.8.83])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 08:00:13 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH 3/4] ASoC: SOF: ipc4-priv: align prototype and function declaration
Date: Tue,  2 Apr 2024 09:59:58 -0500
Message-Id: <20240402145959.172619-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240402145959.172619-1-pierre-louis.bossart@linux.intel.com>
References: <20240402145959.172619-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Somehow instance_id and id were mixed. Align on instance_id for
consistency.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/ipc4-priv.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/ipc4-priv.h b/sound/soc/sof/ipc4-priv.h
index afed618a15f0..e157ab80a103 100644
--- a/sound/soc/sof/ipc4-priv.h
+++ b/sound/soc/sof/ipc4-priv.h
@@ -98,7 +98,7 @@ extern const struct sof_ipc_tplg_control_ops tplg_ipc4_control_ops;
 extern const struct sof_ipc_pcm_ops ipc4_pcm_ops;
 extern const struct sof_ipc_fw_tracing_ops ipc4_mtrace_ops;
 
-int sof_ipc4_set_pipeline_state(struct snd_sof_dev *sdev, u32 id, u32 state);
+int sof_ipc4_set_pipeline_state(struct snd_sof_dev *sdev, u32 instance_id, u32 state);
 int sof_ipc4_mtrace_update_pos(struct snd_sof_dev *sdev, int core);
 
 int sof_ipc4_query_fw_configuration(struct snd_sof_dev *sdev);
-- 
2.40.1

