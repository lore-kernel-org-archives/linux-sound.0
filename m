Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B3D25C822
	for <linux-sound@vger.kernel.org>; Tue, 21 Oct 2025 06:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761029833; cv=none; b=mt2dLqfaou6uYF2WO1nzGt5gzrPBbf2QKd460ca++cgDEdgGjI3X8PvHx0WIrB8AhmCEzJo0+rIlBJqAIwdcWfj9xOIoJWO7dEshvdCpt3sLfMqRrp7qpOPPd/GRAvRqEgRc9oQssHoZFv1XHDFD3ul4VqHJ6DzX6djV+55wtlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761029833; c=relaxed/simple;
	bh=/4mXT2+a7xnvv9FIDmTaCI6TCrhWtBXfYejytEZERak=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=huY3nQInNaOnSlvNCqZbU6d+aoJ31EsFfwia9lMe/MK7eR4qmbDLIYQik/CekzkKm7rPyMh2FIjLmoVNgdiYJlxJg1t0MqXqFxcvTunPKFhBFtF0M2kXN1vxlWC36gkDJ0XdC/0xMIMhfruv/2pXBeAelnOLLpNo5aVvpyFRDkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f/Uxff3Q; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f/Uxff3Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761029832; x=1792565832;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/4mXT2+a7xnvv9FIDmTaCI6TCrhWtBXfYejytEZERak=;
  b=f/Uxff3Qi9K7dZNzsrPb9WRTIIhllDXV4pLe70JgIkGKt83O6Qsk/yrj
   5WGAwv3MXbpXPm8mZheZgMELaUMVgejIIKKG1qt6uY4B8f1x8BwmnbxWD
   g3c/DGSlaS+Py1HheONF0CP0hMdPUKTeyQRhD9s6jvSOcH7OVT41p9wGf
   MLkdVU0T0iAVWMg5vi4oGjfV5I7b1jUCeWjm2PblKwXeCYEbvaUGNWSUN
   +b0/KzBOkqlarrxKjrDj+Fsu4L717Wt6brYpniI9W/EGTYd62kg8v4gYp
   pUwSW0OTxCX3cQl4GfCCp4s5LtYvy1nZGq/COw/ilAtaUdKN72gpeBfSY
   g==;
X-CSE-ConnectionGUID: +XDM/E+RTECChoFhUwzrUA==
X-CSE-MsgGUID: Sn/SXExsRIWUr6sw+6yleg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="88617470"
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; 
   d="scan'208";a="88617470"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 23:57:11 -0700
X-CSE-ConnectionGUID: dyPJ0S2UROq/wAKYOz0lmQ==
X-CSE-MsgGUID: jgSxvypnRdKV/0Fzz4Eslw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; 
   d="scan'208";a="188625247"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 23:57:10 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com
Subject: [PATCH] ASoC: SOF: Intel: add hyphen between name and index to amp name_prefix
Date: Tue, 21 Oct 2025 14:57:00 +0800
Message-ID: <20251021065700.130810-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Shuming Fan <shumingf@realtek.com>

For those amps that use their name as name prefix the amp id should be
added after a hyphen symbol. Like "rt1320-1".

Fixes: 5226d19d4cae ("ASoC: SOF: Intel: use sof_sdw as default SDW machine driver")
Signed-off-by: Shuming Fan <shumingf@realtek.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/hda.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 00835fc8ef8d..4a59dd53c569 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -1261,7 +1261,7 @@ static struct snd_soc_acpi_adr_device *find_acpi_adr_device(struct device *dev,
 			break;
 		}
 	} else {
-		adr_dev[index].name_prefix = devm_kasprintf(dev, GFP_KERNEL, "%s%d",
+		adr_dev[index].name_prefix = devm_kasprintf(dev, GFP_KERNEL, "%s-%d",
 							    name_prefix,
 							    *amp_index);
 	}
-- 
2.43.0

