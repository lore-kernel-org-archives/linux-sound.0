Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794546496;
	b=JJ4QY4qQpZrHRJuvZeSincbYucgKrh+zCt1qb95LpnZlaRtqyhmh+szS1Z9T2lhtwA+P
	 ITX825zF0RyPo3FsRDTBcWBAcSAM2Yz259UIFT9WAOMNSxpqiDb5cFcTLVS/Wm5mXzazQ
	 ui2azMphTm51isn05FmO5ZSGKljwdU5Bccrmfm+gT9XxrvXaUddogP2N8jPTOnB4HKeCb
	 0CaanNpXqTCU8pU9OFsNKMRKQz5DJ75U02JO1aD4DPJNRg0qG/t/ooMpcLUZP9RE7Vv3y
	 tcxnNqrDQHUkEAoJXLdhx8hp4dJrLvy4e5itWC11np878Yl1ZOP3Oh5PCqkHt+om5Rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794546496;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=y2Z4k53MZ5CuMtRn2UaTr841R9J/LmSKA80BVWLhtkM=;
	b=M2TYSmG0amDos5rzacveoVrVyvhV/JmJxPNlV7XtAKAp8aZxpKSC5tMc5ou5jQc8y5a+
	 m1Qe1P+vzWrU40XHYKwN1fMY3VS2z6a2qZGoU7xjgX7Sv1CyUBgIrfjyosgrFSGJ/Uglg
	 9CLZH+EgYYN4u2Ws22cZ1ws13CAmHJEQJPRQMIBKwVvmOfc6NblU93YVM/cIDAW2fkqR3
	 YGi6jOxplfw9AuMFZsALB/fL3pkxNZTdRahWYN9pikfSdadpC31HyG+0pyFe53HhTUUxm
	 YRpbMRwoavJ3K1jwHMS6F4B/YWbfDAfPefUy4+pY+DTBInbTcZx9/CbwcFxkDtm5X/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ozhh4yE4;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32B5606A884
	for <linux-sound@vger.kernel.org>; Fri, 13 Nov 2026 05:08:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E32B5606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ozhh4yE4
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b08cf16decso208676a91.0
        for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 21:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794546495; x=1795151295; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y2Z4k53MZ5CuMtRn2UaTr841R9J/LmSKA80BVWLhtkM=;
        b=Ozhh4yE4xo7QHwq1nFhvF+f0cR3+WjSSDcswjfCng7uQevZwAR0znFcEb28kxS2o54
         JgH6EOUfmsFox6PIk3HAJVes16+DxKw9uthpB3za9j+RMbzvV0jalEfEWSemx9n98Ehv
         0xYgK2KjW2QgEA+63yQRVnn54xz2JSr2GnDhIqsM4By9nvQlriljnYxz636146S9kgwV
         oVptKl9GMCHpDmIStbVX3DIwQ/LRcUFX4K9HnX+Crq88gNAHLdz+WEWnDGf2rKiGXcOe
         QcFwGeUOjJz9OEgn8Wj8igvOm21sCCSB2jmF63EEov4YFtg9A5mCwoNur//+ybN+w53A
         q/Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794546495; x=1795151295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y2Z4k53MZ5CuMtRn2UaTr841R9J/LmSKA80BVWLhtkM=;
        b=HCvknHtbsHn7jS4k/9gRRL4PO8tzp0b5ImBSG3+ALgWn33+8wAxk4MSxO/xfQnO6UN
         pRs6yGiuzzoscIkJyObcDUts//xNBFeDC0x0/TnTmwVsxGQCtvfoog8ADoamMwKtmdht
         z70wpSeehVOOTGE7odoZtFdcuKntLcl/GeY6K/BJL1842yQRr3REFi7dK6Cg0rjGVMes
         m9bqRLK7wIZN2CJ4kxP3wgLfE4xej0Q/ICfF1gIFIGeR2ofrl9GJMyDpvPWAbRmLOxNy
         FDoodrbJcRpqloOhyAwwAcM2Ta6MJ4gDFb+iVue9mPFad2882Emh3gcNDERFQ3aP2daC
         d32w==
