Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6437E31AF22
	for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 12:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755519777; cv=none; b=K3ftYJGkvIm+/2EMU225rFoBmkNx/GivpWoyD+mxXzsGLBeeqfN8v2S+n4zHYAXpp3Gu4bjdbbxiL9WKmB5njpT3gzlfBnIBzVKJfoS0a9eH+1nGa+DX/5OUWcXyJ/7Lu8Op1oPKEvx+NAvSjDqBXbQxxqWTwud3BsNZspbVqoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755519777; c=relaxed/simple;
	bh=1QJy5HXp8RqtbvfH9QjSa54p4CKY+vOGD8v8UxtU1oY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q/O/+SglZNWukX9e7XojUUYd4Zi5nt4GpW4wIaJWXAF1BsBF8oUMRIXSvlSwnuuEMGALbgn7UEeQB/BiwuU5ZUsRu7C6tGslhZ4uBfpbV95q///6vkLDges4aaLWuglFN6igC2uq0iHuuBs1pwBDZ8u76brlAc7qJpwiLYtjWos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dp1ivFds; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dp1ivFds"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57I8EGEc020005
	for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 12:22:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=HacHHhvAXRy
	jcyFHFFz7ZOUdKUy5an4FMJmyZykFyXY=; b=Dp1ivFdsODGuK33sbocSiOd/XTU
	VfdsOvOYNu8PXzANreC+N9dRKOkSlFkaihA5loHby8ykcrqxFlaPjTgbLp7stivc
	SwWRJ5HjflMThB8lkWcvqr7rnOOPl1ywZHGLDHDHsPWTChYwg6IARcaNN1p3/dF0
	REc5lDwfAuKQKaC9dKukmzS7WvabvnzY3n4Hmtcgm3SWQjvU3mMX2lX3tifpxiw0
	quGCH77UwDgdHMjItaGkza+uZym1MRdHlIR/Iyaze8IqHh665FrcfKbbEMGNPtyB
	dWD29Y8h6i73klupArg8StEEvlNmQAqYbRamirrbcKHbKq+slAyKw3tyngQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jjrfvm4f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 12:22:55 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70a88dd04faso152044426d6.0
        for <linux-sound@vger.kernel.org>; Mon, 18 Aug 2025 05:22:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755519774; x=1756124574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HacHHhvAXRyjcyFHFFz7ZOUdKUy5an4FMJmyZykFyXY=;
        b=XzKk5+K6mcNOUNkTbyByJYzEETu0At3S9/fGXO5rj+Qcbz8jQLoHJgJU39NpcQaRv8
         lNnkW/KCJxUUEPCx8NStclR8mYnZ4R4UiZSHx/DcG0P6Oaph5ZU/jR84r+fCrHWS4cyD
         oY4+fcGXvdeq7AO9Wuz07hJs14wUIAS5BrmTTCsIOZA9JglmrmdPNehK+q7E+gUTSLxO
         fx/fAIQCv9BSRbH1yday63TwHOQOgZhlvdCGh8gC1l2i5xDmBQixvtG8yBMuuWQORwJa
         mBR7h9Ztd5glMTLEITa/72Gyn2Hy+LjRnzzHjKpKwmQQ1StFrkZWxp/ZtgpT9xV4ZmlV
         VeiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRmUGcm9JzBPyujSeVS7DO00oU72t6ndYT4ttE1bhqM3vpr9FufKVBXyxMzfOnoBWbHHOWZya6esWlMg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+xGd7K2/B177Q+XEfaiL32Nc0uS7nAAL0c19n2wcYnmN02Bhn
	QT/4BuTdraNkSIk5OA5fHYyWwZW+G/envetyFJhYO8ofenKkIn7hshdp68bBQhgSMBRkXBQPb7m
	ObkWNuJ5rjLzRwmQ0ZeY3BidwU7lknJajS2rZ2QwTCs4tWaWxY6EGVJ1/mdVAjJ21YViu+nksWg
	==
