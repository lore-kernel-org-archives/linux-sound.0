Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5120E3016F5
	for <linux-sound@vger.kernel.org>; Tue,  5 May 2026 10:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777976899; cv=none; b=OQfIotxMLUFu/qXVmDKxUCYWQZUdkG5QRGgFsNUZYFK+9SKSCI55W140VouL6MBxbAnigPoeQsJGs+04Y2uTX+UKsOni+Him6DfTAQyP5M+G/X/vnAf04KdZkGgr9SWsKTpVLvbbkxjeVMl8BIDDBaipNHeYTyV/XUjtfp8ocXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777976899; c=relaxed/simple;
	bh=XVPD+W616R8y/3NolQ5AG12OfNJrpdVU9osOz5k7zUo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PPkMgBDzGXIdJOmlOjqSryPRYRZuiGdATUhVzU/jVRZsHyT8oIX6a5NEscsl6inpt/L0XEs9WUXAoeBQi0flRZ3HfUYUIMcza0jGeX9UL49xZk7driephsaEUbnQdL7VKhgihrTOeeyRTSkH/3E2NVxaotpNHr37SSKCSfJnjx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bNvpU9mv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BthkaOxy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bNvpU9mv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BthkaOxy"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6456lorF3187637
	for <linux-sound@vger.kernel.org>; Tue, 5 May 2026 10:28:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=U5kZwARyzl50XHwnIIgnTM4EUs3/eZVvYSC
	UYEqXM1o=; b=bNvpU9mvouLG/7dPG9Ma7uCaJFIPu/2iXuOdUgE9938x9791Y81
	Du5g4RPzNfZ3Wkg2ReINzGoTrhSFh9HGPEMZmrjC47mxJsjN4d1pgWIG3jFTfxpc
	0aA5UBk639Muu/pzr89RfUX4jeHtcnuUJGVVP4Ko2ALRJjKEeL/WsiKZMr83X2AM
	1H68bNoYHl4twkt4xCQUv3DX32dCBJ3J8WGrhuK4uhAtMH3m21eHA2pb43NXiGis
	sGQ/E+BnopElT/e2PJrfpK7gzC/Lc8bm3Yy16HfzEn+nrGN02WBWUt4iPC+E/l6c
	EigN3JXycdkUML1kMAucJwtyVCMne9WPkbQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dybkk8t9q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 05 May 2026 10:28:17 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d812c898cso126201961cf.1
        for <linux-sound@vger.kernel.org>; Tue, 05 May 2026 03:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777976897; x=1778581697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U5kZwARyzl50XHwnIIgnTM4EUs3/eZVvYSCUYEqXM1o=;
        b=BthkaOxy6PyJuADjlPw63zy/AXlV9o3Q4dU+P4cu63JKJWt8MH2ERnMfB/kuS8F9Oi
         b+nT3cpwomZqWwsTXJrIS28rQw62drdg+oSP1TEMmSl3q1UhWGxBgSn0KGwwgWxN3jcb
         aRyPXoq0d5D/KS422WAEG1GGJAqSLR0qUSxQ3+3bWJ7Ql9cmwwrPQD6VXcUib7wzfqtK
         R7Olio74GpTBtL76tWjq1N0VvM9d4C0Hibwe6FpqBAly1pRc+y8wVH5pUtjMDkXnmGRD
         LPeX36z6WzjAMcOSvKEkKtNtQzl4Jk4FVkb9tcXCnzW0WLeTygYZoF6ij/oYv/BafHz+
         aN+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777976897; x=1778581697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U5kZwARyzl50XHwnIIgnTM4EUs3/eZVvYSCUYEqXM1o=;
        b=eztRuePrRKrnAqukrr42atKcnki2m2nSsMGRfdurw3rMjpsaXn1oqlVHCzgVsE+joe
         +xd1oAcIj5J/sc5oXVNJUlD/WfLdmk9fV1M7Tsw90DWpoIVijSy+ODfbey+U2L1mKYxq
         KJkQ+BqLTMI3xUqIMWbNlhBikF/51CfYqIRYaPxpCecegDryaJlC8GFcedsKTNTwALHE
         mIK+2kh5rHF8gcOnEe8YnQ0qFn3DtV1GcErr9w02iHO1iUN8uSo920NaxhPYtinYp7az
         SxPE9BYS22kSbtA0qw9eo5CcpKS41YXxbvPG2QnwepRgphbsXX4JJBHVEsBy7ASHTzv6
         vepw==
