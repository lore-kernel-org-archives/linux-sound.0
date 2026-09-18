Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B824F96D9
	for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 13:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789738313; cv=none; b=oF9KTX1N7YoT2DL1FzufOIZ/clsGUI4v2g9R+fg++EQdOcwmBwGssT+dfNgHUnG7fcPdgmvQtxIYVeSJ75cqCPJ/MEcZCkATxAaSveSQY0oIsiWn3uvLs/ogzJDNrzsl6A9NNZ9EWoLUcpkv/GeHzOpx5CnlqLhNGmgScMEyiGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789738313; c=relaxed/simple;
	bh=YEa7KnX6+GkydQ4qITpT7kvGKuMd5PL3YYd6cmTdejE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VkQY86OffnUJDUXW/ijEXfQ9d7l9qvFe8doYDZnUvcxDmdr8Y5rr1i0F6ytK+ndWZmp0IhL8qGZb6RawNWj01Ijyu+9prq3IqnCOz2R2XKTUSMu6K8CbMHMjtYIZfDY3w8wNtmxJecsSWcxqQ6ZVeEqn2arB0NptCfPII2PAkSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mq+oFm34; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bk/v2KVU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mq+oFm34";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bk/v2KVU"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IDOwDA1900948
	for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 13:31:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lunL2Ix0946Ebi3g6Sy0DVN1GNPuD0H8XFJhualJ6XE=; b=Mq+oFm34euC/FYpJ
	fkxlxhiWdSCrS/RTa28QHLGqV7NntJhntvjwcSg5AI99EmbhQEwms/gXIRclxW5F
	hq3o2nPvUCNxZcCPf0d9JldaLElps4VCY1I6uZJjKSuZX60yHsLhfaguk8I3A+4S
	utt5V8S3KSW6HCpj7cx+BcGoo3LcsxoOw2d0adF2pDsxhXy9mkkcyp90fX2UWMYf
	mjDcHrwWS2jQI0CfFCGz6koEwCf3SoHhFc7pWYZYUZsHwfZjNvhoOO+MRUY3g31k
	IZJealxllftR1kxM+xnpuS3LHMb4vEA9V3D3MaI9B1XAo5Tew07GUQGHGyKFFYE3
	/rleIQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grtdptusu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 13:31:47 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-86b70a52946so1307527b3a.2
        for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 06:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789738307; x=1790343107; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lunL2Ix0946Ebi3g6Sy0DVN1GNPuD0H8XFJhualJ6XE=;
        b=Bk/v2KVUt7vPKb7a2hEqecmaUOz/NTxog72VMVEEZCPZBhUxkBqYZJm9HQfZz3LXgf
         JgQMtA5uY9cVUOmUUrbo8raef1F6aqML3OniqzbvqEMgYnTWStmowtWt0nOOwtBqp1Gm
         AWHUfiTdXG97jiGKiI05HRlZ8HI4xudNrstO519i77+MI1qEk0SnELf9fLqIhviuqw3K
         DDaIbRSYpiwZs+/GUL4GzLiYDARBtJZHvuEChr2Lp6l5Tw7JdNj5nufcfT4TCbGfieoi
         GTGub8Lfm7/4m6jMHDDDBCl7A9hAZDIcaqny3NAqfF69QAbI+V4fEOSc4qwY/oNoL8mF
         Z7Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789738307; x=1790343107;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lunL2Ix0946Ebi3g6Sy0DVN1GNPuD0H8XFJhualJ6XE=;
        b=O4psesMKfot194nB9Q4Tf7Kmzr38gV7y+eQq1layccvrZTUpDurBE/uqD5SmwjeGMR
         SfP7i9CgsC8c0GbcQDPHPgUVGBjaFJyDmDBT5tSshBw69IOMreAOFotN8BXsD8TxsQ3f
         Z5hsl0aPNY6Rl93UtX1e1MbQ+iFYfVsRluIq5FhZLmuHjailcFOPrrLLDv/mxoEoO6G+
         xyeN3bVwm3Wr9NqBuGv22gSghg3IyT6zBfHAdfdOs9dgjUdh5wZNA0aJvQWqS4mO9FQu
         RHi9OmckIRL6vjrV+gN4wgicDEUu4tiXn2fdN4kHjSD5bGBkVGpZchYderA32crN72PD
         AxUw==
X-Forwarded-Encrypted: i=1; AKwUvBybO74ZB4pTZQkZZDwtTwACGanrmhYKNaQSPNSB3Zsen0L9QZdZUq1eq/oHti8oEVXQ0uRfdsagQ9xAPQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mcuP6WtRYQoMGpNiVUNjkugmQUKADuH2A2MRv+4oN+/JMMdvgS
	mSy8Eo6zXHdQUXEWJz6iKBjo7SgrXzC+XcYBx0Li8eWqAAL8EvQQvpQ/FfgEuBV0oE8/Z7aFDm+
	XrYjw8lah92GQzouM9Zn3b3gW5AKjT7xotJH1sIc3rS/cdvtg8ktf/odvzjDkP92ijw==
