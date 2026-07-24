Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1431A44CAE4
	for <linux-sound@vger.kernel.org>; Fri, 24 Jul 2026 18:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784917515; cv=none; b=hddK4d15BDUoeF/HIyYPf0TmKVbOfBHBuHTI6mzHG0uac7w9uBZJ3Li0MbYlpYiyDQM140onxBPVNlajmU4uzjaFnD31dxeSHAXr6OeFwaWVcf2awhpbK5VRuxBVltYQyeEEfzxBGF65tyHE3nE/DfaNP6eeXkI8RsDAB5891Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784917515; c=relaxed/simple;
	bh=fplq4MhiYbjZ4gR4KmwJS2Gi90zzUaka3YGluovCwTg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=G3OLp+nu4fVaxlNMTrb30WYFMffdFMaNEYAJYlNZB0RdgZ1nvkzQhASc2tle+60Y/vtchmJSZ37X8pxGgWpJGCBNJwo4p8u51rfucitSIuhSueb+dcr+WUMxpxRgdgeG/ECgqhy7M7JBJ4UiMD8VfyLUbSyhgrD8v15HubePQv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o4SdRi0H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X5lcuFEs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o4SdRi0H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X5lcuFEs"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OGqcXo3819405
	for <linux-sound@vger.kernel.org>; Fri, 24 Jul 2026 18:25:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2Boq2riYmih
	qWiWhhoyaoL47R0UXWhEOQX4/mmtxBxY=; b=o4SdRi0HVRtn1DQM9PQMXSDDD88
	d1ybj0+92oxGebYkNGXjV93hqAYQVwUNlyTlKiA2kCuDftNDQzd1N1dafNxm2P2W
	DaCWhyErW0czdgxiWTNfF/fFpalP1NYGPXzh35RTWq7KtSL0dmcQyiQvAJBGTHLp
	9yG5TSh7Ft5qOutp/uE2PxzHg3ixmLUSgugRKwmtIzTqo+w5HyEV7i7WJofonK91
	e702KIKKnBktZUX0sK5Sm+mvcq+hasCLiey6Hyf0UGARsQnWAfjsJUBCmXxPzjkB
	iWjtrUShWJbdk0e2/HnRULWV2H1J0ebXBRU2qCqWGwgwuGDuQN1V5eqRUHA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm9pd0vqh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 24 Jul 2026 18:25:12 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cab041eced3so987139a12.1
        for <linux-sound@vger.kernel.org>; Fri, 24 Jul 2026 11:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784917512; x=1785522312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Boq2riYmihqWiWhhoyaoL47R0UXWhEOQX4/mmtxBxY=;
        b=X5lcuFEsH6dVeaV6UAxOlUxIx5kPL8vJANpn1bCp1cdvAjihXarW/9IUC75dKOzy85
         brtIdA6p//aqTyYaZRsZVxH5Qhlw/6DyseJJI+c8yepTGNe9kZW7tmMRPPKJV9ZWAQ2U
         7RDFbV7/dTtjwF6OtaCMEkKnHoSIidJQM80xHXW+07Ac/XZXm7REPMboBN3gZjX72Ix2
         RtwZnO5p8DY/jXb4kmYpP23EDKkMHrtbH/9L8pMqVo1mJA9EZG5ExG/cYX5aDpyVkVX8
         A/Adob3YKjeoTKqKi5o/6w6qnYd9oggjMI3YqqQZYvvsKRwBQNtfvHr112o8f35lYsBe
         lKvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784917512; x=1785522312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2Boq2riYmihqWiWhhoyaoL47R0UXWhEOQX4/mmtxBxY=;
        b=cmUBPbDcxnLvBKrMPLnXBAyc9PXtmCNw+a/KG/BjSFG00jqFxVuxc3k0/BYFlB3VIh
         zvjBnuxbt2aER168HDh1X2uzjnzkbjUZsA2eAGdHvXKniiFdD7rnK41yIT1Q51EHkB9B
         chF82WeQKMP5yYSfFk+jMeT6qSOHbK2ce6WXTAlIm6XDTE5EFVzC2NpmiKeUvHqjRWBU
         rohNlfilBuhPFhOqhgJRqsHiqVJeUYtJ+1x1CUpGCw2WDlDYiSJlLxVf3p/Gtpy1BGzO
         7GRqW5lmuk3tV+A3YUHi2+qTw1MdvYdP79MME7YjuGVcjCXNz7rT4s2dnyGHo22LHTIH
         jRZg==
X-Forwarded-Encrypted: i=1; AHgh+Ro41e1eqwrvAqP9PVmtFK3dXmSZYMsaMAUB093BWUXNcwfguAFWW/ATzn0oFa4sxhiFQppO0oUCZPRh5w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJwcDO/RoJyOAvf2fpVOH+fnwn+0C3LpkMbIUqBg3c2b8Etciv
	HJ9D9FEJqqK1gxQgBzgDp6gEfGsc+tFznwy+Gvs9HssG7RrIEu5RP7bUYJbft7mLTKWvpM+87lk
	Lp+pUtxKlTmvdr5EA3SAgOeFCb1EjwxHwagwxKpiEfqFPJKjyaK/BZnaMHYSttT4snQ==
