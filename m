Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541551;
	b=zSGndkLjm6L3JhvrXd4+3WDkYtyycfN8jjyihB0vibCFHXUs1ppbXw6wJaLODbhT8hB4
	 asmUndBFU171VXpH/KnfmUVKMmFsD+fzroWic1DnNpoaf4OWM0XmJUIF1rf92NVhl4Dsc
	 yNfROwBgkUQlCng3+uYEkncxGOo2iVBMBv2FawqxSB6RNfENrwEDUdIA5lSrI6xmAczHW
	 P8wqXwoLZesYwteflCD8q9qbQbZvTsTVKUhIgbn7UbOGu6RD2YBp7VCJQv25IFOQ6NS3U
	 X6/WDYfRaHd+4hCxBzPtU64XoBm0/0ARTSe7UJFINN5rwc4X5jvMhpjDWTgqVyiyUow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541551;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=9i0xbArRGGKcASRX+8bBlxc9t+5ECJCoTBFx4AwcWdM=;
	b=SzqIcWdZiS8hQ8axNv46UggTcVsIBSl3OwfXV/FuyYxD4hSZJA24nkKsmqjRWz/NWJwT
	 HaVBxafsk+CUApT29lJEU+96wPcI5QLl9PDAYEMf3TQAgD7w9zno1EL/9pddu2+8tn7vQ
	 BZ2r/C+Nq1Z6thJf2Shf1mVZ9ArghAb2wQ7GPg+RmENbTRquxFlILzm+0PTCtM3DhBv32
	 dqmZOGx9kxYiy42enF9dIdfuSTRaT30hvYtbMJauogFFqdvZ5RHiOTYZXz+Y2L0f1SKPY
	 nXofTSqUmPHVuToX2/snlzdQE9JEyvXCDEuOwtWBByoQ7wUBTCgdBwMsWLWuJ6zvTEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zEWkXw3J;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F7A60A3825
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 17:32:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88F7A60A3825
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zEWkXw3J
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-490d59c3edaso3280428f8f.1
        for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 09:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795541549; x=1796146349; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9i0xbArRGGKcASRX+8bBlxc9t+5ECJCoTBFx4AwcWdM=;
        b=zEWkXw3JmdyJU+pl1puKxZggdxs8SWAHtFrOR4ztU2NSaGZzcqMsfxpz9Xb0MV+Mqu
         GX4VjvBAjlGCVK3hk10X8zkyh/IvD6eE9PFoM4kX22TLurpgH5Zf7qI0o53VJW232kHh
         O2stq4pe4cPwfOMH8ntdjJt2PiLTBXwdxExnl4AReVdEBQnUVJzImPpViE9ReOdklDrJ
         2qLgpL3HrkxLj3U7NntE/6JpQmqphyatgg7L++vJs2f2nRQvV1nRzvh+APkzSx5NF7Ir
         4sf/7ZHjr1Oz9eL/lwLTGigNcvcbO6kC6/6pBBrMddpPd6t0t8QONDBwMWDNg1Snnnt7
         C+5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541549; x=1796146349;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9i0xbArRGGKcASRX+8bBlxc9t+5ECJCoTBFx4AwcWdM=;
        b=ZTRwxubHulWOCLeSRoN2PFZSM4jp/ke3P9VrYO9Xf+AJVJK/h6kdI5NCx3gwWwiPDM
         O/SPdxqq/EKAxXz51ncucF1fZpp8OTVy7Qdx98ajmj+BjexzTBiaUL0d7vW8OzACP/Lz
         M3Pddce6es/zVph6gf1tXz4KM/imx/czBF315clrqPByk7/UE5/whRAr69n6/x/uZkTg
         7wda1Hko1iO6QLkslKmxemS+xfRA2Dj9t5/ApvuXG3YF8A/eIbZJshFIkTgf7hiDWl2J
         S5HlAyj5flKCrLHWePwCAGiPw/lgKAu9qRIkuhK0UT0kNLpE3DM3QNRyal/7jEd5OOJX
         Lorw==
X-Gm-Message-State: APuU4Z+iOCVfGyHj2SZwvnL4/PAHaEKGLXVqzra1kg++OE0u/T1MXeTO
	y/jtPN+K03qk1gSmcm8xg7GLSIQwlen0/bliDDhnYH/RJpC0DmmL9K8zoSDgkIzXsmM=
X-Gm-Gg: AZFdTZf1xGXYLYE7cmBTz0Cx9dLxoW0m+GL7B55v8cX0rujuyTH+9IEmxPbgpzzIv3i
	/PbibEAU3qXzYRAcnOglxm5Fa6tATBNFeKWaAsbK4VHYSwowmRYAmpD0AoN+VCsPWCG6O/3EPMZ
	6SXZfcRMSoUuiEXjeCgttHLgpriZlBkZ7fFguBNQmYyR3CwtUu3XxNhstsg8OqUxrHd4ajPpJq3
	IliQP7UzjcQlvtCdwEfAjwLZeZdB2NMZ/XuG1AQTg99pxnLiQ4TmbwR9arw0OsYEb5jR84QkS12
	GGtXaR4pTgvNAuFvNlIi8eQnI6PIsMjWXpygy9eFGQmAPW15NEgXBriNnAlVICik2+/tREFduEU
	2GXgDcMiVr2oaBcooEFSWhNln4qXyzjyyQa7wBFjxhW6TA5haUiEmsgRaKtyNqiBtyzPBjSecmS
	VLN1AU3WCjIk1K7EKKFzuG2bbypB4F+7ZOFrG8k+ky1Dsn08tr/Zqn1jXWvz5RqolV46+V50no1
	qw749V4DxeuWoNIPnnslcPYXUmRM8GATABm0a1d7aSW6i+36kmi4FR+oWPQEHHa1zLJH8eIOVts
	I50dDUVBZ/hc/v6t7D2k+DAeRNxiVrWt/R9DLt0R/6dtlXOjqQ==
