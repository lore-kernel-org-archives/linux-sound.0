Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4655E320CA0
	for <linux-sound@vger.kernel.org>; Tue, 19 Aug 2025 10:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755597730; cv=none; b=oldEZlXuF8BtlOR9vJB4g+fhVoIhT+sw0njYTnEA29iqL6X7e7gu1RwyLWykxvQWmbc/Hyxv1gRewuorS6oipIW78L73LoFrr/5JcQiqa7prB3a7YHmQbXg3PNJcqgSRIvV9Q30aixhbOmxAKUCjzvbptfXiAZ8G65xel1qswr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755597730; c=relaxed/simple;
	bh=Nxi0Bidenhap9cy9yhPxUe6B3/q8TTTaqSUBpij6HY4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HLgP9PXXQH6A9OTZs8Bw9AsBXAKhSIinjHEnOi3c/fr0jLKBionDMU+ohdkss6lh05GT/RcxL5yTrQFqqyPyyOUzx5LcvXQASAsjKEkgIaJlCF2wTmvHCnQNXTvGhReobiAV2A3jIVSod4JaDOatjvag7bWKTTY3S+WXlBJg9Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Je9JxUrY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Je9JxUrY"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J90sHl023690
	for <linux-sound@vger.kernel.org>; Tue, 19 Aug 2025 10:02:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=THJxLq0EGFK
	SHTbEou4KGPig+UVopLb+QSBxv3D1Czk=; b=Je9JxUrYO1MYQVBk/sy6o16JBAQ
	fMXurRGK2QENt/MrN5y08wPT3bp5gcomxOs8hy41vAq9Blrh5E/WmatsGMfzkaX7
	GHH+rCBnRpY63o9TKQ6OV/UVHPb6pIPgwkou1vyplyUIPUIaU0uWgxh2AsX9s7F1
	O/WdSD051Oc6timTyBH7b1rYYPT7U7WJ4RYVKqifV57SRHVf3tSKOJ8rY3ru7DFp
	uFFuecuSJn6H8iEvgWCCrsyqfL7y7KkQV8S4IsJ5bHtlxkJpLLw27YxLC8dDjJ1r
	3sGIiazntYXALoKOSo4xSQGshsMMvZmzRW5kG3vFIIha0FdXJRWz8sMaO8Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48m62vk1yy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 19 Aug 2025 10:02:07 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70a88ddec70so50338426d6.0
        for <linux-sound@vger.kernel.org>; Tue, 19 Aug 2025 03:02:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755597726; x=1756202526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=THJxLq0EGFKSHTbEou4KGPig+UVopLb+QSBxv3D1Czk=;
        b=pShmqyVjEGHe021uf7oSU/fsRyTLDcpeR8/5qKVtnaymjS29jK4tvhoPfLP6+TS/r/
         S8v8LJ2voYO7U7jKfs2EJJq9VFWTG9+ww5BH+kLBwSTHkPhELgskiKafA40lS9vRpd5J
         qcAR33gxCLvAQldGSdITnxkQdebaAnK0Cw7S68IU/Zwuf0SutK2BMJtWKWWD/s2nfyYX
         8OLfvu6oKGChJCPiwWBb/tqFDkcVuqaCEfiVT4l3nNawmYJe2shGUlLfhrzVTnQZnFwu
         p93VT76Mr8kTrSLbRcxwhhKAKL6RsXDNREEjsIGx4hiH/PKN+kGGDN1ucjk6QrIbDy0L
         /RAg==
X-Forwarded-Encrypted: i=1; AJvYcCWWO3TIxdQ06+ajepWsIOaxnseZdHSdckddKx301V9F3/yDpiksI/5ahQtJyTyYv2LmY69yOvV/b5JDHg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVawGTZLkrLlg98YOxPP8pDTwfNw5VatlTkMTrEXp4k/LqF5n7
	3nGARhZ7UzUHP2zOWOzu8X0R1GzBHB+VlLeOmSICYlJo9Bc7zv0hXmYdLqMJjLIN+sc1009ckZs
	0KtsxHN/GEhM09Us0X2YHc/JwJ3Pk+TzNjNnjuPZgxqaZB+Xfj/sIZmKllwQzq7PfVA==
