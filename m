Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC423AE6FE
	for <linux-sound@vger.kernel.org>; Mon, 30 Mar 2026 08:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774858907; cv=none; b=fg6R6Lge/p91FOWDgCuEivpR5Vc6TkIGnKlWUl9psAGbxGVZ3SDvNqmVraH/n81RxYUMJyQIYCvzvXGBdMGskm+TR1zfOfMbuDf19lJvbmhWWbpEIhonHWdF0B9/+9rl0QecSz9LiFLDXTRyqdHRazqQTQCBJldbP305eDpluC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774858907; c=relaxed/simple;
	bh=UZ+5z9w9M74tpzVL8QkykGNl8XDOPEb0MSDzyxWPUz8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gHuJ/jeYYSFoJ6d9AbU2K5xo+HlRW9j5fc5rr3ULCoC+dNX3U78RIKWKSolazLlgc9M2I4Xb7eazmuLmQfv66XwrldRHGKx+eMjfj5v2l86ba8yGtY/RmrlU9uUoWmr47dot3B7nYkv/Oo6/Cnu74BddsE0ULcit4JChyq3gWfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bBJxIgiW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FNGYBBlg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bBJxIgiW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FNGYBBlg"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U7WOvc1427244
	for <linux-sound@vger.kernel.org>; Mon, 30 Mar 2026 08:21:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Z0SMcOHJkzd
	ixiTszIUCToSc68Rmc9ZxZaPMuZtsp78=; b=bBJxIgiWhw9krC4Dx8ufPb9ig9a
	qp3vC5/F4b3fskGEMxlLFsXvkWsp1wFbB9ir/ZVEG6Xb230fmit0w676OQ2ubig8
	CjP105qk8zlKx3nRJH+VrU944lH3nZx5z3vjOnKG0dRvfF9DMo6Lq4IEsLxxw2q6
	RU+0t71PokMWCPTX27VMDVCiWqz4sqd4cXKRRS8uAIDeJQupbNEHkx63oF+IcWGc
	eQ7l7MGEKzjGBRFgeVpKNfuoPmKTUaDM1ZteeLqa+1C3RKh6heZMmKwcuh+OFSZK
	YCGePhEYPsYfclqR0mW2qhETRg7qQVmATNhxl+t+F+h115Pb/K+MxKncP+Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d677155x7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 30 Mar 2026 08:21:45 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4ca7e7c2so109193911cf.3
        for <linux-sound@vger.kernel.org>; Mon, 30 Mar 2026 01:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774858904; x=1775463704; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z0SMcOHJkzdixiTszIUCToSc68Rmc9ZxZaPMuZtsp78=;
        b=FNGYBBlgtNc1ftLMhxJGyhjORLar8eFH5lIyXrgWCGdXhnUyruyNRIoSTNsJ4NE2QZ
         c1bY5Lp4AlxHDq+ttbIhs9g2Z5yZz05wKV2nKVzVYSA738UZqdAcDzW7jA9tr/T6k9ls
         THvL66Lo6FVFwa5wJpvqWkcgTno1Xqop6/55e/82YjbfhW9GnrAZLrqfeiqhMlQzt762
         anQhG4VIOGmd2fBH/326xC7OMIp838zjATgxksBIXJHErKZgLtA2ygC5TnjDYmQW27NK
         2fSBuK+lEWyvKjPWW6+9R8BgdK82NznbXtLH8QwmM/Qboqpsgj7UXOnecyNu5dbeQKGu
         Tcyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774858904; x=1775463704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z0SMcOHJkzdixiTszIUCToSc68Rmc9ZxZaPMuZtsp78=;
        b=Xn1bNqeCBCdhaMlz2H/w6Pks9xHEX1Vfat2r+uyfq01w6432zLvO88jRtsvrjREv6o
         jqc1p7FVRbRcWqlwP9TwBgmufnt3Q7jjkUtd6piQMm53p6FW9idkFkJhFY5G8zUOHC5S
         XSseZusIXhFm+x7E0LF4vykOYQKVYerRw/tLMn4DtL9GWjej7MNukQoWpkRnEItDj6q5
         if7iUbgahRERxKO68bAzyp23mugfcs48fBhGBvmNwW0++FtIRhnUIs0pJVabIg96a51A
         H5bzBITn02yJvukZaJ57Z/zShvTDTNF2gz9nkgyApYzlZJi0/5fhNBeDyqjpvHCS5iOC
         ilgg==
X-Forwarded-Encrypted: i=1; AJvYcCU0VZ5PKzLBdxBzWSrrbAbV4HRkjVT8IuC2JI1PFoSVW4jFe1wLniHwLCYQ2UkoJ7OvVmomwDhbsmgwjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUs9C1dQOG+Cp8O/yysIO7CVtCnfF3iO6Lzu48tFLeMFddpjmc
	9O9yf+tN1yNTbbqA6ZmxVtPYPk5qzvNOU8bTopaw+CuHZvDjnje15uKWr09LvC+pfXn8cNXo6l5
	Hls39PQUAX+sdKgPc8eNISMvuOGQNL7E+xP+1DDHCDpZt5u26WGhjnZRP9b6vfDGNNQ==
