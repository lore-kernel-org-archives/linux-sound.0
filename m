Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A094F3E49FB;
	Mon, 24 Aug 2026 06:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787553409; cv=none; b=MzvFkHL9N3hp+KVvHp5zqBNC30H17aBB60yyiqlBUCcOxn727D0Z91omaybKCO1Axi744cw9FEqlCxtuDKves1CX4SCYKJKBUefv03zlGkLOG9laK62PB5IJqzfj1XByV/VbxOXy4DwfHLgPwarcNObxbJROwiH/TfOnGu8yZLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787553409; c=relaxed/simple;
	bh=gd5A1LF1myaaFWedz9ruzXlfrE4iqggpURygJXQgDIk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=F3KP/LpGWkBLgJ9SxyhSjoM45Li8/J9D1bIl0j5s4zxIUY0hn7UfLFjMRf6RAYoSR/pj7Ge5qPi29PuR1aej1uBbAUrBNGwfE1XPOMerkJu02qxxeuV60IdGfXmA0G38x0tJHxHCLjKBJUBjgN80UlloQdbBLapUgWZ44LqeObc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=imawKbSc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="imawKbSc"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5RCIn3066897;
	Mon, 24 Aug 2026 06:36:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=567XRr1eQa4
	Yiwq3Jk4voj0UANatfUVien1s/XX0egI=; b=imawKbScxzkhFqTs1ih6JmhpIiP
	qTDAs5q0WxehWxso3AVJjihb9gSxQD9cEW+ObZ3HfNP2kjrZpyF5nSmSkSFwmHuh
	VdpmMRtbtlCvMIkLmh/moy8cn6Z5PL+A/saxo2Tkz/hZEN/381gXT8EUvVhuRnsd
	TegTeBImz/IimZOjUev+vIAoyluYe2kJS1EEofdt6rmRXJaSc/LO5VErkIvDfemS
	0nEMl0ZSjSGZY7BOz8rd4p3NOcaSoTLemNHQg1D603yibRfOyT1k2443D8r5BL2F
	OZgqf69kcjX1L4iqkcDZNQ4RFuXNCUIt10C/pxETPj1YIzpoYhy+x7NHTbA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g88jph619-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Aug 2026 06:36:35 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 67O6aUYt015372;
	Mon, 24 Aug 2026 06:36:32 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 4g74uj2h6e-1;
	Mon, 24 Aug 2026 06:36:32 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67O6aUCE015364;
	Mon, 24 Aug 2026 06:36:32 GMT
Received: from hu-hgautam-hyd.qualcomm.com (hu-hgautam-hyd.qualcomm.com [10.147.247.91])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 67O6aUFB015360;
	Mon, 24 Aug 2026 06:36:32 +0000 (GMT)
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Subject: [PATCH v3 1/9] ASoC: dt-bindings: qcom,qaif-cpu: Add binding
Date: Mon, 24 Aug 2026 12:06:19 +0530
Message-Id: <20260824063627.3595610-2-harendra.gautam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com>
References: <20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA1NyBTYWx0ZWRfX6vTxmbgioU6s
 ZKrdeRmasxdpm5i53SQ2Bzn3W3KZlxMydcXEzfNUpXWsKuLpSFhxJyMWWToWcy26ytSV0E+ol5M
 mTATg0q0BTk9pc0CPVXVt93NurFi1l3FMud1U8PUmu2e+bgBUsJMGHLCRQUc9nLreI83dF2Umv3
 /Pqya1QIKv7qr0BeW9GyV19HCbIwUtDDojGAjaKILuM1+PxtItakzBoJSLjJiH4dq9u5DP9Ugwu
 84/52pKrZ32TAzGHT5lBLRxtAEu2c86R81u3t0G8MxaWBtirh3K8bJ9e0o8KXRcFHUZzgCBqfOl
 kehDFxOUP9GmQOjYJIpJ3Y1fak1tgf1Jw3yvsgTfYUVnV7ADC0j/FeXDpYfH+ZQUcwIHLf0ZZvo
 5058xq95aBYCAIiQRVz0vzp816BeJiH5eRwgI8XkEyBqvasmDU6haWLw/C9oaxkfTQWNdwp/kGA
 llhap43BhFO3uOYlGoA==
