Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012025.outbound.protection.outlook.com [40.107.200.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2866A317148;
	Fri, 15 May 2026 19:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778873547; cv=fail; b=Z6LqskGehOSuwkCbb8y4A9PpJnjo+jDPkMR02JMLUagTaf+DW+tDjCi5GZZN1aui8R5xr/0Gh9DUTw5Scx2qVlPYjUyx4Lf2rPthlB/bA1tT0MI32ycCNHs2obvSO1ZQ17BVi99du3w56huM5s7jfc//4K7DQIWaJiZcFU7T/jg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778873547; c=relaxed/simple;
	bh=nTzPc/eMmOyIwM+OUTDhOk7o9VaBs0/onPgVixU2sLY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=dg9HVXw7xU1Ocu2yK+3Mcq3pNNaTohxkdfRfi9yFUvMGA3dqvgJK6tcYb3U0KnNbsRb/FtRExSnlkMr07RnS6zqJjJarvGbIP0dFyGuI/2tu7mVcE3B1Qj04XIwFkZIDC0L1gj/QNhen2/kwwtSuLw+nzA7UA5vn2sCbXGml6Dk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=g3IjhxoC; arc=fail smtp.client-ip=40.107.200.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="g3IjhxoC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GwISWJYPHXOKQa3zx+5XBhayR0G4fP6O9mH7w0RP3c5KFEM0n7O6NM6D/GGbOJeNDm3m4tFPVR/iCaAm31bMjkAYyPdypBqT+vF6VQATAkLIpWGfAGfZArIIqZzyJwGJWA5v8b0kdvjXEU5G/kSibaGj7Q3h/33FjQ1I+0o6shiaipMoFb9tr4dHfeohYclFSDQjtKsZhfx0Afpqhao1MUTca96QWOnBjoPZKyxk8J5EnkAYwyG0Zrl36nBr3XP1jLf2tKAIAYd3h/xrXQoRgQP3P16iX6SNZgc7/juOUhJ/aIZswkuPx/VJZJPM1vOR+1huqZSbarDFLHonYkohzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qi4dAXrrBfXn6iFqhnvom+wSTNSMilxPPkONhMZ/eyc=;
 b=bsszTnDB6hjGAYH93BmaVIqWqwx4RqomroO4PZgjbanWpnZaZs0xyHQEhcuU47BNleF6eAfpiUZGeZ4imYlPv8UO7h56oe6QXrLdmAc+sERe+jBFaJH7dMjOxuXpu58KD2eKcK9UI+Mq0ZM38I9wVshgpUp+fEMxZZ9TR+uv6a//n78raIjw1j3DZCvrCB5cbbtpQNclG8Kbgsr6nh3p+UF80Q08I1/8ZZ05SGvWQpyhB5elTQRkooRFvN1gkgamaoIk6fdZR6MidXyRwwG7C0Phps7KrpeVOOq1kQVn8bIxKY7yTYw13o12vXzdICmnVAFL46nSrshYGcugqnQszw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qi4dAXrrBfXn6iFqhnvom+wSTNSMilxPPkONhMZ/eyc=;
 b=g3IjhxoCOPT+I8YcKOdZFm0u06DQ4Pa7sqdt6JJHBLLL3UoedYOXiY6bwZV9syuCjkLqnY33jujn06ynREryiydE6U2NS6CypV0VOmBwJ+2yLoWKjqioqXxXvqihQyhQrlw/uFRhgVONnvbEPvxqko0ikuB98XjGgywqUEKqgZ0=
Received: from BN0PR03CA0013.namprd03.prod.outlook.com (2603:10b6:408:e6::18)
 by PH7PR10MB6226.namprd10.prod.outlook.com (2603:10b6:510:1f1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Fri, 15 May
 2026 19:32:22 +0000
Received: from BN2PEPF000055E1.namprd21.prod.outlook.com
 (2603:10b6:408:e6:cafe::94) by BN0PR03CA0013.outlook.office365.com
 (2603:10b6:408:e6::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.13 via Frontend Transport; Fri,
 15 May 2026 19:32:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN2PEPF000055E1.mail.protection.outlook.com (10.167.245.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.0 via Frontend Transport; Fri, 15 May 2026 19:32:19 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 15 May
 2026 14:32:17 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 15 May
 2026 14:32:17 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 15 May 2026 14:32:17 -0500
Received: from [128.247.81.37] (ltpf5gwk6l.dhcp.ti.com [128.247.81.37])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64FJWHYU319989;
	Fri, 15 May 2026 14:32:17 -0500
Message-ID: <417f4672-f664-4125-b96f-709d385a2837@ti.com>
Date: Fri, 15 May 2026 14:32:17 -0500
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] ASoC: simple-card-utils: support system-clock-id
 DT property
To: Mark Brown <broonie@kernel.org>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, Liam Girdwood <lgirdwood@gmail.com>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>
CC: <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20260515161358.1462453-1-sen@ti.com>
Content-Language: en-US
From: "Wang, Sen" <sen@ti.com>
In-Reply-To: <20260515161358.1462453-1-sen@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E1:EE_|PH7PR10MB6226:EE_
X-MS-Office365-Filtering-Correlation-Id: 32808bba-8c04-4a4f-8ef9-08deb2b8add7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|7416014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	jwhi+twyYpwzPubVnnpCE+w+vI9GPW3o+V/+Lze2jEi1l+h/QzdMiG3MldtSx78qNDhOkEkVT8prCrv6O1z4BB4By3HU2uZspaquSOy+3np1fXHIKYvMrYRK1HxmiLs73sWRzCuir2/pNgw9Tyy+rjxh5ImFcSqXLnASNvXrwl9AHjuke0jfPa13M4NMlS/6viaRPhRBEPP38zyYBbLHaOb2nPdnntjELTAKJrRidWBKTjuHlzUd1GWyCD8vCPxmvIdJt2G50uAehQxtwwib5VTvJJhFN3TciT9TsYXWbUuK9HrNPP206bXzsmAc7yKlKB15g1UPZAtyrONTyPlJASNOfEbAESyfpeb46em6rHJSaATrVcsGVnzFUB0f1zL6wH5WHu35HZva9DfuB4Ul84k0KtbTVBt71MtBXs2ACx0Io0B0YF7/xNWYo8IUUe/+3Daj7RonsLcz+bjoevk4chYkpb9K+Qzv8fk91GEsZj8kGkvlYjVux+xAPav2t9FjBPt8E/YA9bBOS4TzTSriecEbw/alB4Hf6m4/xhhCqSbmIXIKTBG9S+N7bIYAXkOMf/QssRBbTB2ZNJFoWRWnes24hhR2GW6tvZlBq4CZYQS9LVSRe65Ot6U1Sz+txaCLdf0ELCborRAeHG9GzvciKacEGTlRu0RLuaKheS6PjbtpKFnbUdggw/driV3bXPXN
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(7416014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	U9CfyMM9H+gY321SyFgXZVn4ieOlZLJZpafFANA5AQXHwFDTYCQ/HV/YOlDJYZ7FVmu+Pho2vq92wFr/dfsS7thFb6cuIqwWFSmS4lTDb6wRoxlk3eu/hXTf0X4C9+WA2jVug89EMz9MXp90c+JUenucumOMzbsML9TlSYhNAqv3DWSbpMX8XR+X3Hv5BjI7RzSJiwGXDyG0MPzgmMj26zLVP3dPeIkGERnZKpH3okB8dOdjYB78J+72LJ3nOrxzhzZsEZfYLXS5eDsEFkvp/RxRAr1jAdxy2SavBcleqN8zkKs6z9m2Wt9xh+kI3lTdSjo6g0LylZW+trf27JjUY3DbGyoulpG8Hpvu/QGMRb93zLRmfLxM2jehpq9jt8sgAwLOl3FuGlbf1WHtk0OwBz+QsA20tUQ6UGV5fLCNVv8T0Mtkyf1qbBK1Qat4xZPS
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 19:32:19.2361
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 32808bba-8c04-4a4f-8ef9-08deb2b8add7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055E1.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6226

On 5/15/2026 11:13 AM, Sen Wang wrote:
> Adding an optional, u32 system-clock-id DT property into the generic machine
> driver so clocking topology info can be exposed in DT.
> 
Sorry folks, Sashiko has caught a major bug in my patch. No need to 
review this. Will send out a V3.

Best,
Sen Wang
