Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011071.outbound.protection.outlook.com [40.107.74.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D09171AF
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 01:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784597381; cv=fail; b=bzCC1fII+xHotFLFiv6AelN9ld62lru+8sqfrwDlIV2GAkIglHreSg/tIfwMEx2sk81L71erK2Pdm9pIjBTH0W7SHCloAxNdER6V1BFauGQ2NFsJHl904TjgToYY490rk27jma5WpruyQLM0L0Z0matJAIXry489NtDg1ex6ejM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784597381; c=relaxed/simple;
	bh=YbkD4T6EROu1JnArj7cXMifVweFwcjwJkceDsgNACXQ=;
	h=Message-ID:To:Cc:From:Subject:Content-Type:Date:MIME-Version; b=ESn57O8bRFZxQa8Y/sdwYkVPHS5nm5E86f10ktIDXZpv+NPP6WbOIE4WBeFjXu1/tyuE9L9JJK2P8LW/b2KfjoBKE2ns3purmjISO6zR2j146U4KLgLQ0fRlmU42Mn6wXMDvOWmOykqJ2qiVIOS8dKMtoBwMbNi+O/xcBaN9sCw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=o4bUeJfZ; arc=fail smtp.client-ip=40.107.74.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="o4bUeJfZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cPI6/63lIprEv9wCgxfm6zCMRG8w4nGEiiJ9Jm4tCwMrKyC0fef6mvJCt9rtXuEp5otjWynyLMxuEu/WxPrFpwOfAYF/v3n1mmF736emEpdqHm6OuaScUyB8Nx7XH8b94ZlZJS3W7ZGNcls7kpkOvKVXYvxZFunxD6sSNIY0SJc9z8HiphMxO86nXYnzj8chdRn2NLBQnNWK1a7muxYRX1HIDg1QbeDLRkgNFWn5sVGho5YxeJFtcdC7jUuiTLqILJjNFyocCfsF+Pj6MVztz9Zd0lEinI36amNDMcg9aM3RzDKjlffgSmPZBku5tYTSzavUwE/r1/8AeYfw1Lpi8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J4NAGEzinqrREHmPPGQZ3ZNrQ9IklV9Spa1Ipbd0USU=;
 b=rvUWfRQ3Nar8spcgZylIaG2WfVQnt/S0jkDCo8Gk+baFf6XE62BxQJQYdmbd4WfDMR84SdN8hSg2fzbN9e5I17ytcYf0NDWBS2PwiIPfeP6DHwh6nofXIthkkluF0DYKBVjKpsuNo+sKG2+pTQ5rpSH3L6XU5/PdHS2ol3B8RVpPPtX7+sGyJU1b4G2SUWJRp9mYSKyaW95Viuy7ftRZduV0AF9SswO+PtOA7nqUVS9S/V3Pvj/Sz7J+A4VzKssW/1jtub/9Hc5yr/tYXOMUs6FKWMytYt1SHisbHpJdOZo+X5fX6rpclmifso7aFW2kzrCWYzEYqP/Co390b+KARA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J4NAGEzinqrREHmPPGQZ3ZNrQ9IklV9Spa1Ipbd0USU=;
 b=o4bUeJfZMv54EUUvpbS/KCDWzo2ppNfpGxpd+55AdshAcvs6OzUYB1i3BYFswPq6VEYIb/v/VkT43bGDYrYN/xCN6uBMnCgbKpzM8brVHFHkxGOvVZoYHh6Rb+210LyChglkyRJIVXhAVi46Aj5ZddeEp5U7dywZ/TQeVA2JiKI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYCPR01MB11070.jpnprd01.prod.outlook.com (2603:1096:400:3a7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 01:29:37 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 01:29:37 +0000
Message-ID: <877bmpjfjz.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/2] ASoC: fsl: add card_to_mdata() macro
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 21 Jul 2026 01:29:36 +0000
X-ClientProxiedBy: TY6P301CA0042.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:3ba::8) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYCPR01MB11070:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ea37539-b1d2-4992-9e9a-08dee6c786ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|52116014|38350700014|56012099006|11063799006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	PvW40EXJU/hBnJEFI3AJj6M0foQDGTsrc8Xbw+KU5zWPnUqdfkrytOFQI6EwX0xhMh2CVXk+KqT8REkD70bjAmK7mTpprKLG/jWoZ9EgHeB7eKBHRuDHMDC20ettwbveg+UNMzq/MMr2Sq2iINi/hlP4omUTGdTFN+UA6icKuTT5fRqnnek+RuOW1dnLCMwrxTZfSVlHy8kH7qqCh4ZX7/l2GAdTcLtXEZcWc412R46s/CbZpXqMDIvIn5gMU3FjRzqE71HzMU1GdjdjxKCPwhuZJ9WkpB1A5j8rlJy6kOk1b7Lb9ACKzBf3q70SULkJ3GacFsxf8lgI/U0chel4LoQ9NcNvIhN74foxZnrOCu2bT37cU0pV1W6O13PaBg0sQZXMGeWiN4k8FgZSafMfuzOdc6BVTPvXlQgTklodu1FS2Kd8HSl1Eo5fTeTRM/FTNQXuiwngGhT15ZzvgB37vhZlpeQ2gefjC9DLfnMuDe7R19QEMlAcFXtXhbDgGLOPWseiMjQXGMEfvMGQmc87H46WNo9iCOX84c/YrImr+yz5/YO++V+jvHqhL4jVdB7fvUdtvr1xe4FoHdigzBXSORBJijk8XDeA8HbuW9LVJJrxPqZhve1phbXQw+K1ZkaJ9Kte2+Wig/o3tIn5/jp56er01Gcn0iRNDCL+3CodoWY3YeRQJ7RNy3eRuxVDEYmPSLkipXAXzeVs71Q1Wsii+g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(52116014)(38350700014)(56012099006)(11063799006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?374KX6ZUBxYcqRQFpxVvq16CwdzRfptCe0DO+XY6lcNOuxQbVXkrpGglF0v9?=
 =?us-ascii?Q?TfXwBz8uT862NQXkF/0NsF/0M98sXBV6jj5AiuabLCxOkcrSP2IFfIr5W6Ao?=
 =?us-ascii?Q?Oy4pgSwTE/u7xS1vv5u/zVj33BYoO4H2YcGj27ZM1tICmhynZayz7Pzjxooy?=
 =?us-ascii?Q?MQBdeW65cwBPMUz29WUjoXKNGW2Pw5XsoetwnarFVapJj7p5nVrXd8BU3Pn7?=
 =?us-ascii?Q?r69i2RfPtmlGGEwPSpnnjvBv+zuq0fBqSvOCO/f8SJ/5NzL79L39XL8vEhKB?=
 =?us-ascii?Q?3Jp6HX+DABQuXr9Arp476ET70qRaQBLXpCcV6OijQ/Uj5THvj7QkNy/s1Y9+?=
 =?us-ascii?Q?ynaZDOZUgPRWjwQNhHdv9ZV5vHZgD00AWZ7zdz4whqNwzcpBrMz4RJqt0d1G?=
 =?us-ascii?Q?eEgiALgbYF5wOaVENSz2fXdSEncIRWTi8gjVOITW63uSNHZROLnhQtMAk6g4?=
 =?us-ascii?Q?luVLf2rC1W7PMvPb/jRw7i3Fqedk1z73YCTu/nktKoPFAjIWi9HC2p/QkQXX?=
 =?us-ascii?Q?kvlgeGWq7zrQfTa5Tch5Zq8JYTZuPrDhjUTOChQzH+pxhftM00M9oqm2mvAC?=
 =?us-ascii?Q?D3B7ooKP6hTcjhbY6gNUYCjeuZWEqcXXXPDcjj0Y2S3dYp2plLf5sH4mpHXm?=
 =?us-ascii?Q?mM5JPXw0gdAMJpsJCL8dMi49VeXy5IWmYyN+pSTkVJWe6oplAy8ZpVfF7sow?=
 =?us-ascii?Q?zufE0h9Zacmhu4DGuOzm7SMQRe+Yznu1a+dVLWd8wp2uJaIErHZ8pSnbVojW?=
 =?us-ascii?Q?qQdO6ndRJXZvQhjQLU60vdDRVceR+pyyPG1BHgKVA0IDhYc+hXuEGfA+jpx+?=
 =?us-ascii?Q?UIEwl724LIL0fnzALE9TSBTlxF4zu0gIOSZ3zfyE8ZkFHg4ILuDQCaYWd9ce?=
 =?us-ascii?Q?L6KxTOutMfiVeYRIElPIDkHzmmpEnSwAt1xiFiA1QxwVuzmcDzB/6nyF81Hu?=
 =?us-ascii?Q?bL0PRYMY3vlknRDPoymwaag778A30RLtj0FOWnKcwafac4UP2WX8rLkIIv9R?=
 =?us-ascii?Q?kBueBQK4lneSx5DNwypYP30K9V29Bp+u9HtGMfVLfwEGmGSJ7h0/6jcJpUaf?=
 =?us-ascii?Q?fIKlC1qySM7VFSPK8VOnrjDBVGj6+dcyU4A5exM4sQmBxul3YqPlMBL1hkb+?=
 =?us-ascii?Q?E8Lh494rolPCSo4ucBf0EAU5575BhjpsQ4bm1OmOyLs5SA7uSjdYdY+PmUwN?=
 =?us-ascii?Q?Y2Lt9Sqn23HIMlTV7Ex9XAeTsniT2WcIMnDuCn1f4rIOgSKt5/M+NNHSyAJ+?=
 =?us-ascii?Q?QQZHmQhS2l9q31izo09a9Fml7VWu78orFB8tWoeWcX8ctKnmrUJ/VL9MfIqP?=
 =?us-ascii?Q?k1Yl7uK78bhHwysSMIFREfLETjRJDbDiVx7G25XDqYJz7HKvBfSiEa0GfW7S?=
 =?us-ascii?Q?YMMCZ9lYhsMPvIgJN/uvAHBDx0YYxL3WfkmLCqYqNgwVvd3PgtJTIX+C8JwD?=
 =?us-ascii?Q?kGM8hFqWcY1gFAXAGYdbDPbNWRFGJIHLxFvBLx/RWEsuNaX/B0SuPztWchgD?=
 =?us-ascii?Q?7PH4/zgl4U00V9ebBOvaph6rkXF0/nR2Alb5xTBRGB7WuJUn0xJq4QYS4pO2?=
 =?us-ascii?Q?t998V0MBI4wF+5/LpJt+NFu/RdWqB8bFDDkclrzI636czj7NEH+Vw+IPn41P?=
 =?us-ascii?Q?27zhd8rCeA+Vx+mB3QPDgLHFqSAb6Myd9TwUHskFa08r7ePczCnVT0lAFqqM?=
 =?us-ascii?Q?6e3j/ZYWP3BHz7uVWAckDipdxEZiJnU7Q4TtzY2vbV06xdwaacv2Z3GbchL7?=
 =?us-ascii?Q?Q1JMPTKCSl8TF2hCjUBxKrG3uUW8nTbA4jO+G27EDB5M83oR0SLu?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ea37539-b1d2-4992-9e9a-08dee6c786ee
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 01:29:37.1045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZO4MUuTwpZHg1IFHlLIXMkBJ0j8saYhD7Di9syh0EZctY5ngibhp1QVHuZ2Lt2kUKc/VUR4lgG/BX5lyGgQf9RN7QEoOQ1beQv9j5ES1QP+7HQTedMVWHbrfDyqyiO/T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11070


Hi Freescale developers

I will post Card capsuling patch.
To makes its review easy, adds card_to_mdata() and useit to reduce
un-related diff.
No functional change, but is preparation for cleanup driver.

Kuninori Morimoto (2):
  ASoC: fsl: p1022_ds: add card_to_mdata() macro
  ASoC: fsl: p1022_rdk: add card_to_mdata() macro

 sound/soc/fsl/p1022_ds.c  | 14 ++++++--------
 sound/soc/fsl/p1022_rdk.c | 14 ++++++--------
 2 files changed, 12 insertions(+), 16 deletions(-)

-- 
2.53.0

