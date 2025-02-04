Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BFC33597D
	for <linux-sound@vger.kernel.org>; Tue,  4 Feb 2025 03:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738639907; cv=none; b=H61j7NzhIGKbkbbklm6XmKjhPdHQVRewHjcKb5JTfJRavpD4aypTq6oGEK9NBTRADP2Gju+/WWyIX+3//I48xZJ7ZZ4UFzbYzEMzUocHqzp0/t4lWcdy221H+Y+FwjIr+nk5h8YzY2amflwgjbGziLkR4qCN/yvO94bEoRZUQO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738639907; c=relaxed/simple;
	bh=+qUX53nK0e5QAVcLs/s+QaTo6ttwGa9DrI56Zd/2qXY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oAJOwEqWciD7jqyXtiSGz1ELzG3lo6pgnYInycDURzJPgoCPUZag3S9uzeSFUjKP7WI4WUEksdSFhohGsEjr7mZzjTR8UwsOoYuwZYEF/fZTBT8v/8RoE0xylYRunWV6FsmEuZ3/GTuAT8xPvb19Vui9gkJmTIMKVAHU3Rye/+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nX1THX2R; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nX1THX2R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738639906; x=1770175906;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+qUX53nK0e5QAVcLs/s+QaTo6ttwGa9DrI56Zd/2qXY=;
  b=nX1THX2R7hb25gBc4DFvrQGjcemXQYL/oD+j7Mhs13kNpbe8QanKv5qC
   VhF/oX/FQNigT0JsrY8YmfGXrPO1K32GUYQaT031xT8wRaCliaX2sHNzn
   1CV94Abraazrx0vyAnNthe/eaN44RVmmvKBfKMsql8sT+zpY1SR//6PDf
   gTVg1t0Z2d4zrbGbedb8vcU/1IuNJWD03xCsPEksryTr9dNaD2f8Ct0kg
   sXTbeiq22U+LRj27tt5uFeUFWKR+O5TsOEWuxz+NdcsBjBzLCcmRv6YuI
   P2tK3l6981kZxbP72m1ApTPq8Dm/HD2HiV8FrL1DFOPnIlT0hPPTTXRup
   w==;
X-CSE-ConnectionGUID: VCP0n2G4TF+SE3rFC8XUuw==
X-CSE-MsgGUID: SqOdGjIqQXmhRWQd33/Xpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="39047002"
X-IronPort-AV: E=Sophos;i="6.13,257,1732608000"; 
   d="scan'208";a="39047002"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 19:31:46 -0800
X-CSE-ConnectionGUID: XoIncSaGR7SonqnwfvTVaA==
X-CSE-MsgGUID: DLqOTGizRjqFlp9ViDIEng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="147672060"
Received: from iweiny-desk3.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.223.111])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 19:31:45 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 2/2] ASoC: Intel: soc-acpi-intel-mtl-match: declare adr as ull
Date: Tue,  4 Feb 2025 11:31:34 +0800
Message-ID: <20250204033134.92332-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250204033134.92332-1-yung-chuan.liao@linux.intel.com>
References: <20250204033134.92332-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The adr is u64.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/intel/common/soc-acpi-intel-mtl-match.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
index 770e2194a283..9e611e3667ad 100644
--- a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
@@ -330,7 +330,7 @@ static const struct snd_soc_acpi_adr_device rt1316_3_single_adr[] = {
 
 static const struct snd_soc_acpi_adr_device rt1318_1_single_adr[] = {
 	{
-		.adr = 0x000130025D131801,
+		.adr = 0x000130025D131801ull,
 		.num_endpoints = 1,
 		.endpoints = &single_endpoint,
 		.name_prefix = "rt1318-1"
-- 
2.43.0

