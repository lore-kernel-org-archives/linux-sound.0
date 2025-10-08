Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9DB29B8D0
	for <linux-sound@vger.kernel.org>; Wed,  8 Oct 2025 14:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759935490; cv=none; b=NPYLl7zkNBAfBYhVDTMZ6BmoBxhB+BWg5nqhNqwW5OF+JHWMnk5dsfoqRoa7bl5xd7Icd1ZOLiEXencEAZDWrIJOxtVJEGvuvApjlKDQN6hssHhA1MWYg6QCVav7yYU/FhAcN8X0yM+sPmyBADR8ERBR8QBgm8MzXEGzVn7RwlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759935490; c=relaxed/simple;
	bh=5V4FY1lGCPXLwOcBdDx/5qV1DoJAfuAXFe8DMG4W87o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OAnK3MjkBPjbZ5eqhXvuKQDSKa7di7/dqSm//Js6vqJZZEsvSmAVeiqFwj7q/xrtOEhwVNbfSR/vtKPn6yvv0uQUsWYRpK1DrXrwlujknYVYDrslNGU2yWSSse0DbTuwSQEnLDNRmKdy5yjTTxMq68mlab87sznUeMzP8AYGEdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fpR31PHb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fpR31PHb"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890SCC014237
	for <linux-sound@vger.kernel.org>; Wed, 8 Oct 2025 14:58:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=gg2XGw954hw/rNzVk11kaod4ZGuB5Izji2/
	QJiTgN50=; b=fpR31PHbNQFaoP0jHLmGl4/ob/VfzSwr+TexkvmZW/2LsaesVKc
	hVcEvVpFm+Wqi/dKj/jCiyAeF6mhOGyOhw5Wh63RjkWS0Bd5Ma9xERWrQ8GvM2O8
	Ba5sqwCOyLiampeTHEPlVJ/NL7cWjq72Ywab3Mv2MrysAv0420r+FVyd7n82S1Fk
	TBTQ8nlXsgHDOw8kJjoejrAau1NJPEAsxwpsG4BUhceMYZuPk9XWQkfmCEprelx4
	59PPG2TkYgaz5+1ZkrjNLgg5Hi7AO13oQHPmuz8xrnAR8bD5M6oTA54ZAszkO/1Q
	8tXKbnEBcFEaWpGg4Y/1Kdab/CzWNcnOYBg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49mgd0ppkk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 08 Oct 2025 14:58:08 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-78102ba5966so6970937b3a.2
        for <linux-sound@vger.kernel.org>; Wed, 08 Oct 2025 07:58:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759935487; x=1760540287;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gg2XGw954hw/rNzVk11kaod4ZGuB5Izji2/QJiTgN50=;
        b=VSB7VlqeT5bZqYUl+6J4uitqyjXrOJzLlfNbWCk1sG10nZaZgbvOmmPPtf1/wdNxtw
         VjEv0nHEqBgqHU5zsFbzoFYkB2mmfj6/nmwSPzNhAxuhktT43q7doktSvFRYcqNLirJ7
         qvSUUFyNQGTWLQ8JX1c4aj/4YZQG+N9bhzMt3QR9CP1RxNEh+Mmc/a8Twx2esnXNFn34
         98PgZ3SSDtABvLhmRpdyxKMEMToYialtBxJoXY1bvlznpJkz4HPAoZuy24Jnr5MZ8QtM
         XWuBQFNShV/R7lnxHacWt1LlRSssEHUHm5EVLWNNUiHOv6CT3FxiwicGtjxRDQKAHiQc
         b3PQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9MmZveM2z0bVKhI1s4roaZG3Jy+NiluhFLFegxZFa7sMwWGvhk8F8y1B+y0Mi1VLV/dyfODTIjXKYCA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQpZKE9sKCe9jyweXpYMLpFeaoK4sdqFzL89RgAnnJ2CJAtPgT
	K/e3KRDwwuO3QoT3UtqP02hHL/SnfCU7H9khHQn+f+zFTSlCvjUqC0Hb2PM2qss/8tftDIutnH7
	xujmDeIzmmcSN4a5cbP2hgbtOCS9sQRzy1/pyzx/FBFZ6bUyGCbVKzBjLjo4PzoAtIQ==
X-Gm-Gg: ASbGnctzsjD+5VkcSHylczltKyQ7UzlH25rRbHGV0l83ZtBUiy32V3GdrPF8g3UROtC
	N+mWtUWzxuwgLVi19WMUwOPI1k4pxPcZazHkFoCieklI1sx8cgayiJ6XbfbiETSA04N87Osl3Wn
	WZs+DQDSs4+RWTcHuudsA+A4/5/jBnBMNKpk/pjqxmv9jzqbH2PyL5rVN5GG3yzm/n6yDS0UH6w
	M61OKJ135LxAFCY2KAQQthIRnZqu9qNKek88BeQer2FR/N0esvEa8si3sefHt/DkcfO9udFbjWL
	ymE0R9Q4YuU2xEohwAJn545ZzgobFdlfeMHI5HV94MuHSehFTEFtQ/vvn4xIqSSSLeaVMvv36oU
	=
