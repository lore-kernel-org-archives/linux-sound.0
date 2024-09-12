Received: from cmccmta2.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94B92374F6;
	Thu, 12 Sep 2024 08:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.22.67.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726130498; cv=none; b=S29NGxOD0xLEdr7kpxGGzUBsxla51XZB7EcLVpfQRYBwk2OReI8ngvT3bSkEGCsmIUG8jjLt7yquNxc6rPoA75nkDqmjORaXSRcyYePZDfa9nGYfUltMmtqtGNFJaMfS+Z4idIz7TOoA1w/t9enY5gdb5Gf7aM3/zM3H2xKn0M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726130498; c=relaxed/simple;
	bh=+DKLSP0MvsMhI6h64oCKIrUKdGEGRs6425dLehcwljw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eUmL3dM8PSsLuAQOqt4dhVTrtgTMiSES0pLft828cPWaGStxq1baTrdJaE83eJrIe/AZ1QSjBR0aHKdZsp3Ds+7tPI2AXh5y5xIJQ1Y0foQeK24nYK2qJSAWvmXI+12KvT6zNSOY4CX85NI4++q6/xWnKZjCNeel91H8KxGQapc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com; spf=pass smtp.mailfrom=cmss.chinamobile.com; arc=none smtp.client-ip=111.22.67.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app05-12005 (RichMail) with SMTP id 2ee566e2a93856f-27572;
	Thu, 12 Sep 2024 16:41:29 +0800 (CST)
X-RM-TRANSID:2ee566e2a93856f-27572
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from localhost.localdomain (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr02-12002 (RichMail) with SMTP id 2ee266e2a9270f4-17bd1;
	Thu, 12 Sep 2024 16:41:29 +0800 (CST)
X-RM-TRANSID:2ee266e2a9270f4-17bd1
From: Tang Bin <tangbin@cmss.chinamobile.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Tang Bin <tangbin@cmss.chinamobile.com>
Subject: [PATCH v2] ASoC: mediatek: mt7986-afe-pcm: Remove redundant error message
Date: Thu, 12 Sep 2024 16:41:10 +0800
Message-Id: <20240912084110.1854-1-tangbin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the function mt7986_afe_pcm_dev_probe, when get irq
failed, the function platform_get_irq() logs an error
message, so remove redundant one here.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
---
Changes from v1
- clarify the commit titie.
---
 sound/soc/mediatek/mt7986/mt7986-afe-pcm.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt7986/mt7986-afe-pcm.c b/sound/soc/mediatek/mt7986/mt7986-afe-pcm.c
index d400bea0e..7db090414 100644
--- a/sound/soc/mediatek/mt7986/mt7986-afe-pcm.c
+++ b/sound/soc/mediatek/mt7986/mt7986-afe-pcm.c
@@ -529,10 +529,9 @@ static int mt7986_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	/* request irq */
 	irq_id = platform_get_irq(pdev, 0);
-	if (irq_id < 0) {
-		ret = irq_id;
-		return dev_err_probe(dev, ret, "No irq found\n");
-	}
+	if (irq_id < 0)
+		return irq_id;
+
 	ret = devm_request_irq(dev, irq_id, mt7986_afe_irq_handler,
 			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
 	if (ret)
-- 
2.33.0