X-Forwarded-Encrypted: i=1; AL+hErEhyLiaUZr1hhz5dLbe5JuORhT5IIG8jHF+pLV5ArjUTE1dgIClsfX4kIpUpguWSTCgk1n8njJnKGmLdQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9gDkvVm7BOvz66h9+mZN0NSdxklqZavh9dLvxl38mFF2cM46U7
	J2TMBjxhS1OFzUSgAjBU136596pxqAZh2ku8S6jHujVRRxdLbyD69J8P
X-Gm-Gg: AYBFou2lU6b5HCIkWIbN+Us9pug6MEyGqloHFWN9lVCha+67tapAUU5saamd41hzEi9
	nwy0gXkIvv9PNptdNw3wy0Rn7SlLKhfmd0Uq1u+dWDiQOJjZVKEBPVR5IGAJYrsCCr7UKVYmJxk
	vfGdSU2YmrUy2LuMcIeoQzPQEzF6TTIB1ztMxvRfs1+7elJtuVeX3oQwsLbWubyyq1tIKGnCcFm
	jqEGGTqwqC10inub1HAKivkMCO5T/nYalshP2QD4/KUvZTIXAkh0LAVz+HJH29Zeg/+0ABydSwK
	mgKGo4riGkuAi8buytw6+GtbPVXoX21BGvWSHubNChVFengdqk9caXZy141rtoWNHpiIyETkrlm
	Ld971bz5OZpt2I+f+NGioMQ/HHKP+SEOiJ/uyrbdtGvPNc60QPFIvSapVtLEBjk75ETv0MQ9OxD
	lo+wWP4APT6MNy0d47hgGw1gGVA1RDVDTSGkHIE+2y9L08JqIiazdjltCLTT5H0kVxWh3R/06+H
	pET08HWGq+5nbQBDpz8ASQmh9sVt6oz8wiQE19y93HSTvOHhQAvJKs6c8g9bkV/hpZiu6/cktNO
	o8wQLplulH2Q2SR/rt4VnvQHdAXwukJDUddMhVKcOgw1yEmlD4+Snx/B/nIwn703hoHv6mxB9Ns
	qbSjxttydzfmZ/fQ7tn6apQoqATK9kz+IzKoqAJFGivGe
X-Received: by 2002:a17:90b:3f8c:b0:39e:59a0:46b5 with SMTP id 98e67ed59e1d1-3b1b0b48069mr1373982a91.24.1794546494954;
        Thu, 12 Nov 2026 21:08:14 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d35525sm7643420a91.16.2026.11.12.21.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 21:08:14 -0800 (PST)
From: phucduc.bui@gmail.com
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 4/6] ASoC: fsl_asrc: Request the IRQ after the device is initialized
Date: Fri, 13 Nov 2026 12:07:25 +0700
Message-ID: <20261113050727.14053-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261113050727.14053-1-phucduc.bui@gmail.com>
References: <20261113050727.14053-1-phucduc.bui@gmail.com>
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

From: bui duc phuc <phucduc.bui@gmail.com>

Request the IRQ after fsl_asrc_init(), while the device is still
runtime active, so that the interrupt handler cannot run before
the device is initialized.

If requesting the IRQ fails, balance the runtime PM usage count
before proceeding with cleanup.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/fsl_asrc.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index f7ac60724c6c..c97f814d7358 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -1299,11 +1299,6 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
-	ret = devm_request_irq(&pdev->dev, irq, fsl_asrc_isr, 0,
-			       dev_name(&pdev->dev), asrc);
-	if (ret)
-		return ret;
-
 	asrc->mem_clk = devm_clk_get(&pdev->dev, "mem");
 	if (IS_ERR(asrc->mem_clk))
 		return dev_err_probe(&pdev->dev, PTR_ERR(asrc->mem_clk),
@@ -1436,6 +1431,14 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 		goto err_pm_get_sync;
 	}
 
+	/* Request the IRQ only once the device is initialized */
+	ret = devm_request_irq(&pdev->dev, irq, fsl_asrc_isr, 0,
+			       dev_name(&pdev->dev), asrc);
+	if (ret) {
+		pm_runtime_put_noidle(&pdev->dev);
+		goto err_pm_get_sync;
+	}
+
 	ret = pm_runtime_put_sync(&pdev->dev);
 	if (ret < 0 && ret != -ENOSYS)
 		goto err_pm_get_sync;
-- 
2.43.0

