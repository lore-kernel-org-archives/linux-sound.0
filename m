Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1E5409602;
	Tue, 19 May 2026 13:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779196836; cv=fail; b=W90YxCYEYkHwSvMeG+3x7RpMCFwSfl6BRIh6xRO2JdDnMkigOa4ELhtRGWHiY2qS0FKrqzmnVOjsV3WWaseGVpgNMTVFlUtmLvfu6MO0648MEUmM3GoU5EyXL78s/cUxH/dAhoT9FHVhqdPpfA1e1MrcqrA6p5cUzBW+7WP6tbo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779196836; c=relaxed/simple;
	bh=0cuUD6LFKugMtGX5HsKxFhaosnx2ysHHyCNjfLrKePc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=PezUIc2Rh3JmjhaOomX7zHl5bJL9RbLGXJLVWheAMwi8od6ulJldd9ennENgDLwkwsv0GYfVFfCB8X6t5rCwwaI+ahvRJUNZ+kDzCKtZx9JAIGIjso+f4EZ0TdoLuMosNxz/6R25NWbbGEt0QiRWb8GU2ENbB2o30kcKGcyoGgo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=lvvFiElT; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=jHuqN7qw; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="lvvFiElT";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="jHuqN7qw"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J4eYOO1299672;
	Tue, 19 May 2026 08:20:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=712adM1vsprE6bjxgVs04FhtD5vnXTiJi5/Yyzvtm54=; b=
	lvvFiElTlvkdk8ZLZriyTjK48yOqUD+NQxs4rUZxGKrHKpogsRbFTmZZbsoJOwhb
	93dWGwiC+2wXpHvmOEEn+/MLqN4hw8oLQCQCA+iS9sssLvT1UQYvBZPdGD3TQf5a
	dcauSs/X/nFot7DShqg6Ufdwxn0hzu7jWTSpiq+jvs5WQqAk9zgOQUtfenQNmT7O
	2MtuTacGJ65mQ5pwWYKho8z2gEtNl7dSM86PAn34wh6Z0zZWqlB0DN8udTWUG9us
	eybr00WRUudrI9LIkha3GZ9kmnl0zbS+2mTSVHr7piEsZpkXhVVM1Z0yW4FSKSf/
	xwiAZ5JbmEmPdKow1HkMbA==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021132.outbound.protection.outlook.com [52.101.52.132])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4e6p00kmqq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 19 May 2026 08:20:19 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qKOHtci/pf2/iKYQIgA6YWCGdjBzInDEWXUqh9iHdy00UEu3oRtOiEr+Sr6RyV+AyfB3y6nD/pT4QHgD+88Jjt7qtS9++6mTCuIdzfNqpKGTXFG9bitVorxFTQAOgQFUv+odaChtqNYZdN0OddQnSPO6HXN0Nci7pGmSXy73I1MWvKFITSR75Rtqe/4TyV9GCTJmdvieqK6bLq/FKAmEatJyB3i1t33riGYTWiZSYVUXh3ePR5OhAmvRt53I5YbQDSGVgkS1NgUCVcDvDgoIOqniLg9SVULULbTVjjX8wIhvY/gnD6T/1dfGguTrt4VZvN+TKNs+RCMHMgGW5eH4Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=712adM1vsprE6bjxgVs04FhtD5vnXTiJi5/Yyzvtm54=;
 b=BHUCm9FGYkYWYyZzt4IKDbXz45FNAh+Xzs/joohsXr0Flpg8YTqIWGJ5SfxgmwCj7votensyP/VqFpiJ0XCdU3r7IeoQd/pUrSHE9wI5Vv51SU5ZckZo91/AH+3Dmh+RT7UUSO+SpZCjUIK9x2D7n0gzuiwYpM5pROE+NsfWABG/1GSb1I6UIZo7R2MUDfXAqeq7vNMLPEmTYbilwZqEKEuIahGe98IVOApsrQQ0u8XYKZj/fvWCxfiEB1MA3lfHCjTEgvyZZi4O8KyzpUhvF9T/XD3Li1KhsjyKaycBjJON0HKhKfV4ExCjWMsOQGP14FbAp/4Tv3bw9LpV4eY8EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=712adM1vsprE6bjxgVs04FhtD5vnXTiJi5/Yyzvtm54=;
 b=jHuqN7qwXEpf2sMNfuBL+INEFTKfHXXE/kCmOrppk/mod3DvXY4rX/vCb1ZKwsk5+al64eEoBfCJyJ/ERR9NKkU3UXcIQ9YAU4OJItHB0jxQiFEWA0b6+FZrAcKEIDYMWiiCWZHcnzhK+L2b27Ef0QK4pqpyZyVDOkm9NeyuyXw=