X-Gm-Gg: AR+sD11TkPord7Ja2kIvtlZrRcx53mYaztGdcetcEonwk0B6+br+4XbBVcUigQBLFZi
	cDRAOS8eFuPWTDmaAz9HvTajWLV4bOSmnFHqZZKX09892N+PUFEcibNe9KE9swpW3hjSCgp0nrZ
	oJnJQtf+Nz2ihZEWWrD55NHE3KshqKlGx48o9fV63rkJYThlAzvRZu3TyyVKZdZtNwdV7CFEKlv
	PyngDWTUzV27s6QjzLuFpvdONeIHgEKL6b8Yq9Aje8+KuLBIx6GGAgVgwhQ58C8vQbJkdahXt7o
	J7pB/70yU3D4vsXQ2CPzWVSeQkEDw3VJaaujLjrFeAlOHEAuSNaz2A5K0pSOeVuTvUCykuwXmIH
	2lSPftrCwt+f1/C0+eoEAP2qAvm7tnAj+8YF8
X-Received: by 2002:a05:6a21:4613:b0:3b4:b216:2b26 with SMTP id adf61e73a8af0-3c44af76896mr9889593637.5.1784917511924;
        Fri, 24 Jul 2026 11:25:11 -0700 (PDT)
X-Received: by 2002:a05:6a21:4613:b0:3b4:b216:2b26 with SMTP id adf61e73a8af0-3c44af76896mr9889571637.5.1784917511518;
        Fri, 24 Jul 2026 11:25:11 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc5a67f3sm1669324eec.29.2026.07.24.11.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 11:25:11 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v7 1/3] ASoC: dt-bindings: qcom,q6apm-lpass-dais: Document DAI subnode
Date: Fri, 24 Jul 2026 23:54:44 +0530
Message-Id: <20260724182446.1484894-2-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260724182446.1484894-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260724182446.1484894-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Pxt8cPpDFZTIji4i1uiixLfHJfbcdxu9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDE2NSBTYWx0ZWRfX/F6jMglWEV6H
 65Sknb3+L7Sbs4iiOh8Tul/jj24qkBgmGz5xs+QQVZBqzo6fC8oZWRKziflnAG/s9yJxPybVTRH
 D9BJH1NsYRglEA/zgLRQupEUSEuc+56jU0TmOKgIY+Ku28N0wcgM+sqPZb5P/+p1zeCbCI/C1+0
 l7edAYXIHoxWubuJzjUwxSKQCduvjeXNaaKqCSPm0sfy3fKeH4cz4kUl39hv2Bb+24AThseDnLd
 TW38PY5QkhSl0qL8QwJTsKgzeNoiA76ODNVh5xmQvs91LkB0BGwq0zD0SZhAk42RdTkEy727krR
 h2/uSRKiHKICmTCMQDdys0+J2g0xLuQqPbyOLG5N1kDqGkfw8xReiOJUUus+j47CmyZFl5WFpDm
 0/p7mHhQVv7UQ7Pc7rJItrividJTXu+PtsKWACMGEqPMz3T55dWTBcd7m21vl7rmDD2DmyVjFcC
 RacfAtJxZsTGrwdd9uA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDE2NSBTYWx0ZWRfXxtVE18Bx5RZW
 NaHkeWc59vsVpufHZMy3HyWf7x/Ne3tqj+eB1ZhDk+U89WLv1ZlcGtqIbnRrAd2nPAPy3GPKbNV
 o9iaKFVrDYqMO98SN5meOshlwmQFrNU=
X-Authority-Analysis: v=2.4 cv=DLW/JSNb c=1 sm=1 tr=0 ts=6a63ae08 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=3jZq6FF4vXrVA1D6PBYA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: Pxt8cPpDFZTIji4i1uiixLfHJfbcdxu9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240165

Extend the qcom,q6apm-lpass-dais device tree binding to explicitly
describe Digital Audio Interface (DAI) child nodes.

Add #address-cells and #size-cells to allow representation of multiple
DAI instances as child nodes, and define a dai@<id> pattern to document
per-DAI properties such as the interface ID and associated clocks.

On platforms such as Monaco and Lemans, third-party codecs are hardware
wired to the SoC and do not always have an in-tree codec driver to manage
their clocks. For these designs, clock line enablement must be driven
from the platform side, and this series provides the necessary support
for that.

On QAIF-based platforms such as Shikra and Hawi, responsibility for voting
I2S MCLK and BCLK has moved from the DSP to the kernel. This series
introduces the required device tree binding support to represent and
vote for these clocks from the kernel.

Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 .../bindings/sound/qcom,q6apm-lpass-dais.yaml | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
index 2fb95544db8b..4878c424ef03 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
@@ -21,6 +21,43 @@ properties:
   '#sound-dai-cells':
     const: 1
 
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+# Digital Audio Interfaces
+patternProperties:
+  '^dai@[0-9a-f]+$':
+    type: object
+    description:
+      Q6DSP Digital Audio Interfaces.
+
+    properties:
+      reg:
+        maxItems: 1
+        description:
+          Digital Audio Interface ID
+
+      clocks:
+        minItems: 1
+        maxItems: 2
+
+      clock-names:
+        minItems: 1
+        items:
+          - enum: [bclk, mclk]
+          - const: mclk
+
+    dependencies:
+      clocks: [clock-names]
+
+    required:
+      - reg
+
+    additionalProperties: false
+
 required:
   - compatible
   - '#sound-dai-cells'
@@ -29,7 +66,20 @@ unevaluatedProperties: false
 
 examples:
   - |
+    #include <dt-bindings/sound/qcom,q6afe.h>
+
     dais {
         compatible = "qcom,q6apm-lpass-dais";
         #sound-dai-cells = <1>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        dai@10 {
+           reg = <PRIMARY_MI2S_RX>;
+           clocks = <&q6prmcc LPASS_CLK_ID_PRI_MI2S_IBIT
+                              LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+                    <&q6prmcc LPASS_CLK_ID_MCLK_1
+                              LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+           clock-names = "bclk", "mclk";
+        };
     };
-- 
2.34.1

