Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011071.outbound.protection.outlook.com [40.107.74.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4BB71990DB
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533931; cv=fail; b=MWYDsriYKfPg8crXrClTHUDAzhMFWq0w4XRnr0g9Z5x7OQqhcQtzBu0l2tSOZI7tI/77ASWHlRTo3arWnWZRR8R+uhZ+xZ0P1H0fCUYH8y/ylAlTkpLLKPahvwUvUZFv7iaaUZFviSMT+cAeKrVU3KG+VEXC3Tp9zYOV3UMbDvQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533931; c=relaxed/simple;
	bh=bCLDjjmImXUem4Q7/3iPtE0Cft674KnG9/AuqnF1h3I=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=fxJyepaZKJRVQ5HNu0W7ZV9m/9PxCPysOW01nBy33TCGxaipLHhmAv+bCDhjTfF+p+ByhzaKAyuvczudDMFdMAT00Di95YP+/rPAVCEls1i1ty3oZMrtGzSFFw76oNB4BrzDGpvkyFaaZhiI0u5QngRHyL9Xejxfd6WXG5GJAAk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=KlCAQe/U; arc=fail smtp.client-ip=40.107.74.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="KlCAQe/U"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q6xop+1xyseUblaikOyBH4sn8HZ1SpiklN+v/xQcd2ZuRtMK1mFH/Mgjtr15W/r0barJ3afWjH34anBff4sLDgVSUHPDZ64rczTPA+JG/PwuSgVUrUB2avRqG5RD/CDu7VnHVD0FR1MALGYw1VX3qM+OaGEYKWyn8JTE8EC81nC0xuhEQ0Q4tF/Ip9r1L8Zz5H0DPxfnpilt9s9fQg6oWTnW38HmSj3csyyfXIQqcA3XPgeq9q6r33d6bfGlmbKmdjnlpYVr9hwYeR4giiVrRyVxbRA9Bcm6k763GVHEjq375pkfGWLa18kuGuEGEfr+jNdPsgbsogIbkUXPqV6Imw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iqedD4f+8n/TDl5xfqLaoBHAxOjG4ApeleeaYA8++9o=;
 b=Ku69F5CQLGVaaGTZYcd9rR1zfZ5EuGznrdVIGEimmh4A3lUXKPFlVibG/GUWFG6XckFQOjAxjV4VoE7pD8m/n25eVsU/I2E/+qwMq8QPrWxlg2iXLo/Qj+GaOhaihu0EZRl5vdMBULEo9/qRCSrFvQ7+Pvxzve+YIdP+iI0F+AgWaglT+jlQWoK5kWN0HVThAHmXDI/EEEuBd5ge3PXj/2lFGWU9j4YwW0NebNdMDyGL+YLqswy2jw55P2+0Z+ow28TmxR5IdxtVCtnNgQ+XoWiE3WFopcaTrEHSyc9coP/t43cigaX0yTRBKzRnW4yBYyTxEY4c1IYezDw9bF6hMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iqedD4f+8n/TDl5xfqLaoBHAxOjG4ApeleeaYA8++9o=;
 b=KlCAQe/UIYYh4e03fwARLHggDZ2PYEYKXZlovhR5XFHud9yrE5vZihXswTQxV8kP5CXeUwfM3PWb+RZgz9DIkgQAKYO9AjQXNZRQuLbx1vcJAX0HAIWl/pfQ3haOXSLBOVBcETeQoYFldw8/VbjJFIqfEFmiqiTt7DgZyE3UUtQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB8864.jpnprd01.prod.outlook.com
 (2603:1096:604:15d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 01:38:47 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:38:47 +0000
Message-ID: <87tt8h8oyh.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 140/157] ASoC: mediatek: mt7986-dai-etdm: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:38:46 +0000
X-ClientProxiedBy: TYCP301CA0061.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB8864:EE_
X-MS-Office365-Filtering-Correlation-Id: 67329fcc-a608-4db4-8bb8-08dd56065005
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JAyP51ErUjOCZTtufz0wJVbQC67ZJ+q9NRoaidxsJbHZ+3Z/1jckvdqtOjj6?=
 =?us-ascii?Q?7rC3AZ/5h9Wy6EAYatLn6VS0mxtTJLilD4bsysnCHn4q4GQd0Pwh7okl0UcR?=
 =?us-ascii?Q?aPxxhpSeTvDooxcQv57pGvkHbl8HL/HT4hRq0QdNXDKoLFd/v3VZt+b41QN4?=
 =?us-ascii?Q?nKdZIPMJUSigYauH1zlbaXlJ6Qin/hY35ljAuddFo4QkwIPBidiHbSN/VDUz?=
 =?us-ascii?Q?3qXBwOLx4gxkPOKCey2gFgRRQdF49RT1fiK9l1iWEJGp8fLFd24zKZS8L2TW?=
 =?us-ascii?Q?vsTohX2k5Zpnx3DqEu+fHujUv0HhSHqFI5j113DETBu81IV2gkwcVIdgnmwZ?=
 =?us-ascii?Q?oDdm/0TrqLWtAJ0It+EaNdCdDOeUYKr49+M9HbpQlNqXyKfOcNBLfGMnh90a?=
 =?us-ascii?Q?YxXHqveSgeuIgZV5VHfQdYEolZ8AuOjLF9eMobvVOGZ4CmC5pX/jDBgeXCT+?=
 =?us-ascii?Q?9ARMG0FV66Ejw4/uPzTb2sl5Er/6ef1/+hCN00cL/khBa+211nDrfpcZYjPk?=
 =?us-ascii?Q?NbsIRuIs01IuVQkvzv5CwXrHQeHQspNz4lE7T3xwbHwh8EizpQl+3ly9r/E2?=
 =?us-ascii?Q?FuEJKr0t32r/alUaDwv/YIz1Zx2m6o3Dl9O8lliZtBwE5Dq+MCsfcQ1sYx/F?=
 =?us-ascii?Q?wVwloLiph+P7PiuwrHHEFSdnWlTlCP4mlt8o1hxop2rpX0Y7HktLWOEqeg8s?=
 =?us-ascii?Q?mVuIPUD2SXspdihbILe6Yy0yvtgC46p6vmZTOox89atC8FDQI5zjmkV8XVL4?=
 =?us-ascii?Q?QIHobe6g8uFhNrzGlrZUjEKIzSNucWGpi2EwBordxYWNkmgbO3rF9C1qQQfG?=
 =?us-ascii?Q?jrJs3Xchg+0lFmfWzEfYEtvFz67FYN0xSDd/SeFNDGj+mnlG2JpzIOAYm6cA?=
 =?us-ascii?Q?uZ9aIBeNO41bn1ijpGeOhe/qcYAPfIW4tDb7xpCkPWMqaPqv1pZKFKv6/GqN?=
 =?us-ascii?Q?ir+q4o5TANvZz644HKkGQG3LWM17ze0ph76OsoJhriHZBoLOGXGN3VC3MzH+?=
 =?us-ascii?Q?S3fKba+vnQGfhG1KirTLHY02ANmdSlbqpapfaTXK3jugzkTVNsU2Mm1KcDRk?=
 =?us-ascii?Q?DtOF5sOWychqOleN4FIeGsuMAliz/o2BGOIDiGCZoxd7BQLCBREKhQLqNZ9V?=
 =?us-ascii?Q?R3CFdeSaqsaidFrITjO4XvqbuBMkF+xBMYchw7Vr42+6lDcmqzX5ALRrMb6R?=
 =?us-ascii?Q?aVX+mPuUUBcQkJAPLaifar+6l1LWf5RmiFcci776s/iVAp15W2deQ+hPk2AL?=
 =?us-ascii?Q?dUoD5VV1f1Pn4N3VNXNQtGdT0nQmX5S/K58FBGfT+n1RtkiKwPXGQvGSvW+q?=
 =?us-ascii?Q?1Z34Uxj51VLr0Ost/znhiZuK0i9mQVLCA/VRR09WyDiuqCfufv1WZAV458P8?=
 =?us-ascii?Q?k37P3jop3rnjCQGn9Uhz8d9QTHJCF1s+7QfoR5mCS9yzLdV8HGDteTsDHPDW?=
 =?us-ascii?Q?YZUJPbqLCZVfxqCFXLlNb1fgfapmBlEw?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VliDSemI9+C2T8ldiwecWnzGlCjt8husA2z4AqoYXX8QNxxmRbB9AEs4srsf?=
 =?us-ascii?Q?vOz3eCrlMToKQqQ/g/qEy/M+szaqHIatCBcKVra/JpXVtA9ByWacAQNTwKoT?=
 =?us-ascii?Q?n9tJR0cbcxFj8AJMFS0wEFSuX6I5FBsZXUrrk20n/1mPXPstyW9OYJNgwwjQ?=
 =?us-ascii?Q?sUuoFqK/yvaPegge4+kQfccWlnN6uHEXpqE7XtABbNggFi3TE3KFm+RWy41U?=
 =?us-ascii?Q?CXOuOJbwLj9VMEfFPjRdBBAzbTowfrtBFL/c7TnNp4MikwvNMyrHg5ygBuCv?=
 =?us-ascii?Q?w20ImXraTqKzuTuOFaXFD476UfdZ0ZTFRXPc/8qjZxkiZcacOPPF7d5FkISo?=
 =?us-ascii?Q?8rZ2Ev+9TV4dVMs2lCV7h3Xo7wtsZxe9EawA1bEkcXo4/VWcshqIwyGf7aNL?=
 =?us-ascii?Q?LHm6bJNvOtHVWScr4K7CDBDxKk6MRXWe9fnFI3IyGGVGXOhprN09UkXg4pRA?=
 =?us-ascii?Q?XJs/6Sj7FVJgsJ/L2tH43Q07dALIHCidXm4miqyVUrQWep6+0fIGiIx7zRgM?=
 =?us-ascii?Q?ql4CtAAnnOq/hyucEEfIxFeTUtK6mndBHR585kFNFdmnIH440faeU4x+6vzp?=
 =?us-ascii?Q?MMLSCGp/TnBw7csr4qIiAeDCRgVfrhYOR+obmaQJHBozy6Uu324HnJPL5viw?=
 =?us-ascii?Q?Dw8ip0FhzVouPRvDy8eE+tp7MkE9a8LKeWpM31CN8kc/r/wPqVHTaSRBJep3?=
 =?us-ascii?Q?UXoDPrgNoF2qMWmHAsweeTpgNyobZ+DzVTlKeM0IXm6fQ6cmmugYdwJcgOeo?=
 =?us-ascii?Q?jVcPBBHWO/59qr46zUXT9KUuyVckshJZsdG2jivsP3h9o6j0pkeiv1zPZj4L?=
 =?us-ascii?Q?cPO02vwB/67hVymWC5zzANRMkXJXH7jrhulKv+wUG1CnmSwCcRz+P30hYIfI?=
 =?us-ascii?Q?u3v1XUloRiCJ6YiAXfsh4rfWiS1REtPTN2YyVjUn1G4nSFfZmzM/kzSvQrch?=
 =?us-ascii?Q?0AqNzAOFbmgiJIXvQq2L4A2+QPcnmZJegVsGo6FkomqXYT6Z7o+Ftt+KI0M5?=
 =?us-ascii?Q?Z6A9gMfkcN7QdcYQL8npViBpDMJtbwDBoXCU3ZPmlBA4pEPPkvpAPRWpcDaw?=
 =?us-ascii?Q?wM3ZK56wVRTNSJ5ioxyocJwwb04OJB0l8AKOV5aSjrX47W/faN7LkwwTUvXN?=
 =?us-ascii?Q?c+WKkexxEDInEzU29Z1cB11wOD3M+BqUbK1Eghpl12U1q2HMsMq2E9Hst/66?=
 =?us-ascii?Q?cpY70TqjvNw/RcYG2cvpQ+9NRkhkW1qeJ+wQxJ4aTT+GlyictmrPmaS/goLU?=
 =?us-ascii?Q?mGIfWzRYQ01+wvby9VEhdWYWaOKNNJ1bpLDRtULo/RePPlxyVna7rYUK69lN?=
 =?us-ascii?Q?lpRII47xubvMHeopFgRIC3w59J1Hg+SDgPs1uL5jHTL9QPHTfEQm1CpKGTnq?=
 =?us-ascii?Q?SsMASXsxES+CPNZp4kfSY+lYh2J6WKPLzyu9XkCdKUUXDYJ1LFBjgEproVZT?=
 =?us-ascii?Q?F3TeWt0ZREApQ1TJr1239bjaqxZ2uR37Xylusy9u1jy7HbPwn8+R9cP2Nc7W?=
 =?us-ascii?Q?x2SWXeOcb3wAO1yIQtGKgiIdy+uvoqeB6940Zw25sNhNZpMNiOcwtP65lQDb?=
 =?us-ascii?Q?72ZbQ0G7HrOlH7+DdRGgAnCDB2A0b2R9f2voZwaiHM8uPad5etui+DzuG7qE?=
 =?us-ascii?Q?UWicT5OvdEayeFfrEWStNWc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67329fcc-a608-4db4-8bb8-08dd56065005
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:38:47.0056
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: um+bRwmNbk2zTJv3tA+nTamxS6uR0V8SvU1x7OpkAAHi8DY4/il3eumXkU57Ml51qEdp79M+2xVjJXf2eY+GC4UCj73ryT3jVDXgNqUQ+ojVZLRUBJ2zulOZ/+crHpjq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8864

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/mediatek/mt7986/mt7986-dai-etdm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt7986/mt7986-dai-etdm.c b/sound/soc/mediatek/mt7986/mt7986-dai-etdm.c
index d57971413a04..fc55ff47b7bc 100644
--- a/sound/soc/mediatek/mt7986/mt7986-dai-etdm.c
+++ b/sound/soc/mediatek/mt7986/mt7986-dai-etdm.c
@@ -348,10 +348,10 @@ static int mtk_dai_etdm_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	}
 
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		etdm_data->slave_mode = true;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		etdm_data->slave_mode = false;
 		break;
 	default:
-- 
2.43.0

