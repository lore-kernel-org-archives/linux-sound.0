Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BA448C8D2
	for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 14:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784040794; cv=none; b=dcd16N8evGwQzvgcxteVKVsf/yFLSeRKiwwq0FNywOOe2NYenhplNSffbBOX2SJneCbB0GMRjqrEL9L2DMIj5xD/GKdVyg7d6BgR1ucAv/YXWlrOsBFw+zTpskOoCLsifZrd4kkNHuyyhUE+CEuLnGlxsssmW2E/SlJ4iLS4OM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784040794; c=relaxed/simple;
	bh=mUsS+GvxnVmAQvX3tN/URUtS6qia41RXJhMZqg1lKGg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NByuycy6UVbRUuBh2sT1TM6m1AlbvwKj7HZvJGsVQ1C1MKyhOMhmutc2Bn6mQ9XctWRn6p6sHZBSSiIMmpywMKTHOek+Pd4DUJwSHJ/n7pZ/JO++JHKFVmExDBMND87X08svQUKP4KV+XnFCHTj+Nh5AfdB/Ilo7140QZhh6wk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pqqu5J1A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bCDDkfQb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pqqu5J1A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bCDDkfQb"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EEcWsL800390
	for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 14:53:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=N4zDumXgGqT
	zNb1A7W7PrnDPcMHrX3OAzIUOpDTYsBM=; b=pqqu5J1A99a7ase9nLil+XdLSNQ
	ms1RkoTw0SogpVKN3ZJw8cbvZXJyrC5UP+Rbm9X5gYViDZPuPuuaDj1DLy3igNof
	PpSrTtNjbLn+CyaVl2UFN3blLzLPrZJwKhRFw5205SgLySBBlrNretFN3N+VJv06
	kTVv2PSak4LEsCvhilPNBFTunv6UKYM8B+3bH1b5H2b3i9K324vnnm+nA6dsifZK
	TK6KU+8xBWQughpzw04GXTeZBkVnXP6obYuFZ8jEAv6TXeJLpXms1Wo/YSopc6Xw
	EXJNojROoE2UtQonCKTvGiRgIP16k6S1N4hlDLrrjodDBS2gaJHzwg2LdMg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdnnr0fm8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 14:53:09 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-381250979d5so1518509a91.0
        for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 07:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784040788; x=1784645588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N4zDumXgGqTzNb1A7W7PrnDPcMHrX3OAzIUOpDTYsBM=;
        b=bCDDkfQbqlZZdt0tV0MX/R9XOJyhMdewPFEr6wMb/fDhE4I6iqzqcwBJ+eNC9cagtZ
         MRfag3zctz6x8BWkOZIXrhmWvHfm/hNIbOswBv6xR+fm6zjnMjcwO7FMrmRrf7rwT0YL
         I0KY5BemJaKTp8fQNLuHuSBH56d3c0ZcrAxzWZe45MpaxDx1rwvR/2XVJxwAUwRX18Zo
         OUlWp0ZhNyTrhDSuaZHq/bTnvmM6iDwBvzaHl/koOUjdClWQf+3engy2wtFXVBHQFhL4
         hz1pDXoPbWOpVlGiBc90f18I+brVAYXsdHtjsTlNuhKoq0NnYKXdMGZYesPPMPr6/GOk
         aDYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784040788; x=1784645588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N4zDumXgGqTzNb1A7W7PrnDPcMHrX3OAzIUOpDTYsBM=;
        b=GIjoOiTXL+o/t++Eh6i4THig5kC+eu8q/NHrYOTvHfyDwIrUw9APsZ8kx+BjFclfGz
         HlBoRxTkLLE2FYL1iZlrAJ6qKxdVhBEZFdBCYvf1wb5QjqsC4MMZo7Uf7sZdrOjvVwLt
         5GoHjUEBn88HpYMNegCaV/VlMX1ZZ4/V0w8lKL+dUuuhwYObr5/7nc0asUgz3kG6a3QL
         DaHmB6LnDb6l4jIHBsrkAGKm72qWxglZDRBAjPVEB0uMryB4GAhbt0yv+X6/EeD+qzQy
         EyGry9gKpNW8o+PPovxdCzHss+ad8aaKVD6LYBCj5BtVmdzk4WuU9BUDqxo/M/nCFOek
         MSvA==
X-Forwarded-Encrypted: i=1; AHgh+Rp1wC0VFRVWYejLWCRYYfX0+Lj+QVcRMp6kbVVrswuAuV+XLuA03wAYDlEIh0WAKXqqFisZu9FAHTRp0g==@vger.kernel.org
X-Gm-Message-State: AOJu0YydbE1TtklDzrT9WYoowir62d3FFchxHaOHzbnVNx6j9wa0S53a
	Nlt8c+Z/yhlMyYmV1v/t+S9Nvptqi0IUAOehtiqsN+wMRiQ/VnqsTvmcImNZTyjjAExw0inSV98
	YFxSx/eqoWFkrTsvIBcY3iWiuX068ilwyHt6Rw+SajmAFtzTpahHeyLZrUHAijumOrQ==
