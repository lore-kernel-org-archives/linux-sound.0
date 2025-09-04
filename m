Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010045.outbound.protection.outlook.com [52.101.228.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7DBA1CBEB9
	for <linux-sound@vger.kernel.org>; Thu,  4 Sep 2025 05:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756963289; cv=fail; b=CsTEKfShr7YSTfO5wEgGuRroyZY3dq19G+zc6qpjDAHwB1FeetSNmF1jdk1ZoPMPZV0MPFi6NOrbkACraQExl2mR7LufkkcqHWQhaR6rnhylbMfy1mG5y2mUDSDPuWlcx/HPa8/INMcoFQbB9WRqbUuozlL+eABTk3ic17Aw2o0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756963289; c=relaxed/simple;
	bh=+9dPN0ODbYoUwtiQoa+npkoHs6XSyzXtQnJLoZ9W0HM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=uy6x06U4pp9E1ojw991yZhgtWk51tVzIpsXx9gwMCowZhtHE4k485xwb/ksSgLCdY2SfRnaBjtbA1CsV9pgKxBg3LHvDlpGu4/bPbp+vQ7Svir2Ht+5OicPJXCBTBrmnXEMaFG86hcijNCxriw586uBX92jQXraMwwfl+q7gE6Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=nWJrWCIv; arc=fail smtp.client-ip=52.101.228.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="nWJrWCIv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UQC0Zdk5bV32Mv2F2AjmmcUzN10g26Aql0nKfgM1PaPUEU1xL9TuG6id8be5MFU4YMR75pFTEVmgvlh3nXkW0yGzkazFhmTBmbjMDDrQKhTbSDO1iR8UXrabTj7Fd4693uPI3F3eu9JQys+1G0R7qYt6xtXR2hSS3p09eQO2tY2ap9ntNfE7N8qj3G4wTE2uFkB1H9Vw1se02wRKsnbNFWrPWiHYb6Guti3BVdjFx/eUi90EEAj6/5Xh4hX1Ojw6ZLf8LAy2Ms9iWK9/y3Z1uAYCrV3/GlW9y5ICjf6knsC3xdlqQb4pL+e2wG0zbAyfh5WhEbhiqvp6NXaE/RK7PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=05giWQiZxIDqchSjEw1KNF/idurazyW1QuoU0h8mddY=;
 b=qFTABhaUWJa6lHSXEL76pGnOlcexUW+t45Lm4d0GP3SEtEXcswRXVJ9tL7z7PfYhQ0HIDnRHKv1AYkwCdeSB4HTqW8QElgs5MEeQ/XrX2LvaWz3Di2ohcVZ2VlojTom523zJj8r/ATGMXFBO0VmtgRKgcR64dNbOZRTaexY5aeO0p8n6vc6pThpDWNs9U/8/1BtFwEoJieA54RsQc4OJbaZTiGh4y3axjnDNMdeT77jDL0GAYz3GTccnaNjNL4UdkG6EfFraZr7OOUUZA4wlYA+m0Eg3kFzCwQ9o+DbyHbkNEyZlGBw8/BZmYitYfjMkleJShQfkYP3+oSNLpRhl6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=05giWQiZxIDqchSjEw1KNF/idurazyW1QuoU0h8mddY=;
 b=nWJrWCIv3/ahldZ2mCe1HXUysDfIHs91gTdsRmQUXamWc3522ZI9o+89YSCfSz7WK1+2iC+llHdL5BjSey+W9RgJl1ZgV037g8+j0BXcyScN9VOhgvfyrmKJSz3y4MeVVpyIkEPqu394mSV3R73LJoOjIx3a/GPuB4RLp2y2DCQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB15650.jpnprd01.prod.outlook.com
 (2603:1096:405:288::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Thu, 4 Sep
 2025 05:21:25 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.9094.016; Thu, 4 Sep 2025
 05:21:25 +0000
Message-ID: <877byex06i.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 05/10] ASoC: soc-card: add snd_soc_card_to_dapm()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87ecsmx07m.wl-kuninori.morimoto.gx@renesas.com>
References: <87ecsmx07m.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 4 Sep 2025 05:21:25 +0000
X-ClientProxiedBy: TYCP286CA0113.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB15650:EE_
X-MS-Office365-Filtering-Correlation-Id: 67c99870-9a79-4627-d788-08ddeb72e4f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pExeRIuNYjPgwb52mQqxWARyw7/2KFDPxRYAuIuMHk87pVLt59c88PMn3ELv?=
 =?us-ascii?Q?eYmX0VuRkxEfIKR8WOWjPf1ZwOPlGOZSe4KXUwRGSCtK/CLSWEuAitGm7ji4?=
 =?us-ascii?Q?So9iaqlZJWsY6zzE3Hl4TjdGfCHH27e5OXy6+Wk5HEzRrE6zoYGo3bJcRrYd?=
 =?us-ascii?Q?6boSieCgs19lblLmnoyz89L8AKrsGzg8aoMfSyQnsJg06pePh46uDj+2s+6+?=
 =?us-ascii?Q?O3MxDsWdtWB9eq5t88hhIhdlwUfGaWd29m658wMjbOIjU3G1gQscrdOcG1Cq?=
 =?us-ascii?Q?lxv01iOPTsfWnLL3qbn2rRIQJn59cgyWSzEc0kPZ1PTIP+nre7rGdSXQ5UF3?=
 =?us-ascii?Q?L7Iozm/3hYX1lRfYUBR7KAeOwvDV77SxcDB5hIwaaQnlFvS6uBjHP3hO+XHd?=
 =?us-ascii?Q?elTq82dgZekB0FEx0i6wlkXCvMO1RUVaeKoVsVS18JEo4w4WYWDJ1oaLButm?=
 =?us-ascii?Q?8mLwRFPahAPgEhgHirHVEmo5oZxT2yK1f6lmbjAE6IVopqSWbP+sB929NX6i?=
 =?us-ascii?Q?n6n/RXdMI1Age3UP0hsPcYLPFCMSxFLuco9ZF7jEgqc/lZCmGdL1dQxR4OC3?=
 =?us-ascii?Q?448xJsdfJ6L/QN5jbNh5dSdVFnKdkShjFzXGbI2gGI5c1JhYXse6hMTz640C?=
 =?us-ascii?Q?dzcgjNDduyAPmINNTwkbMh0UPh0MIjjsdXmkUkaXJQ8Byel1XjzS9dLSBzum?=
 =?us-ascii?Q?MzdM614NwQ6BUzJ3sMcNJeLCiT5A6jJtRF7XWEHPGJHq4Iq9ehv7O2Kh0bX/?=
 =?us-ascii?Q?yFGaVsDrkOVfmPMj2HQgUhI2rBwlUgVbu3hPfV5qdrUejFXVBh1ogixsNkRV?=
 =?us-ascii?Q?X5YwOUezYbpa7tysZ6COHgfuY0W8CpPf8/3rJtXzj9/oVJQG5mwq+ynR/7mc?=
 =?us-ascii?Q?ZvkkdXtzvKd8D4Rm1x37NsuqiCmsIMJ9hdIVO5FfJ6vkJESII5YDp8t+67re?=
 =?us-ascii?Q?2oUtR7MOS4bc8a5AF+RCnlLBdW+XB4xIEDJeYqxU6abGFpwsjPzb2e6EtKah?=
 =?us-ascii?Q?FTctvu7oLBVUi3EtsPPibgYK7B7+Sj7JYYjPZ7n3H4FUasb4FenSF2pHn1Wk?=
 =?us-ascii?Q?2eKXWWHPTZvH2XSZfApedHlvzrhQck0Ah7kqP/EFkVVcgyfiP8tw/lEdv0s+?=
 =?us-ascii?Q?wZZQBa3/KmVTDiB7P1fV2UF5QErraaZ42NxVcICuOrVCzNLC6N96RY/KZDOs?=
 =?us-ascii?Q?wz3SSU3+t/ZHLEI45WvfhBt/aB+n4ixAlyRAAJ76R9KHNT4WD21xCl9Wdl2v?=
 =?us-ascii?Q?AuUEWJ0DIZJB82R9TTJbk4SoeOqoDLmZlf0yCV7DXOGnNnYu1G4o5pHv184J?=
 =?us-ascii?Q?rsfBUIFoi8PmpKB38VICF5ZsblC/sTNZjt8gUbJf+UJYdLr4X80/XarrBt6d?=
 =?us-ascii?Q?NkntGmRmjjHai1P/kaZt8ler9G3uVksD4Zm2eQ65AKHTTe9v4ZV26+3Q4gdR?=
 =?us-ascii?Q?e/eYIaEd414SonMqFQLp7+lZ1dcImY8y0ltWvpoKUFvNDDrCNtSbEA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uNtiCc2TsXAKs6bAys1gJmGKxJwH16y2mREx36BGGEW25KwCJ+oBCbrTw7u+?=
 =?us-ascii?Q?nsMgGI4jli75Pt6IDU17bWKVG6EnQD17ut+lnWIJA5s8ePSwjUFD6zj3WrDt?=
 =?us-ascii?Q?1mEWNNZs1S7swiryl6CNKDGL1pavcnQ6c6Exz1sI0tWfrbIaIcD0XbIec45K?=
 =?us-ascii?Q?/YhEpbd47DP8x4oQKlCq4DCas0LRNvoZth9Z5i4Rbdua+0yHm7C5VZUuC9/d?=
 =?us-ascii?Q?cEOOQUBmf98fWLJF/0HsTme6A0Fappl2UfTgkfmkdZ8QNJ18y9FOEvzTd5v9?=
 =?us-ascii?Q?/JHQ4TVQOLSOQ4gtRYYcnLTTSxPD96T2rWGtWHeXTo1+oaIim2/FL76NxaJf?=
 =?us-ascii?Q?IUb9exl5hA8ddYoHqz+R3LRUZQI8h+Eb38C6D+3lgaC2tCBQ1j4cphMg2Ydu?=
 =?us-ascii?Q?K6Ocy1VCrfL/65BvV+S5diETWz7tJHf9XeUaKIGLiKKheInCFYWSYoZJ7kks?=
 =?us-ascii?Q?HvDuDuJBWcbYKl0RjaSlo4QZf7xh+zdHRr7XJsJkOq6JgH1dfc+uMrw0yrXF?=
 =?us-ascii?Q?8Fwkec8OoN1WeYoCjFlq0V8IiNaciFAeHXp06L4XVEfqmXakIb26k3RV/nGx?=
 =?us-ascii?Q?9n3dcAlb/Wp06/67Stzs/FNzAXn4Y57Bcu3VrdJWlPzJYOMWByRO/BgJPm3q?=
 =?us-ascii?Q?MiH4+PoIf1xFsfPH6sNHHEQ5vO2306y6JTs2TwK4zXFTqu41selZOgOEw7Fy?=
 =?us-ascii?Q?JwPCeBmCqQrIWNfgNBQxUAJkIFqgjO4IMa0fvofzEOUK7/Xmcn5+daYua24P?=
 =?us-ascii?Q?YidZxlAFwupVIDeVbAzpf9EZgUA1PFGWI7RbHKFgnPilrI76t4qARrJ/ZyxB?=
 =?us-ascii?Q?mYnpXi9Kf5jAWjyWtooXj8NM8AR3iPdu+cKP8WUuelfU7UkeIBifCLGWiwYa?=
 =?us-ascii?Q?IaSVi00pDkURiGeh4E5Cdfhhxwb7vHCbNsVnugauyS2Sxelp8v88VG/fswFH?=
 =?us-ascii?Q?rWFEqeRgv+jTVSZLlJGmuCjBnW+CDfTrchlXec90wdmhdxEjZwLd+xBzGaL+?=
 =?us-ascii?Q?eFRqZUGjC5V3Qcyn2p1Dn4cDQT3htw2nZ1nZ7Kn6H84ioXQl7Hi5ZY78asTP?=
 =?us-ascii?Q?hglkstip3btNseopzGEnFDmm9lixMIPJDtNHi7IF/EbB/orE2rQ93NSHqiJ7?=
 =?us-ascii?Q?fioKeAYavn/sV9kkMTCDlU2ry1y5p/djghVkdbqqMYqboqTSPW3AcmRjudJv?=
 =?us-ascii?Q?SozeNlSwt6JRqZcUQDspOO7g1DhT5kCgmUjQvVRCiZss+jIeOmnMQ39Ch3f6?=
 =?us-ascii?Q?VadLPu+4jsPDCxZmPFj7JG4FDDfT5ohTiBWPOg2op2Hw23tog/l8hVRbN1Ks?=
 =?us-ascii?Q?p3cTIw44y5BvHr62O435+creamsFYwtXwWFM8rCYf+fiRqyEbUr5Qonl79/C?=
 =?us-ascii?Q?Y/ePMOqCWbMWaObiwg4sO/UcERDHA5pI4Ij7Eq2olWBnBKhIL2H9IRxPB5h/?=
 =?us-ascii?Q?6nle+6zhHQcWhhZCD9aFMymQyihqEuJi3iWd72dSTf3s49hs8svwOovgTWDW?=
 =?us-ascii?Q?reGZIVUch3z2WWCEcowmAz8anipe6Z2wd63WQYxfS+0zHKOod3ZkX6ec3eqF?=
 =?us-ascii?Q?9AG4QlnNl8thbeoIXQoLlNy9DfijHEvnggJ/xux7FNmVRFlrmRAwQMEy6r0s?=
 =?us-ascii?Q?5hH6yFt1Lv/aZc0Q4lYxiPY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67c99870-9a79-4627-d788-08ddeb72e4f6
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 05:21:25.8140
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iYeKy6USLtaaNxhFnWY60Qc9g0raKTwX96l++nF3vK8D0Ply4OkectrUJenOlcj9AlSSKgyK8ON1+k5k4ydkQB7nn4nyuDARAylV30uQiy4qw18qJawPJ0gCBsNZVhFJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15650

Because struct snd_soc_dapm_context is soc-dapm framework specific, user
driver don't need to access its member directly, we would like to hide
them. struct snd_soc_dapm_context will be removed from header in the
future.

Current dapm of card/component are using "instance", but it will be
"pointer" if snd_soc_dapm_context was removed from header.

snd_soc_card_to_dapm() is needed to switch to the new style while
maintaining compatibility

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 1fffef311c413..ddc508ff7b9be 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1120,6 +1120,11 @@ static inline int snd_soc_card_is_instantiated(struct snd_soc_card *card)
 	return card && card->instantiated;
 }
 
+static inline struct snd_soc_dapm_context *snd_soc_card_to_dapm(struct snd_soc_card *card)
+{
+	return &card->dapm;
+}
+
 /* SoC machine DAI configuration, glues a codec and cpu DAI together */
 struct snd_soc_pcm_runtime {
 	struct device *dev;
-- 
2.43.0

