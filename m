Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793560072;
	b=Cn0zxuheTJwKAR6m86rsNHwPzguGdpuH//ili3UefS/KJTAbJgDn3hnHuXAe/Ow7j/jI
	 EI0J3jkmz+O4VrKLhZRFo2cFN1G4uXzyGBnfT1H6gpgfhhBLG2WzvxiI9O/VzAFzK4fcx
	 qRHQcTILRnTjwZD+xcHQ8zz5myIB9xa4fV4zJCrvfTMRpaD6TBaa4UZ27o0cQKJxnAP62
	 LOXd0nEAZY9NVAE9RXHn1qx8JEjvisNFY5qtrax6Pm0jsDVhDp9iniUtSVUUsG5uPSrhl
	 oYYx7DfLBBMrZla7fmR6ihmTzfkJnSxFuMRaDnGwtaTuYV3MhHu9/7sn/Qd0isQOiZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793560072;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=D50N3E011gOlYPi42VK1o9ynvsH8cEI0ETSUZB5t0Rw=;
	b=OnmN0x+PQeJ/2Z0iAS3QVp9eU4307iSV8G3s1mKvH77C6mXoSjGjD+6AdE2KG8eJM6Nz
	 YKKt9i1Pmk9YWHELq7LBrLzgsnyqwDqCtgHqW2R09uxl2i+uSHv1IEqjo1YHsliDJjR70
	 7+V5YqSx9n7w18VqMej9hOa7cZgl/i30lxIY2oGjsLC5xzVj9ldI2gSzKssUQ0FebSLj3
	 MZUDuWQFpxBffTntEnLFhXrzDqgnNhG5uT/C9nrGb16CY7QhdXxhAdPkURe/+YA14vTZL
	 oNizwclFPHNuehPGGeThdn5SrP1BMwBGV8BDeOiiluq3IDsPlhM2D9Ks6EIcydqWn5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e4RJky7v;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HVm78RAv;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965D5606A32F
	for <linux-sound@vger.kernel.org>; Sun,  1 Nov 2026 19:07:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 965D5606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e4RJky7v;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HVm78RAv
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1HQF2c2044113
	for <linux-sound@vger.kernel.org>; Sun, 1 Nov 2026 19:07:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=D50N3E011gOlYPi42VK1o9ynvsH8cEI0ETS
	UZB5t0Rw=; b=e4RJky7vigSuez7SOj8vLlDmtJL947CrDq+2/Ilf82kZca9VArj
	wDtMef2X7w+6er91RHbJASREjK7J3OuUSur8D4z1tyqabMYpdi/VK4EuoQOhmNBS
	icBDwtm19D+H8zYRRyzwF8HzzgcqK5UxBtE9cSYJ4H2FEqUW55tsNeoCj//OphEW
	R2w/m2D4BktbiSAoi9kiiFyUb36+CTgsv6d0gDTb/sWnhibAdxJSodcBa+P0QIfa
	SX/UkCuL2iGueGMHPk4FpLmCu1ZNaTnRcM4lTHppv3kzqntvKb/G59UUSpDEJVc9
	W+OMFUQXJtzaETmghf3w76ZY5LkY25ivXLw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7wxm1k9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 01 Nov 2026 19:07:50 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7cc3a482af7so2233724137.3
        for <linux-sound@vger.kernel.org>; Sun, 01 Nov 2026 11:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793560069; x=1794164869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D50N3E011gOlYPi42VK1o9ynvsH8cEI0ETSUZB5t0Rw=;
        b=HVm78RAvk5hZaWrDPDSemi5P9xRUn2b+9C5UryBrUOBHeb9z4XS8NuRTCorI+amTwG
         REOdUnuWfn8ErJAtd7WirIGxhrAM/DHKO4Se0qohUvPpzFndAVI/TIiI0FKbvwbx42Dm
         VrzTUr8RKJ6N5FQalQhaj/FuWY3pl0PXvgMn4ZeAFes9hSBhucaGYw+Sg2VdJHQhVVqr
         2gwtz5dYn5XqK0D1OEWv7q2Cs9pY6Eo4bZb4ukRMGOsKZP2Ac8OHUYBDdYkiIeeEqom8
         4HO9QW+mfRzSKPZ0PP7zKyoRJNcGiE0hBEa80StQXHKx99pjwfywKLRK70hSuJuUsK7B
         mbKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793560069; x=1794164869;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D50N3E011gOlYPi42VK1o9ynvsH8cEI0ETSUZB5t0Rw=;
        b=a9zzbfNU9J/RC21WWJu5kJeOVxO+ZU2c/DOn5pnZYUh5DI9buFXxhkeZmnsPTxBw4y
         OBmf66HmsaoQdJJoHaAALAvzZzBixLT3VKReI3ocSZBdF6J97u4iao+IeLj5qLy9HxjX
         eoa57F1gL3VF/D2HwgBg2JyfzEBesWci8ptbG5FdkUIT/eO7JxwQfJDiP6qRiVevZ4Nm
         7U/qfdsNmptyItTmLtoIiQS3adm1sNkZkQzZAYvE/kIoxNkAjuO+AFuQ58oO0inymaNk
         iC94cAe/ZW6QGa9C5ifU+sPsRk9J3HMvzFLtqDqz7tdAeuTGzLG9/1jEEmkl+5M7ZT48
         /6xg==