X-Gm-Gg: AfdE7cmIYYeeFklnz0kZL9XxgXNVPAY32Dqe9rTG72Mk3Xodbiju4yMi0XbXlwnGIqk
	5wixiaLvu9VX4vvhxR9fcqoQG4OAWboaENOhzVWGlwLMyhWJrCJoM/QzXl15SKhrNiKJp25QWuz
	Taca8T1IQWW6QQmoqh2GM485kBORYEFEb+yZlaJH/QvPkCrzKnfD8vCyUw+MD1KqDCaTrIYmYLj
	HoPihnb2R+kRA//sqQ11ExuvPRalXnc2qYJ5i06QalhW0sZOSwWC4r4E/nogm/Txq87smquRLsc
	e3U0QW7WxS7dEW+GcLgxLYoVy9VUQYkCZWlgH3XltwK0s1a1JVWZGHCXF6ci1OYzsi5ZHCFYIrn
	41hCA0XFu72ZuIOdrMFqvohe534QvoXYXn8C4rQxv23Y+iWs=
X-Received: by 2002:a17:90a:2ec4:b0:38d:adae:4866 with SMTP id 98e67ed59e1d1-38dc7b3f843mr9709045a91.21.1784040788228;
        Tue, 14 Jul 2026 07:53:08 -0700 (PDT)
X-Received: by 2002:a17:90a:2ec4:b0:38d:adae:4866 with SMTP id 98e67ed59e1d1-38dc7b3f843mr9709020a91.21.1784040787736;
        Tue, 14 Jul 2026 07:53:07 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313cb804197sm31941773eec.13.2026.07.14.07.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 07:53:07 -0700 (PDT)
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
Subject: [PATCH v5 1/3] ASoC: dt-bindings: qcom,q6apm-lpass-dais: Document DAI subnode
Date: Tue, 14 Jul 2026 20:22:48 +0530
Message-Id: <20260714145250.2473461-2-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260714145250.2473461-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260714145250.2473461-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE1NSBTYWx0ZWRfX5RB/+WCuJXlC
 +Z6+C1NAkBWD8D4U0Af+yXiev9gqBwKXzY49xG0nFlmnyiBt6oKGKrKzqTQyRy/XqIjoNP/Zp4f
 nw3laacefDAz5ykHqWYCEAIxl/ddZDU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE1NSBTYWx0ZWRfX0UeqgoN1fhes
 cO4GwggojP9xeOct+h4ARJDwWxs+eUjwpLPdTvosw8LPPnkU2d2jU2Ur2gsQxovEey26Iukolkp
 HWIW3dLFpq7AVdYPBscPN3eiEc9e2SbDLVJY+Sg6mTRTMNCjz3VBTTQUMvBhqMRJMU9Q+GSKIGg
 ga13reKiYI5CP+U7WTSNXJIBxOl4oh3YKOeOPUHd9U/WaRoXD1HIobRR6geMrWXzDqRrR1aD8W6
 4yH4DIKoUnVL3noYJ5ckQBDYOfkMbdn/W/m72ixdj3wVqusCrvm3LvioG4dVxe0lgVqLo0JNHBZ
 DsU60AN/RHeOUrnthZsUY7nd4RN8hCh0a7U+wrH7xjEbH++Lhx4TQVpnVJbZCLdEL8p3/1HAj4J
 DDSnnSUhVq1Ysr0DB1g6K4x/8wzThb4S5RD8ld8TrDQWyfCKakxR6pf7af0tfp7OUd3gHr7Yjty
 u7kwuG/a0phHHUtANwg==
X-Proofpoint-ORIG-GUID: p9Bh5Nwg3MtauT9oK4fxq9iWExrH9isY
X-Authority-Analysis: v=2.4 cv=NfPWEWD4 c=1 sm=1 tr=0 ts=6a564d55 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=VOP_JMduspszKC0JWG4A:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: p9Bh5Nwg3MtauT9oK4fxq9iWExrH9isY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015 spamscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140155

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
 .../bindings/sound/qcom,q6apm-lpass-dais.yaml | 89 +++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
index 2fb95544d..b37c62ccd 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
@@ -21,6 +21,82 @@ properties:
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
+        description: MI2S clocks (mclk, bclk and/or eclk).
+
+      clock-names:
+        minItems: 1
+        maxItems: 2
+
+    allOf:
+      - oneOf:
+          - properties:
+              reg: true
+              clocks: true
+              clock-names:
+                items:
+                  - const: mclk
+            additionalProperties: false
+          - properties:
+              reg: true
+              clocks: true
+              clock-names:
+                items:
+                  - const: bclk
+            additionalProperties: false
+          - properties:
+              reg: true
+              clocks: true
+              clock-names:
+                items:
+                  - const: eclk
+            additionalProperties: false
+          - properties:
+              reg: true
+              clocks: true
+              clock-names:
+                items:
+                  - const: mclk
+                  - const: bclk
+            additionalProperties: false
+          - properties:
+              reg: true
+              clocks: true
+              clock-names:
+                items:
+                  - const: mclk
+                  - const: eclk
+            additionalProperties: false
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
@@ -29,7 +105,20 @@ unevaluatedProperties: false
 
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
+           clocks = <&q6prmcc LPASS_CLK_ID_MCLK_1
+                              LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+                    <&q6prmcc LPASS_CLK_ID_PRI_MI2S_IBIT
+                              LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+           clock-names = "mclk", "bclk";
+        };
     };
-- 
2.34.1

