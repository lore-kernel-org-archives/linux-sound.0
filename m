Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82CB46D2CC
	for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 23:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784763766; cv=none; b=eV1vJ7T1MZWZR/QBp1Qu5jpg2jNR8PAzrqEwt4AyL1OUhQDjKoIQRBE1fwRnwxwgm6jCT7A+FeX4P2VcCWaNDoIs9U+G7EBFeKiS+oqjmo15bgOWL86Ixr/DeX1Mkw/Rx/tquru6/N//hZQ3dGx6uT0AYl3fE77E7j+MQf309Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784763766; c=relaxed/simple;
	bh=pOlNWN/SE7+GOWg3lwO7wBAjUsf1hbmGRPplEOANydw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=reR8kYNtF/PDTUU7dNT8I9E72cN+RIgP6isKT4e+ZNomRJrvwBnQhYG4NsTSv4gMJh6Gkhk8Lixp8oUZD27/lF7zgjOpfHsdUugPxGRBNSSpBsYas4BAGu1sxQWCpneT8Ob6K4rkVSBriCckYAyGH35Bcs0cV36blyRonVPjlbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=moYpWRxq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dVjVYExl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="moYpWRxq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dVjVYExl"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MMnvtV2176022
	for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 23:42:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=L12LTqZQ+Uv
	nxuqB4DZoUExrnf4AgkG5KfhXRLi+mUk=; b=moYpWRxqFsJuva115DBLOU9LJbH
	3W9mhpBVHlEZxIIkHnJPlgquNGmlfKoi6X227+jZqBD9SteYUfhtXBgNzX/y3yoW
	jqcUzNq4vcP0g7v2E+FNDtRUY1U6a14mWIxsH3C2bEfBRoQ6H3j5ot/7uB0sB1ZO
	dkEFDR27PrLUF15+qyjTnd/bWk6mUTgakDsGTmGD7mH2iVQ0CADCXZuBBVB5IFxO
	F9NcGLRvur9BQI8sUYd/NiQvbOP7iABWug9oZrB7s0xWdxIQjI29EhYfqxwh5a/Y
	BuAHVV/WnbD0hLKwOTe9JC2lb9k55lUOn269oZFBG6OtM26hWOvIxlqfsLA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjxm12f19-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 23:42:42 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c19493ac2so489651cf.1
        for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 16:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784763762; x=1785368562; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L12LTqZQ+UvnxuqB4DZoUExrnf4AgkG5KfhXRLi+mUk=;
        b=dVjVYExlMyQeLAkl6em4txps51GPvxoWLvsjX3Tt4BvXEt6o5PmRv3W3I4L9UX8AN+
         zVuXpNpmxyxxbQ0CC8PnmXgZX8H9HuFDBlM3MVMQbkKtoorLuE9X3t1KO9W9XEZPeUUT
         6eiagRNEgpPUOahtuX/RGINa/mBMpeQWQP7yhN91vhacIt1bToo2PJciPK+1De1ghKuw
         aC1VEOW26jJPCm8GA1itAVAG99rvBK+SCCZKOMENReOqdH7qLQE9gIqtI/UF5Xgi1EBr
         N9JWeZXJW7YbJcLnWMTHdWWAf3gzLIFZLFqkua+Oddb/HVSKvQl+ZzwzHJRzTeNp+5Fw
         kecA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784763762; x=1785368562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L12LTqZQ+UvnxuqB4DZoUExrnf4AgkG5KfhXRLi+mUk=;
        b=D7WH09+KVNxfLWaTlha3Z2LP1rZ41ReDLordS8oq3R50eTHhMdABqFjTTzV2NE2Jq2
         L5NMp4qRRSEapsu3AOOdcH4iaciFgGUAdwPxt7hp9zNSbbHFtAk4IB4eji9qSlMbFQ6k
         FtOJSBB7+0RsJSp73DaNFLNj75zv7+SW0splWiBRFABj11l2gAaXehswRJZLDp6pwejP
         1FOuULOl0rrQQnAQIAE0o6U6vYj8nRrIG6RP39reReWwyTbodiSFLYMqsCyAzLloOPIk
         U0ghKdZuoq3qnZCPvdISZiCAWDWjDaV9TJTDrGa08gibREzQ4lPquShok318uyifc3pt
         B5zw==
