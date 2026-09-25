Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE5A4E50B9
	for <linux-sound@vger.kernel.org>; Fri, 25 Sep 2026 16:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790352694; cv=none; b=Anl+8WTflFIalGdSIEjnPIGF+5N0SlHVEnumnGzWt2kIN1CPZ4BiNNnCCEFkWI1s53pQ7C26j04G29rmN+4FTIgWlATXsu6DItTWgOvS2zXiJcTX6Nx12NMwx15ApP23y9G8x/dRrwuys7523tuBDFeOAZMTDzQnMCS9iu0XOc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790352694; c=relaxed/simple;
	bh=GnvEtx+QtTm6eOQJ2pxM7uY2LfcmkLojbvEhnOk9Yd0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XZfxd+cgi2KT2HWqmy7RN7GRoLWKmb0i7//nhoRU3R6jtC0pMeuvLQ//O884hXrywk6/0awX6iTlxL+wGR9C2LxjdlYmRCuRVQ1Z4WZO2bTOktBYHpk3xeXJr8ZF1RAp6jSIsDZJxaxV/tDTCJuQ+fpUAMY+SOfLEk1XmlqiJqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p1OLERAA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kUKy5tT3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p1OLERAA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kUKy5tT3"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PG0EH01001867
	for <linux-sound@vger.kernel.org>; Fri, 25 Sep 2026 16:11:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1tuESQhPlki
	sArk9a4PkEwsub/p2wo9Bvg0Lw9vYWmA=; b=p1OLERAAkK3PGX6ACAZmAOi7A4B
	ACaa7BesmSoBT9z4W0b5ZYO2wTbqhxYTXHDC8HEwDnk118mi12aLomAABGRgVCmu
	nwI6bJYHc/nXCKgJ6qduanX5ufiVLuasF/qozDIVVSRAs7cu//4LBekZoKAmO/GW
	CUMfC1mPKeBkiyJ0OxyxRAyYFx7sohuS9sxM4VPjuH84max62d/q2a/zZB26pG0/
	2UGruQ0QSWCEm+6qldyN7cEPeOaiSSM1qvVK+x14uwcBa9qDg01wOUkwc4Uo+Das
	1sd/+GzIhLTq2xXZezl8UykVm7MZVuBTPUDvSUtuzf724J5W4fcqQjS5Ahg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwr5e91e7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 25 Sep 2026 16:11:31 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7b206156cc6so744992137.1
        for <linux-sound@vger.kernel.org>; Fri, 25 Sep 2026 09:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790352690; x=1790957490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1tuESQhPlkisArk9a4PkEwsub/p2wo9Bvg0Lw9vYWmA=;
        b=kUKy5tT32DAYoYUikfm1OFbFQzVWvcuz833rozkQmoJuQxyOtn7+H25r2efYBP2wOp
         xlpLBS/o3vVLdnVT/DIF6hKxGqdHsNolC/0tf9GO5WIfqnEDsdhVVwsvsBXzlm6el2Xa
         Yx/mauunpsuqyHM5tsLK/otucigFYHIJNx+REseGs+ZAYrT15Ei04BJb5S4sulHZq6iU
         E4ZH78R0rrlXEnWpW7LSfoWvf7t2T3JrZfOuCgj+8JM5MfqlBRkzqb+oQZmtmuNjqe2H
         +fuxvK0hfmxX7WzqNMrJgUEgDFk8nrLXxmrHvmieESblUhfDdAHfiIsCPg+m/4FAZ8Iw
         FXng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790352690; x=1790957490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1tuESQhPlkisArk9a4PkEwsub/p2wo9Bvg0Lw9vYWmA=;
        b=Ku9tRO31q3WyiPYPe0idZW6igk/OnI4ecEtl+u+ovnZQiLVwIeZHwCS8hMThyUCSCf
         1YtB7O3r63JttQtC1fBRXA3CEK84USjcLpTNRoe/qnID+bubvkPlQ0emJaJzZZD91Axn
         CrwU6ZugP1MdDFiXNEDJcWT/U4Mn1MG58CAkQs4F0FDijiApO+e2vPByatnRzhz9BsHn
         64XV0qkMw4QIp1iLxy2AtpM/QSeUVDSv/IicVj9LukM9TQUCf/49OVpBadgsBccKVy0f
         s45jboV6BdYi/n8yaNR0lUeu9WvYQamRwrDwxL/z32H3diQ5PYL3eLrs7YXK3DtSRSju
         7g0w==