X-Gm-Gg: ASbGnct0jkObuxlULWHErs6Ghu+RikxiI4Cek5uNd7eDrIDeUXEWYYVS72sPvB9MnaN
	hOEV7LKAcfwk0w3SFFZopPlI1MHVdAVa50EDuByq+ys8gGk2rfAkuUkRTrImAwwOSLIj/QLn4jo
	ZBFVK8cgByvX4I8UrN1rw/2j7Ep/r7cpeDcmeTyQBj0xB1qHSGSp0epXM6kAJsJh3eDrBJwoFpL
	tlmc+BFgP5KIAs0FPnlnygkA/UYJdNRjFPrx+UstaysqNJXY7afZoGGAvNy6Dc2Rx1F/KF2MQHL
	ffmcKquvehaBq0meLFq1bX9T54pm7V96FM+pJsi0MyGRQc6r/VlyPg==
X-Received: by 2002:a05:6214:2b05:b0:707:6161:5988 with SMTP id 6a1803df08f44-70c2b5be2cemr22622336d6.7.1755597726139;
        Tue, 19 Aug 2025 03:02:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9ANpoSUVhLH2Vcl4jJV2fZu1fKwBudjv9iiCIhqRJgJR9L03CXR7iurdsDGOqFENhFyeGtg==
X-Received: by 2002:a05:6214:2b05:b0:707:6161:5988 with SMTP id 6a1803df08f44-70c2b5be2cemr22621746d6.7.1755597725521;
        Tue, 19 Aug 2025 03:02:05 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c78b410sm216169635e9.24.2025.08.19.03.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 03:02:05 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [RESEND PATCH v4 5/6] ASoC: qcom: audioreach: sort modules based on hex ids
Date: Tue, 19 Aug 2025 11:01:50 +0100
Message-ID: <20250819100151.1294047-6-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250819100151.1294047-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250819100151.1294047-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDEzOSBTYWx0ZWRfXwp+NIOXzXAng
 ZXohq6Yx8XjpUTDnhiOuKAkxw6YzQHWN+WfrjQWDPrUmkwmezk69OsXhW/FQtm2CYi5x0LTLpw/
 FamjVZmNe+7wLpKpNJNaGlSK8RbDeUje7Be+FgZVYk8pRioyIePFhJPp3eqRtadStsAVzlMoDEX
 QhmTRvFUCv5B8mcfpUWemC20Wn4G+uZ79MKGoEFH2E62FwiPzeumraFOFNkYSEWEVnw2zOageVf
 2lI87AoSDRwGBCT/cfWVIdmB1W9J4FQWaGqJOoVpA2YcyCoA9eXgw8VnljtuEWVI6LOExbQCnP9
 216b8Yl1IHrgTj0A96CkaQQ2aIF/hBuxbygVmxs53ATOUIr4dFwoeAvbwB+5ylXRKbt8SOg/wW5
 TMn619Vc
X-Proofpoint-GUID: XrHxIyiszbqKBFU31mUahy7QTCQLMVKj
X-Authority-Analysis: v=2.4 cv=A4tsP7WG c=1 sm=1 tr=0 ts=68a44b9f cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=8nb5IOs2KV4HrawvOq4A:9
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: XrHxIyiszbqKBFU31mUahy7QTCQLMVKj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508180139

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Sort the module defines based on its hex ids.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/qcom/qdsp6/audioreach.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index efc918452e2a..e4babf9a44ff 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -18,14 +18,14 @@ struct q6apm_graph;
 #define MODULE_ID_PCM_DEC		0x07001005
 #define MODULE_ID_PLACEHOLDER_ENCODER	0x07001008
 #define MODULE_ID_PLACEHOLDER_DECODER	0x07001009
-#define MODULE_ID_SAL			0x07001010
-#define MODULE_ID_MFC			0x07001015
-#define MODULE_ID_CODEC_DMA_SINK	0x07001023
-#define MODULE_ID_CODEC_DMA_SOURCE	0x07001024
 #define MODULE_ID_I2S_SINK		0x0700100A
 #define MODULE_ID_I2S_SOURCE		0x0700100B
+#define MODULE_ID_SAL			0x07001010
+#define MODULE_ID_MFC			0x07001015
 #define MODULE_ID_DATA_LOGGING		0x0700101A
 #define MODULE_ID_AAC_DEC		0x0700101F
+#define MODULE_ID_CODEC_DMA_SINK	0x07001023
+#define MODULE_ID_CODEC_DMA_SOURCE	0x07001024
 #define MODULE_ID_FLAC_DEC		0x0700102F
 #define MODULE_ID_MP3_DECODE		0x0700103B
 #define MODULE_ID_GAPLESS		0x0700104D
-- 
2.50.0

