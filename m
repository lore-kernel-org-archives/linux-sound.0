Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794304643;
	b=NK0sTTibytJNXpyYh0vT9ULtYfe8WTEZvx2Nmf44c7V7W53X9lOMXc0kYZNqx5nKXXMh
	 kWDIh03G/Gyp/LT8esiXzmtkyeghct+rn6SmDCW4c3z7KFvvIkIlDDF2sMmkyu5K4d1+F
	 FxoqNA0dm2TXGjuVMiFsDoLc87wrbJ44Oq6WmU59jSe08OCTxrKS1zK5v57VJ0f9ZEhN3
	 h+/+WeLyp+070Ka3KP3+SCt0sH6NUqlRtNDadk1TFRCG/Rfkzqv72zU52JNjcZwyhjnn1
	 309NSkmB3P7IdYiey0x3DTBcNK0XYTw6Ux+LT07aT/E0CfkIQc/jLfjL0Er0jsmDr3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794304643;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+Prg47iXD919tYCgVMOQ6+zwqLgIY/fyOVcPOF91tfY=;
	b=imJqp3M0Zex4LHq0yZ+xCU7qeWEcua8EfjKBvi44gWtfLhKOEFRStxDG16jS1VRFU307
	 XqTOprUTvo/qyjk2+mTW+xoDeatHnCr+H1ju3JXkRxdYP5W0mxk2uH26sgVY1ofmdBYAe
	 kvFleUbqGdDTq/O1GmeOxSclS98Ld4VMcFrt9NEeVWy5YUEnlBnzOOXRtcOX60ueOLOAs
	 pNkxhIcruOZIMDKduUUzwRWq2/YEmn1IUsjUkUKzlJlddfV2g+KAGdqFjpEQ7ekjGXaJE
	 GDlmnfzDtWk3qB3CljnSU5YkH+qR825nBSqKFscIY/LRp2UYeZTwUPl2ZgTwoCiK4qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=edWE7KND;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4E2606A929
	for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 09:57:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD4E2606A929
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=edWE7KND
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-15dd124bbe7so2174020c88.1
        for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 01:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794304642; x=1794909442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+Prg47iXD919tYCgVMOQ6+zwqLgIY/fyOVcPOF91tfY=;
        b=edWE7KND3B6QGpko8/W3B9RsuOX87YlGKLwatgFylw5xfU5EF65tCuzv+vSR7zFL64
         MsJEknrCUvoSDPYFS+c3uSG7f4PsAIR5FgsYbAkM38I73UOfpfh8nULxehU+UbUECFXy
         Xd5maBC5kbjrKUpIG3q3ZpQ1aLVr0mPlqv7HTDow/w3nHstjV2JgribRIuo+QCjHPq/i
         XDzGhM9kuIaKc1Bfq7+4hjrQKwUKZ9aMoUnYCcNWzGbdM1dMT5i2xNdMMlKYIjACFGI+
         7eIS796E9IqwMCkc6Zt6uid/AzoLM4tdF39bDdl11oBRqJpV7m/urWs2D1ShzFHovfgE
         Ba5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794304642; x=1794909442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+Prg47iXD919tYCgVMOQ6+zwqLgIY/fyOVcPOF91tfY=;
        b=Wo+GB//xkgpeEe+VhYnqxsiYaDvouRFc3TW4K8jv6Po7smif0BhDT9Nf1om1pCDcPy
         9zet+QI+V6/XBcUFPzkIUzQvtPmbyO+cmR7aTZnqukGirFkkBQi+wf3jtgU4rBqPTPTz
         ZGYDLsDjen/gUrLV46ctBvHa0fifM6KuirW3XyUdPrQgEoNmzlry3OqwS4+j7bgBCLjM
         nUkaRC4ti/NOT1rb1yypkQAM45CbAfmjPWpw7nLJerigNqD+5mhTMmQhi6Pl+g2523ww
         3ZhF0xWXCsJkoQrHBBK9endES8igPFAIyT+XEUV7SmmypughBEu562OE5v828LnsdJwS
         5qMw==
X-Forwarded-Encrypted: i=1; AL+hErEk0VfVHXBy7yA5cdV92UxVA0CwO/DH1O/g/9aTqWFq6QVTYoGX428lG4yWrC5LNeeOSX6nzo4PyQb6gw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9n6NWDMWrIQSbkqJFsBFIfDBURch34zenzUlmGw7SHynuGxd6X
	eFHVttq6pzLcH8YYCDMiE5eR1kEsD5oCRL7xAtyfYo0ei7r/RH21kxjX
