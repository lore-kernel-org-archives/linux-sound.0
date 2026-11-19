Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795075143;
	b=HKuE2MbxGJ9+k6zPhHYJNjXYrd8Ji09kkLkJ315fLoaBdMQoHmHfdbY1Gx32Hb+50K4J
	 DXMzgB3HPEESI/mGrB2ne62KqF1nrsDz3rcXmXDvLaGPw49V16lcMRJZ+xz0ttvYoTED9
	 eVWEHOrHTSjdCIGi8PcvzsYLi/8+n8Whs25WtYJ96zG6GjohUBxstzcfxQNyMf5ZpBMuT
	 e1QKUT2gfVR0sXV2bYyn6yBp6JuZtkezVHFB13Dj1ihTY/wkdwVfdWYguM2+lAIcDapqH
	 euH1oc8pNtIUNg03aYVmG8YQFhVHa+/KSSyoe2Hy4hrJtILNZzLPbAL9olPDpFmZr/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795075143;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mzu8amryRTLQ7iFgxxnW5v3u453btZzqGFBejZZvoAM=;
	b=HnETfG+sIDChSuZrBv1tTWcEHV4qhw+MtyirwEbDTYZDDMNIp373IIyjKqFNrGw1znlX
	 nBgL8xypBRhAgS1mU4VbzwEb1am73x2y2na/rOKbbInQW6pEqY+wBYXngsFuBMYVGBQlO
	 wIxEurPMbiexsCN8oqfkRQPwNbU+L3t91V9F0QV3iy3Q2ox2Zj3yvw0n6LM/7ilglgNHR
	 NZMfoGRi0rbeygjnudrB6RRo/qSO51WWYThk5eWHgoS/PuJoiEgl/yloiFj7tZQdg1yeJ
	 WJT7GqztURtYyH1XKP1Nn5Q1GB6l/4P79L8e4zpgciZaFHRN1r8twlsz3aE7C6fwyFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b="tx/zadWA";
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79346606A320;
	Thu, 19 Nov 2026 07:59:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79346606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=tx/zadWA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=tx/zadWAhjBefcm8uMm1hfMcBOjdsCQLmD69G6cfchRTgIWw3Z+Jv30BNvZ5ZZUdTh1+I4bBjnzUj
	 PkXY3uY8+XqAE/DdCEyJogJhq7bakZdGqTaT6q7Jq0FW1sXdF4BO0Y1mp4Bv+7u6JM2a22IxVNDB90
	 bhuLEs+7POzPQ3qo=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app05-12005 (RichMail) with SMTP id 2ee56afeac4406b-18c1e;
	Thu, 19 Nov 2026 15:59:00 +0800 (CST)
X-RM-TRANSID:2ee56afeac4406b-18c1e
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr04-12004 (RichMail) with SMTP id 2ee46afeac42ea7-f5a0b;
	Thu, 19 Nov 2026 15:59:00 +0800 (CST)
X-RM-TRANSID:2ee46afeac42ea7-f5a0b
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	arnaud.pouliquen@foss.st.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH] ASoC: sti: uniperif: Propagate the IRQ lookup error
Date: Thu, 19 Nov 2026 15:58:59 +0800
Message-ID: <20261119075859.50201-1-zhujun2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.51.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The uniperipheral driver converts any error from platform_get_irq()
to -ENXIO. This also masks -EPROBE_DEFER when an interrupt provider
is not ready, preventing the device core from retrying probe.

Return the error from platform_get_irq() directly.

Fixes: f3bd847eb0a7 ("ASoC: sti: Add uniperipheral dai driver")
Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 sound/soc/sti/sti_uniperif.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sti/sti_uniperif.c b/sound/soc/sti/sti_uniperif.c
index 3fbd9fee94ac..d30d5b3efad6 100644
--- a/sound/soc/sti/sti_uniperif.c
+++ b/sound/soc/sti/sti_uniperif.c
@@ -425,7 +425,7 @@ static int sti_uniperiph_cpu_dai_of(struct device_node *node,
 
 	uni->irq = platform_get_irq(priv->pdev, 0);
 	if (uni->irq < 0)
-		return -ENXIO;
+		return uni->irq;
 
 	uni->type = dev_data->type;
 