X-Forwarded-Encrypted: i=1; AHgh+RrUyZA75nxh8Wo554n9ReT31cF9H2IFrGiwZHXaq4qCZYhugB10tuHZHeet2nzqjRpYordPLNqSJGBFLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/JFhZOYjwirXejlyDiYt8crhbZY2cXfptQgB6WUYtY73bkSv5
	NDtQTeTLfMyH8/D4cv1UjdiDGPfT4Lmj/xZv9WZhhyJLe4NQOTv8Gc8zXpXIpSs2UJ7s3Zacsbp
	byMMw1JmmZiGzJovFYeXABI6bDpk7jBowcrIZJBUHLdn6DHAvjL2Niir69m2puUdPcA==
X-Gm-Gg: AR+sD12JQVc4VmOdMSH/bwnTRoNzjq9X8ukRnGEzSnPjBZlobSTjp4IAi5vT5bII59z
	+kAPZEoRlnuZY50zaw7YiIkiRSwyuXRNxXyifKcUXUAvho5pLCi4fsDj0d6tgG+kfLVfGsXV1HG
	KSdVhAoA6oAoMj+P/odaHtGVRVFsAZkhxb/EvbK05xOauW6iDVTRNl/OE3PuKYzujgXUmcKXmTO
	sgra1BkrSdK2HD3nFqP1dyV8Pw1+k5iT6RoBDXqFFb1OCoFvCQy8CqA7sVNC0ow9nUCYaLWR7KJ
	zvP4zpiZoYCyB6FfKzbW1MaeRzGt4qAD6/m+ppwmn4YvHvCKOTuCUdsfmxvwCWFaSAA6XgFpQnK
	XO9EpEc9XTeUcUQ==
X-Received: by 2002:a05:622a:580c:b0:51a:8c9c:7f3e with SMTP id d75a77b69052e-5283df4fe14mr6874071cf.65.1784763761807;
        Wed, 22 Jul 2026 16:42:41 -0700 (PDT)
X-Received: by 2002:a05:622a:580c:b0:51a:8c9c:7f3e with SMTP id d75a77b69052e-5283df4fe14mr6873761cf.65.1784763761209;
        Wed, 22 Jul 2026 16:42:41 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956a4aae16sm101796345e9.0.2026.07.22.16.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 16:42:40 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [RFC PATCH 7/8] dt-bindings: sound: qcom: add Tambora WCD9378 SDCA codec
Date: Thu, 23 Jul 2026 00:42:17 +0100
Message-ID: <20260722234221.884765-8-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260722234221.884765-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260722234221.884765-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDIzMyBTYWx0ZWRfX3TTsX8MmTgxm
 F1ilqgYrIr0VaGQWKmyT4e24rNANp0lcN63qpNcVIu6pQDfoac1nytNLPdAIAoSYzz5YyfC98Dz
 cMGYacFmdFhQrdRft4f0l8Ef57xTMqM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDIzMyBTYWx0ZWRfX7Y47HPjJq+jE
 Pv6cUMkHfEPdAO6Xiu/fA5O9r//tusG1PUGOuSJHzzBS4peUE2/8M5AJepRmWOMzc4Ez/xBE5JS
 3Qdmy1uWq1GaC23DD4MaDUhHZr/h9L26Dg0e1zscU22KlLRxtLDrExUgc4egQFHSkHvKnRDF9e2
 3uY+QMLbiUwp771+KyOZl8CfhzH23tBljD8ZVtm+T+OVcATUYjERtKbg5UQupzY86fuLliMvRqE
 wj6YKBCdzu9s8XvOZ4mGR2yeXjlbovpdN0DbnljV2fftE0VhxIsxQHA6GhVPTaNYUo/DOnd2qfv
 7DMvpGv9N7EqCNCN7UkUbux2iQbknxTrbBrHo/XdzvAF3gUKcKpdUCmd4zInuAQ8qvUEXpL8D0x
 SKbe87nqKXbaXnxY4xGxoN2kfofZTsJ5ua8pkkQY8o8jYFEwB9x7izLVmUe94ail7l+BAMWl39n
 XeoaqpBCRuN9YPXl2uw==
