Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6F9459AEA
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 11:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784804565; cv=none; b=mwA/jkS+0Gp0t12FDnZiiivAAUADUw3y8mVh8KqrMh0CNd5erghtUfUH72vZ2PKNkYt7gY28WzClssQdHUu7KVpY1YDPYJhB8gx5uSs10JqNien60OXTjdP0NYEimXThHCLuy7J73KXPmfAW1dP0ynF23CTdvK6hJJLM1UeENv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784804565; c=relaxed/simple;
	bh=AeF95fVBkXQHjZe3deRFzWsnd2r2EkFVq7mGy0W9i+M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=V4l5LNePDBnImakZ6PAJjqP/urzcwx0IcIo2kfMm/DRW+6JR5RvKg/SQ+i6FqcDeIioTpmE184jEMwRhL+G/JqOMzwVygtveJbeidPGOS6k+jettiudImdD6kn4/EmQCmUXBm1HizbjcxRstmgpp6mb4runy6KiPZbr/Y8PeGBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bm+zaaL1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g9d+zeYF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bm+zaaL1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g9d+zeYF"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qxWe3789846
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 11:02:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=y/hifr7TctT
	IAM+pED/3FIWf38Eroiy6gXo1FithD2M=; b=Bm+zaaL1HCuQxAQdLX//7ijF4sv
	sgXikxrx6wov5f7p1WUCvVXQ0zVLiYLzGQYkJ92aouTknROOAismoukiG4hPQ7MY
	0vW4a++HbE/GnOwZ9jDCSgBSQy38WKDP2FcFPtvREOgqrGCUYIxYZNgmd7vVDFf+
	yfuU2paxYZXrUICjT20DscZEzrKs3O41jw8YZYOWUEiPJB2ayvG/8dZZI8/fyEyW
	VyQcGJ3JaAhkIDddGL9S+XNK8HbfNSxHoaxu0NxVQ5O5XA4Sia+mzdwfTEa4jGv/
	ziibXRK7HOAEto48qKOaZNuuHKg2FsOGKkVw4zuUhrQtJ2KufHUnRR8+GVw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk7b52etu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 11:02:42 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e475f83a2so883675a91.1
        for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 04:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784804561; x=1785409361; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y/hifr7TctTIAM+pED/3FIWf38Eroiy6gXo1FithD2M=;
        b=g9d+zeYF2TkmQ8jCYLHiPKsaUi3DZ0AQ7q905AvTCmstjxz9ju23aNYnKk8oQIMoXB
         AWS14ONfY7/N5gUO40X8+0yunSGD2B7yhDy+XiwgP5wpVLNtQ5XSV/SEVR7XRJ0daqV7
         AFF3yulXI7pragenibpNczyCcomBQ7c5TirwQErJdDlvPOVtshNPmWquEM3PQ7+lZ7h+
         SVpMFuOT4wLbjXfV2Pb4HNA0q5Qkj6rHXwc/WJHrllH9eu5bsWCBZFNPNMjT47vG8PFl
         SkE+kPospxqk03WL0OYiu/m2ymvoW6AQkP6Hvl9jqshhFrpuZUJitvGwGGypLQJ2Vhrj
         D7GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784804561; x=1785409361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y/hifr7TctTIAM+pED/3FIWf38Eroiy6gXo1FithD2M=;
        b=H9aoiNzLT1GoiAgzd8n2rMuGTJVu7kHPhBm5eXqnhgjNvFplQGNmu+4Xmg2ykO2MsN
         TO1HFK7i1xa2sOZn8xhINSSu7RWy1zs6vy6u9mqnyyOLYTw+KRxxuW6F+ItOXeZeYJPb
         ihe10jJZegbpjNvMxWHKPXyelqQmz9+uHANUbs7P6NA4VxY/VsUU6sqFzl6AARZ7M4mx
         ykqzV7lERv/vExpxGbsgxrHvViocBPoKGv75t3eTRFEDiuSRt/bf4qe0i/MIXzKh3sQP
         XlQnQMtcfvKznADbKuyEBS1inx4I+I3Uho8GLH6rn+h61ZUL8Wx0biZas3ILQ7YDx381
         bRBw==
