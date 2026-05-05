Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6113016F5
	for <linux-sound@vger.kernel.org>; Tue,  5 May 2026 10:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777976901; cv=none; b=TLqrhuDh2ErJvKecjREKCnwzVhN+g7Qg7THcF/vzg9avkBr/r9TsEiBYSooqNAdtZb6b2X0Uo/F0sdxUjW4US9yoo2C+oW6gneF+pRxN3BNzfT7jCBxKLFrgyrOyf7FOwG2f7Lfyk0nIq33w0jqtObmrHQF2IonYo/Z6MNjg+YU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777976901; c=relaxed/simple;
	bh=yrkwkHJYfYh4Qd/e6Jm0X0iKhU1/cDPw/TDKkqjnpUg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dcBJ0518RF3IhhHKC9NHAOiJJ5iSCS95osnLWdncF0XhiTwwkVhAqa2WqCFPm/TBXE+NPZ3WpQQz9CH0Fs6SVxleCFdpe0OTfLvmuvfsUU8ySG/VmzDFO0IaCV3xNWCaLERdfat9iGcqSuDBK1K4tNZWHPKdLQI0sI2wsmDN4DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E0a6wCbd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a1R+wNbQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E0a6wCbd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a1R+wNbQ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6456m2SN3187946
	for <linux-sound@vger.kernel.org>; Tue, 5 May 2026 10:28:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=F0yHkPJ2+So
	SmvwYpxfgmYiW9SG2320qnH+LsMaHO78=; b=E0a6wCbdIjr2WquOQ71GnfL9AVE
	vrQq1bGSI4eCKxCxPPcQAbREs38xzniMOeeNXAZNYR/VyIpYStzgQDR4Vvx2QwAT
	xGXg6V6tcJcwNLSbaUlj3acAP8hRCOoODvS86/LVmPmc7koBnihm63vcfk/GSp1M
	V+JlskZ2ekidRagRq6IMG5GeOyQ1h9TO3IWLKfEM+ZY+VkND2C1iGXBqMDP6SXIs
	QZB2RIRTwAs8Ve6n36KEnFfNz+8fF8YhVOzqPMmlqW96UjMKVzI7iwJc7NVSFfbK
	sr/YXWfKCIBXLu/XeDj9affZRjwBKp5czWgg1bliLamNb0nBs7IJaFyzbCQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dybkk8t9v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 05 May 2026 10:28:19 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d6bf346adso86373691cf.1
        for <linux-sound@vger.kernel.org>; Tue, 05 May 2026 03:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777976898; x=1778581698; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F0yHkPJ2+SoSmvwYpxfgmYiW9SG2320qnH+LsMaHO78=;
        b=a1R+wNbQM972udhW4s/cmN9Uc2oGeV2P0WEKdOCH+o9jlmwq8ELvvZ9SoGnRJ/oG0Y
         g/SyDPL2ETZwmk+wkUkY9eyozAJCh4bCujZ1JJRa+hb1/RiLvkcwCuNrtLahZRk9TgQu
         wZHtsT6spUqN9eSv1UlvJoOo0tJ5g3WpRqwVy+h3rUx5DLybEZ0wsUKgfA1ih9JAB+0S
         kv5NEcvMUgEoki5NwF7ClM/DOfcdJMxS4E9e2yWyhcDuhNsUwqMJ7G1IWXOZe2bRb+0J
         wfjtA0Jf56ibsSMQDeJVJKP1m1GB0EBsOTcqA/rEyyn2pY33lXBzTPTCL2xWSzfoeFhv
         KFxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777976898; x=1778581698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F0yHkPJ2+SoSmvwYpxfgmYiW9SG2320qnH+LsMaHO78=;
        b=luwsYkVVGy/paNB5/CxX1YXseMjMjc6OBs3EGAlam/5mCwkTvO+CvoMoit6plzKfK+
         DKX3MxnUN7LNE3AmtP98+64R8s4r5ymBxNDjU+01g/6cn6A6DMf7DVOZc9LW/cbrKCXX
         y5lfg5xeVstqBVSp8xzW1w5YWdgvkwGlgp8t/jk7Cb8Wjs72QosGpObVC4y+B4ORXx24
         tLfMlfbd3xgUVVCt4nLfJyYTZrCFPLgz4jkVsD5g8YAwHC6LAe0loOpbw/4enArELyGh
         8b9ahwUHeaayy1K+gXFg4X7O1WIiKLUc8ROx6Ecys3FGxlIhrn/AX6SVZ2lUJ9V1eyL2
         +Q6w==
