Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2EB733A025
	for <linux-sound@vger.kernel.org>; Tue,  2 Sep 2025 16:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756829561; cv=none; b=OspAYujv2YDuf0SrMWWoLOBXsKxtW68ANuQTK3ZABT58QMm2R4k3SWNxn7k9JLk8DFUOsOcn1qWAkqdevhWQeHBNRgpa3J33ZV12I3KXWwl4YlVYeeqNb3Jhkj4rQi1/X6MrfWfPoup+It0WlThZ2vKG1wxLRV5U0Q5lw3zdoXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756829561; c=relaxed/simple;
	bh=fD8gmiEfvHWqA/qKuJvc+eRI/STX56LOgZaEfMt7N+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OsG1Yq2ouKwx596j8fAj56ZeqS7Dp+6wayyPXMUponxAE5TTNcGFHNBE75vqRNx3BOJfmmbNnGfW7dhOjOFF7Gj8QO4zuEzNWDL/QgRlkS9208uKASU7mWmy6lcR9JLsBymcfhv9yI++YRquv4kuWmdxYdj45hOqDm0mT/7Rh2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PjmYkNhV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PjmYkNhV"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582EqIBF004319
	for <linux-sound@vger.kernel.org>; Tue, 2 Sep 2025 16:12:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Bwb/aCh+px1
	clBI7DNv6FaMGNCjRZCn6kYUkRggRljo=; b=PjmYkNhVcQKcnCbkJSPJUAYI0iT
	itEYfYOmODbOesuYreELZm3Z9rR2SVSNqVyXyp31Bx98xh9GWbPCAs1tm040a7eU
	l2C3SKycrOh5g4fk/AMTgsARcmvJBTqyRruPDIWPtGtv/QQhJXmvi7F+gDPr8bMg
	PXj94iy3JILpxvOvwx4UkvwFwRQtBdzlWOsZUhATQgjxTv4A/Q6tPb/bw+w4cW1T
	YLkV3ULDvgnPTQsKYuLgdxq9jd9SCEw4+yLl4d7j+CNQXPznYhG9lHB4xBLxEYOm
	LXes7BPtE9ihtccjjs4fsjB0WEdVGih+YePNYc2PWxATX5WIB42HiPNCaeA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmjgene-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 02 Sep 2025 16:12:38 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b302991b39so93636001cf.2
        for <linux-sound@vger.kernel.org>; Tue, 02 Sep 2025 09:12:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756829558; x=1757434358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bwb/aCh+px1clBI7DNv6FaMGNCjRZCn6kYUkRggRljo=;
        b=goiZkXR1ZjXikuvJSqqUQkNV0pozriooJ9OtM/bK4QHQbs1SjSe2pl1gWMdJuUaWLt
         5/1AIvpTBua5OBGYMPA799GHNZeC9PScGnGjYRZdmdErJJ/SB6Bb4UT5aKIgZbj2RQXH
         PoNIEYgwI6vN9IUdyULGEt1K5mUaUyFQ9iwDLfFL2qQ927xjJUSdO6aos7EgoecPKoh3
         YfgAifl4jzomthh0+aKCs+0/PBBTuX/i6Sa89kc3uGtHB7o2TjCdGH2cCApLaCmR0RAQ
         w8mOMdlQw5dEYodWwDJ8rXMgCCGHeRuKfPB3BxuK1jEHoI9J3pox93BgVbav2YBDK0ii
         BsZw==
X-Forwarded-Encrypted: i=1; AJvYcCWbkXA1yY8Wpd2OQicJVgeo4W5nYh7TjtdkRs0clR9rZPIzVG/qfxIG0YYhEyL+G0Uvx+mTOywQdwNQNg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwE5IpuL30ooWMGiEuHTlNZJldBrqF85P3usODhgjKTFvnrj1PK
	/9RQa0cN3Qz7kidKLpu6/gjCM/Jdw4A4lIvAwJQj/6LMXtCpKp9lHucw/X6bncMBt1J9ma1VvY8
	no9NQA8dkiflk2ffzTQoHSemX8l7IkSS/x0Dtd0YMeR3Hynr4y38jbusvo9b7P4KwzQ==
