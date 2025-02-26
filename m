Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011011.outbound.protection.outlook.com [40.107.74.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D408918E37D
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533520; cv=fail; b=g8NR+kwrPt17xxWPgXzM5Ptnfjo8XBR3w9nGoRkBExGXah1ZmmiQ9LPkY4VJ6pEt7g0lG/tGDYHhdQty3XsX5mifmmfNgVV6NosOOYoP1sU+UDVSqDWpe9omHAuAysFW/K5NZXMltGmv09D+MqvAqMJRGX0tClkd8nYDW6Ha4s8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533520; c=relaxed/simple;
	bh=WiaYuPbTbDtjMFKAqg326SMLG6m86mrC199eIt6tizw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=fnuTxgE2RebzX8t16tlE5k92YkOEo0MELYKf+Gfqr8sPaPqWQdoB54VjaU+amuS6I1gdMMjdzE86qce/Jiw2DE1rFQTPuB1xbPdPcW24yr9YTgGyNzy5cV6emkeyDlNNBFf4Zkufx+RHRR62HsOdZmI6lgp2H43af0PvvAI10M0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ICn7LOhS; arc=fail smtp.client-ip=40.107.74.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ICn7LOhS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G6lXRa5/jwOaMTTl5lb/CzBrXZnYS5gWycBceX5nod5RYON+2UdNQ/NXBpaydu8OGmjNeBvTyWITe4ZDeTMl9izRbaEXktrirIWOr+c8qmWXa6pbJZtutX7YgthNFEe9zI1ZiEhP80k34UcmrieXyt7URKQMLHEQu9QewAczXR/07kRoend6yxrldojYOYbBFBrq9An/MvM9KMSsbVIpkxhfgwIn3lUKv9z2jM6yEoCG3Wwn2ZrODHrkDTh3M5sCkrxmf8sVyoBZrS6BFE2oOij3nU9YYKW8WooQdHJ8wFZCpAm7CwmdFom4Srv9UWAVsC3f8EMKT2/s72GBb+f6xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WBDETuGLi5UOksNbVEYngmk2JrW+S1TUVbmvxg98vqI=;
 b=I11kuF3pKFqm3hEbPYh6WWnwjAd0Jb6Fv4T6NwEjG31CXzu/5h27F8XfzIDqauw/agXNeQ4btXnnCbQu5IZE9yG8r0b50DQBR+wMq4SEZH/HAV++RZoyvB91R37v+xty8qqPbHzE9QAsenpAciRAgVooOkxIo1CY2VHsrbaEeiTz8GmX5ljk4X77oGAFJ+kjuhncFAVtFKmWBrZznSsZVgWfLm8en0zvCo4iUJZkGAPFqnGVFmLjzY1DV3KgmHQapCcXIJG8CoKPZ3LLa48sb6uywQgj7SxARs00jk91VE76swUKF6CB2kS3VGqm8oWh2mxMDzWxOlml7Zq6tfbihA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WBDETuGLi5UOksNbVEYngmk2JrW+S1TUVbmvxg98vqI=;
 b=ICn7LOhSsJsME+jLtTivF34AE8/QbuhMVzB4WNN3uO3GKv10gzMkyV44T+7Zaq+p4sOfExEG/GpQ2Gnnxdus8Aj3NMv2ktqUgFpX3sXIoch5VwjNakk+Txr2985abiXk2MJGAL2bPCiAnXNzBKK1K4I04ZOv9Rt+8RhHBKKcFco=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB14997.jpnprd01.prod.outlook.com
 (2603:1096:604:3a9::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Wed, 26 Feb
 2025 01:31:57 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:31:56 +0000
Message-ID: <87a5a9fq43.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 029/157] ASoC: codec: cs42xx8: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:31:56 +0000
X-ClientProxiedBy: TYCP301CA0040.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB14997:EE_
X-MS-Office365-Filtering-Correlation-Id: 700439be-b8de-4363-dd1e-08dd56055b95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1M0uDwDjKV+8uAO1VeYZqf6jVysdakdJNY1AOIkNiz3fNGTjxD1pxdkOE4gM?=
 =?us-ascii?Q?ng0L7DunLFw+N3HTYWj4oZN1288H72YIrZvHOlj3jphxL5mkBqSHnlTLWzZa?=
 =?us-ascii?Q?m1A5T8FsOvNekbcnjH1NBblhG4oFM4AiEM4QAI/111ru9u62oN6+FYLu1YyW?=
 =?us-ascii?Q?nQk1+cLNAykMxIee+yM5XLQuU7kgtZdE0094DUoUzPpy7RPPVhPH/m2BskI+?=
 =?us-ascii?Q?dhWDUXjs8X94AzB23xFGhlYm0FiHX6L9nVIxvEQidWJkMsrLlR0qPp+essSv?=
 =?us-ascii?Q?Q1fY6tT+AeOZNL24R3Qr4YB/ZDKgJvuVV6qAyFELRzCsyIzxixNQt/OW2rxW?=
 =?us-ascii?Q?OXBvjoR68o0nlV9JNI+vaKgtrxrFSY61d5AY03fWamzWlROg6FBeQ4z/Nqql?=
 =?us-ascii?Q?B6y+vOwrY0bkI1kqITsI3mAaduN5SyF5Df7NWJVvYiSQvB7J64POq3CB9EJl?=
 =?us-ascii?Q?xqQjNyOrXTDaAfqm4SXdQQr+hKm5Tm3LfPuP3rPybx6J+2c71Gds1s+auvU5?=
 =?us-ascii?Q?MNfwnwB0HyQjMSXVMgRFxuI1WF7ckEWGdjtvE7sAQMS+7vHdwfTCASRpaNzk?=
 =?us-ascii?Q?IrqCYNFndieopBh1+GnQXeUE2RLqZcc2VQrAfQBrjfeZrVHpylNXbRdzuEik?=
 =?us-ascii?Q?D6Yq4kfj6Pxwav9BNDYIabV7/rigf/VrjxAantfAlFnB5OV9shJZnlkSiN/m?=
 =?us-ascii?Q?UPG0WteWIK/TmbghURdmDmjuKtIJn6ysvpyfANW6bXJZNEwRVC68leZPL1IE?=
 =?us-ascii?Q?kXiQDEj482Cy5tqR0fv0SUKR6+OyVV2ThCnGA2ROSkOUWoBVt9vVaQtrEyJv?=
 =?us-ascii?Q?MrXi+cX67p0+iKh/n0Li0TMLVheIUlY7Y2tFN1Kte/ehCQzOdG9CI+ETB2gR?=
 =?us-ascii?Q?8F5IhhjXUlRDDl7WhmNszi6dsshLUWyGojOfs5bHbqz1vgLIkekVwLIx1gHe?=
 =?us-ascii?Q?XpgzYxjWlqfHNJMrX6H9BmMHU1ZkdH5PM/Z+XVPRUoAPqbg/8IyVT8Btva1O?=
 =?us-ascii?Q?qYEyPf42Nbtp8siyMDUVWdFtme89ted/M+9ekyo9AzBMQPlDYn7tXd6s4WbE?=
 =?us-ascii?Q?VXbk9YSIGs+SfkZb3XZuDLEFrroo/2Cwiadfidad3WIFuGO9cJho3+uiM2j7?=
 =?us-ascii?Q?Szq9FqEZj5ByVHJX2p/bJUInD/DMHzW9J9UsYuSdZYmrRpWS9ID/PY2wXlUj?=
 =?us-ascii?Q?AkjGUOaRTEKC/xEwVe94Bx6KuHGcpXdU5bBuTYpdDpQ8ZClNSA30rpr4yQ+y?=
 =?us-ascii?Q?E81hYeHCuWBk0gPlEhgBGRU1uY25L/2vHutGo1efvyMx8t5xStrL/ZcPs3lq?=
 =?us-ascii?Q?5tZd2FO0LlWtk+qAvId3Sg5hFOPjkQP1OHe3yaT5rMbgh2DdAT0HkrS1wXez?=
 =?us-ascii?Q?c3CUaJISV3GqkJQuguIaf4Acy94IBbwiuEGCsNWmlgPackQFIo3XSoPS8yOw?=
 =?us-ascii?Q?mPt92Gt/MziaUuAcAehWHaB4oQ42M/T+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WGY1uJccU/AlxUFiJ5sYUfNET1CeFfN/SE2FXlTszl1d54fpzB9E7TWSgZPA?=
 =?us-ascii?Q?AAo4ljlmUoBni+Yo4ht0BM7eYFb7l3k7KPL10XiakEnaBgatph8Lq7UPLiD4?=
 =?us-ascii?Q?VbdZxo+RuQ3UPfGbk+eNFo+ovbdEdTAW1rjd2oa28JcEnhcAO+TlB34wi61P?=
 =?us-ascii?Q?8JFKo5MHMa0Krhnrl18pKYBJxsz9ToM1OQGewkal+YrNjuzRs9YZjYhZYnmp?=
 =?us-ascii?Q?l/fuRXtsqBNevk9Vjh3/xelL5xf36AyEhDIe6zkzUpA29JM1Fpr88/bWdUuP?=
 =?us-ascii?Q?lqWfbZqmyXEuMY8yWQQ5BB+x/couL/X1Oqpti4RWf/WI0NtVxVB4y6Bombhx?=
 =?us-ascii?Q?t+K/u8DPSBTxUFBEW0bMVtWjR6E6sgV1ZFfcgf5e/3He3uqKp/rx0AdFEIM7?=
 =?us-ascii?Q?5hOTZWvS/vGmw1gs8Z8f50Mgge6W3th5FPXihhdwI3x2Oqn3pH1uUSCbtkIE?=
 =?us-ascii?Q?MbIk1hLwpVYFVIJIBbrU/3LcX86HHIi/xTLuWzcS3cigazBapAmXDsXKal9g?=
 =?us-ascii?Q?r76QzeCI1HN/cxOvBHIrvDcPQDFZstIva62LDpgrO1tcBwLVh11jlxYsbR/Y?=
 =?us-ascii?Q?lx7/oLYpbobxYXzHHKD9MyQqI1IqqE+4T+ae7F1irSWSLgQFMIXRbCgnKzti?=
 =?us-ascii?Q?FOhlNVtTF3cEYS7QqakrAyJpzg7NtfB8EYbaeVVnxoC2R8AOdK6KBlffmi4U?=
 =?us-ascii?Q?9JtrqlKfekJZBUbZFjzk9VwQxHrD18oTHIbxKcnidAY2KiMd/VW6rjMmhkN5?=
 =?us-ascii?Q?Chh9kKFBL3Y6IDmOaEAdsJUub4ZDxkw0F7qQt3Q4DDQft56c3lJaxlPYtuVd?=
 =?us-ascii?Q?xVjBVRAPV+b/P2lVjhJFtyR5Bppu+OA4VGqg+9F7iY0u4dr/0nVfSDDT2r5u?=
 =?us-ascii?Q?wtwQvqS0y4gabL6JkexjRs4AVeTxoKnwanSebwHEXDAPNMKT1pTV8EtLeaDj?=
 =?us-ascii?Q?83/5itx61FbB4hIGi4pZtPrchZiCczPjrm8GGz28H59psnEfiAOSYh/da6aF?=
 =?us-ascii?Q?/qaizr04dkVQ8n55+r/EcFDIZiqGYTZ70qQBK9aP76HJeybiKVp2JCFY7fQN?=
 =?us-ascii?Q?jLiikmL/E2Jzk2yH0SZ8puAQoMgKOmPXztNprDBD3soJLwT6G+CA/LGoZhw7?=
 =?us-ascii?Q?kEVZBVN/063+y2wGXPU7V+OpU3Xs3BjaR5OUAKsh0xZsPgU/C7LWg6s1pCLF?=
 =?us-ascii?Q?vOHU4jstyTsRbVvcK5Yic/q1tSjiJrXxd3X8acotb3puQxvRNPww6SvpCM1a?=
 =?us-ascii?Q?PwBUMIUH9DzA5vYT0EjybM4SU20kDo9ybYY6vpXYlPl7uwFhhUEn0S2zzA7Z?=
 =?us-ascii?Q?Yc9+iJfC1WRVfvV/c0X4o0eO1ZyPtUFgWSkiOKNQlwwITtaZ1/Xbjbnpn8Ra?=
 =?us-ascii?Q?nZKl8CImcgFlllVVbhnlYMuLcJi4ZFUnYlI7LI/U27EAyekwgepXqqYzACDu?=
 =?us-ascii?Q?B0a6E3hBmyfua+QvSRDsAvAl8ZKJFybMKZ4wdjIjQKPKQuxAZ0O6QrqChDjp?=
 =?us-ascii?Q?AWR/wkvsYWc34JC2P0TqL6DfKHTdA1kbMajANMY3uy28kSl2pDbBpmJq8t/k?=
 =?us-ascii?Q?3VAWx1eBlzscrlYGBAwwNQrQdbjTr65n1rrXqRdz4kB5WavEsvk33Fp7LW4q?=
 =?us-ascii?Q?RkbzfVSg597QcWvxl7C23ng=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 700439be-b8de-4363-dd1e-08dd56055b95
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:31:56.8944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VU3aQPFH7WlBJIlmtBW3SLfp0ZPYUqeU9fVsaSgF4irj2K6AtF1eIwBNHdNfmSvKVo0H9e1rJ6yQvgMCNE7NKuhyOtK36WljBeW5LIg7TckQEOkHdaBsfMRFuk5mi3/+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14997

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/cs42xx8.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs42xx8.c b/sound/soc/codecs/cs42xx8.c
index 9c44b6283b8f..8887db653dbf 100644
--- a/sound/soc/codecs/cs42xx8.c
+++ b/sound/soc/codecs/cs42xx8.c
@@ -242,10 +242,10 @@ static int cs42xx8_set_dai_fmt(struct snd_soc_dai *codec_dai,
 
 	/* Set master/slave audio interface */
 	switch (format & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		cs42xx8->slave_mode = true;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		cs42xx8->slave_mode = false;
 		break;
 	default:
-- 
2.43.0