X-Gm-Gg: ASbGnct3WyN95lTBCY553OjT4obuUN6UFQFGoj6RPqAnRqERFtFIVVpnryXLh3rXwLw
	NtRfV77qTN6byozHOD1AAUwDxR4JSs1bfq2Bm/+myZ4tQURIYsiYXpQfB7JaGMBBA53HBybS2Ev
	HEq0nLJp+uUKRPDvY1ygSI0Oex83jW/7GRFOiu7kkYiA0I8H0nErXycGYo94SjluKA4V1KMyH6W
	bfG0TKHCZobemzhAaoon5raN8wZ66li/mEikOhcHLAqzwPYMXCMGrWXeLZitIdSi23n27KTZVzi
	PBu25qlyoDis/1UdGatmelNR8inl1kdwjZxzerVgcWjwrJ/CHf52Nw==
X-Received: by 2002:a05:6214:29e9:b0:709:3ab5:b935 with SMTP id 6a1803df08f44-70bb0589299mr110356136d6.3.1755519773981;
        Mon, 18 Aug 2025 05:22:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCkyZbh90HaFr43NwnI2Xy8gRlPpwFreREm5ORfx3M9PZ9NBRHduIuQl2W2+h3ZKXM+Gd7qQ==
X-Received: by 2002:a05:6214:29e9:b0:709:3ab5:b935 with SMTP id 6a1803df08f44-70bb0589299mr110355616d6.3.1755519773342;
        Mon, 18 Aug 2025 05:22:53 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb653f657fsm12601563f8f.29.2025.08.18.05.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 05:22:52 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 4/6] ASoC: qcom: audioreach: fix typos in I2S_INTF_TYPE
Date: Mon, 18 Aug 2025 13:22:38 +0100
Message-ID: <20250818122240.1223535-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250818122240.1223535-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250818122240.1223535-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: msjNdi9cmUncbMzf1KpkkVw2_q748Xcn
X-Authority-Analysis: v=2.4 cv=YrsPR5YX c=1 sm=1 tr=0 ts=68a31b1f cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=NygpE-9J13evsolF8bcA:9
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzOSBTYWx0ZWRfX7w01Ku/0Zywh
 U5Tiqff5eRA2MYBgA56QwiPsx3N5FnKvqHu19eoMqLGUPdnDDUi55ATeWUBeruHkfeU2yea4+n6
 0OWPR1Xo9KzRnyK6wAKPEjIN43RKVRldz+zn1GPV6xcvoZbdxCAEv8w6xzc/tIeTKV+28DN/J25
 BCunIyotj1gw6m0lMSCin9J4Nb4wrwJhyjIx4+VkPC3UmwMODrQtZWx4c9Woiao0ZedyFjg9dDl
 gB+KpNb4V7PmmkbJgSIJpwXKHPOhwv4y3hTkYliZO0tzZMCvKzWZ2LtEQzwGkNjwWlTCmD+4i38
 AdPcF3zsCs8b6wUeeYU+m1xxcJTKXOWOFnFTuY2OGYOCDesXTLnShy9KrQQAp4cF4jclOwIGYAr
 HeC+wGdi
X-Proofpoint-ORIG-GUID: msjNdi9cmUncbMzf1KpkkVw2_q748Xcn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 phishscore=0
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160039

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Fix spelling mistakes in I2S_INTF_TYPE defines.

Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index 617bda051cf8..512886042224 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -27,6 +27,7 @@ struct q6apm_graph;
 #define MODULE_ID_DATA_LOGGING		0x0700101A
 #define MODULE_ID_AAC_DEC		0x0700101F
 #define MODULE_ID_FLAC_DEC		0x0700102F
+#define MODULE_ID_SMECNS_V2		0x07001031
 #define MODULE_ID_MP3_DECODE		0x0700103B
 #define MODULE_ID_GAPLESS		0x0700104D
 #define MODULE_ID_DISPLAY_PORT_SINK	0x07001069
@@ -462,8 +463,8 @@ struct param_id_i2s_intf_cfg {
 } __packed;
 
 #define I2S_INTF_TYPE_PRIMARY		0
-#define I2S_INTF_TYPE_SECOINDARY	1
-#define I2S_INTF_TYPE_TERTINARY		2
+#define I2S_INTF_TYPE_SECONDARY		1
+#define I2S_INTF_TYPE_TERTIARY		2
 #define I2S_INTF_TYPE_QUATERNARY	3
 #define I2S_INTF_TYPE_QUINARY		4
 #define I2S_SD0				1
-- 
2.50.0

