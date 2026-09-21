Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26AD50B8AE
	for <linux-sound@vger.kernel.org>; Mon, 21 Sep 2026 19:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790017730; cv=none; b=AoSelgpRLghZfCd3Tgn8+cgHmhih45ElnyCASKaQ9hB+Z7/JoCKjffvufEp8IxCOANwFi0TyxscJwEwf3Y9QognT3J9mTeM4EfEPzQ0k85swwY14iQ3sXfh4D/yC8VmCehU0MqELvtn2RDNtzQd0cxluInuZzMid+vgTGVa4QAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790017730; c=relaxed/simple;
	bh=93trSbPzGcTLf7kCeG9wmsYEGv3akrfz6fUP2Eaqsh0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WHPwjCFQI+ImaX9xyVEAsPTUzaj4koPyOiqgUvfLedwaQvKQpWBM9FnzL1JD17gxVhLLC+2DhB0ebz2qZd8aHiy2IZ5/7q6Ud0QPHE+PYjp0mBNunrnRQHlOYO57+FBIk3aHGc3lqDVFJuBSAZHmdZ2VA+k69tfeeQvBG9jn70Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IIriMfa5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MzFlg5o9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IIriMfa5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MzFlg5o9"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LHKbgr1821798
	for <linux-sound@vger.kernel.org>; Mon, 21 Sep 2026 19:08:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+jmAQdn9jXKepq5Rmmo8OwCGEejY+0pnncnb0YnbRzs=; b=IIriMfa5nWLvB/7E
	ePbU7A3kIRfovsYziJYMkzdEeikLqiDlNKhb0DXw+LvXd0dzpu4jpObDGyEALBkb
	eSsKjEV2+Y28wF5BF4LjuP6u4Ghl/93zSogDIg2/JkZaqfjaQSQwUbar3/zNDk2u
	CfTubqkif1y4UKiSTzKW1xfsP5Wk8cpt9SEAevHYENOCXGu7soA6924DyXmNMQyu
	UiT3pHlkTUtpYw5E/MGyLjHHc8ru1pl8et8LMYwfVF4RoDZy5uXzZby3xJOOkXbv
	GcWazqwxLyIS3RjK/aCfN9vEp9z/X3E6S+3qgfhTTyNu2ewIxxT3EmAS6xgehetT
	p5t+Bg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu8w78da6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 21 Sep 2026 19:08:47 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2db87f759c5so64299805ad.1
        for <linux-sound@vger.kernel.org>; Mon, 21 Sep 2026 12:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790017726; x=1790622526; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+jmAQdn9jXKepq5Rmmo8OwCGEejY+0pnncnb0YnbRzs=;
        b=MzFlg5o9iHnkfmTqLTtnJmCDdd97GOg+JzEp5DmCtgeGfjPipdwt5AdZN8Pn9p6Qut
         7zGTzML8M9roPdgDL73+a+q3itS8f8kgPMQ6EKOQW0unYSaVUMsNt7bebNwMRKopU9ot
         H7rtiQD1PFrVnfuyWXBIkiKy0pJVzH1LXN+4q39WYs5DZjOigJQ2Jd+puTzcshZE4u5V
         NnusZQqdOlgkZn4JJr00PqTJeaTueXUne9lSs/cGUSjyIuvJhU1nBR/VNDSQHGQRPM+s
         v/2Bho0sKn6klw7Z2S6azolHd7x8Q+PKkksewtk/b3oZeWbzAgRqXcWMcJo68qyCTBur
         Pqdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790017726; x=1790622526;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+jmAQdn9jXKepq5Rmmo8OwCGEejY+0pnncnb0YnbRzs=;
        b=bVyPIeny9qpvBF26h/hncD7Gkx9mhVu7VqMHqW7GY3pqZVJ5xHKnKi2szzDwwcEwvf
         522bOWwduxJ7vvtwr6b8LhNsggiClYBARUO/nahxiBywmXSsHSb78akVsyO9et3xWp1z
         jwkXUQ9ZzV35P5qPXhy+yilw2HLjd1BDn1z3J079oqvTXJpfOLK20no1PN//WLEASAnD
         BOv0H2HhNzF021qDGzzsVjoAEc3dNnbqgomXh1QDOELy/CdLjA0CW0VHiIbNXmTV6jTk
         c8NlYY+nAukvgCVP/22D2LyGfTZ4Y0UXlvKUsc90gp5Up4NiGo8cQa1oKyaKkLaq/uTz
         P6GA==
X-Forwarded-Encrypted: i=1; AKwUvBxNYIeRVt4TzpA2kM0ig8rDhhDdGqFIA+xcM1ZB6IH74lO1V9z0hRjaStI1nnFKPxP7lSQYKLDPgYEQHA==@vger.kernel.org
X-Gm-Message-State: AFuF++nosug3XcBuDnWkGJ18zIfj0dryHzBoWoO6xGGk7dSba0mE/ehf
	GvnRz/7cnhh8o1d8K4nvilPsOXvwl3WvQNBlFaZPkUb0v55WDt7E7BXjMHSnqlzYTb96Lbst1sT
	nsO+mPQNNinY+dcXXzJ5C9uJk2GPpV6CoejhOIoa7jX0UhBqO+QFVGEWUBUbCZeIu5fw6/7iP1A
	==