X-Forwarded-Encrypted: i=1; AFNElJ+k7wQsYrNX4W3vfzIXLQH3WDKvPi0O7e12muXASxFumwL/PLoVDbVrn+3dd2KE4wk+rjzsCuGULsRt3A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxdvJ/tYQMhqKRmYlGzHs5YwabHLIwcuSOEnHij0EhpYiXuTSVG
	oqD1543e0th0nefjjbc2wWDLclRHSiImXB08S9sLDnDdR9f41li04oPT7/JwUCSaniozUVZJTNH
	YdPZUWsmqW1eQ/XLsQjqCxDHbeqQ7iC7RnbXjKTKuCvgIQ0ahbgdBEfhDTCpK20wxcw==
X-Gm-Gg: AeBDiesjajkPBnGz0W87spuv8Bc2qX8/1Tnzs25HJIFOJatMwWroGlxcuXUcd3Ueon5
	HOorPJfvq1abUmpzaXHfCJT6JMNPdi2bej2tfvpfhstBBQYWOegGHMjydBCku1qaEOtOINi4Hrj
	3dgBeNqOvUi5SkarR9KaMeibQSddXk32td+ngBMuZHhzo/yHioyKUMSBPhIhsrGPrt2HMXU5EMP
	U8hkTIxabuk/61PNM/SUj2wOEo3nG8D1F6OVApLOfX4DIPvsbxE0XLLnitH0XMo1h9Tx0pBf8D2
	1YCwocM1kXYY8tkbi4TxCQm5UDQO+d36aDPSQ4DrY6fZJcDM3o8D0wZtEMgtmStqfCnYlPRtXwO
	BQVGprQfCAGNCuJYkEItIIFqD+kO0YiAu3dgLbBdJgT3abb0=
X-Received: by 2002:ac8:5ac8:0:b0:50d:9b07:9c46 with SMTP id d75a77b69052e-5104bef2b99mr203901381cf.33.1777976898360;
        Tue, 05 May 2026 03:28:18 -0700 (PDT)
X-Received: by 2002:ac8:5ac8:0:b0:50d:9b07:9c46 with SMTP id d75a77b69052e-5104bef2b99mr203901151cf.33.1777976897898;
        Tue, 05 May 2026 03:28:17 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48af0d5a613sm140661845e9.2.2026.05.05.03.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:28:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>, linux-sound@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] ASoC: rockchip: Move MODULE_DEVICE_TABLE next to the table itself
Date: Tue,  5 May 2026 12:28:05 +0200
Message-ID: <20260505102803.183455-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260505102803.183455-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260505102803.183455-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2939; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=yrkwkHJYfYh4Qd/e6Jm0X0iKhU1/cDPw/TDKkqjnpUg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp+cY01NKoMVb6JQS8/2Bllf0JN0WwvF2MUfjEC
 At0QVkx3JyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCafnGNAAKCRDBN2bmhouD
 1xOeD/9pigHD500nSIQ/Gkwl0OOWr4qe4DQ2RsBsMwqJKZMddixBg2k1WVZCFvImq/1ykutfGWB
 zvKUxottxASvb05RWbhFezZvPiZ92vw8G8/QqtVFsfo8FmqjaBw9bqCJfBO7Byw73eoAi0+A6HQ
 3ROLUywFOoHYJ2CA/pYG7XN/JSvl16zIsfzXJPiKPp0On/y7g7imf2dCVXDLpH3NhdO7ZCSdYDm
 NuizWjY58Tds3uN3/R9dXMVcQAIZbjfLU5+GGg/fzwXsqzd9zIL9MGFTvwpSYjJKNwrHLeAFK/O
 XvQQOtS1mcTMidOoxhd1JsKVdYPmpe9CU3L15djpmERNX3JkgSnrW4C9BjXujwXSZgU9SgDPSy0
 vK8b50I22tU2NXSpESXtWXIUT1glBCCBGa23RcyeP/ZNl+9uDuJufX4Fl943V2ncZgpEhna9Ruk
 jSGMjbFlJvRBY+bJtylBzTZMyRTp4xSEwVfVeiyjSbRrRQDwFYHvoSMgspGUT2hndhjcDDuUHqP
 RGVuxiGngyaiTFx0TlZA5tGvdiZCgYe10cx12PG8UkKANVHLslC5HU0JSnkfVkiyr8eFhDhUonH
 llndMTKQU64VP50PXa4v8GD9IWPCHcDMaomes9je1XMCTH5c3VQsoE1H6hDEoijVxc8l8WOf+IW jV5EH8oLlHvC8tg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA5NyBTYWx0ZWRfX61ggrk2RwXWD
 HZJ8n+lPgHSVmnOFK7w+VDVIHazVtaI4q6ryCTELTbELB++yp36j+nTWQK+E2xwcpXrYPFnaPSH
 hZnVomwdG8Bn2aTwmfndy/krpzizk537Q0WKK4MikLFZscbUcDY9tfcOtl6stt/hcyqDArySzUY
 znOtMXi0aIVI67geQU+l0nVbyBF1zg1y4gJP3qlfHTw4tmIg3pAZYeMEpnN5AU5G2JkfAc4CNkP
 220MEp/Ui9tDiTiRIwdpMp6OGTpOIxJ8yH3V7ZLsZnRN0Qwm5NR9uP479XWYC8iIyRHwWjOnxcf
 jdYYkCiWQ7T6p3w37Ip5laVMcWR+x3uZzuwpKhdNO/grlwEFunDDcB5SIMiiMh0u8LjfwKoZIGd
 kKOoK5Y1DAKMnaI+JaruqOT21tsO3zePhp/TVWlCPEAkj9+pDqaRMYUUa7mcGrX+5CMCtBeiuBH
 96dRLrVF4BrGgUTLPFg==
