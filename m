Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011001.outbound.protection.outlook.com [40.107.74.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FDE02AD13
	for <linux-sound@vger.kernel.org>; Wed, 17 Dec 2025 02:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765939173; cv=fail; b=chPwkGh3bsq3d3K+uKhzwfZ13rQXTuAkBOlaP0RDXqI6GDfEw9wc/dSxf7icTipMn8kNlDNnO9kqE5iw3GSEjObZf4MHQi8wsDlV1a7oMPRox86Pt1KCGHkiMya/NJNcFcGf0spvc1iedInOZSlfl8M7tCYQiDKm/hxN+I4GWuc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765939173; c=relaxed/simple;
	bh=N1Q3oxz7N6l6qd09spsX4AO7PfLtBte3BZrURKtMVis=;
	h=Message-ID:From:To:Subject:Cc:Content-Type:Date:MIME-Version; b=pHYjG+prswt7uk7KTZw6q7C6d9vDgRwpdrBEC/XToepHwTKPtMzRoJe/f5ObmxFN4bcznP3DuGvtB6+lpjuiJY1tLTXX95dimQhPDKA/gwZS57Wmg5GDqTN6QQWruLHysoYkPjMRHtUN9HU6wv43TNtmmZQS75pJFolDwuy2DMo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=RIgixs/f; arc=fail smtp.client-ip=40.107.74.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="RIgixs/f"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BSiYw3Svuk1fyJ2uXpMjbW2DcQKYafXMsCyi6nKCwzO+GxMNXWw+VDOXTxtiRzGPPiJcHHQ0OLyPI22Ls/25jiEk0fO1HRu1yuG0lHWtKxQwe/0nV7DgLqcnlQ5Qh2DcUxX8137iOlXat3LVd7qI4BzAY5kFfRVbjsL7fn6i9qwDC6uJ19CCH0bekeMNUo8M0/30HULQ8yg7OoU2EKbeSfRIJCu5Tx8pWZRs+pIVAv2vqdKcGq8f6fYP0BSOPEdZYmh4/AXGj8kXyC/K4ZMgvDfTPsoYXQ2T0Fdpqm1bWE0oC31dwyWTu811Mx5Q23sDcRmNYEpBdIolMIO087gGoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FwwE2Qvt/Xa9VHUkvkhvF5PPglDAnRkLmJzdUOchURw=;
 b=P61Xh6G7Buwpu6pDDRjYzl6LHx4ACBhHInq2S4RKmFD065uu1oNGTxhSULrNqsXHkumD+MfhNR0a2g/+V0ULvWRAmHAbcXhzXhoXSOgpdgLMx08dveQYfTGxnlnIr7HrpARq43HzKyuxc1cLUHD8lU/MmtRqbTobwrnnMP3N5o400jwDBAnwfEIJtiZlH02V4EPpM7n4sxIwvzFWT6UMcoo7SEQcZ9s3PI72gaT+LMUqBr1VjG0NBl8Y82BohY2ujc6DTuLD4aA6sCxhIZH2DzqM1PF44FnI9EZ1c7p6R3OywE4A4/pLH1jkNUlmCQMqwEXmiJHjJPMoKW7aM1YnLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FwwE2Qvt/Xa9VHUkvkhvF5PPglDAnRkLmJzdUOchURw=;
 b=RIgixs/foCraswMxNZ6XWJ7jGW61lQ/ttQJuYmVaqLjI61lkAmK5ypqFj4V3pfnVEaDbBg3uPqJ+nvfwe/5EGdYucA84aXybL5HfEGum+FPVS+rudkLwZ8rNbcO2BcOIUm4x0tUdAWp0/VYGyhpaQFANTJHKzm9JCzoRnBX4LmQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS9PR01MB15495.jpnprd01.prod.outlook.com
 (2603:1096:604:3bf::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 02:39:28 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 02:39:27 +0000
Message-ID: <87v7i5esrk.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>
Subject: About component->card
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 17 Dec 2025 02:39:27 +0000
X-ClientProxiedBy: TY4PR01CA0127.jpnprd01.prod.outlook.com
 (2603:1096:405:379::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS9PR01MB15495:EE_
X-MS-Office365-Filtering-Correlation-Id: 7db6f16b-841f-4ac6-9e53-08de3d157f9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XmFBdVgTSioZHsFOZFnpCLmigNvCJPxV2z5/spuoxcJDD7Gxoy51uBJOuoWo?=
 =?us-ascii?Q?/6JaUxmj20h+k6fmbGL3LDnKxQ8VLGsYYgWZxrjMNa9Z5GJmsydTI0rLFM4W?=
 =?us-ascii?Q?iCX8BUgRJuKRLzuIk7KBYjGFbKvPpsq3/kpV2Ns+H+8ELHONZNVeQ/yWlqpv?=
 =?us-ascii?Q?P0go68DcuAi8Cfeho0aMHUCxADlaQkkAgLMc3gO2zF85vzcL2zUEFrCeuSnM?=
 =?us-ascii?Q?I/eqFTN0GeUgQu8vUgJBE4eVcwWE8tqgMykLIMkK6zIOnrG96WPAG1W7P8A3?=
 =?us-ascii?Q?c0nCn/Ae9URsdT/fFbA9Y0TrXMmv0mV9DccRbVMntY9sI0FlBh/+kg0zd8El?=
 =?us-ascii?Q?sDUW1wwRVuRu8s9P6Ff3c0VtiHxVwO4+oI9abQ3ATId+4Z2qC8CeIBJrowM4?=
 =?us-ascii?Q?CKOhCzjgyU+fEJbJGc0iWBzr4UYuzl7TYNYpyc8GA1qkpl4lDLlXZ3SQlqjJ?=
 =?us-ascii?Q?vXGQ57y925Iy+MGwBvkwrtQQONSt/1UWxAJCUbr0cHpmF0+p6V4z69yCKsTg?=
 =?us-ascii?Q?yRj3OM3tvHaG2D8BO5eiHGbmk7OJlDXvojH46MVFVDaLzMnc9IywgTNT2s7M?=
 =?us-ascii?Q?iqtq+uJdLhxB9RyWxHkz5PVVi+LgmhHo+BA2OkOO2l5eaAjVNtQF6YbGs7HI?=
 =?us-ascii?Q?v4XhIii1LmzKrwvE49TDmw1xZRooN39LO6njuiGEHGce7oXLTphIH+ffWfmb?=
 =?us-ascii?Q?6zRaJj0FZIdkbBkmtaYLLAF9Z/TIKYhb5e18rSewZ38Z4ag+c+6PDEHdXHCP?=
 =?us-ascii?Q?j0+3gTzanasNcT7yrRP1Axo2zeDtw4LONYVd/Yv4/2QAsBZ7iqrlqi8RSIIm?=
 =?us-ascii?Q?vN3b+PhTQZ+YDYZiCENelbs/vVUf6hfl8R3H3blMcuCQU5QTTYJ9ICC75M31?=
 =?us-ascii?Q?3d6Q+hN/Mx4JYbna5lnUtPCDAuw+lKnJrSu92caLWedXUeZeeUDdsauwAIwj?=
 =?us-ascii?Q?EKxVebNjbtpwwlNolJOgimaarrWJlpxJyYNI+47XksEwtA4aeSf7P0DaKD/K?=
 =?us-ascii?Q?PDKH1ip6SeuYnBS+3TbapHbU6Av5RLilxNHRWl51bqHEc0cwm3/CkYT8cSkb?=
 =?us-ascii?Q?gFsBHx1brH2M0vRtrfHL2N1ptAu4GWChTJ1G1aaPsM059UZ6kHn4xzXDrRp1?=
 =?us-ascii?Q?0S9o4Rn+vt2gvyeoDI1qssxo9E9tHaimw2lUZOU1j18S56v7VaQFhuK3wlrE?=
 =?us-ascii?Q?7c3r6iP9NAyazlrNIWQFy6+GYoR9DaXLe8PJjbAuypOGc1NvqfRi6TMhk0Uq?=
 =?us-ascii?Q?qox+ZvWD5hcBl3JYe9cwEorkGVSujVM6TjP8s8KmP/0YpdfOMq2yId9xOGSD?=
 =?us-ascii?Q?hR6maMnKy4lbK9snEcqvvpGMkWUf2PduGXU35c3vw68KKYwVCD/fOmdHMrSX?=
 =?us-ascii?Q?q9kU4pvSYf+4FnICnu+I2SgBJysmcTVebMHvSNelghw4Tx74LGfOd4q3r1Ru?=
 =?us-ascii?Q?dTOkM/gMPzBvRHQXyBzI3k/vuxUvMFLefKed3S2xTYTMvMBi6Lg6cMp8kb3v?=
 =?us-ascii?Q?mqtSsZaOmpwy4HNkHWwFYzAtdTl0GKzfzj0s?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UFWzkdWV7RX1AXOGWZFOAaZRkzKCmmEDsJO7POkmKWP6zOxmwegAv64lXMEG?=
 =?us-ascii?Q?tKfICDmSkYB07iyOGzqFyLcCTTVp9Iyvcpyt6oiVEqQXdiUV3c9OJzfMr8n1?=
 =?us-ascii?Q?K1iFGOYOLBFVBhUvAF1CsUuKmv8hnG4ARVQhyYFOv+Za/i+vdjOgX0fpsUGi?=
 =?us-ascii?Q?9qL9oyyvXGPsfmMNwonuFsHjJNra5RrcyBdOFQKgJEkTsOtA90XWUbS0J7QH?=
 =?us-ascii?Q?ywWAFfN/9GxooN63fHbFKd4N7BqlBwCv5aDpf1q12csoLJ9UMQRQLFQbrKRk?=
 =?us-ascii?Q?xxHMyHnCQs+EuR+3T/9sLbPNXvs1+oqSpK+yQGGShPwbN4fjd37Ws9Nb/LZa?=
 =?us-ascii?Q?TG5lHMo9S8UlTIFeMQ5KP4C/p7egco0FzDe5ebWZi2/HS2OoRBeON1WQvl/X?=
 =?us-ascii?Q?5DwxllS1bndLNXfBCl+/9DHsy4d6xhQP4JFq6/eTCYrsgjcMY9gC91z0Az8t?=
 =?us-ascii?Q?Xy5NBV290U6lOZZhDXZnGufzQND+ov2B3y1lvv6x5j20qETG9NxqNwv/BaQI?=
 =?us-ascii?Q?JZyoxyQAShUE9nAMQvzT/Ewt4v9GrzyBCQbSS2aQhVs66CsjLctKdm/uCZeC?=
 =?us-ascii?Q?y77cs4WDlr9RRgON4Z6sTx60HtTiwDA82SQU5K8zx1VNOK+tHXY971+beaXg?=
 =?us-ascii?Q?H9Ihv1y2829wDQYPEP9GLKT0ypr8P0Q2NQ6jh83pSP3pa0ykJj6X7XrTMfFI?=
 =?us-ascii?Q?6p3mMa/6r2Yeh4lvGJFwfR4mAH0RT3G9HN40paU8Xcr+NMVJsTk9ld1FoTZw?=
 =?us-ascii?Q?YXWOV6msE/jxgTjZUaucuQplomZmzqkrTWBBuftUcF5dSR2KrLbcCDckZ3rB?=
 =?us-ascii?Q?gdHE98zUC1Mq20LDm4iu4TpH3LWEldl9Xu8y1ZP74twBLhVIBVWMG+ChWnqo?=
 =?us-ascii?Q?V1F4lmHH3o8bxQLLVqwEZYewJ5ireBWHvzQ14bEtVdaqE4jzyOs2XySVxJiA?=
 =?us-ascii?Q?fUstg9VSEF7IrhuvCsCphZFqiUv7plT1tCF9lAOtygsbIgHqTn5I1any/CMY?=
 =?us-ascii?Q?yL3Qd4U/Qpg0nJ83gNN5HCn9q6JBU1peNXj6tT/UEUNbEG8rEmfmtlcqWeg2?=
 =?us-ascii?Q?djV6SsjHUB6xFNi7Jz7CQAyV9va5qh0BJT5Ddm9rml5C+US9ggLOSvW9WwhP?=
 =?us-ascii?Q?lKFMKovMs4vq41g18GILg2Pwyxje/vmBkZocMIwMWP0aewXEgXCxBwin9gWk?=
 =?us-ascii?Q?KNAr+a1VAbfo1z7lx5GIKmNzWDlJ5GJkuAmT76URAn5V/iPF4W6r9BktFQwp?=
 =?us-ascii?Q?zrEkmuTqj3ciPufygCJlpONQT3XLZYtGiT+J6Fzyx+unn4PFWyUtpFILmrTp?=
 =?us-ascii?Q?Qbr7jX6U1oEWs/vxrZ2c8z0aLTmbvfUNBgP78uY+4iUufUMsVMczn1NaSOur?=
 =?us-ascii?Q?IUrbE7PHlt6JUkN4zqfzSWswOMaiXng1deDgbG35JqE+novvP/couX5D9UBC?=
 =?us-ascii?Q?DMvWdFqT0HjWoh/AACT4y/9gcCS+sKLOSvkAhoeuY5ISWc3sWOOmcAXOxYAb?=
 =?us-ascii?Q?6r0AZlZ41xyMMpuo50w3iA2vmcSh4EjvhDP5PPVD8+H1S+9fgQe/zZU8heEP?=
 =?us-ascii?Q?OCKQynAlmu8vAv/uZns7fFZ/JGvULcVDRvyZaKpoZ2BRMeqo4rXXhsKdIr+L?=
 =?us-ascii?Q?41j4Y+3NHu3qgnSK5Ch++SI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7db6f16b-841f-4ac6-9e53-08de3d157f9d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 02:39:27.9092
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JEes5eqvIDZGJHOP//pmbtexoATMo14CjLSL+UrUB2UU7eQXrr9QwWAIusIYwi7BeLElkm0Epj5SeNW5L7qSd++n4iSVSXyDmuAePd1NYFk2AwMA73EoyjwxRgD4RHWj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB15495


Hi Mark, Lars-Peter

I would like to confirm/suggest about restriction of component->card.
See also this commit

	45655ec69cb954d7fa594054bec33d6d5b99f8d5
	("ASoC: soc-core.c: enable multi Component")

We might have complex system, like this

	+-- Basic Board ---------+
	|+--------+      +------+|
	|| CPU ch0| <--> |CodecA||
	||     ch1| <-+  +------+|
	|+--------+   |          |
	+-------------|----------+
	+-- expansion board -----+
	|             |  +------+|
	|             +->|CodecB||
	|                +------+|
	+------------------------+

We would like to implement it as below, it is intuitive.
This means 1 Component connects to multi Cards.

	 +-driver------+
	 |+-component-+|
	+-card0-------------------------+
	|||           || +-driver------+|
	|||           || |+-component-+||
	|||    ch0 dai|<=>|dai        |||
	|||           || |+-----------+||
	|||           || +-------------+|
	+-------------------------------+
	 ||           ||
	+-card1-------------------------+
	|||           || +-driver------+|
	|||           || |+-component-+||
	|||    ch1 dai|<=>|dai        |||
	|||           || |+-----------+||
	|||           || +-------------+|
	+-------------------------------+
	 |+-----------+|
	 +-------------+

But, we can't this today, beucase we have restriction (A) that 1 Component
can't connect to multi Cards, because of component->card.

	static int soc_probe_component(...)
	{
		...
		if (component->card) {
(A)			if (component->card != card) {
				dev_err(...);
				return -ENODEV;
			}
			return 0;
		}
		...
	}

I haven't fully analyzed it, but I guess this restriction came from
each driver want to access to card, but FW doesn't hand over card pointer ?

	-- ASoC FW --

	/* ASoC hand over component pointer only */
	ops->callback(component);

	-- driver --

	/*
	 * It gets component pointer only, but want to access
	 * to card, too. component->card is added for it.
	 */
	callback(component)
	{
		struct snd_soc_card *card = component->card;
		...
	}

If this is the reason why restriction was created, do you think we can
remove it if ASoC FW hand over both card and component pointer ?

	-- ASoC FW --

	/* ASoC hand over both card and component pointer */
	ops->callback(card, component);
	              ^^^^
	-- driver --

	/*
	 * It gets both card and component pointer.
	 * component->card is no longer needed ?
	 */
	callback(card, component)
	{        ^^^^
		 ...
	}

But are there any other reasons ?

I think it is not strange that DAI has Component pointer.
It is fixed.

	dai->component;

But, Component might be connected to multi Cards, we shouldn't fix it

	component->card;

If above was sane, I would like to cleanup it.
I think ASoC need to hand over Card and DAI pointer (instead of Component) ?
But what do you think ?

Thank you for your help !!

Best regards
---
Kuninori Morimoto
