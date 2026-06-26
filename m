Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011033.outbound.protection.outlook.com [40.107.74.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE34E3C5845
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 05:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782452572; cv=fail; b=KASACtQ9PnbKih6I5dh2H8RZ3Buh62qRIhSgm70px4+UgXSoNcfbLcn7+NXYinuIqL7ahcQVIW4Hsw9bKYWQFGYODu/DBHGyn6onpePTtbXahedH5HZjSUwmJwkF88SQQbwur5mqE7Bmvbu+Q0tkPAW88evwt9tSzhvjBTj4+uM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782452572; c=relaxed/simple;
	bh=Y03BNWS5HgprTIYsFD7bDCkQeTyCw1QtjY7OyDvnrdQ=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=cpcgxsv96vO9gpQY+sqml7W8aUYLyqhdsLFkd+AlWIGo75MRKMRIwgu538SNetyOiDMV6tnpq9f0fCubcUwwLL3pCJNyqx2dEvGbeI9pU5TlD3NhLy4bsQSXjlphIRR5JfoyQc7Fo5oq+ANySy9ychsjpfOatvAqXl+iWXmi61o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=TOzOBtjO; arc=fail smtp.client-ip=40.107.74.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="TOzOBtjO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CfZn+VkUXyYeQ7kiZsKsdP+Pmo+l1ywGG/1cKBPBd7F/n1V3ihORFmuzsXr/MQ/4JgI6zHMhO79jezIL+2shy7vPzV/B4AVbRZx1IS2lDa+uQzKCmgPgcULFFmGElPRDs0C0HAImVSU3klqM6teAIMDw/hEgcUxFEV0UsVKnePhz7tvcoDG5r1SihZXnNyvL/M7mDzDZtPSmcJTB1NpMRU3QuGtnGB6d7+Ywh2SY3Y1Xpst3d/w8YwFZMofE3mA34rq1U7Kuxx5Fmp/0be0qcMzmlQMoYYphGGuPA0AbTKnsccYUUNVQao+uvsub+naoOBjLn4PxFODsQziCkDpceA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2FptvIu2FufYZxLxqfttaKdBJWHjd89BDCfwja0rpDs=;
 b=wNBw+zmNzz5SJca6SCgSunNVebK+xJxD0/5Cl4Ik6XHtyI6kitCJcnvS2YTjX79ZUAkv9VFUJPq6OvTODw5Bl5qvPk/SIT7aRPyc60K4DLEqEJmDvbhEbAYP9+BeKwRW1UXVEW7Q/9v5zlHnOPr2uHJisPxu6niOHX6346NBCpf3fyicSJ9mBbka3GxZQoSeqZhLKrnvNubrmiNLjmO9qVDL0PitY7XvxQpTucIKRlpm6NiMcw3wfN5rlWwnQBfAJnEP1nprneaSYTbUGDD4jwqjIK6APSI+mHU1QCSFoFMaoXZf+m2kIHK6obJUmzggQgMhwJlWJkyZcvdx6rrpAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2FptvIu2FufYZxLxqfttaKdBJWHjd89BDCfwja0rpDs=;
 b=TOzOBtjOhfpcQcgAsUwWUYwbevjRL58NFBdhbDd81qy5Od0xjhFSLbyvTCrHSvetq6kh2OLQzTifNEKMtKRIDmD/mTjEPFLtwOJ5M+ApfNU7jwRxQXHxhkOVf5TfL/wTcLl9M4S6wfrr79MAFT1AkRan69wKMffYLVJVoqF3pL4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYCPR01MB6606.jpnprd01.prod.outlook.com (2603:1096:400:ac::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Fri, 26 Jun
 2026 05:42:49 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0159.015; Fri, 26 Jun 2026
 05:42:49 +0000
Message-ID: <87mrwheu1y.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/2] ASoC: sof: nocodec: tidyup sof_nocodec_setup()
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Takashi Iwai <tiwai@suse.com>
In-Reply-To: <87pl1deu34.wl-kuninori.morimoto.gx@renesas.com>
References: <87pl1deu34.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 26 Jun 2026 05:42:49 +0000
X-ClientProxiedBy: TYCP301CA0017.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::8) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYCPR01MB6606:EE_
X-MS-Office365-Filtering-Correlation-Id: e6023f7b-d31e-4d57-2c24-08ded345c1fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|23010399003|56012099006|11063799006|22082099003|18002099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	j1kRQC11YN75Xromu8PUqWQSLd9da65HDlLZd5DYDwMhPLA0P/r+WAoH51lcYSP2Wd1E8CmFqyJi8igrSr9MwgnYv9ADvft85jpSvICFcMgQiotu/rLTYXm9sDq8dveo0aDywiJUDiflhKGCrE3DMt0kC5dikNSJt5A6B2kKIjALOkEhUFBS7idlRKm40SxCBcLRC0LNUXxDrAtFRs33dIHkckO92BawBHNv0jcJ4nGgM+N+pUukONHvP1QSKHuoh05Cpojyh9ItVIuLIZZVpob6YIPzG8csrYFwjwk9/YBat8AAHeNLKbCbugNfBeNtLWly3srODuoZ+vg5f9REuavwUWBl34vul4EGZPbqIVYER9Q8pLuwVLNHX3w9e9sf0qe0Y8iJ3pcqC8E5Mq2JIA7Up2dsJnDMG7VGrUjo8L2uU2eDuRIAYxDNO/2iaWGu5tbLgFng7oKelD0BkFSmyX3zSYwgNFtBASs4j2Z7smnsMbhFaq2JT+3K5qAqEo0OUCZMOtVbLUL54K1mU15Wu1yDnfph6f3/6oBWmAna+39GutmGFD9if0CaH6bpRLh/PtT5A7YdWSnfuBILy1zdOtMintQ/NB8Zt2YAnvzasOENgVuPl9jwYSdeX0jMlk8/TeYVWbz6M1+f97QUY49a30c2Wb/7nXQfbk6Nz/6xN4rJp7SAyUlUmSRvMXzzSoovyzHOOzBatoTp7SKdQ7/ik1MbcmEs+ycZqnG6a4vnADBDdkEwFnhMR1EaLckWVr4g
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(23010399003)(56012099006)(11063799006)(22082099003)(18002099003)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mY+B+oPbd0kEj59kTwDldBdIlOdyao0Wcq19L9CN9Xm3Xe3nfPgSLmySN8nL?=
 =?us-ascii?Q?j579JYfVcq4ySOre20rwEZ57UqB7eW8c5pjNMTq2n8LQVJtAodDIzo3hsA6U?=
 =?us-ascii?Q?hD8xkjsQHUT3mvP3D5GjdTVt3Tqok7vdxDr0pmoLrjtEjl5nqPKrLU+s5wJs?=
 =?us-ascii?Q?hF2w5/aE7SPLRx4br5SOsNVan5PNzGu6W9yhVMdKzp3KToYzsXEoEjteFDbS?=
 =?us-ascii?Q?goUiJjOHQgg8T6WEibiwbtpP1FjOrSGkLrUTdwjRdg8Mdw0rsJCGVMEzSVRa?=
 =?us-ascii?Q?yhg6mLn+Bvds9iL6brCWCAEFLPsPoNjozsmVDwSOvbS4ACTNMl3foNwqWELq?=
 =?us-ascii?Q?DCzMrJAB5mcOr1jUbobRlUZo3rFN8RKgRHCSP4lbw5jaiiaxuhzwl0GoXk4o?=
 =?us-ascii?Q?NbD2ME2zyt7D3GUKvZWJQx4x9AnqkKBjFTEBZhUDfy5Q3dJHKCI5LXfHK/Sn?=
 =?us-ascii?Q?vFUVVRyVbwCDijT6HLpToQBSjOTXI5PvyIyA/hqBu8xJcLw5qswrWJnguXQC?=
 =?us-ascii?Q?Rk1RnBGtREvpqf194TMOXxVW0oA3+e7Gh6N+NdvYlvQ4nXEk1pmbcB5f255+?=
 =?us-ascii?Q?QZZzPZh9Qk1B3ztGK2PQjF9p+MoBpVe9kZIZGFkqnf81wctpeooIhD+FAaWY?=
 =?us-ascii?Q?djorTLZJIP5/4DdSopFZeBNj3ZFibcIjB8cLKnRH1NQPFS6208zonktm9VK0?=
 =?us-ascii?Q?TeQf+esH595lACT4Y4JOYMdDAuDHrrotLt3pmTPqVzMTUtVm8cV1NJbQhsoC?=
 =?us-ascii?Q?LIcjH6fH/xhQeR28HG7KMAKgbeUXD3bFO1ThriAHOO6nU8fIHPeFxhwlW55D?=
 =?us-ascii?Q?LL10kfKgCX7DrdD17WXrze/Ssc7nwFTnVnCwi8Q0LcxEVzQORNXcWovlNqFj?=
 =?us-ascii?Q?Yt0Is4rzIh2N/oQdN3iiIBUbsYit2f1F71zfEs3Zni2zrf/5b3/MexuCqdQ4?=
 =?us-ascii?Q?85TuoWKFImSQowrKFClYVDwFNEAGK06+GoTGiEhw+WZRFVXM7EG8c/yoYOx+?=
 =?us-ascii?Q?e3RuAIkbFKA3/785719L6JrgQkVeUMbXTrWXbf2Tf9CwyoEc00D5nSxiii7W?=
 =?us-ascii?Q?eS/5ot/sE06DaaWYQ4+OT5q4PrCGZqfos2tNviBf6ugRe3xSh9MlOQadD5sv?=
 =?us-ascii?Q?7EvyjXcOHeuJ6KzQRgomUn0TaL1Hr7ysHl34EGXH/tquiSswm6zL3VXauwDB?=
 =?us-ascii?Q?inlUrRIrLPjtZFa9p7BYtGamzyd6MTJ/QE/8hKXwBb5Ed9KLA/XdRhFbGsT6?=
 =?us-ascii?Q?5rOt43JYCyZ+s3t1z0dQSjrtSe4AD4X/sfTD26hmMRIrullLIs05p6L9Rvld?=
 =?us-ascii?Q?JoscoH6K6ofQ57VQb9omsMX2fxM0IH7S4f5rlV9ZMhvzHn2b+DwqGTufP1fh?=
 =?us-ascii?Q?ZVWMdiBV+94eSmig98PDyG5sK/soRQEUZZX6Gcmr0uAdnBH53AjM6dgDgzbg?=
 =?us-ascii?Q?Ed31jzDr5r4a+zxkSGY8COdetsotgV0h9rQ/pJdfRp6UUNwVAE+xRGr6QyZs?=
 =?us-ascii?Q?gHzxSuAx320Rm9o7y7jjQbSBBQxvgjGxGzpec6mRZ3P+8e6iKRteTcIX+Z3w?=
 =?us-ascii?Q?L422dOyjzqqbUl4yHoeEYJlK9XlRQTF+k6w8xIowbMORESk5JpLKKdufDcCQ?=
 =?us-ascii?Q?4JuiAbwL5MFjuVvwLgzVHeKPSiwItaQ5vKFCSxlCPgKGVBwOTK2EX6T7ifF5?=
 =?us-ascii?Q?AVq5pdTcijb7xEualTTmXAf9JBjvWh1scOve2NQeHGI+9/c08UY/4llYoQZf?=
 =?us-ascii?Q?QJ3P7bzzGWikn95uAiy6A/ZzixU9yeeEx0uC94UxJcwAdBW08ZUf?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6023f7b-d31e-4d57-2c24-08ded345c1fa
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 05:42:49.4984
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3aOaJtX3CfxsSo353Y5gH1IhOqRTloKMpZDpEk5Hk2HwriHZ4pGHtpuod2BiyD5KvCwgMDvPfoWHXMMW97/CFlbMvfiQFo8LvsknaNbVXqhOlv8QRf+BHPcOz6+B7P13
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6606

