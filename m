Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD4647F3AE
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 07:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791961383; cv=none; b=IXwFO8EHwzBv+5LSFSStt/dNwOYOOMFfwU/tBwgNe6T4ScvphgzEmvnNjnQH/ynUFVRRZwudss9ABrCSd9rc7sp5UJ8iL/UWQBbSCvgyc0VhaCwBY1juuVYlQI+rsI3BwqdT6pCd9GJLe8ZuL4a7HJEqClfXaa2FnbS2i6YCEOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791961383; c=relaxed/simple;
	bh=42fA3kbyv7L/WERPBBK3jxCg7uB4lxUsNnUEAf1g6LY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=flzYMiPwxlM5N/FBLZiFtJZLmZBp2JDbw08oGle/ifoCaeahC19tHduhBXOBLOHYY8XShpX8mobDIDzZtV/afBbxZUvLkWJKQMFno2VGRr7ij5p9xNOGhNGbHde5rDSWayvGrSsx0fWrMmYvXd3fpiX7ox29sf3i9hrwaro0VrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B/pxwWfS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eaU634F4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B/pxwWfS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eaU634F4"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E435df2222175
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 07:02:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yz0tN0y6VLuI1y4JV11gW4sPtr+uIZHLZbQYMZWSrr0=; b=B/pxwWfS/sNgW0Np
	IFKb33OsvyAIy0jGaObt04/Pk8epoZ3a/wSmwOAq2l+k+X4KyL9KI4eRG8nxSdwJ
	lfL2/90gtDSJUGKv96cB5LRP73rbHOk6zoBusFNnxyeIUOmZMBadEelqf2q85U72
	AgF0hroOmPYkyzMLLL29tuvjUzOffqG+n6zZZRb2EzCNu64MQR6SODWIfRzpNGCu
	yCRpFJhZcuimJ2l3oEEtVdNHQHwyMLZQ3fkYfx0ZKpnGcQ/Wr9TQfJP/6PO0Rl/x
	m5D5AH8Qi6LmYiatlOvE7XF73GE3DSc0a9oQKs2JgWFfUVkIZ5bQNZSWGQZk3k+z
	Ih6qeQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9txsa8nc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 07:02:59 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a6d30f66c9so4994523a91.0
        for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 00:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791961379; x=1792566179; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yz0tN0y6VLuI1y4JV11gW4sPtr+uIZHLZbQYMZWSrr0=;
        b=eaU634F4sLtKADA6/ILS5qWXYz6zI5eEe6udWn7OJ8Qyb2nn1HpqrBP7JrE2bJ9zSG
         0a6J5Io5UZZqgFJa3qTUPhFzssz/X8k5yIkUQ14bSA5MWDf0ftDB+ZOYHrO27utv8Djn
         2fPC4fPW1DwAOde4mb2O+W1TvEx2Pps/JyR/WlB6NdAi8QWZLeK3O5G8mYqYyV83Iz6a
         KV/C8qnpP2Rkt6EpDG38JW8ILHwzzgDXQVZHbEnQDg+91MaWFwmjD3Og6IMprJcanUv3
         rqxH9U3vWnOUUu46uuX49I6laIiL62dl7vVOBVXgTyT2RCP9OQXqcGNftS0OmCsUZNBR
         tbmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791961379; x=1792566179;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yz0tN0y6VLuI1y4JV11gW4sPtr+uIZHLZbQYMZWSrr0=;
        b=t0RZjFHctIwwmXPCd9AzQ8JZhn8GZ+rC6HNclho7a90aI2ZCHTHGWCZr+XVBhPQWPX
         xKP0KR74+kZSHh9y41djOJS7M+QfIFI656BtBVD3ao2jp4bNZThhA5BhWPcL453918I6
         uu6tb5a6tJhysaLR5P+yBPU6/QzHnTIoDXtBX00p/DZRNqaL5v0/eaFoTLskbvd4kAE8
         tMn2XQcBUKRni+DGolaXH1Ct3SvHQHGH8qE498CVTEaNa3R1WZCUDNlSNiyLSskw3Q40
         wkmkry93Gh4BnXsvwGIka48sC8bEXLgigWjGPWrISvWztFUJAnChZQYwQQYLIeyPx3Xf
         p7LA==