X-Gm-Gg: AYBFou3xa15I1W3rcfdbqSPvVYMvB6jaruDL/A+bTmd/tPdyGm8yTUppoV+Ujxs066Q
	33qQn11KG56m+T3EQCnhAK9Rbtd3DUNpyCBjQ9RKJYOkCIgmVZh7Lvmp1gMnkx/6tRgqD06Oa2O
	JkeFhVc5ZeKDG0fSAZQPOpr3vXDQ2ddj//EFaOAQiikGBR6SHPEW5qJWsYVV91XBRKpWJwWm4E0
	pDYuvOuy5mp/w7kyH1RML8N1sc8cclcuqLxHZ4teAtK5/pK2D95CpGXJ+sQvUek+bYTGInZ2R6U
	lk5JCmTnyGNKds1HzGZ5cVRdGwaPWr0vSGFoWRyFSyAvzD19IoyzvC+6RI7jkqOe4hz4H6mfdYy
	Tq86UfxvAZkMD9gJSwuOCZNwO+rm424D4vaM=
X-Received: by 2002:a05:6a00:2e11:b0:847:7ffd:ce35 with SMTP id d2e1a72fcca58-874dbee3c05mr4564937b3a.8.1789738306797;
        Fri, 18 Sep 2026 06:31:46 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e11:b0:847:7ffd:ce35 with SMTP id d2e1a72fcca58-874dbee3c05mr4564883b3a.8.1789738306236;
        Fri, 18 Sep 2026 06:31:46 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-875dc8f8b00sm834747b3a.20.2026.09.18.06.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:31:45 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 19:01:12 +0530
Subject: [PATCH v1 1/3] ASoC: dt-bindings: qcom: add QAIF AIF MI2S and TDM
 dai ids
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-qaif_dai_id_support-v1-1-ed863c0e5e45@oss.qualcomm.com>
References: <20260918-qaif_dai_id_support-v1-0-ed863c0e5e45@oss.qualcomm.com>
In-Reply-To: <20260918-qaif_dai_id_support-v1-0-ed863c0e5e45@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Harendra Gautam <harendra.gautam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789738297; l=4227;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=YEa7KnX6+GkydQ4qITpT7kvGKuMd5PL3YYd6cmTdejE=;
 b=XHedOAidHnb7pVXTEkW/DEB7WBKRp/iLc8rQme8UEr9u/8EqaBc1/E+NQlmECjus6qLkgbbA+
 geNWwTqWyItAuh9dbbJPVjiOEt+gw9AzIxP7qthHzRa+brNrgjic36l
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE5MSBTYWx0ZWRfXxJuDJvbFvYql
 apWYerLXkop/Fraa3pszKL0OlqoVTuJowNDruErb3X/xLEVfinTZ0pDa76CtXjQ6CqLxALxUTN1
 7wpKI2w3RJ6n+Bot7bOpxfuWLVcFJ7ZK9Wntq4xgtIFhif7Vs+G5rbSmnNlpW0iy8iLITN0aGi0
 UO2pHXz1sFbo4oDkYvm61TtVIfiPajZGUNKa1WT4mCBVi0+fdt0w/mi4LgatqNF33ZVpGM32r2m
 n1PFkmRx6e9iVkGQqsqfVhzZJoshfhpvIbfgHIYG4KayXpL0t62DVgdlve0qThtH9Agsy6vc+8j
 aYfPjNKCrEMFpkfRRGC7E7rALCNgBv7l097zhkBihr3pY/n8g25lR1DUwqnIHLDUa+FyNHU9OiL
 e+IOWk6sOcam4Pjf2Cmx67ljha/1V5b9g7VWbcTZhfmnB5c6ru5BTPg3kOfyJ1m02jsCrC9T1U9
 bQlDqeLJK8QB9cyHILg==
X-Authority-Analysis: v=2.4 cv=N+e8hG9B c=1 sm=1 tr=0 ts=6aad3d43 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=8HAztucr-13btVBA95wA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE5MSBTYWx0ZWRfXzCpf8l02t3/h
 n1yKz0R3HDweIMiAKa+eIFB5oM0TnTIjsHNexgSA3T7bky+c3O7qb7tOiRTlIvrlQxcnTKF0Ni8
 Eshmgyxc2X1EC5EiPJ8P2u4FfIDMjw0=
X-Proofpoint-ORIG-GUID: kJdv2d8c_rBOJBeHnLtbxzrWLR3oSMmH
X-Proofpoint-GUID: kJdv2d8c_rBOJBeHnLtbxzrWLR3oSMmH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180191

