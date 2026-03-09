Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010066.outbound.protection.outlook.com [52.101.46.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6D526A1A4;
	Mon,  9 Mar 2026 04:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773029574; cv=fail; b=AByRDR2NCKRsjnwJ+N1lbo/QSopbZUCdveMXaxMPeSjO8969CXodBEeCV1tgoJW7BRnoEfmaeloZkiugMm9WpkilASd0pquz+5reRbQfMpZSEX1SUHTixkggngrlT89Fx00PzI6jUbuQ0hCntrognh0IYIMHzx6CDWZ5mLy1odg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773029574; c=relaxed/simple;
	bh=+kyFGIo/xI5WCc4TxbhutgZehhs3mNRxHI7oS90Ivgk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=sXThRmw6WuywQMfWndDRDhhZ4Ny6TkjUJo7+oxMUD6l4abRO9g3u8ZU4HWWcmjrbay643BCRgDPpimd814yVtE2EmwkjYfFoW/SbeJ2OEjzCIbVgNxyT/Nb83mvswQUjo4U8TvtbNTyUtm2l5uJoIEno9UVt5s387icGhYgOIZ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=v3jFODxR; arc=fail smtp.client-ip=52.101.46.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="v3jFODxR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CV8Bo/NiJQYt2wFVUNFgH89t/PXdjvnB/EEJuDrz4ZPQYNbRDc4HN5U2QoNA0nsrmblYwWekyGkXxBKsRSTyiqJkOmWvECbTErRRdn4zUVLu9wui9z8diPvcNoNGf55WWOe0yzTI1X5D2gVGAqaYSBQTXMg+eqzx52/h61xU4GI5ndTKYMTQZCsPR5NSeqw2pF+kLTIXhVksxEnqvl5Ip1kyaQSpfKytIhW21D6ttGQW4j2D2OVQEWpe6gOZCeVkQHepDtHGsQzuZ1XDN9q/bUq8nBClIL7ltXjBcY187iEpQASGh///qmO9HlnUMV8mvk3N1efbzl2lKBnCEkxJyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0DFiq7X+EGv1zI7G5BD+Q+yJBpWU7cA6IQESGWdG6yw=;
 b=KwVhHOOOrbJHdUlQ3oIOdAJpRLuSXYGM94u8ZLuUCFxWzZ/igWJVEXXZxlmt2lUvLeCN02J/aQmrUM/iAizJIj5Ouqod/1rxyOR1E/WLJpPjOYwkqIYipp2ClyRQaWD1lpFsMd4IsHI5u9SUtipTHak4Wd17r1BO2Um3ImdEI1FVIx6Cm3KEMTawEVwE7WD0HpgI8shy9VvfZ2ai6EelX659pExW9b/QP0ZcwK8Aq0G7On/GQdnL30QNBDwcZKTJW8z8MF3muk7w/+a1yNX3O5mtNWQM7/oaXiHVs2PcqTGQz4WjxH9yrbZhCs3tKbjlAx1aWmmDvviQJAmVC7BsvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0DFiq7X+EGv1zI7G5BD+Q+yJBpWU7cA6IQESGWdG6yw=;
 b=v3jFODxR2AIPqsnMckoSNyoGvXfinLsqq3gCCUvPHNlc3ZZJTZN1MVbFQyHfoy94KGSZ1a6uW6GpAVf/WGVjW2yg/8XdV4sy3DgaGWW/NkobctEuCX7N6w/PRL3orPUEmquIJrN9uQYuEQ35ixR1rFD/5XZezIgLth9BfNriBHk=
Received: from CH2PR10CA0028.namprd10.prod.outlook.com (2603:10b6:610:4c::38)
 by SA1PR10MB7755.namprd10.prod.outlook.com (2603:10b6:806:3ac::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Mon, 9 Mar
 2026 04:12:50 +0000
Received: from CH1PEPF0000AD7C.namprd04.prod.outlook.com
 (2603:10b6:610:4c:cafe::b9) by CH2PR10CA0028.outlook.office365.com
 (2603:10b6:610:4c::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Mon,
 9 Mar 2026 04:12:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH1PEPF0000AD7C.mail.protection.outlook.com (10.167.244.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Mon, 9 Mar 2026 04:12:50 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 8 Mar
 2026 23:12:48 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 8 Mar
 2026 23:12:48 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Sun, 8 Mar 2026 23:12:48 -0500
Received: from [128.247.81.0] (mz02jj9v.dhcp.ti.com [128.247.81.0])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6294CmrX4048201;
	Sun, 8 Mar 2026 23:12:48 -0500
Message-ID: <f339be72-7566-4dbb-b7fe-e681c6912ab2@ti.com>
Date: Sun, 8 Mar 2026 23:12:48 -0500
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: simple-card-utils: fix graph_util_is_ports0() for
 DT overlays
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC: <broonie@kernel.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <devarsht@ti.com>, <v-singh1@ti.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20260308044130.1991091-1-sen@ti.com>
 <87jyvl25tf.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Sen Wang <sen@ti.com>
In-Reply-To: <87jyvl25tf.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7C:EE_|SA1PR10MB7755:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c1f7242-ba1f-4aec-4cea-08de7d9220f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	Yj7FaGhuU9VWZPRxdAbQDYYnaldLIv029C8Y8yZkOiSrMUJPCFgxA36idjt+gtlvP+EIUg+F5RUgXtT6mhDlO7VLEN+91SvnEfRGtZGb9l+AmZ2m6jEyENjkuCRt1dk2Juh6mDscg5WmP1myfr9ifNfyXuvvHwnIemeCXwu6E2iigcThDE08HPSSgIUZUktRZJmmao1/9b7rgWkQHkII4iO8XQj3h1W+Ala3LgIDLdSAdv1mkiFnQVWnDiurZE0h+SF2BQQ71L1wg6SZjjxT+M984Xb4rS92k8YXkewuAPiiL4siTIJXKd/5xjidzt6oUTOo0lELTJIvCrK4rifAbyG/MQshbDuBWQ8w8kURZQd4XlDCVU4jeZDzy+OcEhfquYSpP0XOOYNXDFD6CMjI3evSfd3q12rU3Wa1eqdMb5ncPKk1iA0Per3zWgPtC8TdTMdUduypGhQcuJEbbG6rky2wcvWEaR0jEab2FdBAQ5m8UFuJArSacCYYBGETsRHfaQcG/RAWO46WvOD0UMpRAfUFX3QYkKR8UVBnWRLrz84oP/dQBCJeS75CfVAt9XGkR946xDfPGKv8egaYJGKyYHuDvTvtkA1kl4g14lj7DsCBy6VxsSTr5PPbR/aSg2B1t8rRPwure9oWVYOh94HMPEqSZ8u/zJzDKIOGPRBAHfIGe4uuHly+yqXpx7Gzf/MXDZso5nDO3fmk6/bRfwiy5gA3R+vhHHPuGcomfoNsmzeVzlvuTB4vruc8b70Icayn/w0OGv1D/WkH7W9ci3Wp1A==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3czuhjwwj1eiSpJ5JYnzrAmmbNOr+LbcP8J/1NSGnYG7LjrL3YiFrA7RXUBhV2oOqfXpSy+WjzMM3Q3EmctuMVwWIPNxrMSGVvFn7Qg+haVAcEXhgzYsEavx7RjR8D1AW5KU4Tty3mYgM15C2zPtN+QhwNLfVAITxl2UgrCZZ1UW5BKNwcMY6ZtYfSdGIhiMryPIYgciLH+1t5lCWR9nehEeoX2KfXF4DLV1kF80Mpe5OxpETtos91+gAsC0OAJMjmHI1AXVuBo0kVIy3erw5RETP6iaYE2V41xZsdsBxM2fI9X0nwJwbSkSGAEM3c6dHA1x16BruCYAFKEzmnT8XdT0BjYi0TXBE0t39FBjpawgnTnaAY0bTm+9G59cz8jb8737CJkLl46n4dXFEBUKRcUd7FIYoMEYrp1r/u0NzfYLjcQyPgciduWIiqs8zUPZ
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 04:12:50.4033
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c1f7242-ba1f-4aec-4cea-08de7d9220f7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7755

On 3/8/26 19:40, Kuninori Morimoto wrote:
> 
> Hi Sen
> 
>> But when the DPCM topology comes from a DT overlay, __of_attach_node()
>> inserts new children at the head of the sibling list, reversing the
>> order. of_get_child_by_name() then returns ports@N instead of ports@0,
>> causing all front-end links to be classified as back-ends in
>> audio-graph-card2. The card subsequently breaks and registers with no
>> PCM devices.
> (snip)
>> +       /* match "ports" or "ports@0" by unit address in node name */
> 
> Could you please indicate this method is needed for DT overlay ?
> It is the main reason.
> 
> Thank you for your help !!
> 
> Best regards
> ---
> Kuninori Morimoto

Thanks for the feedback Kuninori,

Will update the code comment and send a v2 shortly.

Best,
Sen Wang
