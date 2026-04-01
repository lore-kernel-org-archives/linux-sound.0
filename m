Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4AA6A001;
	Wed,  1 Apr 2026 05:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775021470; cv=none; b=WU0V0EcNahTeCC4pccel0BGHyAggq17lzZQ9fOHoX+ifo5lWNRgs+xTnW5zX6vujcMQI2NaMYedRbfGArGdC6OLw7Pk1xNyLC42LmmgLdsqaKdwDec2VsembATVvzMj+59STDStMwl7drc2HWcmB2fdSKSWG9uz29PzP07Xzltg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775021470; c=relaxed/simple;
	bh=GEJxngQTRJwBUusIKO6SYLAjikYbCdV54I7Sv+Wmk7o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ISJolm1XdR81HhnlQqRnTA9QmFZX/9dKI6Opdex+2gRm2s/Ej+YZpLy53fwSP5/GpiuFqVBDi6CX8C+rr2FVqfUNbi+t2lmWJwKghRrdenBsVyx8f3LdnqDcTFiySuRUXDHJEp0VyGxOcJJVqcaGCmGJtgTEFJJ52s4KLx16g8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn; spf=pass smtp.mailfrom=isrc.iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isrc.iscas.ac.cn
Received: from localhost.localdomain (unknown [36.112.3.223])
	by APP-01 (Coremail) with SMTP id qwCowAA34m2LrcxpWi7UCw--.2635S2;
	Wed, 01 Apr 2026 13:30:53 +0800 (CST)
From: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-sound@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Subject: [PATCH] ASoC: mxs-sgtl5000: disable MCLK on error paths of mxs_sgtl5000_probe()
Date: Wed,  1 Apr 2026 13:30:51 +0800
Message-Id: <20260401053051.586290-1-lihaoxiang@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowAA34m2LrcxpWi7UCw--.2635S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZw4xGrWDtFW7uF1xCryDWrg_yoWfXrgEya
	yxu34DXry5KryfCr9rurWYvFy8Wws2ya1xGr1ftr4UJ3sxJa98XayDJrs8ury8Zw4vga4x
	Zr1UuFs2grWSgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb3xFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr
	1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
	AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
	IF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
	IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvf
	C2KfnxnUUI43ZEXa7VUbGQ6JUUUUU==
X-CM-SenderInfo: 5olkt0x0ld0ww6lv2u4olvutnvoduhdfq/1tbiBwoEE2nMj+FgJAAAsV

Call mxs_saif_put_mclk() to disable MCLK on error
paths of mxs_sgtl5000_probe().

Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
---
 sound/soc/mxs/mxs-sgtl5000.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mxs/mxs-sgtl5000.c b/sound/soc/mxs/mxs-sgtl5000.c
index 245f17411638..f1c0e612313d 100644
--- a/sound/soc/mxs/mxs-sgtl5000.c
+++ b/sound/soc/mxs/mxs-sgtl5000.c
@@ -157,13 +157,16 @@ static int mxs_sgtl5000_probe(struct platform_device *pdev)
 		if (ret) {
 			dev_err(&pdev->dev, "failed to parse audio-routing (%d)\n",
 				ret);
+			mxs_saif_put_mclk(0);
 			return ret;
 		}
 	}
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
-	if (ret)
+	if (ret) {
+		mxs_saif_put_mclk(0);
 		return dev_err_probe(&pdev->dev, ret, "snd_soc_register_card failed\n");
+	}
 
 	return 0;
 }
-- 
2.25.1

