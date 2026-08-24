Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DEA83E49EC;
	Mon, 24 Aug 2026 06:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787553407; cv=none; b=JddLyT4T4yTGSRQ3EhzvSZxHb8FprDc/ZiSsQxfpM9EczAXh++xuQ9HsV6dApPo/5bibVHDYgfHJ7UwmEQxtSvEXmlDcp6tBpCeDn7IrnRrEzEz1O+IfB078JCxeLkxJIlInoo1wDkONE7sjnWgz1Jg0et5LW3+vxKE132x6n+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787553407; c=relaxed/simple;
	bh=nFga7hRn9jZ6IHj69C/oqXrGUbgs/U2JRwtV1yV76cw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sTVNsDG31wemOKwru7MDHlqwYy0XIBUcnHgDmcgnCyrOkRU94C7QkCLm5Goj7LqzA42VSRwZkDf5TLM2phCUdQXcltgT/RPblSRlZJeq62hneRgpwmVI86uz+n1uc6dhLlcI4vygYcJNGwJbMHaXyU5BoOFF4Oz778QqrEQ6VOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m6vJx6mX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m6vJx6mX"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O6SgLu1982554;
	Mon, 24 Aug 2026 06:36:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=I1VwMFLnXDvQWWjyZ2gTdt+dTge3WCQfyrz
	4qEIa4xo=; b=m6vJx6mXubhtdT5xL21k2LTZLRQjyzwesijKXw51EW0dSDke6dj
	+KYuWoWiAkXLA9hKEf1RKL87ZiZ/G1hnYhbPVicGWL2EmSEc7cph2P/jFrL3zF2s
	jc+Ghf60J/mKjYP65YzGLXwRtkugouX0bqFR36WzgwR8jQ8WEKr/8VhzcFMv2qqW
	GqR3f8+8wspKcVH4w6hdA7xnoEQPjgrkZfkoEYLYeqVdbAmp9fDa4aQOzlRza6Cs
	6KT+LSZ2C8+LwELIw/61sWq1hdiSJUBZpF8aWD4G/HIH48nkPW3yUQ7d7Y4jziQ1
	FNc4CM+rtQc9Z31s/oVVJ+yB1J/1UdYikyA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8gqn811t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Aug 2026 06:36:34 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 67O6aUEe015369;
	Mon, 24 Aug 2026 06:36:30 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 4g74uj2h5m-1;
	Mon, 24 Aug 2026 06:36:30 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67O6aUCC015364;
	Mon, 24 Aug 2026 06:36:30 GMT
Received: from hu-hgautam-hyd.qualcomm.com (hu-hgautam-hyd.qualcomm.com [10.147.247.91])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 67O6aUFA015360;
	Mon, 24 Aug 2026 06:36:30 +0000 (GMT)
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
Subject: [PATCH v3 0/9] ASoC: qcom: Add QAIF driver for Shikra audio platform
Date: Mon, 24 Aug 2026 12:06:18 +0530
Message-Id: <20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA1NyBTYWx0ZWRfXwSfSDZhipdG0
 PlK3QJekhFyss71D6rnYMp7RbHJ3d7Y0fq7/+fSBbTqCYjkK1PppYnOO3aDDiAgqLOE6rQQeWTK
 nymVBc5MkMHVhYAHXLWNT4ipMNf3xeQ=
X-Proofpoint-GUID: QEI05qPIQTPsy8rJANUD-YNc44w_sBZi
X-Authority-Analysis: v=2.4 cv=fqXsol4f c=1 sm=1 tr=0 ts=6a8be672 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=mozLen7prrU2POJ6mtoA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA1NyBTYWx0ZWRfX8vTneXM2Ueqa
 1iejopnL6D41aO5JtxPvolIuxEpWmxRDcNHhk5adKG9tD9dG2Xc76Snkg22OXrGLEzAeQYMXaRM
 1rFkyu2K7G3hLPT0izcYbebFcTm2WoAPZDUdpkqK0noN+1St7/mmH5rEa2LQJ+tjRczxEARxhoo
 m5AtqCkObmnmew91rpyvApCqQtDWiDnJyNjEjag2h9w9FxTFCr7EiPdkit82YDPYkxXJN/Sbk1Z
 mNk70Zj9UKqPr3MLv3gZAviNgXp/hfaVyEZHuZLJb/+3z1bVrZbxTftrks+WfsPR4HDSp8zh9bO
 epQ2qdkx7nkyznqSHRO0wrJFdj4LhdKp9fE/ndh53p9886p7ogIg1nwburb1Twfk+0UH3rz/1mo
 4mslYd1Qb4o/IOepOH/+hVr+fnX4acPUz5+hW1BS4ZxNSqWldKt14CzzqNSJN+kOiZKAQugnfdv
 KnLaqGuWC88vLNws3HA==