Received: from BN9PR03CA0456.namprd03.prod.outlook.com (2603:10b6:408:139::11)
 by EA3PR19MB9373.namprd19.prod.outlook.com (2603:10b6:303:2af::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Tue, 19 May
 2026 13:20:09 +0000
Received: from BN3PEPF0000B06C.namprd21.prod.outlook.com
 (2603:10b6:408:139:cafe::6a) by BN9PR03CA0456.outlook.office365.com
 (2603:10b6:408:139::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.25 via Frontend Transport; Tue, 19
 May 2026 13:20:09 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B06C.mail.protection.outlook.com (10.167.243.71) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.0 via
 Frontend Transport; Tue, 19 May 2026 13:20:08 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C9050406540;
	Tue, 19 May 2026 13:20:07 +0000 (UTC)
Received: from [198.90.208.13] (ediswws06.ad.cirrus.com [198.90.208.13])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id BC695820244;
	Tue, 19 May 2026 13:20:07 +0000 (UTC)
Message-ID: <d732483b-cb5e-4733-9ab6-04cf6ac16884@opensource.cirrus.com>
Date: Tue, 19 May 2026 14:20:07 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] ASoC: cs35l56: Use reg_base to offset addresses on
 SoundWire
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
References: <20260519113703.393210-1-rf@opensource.cirrus.com>
 <20260519113703.393210-2-rf@opensource.cirrus.com>
Content-Language: en-GB
In-Reply-To: <20260519113703.393210-2-rf@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06C:EE_|EA3PR19MB9373:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fc07ebc-f184-4c10-50c5-08deb5a95970
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700016|376014|82310400026|16102099003|11063799006|4143699003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	T0M5qX+E5G/0GVGPJDsliEVpDnoNgUR9zOZTQdk/Vpe8l2Wtl0B5xH5274Ly8Ql1dT14ipLo7Ib4yBKfXxUxNMPnSTQT+v+SQJPgbuNJECA6RkKZGnVLul5/BgiWarwqSG2muryF5Vm8+XigiKJGgE6aZktL32XQo76qQKcevMYPspub2szeF/rFiVwDpgfMreS5DBX8urX3Z2wYGvRejVVM5IRzO9n+pyKbkUHohcghV8utFJiooTdCSRefclVkDvqwHM/qjsrOEYDoEMyv5dQTC1qH/QcYQNhu8fFXIhbN1craJbvUu8CYZj02Vm6YKJSuw7GCOrlokv4yU6WA+U1HvcZ7jFSQbHL2wwLPXDGhAyFpIfFO/z/vcwINaUqjGEUC6Yrfj28jXMeZcJJUwCmxO1Ij2d4OzIxPH1HnIXRWyoAGeccpcAsiAII1JGP2Jeo6pjDFlwoHjesEH8vBratJRe9hy4OZdiH/SmamYNn3OB04+rwzx4OSMnE3Mlw/0eWeA8ZoA86YtELq9wIZn4/nT19z0uI0voKLaQse6tTpjgdfCUxmT2Udl7SNV3yJGeFDu51JYjKuvmXwp+4qxHIOUSIHW5uKbeEFN7dKsYgjCDbXllCuCTSypBmgxy5NDwY3RgiV2bNZoyj6wlfnhGTUarKKuESxpWYBafsfElDmfuDMDtKB/SP+xQGmeZIMOKhpzza9fR4Q8at1NBV8KnrGaEJnp/BZjck2BwQywbw=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700016)(376014)(82310400026)(16102099003)(11063799006)(4143699003)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	s5vAnYYmwfIdoPjqdrYFPuF4WS/y9fmG65Fz4NjswlcKiMs2ViiH+MTaad5LHXWybubVsx39FVOV6ATO/BYE3nr5bF1V/b/LrJS0GYs2ZK5MxP+//BmBSXrmH1Zsq2iUYrOiH5TTvxvj41jwVPElQrxJXUIgDJ/smKIwZIQN26SD/gBVOw0vXZCutCkqGYLcyAjRQdQhbXFPeBsKOlKP4feUbd5aU2bDGP7U7IIqnlc+QeEnNqjRU8KWEKEQSaqR1+Ow5RvKy9JmeXIXnVuV9H70tG0u7ys/CsmUjMmg8usWC2HVPF188k+2uVwIYH8i7DScGjdddHB2jSiWjFOEnK5ogwzqF44GVLO76uLXR1eNTervYtd0kjqj4JUJmzc6sQYsCZcdAomB/MvdiG0o2sYO4671Gif+9g+nbzeMztNsEBBIDlFLsp4sS6hEx7//
X-Exchange-RoutingPolicyChecked:
	bvacrzgyxVghuw4bHkLEt8cb8FTxb/xehy/uMytgRrU2wr78JpNizrZNKFfIA33zr/JiwqYMWQkpTVIJd7wMp4MEH2WP1HmVej+ckWPrtV8T8DnLh44MwvWOgzQeHRW4MdCKBtoLCguew8oqhh/+2qKCgxK3TfgdNDTYlTVgXM49vYMbj3ZeI+ABmisoe/Sa2tN+dFoSmc/wMfTJkUBncAlmcQxoKNMCJYBx64C3Cr6U4/SSi74QiW6oBOBFE0J1kyY3R4rt3PqwSpK0wk/xNEBIuqsMQe5dz+UjT6jJ7tBIwZ+9ToFTZUvjwxBKDVt/FX1QokFg0Q45WPK/YQmVHg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 13:20:08.5700
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fc07ebc-f184-4c10-50c5-08deb5a95970
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B06C.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EA3PR19MB9373
X-Proofpoint-GUID: 5oyQqle4SMX5faEDAjqeuD4TD6fBFa9G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEzMSBTYWx0ZWRfX3DTbNqfZxNBj
 yzjthxkPkZgyFeWUlTLrAM122cphj7FqpUqPAhDzYJaKrXVBgNqSGOSiHLhqiQ4LOhjHLnk3YzK
 /S7jPYT+9Bv/Ld3RYPyBWAH5/dVtwXBK3vi0Qy3+X+IJCRxE/Ot2SOiz+GNpz0iX40EbITTjiOc
 6s8JpufLuIfx0z+GrSc0VJyb7nhw8bxSFoMl0H8EgC4RG9joLUedCvnLn81qdFkImwvaV7ciG4I
 TO1NsoqpPAa3mqP0PWkd97Bczo5yfrEvPh0wH9VHmnmjJvqBy6GgPwQRtzCkc+GaAVDvqGuTlrR
 DfGSgedNGn2ekC5n/Lj8CgaRJzJ716eEVn2wMdyYRybq65OUoIZPthO+hlzNdqkR1R1ziI6R1BA
 VZGb9DV5gpVS81Qiv2R8NDRETf4najdwqa+aoQRnZDU4qCGVxEx2zh8GvMNK+KLU/BrOsx7nb32
 u0pWaicAfsh+LLYXPdw==
X-Authority-Analysis: v=2.4 cv=UYBhjqSN c=1 sm=1 tr=0 ts=6a0c6393 cx=c_pps
 a=Jry067FxzTqLSYox7+vmHw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=cRP8WE6plUtvK7fMcV8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 5oyQqle4SMX5faEDAjqeuD4TD6fBFa9G
X-Proofpoint-Spam-Reason: safe

On 19/05/2026 12:37 pm, Richard Fitzgerald wrote:
> Set the reg_base member of regmap_config for SoundWire so that
> the regmap core will apply the 0x8000 offset to addresses, instead
> of doing it within our low-level regmap read/write callbacks.
> 
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> ---

STOP!
This also needs an update to the cs35l56 KUnit test for the changed
addresses being passed to the dummy bus driver.

(This patch was written before the KUnit test existed)

