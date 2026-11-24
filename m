Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541555;
	b=0Rvil5Vuswimg49nmI6zpNoQwG2oQxuE+fqDlK5iErIz3BI3CkV/UN07iLeRXrv6r9qG
	 YNwunBQx0NFf56bIyvU2mwGGR0UFz8xnuREAZdN7KxUYJJzZvPc/pFHP2UHxZsI4r/AFA
	 SBH5KsCjRxThps+c7V0ipbvy2wvK7cUA1cel+cZfcTlUr/WiXY5yh28HFkZsTi+Dlxn/d
	 YMNn1auNIssE0cYVW3H5fnOgy2H7GvRH5QlzljS/1vrDepNTU6E+XfGOu57GGUPJaCYUQ
	 S90t7o7MC1v34uwNYRHFC5TP0NTzcZQsEL+WUP5Z8ZdQUFIA3UakiIHJ12yVM7J5AWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541555;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=ZH/CDSILUZuNVoelrsbKdH5yU016KNw15Q66a47kQS4=;
	b=vCY+uEsKhy7CZt8iG/aHIK2bxgexLl9OFGEScTkDHtffs8YYY6i8MhhvfxNEl1jZcKPV
	 R85+V6zhpCttFygb5lex21I0ZKHhFjYC5tl+0CIjrezw5ewaRwgPqdWmsGvkhZFZQFkhZ
	 0Y3Wl7rXtxN7P3KQwbNqrpj7P6YuyW0rVkudw2vxyOwdsEPNtRzeHOZsxqbubBg5VB5Qd
	 Myu/MSRByY3nCI9bcUDDx4uwbDha5VfuCe5VgzSjGVV83mGRxNWTE5cidLFYiTZNSoW2H
	 fwo/saxQoJwQYhn/qwhLPwO6N5u+Biwzl0Fn7AG3MBKoGEHp77HLU2UPiAPxfajyj8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fJDj59rl;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C4860A5BFC
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 17:32:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74C4860A5BFC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fJDj59rl
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so3964670f8f.0
        for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 09:32:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795541554; x=1796146354; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZH/CDSILUZuNVoelrsbKdH5yU016KNw15Q66a47kQS4=;
        b=fJDj59rlxn1hmjaAxBG4rJ2VYBjRLv5PwcIb7678eEAe2BVuhdaAEZLGK+BFP8/wWa
         gK4lNSKoFjIeKWgqJuWi6iB2erut9PQ9jUWhstSNHhYsDQMBWXfGI7cBUZ+1lFhVvgGS
         kbfaZ5F8mURaVEUxm3am/xpxnU8CgkclrUsceimzj8XP2jW9lETwWfS36/BkRQINuTMB
         t/qIQuKX3gUP0uerspVHmaotAbKt4xQ1AzOmeVB6WP0JYf5Gb+DF+xtVASG5gZ9cKiEu
         XhNwZ9Q0/0gyYpSceShHPITrN5M0BU9LKM8fj0x0hzEYdKAUgpiy7PmwVyXAouERLcHF
         r6sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541554; x=1796146354;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZH/CDSILUZuNVoelrsbKdH5yU016KNw15Q66a47kQS4=;
        b=Riscy51nsSB97Cy58AMmqkQT6KokkMpSJsqb4iVbAg0cKEK3EXGVAQsjc6v67bN1jC
         SgERKAbNSZg3W6RInvXBZfFOwxTjaiUROKLfDFnav64qUY2dnjjdWQBgy888dGdE3Rci
         c6yq6Vo2W6X1D5+ehf8S7pXGJwuTczR30BK5L1P8eDrf6p2M4/nZZaQy8mRPUefVpV14
         e9xNVsaczPp+MMAHiYpJwrHVmNp5gs3oUNuk5xP7/RmAyd2ZSfSNfaO8pH/8+nnamwa2
         L8FAvfTGxFvZuvXDk0pag158XjiDMYx/thD1v6YMke40VoLaaK9Z6bpF+EZzrfQW6wo7
         C7ww==
X-Gm-Message-State: APuU4Z+rMYDCKEuqvOHG/OQEgVQ5PKrKSwBqKLYdooJbbnl33JNguohd
	9Q4GmtmpD5yn+KmEHedVa1ocnd9W56X0mxtNf2cq9qo/di/xfToYb7v7UQcEHUAmnHg=
