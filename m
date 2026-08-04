Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010026.outbound.protection.outlook.com [52.101.228.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D271B2931E9
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 00:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785805167; cv=fail; b=ApkOg7hY0mKDNJw6IxqWFqDYsV5W/Av05uIjPvYk+C7spTpb4KPysyRuJvX0xKMCotghpMlwfKwJW5X1ePr4k94YbIOWz+8guMNwn6Kp5sb+EOjnBk+qrsE8GERoewXaKCsESGrMbk+RzNzqktQfDfhcruzHUwTWHdYItW1cIf4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785805167; c=relaxed/simple;
	bh=DHp802XzbwjFWEdxWSo+iWLsb7ujTKyHM8IcbsJ5ToI=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=mygn2aM5MuI+uavhCXH374Hx60Usnz48fYTVU1G6IL16uW+vJ0dxhq51z1kGVhrOtxZFB9EiAOsEtH6goirmt2rDB9Jtt4e0wJHgkNJ+l93Zr8qAvKxKkyDdIRc4sSsoq4EdHb689kFbnED/8KOzyANqHsyoL+TzbC/fZixb4vk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=hYyP6XsE; arc=fail smtp.client-ip=52.101.228.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="hYyP6XsE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LH7bK1F6bhA6GVL1xPwARuCNhEscarxVGjbuNphsZRdVTIPapamqpAvffJcdl+V9Ki5+5Z9UqkJ7MNd41KymBvKuMOsxhol0ku6ytK+0mfR/Bp9xEf6xH4t2PGJWPiSp02X2e98Q6tp5567SeiNXCOF9UJ1AIXkAush3Lio57uVauPzmD4otk3Jeih/jQCyBvcNI5Q4U9Wkso/vsdMvAcQirFBh6FMIY0Yj3eF4rqwVChDFSZQSp2AFrzy+x+9xY3RaSzk4Dtbw3NBjcILmSYA/o/Z+dt6E7xfXHG82eVSPqre5mmBGAp7P7/zuHHFeTe3Us3j3KOQjPmUZlRXu71Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NIB9RrJQ8up4/0sEhERCBuDK6JYJt6a3qWkA+SuGY/E=;
 b=o8uHgKtOE7tG8GH8AScqr9MXHq7NeRguturvCe882vAuPKFgasiNK2505sDDtURXcv6h4zadbRjFdRd44ZvUVjvLqYw2lRCkLfVQ+FbW6ELEeqmmjg8dLw86Xl/W36aEwpVNuA7QTHVyzG3wTE5IgrixIEK9TgfNxiLjE4+0BaVRWd61INW0MwnJ9qMjBaLO5lUf6CJH9NmyHSFWG2LWQY/XQXk/Qoauy/pavktutVjEAVZ+QYJBCSnjt9ftOdeCSPVHeoBO1aw5pRQT3oJ0ngdWRpLqJC6StUxo7uYYIb4vh7w7iZ7XBmq7jBJQ60qK7IRqHLNY2ujhovogGw1KlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NIB9RrJQ8up4/0sEhERCBuDK6JYJt6a3qWkA+SuGY/E=;
 b=hYyP6XsEwS0BV+fjc4aQoEdgJLKEF18aV3nBhbdQrHm60yabWz8C1fjDH/TB7AEIgkN6VJiYY+SEGXeI+orp7oeRXYMXQ10jDjx13n4txDM1phTOL0lgOrxl6yFxwj81wVB97ioqt9sOFyO4Ke60H65hS6YBC0ZJK82YGxNBpi0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS7PR01MB18103.jpnprd01.prod.outlook.com (2603:1096:604:4c5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 00:59:23 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 00:59:23 +0000
Message-ID: <87jyq6vgyd.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 2/4] ASoC: renesas: enable COMPILE_TEST for PCM SH7760
In-Reply-To: <c474b067-e549-4d51-be21-4337cb8de184@sirena.org.uk>
References: <87zez4rmrq.wl-kuninori.morimoto.gx@renesas.com>
	<87wlu8rmr3.wl-kuninori.morimoto.gx@renesas.com>
	<c474b067-e549-4d51-be21-4337cb8de184@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 4 Aug 2026 00:59:23 +0000
X-ClientProxiedBy: TYCP301CA0064.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::16) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS7PR01MB18103:EE_
X-MS-Office365-Filtering-Correlation-Id: b9219f91-8289-43eb-e31c-08def1c39f98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|52116014|366016|1800799024|38350700014|6133799003|56012099006|4143699003|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	NdUy/7372dLfPJUTqEawfnw9zi6XBt7gz6GzlTgqSnLuJ98i91kxPTHm5I7a49ikiMr0GXR4MEpZrL7Sfc/M7NS+1Ls/2HO5zH2L8gmWTqrW7iuT8fPdQB16vomd9IS9V0qTrMo5+EMnoUBMAXtnmGKe2DfSArixPDl/3552yudGNVvQkHQGp8etR1AwX+T1ebn/gmSEzPOXWX+R3TiKltIDoUdwW9lv0ozfYI84Moi0wEiGoAXmOZW5kuQ0GptANYWdtcyAx2dDLj83jjGv2sXti2PxYFUUMi3e41mUszR8j6Ml7gh1M8IuFXzKdO2aYUmEzWswkFWtnzcjsTf2QBIJ0RX27XkdebzdKlzxRWJjN0xQRa5ygjb3kO3e1f8xgAQTZGA20X2k7/ouItDoalrOVKk71DmJxRRZ4IdZUaCr66sQzYhisKFNeEknj2nqyJgxnKlAQoFXjl4LfkSeZoYuRgMiMhHcFX2DqXey7VEUzO7HuoYGPorxUh4m76ThigzqSNSim+WVrbBzKbATGcM7Q4ZTuntVTauJCnQ0RqpISCKcbNeIgZmUXOKz1cw7dcj56glrAAG37BGHJZ5GeLKd0o/t1xSJgOtrUFMCjk6mm5ItqGQVbdhhVhY3yz6X5SZCDcsfo/HG2LSEVS1Oot7pKaMkBOT6r0UXKQbHXWjT6D4jGEW+xUVrYAp+181Voq2FUR+cLvUkmFRmz2rKSg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(52116014)(366016)(1800799024)(38350700014)(6133799003)(56012099006)(4143699003)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ANBCN8D5l3I1f08hQQcZ3LJ/BnGfFHY1xgduYfDTcjTaeSfuW/qIa4curFBB?=
 =?us-ascii?Q?nUwCBDUSe6YhU+FRCgmfLnIJJeglCts0CkTxS42khSgaMqwLAAnjUmm3UlNR?=
 =?us-ascii?Q?IQ1HlSvNMllB7Vpkwhq81DV7OjO6JgzdGxfoztJ5gqYevkdXUtagBklsxk5e?=
 =?us-ascii?Q?1ucx+LhtRi1xnwhSUQSzeGRAT5VlclSB9YCKDOioY7AsF/a5WNBCk4PVbPtl?=
 =?us-ascii?Q?dCsMF2PrW8mdcjz19NbhMIAnr1K5IoM73tWQD6TdoNPAnrC7Gwq3QH2BJPwF?=
 =?us-ascii?Q?QC/sWn8tAoTGjin5FBLbw5T+WdJeOjCYGeyPE7jLM5KXGEkDYxDnLPxLUnJ/?=
 =?us-ascii?Q?ZtEJH55zKavhMcNWoecsjR8El5DIo/OYpDzPv3HvbPtQW91aoXUqeX2O+pVg?=
 =?us-ascii?Q?yIjwPV4SjfoYjeVZuFJgGYcj1xlbpNUBCP8h6zrzOVsue/qOzioib6mK/59g?=
 =?us-ascii?Q?Flsv7bs+bR4LNmb1e22jSNQ0bQ2GJQKj150wE/SN/+dlI7B35Sd710p1CkS3?=
 =?us-ascii?Q?W1+mpga1PPQvgU0L+7cq1f+mdl7IKQRJAIB6t8AGUGc8RiM7JYUt8r7S177h?=
 =?us-ascii?Q?UskoEkTH/hDtTUgyiIOk0RBdYy/EsLrquT+2DzfvLb6wL0HVPwaasboIW/Mo?=
 =?us-ascii?Q?mJBgqxTu/xG1QjkseZEuk2EzhS1KfsZEZ0phjAtkFt9zORA59ajJdzvHcrKS?=
 =?us-ascii?Q?JvfmW9C0EAeLOfE9JMDgDfCIoWZNAJ49IUf7QF1WpiEgVTOjG8D60wEu94hS?=
 =?us-ascii?Q?MgIHXx+Y+1pO4RWvyUjrF8FqRoIv+QXO5BxNGMg4RMBe2xXHVgGo6aiduhc9?=
 =?us-ascii?Q?6PZV3NTBPAbVwKMUASDw5+6gwI1lF8A6ImYVfKK9CjZ/5lO2WMM5lLlcwlva?=
 =?us-ascii?Q?P17Q1AVRhY8uPnBDqRIzq8EgLhPf44nW1AHHPtkpWb41gOtTh8DmXqOewoVT?=
 =?us-ascii?Q?JBQpk8nQjgotrmlQj86jdqQik91nIuQd0g8r/at9vRPg9fiwBxEWGPQmQ45c?=
 =?us-ascii?Q?tGZ2NqQHtdRgLc5ZvXT3VURiU10Jw2WYgvvg4dPKnEfT/k2LD+dzV+Qj+JYV?=
 =?us-ascii?Q?x3S46L2zfGUgbJMfdu3HlYzwnbCForDJJ1iEld1/ULYpCqptHnaVciRBloZT?=
 =?us-ascii?Q?7iJxybcrNmtTj2xVDEookhx3ZZZvikoRYuh0vkFTpvU0FwYpU0TJGafQqgir?=
 =?us-ascii?Q?Ztgt5cTgCbo2L5dqeeWyQdPV59rKnWdHHhrV5L9s/tvtXS05wc6kiygjdMOn?=
 =?us-ascii?Q?kdBlTnPzJe31bIYBI8fAr7QBJqmT1Uh2T7bu7kJ/r87mgMXYMwk6rMT+5pBt?=
 =?us-ascii?Q?p2vCSpLki7ITB9hMv7cTqh0IVs0kjBqGz9/TqeEpTnudTsgniXC0r0/yYy+h?=
 =?us-ascii?Q?hGVX31eESFOq0GN7QXB9MEUabJ5rE/LO2x9HggameKN1qFnm6pBOVkoPdYsg?=
 =?us-ascii?Q?7RdkORgQ6MFavwZ6lGx5m8COMmSB407gbaFF0Dc8Uz6Gk5hhpII9+Foj3GsN?=
 =?us-ascii?Q?P+B2UqHywqU3AMSbwVpmllQxlj3Otza+01w9aZBG9DQ7c9XhPfjJhJDomt7C?=
 =?us-ascii?Q?V0izPS0TIOxt3vrEmjJ0zxkyiisq13Pkz2f0Y0LvbZNLSz2mld4agknLRcFJ?=
 =?us-ascii?Q?ZTBXRyuJn/eu5rhb+Sq7WQHdxeff/N4x8PUz+IZ/JYtVfN1wYyd6u1ucJB7o?=
 =?us-ascii?Q?Hn9UTgK2F7a+cr3IVkbJkk915wfsnJFEMhvRTNmP0h/Gl4FJ6akO/Bh7+oT3?=
 =?us-ascii?Q?zrBIorHHhZ7tzyOfFW2jSW386p2ZCu0rhZzHufgSxsu9uj+Mel4w?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9219f91-8289-43eb-e31c-08def1c39f98
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 00:59:23.3363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uw12vStTS5VJl45urGRkd9cyjQ06IOL4KFa+IBIiaNSzR2nQM4Rmex6z/k5C04orhCTrmYX9a1NyTB2L4STjs3L+yFv8ohxvWffgHUPJdrIBYpG7x7FdnmPiRQP4CRsW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB18103


Hi Mark, Geert

Thank you for your review

> > PCM SH7760 is not compiled with COMPILE_TEST, and there is no defconfig
> > which selects it. So it is easy to be overlooked for compile test and/or
> > ASoC updating.
> 
> > -	depends on CPU_SUBTYPE_SH7760 && SH_DMABRG
> > +	depends on SUPERH || ARCH_SHMOBILE
> > +	depends on (CPU_SUBTYPE_SH7760 && SH_DMABRG) || COMPILE_TEST
> 
> SH_DMABRG looks like an actual dependency, there's custom IRQ request
> and free functions which don't have stubs.

Ah...
SH_DMABRG itself is depends on CPU_SUBTYPE_SH7760.
So I think it should be "select" instead of "depends",
like below.

	depends on SUPERH || ARCH_SHMOBILE
	depends on CPU_SUBTYPE_SH7760 || COMPILE_TEST
	select SH_DMABRG

Thank you for your help !!

Best regards
---
Kuninori Morimoto
