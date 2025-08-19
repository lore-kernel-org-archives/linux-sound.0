Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80ACC31A055
	for <linux-sound@vger.kernel.org>; Tue, 19 Aug 2025 09:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755595621; cv=none; b=a0yBbeErV13bnp/QrEnuM+AbqMPJ5JI3DTpF2yDoBtLjnv0uZmrAUqahuD6lA5UMCpngXCR8W/63daNbvGjLmky/6uDf0sf2Q+hjg2laaR+v3l+DWxM1GsOebD+Xe9sZeOPDycyaBRgWzcTpTdFtm408j92oImzJhuR/f6D8ZsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755595621; c=relaxed/simple;
	bh=qwuYqZpPtHuX/2WTSLKobMX+4muge/nS9jt2JifQjdc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lrYS4zwuEeToAwF19Qg7GMBB0miy4dbB04jWIudA8YHdCa9puVJ8lpjSsbk1x4wkrzsdJtS15hBemCC9I0k8UAPpCwCcZAqdzWHC9/UwbQTbhiyecOP0JJK861WnhmZnKb8NnI30ehZbKqH+9w9XHql/6QV0tcDLxGHOZMxcLVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XROCsWtZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XROCsWtZ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J90bJn032432
	for <linux-sound@vger.kernel.org>; Tue, 19 Aug 2025 09:26:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JQBp3mqbspP
	8PIJt9/SllqFn7BROE0fyDwOwOB0VX5s=; b=XROCsWtZdLU9OlrL9JXQ80VNU4S
	fV9cR27u+nJS/0bQgu9RLMZV4rbo6b6jM57Fxy+/AtPE/IOY6hPiFXlxQqOpZujI
	+3umOBaVK8DVMWbTTMULMW+yWFVcmtBC6cZFsApsewBs/u177n/cg9DwBboPiBe1
	EdDLmdANWI9UtDxav9JA8IUnF+s9Fn/zw9cO3sU1WtlyRccmjYXzAy+2LDWHjeT1
	x+i2DFr/ceCKZmCMuRYCLq6jwowte0AWuT4LccPAU/WHYk8xuh8QBFAOHZz5HBxM
	5FFhyU//w5EPwj4jgRgdoK1LECQGcOrRtrv3cY17JdFaD95XsZ08f9b4g8w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jj2ug1f6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 19 Aug 2025 09:26:58 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70a9f55836dso120034326d6.3
        for <linux-sound@vger.kernel.org>; Tue, 19 Aug 2025 02:26:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755595617; x=1756200417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JQBp3mqbspP8PIJt9/SllqFn7BROE0fyDwOwOB0VX5s=;
        b=XQw0fmmJLL7XYyqt4VOQb1y4s5dkn92UOt/cNtFpOOL4pAwkOKim0izvseevTkwPLN
         ivKOkuwPUGjI8SjZrC9fWV8fsjv7ykzUhRZvhAum+8PhkKl+XdlHBcrkdxFTIGOPISaM
         9Vv48hqh1N5z9adMkRQf/RXwaesb8884PMLADnICW6S7CVswy5vfy1vcuQKWW3IY4xOf
         QVQPfJnElDNS6enb76fkVOAIovcol/QU1PwVTnFEzc02qmEZV7z4TPqfCoYQ9lmkHfMl
         7+t9fTwhu9rn0Im61iIyKzIwMWgpKzkCUax0jABDbWKhK8kuSzIMmfTC9UdkMbXVrXM7
         tErA==
X-Forwarded-Encrypted: i=1; AJvYcCUCVyNk3mMxDC6O9hWDrPEEyrRwAQDCOfDqgLYKtbeCiC1wI/JbGysmtoNPdxdip77eBkuKoPzX70UVoA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYTDNERldsjgNpXd6C8fm3f8+az1i1X9Gy57A2ytTof7DBZ9Zf
	rbZEyjOyg5uDt+oVg0avIN7LxWLuKnUbeyfSCfCkZMo0leObwwq0rhHcGBhyNGGc691XrgJ2l4W
	x1/PnQhyjLTl+sRBSYxzTaCPon2+h//GQXT+S4fqpArGg/Nj7Lp6T28WKH8SwACMDBw==