X-Gm-Gg: AZFdTZcsd40WJOJ6ae4HhACOG2zinCJIm5+iLASKU+T0GqUhOSQaPzEj6nP3NCiHpD8
	9to3bck97PQq339YZIge9TN8zCcNCjQUiv8fjJwTHYt4WU6STBxTfS6VmXZyFpSz6OrfipnQQ6q
	0lrb+xxtaBLDUwltEZ1x1XLhh/PNdidBfRtMnCgrfK/yn90s0YcDJg5hYiPyMkWqCP18bVhL2+B
	h2PeZmMpU+4UdZwue5i1c2L7O9ELm1xRn8cohhVBfck5iCHSN2fOMQfP6I2CvSTqPxU7J41KDEK
	c9ccY+Nh5oxJsVln6nFFdk1GyJhot+ydaqPDQsA8PGT4+NqqlDr/CwS4ixY/rB4DkhBkPQ1yeIw
	bMROVDBdXA8JA0k/yf1+WYjLSx750gwXtW5A4UlJZFjEasPIHE3e7s6zRdM1wqXX7W8weHOFI0i
	fDlvjh1hAbp9r/9OGAg3Ylip4dBk5HVO2+O7/XRYDLHRaw3nIP5mI+3PR76mqlVdSLfM2jOzxuR
	AELNokcmpN/vhnhh4PcKUwuHM3hXZiR2W1gnbGcz2+omMK5+NhnjciZnql1eIRrYPmh+OVDVJue
	LIyPgzKIhtkcKPZf1lQ/jNeGID7DdB4zgUwUqMERU9OoahMi0U0pNO+mJ3p1oHO2xav34wk=
X-Received: by 2002:adf:e012:0:10b0:48e:3697:708d with SMTP id ffacd0b85a97d-4abb0d51ab2mr21268041f8f.12.1795541553597;
        Tue, 24 Nov 2026 09:32:33 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9add26sm29560057f8f.44.2026.11.24.09.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:32:33 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 24 Nov 2026 18:32:22 +0100
Subject: [PATCH v2 15/19] ASoC: qcom: lpass: allocate LPM buffer memory to
 DAIs
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
Message-Id: <20261124-topic-sm8650-el2-v2-15-174e159f0f69@linaro.org>
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
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=14130;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=GjKMGmCA1b+nCPKP581ICeIapQRAjPtRgUC64h87RE0=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBcohFH2XKj8I7p6U+4RdIJX5/MhSNW29v1wSaQYQ
 FQNMgR2JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawXKIQAKCRB33NvayMhJ0XI8D/
 98pRE/x3V2s5nFdnuG8+sVGCHbsQcvX5ZHWhJ8vNKBD6oGtpUiFT5kUyZSvFRICdEzFJ1e9410vxzt
 uhGJtYNe12s31ghFhcvYDfbPLblZbv7VwUZ15V77HJGUv9J2sxYaF3QD1fB6qWmM0J9AyFqPpwoAXa
 CysFo2U87sizyzDAKcEPqw0StPoxxluZkKB/FQ9EJ9O1JJXsT5tmDjlcr9+gOFG/bY2qLFD3sr75iH
 T+x2xHu39MG5bql8zx+v8inGSkyNpHOV/I/ccaC3aKuNBf5ZTEhTTCcnWDV0VkThM/uOEC5OAjgNMu
 Sf0RgQvdGoH/KW1tC1j1r/LpRcHk2ttyFlPYxNcAVy3PYtN235/ZghjBhH2pUhYJBtVmpg+Kp4ac+1
 ZYZVO9rSeptkzYFWdvxuqukVhg62ens4BLiEGc/AanDtLd8U+JUOHlzbiffnfBsEHIz2n4iJXiP8A0
 63BqKMe0S8u9gChdAEC+PJowdxOnBVYPk6K3gtrdCbkNC6pfHudEJwXe/wIA0sHCs+L9BgXvqAyuyd
 d4EI4EnaLm0JiftnOHFJ/P8LOkxoyRhEDI0T2p7PWsBv9RsJiy4Y3n7RRVTsVIP2tU4FEG6e6B7xRv
 0kpoxF+UHqbZcV9fKE+gd7kV3bgt1wRYhxA3YAvmKJ+PJqjKoxlY07zI6f+Q==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