X-Received: by 2002:a05:6a00:3911:b0:77f:3a99:77b1 with SMTP id d2e1a72fcca58-79385703346mr3825674b3a.9.1759935486535;
        Wed, 08 Oct 2025 07:58:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFW5q5j+m+RGehMEdTTXNFPYB2WX/itVnHJwVii8g/LY0p0ro5CAl7jexOkZcXjHDnVYlqG9A==
X-Received: by 2002:a05:6a00:3911:b0:77f:3a99:77b1 with SMTP id d2e1a72fcca58-79385703346mr3825645b3a.9.1759935486009;
        Wed, 08 Oct 2025 07:58:06 -0700 (PDT)
Received: from debian.Hyatt.com ([192.210.17.203])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b02053b84sm19068892b3a.53.2025.10.08.07.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 07:58:05 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: srini@kernel.org, perex@perex.cz, tiwai@suse.com,
        dmitry.baryshkov@oss.qualcomm.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH] ASoC: codecs: wcd938x-sdw: remove redundant runtime pm calls
Date: Wed,  8 Oct 2025 15:58:01 +0100
Message-ID: <20251008145801.3479-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: wkSRgqPQBmcpi2j2hrw2crS1EnWiP7of
X-Authority-Analysis: v=2.4 cv=T8aBjvKQ c=1 sm=1 tr=0 ts=68e67c00 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=3CSVYe8HblTQFsWiJzwA3g==:17
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=J5h_BI_um8seuJrpCkEA:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: wkSRgqPQBmcpi2j2hrw2crS1EnWiP7of
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDEyMyBTYWx0ZWRfX3m7H7LzJfOpw
 nmFUMuomoQGSh3SW6B/wm5v35zgGjbPtNcFqB0wQOqS5Gkn+nJOD1Y4hGX5/uTSMXyg8DhCFspn
 lAHIHSyQij3hDakaQu+9wRtdMi+3k6xeaTfHZEyl0/CUV+91JJoFfq6Gtz//wwsm0PNN3epn/gF
 ZRXcgHoyC0DzvS5MpUakpYC+RtC3OqMErHsf2FxMaFVupI/FBwezA73uwFChXsNrZrXZTBnkr1l
 w4XX+OY5Z6XGYjqmr9/BNMiZdCFzRaLXagnkP5xI40yoeoz0H74tCRORmElCV307GscuB4ny5Ei
 MMOtiAUEzBi89YUowzZSkq42bQMXODBDdMFQx+xD8erajv2iwESczt/smT4s0XKMdsmvlA5cSI7
 CDvjs66kUqW34NcW28DenGrDwIPE6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510060123

Component bind callbacks already does runtime pm calls, soundwire codec
also tries to do the exactly same thing resulting in Unbalanced
pm_runtime_enable and disable calls.

Remove the redundant calls from wcd938x-sdw driver.

Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Fixes: ebaf88c0546d ("ASoC: codecs: wcd-common: move component ops to common")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/wcd938x-sdw.c | 20 +++-----------------
 1 file changed, 3 insertions(+), 17 deletions(-)

diff --git a/sound/soc/codecs/wcd938x-sdw.c b/sound/soc/codecs/wcd938x-sdw.c
index add907cb2706..8c8f39d04972 100644
--- a/sound/soc/codecs/wcd938x-sdw.c
+++ b/sound/soc/codecs/wcd938x-sdw.c
@@ -1207,24 +1207,14 @@ static int wcd9380_probe(struct sdw_slave *pdev,
 		regcache_cache_only(wcd->regmap, true);
 	}
 
-	pm_runtime_set_autosuspend_delay(dev, 3000);
-	pm_runtime_use_autosuspend(dev);
-	pm_runtime_mark_last_busy(dev);
-	pm_runtime_set_active(dev);
-	pm_runtime_enable(dev);
-
 	ret = component_add(dev, &wcd_sdw_component_ops);
 	if (ret)
-		goto err_disable_rpm;
-
-	return 0;
+		return ret;
 
-err_disable_rpm:
-	pm_runtime_disable(dev);
+	/* Set suspended until aggregate device is bind */
 	pm_runtime_set_suspended(dev);
-	pm_runtime_dont_use_autosuspend(dev);
 
-	return ret;
+	return 0;
 }
 
 static int wcd9380_remove(struct sdw_slave *pdev)
@@ -1233,10 +1223,6 @@ static int wcd9380_remove(struct sdw_slave *pdev)
 
 	component_del(dev, &wcd_sdw_component_ops);
 
-	pm_runtime_disable(dev);
-	pm_runtime_set_suspended(dev);
-	pm_runtime_dont_use_autosuspend(dev);
-
 	return 0;
 }
 
-- 
2.51.0

