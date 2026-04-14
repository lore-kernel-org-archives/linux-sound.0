Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6CC370D5A
	for <linux-sound@vger.kernel.org>; Tue, 14 Apr 2026 07:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776150917; cv=none; b=D4wuyTYb/sB3jOb7irQa4BAx+4W0TpaenfGkAqs5qGCLMKsvbYWwSwfAdth5vLbEtCjlg33UbE1d7xOryCxjHPpJt7oL18tO3gJW4d7lntcQ5RrcSuYfTpMZnAzWK9a7pAICzLvCZ82qQ4hYDsrJi5IKm7PXkmnJiDjmcWKe5zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776150917; c=relaxed/simple;
	bh=m6IgMLX6OT4wRBXE+qDKIiv1EV5rYiq1+WXKhEwOSMo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CfsirtZyWY3kEtk+fkP6qLMO1ZIldENuvbCCjabMifxyTmB7hXKHOjEewWW/Q6L4BHPKAJhya34qx9pMRYvCwJekvOesqGp11We6bmEhaj5tYFo4kuVr4C6vlz9BMcaliv2g92Mv7V7HcQYdD8ho4VepC2AthDc4cV3m7JWsvFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=Mplj3vYT; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="Mplj3vYT"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 63E7EkiW61583921, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1776150886; bh=vS+UKlzMpKIZtFZQHwLOqk/Pfl4N4ALavRgvymbGaaQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=Mplj3vYTEUoKZtrcNrXxQsRT6r38gBTzBqqwkhrBSrLpbRlsfVrj71/paLjEOkVso
	 LxdgHqg7FQBcRtyC6AasArJrnQG+7cucItCJWjzGIQU9sE8aOKSIA7u67+M4vVGksm
	 IrqinYkGzx5xoTatI4kMV3UJzVBjdkojTRHFYfm05yGMNpI0hUw9WvW+zSvQEohFPE
	 Om2ILGJG1ykNuCiUf/viMkGWVctqf+OIX4FGjnaRNqBDl/oKc+31fCqyJdE+IAK/0c
	 Nc2ruaR8kmUO5OJEr3pvKOdr+Pykrd8HVm5xlwqinN36N8wCyB1bY18rSCx1hpo8sW
	 gAsDJ0X8QELtw==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.26/5.94) with ESMTPS id 63E7EkiW61583921
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Apr 2026 15:14:46 +0800
Received: from RTKEXHMBS01.realtek.com.tw (172.21.6.40) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 14 Apr 2026 15:14:46 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS01.realtek.com.tw (172.21.6.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 14 Apr 2026 15:14:44 +0800
Received: from sw-server.localdomain (172.24.54.4) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Tue, 14 Apr 2026 15:14:44 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <linux-sound@vger.kernel.org>, <lars@metafoo.de>, <flove@realtek.com>,
        <oder_chiou@realtek.com>, <jack.yu@realtek.com>,
        <derek.fang@realtek.com>, Shuming Fan <shumingf@realtek.com>,
        kernel test robot <lkp@intel.com>,
        "Dan
 Carpenter" <error27@gmail.com>
Subject: [PATCH] ASoC: rt1320: fix the warning 'rae_fw' from request_firmware() not released
Date: Tue, 14 Apr 2026 15:14:41 +0800
Message-ID: <20260414071441.1524039-1-shumingf@realtek.com>
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

New smatch warnings:
sound/soc/codecs/rt1320-sdw.c:1575 rt1320_rae_load() warn: 'rae_fw' from
request_firmware() not released on lines: 1575.

Fixes: 22937af75abb ("ASoC: rt1320: support RAE parameters loading")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <error27@gmail.com>
Closes: https://lore.kernel.org/r/202604111548.EL450PMb-lkp@intel.com/
Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt1320-sdw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/rt1320-sdw.c b/sound/soc/codecs/rt1320-sdw.c
index b0aeeab26bd9..192faa431b5e 100644
--- a/sound/soc/codecs/rt1320-sdw.c
+++ b/sound/soc/codecs/rt1320-sdw.c
@@ -1498,6 +1498,7 @@ static int rt1320_rae_load(struct rt1320_sdw_priv *rt1320)
 		}
 		if (!retry && !(value & 0x40)) {
 			dev_err(dev, "%s: RAE is not ready to load\n", __func__);
+			release_firmware(rae_fw);
 			return -ETIMEDOUT;
 		}
 
-- 
2.53.0