X-Gm-Gg: ATEYQzzHwu59t8h0axUDfrqJ3Psc3+a52MkyK0C6l2GlGKPQqmVrHxIGFHs1kKb+zP0
	csLDhXE3TvANk2rwlR0/jYjgSfyKjNOUTGGCa73GPxdvuElJbkKlsBTc5O/IseklhzE8kpHQnBe
	jx8BJS3bhmmPVR3sJJmxsM6n9B91usEsS/gpOo0kI30KogjDUU9oWlLuYRaz3rXTNnzOBY4rNJq
	FFQeK3f7+Ln3xQ1G1u+QazNfePKKNcXmdblDoWrxEaNB26Zy0jzFT5NtOI6P9BtOOhHWjIfpRv2
	XdsWe2qn+6L6EsJl6Hz9pbeh+blXNImoQBRT3/sXHTBaY+SRLCFgL45qBBp+0T+BUwug1fi9uwz
	t7M0745Qx/UnTsJ+/qnnBWRt+r6RbTVWhkdyvfVCNaVpfa7oeql+Ouq8=
X-Received: by 2002:a05:622a:2d6:b0:50b:3705:c0af with SMTP id d75a77b69052e-50ba394948fmr161577261cf.53.1774858904521;
        Mon, 30 Mar 2026 01:21:44 -0700 (PDT)
X-Received: by 2002:a05:622a:2d6:b0:50b:3705:c0af with SMTP id d75a77b69052e-50ba394948fmr161577141cf.53.1774858904069;
        Mon, 30 Mar 2026 01:21:44 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf1db08e6sm26244773f8f.0.2026.03.30.01.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 01:21:43 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org, val@packett.cool,
        mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v8 06/13] ASoC: dt-bindings: qcom: add LPASS LPI MI2S dai ids
Date: Mon, 30 Mar 2026 08:20:58 +0000
Message-ID: <20260330082105.278055-7-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260330082105.278055-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260330082105.278055-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: zxTAPg1xA5BvXAcFlbI942mmAFAPcZi9
X-Authority-Analysis: v=2.4 cv=efYwvrEH c=1 sm=1 tr=0 ts=69ca3299 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=6P8UuP444nAwg2htitIA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: zxTAPg1xA5BvXAcFlbI942mmAFAPcZi9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA2NSBTYWx0ZWRfX/DsRFRwTsFUw
 tbhZkegi/xkLi+UAvHKL4wFT0J08UnHg+O0qgBuLOTUxQF17LEXp5mFIpZo7plAwiIzeQTlekP4
 IsJe/H2b7TI0IolZVZlpzrpDW+ynubfBBVlwasrqTOG3HC93z0og/w0GjJA6zl2aajyQj42RS91
 6K6vkPjrSp92fwGqOvYaNe4S6nrV39R0ioiuf5MX2wAxSfmjnW6hrXzfCCySYi18R8OdWSlF3//
 3aZ8HkMBaKX6exgJe7KVEnhKSF/LBXgLSnxt/SOKQ4cCRC5DbLgfmL4nwOqUU5LtHvnOCgQtHvz
 6c69rbg+5hoqaMHiklUnmC5k4RVJyKTGhxbx+c0OeOxInZaaFd/YnQQDbh7Ri1l3nmPLSHN76Oe
 4HH72iBCleJa7VGdM9vBPj6oo47GbrGRFh5Po08SIk7BE3JyRS8rPahbPTEi47dLVKkS5SLmTEc
 KiIPpMVaxO7Q392lWiw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603300065

Add new dai ids entries for LPASS LPI MI2S and SENARY MI2S audio lines.

Co-developed-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/sound/qcom,q6dsp-lpass-ports.yaml       |  5 ++++-
 include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h   | 12 ++++++++++++
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml b/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
index 08c618e7e428..2b27d6c8f58f 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
@@ -126,13 +126,16 @@ patternProperties:
             reg:
               contains:
                 # MI2S DAI ID range PRIMARY_MI2S_RX - QUATERNARY_MI2S_TX and
-                # QUINARY_MI2S_RX - QUINARY_MI2S_TX
+                # QUINARY_MI2S_RX - QUINARY_MI2S_TX and
+                # LPI_MI2S_RX_0 - SENARY_MI2S_TX
                 items:
                   oneOf:
                     - minimum: 16
                       maximum: 23
                     - minimum: 127
                       maximum: 128
+                    - minimum: 137
+                      maximum: 148
         then:
           required:
             - qcom,sd-lines
diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
index 6d1ce7f5da51..45850f2d4342 100644
--- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
+++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
@@ -140,6 +140,18 @@
 #define DISPLAY_PORT_RX_6	134
 #define DISPLAY_PORT_RX_7	135
 #define USB_RX			136
+#define LPI_MI2S_RX_0		137
+#define LPI_MI2S_TX_0		138
+#define LPI_MI2S_RX_1		139
+#define LPI_MI2S_TX_1		140
+#define LPI_MI2S_RX_2		141
+#define LPI_MI2S_TX_2		142
+#define LPI_MI2S_RX_3		143
+#define LPI_MI2S_TX_3		144
+#define LPI_MI2S_RX_4		145
+#define LPI_MI2S_TX_4		146
+#define SENARY_MI2S_RX		147
+#define SENARY_MI2S_TX		148
 
 #define LPASS_CLK_ID_PRI_MI2S_IBIT	1
 #define LPASS_CLK_ID_PRI_MI2S_EBIT	2
-- 
2.47.3

