Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BAA30E85D
	for <linux-sound@vger.kernel.org>; Thu, 27 Aug 2026 07:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787816559; cv=none; b=FJU4BGUR/0748kKnG+YPQB+1LcPDAPmShTc8hfLnWJMu1orNWiFKRJem4a2sMLHotZJ0RvprDZ+aWs1U8Y0Li3kEqLeyY96/J2k3B/HRi9sXllqPCQTPj+HFKzCduIqlOqSAdPer4WZae1ol1b964Aln+WwBPuDTJ4aOhmRYkFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787816559; c=relaxed/simple;
	bh=CnCzMx65H3QywXWvDpWLqQRfNLH+hGE7pv4YENAeH+A=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=La8Gj8VA0Xq2xdgmx/Rj17NNyLRwSqWpzFVndoSBfIIVvXLhLBCqkMhXJu98PzG0nha6BQVLjDG2rbwMnEmiQCbJmKHWgTIt7VWbgQb7xZ6XnXSnhfYQW++39jkvUEP/s+EEmfBfUD4L8s2PfFQHEg9NjHomLi98rRQSNxgPQUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=HzvY/UB6; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="HzvY/UB6"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 67R7g3tiD1342828, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1787816523; bh=zxUt7BrNDpP0WHmRzfWmxHQzFmBWYsmYEJ2+TdXApyc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=HzvY/UB6kRocnq1ytKzZcSoLI52wr8eDRU451LrzVv8SBtAicGgzKHl7+bKt5VWCW
	 6TwwuDh+/hRLm9Tiq0CJVi+CJTts/HrfbOddYgYGGqxBIx5QhFYlepJiEliR9DJNBo
	 Xh/31yLLj0A8LPZrA9/Hqqf6zVB9VAJxqT69mZzapxxBWt4LqUSHq2KNnDLYa3KVx1
	 4KJFGkvW4HicunUPVwZXUpivmYvArREkVNpOmuhiUpOruV2BxI3sqABa7qsiRli2RQ
	 VkSr0YQ98JEf/iDprTecOcJrYQiEzHWOgxdDz+V2lrxxZihNMZiJfRyD6iL9+GnW7r
	 cRUtVSKjVQmJQ==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 67R7g3tiD1342828
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 27 Aug 2026 15:42:03 +0800
Received: from RTKEXHMBS01.realtek.com.tw (172.21.6.40) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 27 Aug 2026 15:42:01 +0800
Received: from RTKEXHMBS04.realtek.com.tw (10.21.1.54) by
 RTKEXHMBS01.realtek.com.tw (172.21.6.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 27 Aug 2026 15:42:01 +0800
Received: from sw-server.localdomain (172.24.54.4) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server id
 15.2.2562.43 via Frontend Transport; Thu, 27 Aug 2026 15:42:00 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <linux-sound@vger.kernel.org>, <lars@metafoo.de>, <flove@realtek.com>,
	<oder_chiou@realtek.com>, <jack.yu@realtek.com>, <derek.fang@realtek.com>,
	Shuming Fan <shumingf@realtek.com>
Subject: [PATCH] ASoC: rt766: fix the warnings: unmet direct dependencies detected for SND_SOC_SDCA_HID
Date: Thu, 27 Aug 2026 15:41:55 +0800
Message-ID: <20260827074155.3938361-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Shuming Fan <shumingf@realtek.com>

This patch fixs the kconfig warnings from the kernel test robot.

| Fixes: b50ecf5873df ("ASoC: rt766: add RT766/RT767 SDCA driver")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes:
| https://lore.kernel.org/oe-kbuild-all/202608262153.rOQYkmOr-lkp@intel.com/

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index f9a47e262a77..caa24d48c1ac 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -1990,6 +1990,7 @@ config SND_SOC_RT766_SDCA_SDW
 	tristate "Realtek RT766 SDCA Codec - SDW"
 	depends on SOUNDWIRE
 	depends on SND_SOC_SDCA
+	depends on HID
 	select SND_SOC_SDCA_HID
 	select SND_SOC_SDCA_IRQ
 	select REGMAP_SOUNDWIRE
-- 
2.54.0

