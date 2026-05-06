Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CBDE2DB781;
	Wed,  6 May 2026 05:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778047173; cv=none; b=SUzmwckO16hhKl3O629ooqFQbx8uX1kqYnkUjLtPZOlPvYRJhvglvShHAJcoBtNxqeTrAblla5EGBGlUF2Sg5kztXR7FGjIQUpXwQGcKoSxfA+ODke6EqrBFuiLtWXwOzmifW6FzBSdXsyc+5g5IhIL8N0VkuXf6BEoPkxuGF7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778047173; c=relaxed/simple;
	bh=K6+XNgvwZ0qTloEpeGDlwPnhBULZDLl6TfttFtr7hls=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mz8aMs4Tx8w8RDo+lH+HzRCBqUquOan5S5hsfEpJORGlEK94A5GKUWcfK2dw3cIxjDeV7Bjc4poEhEfm9/q9XGIQFSNB6hMrZltX1m4KexOC8L4cdnJj/RizusL90+ct04I6FMlRN5oafLAmxY80npyPJ0MmTq5xbzHml2eF3ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XwoI532N; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XwoI532N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778047172; x=1809583172;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=K6+XNgvwZ0qTloEpeGDlwPnhBULZDLl6TfttFtr7hls=;
  b=XwoI532NYGsCIlS1LBz3ch90fOrTMHPv9LQrX+xvkW+msLoRrVQii5Ce
   HONun0AHdeUOkbYCL3ZDP4mFmi1PeuYKA/QYkG5VpU+WIsnUHK6tTAzTt
   b20T47tISf1jnW1v+Ow0BsR8k0JMQwy0ysPgqBaUpZbGxetDpvQFwPAy9
   049ToImDCYCKFtr9gUA3SpsCeJ4yFPCzYbCRirUeGPj6DCE9TzOsGICaF
   CPeiPjmvATb/zYAqZY88UmTjbrxY01yLEMUs5Rr0TWhjWB9FHEiBlf0OQ
   09JA5eigG4LpiXJMU5AxfOxBKafOmGN/abY4/uFa5N9GqTFTajloywGVq
   g==;
X-CSE-ConnectionGUID: BxZPmTK0QFq+0ytrEIbcbw==
X-CSE-MsgGUID: dTBoYW5QQPqfaAzU9J3Kqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="78983744"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="78983744"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 22:59:31 -0700
X-CSE-ConnectionGUID: 7w9V2AheQKe3OrikebBVoA==
X-CSE-MsgGUID: I0Op8mYESzmcZ7TFa66IZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="240010670"
Received: from emr-371.sh.intel.com ([10.67.116.174])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 22:59:28 -0700
From: Baoli Zhang <baoli.zhang@linux.intel.com>
To: Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Jaroslav Kysela <perex@perex.cz>
Cc: "Baoli.Zhang" <baoli.zhang@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND v1 1/3] soundwire: fix bug in sdw_add_element_group_count found by syzkaller
Date: Wed,  6 May 2026 13:50:35 +0800
Message-ID: <20260506055039.3751028-2-baoli.zhang@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260506055039.3751028-1-baoli.zhang@linux.intel.com>
References: <20260506055039.3751028-1-baoli.zhang@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Baoli.Zhang" <baoli.zhang@linux.intel.com>

The original implementation caused an out-of-bounds memory access
in the sdw_add_element_group_count for-loop when i == num.

for (i = 0; i <= num; i++) {
    if (rate == group->rates[i] && lane == group->lanes[i])
        ...

To fix this error, the function now checks for existing rate/lane
entries in the group(a function parameter) using a for-loop before
adding them.

No functional changes apart from this fix.

Fixes: 9026118f20e2 ("soundwire: Add generic bandwidth allocation algorithm")
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Baoli.Zhang <baoli.zhang@linux.intel.com>
---
 .../soundwire/generic_bandwidth_allocation.c  | 47 +++++++++----------
 1 file changed, 22 insertions(+), 25 deletions(-)

diff --git a/drivers/soundwire/generic_bandwidth_allocation.c b/drivers/soundwire/generic_bandwidth_allocation.c
index fb3970e12dac9..f016ad088a1db 100644
--- a/drivers/soundwire/generic_bandwidth_allocation.c
+++ b/drivers/soundwire/generic_bandwidth_allocation.c
@@ -299,39 +299,36 @@ static int sdw_add_element_group_count(struct sdw_group *group,
 	int num = group->count;
 	int i;
 
-	for (i = 0; i <= num; i++) {
+	for (i = 0; i < num; i++) {
 		if (rate == group->rates[i] && lane == group->lanes[i])
-			break;
-
-		if (i != num)
-			continue;
-
-		if (group->count >= group->max_size) {
-			unsigned int *rates;
-			unsigned int *lanes;
+			return 0;
+	}
 
-			group->max_size += 1;
-			rates = krealloc(group->rates,
-					 (sizeof(int) * group->max_size),
-					 GFP_KERNEL);
-			if (!rates)
-				return -ENOMEM;
+	if (group->count >= group->max_size) {
+		unsigned int *rates;
+		unsigned int *lanes;
 
-			group->rates = rates;
+		group->max_size += 1;
+		rates = krealloc(group->rates,
+				 (sizeof(int) * group->max_size),
+				 GFP_KERNEL);
+		if (!rates)
+			return -ENOMEM;
 
-			lanes = krealloc(group->lanes,
-					 (sizeof(int) * group->max_size),
-					 GFP_KERNEL);
-			if (!lanes)
-				return -ENOMEM;
+		group->rates = rates;
 
-			group->lanes = lanes;
-		}
+		lanes = krealloc(group->lanes,
+				 (sizeof(int) * group->max_size),
+				 GFP_KERNEL);
+		if (!lanes)
+			return -ENOMEM;
 
-		group->rates[group->count] = rate;
-		group->lanes[group->count++] = lane;
+		group->lanes = lanes;
 	}
 
+	group->rates[group->count] = rate;
+	group->lanes[group->count++] = lane;
+
 	return 0;
 }
 
-- 
2.43.0

