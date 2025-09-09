Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D63F3376AE
	for <linux-sound@vger.kernel.org>; Tue,  9 Sep 2025 12:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757420438; cv=none; b=QjbCQ+zfrC+g5tJ+HNhNwPhlwqGa42mEz6lfTlsE372wQUB+hYHk4zzUlIPjq1IFVnTxzjHbF56jvyntOwSnFt932k/aZAgiB2d4t0kgb9X64L3LBDBjJNx+g4KRc7pHDnHzTcJ4kdXVHNY9eqsSeEARuL8A58E9KS6Q2nL4FSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757420438; c=relaxed/simple;
	bh=HmXyaDzSyYWKVyfOvvK8VoaY3HzpzmVHwTfs57fRK7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hr2idsNkr24TlL71vpLsv75EVpHFZHv5XJmfMDNtN/YvNN1bslO9gctREGXylUCBhc5+inWbAkvZ/82z0vGBahsNErQvKG7kG7sYPD1hv+d0Etdc9ZpUqvjgo1oSvKreU92tIwQGTiEkWrBFM3P+upHx7ipW1MsNWYwk5PT5Tlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L5DXRPLR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L5DXRPLR"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899Lhja029929
	for <linux-sound@vger.kernel.org>; Tue, 9 Sep 2025 12:20:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=oOmSsAnlxpq
	Orq3+ovrwk8ydYShsFwbNuJh8B6XuDYY=; b=L5DXRPLR3OjN03nOD4GLtIgaS39
	nT4AGl02owqfL3J/mWro2xbldiKRy3NSTUyfZgLpEIpmua/k83vVaUpeBG+ooH2o
	AO7l4+EdesubTiRFpws8aumc89Ke/0M7oM/CYYQPFWIk3revcqzNtq20VvJX8KFX
	YeIBpTmiYEtLOOGAiER4Bobx+LGgyAxc9G7hP9nZ5fpVP+55QQmAUOnmVj5rw4Ot
	bSCnOdNkObennWUhMB3nORsSYfXFgSHh4uQnlLyxqfWqLVlQUOXiIPF5fDSQMyyf
	CaRwnrRKUEf3M08r2/TC2tF2/yQrF5Ki5bvKOP6QtcCSszxUyxN9NHzwBOQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491t37vn1k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 09 Sep 2025 12:20:34 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-718cb6230afso121303706d6.0
        for <linux-sound@vger.kernel.org>; Tue, 09 Sep 2025 05:20:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757420433; x=1758025233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oOmSsAnlxpqOrq3+ovrwk8ydYShsFwbNuJh8B6XuDYY=;
        b=NKacAOuxBNq45buB+u7yP9SEu9SiqppeomFs7V3I7UoqvlzhBCTAQ/m8Uq+RljhINC
         vnHgcUvfUMr05vapWBFN5mgmArKBRisvDu6j80e5MGaDrZDDuzkPhzeLAKdCMAevk5Cx
         iysUrxjAuZ7GghFLPuEgIuW85VVMtuMkArOa2mYrDFThID4/xZcfL6uft3W/ACengiir
         HSnwcpQuwwGYGpju3IUUmPXfxOwxd/fbSgrgenFWOC7ASRneHLnMJUXKeda/AxKVygND
         MeYaxAz0Xw74EoATjB9lvwvlgZDvJCXu8GjhKu3FOIBXQBmV2nhes4WC+QHJDFTXUMMT
         YCsg==
X-Forwarded-Encrypted: i=1; AJvYcCW1ScLTXdEqmXjsp3mP8UVUyI9CMsKNVKKJgFVuZiNVJf4m7fZXrfhIzHtJtYJf6eYXWujkOixoGFmXjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSdxndo39CcDuFAV3E3yw6hWgs4pKWPn6s9VPdtlKz2pU7opOQ
	CLf2ABa9PgFoz+NmZWY5UEK9KC2g9mkqM78HH/15zKyBX/+kB9XsgPrDNHdhk/bAYYmFORD8diP
	NJslRIKYhhW6DY2hT88rhXBX/UzLjkZyGUu+63hHqRY8gDV6CZlvla61T4EFKnQFtoMbS9vzIuQ
	==
