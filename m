Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA5339D3D0
	for <linux-sound@vger.kernel.org>; Thu, 24 Sep 2026 05:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790228427; cv=none; b=adPiVqgC8WZJtJ8yRvcHul/wTBSYw68JvR0pL2N/KDjN4dsqqzld39pqG7IwQsGksgiPmig8i6nUWwkIk2hRW+aazn6CUxMgV5fbfh2Q8FfBZY3qUTU+zW9P7EXLq6Q1DzMe3hQ4t4P/1pgxpoqj1/LV1RID/xwPB2V6z/6aNec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790228427; c=relaxed/simple;
	bh=X6iIqkdHScLznbTkrYGfnNkpn0OxSHjTGsX5ENfCmZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i0hB5RpB8g9cvjybp3XOc+Q+3oHJz3zKsEILGO8mlxzrjPoTdle6dKGCv3Ck64nKcn+UvGYxqOVxLiFiG2l5UwzROnmSydVNlC84tGsr6+UrqLfIbuYv4+3TgDSUA5iqAbmSAR1UrQg3Wo2KKfqnMSflrNagQGfRUcARoftQ+ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QVtUezyz; arc=none smtp.client-ip=192.198.163.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QVtUezyz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790228426; x=1821764426;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=X6iIqkdHScLznbTkrYGfnNkpn0OxSHjTGsX5ENfCmZ4=;
  b=QVtUezyz5iG5eM/i36ezJApxYK4+YFtkoJ3GvZa8jpSCnSHp+9FzOdty
   +oOn6e6oRthEFFcRXfICfrTD7SdgudrKBIPaFqO7QsJ4F0tzulNNWgS6X
   qpkUm5/LKVu2bnwG4dh9XDYfn+O8gKpzpWKf3oMJufdH1fj6urS42oIvA
   b3Vh2Pp8CaoK6A5XU3AxJv/ZDh1wBN8xXlGo/lPWPAws78OIMjtBFCXXg
   OS7KM5pUv+0MIS8zKVfSWr2Gpod/E1oYvL9vWBupGR9pSYpC7CeROwcBV
   sngGOnUprWohEu65GXLxevUbc4vwxO+FgDdEr9RfEDuXORzY0sV5ho9vK
   A==;
X-CSE-ConnectionGUID: nkvdt380SWSMyB94Hz9tSg==
X-CSE-MsgGUID: IqIim1byTS2Jva9cTTs5sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="1500760"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="1500760"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 22:40:25 -0700
X-CSE-ConnectionGUID: wjpw/5EpSRO/XKzVB2SEkw==
X-CSE-MsgGUID: mLsWyghWTSKu0d5iBzsltQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="5027719"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 22:40:24 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH] ASoC: Intel: sof-function-topology-lib: fix sscanf type
Date: Thu, 24 Sep 2026 13:40:15 +0800
Message-ID: <20260924054015.2600784-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change %d to %u as ssp_port is unsigned int.

Fixes: 6736426f31e8 ("ASoC: Intel: sof-function-topology-lib: add I2S support for sof_sdw_get_tplg_files")
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/common/sof-function-topology-lib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/common/sof-function-topology-lib.c b/sound/soc/intel/common/sof-function-topology-lib.c
index 8f4fdf82d00f..57e089f8e721 100644
--- a/sound/soc/intel/common/sof-function-topology-lib.c
+++ b/sound/soc/intel/common/sof-function-topology-lib.c
@@ -121,7 +121,7 @@ static int get_ssp_tplg_dev(struct device *dev, struct snd_soc_dai_link *dai_lin
 {
 	unsigned int ssp_port;
 
-	if (sscanf(dai_link->name, "SSP%d", &ssp_port) != 1) {
+	if (sscanf(dai_link->name, "SSP%u", &ssp_port) != 1) {
 		dev_err(dev, "Can't get SSP port from dai_link->name %s\n", dai_link->name);
 		return -EINVAL;
 	}
-- 
2.43.0