X-Received: by 2002:a05:6000:4310:b0:4a9:6c58:178a with SMTP id ffacd0b85a97d-4aa55bfeb43mr37672780f8f.12.1795541548630;
        Tue, 24 Nov 2026 09:32:28 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9add26sm29560057f8f.44.2026.11.24.09.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:32:28 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 24 Nov 2026 18:32:16 +0100
Subject: [PATCH v2 09/19] ASoC: qcom: lpass: add support for optional WSA
 interface
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
Message-Id: <20261124-topic-sm8650-el2-v2-9-174e159f0f69@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=26213;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=jH+46moSxyDjl5kKtt6o1+gItW0FNbKbhof7ZH+adfA=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBcoe2nbap36uI4bG6WJe19kg+fuWynbadihq0QEo
 cUx2hDyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawXKHgAKCRB33NvayMhJ0SImEA
 DK3eweECbKTTfdOBCL6i7/uFisWCm0vIqSoVKHSdk0tbU6PxsI5GQPEBoRg8Vl0tMpzn7JNzct2dJj
 TaTCkqaA4Aq0Wz0Is1QVQ3ToHpinlFaWY0IGuW1D4k3AQAWA3LbamU2pc3fJ9gYm/O6crqe0bz4INv
 xLO2qW2kc3sHrwahwMBZ1q1/9c9OtXPjzsvt1m0ImvFme8a0N2M8XDazmqAOUy6kQSI51sS3cb8umf
 AEj6eBWHiB86neOuElaefyaNZ52xMWTDKwWD4ze8qNE2zBaB0HE5b93YohV42UEUxBQgHNfUtmGRef
 FRw63pR/Glg7kpNNMqe3wyjJcB4ZMfFhmfBaG4BOKTVQJvcP2BdSjGpE+O3rzfsmuQv2Y6nwcByufF
 Bd2ZM4hn++LyQYqnsTUnssD/dc34CGhG4SWDn8CuEutk0Mbx/TfXFV6vtd7hpIUEKMdIO1f3eEK1Cm
 7B2LDPIQxgwcQiU5IXwlTSgnSxIZP/aW0bEHQUdUgWNhwRKdRbBFdAPOB5KVuB3BpndA+OT00E2Y9r
 KeK4gSfERJaJj9lYsUshzAtB9Xl5fVK+F5i6BnWOl9YebruvjXgj+SkzUffgIRPTJLTTFYEpIc1u31
 4RRQMtscDUGEEPHjMwKEDVMj5O05KRFcqea3K5kBRyKPv/OeFCzVHwbQnE4A==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Newer SoCs have an additional WSA LPAIF used to driver and
additional soundwire bus dedicated to Speakers.

Add the necessary plumbing which is very similar to the
RXTX support used to driver the WCD soundwire bus.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 sound/soc/qcom/lpass-cpu.c       | 123 ++++++++++++++++++++++++++
 sound/soc/qcom/lpass-lpaif-reg.h |  51 +++++++++--
 sound/soc/qcom/lpass-platform.c  | 183 +++++++++++++++++++++++++++++++++++++++
 sound/soc/qcom/lpass.h           |  64 ++++++++++++++
 4 files changed, 416 insertions(+), 5 deletions(-)

diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index 308910744223..db7a0752edb2 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -964,6 +964,98 @@ static bool lpass_va_regmap_volatile(struct device *dev, unsigned int reg)
 	return false;
 }
 
