Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541546;
	b=1rr/qd1yT3NpaHzYqy9dBT17SlU2V3+dPSai/sFzbrYnbbt336Uxrd8MKD/iWc2s2bbG
	 Ji8DfIHK/4lhGL5MNd1AfQHcPVRjn1TamUEP9KIbXvQWHoJAEYix6sjzj9TWnUMu1u6AS
	 kQn4gbwbVgaVnRZokWNBhHQapUKcJjsye93y4BYcL0T0QU7fCspLFCWJyedgKIzzURztA
	 w6LodDS5AdczMFZdk0Q4C2KtU6g2reLV68WjMYL6jS7O2PmLL0cvtFZxYTjlO/DUO/mRG
	 B9VV9UCxTBQGC0hZVeWMg4GlsPLMDPLPVcuEp1nehMrJJGWxHAnXK79uHzNmrsxe0+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541546;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=E1l3muk9mvj2eUO9vG6GnMDOjISfB3yngVtzlHm1Fos=;
	b=JXPBAoQ5OYe5a5ArzkUZphv5IsGm1ReJ7IY30q/vgHvJiN3/a4blLhzW0uwzht2pGjKZ
	 BPgGdwmBZVVcKGWuOKEiuNqOBiDPcKkfuFRAmCGVqUDo9h4KWz4kEz97A5vbdYxftp2Nm
	 MLNPBNkqA4DBJKdDhGYyA36fZ7C6S0/imaPZeIDrYdHSFgJNz5ZeeUEFV8oazXGi7AeWQ
	 5EPgzY1EPN9szbujxIPe4GM3QWp1BsbGgQFMbEPE0gFT/YT2nlUUvty8BuOrCII0j8HKe
	 FJrVMimkpTnPSc+8SeKv96bZ39KxoQz1aK5KcjM2p8dsqx5vGUR3MGYBbxtiOYvfQcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=IxTmaRZg;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6313606A680
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 17:32:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6313606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=IxTmaRZg
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so3134283f8f.3
        for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 09:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795541542; x=1796146342; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E1l3muk9mvj2eUO9vG6GnMDOjISfB3yngVtzlHm1Fos=;
        b=IxTmaRZgx+ZSGfKjB08NNxSE4z8CKY+0a07wlhzAV/It6ahQYSo4BSx4x0MBkr/l7L
         SkgSoOiETlXP9D4ZVqjCpjHZaglxA4fBQ/PDbpLc0bPV0iqbkp8WJhC16z0QdIlNwL+F
         5V3ih7HnT8pNokrq+A/LAI7QfN5tjnLjE+N0VdK6LIZZMYucNyYES0JYl5/MgboY6x0+
         Umpkhjh/XzP+p7gSGI7Io94zA/VOpNAeNqDbuv/jRG1sJsuB3u0ssnn7KrFxu7JAs/LJ
         tLbNsM2YNWPNcAr3h5pLw2mK/xaAzzqfMadTvNxHT1wVzigI9Zbfcg+RJl4T+kHZDt0V
         qOGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541542; x=1796146342;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E1l3muk9mvj2eUO9vG6GnMDOjISfB3yngVtzlHm1Fos=;
        b=hn64JhThiCWHYdgFdc6hHFkD2FVSnZosLk/+It5W6t/IYA5bEOUFWtgvqN/lLJKS/I
         4fjP4KMxuPUE0/D24PTZkxPU43fslZltwAhi7LbPcIbMUbHxR23uDq1WQRrGxr8dB5mc
         0yLs7pBH+dTSLYF6+PYyOM2rQGbMiacU2i0EnsLtV4aZm128SiWREfaP/+ev1XzpBdFj
         LlOByE0gjKOkxIHnCMrtv+eBHsVVXgJHYqGWTRt4OvIu3f/C9vwW1j2nbkPjSW7zFhAD
         FVADNuWKxYaIX2TRrEyPuUbQkFzvKELrGv2+BUztvGtLvLqqDpEc6IEwl1yUSci8T+hh
         UL8g==
X-Gm-Message-State: APuU4Z9XIYIrCuUIl2plLemkAJSv4DGc6FCstEpHYgi/w9NUjD5IQKaR
	eIhhvIFvywYUqlFNZd1BDllpqapMrJEP5yLPU8WLtZNnpkYl+RMq6N0WqDeYVgLL2qM=