X-Forwarded-Encrypted: i=1; AHgh+RqNem3+4AjuLYIIdN/0KIvDt1s/A9xyT9Sa2SI4Scv890bKUBPjUWiG0W3C4isVltRj0rPHFR3nJbMdYw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmSpySlsZcG4WMs+3VauelVgmXt0S5KmWBDYULRFeNBo52PG2e
	RWLVSgXyEEzu9dfllnvQ6sQSU7e7XbkSgGUQF8VzTLSZrVQpf64Qlli8FRIuB48HHJabk9kbxNk
	9VB7HNsnqWEaf8tgS00cm0QQi86EGdILy7vOvRHXTupM3/n+Xnj+AOrpzoT6Vsd2ZLw==
X-Gm-Gg: AR+sD11lgJW1r72EFVERCkRXeJcc1dMKkInTmm1q0+siaC29RV2+LveibzUdmQGjuLM
	6luYeGPykdiJJS1B7cpycwY/Uw1d3MocSnUSQkcC3OiXet2WUu596mXxmWq2BdP+I5hG6vNEa/M
	Oa+Sb08HmgH40pbsmC2RfYwN04xD8mW+YWjbsfYAZcLDS5EpQBqlmEjVWcs1DzWu7W2tYcyNo7m
	swy5eVawls4+2Elk/OgosJLvgX7A26IQtrzpdKSmGqmEwHPvHopgfP4dpfRSYzebOWWk9rLMOlu
	Daha1G4Yhk8wM3/Ua0qGuv9I02bz0BeA2rZFZQMFhNaRWGCOM4Li7emadEzRoUvajyRt5U8GrHP
	UGJBWRkMj6Wsz+xy+9g==
X-Received: by 2002:a17:90b:264c:b0:38d:ecfe:41aa with SMTP id 98e67ed59e1d1-38ec666d8d9mr2743157a91.43.1784804561326;
        Thu, 23 Jul 2026 04:02:41 -0700 (PDT)
X-Received: by 2002:a17:90b:264c:b0:38d:ecfe:41aa with SMTP id 98e67ed59e1d1-38ec666d8d9mr2743086a91.43.1784804560694;
        Thu, 23 Jul 2026 04:02:40 -0700 (PDT)
Received: from localhost ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130a7738sm15662491c88.9.2026.07.23.04.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 04:02:40 -0700 (PDT)
From: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
To: andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        bmasney@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
        perex@perex.cz, tiwai@suse.com, srinivas.kandagatla@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org
Subject: [PATCH v3 2/2] clk: qcom: Add LPASS VA CSR heartbeat pulse clock
Date: Thu, 23 Jul 2026 16:32:31 +0530
Message-Id: <20260723110231.1586417-3-sarath.ganapathiraju@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260723110231.1586417-1-sarath.ganapathiraju@oss.qualcomm.com>
References: <20260723110231.1586417-1-sarath.ganapathiraju@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEwOCBTYWx0ZWRfX6fgrxmA4/Ktk
 Pgor7FI824/JVw4J2Cy+IAuMDXwB2aB0ukLnMhAXmTKY8hdx01uujciwbapomN3cLmDIpON4NCQ
 4dF1uk6g1DQKYHJZWEPC79DHBAtrwZLqv2m8z/zoGvy7tzKhs6BYNaplcadQS/lJf+2aOZClxv+
 TDHk3zO/Sv5JMjIJmoLBgSNh623CPj0SsA5QsaRX5imcIPUOSL31TZV2RveIbW+dZ3mHaSzdqEk
 PV90E8emgL5mmX3FzLiWLurTP5W2U1n5W0+6mA22fx0qSJvADoDVHMuvra5zD/Ucmd5OoKPmg9w
 SbUpqiXGLyE4L+lxZYLK7rJEGSeH6pBaLGA8MYWd+ZAvVtaHDkch26KId+YeaAGUxukzctcuUuX
 w8NIOXuXWGIjrxgnH8tycIPOfxLoq8UcrgJJcu91+BZ0+TmWh3wPiRh2/Izs2JZWmnOevI5OJfH
 3SsJw+y0WoGGYry6y4w==