We can get necessary info from mach. Let's cleanup sof_nocodec_setup().

Current code makes old style / new style conversion difficult.
To make future conversions easier to understand, this patch clean up the
code a little. but no functional change.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sof/nocodec.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sof/nocodec.c b/sound/soc/sof/nocodec.c
index d0db80a46966f..d12dcc5b7f55a 100644
--- a/sound/soc/sof/nocodec.c
+++ b/sound/soc/sof/nocodec.c
@@ -68,10 +68,10 @@ static int sof_nocodec_bes_setup(struct device *dev,
 	return 0;
 }
 
-static int sof_nocodec_setup(struct device *dev,
-			     u32 num_dai_drivers,
-			     struct snd_soc_dai_driver *dai_drivers)
+static int sof_nocodec_setup(struct device *dev, struct snd_soc_acpi_mach *mach)
 {
+	u32 num_dai_drivers = mach->mach_params.num_dai_drivers;
+	struct snd_soc_dai_driver *dai_drivers = mach->mach_params.dai_drivers;
 	struct snd_soc_dai_link *links;
 
 	/* create dummy BE dai_links */
@@ -93,8 +93,7 @@ static int sof_nocodec_probe(struct platform_device *pdev)
 
 	snd_soc_card_set_topology_name(card, "sof");
 
-	ret = sof_nocodec_setup(card->dev, mach->mach_params.num_dai_drivers,
-				mach->mach_params.dai_drivers);
+	ret = sof_nocodec_setup(card->dev, mach);
 	if (ret < 0)
 		return ret;
 
-- 
2.53.0