X-Proofpoint-ORIG-GUID: QEI05qPIQTPsy8rJANUD-YNc44w_sBZi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1011
 spamscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240057


Hardware IP Overview
====================
QAIF (Qualcomm Audio Interface) is a fully configurable DMA-based audio
subsystem used to transmit and receive audio data over serial audio
interfaces (PCM, TDM, MI2S) and to provide a DMA interface for internal
codec connections. It manages two independent data paths:

  Unified Audio Interface (AIF): Serialises and deserialises PCM audio
  between system memory and external serial audio peripherals. Each
  interface supports up to 8 independent data lanes, each configurable
  as TX (speaker) or RX (mic). All lanes of an interface share a single
  bit clock and frame sync. The AUD_INTFa hardware block controls the
  serial protocol -- sync source (master/slave), sync mode (short/long
  PCM, TDM, MI2S), sync delay and inversion, slot and sample widths,
  active slot masks, lane enable/direction, mono/stereo mode and
  full-cycle path support for long chip-to-chip connections.

  Codec DMA Interface (CIF): Provides a parallel DMA interface to the
  internal Bolero digital codec. The RDDMA path carries playback data
  to Bolero and the WRDMA path carries capture data from Bolero. Each
  channel has an INTF_CFG register controlling the active channel enable
  mask, frame-sync selection, frame-sync delay, frame-sync output gating,
  dynamic clock gating and 16-bit packing/unpacking.

  DMA Engine: Read DMAs (RDDMA) fetch audio from DDR/TCM/LPM into a
  shared on-chip SRAM latency buffer (SHRAM) and drain it to the
  interface. Write DMAs (WRDMA) collect data from the interface into
  SHRAM and write it to memory. Each DMA channel owns a private SHRAM
  region. Two QSB master ports (QXM0 and QXM1) provide the memory
  fabric. Burst sizes of 1/2/4/8/16 beats and up to 4 outstanding
  transactions per DMA are supported.

  Execution Environments (EE): Resources (DMAs, audio interfaces,
  interface groups) are partitioned among up to 5 EEs via map registers.
  Each EE receives an independent interrupt output. The interrupt
  hierarchy has two levels: a summary register identifies the event class
  (DMA period, underflow/overflow, error response, AUD_INTF
  underflow/overflow, group done, rate detector, VFR), and per-resource
  status registers identify the specific channel and event type.

  Interface Grouping (Bonding): Multiple AIF and CIF interfaces can be
  bonded into a group to start synchronously and align their DMA period
  interrupts within half a frame duration using the RDDMA padding feature.

  Rate Detector: Two rate detector blocks measure the frequency of
  incoming frame sync or word select signals and generate interrupts on
  rate change, undetected rate or sync timeout.

Block Diagram
=============

  System Memory (DDR / LPM / TCM)
  +---------------------------------+
  |  Circular Buffers (ping-pong)   |
  +----------+----------+-----------+
             |          ^
       64-bit AXI  64-bit AXI
             |          |
  +----------v----------+-----------+
  |        QSB Master Ports         |
  |  +----------+  +----------+     |
  |  |   QXM0   |  |   QXM1   |     |
  |  +----+-----+  +-----+----+     |
  +-------|--------------|----------+
          |              |
  +-------v--------------v----------+
  |         Shared RAM (SHRAM)       |
  |  +------------+  +------------+ |
  |  | QXM0 Read  |  | QXM0 Write | |
  |  | SHRAM      |  | SHRAM      | |
  |  +------------+  +------------+ |
  |  +------------+  +------------+ |
  |  | QXM1 Read  |  | QXM1 Write | |
  |  | SHRAM      |  | SHRAM      | |
  |  +------------+  +------------+ |
  +---+--------+--------+-------+---+
      |        |        |       |
  +---v--+  +--v---+ +--v---+ +-v----+
  |RDDMA |  |RDDMA | |WRDMA | |WRDMA |
  | AIF  |  | CIF  | | AIF  | | CIF  |
  |[0..n]|  |[0..n]| |[0..n]| |[0..n]|
  +--+---+  +--+---+ +--+---+ +-+----+
     |         |       ^          ^
     | TX      | TX    | RX       | RX
     v         v       |          |
  +--+--------------------+  +----+----------+
  |  Unified Audio Intf   |  | Codec DMA     |
  |  (AIF 0..12)          |  | Interface     |
  |                       |  | (CIF)         |
  |  AUD_INTFa block:     |  |               |
  |  - Serializer (TX)    |  | RDDMA: DDR -> |
  |  - De-serializer (RX) |  |   internal    |
  |  - Sync gen/detect    |  |   codec       |
  |  - Up to 8 data lanes |  | WRDMA: codec  |
  |  - PCM / TDM / MI2S   |  |   -> DDR      |
  |  - Near Pad Logic     |  | Up to 16 ch   |
  +--+--------------------+  +----+----------+
     |  Lane 0..7 (TX/RX)       |  Parallel bus
     |  Bit clk + Frame sync    |  + Frame sync
     v                          v
  +--+--------+          +------+------+
  | External  |          | Internal    |
  | Serial    |          | Digital     |
  | Peripherals|         | Codec       |
  | (PCM/TDM/ |          | (Bolero/    |
  |  MI2S)    |          |  WCD)       |
  +-----------+          +-------------+