+static bool __lpass_wsa_regmap_accessible(struct device *dev, unsigned int reg, bool rw)
+{
+	struct lpass_data *drvdata = dev_get_drvdata(dev);
+	const struct lpass_variant *v = drvdata->variant;
+	int i;
+
+	for (i = 0; i < v->wsa_irq_ports; ++i) {
+		if (reg == LPAIF_WSA_IRQCLEAR_REG(v, i))
+			return true;
+		if (reg == LPAIF_WSA_IRQEN_REG(v, i))
+			return true;
+		if (reg == LPAIF_WSA_IRQSTAT_REG(v, i))
+			return true;
+	}
+
+	for (i = 0; i < v->wsa_rdma_channels; ++i) {
+		if (reg == LPAIF_CDC_WSA_RDMACTL_REG(v, i, LPASS_CDC_DMA_WSA_RX0))
+			return true;
+		if (reg == LPAIF_CDC_WSA_RDMABASE_REG(v, i, LPASS_CDC_DMA_WSA_RX0))
+			return true;
+		if (reg == LPAIF_CDC_WSA_RDMABUFF_REG(v, i, LPASS_CDC_DMA_WSA_RX0))
+			return true;
+		if (rw == LPASS_REG_READ) {
+			if (reg == LPAIF_CDC_WSA_RDMACURR_REG(v, i, LPASS_CDC_DMA_WSA_RX0))
+				return true;
+		}
+		if (reg == LPAIF_CDC_WSA_RDMAPER_REG(v, i, LPASS_CDC_DMA_WSA_RX0))
+			return true;
+		if (reg == LPAIF_CDC_WSA_RDMA_INTF_REG(v, i, LPASS_CDC_DMA_WSA_RX0))
+			return true;
+	}
+
+	for (i = 0; i < v->wsa_wrdma_channels; ++i) {
+		if (reg == LPAIF_CDC_WSA_WRDMACTL_REG(v, i + v->wsa_wrdma_channel_start,
+						      LPASS_CDC_DMA_WSA_TX0))
+			return true;
+		if (reg == LPAIF_CDC_WSA_WRDMABASE_REG(v, i + v->wsa_wrdma_channel_start,
+						       LPASS_CDC_DMA_WSA_TX0))
+			return true;
+		if (reg == LPAIF_CDC_WSA_WRDMABUFF_REG(v, i + v->wsa_wrdma_channel_start,
+						       LPASS_CDC_DMA_WSA_TX0))
+			return true;
+		if (rw == LPASS_REG_READ) {
+			if (reg == LPAIF_CDC_WSA_WRDMACURR_REG(v, i + v->wsa_wrdma_channel_start,
+							       LPASS_CDC_DMA_WSA_TX0))
+				return true;
+		}
+		if (reg == LPAIF_CDC_WSA_WRDMAPER_REG(v, i + v->wsa_wrdma_channel_start,
+						      LPASS_CDC_DMA_WSA_TX0))
+			return true;
+		if (reg == LPAIF_CDC_WSA_WRDMA_INTF_REG(v, i + v->wsa_wrdma_channel_start,
+							LPASS_CDC_DMA_WSA_TX0))
+			return true;
+	}
+	return false;
+}
+
+static bool lpass_wsa_regmap_writeable(struct device *dev, unsigned int reg)
+{
+	return __lpass_wsa_regmap_accessible(dev, reg, LPASS_REG_WRITE);
+}
+
+static bool lpass_wsa_regmap_readable(struct device *dev, unsigned int reg)
+{
+	return __lpass_wsa_regmap_accessible(dev, reg, LPASS_REG_READ);
+}
+
+static bool lpass_wsa_regmap_volatile(struct device *dev, unsigned int reg)
+{
+	struct lpass_data *drvdata = dev_get_drvdata(dev);
+	const struct lpass_variant *v = drvdata->variant;
+	int i;
+
+	for (i = 0; i < v->wsa_irq_ports; ++i) {
+		if (reg == LPAIF_WSA_IRQCLEAR_REG(v, i))
+			return true;
+		if (reg == LPAIF_WSA_IRQSTAT_REG(v, i))
+			return true;
+	}
+
+	for (i = 0; i < v->wsa_rdma_channels; ++i)
+		if (reg == LPAIF_CDC_WSA_RDMACURR_REG(v, i, LPASS_CDC_DMA_WSA_RX0))
+			return true;
+
+	for (i = 0; i < v->wsa_wrdma_channels; ++i)
+		if (reg == LPAIF_CDC_WSA_WRDMACURR_REG(v, i + v->wsa_wrdma_channel_start,
+						       LPASS_CDC_DMA_WSA_TX0))
+			return true;
+
+	return false;
+}
+
 static struct regmap_config lpass_rxtx_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
@@ -984,6 +1076,16 @@ static struct regmap_config lpass_va_regmap_config = {
 	.cache_type = REGCACHE_FLAT,
 };
 
+static struct regmap_config lpass_wsa_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.writeable_reg = lpass_wsa_regmap_writeable,
+	.readable_reg = lpass_wsa_regmap_readable,
+	.volatile_reg = lpass_wsa_regmap_volatile,
+	.cache_type = REGCACHE_FLAT,
+};
+
 static unsigned int of_lpass_cpu_parse_sd_lines(struct device *dev,
 						struct device_node *node,
 						const char *name)
