Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888A84FD26A
	for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 13:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789737585; cv=none; b=oFoa7eqE8FJbJcr0X9Y+xtqSeV+jG6yQsrHO8s7wKsmcIp1iEFv2Y3/2Dh+jayZnWuuy6dhK9JkLQ/I9Rb1Ya5AB3DZRnkf0WElKl2xXt4/P+zpLcabmB3/NuRgtMH/CypXGWCZddR//vg+6bUplGHg5ZIcpDoeOIUKSOQRMuXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789737585; c=relaxed/simple;
	bh=MU0rmSfq8z627CzeHXf/aw3fNFEvcLWJdhX6oXFHzCk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q56CXtotqW7Kx3XUNyI6nac/1BBIXCwWFz57iw6ov79nbgVZCl9V5Md6G9pxw4H0ohGyqgQXwZ9ueu/+vRHvTvX4tsuQoM4mDxJYvVrhBuuMnWJH+EvCZ7aujXDG5yeDLsujqrDXZ991hwYlAPxoWOHjsa6E1SEfnO/NiPjf4rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jgSZz3lE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OwcKc4al; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jgSZz3lE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OwcKc4al"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ICtq7U3584062
	for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 13:19:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=o8tgPrluC9c
	kzRzhPb6V5SaRrtpKQumwcAGbMPyJNCY=; b=jgSZz3lE8WtC227RRf7n+MTwtv8
	9GycrP918+r8Y99G7rF/Amffn2+SJDxjqmJeWiwk2CtQEu/5pTxWtlnKmYy0l1dg
	trXHuMZ8dY0jdpoNSyERhnzp1lsCWz1ktDrq+HgpxA0E2fqS33YQKvcDq9HdQ3/i
	4oTW7RcuXDL09I/xZEb7yGQDOjKaloRD+BFRF4sV1hlP5QmSmYSj2CqbDqFAbfZf
	s+EJ79DmwWIB2faaTxW6gtORj0kP1AgVlN+IG5eE507zuue2laujKsD51wKsUcP6
	JlnhBuqpWmplIRZP9MtB722+I0pPWGajj0QPYGIyedptMnaj/8iOTyOrj6g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gs37dgpsj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 13:19:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a3f673221so214022685a.0
        for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 06:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789737582; x=1790342382; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o8tgPrluC9ckzRzhPb6V5SaRrtpKQumwcAGbMPyJNCY=;
        b=OwcKc4alz5HXo0/n1iRv4uScRL3tGXdEvuaalnMzM06qDcauOJNNsQyE8+G1BmfLQR
         TsjWB37FfZ7CDo7Ibt9RN2oB++hTM/KNyh9Ww3aUsWjokc45D0xlRGOGl7m2sHGnnNir
         CYMXIC66CexVYlRHrnSIFD8WGdtXlxhg7fSaU2FsHwTzX04nmceAVMCcjw90Zy18ASIA
         ccNtWOJ4VynmBaeyBBwUfHN9CBU4SaGI/sptRfP+A+IoaQMMNcDKdrJ28s5MtAc7A1rl
         M5BrYMns3Qe3uE2mD/do4Y3MzBkYcKKAWu/lwK2uUKCJy6hrbPcA8hPz6RINl7vQzE2/
         5qkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789737582; x=1790342382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o8tgPrluC9ckzRzhPb6V5SaRrtpKQumwcAGbMPyJNCY=;
        b=RVyzbjk06ABYZnKc9PSY7v94eWP2VS7gzNTOb7BYhG204Pab1/Q7bT5h4Zc9eEw5G6
         KqOgazw7o9uwtywmA6YFlyGLn4AtBuuEQYnwK2EgRhaWGj/V+FK8sRGHxOvfp96+29g7
         XKLGrAUC/K01Gd1eW/W8OWPVKLobEkIM5/XFvF0gMpi2/11P4I7EcMudUT9lPUQa+3dX
         rVFAY2NCdVup/h3MJteTi1Bzb9r7tMP48CuoLu+8S8UsPFa3ryvxbhZk4NQLJ+S6P6PE
         SCF7W7046Nnh8DuWwWod5qYngbbY46qlJBcyijpnqiVEMouRb79aNP1qzwFEy6a6eyEG
         rnyA==
