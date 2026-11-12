Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794463300;
	b=5bJwtdliLAycqgGeM9Q3JiajDN4xLSCG267pilrOJUroaz/7jqA9+UHDMxfp1xWuL8tG
	 K+8+ySBXUQ7Et9h+skyn1FZKPtwKFaUiAJT2nvCeE6MVMG1IbkBFB7rgojQMF4QmsTMmE
	 OGUx9D1CXSJJy/csFIxMRBMId7Fh35bfUdbppk1p6VQdnhNk7S6+VNDqVtKYSdWHDOK4k
	 l2n/j+WJ/psUNIadaweS5Sjpi6VzyJnIfmoHKp3T/Mc36HjxqOIz7RHNtWW6qLVeQji3h
	 y7+ThGI14+Bm/iAG5HtkHkeX3KvGe1mgIU4OUefz0Em1LCfuyqU+GX4MmGzMZ/mypyA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794463300;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:From:
	 Subject:User-Agent:To:Cc:In-Reply-To:References:Content-Type:Date:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=lC8ytEOHoUbgzcAIGblQ0chakm8I1dP5yNyjzJw0Tx0=;
	b=urIn2QKtRMc5h7+c57cySWJiuWbFhOKn6JvcyFiuyL2wjrjPZnY0KQxXmDAB4fj7KqZy
	 EbiQ+rbX0/lnxP68LcbXqEfbsGPcHnyyZYBCoLYaP0OSwCn+VPTizbZHvvPE+8jW5LJSw
	 xvm0tqno43pAABZSFR8qk7VdnT2Ua5yyj0JKMtV7LTdi4r6zQsZimihU8jXsoaPANvKXg
	 5PuCZUFvQr0MKSNyQO06dcx+nD4s9s7gTOyP+RhZzV7u7hdePyS0j/aH2t0wITI6DoB9y
	 sVOlbroIO8ZUdOpdXMblVFvZk5SIMlFB3/lQxN7WTIqB/QfewMRqetD98XF0xMeQjng==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=fLflgFjY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.53
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011053.outbound.protection.outlook.com [40.107.74.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B76606A31C
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 06:01:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5B76606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=fLflgFjY
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nlY0dbakqYCcDjzV48Cw7z9pWt5COepgcq3neAg4GxeoxdmItHY5osI1mjdWR9QrQmmfYXznNV229/CmkOYvjv7YJcahOO128oSs1i+/0/XDm+Q0sbYgQRNhcaJgMQuU6de6ZlMP7gP7NXaVEnU87PBQFb4/OU4/ny+OBCaAMFxj03bL2EBSv839FF0FE5MM3CBgWgDsGpI8FFEfVaGfNhr5QCYJH0ci1k9PwFKYyFZAh26Ui4CHSJSspggqSE/PQiWnYzkR01WxWKh7+2xLyE0wCMoNOCoWuuHwL9595TGX7hoEM9ecJmdm0PL2zrqwzqterO5CRlSpqCXCqm/WMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lC8ytEOHoUbgzcAIGblQ0chakm8I1dP5yNyjzJw0Tx0=;
 b=a/KJAbxI/mWtSuzUMQf5XCYu0NbkyVXbqoiPvMuU6dTwh9D4xKRrqS9R7ecS6rxdabT6iUSQQ5lPojHs6cc/eYIoT3WvwnwRyE/D9HCwOFffuhMdaBptZgOQpvVacqsQhIvbupNW70ZhKLScRS+FSqw5aOvtEZZqdNsw8xwZnhN/nM7yu+OqRwKs2HrT1xTv2cgh3jxz51hpUBHVbuCMfyfk9WWu4ruplVGsAUoTiEvrmDNH1FSplzEbKx8sAu6+HCKML+TcNTFNDuWg1otMM/pPr2HKpcdu0jXGuppkGEUIi33WRwNBD3a8VZIcg7mXHhYAuJJUmwumJFHRP+QuRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lC8ytEOHoUbgzcAIGblQ0chakm8I1dP5yNyjzJw0Tx0=;
 b=fLflgFjYaw+99/igBP6FlloZEznsBjLyTkzywRhv9fmFMVfYG5v+zKS5nK3us5sWwC8//NF7bNiYOZFhs4OKOK9+HGDTNx3g2NWPi7uexL80lASV53rpQXnFaTv4D/nKwT2FqAWksYRrg7NZ0l1+o4tD7fySBtu9HtkThiy/NGg=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com (2603:1096:405:27d::8)
 by TY3PR01MB11298.jpnprd01.prod.outlook.com (2603:1096:400:3d0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Thu, 12 Nov
 2026 06:01:38 +0000
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d]) by TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d%6]) with mapi id 15.21.0615.008; Thu, 12 Nov 2026
 06:01:38 +0000
