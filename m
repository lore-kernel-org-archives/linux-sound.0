Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794463271;
	b=lhNdKWrJBbsAD9btvVGP1bnww4yjS2PO/cClsyzrcj6Xzfsgn+eYUdb77squXXqPL7We
	 04JiFjvSEB2luDh/qN+w4uS99YEeJtqzuJFnRGqHcMHW8SFEn5mJEPs+RDEZGsW/IA98x
	 ssq/QenKMNKKT2uW0Zjd3jeocA2ezN79+hru/xzHa6vJl4RGYipaFkdAjUfuqxyjCz8Xs
	 k2P/voLlhE240hp5CXqT+LVKcg8utEWuAdrvdNbGZs1pzKI6EbYcObN2Z1pAbHxyoTSsT
	 GRuExCo09Qje9Us0ffC8FZPCB8vTu3UaaX2miH4OQsOsn8xfHHIDFE1QWDwhfZDHnog==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794463271;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:From:
	 Subject:User-Agent:To:Cc:Content-Type:Date:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=Nw8qOu7AX3c09Jvdy37d/AUvinpENK7A9B2sbeofsGU=;
	b=Gd25EKB/AVTcBu8koYqQwGGN/DIuVKJSxIZHSW8gLHJ5dd8kkbpz67W3JDUO511F9j3S
	 FLqsiA+nx55bsGBq6UAgsdJbdogNPWBwslZVAQAA0NMPbYh71vE1wMNBfUNk6KPtDXZl0
	 X8BPo7BfsUs15nXQodNfWAZKac++AI6pnrzV8ffS3mzCAXJgO3ESeolzVRMZpBLTHiQpT
	 ZbQJsiHW3WCnsWVIUoFSm14KspNo7Vd33qNXL17lbywioZCUBrnZYpMGVAJSrEqvpbAvO
	 BtEDH+cKvRUNGTsGtNRRAWXUB46jDe7qeI2Kpat8ir0r2qvQViulJDQLOoAnYvxGRAQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=HqY+KZQY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.46
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010046.outbound.protection.outlook.com [52.101.229.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1368C606A321
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 06:01:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1368C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=HqY+KZQY
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y6AWPgJ2RKXXvp2q5qXGMu1QxbXiWK3wgdD4cW6MxiTq+mncEQlFXy1Xk0GtoONHP76qeB0sYQ3hVlbc/qnQr7mdJpn/rceFh09gYMnQZhFF+MG/r0886LTpIdB1XOfYg7+YvyJmPwB18DN8oSvp8nhFhXZjecqw5mar6lCMaQRJo2PV3DuVVvD9esrnIDZI1LSFsqz+WE7EzMhnp6Oz0ge3GyDj0ZG7tvJyG4Oiuj4Ij/CcX6op95cBij/2/4uAlL+wDzmvW7bl8WuYpM6I3JLT0Vwr3QWSaB8W6gnqc5GEeRv0EQbttfLcH3/29S4ZbowZfB61oLHIHMdy8KCGPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nw8qOu7AX3c09Jvdy37d/AUvinpENK7A9B2sbeofsGU=;
 b=YNgYfdHxnrLK+y2tlf5Vv7Mn9DvKNV1PPsB+gpxcTyl6rU1zKhiRE69e43n87OM9aL5l/X21nYdDiWZL3J3kdbzlYggTiNZiGQY8x0Ar1wvOw/eMMtyGFgDPfGYi6Uy/pMUkO0RWK3jjeBkRbnUxPoUz2y9fC457hquiIPohk7WeqLfZPgoZiOd6FuiJmKk9G2HAwcPzw+HTtm761hbi3ZZPY1IuTj27/d3trNXywWhjwxlXonpQ2cNOO7BbSvSwnAhT63t3d1aptUFbmPy64Iao0ikhV4R0XMi7xonXkLnSyNSuKDe6c5buciSyFnj5nkncpRAxM2um6m45PIss6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nw8qOu7AX3c09Jvdy37d/AUvinpENK7A9B2sbeofsGU=;
 b=HqY+KZQYYpTi+YtgX5hA0yYdECNhYuz8Dpn2gfYX7CrjgEn1UDKn19EbzepUEv6QBypUeuDYoAjynJyzo+WBzabALDo78wcexGRPZDD+UybbZiqY/9wPr0ZbhGa++yaSEEb84NuUVylQmP57DkV20H6C+aEL+1+D2Fh42Mht+hY=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com (2603:1096:405:27d::8)
 by TYWPR01MB11234.jpnprd01.prod.outlook.com (2603:1096:400:3f2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Thu, 12 Nov
 2026 06:01:06 +0000
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d]) by TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d%6]) with mapi id 15.21.0615.008; Thu, 12 Nov 2026
 06:01:06 +0000
