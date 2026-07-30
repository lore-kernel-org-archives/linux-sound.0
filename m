Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A3C44607E
	for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 17:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785433496; cv=none; b=fOIogy4PzljMGBXoIXrgRYz8hpPmje8+pr+Ly3W+qBPcI0WMO/9EaOZLUW2i0LOsZIJbgLREgnYk/6Dkd/47WL3eaoQCdzpJ04IS4RafB+6AU3KyTNiFRAGzixgowfD9uaw0uSo4zvmOYjUUZ4k0l+RDQK0FYB+lWCAdJM3C8vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785433496; c=relaxed/simple;
	bh=hx4JRaTXkRNl8Qmd0zwEbjjeoJeFJ4pbrhXvAncuQ10=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KrjhIz+fnIeo1zDrsRNsHjY5VY9vuHQ9s2ffeeuUMX89cHlOWnXhHq0rdQbRRi6bqssnXzAQZVyqjbmUfDUXS/ke+2bF7TjD0aQqq4UWCgXY50QVtekkD1JkO+fNTaDcsWzgZ1zR1526emMkJdJXtRxWaEe6saXXOka/WxdZIMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=of+KmXF2; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="of+KmXF2"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-9305a2121a1so5204785a.2
        for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 10:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785433493; x=1786038293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6n0XV9NmQ+dvwbWtdA1cuHJEqGEz7UdqIL5rRS8x6uI=;
        b=of+KmXF2uTiR232UUQm2BfgZEzQ6AiSdzVvxRHjkBz0vfCtv22j1IaaV+zdjdiTgTc
         yd54HH8E+iv2XE2lps3efnNSSLfALkThEsgy0jtlevDILhrGC+to2K/uDmKCd2FpibDM
         5WSow8CmXimJfAZycVJzUuikVw6fjGNVfmAtwmeWW6GsmxAEvjCc6/yqNYi0MmVgb1rj
         yMlgUM6dXMPPIcZMs1mIpoubOdj2ehpvMNKXUOrJYPG4mRsNFP6jTezbSupjF2y5+nNW
         h0Tw6e1aRdXdzk9VusFkrhBCni819n2vWNctcKtAQqYeZRTjObTlH/ozCayEgwShleNI
         ETPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785433493; x=1786038293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6n0XV9NmQ+dvwbWtdA1cuHJEqGEz7UdqIL5rRS8x6uI=;
        b=c8rPBqqNb1mTzIV0ukSLcx/9+cB9U9RNI8Oif+ZHE6AqSsiohjkQc05AvAhF3f/vcM
         mPhaF+IpbdaJXg/1hpTIneuxKksX042n5WBwqWYykx/Qk5hTsVScU5+QR6CEtchafiBA
         JO8OX8vQ+/Q/N0um3kvkC6PNntIi2icjm2z0X7mlzHOkpe6QGMeX8+I8drOkG5YxbQ6e
         2ltkhEwddJF3FDajpDHettG0ALgowlJQHlEoHLJmiUV4bbpUm1HiWKAr3FFagZmEYAVo
         huOwP/I8DPagVuzsadCABj4rUJ/bZ6DPBx3XQxein+YWDYkh9xCgoNggF/fPiN/jE+nA
         7Hhg==
X-Forwarded-Encrypted: i=1; AHgh+RoTdpfgb7vC9kMU80iha/+NNK0beHOuxypiVkNyNQs02CTBgDvDJHadKfmGYKhhzbsvdqj4+GblnbCqdg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8pP/0en70w1QVE5dA9YKb+DJmZi5FAo37SNvUXa0mMY4PzBV7
	bosNaNtE4aLJl1BwzdZTLdIwB7Kz+yP3NN77QVUW4nBu0ySsDIBlDjXl
X-Gm-Gg: AR+sD11hcQn/BJ2qaum8BP06wNCjD1zqHRZZoALEjAWngRRE+g3nDfP0pW73yufVVGP
	1Lyhy8HgZtzBJwXydxoq4j9GVFX09Fw6PfYLK5I38lmfmvqWsiaia2CvMyQ7xdlkYFwvrSqG3dM
	3tp3duirjgVkxYdUaFxJgLSsP/DZXJktsbpKZkvAhRtsa7kZJQeWYjSC4F/5XIwRQgaSKlWWgr1
	eo4rOPnixcIcSRmV6GSTqoprvgbDjNP5L3RpCHB9cyvZogt+yXZFitFRxfMoa+MDg32agQu/Sse
	6XBYiCRndg3MFPhPwf7jD5KK/Iori2wRtrO3hf/S1bdFqrt1pRsGfx4zFNst8eacy13Oh1dCrPj
	VgQQNYuF/O/fEVv7arRWnTelJ7AacgH0UHHd3zOXYg6E2m0rZcffngXgT20U04fdBzMpQmTzBSf
	J2H5eKa2UV3JNgj27kqa2SwmeirgfKFH6fem5TvsbNxJHo3DzHeSwwJ5Bq+2lZwN9lZs+tMw==
X-Received: by 2002:a05:620a:2913:b0:92e:d5f6:2e71 with SMTP id af79cd13be357-93485f8ea4bmr391612985a.14.1785433492735;
        Thu, 30 Jul 2026 10:44:52 -0700 (PDT)
Received: from localhost ([70.54.57.80])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-933d3220f1bsm459525085a.9.2026.07.30.10.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 10:44:52 -0700 (PDT)
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
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
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
Subject: [PATCH v6 14/15] ASoC: msm8916-wcd-analog: add pm8953 codec
Date: Thu, 30 Jul 2026 13:43:52 -0400
Message-ID: <20260730174353.108023-15-mailingradian@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260730174353.108023-1-mailingradian@gmail.com>
References: <20260730174353.108023-1-mailingradian@gmail.com>
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
2.55.0

