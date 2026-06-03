Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010014.outbound.protection.outlook.com [52.101.229.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230AF2253FC
	for <linux-sound@vger.kernel.org>; Wed,  3 Jun 2026 06:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780469375; cv=fail; b=LLsjE9CuVQ5W7zEZwB5gJ5n7q8nnMO/WJvVgAUP6xue/L8YFb5/1L8obYqpwe1ZMLqYZALj1feMHxdr92cBBFBv/rZ5YHb4va9bTNAbReUssmwF59UgkCBFZimyEHTM6+/jc1W1T+YsWgz7GRbZhgsjMc7tOVOj5eGO+qpfJ8nM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780469375; c=relaxed/simple;
	bh=rrn/neI3bNHbG+II8lgYOpR547HwjsMAcydaYB+rqes=;
	h=Message-ID:To:From:Subject:Content-Type:Date:MIME-Version; b=n8YLxpNGuf4MPHB36qSKTm9XJeA8InqGQcz/80qKvfL4LgdIMCC9j436I4sLjH6+O1Wn7NBrdtrZxmgxgEIRlQ7dhUGcv4OziZgRCuXYaIfkRSEGtkSVRZsc+ATzvcPrTf4WFSv1pKcyqakLUZPP/QCl6Lu55hZYq5Sp5q9PIFM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=j4keXjlQ; arc=fail smtp.client-ip=52.101.229.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="j4keXjlQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aZ69leNSRhDu2Tv3XZrSKMOkJPjf07f5I0Ha38u+qzMxViiLq5jlbFxlaoebxm+7HiIUCr1zpu7U1WbxRu26eT+y1tv0k26vKBVQqOTTSZOeHkp1WWVMT+li2/r8rrrfVhN3+zYHxbhyQxRHDJsk0dMhKabXkDK6vr6GOtzz9AH6br/q1OWDjcxdnckH3Q6AEWocOZpBMzopD1gG0+5+5Y+4/0LTnSjV+N2j3u51GLfhZAKtoA5NCeipMBFHFHmGOyfCjbAlIqYm3JIylxt7t9YZDOcPvi4+hcxSUjRi0XGEfZlopKSoPJvbXhW8dGgvOsAzYH0PJgcOiH0MhgCTOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1LJfyLKz+IH9OFbUH7AG+Bev1ktRx72OUXXH7aGjtqU=;
 b=gOgP/JEO6jfq76vKzuF+SWDZ3ZV0cyIZxWx4eNhxy4eqPbflcy9+tQuoi3Rgw0Zkm4Qjy6jB4vCWqsuoUUxS3+2/DivzsJ0VaaDMrKdvaodYNLSEahLRjxrmHt+0HEDPzT6bEpgy1Kyg1emXUsHQsDNap+bTOHHRKZ0Dd3ZcH+ghUlzJ204w6JlFnKOH0pU9f16aqwbEGM2ug/jEKqE4OnPSZP/LVef22W/lILbrG5Y36S+VUWt6tzyvRga4/LqgmAA3oR6K3M3mZ+0GLPveZ0edSvZwjnTZmf2XItk8PbfWQj83vwlMbzaWwkLuCIlgODAkwlGphMn4uBjwPONniw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1LJfyLKz+IH9OFbUH7AG+Bev1ktRx72OUXXH7aGjtqU=;
 b=j4keXjlQkXfYlC1aTOhCgGETDAoe1YFGWdxFGEpsZ1MBbAPfRtAOay/Y4Hc0ppgjdSm8HWGfR7FuabeDgrZGOU9DAmf2B6YZZS/sWu7Wn9slSuHta1YVUetsX94Bl5ms0Sh9VrHLuEfDn4su7is/6d4UjkPpgybZR7TKC+WnAvk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYYPR01MB13496.jpnprd01.prod.outlook.com (2603:1096:405:1bd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 06:49:32 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 06:49:31 +0000
Message-ID: <877bogce4k.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>, linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/3] ASoC: amd: remove unused machine
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 3 Jun 2026 06:49:31 +0000
X-ClientProxiedBy: TY4PR01CA0018.jpnprd01.prod.outlook.com
 (2603:1096:405:2bf::7) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYYPR01MB13496:EE_
X-MS-Office365-Filtering-Correlation-Id: dcf8e82a-ddb0-4c6a-6c88-08dec13c4400
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|18002099003|56012099006|11063799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	E5yOFk04OtfCcsxmwgn10mIS8qafwzEFF1niddyn5As2QGLyFm5aIC2rMOkM3i97QdLDqrK+/RPUgtx305p9R3o/33SnF+cgsQw8n13r9IcQ52UDaA4Yob3GKGXqzdyKciExB/SIHr7mgi00RpmCjXxXp27GyEjmAVRGEluAHwQ0zCUWwEwUOB27ZxNbmf6jt5gQpEq4qGSLlsFwZb5QdA9OOKGyhOG1S5tRM/9dHtpMTNRtEaatYBUzRFf6gRb6tAJvOx76u0sshF9bStzAJ/fhktnNj3sntMS8dyGo/ZPFogJP2pQh7Z6T2LeoQU2jflpCVZYouzvRf24BztucHPhvSFtg9BT4PLy+p5hd+hWVCYevbA3qjfLMU77Nl/eieL1P1Eqg0D/PkZO8ooNc7+eJm9GTqKXPC9l2stOQiY3uVOsGTXzqmu6SH0iBeo1LupWfKD4iYr/7MlqmN797TqjAlELwclXuhkq+/5iQRpocxqdd15KOuW/Qh8N/ifPk7bjmLg7uUPgZqzPVS9p4a5oXPG7nEt7uThUqJwdVi2xKsWt78zawbdef2M5KHH+P6UQJ/8sP3Gd6nFFNnVNz5wO0TUTf8eo2dGWxl0j+M6IGbomMONRyGw0CrL675a9bcbcjIny1+H3mJfMyJ+PQkWBqduR4eKi09l9vicqYI8VuUpUW9hds7Gp3gR+CwzNeZ7EOGXlYqujX8pMwTPrpLtYZOy8Voq8oN6AzceLaZEyMxFbVhAzMTcQWPaUgiFbo
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(18002099003)(56012099006)(11063799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zm1jNkNz8ILhjZz9jyHnq4Jf2zFVMwEJAHej2BorZCS9RbYU+tZUMYh81Wyb?=
 =?us-ascii?Q?3vo7RwUp5XXcTKS4JNaTEOL8ZA2vO76I3pUx2iabgojHVBmS/YrMIZOB/ESu?=
 =?us-ascii?Q?rnIhaqk5/Imc2lY0eOYAJQ4gHap27eTmSvi/k0T4VtGmUXt855aqk0P7XsU2?=
 =?us-ascii?Q?1WFxWvmfsHyNtA3od3ngQMehWiPRVenwffgF4oYheJqMhu/6Mxqc1UwRy3Dg?=
 =?us-ascii?Q?XBKE2t0I0l8RfQPKtGn4YzI4zTV9eRhZdqmq0xjig8NT20u/Hb5NXZIQfe4U?=
 =?us-ascii?Q?mjuXS+f7Lk7F1LTRJXA+gWmU82/+JtSX4doTyUf53h3KirfhUWG9EAqDL0I+?=
 =?us-ascii?Q?Nf+G5WImO/kjKy/vT4iT7ZtMe08cR5EOcupimVsG+9r1eqFcb1pPxBWocH+H?=
 =?us-ascii?Q?c8LicquNjAVUJSZYZdsu8ZmjsBbHotKWruEwp18YLsROkrUidmRNx6YolgFb?=
 =?us-ascii?Q?tnc7uJ2Gim/59t+wDxQip9bFJVpiQAc4tZpkVaT2bv77UMEon8WPl8CXkAS2?=
 =?us-ascii?Q?DI8OOnrBmId1MLu1hX2GnYZ9+GGJGHmKu0qzK5zHGxHwblZwddTSg92a0jVw?=
 =?us-ascii?Q?qUOUx7BtrTvOVkLoWR8x0lMkIUTngEG+hXvALl0o4HSaSa8qSIQBV3zALluh?=
 =?us-ascii?Q?rfwgC97yY/h6L27kkrkX1ZXNd+Yfw8c+V66m4wZEXtUsLebIV/iN6C3qR/UM?=
 =?us-ascii?Q?4vYl1Ay9rJ4PFPAxVG0IiRZ1gn0ekPFbAKOW8LgxGCLpiLK+c47L15JFXxEx?=
 =?us-ascii?Q?brYnSBldYLLcRfllhJRQxfE7e64B0iMzX2kCdd1b6Of4vVIZBT5YIPCa2U8r?=
 =?us-ascii?Q?RcJulii1NB072zICXLiy+cDXn8TDOIAZGGhzcdzDDqSAxKK67fw0RqQ/FYmV?=
 =?us-ascii?Q?cnRQSZiHCNBI6Jc5RKUqjAA/2knTH3hVaJsQAcZAbWkTXhAIYqt2rK2AfLBJ?=
 =?us-ascii?Q?2LMVw2EXAJ3z1Q95PzVacKlrAKV1r3DaWLFx9wiJaIowoL1iaqf3zl8V4dIh?=
 =?us-ascii?Q?rarPNmMR0hmP0RTxQ10FGPt6JIpekNWqi36pLRg3/0hC1W70Zr/Nq4OVMIDT?=
 =?us-ascii?Q?BBuL0q134rBhO5Q2EXzE9UmrQ0xHXswVMXvjVt+GLlSFjMtjkVMlzRJ4Ls74?=
 =?us-ascii?Q?YWK86LmI36Cka3XrJX/WxK4B6UnwT/q6eNDlxmP1mmlihbukiqadq2wQzVD3?=
 =?us-ascii?Q?K73h/lJwCB2FYWIc1McCDbyR4cC3s+VdNkE+AT+aiV/asEQ2SFQVXaAXvxNK?=
 =?us-ascii?Q?lU3V65+dqsss/48feZAEtPKg2xNGL3nRzMTvEsXNFH4Wyh8d1byk0CCPNmwT?=
 =?us-ascii?Q?I96Gn+FWCiqstfmiscjdruNMxMgye3Gb8uKp0SKHtbxUEW7CKenPfLRwkqof?=
 =?us-ascii?Q?W1cK7etdNu4XiXdTJBqjVqX9OgeKBT6OSUW4zzdqTBO+Ipljtfn7SQ9NWB7+?=
 =?us-ascii?Q?MA+Mu0fMQWS8BkDF0R9MD32/4O9DHT6GegSOrlQr2luCJ8PUNV1siwI446UG?=
 =?us-ascii?Q?xwl7FOfouWfj1476DonfTkQPbrPbQwBSxUGDKwsaWkgDS90QYyV5a91+kT+u?=
 =?us-ascii?Q?ffBWCN5GVtCjtHg81NPfPBu73AMaWc06xEvho08iwPThm4y6G9uLqSiowT7h?=
 =?us-ascii?Q?eGrlaIC20jypnQObNaFDFshZsMK30wQBe8kefcrorSzYGOFb5oG7F2tkETBk?=
 =?us-ascii?Q?0a/0ZwGz8FuTC0CR1xzCZMsZN2qN5gTDvqoytfhUwpmcm5wh8IrmBhYK45Fl?=
 =?us-ascii?Q?eDh/08/MjWrTXZIUCDqAkhAEWoGhN3nGjdg43/E0w43DluXpofb/?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcf8e82a-ddb0-4c6a-6c88-08dec13c4400
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 06:49:31.8112
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b1zVaqA8BkIj6lI5yLHISCqYXIB1TWdeiN0D4A598o86Vx5NaHCd5hUHOvmkv4fBABuz+BL0d9WlX6RMyjBGILcX9vhGwK5sjY1+6XcuhH9Kq3u+/cxpfa30fA6htrG5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB13496


Hi

This patch-set removes unused machine

Kuninori Morimoto (3):
  ASoC: amd: acp3x-rn: remove unused machine
  ASoC: amd: acp6x-mach: remove unused machine
  ASoC: amd: ps-mach: remove unused machine

 sound/soc/amd/ps/ps-mach.c      | 2 --
 sound/soc/amd/renoir/acp3x-rn.c | 2 --
 sound/soc/amd/yc/acp6x-mach.c   | 2 --
 3 files changed, 6 deletions(-)

-- 
2.43.0