X-Proofpoint-GUID: 1WDn0aDHs5Ix6wdNV55wck-4BUvWZ1lb
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA1NyBTYWx0ZWRfXwU1LTOLpaakV
 tmzxSZj2J3OCW5CTnN/nnYToG14y923egUhcfD24vDxTbOChQ/3UGYzta8IFNEhuB6KwKQdEED1
 CF2qzl4y0HuBtszIpnwtQtpEVU1cF1w=
X-Authority-Analysis: v=2.4 cv=Xey5Co55 c=1 sm=1 tr=0 ts=6a8be674 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=ftDVo_QRcfsieBhXAkUA:9 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: 1WDn0aDHs5Ix6wdNV55wck-4BUvWZ1lb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1011 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240057

QAIF routes audio between system memory, external PCM/TDM/MI2S serial
interfaces and the internal Bolero/WCD codec. Platform Devicetree files
need a binding to describe the controller resources, DAI cells and per-
interface AIF configuration, and named constants to avoid raw numeric IDs
in sound-dai references and child-node reg values.

Describe the MMIO region, interrupt, clocks, DMA IOMMU mapping and
aif-interface child nodes required by the controller.

Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
---
 .../bindings/sound/qcom,qaif-cpu.yaml         | 307 ++++++++++++++++++
 include/dt-bindings/sound/qcom,qaif.h         |  97 ++++++
 2 files changed, 404 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,qaif-cpu.yaml
 create mode 100644 include/dt-bindings/sound/qcom,qaif.h