X-Authority-Analysis: v=2.4 cv=Rsv16imK c=1 sm=1 tr=0 ts=6a615572 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=GYSh3LzNAAAA:8 a=s5uLdfJeeDcd-HM_FJ0A:9
 a=kacYvNCVWA4VmyqE58fU:22 a=sptkURWiP4Gy88Gu7hUp:22 a=lWcdFasyL5yHfcDTNXXo:22
X-Proofpoint-GUID: 5CbMC6nylu-AEFFEd93v20tZiVCYqpCp
X-Proofpoint-ORIG-GUID: 5CbMC6nylu-AEFFEd93v20tZiVCYqpCp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_05,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220233

Describe the WCD9378 SDCA peripheral node (compatible sdw20217011000)
driven by the wcd9378-sdca codec driver for headphone playback, headset
mic capture and jack detection via the SimpleJack SDCA function type.

WCD9378 codec can be wired up in 2 different modes.
"mobile mode" on phone/tablet SoCs is enumerated as tx and rx device,
each of which has dedicated control and data lines.
"compute mode" on compute platforms such as Glymur is enumerated as
single standard MIPI SDCA class device.

Both modes share same Device ID, compatible; qcom,compute-mode selects
which driver path is taken.  Supplies, reset GPIO and mic-bias voltages
live on the SoundWire slave node in compute mode and are forbidden in
mobile mode (owned by the top-level codec parent there).

Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../bindings/sound/qcom,wcd9378-sdw.yaml      | 200 ++++++++++++++++++
 1 file changed, 200 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml
