Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010037.outbound.protection.outlook.com [52.101.228.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5B81D5CD1
	for <linux-sound@vger.kernel.org>; Tue, 31 Mar 2026 01:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774920309; cv=fail; b=JtPYwk+2T2+URYAuR1hsQv6WmkRQi0a/UJpk9Dl0TokRC3Gkqa9kLA2XzlyL8UOZWVZxcKBxbzbgmketxCI5ShCCjfl4xUtTi94AIZhBua5DJ8irjRiDIPe3Ydxb/SvK6KbPk60Z5DwD1dEM3/AolAewY+ZB/cWxB8rERtSJkLM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774920309; c=relaxed/simple;
	bh=X7mRdC/EOHKPxNkwXtMq76sHJcvl12DD2Ytv+x6QVms=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=JY4/0K+bnkWYNV3PRrHy124dGLRFhIYwMj01eFk9or6T8/bHbBKAZqAkHK9+DDM5OgGp+yihvTv2mVaoeqQr6NaWk+F/S1QUPCz8yac0T0g/oNw7SkiTV6tbqqw4f26eJHC7UpAiGsfjF5ZJNHOMrtxg1dI4RJpA/svfdSPfS70=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=j8PW2N2A; arc=fail smtp.client-ip=52.101.228.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="j8PW2N2A"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wm+vvUUoc/4JEh6fu0ZO25JKO5b9PpucX1nRhW5fc8QC08nLbQcKM+cFnxBZq/vWEcrcbwAt+qep/JNdt20wbefM01IpGRx0tNeMEnWeTEPuM3AIVSpJ8H5hKrksGtfFY2mzplgkXnAaYkQGwuVqakOBfrXMCGK1rUIz4fHFIOVtC57OgC/3H4W26rU+0KpWoLry42FmMP7oC8gbb9yLz2CpkqIPyelrvuLIX+trxVuWLAbBf+lIkFydvw94zqjA+Nb4/L7/jDRa/YDNFCAReHjyICmCemmLmdT8C0EvtZj1lCaTS7OW8FioqRSgF7uoijFxSwfKHnUoVSnKQfLh6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/f+nKuyI6m1qDgg1ORAZ3XRg2c2vnCCVo/MGKe1GlfE=;
 b=SW8JURKtgxClCPLPF6x0nCg8X5bxnXxF0gfiqSAZ3AHtVwq0YTJLsdiIKfXWTADNBmGq12PPiC8DT7qVW3oozFIMKhBuc9t4HBbWrLG3U7AByZK5ABqo11TcGu1q98URg99v39oAhHdIiSlaNQJIWkooGY2dr06wkxtzpc2z3dui/P5Brc6Fju66CQid4QqtqqFHej6qwHYiSBuCEzAP/69thc9WEIznouDl/1Ra0U7ZXwA/L44FzJeMOQVGY4fEIIMfeQ+C6xVUxy+Yv/tyE+uPlHsSMBdvuh1kFl1f6ll3h8p+xmBkLO2W8RY7kGqxZoBao0i5rdKtUHr9IIlrLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/f+nKuyI6m1qDgg1ORAZ3XRg2c2vnCCVo/MGKe1GlfE=;
 b=j8PW2N2AhYwqKoTyQ618C8LqDmRTp0Jfdl/5ZEkIaoJCthdvDX+s8HCl8RDt/DiAHvuM09/htJ3FgqXcBYCIKUKfWzLgkD9EitmtRMBTc2tqaaJD4zC2KVaf97eoSnExSkom+SuV4XDZDwBpAYQL1V20b5N5kc2osx1hDBF+Tmg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY4PR01MB14397.jpnprd01.prod.outlook.com (2603:1096:405:23b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Tue, 31 Mar
 2026 01:25:05 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.20.9745.027; Tue, 31 Mar 2026
 01:25:04 +0000
Message-ID: <87h5pwdc3z.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: soc-core: remove duplicate snd_soc_flush_all_delayed_work()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 31 Mar 2026 01:25:04 +0000
X-ClientProxiedBy: TYCP286CA0057.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::20) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY4PR01MB14397:EE_
X-MS-Office365-Filtering-Correlation-Id: feaa0800-589c-41b2-50d7-08de8ec4564f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	9CVSkUTD5LPWiWOOOa25083RJ7Llj/djdvH7FVTRXiuZrHQMobBMf2smvCHtcqzLmT0SHALU35h40IEe4YtNRLymfpVr+cyzlmecewxo5PGHphFrFM/4HJzKakH5pWNIxZxy5eMtThMCWVkwIDpyhfnXkKWLBBUlcouyqF0v6ftMnDWL7G0uJXDjnylbC7BTccGgKfF3KPAYkuCgMPNoQ2dSUOMgPG/TOMJX/apQaJnfUrcbg2L1aw5SYauFA1/elVGH9b6YXafB+XUMhr45i71jBFVPywWkml200pQhYmrzVLpe5er2rNNtub+iZQdi1ZXs/KlTKCyRPGFliad5emOO29EFMp/bQrjazIlkLowt8OCI/Y08GkGpJaClISIC0DFpi3gyNQZ/k7ML8/TRC4lL0551ImDNaa4vQXluB0t2palFMZtGCpUtWEjLfONWP9EqrIVQuE69npraWp1yUVlRVWxxEE9mfOhFoRWeY9j7SSdFN9o5x26K0BNAvcVegexqxJOT4Onef1G75Hn57c42Pz3n7weK5RAHOJ8GjKa9zIV0Xb5Nzln7jNu2pFzXdC44a18AvDj84N+TaE+HiEj0yHSaBnOCE+GSUFqzm0isphtnuNdF583CaO8pAx/KIZ3KKvBam0m+JbIJRtQyL+p7cnQOlo4fH8b8Een/kh/TDtrIO5QNAJzUQjkMlqRXKKHJ8Q6Cow8Z0ZGYhAS9stTXgviIp2SlVTU8w/esQi1kbISqaVt0wAzlkKQ0E5KB4N1Zgmef9ISKqcImwk6Np5RLiKMbc0d5S3oVTqhqIzo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(56012099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sUNNHwB2Nidmkc/qmAX0JpHCYZhInuE+AKXB2BJqLPlrke3Q4Pget3afexPR?=
 =?us-ascii?Q?oHoOFbldQGY7lYeWY+9s8meRnalk98BscvFQCDAIFp6j13pjZ94YBt65VDQw?=
 =?us-ascii?Q?iY6l0r3gmaQ+7VnAY0mH9PFjGIu2BH4LFO/QL54h5GPriY8x2plj66yXke/G?=
 =?us-ascii?Q?FJ9UsNyZjuW5Xy4RETCBQT6tuZheLeDVNl+7BuNoWba7sNCDsc6ZxC9L/QCK?=
 =?us-ascii?Q?q7BKKWHcSy1wOlunFxX8iNlVnIvJTrDIRT6VpjD2OY2Hd1gjQ7yXqAnZapHc?=
 =?us-ascii?Q?ntxTikQgo1gZvB7y7RHX3iQ8fLvyt6gOkxGsZj7LBTfSHglvCNcVSAJpe68+?=
 =?us-ascii?Q?yJjZ7l7Smd4MjUwD7I6/dKNz8G2XQlBGhLceDNkJc5TucSFxtNlawWy7hZTx?=
 =?us-ascii?Q?BRaj0rdI+u6cii/OrwZp09JZ1zGbp/krGhC12VfnZ599GnObUMbP8nXleDVk?=
 =?us-ascii?Q?55KHdaflRDU4giDAWQCMwgzyQZFhhy2KDjYen0B7yAuUhlI4aEI4qLaAuQK7?=
 =?us-ascii?Q?/Uq/nPY4qDuwveu2hk/6xRbE3whLLbQsdajuUKHaze306uyeDOgA0xFn6CNr?=
 =?us-ascii?Q?UM0q2ws8jA5ntbvuhCJfqGz86klkO0wtJE6CyL9l1zLqWNWy3PpIKMTn3WUy?=
 =?us-ascii?Q?yI4rG2fltb+d0fFAj735ttAcplNdhGEdRF3ydOxori3CHaF+vM+v/fuz55wH?=
 =?us-ascii?Q?b95N4I4x1dVk0eHysXO3f0zUJ8OCa17aew1m9h4f7QTRuYGf5H9Vokj5dPjG?=
 =?us-ascii?Q?itp76LvFpTWhLZMVaMLREMZBxAUmCOMZ8CtZNAG4TJx4SLkKXJtE9f5nCN7S?=
 =?us-ascii?Q?hUoVzo+C2auBCETdiRdAUh8bVglDD+nUYvqrBxIV8srBy2JvlZKWMPBjGtsz?=
 =?us-ascii?Q?THXjUXEFYUm0ndKX5L2gogPFmgZ/2AzspUV+zv1YHVsRi4v2gpyRh7ED5J9s?=
 =?us-ascii?Q?bngaN6/EHz5zOh5Tty6tbegFvociUBCtYXdNh3o6EieDyvhHWbn0R2o0vB3A?=
 =?us-ascii?Q?pvUVkjI+U8N1BZ6nFJaPU86eEP2KxSZvHZRKBmHgzOKzXUMWa/deeDlZD+kD?=
 =?us-ascii?Q?jyA0gbW/FHBctdDkgIprCrIyACZbUWz2mwg8xHN3Avr2iwYgcyg8QzeX0Jh9?=
 =?us-ascii?Q?pa8Mc2SCb56veH+X6X5/RgUjkLNFkny8eDNYEkUOnLOBbrPNyaUzZxmYp6EW?=
 =?us-ascii?Q?/uYcu6344CJ0Mg2UeslJ4cYE1M2D9IV9FYOQTtqpUiAkRX8ywCXWe1s/3X6+?=
 =?us-ascii?Q?/6rH1qEwozEKhSiE6X1uLmfvK7ahtM6a8RIJSLJ4398dA1BXQb6FoWchI//S?=
 =?us-ascii?Q?jLR8gklZ+N9p/T85DdrnTrQhcn2o61glLbpUwa/Jqx6lOshVumdhRqhba8OT?=
 =?us-ascii?Q?eNlJkjShGY1IiNBbmX2toe7BbBXI9ZOKPDgi9QyJEoF4O0Lc4a+C92N/2Lyx?=
 =?us-ascii?Q?aWvgfBAELEZuqJspWPAhvp2TxrBQsYlT7Q9QBUD2cxyANgr6hoVOn9NBkGjX?=
 =?us-ascii?Q?PaQBo4eHpS19340XjKxuBVZ6ufcD/FgUq//ZoEsPQi9PxOBfPW3Rp+YUja/P?=
 =?us-ascii?Q?8uQU/rxIc7GvpPPYFShVLC0tw3oH7lcac8nFz0hWlT/2jxBaX9OgZohkL1V+?=
 =?us-ascii?Q?gaRJBOhpt/AQrsRsEtE33c+8Z8NuZ8oh8FPs/lPpU0gd3Loa3GJf/rH+UNqj?=
 =?us-ascii?Q?uFDF6NJFX/CNYcxGhmoswOp6iciNJwMt3IG28yC0LCjyYv4sVV13HXcO0SfE?=
 =?us-ascii?Q?gvOySZ3OvFt4YUycFpQc7JZUiNqUp3oSdI2FFUEiGGc5jx+Q9voQ?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: feaa0800-589c-41b2-50d7-08de8ec4564f
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 01:25:04.8195
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hWHU79o7Y1l05kpxFIGm800rVTAF0lKXUg3jmGlqwf+IPx6HhEBx7Qj9Trz5n+lYbppjATw41QWW6PX3cnEJeBjq8AEfNXMlBwWQDANgkccr1EE2UQ8mRDhASaEAV18R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14397

snd_soc_unbind_card() calls snd_soc_flush_all_delayed_work() (A),
but it will be called in soc_cleanup_card_resources() (B).
It is duplicated, let's remove it.

(B)	static void soc_cleanup_card_resources(...)
	{
		...
		/* flush delayed work before removing DAIs and DAPM widgets */
(A)'		snd_soc_flush_all_delayed_work(card);
		...
	}

	static void snd_soc_unbind_card(...)
	{
		if (snd_soc_card_is_instantiated(card)) {
			card->instantiated = false;

(A)			snd_soc_flush_all_delayed_work(card);
(B)			soc_cleanup_card_resources(card);
		}
	}

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-core.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 67d9ea319c84a..071cff39e95a7 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2153,8 +2153,6 @@ static void snd_soc_unbind_card(struct snd_soc_card *card)
 {
 	if (snd_soc_card_is_instantiated(card)) {
 		card->instantiated = false;
-		snd_soc_flush_all_delayed_work(card);
-
 		soc_cleanup_card_resources(card);
 	}
 }
-- 
2.43.0

