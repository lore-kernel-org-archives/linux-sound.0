Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470222FC877
	for <linux-sound@vger.kernel.org>; Thu,  4 Sep 2025 10:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756983415; cv=none; b=ULm+jiCxV/gDR8CdA0//NzvUvvcU8tyOmns5MbSEyD11jnfwrxir/uV0p6KNx4I5i9E89IvF0mw0z3X6L3A5NnPCtdiW+qgnur85GLPCb6781pF98EI6/g4VpvPt3rxYtq5+03GXWwoHD68wB5vpwFKGKNcnJfpYJjDcrpa5g3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756983415; c=relaxed/simple;
	bh=fD8gmiEfvHWqA/qKuJvc+eRI/STX56LOgZaEfMt7N+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I5bLTEj35cLMv2i51N5AZIU+56ZxSVzrqrbPcVq/AfUi8aKhkJD1w0Gly5qlAzWugH4ccm7YkoFCfUGYgw7t9Aj1i2NAf1j2WoA50sgh1hTxpAlbm4W6KQVD+mxJpgxIzUM9KHNeQ5ICN71T4aufy9FVAnebvxNzEFYV46D+nTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HTiKcyTK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HTiKcyTK"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5849X7ik032158
	for <linux-sound@vger.kernel.org>; Thu, 4 Sep 2025 10:56:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Bwb/aCh+px1
	clBI7DNv6FaMGNCjRZCn6kYUkRggRljo=; b=HTiKcyTKwNBupUEpMVjNn49Cez7
	dRGhAGC8g9QncYVXjnLdd76Lf/YzS1KoLVfznPyiqYnMXyyborZczMj/JOYw/uo6
	sjUCIaaEoGX07kD2oVraz8j7q3B8YW79lRD6iOROCScLzAQ4jCVzJV/2uRCyEfyR
	ptnPIEVeOw1uWA0BN18wZAkvPoCTdVm0Jd1dN8InEHkKa8ykXwHzpo2edYfW7pGE
	LDeZU9VFtFTs4CLgOi1mvO9FckGP/4FPN9+v/YKSbQx58VdN1jrB83zkz4/XfVeU
	xM1Qaa2FrZIT+qaLK7r7UKR6DNGC+bd2D8vQPEcoy+9swHiIaqgZnDhR95Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnpfbsh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 04 Sep 2025 10:56:52 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b4980c96c3so29148381cf.1
        for <linux-sound@vger.kernel.org>; Thu, 04 Sep 2025 03:56:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756983411; x=1757588211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bwb/aCh+px1clBI7DNv6FaMGNCjRZCn6kYUkRggRljo=;
        b=s31t/NaFDFwH2UHXl/yxOQlwRuMaDpjzkOM7hBAAi2ds8T/PpskIjAeXypjkSCmazd
         gmgTmoRReJKgNk0lJQTiEmTEIrEIqQE2m8lc+xA183GGkJQ7DFq+Q+0tlWszEIZZ7WUP
         ASR8CQxD9eLslqQvaA5Q+oF4/mXzc1jSWk3BM7/Ms3whZs3c0HLA8my1ieILzw4NHR/R
         l4664h7ChUkmJkr8l/RepVuwYE/9JqjfQXkR5wIq6Sovpy1YeqW6KA6QuNS8+j7JXZSv
         ebQqB1+/CIRR2If5JmohWDRlSuiBGOYw84W/wfW91dP09ZTl8ydQCQwruPxnDiAT2DYw
         ssyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSqHU7Y/BdRrGlOUKqEi8RBdt1KjE6vbRY01RI++nyBCmjvxZwdhvyVlzkp8yrNjBH2sIUUMZS2/vQrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhMoMKZ3PMypxF/7hANjSnV72Rlu364kL471AuznGLWZTLagKD
	YsShiGilfyxXlqUPXrj2WayjPVWYAjxvrsKCWDe3DVy8sNU+W++/tWRjhvXQA9aEj9L5GgPMIHJ
	zYdd/11d/OAIRgxKLlzKFMir9UTPM40QKC2xWVMr5wIgdbCrms3+rFLafmSJY2zM+RA==
X-Gm-Gg: ASbGncv97FrPqXNVIs5BSC3SPZ44IcDMsQzSma2EPH55+W4/rHNABOl7oYdOZdSdzYo
	09cR0sLYxyHaDwPUwYJmyI9y8Fx7GjnlHBwhg5hMIHq9UaM5V/Web2UgB05BrEnM5c2EJDdI7An
	eEIVBlXZZq7/f36KaZSLecfI3P7JH1o/mhRZa3Xzmkh+ckMQmaxLKqOR//ntIxY2lb+qH3dTM6U
	Xgjqy9fH1jjBsLr6x1cjzRHQ522vt8t/Nk2B3zBM0yeTR7z+YdlJcc6nK6K1i4zc59RawmaSumM
	gp4NOgyAqQtwrpkqyv1bLDPSoUyrhsvAkdJoCUjuLaQvhEruptZ6ug==
X-Received: by 2002:ac8:7f0d:0:b0:4b3:eb8:f6a with SMTP id d75a77b69052e-4b31dd858aamr194624531cf.82.1756983411488;
        Thu, 04 Sep 2025 03:56:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHB7hdDpsknZLEtfa0eJTg4s5Li7VqEjjEr6dg75smCTU4fKnF4eoi4Bd/tkvBR/IpY7CBbMA==
X-Received: by 2002:ac8:7f0d:0:b0:4b3:eb8:f6a with SMTP id d75a77b69052e-4b31dd858aamr194624361cf.82.1756983410978;
        Thu, 04 Sep 2025 03:56:50 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d0a1f807f9sm26462334f8f.38.2025.09.04.03.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 03:56:50 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, krzk+dt@kernel.org, vkoul@kernel.org
Cc: conor+dt@kernel.org, srini@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 6/7] dt-bindings: soundwire: qcom: Document v3.1.0 version of IP block
Date: Thu,  4 Sep 2025 11:56:15 +0100
Message-ID: <20250904105616.39178-7-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250904105616.39178-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250904105616.39178-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: yHtrAtjiu-ydhvDANsRz-ubFs9KNahT8
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68b97074 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=W-ialWlWjSFIadUgVrgA:9
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: yHtrAtjiu-ydhvDANsRz-ubFs9KNahT8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfX4K2qFua8hO5J
 NwCQNyJ8uKMdz2mwSeWaQmL/UOX2DOw2Xq8GtZF67qFDooLjQoMSMnE3YeySN1eUOUU00R8pToH
 rWDUPOgpWIxo8Q6uYH6ibngn0llW5iGZ2/lEGP2qIebOlE8G/rqW8fArn7FhBosy6aooCW38jxs
 oAwuXJZm0wiA7q9HM0rNBUte1ZBJXilpLKPwspgf2IW06nQFJTp1Xn27f2bWeUkYv1fn0EK4cA3
 TeksB3oPK5kAiGwpAr7Wtlgl5Q3R65cFqqDZ3xqPd0xTO9kZv7kwrkaljmUOG2drW8YeV3/3Bak
 sxJhZ2o7SU6MLpr8GQrrrJTg8O0pHmuFTBR/HlCGlKRRMHvovmXrlE9O9wLz5xfSMxVSRkI2+hK
 l9M26OmT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001

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

