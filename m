Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012019.outbound.protection.outlook.com [40.107.209.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A23D353EF3;
	Sat, 16 May 2026 10:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778926684; cv=fail; b=Diua9VLPb8WM80L0OxPtumwNKUL7J/zUI5qG3/cQqw6mWlkxo43QKCIskK4ylJJuuZEBqK5MzyWJVMcJbD2lxUmDbOnJ6d4kWGMqm31pjFfaCdBIxagqCiSw4QHeQDwerDUs0k2Bb/P98OvtceXKq7LyJ5em7fKzM1uLL1A/pfM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778926684; c=relaxed/simple;
	bh=Ypv7oOD8tUpYB9qBpkLtpZUSJQppTZpl0ukUrDwJc+Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=cHxNP2+URzoclGnt996YEi41j77eBr7Aukh8DnTYC7+/bMiWiSNFCgRoHoTmcpjJqM2nWy2ak9/ipuKYH7PoBfwdvmxo9fQVAnvaUj8T+gshkdE71br5d2c7H7dUx+EQvRJ9zjgFwmmf2TQdMNEKW0CIyULrCCd8zQYJpOISeqo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Rv+21njj; arc=fail smtp.client-ip=40.107.209.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Rv+21njj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FSWFE9Jqg0Vm6P07b8ST8BoCaPkFpyPgFZZKLoy4hcEF78FoMdiOGidGeHr4jognEelsglBVBcQ2wtOq6NKI0wKzzBaVlTQh9ZGCVkL9JVcEGAtt5nFiH+VRiZslwMyxKM0as94KMNeM1WmGPxv432QyKpUiqq23cj1F0C4JZTriICDDkbNCRtxxR8MhxFzAm7VBw4E1kqfoWSfzA7JhPptYCdJC+sfswZB7IiwxbcMkST4KUdEUDXPqs9ebvjbki1UX+JLUwuVbGQL/zNH6btPoImcRxfIsqJLUN9NRgSYn9rS5zP3lnJcfXH8PLrbTwPhtRECRjWirV/icRoYrYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zP8C1G4K+I34nKuaCxNLfH0LpObExpQvxYfKFR+ONhQ=;
 b=dnBvSyeACXYRY4LTWClWDSWrDYiw7Bapr/WdAnjYW+fHtRYEsm+S/V6bBPIMQmDzJnGZ0aqC7KL/Vg3+Xq8iyxba6KS+IU/MM5RytcdS+5nupeQUTG4LFtHja0XmBWpdg27I1vMfL19B9hmFjlkcG+zlZJiZeKmTj13eCNewazcWx4SjmfdasA5m0SPu73kSRXybWfltyKhRKJXeODigl9+ImSO+3fsyH5yXF8r2NDP86XqcRq0wqGfbUXV4OnvN4v0oU39LDPwh1Rs+RbTGPVLOPvmR6f2ZV+B4FTOrkrmTF657mLsZGupesk3Nl4he65rjv9a9gEGvPoM/jQxpWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zP8C1G4K+I34nKuaCxNLfH0LpObExpQvxYfKFR+ONhQ=;
 b=Rv+21njjaBqftxRaHI9AFBbO2mLNnehxEEsFFJSz/A4YArYpDkcVcerto+cXH5tCx3b3XkkhJOjRGaKNo7M0o81F/GsfPsWo7gOIknSHNduMI6TeL6l9cPrNSP69dKWrEIuuc+Xy20LVnsP6O1Oifn9quWH6f1X+lvQh4gZrMXk=
Received: from CH0PR04CA0038.namprd04.prod.outlook.com (2603:10b6:610:77::13)
 by DS7PR10MB4941.namprd10.prod.outlook.com (2603:10b6:5:38f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Sat, 16 May
 2026 10:18:00 +0000
Received: from CH3PEPF0000000E.namprd04.prod.outlook.com
 (2603:10b6:610:77:cafe::61) by CH0PR04CA0038.outlook.office365.com
 (2603:10b6:610:77::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.18 via Frontend Transport; Sat, 16
 May 2026 10:18:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH3PEPF0000000E.mail.protection.outlook.com (10.167.244.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Sat, 16 May 2026 10:17:58 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Sat, 16 May
 2026 05:17:58 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Sat, 16 May
 2026 05:17:58 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Sat, 16 May 2026 05:17:58 -0500
Received: from [10.249.34.245] ([10.249.34.245])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64GAHw5l1498422;
	Sat, 16 May 2026 05:17:58 -0500
Message-ID: <7afd906e-a851-4cfb-ad4b-f0284cd84f67@ti.com>
Date: Sat, 16 May 2026 05:17:57 -0500
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: sound: simple-card: add
 system-clock-id property
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Mark Brown <broonie@kernel.org>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, Liam Girdwood <lgirdwood@gmail.com>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, <linux-sound@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20260515161358.1462453-1-sen@ti.com>
 <20260515161358.1462453-2-sen@ti.com>
 <20260516-resilient-magenta-reindeer-4f0bcd@quoll>
Content-Language: en-US
From: "Wang, Sen" <sen@ti.com>
In-Reply-To: <20260516-resilient-magenta-reindeer-4f0bcd@quoll>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000E:EE_|DS7PR10MB4941:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ffde656-9d7f-41d3-06f5-08deb3346796
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|7416014|376014|1800799024|82310400026|4143699003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	NWuaTunopjHS4ti/6z4+4CENYlunzambr4BOhDxdGzJhXiVSD0P2hFKxZdziMBacMex5FWuSbuH6fuw0/u03wxLGLL+o4rtjsXM8cbhZzuO61sOEfYEIVKc8vFvsAYrOUfieySv+I0hPPILs2oLcuitr791Q4qWiP6LrWPfa3xt8m9Egw1X8SYWLvUtJGahvmbWT/MxsRUNkBTDi1wEkBQfSQzH/Itn24Tf9S3e9Pk/JBs7xnOSAKGJ/kxjoQr4B2HnDJhVsDQYl9bX//jPaOt2hzkyB8dZEpuCnWODl64ALadBCuniOMYXncOv6gKoAQKTzJAnFRsnvcHnHYu3g0SCQ4E7C2Hh67PA4IUK+qx7sGMYkAvPEAE1VN5s0b6422XQLEHf0qeBlLjsmtaDwp5M5WA0Jh3xU117lxtDS5aIEhw6lvuTrbgosmHh3/3nSGtQzT0u5XHvkr7k5iRS+qYwhoVr3cABtafUggGCZrYGGlrSHI1ICiyTYb0mx81yqTR0CNTGe/pzzh3j17UDPhQ2JewS2Psnw9tL3fVSBGj9eSVMXjw1MFYiAml+HosKMJXlyYclkXUUtx1cTA/u29aMjez+8czHHJuHCbrBr/2R9QLCt0woLpBh0XuQrX0VP1WHUzxJ5M8yj6q9scAV/xtUnjqoH1tEgMWIAEAayYZ2YYOTOVAZwGoWL7Ys+4vsvRRrfv1TBAcVd3sDatPWAzWAkrlcQll/qWK7zLp5lKuQ=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(376014)(1800799024)(82310400026)(4143699003)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Nu46MMFCuxIxy16McShgTPorpUFHDnHyGhyYVbCgw7gvw3BHrj6IAKZvhONJgpv/HlPrJuX6gu/hGo6VbNw8pwM7rDTPOuRP14duMSq7IvNraKiaRFD0UzmBdtHb16w8xpJmlG2geKLzVqlKRMt2owRmNcWa0FlvucQfZV1uXrPrO4qwz41cL9vuEnDgYF3c2BDEIycXaMQU0k+fT/mNywXY7+OESROTCqSczO+SeJuQvp44zt2brmdG6FrLYWqk1KkrMybK0AZTHRs6UOOasapwyQeZFmSPyoGKdwULxXhJuv0gOZlWvQ0nxUc7BXquJMEqKPLcm3Q34lMPOjItkpFrTwRZCuKvDK1FiM0UhOpkRFy3fn5xLXB2buZJbDECMepd8qI1ZJg4Yft6TAJLWzCEmEDA3/MVMGoqPhHs5n4o9pQq5tNEtqlwcJb1dxDu
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2026 10:17:58.9708
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ffde656-9d7f-41d3-06f5-08deb3346796
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4941

On 5/16/2026 4:54 AM, Krzysztof Kozlowski wrote:
> On Fri, May 15, 2026 at 11:13:57AM -0500, Sen Wang wrote:
>> Document the new optional "system-clock-id" u32 property for cpu/codec
>> sub-nodes in simple-audio-card and audio-graph-card.

(snip)
> So now driver APIs are part of binding :/. No.
> 
> You should have built on top or use previous discussion instead of
> making new mistakes:
> https://lore.kernel.org/linux-devicetree/20221022162742.21671-2-aidanmacdonald.0x0@gmail.com/
> 

Thanks for your insight Krzysztof, definitely failed my due diligence in 
finding previous discussions :/.

Let me see if I can do some refactor in ASoC clks instead.

Best,
Sen Wang

