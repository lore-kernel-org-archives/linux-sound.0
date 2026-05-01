Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012019.outbound.protection.outlook.com [52.101.43.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C1B3630B9;
	Fri,  1 May 2026 19:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777662593; cv=fail; b=gd7pGinSezL94UzebF5AymznMSif988jfITVGNauySunNnQA7gN/SZstUQTbosaMOZ67UK99xctem13MFIVuHpZxfXf3UcFvN0Fr/3LoSNZTW8n2QSFPbUsR6VP6vstnhT4B102EVSZW/rQ6NJvt1+vge5M1DJIEWo7mp+lLTqo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777662593; c=relaxed/simple;
	bh=1iIADPqbCoSLPJI0TxNQTwCBIYChhB41DJXuou3afi4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=m5KRnFsGU/y0VQ63A9H6Jwlpag4J//+3KSjXiaosNqz6aL7FquIltsDKzRis0Mi0Vvi11/7uLvr2u73OszFarE4tmlZf71JQn9hr6CKFoZNC6Xmhv0iuuiw3KazwEOm9NdYbFgVkHfS3rnUJSMAY/Te/Tr1nSryexSx7e4EaHoo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=NpisgfJZ; arc=fail smtp.client-ip=52.101.43.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="NpisgfJZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e5nZfKcywx8ogpSMbW4uYxyqRXmusq5qIOUxfOKKlQSBNojq0jod/nTDDNxEEalPYp1ngHOKr+DYT3fxNkA9fP8QpNf3fOWRi4Oxl3yh+4k0xMsXVMcZ4FeE8Bp3Yea9MAIUAVHHShYpRqGRHNSa0mhXLdrW17tvAlWC0uH1+BcvbCdtPfWalyYkdd/wyxGbG/uv56x2w0Li6hJQU84r0PevdEMwbn87yAtuToO+Y3RD9oqiJvne2XkviHzrkrq5+b1gOhBvRvzwKrjgOs+ab5/mhhBYTvH/7GLVIY3RVhcw8TQNPVX7M+/USGh6Bi3YAdpB3yyhT+mzToJyiQ9l9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ZtFVhfJHe18+nvblpTzCLot0RqSAU75EwxRTtuHGwU=;
 b=h+F2n7aUw1wu3oYMfmlvu99F6FOCCH+d0RlpHE0IFztUTgZELAkLmzUrJrAsBPrudVmQGtXpSQ3rQE4zZ832U+Z3uVLIbIa5Nk+SkwykfqYSO6dDeymOPxv+a1EynddIEaY1unKySL9Y5I5vWE3nvzVwqdZ68tKh17n80wGqGV19gIbZtjcUDRSRbLhJxPSj/jZYdXl7+g1ve9vQgYDTz5MYHg930DgGo5nEistKCvjr7Ceh67ulpWuAKg9OKWy0IFOwUgz7+3jEBqdDyvJZLcRotPwoH1ZeOglE/OLynNbUYXDDqKPsbcM+UWuKvniRrpW6r93fprytEqYCGU5XxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ZtFVhfJHe18+nvblpTzCLot0RqSAU75EwxRTtuHGwU=;
 b=NpisgfJZpmtl9ziQzpQG5822ZYZNNzwr4CWjSyxrzEDtaqSru055Jz7KTWgH95k0p2ia5BCBr41vOMT5V1EX8nPqKpz9viM6tYre/9IOUImTk8I5dWuvSv+i7q9Xi2CXYK8YS7qcVZXvAPoMroSJszJzamr3aMw15pN0fMFz/z4=
Received: from MW4PR04CA0182.namprd04.prod.outlook.com (2603:10b6:303:86::7)
 by SA3PR10MB7071.namprd10.prod.outlook.com (2603:10b6:806:319::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Fri, 1 May
 2026 19:09:46 +0000
Received: from SJ1PEPF0000231C.namprd03.prod.outlook.com
 (2603:10b6:303:86:cafe::5c) by MW4PR04CA0182.outlook.office365.com
 (2603:10b6:303:86::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.21 via Frontend Transport; Fri,
 1 May 2026 19:09:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF0000231C.mail.protection.outlook.com (10.167.242.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Fri, 1 May 2026 19:09:45 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 1 May
 2026 14:09:43 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 1 May
 2026 14:09:43 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 1 May 2026 14:09:43 -0500
Received: from [128.247.81.183] (ltpf5gwk6l.dhcp.ti.com [128.247.81.183])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 641J9hPb3820034;
	Fri, 1 May 2026 14:09:43 -0500
Message-ID: <dd9ce1aa-7eb6-49ee-8189-d5ad76e5622f@ti.com>
Date: Fri, 1 May 2026 14:09:43 -0500
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: sound: fix TAS675x doc build warnings
To: Randy Dunlap <rdunlap@infradead.org>, <linux-kernel@vger.kernel.org>
CC: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	<linux-sound@vger.kernel.org>
References: <20260429225751.1995224-1-rdunlap@infradead.org>
Content-Language: en-US
From: "Wang, Sen" <sen@ti.com>
In-Reply-To: <20260429225751.1995224-1-rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231C:EE_|SA3PR10MB7071:EE_
X-MS-Office365-Filtering-Correlation-Id: fc9fc59a-3241-47e8-599c-08dea7b53535
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	gbWBSTZjpiuhk6M8DI5ENGxZLjo7dOfMzc1KsUNZwu9DedYkLL3kx7b1BppTJ9E+kJ2I33LfLfns3bGzBCStiamMqunmrhE8O20wUVlCNR32iD0JxNUQGoSDdKaqUBJIgG2DG9OJK4tLpRTpQ0unX/rsFLM8XAF2pbbQcJbJnLgBn2s+PLf9vusqfaQrnhRF0rYYdKHBaJxTMHEdelGVKFTXC71vPbLDq/9t889CBXJEghM+rntlZE3c2Lg2rKmekAEdk0K5eylaH6MgrwdttQnas62+6t8YX7rEeohx8nSgVGdN+ttXPWmtug9LMQBeXqcrYXVyQjjalVcfBJCLIDB6njGA/F8iLn1ElxVkdlcWIwSNVfJwvGx2tkSBG/I0lM+Yz+VgAEyGgTv0YzUCfuj4a1hW5WYCpHX3tTskPuJGHLpHow+dsqzsxouHzA+fuulZ786YqZ6zfX/zjpBRCJcCjHZ6W+AYUBCSV2LEFY9hUhUfsXvcmsdsA76W2Ddvz+HDivfeEpGFY7IQgtoIqfQ3JlXbrkqH8g6VqeZyL8Ymm42kRZB8nD8uoF1BAsJ//yO9HFTYZvY/oKSK5tWLRNo25H59FYZXuiREzbhaoDWVEnMTp+biZvO9EKlQQv1n/rPa/Vp26CsCYzEcGmzYLK9j6gFKkl2x/TjRBNPmKPpVYFJxMHGNcDc/bjw8HJR4
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hYf0m98JlBvu5IHi5/MD1GhnvANGbsvOSlIuX9cSmkWvwiM3vyrATgxeMSnZmWT67164lz7rDIO1Zf1bOwbqoK8YkUOZvFqzZgHkDTuo974x0LVg7cI4rmFq40OegXiv4EHGy9y6KfOwe1N0FVfqRVrCpAyIq601TrpQOiZO9AQfnpm9M/HJyqG8+ncSdqijEBE2c8t58tk02tIlKWqLeL7rF0K/kKe44sDDxdOQNUDsMMdvIq0dqwDo4j2PMlfeqSUhgYLZmLxaVhafgNNQ2nWn2renqRgO2oCmg8bSxOsIA7lB41DHz7mnIwJdvJScxlSlBFLpzBW8i2XLwOqf48Ox6JIknYxVNt1GL8sPRk7UKam6jS9G+0o7z4sM/CAWMqP4SmcTs3+4HJ/CEJe9luAmwVX5X2DE3iqNSP2DU/vijKqszZnadfwc7/UCv7wj
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2026 19:09:45.5437
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc9fc59a-3241-47e8-599c-08dea7b53535
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR10MB7071

On 4/29/2026 5:57 PM, Randy Dunlap wrote:
> Add tas675x.rst to the index file and extend the heading underline
> to avoid build warnings:
> 
> Documentation/sound/codecs/tas675x.rst: WARNING: document isn't included in any toctree [toc.not_included]
> Documentation/sound/codecs/tas675x.rst:659: WARNING: Title underline too short.
> Overtemperature Shutdown (0x87)
> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ [docutils]
> 
> Fixes: ba46edca354e ("Documentation: sound: Add TAS675x codec mixer controls documentation")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Thanks for catching and fixing this Randy, really appreciate the patch!

(Already merged so no need to but...)
Acked-by: Sen Wang <sen@ti.com>

Best,
Sen Wang

> ---
> Cc: Sen Wang <sen@ti.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Takashi Iwai <tiwai@suse.com>
> Cc: linux-sound@vger.kernel.org
> 
>   Documentation/sound/codecs/index.rst   |    1 +
>   Documentation/sound/codecs/tas675x.rst |    2 +-
>   2 files changed, 2 insertions(+), 1 deletion(-)
> 
> --- linux-next-20260429.orig/Documentation/sound/codecs/index.rst
> +++ linux-next-20260429/Documentation/sound/codecs/index.rst
> @@ -7,3 +7,4 @@ Codec-Specific Information
>      :maxdepth: 2
>   
>      cs35l56
> +   tas675x
> --- linux-next-20260429.orig/Documentation/sound/codecs/tas675x.rst
> +++ linux-next-20260429/Documentation/sound/codecs/tas675x.rst
> @@ -656,7 +656,7 @@ These faults place affected channels int
>   issues fault clear (register 0x01 bit 3) to allow recovery.
>   
>   Overtemperature Shutdown (0x87)
> -~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   
>     ========  ==========================================
>     Bits      Description

