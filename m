Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286053290B7
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 07:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784790351; cv=none; b=XvLAVltg9e6kG2fmvJ6isqfyGP2vvzgJZv2Kwyri0E/qV1Hk6yoirzR3zEGnlDRIdq2iU1uOzKSIwBruJl092hkKq4598YCiYKYg/GBlggQCK8ze7909o0BLwRjru8EaygrkkMotL+onj96Lmk2NGKo3++jbTRw9LdKSN0ID+ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784790351; c=relaxed/simple;
	bh=cjiCkYCHZ/JuOEtBUrb3c3gha1BH9DNeSy/dQU/glzw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OrczdscWw47GeW6+TKrZ4rPdtJMClN6F4dVmahsd8w8HjBfDzEqKNBDfYFD2ax6jz3R4gLPuAwLd6T6bWouMMjzHbpnjmP0Q/ac7nePOyDd67A7Jwx66DMEqNG3lE0Wa0IPxnDKFuv3NJfcDnpaIt56OIxL2V1ApdPCTCII2rhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nZiAmrOK; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nZiAmrOK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784790349; x=1816326349;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cjiCkYCHZ/JuOEtBUrb3c3gha1BH9DNeSy/dQU/glzw=;
  b=nZiAmrOKcdcHhWhDgOQ/3M6OsIYd2EmsnamliQOpp1ZeOUJK7TtkBal1
   Hb66gdE/WdQVnBXdzTXkb2Aed18KSyklhP9c+2VuBLYMH4noqaYfHSU94
   QjeNVqWm+jKQf/xmqDQXlaUkOha/SgzRF4PZ2trGvWcWrVaTT4SQ24xT+
   zbvDBWm/pskQvA9Kink5AgkROdNR/c/Rp9BJnJ3+L/a69/59BB+Eoxret
   dyJqCjVwMVJMn0hM9/kVuNb8IzdcJ5bEB5W0QngBPB21KLj2QpYG+CUMb
   /SxFwrvHGbOG8kz0FLF7ITUCkT1IDH6fVxSo34r2rJ+9HzN7XpbxtGJWp
   Q==;
X-CSE-ConnectionGUID: FDrIfxWQR2Wfys0BtGIYsQ==
X-CSE-MsgGUID: QoWt8xSMT/SPMBDAXzX8Dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="96095050"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; 
   d="scan'208";a="96095050"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2026 00:05:46 -0700
X-CSE-ConnectionGUID: WJ3xa4uvQ6GC07vMLawBgA==
X-CSE-MsgGUID: +efcKZlfQPyW559pwWK7NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; 
   d="scan'208";a="256522052"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2026 00:05:45 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 3/6] ASoC: soc-acpi-intel-ptl-match: use function topology by default
Date: Thu, 23 Jul 2026 15:05:18 +0800
Message-ID: <20260723070521.870256-4-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723070521.870256-1-yung-chuan.liao@linux.intel.com>
References: <20260723070521.870256-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With commit c84179a1d36b ("ASoC: Intel: sof_sdw: append dai type to dai
link name unconditionally"), function topology can apply to all
SoundWire codec configurations. Set .get_function_tplg_files callback to
use function topology by default. If any required function topology can
not be found in the file system, it will fallback to use the monolithic
topology.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 sound/soc/intel/common/soc-acpi-intel-ptl-match.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
index 41c059d43998..756bbf82a326 100644
--- a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
@@ -522,6 +522,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_ptl_sdw_machines[] = {
 		.links = ptl_rvp,
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-ptl-rt711.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
 	{
 		.link_mask = BIT(3),
-- 
2.43.0

