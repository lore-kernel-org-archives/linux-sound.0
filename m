Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.8
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794443546;
	b=FdSnbA4FalBi2Bbo3h3OnlMz6h+oA81m9AgcE6nYCD2Mj6/WZAV58LsUiXSMxBJlC1D+
	 lNjCJufzo3wTxQfbnXIdfY6ml34OqVTFpr7pwTaNRTtJOzAwkZcsw4NmO3M/9yLSj1rPB
	 xIpdD80sflBBbajgRt0F8ZHJpVXuRZMCbfyx+aRWaBhqBMe0BrIMHA1YwoCF2Rskd2SiD
	 z7JY6b61ucdnhqzVVn20oJsMdLcA1zwydyDMsC/YZ7RaRmcZ+9bnEReZOx6ofJaTsnayk
	 9a4zqMc+Ozako5x06Ck8B0OhsiyZ8bm9lvZBrlbtYiZzfNHYZVsuHKmSjzslpYuzSUA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794443546;
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
	bh=w3KdUmX7ZKw6DaHgLIiXxaj4SDM13jJGBGKmGWmaqZw=;
	b=twHhQrUGleMwLLVdkxc5FcH/ZDbnmflOB91222c+uf7Hl2C6Fu9ryP891m9qClGNt+TO
	 vRoAcJbg9DpM8OmOrJRp7VOz0bb1KGhkFFBJvyIPHLyh7+q2UO/rtjV7Bq3PrzWMih3Gf
	 NEe2mBAGRcrlfIsKd2up6ymkfqcW1tLFjT2ix0jr2Lc5PUHVOzXcOTdoc5iV1p/FFUGq6
	 i0nq+ullH/JdPLotiES9UdxXZX7pPs0m03qjKBD6n5LhDBl2S7wkon4mqWU3LQaqQ5USG
	 vQhgM9ztqtPBOOcJaYrs8oqEhKxFvdbZQPh7cODdjUwGK664d0m3AI0Popg8i67nWtQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=U4dotlxW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.8
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011008.outbound.protection.outlook.com [40.107.74.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02361606A327
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 00:32:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02361606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=U4dotlxW
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pO9JTIvqXQygatvubmSjT/264FrYm12eaaTHIdVe/WJGuTwau6Ug9EFGe6AjbR1vkhfg+QVibbCsOIWazcjtjR6PDDxe5YZeJx29Zrl7+A2p/PsCiuxWqkLiIshHh0pnT3ovbQWPHH870aQ2YFekxaoH/X6qUWt0ymk7gThPim57D3GPw5t2UY8+f6pjWuNwHcAjWCV7rxkQL/2KfpMUrELc3IFFAvgXa8UAyeLAC/cSr+Gbnncv2nrVwTA5N0ejLkTDlg88tJ0Blej2I0XBIuKzl8Q27i5fX3Ktn4BMJnPIXPER/2M5lcxYolscCJbfsADLpKSzovzZKoIGWHsZLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w3KdUmX7ZKw6DaHgLIiXxaj4SDM13jJGBGKmGWmaqZw=;
 b=JQgLCoJdTIlaryPqgJ7xpRj54Hwy2r9H5ULGcJpfCzCbtrJZhOayXOEV/wSUJpImdnOPvYPiI0Q4uTOht08+tvMCX5OGvhl8Ph7IKhk6G7R5iE4gX7uKZsd13nnJzYkM7bHeccFb0DHV5SY90RHlCKGE+fKrUcK2Y6Ezw2kSfwNZm5eUTsuyvqdNGkmN4bAq9u5NIYOOUFswMLj1+0L6qi9bSJCJKsZJHBlHz5qYZa91gd0naRmLsh2Og/iiQxGzLP1DqaqZoM6poCyr7b8aNafN/C41NyvppnTKxAnWVxf/fv6lOwWS5qhTYHCUm/oSDWfQ7ifZ6FTwXHNqai+0qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w3KdUmX7ZKw6DaHgLIiXxaj4SDM13jJGBGKmGWmaqZw=;
 b=U4dotlxWdz+UGS8itHxJLekhUlG7GOvAX95isAKnCjDPiFrABZYLsjNJ+tRS2G+rArGbd2sbTwWqeLkm/AbNX2Pvzp+CoC1TNeZsjLHwmOk8L1A/CHiJ4c0SE7GGZRQyVPchCErAKfxSLXB38GlMhc1uHmSWRdeKvDwZqSrBoQI=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com (2603:1096:405:27d::8)
 by TYCPR01MB6867.jpnprd01.prod.outlook.com (2603:1096:400:b6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Thu, 12 Nov
 2026 00:32:24 +0000
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d]) by TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d%6]) with mapi id 15.21.0615.008; Thu, 12 Nov 2026
 00:32:23 +0000