X-Authority-Analysis: v=2.4 cv=SPBykuvH c=1 sm=1 tr=0 ts=69f9c643 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=s8YR1HE3AAAA:8 a=UPwjdVLwzqKTMXskr54A:9 a=dawVfQjAaf238kedN5IG:22
 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-GUID: EQD87_EgaTVlfT08DBNxbcdW1Q1DWNpJ
X-Proofpoint-ORIG-GUID: EQD87_EgaTVlfT08DBNxbcdW1Q1DWNpJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050097

By convention MODULE_DEVICE_TABLE() immediately follows the ID table it
exports, because this is easier to read and verify.  It also makes more
sense since #ifdef for ACPI or OF could hide both of them.

Most of the privers already have this correctly placed, so adjust
the missing ones.  No functional impact.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 sound/soc/rockchip/rk3399_gru_sound.c | 2 +-
 sound/soc/rockchip/rockchip_i2s.c     | 2 +-
 sound/soc/rockchip/rockchip_i2s_tdm.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/rockchip/rk3399_gru_sound.c b/sound/soc/rockchip/rk3399_gru_sound.c
index c8137e8883c4..b80acb221d24 100644
--- a/sound/soc/rockchip/rk3399_gru_sound.c
+++ b/sound/soc/rockchip/rk3399_gru_sound.c
@@ -606,6 +606,7 @@ static const struct of_device_id rockchip_sound_of_match[] = {
 	{ .compatible = "rockchip,rk3399-gru-sound", },
 	{},
 };
+MODULE_DEVICE_TABLE(of, rockchip_sound_of_match);
 
 static struct platform_driver rockchip_sound_driver = {
 	.probe = rockchip_sound_probe,
@@ -624,4 +625,3 @@ MODULE_AUTHOR("Xing Zheng <zhengxing@rock-chips.com>");
 MODULE_DESCRIPTION("Rockchip ASoC Machine Driver");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("platform:" DRV_NAME);
-MODULE_DEVICE_TABLE(of, rockchip_sound_of_match);
diff --git a/sound/soc/rockchip/rockchip_i2s.c b/sound/soc/rockchip/rockchip_i2s.c
index 0a0a95b4f520..49ff86b35ef1 100644
--- a/sound/soc/rockchip/rockchip_i2s.c
+++ b/sound/soc/rockchip/rockchip_i2s.c
@@ -662,6 +662,7 @@ static const struct of_device_id rockchip_i2s_match[] __maybe_unused = {
 	{ .compatible = "rockchip,rv1126-i2s", },
 	{},
 };
+MODULE_DEVICE_TABLE(of, rockchip_i2s_match);
 
 static int rockchip_i2s_init_dai(struct rk_i2s_dev *i2s, struct resource *res,
 				 struct snd_soc_dai_driver **dp)
@@ -878,4 +879,3 @@ MODULE_DESCRIPTION("ROCKCHIP IIS ASoC Interface");
 MODULE_AUTHOR("jianqun <jay.xu@rock-chips.com>");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("platform:" DRV_NAME);
-MODULE_DEVICE_TABLE(of, rockchip_i2s_match);
diff --git a/sound/soc/rockchip/rockchip_i2s_tdm.c b/sound/soc/rockchip/rockchip_i2s_tdm.c
index fc52149ed6ae..28fa253a5187 100644
--- a/sound/soc/rockchip/rockchip_i2s_tdm.c
+++ b/sound/soc/rockchip/rockchip_i2s_tdm.c
@@ -1040,6 +1040,7 @@ static const struct of_device_id rockchip_i2s_tdm_match[] = {
 	{ .compatible = "rockchip,rv1126-i2s-tdm", .data = &rv1126_i2s_soc_data },
 	{},
 };
+MODULE_DEVICE_TABLE(of, rockchip_i2s_tdm_match);
 
 static const struct snd_soc_dai_driver i2s_tdm_dai = {
 	.ops = &rockchip_i2s_tdm_dai_ops,
@@ -1442,4 +1443,3 @@ MODULE_DESCRIPTION("ROCKCHIP I2S/TDM ASoC Interface");
 MODULE_AUTHOR("Sugar Zhang <sugar.zhang@rock-chips.com>");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("platform:" DRV_NAME);
-MODULE_DEVICE_TABLE(of, rockchip_i2s_tdm_match);
-- 
2.51.0

