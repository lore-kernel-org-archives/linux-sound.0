Received: from r3-51.sinamail.sina.com.cn (r3-51.sinamail.sina.com.cn [202.108.3.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547992DC783
	for <linux-sound@vger.kernel.org>; Wed, 13 May 2026 03:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778642208; cv=none; b=K0ZF0BIBaKKcp8Z4mbT3v3hu/t3G2gk+R3O24nvVsNHQZToe10P354RzXBZ7jdECM2PLeI+WRn7T38MQt5M7w1IDODWjFxvaPXUS0S3ynjS9vvlv4JSrr3UrKQbHSr0Apr1aCd8w6JGMEbTkLZkKJgYxASOlhFs8CjizoBxMGUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778642208; c=relaxed/simple;
	bh=UKUvPWdw9Hx92CT8hYP3MMb5CtQvUuY0/RMwz8+YKOY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=HGm3E2+Dd2KgAdEiOOo8ebUZGoe3YnHjvAv99YSHfT+vxgFrGWy533IfWgSBmmXhEqEjwSmmmCUfcCl8Fs2lkQYXTXDhAdqNbHQ6RhSMo686D1OkMeC+ZJukJI9FV2qWxAi+NkPkEZcUb+GVXzJ09sh+LPOl3X0fcc0+M6XdL4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=202.108.3.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.37) with ESMTP
	id 6A03ECEF00004B68; Wed, 13 May 2026 11:16:06 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 248C10204E374CCD940793C1E18D3611
X-SMAIL-UIID: 248C10204E374CCD940793C1E18D3611-20260513-111606
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
Subject: [PATCH v14 6/6] soundwire: intel_auxdevice: Add es9356 to wake_capable_list
Date: Wed, 13 May 2026 11:15:54 +0800
Message-Id: <20260513031554.5422-7-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260513031554.5422-1-zhangyi@everest-semi.com>
References: <20260513031554.5422-1-zhangyi@everest-semi.com>
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

