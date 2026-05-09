Received: from r3-129.sinamail.sina.com.cn (r3-129.sinamail.sina.com.cn [202.108.3.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300033A168E
	for <linux-sound@vger.kernel.org>; Sat,  9 May 2026 10:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778321626; cv=none; b=s+OLZR6mkeyGEktXrq79SEPZ6BM1nzrZSWs9zORI8B9NkgouxEGOPYPjs1TUw1h3Slx/4NOWbwf4u/OO7VPObytj4Mnhw3fPWwENgbXMka7VgJkIfD+PCnlZZz7JW/Ke24D71nGlR0mimvLzYgQ8r+xSerepcDpYlnjo7KqKVUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778321626; c=relaxed/simple;
	bh=UKUvPWdw9Hx92CT8hYP3MMb5CtQvUuY0/RMwz8+YKOY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=ce2yK/n9aG1E9dg9FLArJEwRGnKkbWKjY9JpMHaYXaCUkxNje+n1CbcGnzUyPRpy01dyZElJdi+/O7F/48hUNBgmn7ckO7yDEP4hj3KENyNyz8fFcj+qr55p1hYs39IIWAl65ZR87bgOOoe+1TIg3lyJO+yKnLHXwIe6MeB8tVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=202.108.3.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.36) with ESMTP
	id 69FF08380000082F; Sat, 9 May 2026 18:11:12 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 1579DE51120F4C0CB75438BFE3936CE4
X-SMAIL-UIID: 1579DE51120F4C0CB75438BFE3936CE4-20260509-181112
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
Subject: [PATCH v12 6/6] soundwire: intel_auxdevice: Add es9356 to wake_capable_list
Date: Sat,  9 May 2026 18:11:02 +0800
Message-Id: <20260509101102.10286-7-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260509101102.10286-1-zhangyi@everest-semi.com>
References: <20260509101102.10286-1-zhangyi@everest-semi.com>
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

