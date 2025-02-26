Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011005.outbound.protection.outlook.com [40.107.74.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65EEA18FC74
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533640; cv=fail; b=PMBJMEpkK424VA/1rLA1s3M40XNZ2nj4d3efIAB1S/7gt3RqHBjpArjL9cXMDiTNNPbnO71aBHKFW8wx4WK3bN1vn4xGQonPSkwoFKFTG4taI+q2aUc6B1CJUAkR+P328T87fLi2IgcJNrLzjqz06pVNikRcF9oqmBv/Xk2uWy4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533640; c=relaxed/simple;
	bh=GngEfRcbgyCWVjkAfYPPnck2IgZasveyvBeYPXJU1to=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=FVSQ4EkiUVCRKh6t1Cu4b8WS7x6T8HHXPb4xxsBhXc3gQBjgi/yYJxQpdE+QBrYIIyoYdLeJZ7ZyUzhYQGD++RXB/ZwDpT2zY0i1hzOyOUT7Kxj35WlGVlk0f4OWMvyu7/uQLZYmLRv05lU1OC3DOjqJ7XWiEMez5vyR99kSsAA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=FJ20wQRV; arc=fail smtp.client-ip=40.107.74.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="FJ20wQRV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T8xd47j4HidlV5pEgc6R9LqcpjilqHdMsNXXjrOPzeweuvhNlbKAMyD2j1jkOsfaSmsRbfsCQzJc3a4kliOy6hSGna1KBq+1aKOFDawv+GG2vT8D8XqzHolzHw3lQ9ZcXEsNXaSCEQH/cczIMaPdSWTg+FIS3xa50Ri0jZFZvV9n9Pvru5UzVQLsxGjdOqG3CmvThsaHJUDOjNQMPHBowQW5pAnNHHND0AQwslkd9DakCZsWZ/ANXc4i5JELmUETi4R72UGz1S1EnVCAKumfUbM150niDs+SHUDuA1pqyQW7kaNMD0VAeNswRGZvgH5jYvzDbF4DDxMeGYR0motzfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JXnfoG2VHCmx2qaXZn0bzSrylkQPOuDySCM4joXpRbA=;
 b=u3nzwgVdSGDwaLK5LRg/zFchkz3p+cl+aDSDQSQC2HJP93Xm7YurB+ekA34K/WMpO162wUAhvrbyyBOwUT9zuGfhKNyhiulaiWLYgGxVxpSMQD8gYszklr8M+R+ei4sh3/O8T2pGboZJOdnZW9xMYTgZZdbpziAws0BUeXibMgsvamIyUba+QZmPoHg65uASjoPlT/qmIyMR8YXJBipvUR0zMAS8PVDpMZoaadcbXtTQCT9HBMGkMDPojOaoMC80P6oMoeFcKyfv8+VwvcR83JdeAtBjxpMVp3nugIGDhOUAcUDY0dJ/M8INJ/lz6zJ1WbuFQ+MIC6J+VGuJATXt9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JXnfoG2VHCmx2qaXZn0bzSrylkQPOuDySCM4joXpRbA=;
 b=FJ20wQRVpKjvAJVNVDE12BCVXoam72uVOgD4RSk0H0FxSOJa9MrRmBsgfym3q9vYohnfoJPhorZuTfqNE/pP+AW0w33+xhuHYAdSA394C4RL/80dbBgSnwZQY4NCc99ZiVpJcOlalEBEh4h0jBAxM8SHxBuBMnAKRRb2qFAgONI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB10414.jpnprd01.prod.outlook.com
 (2603:1096:400:246::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Wed, 26 Feb
 2025 01:33:56 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:33:56 +0000
Message-ID: <871pvlebgc.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 060/157] ASoC: codec: rt5668: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:33:56 +0000
X-ClientProxiedBy: TYCP301CA0048.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB10414:EE_
X-MS-Office365-Filtering-Correlation-Id: 76a8be7d-38b0-45b7-8682-08dd5605a2c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6Q0qTJLMW5dPqHL6U+Oxmussehf9ApA+rdzXqUD3qnL1TNOV+k8/ASsBXc3L?=
 =?us-ascii?Q?NqenaTyBMPhpyDvWWdu9sXdDSEtTI238yhvz0r7RHHllRHczT4uyJuVRcCd4?=
 =?us-ascii?Q?231PFII7BI2yjTubaemqMDhqa6kuMj2V95FBsW8uC3++xLBithUbAMHHU4uW?=
 =?us-ascii?Q?6KBEaGZUgtomC89OhVatoCZknNkQ11Mew1cl11z5hZQehgBTJj1o2Mwl3frc?=
 =?us-ascii?Q?CZZzHPFw8RNStx6hoyX6A12HMvm7exRJtjPBkPgtRhBxlW5CLHQwBzsbqpXk?=
 =?us-ascii?Q?tkoT2n276x7oUDY7oaCMDv117o07tU91DXLGb0H8cbJ6MoyhpqESJ08mwKX/?=
 =?us-ascii?Q?H0uF1uA+jNb3MssT11WZQTnYdHDv4TO1FL87UCbxQsp5hwTw+/09vdzQwFxu?=
 =?us-ascii?Q?1HtQbU+KrxK1kEipqP+AtVgeQl6+zr7auYC0fvPqN9U5mx7OyJHz5jEBTRxR?=
 =?us-ascii?Q?aOsLziqvVF4bhR5QwOPms2xaLIyaddjTNf/ZRYUmDWyi+/p2b54ci1eqBjiF?=
 =?us-ascii?Q?Qj3LyWIbp6R6Fm+vmJ8O7JAUL2XCYrm0iP6oI9C45fYO3ya4GLXJzJVc9mB0?=
 =?us-ascii?Q?IHkACDkr5c0S1JerLyOfIKVVhlbL4HaLvI7uO2TU9msv7h4pAetKgczcnOgV?=
 =?us-ascii?Q?R1Hz85YDKRkxeJeMZ0Urd01izR06ft1XuzGdDrbG633S/vAdyChLtF2CFzNK?=
 =?us-ascii?Q?xXWfCt4+sjL+1lEJoOMVcDlKPglhOQ5M1yPzBheZXYEPJW50/ZpBuYZZvBm/?=
 =?us-ascii?Q?09jTTIs59TcfNZfRTSPNG5Dn5unrmneYx+t1+oxyjSJs2AzF0ScCN2k9HHQY?=
 =?us-ascii?Q?BqKCiGlcf5mVXUu8D1G4DVDE/p4HMsBGwqqQkPbxvVZNKUlzAyt8fG+WPnOE?=
 =?us-ascii?Q?yzJCIZEm5e9DoaLYK3+eiv3NtBCr753pDDFyXRkt5jvpE/DePnsh5SfHH+ew?=
 =?us-ascii?Q?ppqjufvo5jKS3g12laks96Ri3qzzTuhyQt+JvVxgg8718nSXNjreflNVcPYA?=
 =?us-ascii?Q?2c7UXqCQDmoDeF/ZPTN1f06t3mkhMBgm578QEGvhPfUFWnfsfNqwFNS2lbLk?=
 =?us-ascii?Q?YR+ffHF4/9+LL49xL98U9ZvT4HiFPBp8oLhGkbFC1QoL67laRqwRmIVSZUaM?=
 =?us-ascii?Q?4cltETAvlkXYRxeQsjA5o1GBooTrtGLdRbDqKgrrzPXa2iZgUjjrTPRcK8qJ?=
 =?us-ascii?Q?hx2Mhi0BZVLBf5at5vrNsOYhijRYje4x/378M65EOVHm3UkgW4koveweuThz?=
 =?us-ascii?Q?4Hz9czqQI0+inq7k1sY83JwXka5cROExEb7QMIRbhlDpViGt+8Pluzu4Ge/3?=
 =?us-ascii?Q?RGwo/SLSzPJmOYCsviUiHE0g+sK7xIoDk+bGlss/E9FEtz0BBiH1z7mxXxcQ?=
 =?us-ascii?Q?t+kNtyE+fsLwJP9/qG+yxoDbOV3Fm2QYxeei1Bt6yY3c9jN/BYEVEAY7zE3J?=
 =?us-ascii?Q?11hHhMPQxEFxU1l69T1+8ZkKoxfSEmek?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dfm6Wkv03n0HG/dOXPebvGgYhNrl6jco8fbdYvjHDMmZUn5y9OoRlephXeek?=
 =?us-ascii?Q?hW3pdRk2EJp/EqKt8Um60tP3i1oKJYuad0ESY/n7OUD7fTOD0xbH3os7pW3k?=
 =?us-ascii?Q?A0tCu4+VFc1HnypOxEd+r6pCmuc+wrue9GtUswY82ErlCffzyXvwqHDgSlkO?=
 =?us-ascii?Q?vBC8PU1h9lOPZFq7CufmOwnTRZnSeINtx+rQhEmFEAskWJAhNS1MaUevQ1XD?=
 =?us-ascii?Q?tb1QdGZKF6TcsDAswfMtHZs8ipZL/lm2m1Qp7e9Bj6UfuCg5hm1dd4vDV5yp?=
 =?us-ascii?Q?667PXIie6dbqaLU2oDB2v2X9q0Bb00mbx9esFWkyWxR9XMkjcOAE3Qv08c1E?=
 =?us-ascii?Q?kPyBSVUVUy+H99v3+luIUa+B3Lt+RA2Gh9bH+n5cu2NpHx9UI2u6gpgNX76Y?=
 =?us-ascii?Q?4Gy5/1qYHapX5qWhpziNtC4Ga8kZZnJmMbZgA2zoN5qRyYloGOlDMwHETqwy?=
 =?us-ascii?Q?fbmLg26SPM82mMtmipTdu+32RSmQq93dJTZdyeEkW+ig4Xz+Hdnx9BfVhE3s?=
 =?us-ascii?Q?JxaxMB92j1fQ5LADUQE7pKwaWDjGCpNVQHFpP+SbJJ/iKl4pprLxMyZeroqW?=
 =?us-ascii?Q?A2agWKfBPmzgC0cIHYph7uZzJ6wotZlnoS+wm5rMVGeONafHv06hqPfW6sdk?=
 =?us-ascii?Q?kOE9yZWNMYlKTrZ9nnCGCx95g8MthZa1CHjOHlLyxrn9T6X0Jta9R9uQvlo6?=
 =?us-ascii?Q?ri07dIUg2IlLsejWNu2ax+UzYRH7pFOci1YLcxRgUAJyx22Ewn1pkKJ1KeSb?=
 =?us-ascii?Q?ACeUGSWNyLm95lM7bp0ognCKZ+NyoFEH/Eu2sBEbXR2h0axoomTz+8ZeLy8C?=
 =?us-ascii?Q?EC3HP8CJnwZgMXGEBDDyiRpvXVSwQOuzZnJODLZYjRU6ShKkolmaWfUgucDS?=
 =?us-ascii?Q?L0GTaLkrb5VQ6RWJYc3iOGfpdsw0OEbzhzN+55eNAd8nughNQFXMq299oiUo?=
 =?us-ascii?Q?IkhNV0QP8/AvJD/aVl1VlJZ9iUyrUtEc14GfcYQkAw2v2y0fVwi2vmqRqoPZ?=
 =?us-ascii?Q?19nGtSfD4KjfLwo2zqZwNbvEzxzb+wCOc9bYOk2Ocic+dBa4t26hza6Sa3SC?=
 =?us-ascii?Q?Fs447l4Tjlf/OP/Zw+A9hPZy3hFFzE2CJQHLCdRz0VtiRDA2kfil0EtsxJQK?=
 =?us-ascii?Q?GtUUa41s4fTe07PDEKOZsRQaRj9RlARVwe3Yd7mgIGHh99BmiezLfmhXmItZ?=
 =?us-ascii?Q?Nnp76LhPP8D6fk1syPMbeMYSAhrHUgp1Tc7bbdKFCJ+VRAC8yVe+Dqnk8TKH?=
 =?us-ascii?Q?LiuExU2Ewg1vGigPnxMac0MDz3aVSyl0HmYcLq3KSZS7talOyzbiG7HQxCyS?=
 =?us-ascii?Q?PQWUk7L68+BJBKN/mibMNU0JfjM3qMdogCr0zo2NhnNZ5OmigBOPUY+5m0ej?=
 =?us-ascii?Q?5rybdkUTYF8HrwqLc2sohM8mq4W8+9NiSWm+aQfl0RfaBEj93u+6nkuhy8BN?=
 =?us-ascii?Q?m+n7wA5WzGmzo14fBKwO9d9jXWq140S1iRs5rwhMmf0IgYmI4BnerooT/kkU?=
 =?us-ascii?Q?bTTQ6WVoCTdy68AmGY0sJka10x176pUZ5BkZTr+FWBYed0yth1ete6yQusS7?=
 =?us-ascii?Q?XvWLFnqIETlIMxbjbrmAS+n+rxdgOYlRXuWx7EedhyHszAj2zuwDCg7qTJsM?=
 =?us-ascii?Q?qXikgLhumb72cRU14uHWqLs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76a8be7d-38b0-45b7-8682-08dd5605a2c2
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:33:56.3280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QIBA/oioAb1USbqYp983izitKHyjvNYcLATiYcO3MAnXFywwQ+ySVuRd5KT+eCSIZP/QLJz1yFZQ2+v7xqECILrvKrMrxOMa3Ek7GPmDH2/w1s69kHfMudyHFHvURjHa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10414

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/rt5668.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt5668.c b/sound/soc/codecs/rt5668.c
index 494ca3ce9b96..dbb5912e5e2c 100644
--- a/sound/soc/codecs/rt5668.c
+++ b/sound/soc/codecs/rt5668.c
@@ -2010,10 +2010,10 @@ static int rt5668_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	unsigned int reg_val = 0, tdm_ctrl = 0;
 
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		rt5668->master[dai->id] = 1;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		rt5668->master[dai->id] = 0;
 		break;
 	default:
-- 
2.43.0

