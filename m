Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03D74B0482
	for <linux-sound@vger.kernel.org>; Tue, 11 Aug 2026 04:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786421971; cv=none; b=rFobkLMSzRMlG+QBwp6k93k263hvQhLOASY/qcQSzcyqOO+/kxeErQM+nIK0Zx4nQR0PSDtR829igAwxnjapGdn8AWpGmjHkaZt9h0ZiLQCKcGeLWLOy4R2EXstX45LfK03GoDrPXmtsFisGRr6sV4xtGnSDOorGTvEVUoYLNwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786421971; c=relaxed/simple;
	bh=A/y8oUcKsCVus3FDm2NGGocuq9CXc7JdSPJNEPouxbQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W0HRRo6ULpIszouB+3lankIfMZDNn4KwlCcNHxNoCqC3/oTOqWIvR1yzlX2V0AxQDhITGw31jDFcQtnYtzxl9fD74yx7fmaGPX5vJ65hzMCOsJSRslg4Ow0Srlx143YD/8WuwLsnP7CJUNmjUtwWRTrzJ3tyu08vJMLkoML9Yi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f9IiIzB/; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f9IiIzB/"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8ff88549786so23007726d6.3
        for <linux-sound@vger.kernel.org>; Mon, 10 Aug 2026 21:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786421969; x=1787026769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NQ4AHR12RwLrCgdGmnGTq8wGXGclyzo9C5spK5JZpWw=;
        b=f9IiIzB/VwlbEp2IS8EM5URa49DbMfGs51+4vX/1RgWnU1pyRMpSaz/aKxYuL0cggX
         1jZHC7RmAHKPVgmDKIWEPMlU2pN0x8ZecMgWLf6IY4CsF65P0PFxxHBwSdvLzU0IxBD/
         uWQQEh143EMmnLI6kg1yp05YYJBZLP+DYx0Azpcna3ZjWuhqSPzeaw73TVpwWdg1VGBH
         2ClesMHUuec9StK3KxlkFV5iArets5vAZaU8PHiQIaxc0/TDHL7TgLSNwtJbn766vYMP
         cETeFswuZxICSoxPD2m3tfmO27f3Euzi4es2pNj7NAZ/FFEIr8EUpao8Ww5o7gzWV+L2
         4D2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786421969; x=1787026769;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NQ4AHR12RwLrCgdGmnGTq8wGXGclyzo9C5spK5JZpWw=;
        b=N2suMl/YxjUIH7k+AQ2VU0axoNoXlxraVI1Av3xbgKbKTh8hKmqJXTmsn7MlSYnVLL
         LIrBBiqXbLfEa1P+nZ0DyCI5Rtf+O/l8/nE2AHM6AhuofOYmhp8oKrlm8ap9ZjiBc2vz
         rdI6o28NLsHVz821y78OZaBK62PjYS/ovWLkEfMFBFNi7/nJWR5GtSkO/O15KUV6yopp
         /jtbVkUZKYUE+/exbi7LGm+Q/lM4ec/veoezRxuijZrrceQpaZZMRWehqeWtwlxqyrHv
         GS7UOgAFf4ZPzryhkcpe9gHCSupLjFvMvPT7L83JIG6+jYHeB+wbMZGtYHUtVftEINAG
         zprA==
X-Gm-Message-State: AOJu0Yzyv81IfGyDJgaVYQ5/p0UDq2TmAzEO7bSwivg6Xm01mT8Amu+T
	baL1p7BFOBBmohxo2BxdJPuz4AyrxuTscAxZ4Ds1fZydMw1S3Frop7zr3yQIiw==
X-Gm-Gg: AR+sD11mHVwDTQiqjGOfPhl49jNhZYN2F35YOIGVxpzZmvl5p+lqbsqukry8MtEcDYH
	zfwvm3BOLHF7UDGB7mbbyGbNSdK1B0yLZUzaUqPIeaQf4JB5ntRy5fkMTmUz2/b9Li1RolIT+SG
	RA6elKpwfybOIJo8GZSH9jRv0WJmXUT2z7DErqGC0VoyQT3/WplrhvDhOt2xfkHCNiK7KepoykH
	aI8DgpFgWxQ1E8H5X3mIbn08XyZEgHFzojJz130TFYNvEY77SFDm7QdcmZ31IcdbU38tC6F3FNV
	9RHNyU0mf01TVSI/aWD16xnvhtwzOL0ehuT1yn0b9o80ClqUm08/t+O+YdHFUo6g+/JHi99QU/V
	C9wVlP2EtAJ0/Eo4m4VGEJiCtRdJ7hvUhSTA+F/wolYvF8qy7G+CzPV8jurVxknYffh0qj0mXI7
	0GcHysYODepCL7XsMYdrmzEyenLoBiRDzh37G/oQ8GRKACCrDI0AsDFnhtQn5Q67ddOZh5kSIiQ
	sOKPXHA24KD6MOmBh9S7iFX48EDA0WWG1/4jZEF6CS/9xuaOMsU/gdTNE6s2+nQwzjT+ncnV/X4
	583tZZaqwIwAxG3ZGX0dLDcSybpKYlGOV2wn1w==
X-Received: by 2002:a05:6214:5789:b0:908:2369:df1c with SMTP id 6a1803df08f44-90a66df31b3mr3294426d6.20.1786421968875;
        Mon, 10 Aug 2026 21:19:28 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90a66491b2bsm1730006d6.11.2026.08.10.21.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 21:19:28 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ASoC: amd: acp: pass audio_drv_data to dma_irq_handler
Date: Mon, 10 Aug 2026 21:19:25 -0700
Message-ID: <20260811041925.25016-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The IRQ handler only needs the audio_drv_data, so pass it directly
as the request_irq argument instead of the device pointer and a
dev_get_drvdata() lookup.

Assisted-by: opencode:deepseek-v4-flash-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 sound/soc/amd/acp-pcm-dma.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/amd/acp-pcm-dma.c b/sound/soc/amd/acp-pcm-dma.c
index e99588458ed8..60d5799c26f0 100644
--- a/sound/soc/amd/acp-pcm-dma.c
+++ b/sound/soc/amd/acp-pcm-dma.c
@@ -692,12 +692,10 @@ static irqreturn_t dma_irq_handler(int irq, void *arg)
 {
 	u16 dscr_idx;
 	u32 intr_flag, ext_intr_status;
-	struct audio_drv_data *irq_data;
+	struct audio_drv_data *irq_data = arg;
 	void __iomem *acp_mmio;
-	struct device *dev = arg;
 	bool valid_irq = false;
 
-	irq_data = dev_get_drvdata(dev);
 	acp_mmio = irq_data->acp_mmio;
 
 	ext_intr_status = acp_reg_read(acp_mmio, mmACP_EXTERNAL_INTR_STAT);
@@ -1295,7 +1293,7 @@ static int acp_audio_probe(struct platform_device *pdev)
 		return irq;
 
 	status = devm_request_irq(&pdev->dev, irq, dma_irq_handler,
-				  0, "ACP_IRQ", &pdev->dev);
+				  0, "ACP_IRQ", audio_drv_data);
 	if (status) {
 		dev_err(&pdev->dev, "ACP IRQ request failed\n");
 		return status;
-- 
2.55.0