X-Forwarded-Encrypted: i=1; AKwUvBxSQJN+fAtHaKQrXlDSikf8xU6zqPMSJcUZsNY06XBq58eyp7tgLP4TckpNaWjN6PEopzS6jXmelVLPHw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLGWZKQQ/21/uR4WS6/x/RZsbfcQpIPqaHds0NIJT3QXwGp14xa
	4UiuwGyhAoFw++8waP+IK7TsKM5H1MGUsiLrxMq3IrwTAky3xX54fzn6Eh7n+Ce6xvEIcmpLVjj
	jL8Z8cLV8aYWMkcTukDB7OKT76zDxW1otCDIRidt/qoY0n6v4juRxLnBXQLmGhrzatQ==
X-Gm-Gg: AYBFou1BkV8l0W3MACr7va81ebkwEwU5+mPYxTPX4fnoet8huCGGaR5d7AahAJ/DCrg
	fv+MhW7fXzGzMJYUB3UhL+2mvFDE37NMpgCPeG6lxTcTKcV6nnu97v9GSmtrrhPFwoYwmTTIn17
	RhpyZKkmVPIka504bP1hO+MNGsN7rRn6vDDrHPfsImCvH7Ve1GHaAECirFbu4pwP03vzhXX0M4t
	djd2wkuSFxH5mCguvjPIyuUpDXjQ1CMoFbE6oxZGv9kAHWmnc4MrC4R5EC7uwLgF0QKn9b59EdH
	gpKb2HyLJ11ALBi3qDEoSjQkxmc/E4CgFPCgiWoxFEGqsVduM3PE4yu9dFJZ6sB0Souc3Nl5EoD
	SsKyieAVpfI3n9CQh8ZnN0KnCOiI=
X-Received: by 2002:a17:90b:4b82:b0:3ab:a09c:f858 with SMTP id 98e67ed59e1d1-3aba09d4a0cmr6031983a91.33.1791961378407;
        Wed, 14 Oct 2026 00:02:58 -0700 (PDT)
X-Received: by 2002:a17:90b:4b82:b0:3ab:a09c:f858 with SMTP id 98e67ed59e1d1-3aba09d4a0cmr6031894a91.33.1791961376175;
        Wed, 14 Oct 2026 00:02:56 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac752d590csm1306401a91.2.2026.10.14.00.02.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 00:02:55 -0700 (PDT)
Message-ID: <a188f159-6569-42de-8170-5d1a212f2970@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 12:32:47 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 01/10] ASoC: dt-bindings: qcom,shikra-qaif-cpu: Add
 binding
To: Harendra Gautam <harendra.gautam@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        ajay.nandam@oss.qualcomm.com
References: <20261013-b4-qaif-shikra-audio-v9-0-f3022e28f2fd@oss.qualcomm.com>
 <20261013-b4-qaif-shikra-audio-v9-1-f3022e28f2fd@oss.qualcomm.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261013-b4-qaif-shikra-audio-v9-1-f3022e28f2fd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAyNyBTYWx0ZWRfX0y/nfAdJJ+v6
 QXNcTqkeb3jSKHr/KyCyknQOkl29EzWTUx2IWXgOPksEeBtRXSwSH3C653fZkR7P9br/mYxgVtc
 7VunuIiW/pg3Z6+OMvFfTvHkdQ0S8xM1AhJenozC7vqIG2U3saoS1aFe7V3p7OQDNjMmBQzeRkh
 geDyLTYRBb98h7SNzjueKTLPN36Iuo0eKq9j7HuXQSAQW5Ur5oBr0ZoBgTkYwt15YwzzWRP1QVn
 TFjIJV4kE3Ri5VyCQzwdWJ+WmcsK4VshIfSQl4hFH/6oFqqi7LgeK0hljHYGl24H5nxiOrinsIN
 9oaPciARMpXgoT4TDrNWoH6LiDZR0heYfOl9RYCb5Xvs9OKVbvYcTQTwsGpsD/lXvGu51rbKO4i
 IHm2mIvX4jGNFNscIsIYe2Cdb/WOQYZpkBLEDHP4laE2jO/zMhwaLHJhBzNoV3tBENRs95ItEBs
 ted/YaRGVeMu+Do0PPg==