X-Gm-Gg: AYBFou06fBqRWYHsTqD9Hi7nhObZz1wZoSyUnaO7tJBYT2XYLMy/dG6zSZgUaY9fhWO
	XghXGZ0MZdzC1pYIFl8PMuh0jpBvC0oydQAzKHWRHOqiHjOO6zZjWEAsURy1a7/xIyfhm+GcbRm
	oJ/3Wf9zR2gwpGnI7RbfLSvpu4gaoExgsihDWanI8CnwKcsloEwtSKXxtMS+jBMnWP/diK6T2c7
	6hvLJLPHUIH3VkUUi3VkRoXuhibxhHwy4ENF6yOJnLA0eVpu5Yo+G6egjO6UdKXSrJe9T3s2h5y
	YrnB7VCGsOwNwZd74FOzUsm5CcWPHcUmIzehUf3Nh5ANb8owVd+xrizgMND0Ij6gsoGeBvuSeih
	FVpcB0G8UbuMO5PtytuV6UEJibqwZ
X-Received: by 2002:a17:902:ffcf:b0:2db:20fa:9443 with SMTP id d9443c01a7336-2df5b1c9d96mr974325ad.13.1790017726319;
        Mon, 21 Sep 2026 12:08:46 -0700 (PDT)
X-Received: by 2002:a17:902:ffcf:b0:2db:20fa:9443 with SMTP id d9443c01a7336-2df5b1c9d96mr974025ad.13.1790017725796;
        Mon, 21 Sep 2026 12:08:45 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e5ec6ea45sm25855eec.30.2026.09.21.12.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 12:08:45 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 00:38:11 +0530
Subject: [PATCH v5 3/4] dt-bindings: sound: qcom,q6apm-dai: add
 memory-region and relax iommus
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-vmid-v4-v5-3-e79cfd7af5b3@oss.qualcomm.com>
References: <20260922-vmid-v4-v5-0-e79cfd7af5b3@oss.qualcomm.com>
In-Reply-To: <20260922-vmid-v4-v5-0-e79cfd7af5b3@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: ajay.nandam@oss.qualcomm.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.15.0
X-Proofpoint-GUID: EElhcDS56JwTaUgVJ9n3KpmeCkd6nPs-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDI3OSBTYWx0ZWRfX2UxqfNOI28gg
 uZPWyvPqdSEtFDWpDBDZVkA+afnKTEeX/ix3qUjFlyzUrdqs6XvihPZqZ5vf8kE5Aucuu1vpD54
 FrCZgi+X2pHEgWUxGu1LTlA438N7dYFxZ4VqM+6Uf4HY2aj0XHEXm2MORaxAdtSRkZb4a91yw5N
 xpY2ScmG1RgxGTP68j85Pihm0oHsEv3XTp/e6jtqb+EopllLbr16Gza88BeEDxqqXRtumzVIiTp
 pc266pFhuJbH01WaiRyMjadDbFbPcWVWWmWVD6OPMd7g06XLucQrthbsoiv1bNt15/dOLSXyFU+
 ppdtRf7BBNGAuvlUn7gWbid7MdbiBbF5IlIHph5PfqLwFfVtCD+wlodZLO/XL1XUFzBtizYy2KV
 GY9DhGHhlTSlpqrDJ5g3IlnQ6EU5ci6W8Yy29ZeS4jt2btuQq1spekLkx33DtI92XTgZmfn2Dmy
 u9cYcfEGc+6Cb5UUK2A==
X-Proofpoint-ORIG-GUID: EElhcDS56JwTaUgVJ9n3KpmeCkd6nPs-
X-Authority-Analysis: v=2.4 cv=Vqi2kO2n c=1 sm=1 tr=0 ts=6ab180bf cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=qFCY1Pm5pv70LtJwGgMA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDI3OSBTYWx0ZWRfXwHyUWd36Mrcd
 DqmQE6KisKH2xyVF7EYL5bokAZOwEGedqNPYrqYZZ9VzBwWhrIEICImuk3IG3u1b538kYCI7+b4
 tZZZi3bZGDgnnirypS+otsRzbXnTG5k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210279

On modem-DSP (mDSP) platforms the DSP runs in a stage-2 protected
context and cannot use the SMMU. PCM buffers must live in reserved-memory
carveouts that are SCM-assigned to the appropriate VMIDs.

Add an optional memory-region property (1-2 entries) for the
control-path and data-path carveouts, and remove iommus from the
required list since mDSP platforms have neither IOMMU nor VMID DT
properties.

Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
index 9e5b30d9c6e6..7d0415f2463a 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
@@ -20,9 +20,19 @@ properties:
     minItems: 1
     maxItems: 2
 
+  memory-region:
+    minItems: 1
+    maxItems: 2
+    items:
+      - description:
+          Control-path buffer (audio_heap_mem) for platforms where the DSP
+          runs in a stage-2 protected context (e.g. modem-DSP).
+      - description:
+          Data-path buffer pool from which per-stream DMA buffers are
+          allocated.
+
 required:
   - compatible
-  - iommus
 
 additionalProperties: false
 

-- 
2.34.1

