Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D005421F12
	for <linux-sound@vger.kernel.org>; Tue,  9 Jun 2026 16:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781022204; cv=none; b=k2athxhft1QgpNcHWbK9o7FXX3KclRBBE2TYUCXhLGVapOrKH7J8Ynpw5RUE+xCYiqfWkIYgCmEGX8ZWhTfYku8dvMHbmEykaWflb3laZh/s6L+ChIWLvgaC7a08zxvfVlhZjBW/0s5Dsr2T2vo4azV5ivlQdzNKJLNAcTYg33k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781022204; c=relaxed/simple;
	bh=uNst4wFXLs+ypVn4MIocWwRHY+8OwRVsZ3rpweDmCq8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qlEzNKAtyYQWKoAf2gYa5I0Amvnzpbi8mWnzU+QvAaPoRbeeVOL1qdaQHZgLY2uACYr/jLIUJN36VkV/yytL/tJwVvXhy5/FFI9tAD4tgLjchXF3PbNwEo3td4v7dorGwZtOqVxtfp9g/rMyMH0yIy7vxUgJIFPC1s66qjMEbgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rXPcZaUp; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rXPcZaUp"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-915bf8800a2so363284785a.0
        for <linux-sound@vger.kernel.org>; Tue, 09 Jun 2026 09:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781022201; x=1781627001; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hd5q2/ML7LI707TCF3uo8+/EE69k9ucmyKQKjySdhtI=;
        b=rXPcZaUpkHQedBYwhSkI8mAueunvxxkFdx/gZW2EuWeaIP+STWQ6mq6vFPS9r0A3ch
         7pv/nbakY0mTCxGH6OrkFSYfCwVUmhuM1pgj1iWY+vCwKe+NsnTiTW45ahYM1j43W9/R
         hNMbP5BwNA+n3AfzHRU/82em9j8jLazsqFQuoDoUaNYohxcpzJWFNCHoTRMg8imnXqdz
         vSeUKSmaryUs1lyYaWi8ESDqbBJumOAGWHIm/Sl5ke7O/tFQq8CgIaPAa7zOrVp5rnkj
         avLWRMWRmpeXC5ZEn8DjBVGILteD0z/q77Vg8k7ozEZ3huTcVvexlQS8NMRo1l7GOTTR
         LnGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781022201; x=1781627001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hd5q2/ML7LI707TCF3uo8+/EE69k9ucmyKQKjySdhtI=;
        b=JkK9L6/+aA0B79hpY8TQpD80yDFylmTvx16VY318zeWr7es8jhFwqvowJquB02HFdG
         Y5psZ9zEag8nHTbbmv750uIQqm7G1R2UDUMPBmQd3uqtiTu/3pAcJ9X1YcgsC3WZk7ZW
         kerX93bz/DtiYfkYbX1CLMZlTtOysEqn10yLtKpRXxA9bLF2DouMxHv0xXknBNZPvJFG
         wGjgpjEqQpxzYhigBv4dP6+3QUYy0O4FRmQXErfTYcDYXpxGcHMVTtk1K7yWMRLdFER5
         CL4fFifztYPcgNbBtUMo4G+bnQdhU07UooZE4mBi+2tOxmCebdBRsN1h7D64LEoopid/
         HPOA==
X-Forwarded-Encrypted: i=1; AFNElJ9WetbOhwdbsOPYNznYHNL6NSUra9I0ynfsw/3PHGlYgx+k5Vq6v2QG3qBIH1cbNn/AVY+qQmrk/zbrxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWfkw8eg9X9g0n8XAc15NwiQPBoBu/dUeEv2gkToxDvmB0Bov4
	G2DnoHT4iYIu+qPjv1Apt38zEn+qfPP1N3Bl8gcIblBLG+nwVCdD8H/9xKZ2+w==
X-Gm-Gg: Acq92OFYfyGVma6B053d3UF5KKs2H/g88JY2YFPNLCr552o5cHh+6zKFBqPCXpMS0ZJ
	zeerf+9zbDFvhoYWfzKEcnVQTEBys+0MYUbR0W499ViIy+3cKWtJZw/TzwdQDA/icX4tojDZxVo
	Pgw0u+g6b/A/rtCCVDBaZnDL4S2q4zOrbLFPrvex8Yoy2pP/xQ37scDNMSKHaSdo1OvktmMEcK2
	hUX3s+HLhtYZxKtOyL9rgFApngxUckDkI/0OrZ11xfM6TwqlGTmAm9LrFCoPXB/z2/iaUlzptqV
	zgyYMNZEtU7pExYITYsWJC4qqm7gIK5Ov5jNFMWG3FUSkYuwlu5GG/dH/ndMj0T9cD9LKU0Dc3P
	p0lyj1v6CHEisGi7wjEim2l19gDiNZKgyjpKvtI1p0OmPBJoK2S5HyF6YgDJXsfTHLROA92jGlF
	JUyNIJIKT/Te43xKTsiTOoPYroEWXzWhnI3cX1SYXCAA90gnxv