X-Gm-Message-State: AFuF++n5moMqbXt2PJ83TNoPFkw44ak+5rbbJrF13t+A3FeubA+DDE0l
	RH09CzKCc26FMANkj1mWUdmp4QaEviiKdMXamr45D+iPjuzBCOZc5G7dQ11oFQKHnFcPvw3RW+E
	3BlN999VwoP9rifmjxQexRaDFa4LFHReNTKxZNI6S9NWmDklXwNxIiaN5P7/iaHTHhw==
X-Gm-Gg: AYBFou1KVu8VVtM5PIHcDDVAs44hQlQskCj+wv0rT7NIOpGZLvvjKcvJ91yD3cCTDbd
	Xj3Ed+vWhjxKhMwm7/DmBwNQo6xvki4AGUSjDVRJTfiJ3C63FoyvpZEB0DuQa9cYNSKIZd8OO89
	vaP6mI26HhxsOYD0FfaSTx8xFh+ZEnzzmskdjAeGAMlJosGsQwWC5y+gImtFvx0ITZ7u6EFTWAY
	hFvztjexQxm6Xj72cw0J/EGzbZwP3C0a6DX8XAOKobZzeuC5Rnp7RgorjQSI5j2nb69CLmSXzy2
	jrQBzC/fCt5jinxdi1SVR0u1lFyHtjiSucspYq0oJAzzpzOr1sKNsoiHPCvLRXJpYOKto471Gmm
	NJDexKyDSwREksQ==
X-Received: by 2002:a05:620a:4686:b0:939:707b:ec10 with SMTP id af79cd13be357-93bdc9fdefdmr324187885a.52.1789737581581;
        Fri, 18 Sep 2026 06:19:41 -0700 (PDT)
X-Received: by 2002:a05:620a:4686:b0:939:707b:ec10 with SMTP id af79cd13be357-93bdc9fdefdmr324183985a.52.1789737581179;
        Fri, 18 Sep 2026 06:19:41 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc7cebae2sm48254015e9.8.2026.09.18.06.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:19:40 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 7/8] dt-bindings: sound: qcom: add Tambora WCD9378 SDCA codec
Date: Fri, 18 Sep 2026 14:19:12 +0100
Message-ID: <20260918131914.681588-8-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260918131914.681588-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260918131914.681588-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE4OSBTYWx0ZWRfXxSy2VpcYYXbk
 GJZNMGXMYS89FxuBlNDLQ8pYJgnm7Wo6S+UQ3lXRsFvKsDmUw6zYtY42wHRoAArhwXohz8L6uki
 maldO1Dn0uQJ4XoUmth8+LEXaPjG+bg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE4OSBTYWx0ZWRfXzu4XJQNQKokx
 nBd5XKQeeenXBfZ8SQBEdHhY6vchGgkIhQMH/NNAg6Uxq53LLeJXkiYU7JErH23qPgeoa2lajoj
 phfRf3iAWAwdw0q9yANSiF4XFDKVvTiobR9PpIXSPs9EerKWk3G63lFhwrQQckskPLHimIqg7yn
 j66u+nrWd55lElpEIri2+FIlSxrVI5lEApt06sJAlAR1H0fcEw/PS5q8iNS+8yS37e2rLzP7NoA
 YWWNtw7RaLpkROFBnOMI9y27eX5jB0OfZhir2yi+ioVMb1VMv02jpepePdbD13VyPvdEjN9xmFk
 +d2R7BfQymt3SKnyMd1DbFcQUkzNOilLj38bwiknKNuNV3SV0RzaaJXndpHjtoIQ45LRL53LysE
 F9Pd5tf514sEYHvZM/IQb6ns7sC0OdNh4MvygAQHvc8W5usSAFRfnBGU44BacSAu+Nk2amRmlus
 oHJn5vYE6Y+fo7cD0xQ==
