Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011061.outbound.protection.outlook.com [40.107.74.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7ABF34A78F;
	Tue, 25 Aug 2026 04:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787631654; cv=fail; b=Tu0wC/95kAvMgelYIYB/RYC75Oi5B/r0PTvpydjWR8qNb251xWtexU8SnUIGSMZUqgHvJo+fYJ/WtSWVtgwv3Q/+fkFQeZHllblpg465gF0HedeyTQiCHBU8s0I57f9IHesK7R2sA8lpXvDI9JH1QsJeNwE63Lv7WREnnS6V+D4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787631654; c=relaxed/simple;
	bh=8vrGJNT9WkxIeH1fTJ7688bwsWh1fNjHcbeYCvOTiZs=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=mia4ChQmkK2ewMmlBdnJb1t8kJDLisPN9ONTZTXEHNI5KXeZ7E4W6giCc2i0f0C1X8DaXkjgB2vRmVYqBXL65BMOKCLqSzfrccwjW+pRU/gGXuL5Vvs/L4krGSX0CK1Tg15hPJwkP4AqJoB3R3+o1kb0Hc8X5uOg8SfOi3P/2wM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Fo/GVtTg; arc=fail smtp.client-ip=40.107.74.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Fo/GVtTg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xP8LfDzcuSsvuzTCeiYMO+pFmpqUhKeKyFMLyEXzj3J+83jCrkbDQP6QgK6NCxBHNk4fao4FYchMbEzpf6Ou6aWwwtYzLJC6KeUX7KaOjlx0WJy2pLQU2UAGbNE46F7CtrX1zktmx9c4mC04vZLyXDrrher+c2nm/M5bxMKX2g7sYpcaAVf+wHybcA0bhtYinBEZooic4jgB6J/Qpyio0Ve6dg9EzesmN0URdnrjBXXB2YZVry8pAVdI/AJf49948I86qWTqCjtNAxhw8HUN9PJNOLDjrjCyGDEPdO40D3k2pAmhesaB+u/BHD1Xwbd2kyAcMPdkvF1hN8mAngTQTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5nFcPDZ45rtoY9Qi3S6ltUYU30mgF8oW57wreeEgCKs=;
 b=SUnML/OQVxIX5Hb187vUKbrnFtc3eCtnQGyV7WizFBawQP0PW9x0uhTM4W2TatYH2eC6TBzvc8Xe0yf3yC25DRwh4Jj0jP2sldSo6skGfwm4TFkKN1UNQ05EW0nWPuT6Z6MAHpuovwOn2Jd1IVC5whNU1g6EpCCvMZv2qXKu6/uSI0VcaRTLIamFrfB5FRqnwQNvtNyCPfOQ8s8/l2kxFJDnmB6Yhkfq4VuX5YZcBkxnHwem3SqPrrhZz3ESg5+9nBV3Wyz2KZNWucRsEBCyUTw6OuygMIKquqoLOcd4fzk1y79srE0W5y8+gQTha+5mNrM/R/DGefvAF3booKbAQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5nFcPDZ45rtoY9Qi3S6ltUYU30mgF8oW57wreeEgCKs=;
 b=Fo/GVtTg68qUuafYy63afHqbhqb/HYi/UYLzV5j1PAT3MvcYKBn/N2tYtm/eaqvY7sigtfa4r+UIHB1w9Dn2mPjMtlkVgSrvy3CiqAqqA/2lLPIKOKZntpNsJ+WAIXa+0yBErHku4mVrTocHJLXnph85rZfRK8GjuKo3KPPG6wQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY4PR01MB13787.jpnprd01.prod.outlook.com (2603:1096:405:1fc::9)
 by TYCPR01MB6672.jpnprd01.prod.outlook.com (2603:1096:400:9d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 04:20:48 +0000
Received: from TY4PR01MB13787.jpnprd01.prod.outlook.com
 ([fe80::2029:7bd8:d49b:23c1]) by TY4PR01MB13787.jpnprd01.prod.outlook.com
 ([fe80::2029:7bd8:d49b:23c1%5]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 04:20:48 +0000
Message-ID: <8733w296g0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
	Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Subject: Re: [PATCH v3 5/9] ASoC: soc-core: Add snd_soc_of_xlate_dai_name() generic helper
In-Reply-To: <20260824063627.3595610-6-harendra.gautam@oss.qualcomm.com>
References: <20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com>
	<20260824063627.3595610-6-harendra.gautam@oss.qualcomm.com>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 25 Aug 2026 04:20:48 +0000
X-ClientProxiedBy: TYCP301CA0086.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::12) To TY4PR01MB13787.jpnprd01.prod.outlook.com
 (2603:1096:405:1fc::9)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY4PR01MB13787:EE_|TYCPR01MB6672:EE_
X-MS-Office365-Filtering-Correlation-Id: 19e11f94-6c28-44d2-83dc-08df02603d9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|23010399003|18002099003|22082099003|11063799006|56012099006|38350700014|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	o5icffqt8CODEBCF51CyNcbw3O9XvOyzZC/0/w6GJRvXh9tWWNWooY03TXQwWKoHHrMIXtovaRVMzgYD1+HCM194vMh/89wd/oxRr3h4tInV+UJM+4V56OS3WkYRktAOBpmiPKxO+l0IJ6rZpFSFqPq9HZ+J1MdrXkCKuBcnUIqKmGyNqF9YUrnEYQaQocwTpCX5QGbOpfcrYVRor9UgYWY3mCNl2rDmWqk+iTOtBgshmA3tnu0AgHhlo4Z3WYlQHofdpmSNKfN13Qt4BbSddq/GBzpBPBKUQ0TJ6zIWIEoWyjVcDKj+z3OeR7c09dMX6JIuhqTTFRvAFkCC7xkYsDsaQyydmaKXykaQjQE1Ou2cUfW1cSBdsF2cgoTypYF2lfKMKOxaeIhOeFm7Jiffy/XUUkCmGSFA1BiYxmQZVQmOXj8dAx+YU1D0BgwFV8XLXLKrT2HR1sS+GwAe728sn8mZIkuTBKcUy4yTSAZt+ysNCIitKGrMI5re3NDzvJPsebAX9L/+DT/BiV73gwlvY+7ahcdCoCTTaYPtQ4Oyo4mTO6a/Fe5py3ONtKXAq2Mxzf5XoZopG2OGBnqEF894/LaW38T7kSOkdxuCJIm0AO23XxIFHX/5Gfb72yrfKBIhbWELry6ZrU2sWSqaBoa5Mqi0oAPD1FhXYMJwsZqUUO8VKq00KWRzodhU1yukPJ1gFbRQndG9RTYeXTYm2sNAsw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY4PR01MB13787.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(23010399003)(18002099003)(22082099003)(11063799006)(56012099006)(38350700014)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?S7jV5T5Ww2CdasK9d/q+TDI+TG1VwDSqMGMIarvpOneBlnW/8Lhm3ESPWgAj?=
 =?us-ascii?Q?NglH3SJeD0KwCodS1h4RoskIEK0DMWMROiS8fS9U3gKuhNs0TKJCkLyf7U4z?=
 =?us-ascii?Q?8E/3jYyziaNv58fZjCMwzOha02gN3syN1GRrAIuMx7wXE0hJ9TkOzlXE9rJg?=
 =?us-ascii?Q?d7QFFtCRqhVV9vxaPAVwKKJdJLnQ/FlypTREYO2TxUFLNMSC9B6ahbvhFqZ0?=
 =?us-ascii?Q?gW/K3ojRoMwOerIMjYJGOkCfdZQkfxsjlv7RrhsphGDRz8ofBbKYIZsjsDkO?=
 =?us-ascii?Q?2+71ICfBcjVKWE0I+grNM8cDwVgWG7syfQVJ/8Nq6oOXUeSNSmiLsFikfN6w?=
 =?us-ascii?Q?lZi6CJkDpbjG2w7eSZm7uuJpNpQR6EkAdWbWs8huH514Di5e+OjAvBDDlrXQ?=
 =?us-ascii?Q?B7oHXDLERrdSr52ujJq6uSQf6MOBTS16eolLt2ikRvmd9u1J1yNbNXo1urot?=
 =?us-ascii?Q?qrHWoZhHLJ+QIS+tHjjKiHC56Ycoer/RpVdjjXD7GNDhJOtsWe9aukexM3TR?=
 =?us-ascii?Q?p4WVim+jZXClq7U3zlR20CyRhFpm/kjyQ8o6VitUxil6i4AiOvrlXIh99E+x?=
 =?us-ascii?Q?Kidc5fANlngZIRqDhRp+on9EztjRVmby1B/eubUoXFNhI3L2U7OBrBAX+URC?=
 =?us-ascii?Q?g2hWXhKxM+3VH5YJmeJ5WP8Kw//O0p281RPVzZAtLqmPi/pKMTGrXTOuDdHy?=
 =?us-ascii?Q?mulQousDgAyhPqVIuueSNkWH53KJvuNP2Oeo1z02egJH9ezHvWQWKdSrieQ6?=
 =?us-ascii?Q?Vj4hCv33eXeaYLJGR/DBP2A+hwQAe9FFjtizQVswukNuxnL/L8teff1xcF+7?=
 =?us-ascii?Q?khi35Tx5l6cvGoNg0iR25v+FLjDMRnw4r47z2bH3DjzRuesmeOmRac8pRLj9?=
 =?us-ascii?Q?uKocr1axz/Ir0oh51zdxTb4mKx1RxJjtpaRRGPeCk9LKRLP+WIV2jRvW541/?=
 =?us-ascii?Q?bZgjl868mzQKErBNKxhnBkIEAVgIX9R2AEB67FHAzMTZ5AbTYZiF+rKmM89C?=
 =?us-ascii?Q?LJs9uPAYVcB3u4d2rJqHaYX22lm9b40GeAiDve0LJHJftDVoop1IlsWMt8mq?=
 =?us-ascii?Q?Ne7N/CCLu2DkCRkDoYHp8/PACAzLEn94oF1SCf5Gj9em16nxceoSobLuWsrs?=
 =?us-ascii?Q?gSM/nmMbsmVxI9OrIL4aO3IWjYrXxf3ykk3Bx+FxldpNpYqhtdZG7tYef96a?=
 =?us-ascii?Q?cPAZfB/DGpBmjLr7l6BP1RtzHtJanJKTLjizECewILDap61VY22pTZrjTWVu?=
 =?us-ascii?Q?5Gov7+ASllcjXa1f1Xxl0JaC9WpZdEGTSXqn3JJHaMK5aFR8UMqbIOSpJduQ?=
 =?us-ascii?Q?GcGCaMjL3OW1014zToYQydD7v+VV8HFtihm1ymvf9KAYZlJuSdfRWZHykMUr?=
 =?us-ascii?Q?vGFIjB3awTIlqfUXdeGkDoC6D3LpvV7jk+k1YKZvhedX+qCpmbhgT+UjEeLA?=
 =?us-ascii?Q?PW1JyXqThCcltlyCDdVGtC8RYmq8atCUHcoFZdz/R3KC8jXZRg0RAA+JAsTC?=
 =?us-ascii?Q?CvJX0MSGWkULnYMnCewCXWXibvxeXt/uCAHSgQOO4/S6Ryrpi50NXIDd66sH?=
 =?us-ascii?Q?mndV9EHGCuRL+FCj/ux3xVkBbkaI6pO3ZAxnDx23jmsOn3Ypg0E8M5w44vbv?=
 =?us-ascii?Q?Czh5KhkrWX7zM6V5GthlOhimecLrhoqa2O1sWigmXO2b58bwrzY7giPbIuNr?=
 =?us-ascii?Q?SjMYaoZioU7MrSent0j2u+AD6p32E4pMK15Cl7ojFQTd+J52jCPjuVha1QdG?=
 =?us-ascii?Q?lH4+fu/539X8Jxjn0looY5vj/TFdmuYWwXPMN2J4HW+nRCjyRi+p?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19e11f94-6c28-44d2-83dc-08df02603d9e
X-MS-Exchange-CrossTenant-AuthSource: TY4PR01MB13787.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 04:20:48.6682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EtMmqZhU1rNjySSbdPpWyVjtBTf6eyhgY9AIOM8ThfnFbcQl6JjOizCVaY2wBJ9lT3q4aXxYFT0mY+IZQZpRwTptsVAMVUyX+J+d6jfiOLila/RmO5WV0MuAWQqqponK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6672


Hi Harendra

Thank you for the patch

> Add snd_soc_of_xlate_dai_name() to soc-core.c as a generic helper
> that can be assigned directly to the .of_xlate_dai_name component
> driver callback. It iterates the component's DAI list using
> for_each_component_dais() and matches by DAI ID.
> 
> Use the helper in lpass-cpu.c and qaif-cpu.c, and remove the local
> lpass implementation.
> 
> Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
> ---

I think this patch want to be separated into 2 patches.

	- add snd_soc_of_xlate_dai_name()
	- switch to use it

It makes backport easy.


Thank you for your help !!

Best regards
---
Kuninori Morimoto
