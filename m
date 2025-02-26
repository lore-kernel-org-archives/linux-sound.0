Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011001.outbound.protection.outlook.com [52.101.125.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A97018DB25
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533508; cv=fail; b=Rvldp/KK8jrMuYERUb0zYXBRZAhnP7oAEnOYj1gZpvDk9h9PsfcwtY+D9/xwKIpSeoQq9CH1+bCb9dCk0xNBg6N6uDqnqreizojPLzEtStIUgZ8638fKlRW2boS17B+9bM13mbKCB8EtWCRHbqg5+TR7JTPZKTHsvXQ4rVA35vA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533508; c=relaxed/simple;
	bh=0varljb3e1a3ey3e7/iINB+qm3k/HCxRk/YrUowKn0U=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=LjsmVn3qyJUY53Nn+RBBANNsRkNJw+JvJFrjT7NznvqNd2MbEg0VL2WN0fgPDnc31ev4w2TyWbufLPI1DToTQeJ9TinJyOGJoVMzQTLzJSO7wzgucwI4JBFj3jrX4ygo8oBBd+TMX9Rg5XhaPvBzQ8WGw8cdlEK9h2VsQNtQ1+I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=GnroXoNO; arc=fail smtp.client-ip=52.101.125.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="GnroXoNO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IVu8vBLuFWGqWt+vHR4+G4FmpL6/nOc0MhIaL35JCBwwEjsXy3pk5y3cRf4hHScvRIiEXT754mJ36j+2p8xvOvH9SBJk4RxZvL/X2YWub4b/mm+a8Sa437Cn11vEHqRrhtAq5et3watwlLRMl4W+8QzQbefUznnBvWNKcxF/8cfdk7imISC/MdnqM5DoQuyXs4p4IHshBMccw63Oy/ngZSjATdA3fFUr22uWQrpFsOIiWJ3wIfVPsUKKgG3Dm35DQ/u65SN5TDsCHjL9SfQjUuw0n8eemBto+lLPV49MTbtussRGFqG89Z7R6hh7CimdYszrkBGf8HqnniHqUF1sCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CaqlfJolLiwUkd84T8TFMOBqA9NRtRbV4HDB2jw9qRg=;
 b=y2oIozljpzb977g9NoOLS/xAliDs2TQ/05XKjaI9WFtWePdYr4vNcqcoQ19faniEw7mNetOsU/YCzoESBijMcS+qRGjRYiUWvhX8Hw8D5mrkYqdGn8eU+fVnSV7ML1cWjCyYUJcjSpGj/J+/HovNwrTMd5QI+A0BFIA5MYAgLD0dAp2v2oXg5+fJj+aLTt8AwP2JffacwRJAUo0O7wFgxXV32GbKOqWFuqdQYq/8UGjrBW544Lor83/sS1aYeRPODedkoGZqAUiqWexeJkMAkZFuUt8+AvvKI8HflPZr5ChCt7Ylrq6TNGjGbMIxh4gt9pRKkR3w/Sy6oIHpCzqp0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CaqlfJolLiwUkd84T8TFMOBqA9NRtRbV4HDB2jw9qRg=;
 b=GnroXoNOHjktVv315ziohiZ1m7yqSwfx1hOIgXHu35v4UPVaUPkpV+s7QNOeEqSgEH8oknfhZet+HvYz7Jg0DOIrIXeiKjWcgCSclQwUCRv+AnOdWbbmwUJoVKzRRofPqRmbJrxzEzP5oPN2YkPJxo+He7Nmsj6zqrGz4jPVkQM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB14997.jpnprd01.prod.outlook.com
 (2603:1096:604:3a9::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Wed, 26 Feb
 2025 01:31:45 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:31:44 +0000
Message-ID: <87eczlfq4f.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 026/157] ASoC: codec: cs42l52: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:31:44 +0000
X-ClientProxiedBy: TYWPR01CA0005.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB14997:EE_
X-MS-Office365-Filtering-Correlation-Id: 09527b35-ddf5-4d6e-567c-08dd56055446
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ofXHatUrBfxutwmlnS32scEcxlxpLs4fI6sBHKonXc0k2p7P/1LXATiXdEQ1?=
 =?us-ascii?Q?mpE4+ch9DSVvTyvuQ6OMv9ifUsVbrb5w7Zm0L1/1xOHBVje6Relv2nvOKsaF?=
 =?us-ascii?Q?3scgO+KXSD2fg9SAC3Iw2WNljUTDlhaDoSVLL14XtHVA8QC+LH6RACu6zIxg?=
 =?us-ascii?Q?I4GaNObn68hirvTXlkE4CA3NJFKkGKEe/RFuSIug+llpghDEOiQdHbxV7LTq?=
 =?us-ascii?Q?B+cU/bq1JW1nKWK8PofMBN9COUXvr9S7kvRDZCvJ8CbGOzdzqHH5aUNsRmh4?=
 =?us-ascii?Q?dl7296qwYZaVkxBxIJ+slP+YyM0MJSOyIyq6pGk87Sf0cbjvZ2cO1mzGc/JP?=
 =?us-ascii?Q?K84Hz6mVy4NnH5bRDfdkUhnDfSdYJuV2rKHp1JnU8GwN5HXmiOvf5iY+Y4iM?=
 =?us-ascii?Q?NuZwCoWJbtnAIR7VrCY4xYDO5TQEHPtyZoTWi+IDZWB/ifBhxjTVAyIzASb0?=
 =?us-ascii?Q?bIP8EZIipP2W3AS95DJspXvC6PvQDhtkeg39S+9rnZg0BEi6MqXuUa/O4/23?=
 =?us-ascii?Q?J7Ppman74a9Xy/Wbv808UI9K2bYeOxhnR8Ir+h893/CbkfkXmRVzWvrjyO24?=
 =?us-ascii?Q?7pCt/cr2lHwbHUgb0uur0S3YcS9yqWMb4HZTIRGq0TVScvL3doq3FiNQyTn+?=
 =?us-ascii?Q?eObM37jgzGTPk7h9u6EyDsdncibOuNzBra/1Bo8JQTDsqAEyfED7jClOkoRW?=
 =?us-ascii?Q?ILdkflfXm2OADP4MBVPi6T9cq7JvjpNFmj0ISdlWOWZ95tJAFmcKOTP5Rd5n?=
 =?us-ascii?Q?ny230ae3IwebKSFGuvOUqZ3Ne/YJFGOH8qWgUMCvERapFGvsMm6/E9XkmNvv?=
 =?us-ascii?Q?XF0ThHeGNJ1LfwSwMW/q+VClMmSKeedmxKqOAYjA7zmC/Z0cN/XcPKOO3W35?=
 =?us-ascii?Q?mFNgj51HBsVAqyNjxbVuRBm/Kw/YMR6jeQL2jUbFNhaiO3Q1Jb0r8heYCUIb?=
 =?us-ascii?Q?D+TEuKKH1QhFGImW6EJ4fhdJObpNsBi21JiCpWiCINdzI2hejKwC/bOLVGoM?=
 =?us-ascii?Q?RaFFQnaSGatTzEGB832M44jMNzDm8N46C+dWm7NJMGyJQhcGzef32rimEZvC?=
 =?us-ascii?Q?/Vt7TvyEu6zln2cf6keWqNlB1gOWFg8aaxhljI1Hdx2I2dujJ+nNj5J/Iqx7?=
 =?us-ascii?Q?aS6Qw8x/beSo+/bNvy5+GLYNBZ9FiePZxDBwnbRxh3yfKxY0eX8UpNtgaW2P?=
 =?us-ascii?Q?v70GffmOTysmkh8D4O7wkaC72P4IYLMLA3t/HyHSTXswsm4E70g89b0xi5zD?=
 =?us-ascii?Q?5LxTwSpoWm4nNg3NKn4TGIqKlLsnylKHJlpKOTA3+Qs/QZgrZN/lmIsttFro?=
 =?us-ascii?Q?JVZhFsTWg6TcDsp+j4s5PBky3dlxr06ny7z69MTCxJa4PsKhBSMoW211A55U?=
 =?us-ascii?Q?zyuzKiaUYftilvZANgWGyMuBKLQFg0TyTVb+45nf3pewNX1lO2CGPm9jTYZL?=
 =?us-ascii?Q?OtPA6QEQwmRS6WNSnRYyvFedaq1L49q6?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HXPwwJCN5Tlvo3qdAB1gSqSaRjhzxT76f/vypZlzgIXsOmhm09YbO0bpURXE?=
 =?us-ascii?Q?6F1bNCMT3tzsUzn2pX+N9vRibNiHE3wDEhSJTMzUDqZJYrnHlzzB/6/GbDtz?=
 =?us-ascii?Q?tveNYn+C7Vq/qE4/1jTJCoP25ePizgspwX7J49hUE29bWYyYKYtNKvcls9Fb?=
 =?us-ascii?Q?08WjB3i5Dtcov058o3KKe3u0GsJIg9DG0TjSa0BX6ELguAE68m96oK+T4oMq?=
 =?us-ascii?Q?cW7zSK0ED/aPM5O342UhJQmt3hRh8QcjH53qklmvTNl4he7qax8k6ggovzY+?=
 =?us-ascii?Q?rOhighIX8VBW1AU4xKxqnvMhQBlajkXgdD/l0IEdpPnUH9qU3NzNW5D0v8gG?=
 =?us-ascii?Q?eEDQp2pOG5ZXE5kwJXHsPYcxxl9MaHwlIuenTPeSpPhqEBDMplfczmwZIy4B?=
 =?us-ascii?Q?agG7qp24FYaINXjYTYspi8Y/iPDBhRCBZ7ILWtjYGrVuOZw4+WIAbimngyY4?=
 =?us-ascii?Q?PPvAF/mdEST6qNVY2t0YBih4qnv3BgOBXDP6d0U5QUc/nZ0Oq6dY9EAmzIP/?=
 =?us-ascii?Q?hg+l2R7u2bKSCtvWz48q3kkWiaRx8wod7n2gkxyAS5w9Cw2LkkUmIOJhTD53?=
 =?us-ascii?Q?1JWNwUddjXqhS9vNco5HztXBfbjVc/fp7qBNAgaKd2c3sqwQdAwsD3etLvF2?=
 =?us-ascii?Q?9BLi44piSQGUwP6GUv+27sEofAuc8I/UhdYtHHVf/OZyY6PL0Ph2HxWN0cfG?=
 =?us-ascii?Q?Q4x7lICIStkSr3CpHUHDphT1P+EJ9B080i+TLxGFJ9h+3TQPCIt45LAYchIF?=
 =?us-ascii?Q?UOpml7mOtpP88o20YQ0ECrPR+aU346qHdN6PsEo5/XH1TCSDFWdMkz3dUpJ9?=
 =?us-ascii?Q?TjUsZKmeHpMrFAJ83HenOOTGJ5n+Uut3EfY5s9yMFNLKGmL7aJnuXcqK5u2B?=
 =?us-ascii?Q?5CL93ky9iLv+1ZKHPAVBP8aqyRwPwxQcFM1QS8P8z46TS+dFJrpMFE6jgFFS?=
 =?us-ascii?Q?vcmNIWLbgX4zlq0PX8JvnGYQt8Yssq+nIXWnWCj8BuyLGiQNQIT6z50F8Hvd?=
 =?us-ascii?Q?FAehdOOK4tR/1SwaFq1KMzVIw8jyVIBasuCAbkHB62XedFliLeSNB7vqJ0hD?=
 =?us-ascii?Q?bPF0DE5qee8qSH9jRjbKTwmWQ4xYLh3Y4gtxXROkiSj4oL9jcg2x9veMynsO?=
 =?us-ascii?Q?CocYTUIH5ODL5AGSJJL+Wkvyfxjs3xeXbVAIU+ezuh1ef0EL6nRU4KFvnG6n?=
 =?us-ascii?Q?7WvNSCJom4cYhCmQdXXILiZ9d+Yz/GVNLj8/0TJPV+T1BNPOQN0KbTn3gpjl?=
 =?us-ascii?Q?wsF4PNjzh76pG2+os6Hv0maRD7LpykWzxh5e1hTTE7OFBQoJhPvahQuhp3WV?=
 =?us-ascii?Q?PuE61/vVCrwKh4ekN39qNAzBOLQUbBnQnp/oe88QGql50z/dzon7hvRVSmWN?=
 =?us-ascii?Q?bVsNiL6dhZF7eJgcQ/kBlVbE98Ayx1tE9ikIdtVpg2gD8Rn8e2RU0Z1y2yWW?=
 =?us-ascii?Q?9KueFJM3LFI5/q40LAvFkuCZBRH2MAVXB+tyCCO2NDKf9eKhT3899NJw1mhn?=
 =?us-ascii?Q?ne9Eykk2wbGdz0PKJsd1ozRs8QWX23GIierwESuEhFS5DyW87OLyUCNN6uNB?=
 =?us-ascii?Q?rlOkOLh50K2MsVttMI97FoQ6KlRMtsMH6MLdZW9GShFC0Br0iH6/wWEm5LjB?=
 =?us-ascii?Q?msWLnQguKxSBvScXfer1yes=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09527b35-ddf5-4d6e-567c-08dd56055446
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:31:44.6216
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jsJBcNQaOic86sAD5akEnW/IavYZ7Q7ytj04mLNDD1+o0UcsCbMEhTuPqv7nahwsawNG4bekOkEHSTA/7q0cEEAacrQBiP8FfR9nkYNC4qR34WCuvkpyMZq9BXroPG39
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14997

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/cs42l52.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs42l52.c b/sound/soc/codecs/cs42l52.c
index 7128d4c62f50..cd3f92c19045 100644
--- a/sound/soc/codecs/cs42l52.c
+++ b/sound/soc/codecs/cs42l52.c
@@ -733,10 +733,10 @@ static int cs42l52_set_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
 	u8 iface = 0;
 
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		iface = CS42L52_IFACE_CTL1_MASTER;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		iface = CS42L52_IFACE_CTL1_SLAVE;
 		break;
 	default:
-- 
2.43.0

