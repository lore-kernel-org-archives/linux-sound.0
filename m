Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010039.outbound.protection.outlook.com [52.101.228.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576A9450EE
	for <linux-sound@vger.kernel.org>; Wed, 19 Feb 2025 01:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739927936; cv=fail; b=ksgNRUYQYBDLgPcxqPz79vFpyXV30bT1bpVSXT7l0zO2gn1GjxXLcwjyGorCIUlLJxpmPJXAJi5GXGLeAXvCDO2oSXacLOdurqSSDuptpARr3Lw0fOAxUIK8HdcflqRYXQhfl9P7tQN+lVzxgZXtGLXqN9UtEddiTZG3s+YmnfI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739927936; c=relaxed/simple;
	bh=+quAlHvxWn25GTZLhNn/g8x/xGC+U8KeHn3KAFpZ1ZM=;
	h=Message-ID:From:To:Subject:Cc:Content-Type:Date:MIME-Version; b=a2zBDIZYv2XwCNmH+WN/nHDCFKoUrAvEW3j+6vmHP2drRMJqPGcDgC+njmlpTOvyMi/J9vaNjVtciucyFnbKDcDmMpr/q3Dgct1zHrgRXb90RMheiVYqvuJfni02oySODd804w0vfI6Y3FyEjG7zw/mEYPkUWtLdEyXg0xNCTAU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Hg3kOCdL; arc=fail smtp.client-ip=52.101.228.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Hg3kOCdL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cph6VePBWB/Q107ZdrDg94q/g7X+HggFFcjo6CBsRQL9pV0XrekMgkV/UuspgCMH6wYb7nodUJLlMzFgyoGSs2J36T/ApviqZ0osvUGaix2/m7VxCb25gNuOOSMkbKqO9rzL/XkYBFj76awXPHYHUUih8pOjLKFs1VufAMTqkJ9vS7Y8LFhMgrqdOk4uoY/kkS30bZsSoIRw/eEo9IWAS3pVBkzdqK6ELFThj6Ir1DTGmslJE8eUBO/650PpkxvTwqVZ96yby4olfmrDWoMgqpoGxlqr3cdXzfjWNmnuH575QebXf+RndhrkcfLV3/CmoldHmARxcoZXl4hmn3XcUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2LO/ytuW7lNWN7ZxbPFpzTOIxYWWhZLygEpViyuzJ7Q=;
 b=X9hd2gqWtAwJAsygWDhpOq3QDnG4NNH3s0cpg/7j0Vbin67jsW99u32/RxKZgVNHaenQ8+f9pLwTv/dMb2dxTBNfoJdOLkK3twfJXLI0VXiLkq6ePACaEGHz0ltYLyig4EUWRcFhMkB+ZgE2z79j6ODbKgVFKbzGorLffly+NNDiW8AVLpksF8c+Q5HSsrOQisPqNAqWolJR3Pkt14QbWiKlKWdEkhAW5ix3aUCSFC3A4Bmb9ReHDmUGp1SIgIGCC+eIfVZnFXEu2DnZqcg2JcmVfDseh/pgPd/kny5K1LYdkRcQ2HDb86llnEDzeayZzeqkmQ0uNRBJaXOPIGRx2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2LO/ytuW7lNWN7ZxbPFpzTOIxYWWhZLygEpViyuzJ7Q=;
 b=Hg3kOCdLz8+O6B42rMN29riRr+a5RMMNbxYCDkpswt6pyeASkDYiIkr8a9wqP+1IVmpVnHiUBs/lEZ1PxmDsb1nX1htwEiPzR1YdrEb6/yEg6vmQch4ynOcYzPuco8/qsJfOQ76q+nYzLKNsMbA7ncZWchVgj8MQAXgQmmcgbdQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB8705.jpnprd01.prod.outlook.com
 (2603:1096:400:189::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.20; Wed, 19 Feb
 2025 01:18:51 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8466.013; Wed, 19 Feb 2025
 01:18:51 +0000
Message-ID: <87jz9mviis.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Subject: [RFC] ASoC: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 19 Feb 2025 01:18:51 +0000
X-ClientProxiedBy: TYAPR01CA0116.jpnprd01.prod.outlook.com
 (2603:1096:404:2a::32) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB8705:EE_
X-MS-Office365-Filtering-Correlation-Id: 232e8749-708d-4edf-5a36-08dd50835ea5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cUv33KIniYgcI+ebyZKBaLRt2+OkJ0FltGPFG9iSx9brbHUhHSOdylfWZ4Fk?=
 =?us-ascii?Q?EPq6ovhw0qRpteqab2Nv994Tk23qd9jPHEE/QUvIbvN7xFc8/dNc9mOM7pOk?=
 =?us-ascii?Q?xbsHaN1XC+ecwdV58QsVllyc+I4DnMJSwnwqcMHkn8XwoS50qfy2ZzEab4CZ?=
 =?us-ascii?Q?rWD+m4OVQrlcZyux0k2T1oIF4yyaSwUNPPlXB3DGCQ9EH7ih3Dbb67X6yyE4?=
 =?us-ascii?Q?Hu+vlxQn2WKUEYsf/wGdNapsKBacUpX0mhKKU2QzRQq4XVtFTxelMbt/vkrF?=
 =?us-ascii?Q?Tdi3JTIjJiVZKoeLIYXaCXFYks5PW4lNVdxD4pgErLqANZDORHhpAxj55AHy?=
 =?us-ascii?Q?1SA0nhbiu1qTdn9Jly3f4Dvw+nbyr4cf9sH+cpLrd7JpWqCjRrFfsXMQ6UHa?=
 =?us-ascii?Q?x2Yie/V5FeJwiJaFHPmEFwbX4nv2m5yTzCHOMJjKRDyy90q5OEJzfwMFgjCT?=
 =?us-ascii?Q?roTX05Nxpg5aInt9zr3VnQXXxMhy1aIIDl7HxWZ/40M2uvHMO22XQdgdSeEq?=
 =?us-ascii?Q?utD/Pi9ELeBrX9aCePXD2r6tzgzSyhYpVPfdUxUO3/U+WiyaNmBbamJ0O8HA?=
 =?us-ascii?Q?zTldqNc4YWK+boKpQW418FvujoMtmEnwdJ9vEbHIMZBpshv3hDqdXXxiyDnf?=
 =?us-ascii?Q?HI0C7oux03IfSkKhdze2/U4RsW8KrE59G2iAqK2W5N9ZXuNpy0fgoRCb7i3z?=
 =?us-ascii?Q?gDHEMBDj6Qk2bM5AQDMFFUpFwH8eE4wSDV3w5m0nqTFGZoCfj/46+kaGzUSl?=
 =?us-ascii?Q?yNPsuwVMptqu3l7XQBlfDaedDwWOsfNsMbBY8gfLDkbNPekm9TX3J5AcO+Sa?=
 =?us-ascii?Q?FW80ZduAY0wcMt1YYCmUYKun+UF3K2xr3qnZPrcql8UwbwmCtrSjSbJ0EOSA?=
 =?us-ascii?Q?6zrgStE2ccj5DfAvuej1OlYVos7EKnmfzudE+Z1GSuP1ogVL2KA4Zp+ETZvw?=
 =?us-ascii?Q?sTTzZ0TmBfIBrPgbuWWsbEteY/IcDLnXQ/mjUv+wSfE8kbvq/IzZQ32umSMj?=
 =?us-ascii?Q?x3vcY9vU4ttfM3GpAW07LZUIWg2IsypGYykqcSxmqZWFhhZRhl3cv4or1RVJ?=
 =?us-ascii?Q?EaiAi2UuTko65j4PWRkNRhbB7XzKGw+FITmoBNQuw0i+pY847Q7TBBHJhaq7?=
 =?us-ascii?Q?OK4f8+NOGB6qjrq1kTchzxZlmCgkvGpH3HXFpzQakbtHwn0IsoWYK3xfPoiM?=
 =?us-ascii?Q?06B3MrLSt8UJYUlPF6raNync2yUUdrtUiAVFCW/uJ7DlzwNPCkCedEA7hwU6?=
 =?us-ascii?Q?qpteOpe69MwRyydkzuUMTPAEId1avNW2aDsr/nmsHNDSNc8m0i9Qxy4b5SDv?=
 =?us-ascii?Q?ZMpaQq8DeeEGqA4+5ctHNJU+VUztlHkj0ojS77H6chXYJTkRyPVhV9atTsFS?=
 =?us-ascii?Q?yaP41rBZuD9hPWB57OxhqAyLEkDXk2+LqU4wdp3lJEzO6mhiIzSJ/JW0rp0B?=
 =?us-ascii?Q?EwVzpUD1gP/yLCYhiOcag3bodnCSMsxB?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kPLzBEWOojr8oiIhADc/6S6bh6WfzGjTw6rxEvPZ4yPS/TmSzX/uECsUDOpF?=
 =?us-ascii?Q?rlCg8h5EUMMJ+/kfftjlbcbdnWX+evjsVCIwU3nrnBQDdr+MC24yHIjHikh8?=
 =?us-ascii?Q?DG4xXjfOzVlp0H1Uwga17xssGqUjTXMQygKp7rsaaW+SJIWQplnP8dQ/f7/X?=
 =?us-ascii?Q?8TPeNMpwjlVKoGFATuqwb/2EeCRCL47nyH7sg1JkOIz/DY4K3DlXcdy4p7sd?=
 =?us-ascii?Q?1QEjZ5EEkd8McnJiGT3f5vDr5TdltP6t3eOtk2sS05pugkZUJ/sF7NBIo3xN?=
 =?us-ascii?Q?h7gl468sR8pX6krVJP3yOduk+3h505Lm/7B2YF8y6WnFpkqJCF0gu9RAL1hn?=
 =?us-ascii?Q?8wDG6Aa/NDcrVH+/GDMtky3TQPQJ2AY1X9NqeKNh7Z6568/36JtmqzTpa8l0?=
 =?us-ascii?Q?4EqTzZbe43nMtrOaT40Utpe7mz193CM14PoiX+DbVw1P65l6ne/V7PBa7iUa?=
 =?us-ascii?Q?FD17rbdCcLe1gSg0bDc5VGssApKgKgMWclgvVJluNaopu8IqpWUq8jc0bOiO?=
 =?us-ascii?Q?qJwUONIbNIyxv2OMdW/lsXhdMXyxPJxEqiZDaoxQBO+LhGqW0jsNVLPRloER?=
 =?us-ascii?Q?rtzedfA6Vm1gau/yCKbLYKTky98f92imM3JJn3abwsMMQW2HGSG2Ow16LeJ/?=
 =?us-ascii?Q?O2V/ye4XXfOfqb6Vet0W7O8Ij1I+70Mvl/KEcWx7seK6+xXX3n7umDlAoYsH?=
 =?us-ascii?Q?0pAIlbztz4fBEpgKw5usf5uyqFhDLwENz8z6TIj6fX9aZ30Qux/nJ8SIqky9?=
 =?us-ascii?Q?KaDjWhdPWSghvdjTIKbvaSqBXU7sFGl73PgEgM7O1NvBJVPAJmcclgYsqZiB?=
 =?us-ascii?Q?IWjkFvOFP11dOYXjEtCixZ+PLC+aLEljJCJKuJUC4K/eaK8uEEoUOrMtuxtA?=
 =?us-ascii?Q?Lpc9T6n6qkYqKSP6GGe1Jp/wC0Us8VRAyox3wIis91bPsmlASYeVmdE8Oi4l?=
 =?us-ascii?Q?ixF9sozX6BEVCU3zydLKxW0vtFuYhGJoTOskY0mUgZaFiSmI+Dk58/IFLPfD?=
 =?us-ascii?Q?G/95qRjOeLb3tzmox/91aCni51mABGJ5zCT037Ce17VuO68qJ658APiLTkiE?=
 =?us-ascii?Q?w1lAhbueBXJ6j+bOW1vUBoH8I3bk4d3JwLtgDGZ+73tFBfETUhQQngPFiwIZ?=
 =?us-ascii?Q?l1LPYEq/+VtCfUbRGNqRIE6LLjwm6MVszUr6rc3460MJeAJWBjWfK5/wR692?=
 =?us-ascii?Q?cKoPpBcr3nuu3FiG4cnUc0PGjuMCPhjtdlo8St5oslbVoOsRFtKLGXVP7HvX?=
 =?us-ascii?Q?JYReS/PiAxVFK7rKqub3m1oNjrvsrW9kPQoLeHGkNGJMvBx+d4UfghQqdIt9?=
 =?us-ascii?Q?7bmvxa/EbhmXx5jVa1C8jwcTNB9tGdlUdv6v5Zjx7PUOPhLzXWI5YOhnT2Bm?=
 =?us-ascii?Q?AjPEBWiB8WV+NgjHo5x8iB8ZlaDUgUg11foTJUL63sN3wdqVJKJ4GW6Wlgu+?=
 =?us-ascii?Q?lhV4IMkGC+SzLezEI97SpEoDFg41v8zjjlOusBCTUpXTNQppwNGDkfmy+ner?=
 =?us-ascii?Q?GTqTqibHDdAOP3BmYwnQ6Cku063TIb/baRVeEDlACNfoPqtGy1LpiGWOW5pR?=
 =?us-ascii?Q?mQammH+W058Lbb5T5k2QzposM/OHTskxLt6AwzM/CednZyL7rJf9+OD3VWAN?=
 =?us-ascii?Q?cP7+9fZoTXzdXVzv/WHM+WY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 232e8749-708d-4edf-5a36-08dd50835ea5
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 01:18:51.6449
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QDPyvfOZ9DkqTB1weaMkx3dsB04ITWI3gZSMjcvrZLzXjQ5Rqz1c2WoLtXWaUmi1vXRwZI1aiaFEKUiDUFnfegjWVBFsrbNu/s52gH1kvwwHjRi0CV2c6EHt8IclF9n/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8705


Hi Mark

ASoC has both

	(A) SND_SOC_DAIFMT_CB{MS}_CF{MS}
	(B) SND_SOC_DAIFMT_CB{PC}_CF{PC}
	                      ^^     ^^
M/S is Master/Slave, P/C is Provider/Consumer.
       ^      ^             ^        ^

We should not use (A) today, use (B) instead, but we still have (A)
definition for backword compatibility.
I think we should full switch to use (B), and remove (A).

But it will be too big-patch-set. To avoid patch-bomb, I will post
some of them as sample. I will post full-patch-set if there was no
objection.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