@@ -1046,6 +1148,8 @@ static void of_lpass_cpu_parse_dai_data(struct device *dev,
 			data->hdmi_port_enable = 1;
 		} else if (is_cdc_dma_port(id)) {
 			data->codec_dma_enable = 1;
+			if (is_wsa_cdc_dma_port(id))
+				data->wsa_enable = 1;
 		} else {
 			data->mi2s_playback_sd_mode[id] =
 				of_lpass_cpu_parse_sd_lines(dev, node,
@@ -1125,6 +1229,13 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
 		if (IS_ERR(drvdata->va_lpaif))
 			return PTR_ERR(drvdata->va_lpaif);
 
+		if (drvdata->wsa_enable) {
+			drvdata->wsa_lpaif =
+				devm_platform_ioremap_resource_byname(pdev, "lpass-wsa-lpaif");
+			if (IS_ERR(drvdata->wsa_lpaif))
+				return PTR_ERR(drvdata->wsa_lpaif);
+		}
+
 		lpass_rxtx_regmap_config.max_register = LPAIF_CDC_RXTX_WRDMAPER_REG(variant,
 					variant->rxtx_wrdma_channels +
 					variant->rxtx_wrdma_channel_start, LPASS_CDC_DMA_TX3);
@@ -1143,6 +1254,18 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
 		if (IS_ERR(drvdata->va_lpaif_map))
 			return PTR_ERR(drvdata->va_lpaif_map);
 
+		if (drvdata->wsa_enable) {
+			lpass_wsa_regmap_config.max_register = LPAIF_CDC_WSA_WRDMAPER_REG(variant,
+						variant->wsa_wrdma_channels +
+						variant->wsa_wrdma_channel_start,
+						LPASS_CDC_DMA_WSA_TX0);
+
+			drvdata->wsa_lpaif_map = devm_regmap_init_mmio(dev, drvdata->wsa_lpaif,
+								       &lpass_wsa_regmap_config);
+			if (IS_ERR(drvdata->wsa_lpaif_map))
+				return PTR_ERR(drvdata->wsa_lpaif_map);
+		}
+
 		ret = of_lpass_cdc_dma_clks_parse(dev, drvdata);
 		if (ret) {
 			dev_err(dev, "failed to get cdc dma clocks %d\n", ret);
diff --git a/sound/soc/qcom/lpass-lpaif-reg.h b/sound/soc/qcom/lpass-lpaif-reg.h
index 6d9d9d1f6a4d..faea5a0ce5ea 100644
--- a/sound/soc/qcom/lpass-lpaif-reg.h
+++ b/sound/soc/qcom/lpass-lpaif-reg.h
@@ -82,6 +82,14 @@
 #define LPAIF_RXTX_IRQSTAT_REG(v, port) LPAIF_RXTX_IRQ_REG_ADDR(v, 0x4, port)
 #define LPAIF_RXTX_IRQCLEAR_REG(v, port) LPAIF_RXTX_IRQ_REG_ADDR(v, 0xC, port)
 
+/* LPAIF WSA IRQ */
+#define LPAIF_WSA_IRQ_REG_ADDR(v, addr, port) \
+		(v->wsa_irq_reg_base + (addr) + v->wsa_irq_reg_stride * (port))
+
+#define LPAIF_WSA_IRQEN_REG(v, port) LPAIF_WSA_IRQ_REG_ADDR(v, 0x0, port)
+#define LPAIF_WSA_IRQSTAT_REG(v, port) LPAIF_WSA_IRQ_REG_ADDR(v, 0x4, port)
+#define LPAIF_WSA_IRQCLEAR_REG(v, port) LPAIF_WSA_IRQ_REG_ADDR(v, 0xC, port)
+
 /* LPAIF VA IRQ */
 #define LPAIF_VA_IRQ_REG_ADDR(v, addr, port) \
 		(v->va_irq_reg_base + (addr) + v->va_irq_reg_stride * (port))
@@ -182,7 +190,9 @@
 #define LPAIF_CDC_RDMA_REG_ADDR(v, addr, chan, dai_id) \
 	(is_rxtx_cdc_dma_port(dai_id) ? \
 	(v->rxtx_rdma_reg_base + (addr) + v->rxtx_rdma_reg_stride * (chan)) : \
-	(v->va_rdma_reg_base + (addr) + v->va_rdma_reg_stride * (chan)))
+	(is_wsa_cdc_dma_port(dai_id) ? \
+	 (v->wsa_rdma_reg_base + (addr) + v->wsa_rdma_reg_stride * (chan)) : \
+	 (v->va_rdma_reg_base + (addr) + v->va_rdma_reg_stride * (chan))))
 
 #define LPAIF_CDC_RXTX_RDMACTL_REG(v, chan, dai_id) \
 		LPAIF_CDC_RDMA_REG_ADDR(v, 0x00, (chan), dai_id)
@@ -205,12 +215,28 @@
 #define LPAIF_CDC_VA_RDMA_INTF_REG(v, chan, dai_id) \
 	LPAIF_CDC_RDMA_REG_ADDR(v, 0x50, (chan), dai_id)
 
+#define LPAIF_CDC_WSA_RDMACTL_REG(v, chan, dai_id) \
+		LPAIF_CDC_RDMA_REG_ADDR(v, 0x00, (chan), dai_id)
+#define LPAIF_CDC_WSA_RDMABASE_REG(v, chan, dai_id) \
+		LPAIF_CDC_RDMA_REG_ADDR(v, 0x04, (chan), dai_id)
+#define LPAIF_CDC_WSA_RDMABUFF_REG(v, chan, dai_id) \
+		LPAIF_CDC_RDMA_REG_ADDR(v, 0x08, (chan), dai_id)
+#define LPAIF_CDC_WSA_RDMACURR_REG(v, chan, dai_id) \
+		LPAIF_CDC_RDMA_REG_ADDR(v, 0x0C, (chan), dai_id)
+#define LPAIF_CDC_WSA_RDMAPER_REG(v, chan, dai_id) \
+		LPAIF_CDC_RDMA_REG_ADDR(v, 0x10, (chan), dai_id)
+#define LPAIF_CDC_WSA_RDMA_INTF_REG(v, chan, dai_id) \
+	LPAIF_CDC_RDMA_REG_ADDR(v, 0x50, (chan), dai_id)
+
 #define LPAIF_CDC_WRDMA_REG_ADDR(v, addr, chan, dai_id) \
 	(is_rxtx_cdc_dma_port(dai_id) ? \
 	(v->rxtx_wrdma_reg_base + (addr) + \
 		v->rxtx_wrdma_reg_stride * (chan - v->rxtx_wrdma_channel_start)) : \
-	(v->va_wrdma_reg_base + (addr) + \
-		v->va_wrdma_reg_stride * (chan - v->va_wrdma_channel_start)))
+	(is_wsa_cdc_dma_port(dai_id) ? \
+	 (v->wsa_wrdma_reg_base + (addr) + \
+		v->wsa_wrdma_reg_stride * (chan - v->wsa_wrdma_channel_start)) : \
+	 (v->va_wrdma_reg_base + (addr) + \
+		v->va_wrdma_reg_stride * (chan - v->va_wrdma_channel_start))))
 
 #define LPAIF_CDC_RXTX_WRDMACTL_REG(v, chan, dai_id) \
 	LPAIF_CDC_WRDMA_REG_ADDR(v, 0x00, (chan), dai_id)
@@ -238,13 +264,28 @@
 #define LPAIF_CDC_VA_WRDMA_INTF_REG(v, chan, dai_id) \
 	LPAIF_CDC_WRDMA_REG_ADDR(v, 0x50, (chan), dai_id)
 
+#define LPAIF_CDC_WSA_WRDMACTL_REG(v, chan, dai_id) \
+	LPAIF_CDC_WRDMA_REG_ADDR(v, 0x00, (chan), dai_id)
+#define LPAIF_CDC_WSA_WRDMABASE_REG(v, chan, dai_id) \
+	LPAIF_CDC_WRDMA_REG_ADDR(v, 0x04, (chan), dai_id)
+#define LPAIF_CDC_WSA_WRDMABUFF_REG(v, chan, dai_id) \
+	LPAIF_CDC_WRDMA_REG_ADDR(v, 0x08, (chan), dai_id)
+#define LPAIF_CDC_WSA_WRDMACURR_REG(v, chan, dai_id) \
+	LPAIF_CDC_WRDMA_REG_ADDR(v, 0x0C, (chan), dai_id)
+#define LPAIF_CDC_WSA_WRDMAPER_REG(v, chan, dai_id) \
+	LPAIF_CDC_WRDMA_REG_ADDR(v, 0x10, (chan), dai_id)
+#define LPAIF_CDC_WSA_WRDMA_INTF_REG(v, chan, dai_id) \
+	LPAIF_CDC_WRDMA_REG_ADDR(v, 0x50, (chan), dai_id)
+
 #define __LPAIF_CDC_RDDMA_REG(v, chan, dir, reg, dai_id) \
 		(is_rxtx_cdc_dma_port(dai_id) ? LPAIF_CDC_RXTX_RDMA##reg##_REG(v, chan, dai_id) : \
-			LPAIF_CDC_VA_RDMA##reg##_REG(v, chan, dai_id))
+		 (is_wsa_cdc_dma_port(dai_id) ? LPAIF_CDC_WSA_RDMA##reg##_REG(v, chan, dai_id) : \
+			LPAIF_CDC_VA_RDMA##reg##_REG(v, chan, dai_id)))
 
 #define __LPAIF_CDC_WRDMA_REG(v, chan, dir, reg, dai_id) \
 		(is_rxtx_cdc_dma_port(dai_id) ? LPAIF_CDC_RXTX_WRDMA##reg##_REG(v, chan, dai_id) : \
-			LPAIF_CDC_VA_WRDMA##reg##_REG(v, chan, dai_id))
+		 (is_wsa_cdc_dma_port(dai_id) ? LPAIF_CDC_WSA_WRDMA##reg##_REG(v, chan, dai_id) : \
+			LPAIF_CDC_VA_WRDMA##reg##_REG(v, chan, dai_id)))
 
 #define __LPAIF_CDC_DMA_REG(v, chan, dir, reg, dai_id) \
 		((dir ==  SNDRV_PCM_STREAM_PLAYBACK) ? \
diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
index 9666049ae51b..99a7ce9ed769 100644
--- a/sound/soc/qcom/lpass-platform.c
+++ b/sound/soc/qcom/lpass-platform.c
@@ -97,6 +97,30 @@ static const struct snd_pcm_hardware lpass_platform_va_hardware = {
 	.fifo_size		=	0,
 };
 
+static const struct snd_pcm_hardware lpass_platform_wsa_hardware = {
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
 static int lpass_platform_alloc_rxtx_dmactl_fields(struct device *dev,
 					 struct regmap *map)
 {
@@ -141,6 +165,33 @@ static int lpass_platform_alloc_va_dmactl_fields(struct device *dev,
 					    &v->va_wrdma_intf, LPASS_CDC_DMA_REGISTER_FIELDS_MAX);
 }
 
+static int lpass_platform_alloc_wsa_dmactl_fields(struct device *dev,
+						  struct regmap *map)
+{
+	struct lpass_data *drvdata = dev_get_drvdata(dev);
+	const struct lpass_variant *v = drvdata->variant;
+	struct lpaif_dmactl *rd_dmactl, *wr_dmactl;
+	int rval;
+
+	rd_dmactl = devm_kzalloc(dev, sizeof(*rd_dmactl), GFP_KERNEL);
+	if (!rd_dmactl)
+		return -ENOMEM;
+
+	wr_dmactl = devm_kzalloc(dev, sizeof(*wr_dmactl), GFP_KERNEL);
+	if (!wr_dmactl)
+		return -ENOMEM;
+
+	drvdata->wsa_rd_dmactl = rd_dmactl;
+	drvdata->wsa_wr_dmactl = wr_dmactl;
+
+	rval = devm_regmap_field_bulk_alloc(dev, map, &rd_dmactl->intf,
+					    &v->wsa_rdma_intf, LPASS_CDC_DMA_REGISTER_FIELDS_MAX);
+	if (rval)
+		return rval;
+
+	return devm_regmap_field_bulk_alloc(dev, map, &wr_dmactl->intf,
+					    &v->wsa_wrdma_intf, LPASS_CDC_DMA_REGISTER_FIELDS_MAX);
+}
 
 static int lpass_platform_alloc_dmactl_fields(struct device *dev,
 					 struct regmap *map)
@@ -235,6 +286,11 @@ static int lpass_platform_pcmops_open(struct snd_soc_component *component,
 		map = drvdata->va_lpaif_map;
 		drvdata->va_substream[dma_ch] = substream;
 		break;
+	case LPASS_CDC_DMA_WSA_RX0 ... LPASS_CDC_DMA_WSA_RX9:
+	case LPASS_CDC_DMA_WSA_TX0 ... LPASS_CDC_DMA_WSA_TX8:
+		map = drvdata->wsa_lpaif_map;
+		drvdata->wsa_substream[dma_ch] = substream;
+		break;
 	default:
 		break;
 	}
@@ -263,6 +319,12 @@ static int lpass_platform_pcmops_open(struct snd_soc_component *component,
 		runtime->dma_bytes = lpass_platform_va_hardware.buffer_bytes_max;
 		snd_pcm_set_runtime_buffer(substream, &substream->dma_buffer);
 		break;
+	case LPASS_CDC_DMA_WSA_RX0 ... LPASS_CDC_DMA_WSA_RX9:
+	case LPASS_CDC_DMA_WSA_TX0 ... LPASS_CDC_DMA_WSA_TX8:
+		snd_soc_set_runtime_hwparams(substream, &lpass_platform_wsa_hardware);
+		runtime->dma_bytes = lpass_platform_wsa_hardware.buffer_bytes_max;
+		snd_pcm_set_runtime_buffer(substream, &substream->dma_buffer);
+		break;
 	default:
 		break;
 	}
@@ -305,6 +367,10 @@ static int lpass_platform_pcmops_close(struct snd_soc_component *component,
 	case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX8:
 		drvdata->va_substream[data->dma_ch] = NULL;
 		break;
+	case LPASS_CDC_DMA_WSA_RX0 ... LPASS_CDC_DMA_WSA_RX9:
+	case LPASS_CDC_DMA_WSA_TX0 ... LPASS_CDC_DMA_WSA_TX8:
+		drvdata->wsa_substream[data->dma_ch] = NULL;
+		break;
 	default:
 		break;
 	}
@@ -343,6 +409,12 @@ static struct lpaif_dmactl *__lpass_get_dmactl_handle(const struct snd_pcm_subst
 	case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX8:
 		dmactl = drvdata->va_wr_dmactl;
 		break;
+	case LPASS_CDC_DMA_WSA_RX0 ... LPASS_CDC_DMA_WSA_RX9:
+		dmactl = drvdata->wsa_rd_dmactl;
+		break;
+	case LPASS_CDC_DMA_WSA_TX0 ... LPASS_CDC_DMA_WSA_TX8:
+		dmactl = drvdata->wsa_wr_dmactl;
+		break;
 	}
 
 	return dmactl;
@@ -378,6 +450,12 @@ static int __lpass_get_id(const struct snd_pcm_substream *substream,
 	case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX8:
 		id = pcm_data->dma_ch - v->va_wrdma_channel_start;
 		break;
+	case LPASS_CDC_DMA_WSA_RX0 ... LPASS_CDC_DMA_WSA_RX9:
+		id = pcm_data->dma_ch;
+		break;
+	case LPASS_CDC_DMA_WSA_TX0 ... LPASS_CDC_DMA_WSA_TX8:
+		id = pcm_data->dma_ch - v->wsa_wrdma_channel_start;
+		break;
 	}
 
 	return id;
@@ -405,6 +483,10 @@ static struct regmap *__lpass_get_regmap_handle(const struct snd_pcm_substream *
 	case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX8:
 		map = drvdata->va_lpaif_map;
 		break;
+	case LPASS_CDC_DMA_WSA_RX0 ... LPASS_CDC_DMA_WSA_RX9:
+	case LPASS_CDC_DMA_WSA_TX0 ... LPASS_CDC_DMA_WSA_TX8:
+		map = drvdata->wsa_lpaif_map;
+		break;
 	}
 
 	return map;
@@ -489,6 +571,8 @@ static int lpass_platform_pcmops_hw_params(struct snd_soc_component *component,
 	case LPASS_CDC_DMA_RX0 ... LPASS_CDC_DMA_RX9:
 	case LPASS_CDC_DMA_TX0 ... LPASS_CDC_DMA_TX8:
 	case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX0:
+	case LPASS_CDC_DMA_WSA_RX0 ... LPASS_CDC_DMA_WSA_RX9:
+	case LPASS_CDC_DMA_WSA_TX0 ... LPASS_CDC_DMA_WSA_TX8:
 		break;
 	default:
 		dev_err(soc_runtime->dev, "%s: invalid  interface: %d\n", __func__, dai_id);
@@ -754,6 +838,21 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
 			val_mask = LPAIF_IRQ_ALL(ch);
 			val_irqen = LPAIF_IRQ_ALL(ch);
 			break;
+		case LPASS_CDC_DMA_WSA_RX0 ... LPASS_CDC_DMA_WSA_RX9:
+		case LPASS_CDC_DMA_WSA_TX0 ... LPASS_CDC_DMA_WSA_TX8:
+			ret = regmap_fields_write(dmactl->dyncclk, id, LPAIF_DMACTL_DYNCLK_ON);
+			if (ret) {
+				dev_err(soc_runtime->dev,
+					"error writing to rdmactl reg field: %d\n", ret);
+				return ret;
+			}
+			reg_irqclr = LPAIF_WSA_IRQCLEAR_REG(v, LPAIF_IRQ_PORT_HOST);
+			val_irqclr = LPAIF_IRQ_ALL(ch);
+
+			reg_irqen = LPAIF_WSA_IRQEN_REG(v, LPAIF_IRQ_PORT_HOST);
+			val_mask = LPAIF_IRQ_ALL(ch);
+			val_irqen = LPAIF_IRQ_ALL(ch);
+			break;
 		default:
 			dev_err(soc_runtime->dev, "%s: invalid %d interface\n", __func__, dai_id);
 			return -EINVAL;
@@ -830,6 +929,19 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
 			val_mask = LPAIF_IRQ_ALL(ch);
 			val_irqen = 0;
 			break;
+		case LPASS_CDC_DMA_WSA_RX0 ... LPASS_CDC_DMA_WSA_RX9:
+		case LPASS_CDC_DMA_WSA_TX0 ... LPASS_CDC_DMA_WSA_TX8:
+			ret = regmap_fields_write(dmactl->dyncclk, id, LPAIF_DMACTL_DYNCLK_OFF);
+			if (ret) {
+				dev_err(soc_runtime->dev,
+					"error writing to rdmactl reg field: %d\n", ret);
+				return ret;
+			}
+
+			reg_irqen = LPAIF_WSA_IRQEN_REG(v, LPAIF_IRQ_PORT_HOST);
+			val_mask = LPAIF_IRQ_ALL(ch);
+			val_irqen = 0;
+			break;
 		default:
 			dev_err(soc_runtime->dev, "%s: invalid %d interface\n", __func__, dai_id);
 			return -EINVAL;
@@ -956,6 +1068,12 @@ static irqreturn_t lpass_dma_interrupt_handler(
 		reg = LPAIF_VA_IRQCLEAR_REG(v, LPAIF_IRQ_PORT_HOST);
 		val = 0;
 	break;
+	case LPASS_CDC_DMA_WSA_RX0 ... LPASS_CDC_DMA_WSA_RX9:
+	case LPASS_CDC_DMA_WSA_TX0 ... LPASS_CDC_DMA_WSA_TX8:
+		map = drvdata->wsa_lpaif_map;
+		reg = LPAIF_WSA_IRQCLEAR_REG(v, LPAIF_IRQ_PORT_HOST);
+		val = 0;
+	break;
 	default:
 	dev_err(soc_runtime->dev, "%s: invalid  %d interface\n", __func__, dai_id);
 	return -EINVAL;
@@ -1116,6 +1234,35 @@ static irqreturn_t lpass_platform_vaif_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static irqreturn_t lpass_platform_wsaif_irq(int irq, void *data)
+{
+	struct lpass_data *drvdata = data;
+	const struct lpass_variant *v = drvdata->variant;
+	unsigned int irqs;
+	irqreturn_t rv;
+	int chan;
+
+	rv = regmap_read(drvdata->wsa_lpaif_map,
+			 LPAIF_WSA_IRQSTAT_REG(v, LPAIF_IRQ_PORT_HOST), &irqs);
+	if (rv) {
+		pr_err("error reading from wsa irqstat reg: %d\n", rv);
+		return IRQ_NONE;
+	}
+
+	/* Handle per channel interrupts */
+	for (chan = 0; chan < LPASS_MAX_CDC_DMA_CHANNELS; chan++) {
+		if (irqs & LPAIF_IRQ_ALL(chan) && drvdata->wsa_substream[chan]) {
+			rv = lpass_dma_interrupt_handler(
+						drvdata->wsa_substream[chan],
+						drvdata, chan, irqs);
+			if (rv != IRQ_HANDLED)
+				return rv;
+		}
+	}
+
+	return IRQ_HANDLED;
+}
+
 static int lpass_platform_prealloc_cdc_dma_buffer(struct snd_soc_component *component,
 						  struct snd_pcm *pcm, int dai_id)
 {
@@ -1148,6 +1295,14 @@ static int lpass_platform_prealloc_cdc_dma_buffer(struct snd_soc_component *comp
 		buf->bytes = lpass_platform_va_hardware.buffer_bytes_max;
 		buf->addr = drvdata->va_cdc_dma_lpm_buf;
 		break;
+	case LPASS_CDC_DMA_WSA_RX0 ... LPASS_CDC_DMA_WSA_RX9:
+		buf->bytes = lpass_platform_wsa_hardware.buffer_bytes_max;
+		buf->addr = drvdata->rxtx_cdc_dma_lpm_buf + LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE * 2;
+		break;
+	case LPASS_CDC_DMA_WSA_TX0 ... LPASS_CDC_DMA_WSA_TX8:
+		buf->bytes = lpass_platform_wsa_hardware.buffer_bytes_max;
+		buf->addr = drvdata->rxtx_cdc_dma_lpm_buf + LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE * 3;
+		break;
 	default:
 		break;
 	}
@@ -1351,6 +1506,34 @@ int asoc_qcom_lpass_platform_register(struct platform_device *pdev)
 				"error initializing va dmactl fields: %d\n", ret);
 			return ret;
 		}
+
+		if (drvdata->wsa_enable) {
+			ret = regmap_write(drvdata->wsa_lpaif_map,
+				LPAIF_WSA_IRQEN_REG(v, LPAIF_IRQ_PORT_HOST), 0x0);
+			if (ret) {
+				dev_err(&pdev->dev, "error writing to wsa irqen reg: %d\n", ret);
+				return ret;
+			}
+			drvdata->wsaif_irq = platform_get_irq_byname(pdev, "lpass-irq-wsaif");
+			if (drvdata->wsaif_irq < 0)
+				return -ENODEV;
+
+			ret = devm_request_irq(&pdev->dev, drvdata->wsaif_irq,
+					       lpass_platform_wsaif_irq, 0,
+					       "lpass-irq-wsaif", drvdata);
+			if (ret) {
+				dev_err(&pdev->dev, "wsa irq request failed: %d\n", ret);
+				return ret;
+			}
+
+			ret = lpass_platform_alloc_wsa_dmactl_fields(&pdev->dev,
+								     drvdata->wsa_lpaif_map);
+			if (ret) {
+				dev_err(&pdev->dev,
+					"error initializing wsa dmactl fields: %d\n", ret);
+				return ret;
+			}
+		}
 	}
 
 	if (drvdata->hdmi_port_enable) {
diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
index 4231466928d4..46ae02e67403 100644
--- a/sound/soc/qcom/lpass.h
+++ b/sound/soc/qcom/lpass.h
@@ -46,6 +46,8 @@ static inline bool is_cdc_dma_port(int dai_id)
 	case LPASS_CDC_DMA_RX0 ... LPASS_CDC_DMA_RX9:
 	case LPASS_CDC_DMA_TX0 ... LPASS_CDC_DMA_TX8:
 	case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX8:
+	case LPASS_CDC_DMA_WSA_RX0 ... LPASS_CDC_DMA_WSA_RX9:
+	case LPASS_CDC_DMA_WSA_TX0 ... LPASS_CDC_DMA_WSA_TX8:
 		return true;
 	}
 	return false;
@@ -61,6 +63,16 @@ static inline bool is_rxtx_cdc_dma_port(int dai_id)
 	return false;
 }
 
+static inline bool is_wsa_cdc_dma_port(int dai_id)
+{
+	switch (dai_id) {
+	case LPASS_CDC_DMA_WSA_RX0 ... LPASS_CDC_DMA_WSA_RX9:
+	case LPASS_CDC_DMA_WSA_TX0 ... LPASS_CDC_DMA_WSA_TX8:
+		return true;
+	}
+	return false;
+}
+
 struct lpaif_i2sctl {
 	struct regmap_field *loopback;
 	struct regmap_field *spken;
@@ -119,12 +131,14 @@ struct lpass_data {
 
 	int hdmi_port_enable;
 	int codec_dma_enable;
+	int wsa_enable;
 
 	/* low-power audio interface (LPAIF) registers */
 	void __iomem *lpaif;
 	void __iomem *hdmiif;
 	void __iomem *rxtx_lpaif;
 	void __iomem *va_lpaif;
+	void __iomem *wsa_lpaif;
 
 	u32 rxtx_cdc_dma_lpm_buf;
 	u32 va_cdc_dma_lpm_buf;
@@ -134,12 +148,14 @@ struct lpass_data {
 	struct regmap *hdmiif_map;
 	struct regmap *rxtx_lpaif_map;
 	struct regmap *va_lpaif_map;
+	struct regmap *wsa_lpaif_map;
 
 	/* interrupts from the low-power audio interface (LPAIF) */
 	int lpaif_irq;
 	int hdmiif_irq;
 	int rxtxif_irq;
 	int vaif_irq;
+	int wsaif_irq;
 
 	/* SOC specific variations in the LPASS IP integration */
 	const struct lpass_variant *variant;
@@ -149,12 +165,14 @@ struct lpass_data {
 	unsigned long hdmi_dma_ch_bit_map;
 	unsigned long rxtx_dma_ch_bit_map;
 	unsigned long va_dma_ch_bit_map;
+	unsigned long wsa_dma_ch_bit_map;
 
 	/* used it for handling interrupt per dma channel */
 	struct snd_pcm_substream *substream[LPASS_MAX_DMA_CHANNELS];
 	struct snd_pcm_substream *hdmi_substream[LPASS_MAX_HDMI_DMA_CHANNELS];
 	struct snd_pcm_substream *rxtx_substream[LPASS_MAX_CDC_DMA_CHANNELS];
 	struct snd_pcm_substream *va_substream[LPASS_MAX_CDC_DMA_CHANNELS];
+	struct snd_pcm_substream *wsa_substream[LPASS_MAX_CDC_DMA_CHANNELS];
 
 	/* SOC specific clock list */
 	struct clk_bulk_data *clks;
@@ -170,6 +188,8 @@ struct lpass_data {
 	struct lpaif_dmactl *rxtx_rd_dmactl;
 	struct lpaif_dmactl *rxtx_wr_dmactl;
 	struct lpaif_dmactl *va_wr_dmactl;
+	struct lpaif_dmactl *wsa_rd_dmactl;
+	struct lpaif_dmactl *wsa_wr_dmactl;
 
 	/* Regmap fields of HDMI_CTRL registers*/
 	struct regmap_field *hdmitx_legacy_en;
@@ -215,6 +235,15 @@ struct lpass_variant {
 	u32	va_wrdma_reg_base;
 	u32	va_wrdma_reg_stride;
 	u32	va_wrdma_channels;
+	u32	wsa_irq_reg_base;
+	u32	wsa_irq_reg_stride;
+	u32	wsa_irq_ports;
+	u32	wsa_rdma_reg_base;
+	u32	wsa_rdma_reg_stride;
+	u32	wsa_rdma_channels;
+	u32	wsa_wrdma_reg_base;
+	u32	wsa_wrdma_reg_stride;
+	u32	wsa_wrdma_channels;
 	u32	i2sctrl_reg_base;
 	u32	i2sctrl_reg_stride;
 	u32	i2s_ports;
@@ -369,6 +398,40 @@ struct lpass_variant {
 	struct reg_field va_wrdma_codec_ch;
 	struct reg_field va_wrdma_codec_fs_delay;
 
+	/* CDC WSA RD_DMA */
+	struct reg_field wsa_rdma_intf;
+	struct reg_field wsa_rdma_bursten;
+	struct reg_field wsa_rdma_wpscnt;
+	struct reg_field wsa_rdma_fifowm;
+	struct reg_field wsa_rdma_enable;
+	struct reg_field wsa_rdma_dyncclk;
+	struct reg_field wsa_rdma_burst8;
+	struct reg_field wsa_rdma_burst16;
+	struct reg_field wsa_rdma_dynburst;
+	struct reg_field wsa_rdma_codec_enable;
+	struct reg_field wsa_rdma_codec_pack;
+	struct reg_field wsa_rdma_codec_intf;
+	struct reg_field wsa_rdma_codec_fs_sel;
+	struct reg_field wsa_rdma_codec_ch;
+	struct reg_field wsa_rdma_codec_fs_delay;
+
+	/* CDC WSA WR_DMA */
+	struct reg_field wsa_wrdma_intf;
+	struct reg_field wsa_wrdma_bursten;
+	struct reg_field wsa_wrdma_wpscnt;
+	struct reg_field wsa_wrdma_fifowm;
+	struct reg_field wsa_wrdma_enable;
+	struct reg_field wsa_wrdma_dyncclk;
+	struct reg_field wsa_wrdma_burst8;
+	struct reg_field wsa_wrdma_burst16;
+	struct reg_field wsa_wrdma_dynburst;
+	struct reg_field wsa_wrdma_codec_enable;
+	struct reg_field wsa_wrdma_codec_pack;
+	struct reg_field wsa_wrdma_codec_intf;
+	struct reg_field wsa_wrdma_codec_fs_sel;
+	struct reg_field wsa_wrdma_codec_ch;
+	struct reg_field wsa_wrdma_codec_fs_delay;
+
 	/**
 	 * on SOCs like APQ8016 the channel control bits start
 	 * at different offset to ipq806x
@@ -377,6 +440,7 @@ struct lpass_variant {
 	u32	wrdma_channel_start;
 	u32	rxtx_wrdma_channel_start;
 	u32	va_wrdma_channel_start;
+	u32	wsa_wrdma_channel_start;
 
 	/* SOC specific initialization like clocks */
 	int (*init)(struct platform_device *pdev);

-- 
2.34.1

