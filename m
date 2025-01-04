Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8769A1D5CE5
	for <linux-sound@vger.kernel.org>; Sat,  4 Jan 2025 20:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736024088; cv=none; b=HyN/sOBmqgHTEuB68i/K34HPX1QZw8S+UUX+sPEsfCeBGckNWTCNtXNqYB5esUDsmRTRH38qSxFkvJTT/r9EaX5nNGhbYZwOZoe3+8YaiGWB/8W5vJsv9mUvxIeSmhW7ExH5mS5vQzcmiHuNYRct9ItJxKzpe4Z6T+/q9lRnlv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736024088; c=relaxed/simple;
	bh=0pluUhxj+qHekDTaDHHUWfvMX4R8WWXSMErhdppVD4I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OAVwO8p7dR3P2MPPm3GmXWIVt2FPMx1VcWMSN/nJngjrqKaCBc8GDYN/vECEwC/TiTnY1fw6u2sj1vb2cxTc32o2W0s0JT5qq6jTfH8NTjj57T781mv/FVPUK6B9E175Cqe4TEG3qKUyCoPtu1j9YzRnPQ3tbhz5axh+Vn9CbQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IpKWDkAi; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IpKWDkAi"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5d3e5c225aaso2819969a12.3
        for <linux-sound@vger.kernel.org>; Sat, 04 Jan 2025 12:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736024084; x=1736628884; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XLKX/DDFIRPvx5t6DaUjc92tk+3Aa7daTr762N5Ifkc=;
        b=IpKWDkAiY/Ttys+LjWLoxLoHZDs+pi3cu980+RD7Xi7kdylySfQRse2ik28rGbBCut
         wcIgmbbWU4pPHlHpYtGwTOBfgpgUo927OxMNebTOEJJYm0/JCBICliRZiRylZawj4c+k
         TYQ9Z8pTgn23p/mhZAip2AyGuPOSO5n6qWiD05YVgCyuX9/Cnu7JBxy31Gc9GoLSO7ez
         QyfLeJKYv2h3GnrWFHmav/NWnl8SP3zCipd5KTPwLU7NaX9vQeYRWcyoJ4HrL4GeuyUJ
         bMDbRyjnFzVNEqL16q1Dn1Bh4z98C/9mHvrFhwgcgZTIan+r9j0jq7pXsVrnkhVSpyiT
         fUqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736024084; x=1736628884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XLKX/DDFIRPvx5t6DaUjc92tk+3Aa7daTr762N5Ifkc=;
        b=pdNB0VcZCEAkdxlrag2cDewU1i+xj68obYmHeCUndATNX0L/s65xueWFegD9ksILHj
         sL3i/3NMkAXgZUp+JhoO4V6EiN4CQAIPV1IBnEoaaWdfWEu0iKs2VkNl6xvEdbMvAh9C
         llNbXd/pQObjybM1A2oLArLYYdOVkP4MNiVWAsDINi3QCBYdFz4lViM6e8RefJvDcYpD
         0pn/H94AEHVcKzntuwskvhnaLrsX5ITmvu8X1Dec0vbgdpIz+5GC9inio5esOPheRDPP
         WmScInWas5bDQopLkEmWqCtJ4Kw2MrWBAs0WqI6+TjqOd4Gu0giyd6RQQSM2LU8/nTAT
         oxQA==
X-Forwarded-Encrypted: i=1; AJvYcCUWRf+P0h/fyiXVQXJ61uOy4Lnf7h6QLWKZuBtVPaVUDk8WQNQZymxFQRbmaPQJtXy/tB/ZSVqofsTtFA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzINnjrmx+q/zpAoM7DAmo5BrFgCKC0yuoggRXPLT/2NhfyQAHu
	vkm1hopDKwHO7MhSdLBKfnHEFPJWzJXvZ+2HRODuW0syMaQfgqSecWFMt0mJedM=
X-Gm-Gg: ASbGncuH/pyLApWUxBIShSS6rnFtyGzpBoSzikHh8wq+5fD+0j/hTYLTr6S6htGo+xT
	PEMzC8RxjDKrv/zuW+HQ4FsC6qavVhp45kYWvBrZj75Rhs7Tews/1Ke2YgaTXuBvpFpWrcL/MtY
	xikqsk7yNryl+UYRk/jHYBTaOa3Wl70Wz1w47R35h23VBzMmNbOSvgnM+waLxOj3peYe/G/fm9f
	he46fgehkZXzDNOA/tBaFzTw7pWxTEpJKtz3oy8/4pS7cZR6n3YiWsdxweC1HZB1KPh2zs=
X-Google-Smtp-Source: AGHT+IFmkhn29wqYEMmrNGScq5CXWT6m6SapSyW0XiDfeMVUzsZXK4EWiuoixIVsOEwexnWV5pkkww==
X-Received: by 2002:a17:907:6d1f:b0:aa5:a60:ad6a with SMTP id a640c23a62f3a-aac2d4472c8mr1834711266b.8.1736024083242;
        Sat, 04 Jan 2025 12:54:43 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aaf4a841749sm839666666b.137.2025.01.04.12.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 12:54:42 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Mark Brown <broonie@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/4] spi: atmel-quadspi: Fix printed error code during DMA setup
Date: Sat,  4 Jan 2025 21:54:35 +0100
Message-ID: <20250104205437.184782-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250104205437.184782-1-krzysztof.kozlowski@linaro.org>
References: <20250104205437.184782-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On dma_request_chan() failure driver NULL-ifies the 'rx_chan' and
immediately uses it as PTR_ERR() so dev_err_probe() prints incorrect
error code.  Rework the code so proper error code will be printed and
NULL-ifying of 'rx_chan' will happen in common error handling block
(failure of DMA setup is not fatal for the driver and further code
depends on 'rx_chan' being non-NULL for DMA operations).

Reported by Smatch:
  drivers/spi/atmel-quadspi.c:1287 atmel_qspi_dma_init() warn: passing zero to 'PTR_ERR'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/spi/atmel-quadspi.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/atmel-quadspi.c b/drivers/spi/atmel-quadspi.c
index d135cca4e454..057bc20a74ce 100644
--- a/drivers/spi/atmel-quadspi.c
+++ b/drivers/spi/atmel-quadspi.c
@@ -1283,9 +1283,9 @@ static int atmel_qspi_dma_init(struct spi_controller *ctrl)
 
 	aq->rx_chan = dma_request_chan(&aq->pdev->dev, "rx");
 	if (IS_ERR(aq->rx_chan)) {
-		aq->rx_chan = NULL;
-		return dev_err_probe(&aq->pdev->dev, PTR_ERR(aq->rx_chan),
-				     "RX DMA channel is not available\n");
+		ret = dev_err_probe(&aq->pdev->dev, PTR_ERR(aq->rx_chan),
+				    "RX DMA channel is not available\n");
+		goto null_rx_chan;
 	}
 
 	aq->tx_chan = dma_request_chan(&aq->pdev->dev, "tx");
@@ -1306,8 +1306,9 @@ static int atmel_qspi_dma_init(struct spi_controller *ctrl)
 
 release_rx_chan:
 	dma_release_channel(aq->rx_chan);
-	aq->rx_chan = NULL;
 	aq->tx_chan = NULL;
+null_rx_chan:
+	aq->rx_chan = NULL;
 	return ret;
 }
 
-- 
2.43.0