X-Authority-Analysis: v=2.4 cv=LPPz05W9 c=1 sm=1 tr=0 ts=6acf2923 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=hxzmZBCRppx9FJjG9dUA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAyNyBTYWx0ZWRfXzGVQQ/moSDcY
 nBjHn0HyiQlDkJU5O4B0gyZidb1URMysVYT6Ga8273VRYsmJQ40AIv0WA7I6W9zy9suX/kwHDze
 PlyJMco6sWtprzFsBAmYetrP0XJQlwQ=
X-Proofpoint-ORIG-GUID: BDXECKjo04CxBDvuzUR8zBL6xfCXS_FS
X-Proofpoint-GUID: BDXECKjo04CxBDvuzUR8zBL6xfCXS_FS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140027



On 10/13/2026 11:21 AM, Harendra Gautam wrote:
> Add the Devicetree binding for the Qualcomm Audio Interface (QAIF) CPU DAI
> controller used on the Shikra audio platform.
> 
> QAIF routes audio between system memory, external PCM/TDM/MI2S serial
> interfaces and the internal Bolero/WCD codec. Platform Devicetree files
> need a binding to describe the controller resources, DAI cells and per-
> interface AIF configuration, and named constants to avoid raw numeric IDs
> in sound-dai references and child-node reg values.
> 
> Describe the MMIO region, interrupt, clocks, DMA IOMMU mapping and
> aif-interface child nodes required by the controller.
> 
> Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>

LGTM

Reviewed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>

