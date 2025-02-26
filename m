Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011047.outbound.protection.outlook.com [52.101.125.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0585F14B06C
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533476; cv=fail; b=DoojY4PmWIyIszvDrnc8eT9Kfnz0s7sedfZG/NqLfuRety6Pr27O0HGcxXhOHriibhyizVcyaYLAh1BAL6R77KXAV3e/QIRyC6rx7sY5vzFlZfeh3EmeI2yVRWuJn9Xn948Pvyrk+Md0xUXse7gRbTzJtxKuE9X6/IC0/aNfSDc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533476; c=relaxed/simple;
	bh=HqG6fCvu8ZzrFz5zCuSEI5RAXsAXxy4KeGNYA5R1kP4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=TqLKvGwi06iaosNG6kH0S8GCJPi4d2eI1kKKL/EyONPnFpKKKExbLYhInNNdzlj2eQUYZUM5K3VoDBg9qKWEBuN/HiQ3aqC9qKBQRID0vfZfp72wXiHt1igxzl7+qlYa0TRZ5NoNRrabbINrCl//vfEzz9ua+8SXlsRNW8TWiUw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=NRN4qFPo; arc=fail smtp.client-ip=52.101.125.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="NRN4qFPo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CA+kJhSDWZEyXqX+CVUMqi7J4iVtrfHT5gbEz1t1qvYvDN4inN6A8Jd34olDVOvd4BNdylwwFG2pVYUIALLCYpBFDqaUy7OWy1tFSIyIpynnuVJvp1QlI12Lv8eRGXqugZgsAvM8UN/Mt3OBK1ke1YDWmYkKS9WrYDJU4KI3fmIojt73+dJJyzuj/d0QN/+MDJ1sgRSTcyAu8HCoDX9oERdCiX0/q2+TIdj+AgWq8vH85ZAzHkcrypW03zHCPKiE+xWrhHwHOcvIcW2Y0AohzJQ+sYWptv51qWwD7buBAYf3NmSxR8S366yzAaNjSr+rEn7yrGWURDfG+JNQLpDDDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lU8sHo+7M4Kub/0eRJ6YqeSno+BOmS8vGa+ryQo9Ec0=;
 b=k/mcoQ3MGp6naggcO4fKl0YaeBMLeP2YtabLVGwJWiNkbXtop8qEan+OSKQwHKweMImlzTdUUvUj5ZtEnZn5plBOjdRa9/JJFCNfHXGiAzMTwRGbkFwy/ncOfF52bjW+265a/0U1HSp/orvJnkl+P3U1Z8knVFDDbXGHR0YdfxZRTomdnsxLMs6pyKqK317F8jcqw6UOt7mDoKi6sCneyLHubEc1nMtcSNOF793+WxU/2Z+loC7qhlkR+L9I6y18Sb0iYpcBbli1Wpog6oEtGsvLFeJe7i7+kINz2Blu5aLjgmnM5zylMhAUQrIq2TUYpV7i3uD/qL845TptNfMpVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lU8sHo+7M4Kub/0eRJ6YqeSno+BOmS8vGa+ryQo9Ec0=;
 b=NRN4qFPoeZnWbGFaJQw3ZlqcoeuKm/+syqpxzz7P2thyIbWP+NTPVtsR70mDoTslVN2UMt2bO5XjIV64Vkz7dxwTzeT6jjWgGGlwl8jarpAT80vdkIldPfepiHZloCNuffrbZrOTo8kLKnVmT5WnAoaWIEQZSgwIUj49RDH14HQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY7PR01MB14457.jpnprd01.prod.outlook.com
 (2603:1096:405:240::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Wed, 26 Feb
 2025 01:31:13 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:31:13 +0000
Message-ID: <87o6ypfq5a.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 019/157] ASoC: codec: cs4341: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:31:13 +0000
X-ClientProxiedBy: TYCP286CA0180.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY7PR01MB14457:EE_
X-MS-Office365-Filtering-Correlation-Id: 960dc978-f044-4a22-7160-08dd560541a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JoM35HwfzWuQf9+YKR8U16LmMWb9vipH2qOpqzDfcJWYGBMaxNRJzsqInhAt?=
 =?us-ascii?Q?qyFSLUAqUF8GGyJi2MZriWQsMVLiXl7eiWnkqGsEoVVfbA/CpzCYtvPshgwT?=
 =?us-ascii?Q?SZq6LHAgjOiwnRHm2vejidSwsx6NvN9+SKcY07brYjB3xN9kGe/VMmaOqHzp?=
 =?us-ascii?Q?VdR+8Ub4SpQv7b94ywcS2AGm19TkOm89uSbaIEMVSpexhpuYBVXPJkuZTqxG?=
 =?us-ascii?Q?Dd+WjmpqMdJkGUSmhtSYDj5pobM5QsY6QN1RjcNIo6cmI+SqLdR3GP1HOrkN?=
 =?us-ascii?Q?YJTnF3OiFsS1eZ7G4UmKr1LzxcIgbjmACnr5H+589OANjK8+F/Lx+K2ShO/6?=
 =?us-ascii?Q?ZbhmCoMMcmyI86/inCfw+vMnm6/AxBLMpwQI4hkcSkYRKHnQtQOLqx24tQOH?=
 =?us-ascii?Q?0O5R3YINjAwpV1DaBQSfBUBYMilLHyBlR5Z0TdAHTBR6ixs83BpLfW6+PDTA?=
 =?us-ascii?Q?LCzhxTDaQc2Q8WfZpAH8TXZu2cfIMo0JeBj44GZ/hgBdt8ByCB3uIGqoUpST?=
 =?us-ascii?Q?SIffdi7peYFc79/XjZGRjnmLj7l1Z3yJnieypRLRAsOwyPdtCkVDK1LX4mrM?=
 =?us-ascii?Q?HCXw5XCT5HjwsOF55FTajz/L1GYmIuRElivyrQOAv8ZT1dvDF+YmqWB14fNs?=
 =?us-ascii?Q?59iaUGFMRa8laTs9EtmvgcNWWDg20bxRgJYHsGqJTkdc9beZ0PPH2L6BCY0S?=
 =?us-ascii?Q?MC9bp8QPJMVTu9Yb7Tnwkz2XWAMvGokjMLoSpoGnF850ZUUYzO5vVvzg91q6?=
 =?us-ascii?Q?DPyCo3Vpw0JRbf9YL9m80j2C6MysqzfUd8Vit1YChgriXH9+6MiuJRTPxyXF?=
 =?us-ascii?Q?dd+XoCNswYKH46tbICCfGhqDpVXg2+P/OR9bqDYarVLbUe4vdLCtT4Nrl9TO?=
 =?us-ascii?Q?eY1ymwg03E36dwq1mliaVCoe6//urXFI7UJu8esXIjbBaDxmeYoPGlBhQvBf?=
 =?us-ascii?Q?Hn1OxDxgu5cL+WZn29FcUVEB0kCaAQ1Ve3PWqPlxfbrTD4KmAMEV6CKjqMs5?=
 =?us-ascii?Q?Rxik+ACsecuCq1urixS/731J4G+lrOMsUNYLMy1j/Nupl2/RFfLEm7EGjd/1?=
 =?us-ascii?Q?EI4HVthy9Oof9HNnNHHklqURD49ya1Lv6HYfdLldzv0gKLIGxyR8QcHsGvFe?=
 =?us-ascii?Q?iI/MClbte5LHr+OSRenHTfxo1ph2oQsSNPig9MLgpODobqdBFhLh6aGN6e9/?=
 =?us-ascii?Q?tmDxVWscxtcWS8uFlRCZmTSv5tzWCeuUrVeYwC8oGkGa/SwD3BkCA2e8Odjs?=
 =?us-ascii?Q?CLNmipVwQ/s0UVHZrLbiVyNXnwknEgvXDsGrGVAHwHjm3WauBtr2DTtKG8vp?=
 =?us-ascii?Q?MChfCkRe9BOGkJGxuhR2T/dhEUG/1noQlw6RWAHcz4/DHyFglQVrIf7Saaql?=
 =?us-ascii?Q?DxfknMeto7sDZMbbwXEKLUY+efFNcVUti2hBfW0ytMYkEQ6VuegCpH189+4/?=
 =?us-ascii?Q?+YpySea4KuP0aTU4oLTOhaKQE7bwvvMd?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Qwxx3vBtgKr4AwhrQC55XmY0+wFRu1Ex0gCAOZ44XUdrvCRLkaJW8UHR9etu?=
 =?us-ascii?Q?xAtLD/5U9l1etVOhs8564opjwN5nbWQ+IhsXuMi2cszJHb+vjoY4aABusKZJ?=
 =?us-ascii?Q?9ORlHkbfkqb8Bl//ASAKF4joEc+1ZA/G5fyr9BqgkjAIp9C2h80qbP+41Nn2?=
 =?us-ascii?Q?euhHvL3D0kE/8xa/6OXsb/f6jmrqa8Z7vd6RqsL2YWt64/xguiWfHIeNhMeF?=
 =?us-ascii?Q?pqiVgR8cEusSUjs/79xMhWBqjqByghjJzuZ3vUAg/iQTLKsht1UIV8jpGnre?=
 =?us-ascii?Q?jsPyDcmTQ7jpspSUbnCWNHJpwY+a9IXQZtV1hZ++h3k8PVd1DqAU8QhM68je?=
 =?us-ascii?Q?3BKtqekHYa3Mfqe/m5LSidoDQP4/Zv/HpXwvF/SOnKfyZK2qGQ27gpFO28z+?=
 =?us-ascii?Q?LhQczAatEsD4SMMgsuDRKItMZb6xdncqn/f/UbqAhoOsa44P/uJ6gw12QFQq?=
 =?us-ascii?Q?WpwkTEmyM2u9nfIPnBzXLng4E3NGLAP59DKRlO7xAD3zyQYCVIY0WWhgt33y?=
 =?us-ascii?Q?bhrV2N/zc6gCfddwD4d8SF5wAr43sMDEGlYo00HUrTaFv4UjhoIQmfhzHXHd?=
 =?us-ascii?Q?ho2LfQHjWdjof4gTMssRRqM+z1Qv9kRBvhheQ/kfJbJgKSu4nsd9YsP+zZ7W?=
 =?us-ascii?Q?YiYosLnAEsHDnCz3CS9RbEgQKyAd6tdZ64g3QIIkjoM9fG8p7/emMhy3wZyX?=
 =?us-ascii?Q?8bphDg1um8/DIHDXZkJvO98fSP35ccl4yzAU6NYcb3VEdK3zzSdn6MOGAbtV?=
 =?us-ascii?Q?g5rdWzOpOVrjrMLx9IRDSh89lWUBBeELYv0RxlLejWWmX1hUdTBZbxaerGnw?=
 =?us-ascii?Q?rKrh13RofUbWrcjx437fHbDWw0W8XqTYbxX8uzRNKMecDx4ue3BqVPBwWTrE?=
 =?us-ascii?Q?Ro7LHSMOiZ6D5WCg9Y1IZ5dMN5eKXJuBODa89mUJvixVelgSl6xgLFjicQ8X?=
 =?us-ascii?Q?/UE50Rq7SuUQt44exUyu4imHUWleSIgo3AvCfyPwQlOztdyz16q0tDRrDcAp?=
 =?us-ascii?Q?LKHZSv3c7MMfIO4BEEkW5vIfByJePOCmdCwECTRHYWNcjfR4+cj5BXDD/ioj?=
 =?us-ascii?Q?SOpQoFCShD0Wcpqfvb+tCteX5hOv1K+9pxP8NSX7fNjrNd95LCbcgXSulAVK?=
 =?us-ascii?Q?re2FcfI0TCL7ckO5m9IwjRljf1dks9GqAVdWeS0fbaj6i8DbowqmcXARiK1R?=
 =?us-ascii?Q?cW4Qg9Wkebw/Qvvu8otHNssnahe3xXpbTC/mPOWxeh2zTYM2hb909Ew1qQMg?=
 =?us-ascii?Q?akO24SuXiCrd0jlMHh9IbXE0pE7k7X3u6M9zOFshkoI/y007ekfjeMOBTxrN?=
 =?us-ascii?Q?x9AMYxLZAB53Q0JPVW2Gvq08a7P/e3sunO8vGa7odU2E+lyBY+/m1LMyxWb6?=
 =?us-ascii?Q?QLEcB3Q5E/CHh5VwRMxt073z/zD2uw/7PL7pMdHVAZM+plpFfUWi4tRhbmel?=
 =?us-ascii?Q?X2XV/rYA6QXuD0xASC7jRR8assS7DHsEaa393jveklLmWVLGKkeln8IZ0qLS?=
 =?us-ascii?Q?/cCgKGlCGv5wZ70jGMgm7ghfwU7KGxNx4ygiVooDGtGw/EWQL/z7+KctVaqD?=
 =?us-ascii?Q?yjMe4LAleeDohkNZFjfFwWfa/QauYPGNwX1ZVmT5amVW1UduGJr2Y6yjRFuo?=
 =?us-ascii?Q?bFCzXeYHiseMrhX6XZpaz+E=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 960dc978-f044-4a22-7160-08dd560541a3
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:31:13.4022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6qArkR1Iu/5F6+19cwOCwBwaRn2MAz5k/RC/sVn2hXQXaQUH8qyJmCvoh+z2pa04cFONtuAasKFbcTYih+xvAd/oIFu0Hy3P+4f+BEJEezatvT2kpKONhlOaCO0IjlTy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB14457

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/cs4341.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs4341.c b/sound/soc/codecs/cs4341.c
index d87aae31c516..b726e22ef57d 100644
--- a/sound/soc/codecs/cs4341.c
+++ b/sound/soc/codecs/cs4341.c
@@ -49,7 +49,7 @@ static int cs4341_set_fmt(struct snd_soc_dai *dai, unsigned int format)
 	struct cs4341_priv *cs4341 = snd_soc_component_get_drvdata(component);
 
 	switch (format & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		break;
 	default:
 		return -EINVAL;
-- 
2.43.0

