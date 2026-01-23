Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251AC35B64A
	for <linux-sound@vger.kernel.org>; Fri, 23 Jan 2026 11:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769168301; cv=none; b=jlQtaVqlpER/2u6QAN+JaYTEGitI05yM8C8Q9QngcA5gerJhnc8/8DdziEpiK9kgq5V724ba5RTqSlIkhjnHVbj8jAH8t9PzjNjNy6An+p4LgaEiysxXZWUio0gumh9avgGjoIRYG4O6V3R+vDpyhUjcHkYs27Id4PBH/Efi85U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769168301; c=relaxed/simple;
	bh=yRLShJIhmmUMfQ7pAwUSNkabaEVmLkZhNX4eoBjdcDY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sRUDpUytxUOWy5DPHspx4JTXNb7phWLbLmLhjSbjk52bwYQUtZ2EC4Wjgrh5lc2wN40eB81F9upEerMsmUVWKUJBzRCsH/ak4QMyCcTdV+18w72eXWihXqIZz1PqwWDvA617tmOfKbhO9aLVpSQ9eLZKUE8SEPNh7T4/0ktRVoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vgi5Qlm9; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vgi5Qlm9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769168299; x=1800704299;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=yRLShJIhmmUMfQ7pAwUSNkabaEVmLkZhNX4eoBjdcDY=;
  b=Vgi5Qlm9c6kLwup1SoKlUi8IXZ0gthwwAdNXoWtwT3bIZE7fKsHq4pfA
   vqg46MW/G3+JQc4PIPh9OipNMIYziiLfYLEa0H5JvqD6vONdDB3ndxF3T
   feN4p/uzG48lfvIDFaHXrwDzPwxPpFBiqRrLzGVTEHM+KD55/0AWVMjtB
   vlk1Ez1/CfjrjVy73mRX0KW6gA1vaq6KA2eb5qUekYUG2dTJFPw0Ny2yG
   J+X5ihU0wKHjySFRiEldkKI6LtUQDf7hi5Y7K721fEj8O0vYgTzkFeUPh
   7WdHc0dY3iqT/nuAxKeMxSpuLkIf7sjbJkAs/NRMClygwjG1Ou9auhukA
   Q==;
X-CSE-ConnectionGUID: Xg5/3WesSnyYTIqc1jc08Q==
X-CSE-MsgGUID: DhXms40kT5OrCAUXWZMn5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="69439781"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="69439781"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 03:38:18 -0800
X-CSE-ConnectionGUID: m3HtuZJWS0OYGrkCnpV5zQ==
X-CSE-MsgGUID: lb5OkiXoR82LJrEUmUc4yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="244615330"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 03:38:17 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH] ASoC: soc-acpi-intel-ptl-match: fix name_prefix of rt1320-2
Date: Fri, 23 Jan 2026 19:38:09 +0800
Message-ID: <20260123113809.2238766-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

rt1320_2_group2_adr works with rt1320_1_group2_adr and the name_prefix
should be rt1320-2.

Fixes: ffe450cb6bce ("ASoC: Intel: soc-acpi-intel-ptl-match: add rt713_vb_l3_rt1320_l12 support")
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/intel/common/soc-acpi-intel-ptl-match.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
index 9e3c459d22e6..1055fb4838f6 100644
--- a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
@@ -451,7 +451,7 @@ static const struct snd_soc_acpi_adr_device rt1320_2_group2_adr[] = {
 		.adr = 0x000230025D132001ull,
 		.num_endpoints = 1,
 		.endpoints = &spk_r_endpoint,
-		.name_prefix = "rt1320-1"
+		.name_prefix = "rt1320-2"
 	}
 };
 
-- 
2.43.0