When using MI2S on non-core LPAIFs, the hardware can only
fetch data from the LPM buffers and not from DDR memory,
allocate the DMA buffers in each LPM memory for all users
and drop the static allocation.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 sound/soc/qcom/lpass-cpu.c      |  41 ++++++----
 sound/soc/qcom/lpass-platform.c | 160 +++++++++++++++++++++++++++++++++++++---
 sound/soc/qcom/lpass.h          |  10 +++
 3 files changed, 183 insertions(+), 28 deletions(-)

diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index a83507c2cd55..8b005a87d408 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -1169,6 +1169,8 @@ static void of_lpass_cpu_parse_dai_data(struct device *dev,
 			data->codec_dma_enable = 1;
 			if (is_wsa_cdc_dma_port(id))
 				data->wsa_enable = 1;
+			else if (!is_rxtx_cdc_dma_port(id))
+				data->va_enable = 1;
 		} else if (is_mi2s_port_id(id)) {
 			unsigned int port_id = mi2s_port_id(id);
 
@@ -1351,22 +1353,6 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
 			if (IS_ERR(drvdata->wsa_lpaif_map))
 				return PTR_ERR(drvdata->wsa_lpaif_map);
 		}
-
-		ret = of_lpass_cdc_dma_clks_parse(dev, drvdata);
-		if (ret) {
-			dev_err(dev, "failed to get cdc dma clocks %d\n", ret);
-			return ret;
-		}
-
-		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "lpass-rxtx-cdc-dma-lpm");
-		if (!res)
-			return -EINVAL;
-		drvdata->rxtx_cdc_dma_lpm_buf = res->start;
-
-		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "lpass-va-cdc-dma-lpm");
-		if (!res)
-			return -EINVAL;
-		drvdata->va_cdc_dma_lpm_buf = res->start;
 	}
 
 	if (variant->mi2s_desc) {
@@ -1380,6 +1366,9 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
 						   variant->mi2s_desc[i].reg_name);
 			if (ret)
 				return ret;
+
+			if (variant->mi2s_desc[i].lpm_type != LPASS_LPM_NONE)
+				drvdata->mi2s_lpm_enable = true;
 		}
 	} else {
 		drvdata->num_lpaif = 1;
@@ -1389,6 +1378,26 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
 			return ret;
 	}
 
