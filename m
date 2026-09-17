Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010068.outbound.protection.outlook.com [52.101.228.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DECCD3BFAFA
	for <linux-sound@vger.kernel.org>; Thu, 17 Sep 2026 04:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789619885; cv=fail; b=Xfdj3vyZ/SFWMPd2Qf1IBVy5XshoOe7nXxylTeQDRDLPzvDR8NSf707jnpcYAQyLoJ9GKIZxtdRPPHCdMWi4DdWiSUXsslB5k9cjzQpMBCGsYYIU7tgZld9+BhWa8ISclkngATmgR8m4nMajl1xJYBrsDPFqO4VdzT5yJOaZd3c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789619885; c=relaxed/simple;
	bh=ZAMgrdgn495Uj2I4TArD8kK9XNNBgUhtgPeucW5dTs4=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=S9xGvCbAP05ZjLx1Iebvz5//oCvC9aPwAmnwKl4TeY3V7esizO9pz4SgZbBSbDlwySgSxXwK0vZ1kIu3lastD0uEg/LWIKzjjJv0C8xljpi9XrDvUnQh9TfGdzdSPXZEK9oNE3VBjvRiGS7VuY/su03TTBSbm962VWWgeGqXwfg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=bfgQJz7V; arc=fail smtp.client-ip=52.101.228.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="bfgQJz7V"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZBgTA6BxWP7lK/Lq6aNLjDIverJr7+yb04UBPZpTSgsn45J203+aNWD2O/JA2oBQBwJXrLJ06LxQy1+X5Uvtq2Ssv9iC4npwVsRSXHf8CT3nHTCf8I91PASrEthhhAeorw+UTuSibsYX4olH6in4FFEh92dnVFyFaTMDSPvAABgmMLWCBLQBtZL6kfufC88rGJNmp3C/2xpb0QxqJxhIg/9OUR0YN1PMqq5dT9N3GlxoSmUOblVtg5brGGnsGvc2nw3/wOO914MvIsgoUFUCm7JEBS28YZGWsmQgt6xd+lUnQx9Osyx4MBetqPQETMly51YqbuhrT3hLOHtl8xBciA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VCauzPFTF2ZRkSnpSRNMfzyakfRCYcYxvE1HLYncAvA=;
 b=xHz5UVnyFcZq0LUIJjdTQdRYnIsB61w+2rqZtP8xl0V/naYv62aXibyGtyzICms4cYMETxucPsOAQHrG1LQ/CR814UA1dnXLkA32K4gjEgP2oB6QBoeC0Ale4KrwNmPk+M68l621i2CFpP7zt0og7CYBybfGb8lf1nB3Vol8++1oZX8NFVCXa+WCdKGnj1FdUn47gbNLAfTn5BSXHJAzFl/Rr6TlfovyVZ1kMYNWQJ1PbhFhA06LzBnArRdvu0eieDc1O1Ij2WJPWysBvvQYp2GEQwfM2Sk0+CiA7/ATX+XgeQNnN8/IgVCAwNa+w4kIX9x0/M6zVmVJ3yv7yK9PGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VCauzPFTF2ZRkSnpSRNMfzyakfRCYcYxvE1HLYncAvA=;
 b=bfgQJz7VCteoStF50B0x4FcsvDSnT6HOSTgo+upI4UgNMnKd6Xv4dCWwk/Q6fuGtBDVPPcg0yAGWVGiL30CDye8KwjcqWUTR11o/0+P/NDCLH+X0rn9kZjJ+QhdHBhX26YPqTVW/U1LgB/R802FrBXqw/lpx9J3LCsu/cCO8rCE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12) by TYYPR01MB12841.jpnprd01.prod.outlook.com
 (2603:1096:405:15e::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.12; Thu, 17 Sep
 2026 04:38:00 +0000
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45]) by TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45%6]) with mapi id 15.21.0428.011; Thu, 17 Sep 2026
 04:38:00 +0000
Message-ID: <878q50ze54.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>,
	Khanh Le <khanh.le.xr@renesas.com>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH] ASoC: ak4619: Add suspend and resume callbacks
