Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990311369BB
	for <linux-sound@vger.kernel.org>; Wed,  3 Apr 2024 09:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712136679; cv=none; b=i6hdGR/rfm7YJFjCRGP2bqhAxxsNJsEMMAN0mZz6JQWJHZbX07D7pztzOpbEUfCwGg/J1P7vwSPoV2qNIN/iqxHv6lphPdlDULtHgaPLBT+wLcQcGnZQYYVpt6mMnFT9Kwr6rreannHGiNfU1BlNBSKB1BjK6RrVWf3syqiucwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712136679; c=relaxed/simple;
	bh=Uf61lRVj55WHImUiBlCNQuyLIKLzrbNeeTxDN7YZoBI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OOCQrpEKfWddzMtN5ddYn4pFsme6sUWDYdWCRxIyQY8AGKHIA93CRN4dcMVY8J4zd+QVQHgVmQhJQ0ephalUfh1lpd6gLipLo4Qek4HoJDoLDm7Xkg7pefMaE9VD6NeyEKWAWuQRQZW5oczBgQeHRAcX+Vmk1aU9OBK8ty76Wvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kbaPe6IB; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kbaPe6IB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712136677; x=1743672677;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Uf61lRVj55WHImUiBlCNQuyLIKLzrbNeeTxDN7YZoBI=;
  b=kbaPe6IBcH7nA5UqjmuiT45bfojvMOw/i0tszaZYweyXtzk5+idPxHSm
   Kbmq9e29422eY6FxtjQQHmcjOOmbBFKsPS85TgQStwFsVLnctRUoDCldI
   GMxN75jAaKu6ErpbH58xQ7lZ7K4mtRIN8T8f0H2g96tAmYbAxvdaRClZj
   l+TOKkxQO1qaLU+/SrSxDpqaFknlrmd92IIu98nkj/NAHrCFDhpb1pFF4
   GkJO0NsXL+YsTYcfGUbWSxsLwLFDAC96mzSmrmDczDPqwitFOXytEpevi
   n3swRVsA+/KzTwJ7NyOAZ+V5OrZnVlI/WPhZySVzYibfbuRaDxtGdeRq8
   w==;
X-CSE-ConnectionGUID: 3zQX8N4iRsGrkGxY9PAAJA==
X-CSE-MsgGUID: vlOpcTeFQeWexbUldH0T2w==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7218686"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="7218686"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 02:31:17 -0700
X-CSE-ConnectionGUID: k/r99CPlRYqUchUEr9fhxQ==
X-CSE-MsgGUID: XpQjvu2fTWScFgk96aZwEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="18797538"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by orviesa007.jf.intel.com with ESMTP; 03 Apr 2024 02:31:15 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 02/10] ASoC: Intel: avs: Use devm_kstrdup_const
Date: Wed,  3 Apr 2024 11:31:37 +0200
Message-Id: <20240403093145.3375857-3-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240403093145.3375857-1-amadeuszx.slawinski@linux.intel.com>
References: <20240403093145.3375857-1-amadeuszx.slawinski@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

FW name is constant and we just duplicate it, use const variant of
devm_kstrdup to possibly save a bit of memory.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/avs.h   | 2 +-
 sound/soc/intel/avs/utils.c | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
index f80f79415344a..9a02e2b528bc5 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -107,7 +107,7 @@ struct avs_spec {
 };
 
 struct avs_fw_entry {
-	char *name;
+	const char *name;
 	const struct firmware *fw;
 
 	struct list_head node;
diff --git a/sound/soc/intel/avs/utils.c b/sound/soc/intel/avs/utils.c
index 82416b86662d8..8100c2fa0a7ed 100644
--- a/sound/soc/intel/avs/utils.c
+++ b/sound/soc/intel/avs/utils.c
@@ -250,7 +250,7 @@ int avs_request_firmware(struct avs_dev *adev, const struct firmware **fw_p, con
 	if (!entry)
 		return -ENOMEM;
 
-	entry->name = kstrdup(name, GFP_KERNEL);
+	entry->name = kstrdup_const(name, GFP_KERNEL);
 	if (!entry->name) {
 		kfree(entry);
 		return -ENOMEM;
@@ -258,7 +258,7 @@ int avs_request_firmware(struct avs_dev *adev, const struct firmware **fw_p, con
 
 	ret = request_firmware(&entry->fw, name, adev->dev);
 	if (ret < 0) {
-		kfree(entry->name);
+		kfree_const(entry->name);
 		kfree(entry);
 		return ret;
 	}
@@ -282,7 +282,7 @@ void avs_release_last_firmware(struct avs_dev *adev)
 
 	list_del(&entry->node);
 	release_firmware(entry->fw);
-	kfree(entry->name);
+	kfree_const(entry->name);
 	kfree(entry);
 }
 
@@ -296,7 +296,7 @@ void avs_release_firmwares(struct avs_dev *adev)
 	list_for_each_entry_safe(entry, tmp, &adev->fw_list, node) {
 		list_del(&entry->node);
 		release_firmware(entry->fw);
-		kfree(entry->name);
+		kfree_const(entry->name);
 		kfree(entry);
 	}
 }
-- 
2.34.1