new file mode 100644
index 000000000000..2ed4ad92958e
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml
@@ -0,0 +1,200 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,wcd9378-sdw.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SoundWire Slave devices on WCD9378
+
+maintainers:
+  - Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
+  - Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
+
+description: |
+  The Qualcomm WCD9378 codec presents its SoundWire slave devices with
+  class ID sdw20217011000 in both operating modes:
+
+    * mobile mode -- two slave instances sit on separate SoundWire
+      masters carrying data only.  A separate top-level codec node
+      owns the codec's supplies, mic-bias voltages and reset GPIO.
+
+    * SDCA / compute mode -- one aggregated slave sits on a multi-lane
+      master and carries both control and data.  There is no separate
+      top-level codec node, so the SoundWire slave node itself owns
+      supplies, reset GPIO and mic-bias voltage configuration.  It is
+      marked with qcom,compute-mode.
+
+  Codec drivers that match sdw20217011000 use qcom,compute-mode to
+  decide which mode to serve; the presence or absence of this property
+  also gates whether the supply and mic-bias properties on this node
+  are required or forbidden.
+
+properties:
+  compatible:
+    const: sdw20217011000
+
+  reg:
+    maxItems: 1
+
+  qcom,compute-mode:
+    description: |
+      Marks this SoundWire slave as the single aggregated slave that
+      implements the codec in SDCA / compute mode.  Only present when
+      the codec has no separate top-level codec parent; in that case
+      this slave node also owns the codec's supplies, reset GPIO and
+      mic-bias voltage configuration.  Absent in mobile mode.
+    type: boolean
+
+  qcom,port-mapping:
+    description: |
+      Static mapping between codec SoundWire peripheral ports and master
+      ports on the SoundWire bus.  Length and interpretation depend on
+      the slave's role as fixed by the parent codec node:
+
+        mobile (5 entries): the mobile-mode driver derives direction
+            (RX / TX) from its own context (parent phandle from the
+            top-level codec node, or the presence of
+            qcom,tx-port-mapping / qcom,rx-port-mapping on other slaves
+            in that binding).
+        SDCA (7 entries):   DP1..DP7 aggregated on the single slave
+            (index 0 unused).
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 5
+    maxItems: 8
+
+  reset-gpios:
+    description: |
+      SDCA / compute mode only.  GPIO used to release the codec from
+      reset.  Active-low.
+    maxItems: 1
+
+  vdd-buck-supply:
+    description: SDCA / compute mode only.  1.8 V analog buck supply.
+
+  vdd-rxtx-supply:
+    description: SDCA / compute mode only.  1.8 V RX/TX supply.
+
+  vdd-io-supply:
+    description: SDCA / compute mode only.  Digital I/O supply.
+
+  vdd-mic-bias-supply:
+    description: SDCA / compute mode only.  Mic bias supply.
+
+  qcom,micbias1-microvolt:
+    description: SDCA / compute mode only.  MICB1 rail voltage in microvolts.
+    minimum: 1800000
+    maximum: 2850000
+
+  qcom,micbias2-microvolt:
+    description: |
+      SDCA / compute mode only.  MICB2 rail voltage in microvolts.
+      Used by the SDCA SimpleJack headset-mic input (IT33 / AMIC2).
+    minimum: 1800000
+    maximum: 2850000
+
+  qcom,micbias3-microvolt:
+    description: SDCA / compute mode only.  MICB3 rail voltage in microvolts.
+    minimum: 1800000
+    maximum: 2850000
+
+  '#sound-dai-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - qcom,port-mapping
+  - '#sound-dai-cells'
+
+allOf:
+  # qcom,compute-mode gates the standalone-slave shape: supplies, reset
+  # and mic-bias voltages live on this node in compute mode and are
+  # forbidden in mobile mode (owned by the top-level codec parent there).
+  - if:
+      required:
+        - qcom,compute-mode
+    then:
+      required:
+        - vdd-buck-supply
+        - vdd-rxtx-supply
+        - vdd-io-supply
+        - vdd-mic-bias-supply
+        - qcom,micbias1-microvolt
+        - qcom,micbias2-microvolt
+        - qcom,micbias3-microvolt
+    else:
+      properties:
+        vdd-buck-supply: false
+        vdd-rxtx-supply: false
+        vdd-io-supply: false
+        vdd-mic-bias-supply: false
+        qcom,micbias1-microvolt: false
+        qcom,micbias2-microvolt: false
+        qcom,micbias3-microvolt: false
+        reset-gpios: false
+
+additionalProperties: false
+
+examples:
+  # Mobile mode: two SoundWire slaves on separate masters.  Neither
+  # carries supplies or mic-bias -- the top-level codec parent owns
+  # those.
+  - |
+    soundwire@3210000 {
+        reg = <0x03210000 0x2000>;
+        #address-cells = <2>;
+        #size-cells = <0>;
+
+        wcd9378_rx: audio-codec@0,4 {
+            compatible = "sdw20217011000";
+            reg = <0 4>;
+            qcom,port-mapping = <1 2 3 4 5>;
+            #sound-dai-cells = <1>;
+        };
+    };
+
+    soundwire@33b0000 {
+        reg = <0x033b0000 0x2000>;
+        #address-cells = <2>;
+        #size-cells = <0>;
+
+        wcd9378_tx: audio-codec@0,3 {
+            compatible = "sdw20217011000";
+            reg = <0 3>;
+            qcom,port-mapping = <1 1 1 2 3>;
+            #sound-dai-cells = <1>;
+        };
+    };
+
+  # SDCA / compute mode: single aggregated slave -- owns supplies,
+  # reset GPIO and mic-bias voltages.
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    soundwire@7630000 {
+        reg = <0x07630000 0x10000>;
+        #address-cells = <2>;
+        #size-cells = <0>;
+
+        wcd9378c_sdw: audio-codec@3,0 {
+            compatible = "sdw20217011000";
+            reg = <0 3>;
+
+            qcom,compute-mode;
+            qcom,port-mapping = <2 2 3 4 5 6 7 8>;
+
+            reset-gpios = <&tlmm 191 GPIO_ACTIVE_LOW>;
+
+            vdd-buck-supply = <&vreg_l15b_1p8>;
+            vdd-rxtx-supply = <&vreg_l15b_1p8>;
+            vdd-io-supply = <&vreg_l18b_1p2>;
+            vdd-mic-bias-supply = <&vreg_bob1>;
+
+            qcom,micbias1-microvolt = <1800000>;
+            qcom,micbias2-microvolt = <2750000>;
+            qcom,micbias3-microvolt = <1800000>;
+
+            #sound-dai-cells = <1>;
+        };
+    };
+...
-- 
2.53.0

