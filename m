Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011047.outbound.protection.outlook.com [52.101.125.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BBDD18DB1F
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533558; cv=fail; b=SEnuAo1WSqx2LL6jZd36QTZ5ZgdXkiGO5d9yfZaLcmLX7RGBMIqZdygHov2luCvLs0AF3NhW+wgSm/jHy1sGpjZHWBwcWk2ow8IasYTSt7wG3qyuCPrLKMUvs1DKdUCbZK3ySkSQS0GpcIOMn5KLhryiPjx/EaLaCqe59ew3utA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533558; c=relaxed/simple;
	bh=+gQP5YcrlY+gePf8RBZssS/vA/ROEt8IPepIFD4Y90U=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Vf9IfS/cnUakE1HZVaRqbgTuunt8CdoUdM2BlaFE/sFwl9BfelaLt6jx6HMrCOPAJ9tRTQM09y06hRfF0HB9oGX65GnuELoRCN8WSwWEXZFcp3Q9eQDs1/SCjoAEtuHPe6laMtX70OR6ag19xMFizNHm+DKV9cJUiESk8ZmWRZE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=TSGtt/Fw; arc=fail smtp.client-ip=52.101.125.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="TSGtt/Fw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tlNWHqQ+mQKcQhA2uKGm+BrANtwpAywjKl+WB67yziOAckP/Tkrj8TLS3bT20nJiomy/BN6KQqAXYsD+8QCHoSYV/ZpofSkl/nKboskqxQWCx5jjjZNUZ4nTtd5dDmwkfj6fWahhB3DrJG2ybRaGeaka0jRq36ITJuLEQgo4SOe9wQjSGKuodm6hDFI23lrkVjHxW00m6XajIB03qldFOqrVWVUWNfjNyTjDrOUM1tcVosLvaJGHLwfSKAZPS0be9QjIAIfSx7u4Fkjd91MFPUrzqvqLK+fOljXBRj4ApYv6OTBz2eSm6jD3Ss2EkERux+u7s29WuXsHJKgQRdKLjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0xShyY4y0naQmeafR3BvpWbt+LCSEWuuoUQ83e0TQ7M=;
 b=DTJdNaihyRC9qmnXA1QlXz1/ihV1F3+btdtR7wQV6osERj4xMqLFgpLPRnrQdD4hr5ulsRz28QV8bK5s+6QnhDS/oLuYrrymnCia7bDTOierrctDMtXKUzCfiqdcotRIPuVJrmy2eH4JkGPKDclJ3knPnNGa+nt8rKz7MlKVp6nNV2fwf9AgXhmzEV2I0nQmxtvmy3VfXp2EDhKUG/3+DMwFpWeHVZSCDlBf3/+hpfALUQoBDlE8MdptzwcLmYFFHmhzRKB+Dg3NyV8nCJRn0lQF9xzUv/O20P33i2DwUCQn5Yn5XsqfuKK4hYnrimiwe7nkVpjTOchEoFNpHSe3Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0xShyY4y0naQmeafR3BvpWbt+LCSEWuuoUQ83e0TQ7M=;
 b=TSGtt/Fw6cBfI1FiL5gbgqWb3mPqYcZ5x2tfSQ2u0ci08xKNkTV8ES0tWoT2OisKLqOGXMhnLzfnq1yjjHtwyKE2QX8XWVx0fQ9Gyb+3no+MtYJPI3gZeHE0HGGzu8RqvPUutNAxRG/A13AMJ/4+weU4GXG9A8htjvaLKy+RvG8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY7PR01MB14457.jpnprd01.prod.outlook.com
 (2603:1096:405:240::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Wed, 26 Feb
 2025 01:32:36 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:32:36 +0000
Message-ID: <87v7sxebik.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 039/157] ASoC: codec: nau8822: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:32:35 +0000
X-ClientProxiedBy: TYCP301CA0083.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY7PR01MB14457:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b019d06-9081-426d-f72a-08dd560572e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IWuTw5rAxbJBlT/zt5orSW52Jz5pKjkwUwvrxs3+z9+m+j/pEYNyW9WtguqJ?=
 =?us-ascii?Q?N37T07sD5sW/UPCdvpYcORfjTXrVz0Fmj606lrvmq5dTT4zvID7kaZxz9eGb?=
 =?us-ascii?Q?Tq8mh1S/1tMCTd6OmIVhZwK64i+qMNR3FCvIGsNWkz+XKPe6mr3+wyVba9d5?=
 =?us-ascii?Q?SrAxujrW8HQaBrRX53yeiIjHnG7dRQmaToaHb8LN4N1pAoVp4kGr/zFkFVvE?=
 =?us-ascii?Q?yBkfdzKg7NmRpSzXRTcyHPys220RDzeZIpzjGGLhcThOjO8vyG1zZU7Bdp9k?=
 =?us-ascii?Q?VmNqZPGBZBwlC3nzA6C+IlcOaFuSN5SO8BHz+FgYgAboqz9BK8dflHqFz6Bn?=
 =?us-ascii?Q?1Raw7UlIkR2sJG1tmDsJEw6xg253wYty0NT1OJx/jsIWk/Ck+s6kmSBNlCih?=
 =?us-ascii?Q?D2yUUJZQ2B0cPQzxweHa0JV0qmwSq/EWo3VzQt5xfsPjXaYcL/6kT99s125m?=
 =?us-ascii?Q?HKpmuPrV7IKF8IuxPuHVmJ1ReFIVCTZnwJH+Dd4dOjMK0lKadCJKzFkhrARZ?=
 =?us-ascii?Q?shUwVBBH1tj9wbN/m5HPBZ/WR1bdHU1r/G27cHs+x9kMa/mPfwvy88RIh9KZ?=
 =?us-ascii?Q?xk+qulmzvCj7k8JeaKJ04wuQZ3bUdhxLCe7rIDfu9TY/PWhuZ7YjgMxjf/E/?=
 =?us-ascii?Q?4BpLbyESFzqChPzOhGKgeJUsGoMxzl7ggaO0/ybmkPRUfh+DbkVLhvveGfmX?=
 =?us-ascii?Q?iM+OUS41Of9GR31+Xv4AYhk1bgPMhYcchicsuLyF5ZDU5aCH0tPxfvU0DrWU?=
 =?us-ascii?Q?mNd0hOr7arfoXF7DPcp403fa1DQWRD0TMIjZY8uvliCjCWo4f/Qh2T3t3flp?=
 =?us-ascii?Q?JtgxXRHkHk6VW9aYoz1sNO7hYBOczvDoJdDMRcRAV2WQLzG1ybo3ELYexhPB?=
 =?us-ascii?Q?MlYX2FopS1bw7OKBTGQ/pVkzDovkKd83va3r2NMVu1zIhdvsJBWwCNmj12M0?=
 =?us-ascii?Q?zoYTdS571yBAOdhK9T0ZPdPZ0YadWvZ1/rLmW+IuGAJ/kTnfN3V6WfsrkJuF?=
 =?us-ascii?Q?sECW76kUKuCSL8M0PBL8tpqJz46r3BDfVxioHnrCUjTf8NfO09zON/E7/92a?=
 =?us-ascii?Q?gFoFFGmityKlF2A0RjIBcn0SZsKUFzM6IzK6Uan5W2N+vjVd79urvc8w5Du4?=
 =?us-ascii?Q?d3ONOhRtQpskpNNnfPG4w5CcckUN34Z16FvvKuYcz5HXI1JkEI7ytkZjYlBX?=
 =?us-ascii?Q?M8jZ8WV45krr9rtDYA72WaKJThmQ5SpbRuSu2af8Bodw9pTw4QrjEE6RGYuu?=
 =?us-ascii?Q?ncYQyUdQKBAbtVW7dk9wfNW+kuPv2LJEUSYJCjRgoxyBCeSmy3flr+rAQ9hk?=
 =?us-ascii?Q?3xiocHtq9d/EGmJAVRZ/Qc8gFBK7qmHNrdY876UxrTjkygrKbgseiarObQg0?=
 =?us-ascii?Q?8qnh0L2RQ/VkJDTS+QZxK0bj904up40U15kBXpaY4fOo4BrClUCeg0clnBvi?=
 =?us-ascii?Q?nXwbf0vM/TORnpbOEpnTqvcQ7w5SmJvm?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ptpFVZnYHW1a1ykfBVqD+5xKiRVG4a4IT6DZC4rs5dgx+H7EGoXVxtidgIqK?=
 =?us-ascii?Q?AqTyklc/41kORgTbGLLE7ORftbWCC0c4Z5Ec4iMkmkAsqmsKsRyOxJ1tfsZy?=
 =?us-ascii?Q?iI903OCVlMZEXPxQ65TWVIiXj/c+N71Ze1DajvMKRy6CUDlj+9ST83kqphg1?=
 =?us-ascii?Q?zLLw71Bzb9OJzmfEJhjVD3J8h0zKObThvq6XONGVE5AqY7IHu7q5LFSeVnXu?=
 =?us-ascii?Q?E3owYB3NSX+T95UJlBJlAC+fY4FCABfJlFzKSrho4A9mCt6eRk8pxCL54gT3?=
 =?us-ascii?Q?VLTbVlljnQ3Zvnb4h+QOYj7ikkan4yw0/tCKOQVk/NzCP2on93YjnQAz+ser?=
 =?us-ascii?Q?3rvzRrQpVDGm3YY1Mb1eY+VsMarslSIHCcVsFsk6VkEDXHcMboteXQ6y3xMe?=
 =?us-ascii?Q?k01Fs/OEds1PwW/zOnFh71JmFUpr2TPv55xp1DWTbvFWWwUEJRsOwiQIXys8?=
 =?us-ascii?Q?KnYOGoaYYeJujZ4yduaNiGhDZrWJSoI4N/kQrhiy2aCLiz0CtQsgrCmMdOuK?=
 =?us-ascii?Q?2i6QxO9AbekYswvTvIJw/8zGnB4zdtw5vQzUP5iet3FucLdwFAFg2RF4F1uU?=
 =?us-ascii?Q?XnZj1+UFcPQuvaWLn0hROjuZ5IcDHsEeC6l/NFIIW8yWup49XNgDPazgRAR/?=
 =?us-ascii?Q?uqBgIvzkn4TpIlCEOItic8lbzhTNs+psj/i5IklieeFzJI16jmMiSl/BCNTf?=
 =?us-ascii?Q?X4DsD7gTG4FrQE+aqtTSlrfCMumvKKW5DXUE8mRF0twzkoleCfPvVZXGOcge?=
 =?us-ascii?Q?Mz6h2NebzgQlQh5O62cpkxfrUZ6v3pGjTSij3jAWXeCcBc9BHLSPhI24WTKX?=
 =?us-ascii?Q?duIqKUrzcdq8tnorbBsSLKY1sOJSHSe+HUuFslhM3jJH0v8zOxv5Dxs3R6oM?=
 =?us-ascii?Q?hj/3zwZgr4GjHeUPgQzd4I71M6A5ooQ25apc0hBqhqReNnK+FeySyqNSDQ4v?=
 =?us-ascii?Q?OazM0U2kKVsW+zpUClsK57TG9BYDmY1SpxqNPSUOtqPSpYHdY6xbmO9r95b3?=
 =?us-ascii?Q?8MuFQB6MokIm2WRC4fap9Z26ipHRgsJHbNJJvCUPE/+KDNfiHfXem6ZARetS?=
 =?us-ascii?Q?t7yxNZzpMkeCcn8j9a1DsUKv/AK88xUzSl9uAO3g2WPTMYYz5WpPMFeLKXbY?=
 =?us-ascii?Q?E73ZQXbX8Wbd5Oc+BBN0aww3kbm6jDnDhRYYSUTOOQ21+lVy4znLDobirK6e?=
 =?us-ascii?Q?dzP0vYWwg/JBK+k5HuVaaGe215HEiJ56uhCy3txbiOuepPck1kpbwy36d68W?=
 =?us-ascii?Q?G+fCUYDUbp/8GWP+wjscIwUIvGCRHLQoKF6O2TsZebQopFwgZiYKidChqSzI?=
 =?us-ascii?Q?apktiAkGwUmB2GgUIwb1EnR0SMu7X0qOm8k8MbEJEWeBBtEFHwS1+l1ae4EH?=
 =?us-ascii?Q?uLd4Af5dpWDgSHtVvxsnN6gbYms7x70qHYbhGbNsAn11PTnM/IkwMqg4sF7x?=
 =?us-ascii?Q?VRFEbxq6NfSlOufJwvbJ9cWzPuomiOR+pdt1i9C76o62Egwfn1INQUkYciKG?=
 =?us-ascii?Q?BU4f+6Y4laBZD1EqCwUqXqSfjUdIMkF4VtneSl/A8w+3D4c9v3Oe0EpPBfY3?=
 =?us-ascii?Q?y1Nn2X2/7V7Rcc50mgBhRbffgcPbPGvOplt3UxylPbhPgXIkw9E3O4kUBZKO?=
 =?us-ascii?Q?LKXoh+ffZkTOr47+o6K/P1E=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b019d06-9081-426d-f72a-08dd560572e7
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:32:36.0207
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R22pY7GfixQXVS6IflJan+pQEQjMO5nevJ42o9WLXw3ug1svev74eE5O/XlgcV0h9KzJXuttI47Aml1K4GvxOCF79OpCjjTsABupk8k3Qp50xzRh4KTwVhRyFJJiAlov
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB14457

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/nau8822.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/nau8822.c b/sound/soc/codecs/nau8822.c
index fd4a96a12060..15d6f8d01f78 100644
--- a/sound/soc/codecs/nau8822.c
+++ b/sound/soc/codecs/nau8822.c
@@ -806,10 +806,10 @@ static int nau8822_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	dev_dbg(component->dev, "%s\n", __func__);
 
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		ctrl2_val |= 1;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		ctrl2_val &= ~1;
 		break;
 	default:
-- 
2.43.0

