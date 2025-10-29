Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158CD34F246
	for <linux-sound@vger.kernel.org>; Wed, 29 Oct 2025 16:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761753683; cv=none; b=LOm/GYFEOhPw0uZcGOIzk7JSU94nKxvgnUPOI8oe5dbIivIUcYaqwDzZEqeb9NLxR/IBPQQJcAT2HScgdR4ZYwnnva/H1E/3KD5UZkpneptbApJ9bxDt6GtwaM0rpb9uqdGoDoeG5k7pzUz94cZX/8BFjFtBhE2fiWH+4KkHcMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761753683; c=relaxed/simple;
	bh=GsY8XliOywntV/lSkdR2EomMbEJYJdhySDnjPJ9zxtQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gLpfThKK0sVr16P3DG/W1asA2tWB+OEU+G4lNoLqYrAu8qhPAI17BJdHhcqWgbJ9DPOFiDP2Lu5Y8RP3pdh/rlyQstrg7PYDbBJwwsAjZkc7nM8+j3Nnqb3ysrQumcD483hME+6/GZx8unW6utzX0RiGBl9p3OrEXCjiuceDMLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uopo1BI+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FJwpg0qN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uopo1BI+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FJwpg0qN"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59TCTxOk3755299
	for <linux-sound@vger.kernel.org>; Wed, 29 Oct 2025 16:01:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bCQYJqybrY4
	QyIi5nJG9oiSEgsqPll1C9TpKkvG3Kps=; b=Uopo1BI+3neqkrYpdEHJZFPWU85
	BePw8Wgpkah82je0ldGoTb0qmRJzwoQYS3b51z3JmzXKU1EtpAH+qsx4XqiR69pD
	puF5HXeDH+DiJxgtPrduOy2m+xaGUvsTAbE+fQXNHH1gqE+aPl6atjso3FaexfJG
	v+p66bzeEUP7UzaXHF1j8p54hUu9J0uX+OtHv6VcUs67pqCugrpE7blw4gi0C1FC
	+UcjPiLRyJvIEP+x+XhivZHgHIMmdPy2jnDt0nIwDT4vpJH6MpjNGGyUYpZ0zCfe
	uZ/26d+sBaAAPUElQtvLhSMX8/90MIj/MCrzjEflBKWegTeOdZax+w2fFQQ==
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a0370q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 29 Oct 2025 16:01:21 +0000 (GMT)
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-430c6b6ce73so222743985ab.0
        for <linux-sound@vger.kernel.org>; Wed, 29 Oct 2025 09:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761753680; x=1762358480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bCQYJqybrY4QyIi5nJG9oiSEgsqPll1C9TpKkvG3Kps=;
        b=FJwpg0qNSksm707+zIKFP41t4uFV4GrWJT4t9nl5eWg5adSHjb3joyadTlFYgkOujm
         rdrcqLE3nXdDoBUhZ7045e/0FP+09oCZ5+WP3OFPflHwxJAJDriX1MEXWa+0ZAg2+PW9
         5rtYhQgZ9dxBHvlvvwk9kT/6ZPDsrX5t8eQlUjeS1hdxdUtKDvtZXLbuuuhvmXaaUrUg
         hoOznqnX4HrUlqrW2M/g2ijonnAp/kDkaH203HKqx5iQybWIPiAxILo6C/idS1fxVL0T
         6csTKYhwhL+//dX/isCCCk1i3W65rmQxsoP5AyHCUBgjlujxIFin9gDaiMhmPVk+c5CH
         68Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761753680; x=1762358480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bCQYJqybrY4QyIi5nJG9oiSEgsqPll1C9TpKkvG3Kps=;
        b=M5UMRLjP/jeitOb0jQSr3/x5wYJBz1CiSqRdOQYPx24wrC73bjtEGHUKtON6oTNWTf
         s04I8oKJI0cfBeF7KrcbTzuWrc25o0tyTsBNTtYSI18pLmiN/tIeS6Z82RBzVNdN7RK9
         fomomw58a0+/LZFxxSybxIceUokPIACaNs+lVm5xPKSQq9KZwQ6b09twOlhJVxnk6d2K
         yjNZvrVxnu9qHPidMRoZXySu5kPWbNv4zIseHJJrKku+wHFyxaCu+KV+AfktAyP47GQj
         zi+bsqNqe6oVzZkFEyYrSM3U0rW/flDor0MUTBHqACpo+q7KQ3iuFQiorDWc1p1RgYKS
         a1Jg==