X-Gm-Gg: AZFdTZfMIf2CA3844T4txzYCNQduDYT8lRiBOCd3vos0SIJkMh20uIFg6KwpOxSuOAq
	BlIknMDhQ5CAjAwq+0NdDXedHSDYSea8y2YXzbMphRKBicWoVSePoZy3lWaxo9RvimGB/+UJz0l
	U+CPed1lMJAgyn2MP5YWWe3/fpyRG+lk8qv86/cI2YKNfhM8Hs5T9A1kcQXKHNAuxxdiREmuTl4
	y48NFGWhTVtYj1FLrvYBHTtfLMe/8TMUpRoskEu3DoQq+rUPjYApsE++EypBMjPcBLTNCydvc19
	t1P9Hr3a7Dt9U7yw8pEdf1Ove8Qo5sQaTK5SiqkrBxOmN6A1eWXFB/0XtSeE9GX9gvDUTqPpS5K
	33VNAVTkPRTtKlxxe1xMhyQ046B+HnE1SDmbOSEWTzvO6NlV2emuBdmltYto65I6OtLBuixSbeL
	Nvr6201qAcpYGR+WgWg0mZT8jyFTzZ1UyBWmLrXK1GeNeCS6v/H6kyObA8lOiWxTN5E9y/ft33r
	ACJo5Wp4+HnLC2e60VsYnBsyYJCUoRomE8Rm095ghkkn79rP4Uo3B40Kz2E4iA9Dt4HTX0hD2S5
	tezDcPD7J3NxrwM0MwWrWe/cOzkCspoIM9tdcXdq6Yp/fizYXg==
X-Received: by 2002:a05:600c:b8a:b0:4bb:7007:4a5a with SMTP id 5b1f17b1804b1-4bb88817772mr322992005e9.23.1795541541955;
        Tue, 24 Nov 2026 09:32:21 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9add26sm29560057f8f.44.2026.11.24.09.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:32:21 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 24 Nov 2026 18:32:08 +0100
Subject: [PATCH v2 01/19] ASoC: qcom: lpass-cpu: fix RXTX WRDMA current
 address register readability
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
Message-Id: <20261124-topic-sm8650-el2-v2-1-174e159f0f69@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1433;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=ZWtXXIAu1ROHouXHoyzPIX41ZECCUibcP81WQj1ZjMA=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBcoaMxJMF4WK27iYIRXyPHY+J3KHRZ3Nj+2lFHF5
 iVYlM9qJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawXKGgAKCRB33NvayMhJ0ebID/
 0ScKo7Wg04BZQhsw0ik1LBznnUCP0x1l5J8gG38v/wvoUG/mJQq48WlEFTduIhLwmX37Cd2eWhiIf8
 tW2AgtXeDpZgd1tSSfSHj6L6/8sV+s8HLwyYkfR4c6+EwU1HBw4OglZMec1lmKzdQPnGxiZO2np137
 ghZUPW38OsShr1Yz04C2spnc7zKD8xJ9OHBox6QTdGdYn+Ho5UWpdvyaKQnlR25GKAjbKIw9M4lLo1
 rx7VTbrmfu93yD0A35z8L/3IV+GWRlWaPB+1HpeZp8wxSim5pBX0HO2J5uf2DKSH9uqsuWXOMGiDfA
 yj9B2EVKssy/EHDMWd88x8FLUSrTc3MWDeJYHDwLwll4YB+igVpSUTVm+aiL0fyUZwYaFWGQH5Ki6H
 djL+eMwpwyTuw8qccK2e1a8HQ/4jNvfW0vibRE+o2zz/eayzOFF8wQOI6KK2q0FuKQALNsD9zajMDX
 NDToXbvTwhy3q+mR/eitHI43AUTpN9x6W62PXLBs5rqHgEicUpZo8tN4U2bQWzUSTmqoqpXfJ0lZOq
 yK6SyJDOVTWJpnbloVuDpeKoeaiCsIVS6f2Ex3meL0zCgRf5h8CiyoV4com39PyM/erC7qKWMA54LP
 2xp59pvMRBOSCtV2h5mc1oJ7JqJj2H3sx9JBSkRThHAXln1A8MZOirJpjeLw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

__lpass_rxtx_regmap_accessible() checks the RXTX WRDMA current address
register without adding rxtx_wrdma_channel_start to the channel index
while all the other RXTX WRDMA registers do, so the current address
register of the last WRDMA channels is not readable and
lpass_platform_pcmops_pointer() fails with -EIO on those capture
channels.

Add rxtx_wrdma_channel_start like for the other RXTX WRDMA registers.

Fixes: b138706225c9 ("ASoC: qcom: Add regmap config support for codec dma driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/sashiko-outbox-213518@kernel.org
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 sound/soc/qcom/lpass-cpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index 81eebfabcc9f..5fb20e284afe 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -843,7 +843,8 @@ static bool __lpass_rxtx_regmap_accessible(struct device *dev, unsigned int reg,
 							LPASS_CDC_DMA_TX3))
 			return true;
 		if (rw == LPASS_REG_READ) {
-			if (reg == LPAIF_CDC_RXTX_WRDMACURR_REG(v, i, LPASS_CDC_DMA_RX0))
+			if (reg == LPAIF_CDC_RXTX_WRDMACURR_REG(v, i + v->rxtx_wrdma_channel_start,
+								LPASS_CDC_DMA_TX3))
 				return true;
 		}
 		if (reg == LPAIF_CDC_RXTX_WRDMAPER_REG(v, i + v->rxtx_wrdma_channel_start,

-- 
2.34.1

