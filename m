Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011054.outbound.protection.outlook.com [40.107.74.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5231925AC
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533782; cv=fail; b=ADLaJmxSDDbryRCTFmdyzlg/X2nU5X4/5s5ACAp8voEI2oDdtGa/fLmVAzX9hvEGxudLgwIfxNwbNvgbPSYH3OsizvKHQF2B662fsqK41BnPcPNq11wVgHKbZIOiOuEk9xdBglOe/L787w2sJeYar3zRCUjMDJu9X/xdnoURAps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533782; c=relaxed/simple;
	bh=5Aonoa+NKXB0+yNt7y+JS1PmojdCciYjOYscEnq8gl4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=mgJ9GnBhAAI+5iK6/8ga8zv6MFfTPN/2sOuJN8YYaso4deOl34HLATQeMG44wtbfE1p4n8xtSRDVKEUAGqTY0lKT66qTflIXMdFvA+3vz7gZzG1U+Gr7c7SVOtjg8iBFFbob6Pl/pHa1BbzUCSFZ6REqRV5IJgwtmr6jr9zrPUU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=mnTFOJKF; arc=fail smtp.client-ip=40.107.74.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="mnTFOJKF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f2oA6zXnvoLfK58Rsem4xRPJOjwIDqSBU9rXEURTXw/SiOgUWbGOEHBegkq5kC4789rz8dpwiPx8fRlwyxlnbi6FPAnLK/eDh7pMJNVjZyvRWEU2gjg3mfT1PPc2zANfxbuPtXaKnaFW25Ba0BfhRx6hGyB2nShzbN9sINnwv6DDvrAK5nnX6388tvpn2omb22Jp0mKJsRmP3a39MVxxYGgfK03+tNV/Qyfjd4beX6gSBACycH4+sQX+23tq9THuwx+uvVgzXJqbEfMdpRHYFClLF8o/lNfREN1twFZ4Hh5em/ZmYJhdXnHK8u59t6XEZ0iEkawVFUZiw+A31J/9MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4AUlOhDFhUW95U7vXqNo4u6C6aShLPb+CIRbCF3WLlM=;
 b=eJGjED27R99XbKY8XO0NnIWIUOIzqjQED1Vj6baJRUFaUKmfKvI8lbpbhNvU5vlAGj7z84EZw+gebXS99tcfQaYOqGtnQHxSyORLdMEbwaGN/zJFc+GbwyDJ2TY1yCFPcAXAecNK29OX+bwmChBpCu/7vUxEJSU4ZlnIUCWTOpAJUsuJLXwLxYLjUgxPl6dVHyVrkx4NgtDETIojuga2emQ7WgMFtd98aQKfP9eQ7K+OMXj3u/tTlOX+X06aVLbHdBYV2JzedWSvS83fMgceUnkLgx/pe7Ayo0m9rZyDE8TupI9Kedz4nZE10Uzl07KaD4MoBlnJhv+mxKNAYtkv8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4AUlOhDFhUW95U7vXqNo4u6C6aShLPb+CIRbCF3WLlM=;
 b=mnTFOJKFoeZOogV9n70MVXPqXUyH0QMdRsSMwcgDIY3SN425ajNK+ItK4jdvfGAaqBo1lsgy43xGju6TLvDrA9yvtkClrR8ko1yrCYuF3eo16bb7bojUUNmaojrtGrwp8/e8pCKoTW89r6CytJs5KC7BEMI+ErAp6MPhQP+ORjI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSYPR01MB5511.jpnprd01.prod.outlook.com
 (2603:1096:604:87::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Wed, 26 Feb
 2025 01:36:19 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:36:19 +0000
Message-ID: <87frk1bi7h.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 100/157] ASoC: codec: wm8995: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:36:18 +0000
X-ClientProxiedBy: TYAPR01CA0147.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSYPR01MB5511:EE_
X-MS-Office365-Filtering-Correlation-Id: 5723a7df-4dfa-4cd9-42c6-08dd5605f7ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PuqmXN/H98KQPKvp2lXQGXTF8DdObXbqM91LQaaGbdfy1hXJjicliyzNVaOU?=
 =?us-ascii?Q?YYHcFgivNyAwlKgKDLYyLQGuHqmNyOZguGdo27p7AggGX48YbyqtV69cy01X?=
 =?us-ascii?Q?9vIwHVE+H5LwZhTDj5n/3iV/vd7b1rLFJQusAxVgYZ4OA7vTF7f6YlaDzSdi?=
 =?us-ascii?Q?5SGy/fQ2tOLkL0zAL6EVSB0YV2IFjO17/ft1Kp1tRWsxsMPuBv1RxGRdasTJ?=
 =?us-ascii?Q?//T1Zd4mpjaZQpgcCVgPOzyQRvK//F7ZN0P6yCbVF5GglRbRv7Tu3qP13d9N?=
 =?us-ascii?Q?ih2yZQbkJt09tiocCqoMvjo1+CrtAJt4uEqGf8rQutbH2+KI6imw3B3Y21SA?=
 =?us-ascii?Q?xDFbEs5DeDnbmN901Ddn75bbOufJGUjZ46O5kRY6/JcmgwYrbkZzE+xRGMgV?=
 =?us-ascii?Q?M28Io057K0/VGysnnjk2Q6RhM8UXfdPBMp1mbrvEOwjnMQAqNrIeqwdpwITd?=
 =?us-ascii?Q?T890NXcFtC9LFCtbb4E0VtMt0fh7E+q4gXlUZ8sv1hpaCTl//sjEyKymK/VF?=
 =?us-ascii?Q?UhUIVuHP9hPFXfdg2hXKrxi8zqUfbeGCXLIBJbJcfMrdvgRN3VUWpFq/3Dxu?=
 =?us-ascii?Q?hHxKUrLGzsdNpxf/bOhg4ozfGSqJ+HTBoMz3Mwx51eHXr97aTJ1F+SOnWyi+?=
 =?us-ascii?Q?/z/dWwlcGl23dRf/zMvxg1f4kHUzRe8fr7Ui9mFIMXG0lCALrO86/7oRyPp2?=
 =?us-ascii?Q?42COiOK21pylgNR5/5ONK6i4Aerkmm5EqHOcjn4Q0ssM7Fr74OUsROLIwWDJ?=
 =?us-ascii?Q?jV/yweLZ2363UuOAQV2vNZypaGlbatYG7S8fOht6nILlkM8Eu1w+9JCOvXV+?=
 =?us-ascii?Q?ZfkT1zTeLPuyRhrTA8qllFExrFDCi4ow/jetMUymzMUubVER2rhKSQDKnBTE?=
 =?us-ascii?Q?wy/SJ9YH1bXJJa6QbdWiekfQZyZpRR+A6RqmsJZdadX3obZwCFQY75J3dGQ4?=
 =?us-ascii?Q?YTFmEy7XScxqltMZchcFJUZw/vbkVObkzOc9OB9TnB81AdfdOrWsRi5Bcqkh?=
 =?us-ascii?Q?CtPrIq3/EYYXHfl+SWB7mk9K5cP91P+1OdwgXKTK11GDVpao4uBR9P98IH5K?=
 =?us-ascii?Q?Kg2oYW2cySI8ATryg4547r5FHM+0uXp43u0DE6U8BKl4NWTfYwQkqiDgVgL1?=
 =?us-ascii?Q?PhBTD7Xd9chOx3Fs+HQOmO6gXH2+vOjUyQKzN2f7sCLGP9u7KNAhAViH+R2N?=
 =?us-ascii?Q?5NZ0cOzi2aDxI9feUT3Ca58YhC2AEeyb/+Y7kd6z2p/fVUInjxQl8SCf+LyS?=
 =?us-ascii?Q?RiImLhKT2Ii65CHjTYPo/d/gjPLqr7AbXZPPEEI34jzeBbNh4HaA6VZDiJsk?=
 =?us-ascii?Q?bczcGLZI/GrSOgxg+qSVbitveq0/qDvh1vXlXCddiVvLVHcXPF66304ZJikY?=
 =?us-ascii?Q?IL7ZeUMR1KWimJFbCxc5Cev7kCtFl1tAuJGlsxZtM63VoOuLrxtPxGvg+TKc?=
 =?us-ascii?Q?UbuRQpZpnl2V/Vu4serHF+W2UL7At7RW?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2GElRjuZdOxNypdbP8aE7z3rmyGCW1fRGqR3YR+v74WmUaHcajzW+wfGUbuu?=
 =?us-ascii?Q?Y3mnAXsQoYb/vAYDeHtCtZgrM1BZubrCROC5SKWYPb5gMbIEE6VAx4roQ3KS?=
 =?us-ascii?Q?277NWHRgKc/nRCHgGvzuatO4DEdRfszyGvXM2wvPcupFv7WaJBkh+QtEwrIn?=
 =?us-ascii?Q?n2l+s6ZvRCj8hGXjASDCYj94SNxA3d1Hztk0erf1t4eZ64/fX/X1dgTnmBaN?=
 =?us-ascii?Q?cCTFge12XcE1K7tFKtyLwmoBA87V39aPaKZuRhp5JDEwSgGY4GnKMsUaaoP3?=
 =?us-ascii?Q?GRiC1gTWBH9yPPKlMqJvlOCETT1xFaBOA4QdBWhQAc9ToZSQW9vwepe/KvMl?=
 =?us-ascii?Q?ODyivYcj1/QRL8WnpduqfKw4aR1eGd063F2ADj9fTZML3Vz2EmasSZaP4Axu?=
 =?us-ascii?Q?STVK/iFdtRo+QfjR+ZyBlg0lXIS2dzF8KBorpaeI4bmRSTO6K3lY4dwaicLY?=
 =?us-ascii?Q?TPkMjLZ2Kspy63VvsIgTymny5gA7P5Y7qI5Xug9aH4Qu7X0Z6BvJErP5kAsx?=
 =?us-ascii?Q?dBVrhFGE4teysi5jOrEo/U2rVmLe5tUFOzwoDpXFO9orcU2DitxYnKXwWg+E?=
 =?us-ascii?Q?mvwpmeqfJN6CUhkP0BU6Adj3qg2FwFUV4WiNSNECAtj8H7ykxkB1N7TkO5qg?=
 =?us-ascii?Q?vSiJGoVug8n1LCatvrprJP8QiP86LXB5ffSwVDsqwaeeW6F6C4BS9o/ksTai?=
 =?us-ascii?Q?tP3zkHtUHnvPuzqg6MvdF13FI5pdlak199WC2u76AeMVqvqQBxiOtgdRDLpz?=
 =?us-ascii?Q?Npw4K5ihauGuLUQEAUSl9weWvZBcYeLY3RVUjeI2WvPzLhZABDl6zeA4d9sA?=
 =?us-ascii?Q?h37MzlJApnERoti1GC88bd3y7dE0yCVJldRUzqd+kVn579hAXHT9Dw+4WNV0?=
 =?us-ascii?Q?X4tt7q2cxGKHpqGEi5Q887AVmNqvrggW1S8h7sA8e3OlG4+0pb4/MMIrc7LD?=
 =?us-ascii?Q?Zrxcy/MiCSdSRDe7mA8kCIMON79yI0adUS6UOSHtfrJA9EXlQEODMFqSMCHe?=
 =?us-ascii?Q?qxJgg/M++ICT3ev3WvAPG1hnuqQFJ9DEHT9YNkRFTauSZ09TeMXSj/Ynl0L9?=
 =?us-ascii?Q?vmyWsm2PBzjA6gr7wzGGNZ7CwBFLmo6ZSKkXkLXTHdWWjY6MsNTOu341Btf8?=
 =?us-ascii?Q?kn6IO+32svgGrRf06fjCu2xoEpFjZqoo/ZZljysg1KIame2BBVAfOKqJpabv?=
 =?us-ascii?Q?YR2WheAEJSq9J4ScPr9vgCAS3E0BhJyTx2uBga8FvkqW9lDa6oGfLagEpPuU?=
 =?us-ascii?Q?ElikPS93rj3DU5cn3JWf3p1bzd7qM+FRWGjaC+r2At3ZBOCfksGfaOvQ1Xom?=
 =?us-ascii?Q?nbiVoE+t/vFy+RPFttVLz0T5XfQYYnpCCrP68SLQkSnipvwZvq2/mWLpV5Gw?=
 =?us-ascii?Q?nJ+kIRaq4bSeDuV53A/+xcyNAC6JudQFLX1e4+Wg8emZhOEBliFW/TNuAoRY?=
 =?us-ascii?Q?kcCJrgPIVakN2iJL/XYW7nqJDc79tKKoFguV7EITYhS4jt2grMtX9D6M4ziG?=
 =?us-ascii?Q?H5SYm6SnDb4dVyC1LRPeR/BNXNgGcXakFRJEi2clTZoLzWuFL7cjqLUtXu7/?=
 =?us-ascii?Q?7vIRLNOt5UFhHe4hVZpVpvBk47qM4Q8HP8ScDCv1ALMG9W9oTGvJdEDzVcr8?=
 =?us-ascii?Q?H3EeMo73mtI8UiWmpiQ8vCU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5723a7df-4dfa-4cd9-42c6-08dd5605f7ca
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:36:19.0740
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bo/5FO0fC9m5gB7hv2DrUekxYvvs6DF/xaacQknkLDG+MQyfWS336O9UM68v/qsISMg8BydXJuCuwviE1il6bZj/ZXT4ubR4cz+pMUdj+eeZx6v8OZU1I93Js35PBhaC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSYPR01MB5511

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/wm8995.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8995.c b/sound/soc/codecs/wm8995.c
index 1f9a9b636935..a88170a3ed91 100644
--- a/sound/soc/codecs/wm8995.c
+++ b/sound/soc/codecs/wm8995.c
@@ -1448,9 +1448,9 @@ static int wm8995_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 
 	master = 0;
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		break;
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		master = WM8995_AIF1_MSTR;
 		break;
 	default:
-- 
2.43.0