X-Forwarded-Encrypted: i=1; AKwUvBzKARLkE4L0wyhS2/kQs+LXH5Qcr5MwnrkueSOXA8CUg8lhbotIrpA09b20OFMPGHNrn6wH7C70L4YCJg==@vger.kernel.org
X-Gm-Message-State: AFuF++lDU+DB/52h1C1CUcydFwzFYlfSsZQV+24+Y787jEtzHQ63OcZI
	pHxp13aKf+ESTukkLmcu9M+9y83cPx39oHFXI5d3EnP5NF0/HitZvP5jRlhi1bTb4IA35W5QhaB
	3yktAIEgWnt9xKYjM8CgxAjssChHM3z4CdaBZiqT2X5ScB510WvzQfmD1rRzGwzvOSg==
X-Gm-Gg: AYBFou34bIPrszI0yHfy5FVcm1Nl7SFi+JdNnoMNw2oF8kkOIDlUpy4p60xtV/5SZOE
	qzFl5XMAq/WJvrqjjI0XLPouxs/FkQrMlB8ypBd0exy/tn8KAICRGt8L2vCrh4OAV6NTzra760q
	8o4OMRFV22157vYIu+YHjukVhc2xHh6EKqlHlzKCiWfNe/G5mbAHsO/XG4UDupGcQ6sLbXxdd4U
	1kssbBbdWjoaEe7emHCTb7KZCy6ZgAhPfMa+n9IZnLtPnx0CivHsWhL/i0muV86yQePr7oQXvwX
	M+Rr6cnPY2i6rsOLIUjOspxqBbxe86kACDlZ1F1T/YLKp3uNQ4xFfK7LMRCLNOp3qpOdNvIHLcI
	mMkoZrAnMIe+G
X-Received: by 2002:a05:6102:3ed1:b0:7a6:b18e:6d24 with SMTP id ada2fe7eead31-7af1d6c2588mr3149812137.23.1790352690061;
        Fri, 25 Sep 2026 09:11:30 -0700 (PDT)
X-Received: by 2002:a05:6102:3ed1:b0:7a6:b18e:6d24 with SMTP id ada2fe7eead31-7af1d6c2588mr3149789137.23.1790352689629;
        Fri, 25 Sep 2026 09:11:29 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff06b4d45sm73019505e9.7.2026.09.25.09.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 09:11:29 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v5 6/7] ASoC: dt-bindings: qcom: add Tambora WCD9378 SDCA codec
Date: Fri, 25 Sep 2026 17:10:47 +0100
Message-ID: <20260925161049.758913-7-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260925161049.758913-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260925161049.758913-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2NCBTYWx0ZWRfX/JT020s9sMrY
 Z8owMJkGRpk2j9xpOSZhK/kqP63anwkxElo7mO6+tzosEqwVyg5zO01toh4GVEU1xdeG8N6/0hW
 QXa6tTCqfXSx16gydtO88RqWqXKnYwQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2NCBTYWx0ZWRfX5iCDOis/onAT
 DZiUBDTO1CsAdrifKVJ5mIkmB/3riE/cO6eQWnKMQhi1VOAlU1L7i0+9Kv1xFicaf0iuusGWRE1
 NrOYF707P9gVqziDjY/LDzdoiL6AVgsTTOS/VvOktTGhzi3H7dWAyf8XdPezaMoosWWG0W+bolk
 2+zXABI39sUbihLQ4LUfwqoM6YcdNMP+Bjj6pOKT67r1XzMNFKEKV7LtLPZXqOr6ew0lPaqdK+F
 jW8wk3gRpRxfcmyVbAcohCWIRxAEyumf1CyeWTxinsF65nPKWyLIwXs8+HQe9QMy49vvqBH+e90
 QhuFi+Kz1yXHKeipu5HDmP1Y9sJO9mRI5FKoEDe6DZkbuf/O+Wqo11KCuuN7rkoKSJp7s3ahnp7
 kCRngUa1rYYLhXD6yiHP1zeY/imu0sqsY6iqbuqQlGTnoB/1YfPuN34FMm4cuxaJlELWWPJCRdZ
 nYWnBTdBG6QM7cw2ZkA==
X-Proofpoint-GUID: 6sD1q0JxFQ1Y8SlY2sRt2cNVZubcLSOv
X-Proofpoint-ORIG-GUID: 6sD1q0JxFQ1Y8SlY2sRt2cNVZubcLSOv
X-Authority-Analysis: v=2.4 cv=Hf2B3SE8 c=1 sm=1 tr=0 ts=6ab69d33 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=fAJwNmJgYEpPzymNVfgA:9 a=gYDTvv6II1OnSo0itH1n:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250064

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
 .../bindings/sound/qcom,wcd9378-sdw.yaml      | 105 ++++++++++++++++++
 1 file changed, 105 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml
new file mode 100644
index 000000000000..62d85b1dca7f
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml
@@ -0,0 +1,105 @@
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
+allOf:
+  - $ref: dai-common.yaml#
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
+unevaluatedProperties: false
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