Message-ID: <87o6bu28ko.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 08/27] ASoC: soc-generic-dmaengine-pcm: use snd_soc_component_unregister()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
In-Reply-To: <87zeve28ol.wl-kuninori.morimoto.gx@renesas.com>
References: <87zeve28ol.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 12 Nov 2026 00:32:23 +0000
X-ClientProxiedBy: TY6P286CA0033.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:3b7::17) To TYYPR01MB15175.jpnprd01.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: TYYPR01MB15175:EE_|TYCPR01MB6867:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c81ca3f-f2cb-4d83-3f72-08df40546b9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|23010399003|18002099003|22082099003|261009223027099003|11063799006|56012099006|261102123227099003|261021121427099003|261021123027099003|38350700014|10067099003;
X-Microsoft-Antispam-Message-Info:
	h+1XG4eWMKK0evSjHREsNktOctX9UtZQ8KgoibLUPKCPe4mxpiUdN5OnAwu/I9weIIO4GRAmo9pKgy9b1Jfoy6s6OEywoMWDaC6sbAU1BjbsX9Qwyh6Q7Et3j1qXGLcySr4rwm/6sM2RNuwt+sFX9T1h6taYzuEZKvOomxAPTBnvknpLrDHYNmIZ50/tY8T/x8pPAwEbL2r/SG9+MFnAbcquNefxtNjRDrhqkSU98/XXpO/FCfpjO3iQllYWyxqPpyYUvfxPD1RW8mK66R9WQYdadAEs9aHmK5VwqGA2xdEAIxXEGitkDMx5+Ja7LZX9iETUrmaYuy42oWAAelsRC+nJwEZKM48uzve0jtI6KhocuCDAeg5HSIdGHUG+Lwkyj9XBrpWyvt2nAxDcLMZy8CA7SXGvynK5+rrnPGMQbdHtcsB1F6KmM2v1fCYMdVyAVBF2XEbO9YN9CjYKRYnD66EGwJ9XLEilGlTmY2+sFLV+HVHqo7aBZb9UjTz/yuMCKnDJGzwT4KQ2eBtkjhqFOR2lWJRSOQt/fLHVmSqAFXGTME+lI19KaAfVQedT0wHeo9ofKis2MAjUsqHW3Fx0RDk9SWW99s+rSgm1leZV95cLceHtza4HsU5azSBD9WskU0moo2AHD48lvAl+DKzznrBALQCAYqF5+sIUgscjMTg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15175.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(23010399003)(18002099003)(22082099003)(261009223027099003)(11063799006)(56012099006)(261102123227099003)(261021121427099003)(261021123027099003)(38350700014)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?a7fr12qg89VJmKssHj4GAEBHI5Xxq0t2NfWUYG781lI83ajPUwGZvYfpqoSa?=
 =?us-ascii?Q?B13Umip8GE4jsZ97J8FwZcEedcZSb0rtc89mD7s3dpb3XWaCwgL5KpyBYkMR?=
 =?us-ascii?Q?7v7o0KGrVNo4/1c3YH+TCU0Cu6/QBKo1jcn2cq32QyhVwV/Y4Mv5jmvf6NQy?=
 =?us-ascii?Q?At7tRTGzTcItsOYj29BN+eB28rctUWPt7pBMw9t46qCCTlt3VlLAClIvq2BY?=
 =?us-ascii?Q?tCIrl9Wifq6zsBElc/DnqhfTmSGb9vhdVfp+7CCjWWUfLsX3goBfbTCta7Cy?=
 =?us-ascii?Q?MDaJ8c1c510T2nLsA9JZymot1esZkdkdBnwGwmNsg/fIDLesoyIxA1olJloT?=
 =?us-ascii?Q?rYIwnjAcF8lz9ItK/dGaEwblqTYuT3OaECfhZ/1B1JaxNchTlewf34eRaRV/?=
 =?us-ascii?Q?unq01Qhm7/4gc8vvgFuebyNlq618UQ26NwuxT/Q0OmFO15FERmcjNFf5mVOC?=
 =?us-ascii?Q?QTvZmNeRc57Fs0yLJIBvC/SWn+FbxUpCW6pEwrpfGiZ9aAext3wQqLE+2jt+?=
 =?us-ascii?Q?hujG+fPydSClfGPiiJCeAUUqwMtI18bv7/z8N8IeZNSmhOAcwvovZQXEZvzF?=
 =?us-ascii?Q?yWQYUOWEeiGF39AVdZiZS3Df90p4jl4HhrgQLNzop/4y3Yp+l4/UBcbkTw8T?=
 =?us-ascii?Q?VF2X7qj0RJD4RHlRdIc0FS0stNebKaF6mZDGW0jMC3+vxQwNQb2UdhX0OU8r?=
 =?us-ascii?Q?eSHc1KhBxrNrGcEZlu8ygndZMdbcw+36I7sBV016jLCJE8Z2JOZ5WHdVnM1r?=
 =?us-ascii?Q?nj+xXUj1KtaO9CjY+X3OkqVPMnqhyj8sGa6+r26h7MQS3JgmNOmDpK7/adQR?=
 =?us-ascii?Q?5UuZBhE8D79XZnBJoADq5v7eH7zhcZnRAk34sltFgqNqpRjMH3s1/3q8FIgB?=
 =?us-ascii?Q?XtfJCx0lyLlbGUvm/4Xc8z0YAabbowARtBmHkiv36eACdTnvoZukfo1p3BNL?=
 =?us-ascii?Q?bPYFWush+KkKCnzkJMVOtaGygapmzW+wrrd0iqTmevaKlPZ2XF1+zewidbFW?=
 =?us-ascii?Q?vfwZ9QP6/LTwfZ0VoR/DuTA2SWUUBFwv+gnIPZDWTnc68Swi95oCyxRnBu34?=
 =?us-ascii?Q?9pCgrR8cEOGwqgpvSyCuJpe3esAZskccS12Zlmb7qSuOtiGuRoXW97v+7yeP?=
 =?us-ascii?Q?h+kP2UQbokpia6sA7LCzlp5ii0aIhCjZmVIl+AF+rJCmLU5HaWWTwtk6PrZz?=
 =?us-ascii?Q?npWw1i9lry/ukJjGjGqxw9nqN/5pHMn+MERR/g06PT77Hy2MJSqIWkxsIHhN?=
 =?us-ascii?Q?G8DMsYab7xNvpYJmhMgRQhww4VIf6MwvWfdH//X08341f9JR4l8olNyt98jh?=
 =?us-ascii?Q?JfJOhK38KjqBFJeiA/0OxwkyuD7FehwEWQRaCnLj8zoBeCcGjmS+xp+0PaJo?=
 =?us-ascii?Q?gBXHtbA31SI0b69BDk4nPjNwe3AtV9oktY52+a2FS7l3O0Iy5vNH6xuJKgJd?=
 =?us-ascii?Q?iSpllzo4jnhckplgb2EVeOpJo/d4CNFE37S8ckYyvBDiDK9zqjyYtKILY/AJ?=
 =?us-ascii?Q?iRVPt4zWobr06DykIrYqyR73OxUGj8qmuq1xaPNTEqYyUb2tMnPrp4wBHRMc?=
 =?us-ascii?Q?RCYUk4F8tegaSYHYR/nIKZ/Yv5u4AjU6wFjSvvyGrJIAmzliEGbxrMBLjkUn?=
 =?us-ascii?Q?6SNXfNGwyq7xbNjm7Ov7+xrenktXvcxLHN9p80Y+kbGPDEFZ8AN1ifLjP7jW?=
 =?us-ascii?Q?CxECdfG3w2Kk2O29JSIeMagLMJeY2qju7belgHSP5s9G68gbY5E8QrhrJxUl?=
 =?us-ascii?Q?twcelZcpC3qEL9tV2jTh3M+JX0dInzz9qSG3gNrAgkLvUxRi/KE/?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c81ca3f-f2cb-4d83-3f72-08df40546b9d
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15175.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 00:32:23.8691
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YH8qtkNCin36nwFmJdCrUenHR1JFiQOdXilLY3WbRo1dYYSdh/dWIW107R8N0m53ySJGP1Y0jlYyClrdDQeiKjyu28EoXwFl8pU3H50VZ3pM9xu5V8QFntZ5SuOAUk8h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6867