In-Reply-To: <87a4pgzijx.wl-kuninori.morimoto.gx@renesas.com>
References: <87a4pgzijx.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 17 Sep 2026 04:37:59 +0000
X-ClientProxiedBy: TYCPR01CA0126.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::6) To TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB14118:EE_|TYYPR01MB12841:EE_
X-MS-Office365-Filtering-Correlation-Id: 952fe365-0530-4de0-2133-08df147573e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|23010399003|38350700014|6133799003|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	WSuUwPvo44DIhddkZazekvQPJAPFc4L8D0udVMFwFgj0Ykp23HB9Eq9Zw6hUFbpOyTRGAO8n74oCIzMXeeFxDx2VAYYdRvG3qiR2sKJEUEOMU8NE/om1pEAQprptAvPdJsYUwNzXhe8WqWfdJb3VNVc2fofUqXJ/UN0yLtMX5TbTaXt5ELooBjEEd6KCqsICrptqJMS9MEMu7Hrun+VBR3TkiOprfmkGjptDm0+1TdrhGqOQn73/p5PuCKDhpKZibaozthOHuM3LAdDHXWFz+VixNpX3nief8wjr+LhL6oxlIDsBGh/yeIohuKokyBZRSlMV+kaGFJDBOMLox9Sr+ewl59iI9CxVW92JFJ/nDsxs+iaRvCsNi4EGGFbmNyEbC+ijVPAT4wowzOF+PyBysqKhj4wtFXjAQ+SIlUwfVniLbn2U1ooYrWYUm2E+2hkL//bAnNKcCLxMlSBs2tXdhT7Yr7m99eLptO3q0vIompz6tEigS5HWqtQk2LgbOqybbG5zKU+9LjDvC3Gw8mVP/1KeSEMvUpyaeve9B1XvqlJV5kPG9GidnmY1wxRrmddoAI9NPASQCYcX6Stv9Sac2biYsvyCk3xD55eoMXH7DO4mrCBLBcnj//r+BLuZy1GGuoskYU6HP+yfRsXuSnrjDzm1DU6w/xamdWCnQopNqutjh0Jj9/oojBat6TSEd0YyScYgIDx6NNVyy+TcGV2BqlfWdjsXctwAGweZpYJ56aw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB14118.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(23010399003)(38350700014)(6133799003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7336t9uLpK/fmMC8vwQr5DQ9yWuuKKSSBdbtfbMCp+mCqUe8OONRmRUrGLIQ?=
 =?us-ascii?Q?3a8cA8NnbKld+3dau0m9UuzDHEdNXbNLuttjlRMEqzfuVwYsTtpIPO8nW3lw?=
 =?us-ascii?Q?ZqDbZlYbbeOA8nDlFaTEDwI9vI8gO1e4dlPLVVb8j74XRLFdrT021KAH4GCL?=
 =?us-ascii?Q?dg39dwDChpAbgZEWLJMqfmxZHdL9+woShtqZxbywKqBKckNAAf5MW/IhmUm2?=
 =?us-ascii?Q?161mfTILQsVrn2kn4Z/qlSAGIxBTSFVvoU3twmhf8C6u8wvh/XpjlkFeAkCT?=
 =?us-ascii?Q?Wh1I03KnLMvuVfSfy5VlLqyVNELUK79I4qsDgC4/AMUq5oXCZaRZRiPj4bTl?=
 =?us-ascii?Q?Bt7ougM7HMcV3bwfwsUzo1WurQvxfNU9n9pQ/2ZjN5KfMncXCwidYqjqcbix?=
 =?us-ascii?Q?GP0IG4SKtD7MCztDStSfQ0I0P5CUEyq2jC2n2RsMqU98afC0BbqmvcrjFIvl?=
 =?us-ascii?Q?hEy6cBOFY4za0GdH3T3rU8eHIRZw2zAUdWmDtOnstKg3UMGX9bSfWpsJc9rU?=
 =?us-ascii?Q?hVzSrJC2rNFGINNxTt4zSz6dDcdI9xWgZEQ/+buEN92cVhK3DsqgHSk3nWOM?=
 =?us-ascii?Q?8pe8pS4wKxQmuQRIdQsDIToxs5oKEqtoP8aomotyIpFLdxVzYrwVwFtieQjr?=
 =?us-ascii?Q?vsm2p/iNFpS+dqPmaAa+8f3kiNgh0zOUzKrHfZ4tdvJy2k0mo+fBN4xDvzNH?=
 =?us-ascii?Q?pfgrxqzbSV1aw98L0WcOC6Me1Y+RXv0Qdbjglnq7EwWe0rJ94KvDD8qObnof?=
 =?us-ascii?Q?f5RWYRZOo/7rGwOmThOE6G/m/yKiNFKVWvKp8ENfJRNZTdFuQD/DZMsKMHrC?=
 =?us-ascii?Q?jNPlrUEfPg/RC5lS68RKwooUQ+tdfUagBQG57kF+/ZENyee0VGBzr1vDR/aK?=
 =?us-ascii?Q?0chhKn9V53DANCKvKbEQQbyXhrfYDpm21OrDyJQCNrhumes1M2wG3JJwFBk7?=
 =?us-ascii?Q?FbOySPWHAOp3nZnDq37b5nRgDtxt5NJyJ+S5M3JZ5vhhWqhdlmihq2DPAuNw?=
 =?us-ascii?Q?PcuxA+IbyCwfUqnXRcoxZsQH7NQU2nkz4IZ/8MrWTXqfoe3snrHZNaTYBAqz?=
 =?us-ascii?Q?b4g6g2yZPHGZYh53uTcX3FInkhWMaAmcnuk5cnEEem8zjiYBLhEipYBY3x8r?=
 =?us-ascii?Q?ZOHTii8MD6AWoC75VgZxLL5Ej1IO5rYGkL42f6kO4soGlEg7Rk1Mqn5wkjCA?=
 =?us-ascii?Q?1vAanBsXL55S93MNBz2KqrDP60FAwo6mYqg8Ok8v9l1hK4V11uk8rCnwKR68?=
 =?us-ascii?Q?oi60uQZFr0/zkeJEog+LKsaQY2LOiAOJYuqYUWGI6Ocxu+gLhFhD3MTfFrL5?=
 =?us-ascii?Q?Nyg4AEcDHPXDQycaBCmnQHnUHV6i7jONMes1m8PL69zCoLjOoVte9oe9X9UJ?=
 =?us-ascii?Q?/lfdp9CrywHk7eCcPT0Eh8sLI4vJcIllflw2eS1QFHIDs3q7q+jA6F+uO8S3?=
 =?us-ascii?Q?YzwGJrhopmqiSURrLSBlQsOX5Ttewas6XC74rrRfamodSLKP1fNKget84qMh?=
 =?us-ascii?Q?YkTM2E8EacDXU/7i/GP1fZBx7ao0RC/yjv7rRyY5grYul5/qa5GelnuXWWec?=
 =?us-ascii?Q?F09+rHRA5ahmjQHHwhd6bsmXqrAKhbqCl/csudXshDYGeUuZvE8XJN+jO8JH?=
 =?us-ascii?Q?ns5N/BAlrjPnApGmz77VsXzLTRCe1t7wm+hsSrhp2kv0ZckqxFdg2+lDtwsV?=
 =?us-ascii?Q?9crYcxZkUFDC4lSX36W/hj07o7AMOEHHFcE0urmX92iywLLXs/QgsaozLBpN?=
 =?us-ascii?Q?s2KK6a8xydgHvpnT1cIoPx7+mjeB7Z0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 952fe365-0530-4de0-2133-08df147573e0
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB14118.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 04:37:59.8981
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4gXwxiEpVUtzSiawnajqvHo4L6fUMWtQaZNoxkGRVMeUGzO6Lx7YE+AhMbde30rou2wilKPVulqJc9wKXydbLH/zA61BiPNOXPiajmJBWJevtZ8w9e+P1aqjO064Wjp+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12841


Hi

> After resuming from S2R, the register cache is out of sync with
> the hardware.
> Implement suspend and resume callbacks to properly restore
> the configuration of the codec on resume.
> 
> Signed-off-by: Khanh Le <khanh.le.xr@renesas.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
(snip)
> +static int ak4619_suspend(struct snd_soc_component *component)
> +{
> +	struct regmap *regmap = dev_get_regmap(component->dev, NULL);

Ah, maybe we can use snd_soc_component_to_regmap() here...
Will post v2 next week

Thank you for your help !!

Best regards
---
Kuninori Morimoto