Add new dai ids entries for Qualcomm Audio Interface (QAIF) AIF MI2S
and TDM audio lines.

Co-developed-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 .../bindings/sound/qcom,q6dsp-lpass-ports.yaml     | 16 +++++--
 include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h | 52 ++++++++++++++++++++++
 2 files changed, 64 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml b/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
index 3b03e2acd67e..63f53837bd9f 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
@@ -108,10 +108,15 @@ patternProperties:
           properties:
             reg:
               contains:
-                # TDM DAI ID range from PRIMARY_TDM_RX_0 - QUINARY_TDM_TX_7
+                # TDM DAI ID range from PRIMARY_TDM_RX_0 - QUINARY_TDM_TX_7 and
+                # AIF_TDM_RX_0 - AIF_TDM_TX_12
                 items:
-                  minimum: 24
-                  maximum: 103
+                  oneOf:
+                    - minimum: 24
+                      maximum: 103
+                    - minimum: 179
+                      maximum: 204
+
         then:
           required:
             - qcom,tdm-sync-mode
@@ -127,7 +132,8 @@ patternProperties:
               contains:
                 # MI2S DAI ID range PRIMARY_MI2S_RX - QUATERNARY_MI2S_TX and
                 # QUINARY_MI2S_RX - QUINARY_MI2S_TX and
-                # LPI_MI2S_RX_0 - LPI_MI2S_TX_6
+                # LPI_MI2S_RX_0 - LPI_MI2S_TX_6 and
+                # AIF_MI2S_RX_0 - AIF_MI2S_TX_12
                 items:
                   oneOf:
                     - minimum: 16
@@ -136,6 +142,8 @@ patternProperties:
                       maximum: 128
                     - minimum: 137
                       maximum: 152
+                    - minimum: 153
+                      maximum: 178
         then:
           required:
             - qcom,sd-lines
diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
index 3a99703dbc4a..e6c792d9312f 100644
--- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
+++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
@@ -156,6 +156,58 @@
 #define LPI_MI2S_TX_5		150
 #define LPI_MI2S_RX_6		151
 #define LPI_MI2S_TX_6		152
+#define AIF_MI2S_RX_0		153
+#define AIF_MI2S_TX_0		154
+#define AIF_MI2S_RX_1		155
+#define AIF_MI2S_TX_1		156
+#define AIF_MI2S_RX_2		157
+#define AIF_MI2S_TX_2		158
+#define AIF_MI2S_RX_3		159
+#define AIF_MI2S_TX_3		160
+#define AIF_MI2S_RX_4		161
+#define AIF_MI2S_TX_4		162
+#define AIF_MI2S_RX_5		163
+#define AIF_MI2S_TX_5		164
+#define AIF_MI2S_RX_6		165
+#define AIF_MI2S_TX_6		166
+#define AIF_MI2S_RX_7		167
+#define AIF_MI2S_TX_7		168
+#define AIF_MI2S_RX_8		169
+#define AIF_MI2S_TX_8		170
+#define AIF_MI2S_RX_9		171
+#define AIF_MI2S_TX_9		172
+#define AIF_MI2S_RX_10		173
+#define AIF_MI2S_TX_10		174
+#define AIF_MI2S_RX_11		175
+#define AIF_MI2S_TX_11		176
+#define AIF_MI2S_RX_12		177
+#define AIF_MI2S_TX_12		178
+#define AIF_TDM_RX_0		179
+#define AIF_TDM_TX_0		180
+#define AIF_TDM_RX_1		181
+#define AIF_TDM_TX_1		182
+#define AIF_TDM_RX_2		183
+#define AIF_TDM_TX_2		184
+#define AIF_TDM_RX_3		185
+#define AIF_TDM_TX_3		186
+#define AIF_TDM_RX_4		187
+#define AIF_TDM_TX_4		188
+#define AIF_TDM_RX_5		189
+#define AIF_TDM_TX_5		190
+#define AIF_TDM_RX_6		191
+#define AIF_TDM_TX_6		192
+#define AIF_TDM_RX_7		193
+#define AIF_TDM_TX_7		194
+#define AIF_TDM_RX_8		195
+#define AIF_TDM_TX_8		196
+#define AIF_TDM_RX_9		197
+#define AIF_TDM_TX_9		198
+#define AIF_TDM_RX_10		199
+#define AIF_TDM_TX_10		200
+#define AIF_TDM_RX_11		201
+#define AIF_TDM_TX_11		202
+#define AIF_TDM_RX_12		203
+#define AIF_TDM_TX_12		204
 
 #define LPASS_CLK_ID_PRI_MI2S_IBIT	1
 #define LPASS_CLK_ID_PRI_MI2S_EBIT	2

-- 
2.34.1