X-Forwarded-Encrypted: i=1; AFNElJ8VFQcs8neVZWXa6G3dOhEIe691gMZtSwZoY6z0eCe0kb4i3h+OK++IjoeyOp+MHYQeEuH/jStIXKr5cw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq/Zeahp0UEQd0y9lWCMBwROKSDnTPJawsI4muDgNNOiqSgvFo
	AK60PMb3ADBPO3YVvV/KCTiqd0d0sIqeNZLOhTZe1x35oxLR854Th8tt+sjYRqGJ/Ijb9gMaOYo
	zmTNDLPSuHPZyWSer4Hc8Z5nhlNWhzWhrobhIapAXeopr2zlKfnjDg7rH/cfYO9t8Aw==
X-Gm-Gg: AeBDieuN+1PVXLcGIYOc8ixrz7PkQiXZGefua1Rd83jSJUdymheX9X9oaRZtaH30vxw
	PVsSHHdquYm2XbegdMawrVZvfldlZ94AJds050KmZLnPLetfvpIew63RdaPWeElNwCbrBmdFffz
	bvJ+D7Syp2MAEs0eKDtEEEXJ6RIfFGtd6BYEyEBgxx8pflLPoIs1bqgINhHIFusNkcyXBl8zlsl
	oTo496FaEMT3cLh7mMgzF3dC6NohifCrSsI/98v1tlnUk+RhvKjX1WoRd2nHD0ninkqHKb8+vhG
	32Wye22axuIPjUtBRibv5uVJxS3joTuPSn7mWhoHeDasxlVFCNHchP6GZ/f2j+p5/QK3KbN3Dok
	iiW1tSCKTcRps+XpWk4O1npo5OeD7F8DKoQxYSZzdtVI7YDE=
X-Received: by 2002:a05:622a:2304:b0:50b:86f5:8fbc with SMTP id d75a77b69052e-5104c034745mr195430471cf.51.1777976895965;
        Tue, 05 May 2026 03:28:15 -0700 (PDT)