X-Forwarded-Encrypted: i=1; AKwUvBzUVuiYlyE1IbsXXB4oJgZgb6Xi7BYeW96+7V5dt9Yri1jD5OIuOlR8Y5e8Wok8DllkrOvDvvs9gMbMYA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/iB3cSXZbLVuHvXxil5ktpRGR0jCMMMsyooj0UaT8AbSAlJJV3
	bQfE+IC/RZWQKOVUKo4GzkDb0WpVWjzSH86cX+BauUvaD8D8NuqVFW/ny/suxS3oOThqoPdJhb/
	WQDmInMn1JtPT0bqnvqlkk7a7+JvyGmmsZcQKgaij1ezVtcOAimtMLUUGaa4kTguRSw==
X-Gm-Gg: AYBFou0LF8FVOEJMbrObukaM+fZyS+Luvz4eEFDtr//FvtzCLB+vN6KcByPEvS8Y1vB
	6yidVSL+sv9EXY7r1gMRhgtB2h3PmBSrbBq3Pn4z/tttKvgSZevMBn1/2u+Dfg8PWP64YXlrega
	IIoOl66N0cofG9LgguXaaVDBk2AtoYH5b4vmgsqLpz2MW2HMfHZbW+CWbNRZSDg2ACJkJwdc2cO
	YU3N6LLXmBaCyJ8GgJegd55U6Rpxu3EG6zm64TTqSPUGxe3G7c0ANcdsKyBBG9UVeJI4w3dfc/d
	+TQtJPz8LgWMsflMuRAAAv0TdSF1EXFifEKQR2qHRXKWsGSgh/lOZ87+hP6PhR3Axoz2B9Ye/1N
	uKdcE4q+Bn3wZl+iYqmnStDRiqQUzHnovfOhiQGTkx8lmLbCqMahWGRcdpKhT2A==
X-Received: by 2002:a05:6102:f0e:b0:7cc:9d59:9b6e with SMTP id ada2fe7eead31-7d07261530emr3709692137.13.1793560069537;
        Sun, 01 Nov 2026 11:07:49 -0800 (PST)
