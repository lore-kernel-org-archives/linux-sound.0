Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793153196;
	b=nCOwF2N0wi216EnfrZeSwYKLrLgGLfoYtHIWT5ISwPjmNSwoa6uCIL0ZW63Q3ZO6yOiU
	 sXmaVW/v5t9sIHktZ1HI7lW6+8fcPgp7ZjNQuF/zpa6OZkcIsRHwII3nhUWddhfigh3Oc
	 hvgbj7AvJ9GaJdA6fgj4nWBo6Bt3pmwP0ziZoCX+tOpK2tzVKYAi745Ey7i47qaAXkyZH
	 y0FwFVzoobinxIPkYAIQ/y7Cdz/ugWs0NmvqQEHwtqm6nJuXtRBtyJn+doUaeeI1bAzEG
	 5QsdTZPRpA2CA8Pcprk2aD567HQBGDrmM9QV65QgpvX5bN3EmthlQknpUWkbyleKN+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793153196;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GC6lbURWrV0PPIXFUIsyNS3MQsIzOZGBfVC0cBwffgo=;
	b=m7QJ7I4nLAekCl+DfAeI+2rqoiAp/Ur0w74qOQp1tEc+lJUj3rY+YEGoWPU/JwDQrNbk
	 f5/XhtJAkl2y1iaHcPt5nYKmNmEp1k7cAqogcZ4RP9cXz7awEvoPpW3zGVv/yy8PV3HDM
	 LPaT1t9gH4zm44i7u0sA3hED+q85iC3J8KwPwzgg2nzdcyWGO+Al6D4Jiv2W2ctAQD3EJ
	 3ytTVVc9Cm5DosnFcpTmSDtx4Fomw3nlOUbCuim4DIdTmwQuUh9BH6hLi6oFIe9ga+49O
	 iFPFZ/o60geEWKw8aMaJc3fktSdEWjgF1dzl17imeWTpiNDtMNpa8FTHCEJeMsYYQnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0k9Aghok;
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC01D606A31F
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 02:06:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC01D606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0k9Aghok
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-84621d8c7aaso243545a34.2
        for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 19:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793153195; x=1793757995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GC6lbURWrV0PPIXFUIsyNS3MQsIzOZGBfVC0cBwffgo=;
        b=0k9AghokUG0gZgSW03YSDaJGq6Zy8wlnHPDgB36KlKsXDvy9VGYMECfn35LidHtVP2
         h0V+7DX6/t/9vhFRCrYkJcZYhsDDQkDH83cBoIFBP+RBcNgAbmDekdQIABn1Qh3PVN1P
         mxnLnIw2jYcrpE4ggnxJyA54ajays2Vhum/iWJgNbPMAbndjvUcKAyl9QUoFRdB3uOfJ
         wplxpdE2n5DKz2ruSDN0v8EwWsz4Yjd+ddVqiKYx37LZE5MvkeyzhPNZug3hzXFOK/ul
         p0I09omEXXFjNsGYlUyGQHZOnqclbKZUAaOZfKCZ/kc7nfORyifqwJKkilqKj7JDYnr4
         J66Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793153195; x=1793757995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GC6lbURWrV0PPIXFUIsyNS3MQsIzOZGBfVC0cBwffgo=;
        b=zt7p4+F9LqdFc7vFsD3EQwPLbASahHn2+7+BVL/4T0w3AQXc6byGl20szIpiWD1muY
         q2KOFP+dlxkEELw2aBRe9ONLzMn2GeEyLA+7H+qq0qdTMCuCUyGwYK58blXma6wCkinG
         /E61kX/h2+eQWMPhEKT4Rh1gbSLjWi2jxrgmxRC+jxyi9stproFUM8B3FcXR8r7AETDr
         brI6i19Eu8phOlL3T91lnfJiEf+ZRMIIEtjvkUgudlMPKTsLOXIuM+CoNOm5nDaWvRIM
         WaMxvBYXGdY9GnIwRZJlHHUT3xHUsWaXWcFogS+/FzcvnmroVJ9jLfjwYxLulZ6ADiNa
         7Evw==
X-Gm-Message-State: AFq9FYKxq2AXUuhzfIvi5Uh/26lpkreoTlMGLAYOuGvmcewU/WI0CYEk
	vqJsmj252ROzwBxMMrFjpBowoCQtUpSNbj3tv/s7QZcYSs0h6F9CSafG
