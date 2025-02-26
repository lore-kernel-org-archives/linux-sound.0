Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010038.outbound.protection.outlook.com [52.101.228.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6131719340E
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533816; cv=fail; b=hY0O9voO1L092a9TukRq1LhTR2nV90x8BOgui81UlD7SIFXQwzrf1pMQbS4Fpv/2mH+ygvKC1hQYc7Q5chJgxG9zhUtZE+ycbx1DU/2qldEXIHjPVRQgSMrr/RGGZ46oZqs4w1Gi/iJ04ORp0RGTGIrjan9IxyVHHhtEqpJPcts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533816; c=relaxed/simple;
	bh=xBxG67JqxOWFXpbh7SVc69FA/NAFrvfuGJKa8BNF2R0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=UbGuMidjIB5PgMpba3E7jCSRHZN2d4/0dUEcWTGdIwJdYTVUHFpbdQvxhBWBPbtjHbLcJuNshb/k1ag9mGcQ8k3dzeMeIPCEBSCKRUIHkndhCeN0Hx9Rio3OLHOjtKo1Jcr+4ysClLs5ACUdO49hbptfLv+IbGsfgRmbRE02X/A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=i1iM4pz7; arc=fail smtp.client-ip=52.101.228.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="i1iM4pz7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jyS4XunXz4aEUPmXZQc4DBHRRn4FAtDsQIow2w++8Nef4o5yq51g/Bj8ASU9Z+DXN/M5jmr3COmQfuCG2RzECXXQyHdt/9UufQr3YfDCcYL66xLWDkwdvrPhZlB9C6M+XcklvTIypjZMXn4ltxnFKhPqpJ9CZP25SKWGf1Mpoaxkzkxd+pPSbZjym24vfLx6alsYnAIt69s+pUQvD0On6V88C9qHesMS3lkmhwAgNwqas1XfPqMgpRuOvMcIMuePa9HV+HHWzVO3FMZbdymg80gB+iBzt9WSJ1odlJDsqTXaL0wcmMRYHHOYID643fESYKSj0pepJ7g8dcK7PJMmBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hGCdWWB7OWST5fMJhnVnWHG89GEmZ8VUcAlj9/B1O+s=;
 b=T4t9W0edAEWB7ruE5oQCk3aOAtA0kk725S+niro9YO8jm4bsvNs//CdBb9WuF6cMZFVBuHdnAxsKOZqsMikkJWbKnM4yyQCxICqT9FuAX9mvkj8MRFDMCwIXRlXFcFxMwtF1/NvL4vZKoROXKkX1iHIhTu5HrBC9TLwE+/pwlUdYm/UvhVt3Qcxi2jHJjhlKKaUc2Emexh43NfSnSIHJosw4xTJLG/uWXEwSVryUfYCwJYkXHBUsaxkY1V6NZIXtwtBnA9TyMh5WQ2/7q/jy8dXItnLPzbbZcc1N/Wi6bsW5KxZVYBrKhfnhYYVTgU3qSfKe1sHNK7nCZ335EYJw3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hGCdWWB7OWST5fMJhnVnWHG89GEmZ8VUcAlj9/B1O+s=;
 b=i1iM4pz7pDW3Ny6x/UnIGWKUEnsHkWLJazW4LR/uKkVNMt9qdq79v52s1Ud7TUjtbyggNnR8NN38jToxIllzRWuvj9Y0hvowvZkdbUz/zuGrDEWDHEMuACqqLWOg+2QvKOoubmm9UCj83YmynbRgVSUq9g1qQocljVnQArD6eT0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS7PR01MB11967.jpnprd01.prod.outlook.com
 (2603:1096:604:23e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 01:36:52 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:36:52 +0000
Message-ID: <8734g1bi6k.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 109/157] ASoC: codec: lochnagar-sc: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:36:51 +0000
X-ClientProxiedBy: TY2PR06CA0016.apcprd06.prod.outlook.com
 (2603:1096:404:42::28) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS7PR01MB11967:EE_
X-MS-Office365-Filtering-Correlation-Id: f35a3948-b0d4-42af-2109-08dd56060b7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gaEKqV9yYg+nWqdgWpxkJNKoZ3bopHOHkcRUhBiLizzrgLN6ApxeKn4IiVti?=
 =?us-ascii?Q?ulI/ur4Z6xlQr2jqBrBKHi3GIShOaLgBY64grDYkNZbuIMuwQj6lyxnMHjzJ?=
 =?us-ascii?Q?YHAT5XxsB1pXHjoPuyxLrWFqrXnBF3HkCT8t3Wesk8uUUxrrX9UwaJLipOPE?=
 =?us-ascii?Q?N2MsmKrT52kxPuEwRWMySMF1ppGWPLpn3pAJ32KAiKlBLbgmBl1ZncWz3NE4?=
 =?us-ascii?Q?N2s0mV31cY3rzaJGeHy7Z6Ax3yx+M+b/gjN+OSRo8zbHD/Rio2RZt+aVKeBA?=
 =?us-ascii?Q?Cq4QLtZojn1gMoeebJtKm4h0slaVcOeV+cJLAhUT+PnUBZLYpLRa/Ut3UURY?=
 =?us-ascii?Q?cBebEdFSBW6NLVj0+reVhEJK8j+OiLRPCXRGIOeJtEpd8728LfPb06/5ATQa?=
 =?us-ascii?Q?2k5iUZTD6GYEAruBXrQSrqo0KjktV3+zAn2MDNCBH3N9Mt6HGVgbR6PUC3mO?=
 =?us-ascii?Q?a2lYF8/eUY44O2dWV4rupsMnMIObUlmhb2HXl7wiX661Y9Al8s7CtQHgZ2mM?=
 =?us-ascii?Q?yEFq9cSiD0v0VBketBgTM+rRNCqrI0xGMIlKOCxerUCuqjX5GY/UcHYjGgB2?=
 =?us-ascii?Q?Mw0n4Bf8gq2FT9xpbkKypXcCcPtpipSyT+pNLA+0wMSsmHcun/qE0W3NGG9l?=
 =?us-ascii?Q?5DBUNMRHJQwOuxk2EmVf1wRaq5SbOb/8hWIS76KF+w0PHImOPtuLm0KbZdj2?=
 =?us-ascii?Q?vIE1Gnf4PQzHi4euNPch2rhKEULl6a/h0+4QULPRbZ80c5W4kERSIDrmN158?=
 =?us-ascii?Q?qoxbkC+gKa4iRmjTPscZ94PfHxVCgo0Y7+c0Eyt9A1nfKDftjxuWcVmyXQkB?=
 =?us-ascii?Q?3BFVZ+qVuh+NgbYMzxoztFAAwxqPp21a0OWAhEz7LMcmKsNuT3QOExW8A6rU?=
 =?us-ascii?Q?LbOGcOL0PEGqxtBanMQhFgJAY9ZWIdBO8JEvVkTfPym2GI7jfAN7QLGtXdTl?=
 =?us-ascii?Q?quDF5VE5xbXRge7vb6QCA/uPSa/BcOjc1I/sxZZ921mizhBp8K97U1TsPdcP?=
 =?us-ascii?Q?v9xDsgfgJVDr8BKPD98lQK5QWWg4hogdDH34tS6oYaEgoZLJarf7TKMn2jPB?=
 =?us-ascii?Q?VJaGxMpkWrzVzQ5ZORZOquV0FND9QDPnLnz7bQ9H3F+lnjFkb6LyQjPAp4Gu?=
 =?us-ascii?Q?TXV7jGwcRpvJGMPVz8/o0i1tkNWROM3VXkvCuv6hmfGkDC2QkVI1iBbKHrqr?=
 =?us-ascii?Q?1+9ITGV3vWBtDXbimQx/3hHLtmdgIEiinasRTcVHWFJddRQdyGTkt5VM5lpt?=
 =?us-ascii?Q?zVgd99Ead2VaJjk9Ubz0CG6gui6zyzFos/kHx6yVROAn3vDYAGh49M8r93y6?=
 =?us-ascii?Q?MBtXSSlZboM+loQ9dXBU9ba7JbtfunYaJ/uxDq164ignVyBc/6nfsq+aVG49?=
 =?us-ascii?Q?VlWXqRWXK1XLAP0pyeQqcn6wNEqw2XNWxR3BZD96XR6Ck/x68pryApqQAXPG?=
 =?us-ascii?Q?xDbtAhGfmnoIIlVEu8GSCQStdPUXHO+r?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XErqTR0Acqk0RGYiG8szdjjWUAeq4YYmiqdGnhSDpsY3A7iGL+qYl9C+DW2j?=
 =?us-ascii?Q?6Sjun2qz2fEFK5+8AOJ5ezD+tHOWtMNAK/8nZK+CnNMzgYmGI8oOjfqXXsCZ?=
 =?us-ascii?Q?lupZ0Dfm7MHrvjDSuEmmEz2BPbQ+Q0SjURR6mixY2zebyLSPrabW7CkJDe2Z?=
 =?us-ascii?Q?/QQU44KKNS1Prj6w+SX6dWlnlq4PeQTRPAnBxNXlXRaf9XQfVs5HsEDK6WEZ?=
 =?us-ascii?Q?VHjjwXcEII5JWw9P7SZmbh2Sm9xILbyaBVH+1P9NYBlI/CdbpcUGt7Y8FFex?=
 =?us-ascii?Q?/IKZULyISpjjPgevz25yUwMnvxo8l9buGFwojgdJCCQQEKeeH+0arvIIAeVb?=
 =?us-ascii?Q?XjPPeBIl7vl+piLlnfK/Ra+3+LfbdhDIWvPEBMxLAFStCO/idGW3vG2/5Nil?=
 =?us-ascii?Q?D9ZYyNi2/qkyYXSwegkz1hLmr5jpaYYGi6eucN94dXfcm9cbywOBI62fE50h?=
 =?us-ascii?Q?rsS8amrtpXuknYXRlUdsvTi1I5PhI91NoE4i0z+0oMXFHqRVN1h2gFW2adxq?=
 =?us-ascii?Q?kRyVr45C3rVaR7B0MDVdl/ZTim65qeoIyiNCH2F+OnHnZ+ZkxHaBufK056v0?=
 =?us-ascii?Q?MT4Qq/CA/5F/Y+5Braimgl2M8AXIPEQUApQTXVGBYscz0YweiVKePeG5DeRG?=
 =?us-ascii?Q?/6dF1dF41TkMcvldqg7n2Vdl8+sNsXXj1AaJtutQMjN/PKGDLtMcmP2Rllq2?=
 =?us-ascii?Q?rcR8jXrV7JYhAh5x3KPlcXkf0MIsltuckggAytl56uK1n/5iSpaARqhw50Kq?=
 =?us-ascii?Q?FDS/av7qMF4WtseX0gkstwckMhrU8NBTie9UlEv3oXwCqB+mwiMoYIsOnC0k?=
 =?us-ascii?Q?VCbMmEiEycUj6ek131tNS7rlxqaP7kUF+Oba+VC5W6Ci1X809VuKvgmb040N?=
 =?us-ascii?Q?hTlFuB2wnB2NqpB0yIMk775OLX74C67mi9qPKIDHkOzMbo3WBLHlFwYOyglY?=
 =?us-ascii?Q?6OPdGebGubbBY9fIblysoFMciNqu24iRsPfPssPNW8HdpQJHoZdyNxQouzRT?=
 =?us-ascii?Q?VWhBkioyjKRlSGld9VMCHP32QzoBTmoxbptRuPoMha7VcTzEthXwqqHt/ZKs?=
 =?us-ascii?Q?S89C4D0hYcwb25hh4UoY8gH5apbbQ470jhxHqikjp5Ul64nSQi7eQZ8LtrMY?=
 =?us-ascii?Q?WEGlwzOBLzIiMkKkKsp8BIuxaWPXz9zBTpNx7C6OVRcFrjbT05CwCSlfR/wH?=
 =?us-ascii?Q?cw/UZTX22caX9GPdcZvs9eSxHaeEeKv8HrBMshxjjV1WksDiFqVqBSVypEVR?=
 =?us-ascii?Q?7kXo28N5wrBA6RHwfbYtvrhqymWIm2eZ08LSGcWbAVOgu72y1kn2s7u2blG5?=
 =?us-ascii?Q?NRXcOOhTt8yOzesXADmtJWD94LO+kHHdssKrDU+hOFz2c4QXGRn5RaXN4JGZ?=
 =?us-ascii?Q?h+a9X1wneYFampp6IXQimkLiBTdx/8r3dVxY2CO5m8y1NyHbQG4pAyUKk6xZ?=
 =?us-ascii?Q?sVHAzStzn89bmscoUKYm3c3UxGUTdzVK2vpuxOfEGAO1Tpq4/TjFE8PLPaQf?=
 =?us-ascii?Q?cxAB8pKS1BJkg+nczOersO+hjh1P4GSkkVlPVVnOePs+QDsh0vPyzUSstigX?=
 =?us-ascii?Q?ZTS7cR95+YFIqTaF/TcJ2+/aiuN1V5g2Co3qaP2ZbArJn/6hyJYh5Fkz1N0z?=
 =?us-ascii?Q?GmZCKbjmpOzrnmQ7CeCf3hA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f35a3948-b0d4-42af-2109-08dd56060b7c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:36:52.0161
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6BKduorubQcbEROvd/uVP7PnZAkV/mUzKA3hYzRwsOCkyFmt5muDk35oq48kC0JoyJJs2KKR9gr7IGJcpYAOuAot0pYAbWo3TrslK4EA4sJq8s74Ey9fjFui/Eeh6tK5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11967

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/lochnagar-sc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/lochnagar-sc.c b/sound/soc/codecs/lochnagar-sc.c
index 5e0bd0d24ed3..a3d6318c9050 100644
--- a/sound/soc/codecs/lochnagar-sc.c
+++ b/sound/soc/codecs/lochnagar-sc.c
@@ -129,12 +129,12 @@ static int lochnagar_sc_check_fmt(struct snd_soc_dai *dai, unsigned int fmt,
 
 static int lochnagar_sc_set_line_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 {
-	return lochnagar_sc_check_fmt(dai, fmt, SND_SOC_DAIFMT_CBS_CFS);
+	return lochnagar_sc_check_fmt(dai, fmt, SND_SOC_DAIFMT_CBC_CFC);
 }
 
 static int lochnagar_sc_set_usb_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 {
-	return lochnagar_sc_check_fmt(dai, fmt, SND_SOC_DAIFMT_CBM_CFM);
+	return lochnagar_sc_check_fmt(dai, fmt, SND_SOC_DAIFMT_CBP_CFP);
 }
 
 static const struct snd_soc_dai_ops lochnagar_sc_line_ops = {
-- 
2.43.0