X-Gm-Gg: ASbGncsMWqojC1dEGboOLCKzQYtq7SwPBC7DcELxVaLfKwO8uOzddAG+1dv/uAEW8/o
	Kz7NBQQrvhpfiVgxS2+Lz6j52+uCdaGZLw0YqrGuM3saFnpXRUCLmbCTGA1V44fFciASqCWN5BQ
	N0z8stzKu36s7kWx3EUhdq5vjMC0mFhGaa7OZiWFBKMOfyHsirqpHFs0TupFDT337GAwh9fk5C7
	g2zzIXhX5arHDKMGfdFbCW4C69NNDeowx5cIqoOf1whXT6x5dLecJlRSxW4F3Rvgn4+71CsUoOx
	u5x66aJB2gwb7Wqpez0C5X6FsKjhWemVG57RZcUVGdVbz3q/3yyDnw==
X-Received: by 2002:a05:622a:134f:b0:4af:1c00:8996 with SMTP id d75a77b69052e-4b31d844f80mr137909351cf.6.1756829557908;
        Tue, 02 Sep 2025 09:12:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbbJL7r6hnlJk2ILZDcshA1ckcRvSYtJMZ/v6tTpM/xWKM09mldYu3JSH5x202tVN9PMus1Q==
X-Received: by 2002:a05:622a:134f:b0:4af:1c00:8996 with SMTP id d75a77b69052e-4b31d844f80mr137908691cf.6.1756829557224;
        Tue, 02 Sep 2025 09:12:37 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6f0d32a2sm309894655e9.9.2025.09.02.09.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 09:12:36 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, krzk+dt@kernel.org, vkoul@kernel.org
Cc: conor+dt@kernel.org, srini@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 6/7] dt-bindings: soundwire: qcom: Document v3.1.0 version of IP block
Date: Tue,  2 Sep 2025 17:11:55 +0100
Message-ID: <20250902161156.145521-7-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250902161156.145521-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250902161156.145521-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68b71776 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=W-ialWlWjSFIadUgVrgA:9
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: I_-KRIsevLnPOg7OZza-Pw_vCPofygXo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfX8HrWHzNwgwvD
 uPsks8lyOUeoh6Dr9O3yUw8MfuZRA8+WnbnUdajjSxPm1oLkmdiMp9a9I4dtwhwiDW+kDf7fp1p
 jCiIhfCQoe8PJAVnfoxhcMfuH029b/qPjYizLYMPmNtvNUJWSCLfkSFCyRBOPy52BPKUncAvryG
 CmAFZJkWHor57V0oy8NOC7tFu/QXOIAQ2Mf4oQ0mPugWdp3oOMPi3Bc4cB6whXBpXp1fCP/fPV4
 lLUBK4BPeUEeBofVifqh8kFerXu6o2RyH4gW1e71IQrPNqCW07JHefb4C6R22hBQ3W5d+6HnyqY
 kEJIVPSfTa6x03KJbpban8CjgDW1fBBWN0wvxERtwMhzTv4v9XOJ9M6Ecjd1AA75b0x62uYz6Ao
 xGWhxPG7
X-Proofpoint-ORIG-GUID: I_-KRIsevLnPOg7OZza-Pw_vCPofygXo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_05,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300024

Add bindings for Soundwire controllers v3.1.0, which is available on
Qualcomm Glymur SoC.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
index 7ea491f7e828..003023729fb8 100644
--- a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
+++ b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
@@ -23,6 +23,7 @@ properties:
           - qcom,soundwire-v1.6.0
           - qcom,soundwire-v1.7.0
           - qcom,soundwire-v2.0.0
+          - qcom,soundwire-v3.1.0
       - items:
           - enum:
               - qcom,soundwire-v2.1.0
-- 
2.50.0