X-Received: by 2002:a05:622a:2304:b0:50b:86f5:8fbc with SMTP id d75a77b69052e-5104c034745mr195430191cf.51.1777976895389;
        Tue, 05 May 2026 03:28:15 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48af0d5a613sm140661845e9.2.2026.05.05.03.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:28:14 -0700 (PDT)
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
Subject: [PATCH 1/2] ASoC: tegra: Move MODULE_DEVICE_TABLE next to the table itself
Date: Tue,  5 May 2026 12:28:04 +0200
Message-ID: <20260505102803.183455-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4190; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=XVPD+W616R8y/3NolQ5AG12OfNJrpdVU9osOz5k7zUo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp+cYzGhX9vBzZinmPzQmxC1YRTCLeIfGMsAgSQ
 CuPZALwv+CJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCafnGMwAKCRDBN2bmhouD
 1yB6D/sG86we9BBj1y7ZakpR857UpaCg961KT4yS8rXNLZX8PwEQXk1kmGhbypYl5BwQLlQo/Nd
 xoKUC/YSn80w71teMhyUrBS8rCS4kZiQFg5+G9pnBwL13hf5YaOhUYecI9MZ7b57uAOl0LnMJLs
 NyxFCmCvy+kTl7UpLdBQ3JG4brPkyHR8tQWagBP2/mGabQa4KJLVNRBAmX6xbVbFBY7ZGX9R661
 qBJQxTlJHJ/QoFydP/OznA/LVedghRIwfqpdgpDNR3du+f9QhtxCMaW4R4ymNcuaH52P8i+cI5Q
 eXit2jRzGBujRnlIyuiuvaEMBtIH7Uw8i+EQVXIfKSDk9DAm/zNixUG3sJlmHtNDtd1rS08d2zX
 KEgKpyhq9s+7TJHW12o2uhBoX3FsIsweIB1fxg7JCY26o4+h8GGMacRCgCUti7pQnGCEaW3vOx1
 aksHBOQDd5PyVz4he02viSTqsh+o/bYXUZx/UsLqOeMg9gGPK04AMV/8peJQvzH9r2e+wIn9fLP
 7i2aaawOY8edXRtDDN6HOIvS02iuRfrGwvil99v7wBKtSZ3wr59gM/Yldzv1PDUveEbthbW9NCf
 OUk3j4NAHxAnEyMNnLvxq/OaZOQyPKzFKMjEAyvOUovISkjAM9UTJZqrgqqMubD4Z+pusUCb4EY mq1MJkn0mN96ntA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA5NyBTYWx0ZWRfXwq1ooEhW6Bcj
 rVR4hUQj6X9tYGx+GiEJ88gXwRX7lBbpez8ZsZrQe33esZ2EY75VkAZb1ng3gffh4RYqZXPikyI
 OhjI88D8m9EeJR10KSuTJH5rkQ7JRF+JgAWEEYeOgCE0xe5kOoc52N013pZVtPPlrqP15WRogLz
 TyDwGBT24xtaUENIs+gK1lMiAQgjH+F4/4Md210nf8NiZOwSkkl5OS8pz9jcKgywLMVxGUfYx1u
 11auGJ2LPqZoBLIaCooYLGrR8tmuyfuJql7v8YvQnyaurUQcPc7xmopRNbbtmAOfQXWmXDjG1ok
 daLHKG6ZeLMvBSqyLizVo/eV/hCCnZ/6JDZmp6bYTRfcYkcpKnC0k+w38dvq9uG47KmePIzxq12
 hAfo5moOe2l6CT4bG6TL3xBGyIQpIJjyM39FyhyzMy9ib1CmOdWxN79W3DQlmEaNB4dqQOvWj9x
 CmokUyJDEjKhWzunioQ==
X-Authority-Analysis: v=2.4 cv=SPBykuvH c=1 sm=1 tr=0 ts=69f9c641 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=Ikd4Dj_1AAAA:8 a=jFLt6X_-GGHsf4P6n_8A:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: Kd5A5uLMLJG-d6UZhA_5QtF3r_3B3OZU
X-Proofpoint-ORIG-GUID: Kd5A5uLMLJG-d6UZhA_5QtF3r_3B3OZU
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
 sound/soc/tegra/tegra20_ac97.c | 2 +-
 sound/soc/tegra/tegra20_das.c  | 2 +-
 sound/soc/tegra/tegra20_i2s.c  | 2 +-
 sound/soc/tegra/tegra30_ahub.c | 2 +-
 sound/soc/tegra/tegra30_i2s.c  | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/tegra/tegra20_ac97.c b/sound/soc/tegra/tegra20_ac97.c
index 08c58e8f3c22..0df1fc64f532 100644
--- a/sound/soc/tegra/tegra20_ac97.c
+++ b/sound/soc/tegra/tegra20_ac97.c
@@ -441,6 +441,7 @@ static const struct of_device_id tegra20_ac97_of_match[] = {
 	{ .compatible = "nvidia,tegra20-ac97", },
 	{},
 };