X-Proofpoint-GUID: Clb-DO_Cfc9JHcGOFI9fCsPq6vILxYil
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEwOCBTYWx0ZWRfX0Jzbi4QoYlRD
 JUX72l02GnMfDTBiDvetrBMg9iswPRra1xqghLhdae6uCAtKAJL/+g5ZwR9tri6AxeH+1om/1Mz
 jwXABHPJ9j+60Tzv/0Wh2xckm/FLUYo=
X-Authority-Analysis: v=2.4 cv=btx8wkai c=1 sm=1 tr=0 ts=6a61f4d2 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=_fnN9qMbF0sNbu7Dp7gA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: Clb-DO_Cfc9JHcGOFI9fCsPq6vILxYil
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230108

The HeartBeat Pulse (also known as RateGen Pulse) synchronizes the
start of the DMAs and Codec Interfaces for the audio usecases and
can serve as a periodic wakeup source for the DSP.

Add the LPASS VA CSR driver that models the rate generator as a clock
provider so it is enabled and disabled automatically alongside the
other clocks during runtime PM resume and suspend.

Signed-off-by: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig        |  12 +++
 drivers/clk/qcom/Makefile       |   1 +
 drivers/clk/qcom/lpass-va-csr.c | 143 ++++++++++++++++++++++++++++++++
 sound/soc/codecs/Kconfig        |   1 +
 4 files changed, 157 insertions(+)
 create mode 100644 drivers/clk/qcom/lpass-va-csr.c

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 63f271aff177..6ebdccfe37e0 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -1998,6 +1998,18 @@ config CLK_GFM_LPASS_SM8250
 	  Support for the Glitch Free Mux (GFM) Low power audio
           subsystem (LPASS) clocks found on SM8250 SoCs.
 
+config QCOM_CLK_LPASS_VA_CSR
+	tristate "Qualcomm LPASS VA CSR heartbeat pulse clock provider"
+	depends on COMMON_CLK
+	select REGMAP_MMIO
+	help
+	  Qualcomm LPASS VA CSR block contains the rate generator hardware
+	  that produces the HeartBeat Pulse (also known as RateGen Pulse).
+	  This driver models the rate generator as a clock provider so
+	  that consumers can enable or disable it via the common clock
+	  framework, and it can be used to synchronize the start of DMAs
+	  and Codec Interfaces or as a periodic wakeup source for the DSP.
+
 config SM_VIDEOCC_8450
 	tristate "SM8450 Video Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index db7689ee5dc6..2be7da737eba 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -24,6 +24,7 @@ obj-$(CONFIG_CLK_ELIZA_DISPCC) += dispcc-eliza.o
 obj-$(CONFIG_CLK_ELIZA_GCC) += gcc-eliza.o
 obj-$(CONFIG_CLK_ELIZA_TCSRCC) += tcsrcc-eliza.o
 obj-$(CONFIG_CLK_GFM_LPASS_SM8250) += lpass-gfm-sm8250.o
+obj-$(CONFIG_QCOM_CLK_LPASS_VA_CSR) += lpass-va-csr.o
 obj-$(CONFIG_CLK_GLYMUR_CAMCC) += camcc-glymur.o
 obj-$(CONFIG_CLK_GLYMUR_DISPCC) += dispcc-glymur.o
 obj-$(CONFIG_CLK_GLYMUR_EVACC) += evacc-glymur.o
