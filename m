Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011023.outbound.protection.outlook.com [40.107.74.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA119183CBB
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533456; cv=fail; b=r9ORVuGKEtPS44xBoasWlH26Vc2P08IIWschBKYFEk8YHLINKLjIMCHjc0fA4F9AqPbC4ZhMfccwSvGKU/GOBuU8QarPvaOdKZ2etUCTb24ze6VqnT54ABFRLjyXQKXwb/Z0qjgUzhV8ZpNCUG4cUrX/dM71WH/UPcRHVAG7ufs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533456; c=relaxed/simple;
	bh=ZqFPFli2sfITGLYPZjR42Ek4461ThEjpafSqn7qwaHw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=cUP1nySBMgaxKyBTea3DiVcDlwCST27jJVNH9AvjwwA68yQ7I/zW+YsdbKhfecG1jTuJCCwcwtlGnjc7Ky5TL78r+0JIUIgxoe1y4gde5ZR+KnAixkHFE4WIGXHTajoU28qHCMyue49GnVBM7jtAGWn1a84uxk9RYyzYVy9BBX8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ZFFDmxiT; arc=fail smtp.client-ip=40.107.74.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ZFFDmxiT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tkN0EXH9QomQEuMpi74+xzoJUG8Kvu5nSz6eNix2GhPEYwmISxFi7yQvZuS8WoVEAmV9Y8LuEOAqxs/uzwRCib7cFRyljBZ7Fyru7qp6epsg0wurKSVBbDvNvgkRNYFU61uAXwQXp43M+BCD0AnTkcykzwDjbE1wlC+kPbH4MAoxURpxyi7c5fjkcV70X35Xskf5VIt8MesOHuJAQeWpgSkg9kRhoBzmuao5ApF9J2kMrAHUWNiqa9zF6eIZBK6TKEKdLfjZpe5bhupcos2ODsonJg7Iqbox0FuSEh7LliPvSJotTv2ciIJt1ZFSg5I9qJsWwlbLsddc1eKR6Zzv4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t2cCs9g83sHLHGmvRv3lIrEuq7pfH0vyXlzqJJWTK80=;
 b=TDqJgdDMv2EcV0V/7YWahlNWj2u2wBITHKtVCJF4VqNptkbERG4IAayXwKYA3KFUiCSG7c02nla4IY+9OgcooP8Mfbq1YJHItS5a7KEl/gCdbwrcMV7GNmmiY1i8KpuaKWdB9ksmMXkmqhDe7VQguK8p4ZLohK+rSCtTQf9GSmAJLyIHWYzSwrUfweahkhx3FdKAdl3P4fKIatMTqCcCMT9ikyN/J03jz/2qo97I7NYivnNLPRrI0Ze/cMmkKJYNficCnJ1oD2Z67WadwFwH4X8hdDt0ewKqoeaTZ6jhMqGdfjLrbs1uVQJsA2T8AabOgwNnIxgGv63nfLc1E6Q1iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t2cCs9g83sHLHGmvRv3lIrEuq7pfH0vyXlzqJJWTK80=;
 b=ZFFDmxiT20PwA5kOBrEp1vI0tTgzq8otY8ff07OUcrCgy+XIY06BSq5fNAy9W6pHE+E9/Il/uk+o90BICaCIGwQwrQaUeJ/Ln3WVZ813SeVs+TiSrHAN9g1VSPwtotfWFyxmCRNSsHtcZawiDSTvx6iIVIp5Ioust3Pdp+nlm5M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY7PR01MB14457.jpnprd01.prod.outlook.com
 (2603:1096:405:240::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Wed, 26 Feb
 2025 01:30:53 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:30:53 +0000
Message-ID: <87v7sxfq5v.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 014/157] ASoC: qcom: sc7280: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:30:53 +0000
X-ClientProxiedBy: TYCP301CA0064.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY7PR01MB14457:EE_
X-MS-Office365-Filtering-Correlation-Id: 718260bc-c34b-469e-854e-08dd5605359a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oi8NK/44oFcqGP8B5EawWknde94DkNSqB54UavgliluUSCAAC7cnLzar0Id+?=
 =?us-ascii?Q?i1leb14ZkZ/PbLUX/CegKDXr63s7uEx+V2ODKMohj2wREqDL5kUtY0HtPLZV?=
 =?us-ascii?Q?Slc05oO7kmN48G9V3n+cdt0GYQ4ofhT8YATZhUJ2smskNIkexQiOKrKNRjMs?=
 =?us-ascii?Q?rx9nEFbxmySXEUI6qEWMvTEUwhfLCGjIZ0c/0x5e99X51S1rbpweoWw4T9Z5?=
 =?us-ascii?Q?EQyIFyRgK8VXXNkdsuWvB4OhCWN378g7mgf65E3ypkzl8UYPjBeNPWqJTFO/?=
 =?us-ascii?Q?e67BMho/UOxJQtfTwkuN1JyiDv0KA1oW07ZiYDYNiSdp+H6K4UJsghhOAROA?=
 =?us-ascii?Q?keZ3VegcZcxSMsD4tNIhW2QBT9muDMK38Q9UJyK/+ejZpEpMBZV0DOe/7BUt?=
 =?us-ascii?Q?duS3zja3qhhDH3lrsYkVahNSXddAbTlKyV2y9ffDXqX5oWDc04WR/SdGRnDc?=
 =?us-ascii?Q?8Gisd0b1bn93/sfAVCv++IaVZFwHp1l/tmr4vBjJfEoV4kBmXCSTYERbLf9d?=
 =?us-ascii?Q?0H1XKnL1oxHPbEvWhk3bc8vkGFEue1lg9NOUbW+9bosefgj3c3G+c/sKw6dq?=
 =?us-ascii?Q?B+fpfx2UI+gW5akKko8RWLc4B7zrQMjw1xX4Yk4Dnk65Iy+ovVDZ2Bb3I9qm?=
 =?us-ascii?Q?AatyQJGzkr8K9CnlDwbndTdmQQTkIcMCD4ponoQf4ZhUpaCCt5C9Vn9XfefO?=
 =?us-ascii?Q?P2k6h0o3r3Cx/KV1tHYU44Xllavg/k8v/vad17EGgih3K8Ba87OTx+mcDa3y?=
 =?us-ascii?Q?+W4J4FiM8QMfDxBhTLO+rTv1AC05XyzuQ6oVshYjNcn3S3N7rWRMeNo/sV4w?=
 =?us-ascii?Q?TVBZEcUcWKPZzh3d9PONMDpjaZi+kTTSdDdfFr00JtG8ekMUFOq4MS1xDjG3?=
 =?us-ascii?Q?XT3eAEL6I61r3lUVFpNS3PD5K8j+7Z2lCi48i7hJQIjNjCyCxvqToCyU6Kdz?=
 =?us-ascii?Q?vAvPtKC4g8iKaWnJ+MPV4T68W+6ARf4gdZwdsgsJIEH4dac+CK9wEnktFqPR?=
 =?us-ascii?Q?s7cUsSc9U9+ECjoe4aoUDGw3ygIEgXPkhYorHar+kD+9kIBJnM+l3XpP9qdv?=
 =?us-ascii?Q?GcDtpnbBctC7tjdxyFiy1Cwz3aQX72F0OHN4b/fwwMA6aNnkFmpUErLE/2T6?=
 =?us-ascii?Q?2eauGUm39nHN8LSO1kgBLDzYTRQbiz7XClM6N1EBXlXevKGMuhYt/Z1MybMg?=
 =?us-ascii?Q?UEOZPPPmkrLp4SDU3I+w5JQyknqdsBhMwvygV8hKcXh93/nt476UZYIm0kCc?=
 =?us-ascii?Q?UzpvY+3cdcEnfrHGcef7Stolvk6lwkKyrZSX/FukIXg/mBgzjZu0sbvynTIU?=
 =?us-ascii?Q?Fzxggt3qqyJQl5jnuPYhPAg+RV/IcFPymedXVMcZLq1/74TzGALvfAix3gwD?=
 =?us-ascii?Q?O2eisfpoeuTUux/XnhmpUjBomlDLozH7LUY5CSlALSXhjutT5O5R7+ggJdxX?=
 =?us-ascii?Q?LiBcDntzYsQzVLrkYMgQXUTkJdepCOga?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lhHnTOmxJU7GdYDaEJPj756X9rsbL4DsXZojZLSeuPMP/9RIZH0dLiOToJfP?=
 =?us-ascii?Q?Mkx0QEmYehimpRmDUyHq2NKwfBV+ZC65QpIP67WB2wq06QSdPzE7Q3fve1Tr?=
 =?us-ascii?Q?HL+5uxwAjCmrfRIk90b97+QzLalY84YSOmKOIx0Zd7YIB1cbrRK1/uvTdJX7?=
 =?us-ascii?Q?Yr6raZVUDZ5QmbZB1fCW5cq+xWFHjL1f4SsfqK+WMRPvNZbYpe/MbyqGUPKy?=
 =?us-ascii?Q?HBRDcXz2CCwNSQR2AaHIPE75q9NI0qvw39LKbZyIWZzN9aTeBm2DCa3u+f8A?=
 =?us-ascii?Q?Dk2rWHFHuAXakrgOI0sR7Zfxc3D7ToZ3tmXh+0bGjI921Lp4V8l/JfAQ5laZ?=
 =?us-ascii?Q?EVuVG0Jb2jNgLMA9oj+sfJcopcYSlKIjSaZIlKjshCCuuBZVoHApE9dO+nWO?=
 =?us-ascii?Q?/AyL5f/vM3MNiFwtXcGvpIR665AVKAu0KxnGFfszwqAYcICh2Twrm2+ykWB0?=
 =?us-ascii?Q?xZW0BctGUuCmmwl6Lhl3UXsAofky9nwVorBJ/4kjUgPf5mfndvivNhz/2zT1?=
 =?us-ascii?Q?ketRpjp3coz1ftqX85ki2O+Ox8uNLsKEe853YDu1m1aTMlpGH9fc8pYE9RVJ?=
 =?us-ascii?Q?eXkz/nUvyfgVzRuJ40A5INYhAwPRQKyIG/BUJoV5zyrldxmPMAUv379Aea+C?=
 =?us-ascii?Q?1MzwePExLsqjL+xy5roGfsByMgcrrxwfzPBOQpfgtUCAOAGlzmdkeBekVYPQ?=
 =?us-ascii?Q?tDwBs21qXZeNoetBI8Q4WkH1dS9CtBsAbvfhUXBnk8D12XDb8g0yj+XaxkQO?=
 =?us-ascii?Q?Dk8Qrqrr2BxQ+JRBg3M95S4wYsrYUTcpSkhHYKmKlA3zLoqVOfocO0OYX/NY?=
 =?us-ascii?Q?MxbNtdHyAsU4/waCv1eZaWfF2tWthRxo8C1gqwaRT1pHw6zPZK/7dDfj09gJ?=
 =?us-ascii?Q?5/wMbYcPHJM/k7VqZf1dX/tD6asJ+fqHHo9gMpKSDEJ3OxnWCsJD2CXLaf4b?=
 =?us-ascii?Q?2jzG8ROsIAlMd3HqrJdbl/0vXru+2H5JUFRp5C1KHGaONaMZnhCLXiRmZHyk?=
 =?us-ascii?Q?PR2X0WYDOrL4Hn9e9ZBZePIdc59ZHSomGUZiczazk7zZuuoYqR2/prw9yYcS?=
 =?us-ascii?Q?f92EGNr+32FnCbdDZC5YST9FQpuEEbUGNu73ku3Bt1q7EGD5Dx8PNuqCzrHE?=
 =?us-ascii?Q?uPlV9MYOK/gIWXZuLjY1NyxJowhBuLN5Fe1uiHKYI/LQRIvr7Ti03j+sERTK?=
 =?us-ascii?Q?LXiJB//7b79bTAAEcAemmvlp/MGnuirEV175esz0uQlMRD0sECqgwwq5NpIN?=
 =?us-ascii?Q?5nSd+RV1V1yDd+Rp+O+N96T9YbeTg6VLo4dulA4OjoQAwnZljXv8rF9e9/GR?=
 =?us-ascii?Q?x4jGcxxUGbABvyukliG83wkW7mEaAkHsv92B6sCyIQiBg1e5uQvso1MvR6BC?=
 =?us-ascii?Q?gOTcspLbt/iq72hxQJBqK2K3M0cTPxNpXOc5I0VMxa1yrwBkNCV2/jymu1K0?=
 =?us-ascii?Q?vfXk9IJf8TrLuvU5A+tsFMtKVsjI21U4KlkAGmqhHDVYigPuL0sOexmGgqbn?=
 =?us-ascii?Q?jVh3hyQeBX9sEPfKo96GQInrTBNr9Bi2bQ3URt3p7fNmpNDpp2glBWut6WwI?=
 =?us-ascii?Q?7krnb4i1Fr8udSq16whZ7q8Zn9z8I5n1SC+7w9Fl+8HCpuDD3uZheZO+kbSh?=
 =?us-ascii?Q?laAFUYptCfDoYHwNxS7RBiA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 718260bc-c34b-469e-854e-08dd5605359a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:30:53.2212
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zS/Q1ulsI75oZOCbBuFa5M2SstCsWeWdYTkf/vsHFn6UaPtG+64Ipm/KJrHF4xUChcLgF/Nqq1EjG7266TlAeycphXRmHtaiqDLqXFLZear+Okh5WCMvSGJZ8r7GRvE+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB14457

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/qcom/sc7280.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/sc7280.c b/sound/soc/qcom/sc7280.c
index 230af8d7b205..af412bd0c89f 100644
--- a/sound/soc/qcom/sc7280.c
+++ b/sound/soc/qcom/sc7280.c
@@ -342,8 +342,8 @@ static void sc7280_snd_shutdown(struct snd_pcm_substream *substream)
 
 static int sc7280_snd_startup(struct snd_pcm_substream *substream)
 {
-	unsigned int fmt = SND_SOC_DAIFMT_CBS_CFS;
-	unsigned int codec_dai_fmt = SND_SOC_DAIFMT_CBS_CFS;
+	unsigned int fmt = SND_SOC_DAIFMT_CBC_CFC;
+	unsigned int codec_dai_fmt = SND_SOC_DAIFMT_CBC_CFC;
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
-- 
2.43.0