X-Gm-Gg: AYBFou1vj1NqSm08eKMhUNHxfWW15uJmXlSGtFUxBO9wLyZQX1dNuxydcokAKdyEStk
	5lk7qK1L6ORo3csTxNLUPjEdXhdldNg+oawNap3EW0fUDbSBiJ47P4UcbmjLfyKKWjxr3F6Dlye
	m5U/iIMuF2g5iErZmWr8aWOT0ocdbdi6cxUG3C53xE+qyHOJO1pIN+NvSdhMm2KCkqME5S8xi9M
	8AW2bfJeWr8maL8l2UvJh6JGmIKUcEruJrCqqMKUgefXT2I6VGjt4+ImnW4CV81ltQSZKXQIpgM
	02edkUDv4bQmjuTmU9kTdVS3y6yTZ9Ws2CFNAxQVAl+KdQ4EESpyij9DAer5deHI82MFCwdCjQI
	L27Cc1ibTJwkL0yedtuuQ00Ld3MsvvLbzo9TOXOhUAey2JJNRGouIW+5X6M2QDwFm+igAbcyBh7
	dNJCDHkJQL0yaSsJzqG5/VAfuFa6VU4BSDfK1Yb6rmRJI0hpBE0Zs/Ji76MB0d1vBqcx9uoAki+
	bcEWWAliV/sSUg1bG3AJf8i+3g5kfq0JoztbJ2iBL4/6Y1IpexMdrztZTs5Pf4i6cu8JYipWsjO
	5dvMBPoA4aenQsEO7K0o3peuyMjdFvCo0X2NBYAwVneIsZyGhDLrHPC17s+CD0W72usFWe7gghl
	TxBbh5Aain95OQPbP5oPFGg==
X-Received: by 2002:a05:6830:7199:b0:81d:6a2a:7db0 with SMTP id 46e09a7af769-85ac0bed1a5mr968895a34.23.1793153194657;
        Tue, 27 Oct 2026 19:06:34 -0700 (PDT)
Received: from localhost.localdomain (162-233-222-157.lightspeed.livnmi.sbcglobal.net. [162.233.222.157])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85b1d363390sm355217a34.1.2026.10.27.19.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 19:06:33 -0700 (PDT)
From: Corey Smith <corsmith@gmail.com>
To: corsmith@gmail.com,
	Vijendar.Mukunda@amd.com,
	venkataprasad.potturu@amd.com
Cc: linux-sound@vger.kernel.org
Subject: [PATCH 10/11] ASoC: amd: ps: harden the ACP interrupt path for ACP6x
Date: Tue, 27 Oct 2026 22:05:51 -0400
Message-ID: <20261028020552.35278-11-corsmith@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028020552.35278-1-corsmith@gmail.com>
References: <20261028020552.35278-1-corsmith@gmail.com>
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

The ACP PCI interrupt is requested before create_acp63_platform_devs()
populates adata->sdw, adata->pdm_dev and adata->sdw_dma_dev, while
acp63_irq_handler() unconditionally dereferences those pointers as soon
as the corresponding bit is set in ACP_EXTERNAL_INTR_STAT/_STAT1.

This was harmless on the ACP6.3 boards the driver was written for, but
on ACP6x the interrupt status/control register layout differs, so a
pending interrupt can be served while the device pointers are still
NULL. Because it happens in interrupt context that is a fatal exception
and panics the kernel on boot.

 - only walk adata->sdw when it is non-NULL;
 - only use adata->pdm_dev when it is non-NULL;
 - only dispatch the SoundWire DMA handler once adata->sdw_dma_dev
   exists;
 - treat ACP6x like ACP6.3 in check_and_handle_sdw_dma_irq() so the DMA
   interrupt status is recorded for the Rembrandt link as well.

Assisted-by: LLM
Signed-off-by: Corey Smith <corsmith@gmail.com>
---
 sound/soc/amd/ps/pci-ps.c | 44 ++++++++++++++++++++++++++++-----------
 1 file changed, 32 insertions(+), 12 deletions(-)

