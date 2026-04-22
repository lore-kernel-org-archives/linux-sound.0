Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011045.outbound.protection.outlook.com [52.101.125.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7017E39DBCF
	for <linux-sound@vger.kernel.org>; Wed, 22 Apr 2026 03:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776827046; cv=fail; b=W2VWgrJKzGwwPSFPQ1QT9sAs3bohrzOhjymDB7rMpsH+Uf5GEZUb5zxAYSBRQij5G9pykba4cinLCfCXkN2f01UUn3esUW7UsCy/q/+KSjr8r6zIJhN41FszfmQzcQJEptI0ybpTmJBwJy9ENq1ulP9ZWvk9owXABnB9HBm7mXI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776827046; c=relaxed/simple;
	bh=JNHST/BH1dGVT6O4HbaDnVt4R6XP4ierTz4MXxK6GLc=;
	h=Message-ID:From:To:Subject:Content-Type:Date:MIME-Version; b=p7qyXMbwwi9uHCntpI9/O1AIUs5ng84dp5t/xaHsY8Nwh4z2i4C7OzQnTBChOoWp+GwSEKY5SlVWBCL83W9zDttIIuobuETsk4vriyfd5jfrBrNtqFsWVSBva2koxArnGdX/OCnEXuuhjnia8OOsJfrXqa46O/TXDuhZNiCBeWs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=WIjsF9sx; arc=fail smtp.client-ip=52.101.125.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="WIjsF9sx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZKqVlOIkfUWE95UNQVN6EcNsuXx5MHcNGu3Y/Vjw6+7EMDW98q6JesnZ2GlUIqPX3G4bd9Dbe5r82LfxG4ae4pGiWJlJZYz7uPf+p2VeKqau0ZtY31M1RGVqWKYVciPPPF7wEwvI8sHeSzTFJAFcQ0C6oQ9Hdq9Janrnpy0dE698n/o0HnlmVok1vWuk3lNe+ae/6l7kXmlvl5CvGbWR4DgH3sJUW1RcbsrMzofKt0qAA+qYXiTJ5Ob8IaS1FWvayOfT1cl5RUmlsXBal/FHDFxcogR1zNwqH1kdhyCZ4YjOmy1YQg+EvltGS7X3OdvetjIHnPdUYKbLLEI80ij+bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vgZ35VS3iUzq7dRDjfglp94TwTCSF5B9EF3kL++SOZg=;
 b=r4T/WsX2mTXF/9hA98nS24sZgP2utqld+R6vnQvTGMeQ3u5g0p0C1WeuyvIGqUeOHxiGRNxDd1xxu2Jze/sM1Kmz9ubys9TlRYsUZ5/ObFAqtZDxkltn7VCRekGg2n9RaSoNRWCbMztQpVdglBG2MvS1XJwt0D/T1Gq/OU3n5HkJ8nk/AHlI609K8R8azsrelb5d04lELCslAsIakTjgrgcJAXGMFlAk7Kqtp5Tfbjf3qWc2ojqUYgtSGRMvfV3DMd7dz8Wxdkm4EugEn2wV0uMT6cxI/J/rIUkQf3U+87LiVoNEC7hbWh9Ar7oV6GN53PdeEiHr0kCvg/abzbYwKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vgZ35VS3iUzq7dRDjfglp94TwTCSF5B9EF3kL++SOZg=;
 b=WIjsF9sxQQbhmDZtwyiVJ9owSC83zX/pUvDUB9pBfk+OKxlHDpksLyyH6sc3ml84iSBaNgtKezpoSuOM2z3YK16/Z7u0jSodTFrQj1xXJyyLyzy/AY0hLBJBJU+vwXrunisrWoCnokUpGiTSdkWRig5s3xFHR/RlF7Fc/M7LhLk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OSCPR01MB14402.jpnprd01.prod.outlook.com (2603:1096:604:3a4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Wed, 22 Apr
 2026 03:04:00 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.20.9846.016; Wed, 22 Apr 2026
 03:04:00 +0000
Message-ID: <87eck7k868.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, Cezary Rojewski <cezary.rojewski@intel.com>, linux-sound@vger.kernel.org
Subject: [RFC][PATCH v4 0/2] ASoC: core: use Complete rebind cards by default for all users
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 22 Apr 2026 03:03:59 +0000
X-ClientProxiedBy: TY4PR01CA0017.jpnprd01.prod.outlook.com
 (2603:1096:405:2bf::14) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OSCPR01MB14402:EE_
X-MS-Office365-Filtering-Correlation-Id: 82bf0354-ff31-47eb-19b1-08dea01bcd36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	9HMysAznp19BLOOvBHqfeCD4sJ4JTbxO/SMWql2r3RJ0JkPCWZDt7NdF2M8hq8MLvh2jM6sm5UEvMzgQkJt89uoYZ+UDwoaDkI75cLFmNyg2/svnaUJcqUalVYFZ7wcBvREp5Asu8V4aiMim370UFS8k9jc2HdNXaszsXb138KbmNikLbSnzBgmdKimG5ZhFcOx3EGFEpWuYJV1EqHzY+JDGxiuwIFELUM+BWib/yGQyDRjGcG4nyRr2Cp9ykJicD3jBMHVlzE79o0jdLrEEWIqUhLhFudZCgyAIMAM61OgBNoD181TikAqEgFG2yyP0mJchMajYUUfULG4F1RZP0wHP3wIJW+l1+0KCI1iF1bVvrD8BEX0tH9QyHDWGlpFgeGNMtntbpLEe5cDCywEowgKu0HELy1ZEKkyOGzyf7diBMBXLuuoWtY03YLdo6SdveUpwhxXBheKxYhU5YDts4eSeRBl118xPnm319FvVt7DWe+2zNZy8f+HCOg5UDaoC6Jed6GM3s8t41r2FIFbLksHC63UBJTXAwOTckDl2ig7Gx21AeizSDiOAl1FYFB4M5VaAuX5djiSRN3JKz80lJzXtQ8yPE4XtE5unWrQNaxk8okl1FR2lmIDOmTggFNnWmADt03Ag8yD4bzV4tq0cHsEgGFjrpVcINoeqXogz7/ikSUxBPwmo9aUV+worKRjN6rjxbfOLgQJdb7gaNukLkdy62KS6QVdVosAwqnOFHCJlVrsviwBDpjfjuYPV0EmkW6ToBa1bQkkIJT1VajWcqiOT05ns3qLb4E6Sb+AQ5pw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+h+/6+Jq7IjdWOybkIH8shrtGvBb1dLKEbPox2jwJft2h6wg7duphm+8fX3j?=
 =?us-ascii?Q?KHA8jfjxF2HKVJlCnwI+bkCjk3CfUjYxousBrDXYTzJT8OZzWijf+MoQuTUL?=
 =?us-ascii?Q?4nAPsHksZTaQCGPEJcLdKrAkug7WLIx0mEEWk2vJdmhmapE3MjDOkET26zrI?=
 =?us-ascii?Q?MhzEa6CJ4UKcxAfLL0QIbEsAfSDcCT08VRUDmvJAHWT97oi87zfztLRDIabV?=
 =?us-ascii?Q?CRA3VBI580wLrOrJk0Cb5VFWXupNrDbDZokIvmuFOFKZvV2FNCTU9/pGrale?=
 =?us-ascii?Q?pURewUQxh00Y4ElyuWmXnrlT7t2L0wTQT+v2+V+ORsE/ttHXy/vDEbAtXTLw?=
 =?us-ascii?Q?q724PqFiteJjE8DieuhOC0AOiOHbD7Y8J5b+iTXo35vQMbYub/DEYSU92SpU?=
 =?us-ascii?Q?aek/LzJjyw1zeRJPnIHq1T9AZChaXXPD5j5d1cO+NCIRCyoBou59Lm0R/9gV?=
 =?us-ascii?Q?GOtBholEjWDRLMaPAcPtABLr4CnPlnfO3nvxBvSuEXurkc4s9vAHASMbdyx4?=
 =?us-ascii?Q?rXBQyc4kUoXC1zaQRRiEhhBH4+7FMdMEb1/fk14ilL4LYCxu/6z2H2yPiUKd?=
 =?us-ascii?Q?2R87KdQBd0H5iXHU2c5i6Axn8XQprn8lgspyHjlSglgnrdtBrU62wxdPAYVA?=
 =?us-ascii?Q?FICMFla+j0uTNgnQsEDNFPkcIvFhyt3epftTAmQPXJodVBG+4/kP57frSTxI?=
 =?us-ascii?Q?HgzX+OQNHDXZIVyLrcOwNACd2AaZpLGexGu/nkOIazbTWvA9UMQbK2+HgSxe?=
 =?us-ascii?Q?pa9xvt2tqIpRt5jhK0YzNMeGI4CLFhCgMeiBIg9yxBio/s+5N7VLIT6yKjbg?=
 =?us-ascii?Q?4F4kpGGLAFa7fI6UOOCCmueTUh9g6Q2wjmgnS/eGPxWQKhH6CbDAVcweLEUQ?=
 =?us-ascii?Q?8o1C8jUK5+vBSJIWA1mLJS1dnenIkz+cRXF7cLIyNdJSCK3Gyop9XzfHGqmg?=
 =?us-ascii?Q?otqHsca99c0cNrLxJ8Qoii9LuPHf/5lhA6QEJuANNH+bx2ZQMvJcco/zC6qE?=
 =?us-ascii?Q?WPcKsHn1qb2dzfTPJX0H83CUhdqvnVtSXYY+IjP7Yc9Czd0ZbUZrC3wKlZel?=
 =?us-ascii?Q?BEwWt5WEA8K/+4gsBgW/Br+ED0zO+aj6nsFMdwUJUoBALJqqa75NmaD+wne/?=
 =?us-ascii?Q?/29ZvAcdycUDGJCHPvHYUfo1Ew34zOtdu8K3cHBK2hFEMenWVFsOAc9G5ti7?=
 =?us-ascii?Q?AUnC//azQ50jedVONJmGBF2WQI7xoWm1ow1vDizetIR9bpnF6YOhCZov7+0Q?=
 =?us-ascii?Q?4sRYT3bT3Qnh4af+dSEomS4G4qqX+Yy28349LiPduXWuRmX38UNC4PwAPwwi?=
 =?us-ascii?Q?QQuh6SwgySds9S6H76X7iMSMIAxY7IyAI/4QncnWJzyww6xPzJOoXH7k7tk7?=
 =?us-ascii?Q?iI20V1IxlXtI08+tHW+X1K1GpP4QNA+UKXbMq7iIj4p+F+FvhIzgI56sXqwd?=
 =?us-ascii?Q?rkumK/tvlUdhJwdDIT09wI8nkEwu0VGa//TiczFXZA6o6C4Rpj7RiuHqFNrL?=
 =?us-ascii?Q?zw6PqXaB5ZcighzmQIwTP8piz2OxuFQaANLX+IdOWiuZd01+tbinGYYGeo/n?=
 =?us-ascii?Q?jkZYhUN6yao41ELHZ9Zn6ic4QXl73IGvPPf9/Mbb+2Bl5aQi/gkL5GDO8Me6?=
 =?us-ascii?Q?r/A8JeisRvwdc/kZ2NWFrHHy1XXXJbYXQIsehR9lzBRpdALq+6aHTX5fZSsB?=
 =?us-ascii?Q?G7j3NTepScdwvk7G2zX3mdfiushDs9N5zogDhMCPs9kvyYpF7V9GPpv7REWr?=
 =?us-ascii?Q?do32GdY/jbNTtEaUa3oNK7yywJvHR1bhG6dAmwR4PhP1xmDAhUdG?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82bf0354-ff31-47eb-19b1-08dea01bcd36
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 03:04:00.2353
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZdhyDNtHe1luNn+ATLWwPAI4E7yQ76Xke4k5FbsSoy8HuvmFqsdjZ9RoInnpvjyqlFqYpSk75iMtzQPGbShCf/B62FdEAX8VNIzlgTCuwvUdtcp2MVQLlePMfhYvbKoX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14402


Hi Mark, Cezary

Topology is using (A), but its paired (B) might not be called.
Because of it, it will be hungup, because soc_cleanup_card_resources()
will access to devm_kzalloc():ed link (= rtd->link) which was already
lost in that timing.
    
	(A) snd_soc_add_pcm_runtimes()
	(B) snd_soc_remove_pcm_runtime()
    
To solve this issue, it uses devres_alloc() and call (B) in topology.

But I can't test it. It needs Acked-by / Tested-by from Cezary.
I added [RFC]

v3 -> v4
	- call topology snd_soc_remove_pcm_runtime()
	- rebind() function will handle all cards by itself.

v2 -> v3
	- separate bind/unbind/rebind and unbind list handling
	- tidyup git-log and Subject

v1 -> v2
	- tidyup handling of client_mutex


Kuninori Morimoto (2):
  ASoC: topology: make sure to call snd_soc_remove_pcm_runtime()
  ASoC: core: use Complete rebind cards by default for all users

 include/sound/soc.h      |  6 ++--
 sound/soc/soc-card.c     |  4 +--
 sound/soc/soc-core.c     | 67 ++++++++++------------------------------
 sound/soc/soc-devres.c   |  7 -----
 sound/soc/soc-topology.c | 55 +++++++++++++++++++++++++++++----
 5 files changed, 71 insertions(+), 68 deletions(-)

-- 
2.43.0

