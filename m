Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010053.outbound.protection.outlook.com [52.101.228.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E701196DB1
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533891; cv=fail; b=Ihsh2Jjg0VZFfx3JzpaFvwQ2enRLVHnAOBj8q9v7+12zy+iQ+m/QuQjMZWE1oK7xpPL/kwkys06rShTFEUyaFNBwt5LjmJg8EmVHH8m/XV4P+M8qhI4W29Ncn0l6lZQ3EFCFKDxpStcvTKjNfyakyloEL1VqEfnfELdJf+Trx1g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533891; c=relaxed/simple;
	bh=tacLXb8tC0i3vlETM+0MfsxmAxsIZB1alT+6BrISpNg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=jXAoFpKG4hVHRM1UVVKsw3u2XKND33UIln+5Z+N0wpOR9o7qN4ltv/+PRnz7zmJ5A8njq3iftPoThoc/AA2khiHJWIY6iLVsC1mgtHZ/QhKpb7oQcCU1xyZvOu9aFlOdZmLXMkJ0Uex+MVqJ3yOa+Tl2l3CgL2jgX4WSHwk7Puc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=CHAIks0b; arc=fail smtp.client-ip=52.101.228.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="CHAIks0b"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v0WbEOipq+D9AEIgWPcz9xFdyFr/lbx5YYYCS3ABPSRzXkB9evs9EEGxd3W9qRgKuMZNyMof+FjjiN/arbn3ObLac49/mGxrRgV5vIdXbcT3aKKgOymJOOJlJJeIe3Mc41PssM2FH2zsZdzhL+W1NqO6o4CDqbnMV+n4cOqmxqQOKJ4JVQaXa0ONibRukWpszqo3xPK1mDLo48mNdjO7FTmnM982WOOjUzswxWLgzFQms9p01BPnNIDF+CR7TLwsaa9UAcOtS3Q7F5YKlAeiTfOuEqLZG3wybWC2L1Ix4xe81gxcxH2nikCfym4fffOLwE+aIYNLQ/JR4uqf7leU3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/yAtIAAbyLyYdR60pWwZ6LHNolGGGfnoTfFLcnKZg7Y=;
 b=drRumA20Zep58wpMxPYGYBbfOl/7Ni5ofVIOAcnH3aUBQN+72UyJY3Xphyk6N9JohTF8ivVeiCWnrorwEd/B8xqts89g710VpiuvHAXykbImbgQdwzBCs8AYT87690STk+prMtMhSHBXr5rF4ctO+/FVglXzqVLTIFFzOsUsnJVcBGlS5GJDl5W1yefOhuwlDgHy4JY0m/FZhegaVXVNFzE78y/RatUvpDwFYKjILxPSVne9qozmUm8toROOKH1jrCsNJt/VKfjl9bJO6toB1x+X1ysyEIJbt8xWwx4XVokmBJxCuoSZzuwGhI57H9wcB+MVm/i9Mrr5SjvG3VtdqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/yAtIAAbyLyYdR60pWwZ6LHNolGGGfnoTfFLcnKZg7Y=;
 b=CHAIks0bYbHf3jcr2SMixIEnYU7apTYT2s0LtWdeO8+R7N9hhY8uWjFh/c4z58b4TqwmCbA+WEfqAbH/7l/3KPEqlwY8MrBOxP1katzCsL2A3mLnLwhYj/OAp9KWvvi0O7QUYscy3121LtjvmpxOYmnXEcB1WHA/f8XFE4uuUwE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB8864.jpnprd01.prod.outlook.com
 (2603:1096:604:15d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 01:38:08 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:38:08 +0000
Message-ID: <87a5a9a3k0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 129/157] ASoC: samsung: speyside: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:38:07 +0000
X-ClientProxiedBy: TYCP286CA0083.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB8864:EE_
X-MS-Office365-Filtering-Correlation-Id: d0beb36a-518e-415f-9a3c-08dd560638d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OWceakglcRtuCKbb0lpcOhMVb6aWfZHaDOzee2MM2NzS64ac/YXM2VaEgFHl?=
 =?us-ascii?Q?36aW1uqF9MkKE6pz07EuXQWe8TFv5fZ5h5DDoY80kUVuASIxzyo2asiM18r6?=
 =?us-ascii?Q?hvJYy20saU/Qjuqe7Q/b9gKywxFyrmrkyDUkJun7ngQU7NevDYqUNc5zY/sr?=
 =?us-ascii?Q?pdlO2PTLiYg6qJeVnH7YuO/20QqK98bH///a8VLgBkBQ3OlrCRC42WK++LAC?=
 =?us-ascii?Q?rQvxKRlh8eTZGbeSwvZxz3rrmZrLCsrOIYNVhdhRhbKRTPzI1oNuxRphsImu?=
 =?us-ascii?Q?qwuLtfnghON5WqaY/JmVHy8RXoU6PYt9aSUFc1a6x3UeKpW4l28BOxb4zK8z?=
 =?us-ascii?Q?3NRrqSkauIrlqTwZ7hWf5wWeP1RnrcoCbkvfOpW9kAi7+1lOq7rjZG8scBvH?=
 =?us-ascii?Q?ga4dvCrHz4m+M/GF0CXqeKVWrN22/tkMU7VI8BYfaL+NlTtXWDNgEvz3h/NJ?=
 =?us-ascii?Q?JSuWB4tf2uPtj5aq6a9Ho07GRpZl0BCOBsm+5DKW5VBx7kp5XSCBWkQKS6YQ?=
 =?us-ascii?Q?jroHtox9V+wSQjWrDi7dsU8YCoTgbmFmTDQBYDypPPlA95GfsGDDgh7pTYdz?=
 =?us-ascii?Q?wpqcwK3haY8kLRfnNJDj2voN0XQ4FTMjqZz9jgLYuwzd7+F8qqIZyGwzn/sE?=
 =?us-ascii?Q?Afd0MiKyjeTk8v7YnWeCv9sXJY2wRSbJKu8jikYpnCCn/Ref078YwAmDjD6Z?=
 =?us-ascii?Q?l4ffHho1zYRfY3fWPf1w77LaAYCqvAN/Eg5XX9VhgYd79a//14UdOsGWdCTD?=
 =?us-ascii?Q?N9e0YAW0T/hIqtLBIGTS58rG2QMle0NO1QRU3JEQInjMzIM1o+3qBURgryXQ?=
 =?us-ascii?Q?4/5pQTNL9Ki9r5OlJ6CHHK24gV0S/Qhidr34mGSsXenIffTJVowoYLkohV99?=
 =?us-ascii?Q?eyEXGZ1VJ2nLGyfaEwjVgh9Q3AMAQpjeH/ewt7uDIHyIBR62T2mcLJcAefVR?=
 =?us-ascii?Q?H23VHJy0h8dq136ocpG4RQ0z63eVzIUwG5oDgnD3509Reb3UCV8ZRP4BfHX9?=
 =?us-ascii?Q?AhYJTegqKOnlilkmfEXHuprbErxcQXLcGT2myaObFNL0hzyqaigl6ougQi5d?=
 =?us-ascii?Q?eaXesRXvNbdFqUOe03T8j5jjW1Y0VMg0fuEKCAsKOTbXMF+3ypCx6kDpPIXV?=
 =?us-ascii?Q?L6d+Ek04biIkjmqyEBGe30QdXejS3KhMQgpiC1haeKaHulEYki8e47ykw7iS?=
 =?us-ascii?Q?2TxhACAoUu+goFKqF7/U027bzLm584CfdOfzYMqG7pNPajhKo62iI1tb4bFW?=
 =?us-ascii?Q?yOqA/t9fDxddpdYOhGxjyG8nEKk+tOSD4ywmFB5T7uCdBJQlgFSdhEddzss/?=
 =?us-ascii?Q?V7BOcjfLsbXLAy66Y92/h4PVWKYsamEchjkvJHrqNHweFookZJ4Wl/89aihr?=
 =?us-ascii?Q?XbXeZBAzcZD6APLd7Wl4wrIsZFl0BnBKhWo7lQrYexFA99Lpjt7rdkTdDHGA?=
 =?us-ascii?Q?JuYl4PX6P0glTCfTj8o7Qgmn1vaAOWXW?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jKOvPPy+i+WQju8zL/Xq0GEng7cPIx8Bs3UlUWlyEU9DUM0pe+yCy9c9EUmj?=
 =?us-ascii?Q?APIn1YwOhrtdKOlE0yQEuz273UMItnNEREcgUllt/wHAjPW2QoWyVvEDYT1v?=
 =?us-ascii?Q?Rf9ndJwpHMLQXflzThvA4Qi1dF3Lgs7SDQCJI6G2gvpb23aCrgCn+W0hgXlj?=
 =?us-ascii?Q?IOjyXVvlHgGnsXcZTuCgjVM7rJnvL7AOuZCzpi02zwjV6l1yk53RzjZN0W3X?=
 =?us-ascii?Q?mMaqQyEmrLbVCI7yxmr9CCT6GUNZgrVBKrfXcVM4TUhe463KPiTmBUs0GHTn?=
 =?us-ascii?Q?XAkXUgb1+2FgrwZ2dNfT102ioxgi1lh9pOLfiLOmqge/NtMZZ0vdFC2WBq/b?=
 =?us-ascii?Q?wJPaapTc2WORY1MTE0tK/GrbSAKwV2m/wMnyOZaaG4nqlhfZxVHqPYH2DeOa?=
 =?us-ascii?Q?KA9X+mYTk91C+2IyV7rf+RcsbkJNbeVVtPVf0DIZnlm6OTmNyIxJh2hCPM04?=
 =?us-ascii?Q?wmBtyL3syy6CVGoH+rzqStS/o7kL9BSNzIwYTVBUwV1kRTuHznszRA9imr0p?=
 =?us-ascii?Q?Tmp+w3Wr1FbsERdz3C7taQCZRI10AymLkuQkAafJw8xKB6SuVnaRH/c1IQg8?=
 =?us-ascii?Q?wgATtpZaqt2HMERv8zO4nR9qFz/Rm4wqOMIhDCnI/UmrSgb0nbvGJPBv+zgA?=
 =?us-ascii?Q?oxtepcDf+BVcZVt9WoQhoblbusrxtOoYS4dNZK0Nc9rz4rFPGuaaLc+5x/Vt?=
 =?us-ascii?Q?IMqQ1VuxwX42SokVQ3tg2htjp4cHOjnft6xp//X9GcfB/JuRj8ekffmCl2yP?=
 =?us-ascii?Q?4uVYCttc81j9YmN9T6XSpR39GPbWqlSOVCLyJZytrOTp7cjBZ6ZZyfbLvTsl?=
 =?us-ascii?Q?PC6m+d54PU5n1/GJQDjFpo/hjDDyNiHYSAB3fVrVLGyicVyMFi9gxEJ3VSiG?=
 =?us-ascii?Q?FuWlkexkYyfeTJK8qu3tcxUPnjokdiTCg2flWU4iiWxf+feEBaHDhPW1y6OY?=
 =?us-ascii?Q?gyyWKe3ymN16u6lRW87srU01/vD95zsGPUqLtCOfv1gjdkarey6eWojRzj7h?=
 =?us-ascii?Q?ZDtxzrw7qrFlPpsxUiQQwcnpQRGnUF2VWe5gFhb97LE9Ajt0qIMbxLYPGT1d?=
 =?us-ascii?Q?ID/KRKaniRa23AIBxEFJUJf4jANtgewetc1+95MjQWbUKpILtRvHhXtw9Wqr?=
 =?us-ascii?Q?SbSXOiTsnP+iyXTMU4G2JciJNS1q3zYqGz5YhRCooRmDSy2FApJbaA1gN0vI?=
 =?us-ascii?Q?rl3SD/qRnZXDqJAxw8HTMm2Ca4dmPJFRDOLCoO3TYi+JGl5PtheuYBkaTZWU?=
 =?us-ascii?Q?TauXv5085GpdlVUHHdnJ912WCM6lDuP7Z6+nD7TnQssCl8nS3C0YIjl9gk3E?=
 =?us-ascii?Q?qEDEFvnlwckMKNPFG6DeCz6/EIZhFwiuXJv0TDAi+5AajJ8OfHfTHIHetOih?=
 =?us-ascii?Q?n6oPUKoLx6IIvYu9J5QixURNrrpGqJ2q6ImnwR2sbI+Sf3CmqaHCbrdt65hd?=
 =?us-ascii?Q?6yZY8EaNUJwes2F2jcfpCjkmVkrupu2VppoPHra9876+TOH/k3XJ0hhT76zR?=
 =?us-ascii?Q?B08YDkKKxcvUMfZnCBLxYpbjGHfWROJVmDPYCGl7ZQSRG+wrKm1wvc3ihbEG?=
 =?us-ascii?Q?Anc4Tsk/Kmz6igmpgfTh2Rr3kb6KO4oMaC2A79+HlPAkEESxzccyBJ3YRu9X?=
 =?us-ascii?Q?na69sZHkc6JgOOIlY0gbPZY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0beb36a-518e-415f-9a3c-08dd560638d3
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:38:08.0859
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UQ2MK3udaSFyrgSvFkbgpK5J5cNLCfPK6OjddqowRbyFFgaP30ifeVvjhrYK3eBgVf3QXjjyLFZNxxRUMYEa7dtUFFAotsnBPrvrWwFy62kVc4i47YsHoYpetIrLcJp+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8864

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/samsung/speyside.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/samsung/speyside.c b/sound/soc/samsung/speyside.c
index 79476e8eb680..64d3e4ea66b0 100644
--- a/sound/soc/samsung/speyside.c
+++ b/sound/soc/samsung/speyside.c
@@ -210,7 +210,7 @@ static struct snd_soc_dai_link speyside_dai[] = {
 		.stream_name = "CPU-DSP",
 		.init = speyside_wm0010_init,
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
-				| SND_SOC_DAIFMT_CBM_CFM,
+				| SND_SOC_DAIFMT_CBP_CFP,
 		SND_SOC_DAILINK_REG(cpu_dsp),
 	},
 	{
@@ -218,7 +218,7 @@ static struct snd_soc_dai_link speyside_dai[] = {
 		.stream_name = "DSP-CODEC",
 		.init = speyside_wm8996_init,
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
-				| SND_SOC_DAIFMT_CBM_CFM,
+				| SND_SOC_DAIFMT_CBP_CFP,
 		.c2c_params = &dsp_codec_params,
 		.num_c2c_params = 1,
 		.ignore_suspend = 1,
@@ -228,7 +228,7 @@ static struct snd_soc_dai_link speyside_dai[] = {
 		.name = "Baseband",
 		.stream_name = "Baseband",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
-				| SND_SOC_DAIFMT_CBM_CFM,
+				| SND_SOC_DAIFMT_CBP_CFP,
 		.ignore_suspend = 1,
 		SND_SOC_DAILINK_REG(baseband),
 	},
-- 
2.43.0

