Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9DDE138A
	for <linux-sound@vger.kernel.org>; Tue,  2 Apr 2024 15:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712070016; cv=none; b=XatEn4CAD+h3gCR23NH9X3AdBEJAvCHPNc4PM6vBdF2oVIwCF07FK1+G3uQuoCz1GND0P5G8x8fWnn5E/WVdd6c2gv4hujKmgWb90qep67da6D6LPhT6x0TQqU4BtR1FQrRbBH4uejuvaudktOEebu/um9DzqnDrJ+GGUe/BVwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712070016; c=relaxed/simple;
	bh=Z+Ybbt9Fy1SY0EwppncHnxJ8noudvlaEyZRsTHXtmrc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=u/VoP+WqAhm61/vQJvq2YA9LIDOsYuOUbog7eD/JxSi+50KYgtFUSjOXOEbMPlIOPOBIrUHGL+6zQQ8ExkeaVT3HkIlbUEXGxB0cGphF/sVlkZLRrELU2v5LbaPRSg/4MfhEqMPXbxXTmjir/uqZheW7e706vmlNlDntlcgjFJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LzQx2ESG; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LzQx2ESG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712070014; x=1743606014;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Z+Ybbt9Fy1SY0EwppncHnxJ8noudvlaEyZRsTHXtmrc=;
  b=LzQx2ESG0ZpAdRE2lgbY5ohcwXDCFUfK3KRRu+5jY+4v8BPa6raQJ0J0
   zyyv1nIG+REJ1a9DoG4cVZts8tVMu8YI/fDTdXfoHpS4V3fM+GDyjHmdF
   HeQwD8nGZi62uzFFtucpejoGp4OBqz1GOyJeB0V4q2w5Don9hvOC+V4dV
   DOtEuku5MFMiLSSAcT8j0WVOFiYhyWIwmNSyD5J5MkOJKaWvl4cpXFJXG
   ddRxjcdYaaC0gQ+AL9374szTaACsso5WS9DvN2ETY+GLotdKhydP3ol3y
   yvaTLusmJi+qzWEz2d9A/20/uCG9n4RHL3DA/OWuPRkGhbEq6SpsTpQXu
   Q==;
X-CSE-ConnectionGUID: 2IB60xpIQJOeud6UbvtmTQ==
X-CSE-MsgGUID: dp2W+6EpSrWZ6LCPG0pQrg==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7433821"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="7433821"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 08:00:12 -0700
X-CSE-ConnectionGUID: TvxuCwT4SmegYy/4R03HAg==
X-CSE-MsgGUID: A4QkwMyIS4q/i3CB+PNzew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="22558027"
Received: from skhare-mobl5.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.8.83])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 08:00:12 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Yong Zhi <yong.zhi@intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 1/4] ASoC: SOF: ipc4-loader: save FW version info to debugfs
Date: Tue,  2 Apr 2024 09:59:56 -0500
Message-Id: <20240402145959.172619-2-pierre-louis.bossart@linux.intel.com>
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

From: Yong Zhi <yong.zhi@intel.com>

To check loaded FW version:

$ hexdump -C /sys/kernel/debug/sof/fw_version
00000000  02 00 07 00 63 00 01 00  00 00 00 00 00 00 00 00  |....c...........|

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Yong Zhi <yong.zhi@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/ipc4-loader.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/sof/ipc4-loader.c b/sound/soc/sof/ipc4-loader.c
index c79479afa8d0..641c4f24cca9 100644
--- a/sound/soc/sof/ipc4-loader.c
+++ b/sound/soc/sof/ipc4-loader.c
@@ -80,6 +80,14 @@ static ssize_t sof_ipc4_fw_parse_ext_man(struct snd_sof_dev *sdev,
 	dev_dbg(sdev->dev, "Header length: %u, module count: %u\n",
 		fw_header->len, fw_header->num_module_entries);
 
+	/* copy the fw_version of basefw into debugfs at first boot */
+	if (fw == sdev->basefw.fw) {
+		sdev->fw_version.major = fw_header->major_version;
+		sdev->fw_version.minor = fw_header->minor_version;
+		sdev->fw_version.micro = fw_header->hotfix_version;
+		sdev->fw_version.build = fw_header->build_version;
+	}
+
 	fw_lib->modules = devm_kmalloc_array(sdev->dev, fw_header->num_module_entries,
 					     sizeof(*fw_module), GFP_KERNEL);
 	if (!fw_lib->modules)
-- 
2.40.1

