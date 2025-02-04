Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011026.outbound.protection.outlook.com [40.107.74.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9BB20C00D
	for <linux-sound@vger.kernel.org>; Tue,  4 Feb 2025 23:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738712160; cv=fail; b=sbXUExR0kkNSQ4K5zQ7GS4wOV09tpbw1fIV1Ee7/WM84el9BZGySnSSkxEAWge8UeAyGku+7xD4mqwl1dzHXuA+sNhaoK67PoLVNe9RrcP6RifEjcZYik4Bd6lQpsgscRNy6IjGQYjC+Wi6lCcj/4yZ6eLjYX/R5Nualo7QEoLo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738712160; c=relaxed/simple;
	bh=13jrg+WdFd04ieQ9uYRv803QLfcoXRkbpgTGBvScqXo=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Sf2HEB9r+gR/Y2KMt7ysdA7+uyCY30/mugfLlkzGrHefvSgJojGdrMgzZXE5c8wOwv/HSOTh/nDQCLLCpFtyK28YeWXuEyN91CKKMLFWTFdHUqVKrFvptH0A20ZgKtRqFc+A15soQQDJU+8B3eDZbxiUMau5sf2eayhTru+h7Fk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=NeU1c/Q0; arc=fail smtp.client-ip=40.107.74.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="NeU1c/Q0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kxYkNXKmgi/CQ/2omPng7grAzEYFOxxHpBpAMMAC0rIuh9kYTBV3k9yi8hYBMHex13op/wgDf0z3Hjtz9ZhbVUqKTVvcx9UmrfWw88wqnIlwDBitiEAnYaN6RFnngXOwtKSuefmGbl0oTE1TiDapHVT1qeR447IqrqVK2xfe8EbnkAplev6Sg6hfx4Jco87/4ALInc6ixpQrUXt3sVmbV6Bb3U6xsleSe3WjBpMbOle94fRZJyAcRvmTUHLpJngVFPKlUzj4Kmym0FtAj1vEN1TRxarUy/3HZo+ldQY0thwP1QdLMMsWZIYE1siQIju4aVhzGb37K/iBUls3kOxVvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=duTrTQMejxzSNuSWrPSXfrhYXeKDZnwHQEINxZ2i2Qg=;
 b=kdZ3l5au+wKwfeMy5MWzPjG5eqlWUqrTwOKyPbR2Bb5fxsM6D9kpl+0v3cszXeLjBjmqYAjd8+dVHsICARIm4ZTxH4gyJNWW8i+eyWKTZ4QTc/kfEw8PSIMx+oy+WQuB+9/SQWc3AX2KV1Yd7LwEzEZf1cCnja5sl/7r44X++zXQrRoVG1V+t9oc448aqQslw12LPiArwDo83/T7mIr9rgLxhUn3ori18duw78ocH6z1YJPsBMSa4LhU9ihhs5t5EsDcNLGD/spbUrA3EB+WjwtxeuUmliOoazmTXrapkcBgPZma3y26+6jNhVYNsCgNp+WQ4HCXeZgNE64uj8GflQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=duTrTQMejxzSNuSWrPSXfrhYXeKDZnwHQEINxZ2i2Qg=;
 b=NeU1c/Q0fkK6k986kusozvmGpknGYgPO89nD4KwmKJMoyBOaw9iLkHG6gjKCXjwVLwTnUqPh4o/HMkgRuSACayB60KDhzau1cc43T3ayZwR16nFObmImazM2QxKkrc78hMHioDxYfJePyQ2hAm8rjYNL/lFEqfftwYJQKY72KtM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS0PR01MB6019.jpnprd01.prod.outlook.com
 (2603:1096:604:c9::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Tue, 4 Feb
 2025 23:35:54 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8422.009; Tue, 4 Feb 2025
 23:35:54 +0000
Message-ID: <87ldul2sh2.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH] ASoC: simple-card-utils.c: add missing dlc->of_node
In-Reply-To: <5e9c2107-d906-487c-84b6-bdb1a00fa3b3@sirena.org.uk>
References: <87ikpq2rui.wl-kuninori.morimoto.gx@renesas.com>
	<5e9c2107-d906-487c-84b6-bdb1a00fa3b3@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 4 Feb 2025 23:35:54 +0000
X-ClientProxiedBy: TYAPR01CA0082.jpnprd01.prod.outlook.com
 (2603:1096:404:2c::22) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS0PR01MB6019:EE_
X-MS-Office365-Filtering-Correlation-Id: baa126e3-4f45-4397-301a-08dd4574aace
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Woi2uPIoXSQUF818k9Da9cMX4/5AcZ8k1b95w3f49h7VYozc3hkDL3pyW8IP?=
 =?us-ascii?Q?hq82f6R0cYP60eTDjV+UxGpTDPxygFN7al+lTZGV5Bh/6eTgdRygaLF9J5uB?=
 =?us-ascii?Q?asCNjmN5fXvwqnArRNtk+GsNvO5r/W7YBbFRUHt9IBDYOjvBzoG7Gt3BEw/S?=
 =?us-ascii?Q?KVS9m1oV6IlJnCJBOgdjflNajyOrouSzI2PEE7aoJj1vAQH173HbWeVi8W1S?=
 =?us-ascii?Q?FDAJEkG9k77rlS1Kb7uFHrlDucprZTuFTmmzVPMtGFNIqo8jm79KH5Pxdvo3?=
 =?us-ascii?Q?ogccePhlG2O60riwRqhZ2uC+5Rl/7wyODmUbKsIwBKPGbj01hs6kCJRmVsx4?=
 =?us-ascii?Q?pcrdHNKCw3Hk6hujCrwnE0g3YaeurkSFxaxWgTUOmQJ13+5yp36ouGI2046w?=
 =?us-ascii?Q?LGZpNB50XmZ82Da+jffnoKrH8iDKTckEFKuYdDOZcZ95uXqCjYDdu9SKv9Mr?=
 =?us-ascii?Q?00Qje2SVsYZ6pVfqJs7JAf4lZq8riMXyS2L3P8JiNRRHWrfgIPqAm7DE8L5Y?=
 =?us-ascii?Q?+asdxL8y80ZYw9NlwyvXV/8VLpgBV47ULx8VbD9QTf5u5XZ1ZuI431xFBD0L?=
 =?us-ascii?Q?3qMsbUMlMnKzpHpptA3Gh0l46/kL9A2aZ22vwfW59OzeCXUTHcLWGC1Gv3aA?=
 =?us-ascii?Q?5LcwxIcrl3OWbXTgATSTTXDowM3qhNsJxWN1Rq6KQISa5vAtcm1y5ffdlxdz?=
 =?us-ascii?Q?dRGvoCiN7esKnho8Qkmd8iD/kDA+h9qGi6FKkw+8K8pFtompC/shIE04mrZf?=
 =?us-ascii?Q?3viYRnIVyFZJ/QcV9bvr5fGfQJWsnebXE9otdNzMZehIFP6B+SZenkiSjczr?=
 =?us-ascii?Q?a2HhYBbVgtN33V+LlXP8QzC3vk7U4PHP5RudOSFlVwDgY/Vjyi+vL2J1u4kJ?=
 =?us-ascii?Q?6bIlS49zlm0nvGe0UNuBV7NOyZVimAkjEqEeHIvSnTVI28DAqJ6uvpinP5h0?=
 =?us-ascii?Q?TpV5NFVT2siLanszzR1JqnsB5tj4nf9ArxZETV6EJEZclh4zDsT2rdNN8hlF?=
 =?us-ascii?Q?Zy/PExMHV2NLg0t/m2Z6xEsO2WVVliqtqmQIYJoh7tBG+xk8ayg9Qp0+T3Ap?=
 =?us-ascii?Q?fc9riCOd456kvz8wWYBiDGqF5JgfzQK4sLjtEoOkBYTVP6jSrx0rYQXn3UwP?=
 =?us-ascii?Q?dQbgNuRQsdWiq55U/PfdB3swywgkoKvt6SJ+mcMu9EXoSYPWT0SG/5DozfdQ?=
 =?us-ascii?Q?3TUOxuaqpSG6cTR6qpGu/+uFKUH617ZhdEjA0cPlI2Bi6j3+z2qW/l3Xu9y2?=
 =?us-ascii?Q?UD7akq2Y2nNMaT3aRz01k24S0C037h5Y4poSIXjyP6ExiRlT7Thxnpdm9Y43?=
 =?us-ascii?Q?0KDt152iaCLNRgnTdIBAzkdQogwBXVXavjRBmYiIFG/9iw0mlFepj1Pe8rys?=
 =?us-ascii?Q?oZCmjVP0K5St3pnrI9k68b2jDxGo99SUMFW0yBCHXIdf6O40SsXBSRpe8+Xp?=
 =?us-ascii?Q?skvuQhhhl2jxpM//oScI5eqSwpoq/lFZ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?L7nq0dnQqoCa0VzsCV+bui4krn4iRG3JHzmHoUD7D18gdN+ylBV9Hro3QEif?=
 =?us-ascii?Q?+xY2LuyZb39LJpbVcsTyjbqdn9/n2KFXkhz50JB2hkvOS1mzKFPWFH5jOCdo?=
 =?us-ascii?Q?J+JAETKAMTUIN2DiW1Wcm16o3mLhRWrMQbT2U2jlHVVMfAHdxsiDK7LuWLY8?=
 =?us-ascii?Q?kKNEZBzYALlDcr55C+B4zVjP3C7bNrZ+Y/nTPPN6yCL+5tIg19RkerOMhl3f?=
 =?us-ascii?Q?EJnEgB+r3kXm3OeLtw2x0Mi8fih+zdAvj3v49HGUZIRAx9qmKqL6AwqaP6Ju?=
 =?us-ascii?Q?EwO09jv84KkIVS/5M7ikMPibpkReT/tqPqmo/4zv7K3+E/phNklB9mYEUQt6?=
 =?us-ascii?Q?XB6LvsnxXEODjbtrkog2/0yF+risIUweUwwHZMCFu0fEoo49c1pHmkaVtGlh?=
 =?us-ascii?Q?u/RvmPdSxEImKSJLPVYKjXtV7YLuDEcldnP1kNywR6Y35gAB04Q/a9kUvo2d?=
 =?us-ascii?Q?F3Oeqnm6nCKgDpjEG0o16Hls6W+zUVxK20vF3FKo4sp0lHBavtqDkU4slVj2?=
 =?us-ascii?Q?izkemYxbfr8ytgDxLdLLzhmsSa4Hfh++DOUds1gtgE36yMwvJta0ZoqxrXNM?=
 =?us-ascii?Q?LWP0uaiaC11cFoVJUXujDXufVCIq3zaXpdtf39YCC9MJ9gjwfsLlWJXAD+G+?=
 =?us-ascii?Q?v4LBX1W4mlpxB6e5F/wYVArTUNRPdHKWQJJ8PMvbJqvcudBB1jmGMwIz7gkc?=
 =?us-ascii?Q?mnEQSV22ozORYx9AGQ4ELFWqkgAJb7+IauT5UG3XR2Tj72yqV8T/sDGGwfQw?=
 =?us-ascii?Q?5ZoLxRfSBKUf1mRHQF3izb3k3sIe3Dz4pBQ7CEVWpgx+1bFK02/DkIijCvj4?=
 =?us-ascii?Q?Wf2pSQJDMnN9bAdyBGS1rdZcaaEdrSVOoCj84ylR03FhFIJCKJLcKwy72Hsa?=
 =?us-ascii?Q?B2ksw67aZGeTdzICPdMH1qxtTyaYR8r21Sn8K1afVAjKrbsZQJEWx5xT/uq8?=
 =?us-ascii?Q?l67AgLz2x/dVMjrG4UOtB5s5bCDgs1mw8c7m9jQ1+3Vuc72xSCc/BX3LePSa?=
 =?us-ascii?Q?vkeUdYacLSGeldKm5fdx53Os1Vwn45VfpSHo1FiMTeCffV1Kga6rZbBbwZcO?=
 =?us-ascii?Q?8RD2QgOsI7oq6HvqN9KrsQymL0+llpqKZMwixFLb6VnDfP/RCoIShPJiV9mt?=
 =?us-ascii?Q?5+8WW+exsXrkm2LIIiPGAnBANttddk5Wcc4c7J9n61DTwKgQnShpj1+n3An3?=
 =?us-ascii?Q?E0xTm0KCr+jfRvXHXr2vlteNXc45NBfFLXnFo8mA9hmTOgyh20bSTGqjb+dx?=
 =?us-ascii?Q?MadZ8sq+NbZGhFk823Lb8q4B2MKqrPK1h5n5Qz1c1tY96KZnZb72CjN8noVn?=
 =?us-ascii?Q?fWSESLL9DF9M/ji3VjN92jcJIqBgzj9lcBs7WwCU6H01tg6EeiQ9oLiK6Bvo?=
 =?us-ascii?Q?5rGiZSRcIWJWxXWVZhSUk6Whesaa5O8byJC7vXnLpU1sX5GMAccvTeowsAAI?=
 =?us-ascii?Q?wGuD1XwzL5hWX7Vh667JePD3TAQafJQCj9CwkQGrpIY4adzWzEALcyo+dtFg?=
 =?us-ascii?Q?38f0MuqscrLg9VfJosEKlrpKe9nryPC8UyYGRSL3hUSKnbVQceKOQC3IfE7N?=
 =?us-ascii?Q?/JIKTwQvA+JIQf2U0XZ+urzLDBKmGVDPGhY8/tDtfxL36eVAgb+8PPhRjO1l?=
 =?us-ascii?Q?e/CEQP1kAFqgLBqfwNjegD0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: baa126e3-4f45-4397-301a-08dd4574aace
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 23:35:54.1700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fQsWfv/+wFj60MqhxjtK3bKsAC6kwr5SwdQlUos1Qn0iP5Ifte+DIiLBu6o5Yw2z/r5zSGEnYqlDrJ751g8DE1jMfzBE2CdtROxcQqbVY1l7t/HH2kpxxLdS4dwRr/Gd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB6019


Hi Mark

> > commit 90de551c1bf ("ASoC: simple-card-utils.c: enable multi Component
> > support") added muiti Component support, but was missing to add
> > dlc->of_node. Because of it, Sound device list will indicates strange
> > name if it was DPCM connection and driver supports dai->driver->dai_args,
> > like below
> 
> This is in mainline but your patch doesn't seem to apply on top of -rc1,
> could you check and resend please?

Oops, sorry about that.
Will post v2

Thank you for your help !!

Best regards
---
Kuninori Morimoto