X-Received: by 2002:a05:6102:f0e:b0:7cc:9d59:9b6e with SMTP id ada2fe7eead31-7d07261530emr3709675137.13.1793560068768;
        Sun, 01 Nov 2026 11:07:48 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3f9sm17168223f8f.4.2026.11.01.11.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 11:07:47 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Boris Brezillon <bbrezillon@kernel.org>,
        Mark Brown <broonie@kernel.org>, Andy Gross <andy.gross@linaro.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        stable@vger.kernel.org, Wentao Liang <vulab@iscas.ac.cn>,
        Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v2] memory: atmel-ebi: Disable SMC clock on probe failure
Date: Sun,  1 Nov 2026 20:07:34 +0100
Message-ID: <20261101190733.121473-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2824; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=wFhbia9prCL442JdEQf4UMZvrrCKTAZ4Ok3cjklDBLo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq5431ZGq+kapElhK6n6TsLDGbX08W8YZOq0EEI
 pWpSLYJq8mJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaueN9QAKCRDBN2bmhouD
 11BJD/4rGHGPC3eDno1qwrwJ5AX+E7EoRTP7s+pFcL0UxUmbCUXZV5vO/ffHuhSCK3mCKIci8n/
 mstT8q3d65BY78QMP9OdDRRj3+GYIzeXH9gDm2x7G/2nbLafOWe2q1rrqWIeo/0SaTSIAE9UtbN
 v2x0D+Uzk/bQwHUUGZFJyDn8gUv0DnRgiQRo+l5vOr8OIQmS/nOG4g0OY1uSp1+vDe7KqBaplmN
 Pei/k99slCzzfbIbWT9floiWP8qCOQP/EKPYSUapCezn5EMJyJqJfN8djae8xXNLNovLHaTwZIj
 oxLaVpSMKMZc9RgJHYknVELcSrXTrkw7Mu1Lud3xYLu28wn09u6klUcXzAW7WF2FJAqBkOpUjrb
 9RQnPTucq7/yutKC5rTtAYf4HsX+WsyaXG4KUqf5dIzFniJJ4vHnQsKH8wIcBhKNFIBuVyz3WZh
 r6HSidqOMTWZ6+d7fjUFXMtdpQivXY9jjTECA4RbIFjMTJ+t59d0TnYdCwJ6du6qgRISbW/D674
 DC8nzGwrNeqfWVObK7O11dRUGF9UVyKTyLbYhTbQ1VLftheJGqLJXWqNQLhKt1I7ikztdSuVDzu
 se+LQLD2EfLAIsucEkWyVhNN/iD8RhhkyrRrefoaSa3JTNXyax8vnVCnsmqcX/fnEoId6GaZlCX eCuifc2g0dZOysw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2R8PPDrgy10PtEhkzy3bLLez0YBrUxcG
X-Proofpoint-ORIG-GUID: 2R8PPDrgy10PtEhkzy3bLLez0YBrUxcG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA3NiBTYWx0ZWRfX5tLxcZiyRyDz
 EdacaruX7VJ8t7DJEhx9J6UWX9ttKiwVzEUpnbKKtWPsc9FJkaWQYUS32MI9GmdF5kOn/DJtAIV
 fuyeae0+HJtaQ7V+U1eUTVgydAcXi40=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA3NiBTYWx0ZWRfX7E4A8a45wVDP
 D27bKCLyJovVVBDqyogBcvu7YZ++hNN73t0JzBU9/UsL13qwFkqjwaH2lh8Jg+9AJL/H2+dTAA9
 KxzRtQx/Pl9DbBsqxBKM+Ne/2dxTyBN7iW0iPxSEunTlUd8UYXcYCxYvci+3PHMSG+jigF4EttF
 DOU4L6QDb+jKSqMsqCwHTi+SvZK02p0BClWtViSfr4U38QUxW7SWp/tgMeJJaCmVH82GLbmqdtP
 0rxmbnLGgpJTwPLm3RqdVMYQGP09T3TErxnMTTLD4wAW3ckaT+eBsvhE0G7NCFqZDo/r4wIDwOQ
 vlN0+cnLZmqVWnYV3gSdnUQyLtbaECg2uvMwUgsEPGDuDIxro1ZILH+c7EbysimzUEraoICr07+
 gXeMBbl1inoWylaNW+gwrzTyadsn9wllBZzbPm9j1COdnrDaM4CKd5Qd297fyC/4/L9D6u+hLjU
 EW4IjnMPkOC5jxkBT/A==