Software Design
===============
The driver follows the standard ALSA SoC split:

  qaif-cpu.c: CPU DAI component. Manages clocks, implements DAI ops
  (startup/shutdown/hw_free/hw_params/trigger) for both AIF and CIF
  paths using direct regmap_update_bits() calls with address macros from
  qaif-reg.h, registers an of_xlate_dai_name callback so that sound-dai
  references using non-sequential DAI IDs resolve correctly, and parses
  per-interface AIF configuration from DT child nodes. AIF child nodes
  use standard properties (dai-format, dai-tdm-slot-*, qcom,qaif-aif-
  lane-map) without a compatible string; the protocol is identified by
  dai-format and set_fmt() is called by the machine driver.

  qaif-platform.c: PCM platform component. Handles DMA buffer allocation
  (dma_alloc_pages()), PCM ops (open/close/hw_params/prepare/trigger/
  pointer/mmap/copy), table-driven two-level IRQ dispatch with
  period-elapsed notification, and component suspend/resume across power
  collapse.

  qaif-shikra.c: Shikra SoC-specific variant descriptor. Provides
  register base addresses, DMA channel counts, SHRAM geometry, clock
  names and the DAI driver array. This abstraction keeps the core driver
  portable across future QAIF integrations.

  qaif.h / qaif-reg.h: Shared data structures, constants and the complete
  MMIO register address map consumed by both the CPU and platform drivers.

  soc-core.c: This series adds snd_soc_of_xlate_dai_name() as a generic
  ASoC helper that resolves a sound-dai phandle argument to a DAI name by
  searching the component DAI list by ID. Both lpass-cpu.c and qaif-cpu.c
  assign it directly as .of_xlate_dai_name, removing their private
  implementations.

The series is split by functionality to aid review -- register map and
data structures first, then CPU DAI ops with regmap and DT parsing, the
of_xlate helper, PCM ops, IRQ handling and finally the Shikra variant
glue.

Link to v2:
  https://lore.kernel.org/lkml/20260701105757.2779738-1-harendra.gautam@oss.qualcomm.com/
Link to v1:
  https://lore.kernel.org/lkml/20260605103739.3557573-1-harendra.gautam@oss.qualcomm.com/

