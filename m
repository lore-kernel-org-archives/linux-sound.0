Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011025.outbound.protection.outlook.com [52.101.125.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF7C8F5A
	for <linux-sound@vger.kernel.org>; Fri, 28 Feb 2025 00:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740702541; cv=fail; b=BWY4f6knLRR/PmY2E/R9TO8itBOrEqzGpTaagFozAvRwpgyxe66jveGRySfMdXMcM12YE6gSt/MROTX5sFaTnaK009g1wqaN8vkokYt6klV3djsWEPWMnpKE0eXneMyE4+fcntNAN58ffmdIKY4AFbABPpHMjkgKPihlfkofPVI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740702541; c=relaxed/simple;
	bh=3YsdTepxPAFqdmKhV0DWmYPaFtQC+xMQooz0FQtpJO8=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=GgSJ0QVaeEPFJRAauGTNELptlFJBx0lM9YI0y3Ej0snKg3mYwBI9XM40INBbDynQDix19s0QnyVDzLI8qEq24NY5r9q9eTPp1L6GJzbYm2PE9ZB0qdXRJAk7BBROzhSvltnIExmiIL8NJhkDHzXj9plP3qiOOMSkDYjKamQ1z8s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=pmyP+B+S; arc=fail smtp.client-ip=52.101.125.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="pmyP+B+S"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gnRtO6KZerkPp0X8VmAQhl4wajbMHyKo/QyV8IHc0EqYjjmsQMOFPhByWF2SO9r2xoLc+oVCMU8AkWGITVTvN4Foj2Y30I9XhEPnolWta3Lm9N3mKqYkMDMLnJs7gIWnD3yVYEgeMqpd+FuDvGEeUmvccsa7MFBNg4whlr0pBnNkTRsm5KW5zX5OhlpE/S0pRfyO77H/x8jRp7Z/ftnyQBntyLVRkU2JhAbb3lRUhgsjbuYEqg9TTECqRyNhywq5adB/4vP1EuV3s+N8LOkR7D45yDpDZIoWxQ5qfti7GsotBffzewVS0/1lhUpEbZaHMr1bPOnfB+fazmILyNV1uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ENFFQpEL6CQBmLpdW5ytmeyerK+gswM3XX7e53IO2cc=;
 b=noxUA2Jr8KQFMYmXDwr7jgrEFZrl7JXCoy2SdPnpC8ckGhdGRozy1PEmBd/v+9/liAaNNDhUDZJ09rRuFNRiknb1I/BQG5o3nayHLYQG4WStdT5J340JyUOJ6vqAvcz2tNDfCFsLZ0t5xhDmmeHRz975uRdWJnC5qNqKcwlG+x0ldo4m6wv6RdTAkKgQx0B9w434qTBVrccZQmm47TbADrZtaDkznlFj0OYIjpRtHtg3kpjRZhPyOoMWvd2Bwwhx6y9lhcR73o/c/6I0SOWTkwSqjyRWhNDxCoA8S0bxgoBogD9yLzWnNa0L3axDnnSntEIggmdfwahM+dH5KgLbrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ENFFQpEL6CQBmLpdW5ytmeyerK+gswM3XX7e53IO2cc=;
 b=pmyP+B+SGICiM78OtkyvCWSlmTX+6bFiNziAKf6GWXsYpXfe603EyhsCkpdByHrkUSmnQwGktKFLtx3MYabvtE1iBCCjBrorQjbt27JPwcYALaJB5zs6snDbPokwDDo0iJaqEcJAu2TGzgR8o4yd4U20X4wTDcQYRc42cW18UZQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB15533.jpnprd01.prod.outlook.com
 (2603:1096:604:3b4::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.22; Fri, 28 Feb
 2025 00:28:56 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Fri, 28 Feb 2025
 00:28:56 +0000
Message-ID: <87frjysyig.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 0/2] ASoC: simple-card-utils fixups
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 28 Feb 2025 00:28:55 +0000
X-ClientProxiedBy: TYCPR01CA0041.jpnprd01.prod.outlook.com
 (2603:1096:405:1::29) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB15533:EE_
X-MS-Office365-Filtering-Correlation-Id: 060c92f4-656c-4eb4-384d-08dd578ee2e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9v+71gWiiUN5osy7dkhYmiIhdzVY3611DOBtW5VMy0nElX+H0UrIHyqeq4W1?=
 =?us-ascii?Q?qN7poQm/OUhzM5ZXsSeuuDiVWauRHq8VJsoCWrQYiaUMIcfB4AeZ2vhg/t9C?=
 =?us-ascii?Q?/I+yjr4TW9fk7S3qc1dtjvqhAVsxB1HYDCBKAAefBO4IQl8pV3cMBDq4OMDb?=
 =?us-ascii?Q?un2im+4UAXLTgSa+bHgoC4ceXHoRHnqqHDS+1ffssvxoS54J1SndiX39QFFB?=
 =?us-ascii?Q?228VosZz9H7wjyDjKHpienqth/11+CktKVOYUDQJ0mv6/R4Uu7R674A5SWtF?=
 =?us-ascii?Q?kWUscBMhFAt0QYPXG8bq5JJKXT5JK5/bcy7xn/Tfs+ABbd+lG/owNqS0EMQ+?=
 =?us-ascii?Q?RyiqGe9aJnPHdoPhsYW04LLG7EkM+36JL07ruM/m+i8QU/cKTyPsNMBx8r4Q?=
 =?us-ascii?Q?mxd2fQJ2BIChxzatBVYj9jJHPlziqCwQ1ErMxsBtEhtq48141Hecr3ihA1fD?=
 =?us-ascii?Q?KoJQKVXhNFCt0ETOCuzBu01nWzdZYsVUy36Zn0FyAlDH3Ev1MI8gxc4Jyq3N?=
 =?us-ascii?Q?zwAOx4avT7oz0lFGM1NjHmC8zEdAhpdau8EExwmDvcQKOxq1BghDxoB6wulP?=
 =?us-ascii?Q?okmaeRwnN/l8qU0kEP2OhJrVww37r+xH9pb6ZKwXkTexALpuikZQC08IS2LW?=
 =?us-ascii?Q?BRZ0AcuqT1iTTK4aQOUZZ0Ie8uLMJLEgiZu9xBdVtW91pV4RKhpJK8RKIq2r?=
 =?us-ascii?Q?3r1p50JrHy4yJcqM4EoC2+qcQS+TET5fj+pjkitvNVszP47adURxVdQQd75J?=
 =?us-ascii?Q?/+Mp5t3YFyfdA40QBO3C1WiqK7ev9h0riT0Lx7M+hNypa4jEneKdNP7wFU8d?=
 =?us-ascii?Q?6DmwfnR3TPU5SQntAbuZY8S/2BlyzSK/A1vdx6KqZZHgFTEUc1DJGMhpxrRE?=
 =?us-ascii?Q?ID7DHlbVe2Zk++enqdpY5RdOl9s965OdAMKrA8C2J1rth4tfebrfE7PuDC1+?=
 =?us-ascii?Q?6r0/naoAXNwuhetmci4POZ+QPxUu6rKS/35cyeB6LgiBbSZ/iltcmZtVl5fn?=
 =?us-ascii?Q?MBHjB1Q4fkBUXpGxjd+IdsIqq33uLc5GQ9MOUNLfwyV6jaxhK9gzIXWdYaD/?=
 =?us-ascii?Q?IhRVWX00xV95TsXF51M0WkCwhmfkoq9ZGnTRmxBm/RJgzKtJxGXV2km4zd2/?=
 =?us-ascii?Q?/+Gwxx3KpfTQomRtB/0Xj6Yz0mOggmb7b8I75Xm4Gj/w1kErSBp1rz/VEpsz?=
 =?us-ascii?Q?hOVy7c9RrejVA//75vFmVM4pARxCipUPvg7V2lgVLCg6+PKObSz72EvZhHgY?=
 =?us-ascii?Q?b5fp3WcPwzN02L16+TWzkY3UwMzv/r1HkMsRZ/fs6KPwdaaJCNDa+1JL60zz?=
 =?us-ascii?Q?BQqq/Qf3SUtVPvgjnhplvwipXJupZ42UGeAB0gIPzgWxN58uzFEZ3Or3eHDX?=
 =?us-ascii?Q?K6ttZFjK1HYnpEED28lCuJRk6CIescKSYFh8s5qEt9zDpVspw5JLDHidZg7t?=
 =?us-ascii?Q?B789Kf3nuPv7bM4+NAXHb2cRdHPFFoNY?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vDd1D1KfzOAM+94nw+6km2gGnmrBg7hvYQw0FKapoh9RdkqH9qJDAjXx4T8q?=
 =?us-ascii?Q?z1QgWJIlOh/ZdmfCBBHA76dC3XBwJ4cBbiCsZZfz1zcXUJ/W1RGW7avHbs1X?=
 =?us-ascii?Q?2+zPh2MNOPDHf9MwCpIsTjCWoYpr97FqjzzGNsURRy97hfqEt3lDdUTIjSy5?=
 =?us-ascii?Q?HwTlSk/AGWikDqk8nmp4OSOt8XKpEb8nRuvR2tAGWva5f8QxfA5uYoYadI64?=
 =?us-ascii?Q?pnqtZjs30AxeH8RxyQaMia4RdIC4e0XHdAduV1LasgBJF3eq+DJk+oEWalpa?=
 =?us-ascii?Q?l/bpbCuwddRwkJcBv9w0TRbB51HzBdBPfjm053hHXaIKUrtgNyCob8KtPtsp?=
 =?us-ascii?Q?J2bXVxX5ctQVQXIT0DWq9astJcscFoNMhMqh2InZkXoV9oe4sZOkKAgUKDoV?=
 =?us-ascii?Q?oDXjR2ktvABEIvQT8EN68dFuqW/j56alSDW6tviCFUR6hv9Ia9m6LFVKXcMC?=
 =?us-ascii?Q?CFZAkL8ZCWrTyB+2pA0mMjL8Ubgn9oqspM2bcPDM5B53TS/Ko9WbYwbSbzcv?=
 =?us-ascii?Q?aIwr9/u3JhVdsaWwKHUTZUVZCJOGB/azYhjJmNzb6x37AXW/yhYSXyzzAgx9?=
 =?us-ascii?Q?nwQdfHqV3cfx22zacJJR5AeeWHYd+1ondL3c+KiQ6RYFsUf/+edDI9fLUjtT?=
 =?us-ascii?Q?q7DZ6Sg7F8teIoMXo8lUGCXPcjG4rmxvwj76IAofue4ibBBT8vsT8Ycn+OM4?=
 =?us-ascii?Q?cbEPrKCoiUQxNBAacB4uDc89DDqygmUWUZ4KB+9ZTC3kwq6x2UODMrCD30d7?=
 =?us-ascii?Q?gkbgCHaSZ/pytBanQP87Ym3RtygSiG6bWQ7qp26a4/9914OhXbENKMpYV3p1?=
 =?us-ascii?Q?IFEOLFyLsquXe08ydz3NmmZdLIxxITs+HrtzLOZUTfoNUwf0xaY2IGrPCyIr?=
 =?us-ascii?Q?HrbBzF+wag2KcPfLtPT+2wWv5I+3Q7DvcOmzmuqOcxiPlTiMPZfcNYdaHHZO?=
 =?us-ascii?Q?8rmhct4YfAtGgCY40dq1ZJMIUldtw0J+8JIKRECKIEW9+9FoJwRiolFzQirA?=
 =?us-ascii?Q?Zkz4tONykiNY+GUWKpTwkqP8k7J4FwE7ghpDtQjKtcxCy33HAwUSwUYKpLp+?=
 =?us-ascii?Q?pp7qFY4xxtCf1MrNR265RMx1Ql1B3uUUR5bzljJE8LA7gj7+vxflRphvpdNl?=
 =?us-ascii?Q?8ceaq+FvATjP/+4YfDCug+9Eo6FvGCELNMiy7b1GvVS0ARdXoi4Q5AXv217c?=
 =?us-ascii?Q?Fk18wO9h3N1/VJX1I3aHlhxvwJB8CoLOoqeVxv6IjtIdv9hVJEsJxOTPHQQc?=
 =?us-ascii?Q?ZAbF/M3JmesmX5Z957/+gDfTmrtK6XH34ypvFpzZERTIflreLzyuRkjKOjyA?=
 =?us-ascii?Q?q14MLrVYJVEsA4fIfBK0/6C6RP4yzNGZxeGVy0mKrkPzAxdADfEn7a9L3W5c?=
 =?us-ascii?Q?X2TRiF3DAyrU4L4wcpgGTdxJkNOIsMwrF7h3evR5X45Hl2z/Xi1zmOtOv6pi?=
 =?us-ascii?Q?Ng45HJRO2Wxw+BNrxdGi9vA36jTzqliiEAni1FwY//AX9RFayFyHVc+HN+Hd?=
 =?us-ascii?Q?5OQyvZgPV7hVTA4SDX21D1u2ZPnxLfJj2cl1K4JQypfZpGTtznm9j81w8tco?=
 =?us-ascii?Q?7A+2lihSGpmeVEQ60AIkGjilVoMYQ4Id9Kg8ZG+Q8P/L6Iy1te7+ysp1JVQN?=
 =?us-ascii?Q?vrBgIoZ9q3sMSJDqpjaA1ck=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 060c92f4-656c-4eb4-384d-08dd578ee2e4
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 00:28:56.1376
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: emIW5jGzDHLCFzek5QsEx8DkCt+rca1ehD7LNvaRTWV3H+2ZiBNuvT5tC2jqvHt/L15GIvSL++N8YzhE+fLvG9hOXGidKg7o27hXezANAsPKRO6L5BF5zeZjYdUkoLjZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB15533


Hi Mark

linus/master includes my patch (419d1918105e) which uses __free() in
simple-card-utils. But because of it, it has of_node_put() count underrun
issue. This patch will solve it.

[1/2] is for asoc/for-6.14.

My previous v2 patch had extra cleanup patch, but I will post it again
to avoid confusion.

You will get conflict if you merges asoc/for-6.14 and asoc/for-6.15
after [1/2] was applied on for-6.14 branch.
I have created conflict fixup patch, too. I hope [2/2] can clean conflict.

apply [1/2] to asoc/for-6.14
	> git checkout asoc/for-6.14
	> git am [1/2].patch

merge asoc-6.14 into asoc-6.15
	> git checkout asoc/for-6.15
	> git merge    asoc/for-6.14
	# get conflict

use [2/2] to fix conflict
	> patch -p1 < [2/2].patch
	> git commit -as

I will post extra cleanup patch if asoc/for-6.15 was updated.

v2 -> v3
	- based on asoc/for-6.14

v1 -> v2
	- Separate patches

 sound/soc/generic/simple-card-utils.c | 29 ++++++++++++---------------
 1 file changed, 13 insertions(+), 16 deletions(-)

-- 
2.43.0





Thank you for your help !!

Best regards
---
Kuninori Morimoto