X-Gm-Gg: ASbGnctXxvB0U4KPbFOQt0e2yMzkfcJpi9eKoDGB73CRTFOlJ6idM2SdPLTuHF+5h8J
	x/Xp+bwLzoICqhOdZOmc9wmTCC//TwQQ5p/VfIR375psFWt8SugtM2Qsce3rkbMs36AqRB4Hb+A
	ebGOlqDrAAG4TdyjLb+A8oYvKEA+vm8p79d6TL4oXRPLOfRedmQKAgh+AL8eCFdLun1+AtWZ8gr
	0HsX/taulqpD0CRz3CJoq2Tc6SL33N2X3K3GPPSXrKVZWnHeYPdGULshVV9ss6mQYAQ1//bEUiF
	O71c6cL4/dlVwH6fLoV3dmmV0ebMoczp/nRiBNQYDow1KIilQ/XSXw==
X-Received: by 2002:ad4:5cec:0:b0:728:7749:26e4 with SMTP id 6a1803df08f44-7394276ffa4mr117056756d6.57.1757420433260;
        Tue, 09 Sep 2025 05:20:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGXF+ftxU8ZDSlhD2HodezUk/i4BybgQlaMQPM/WXTVJmY4zEZIOZUrPopisD1hK+pGViISw==
X-Received: by 2002:ad4:5cec:0:b0:728:7749:26e4 with SMTP id 6a1803df08f44-7394276ffa4mr117056186d6.57.1757420432633;
        Tue, 09 Sep 2025 05:20:32 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e75224db20sm2414629f8f.60.2025.09.09.05.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 05:20:32 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, tiwai@suse.com, vkoul@kernel.org, srini@kernel.org,
        yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v5 13/13] ASoC: codecs: wcd937x: get regmap directly
Date: Tue,  9 Sep 2025 13:19:54 +0100
Message-ID: <20250909121954.225833-14-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250909121954.225833-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250909121954.225833-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: -vqkp6OMqRKN2KdzvVdBJ0EH5V44e4T4
X-Proofpoint-GUID: -vqkp6OMqRKN2KdzvVdBJ0EH5V44e4T4
X-Authority-Analysis: v=2.4 cv=NdLm13D4 c=1 sm=1 tr=0 ts=68c01b92 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=5pqs-Pqnn3KeH4UlXPsA:9
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA2NiBTYWx0ZWRfX9N+7xXpPoJPx
 y4vg+vTP0gC1FEqyvvOg1jgVAZM9KtiKFmR+AAzpn8EbF+KtT/+wZDcHOa/EEDArNdxLip0nzBO
 s8S3Ykv6IYfTd5pZeoWAxotmn16TlCi+c2LjTcT2DlyOA/kbpO9JFtGlzeiHdO9X8yzSrLMVfS7
 G35QJUX+Y3Uwxe9F8ofE9lAMULWpPZ7bjbl8oVAF09+7ViQZp54ua0dSHySZ2gTdldQ9+OO1llw
 6hoDLn6PMk1ITTGLKYXm1yqEwvtmNSiqYJe0pV24TLaB6+pbnaVhaNw7QeE+DaDok6MI/WhlRWy
 yyRSKJL1n3dCgDd3dwQkDGnSLR+KeuCFRvqI0dJ5pSAtQWekE+WxtARKKfF0NrsneIilms1vu4a
 +YqhKOd7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_01,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080066

Remove usage of dev_get_regmap, as this its more efficient to directly
reference the pointer.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 sound/soc/codecs/wcd937x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wcd937x.c b/sound/soc/codecs/wcd937x.c
index 4c040e3862f4..421ec7a2d6bd 100644
--- a/sound/soc/codecs/wcd937x.c
+++ b/sound/soc/codecs/wcd937x.c
@@ -2790,7 +2790,7 @@ static int wcd937x_bind(struct device *dev)
 		return -EINVAL;
 	}
 
-	wcd937x->regmap = dev_get_regmap(&wcd937x->tx_sdw_dev->dev, NULL);
+	wcd937x->regmap = wcd937x->sdw_priv[AIF1_CAP]->regmap;
 	if (!wcd937x->regmap) {
 		dev_err(dev, "could not get TX device regmap\n");
 		return -EINVAL;
-- 
2.50.0