X-Authority-Analysis: v=2.4 cv=JLquIMKb c=1 sm=1 tr=0 ts=6ae78e06 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=BSGzfMJf4aLG5m6vmWAA:9
 a=-aSRE8QhW-JAV6biHavz:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010076

Unprepare and drop the SMC clock reference, if probe fails to avoid
resource leakage e.g. during probe deferral.

There is no remove() callback, presumably on purpose so only error paths
are handled.

Cc: <stable@vger.kernel.org>
Fixes: 87108dc78eb8 ("memory: atmel-ebi: Enable the SMC clock if specified")
Reported-by: Wentao Liang <vulab@iscas.ac.cn>
Closes: https://lore.kernel.org/all/20260917101623.2146392-1-vulab@iscas.ac.cn/
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-8e236c81-01b2-4274-a213-11c3f31acfc2
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

I independently developed the patch and then checked the queue with
pending work of iscas. That one has issues and other complains from me,
so only credits for the report.

Changes in v2:
1. Handle of_platform_populate() error.
---
 drivers/memory/atmel-ebi.c | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/memory/atmel-ebi.c b/drivers/memory/atmel-ebi.c
index 1e8e8aba2542..7dc2f7add1b1 100644
--- a/drivers/memory/atmel-ebi.c
+++ b/drivers/memory/atmel-ebi.c
@@ -562,7 +562,7 @@ static int atmel_ebi_probe(struct platform_device *pdev)
 	}
 	ret = clk_prepare_enable(ebi->smc.clk);
 	if (ret)
-		return ret;
+		goto err_put_clk;
 
 	/*
 	 * The sama5d3 does not provide an EBICSA register and thus does need
@@ -572,14 +572,16 @@ static int atmel_ebi_probe(struct platform_device *pdev)
 		ebi->regmap =
 			syscon_regmap_lookup_by_phandle(np,
 							ebi->caps->regmap_name);
-		if (IS_ERR(ebi->regmap))
-			return PTR_ERR(ebi->regmap);
+		if (IS_ERR(ebi->regmap)) {
+			ret = PTR_ERR(ebi->regmap);
+			goto err_disable_clk;
+		}
 	}
 
 	ret = of_property_read_u32(np, "#address-cells", &val);
 	if (ret) {
 		dev_err(dev, "missing #address-cells property\n");
-		return ret;
+		goto err_disable_clk;
 	}
 
 	reg_cells = val;
@@ -587,7 +589,7 @@ static int atmel_ebi_probe(struct platform_device *pdev)
 	ret = of_property_read_u32(np, "#size-cells", &val);
 	if (ret) {
 		dev_err(dev, "missing #address-cells property\n");
-		return ret;
+		goto err_disable_clk;
 	}
 
 	reg_cells += val;
@@ -603,11 +605,22 @@ static int atmel_ebi_probe(struct platform_device *pdev)
 
 			ret = atmel_ebi_dev_disable(ebi, child);
 			if (ret)
-				return ret;
+				goto err_disable_clk;
 		}
 	}
 
-	return of_platform_populate(np, NULL, NULL, dev);
+	ret = of_platform_populate(np, NULL, NULL, dev);
+	if (ret)
+		goto err_disable_clk;
+
+	return 0;
+
+err_disable_clk:
+	clk_disable_unprepare(ebi->smc.clk);
+err_put_clk:
+	clk_put(ebi->smc.clk);
+
+	return ret;
 }
 
 static __maybe_unused int atmel_ebi_resume(struct device *dev)
-- 
2.53.0

