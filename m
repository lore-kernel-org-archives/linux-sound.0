Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541545;
	b=rKcXKkBihGPst2FPZqJ1Ae0QN1dRKKpX94+1MG4iMTGUm7fqMrujtefkBhQQNNvalQ4v
	 dWPaX1s8WWR6GqVVoE3GZkc8T6YRavzE4VH8KooGLdzrgyP7nU3WEp66hFU6dmnKN9z8R
	 7tPXMksOatcl0WZpSTfhNnoD8ZEXuBegbJPv9oQvGNRdkH3XgKJrTYAtT0h3zwn/kqrsX
	 CCBT6zDPOv3VguMBBJwNKa0gvC2XZv+oP84vCeak9nEHzckseHb7CSvn/4eUITEuZZ1xL
	 GHOKYyfIlNm7KEfJZhI0G9NfXdNbo9GhscLZPrcdZKZkSaGXT+1tTEMdre+K4w7cUKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541545;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=mElIxptdta46/R9CCcDiVZtCz+nxON/yJk/P+Rr578s=;
	b=Y3e3nkk/T8hybuY6RVJPqrI+1aAhttn+9L8aHhRCFFLE1+Fn3uvbx/gt+bykmLb7jRAG
	 EKh12L3bMpwJ/TVo+m88tE/mmhELEhB4IfFo13Q2AkUb7upE1ouSwcJRXpGCrLUZyxwKC
	 CwSV0OKc9yfxvevueJfh5yJlAtVsdFBQ5Jl0vi1dnUkERZugO+pnFUldWvY4m6QPCK8L2
	 2Mzuwgl8SUXaNOVONLmbeOeaobOPvguuhBDtOfgoezbwXUNOeP+X1fuu302ohD5q/Ex2s
	 fNYNhEqOWrgcXeHmP2ct/fg7W5DuAL00VeVDeiQXsXnMCxXGP/UiJ/OiSehV7TQ0JDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=SYGXy5Ap;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E00606A323
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 17:32:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1E00606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=SYGXy5Ap
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-498f5fa5103so2880967f8f.2
        for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 09:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795541543; x=1796146343; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mElIxptdta46/R9CCcDiVZtCz+nxON/yJk/P+Rr578s=;
        b=SYGXy5Ap2u/X5/KQA7XPp07sMy5CgEguqu7FL08TXFm/hqOEQruZbw1hMZsKonEV/l
         HOJYbNxnnkiaXjP+iTfNjDb+tCtb8lgbQdlT1/bk2ppPOcgY4HXPs+bO+3wDsxDWhWvj
         /cRKaVH1hAR+hIFtV4glDO+OBWJNnMeebm8W5+O8SCZMkYZIiqkSlHqUi3SJRyCAaRPp
         hLgZlkjKz6wWatMVSQsiI/K+g7CDbHVlDU4m7f3Rw1ja3LW3xJHaotoAE+s9XGycvEiW
         nkysYRYQrV+Ed+F3/EwlLq+QkF+3oKt7Qbn9nhW+QRpJqvJN9FruCRU3crA1YArQm2j8
         AFIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541543; x=1796146343;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mElIxptdta46/R9CCcDiVZtCz+nxON/yJk/P+Rr578s=;
        b=BvZIYHxraIYDScRokYlW5ur+TgTRyt2Q0fIbeFZqToqpJE0+tkCVP15DcFWBN8xDAU
         HRYesj2AjrfET3dyMUS5EcOua6F4HLfayRGM+y16jJirLAcUXaIHsq0JrMPpIwS6PECB
         1iXf0oQ5h7FKlEs0p5FxlBO27dCkPUw+o2AQHYPIbhdfzrK6z7Xia9JYmeaQCP0FFUsA
         sGs878peHFFjW/MXBwU0RVbYe8X1WSK0XMsvqFhhEX6KBGWLMCSNbrwCpcBbNJE5cwX2
         V7mbBHSkPa3rxmuFv012tImG7KTgKPTJCDi7hfs7HNPz4+SBg1iyf5UfzhNDd1YnQvQa
         x5WQ==
X-Gm-Message-State: APuU4Z9sYTWWS4t+/ARAzrjQdgtvM8fdU+loAEZapKdWa/LtPmgsPXfu
	gajmi8uz9dayldksTalOe4n43fu1knAn17PHZF9AgLpmd9VUIKCOYrhsyCQZaP3PYiQ=
X-Gm-Gg: AZFdTZcZ44yTO2NdrgACDMkLRs9Bopqq/gGnngImu9wfWwTNCKlp9/9D0EExeerWGu+
	+1/vzBynLOJBslPKhjd8OGTxej77bXvGKL3dbKUxMBJEf/5WMtxEY9XggjoNLQlmmEePkZVgU5F
	h/2Gm6F8crPGyik89BiG3DnSigfzxjh7V8Xt/UA22E30JPrt2LBARnr5h7AqXpt/V9KZhNTGcHQ
	XleBkQKRrSBsksRV+AK6KUSTxn+ELaRwv7w7XppEhAYgr6zy0lEJshs+X3y3bhigZK6o2cbgTyB
	gw3qaP0IEKlxC0FYQmH71hkJIPs7jm4oYKDBv/XWyZEmn2I36HXfImiNZQbRM5Xketohu5JVeFX
	dxMXzDaxPXLO3Ier8iB5BfQuIBu5OQ74wFgeJ54heee7exb7AbDo4w5FcBi4gVxKy1QRNERod5H
	VeIMOBotTF3ktvDmS/G+S1E1d2C4GjNjwGfQZ47gaYufa437caL1t4Zt+2Wj1vBorKViMlhrtpZ
	hN/rBwYQ87Ltyo5q6eDSKkbfWAO2EDZmO81dKq/2yBXWXEJWl2GHIt7a9y8H5tjYO5M+v5cSCpv
	CXmdcWi4SdqBzvA9yLSqRuO1807megAFv8i0uoC6uQW8v8NJ2g==