Message-ID: <87h5hmzizi.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/3] ASoC: use snd_soc_register_component()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 12 Nov 2026 06:01:05 +0000
X-ClientProxiedBy: OS0P286CA0058.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:9f::9) To TYYPR01MB15175.jpnprd01.prod.outlook.com
 (2603:1096:405:27d::8)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB15175:EE_|TYWPR01MB11234:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d086090-730d-4244-13e7-08df408256df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|52116014|376014|18002099003|6133799003|261009223027099003|10067099003|11063799006|261021123027099003|56012099006|261102123227099003|261021121427099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	BO2W5mDdZgPmqpUTtGi/yJG4YYs7huJJ0xmV53a2kj56r8w9IbgciBWMiZnMyc1NEtiHuQvNrixfIte0cljb/E/Pgg6149ZzX5BsEwstz49lKpOwwzxp6nUOb/xYn6ercKOogCHSHGdCl53PsWgWIefQJGM3MpvtW7bHcNqEztTBONIlqpwJzXck84cECd8cRWsF3d1PbrVmjkDm6pJqzlpyovyUSvruP4Kea61blY/wbp87vbk5UR9sQRzDfY3jumJiLll4JPxtC5Vek8MHWPVwizUW6rUs/Z286HUujpmzlfXLBzr3O92pl4w1X0V3cTPV+97MAHfRIQAswvc8TKhrSPjUhqzgkMGSn+DWGOLrBc/PlMulm/vOdK/UHDqVuL6sqSKyvlqEQiq3XE7DKbXuy48Y9berDzXLrvW3VEE3Rm4tWO57jQ8s+e4QVU3KsnCVIxflnut65AQ/fyoWUDnnMfyL4ba4lvJN/NHhT4QBff0HyATKQI/RuzQkfqISEijwTVwfR8t2PJQR8+idjiIl3xvi+Lj6UCMxNvyU53FpGcdeRozJUdmzeVLtiIS+jfkKfXwDMThR2qqeJyN3gxKmqsv2HbAxD7bG/i4u/n7bv9lAQh5XDoU4kyBRr55pX3ahQSyRtodtEqMA+8Rq03fqU5I0072vt8VCnbsPhMg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15175.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(52116014)(376014)(18002099003)(6133799003)(261009223027099003)(10067099003)(11063799006)(261021123027099003)(56012099006)(261102123227099003)(261021121427099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ysFjAgsbdUUtLeyIxPS5ts2tz25dBd2AV9QcWRaVkfLmhXMxKrZcy9kvC0ef?=
 =?us-ascii?Q?/yQ+jkSTU9nKQ76yKwmkRqq041wKotQTWJs4YzU+rXyPRf5JbnOam8/UytAK?=
 =?us-ascii?Q?iPaAUY9SisLBVEzaNSB9Vi2gi2HkARUBLHdY/NUTZgSJ90yAoXPgnK9N6ZvJ?=
 =?us-ascii?Q?vUdLU66qebAH7T/2H+sjM4kD1uvlox7cmvdFmMiE18sEgX9G4zH7Npnumf3y?=
 =?us-ascii?Q?UE9q8ftXAmj37+AEObTMOLPqy3466w7RlZRzH9g6o8RGgNNqkMGZKfU9wtk+?=
 =?us-ascii?Q?yv5PXbT0C31FCnk2z5xtMs+ZLz6uKEEhsAVu4NunW9XKDyuHxqu+BwmwMPjs?=
 =?us-ascii?Q?u644hK9XlMIshvgY4qEELQft5fYwKkTbsPFChWM+aUHBNwMw6xQ6cYdd03BS?=
 =?us-ascii?Q?z7ess3ojzpWUe0WKZLsUGq4ne05LfXF+mgfLxCP4d/hDSiCu9yPIfUe69iDm?=
 =?us-ascii?Q?fixFJmTN+LD7XYsFhqvZVD83XUDq6TpKptGju/gIXL+Dz2pdHHm+tuLfdpZx?=
 =?us-ascii?Q?gT+opmPZHiwpTQtCmWbKKRgrxe6d93xGDF39sVROkAg74y2NLG+lOEP9FiB8?=
 =?us-ascii?Q?xfPxkkKNEk7NSd5drwDmSimtV5MdTDpLclSOongyhBj4ctAryE0Ej1w2h+Hi?=
 =?us-ascii?Q?znBWo+P6HXhAl+fVhoi0E2dyQ+hZauy55GIlvJnh74N2aZnp6utKUhRzCgg3?=
 =?us-ascii?Q?+u47hbKfeUEPQgtc7MZAeghe4XETrSF4/QdNM4NGMWRlXb9l/J5gZ4TXePmg?=
 =?us-ascii?Q?rMUXfXEI+HgohMc3AqQbxnbT6oRptO/3uSQaBJTfcz1qay2KLU8vTcPkzb9I?=
 =?us-ascii?Q?4SoKubl/TL+AQ/IgUNksNSecFA18MnZFOV1TZfDsu4M+TX+5oGy+imjEUXZA?=
 =?us-ascii?Q?Zhmy9Q1gsUBOK3Y8jgwZJeMGAEqoVNv/BvGS0LFCHBBTZNc3zqeajL/AKWN+?=
 =?us-ascii?Q?a35081nt3oG1dJsISYwVPirB3GML/4ftH6T5+zsbXhHu2N64Y0wC1ItPWnzJ?=
 =?us-ascii?Q?+R8aUhpKYFxzMeHhvjOPMs7VzpSR5wN3ipYslJJXKZT1SBUYDyz5EMTNQ6et?=
 =?us-ascii?Q?R8jv7ytlqtjAcpDmeb/SSX9zGcbePnP/MjdU0Q0inHUQYxTHUiwGyYlhHg62?=
 =?us-ascii?Q?tE4GQuEDoKnt69/J4+agXc+BjSC2yY7/e89/L10k/6AyS9loX+6eNT1CRWNj?=
 =?us-ascii?Q?CY3/b4FvPr2PNEz1SMsdxgnvA2B7XSyXoRhuqQwiTMqk0DKsO4TDc7Jdflve?=
 =?us-ascii?Q?5Hm3j0DeHxX8rWM666LS9FXuEAhiJw1CIVzVObo99+p/whoC8gxHSg4rxxV1?=
 =?us-ascii?Q?2rL80jhSR9awow6wWV1OjpInM//ss3PubEk5qv0IF2ZQjNB9d3hppYHA611B?=
 =?us-ascii?Q?BZedvIDIC6/2SJWYwBCZNnEiWvBHNtzN8Q0FMDFrgKWWFyyPgumHfvY52/xq?=
 =?us-ascii?Q?s7fL3wdOd6+K7t4hoHMqkL88s7itHJ9gNeItijU6j6kG72rl4Z7dXqR8piJw?=
 =?us-ascii?Q?uDEGNqhzRP+dGYOjkJu4nq37ti5NDD0jKIWLDKHdAftmBma+I0QL5w7duSrT?=
 =?us-ascii?Q?zJ1g9C/rdCoWeIltNVU4RNkoPgP+wDvqiOTslgKHr6KERSi4+CH/MJkDL43v?=
 =?us-ascii?Q?xwXe8abeK11CJDy+Xta3yziCOADS9cc+n3/eQ7R1CJ3Q3o0jUIWXTYh8k5lT?=
 =?us-ascii?Q?oZLmYSXK4FdaCKUgmQ5iwDw25sOjMRB08d9BwgosILzJHf4JOKU64+9CC48f?=
 =?us-ascii?Q?07sLY182qkR/hZhgjf6zDKBFXeKDWViziiCTVppnW6KvMB2TeHfk?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d086090-730d-4244-13e7-08df408256df
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15175.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 06:01:05.9574
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kerxcph1yoZXNV02DVRONIcp5Xvw/KpSPl6BPlLNUNfZ3YgiXobEDBMMZA81dOMNoNmJQKnJYPR9do47KvPFEMzeK5apJjxY+TsBnJ9ZKirTjy4aIuwiUQW+vWqImQw8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11234

Hi Mark

I now posting v2 of "ASoC: add new Component functions"   [1]
and Sashiko reviewed it [2] and pointed that some driver is using
devm_ version register(), but is calling unregister() which can be
issue.

I think these are different patch series. So I post fixup patch for
them separately. I will merge [1] and this patch-set in 1 patch-set
if I need to post v2 or more, but if not, please care this patch-set
1st, before care about [1].

[1] https://lore.kernel.org/r/87zeve28ol.wl-kuninori.morimoto.gx@renesas.com
[2] https://lore.kernel.org/r/sashiko-outbox-210088@kernel.org

Kuninori Morimoto (3):
  ASoC: mediatek: mt8173-afe-pcm: use snd_soc_register_component()
  ASoC: stm: stm32_adfsdm: use snd_soc_register_component()
  ASoC: tas2783-sdw: use snd_soc_register_component()

 sound/soc/codecs/tas2783-sdw.c             | 10 +++++-----
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c |  5 ++---
 sound/soc/stm/stm32_adfsdm.c               |  4 +---
 3 files changed, 8 insertions(+), 11 deletions(-)

-- 
2.53.0

