Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120C412B16E
	for <linux-sound@vger.kernel.org>; Tue,  2 Apr 2024 15:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712070017; cv=none; b=p3XQ57uXaQMxeNbMJTH403mkJvvsP+spZMP6cjRbJ0N+fXYsMAv92po5+Q7pU5bHwuA/tgorfrUVopA0yYN1JIFc8T97otbdsRb8/mKLfYZivOHuntG3oSaZCXYwE1mPFhP5piAz4G5pUiiJ58iV0hvZd5+2/vMgsUyGWe26iUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712070017; c=relaxed/simple;
	bh=KEiSZsipQm/e3f21LS8Ya39Ul+7YeHp7MqC0Uee8uzY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DQ5+kLmLEJBkNPWAkwsq4k9CuzxiXhCOhJ6vzFY5R43QHmirb+1lEq3ch3KfM0ZxZcTeEjtexRHABQAkzMqaAB5cQVgWrcueb0iXJV0sM/o/Ldcj4/FFKIGYhENhYvbdjAa+/05QIA4kuN4ZCoTeBDmAN5LocwJ45k1V5RjNKkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iZDMDZrS; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iZDMDZrS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712070015; x=1743606015;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KEiSZsipQm/e3f21LS8Ya39Ul+7YeHp7MqC0Uee8uzY=;
  b=iZDMDZrStqEQpwzQF+m1PQVuGz95mSTANS+cebGYnpUtCcLXRcaA3Kzl
   XUXbNO8RcEs5T8w17AcMfBMNHrooqgfGhdhORPVSduewVErNd3fL0emSD
   TX4cWw6dvr6ZVhC6ClZ2j/06ZqUAAxN+/dCrzaMPRieTecgPF49elUYY2
   L9R0HbU+q30x9unFjbteP/rGV+aD5ixW5OWCG7lKN7F0beoR1LoCj1Wyg
   gzHy34Pjl6CbeHCNUEf8Irhc/dCkgYiSWptTHa0Vd5kANe6+EjlHosDkt
   rEZwD4RnJhf4EEsuUoi+NB9vNmrDZT82r+74ggyVUwu4o0IQp2mcn+8Kb
   Q==;
X-CSE-ConnectionGUID: VDntlRm0RfuMoSiCXTtI/w==
X-CSE-MsgGUID: oREYGsc+RXi+jBXIYEIalQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7433825"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="7433825"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 08:00:12 -0700
X-CSE-ConnectionGUID: j7c6EjLCQ2G1F8K60/gzEg==
X-CSE-MsgGUID: LyJ8yZEbR/ujCc/5/Oj1YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="22558028"
Received: from skhare-mobl5.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.8.83])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 08:00:13 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH 2/4] ASoC: SOF: amd: acp-loader: abort firmware download on write error
Date: Tue,  2 Apr 2024 09:59:57 -0500
Message-Id: <20240402145959.172619-3-pierre-louis.bossart@linux.intel.com>
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

cppcheck reports this issue:

sound/soc/sof/amd/acp-loader.c:299:6: style: Variable 'ret' is
reassigned a value before the old one has been
used. [redundantAssignment]
 ret = request_firmware(&adata->fw_dbin, fw_filename, sdev->dev);
     ^
sound/soc/sof/amd/acp-loader.c:289:6: note: ret is assigned
 ret = snd_sof_dsp_block_write(sdev, SOF_FW_BLK_TYPE_IRAM, 0,
     ^
sound/soc/sof/amd/acp-loader.c:299:6: note: ret is overwritten
 ret = request_firmware(&adata->fw_dbin, fw_filename, sdev->dev);
     ^

This behavior is probably unintentional, there's no reason to return
an error for the DRAM but not the IRAM.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/amd/acp-loader.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/sof/amd/acp-loader.c b/sound/soc/sof/amd/acp-loader.c
index aad904839b81..2d5e58846499 100644
--- a/sound/soc/sof/amd/acp-loader.c
+++ b/sound/soc/sof/amd/acp-loader.c
@@ -289,6 +289,8 @@ int acp_sof_load_signed_firmware(struct snd_sof_dev *sdev)
 	ret = snd_sof_dsp_block_write(sdev, SOF_FW_BLK_TYPE_IRAM, 0,
 				      (void *)sdev->basefw.fw->data,
 				      sdev->basefw.fw->size);
+	if (ret < 0)
+		return ret;
 
 	fw_filename = kasprintf(GFP_KERNEL, "%s/%s",
 				plat_data->fw_filename_prefix,
-- 
2.40.1