X-Received: by 2002:adf:e197:0:b0:4a4:14db:233b with SMTP id ffacd0b85a97d-4abb3678774mr26445608f8f.12.1795541542844;
        Tue, 24 Nov 2026 09:32:22 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9add26sm29560057f8f.44.2026.11.24.09.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:32:22 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 24 Nov 2026 18:32:09 +0100
Subject: [PATCH v2 02/19] ASoC: qcom: lpass-platform: disable the RXTX & VA
 DMA interrupts on stop
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-topic-sm8650-el2-v2-2-174e159f0f69@linaro.org>
References: <20261124-topic-sm8650-el2-v2-0-174e159f0f69@linaro.org>
In-Reply-To: <20261124-topic-sm8650-el2-v2-0-174e159f0f69@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, 
 Venkata Prasad Potturu <quic_potturu@quicinc.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Rohit kumar <quic_rohkumar@quicinc.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2073;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=/fsIHu6LLX02EBqFrzxtmSXw80zjZLf2vPoqG7Eq77I=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBcoaUI+Ey3cpx0oclxJ0BXcgHjXP65kiip5bZsF4
 lAYCriyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawXKGgAKCRB33NvayMhJ0QQuD/
 9pJ9+7KRKgBDU43qgCv+lNJYfANeC2u/lWlHn7lj/L+rtHC1bC/dnwZ9MKq0FokNeYhOX3KkafaNBC
 JEnp4fIJSy8vMDejmTUsLiNTDm2xt2WG2kcf0YcyKS8v5LCIQnRdgYC9NyOsTZek1AkpvKQYW/AHN4
 sE/LUiXpldjN136fa4G9Hpz9nJAr9PU5wRQOEPlMxdIvb8rO08iQDfv1dzhrtyjp6X674F83QOD5Gc
 2WBm4rfbqbcDZ5GQ2z9djiBaijVzHUIuldz90XoFybzb1w8L70TyyXu63ePVE2RUeMuRc8FMp8kyOh
 uklsd8vrZ+NMKjCFtlaImyDaQr9KDVpnXA7qv/U+Q4B5tihQcG1s4zWkwYESgzrKZRMzCfU6BhW6qa
 RJvClCA1YStk+grQd7OFMb+VHK+EWHy/Loor9fU2gFuoKg3AY1SoPVVhe+wcuIdbqjH8uyQIBJk/6r
 +624C8vjUIToXwKU/Xfg7dPhUPZyLWNfrftTFaiNC+bm3zS1O84AmtBQTyKyDLnBDCzq2pKWhnbFKx
 6nSmMLOdRHOqDwt7ZoKzMMj+ntgYrHqvdFGCfyYs/EdUORbYB2gORzUfb1bKDcgYNvAaZOldcrPKli
 qApjQsl9XIWZbkw9CXE94le3TeSIMKUwsKNbPsfH5AT3YXA4Swwf5QcNAqrg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

On SNDRV_PCM_TRIGGER_STOP, SUSPEND and PAUSE_PUSH, the RXTX and VA codec
DMA cases set val_irqen to LPAIF_IRQ_ALL(ch), so the channel interrupts
are kept enabled instead of being disabled like for the MI2S and HDMI
DMAs. Once the stream is closed the substream is cleared, and the
interrupt handlers ignore the pending interrupts of the channel
without clearing them.

Disable the channel interrupts on stop, and drop the irq clear
register setup which is unused on stop.

Fixes: 7d7209557b67 ("ASoC: qcom: Add support for codec dma driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/sashiko-outbox-213518@kernel.org
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 sound/soc/qcom/lpass-platform.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
index dad4becf7579..9666049ae51b 100644
--- a/sound/soc/qcom/lpass-platform.c
+++ b/sound/soc/qcom/lpass-platform.c
@@ -814,12 +814,9 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
 				return ret;
 			}
 
-			reg_irqclr = LPAIF_RXTX_IRQCLEAR_REG(v, LPAIF_IRQ_PORT_HOST);
-			val_irqclr = LPAIF_IRQ_ALL(ch);
-
 			reg_irqen = LPAIF_RXTX_IRQEN_REG(v, LPAIF_IRQ_PORT_HOST);
 			val_mask = LPAIF_IRQ_ALL(ch);
-			val_irqen = LPAIF_IRQ_ALL(ch);
+			val_irqen = 0;
 			break;
 		case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX8:
 			ret = regmap_fields_write(dmactl->dyncclk, id, LPAIF_DMACTL_DYNCLK_OFF);
@@ -829,12 +826,9 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
 				return ret;
 			}
 
-			reg_irqclr = LPAIF_VA_IRQCLEAR_REG(v, LPAIF_IRQ_PORT_HOST);
-			val_irqclr = LPAIF_IRQ_ALL(ch);
-
 			reg_irqen = LPAIF_VA_IRQEN_REG(v, LPAIF_IRQ_PORT_HOST);
 			val_mask = LPAIF_IRQ_ALL(ch);
-			val_irqen = LPAIF_IRQ_ALL(ch);
+			val_irqen = 0;
 			break;
 		default:
 			dev_err(soc_runtime->dev, "%s: invalid %d interface\n", __func__, dai_id);

-- 
2.34.1

