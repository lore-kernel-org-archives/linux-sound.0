Received: from r3-55.sinamail.sina.com.cn (r3-55.sinamail.sina.com.cn [202.108.3.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02553CEB9B
	for <linux-sound@vger.kernel.org>; Thu, 14 May 2026 07:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778745292; cv=none; b=Eal+qu/rP2ioA42Kzdkax0X3MNF0zLGFoxbMv/MD91e3bndDX2nomhyuMkmXjSmgtCH2UnmWTIL12cfcXXl8rVh9+wDCIf2M1x9n1aHcrrvd2i3rDOQHooLTlAvL3WrUH19vQrBVFeFOMxirrlebqKL7ZkihbF519g3TacHM6L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778745292; c=relaxed/simple;
	bh=UKUvPWdw9Hx92CT8hYP3MMb5CtQvUuY0/RMwz8+YKOY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=cCALBtdmcgV6+06laQCBHP5PfBArjkB03Fjz5vM95GHZAYRVmIbKufU2kLYRcYx7UTpooRkV/AMfdFMy94yd8X5rH01fLq5DRlANUMv/NdcaMudMZu7zODX2RKwcq+MCbxkjNoHTu7+5VUC8CzCX1iWxuHxndm3ZBaBK1AgL3m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=202.108.3.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.38) with ESMTP
	id 6A057F2A0000134F; Thu, 14 May 2026 15:52:16 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 34260593C11249F2A4F9A87282036A60
X-SMAIL-UIID: 34260593C11249F2A4F9A87282036A60-20260514-155216
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
Subject: [PATCH v15 6/6] soundwire: intel_auxdevice: Add es9356 to wake_capable_list
Date: Thu, 14 May 2026 15:52:06 +0800
Message-Id: <20260514075206.3483-7-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260514075206.3483-1-zhangyi@everest-semi.com>
References: <20260514075206.3483-1-zhangyi@everest-semi.com>
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