+	if (drvdata->codec_dma_enable || drvdata->mi2s_lpm_enable) {
+		ret = of_lpass_cdc_dma_clks_parse(dev, drvdata);
+		if (ret) {
+			dev_err(dev, "failed to get cdc dma clocks %d\n", ret);
+			return ret;
+		}
+
+		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "lpass-rxtx-cdc-dma-lpm");
+		if (!res)
+			return -EINVAL;
+		drvdata->rxtx_cdc_dma_lpm_buf = res->start;
+		drvdata->rxtx_cdc_dma_lpm_size = resource_size(res);
+
+		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "lpass-va-cdc-dma-lpm");
+		if (!res)
+			return -EINVAL;
+		drvdata->va_cdc_dma_lpm_buf = res->start;
+		drvdata->va_cdc_dma_lpm_size = resource_size(res);
+	}
+
 	if (drvdata->hdmi_port_enable) {
 		drvdata->hdmiif = devm_platform_ioremap_resource_byname(pdev, "lpass-hdmiif");
 		if (IS_ERR(drvdata->hdmiif))
diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
index 16a964e1aec1..855f1ee19394 100644
--- a/sound/soc/qcom/lpass-platform.c
+++ b/sound/soc/qcom/lpass-platform.c
@@ -49,6 +49,31 @@ static const struct snd_pcm_hardware lpass_platform_pcm_hardware = {
 	.fifo_size		=	0,
 };
 
+/* MI2S ports with their DMA buffer in a LPM block */
+static const struct snd_pcm_hardware lpass_platform_lpm_mi2s_hardware = {
+	.info			=	SNDRV_PCM_INFO_MMAP |
+					SNDRV_PCM_INFO_MMAP_VALID |
+					SNDRV_PCM_INFO_INTERLEAVED |
+					SNDRV_PCM_INFO_PAUSE |
+					SNDRV_PCM_INFO_RESUME,
+	.formats		=	SNDRV_PCM_FMTBIT_S16 |
+					SNDRV_PCM_FMTBIT_S24 |
+					SNDRV_PCM_FMTBIT_S32,
+	.rates			=	SNDRV_PCM_RATE_8000_192000,
+	.rate_min		=	8000,
+	.rate_max		=	192000,
+	.channels_min		=	1,
+	.channels_max		=	8,
+	.buffer_bytes_max	=	LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE,
+	.period_bytes_max	=	LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE /
+						LPASS_PLATFORM_PERIODS,
+	.period_bytes_min	=	LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE /
+						LPASS_PLATFORM_PERIODS,
+	.periods_min		=	LPASS_PLATFORM_PERIODS,
+	.periods_max		=	LPASS_PLATFORM_PERIODS,
+	.fifo_size		=	0,
+};
+
 static const struct snd_pcm_hardware lpass_platform_rxtx_hardware = {
 	.info			=	SNDRV_PCM_INFO_MMAP |
 					SNDRV_PCM_INFO_MMAP_VALID |
@@ -312,6 +337,13 @@ static int lpass_platform_pcmops_open(struct snd_soc_component *component,
 			dev_err(soc_runtime->dev, "error writing to rdmactl reg: %d\n", ret);
 			return ret;
 		}
+		if (is_lpm_mi2s_port(drvdata, dai_id)) {
+			snd_soc_set_runtime_hwparams(substream,
+						     &lpass_platform_lpm_mi2s_hardware);
+			runtime->dma_bytes = lpass_platform_lpm_mi2s_hardware.buffer_bytes_max;
+			snd_pcm_set_runtime_buffer(substream, &substream->dma_buffer);
+			break;
+		}
 		snd_soc_set_runtime_hwparams(substream, &lpass_platform_pcm_hardware);
 		runtime->dma_bytes = lpass_platform_pcm_hardware.buffer_bytes_max;
 		break;
@@ -1038,9 +1070,10 @@ static int lpass_platform_pcmops_mmap(struct snd_soc_component *component,
 {
 	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
+	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
 	unsigned int dai_id = cpu_dai->driver->id;
 
-	if (is_cdc_dma_port(dai_id))
+	if (is_cdc_dma_port(dai_id) || is_lpm_mi2s_port(drvdata, dai_id))
 		return lpass_platform_cdc_dma_mmap(substream, vma);
 
 	return snd_pcm_lib_default_mmap(substream, vma);
@@ -1288,6 +1321,41 @@ static irqreturn_t lpass_platform_wsaif_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static int lpass_platform_prealloc_lpm_mi2s_buffer(struct snd_soc_component *component,
+						    struct snd_pcm *pcm, int dai_id)
+{
+	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
+	unsigned int port_id = mi2s_port_id(dai_id);
+	struct snd_pcm_substream *substream;
+	struct snd_dma_buffer *buf;
+	u32 addr;
+	int dir;
+
+	if (drvdata->mi2s_lpm[port_id] == LPASS_VA_CDC_LPM)
+		addr = drvdata->va_cdc_dma_lpm_buf;
+	else
+		addr = drvdata->rxtx_cdc_dma_lpm_buf;
+	addr += drvdata->mi2s_lpm_offset[port_id];
+
+	/* Playback and capture buffers are allocated one after the other */
+	for (dir = SNDRV_PCM_STREAM_PLAYBACK; dir <= SNDRV_PCM_STREAM_CAPTURE; dir++) {
+		substream = pcm->streams[dir].substream;
+		if (!substream)
+			continue;
+
+		buf = &substream->dma_buffer;
+		buf->dev.dev = pcm->card->dev;
+		buf->dev.type = SNDRV_DMA_TYPE_CONTINUOUS;
+		buf->private_data = NULL;
+		buf->bytes = lpass_platform_lpm_mi2s_hardware.buffer_bytes_max;
+		buf->addr = addr + dir * LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE;
+		buf->area = (unsigned char * __force)memremap(buf->addr, buf->bytes,
+							      MEMREMAP_WC);
+	}
+
+	return 0;
+}
+
 static int lpass_platform_prealloc_cdc_dma_buffer(struct snd_soc_component *component,
 						  struct snd_pcm *pcm, int dai_id)
 {
@@ -1310,23 +1378,25 @@ static int lpass_platform_prealloc_cdc_dma_buffer(struct snd_soc_component *comp
 	switch (dai_id) {
 	case LPASS_CDC_DMA_RX0 ... LPASS_CDC_DMA_RX9:
 		buf->bytes = lpass_platform_rxtx_hardware.buffer_bytes_max;
-		buf->addr = drvdata->rxtx_cdc_dma_lpm_buf;
+		buf->addr = drvdata->rxtx_cdc_dma_lpm_buf + drvdata->rxtx_lpm_offset;
 		break;
 	case LPASS_CDC_DMA_TX0 ... LPASS_CDC_DMA_TX8:
 		buf->bytes = lpass_platform_rxtx_hardware.buffer_bytes_max;
-		buf->addr = drvdata->rxtx_cdc_dma_lpm_buf + LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE;
+		buf->addr = drvdata->rxtx_cdc_dma_lpm_buf +
+				drvdata->rxtx_lpm_offset + LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE;
 		break;
 	case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX8:
 		buf->bytes = lpass_platform_va_hardware.buffer_bytes_max;
-		buf->addr = drvdata->va_cdc_dma_lpm_buf;
+		buf->addr = drvdata->va_cdc_dma_lpm_buf + drvdata->va_lpm_offset;
 		break;
 	case LPASS_CDC_DMA_WSA_RX0 ... LPASS_CDC_DMA_WSA_RX9:
 		buf->bytes = lpass_platform_wsa_hardware.buffer_bytes_max;
-		buf->addr = drvdata->rxtx_cdc_dma_lpm_buf + LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE * 2;
+		buf->addr = drvdata->rxtx_cdc_dma_lpm_buf + drvdata->wsa_lpm_offset;
 		break;
 	case LPASS_CDC_DMA_WSA_TX0 ... LPASS_CDC_DMA_WSA_TX8:
 		buf->bytes = lpass_platform_wsa_hardware.buffer_bytes_max;
-		buf->addr = drvdata->rxtx_cdc_dma_lpm_buf + LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE * 3;
+		buf->addr = drvdata->rxtx_cdc_dma_lpm_buf +
+				drvdata->wsa_lpm_offset + LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE;
 		break;
 	default:
 		break;
@@ -1342,14 +1412,14 @@ static int lpass_platform_pcm_new(struct snd_soc_component *component,
 {
 	struct snd_pcm *pcm = soc_runtime->pcm;
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
+	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
 	unsigned int dai_id = cpu_dai->driver->id;
 
 	size_t size = lpass_platform_pcm_hardware.buffer_bytes_max;
 
-	/*
-	 * Lpass codec dma can access only lpass lpm hardware memory.
-	 * ioremap is for HLOS to access hardware memory.
-	 */
+	if (is_lpm_mi2s_port(drvdata, dai_id))
+		return lpass_platform_prealloc_lpm_mi2s_buffer(component, pcm, dai_id);
+
 	if (is_cdc_dma_port(dai_id))
 		return lpass_platform_prealloc_cdc_dma_buffer(component, pcm, dai_id);
 
@@ -1412,6 +1482,7 @@ static int lpass_platform_copy(struct snd_soc_component *component,
 			       unsigned long pos, struct iov_iter *buf,
 			       unsigned long bytes)
 {
+	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
 	struct snd_pcm_runtime *rt = substream->runtime;
 	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
@@ -1422,7 +1493,7 @@ static int lpass_platform_copy(struct snd_soc_component *component,
 				channel * (rt->dma_bytes / rt->channels));
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		if (is_cdc_dma_port(dai_id)) {
+		if (is_cdc_dma_port(dai_id) || is_lpm_mi2s_port(drvdata, dai_id)) {
 			if (copy_from_iter_toio(dma_buf, bytes, buf) != bytes)
 				ret = -EFAULT;
 		} else {
@@ -1430,7 +1501,7 @@ static int lpass_platform_copy(struct snd_soc_component *component,
 				ret = -EFAULT;
 		}
 	} else if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
-		if (is_cdc_dma_port(dai_id)) {
+		if (is_cdc_dma_port(dai_id) || is_lpm_mi2s_port(drvdata, dai_id)) {
 			if (copy_to_iter_fromio(dma_buf, bytes, buf) != bytes)
 				ret = -EFAULT;
 		} else {
@@ -1459,6 +1530,66 @@ static const struct snd_soc_component_driver lpass_component_driver = {
 
 };
 
+static int lpass_platform_allocate_lpm(struct lpass_data *drvdata)
+{
+	u32 rxtx_cdc_dma_lpm_remain = drvdata->rxtx_cdc_dma_lpm_size;
+	u32 va_cdc_dma_lpm_remain = drvdata->va_cdc_dma_lpm_size;
+	u32 rxtx_cdc_dma_lpm_offset = 0;
+	u32 va_cdc_dma_lpm_offset = 0;
+	int port_id;
+
+	if (drvdata->codec_dma_enable) {
+		drvdata->rxtx_lpm_offset = rxtx_cdc_dma_lpm_offset;
+		rxtx_cdc_dma_lpm_offset += LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE * 2;
+		rxtx_cdc_dma_lpm_remain -= LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE * 2;
+
+		if (drvdata->va_enable) {
+			drvdata->va_lpm_offset = va_cdc_dma_lpm_offset;
+			va_cdc_dma_lpm_offset += LPASS_VA_CDC_DMA_LPM_BUFF_SIZE;
+			va_cdc_dma_lpm_remain -= LPASS_VA_CDC_DMA_LPM_BUFF_SIZE;
+		}
+
+		if (drvdata->wsa_enable) {
+			drvdata->wsa_lpm_offset = rxtx_cdc_dma_lpm_offset;
+			rxtx_cdc_dma_lpm_offset += LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE * 2;
+			rxtx_cdc_dma_lpm_remain -= LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE * 2;
+		}
+	}
+
+	if (!drvdata->mi2s_lpm_enable)
+		return 0;
+
+	for (port_id = 0; port_id < LPASS_MAX_MI2S_PORTS; port_id++) {
+		if (!test_bit(port_id, &drvdata->lpaif_port_enable))
+			continue;
+
+		switch (drvdata->mi2s_lpm[port_id]) {
+		case LPASS_RXTX_CDC_LPM:
+			if (rxtx_cdc_dma_lpm_remain < LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE * 2)
+				return -EINVAL;
+			drvdata->mi2s_lpm_offset[port_id] = rxtx_cdc_dma_lpm_offset;
+			rxtx_cdc_dma_lpm_offset += LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE * 2;
+			rxtx_cdc_dma_lpm_remain -= LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE * 2;
+			break;
+		case LPASS_VA_CDC_LPM:
+			/*
+			 * VA Codec uses 12KiB, but MI2S uses 2x8KiB for playback
+			 * and capture, so it must be large enough to fit
+			 */
+			if (va_cdc_dma_lpm_remain < LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE * 2)
+				return -EINVAL;
+			drvdata->mi2s_lpm_offset[port_id] = va_cdc_dma_lpm_offset;
+			va_cdc_dma_lpm_offset += LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE * 2;
+			va_cdc_dma_lpm_remain -= LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE * 2;
+			break;
+		default:
+			break;
+		}
+	}
+
+	return 0;
+}
+
 static int lpass_platform_init_lpaif(struct platform_device *pdev, int idx,
 				     const char *irq_name, unsigned long irqflags)
 {
@@ -1624,6 +1755,11 @@ int asoc_qcom_lpass_platform_register(struct platform_device *pdev)
 			return ret;
 		}
 	}
+
+	ret = lpass_platform_allocate_lpm(drvdata);
+	if (ret)
+		return ret;
+
 	return devm_snd_soc_register_component(&pdev->dev,
 			&lpass_component_driver, NULL, 0);
 }
diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
index 71f1274dfa89..3a37bf992645 100644
--- a/sound/soc/qcom/lpass.h
+++ b/sound/soc/qcom/lpass.h
@@ -196,6 +196,8 @@ struct lpass_data {
 	int hdmi_port_enable;
 	int codec_dma_enable;
 	int wsa_enable;
+	int va_enable;
+	int mi2s_lpm_enable;
 
 	/* LPAIF instances, 0 is the core "lpass-lpaif" one */
 	struct lpass_lpaif lpaif[LPASS_MAX_LPAIF];
@@ -214,7 +216,15 @@ struct lpass_data {
 	void __iomem *wsa_lpaif;
 
 	u32 rxtx_cdc_dma_lpm_buf;
+	u32 rxtx_cdc_dma_lpm_size;
 	u32 va_cdc_dma_lpm_buf;
+	u32 va_cdc_dma_lpm_size;
+
+	/* LPM buffer assignment */
+	u32 rxtx_lpm_offset;
+	u32 va_lpm_offset;
+	u32 wsa_lpm_offset;
+	u32 mi2s_lpm_offset[LPASS_MAX_MI2S_PORTS];
 
 	/* regmap backed by the low-power audio interface (LPAIF) registers */
 	struct regmap *hdmiif_map;

-- 
2.34.1

