Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A53429810;
	Mon, 29 Jun 2026 14:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782744309; cv=none; b=AQjmxXxDSCdoMmEKW9CXdy4apSi0IC3GDNZCyGIK6nP0a8/dAqeVaNyEGCuGaOYjK1ZaS8iC6aHPxykdIIkY/WE9KMkIXyRPw8Grddo2HewGy+HCRIbSzJ+ZrOfzwK8I6qLCNWV2HLY+vB/csNmEgikbVWDjC/pPk34uWioItwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782744309; c=relaxed/simple;
	bh=lWnUfDbaVyn7faJWdzySTcmioIi90cQ0d4PHA03QUPM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qnc5Qwn4GML+RL5phDp/sCNXw7CPLEcE1OX9GiJQmxXLnHmypnIOFf7oX4oLLjxlgrwljio2TEkcxzsLDQMwaBcT//1/HjnX9KC6HQM6J8n8Gp+jmjLDNgMFWNs9h+Ewuggk4Y41j8tmMRsNXMlZfTTepsUPmhCCpW+FviZpYls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FUKqEbZO; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FUKqEbZO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782744307; x=1814280307;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lWnUfDbaVyn7faJWdzySTcmioIi90cQ0d4PHA03QUPM=;
  b=FUKqEbZOd6qWz0jjGHXZf8Foy4uIcVL5M+mVmUhU4DBc0w4V9ZalGH8p
   qYrh1vKlABc5Wsx7dJaqGy4L8ZR/Noo89N6xNEjNt1zjJgZ90jSJpNDXo
   JNb3Dl9C6PZO2i2bUz8umooFktgFKF4lipCy7X4Z+KdENeurf9581fe2W
   4kjRHPhLFNzYfhvd59Dj5+LHSgtjjYcOg9F3GEGoeKi0qE4zCL9h0pz4V
   aonpYwFyQWhmIB45fadkHIww6Gl9h6xWam1m0bIpsZ6g9ahRdYnfErPi7
   rhNCQ0X9DLqUUljfbmUQS3mZIMzyJrwXt79vAuidd6lhkjEhK9rj6z+io
   w==;
X-CSE-ConnectionGUID: DPALPtEUSNa+3+iPNLSx/g==
X-CSE-MsgGUID: Knn5wnunToK1ssjIQyi7WQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="106228478"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="106228478"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 07:45:07 -0700
X-CSE-ConnectionGUID: cnfWBcl0Q2+DO11/9zvawg==
X-CSE-MsgGUID: zURLhjU3SC6mTZfbzhevAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="250283018"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 07:45:05 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	peter.ujfalusi@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH 2/2] soundwire: Intel: stop sdw clock in system suspend
Date: Mon, 29 Jun 2026 22:44:50 +0800
Message-ID: <20260629144450.2096823-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260629144450.2096823-1-yung-chuan.liao@linux.intel.com>
References: <20260629144450.2096823-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There is no need to keep the SoundWire clock active in system suspend.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 drivers/soundwire/intel_auxdevice.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/intel_auxdevice.c b/drivers/soundwire/intel_auxdevice.c
index 0b8107bec9ab..10fd27f4fe39 100644
--- a/drivers/soundwire/intel_auxdevice.c
+++ b/drivers/soundwire/intel_auxdevice.c
@@ -669,7 +669,8 @@ static int __maybe_unused intel_suspend(struct device *dev)
 		return 0;
 	}
 
-	ret = sdw_intel_stop_bus(sdw, false);
+	/* No need to keep the SoundWire clock active in system suspend */
+	ret = sdw_intel_stop_bus(sdw, true);
 	if (ret < 0) {
 		dev_err(dev, "%s: cannot stop bus: %d\n", __func__, ret);
 		return ret;
-- 
2.43.0