> ---
>   .../bindings/sound/qcom,shikra-qaif-cpu.yaml       | 290 +++++++++++++++++++++
>   1 file changed, 290 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,shikra-qaif-cpu.yaml b/Documentation/devicetree/bindings/sound/qcom,shikra-qaif-cpu.yaml
> new file mode 100644
> index 000000000000..acca6f617751
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/qcom,shikra-qaif-cpu.yaml
> @@ -0,0 +1,290 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/qcom,shikra-qaif-cpu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Audio Interface (QAIF) CPU DAI Controller
> +
> +maintainers:
> +  - Harendra Gautam <harendra.gautam@oss.qualcomm.com>
> +
> +description: |
> +  The Qualcomm Audio Interface (QAIF) is a fully configurable DMA-based
> +  audio subsystem controller. It serialises and deserialises PCM audio
> +  between system memory and external serial audio peripherals (PCM, TDM,
> +  I2S, MI2S) through the AIF path, and transfers parallel audio between
> +  memory and an internal WCD codec through the CIF path.
> +
> +  AIF (Audio Interface): up to 13 multi-lane Unified Audio Interfaces,
> +  each supporting up to 8 independent data lanes. Each lane is individually
> +  configurable as TX (output/speaker) or RX (input/mic). All lanes of an
> +  interface share a single bit clock and frame sync. Supported modes are
> +  PCM (short/long sync), TDM, and MI2S (stereo/mono). Per-interface
> +  configuration includes sync source (master/slave), sync mode, sync delay,
> +  sync inversion, slot width (8/16/24/32-bit), sample width, active slot
> +  masks (up to 32 slots), bits-per-lane frame size, lane enable/direction
> +  masks, loopback, output-enable control, and full-cycle path support for
> +  long chip-to-chip connections.
> +
> +  CIF (Codec Interface): up to 10 RDDMA (playback) and 10 WRDMA (capture)
> +  channels connecting to an internal codec over a parallel bus. Each channel
> +  supports active-channel enable mask (up to 16 channels), frame-sync
> +  selection, frame-sync delay, frame-sync output gating, dynamic clock
> +  gating, and 16-bit packing/unpacking.
> +
> +  Note on RX/TX naming convention: in QAIF, TX refers to the output
> +  (speaker/playback) direction and RX refers to the input (mic/capture)
> +  direction. This applies to both AIF lane directions and CIF slot/mask
> +  properties.
> +
> +  DMA engine: RDDMA fetches audio from DDR/TCM/LPM into a shared SRAM
> +  latency buffer (SHRAM) and drains it to the interface. WRDMA collects
> +  data from the interface into SHRAM and writes it to memory. Each DMA
> +  owns a private SHRAM region defined by start address and length registers.
> +  Burst sizes of 1/2/4/8/16 beats (64-bit) are supported with up to 4
> +  outstanding transactions per DMA. Two QSB master ports (QXM0 for TCM,
> +  QXM1 for DDR/LPM) provide the memory interface.
> +
> +  Resources are partitioned among up to 5 Execution Engines (EEs) via
> +  EE map registers. Each EE owns a set of DMAs, audio interfaces, and
> +  interface groups, and receives its own independent interrupt output.
> +  The interrupt hierarchy has a two-level structure: a summary register
> +  identifies the event class (DMA period, underflow/overflow, error
> +  response, audio interface underflow/overflow, group done, rate detector,
> +  VFR), and per-resource status registers identify the specific channel.
> +
> +  Interface grouping (bonding) allows up to 6 groups of audio and codec
> +  interfaces to start synchronously and align their DMA period interrupts
> +  within half a frame duration using the RDDMA padding feature.
> +
> +  Two rate detector blocks measure the frequency of incoming frame sync or
> +  word select signals and generate interrupts on rate change, undetected
> +  rate, or sync timeout.
> +
> +  Block diagram::
> +
> +    System Memory (DDR / LPM / TCM)
> +    +---------------------------------+
> +    |  Circular Buffers (ping-pong)   |
> +    +----------+----------+-----------+
> +               |          ^
> +         64-bit AXI  64-bit AXI
> +               |          |
> +    +----------v----------+-----------+
> +    |        QSB Master Ports         |
> +    |  +----------+  +----------+     |
> +    |  |   QXM0   |  |   QXM1   |     |
> +    |  +----+-----+  +-----+----+     |
> +    +-------|--------------|----------+
> +            |              |
> +    +-------v--------------v----------+
> +    |         Shared RAM (SHRAM)       |
> +    |  +------------+  +------------+ |
> +    |  | QXM0 Read  |  | QXM0 Write | |
> +    |  | SHRAM      |  | SHRAM      | |
> +    |  +------------+  +------------+ |
> +    |  +------------+  +------------+ |
> +    |  | QXM1 Read  |  | QXM1 Write | |
> +    |  | SHRAM      |  | SHRAM      | |
> +    |  +------------+  +------------+ |
> +    +---+--------+--------+-------+---+
> +        |        |        |       |
> +    +---v--+  +--v---+ +--v---+ +-v----+
> +    |RDDMA |  |RDDMA | |WRDMA | |WRDMA |
> +    | AIF  |  | CIF  | | AIF  | | CIF  |
> +    |[0..n]|  |[0..n]| |[0..n]| |[0..n]|
> +    +--+---+  +--+---+ +--+---+ +-+----+
> +       |         |       ^          ^
> +       | TX      | TX    | RX       | RX
> +       v         v       |          |
> +    +--+--------------------+  +----+----------+
> +    |  Unified Audio Intf   |  | Codec DMA     |
> +    |  (AIF 0..12)          |  | Interface     |
> +    |                       |  | (CIF)         |
> +    |  AUD_INTFa block:     |  |               |
> +    |  - Serializer (TX)    |  | RDDMA: DDR -> |
> +    |  - De-serializer (RX) |  |   internal    |
> +    |  - Sync gen/detect    |  |   codec       |
> +    |  - Up to 8 data lanes |  | WRDMA: codec  |
> +    |  - PCM / TDM / MI2S   |  |   -> DDR      |
> +    |  - Near Pad Logic     |  | Up to 16 ch   |
> +    +--+--------------------+  +----+----------+
> +       |  Lane 0..7 (TX/RX)       |  Parallel bus
> +       |  Bit clk + Frame sync    |  + Frame sync
> +       v                          v
> +    +--+--------+          +------+------+
> +    | External  |          | Internal    |
> +    | Serial    |          | Digital     |
> +    | Peripherals|         | Codec       |
> +    | (PCM/TDM/ |          | (Bolero/    |
> +    |  MI2S)    |          |  WCD)       |
> +    +-----------+          +-------------+
> +
> +allOf:
> +  - $ref: dai-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,shikra-qaif-cpu
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +    description:
> +      QAIF summary interrupt for this Execution Engine.
> +
> +  iommus:
> +    maxItems: 1
> +
> +  dma-coherent: true
> +
> +  clocks:
> +    maxItems: 9
> +
> +  clock-names:
> +    description:
> +      Core clocks for register access and DMA, followed by one bit
> +      clock per AIF interface.
> +    items:
> +      - const: lpass_config
> +      - const: lpass_core_axim
> +      - const: aud_dma
> +      - const: aud_dma_mem
> +      - const: bus
> +      - const: aif_if0_ibit
> +      - const: aif_if1_ibit
> +      - const: aif_if2_ibit
> +      - const: aif_if3_ibit
> +
> +  '#sound-dai-cells':
> +    const: 1
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +patternProperties:
> +  '^aif@[0-9a-f]+$':
> +    type: object
> +    description:
> +      QAIF AIF interface child node for PCM, TDM or MI2S configuration.
> +
> +    allOf:
> +      - $ref: /schemas/sound/tdm-slot.yaml#
> +
> +    properties:
> +      reg:
> +        maxItems: 1
> +        description:
> +          DAI ID of the AIF interface (QAIF_MI2S_AIF* or QAIF_TDM_AIF*).
> +
> +      dai-format:
> +        description: Serial audio interface format (MI2S, TDM or PCM).
> +        enum: [i2s, dsp_a, dsp_b]
> +
> +      dai-tdm-slot-width:
> +        enum: [8, 16, 24, 32]
> +
> +      dai-tdm-slot-num:
> +        minimum: 1
> +        maximum: 32
> +
> +      dai-tdm-slot-rx-mask:
> +        minItems: 1
> +        maxItems: 32
> +
> +      dai-tdm-slot-tx-mask:
> +        minItems: 1
> +        maxItems: 32
> +
> +      qcom,qaif-aif-lane-map:
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        description:
> +          Per-lane direction map, one entry per lane starting from lane 0.
> +          Use 0 for TX (output/speaker) and 1 for RX (input/mic).
> +        minItems: 1
> +        maxItems: 8
> +        items:
> +          enum: [0, 1]
> +
> +    required:
> +      - reg
> +      - dai-format
> +      - qcom,qaif-aif-lane-map
> +
> +    if:
> +      properties:
> +        dai-format:
> +          enum: [dsp_a, dsp_b]
> +    then:
> +      required:
> +        - dai-tdm-slot-width
> +        - dai-tdm-slot-num
> +        - dai-tdm-slot-rx-mask
> +        - dai-tdm-slot-tx-mask
> +
> +    unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - iommus
> +  - clocks
> +  - clock-names
> +  - '#sound-dai-cells'
> +  - '#address-cells'
> +  - '#size-cells'
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        qaif_cpu: audio-controller@a000000 {
> +            compatible = "qcom,shikra-qaif-cpu";
> +            reg = <0x0 0x0a000000 0x0 0x20000>;
> +            interrupts = <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>;
> +            iommus = <&apps_smmu 0x1c0 0x0>;
> +            clocks = <&gcc 213>,
> +                     <&gcc 214>,
> +                     <&audiocorecc 15>,
> +                     <&audiocorecc 17>,
> +                     <&audiocorecc 18>,
> +                     <&audiocorecc 5>,
> +                     <&audiocorecc 8>,
> +                     <&audiocorecc 11>,
> +                     <&audiocorecc 14>;
> +            clock-names = "lpass_config",
> +                          "lpass_core_axim",
> +                          "aud_dma",
> +                          "aud_dma_mem",
> +                          "bus",
> +                          "aif_if0_ibit",
> +                          "aif_if1_ibit",
> +                          "aif_if2_ibit",
> +                          "aif_if3_ibit";
> +            #sound-dai-cells = <1>;
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            aif@b5 {
> +                reg = <181>;
> +                dai-format = "dsp_a";
> +                dai-tdm-slot-width = <32>;
> +                dai-tdm-slot-num = <2>;
> +                dai-tdm-slot-rx-mask = <1 1>;
> +                dai-tdm-slot-tx-mask = <1 1>;
> +                qcom,qaif-aif-lane-map = <1 0>;
> +            };
> +        };
> +    };
> 