diff --git a/drivers/clk/qcom/lpass-va-csr.c b/drivers/clk/qcom/lpass-va-csr.c
new file mode 100644
index 000000000000..1d0805789e25
--- /dev/null
+++ b/drivers/clk/qcom/lpass-va-csr.c
@@ -0,0 +1,143 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/of_clk.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#define LPASS_RATE_GEN_CTRL		0xd000
+#define LPASS_RATE_GEN_COUNTER_0	0xd004
+#define LPASS_RATE_GEN_DELAY		0xd010
+
+#define LPASS_RATE_GEN_MAX_REG		LPASS_RATE_GEN_DELAY
+
+#define LPASS_RG_CTRL_EN		BIT(0)
+
+struct lpass_va_csr_data {
+	u32 counter_0;
+	u32 delay;
+};
+
+static const struct lpass_va_csr_data hawi_csr_data = {
+	.counter_0 = 0x960,
+	.delay = 0x16,
+};
+
+static const struct regmap_config lpass_rate_gen_regmap_config = {
+	.name = "lpass_rate_gen",
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.max_register = LPASS_RATE_GEN_MAX_REG,
+	.cache_type = REGCACHE_MAPLE,
+};
+
+struct lpass_va_csr {
+	struct regmap *regmap;
+	const struct lpass_va_csr_data *data;
+	struct clk_hw hb_hw;
+};
+
+#define to_lpass_va_csr(_hw) container_of(_hw, struct lpass_va_csr, hb_hw)
+
+static int heartbeat_pulse_prepare(struct clk_hw *hw)
+{
+	struct lpass_va_csr *csr = to_lpass_va_csr(hw);
+	int ret;
+
+	ret = regmap_write(csr->regmap, LPASS_RATE_GEN_COUNTER_0, csr->data->counter_0);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(csr->regmap, LPASS_RATE_GEN_DELAY, csr->data->delay);
+	if (ret)
+		return ret;
+
+	return regmap_set_bits(csr->regmap, LPASS_RATE_GEN_CTRL, LPASS_RG_CTRL_EN);
+}
+
+static void heartbeat_pulse_unprepare(struct clk_hw *hw)
+{
+	struct lpass_va_csr *csr = to_lpass_va_csr(hw);
+
+	regmap_clear_bits(csr->regmap, LPASS_RATE_GEN_CTRL, LPASS_RG_CTRL_EN);
+}
+
+static int heartbeat_pulse_is_prepared(struct clk_hw *hw)
+{
+	struct lpass_va_csr *csr = to_lpass_va_csr(hw);
+
+	return regmap_test_bits(csr->regmap, LPASS_RATE_GEN_CTRL, LPASS_RG_CTRL_EN);
+}
+
+static const struct clk_ops heartbeat_pulse_ops = {
+	.prepare = heartbeat_pulse_prepare,
+	.unprepare = heartbeat_pulse_unprepare,
+	.is_prepared = heartbeat_pulse_is_prepared,
+};
+
+static int lpass_va_csr_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct lpass_va_csr *csr;
+	struct clk_init_data init = {
+		.name = "lpass_heartbeat_pulse",
+		.ops = &heartbeat_pulse_ops,
+	};
+	void __iomem *base;
+	int ret;
+
+	csr = devm_kzalloc(dev, sizeof(*csr), GFP_KERNEL);
+	if (!csr)
+		return -ENOMEM;
+
+	csr->data = of_device_get_match_data(dev);
+	if (!csr->data)
+		return dev_err_probe(dev, -EINVAL, "no variant data for compatible\n");
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	csr->regmap = devm_regmap_init_mmio(dev, base,
+					    &lpass_rate_gen_regmap_config);
+	if (IS_ERR(csr->regmap))
+		return dev_err_probe(dev, PTR_ERR(csr->regmap),
+				     "failed to init regmap\n");
+
+	csr->hb_hw.init = &init;
+
+	ret = devm_clk_hw_register(dev, &csr->hb_hw);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to register heartbeat clock\n");
+
+	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, &csr->hb_hw);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to add clock provider\n");
+
+	return 0;
+}
+
+static const struct of_device_id lpass_va_csr_dt_match[] = {
+	{ .compatible = "qcom,hawi-lpass-va-csr", .data = &hawi_csr_data },
+	{}
+};
+MODULE_DEVICE_TABLE(of, lpass_va_csr_dt_match);
+
+static struct platform_driver lpass_va_csr_driver = {
+	.driver = {
+		.name = "qcom-lpass-va-csr",
+		.of_match_table = lpass_va_csr_dt_match,
+	},
+	.probe = lpass_va_csr_probe,
+};
+
+module_platform_driver(lpass_va_csr_driver);
+
+MODULE_DESCRIPTION("Qualcomm LPASS VA CSR heartbeat pulse clock provider");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 76e90144ea91..704401faa147 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -2907,6 +2907,7 @@ config SND_SOC_LPASS_VA_MACRO
 	depends on PM_CLK
 	select REGMAP_MMIO
 	select SND_SOC_LPASS_MACRO_COMMON
+	select QCOM_CLK_LPASS_VA_CSR
 	tristate "Qualcomm VA Macro in LPASS(Low Power Audio SubSystem)"
 
 config SND_SOC_LPASS_RX_MACRO
-- 
2.34.1