Current snd_dmaengine_pcm_unregister() (X) is using
snd_soc_unregister_component_by_driver() (Y) to unregister component.

(X)	void snd_dmaengine_pcm_unregister(...)
	{
(Z)		component = snd_soc_lookup_component(...);
		...
(p)		pcm = snd_soc_component_to_priv(component);

(Y)		snd_soc_unregister_component_by_driver(...);
(p)		dmaengine_pcm_release_chan(pcm);
(p)		kfree(pcm);
	}

But it try to unregister all components from dev (a).

(Y)	void snd_soc_unregister_component(...)
	{
		...
		while (1) {
(Z)			component = snd_soc_lookup_component_nolocked(...);
			...
(a)			snd_soc_component_unregister(component);
		}
	}

snd_dmaengine_pcm_unregister() (X) need to care/free pcm which is connected
to component (= p). Both (X) and (Y) are using lookup_component (Z).
So (X) can handle first component/pcm (p), but can't handle 2nd or more
component/pcm eventhough (X) was called multiple times, because (Y)
unregister all components. Let's call snd_soc_component_unregister() (a)
instead of snd_soc_unregister_component_by_driver() (Y) in (X), and
unregister target component only, not all.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/sashiko-outbox-206296@kernel.org
---
 sound/soc/soc-generic-dmaengine-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-dmaengine-pcm.c
index 1ecf3feb2bed0..62f86d97668ef 100644
--- a/sound/soc/soc-generic-dmaengine-pcm.c
+++ b/sound/soc/soc-generic-dmaengine-pcm.c
@@ -514,7 +514,7 @@ void snd_dmaengine_pcm_unregister(struct device *dev)
 
 	pcm = snd_soc_component_to_priv(component);
 
-	snd_soc_unregister_component_by_driver(dev, component->driver);
+	snd_soc_component_unregister(component);
 	dmaengine_pcm_release_chan(pcm);
 	kfree(pcm);
 }
-- 
2.53.0