Changes in v3:
  - series restructured: replace regmap_field abstraction with direct
    regmap_update_bits(); merge CIF/AIF DAI ops and regmap/DT/init into
    single CPU DAI patch; move of_xlate_dai_name to soc-core.c (was
    qcom/common.c); split Shikra variant into qaif-shikra.c; add
    Kconfig/Makefile and MAINTAINERS entries
  - binding: rename aif-interface@N to aif@N; remove compatible from
    child nodes; replace custom qcom,qaif-aif-sync-*/qcom,qaif-aif-lane-*
    properties with standard dai-format and dai-tdm-slot-*; fix example
    to aif@d7/reg=<215>; allow hex unit addresses; fix CIF channel count
    to 10; clarify QAIF_CDC_DMA_* IDs are sound-dai references only
  - qcom,qaif.h: replace QAIF_MI2S_TDM_AIF0..12 with separate
    QAIF_MI2S_AIF* (200-212) and QAIF_TDM_AIF* (213-225); renumber CIF
    IDs to RX (226-235), TX (236-245), VA_TX (246-255)
  - qaif.h: add qaif_ prefix to is_cif_dma_port() and new is_mi2s_port(),
    is_tdm_port(), is_aif_port() helpers; add QAIF_MI2S_SLOTS; add
    comments on smmu_csid_bits and ee fields
  - qaif-reg.h: rename CODEC_ prefix to CDC_; rename UF/OF IRQ macros;
    add _REG suffix to CDC debug/status macros
  - qaif-cpu.c: fix MI2S sync config per HPG; replace custom sync/lane
    DT properties with set_fmt()/set_tdm_slot() DAI ops; replace
    clk_prepare/clk_enable pairs with clk_prepare_enable; remove codec
    DAI set_tdm_slot/set_sysclk from hw_params(); use devm unwind
  - qaif-shikra.c: new file; separate MI2S and TDM DMA maps; restrict
    MI2S formats to S16|S32; widen TDM AIF constraints; rename VA DAI
    names to "CDC DMA VA_TX*"
  - soc-core.c: move of_xlate_dai_name helper from qcom/common.c to
    soc-core.c as snd_soc_of_xlate_dai_name() generic ASoC helper
  - lpass-cpu.c: remove local xlate wrapper; use snd_soc_of_xlate_dai_name()
  - qaif-platform.c: move dma_set_mask_and_coherent() to probe; fix IRQ
    dispatch READ_ONCE() race; add synchronize_irq() via .sync_stop;
    always proceed to IRQ_DISABLE in trigger(STOP) if dynclk fails

Changes in v2:
  - Rename YAML file to qcom,qaif-cpu.yaml, add qcom,qaif-cpu compatible
  - Merge DAI ID header into binding patch, drop _clk suffix from
    clock-names, add enum constraints, remove status: true (Krzysztof)
  - Fix dt_binding_check failure in binding example (Rob)
  - Fix IRQ storm: client status register bitmask missing BIT(16)
  - Fix race: use test_and_set_bit for DMA bitmap allocation
  - Fix regmap_config: use non-const with dynamic max_register
  - Use dev_err_probe() in probe path, sizeof(*var) in kzalloc (Krzysztof)
  - Add kerneldoc for all EXPORT_SYMBOL_GPL functions (Krzysztof)
  - Use goto-based error cleanup in pcmops_open()
  - Move MAINTAINERS entry to last patch (Krzysztof)
  - Add shared asoc_qcom_of_xlate_dai_name() helper used by lpass-cpu
    and qaif-cpu
  - Fix checkpatch --strict warnings and alignment issues

Harendra Gautam (9):
  ASoC: dt-bindings: qcom,qaif-cpu: Add binding
  ASoC: qcom: Add QAIF shared data structures and variant interface
  ASoC: qcom: Add QAIF hardware register map
  ASoC: qcom: Add QAIF CPU DAI ops, regmap, DT parsing and platform init
  ASoC: soc-core: Add snd_soc_of_xlate_dai_name() generic helper
  ASoC: qcom: Add QAIF PCM operations
  ASoC: qcom: Add QAIF IRQ handling, suspend/resume and platform
    register
  ASoC: qcom: Add Shikra QAIF support
  MAINTAINERS: Add Qualcomm QAIF driver entry

 .../bindings/sound/qcom,qaif-cpu.yaml         | 307 ++++++
 MAINTAINERS                                   |  10 +
 include/dt-bindings/sound/qcom,qaif.h         |  97 ++
 include/sound/soc.h                           |   3 +
 sound/soc/qcom/Kconfig                        |  10 +
 sound/soc/qcom/Makefile                       |   3 +
 sound/soc/qcom/lpass-cpu.c                    |  23 +-
 sound/soc/qcom/qaif-cpu.c                     | 877 ++++++++++++++++
 sound/soc/qcom/qaif-platform.c                | 935 ++++++++++++++++++
 sound/soc/qcom/qaif-reg.h                     | 458 +++++++++
 sound/soc/qcom/qaif-shikra.c                  | 425 ++++++++
 sound/soc/qcom/qaif.h                         | 302 ++++++
 sound/soc/soc-core.c                          |  33 +
 13 files changed, 3461 insertions(+), 22 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,qaif-cpu.yaml
 create mode 100644 include/dt-bindings/sound/qcom,qaif.h
 create mode 100644 sound/soc/qcom/qaif-cpu.c
 create mode 100644 sound/soc/qcom/qaif-platform.c
 create mode 100644 sound/soc/qcom/qaif-reg.h
 create mode 100644 sound/soc/qcom/qaif-shikra.c
 create mode 100644 sound/soc/qcom/qaif.h

-- 