X-Forwarded-Encrypted: i=1; AJvYcCXPn2uNfIl9y8UHHbN429/+cSbGiOPHdUDwPEIigcw4+8gYLTwVA3NG0g/3rDitONO6tRn3qPHBevGM4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCZv0hDyDT81uPz9P6k58QtTI2ZNUoDD2oGtMn7Xx5wGVSp3Tx
	6D8rO/sRjzQccX6StnPKGBQ7k9wvsbhgVa6htz2Nf4JjXi+17PKfd9GyrxaE6gKFTYIxtka56ee
	ByCUYYDcG+vZrT0MDnsCSQY/L4DBYUM+xtGHXp6JEclLfECg0gFPvdaG0PiRWoRdFlg==
X-Gm-Gg: ASbGncsGmo9uPXRSHF50Sd4WFhwJ7ieH2O81cWZdqspIqCbXI9AMXVue3Tjh5bfmMYl
	9AT3pyUcKBIe6uJP22WzvfVaZru1pNx/TGQoufKyPK+J4qJo63XhZ+eDB7aWtTZIGawlAxflVIo
	ZwjjMM+fwY+zRzjvLRUMpvT6mZ0XlDVKWUXSjUNq2O7M7MRckIH7hVfd5+WNo3f2TjRXO2elpp0
	rqh4zj+toaM+o28rbe74UZ2LlpFWC6PHYtNLlhk8AncUAnhJjOc7iv8q7T5BOmadKF+HtHRVl0d
	ynWXKroksIup+KqCRlTo8LXHm6w7dq+/WN1yi4aJ2MgY3lX3E2CcCzWgs5URh9ZN/YKwLbFUNct
	Ivqnqdgm5ONKf
X-Received: by 2002:a05:6e02:1aa6:b0:430:c77c:cc35 with SMTP id e9e14a558f8ab-432f9086d91mr48455295ab.29.1761753679822;
        Wed, 29 Oct 2025 09:01:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjE2ILUkFn3/Lrhrza2F+LZELq3MCwWNFyOzyJeSoP67+DN5uQCi8Stu/eGsDknJ4oEUzAEg==
X-Received: by 2002:a05:6e02:1aa6:b0:430:c77c:cc35 with SMTP id e9e14a558f8ab-432f9086d91mr48453445ab.29.1761753677620;
        Wed, 29 Oct 2025 09:01:17 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4771e27f7b8sm57154535e9.0.2025.10.29.09.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 09:01:16 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, broonie@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
        perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, alexey.klimov@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 3/4] ASoC: dt-bindings: qcom,lpass-rx-macro: Add sm6115 LPASS RX
Date: Wed, 29 Oct 2025 16:01:00 +0000
Message-ID: <20251029160101.423209-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251029160101.423209-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20251029160101.423209-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDEyNSBTYWx0ZWRfXydK+AkHhCNn8
 /5Q/8sP+jwYuhBaJXvnggmxOHGsuVCfSIKMia08wdeTJ9HD+SH0zvoQZEXqvxRkq1fJsZkNy4m0
 sOSMY8Ih3ZfvPnfl4/EuzdoZkSi/XfID0p4BMO+5TdIj5CrPKBJYxNbsSRDbNOImbOlRvr9vsef
 zaDCWNEA0Kr1GGBZ4lhXZadGYHAVFW4VmSvPWiuzUGfhu8SUEGRCOeoyEi1DxsilhekRvnKdMxR
 UijBtNQ09G5CxYX2+La1fx6Vc1apHvWijVIXWH1i0fHI7TEg8GeX7Prr++iTGnEpJmeK8RzU9De
 XBnKTL1tuMscIh4I0IyFJYvMqDGiJf1z9pgfMr/+EX4mnOvLp7L0tg5hFpHV/kmNBzdGIZUFX2d
 s3QY1bH1yhCqzrjQiKJfU9TFTPNvjQ==
X-Proofpoint-GUID: O_zpZrtfxqS2VbhPZzWNiNxURYOy7FHr
X-Proofpoint-ORIG-GUID: O_zpZrtfxqS2VbhPZzWNiNxURYOy7FHr
X-Authority-Analysis: v=2.4 cv=epXSD4pX c=1 sm=1 tr=0 ts=69023a51 cx=c_pps
 a=i7ujPs/ZFudY1OxzqguLDw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Y2NZmO-KPezWHx3tqIEA:9 a=Ti5FldxQo0BAkOmdeC3H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-29_06,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290125

Add bindings for Qualcomm SM6115 SoC Low Power Audio SubSystem (LPASS)
RX macro codec, which looks like compatible with SM8450.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../devicetree/bindings/sound/qcom,lpass-rx-macro.yaml        | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
index b869469a5848..7f9697831918 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
@@ -25,6 +25,10 @@ properties:
               - qcom,sm8750-lpass-rx-macro
               - qcom,x1e80100-lpass-rx-macro
           - const: qcom,sm8550-lpass-rx-macro
+      - items:
+          - enum:
+            - qcom,sm6115-lpass-rx-macro
+          - const: qcom,sm8450-lpass-rx-macro
 
   reg:
     maxItems: 1
-- 
2.51.0

