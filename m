Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB307241CB7
	for <linux-sound@vger.kernel.org>; Wed,  8 Apr 2026 08:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775638598; cv=none; b=hWDPXhSpLJmf6AEM3EIRAOyWsr0Hrbu9wl+emWe6FIPSVMDor0uOSHIWbtcENpBEa3EldzDhXZa1CcAzxrYmEQON4w1I0+iNXL0SpDJcs/Q7MjB1AW58RR6ScobM0wfP2WgEG8iPi17e1U9W10GAlqdN4yTutQ+x/U2SMMq3w3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775638598; c=relaxed/simple;
	bh=1KkON8AtYHpf+x3c96HaBzyl0QGgD3IZrnD8bR1IV+g=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TpVef7EWbWhvw1kplbnUkPAarfB/oLfPkBaCadt1yzr9TL/ouJpmUtwoL3GFxNrEaGbYd+LCXPUBXm8WqiTxuxnf5o5KnhsO4RSNLPvFIidVcz9By4nM67HqhjFawnd4Vd3mgVCAFiXXRGRsMeWV1Riq7QXjmaHwzj81FXUrG8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=mJH202+3; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="mJH202+3"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6388uBMW12879571, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1775638571; bh=aqOpjcVkGGbCG3HS7yNHyXsPhBlEFCU8ZLITENcGdNI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=mJH202+30w7xXHvVD/X5DI3lmBasMy/Rgnnz13BqkRhlr2ns0H2VRbPt7st+QICRc
	 Qsw7GmvMhdtxut83QgyjhN8L/MQjneplcYR+TR+eWnyT0pOVG+PB2R8n0hUz5pay5w
	 ac4Ux31NbENo+V0Xpt+JfUK3SGxi+8unJSItQLc+A2nw6PGjOd0tYiQ/tF7E/bMznx
	 W2EJssTc8nYwkycvtNofUVIdf3FYNTBzhJ7K5Sx80LMlWW1HVjNZT4ZmJ/so6JivdW
	 I4r67ATX/ANcWdh7vB8yW8MoIV88hOcgfGdxkvDid33H5ApZWTVVxS12YuN8ZrsB3y
	 Xpk/tO6uQ521w==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.26/5.94) with ESMTPS id 6388uBMW12879571
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 8 Apr 2026 16:56:11 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 8 Apr 2026 16:56:10 +0800
Received: from sw-server.localdomain (172.24.54.4) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Wed, 8 Apr 2026 16:56:10 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <linux-sound@vger.kernel.org>, <lars@metafoo.de>, <flove@realtek.com>,
        <oder_chiou@realtek.com>, <jack.yu@realtek.com>,
        <derek.fang@realtek.com>, <ckeepax@opensource.cirrus.com>,
        Shuming Fan <shumingf@realtek.com>
Subject: [PATCH] ASoC: SDCA: restore the settings if power is lost during suspend
Date: Wed, 8 Apr 2026 16:56:07 +0800
Message-ID: <20260408085607.3813488-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Shuming Fan <shumingf@realtek.com>

We should restore the MIPI-defined registers when the device is attached.
If a function status interrupt occurs, the device will trigger an interrupt to reload the settings.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/sdca/sdca_class.c      |  4 ++++
 sound/soc/sdca/sdca_interrupts.c | 10 +++++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sdca/sdca_class.c b/sound/soc/sdca/sdca_class.c
index 7af4e5d1b347..d1feaa57eae7 100644
--- a/sound/soc/sdca/sdca_class.c
+++ b/sound/soc/sdca/sdca_class.c
@@ -49,6 +49,10 @@ static int class_sdw_update_status(struct sdw_slave *sdw, enum sdw_slave_status
 		drv->attached = true;
 
 		complete(&drv->device_attach);
+
+		/* resync the MIPI-defined registers if the device loses power */
+		regcache_mark_dirty(drv->dev_regmap);
+		regcache_sync(drv->dev_regmap);
 		break;
 	case SDW_SLAVE_UNATTACHED:
 		dev_dbg(drv->dev, "device detach\n");
diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interrupts.c
index 1838dabcdf60..ee69486e6b68 100644
--- a/sound/soc/sdca/sdca_interrupts.c
+++ b/sound/soc/sdca/sdca_interrupts.c
@@ -24,6 +24,7 @@
 #include <sound/sdca_interrupts.h>
 #include <sound/sdca_jack.h>
 #include <sound/sdca_ump.h>
+#include <sound/sdca_regmap.h>
 #include <sound/soc-component.h>
 #include <sound/soc.h>
 
@@ -121,7 +122,14 @@ static irqreturn_t function_status_handler(int irq, void *data)
 
 		switch (mask) {
 		case SDCA_CTL_ENTITY_0_FUNCTION_NEEDS_INITIALIZATION:
-			//FIXME: Add init writes
+			dev_info(dev, "%s function needs initialisation\n", interrupt->function->desc->name);
+			ret = sdca_regmap_write_init(dev, interrupt->device_regmap,
+					     interrupt->function);
+			if (ret)
+				return ret;
+			/* resync the function registers */
+			regcache_mark_dirty(interrupt->function_regmap);
+			regcache_sync(interrupt->function_regmap);
 			break;
 		case SDCA_CTL_ENTITY_0_FUNCTION_FAULT:
 			dev_err(dev, "function fault\n");
-- 
2.53.0