X-Gm-Gg: ASbGnctdTDJy2MqpSk9a75ckRmq+uaNKTapaXJvJg8nKFyH/FXZY60qB4/FejvJ/3//
	6irWtgMup6oEhkMdwWgE3sNA4Fv0HaaPpt9VJbJ6sp/pkbZCNhMAdE7yCvQlG5u0jYcP6bNNhRk
	DGshJu8IQXNANK5oneM0gWrCYUv7tLrO7m5/eoORtvSVUgoSBPP0HrnLGKjWya71Z/jP99s5PKO
	QBHwN78ZG5ghFxVzM93DkeQtT+W3XG5s/SItLT+C8XvGgdQOOslgR9nqUoKRN/l1PgpBcsaxocr
	1YP9L+hSosyIG5atd3a69ruzmIc7MwV0JDatUPCHzIFVywMA471+oQ==
X-Received: by 2002:a0c:f108:0:b0:70d:6de2:1b37 with SMTP id 6a1803df08f44-70d6de22760mr4529266d6.67.1755595617565;
        Tue, 19 Aug 2025 02:26:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzftwVvjZcbKx/aSVqHKdnD4XxyQfgbD2fI7yrWqryMV1/2Uiqfb40Par5qwmq0JDIgoaFYg==
X-Received: by 2002:a0c:f108:0:b0:70d:6de2:1b37 with SMTP id 6a1803df08f44-70d6de22760mr4529136d6.67.1755595617115;
        Tue, 19 Aug 2025 02:26:57 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c077788df7sm2942284f8f.48.2025.08.19.02.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 02:26:56 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 2/6] ASoC: qcom: audioreach: add documentation for i2s interface type
Date: Tue, 19 Aug 2025 10:26:48 +0100
Message-ID: <20250819092652.1291164-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250819092652.1291164-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250819092652.1291164-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=MJ9gmNZl c=1 sm=1 tr=0 ts=68a44362 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=FY2npp4C09wRtmNKfY8A:9
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 8ri_uAAjmxsAxh-5qh9lv_bVl1tAfom1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzMSBTYWx0ZWRfX7oy20vBFSmC1
 F5rHApmUeAASvVOpgULYBMYLkA8klbF2fvVLg0CwsVakpBIjnZ1zJTi3ELAICM47Pp8k5w9NltW
 t9EKZeXaOBbJjNyO1Y8GbqFhZuQX5krZlLvfbpTOTio5BJohW9kwcZKuwxQfVh3yBVDPRC/0mV+
 3T0IHNQsMnLy5hVdifUZc+bbGXDbd8AyxbB7m7ahrCO4r7Wi3OtOuXH5b2NtxpzNqe+EpS7t+5P
 zw55GGga2CvEudwrr9gUxvr5bZ1wqIOY5/ispxAx6swVWc+MPTyfbWhOxu+Y48yGadSx9ClC3gV
 GlBHAmCxmwGL8KD5vr8jCamOfqDsXrX3Te9dcBBHsXdRUaj2Ehzt9mE0+t3KvhTbFSIUdhyE8Aq
 Lt4G1zeU
X-Proofpoint-GUID: 8ri_uAAjmxsAxh-5qh9lv_bVl1tAfom1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160031

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Add documentation of possible values for I2S interface types,
currently this is only documented for DMA module.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 include/uapi/sound/snd_ar_tokens.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/uapi/sound/snd_ar_tokens.h b/include/uapi/sound/snd_ar_tokens.h
index bc0b1bede00c..92cf72a6fdd4 100644
--- a/include/uapi/sound/snd_ar_tokens.h
+++ b/include/uapi/sound/snd_ar_tokens.h
@@ -118,6 +118,12 @@ enum ar_event_types {
  *						LPAIF_WSA = 2,
  *						LPAIF_VA = 3,
  *						LPAIF_AXI = 4
+ * Possible values for MI2S
+ *						I2S_INTF_TYPE_PRIMARY = 0,
+ *						I2S_INTF_TYPE_SECONDARY = 1,
+ *						I2S_INTF_TYPE_TERTIARY = 2,
+ *						I2S_INTF_TYPE_QUATERNARY = 3,
+ *						I2S_INTF_TYPE_QUINARY = 4,
  *
  * %AR_TKN_U32_MODULE_FMT_INTERLEAVE:		PCM Interleaving
  *						PCM_INTERLEAVED = 1,
-- 
2.50.0