X-Proofpoint-GUID: fPj5LAGjiOnh6XzZ6a2mt_NeauXW0xCs
X-Proofpoint-ORIG-GUID: fPj5LAGjiOnh6XzZ6a2mt_NeauXW0xCs
X-Authority-Analysis: v=2.4 cv=R+mWitRX c=1 sm=1 tr=0 ts=6aad3a6e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=fAJwNmJgYEpPzymNVfgA:9 a=PEH46H7Ffwr30OY-TuGO:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 spamscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180189

Describe the WCD9378 SoundWire peripheral which is SDCA compatible
soundwire device. It provides SDCA SimpleJack for headphone playback
headset mic capture and MBHC jack detection.

The same silicon is integrated in two ways and enumerates with the
same SoundWire class ID:

  mobile mode: two slaves (tx, rx) on separate SoundWire masters.

  SDCA / compute mode: one aggregated slave on a multi-lane
  master.

Note: both of them have different bus toplogies 1 device vs 2 devices.

Currently only compute mode is supported by this bindings, mobile mode
will extend this binding as required.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../bindings/sound/qcom,wcd9378-sdw.yaml      | 102 ++++++++++++++++++
 1 file changed, 102 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml
new file mode 100644
index 000000000000..33fcd0f191ec
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml
@@ -0,0 +1,102 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,wcd9378-sdw.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm WCD9378 (Tambora) SoundWire codec
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
+
+description:
+  Qualcomm WCD9378 (Tambora) SoundWire codec. The same silicon can be
+  fused for a mobile (non-SDCA) mode or an SDCA-compliant mode; the
+  qcom,sdca-compliant property selects the latter and is required by
+  this driver.
+
+properties:
+  compatible:
+    const: sdw20217011000
+
+  reg:
+    maxItems: 1
+
+  qcom,sdca-compliant:
+    description:
+      Present when the codec is fused as SDCA-compliant. The mobile
+      (non-SDCA) variant carries the same class-ID compatible and is
+      handled by a different driver.
+    type: boolean
+
+  qcom,port-mapping:
+    description:
+      Each entry maps a slave data port to a master data port.
+      Entries are in order starting from slave port 1; slave port 0
+      is reserved and not represented. SDCA-compliant mode uses 8
+      entries covering DP1..DP8.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 8
+    maxItems: 8
+
+  reset-gpios:
+    description: GPIO used to release the codec from reset.
+    maxItems: 1
+
+  vdd-buck-supply:
+    description: 1.8 V analog buck supply.
+
+  vdd-rxtx-supply:
+    description: 1.8 V RX/TX supply.
+
+  vdd-io-supply:
+    description: Digital I/O supply.
+
+  vdd-mic-bias-supply:
+    description: Mic bias supply.
+
+  '#sound-dai-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - qcom,sdca-compliant
+  - qcom,port-mapping
+  - reset-gpios
+  - vdd-buck-supply
+  - vdd-rxtx-supply
+  - vdd-io-supply
+  - vdd-mic-bias-supply
+  - '#sound-dai-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    soundwire@7630000 {
+        reg = <0x07630000 0x10000>;
+        #address-cells = <2>;
+        #size-cells = <0>;
+
+        wcd9378c_sdw: audio-codec@0,3 {
+            compatible = "sdw20217011000";
+            reg = <0 3>;
+
+            qcom,sdca-compliant;
+
+            qcom,port-mapping = <2 2 3 4 5 6 7 8>;
+
+            reset-gpios = <&tlmm 191 GPIO_ACTIVE_LOW>;
+
+            vdd-buck-supply = <&vreg_l15b_1p8>;
+            vdd-rxtx-supply = <&vreg_l15b_1p8>;
+            vdd-io-supply = <&vreg_l18b_1p2>;
+            vdd-mic-bias-supply = <&vreg_bob1>;
+
+            #sound-dai-cells = <1>;
+        };
+    };
+...
-- 
2.53.0

