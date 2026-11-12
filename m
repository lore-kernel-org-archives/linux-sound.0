Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.56
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794463309;
	b=JG/hoxlWHVoQ7IH/OWZouulZh5B1V8jjhLjSw1vYUnu5nE0+rV0mQABwjKCe63Efvm6X
	 lxpn3e2YD8XsLqQ7uvoJs+W7AH2ZYfrJX+Ec8QCSxU9LNexK6pDJxk5aiDcyT7tbrheYo
	 Vmww3jbsNRYtdx68tG6qEGfYDgbYw0Q/6UEUfPbyUYfxMOMV1/t8jLrVbNQ1jjlnDWJI9
	 HaMPUPY1sl/HPSRvweZdIiLrBXhZ3bh5tbtOiotf2uktTnPW+idtSHCcPxPJTsl4iZmMM
	 ixeYlvyODPnqP5uwO4XcW/SasNb4MHbDdpJOtQO7qEWGHNUdeuZEVlr5z0v0vS2xA8Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794463309;
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
	bh=xdkhIM43IfHXkLYL1nBapoMH1kz5VHjGyWIWZ1fbke8=;
	b=i8/M/niot3J0qQWumMa9oggwg6Ud+H/Ix88zfT96YdfAuKj3WB/cFBKYRwdzbL0SqbkW
	 NP1ehkJ03AIDbX3HvfRM50xCKe8mRPkdNYjc7i5n4opc01ulvD3tSChIKvyWlahlPotPi
	 lr37R6E/gtyRI/lzMisSV5f3/9cCflYWkf9dgS1Oyym2PDzXbLWhIs4yJhyB74G/BGJGA
	 T2hlvJbyjOnyI7aL6B7alnFaMrZ1LC0fsH+Ic3KkFKyoMvvNyBi9QC1jXPiBkq+DegEbD
	 xdPINm8I9hInsoHbY/ZEQ6FHDwNbduU7xcL3mh6KqnLcPmIsXd0wuCLylF5RTXCNvNw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=NVUHyuo7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.56
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011056.outbound.protection.outlook.com [40.107.74.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26D8606A31C
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 06:01:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E26D8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=NVUHyuo7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jxyu5PFZBTfzMIqoc5hX+ZI+cZMXzWsmRZ242N6B+egmhPtaaoaJ1jHXnvRy5xUDvkN4T5aDuRcv4J6cIf3Arn4SbMLtosTBlJGEqdsfRB9dtggZ3R5mMaInuvksnq55+VBzU/tS+z1z9zUUvk+/8Jw/IV7gx5Qib8ycOEi6rmQpDMjVeE9sMUbYXkr5kL5J+N+360o2PcdKqL5uZz62GV056Dt20y+vus/SSmK7W90hfFcN/MFO5QGhueKpvfiizIXi4RKS6iGIkCFrTCvjJ2i9k4fKoVe5n0kJeBkmBI+tWYwYavKf/a4Y+Lk3mH61FPm0bwtfqXPcYui8PmRdmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xdkhIM43IfHXkLYL1nBapoMH1kz5VHjGyWIWZ1fbke8=;
 b=rPUM42An4yXQN3XH8n6OHBxEoMBnchz24VpOMagHc/JZw0nkBaQSt1Q7IRDIl/owQ47QGR1TrWE9WSy25dMbw/+84bDzP3vQgoOO+BIY9CARCxevkq3NFGxch3K41MdTJ7DPZUpWWR2kzbRqSS0l/EUsxtSPRT+AsjbWP63p9n69frCr4EENA26K3/F+nqINT8j4i7MCJyscRZbQBcwtlFUSmEAlvbBkopGCmIF7ZbKsh4A873yXLUe8T16eprfR01aZ2W4KM3JiEY3TQA4Q2wje9cXUh0nKIblyEz23YcFtXKdji+VXAwZZthhJEHMekOOOsbZGX/Ca/Ua3g99Hcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xdkhIM43IfHXkLYL1nBapoMH1kz5VHjGyWIWZ1fbke8=;
 b=NVUHyuo7hFXIlPr680r/dY+0kSiS/4r6LskyXf7UwRnfNlzZn/X/ihfMMdrFFD6g8foFmvgZ6E4s/6pPRAoWTWm++WRFwSXoLJW+xIJDudOTfWidcdvwpnjWs4jqghBPJgGyOELK1QqQiBBfddzvsQHXbZ8yZnfzkQmtXGru3iQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com (2603:1096:405:27d::8)
 by TY3PR01MB11298.jpnprd01.prod.outlook.com (2603:1096:400:3d0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Thu, 12 Nov
 2026 06:01:46 +0000
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d]) by TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d%6]) with mapi id 15.21.0615.008; Thu, 12 Nov 2026
 06:01:46 +0000