X-Gm-Gg: AYBFou2u1vgWN2E8+TzdCei9tvY+uSeV3Z9cE6jMspPrk/SJUFzvHly6XtZq5i2fzHV
	/yJDQfGLA1WlXRDDXUwpi+wc5NcDcxxMouFno4m/6D451Lwz93Hg4x8swFbgC3aOd/he/yAGOqj
	i8HrIJ4NZ5r88/2UmbuzwegHRxTA+P/gfwKXaHK3K9fhogIE0AoLvrC94n2rk0wZ3CmPvRI/vCN
	cED1KJgeZyR3K/VPUZvSdMYstALIGtzUNr49aGP5jIVIPyKDhR5/amKCVC9T9FQsLs9pBvvCh8l
	fvWC07hPrZlu4m1TEXgX0DoQkLmKnOEI1HukZrRhEWJ6f4KDIXE0C86IXRH/fny1sJYLeCzdcjm
	CbnMY8fR/JFSYJE8PVO9olLUfQ7nCJRw8INsc0XIJRX1BGPVaVL6zypI8gLm91uEB3UCgrl4UFj
	KApFRbQ/8HPRnmPFSHj+cuMPwZNsSicooG/0SuGMBaURi7No6waqVPdn/FfeV316suUZfyWgYCW
	r/x7+zaOWVidxToB14vKqzMvV/Db94nYL2GnYUaU4cMREsY3VWRGRmQwDOpiWHFNstOnYlhvRSi
	lwKajxoCNHPDRw5kY+yfQeRaAWomzL4rMnd8Y+exJgoqyZsmC1rC9EJPScpB1m5KIfbwsMR6qSy
	xBMmXm94oOYoWJm/rJw/JW13h8pqglCO4vukEDFNsGSQb
X-Received: by 2002:a05:701b:291b:b0:13e:5a50:1e17 with SMTP id a92af1059eb24-1b3b5fa8f4amr2584323c88.3.1794304641806;
        Tue, 10 Nov 2026 01:57:21 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b75d42sm5203801c88.20.2026.11.10.01.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:57:21 -0800 (PST)
From: phucduc.bui@gmail.com
To: Maxim Kochetkov <fido_max@inbox.ru>,
	Andrew Jackson <Andrew.Jackson@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: Tim Bird <tim.bird@sony.com>,
	Yuri Zaporozhets <yuriz@vodafonemail.de>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 6/6] ASoC: dwc: Remove redundant error messages
Date: Tue, 10 Nov 2026 16:55:25 +0700
Message-ID: <20261110095525.504660-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110095525.504660-1-phucduc.bui@gmail.com>
References: <20261110095525.504660-1-phucduc.bui@gmail.com>
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

The underlying functions already report these errors deeper in
the call chain, making the additional dev_err_probe() and
dev_err() calls unnecessary.

Also fix the indentation of the affected code and correct a typo
in the DAI format error message.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Add the indentation and typo fixes to this commit.

 sound/soc/dwc/dwc-i2s.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/sound/soc/dwc/dwc-i2s.c b/sound/soc/dwc/dwc-i2s.c
index 0d2be2d8d31a..d09cf1cd07f4 100644
--- a/sound/soc/dwc/dwc-i2s.c
+++ b/sound/soc/dwc/dwc-i2s.c
@@ -331,7 +331,7 @@ static int dw_i2s_hw_params(struct snd_pcm_substream *substream,
 			}
 		} else {
 			u32 bitclk = config->sample_rate *
-					config->data_width * 2;
+				     config->data_width * 2;
 			if (dev->tdm_slots)
 				bitclk = config->sample_rate *
 					 config->data_width * dev->tdm_slots;
@@ -417,7 +417,7 @@ static int dw_i2s_set_fmt(struct snd_soc_dai *cpu_dai, unsigned int fmt)
 		dev->frame_offset = 0;
 		break;
 	default:
-		dev_err(dev->dev, "DAI format unsupported");
+		dev_err(dev->dev, "DAI format unsupported\n");
 		return -EINVAL;
 	}
 
@@ -752,7 +752,7 @@ static int jh7110_i2s_crg_master_init(struct dw_i2s_dev *dev)
 
 	ret = clk_bulk_get(dev->dev, ARRAY_SIZE(clks), clks);
 	if (ret)
-		return dev_err_probe(dev->dev, ret, "failed to get i2s clocks\n");
+		return ret;
 
 	mclk = clks[0].clk;
 	mclk_ext = clks[1].clk;
@@ -830,7 +830,7 @@ static int jh7110_i2s_crg_slave_init(struct dw_i2s_dev *dev)
 
 	ret = clk_bulk_get(dev->dev, ARRAY_SIZE(clks), clks);
 	if (ret)
-		return dev_err_probe(dev->dev, ret, "failed to get i2s clocks\n");
+		return ret;
 
 	mclk = clks[0].clk;
 	mclk_ext = clks[1].clk;
@@ -966,10 +966,8 @@ static int dw_i2s_probe(struct platform_device *pdev)
 	if (irq > 0) {
 		ret = devm_request_irq(&pdev->dev, irq, i2s_irq_handler, 0,
 				pdev->name, dev);
-		if (ret < 0) {
-			dev_err(&pdev->dev, "failed to request irq\n");
+		if (ret < 0)
 			goto err_assert_reset;
-		}
 	}
 
 	dev->i2s_reg_comp1 = I2S_COMP_PARAM_1;
@@ -1010,10 +1008,8 @@ static int dw_i2s_probe(struct platform_device *pdev)
 	dev_set_drvdata(&pdev->dev, dev);
 	ret = devm_snd_soc_register_component(&pdev->dev, &dw_i2s_component,
 					 dw_i2s_dai, 1);
-	if (ret != 0) {
-		dev_err(&pdev->dev, "not able to register dai\n");
+	if (ret)
 		goto err_assert_reset;
-	}
 
 	if (!pdata || dev->is_jh7110) {
 		if (irq >= 0) {
-- 
2.43.0

