Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010018.outbound.protection.outlook.com [52.101.61.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64149344DAC;
	Wed, 15 Apr 2026 14:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776264618; cv=fail; b=cm0Yt/M3CilZVLJzCKdbr55XnDhz9hp+3ckrFl+GW2V3iLal8i1NVO6G8/6MxLK/6zz7EBcEPhNhoVG4mvZT8Y2oqoJ1ToPP96dT+nj0n1TnPCjMje7pJUDuultzEed4GgT4e8svIZ3M7w5JTV/KFgnd6soA28VklhYQx70bCzY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776264618; c=relaxed/simple;
	bh=fcUVuaGi24iIpYzK9BSKVCk/Euj0NUZc/IMpwAipdPA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=QsOasOldfT5Hqdlk+HXgZIcRP0+rCXFPsdmopXKm0VPtON7kfjnI0T+UHef7c2mWec9fek/42gZzpeIyZ8vm0A0rufbQt368SxJOo8TZ+4nR8h1SepYNiMVt+Vx7/HVWg6Uk1aHSZ2mbCcv+s1v6XKmfGD8ckyl2qhB2LgQrnvk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=KVE2GMlI; arc=fail smtp.client-ip=52.101.61.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="KVE2GMlI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cpcaue15rO8ziYo5svBPipJHGc8MDgGQqbQEFmFGZVQ24i7gaDKAxoCIomoRRYEQMx6bTdqr/g8ljr+XuHN7L5L+kEDcPIqOwAaeSYT3vLIV+20ENFaRsqAcwyBVShlln/+0sCPWaLcccAByHhar8QWoLe7d/ucbiWUN9FipBHAxPvcgDWR/eyrqAeeNTICvWCxMjaog6XF219HYo6LqEmTDjssk3Ek+lV40zHHit/auAQhs52DnApSzfhfdy5iAlvmOnjJp2GsIk9NGePz6v6ObtsOiyZvzZiy2IYVEJI5lieVQ+S2dfl5BCyPYC5o1wcpnd/s43+2D04M4IOEYTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pRyc++YffsL+giojdmkCUrxcM8RaPSGgMZnbMSgK9M4=;
 b=rsRmydeINPKC5U2DoLZqafZvhBozTdHoKhxMoqEJxRDHYAxh/jqrTA4O0gdTT/GpYQnsPSkYRvfH29XseWO/RRYddvRYXIzRtNBElBw5gaKfv/Dr+rJ0PcphYaMsGaUhyUi/GMrCibWAYqaMaNuzL6p4nhamwpVs09jxKhmEp5XPhIdbtXTrWIrHDVhmHZZiFWTk18iJV7JDT4MMrDrqkuf4/RPDKL9L/iKer92efXL2h3O89dDsmsFbNVj8s75qbXMtDetc0YEgF8y6KuMk8jmQDzaK30NRlbhQHgYQRXP4c2sGF9z+SG68tEwtDLrL7RvYABGRsOBZRe/EGhG99g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pRyc++YffsL+giojdmkCUrxcM8RaPSGgMZnbMSgK9M4=;
 b=KVE2GMlI0DnlyMiS7Vb8tbaOMsOor8GyPjb0HwYhh7mcfz+UTBl3F2dWItH+K3X+kpH8oeizDbYAbXmfmENaJxfP9s6XbBIf4p8M+LLcCGRGh+nEIjFsXA/h4ky23MIpfwVkSk/UkJuA4f+U73bOtaLv1UMk/D7Yo5r2+QPHI+M=
Received: from BL1P223CA0023.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:2c4::28)
 by BY5PR10MB4146.namprd10.prod.outlook.com (2603:10b6:a03:20d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.21; Wed, 15 Apr
 2026 14:50:13 +0000
Received: from MN1PEPF0000F0E3.namprd04.prod.outlook.com
 (2603:10b6:208:2c4:cafe::24) by BL1P223CA0023.outlook.office365.com
 (2603:10b6:208:2c4::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.49 via Frontend Transport; Wed,
 15 Apr 2026 14:50:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MN1PEPF0000F0E3.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 15 Apr 2026 14:50:11 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 15 Apr
 2026 09:50:03 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 15 Apr
 2026 09:50:02 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 15 Apr 2026 09:50:02 -0500
Received: from [128.247.81.183] (ltpf5gwk6l.dhcp.ti.com [128.247.81.183])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63FEo2Ex2410563;
	Wed, 15 Apr 2026 09:50:02 -0500
Message-ID: <fe21165f-e253-4eba-b039-4e82c6f90f93@ti.com>
Date: Wed, 15 Apr 2026 09:50:02 -0500
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] ASoC: codecs: Add TAS67524 quad-channel audio
 amplifier driver
To: Mark Brown <broonie@kernel.org>
CC: <linux-sound@vger.kernel.org>, <lgirdwood@gmail.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<perex@perex.cz>, <tiwai@suse.com>, <shenghao-ding@ti.com>,
	<kevin-lu@ti.com>, <baojun.xu@ti.com>, <niranjan.hy@ti.com>,
	<l-badrinarayanan@ti.com>, <devarsht@ti.com>, <v-singh1@ti.com>,
	<linux-kernel@vger.kernel.org>
References: <20260409220607.686146-1-sen@ti.com>
 <20260409220607.686146-3-sen@ti.com> <adkC_fNHcpRA_ffo@sirena.co.uk>
 <a0f50798-3293-4b2b-8d9c-7a85fce9e8e7@ti.com>
 <dd740c4c-e0bc-4140-961d-6c6c604a594d@sirena.org.uk>
Content-Language: en-US
From: "Wang, Sen" <sen@ti.com>
In-Reply-To: <dd740c4c-e0bc-4140-961d-6c6c604a594d@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E3:EE_|BY5PR10MB4146:EE_
X-MS-Office365-Filtering-Correlation-Id: 700f701d-52fe-4e02-cc1f-08de9afe4bd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|7416014|376014|1800799024|18096099003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	eTGTa7cCXnGIQoOogsATKX/Xw4pq8ES7oZBJIv87NfK/PaDVN7DGXA8dNNptnYS+vnrnjRLR2YbSB04GAmlpFMSow2BenF5HcnYy4WotMIXDciGpbSGn+IOSnsdbE7iRgJ+sPNcwvJYktyKrNX3tl3IueMiJc2zA6dQ1Ymlj5EryClWWajlHqJYbp97KPfnuN9UI6hSPCKMo02FafUJqh4STnh9fHOjJvKl7O87Fx9tRa8hwbc0OjniKxS5zCk0AXQBuikeHJV0ZxOJXn2NuMtWY6DaASP3jjjoIBcmJS7oyterKyodXYXB2JW4V/CniuvITYRX+QmUEApG8K0c/UnI/aulORq6i/1DjM/+zvNMQs27EtzESsRood0hWBztSWr/0ihRZDnP1Ow+WwymHo/U5hNar7R/aCs0mxXTb219faTiDMYe4m2wZOHxcbHDKLIzHFVX0m7hRb0tqfFQ66QCZWApcIR3WY4RsEv4npPzbQaw2PlUnS2uRn83cKiWkYA1E90oNnpdVBfHp999F9V/QaNEks4eyDpa+3E+uawIOTJ4ueGrAd4iVnL7N3nvJVUATD1snYJrdVF7hPWvGcL66z+tlS1RfjmnnZUbJYELWhGAfyu0pu8bghBt6fhIWEeHUzylpk126fBaSA8qHJcjKUh7pqU4bYkaR7bBXschiudS1D55AfLccwV3jUjq2232nR5ptOEeqSf+Uze3qbBHB78b0sYra/J+1AX4fb/2dIjuTa0Oy1a+HWyLmU+xuxxcKLS9ZpxIMd+lGTz+lzA==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(7416014)(376014)(1800799024)(18096099003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	VmM/vlgUUkp5kyCuZgKTYB5zvOVoyQdR0c1nfHf7bAnA8GgnoPembHN/5Doniam0J6Koic3NIZByU29RdcTJSNTcl7Qv17uiFqR95t+ogCbnAv/GAh77mAfbTj9/GFCAQOy8b4eZUv5Od+6TV/sZzLS8FkpFDMqklJJLfgfRYzH1hCTnuAL+s6qNxyU7amdLkqxLzBWwKpsD7sb/Aj1143ZMDAUuSwHhufaCyhk5JxNs0oH9p6+Tx4CXdkZTmgNE5WOm2/OxUCCb9+K0oCOetJy94cYP2MqXO47388shdZKSfMchNRMCC8vdwwKMBwdg9+XH5oXyoMY/1tugz5Y1hkEl5hUkiJqh1GZC9s9sgHXaDuHy2ZrweTPFhXZMvK0VKMNBhRU1s1WEmUJW2AxC3D9CtkFPMewrNOPoZsKl7T9lh4+XCRuOqO7+K6p6J1tQ
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 14:50:11.6824
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 700f701d-52fe-4e02-cc1f-08de9afe4bd0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4146

On 4/14/2026 1:08 PM, Mark Brown wrote:
> On Fri, Apr 10, 2026 at 12:56:47PM -0500, Sen Wang wrote:
>> On 4/10/26 09:02, Mark Brown wrote:
> 
>>> This looks mostly good, but one issue I see is that AFAICT we only stop
>>> fault_check_work during runtime suspsend - if runtime PM is disabled, or
>>> if the driver is removed, the work will be left running.
>> (snip)
>> Do you think the DAPM fallback would suffice, or is the current approach
>> (poll until removal) acceptable given the hardware behavior? Any other
>> suggestions would be greatly appreciated!
> 
> It's fine to keep on checking for faults if there's faults that can be
> generated, the only reason I mentioned runtime PM there was that it's
> the only thing that stops the polling in the current version.  So long
> as everything is stopped when the device is removed it's fine.  No need
> for a DAPM fallback.

Understood, will make sure services (check_work/IRQ) are canceled when 
driver is removed for the next version.

Best,
Sen Wang
