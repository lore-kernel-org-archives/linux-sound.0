Received: from r3-71.sinamail.sina.com.cn (r3-71.sinamail.sina.com.cn [202.108.3.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A8038F22D
	for <linux-sound@vger.kernel.org>; Sun, 10 May 2026 13:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778419460; cv=none; b=a++qNN8MeVQocDzXR2/Ih5v1Ae5xqn4jW+O3YX5vJSEQW9aY5D655U3mukwECEMxBU8lNDxLksjHqgncqy5p8HrZ6TwcdBRxTqoD6C07Fq4jWfB/0eBIQnPr30akNtSwXHZnfKbCnjVZTwMZ5fvCekCLlayJwTEpvsSHBsKF00w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778419460; c=relaxed/simple;
	bh=UKUvPWdw9Hx92CT8hYP3MMb5CtQvUuY0/RMwz8+YKOY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=fou35LKdfzNWxApHgIITx1rPimONHX2ZwHee0KMpJfOfeTkxVVUOuf9QmwtTWE1eRvvsg33g2ZG8aZ4i3OZHHwToDA0ePrjeqB4C28Db4dGNNC41XgMSKv8pGKv9hoRUiu/FTDKKLktNhagqNsy5dplA0xAn7pBhbpTXJPe8FEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=202.108.3.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.39) with ESMTP
	id 6A0086CE00005B48; Sun, 10 May 2026 21:23:32 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 4701254792CC4EEAA909C659BD5C4BDF
X-SMAIL-UIID: 4701254792CC4EEAA909C659BD5C4BDF-20260510-212332
From: Zhang Yi <zhangyi@everest-semi.com>
To: broonie@kernel.org,
	tiwai@suse.com,
	linux-sound@vger.kernel.org
Cc: peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ckeepax@opensource.cirrus.com,
	vkoul@kernel.org,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH v13 6/6] soundwire: intel_auxdevice: Add es9356 to wake_capable_list
Date: Sun, 10 May 2026 21:23:21 +0800
Message-Id: <20260510132321.14687-7-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260510132321.14687-1-zhangyi@everest-semi.com>
References: <20260510132321.14687-1-zhangyi@everest-semi.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

Add es9356 to the wake_capable_list
because it can generate jack events whilst the bus is stopped

Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
---
 drivers/soundwire/intel_auxdevice.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soundwire/intel_auxdevice.c b/drivers/soundwire/intel_auxdevice.c
index ee951be15..0b8107bec 100644
--- a/drivers/soundwire/intel_auxdevice.c
+++ b/drivers/soundwire/intel_auxdevice.c
@@ -72,6 +72,7 @@ static struct wake_capable_part wake_capable_list[] = {
 	{0x025d, 0x717},
 	{0x025d, 0x721},
 	{0x025d, 0x722},
+	{0x04b3, 0x9356},
 };
 
 static bool is_wake_capable(struct sdw_slave *slave)
-- 
2.17.1