+MODULE_DEVICE_TABLE(of, tegra20_ac97_of_match);
 
 static struct platform_driver tegra20_ac97_driver = {
 	.driver = {
@@ -456,4 +457,3 @@ MODULE_AUTHOR("Lucas Stach");
 MODULE_DESCRIPTION("Tegra20 AC97 ASoC driver");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("platform:" DRV_NAME);
-MODULE_DEVICE_TABLE(of, tegra20_ac97_of_match);
diff --git a/sound/soc/tegra/tegra20_das.c b/sound/soc/tegra/tegra20_das.c
index c620ab0c601f..b48cc4a6967b 100644
--- a/sound/soc/tegra/tegra20_das.c
+++ b/sound/soc/tegra/tegra20_das.c
@@ -188,6 +188,7 @@ static const struct of_device_id tegra20_das_of_match[] = {
 	{ .compatible = "nvidia,tegra20-das", },
 	{},
 };
+MODULE_DEVICE_TABLE(of, tegra20_das_of_match);
 
 static struct platform_driver tegra20_das_driver = {
 	.probe = tegra20_das_probe,
@@ -202,4 +203,3 @@ MODULE_AUTHOR("Stephen Warren <swarren@nvidia.com>");
 MODULE_DESCRIPTION("Tegra20 DAS driver");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS("platform:" DRV_NAME);
-MODULE_DEVICE_TABLE(of, tegra20_das_of_match);
diff --git a/sound/soc/tegra/tegra20_i2s.c b/sound/soc/tegra/tegra20_i2s.c
index 51df0835ce3e..d9ab210ad69a 100644
--- a/sound/soc/tegra/tegra20_i2s.c
+++ b/sound/soc/tegra/tegra20_i2s.c
@@ -485,6 +485,7 @@ static const struct of_device_id tegra20_i2s_of_match[] = {
 	{ .compatible = "nvidia,tegra20-i2s", },
 	{},
 };
+MODULE_DEVICE_TABLE(of, tegra20_i2s_of_match);
 
 static const struct dev_pm_ops tegra20_i2s_pm_ops = {
 	RUNTIME_PM_OPS(tegra20_i2s_runtime_suspend,
@@ -507,4 +508,3 @@ MODULE_AUTHOR("Stephen Warren <swarren@nvidia.com>");
 MODULE_DESCRIPTION("Tegra20 I2S ASoC driver");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS("platform:" DRV_NAME);
-MODULE_DEVICE_TABLE(of, tegra20_i2s_of_match);
diff --git a/sound/soc/tegra/tegra30_ahub.c b/sound/soc/tegra/tegra30_ahub.c
index 51e5ab6c276b..ee68f28852c4 100644
--- a/sound/soc/tegra/tegra30_ahub.c
+++ b/sound/soc/tegra/tegra30_ahub.c
@@ -509,6 +509,7 @@ static const struct of_device_id tegra30_ahub_of_match[] = {
 	{ .compatible = "nvidia,tegra30-ahub",  .data = &soc_data_tegra30 },
 	{},
 };
+MODULE_DEVICE_TABLE(of, tegra30_ahub_of_match);
 
 static int tegra30_ahub_probe(struct platform_device *pdev)
 {
@@ -684,4 +685,3 @@ MODULE_AUTHOR("Stephen Warren <swarren@nvidia.com>");
 MODULE_DESCRIPTION("Tegra30 AHUB driver");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("platform:" DRV_NAME);
-MODULE_DEVICE_TABLE(of, tegra30_ahub_of_match);
diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
index b121af9ef8ed..1d7b3aed51fd 100644
--- a/sound/soc/tegra/tegra30_i2s.c
+++ b/sound/soc/tegra/tegra30_i2s.c
@@ -402,6 +402,7 @@ static const struct of_device_id tegra30_i2s_of_match[] = {
 	{ .compatible = "nvidia,tegra30-i2s", .data = &tegra30_i2s_config },
 	{},
 };
+MODULE_DEVICE_TABLE(of, tegra30_i2s_of_match);
 
 static int tegra30_i2s_platform_probe(struct platform_device *pdev)
 {
@@ -567,4 +568,3 @@ MODULE_AUTHOR("Stephen Warren <swarren@nvidia.com>");
 MODULE_DESCRIPTION("Tegra30 I2S ASoC driver");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS("platform:" DRV_NAME);
-MODULE_DEVICE_TABLE(of, tegra30_i2s_of_match);
-- 
2.51.0