Message-ID: <87fqx6ziyn.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/3] ASoC: mediatek: mt8173-afe-pcm: use snd_soc_register_component()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87h5hmzizi.wl-kuninori.morimoto.gx@renesas.com>
References: <87h5hmzizi.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 12 Nov 2026 06:01:37 +0000
X-ClientProxiedBy: OS7PR01CA0312.jpnprd01.prod.outlook.com
 (2603:1096:604:26f::10) To TYYPR01MB15175.jpnprd01.prod.outlook.com
 (2603:1096:405:27d::8)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB15175:EE_|TY3PR01MB11298:EE_
X-MS-Office365-Filtering-Correlation-Id: 982681e4-4a0d-4c49-88d8-08df408269c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|52116014|366016|38350700014|10067099003|11063799006|56012099006|261022105027099003|261028144727099003|261026140227099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	C8A7NwSOgtbhQT83F8GmY7fpZyvoerVfU7syLrGwsAUkVtcW5jajMldyskzeZU6X8nTgw3bvxTtN2ibgZVvUN4O7L76dBaRLB3m14YUk0/zdpxnrfKFwSJkKLnnrT3rg5qkXzghwjF7xDd8obFebvHd556maNVYSzb+oqOquG0gO34+Zhv4/q1NUxjnZY83YYQdbEXaHh9iwcxhIFe7TPnA5WmVUv8bpTF4NFlij868JhOy0h6BFDbja8hLwjA4NCbhMwXv5w+etK0MlnVAVhyWTO5zO1ojTrfrAW3NbWlGf3fvKvNaWufZZSLUzKql0VVyBiD0zon3swpxhT5/vgDMwEuRX8aYBLm5vcbY7q3EkclvnQpBY7t/dS2WA9J/u+WHRxz75UdSLyKwd8YpmoXCdvse6KAeftAxZuBULDL7CkTxTHminq+udF+cX2uHBCOOFk+EQFQT6Koj+dvOS7+/UyRVKAUabIqK6PNGwtF6yv+2b3SoLFgpe3xRIxbKhkkwQ0y0G71NmiVqPznu/Whrcy5BKZLngpc7HyjreJq/UG0GSBjW6fbCoFRRJgnRZKJtDFcgS6PMF0YK8ignEmUTltb11294f5jj7dRRLuoydLOMIGgmTEByTHu4W/4avEVh403Rj5oCFCYM7OS5vPUZLuszP8zD3zzidxaF8h1qskGIIpfL0J6DoUTkCeyW2qpLhEa9QBufPfD9e1V5TFw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15175.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(52116014)(366016)(38350700014)(10067099003)(11063799006)(56012099006)(261022105027099003)(261028144727099003)(261026140227099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?173Ym1i5HtW43En6Q3sV6eNiKG1GO0XGryCOOFNFZKU1bJsKeoBel3NYvUUd?=
 =?us-ascii?Q?oH52H8S6ttziop82KBH/qH2E9/MEBMSESnWg1p0uLnvRwn0At/FLzMkQTl+y?=
 =?us-ascii?Q?HJfMHrTO9/IeEn59C/0A94qKxu5RDjowa1tVSH4VT0KAISbdNdO1Nfd/ayXK?=
 =?us-ascii?Q?j2zfZ+CH385FwKmwgFjA0Mxbf4U73JyV+0ZB/obsWK/U0Ocv0nfrpe2IFRyG?=
 =?us-ascii?Q?KfeA8y18RNPpl08ciNYi1iWvvz1owO5nu0e01xr29oOxjqwsNNmoMtlzA21p?=
 =?us-ascii?Q?koAX62qvOm7TNiYD1sWMS6rD6aCpYd4MPJxAvOWi5yMGWAudNNfh7rnH/8UV?=
 =?us-ascii?Q?uert8omjUyc9FDBHDhjvT2nNB5E1CrgSB3yvYNw7SYk3WurmMsvF9gdNMbSc?=
 =?us-ascii?Q?CyGC8RDv4kxrRDKgkI/Gukq5qgj623YZhLjYWHU8dNorhs1A53aMXGrpYY5p?=
 =?us-ascii?Q?WGwkimlmFzDC47gz1kFIkadz5Cxu4jpY4Bx0m5OnPZjwQPOcVBnr1hOm9HEJ?=
 =?us-ascii?Q?Ki6zVS8qO/kubdE39YxdZgl2S6URlQ2QnPgKWU8x9IcinmaJV2nbgTBvMrvx?=
 =?us-ascii?Q?+msjdh6HFq5ssXPnl5Fl2fIqSIdbutFhbRIjSdc/Xq8T7la7Hump7T/bvu2L?=
 =?us-ascii?Q?WoV3EM4CdGP2Ddd4vpCCFirxrSMIN01muzHqVkeF4xEXPxA9qf7nrOvGEWI1?=
 =?us-ascii?Q?rHXDgCVl8RGwhH/krgfjcGK4sSoEy1phtAzSdsavHTpxJNZr12natyq8KTxq?=
 =?us-ascii?Q?cS/Qafp6Z/4LVvOZcFshZkLzJInpCe9cquK2uIIcIxmS8+CSPsXpBU1mylk+?=
 =?us-ascii?Q?6LHHGyLkDfmZMNmtOuuRavGy9xjkOzykgvd1GirgpaLP8R1FILOxZ36enpf7?=
 =?us-ascii?Q?SE6Rr87j/PP7AurAqnw284VMCX8Ae+2dtXTO4x4pBQAmnIEZAMYXGjUsGvMK?=
 =?us-ascii?Q?he53wCbP3TRKCkvjPtkz3Mb3U2q/6FTe+BCKjocttnOIb7Vp/8fRPAUBGmpQ?=
 =?us-ascii?Q?PF+v5boYlR9Grd4iCNl5P+skw7N3fIdxNV05LH2DJF7v4ipB6HzMMJvdbrJI?=
 =?us-ascii?Q?cQhJ6HCfCmzPagbObDQCb3MEM40jrFDfex3yzuI7o2LSVjovGdT6S3Q9rupB?=
 =?us-ascii?Q?hrwoHzLWWA24DJhBockDzU8nSEm8xMGXbWFRsFq00ez1FmapEFMgcVFUN1sS?=
 =?us-ascii?Q?CeXbAe4VAfs21N91FLX/DcUpvI4cL5tJUWm38DBmf/eYJ01szHTY6d2OYHDz?=
 =?us-ascii?Q?8pE14T5g/fNC6auDFmTwAxybUuQhjHfP96joCZM4qbVQo4ztq4pVZUlM4hpF?=
 =?us-ascii?Q?s1zO1JIGYWVQJpQrCyHICsil1AnXMEab9Cjn0b0cyHyS5Lrv3I8IdEBdWTsw?=
 =?us-ascii?Q?+tUrF1k30W0e/pxr9pbpQXazdtjheNWgx9TNwxBbW8Rsu8NZky5dPnVrW8mW?=
 =?us-ascii?Q?p5jRqHXthSzHpF9aIzm5bEtBKt//OWkg+98ponomb4U2s8XuWH7BIZd5V2jG?=
 =?us-ascii?Q?MgF7Bb5fkwCwLr7yaEjW+w5Q4kngYQZ4HKz5FAj/CpRRnsuQSnjgImBRj+SB?=
 =?us-ascii?Q?GITxOHMc4l7gKSjY9UPe/wh6vyWzShZ7kuo9+NvijD5jtwnjtJgegpg0fbHZ?=
 =?us-ascii?Q?PUTH54JeLL3kYRV7kPNfFiR2gJ9j+FZP+kzERevlTcPCPpToxOvQ2crPG3Jb?=
 =?us-ascii?Q?d8svR2Q6vjWOHkhfq69k9g0hm26g5wIOdhRmujSS2n4twUCGCubsQ9BypcuO?=
 =?us-ascii?Q?HUnXrOne5fNq6DHFZPO2sSSLwGITj0zerPvpnWgze/lXL2FC9Rwm?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 982681e4-4a0d-4c49-88d8-08df408269c3
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15175.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 06:01:37.5852
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PG2hHJJZdLnvk7jEdBLaNkTcHzFmz8Q8pHfHy0OfhW0PRTMODPZ+vbFzYNlaH9EV8R6Zn44RFkrFAhZeb/ELxGZNvtfjhzQG+ysOji1w67Jsu0qLK/DB149FuDqvk2sN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11298

commit 0cac8e35132fe ("ASoC: mediatek: mt8173-afe-pcm: set debugfs_prefix
via Component driver") replace (A) to (B).

(A)	- snd_soc_component_initialize()
(A)	- snd_soc_add_component()
(B)	+ snd_soc_register_component()

This driver registers total 3 components, and 1st one is using devm_
version. But in the same time, it calls unregister() for 2nd/3rd component
when error or remove. Since the order of operations matters for error /
.remove(), we will use non devm_ register for all components. It calls
unregister(dev) once then, but it will removes all dev related components,
so it is no problem.

Fixes: 0cac8e35132fe ("ASoC: mediatek: mt8173-afe-pcm: set debugfs_prefix via Component driver")
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
index c95699f841910..e0563bf23e3ab 100644
--- a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
+++ b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
@@ -1133,8 +1133,7 @@ static int mt8173_afe_pcm_dev_probe(struct platform_device *pdev)
 	afe->runtime_resume = mt8173_afe_runtime_resume;
 	afe->runtime_suspend = mt8173_afe_runtime_suspend;
 
-	ret = devm_snd_soc_register_component(dev, &mtk_afe_pcm_platform,
-					      NULL, 0);
+	ret = snd_soc_register_component(dev, &mtk_afe_pcm_platform, NULL, 0);
 	if (ret)
 		goto err_pm_disable;
 
@@ -1142,7 +1141,7 @@ static int mt8173_afe_pcm_dev_probe(struct platform_device *pdev)
 				    mt8173_afe_pcm_dais,
 				    ARRAY_SIZE(mt8173_afe_pcm_dais));
 	if (ret)
-		goto err_pm_disable;
+		goto err_cleanup_components;
 
 	ret = snd_soc_register_component(dev, &mt8173_afe_hdmi_dai_component,
 				    mt8173_afe_hdmi_dais,
-- 
2.53.0