X-Received: by 2002:a05:620a:1b8d:b0:915:8502:f7f6 with SMTP id af79cd13be357-915a9d7e7demr3356211685a.35.1781022200907;
        Tue, 09 Jun 2026 09:23:20 -0700 (PDT)
Received: from localhost ([142.181.163.192])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a3d250dsm2157148685a.38.2026.06.09.09.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 09:23:20 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Adam Skladowski <a39.skl@gmail.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v5 14/15] ASoC: msm8916-wcd-analog: add pm8953 codec
Date: Tue,  9 Jun 2026 12:22:54 -0400
Message-ID: <20260609162255.31074-15-mailingradian@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609162255.31074-1-mailingradian@gmail.com>
References: <20260609162255.31074-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vladimir Lypak <vladimir.lypak@gmail.com>

Add regs overrides for PM8953 codec.

Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
[Adam: rename codec]
Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 sound/soc/codecs/msm8916-wcd-analog.c | 29 +++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/sound/soc/codecs/msm8916-wcd-analog.c b/sound/soc/codecs/msm8916-wcd-analog.c
index 13df60409857..b9325290c28d 100644
--- a/sound/soc/codecs/msm8916-wcd-analog.c
+++ b/sound/soc/codecs/msm8916-wcd-analog.c
@@ -755,6 +755,34 @@ static const struct wcd_reg_seq pm8950_data = {
 	.seq_size = ARRAY_SIZE(wcd_reg_defaults_pm8950),
 };
 
+static const struct reg_default wcd_reg_defaults_pm8953[] = {
+	{CDC_A_RX_COM_OCP_CTL, 0xd1},
+	{CDC_A_RX_COM_OCP_COUNT, 0xff},
+	{CDC_D_SEC_ACCESS, 0xa5},
+	{CDC_D_PERPH_RESET_CTL3, 0x0f},
+	{CDC_A_TX_1_2_OPAMP_BIAS, 0x4c},
+	{CDC_A_NCP_FBCTRL, 0xa8},
+	{CDC_A_NCP_VCTRL, 0xa4},
+	{CDC_A_SPKR_DRV_CTL, 0x69},
+	{CDC_A_SPKR_DRV_DBG, 0x01},
+	{CDC_A_SEC_ACCESS, 0xa5},
+	{CDC_A_PERPH_RESET_CTL3, 0x0f},
+	{CDC_A_CURRENT_LIMIT, 0xa2},
+	{CDC_A_BYPASS_MODE, 0x18},
+	{CDC_A_SPKR_ANA_BIAS_SET, 0x41},
+	{CDC_A_SPKR_DAC_CTL, 0x03},
+	{CDC_A_SPKR_OCP_CTL, 0xe1},
+	{CDC_A_RX_HPH_BIAS_PA, 0xfa},
+	{CDC_A_RX_EAR_STATUS, 0x10},
+	{CDC_A_MASTER_BIAS_CTL, 0x30},
+	{CDC_A_MICB_1_INT_RBIAS, 0x00},
+};
+
+static const struct wcd_reg_seq pm8953_data = {
+	.seq = wcd_reg_defaults_pm8953,
+	.seq_size = ARRAY_SIZE(wcd_reg_defaults_pm8953),
+};
+
 static int pm8916_wcd_analog_probe(struct snd_soc_component *component)
 {
 	struct pm8916_wcd_analog_priv *priv = dev_get_drvdata(component->dev);
@@ -1304,6 +1332,7 @@ static int pm8916_wcd_analog_spmi_probe(struct platform_device *pdev)
 static const struct of_device_id pm8916_wcd_analog_spmi_match_table[] = {
 	{ .compatible = "qcom,pm8916-wcd-analog-codec", .data = &pm8916_data },
 	{ .compatible = "qcom,pm8950-wcd-analog-codec", .data = &pm8950_data },
+	{ .compatible = "qcom,pm8953-wcd-analog-codec", .data = &pm8953_data },
 	{ }
 };
 
-- 
2.54.0

