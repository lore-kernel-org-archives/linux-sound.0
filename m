Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012027.outbound.protection.outlook.com [40.107.209.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389C423909F;
	Fri,  3 Apr 2026 00:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775176849; cv=fail; b=gKHlzJp3bmLH3ysAYHbqmSVPaMbrtGzatYT4fU2hQkkWxaQ1k51ClPthCVTYTTPz43GZ60uqnzAt60jvjuTlGcRlk7hW58aYz/D8Zf1pV4homCuxBmFk1LQOTPx480sqTKJgd6sy2sbgmXRGhKVBLjsbC5IkWgHlfJeQRSJd6JY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775176849; c=relaxed/simple;
	bh=dRroiWnTGNYZ7nvtghnYhqKhXLdl3uFwu/TmhvjR+Ko=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=UDqSuCeX+gw7onKCE7LV1p+r5C3ZFA41ye2hdKCdI4Jg9Lh7WKcqZWPD3Dw2tIS1sbf7FdHFu+VO1WYYmv0BlxJhnvMRJfP+owhLGKHTOiBobaPGGRelESMgagnGhO2mIDZKPcqCllLJxJMwV2gTNO2iAwifSkGw1DeZUTgriiE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Bqk4Bo0j; arc=fail smtp.client-ip=40.107.209.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Bqk4Bo0j"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oojG7pckH8PIAtgSJIXjE7h/MHqlIE1mVdUdaXJfgF+Vkbu4o9irqm32MYVjLTdxLzo3xKFCj1KCcseN/6NzNHqih99AHtujHEoXGvyOIrGW6Uc1TCK1ySSq52Lb1oC2yeQm+18s2JH/+USgzo7ZZBcEIkq7sxIJsLnXgcRh2F+5Rq8yG22w8wpetIwUGgYw2XvcGQCUIqEen+rJ1tEOExGBLPFfcniHjRL9z0jfUSRpcys7Wf3GLf1EME527FwiTs/PG4wCq8uojnDvgZDB52a5qWXIjyx/8QHeEcoy/b6mxVk84DBo4uo/suJRDaBBoEozuKsxUATb8aib/k5QVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6+srbgzonUr8PiL5MI1aBxuMJqLYzRFLO6q1HQjEd5c=;
 b=WX5bbDcARzrxEsz0IOQFJvOmNqBBFTWMtavW3nywFpGEEBVlWTORkdedWA8cbJU7TJBuIGXfWcp5/w49xaFh1nsoNudK3D3FRh4LXMS5J/HWulpece7xwzjgZHOJP0TBbf/32OPBnKOodW7jhaaH3y8gy7Hb0AjnDECNNx/VHBeeVyWSCf5AxTE9Mb/v5dm9x0K7vpKzXyHnWZCdWrpni2xpkZOXi+Ez+BsJYMy6muZShCRYx6N68ztXPDS7H80+72MBs+fQewULaw8Ow6C1xltbG6YfBYLjhKfiIk+MY+HODdp4gC2+34oCCyurkjQur1VLWTKQu0k6pwW9pWzpcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6+srbgzonUr8PiL5MI1aBxuMJqLYzRFLO6q1HQjEd5c=;
 b=Bqk4Bo0jkjQGiPTzAxmTei2/y1qWoyScbLI1sM9lCuk1md8B2IK6Kn9OgJYBXLlu+rvQnNQZdrhdiwihkItZW4FLi9V3B89m6kzOQUuYy8iaNtwz3EdvVWL1I02S4NtftyYJRFcE0PeTTmDHRLbiq2YDlb37pREiqda3c+wTpPA=
Received: from MW4P221CA0004.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::9) by
 DS0PR10MB7052.namprd10.prod.outlook.com (2603:10b6:8:14c::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.28; Fri, 3 Apr 2026 00:40:44 +0000
Received: from SJ5PEPF00000207.namprd05.prod.outlook.com
 (2603:10b6:303:8b:cafe::d9) by MW4P221CA0004.outlook.office365.com
 (2603:10b6:303:8b::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.18 via Frontend Transport; Fri,
 3 Apr 2026 00:40:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF00000207.mail.protection.outlook.com (10.167.244.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Fri, 3 Apr 2026 00:40:42 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 2 Apr
 2026 19:40:38 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 2 Apr
 2026 19:40:38 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 2 Apr 2026 19:40:38 -0500
Received: from [128.247.81.246] (mz02jj9v.dhcp.ti.com [128.247.81.246])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6330ecdJ3489046;
	Thu, 2 Apr 2026 19:40:38 -0500
Message-ID: <b35904a2-0913-456f-b89a-f9f45e6a686a@ti.com>
Date: Thu, 2 Apr 2026 19:40:38 -0500
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: sound: Add ti,tas675x
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <linux-sound@vger.kernel.org>, <broonie@kernel.org>,
	<lgirdwood@gmail.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <devicetree@vger.kernel.org>, <perex@perex.cz>,
	<tiwai@suse.com>, <shenghao-ding@ti.com>, <kevin-lu@ti.com>,
	<baojun.xu@ti.com>, <niranjan.hy@ti.com>, <l-badrinarayanan@ti.com>,
	<devarsht@ti.com>, <v-singh1@ti.com>, <linux-kernel@vger.kernel.org>
References: <message-id-of-your-RFC-cover-letter>
 <20260401223239.1638881-1-sen@ti.com> <20260401223239.1638881-2-sen@ti.com>
 <20260402-funky-lionfish-of-grandeur-fadba6@quoll>
Content-Language: en-US
From: Sen Wang <sen@ti.com>
In-Reply-To: <20260402-funky-lionfish-of-grandeur-fadba6@quoll>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000207:EE_|DS0PR10MB7052:EE_
X-MS-Office365-Filtering-Correlation-Id: 91b349b8-8bc3-4832-bc5c-08de9119a317
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|7416014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ItePc/rbmtwcQFFA+mduxuQ/JTw4Eh49BbBlr/QYOUNfvO0BbGQ3l1y9FnCP+QxmN0Wp27Bj/EyLJFyUP9IJrqNKUuGctuawKRWfrmUTPJLbfZB+a+LEhYB2UkdTmRiW87J/gqWtne+xayRkmZ4oHQuVSGjWzRUTv1tlmQiIbz+Rgu5S/2w6Sm39Scqa2wbjn45A672K/LUa9b+0+1rNN2Mn3XIG4ET07i2c/1rfdphxAwuTDMHuO6BM3obzQAO+9gYFLxuwQ5EGmZKm78n4Tus+qCvf1+ybvQRlqFdRZ/nETOPtrt2gZc2NUFRdNQlONfjUmg0ubvxbw2Sbizk9igQF7wN3N+/DqSR/xbtu5ZOCu84EvX80NOC6rOvuMWKbGQKezVz+2XQ62wQdUAHsHbIQtoF+RLcXW6Hdbqa141FEbRVmfqMMWh73GCSrvQIbgfGQ6WlnAq8Ukb1CtFaeBy9YIPkWEyhDsCXsyiMZqWG0xuhUDSi1nD/KkVo8gxb0KcJXJxcXXY3y0CB2qP9+Pm02/+faNDm940ZJYCt9Sby3JGOTs5psdY1drvfvd1h2I6zMhiyKLrMJe4HHQ6VQEFGhtdr+yaYB4BU1NfzV3TZ+eW+P36JJ1RQY+tVQxTtGF79C2ZLZ00AeZLa1ZiYaSC1tnDAvkSPqHkNMz2/LVDcKkWJTkjoCi/Wp83cINytEplDDvZ5mXhqlWTXxRKlCRaPBzEK2uKRHwujtWuTm25I=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(7416014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vDricBuMdeWBVK84QjSXrlb7Cgclm4GgT5BAPIHZl9NoPR43CVmzb3OD+r9sHwL8BtCcTXD6pWka0nlpsHJ+VyudridbrrvwtjuJ4ScZnJb9n5822LG+BCmd8V1Yqg+aMx6HOYnydGSj5ywLL/eJCgD4xcwAZn0lxmpPnpBUDmRg4yfDwYSndExLJwVYaraztoMcqZqf2mEtjuNwC5zv2E4Nnbb6h6ZfInnbmO+Lbs9utku9F8cNXAkVjMdO4GXmi4f/BX06BCXwta5JvIZMOf6SsXN+ulI9BulwXdYGayoARQdHpNWAD8w/Eky+MtCBhHaZYH8c3/oMFx+Ei573rZlB3FJyVXzNiAVjkQcggAgcJwZhf52CcsUdBnuJikiOasaOhwkqJKMcAOhmf5VK3pH/O6UdnH3g27/jfw3wAdSwdXb6BsecB8Mi1pUgJXeB
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 00:40:42.8377
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91b349b8-8bc3-4832-bc5c-08de9119a317
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000207.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7052

On 4/2/26 02:53, Krzysztof Kozlowski wrote:
> On Wed, Apr 01, 2026 at 05:28:42PM -0500, Sen Wang wrote:
>> Add device tree binding for the Texas Instruments TAS675x family
>> of four-channel Class-D audio amplifiers with integrated DSP.
>>
>> Signed-off-by: Sen Wang <sen@ti.com>
> 

Hi Krzysztof, Thank you for your review.

> Please use subject prefixes matching the subsystem. You can get them for
> example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
> your patch is touching. For bindings, the preferred subjects are
> explained here:
> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters

Understood, ASoC: dt-bindings: Add ti,tas67524. Apologies for the oversight.

> 
>> ---
>>   .../devicetree/bindings/sound/ti,tas675x.yaml | 278 ++++++++++++++++++
> 
> Filename matching compatible, one of them.
> 
>>   1 file changed, 278 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/sound/ti,tas675x.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/sound/ti,tas675x.yaml b/Documentation/devicetree/bindings/sound/ti,tas675x.yaml
>> new file mode 100644
>> index 000000000000..23e4cc77b4ae
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/sound/ti,tas675x.yaml
>> @@ -0,0 +1,278 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/sound/ti,tas675x.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Texas Instruments TAS675x Audio Amplifier
>> +
>> +maintainers:
>> +  - Sen Wang <sen@ti.com>
>> +
>> +description: |
> 
> Do not need '|' unless you need to preserve formatting.
> 
>> +  The TAS675x family (TAS6754, TAS67524) are four-channel, digital-input,
> 
> And devices are not compatible?
> 

They're compatible, and I didn't have any differentiators for this 
initial driver. So I should only keep one.
And also rename ti,tas675x.yaml to ti,tas67524.yaml.

>> +  automotive Class-D audio amplifiers with load diagnostics and an integrated
>> +  DSP for audio processing.
>> +
>> +allOf:
>> +  - $ref: dai-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - ti,tas6754
>> +      - ti,tas67524
> 
> Keep alphanumerical order (not natural).
> 
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  '#sound-dai-cells':
>> +    const: 1
>> +    description: |
>> +      The device exposes three DAIs, selected by index.
>> +        0 - Standard Audio Path (Playback)
>> +        1 - Low-Latency Playback Path (Playback)
>> +        2 - Sensory Feedback (Capture - Vpredict and Isense)
>> +      By default, all four channels of each DAI are active. Runtime
>> +      reconfiguration is available through DAPM widgets.
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +    description:
>> +      Active-low falling-edge interrupt from the FAULT pin. When provided,
>> +      the driver uses IRQ-driven fault reporting instead of polling.
>> +
>> +  pd-gpios:
> 
> Use names from gpio-consumer-common
> 

Okay

>> +    maxItems: 1
>> +    description:
>> +      GPIO connected to the power-down (PD#) pin, active low. Controls the
>> +      internal digital circuitry power state. When asserted the device enters
>> +      full power-down mode and all register state is lost. Can be omitted if
>> +      PD pin is hardwired or externally controlled.
>> +
>> +  stby-gpios:
>> +    maxItems: 1
>> +    description:
>> +      GPIO connected to the standby (STBY#) pin, active low. Controls the
>> +      analog power stage. When asserted the device enters Deep Sleep mode
>> +      but remains I2C-accessible with registers retained. Can be omitted if
>> +      STBY pin is tied to PD or hardwired.
>> +
>> +  dvdd-supply:
>> +    description:
>> +      Digital logic supply (1.62 V to 3.6 V). All three supply rails must
>> +      be within their recommended operating ranges before the PD pin is
>> +      released.
>> +
>> +  pvdd-supply:
>> +    description:
>> +      Output FET power supply (4.5 V to 19 V). All three supply rails must
>> +      be within their recommended operating ranges before the PD pin is
>> +      released.
>> +
>> +  vbat-supply:
>> +    description:
>> +      Battery supply for the Class-D output stage (4.5 V to 19 V). Optional
>> +      when PVDD and VBAT are connected to the same supply rail. When absent,
>> +      VBAT is assumed hardwired to PVDD.
>> +
>> +  ti,fast-boot:
>> +    type: boolean
>> +    description:
>> +      Skip DC load diagnostic sweep at power-on to reduce boot latency.
>> +      Automatic diagnostics after fault conditions remain enabled. Hardware
>> +      overcurrent protection is always active.
>> +
>> +  ti,audio-slot-no:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      TDM slot offset for the standard audio playback path via SDIN1. A value
>> +      of 4 maps to slot 4. If omitted, slot assignment is derived from the
>> +      tx_mask provided via set_tdm_slot(). Without either property, no slot
>> +      mapping is configured.
>> +
>> +  ti,llp-slot-no:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      TDM slot offset for the low-latency playback path via SDIN1. If omitted,
>> +      slot assignment is derived from the tx_mask provided via set_tdm_slot().
>> +      Without either property, no slot mapping is configured. Disabled outside
>> +      of LLP mode, and only relevant for TDM formats.
>> +
>> +  ti,vpredict-slot-no:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description: |
>> +      In TDM mode, enables Vpredict output and assigns its starting slot;
>> +      four consecutive slots carry Vpredict Ch1-4 on SDOUT1. May coexist
>> +      with ti,isense-slot-no using separate non-overlapping slots.
>> +
>> +      In I2S mode, enables Vpredict output on SDOUT1 (Ch1/Ch2) and SDOUT2
>> +      (Ch3/Ch4). The slot value is unused. Requires a GPIO configured as
>> +      sdout2 for Ch3/Ch4; without it only Ch1/Ch2 are output. Mutually
>> +      exclusive with ti,isense-slot-no; if both are set, Vpredict takes
>> +      priority.
>> +
>> +      Irrelevant in Left-J and Right-J modes.
>> +
>> +  ti,isense-slot-no:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description: |
>> +      In TDM mode, enables Isense output and assigns its starting slot;
>> +      four consecutive slots carry Isense Ch1-4 on SDOUT1. May coexist
>> +      with ti,vpredict-slot-no using separate non-overlapping slots.
>> +
>> +      In I2S mode, enables Isense output on SDOUT1 (Ch1/Ch2) and SDOUT2
>> +      (Ch3/Ch4). The slot value is unused. Requires a GPIO configured as
>> +      sdout2 for Ch3/Ch4; without it only Ch1/Ch2 are output. Mutually
>> +      exclusive with ti,vpredict-slot-no; Vpredict takes priority if both
>> +      are set.
>> +
>> +      Irrelevant in Left-J and Right-J modes.
>> +
>> +  ti,gpio1-function:
>> +    $ref: /schemas/types.yaml#/definitions/string
>> +    description: |
> 
> Do not need '|' unless you need to preserve formatting.
> 

Understood, thanks a lot for your review and the tip. Will post a V3.

>> +      Function for the GPIO_1 pin. When omitted, GPIO_1 remains in its
>> +      power-on default state.
> 
> Best regards,
> Krzysztof
> 