Message-ID: <87cxsaziye.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 3/3] ASoC: tas2783-sdw: use snd_soc_register_component()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87h5hmzizi.wl-kuninori.morimoto.gx@renesas.com>
References: <87h5hmzizi.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 12 Nov 2026 06:01:45 +0000
X-ClientProxiedBy: OSTP286CA0105.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:219::15) To TYYPR01MB15175.jpnprd01.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 079a020a-7592-4832-7e69-08df40826eda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|52116014|366016|38350700014|10067099003|11063799006|56012099006|261022105027099003|261028144727099003|261026140227099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	62YYR96qfzZR1pPa0m3xL75LThmOdCb/pdKvn0HiCB0Gpk4uorLUJtYYkPLP9popa1lqVUnWa1aHMf5ngwydbzeQ3o0KP+0K4yoALulJmdPDIxNfzQdw6QbGPesmSf6XDptGW9515lvgwU20n3fku2KQy0KYu3ITO5lApBNGfL8+OHXiRgW8bzZYTsLTofu3rK0fFtyJZsVoOhgODvibBVpTSwd9J2ty2Hh+PAoakZL5Tj0RTll6qu0l6+pOmpKosO4SiofSEtyYOn19je38WxolXD6slAQg+K70PxdRnd3yGtwHxa3sDJkSjHpT/9c3YzqI6wlrS0CbTdZR/jssgarBdsRM6RxkIDgPnZ1eAEef4jhQhqU23D7iZLGTLCop78Ts+WK9HjVb6j0EBB1dYnmMgJA2LoD9eY0g2j5GRPcLtifo6jbM0rht6xUE/lcL0VXtTkS2jyh1KE9qPNDsGY/71YP/gGXgJFhO305Nq0TflRfVZp1g3eOQKKqVyjAcJnkywhFZXkC3T1Dyy2HuAQV86vB5/jgQTm4du9BVcBTjSLYMcmO/XpBVt91j16OjZKMKQHfVhpU3TnT1ZT6OFLpnjXwTvJvWzPjMEfQwgdkmltt2jp7cATkF+VLr0NvpErm5fnnvu7WQGuy8GKX4IRGr4op/VlA2l1JK+9Rp/VXbGq75OrKXZdmEBP7eFBLq9qZzWxJZvMYt5gWIRRBn0Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15175.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(52116014)(366016)(38350700014)(10067099003)(11063799006)(56012099006)(261022105027099003)(261028144727099003)(261026140227099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gFtMA03q+Z5P86p95QXh3Q+SUb8APdlJKWOXoVhYCdfC2z9ss9EzVXXWcON2?=
 =?us-ascii?Q?32QAfdHlJ61t+o8FTLCCLbvzh6RG7pv/vqvwDvmQrRADcWNsY7y6+PW0ickp?=
 =?us-ascii?Q?q2tLXSTVE8PpN6K9oZnu1lZzgR/l2CZPLCs/KDDz4ydPnXgLIV13M0tPv1as?=
 =?us-ascii?Q?4v8lykXa9E4Z0XRXuUeMwR8ctgM/JtZ9dFMaM1WKCAe+P9s0XjO5xZRzUBce?=
 =?us-ascii?Q?NTDAAAwbuTXIup83zejq5JWUEeZD4ry90YZyGDGTwPaJ2XvVc1NFc9m+Fd7u?=
 =?us-ascii?Q?aMy4XSdksW7bl4ACosd2jqVel4G3PneS8SwxwXa02XWq1xGFB5fpwe3bFmQG?=
 =?us-ascii?Q?erFQJVdXylVMR9vZ9UUO/P86YtgHjPXyVmDkVTXDcJRyOLPuRfbVBUyAgPYH?=
 =?us-ascii?Q?gTecdK8Btdx8kzt/5Iax1EvKfMosXQ9lWAI+LFy69RL/6UcsfiCAM1ZQofV3?=
 =?us-ascii?Q?HrzhOOhDPwUsXt/94F8NoFmDNDndspEmSlFBqHytMhfDOxHMGKHkW5dZFxoF?=
 =?us-ascii?Q?Z5dZ3/Ky0H5/SviMfxWbzh7uMFLoVNhZOazz6vgUeixgZzaFK3ylRMN5cmI4?=
 =?us-ascii?Q?gwqovdqzjoCpZdhfpRVywKmmfonKF3pk6N3415FUECHIVVIhWyz2GTUXZxrl?=
 =?us-ascii?Q?zHKjtEDpISr2Ykzug4AkxScLsvrIKk2ZzD0cXPEkNZQ2HvjVFO8iIfDnyea/?=
 =?us-ascii?Q?jwWMWYlAJuRIU69ctbLCqcliFRJ6Wh+oXX05ra72YphnbuVGQPnU/AAlbS9w?=
 =?us-ascii?Q?iNHD4SedLvVEUvJEqNMVmDYd7WzZcYv/jMvgxJFHyHrtGEFMFUSEeG9nKsre?=
 =?us-ascii?Q?qmyTaBQo1JIKsWKR9Iw0LSbcCN3Ymt7/0sli8zEdafEeYfU8Xa7H8Wcy1yw0?=
 =?us-ascii?Q?Szdntee+8LA/f5ZqEt0VnXGLPKrpxZi4fYrukz29sAiv9aW0fr70mb6lXbh7?=
 =?us-ascii?Q?ffunxfDOwWniWIVGzvmlOXGuAyhwMlXKlMt2zPzEoViHPtYSXKZ0hcv902u5?=
 =?us-ascii?Q?db4BDVThbGwt2k7j/f5RRv4DdVOoJN6fGhYAn1bDHub6KOupQmRKcvf/AMas?=
 =?us-ascii?Q?/5XjuG71Ims/0OJyvewTZwS/6392g7YV3VhC0XuLBzXQ3aADKGziHw87tLyA?=
 =?us-ascii?Q?9y8tKm79Zm6VNBFI7xbMCGkCgHr04fGIMCxZtjdHHwc2n0dmBNj/+KcHDivp?=
 =?us-ascii?Q?iW/jOk+amuh+y74s3+EPS28ZplrJeGbeVKYczr+2QNoZ/aOU2OEKf3SnSp8j?=
 =?us-ascii?Q?YKkHIRkoCvVkuy23w5JZ3oOuEfPd7nwrs1HDHxizwZryhwx+9zgePVJg/Q6j?=
 =?us-ascii?Q?7fP82EQ+fDRSx19aqefzJwbzBqYNQbIHRdVWCTKvGmXNT24zIfGR+nfTpz4g?=
 =?us-ascii?Q?LUAa53wpm3mNfgYU+CnLghWL+FBwsKuOd0pi1Zyx9gBmbNlG+ovtZ9sfCx8K?=
 =?us-ascii?Q?OJ5RVpYtwjvOV9xaH7KMMox07ot9rnt+aSwJGW60+/npPVkeynIDtJY6wkUq?=
 =?us-ascii?Q?0ZWSRxKYReMXFVNQLDfLblgnXjOlEWKaAv9MI5f59vMV/KKrKvLMCr7uCu4x?=
 =?us-ascii?Q?d2a/IaPQgPbRERZKqBa7df0RTtIVdXd0Nx2xG9+16DocUptmdY/IeVotmON5?=
 =?us-ascii?Q?8C3KJ/sugj6NEnzoqLlWWKksgDqsUEzfSCn2jqIn+nBNQgpGY9lP1ju+pQrm?=
 =?us-ascii?Q?w2OySWBZDPBPI+NKP76W6GDH+E9AznsoA2+G7n/w+2v62YA8cQcZZjdcyu9f?=
 =?us-ascii?Q?m9Z4P0sfN0PIaiiJENLHgFZJ3hZ2pYkC11skgesEsr7LQKqMJ/tb?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 079a020a-7592-4832-7e69-08df40826eda
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15175.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 06:01:46.0978
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: daR1DPBHBvlcUFHQSrfxvFtC+UNGmi+lFOBz9o/aUIhCaWSie2lP+xrUuSxFD0v7mGIViYkNOJQjFJsCyMJ4gKHbr3bI5ycNRl22bwvE3M2s/oEcIgdVoe0Mk9Bvy7/w
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11298

.remove() is calling unregister() by itself, and call order
with pm_runtime_disable() is important. Use normal register()
instead of devm_ version.
Then, it should call unregister() -> pm_runtime_disable() order.
Tidyup it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/tas2783-sdw.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/tas2783-sdw.c b/sound/soc/codecs/tas2783-sdw.c
index 02fe74d457bfc..719401daa9abe 100644
--- a/sound/soc/codecs/tas2783-sdw.c
+++ b/sound/soc/codecs/tas2783-sdw.c
@@ -1091,10 +1091,10 @@ static s32 tas_init(struct tas2783_prv *tas_dev)
 	s32 ret;
 
 	dev_set_drvdata(tas_dev->dev, tas_dev);
-	ret = devm_snd_soc_register_component(tas_dev->dev,
-					      &soc_codec_driver_tasdevice,
-					      tas_dai_driver,
-					      ARRAY_SIZE(tas_dai_driver));
+	ret = snd_soc_register_component(tas_dev->dev,
+					 &soc_codec_driver_tasdevice,
+					 tas_dai_driver,
+					 ARRAY_SIZE(tas_dai_driver));
 	if (ret) {
 		dev_err(tas_dev->dev, "%s: codec register error:%d.\n",
 			__func__, ret);
@@ -1493,8 +1493,8 @@ static void tas_sdw_remove(struct sdw_slave *peripheral)
 {
 	struct tas2783_prv *tas_dev = dev_get_drvdata(&peripheral->dev);
 
-	pm_runtime_disable(tas_dev->dev);
 	tas_remove(tas_dev);
+	pm_runtime_disable(tas_dev->dev);
 	mutex_destroy(&tas_dev->calib_lock);
 	mutex_destroy(&tas_dev->pde_lock);
 	dev_set_drvdata(&peripheral->dev, NULL);
-- 
2.53.0