diff --git a/sound/soc/amd/ps/pci-ps.c b/sound/soc/amd/ps/pci-ps.c
index a8032b5..569af08 100644
--- a/sound/soc/amd/ps/pci-ps.c
+++ b/sound/soc/amd/ps/pci-ps.c
@@ -112,6 +112,8 @@ static short int check_and_handle_sdw_dma_irq(struct acp63_dev_data *adata, u32
 					break;
 				}
 				switch (adata->acp_rev) {
+				case ACP6X_PCI_REV:
+				case ACP6XR_PCI_REV:
 				case ACP63_PCI_REV:
 					adata->acp63_sdw0_dma_intr_stat[stream_id] = 1;
 					break;
@@ -126,6 +128,8 @@ static short int check_and_handle_sdw_dma_irq(struct acp63_dev_data *adata, u32
 		}
 	}
 	switch (adata->acp_rev) {
+	case ACP6X_PCI_REV:
+	case ACP6XR_PCI_REV:
 	case ACP63_PCI_REV:
 		if (ext_intr_stat1 & ACP63_P1_AUDIO1_RX_THRESHOLD) {
 			writel(ACP63_P1_AUDIO1_RX_THRESHOLD,
@@ -209,18 +213,28 @@ static irqreturn_t acp63_irq_handler(int irq, void *dev_id)
 	ext_intr_stat = readl(adata->acp63_base + ACP_EXTERNAL_INTR_STAT);
 	if (ext_intr_stat & ACP_SDW0_STAT) {
 		writel(ACP_SDW0_STAT, adata->acp63_base + ACP_EXTERNAL_INTR_STAT);
-		amd_manager = dev_get_drvdata(&adata->sdw->pdev[0]->dev);
-		if (amd_manager)
-			schedule_work(&amd_manager->amd_sdw_irq_thread);
+		/*
+		 * The handler may run before the SoundWire manager devices
+		 * have been created (shared IRQ lines can fire as soon as
+		 * they are registered, and the ACP interrupts are enabled by
+		 * acp_hw_init() before create_acp63_platform_devs() runs).
+		 */
+		if (adata->sdw) {
+			amd_manager = dev_get_drvdata(&adata->sdw->pdev[0]->dev);
+			if (amd_manager)
+				schedule_work(&amd_manager->amd_sdw_irq_thread);
+		}
 		irq_flag = 1;
 	}
 
 	ext_intr_stat1 = readl(adata->acp63_base + ACP_EXTERNAL_INTR_STAT1);
 	if (ext_intr_stat1 & ACP_SDW1_STAT) {
 		writel(ACP_SDW1_STAT, adata->acp63_base + ACP_EXTERNAL_INTR_STAT1);
-		amd_manager = dev_get_drvdata(&adata->sdw->pdev[1]->dev);
-		if (amd_manager)
-			schedule_work(&amd_manager->amd_sdw_irq_thread);
+		if (adata->sdw) {
+			amd_manager = dev_get_drvdata(&adata->sdw->pdev[1]->dev);
+			if (amd_manager)
+				schedule_work(&amd_manager->amd_sdw_irq_thread);
+		}
 		irq_flag = 1;
 	}
 
@@ -237,16 +251,22 @@ static irqreturn_t acp63_irq_handler(int irq, void *dev_id)
 		wake_irq_flag = check_and_handle_acp70_sdw_wake_irq(adata);
 
 	if (ext_intr_stat & BIT(PDM_DMA_STAT)) {
-		ps_pdm_data = dev_get_drvdata(&adata->pdm_dev->dev);
 		writel(BIT(PDM_DMA_STAT), adata->acp63_base + ACP_EXTERNAL_INTR_STAT);
-		if (ps_pdm_data->capture_stream)
-			snd_pcm_period_elapsed(ps_pdm_data->capture_stream);
+		if (adata->pdm_dev) {
+			ps_pdm_data = dev_get_drvdata(&adata->pdm_dev->dev);
+			if (ps_pdm_data && ps_pdm_data->capture_stream)
+				snd_pcm_period_elapsed(ps_pdm_data->capture_stream);
+		}
 		irq_flag = 1;
 	}
 
-	sdw_dma_irq_flag = check_and_handle_sdw_dma_irq(adata, ext_intr_stat, ext_intr_stat1);
-	if (sdw_dma_irq_flag)
-		return IRQ_WAKE_THREAD;
+	/* The SoundWire DMA device may not exist yet during probe */
+	if (adata->sdw_dma_dev) {
+		sdw_dma_irq_flag = check_and_handle_sdw_dma_irq(adata, ext_intr_stat,
+								ext_intr_stat1);
+		if (sdw_dma_irq_flag)
+			return IRQ_WAKE_THREAD;
+	}
 
 	if (irq_flag || wake_irq_flag)
 		return IRQ_HANDLED;
-- 
2.56.0

