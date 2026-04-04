Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011012.outbound.protection.outlook.com [40.93.194.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D3A2E2840;
	Sat,  4 Apr 2026 03:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775274029; cv=fail; b=snoaw0yRr0M1mvsdfynUWVs4TFtS9KQTPhX0my15wsFLX8lv9jJA5P0kq3fkmNdB+c+xOwIMeDlIhIQWp2wPYKzBo9dLsRke3Fmz8J3mGGq5T67O4u0vsObS+qIRYBfBKl65etoRptT44d3PMfrN6YRLr27v1P25ItwTM6BcoaI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775274029; c=relaxed/simple;
	bh=yW8kNBHNeZs5NVUtruXEcG0YXHqFCwtJwGT5lMxnCOQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=QThIH9J135ljcMMJSXdwkZJB61bXSPZlegKVnA1W6qb9HLW/AcCrTEiMF0qorYqZp9hYosQwcI7IVWxv3aVBA3v9/zJGRzMHr3bSqIFf/qhRkuNtMqGmQAgyYFIj8rhjwMHUY4biBUjWhCiFoOKvC83ngwJAJC+h+df1fbEWA9I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=XUy2U3ZI; arc=fail smtp.client-ip=40.93.194.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="XUy2U3ZI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fnkErcVuQhPTuMQ5BSjF71Hz1BocjpZHxJNgvS7BiWnhuoujdnTdkaJ2y8Nhz+iDKk3OaMrnaY1Ik/ZoaO1+zE47IyTpZl8Su2q40v4XW5p7A1Q7sDBb89aWNLak4qxYAss0q/gxgGjbl13nB5IRSzONbZjsY4xvXTGmZ+8Ktgt+5Y9w5RA+MKWLisqHlsXfMGWUx3NtudnXUZt1aD6nohLYA7j2p8wv020OGEBBOrkvTxQw/0EcGO3t2TwyPYUhrGDdd2zKqvbk4ocOtkzMPQ2cToq3BHqJl0zVzgl9GpbK50aRGGbM1rTP7WcrOjOHY5KbPy/Y5HK+le3KrJ59UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XgGRaBdMOvrdVK1zSfk0NqDrRJtVzIK13OzXWdP/QSI=;
 b=sIGe9p43qJmWTtfFQs0ol29LVrR8UurHbGahhXptKVtFYl4FrVEO7zpQ0lH7gdLNIJ8KzusCMfpnGR44kA1npxHacsMHutpZigPkvPVMS/iqvKAwYenk4trKaqoaLD00oEqD13HX2uZsMjsYmutVz7y/nrWnk3hOVOf4kUKRuya83i9Y5fkpOOxm2FbILrqR9X8mnjHG6n9BqDTryKpxBkGtkeVStQ9LrNxGUSyIbu5G+1+ecgkRjPSc4yaCQNdl5+62fgQPPw9zPLTiMS9uN7MWsuJrt3J36EuN5RLgrgY2HnRNrdim4pe3CMUEqISjbo29/qTPOsT5fSz9soIzYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XgGRaBdMOvrdVK1zSfk0NqDrRJtVzIK13OzXWdP/QSI=;
 b=XUy2U3ZIE9BmR0j7v/D/yIzGz+HfRG4wUcF4HR0kD7QcFlg+rhgckVxreW4kWX9q1gdiJrTJpw0CfPnZEP1iibQeiqCW2hcGUxHDjaCg4i/WEayFsBTaQmhieIXKZbTABnFKUB5Hf3R0QP7LjJqpDiF1mMaaq+DkUONH0QkEo3U=
Received: from MN2PR14CA0014.namprd14.prod.outlook.com (2603:10b6:208:23e::19)
 by PH7PR10MB6084.namprd10.prod.outlook.com (2603:10b6:510:1f8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Sat, 4 Apr
 2026 03:40:26 +0000
Received: from BL6PEPF0001AB56.namprd02.prod.outlook.com
 (2603:10b6:208:23e:cafe::40) by MN2PR14CA0014.outlook.office365.com
 (2603:10b6:208:23e::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.21 via Frontend Transport; Sat,
 4 Apr 2026 03:40:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL6PEPF0001AB56.mail.protection.outlook.com (10.167.241.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Sat, 4 Apr 2026 03:40:25 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 3 Apr
 2026 22:40:25 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 3 Apr
 2026 22:40:24 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 3 Apr 2026 22:40:24 -0500
Received: from [128.247.81.246] (mz02jj9v.dhcp.ti.com [128.247.81.246])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6343eOQq1447779;
	Fri, 3 Apr 2026 22:40:24 -0500
Message-ID: <0a73ae00-5d57-4701-88dc-9a861d44a2c5@ti.com>
Date: Fri, 3 Apr 2026 22:40:24 -0500
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
 <b35904a2-0913-456f-b89a-f9f45e6a686a@ti.com>
 <02517021-74cc-4023-98f2-fc7a485b2d2f@kernel.org>
Content-Language: en-US
From: Sen Wang <sen@ti.com>
In-Reply-To: <02517021-74cc-4023-98f2-fc7a485b2d2f@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB56:EE_|PH7PR10MB6084:EE_
X-MS-Office365-Filtering-Correlation-Id: 307da8ac-8f68-4be4-8852-08de91fbe87e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|7416014|376014|1800799024|82310400026|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	v56xVZr4BeOfzsFgrFM2GF5oDJ87ycFQX26YhMJPt1i4zQgEW4FxbDWVUrLQnBva6COVQ1jgJvwb6K7kkLcN3TK3yT67CajjEc+QEHo2aayCHm5/gY608u7PylyfJvc4HiK27RTYV0FMuTafhHAhAFCC36W+96gyjK6SDZlOeiYuicEP5PAjgKpJ3eb0XdpCw7qZgArd/RonviZSpnL0x8eP3fl4VjcV3NteCJeEw5uqAFutUfZbZcieNl3T+wmcFlWz+jG/MdTIlDlVkfsuNHNaEjsDG1UkttA7wo6qQnjw4qAls25tBEuruFfYTES36NGC/gynIMM55Oj7n1bdsqB7UdTb5NZ+kGnE5aQmJd6SEVZce8TVj1gDRnIrGPpd4c3FfI2Ci4jQiGC88WiH8bJT2yvEeyeJoGv2J87eNe+CpN+qXVYBbL6Cvf3baXfTGNhGN4cFnk1y/7dPSGd5c+n1H8F+3O1XjyOYubCg1ZYUPaSGJJeicSK91+uEgB1Jy5UFOWyXlwsnxqDdpjY11q0qKY6ADJhohMdTvMimJ/4RBWnMadziUP91lejrpyes55R0ulXVeEph6HZKoiuzkS51/urrO+jubvOYoIXiYRXeDnVfeMI8nIcdPgXV6BsQk+SxrqHrF3ivTxlN7KYBIO9oUS2GOcFGeL0cmB2lt78OApNmXnlp+KNoJ/E2ePSUfuAmaKm33JeHux7a0awsb5NskYGBQj7Xi2Nm9i2YvK4=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(376014)(1800799024)(82310400026)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Y2hhT5AP6ZdD/4fnSvoW66ExNdI98ZgPSB7rkRbvAfTMIq1WwNYnyOYyk4LDIwZYeM16ZvuJ2dmW6ggzemkEa4BFC4OhEnY7Sa4mXXJo5DdzoRqAdCKlmZwRMrxOeTfuTh+fmdZ1oTr1KRbrP7hRoTKxbKNUxzMq9CyH+WENiNAvhWcHCwyzguOQr3NcXAF1lGYla95frf9RpUf0MXvfMyb8VLcgqfDb/TU29uF6dbgnoHz3lglUW2FkkjHAU8+JxtgkCkO76wWbv7GtQrVPP0Kn1W6xjqztsckRgA6hdExQ8Iq67I8V1Npi8UZdcr3QBa5MCZrTy2TqDd7lb85WXIpKn4ILIquFRJaRsN/iBy9PPIwxxwANDpuPhWmsJGu6JuAamY2qAGUigc5jiYIhfvwA9gFnmAe+3yjZu0cYNCdQXePuJqyxtu1BZvcJImAM
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2026 03:40:25.5427
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 307da8ac-8f68-4be4-8852-08de91fbe87e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB56.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6084

On 4/3/26 02:19, Krzysztof Kozlowski wrote:
> On 03/04/2026 02:40, Sen Wang wrote:
>>>> diff --git a/Documentation/devicetree/bindings/sound/ti,tas675x.yaml b/Documentation/devicetree/bindings/sound/ti,tas675x.yaml
>>>> new file mode 100644
>>>> index 000000000000..23e4cc77b4ae
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/sound/ti,tas675x.yaml
>>>> @@ -0,0 +1,278 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/sound/ti,tas675x.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Texas Instruments TAS675x Audio Amplifier
>>>> +
>>>> +maintainers:
>>>> +  - Sen Wang <sen@ti.com>
>>>> +
>>>> +description: |
>>>
>>> Do not need '|' unless you need to preserve formatting.
>>>
>>>> +  The TAS675x family (TAS6754, TAS67524) are four-channel, digital-input,
>>>
>>> And devices are not compatible?
>>>
>>
>> They're compatible, and I didn't have any differentiators for this
>> initial driver. So I should only keep one.
>> And also rename ti,tas675x.yaml to ti,tas67524.yaml.
> 
> No, you should express compatibility. See writing bindings, writing
> schema, example schema docs or DTS101 talk.
> 

Thank you for clarifying Krzysztof, DTS101 talk is immensely helpful.

Regarding the compatibles, if I use ti,tas67524 as a fallback:

   compatible:
     oneOf:
       - items:
         - enum:
           - ti,tas6754
         - const: ti,tas67524
       - const: ti,tas67524

Does this look correct? I've also seen some bindings use 'enum' even for 
single values under oneOf, but I'm assuming 'const' is preferred for 
single entries as advocated in the example schema?


Also, my apologies for the premature v3 series; Sorry for the noise. 
Lesson learned and will only send a proper v4 once all discussions are 
settled.


Best Regards,
Sen Wang

> 
> Best regards,
> Krzysztof

