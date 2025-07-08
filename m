Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011006.outbound.protection.outlook.com [52.101.125.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B13188006
	for <linux-sound@vger.kernel.org>; Tue,  8 Jul 2025 02:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751942787; cv=fail; b=QlLBXmIs/UH0ZIf2QVYyp/wsb3771OZrIeuiQrs0PvBA3pGnRY3XCeTwRj3tsIMiYndP+SDwsCDb+3gMbmxEKTsqKY6HtJ8IyTcc/Wx6avlSdyl7/fQ75wucbqN+UGpRRQIXeci4hoURbZdUy/3lgQernp4GKpU72rjsUSafaUo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751942787; c=relaxed/simple;
	bh=eGEdpEBN4LjyQwfRlAPawr7E2pLu7j3pA7Lp11/S+HM=;
	h=Message-ID:To:From:Subject:Content-Type:Date:MIME-Version; b=aH1iG3y1nHRqrqTFlhw4Y8hoVB/BrP2LgQk/kmWpRbugnmF4ciCDWX3Av4e7POZdxMKkbTWczIvqLXXc62k+oEXLHKTZ3KcfnQ4XIui3Fj/3GhCnUTM0t5ZzZ7WR3d517ghuye9WHczABej/P6wXUCh2hRUjaxycmNV5rLqMugA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=KYmHm/1q; arc=fail smtp.client-ip=52.101.125.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="KYmHm/1q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nlbuz4iJgC9LAgcNPUnlQbkVGqtX8HcE8fvT5GErpxFuiWWf9lPoF6aba19ei/zqB2MZ9V/ne+AKmvCDeQJyltjboWzqbLWrPBMbxgbritijnAhedtl4Mu72mFTfpjfkqwxjNDUWFTKEhRjFgvUluEAxHSUn2MWRMpKlQgI+jfMXwBmcvvuNlNy7S8o/3wf6iDqEnDkJsfcwYiE8VkKo0xVTLwUnwdQdtIIaOS0f+H9wG39CKkl0qzzPWI3Aw+TRfe7NQ0UqLn4aDADHO2wY40jaeTW4kxap9lDdnZXSeHJo+k1naX3m5Wnb0Blu3hJXLs0E1kMPa5gQc8YEhPsEkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0KE/zydBAiRoHUJdp7PK1FBja2U5WgVJ5YkSLIUZkII=;
 b=JvdivrIEkAEL4i+X2d1m4+l6QDfBXAQVGT30k8t1CVkIT1pzesqmwr5gyTIEObH/B1EhgSaSTB6DzTa6YhzqvemC449nrzgGTxDOh5gbt46u/Zc5JIfOLe+2Vmbqq1t8dRDa/rrTpvZnpGGN+imUx1o5LmBRxzHClzjuJRk6cCpYyqIhof4i7NIcQeNc02SaKu0/ipYvSB/24BOadDGQ2ENLiCKC5js/c6ub7315Fp2ZXyuOkdnoDyznQqPtJXCaaeDjz8K2ozp+UhZMDs2ax3O3xEITVLrZyjNLQVZ2+tTauaJvmfLZZgf9u9x0ep5AJwye2Mp6lzXMdB4D5xfZ0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0KE/zydBAiRoHUJdp7PK1FBja2U5WgVJ5YkSLIUZkII=;
 b=KYmHm/1qfr+TLLnQG7n+Cc7TOWxChYsFG5pLt2r2LUBo5+SUJfN/ukoMVhY68s1+h2lRfTiqPMFRNPtA3VVpzSpVDltVre4XuN9sj+r/IZmXjx5GjbZxvGosMLINJVYKvgkUOEQiXgljHZ60LWcBMXTiHeVn/3Af/Afg406N0ks=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB15927.jpnprd01.prod.outlook.com
 (2603:1096:604:3ef::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.24; Tue, 8 Jul
 2025 02:46:19 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8901.023; Tue, 8 Jul 2025
 02:46:19 +0000
Message-ID: <87sej7mmbo.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Oder Chiou <oder_chiou@realtek.com>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/2] ASoC: don't set dapm->bias_level directly
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 8 Jul 2025 02:46:19 +0000
X-ClientProxiedBy: TYAPR01CA0174.jpnprd01.prod.outlook.com
 (2603:1096:404:ba::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB15927:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ce1b555-1ddd-4219-a983-08ddbdc99dfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?co28H5w8ZKNZcuHb5mphdv/yeG+Zcby4EcocEzh4AyVxiEfz2m/KgbFB2FVJ?=
 =?us-ascii?Q?dUVxxxmkdbhIYJyAe7rPbproFn9AyUEAjXJuELhUgp0KLc8CE5Ow7bzf6Zre?=
 =?us-ascii?Q?QZQWj007XNSdPWV9IlumWl2+9StkTwfMxIVJfDky+IE851Ym87XDw1R2KG6n?=
 =?us-ascii?Q?X8/Xh8Dck2m5l7u9ytTejWsCtnPFJjpyf599Btq0LagClX0WVjAW0reo1mPh?=
 =?us-ascii?Q?Cx+aHHRTxJmUnrkLr3G24BFDkBHajMz9+Q6ULTQeBYMzEQHgAsfN0B4cDqBy?=
 =?us-ascii?Q?95WQnqQzH0nvoNBQGUqIzUBV6epNQeg+LaE8vuw7JRjaJHn7zGNxUNadIb4o?=
 =?us-ascii?Q?gqxHZqKbnFfmDYa3KZmC49SAcTE0EtksoRoUunNlqQ5YlWB/Z9YSSFfOOnuN?=
 =?us-ascii?Q?eZ/EfK5eCZdNj4lzDV7lmwQ7z7L8KSLQ51lO4C7znVAyG2E97y4Z7z274EeQ?=
 =?us-ascii?Q?x4EBzIM3Nj+KVWsx4HbjsFYnMRLaBmGWhXZrL/8XXMBDqOwdDEN8DZreGcNN?=
 =?us-ascii?Q?CLQOaBf83aGvv7yqj5UlxqVpy8crE2zYO/MLiXiBgfaf5kGYW6AdyDQ19PxH?=
 =?us-ascii?Q?d//sU8hx1cRlWPOYFGR5swqXndK/nwBJ3EH9i7102JtEm3406aukR7pnVW56?=
 =?us-ascii?Q?RlvshpcokIC2rbl7llyplj3V2h8Dvmqipi1hNAUrSoaUWcj+M8tSJLU/EBDK?=
 =?us-ascii?Q?ZhF+6+4q/oD9XaJ6y3QC100toBNMvomm/G8dHvGYt0oJ1VhjMJF8PStHlxLH?=
 =?us-ascii?Q?SNQ4wBglU1Xw/cn5X14CQ02fO9YF8prUR7l7IMsA/UVNE43v8ebtfVvCDH4q?=
 =?us-ascii?Q?g3z24IoXAIVf/SIYqz2J8u/d0oNFfxoznfbwZg0WfFXbnvnKyB1CC6Eyu5n1?=
 =?us-ascii?Q?OiOnFyt33pYIVUk/H0lE7GHh6pqVJIfcaELsrLHwWV9+mHm2OclBPHAbBNRP?=
 =?us-ascii?Q?zxhAevC62UeBzUsTw0WRemBQijBEdaBc0/3TXbaoSMWixRc4FOEKuwSWFjQL?=
 =?us-ascii?Q?t+nNEoZTquwVhe49tdV7Nl0QWVpOYeKGDzLBu0bFUyyaBPQhka+a6k+bIk+3?=
 =?us-ascii?Q?1XAV+GSR0Y2M6pBzD8U+jfk6OzCY/GMipAzhaJVQAESEHk8Y8JX+O9Orab/c?=
 =?us-ascii?Q?wOFI3MsS1u41z4QPH1DR35B5J/w9yPBUVVSQwXZ/afHtH1QCqIBORkf7fs2Y?=
 =?us-ascii?Q?VgjqKS/Ti2HPn1PkFyppBYavm7F+oY0mQVxL7yHzMvS5NwnziTohWg10Kr/G?=
 =?us-ascii?Q?/v/YZGRkLYyEvbdsPgcxb+6+pTDHbD5UlnTmETG8uNtW0tr6zW5t0UMt/xfJ?=
 =?us-ascii?Q?u2BlJUkwWjt+mp588B2WBHKAH98o7bbOkeA75u0cnp6cAVKOUGkQdt8jkL4W?=
 =?us-ascii?Q?Rlw6VT8iG4QBFCR/W1DMhOpPiaFSiDPywQWncEHV54nfw69JUJv1Lc653HSf?=
 =?us-ascii?Q?qqSaIAoPrgyfGGt+OYUAUsyHd4vvecnAkfHcMZrZ6nVOC7c+52reQg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vuAYl3DAVNd7Hj6zjhFEqyCnOP1ZdTwBKXYjX7SMN5pRxgWOF5xS8HRkFTMD?=
 =?us-ascii?Q?36bWD/3YX5oihUoH3Bx+PXOOsIoM8/XeNCjZWd5roBUyVerJ4g9NXdTthOfR?=
 =?us-ascii?Q?XCyie8OWq4vREMmIBZToF0J1FaGOhxw14NUGJV422br5KHKUT/kjOW0/DZXo?=
 =?us-ascii?Q?9ZAP4VdNR52RBhmyVPwdBlyiQzrx3UkdfxthuO2gjJVslQkonCW3aWpNvmRL?=
 =?us-ascii?Q?DWECjK1yIq/I+0pafVXyajFTiCVpXB4d6G3zageBjxWVD/Yl3B3kmGLMabOT?=
 =?us-ascii?Q?MnvkNDuWfHf3M9Soyd2BKQS0nPRQ/YjjhmiSUA+hlXVULIXDLgH6WGxbA5di?=
 =?us-ascii?Q?9OS11qhr+Ejszxc/XL+X4yWhE1KWfXGq7JPgn00MlLZ93A5HdXkOYIw+C4vN?=
 =?us-ascii?Q?OvP9zBjK3EPA/RMK/jD11oahd399PrOFBwUwMxkSEpsYp1nJ5BsA0oJyS5E/?=
 =?us-ascii?Q?8f56VPoDxY+m0oE0jmbc7S50HUNqMS5dqBcTjn81r0v8x8EJZSnc47UfeOvy?=
 =?us-ascii?Q?bzdyTE6N39Ktt2EKg54yM/Wx0sJd6b/55kYDQI5/BmjeAddHPqal+XA4MclC?=
 =?us-ascii?Q?QYZQZs4Aevd4yf2IkLclEanKyd3yX5K1ZyXBRCFbyM9Iyt/336pxyj1wek5d?=
 =?us-ascii?Q?Xdg4B0mlQUarfd2Ckfib/LtdxAh+iuH+9jljOraK1aDEv9Oe/ajTvGXY3ZGA?=
 =?us-ascii?Q?kx2HMQvWN7B4VPDznDmaM/QVpt1rr6Xbe/8wIRZNNlzVDlVo7egauGGRSj4q?=
 =?us-ascii?Q?WR2WxkAEQA7Xq+eYRLDqzU51g6Z4yufIP1nvWdInWSVTnqSg3ntukEhmR3jK?=
 =?us-ascii?Q?Elx7G/NRV49hR37vzkNqgKNSCckYzvaIyTLfgLu3goTjq1NumyBr6osem6NZ?=
 =?us-ascii?Q?oLoS0bECAgXlji7l+OKNfpv8Fqo5uoa7hZMIu1l8oZXvzGmGHh9NmYkWmun6?=
 =?us-ascii?Q?IvZZZTvFbsyYQhzsY04PwgtX9rF7YIFjvKDqLYSTp0BQY+tYQZ8wqp2qMAqu?=
 =?us-ascii?Q?6YITrxIFsbs+E2wwMRdyyBWOEeYgf7jwIJFP5SuLXK+Ubvp28j77TJluOUh0?=
 =?us-ascii?Q?7lJvFqT1FUD/xFhjX5K7hdkM3lHmXhCIq41F1eQk/SDHZN/Pd5Am6ejwhfl3?=
 =?us-ascii?Q?BhyG4UtRD9pi8mgj2dBoRSeIokbNqSCIjQkPU/30EtbE6C0Ou0FoHhQ6mSvN?=
 =?us-ascii?Q?I77qvpQdGGFv+r/TXmn5lybNrgv0aRLnwyn/WMetuilELZnlIYOWRCqyaInT?=
 =?us-ascii?Q?cLL3dAUeeMHHFpTfjc/hQH5ndtM/+mI9zskRgomMCNP8vhmYqUMMjnSCyEDh?=
 =?us-ascii?Q?A5CNAM6sQZ6Xd8Wzwn6s6BIcMCidTF/vMQD0IF7Tq75j4kqVFNNyrahuso/m?=
 =?us-ascii?Q?CC6rBW0fr4PWdwIv6uFadQjc60IjvP397Qliibr1egUsMlrZHTStm2W2QodA?=
 =?us-ascii?Q?is4PVYTOETgAd/q5JP9W7ADakdFp9BV3+YK14yRSSy2VxdNLKEDEFqR2xJLX?=
 =?us-ascii?Q?o/QZWilyxJCtFN53465C0K2rdjyq3Z5xf3ggIPJUMWzOkmNHVUgiiDfvLDIU?=
 =?us-ascii?Q?FtspHyXiRFdzmtTYRgFAmFHscL6z6TF8N3oeKuiD361E7QUSttKgrlTVaIy/?=
 =?us-ascii?Q?wGazJSmodLd5ZTKkd1Fx4To=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ce1b555-1ddd-4219-a983-08ddbdc99dfe
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 02:46:19.4711
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XX/guzgZLzX16FQHxFyQKTwHEsIgN5DjjRbv7GOEVKynWrma/tCGda5XUIi4prAs4ay/DAkRcD5gPmvaJ5qA/VBU0Z2QrFQvMYsl//yfky51uh7/2viLdxpP6IaBZxCj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB15927


Hi Mark

We have many set_bias_level functions, thus dapm->bias_level should be
handled by owner function, not by its callback functions.
This is Step1 patch-set.

Kuninori Morimoto (2):
  ASoC: rt700: don't set dapm->bias_level
  ASoC: rt715: don't set dapm->bias_level

 sound/soc/codecs/rt700.c | 2 +-
 sound/soc/codecs/rt715.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.43.0