diff --git a/Documentation/devicetree/bindings/sound/qcom,qaif-cpu.yaml b/Documentation/devicetree/bindings/sound/qcom,qaif-cpu.yaml
new file mode 100644
index 000000000000..134356114733
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,qaif-cpu.yaml
@@ -0,0 +1,307 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,qaif-cpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Audio Interface (QAIF) CPU DAI Controller
+
+maintainers:
+  - Harendra Gautam <harendra.gautam@oss.qualcomm.com>
+
+description: |
+  The Qualcomm Audio Interface (QAIF) is a fully configurable DMA-based
+  audio subsystem controller. It serialises and deserialises PCM audio
+  between system memory and external serial audio peripherals (PCM, TDM,
+  I2S, MI2S) through the AIF path, and transfers parallel audio between
+  memory and an internal WCD codec through the CIF path.
+
+  AIF (Audio Interface): up to 13 multi-lane Unified Audio Interfaces,
+  each supporting up to 8 independent data lanes. Each lane is individually
+  configurable as TX (output/speaker) or RX (input/mic). All lanes of an
+  interface share a single bit clock and frame sync. Supported modes are
+  PCM (short/long sync), TDM, and MI2S (stereo/mono). Per-interface
+  configuration includes sync source (master/slave), sync mode, sync delay,
+  sync inversion, slot width (8/16/24/32-bit), sample width, active slot
+  masks (up to 32 slots), bits-per-lane frame size, lane enable/direction
+  masks, loopback, output-enable control, and full-cycle path support for
+  long chip-to-chip connections.
+
+  CIF (Codec Interface): up to 10 RDDMA (playback) and 10 WRDMA (capture)
+  channels connecting to an internal codec over a parallel bus. Each channel
+  supports active-channel enable mask (up to 16 channels), frame-sync
+  selection, frame-sync delay, frame-sync output gating, dynamic clock
+  gating, and 16-bit packing/unpacking.
+
+  Note on RX/TX naming convention: in QAIF, TX refers to the output
+  (speaker/playback) direction and RX refers to the input (mic/capture)
+  direction. This applies to both AIF lane directions and CIF slot/mask
+  properties.
+
+  DMA engine: RDDMA fetches audio from DDR/TCM/LPM into a shared SRAM
+  latency buffer (SHRAM) and drains it to the interface. WRDMA collects
+  data from the interface into SHRAM and writes it to memory. Each DMA
+  owns a private SHRAM region defined by start address and length registers.
+  Burst sizes of 1/2/4/8/16 beats (64-bit) are supported with up to 4
+  outstanding transactions per DMA. Two QSB master ports (QXM0 for TCM,
+  QXM1 for DDR/LPM) provide the memory interface.
+
+  Resources are partitioned among up to 5 Execution Engines (EEs) via
+  EE map registers. Each EE owns a set of DMAs, audio interfaces, and
+  interface groups, and receives its own independent interrupt output.
+  The interrupt hierarchy has a two-level structure: a summary register
+  identifies the event class (DMA period, underflow/overflow, error
+  response, audio interface underflow/overflow, group done, rate detector,
+  VFR), and per-resource status registers identify the specific channel.
+
+  Interface grouping (bonding) allows up to 6 groups of audio and codec
+  interfaces to start synchronously and align their DMA period interrupts
+  within half a frame duration using the RDDMA padding feature.
+
+  Two rate detector blocks measure the frequency of incoming frame sync or
+  word select signals and generate interrupts on rate change, undetected
+  rate, or sync timeout.
+
+  Block diagram::
+
+    System Memory (DDR / LPM / TCM)
+    +---------------------------------+
+    |  Circular Buffers (ping-pong)   |
+    +----------+----------+-----------+
+               |          ^
+         64-bit AXI  64-bit AXI
+               |          |
+    +----------v----------+-----------+
+    |        QSB Master Ports         |
+    |  +----------+  +----------+     |
+    |  |   QXM0   |  |   QXM1   |     |
+    |  +----+-----+  +-----+----+     |
+    +-------|--------------|----------+
+            |              |
+    +-------v--------------v----------+
+    |         Shared RAM (SHRAM)       |
+    |  +------------+  +------------+ |
+    |  | QXM0 Read  |  | QXM0 Write | |
+    |  | SHRAM      |  | SHRAM      | |
+    |  +------------+  +------------+ |
+    |  +------------+  +------------+ |
+    |  | QXM1 Read  |  | QXM1 Write | |
+    |  | SHRAM      |  | SHRAM      | |
+    |  +------------+  +------------+ |
+    +---+--------+--------+-------+---+
+        |        |        |       |
+    +---v--+  +--v---+ +--v---+ +-v----+
+    |RDDMA |  |RDDMA | |WRDMA | |WRDMA |
+    | AIF  |  | CIF  | | AIF  | | CIF  |
+    |[0..n]|  |[0..n]| |[0..n]| |[0..n]|
+    +--+---+  +--+---+ +--+---+ +-+----+
+       |         |       ^          ^
+       | TX      | TX    | RX       | RX
+       v         v       |          |
+    +--+--------------------+  +----+----------+
+    |  Unified Audio Intf   |  | Codec DMA     |
+    |  (AIF 0..12)          |  | Interface     |
+    |                       |  | (CIF)         |
+    |  AUD_INTFa block:     |  |               |
+    |  - Serializer (TX)    |  | RDDMA: DDR -> |
+    |  - De-serializer (RX) |  |   internal    |
+    |  - Sync gen/detect    |  |   codec       |
+    |  - Up to 8 data lanes |  | WRDMA: codec  |
+    |  - PCM / TDM / MI2S   |  |   -> DDR      |
+    |  - Near Pad Logic     |  | Up to 16 ch   |
+    +--+--------------------+  +----+----------+
+       |  Lane 0..7 (TX/RX)       |  Parallel bus
+       |  Bit clk + Frame sync    |  + Frame sync
+       v                          v
+    +--+--------+          +------+------+
+    | External  |          | Internal    |
+    | Serial    |          | Digital     |
+    | Peripherals|         | Codec       |
+    | (PCM/TDM/ |          | (Bolero/    |
+    |  MI2S)    |          |  WCD)       |
+    +-----------+          +-------------+
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,shikra-qaif-cpu
+
+  reg:
+    maxItems: 1
+    description: QAIF core registers
+
+  interrupts:
+    maxItems: 1
+    description:
+      QAIF summary interrupt for this Execution Engine. Signals DMA period
+      completion, buffer underflow/overflow, error response, audio interface
+      underflow/overflow, interface-group done, rate detector and VFR events.
+
+  iommus:
+    maxItems: 1
+    description: Phandle to apps_smmu node with sid mask
+
+  dma-coherent: true
+
+  clocks:
+    minItems: 5
+    maxItems: 9
+
+  clock-names:
+    description:
+      The first five clocks are always required. Any further entries are the
+      per-AIF bit clocks (aif_if<N>_ibit), supplied in order starting from
+      AIF interface 0 for as many serial AIF interfaces as the board uses.
+    minItems: 5
+    items:
+      - const: lpass_config
+      - const: lpass_core_axim
+      - const: aud_dma
+      - const: aud_dma_mem
+      - const: bus
+      - const: aif_if0_ibit
+      - const: aif_if1_ibit
+      - const: aif_if2_ibit
+      - const: aif_if3_ibit
+
+  '#sound-dai-cells':
+    const: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+patternProperties:
+  '^aif@[0-9a-f]+$':
+    type: object
+    description:
+      QAIF AIF interface child node for PCM, TDM or MI2S configuration.
+
+    properties:
+      reg:
+        maxItems: 1
+        description:
+          DAI ID of the AIF interface (QAIF_MI2S_AIF* or QAIF_TDM_AIF*).
+
+      dai-format:
+        description: Serial audio interface format (MI2S, TDM or PCM).
+        enum: [i2s, dsp_a, dsp_b]
+
+      dai-tdm-slot-width:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [8, 16, 24, 32]
+        description:
+          Slot width in bits.
+
+      dai-tdm-slot-num:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Number of slots per lane.
+        minimum: 1
+        maximum: 32
+
+      dai-tdm-slot-rx-mask:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        description:
+          Active RX slots, one entry per slot. A nonzero value marks the
+          slot as active.
+        minItems: 1
+        maxItems: 32
+
+      dai-tdm-slot-tx-mask:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        description:
+          Active TX slots, one entry per slot. A nonzero value marks the
+          slot as active.
+        minItems: 1
+        maxItems: 32
+
+      qcom,qaif-aif-lane-map:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        description:
+          Per-lane direction map, one entry per lane starting from lane 0.
+          Use 0 for TX (output/speaker) and 1 for RX (input/mic).
+        minItems: 1
+        maxItems: 8
+        items:
+          enum: [0, 1]
+
+    required:
+      - reg
+      - dai-format
+      - qcom,qaif-aif-lane-map
+
+    if:
+      properties:
+        dai-format:
+          enum: [dsp_a, dsp_b]
+    then:
+      required:
+        - dai-tdm-slot-width
+        - dai-tdm-slot-num
+        - dai-tdm-slot-rx-mask
+        - dai-tdm-slot-tx-mask
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - iommus
+  - clocks
+  - clock-names
+  - '#sound-dai-cells'
+  - '#address-cells'
+  - '#size-cells'
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        qaif_cpu: audio-controller@a000000 {
+            compatible = "qcom,shikra-qaif-cpu";
+            reg = <0x0 0x0a000000 0x0 0x20000>;
+            interrupts = <0 331 4>;
+            iommus = <&apps_smmu 0x1c0 0x0>;
+            clocks = <&gcc 213>,
+                     <&gcc 214>,
+                     <&audiocorecc 15>,
+                     <&audiocorecc 17>,
+                     <&audiocorecc 18>,
+                     <&audiocorecc 5>,
+                     <&audiocorecc 8>,
+                     <&audiocorecc 11>,
+                     <&audiocorecc 14>;
+            clock-names = "lpass_config",
+                          "lpass_core_axim",
+                          "aud_dma",
+                          "aud_dma_mem",
+                          "bus",
+                          "aif_if0_ibit",
+                          "aif_if1_ibit",
+                          "aif_if2_ibit",
+                          "aif_if3_ibit";
+            #sound-dai-cells = <1>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            aif@d7 {
+                reg = <215>;
+                dai-format = "dsp_a";
+                dai-tdm-slot-width = <32>;
+                dai-tdm-slot-num = <2>;
+                dai-tdm-slot-rx-mask = <1 1>;
+                dai-tdm-slot-tx-mask = <1 1>;
+                qcom,qaif-aif-lane-map = <1 0>;
+            };
+        };
+    };
diff --git a/include/dt-bindings/sound/qcom,qaif.h b/include/dt-bindings/sound/qcom,qaif.h
new file mode 100644
index 000000000000..24706efd07d1
--- /dev/null
+++ b/include/dt-bindings/sound/qcom,qaif.h
@@ -0,0 +1,97 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * DAI IDs for the Qualcomm Audio Interface (QAIF) controller.
+ * QAIF_MI2S_AIF* and QAIF_TDM_AIF* values are used in sound-dai
+ * references and as the reg value of aif@N child nodes.
+ * QAIF_CDC_DMA_* values are for sound-dai references only and must
+ * not be used as aif@N child node reg values.
+ */
+#ifndef __DT_QCOM_QAIF_H
+#define __DT_QCOM_QAIF_H
+
+/*
+ * MI2S DAI IDs -- one per physical AIF port in MI2S mode.
+ * Each port supports up to 2 channels (stereo I2S) over a single
+ * data lane sharing a bit clock and frame sync.
+ */
+#define QAIF_MI2S_AIF0		200
+#define QAIF_MI2S_AIF1		201
+#define QAIF_MI2S_AIF2		202
+#define QAIF_MI2S_AIF3		203
+#define QAIF_MI2S_AIF4		204
+#define QAIF_MI2S_AIF5		205
+#define QAIF_MI2S_AIF6		206
+#define QAIF_MI2S_AIF7		207
+#define QAIF_MI2S_AIF8		208
+#define QAIF_MI2S_AIF9		209
+#define QAIF_MI2S_AIF10		210
+#define QAIF_MI2S_AIF11		211
+#define QAIF_MI2S_AIF12		212
+
+/*
+ * TDM DAI IDs -- one per physical AIF port in TDM mode.
+ * Each port supports up to 8 channels over up to 8 independent data
+ * lanes sharing a single bit clock and frame sync.
+ */
+#define QAIF_TDM_AIF0		213
+#define QAIF_TDM_AIF1		214
+#define QAIF_TDM_AIF2		215
+#define QAIF_TDM_AIF3		216
+#define QAIF_TDM_AIF4		217
+#define QAIF_TDM_AIF5		218
+#define QAIF_TDM_AIF6		219
+#define QAIF_TDM_AIF7		220
+#define QAIF_TDM_AIF8		221
+#define QAIF_TDM_AIF9		222
+#define QAIF_TDM_AIF10		223
+#define QAIF_TDM_AIF11		224
+#define QAIF_TDM_AIF12		225
+
+/*
+ * CIF (Codec Interface) RX DAI IDs -- playback to internal codec.
+ * RDDMA channels fetch audio from memory and drain it to the codec.
+ */
+#define QAIF_CDC_DMA_RX0	226
+#define QAIF_CDC_DMA_RX1	227
+#define QAIF_CDC_DMA_RX2	228
+#define QAIF_CDC_DMA_RX3	229
+#define QAIF_CDC_DMA_RX4	230
+#define QAIF_CDC_DMA_RX5	231
+#define QAIF_CDC_DMA_RX6	232
+#define QAIF_CDC_DMA_RX7	233
+#define QAIF_CDC_DMA_RX8	234
+#define QAIF_CDC_DMA_RX9	235
+
+/*
+ * CIF (Codec Interface) TX DAI IDs -- capture from internal codec.
+ * WRDMA channels collect audio from the codec and write it to memory.
+ */
+#define QAIF_CDC_DMA_TX0	236
+#define QAIF_CDC_DMA_TX1	237
+#define QAIF_CDC_DMA_TX2	238
+#define QAIF_CDC_DMA_TX3	239
+#define QAIF_CDC_DMA_TX4	240
+#define QAIF_CDC_DMA_TX5	241
+#define QAIF_CDC_DMA_TX6	242
+#define QAIF_CDC_DMA_TX7	243
+#define QAIF_CDC_DMA_TX8	244
+#define QAIF_CDC_DMA_TX9	245
+
+/*
+ * CIF (Codec Interface) VA TX DAI IDs -- capture from voice activity codec.
+ * WRDMA channels collect audio from the VA codec and write it to memory.
+ */
+#define QAIF_CDC_DMA_VA_TX0	246
+#define QAIF_CDC_DMA_VA_TX1	247
+#define QAIF_CDC_DMA_VA_TX2	248
+#define QAIF_CDC_DMA_VA_TX3	249
+#define QAIF_CDC_DMA_VA_TX4	250
+#define QAIF_CDC_DMA_VA_TX5	251
+#define QAIF_CDC_DMA_VA_TX6	252
+#define QAIF_CDC_DMA_VA_TX7	253
+#define QAIF_CDC_DMA_VA_TX8	254
+#define QAIF_CDC_DMA_VA_TX9	255
+
+#endif /* __DT_QCOM_QAIF_H */
-- 
2.34.1

