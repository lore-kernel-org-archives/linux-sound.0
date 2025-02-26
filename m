Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010002.outbound.protection.outlook.com [52.101.229.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68679190696
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533698; cv=fail; b=sf1sUqVCFFH2Yp0d5ICekv4gN10veyjqMccgbrfx6XdAC662AQ4zRJLlJOdFnC4vEfFnHMQPtp1lKGjTof1BQlM6yhgs9E0RI9HHQNgGyKsdmqhtiI/MPdARUcs97pFJ37VrzDm3HaP03Z8KYQ0R7otwnEAnQuUwxE88qjBNI2I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533698; c=relaxed/simple;
	bh=4xU1+LuPOAl/A1Y9Og6Op8i9jlM38DKfcIBurKPpjI0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Gx5NxOpXc/uPsfbfDUjELj3r4XxDecM6a2ufkWO/5yNSMplSs/6lHNpcZoMXxTkpR0PRRp2Wp7FbDFBrqTlGn4N3dGAR69/Xs7FUfGjAXe1BcmZrk76Y1X7nhRjm2UZUCQF+Tp33/mrQlmv+9K4r0/azfFpNrf+7JKuxqTZqXbM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Tm6z13r1; arc=fail smtp.client-ip=52.101.229.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Tm6z13r1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GMku176PHgIxk3HdhlIr8H5qOryNiR2FwOms+yfIfeqh9hktyT76R+yWdtDhH5svlB4u2LwmAmvYNg/GNJThviSRv6r8sXQiakiXUUicZiNIBTsmhyc/rFLsN9PFRn+tRon5MSgkoawzCgmJWsapFk2zhcSHN7XV911DmBPbM2h3WAIwGZ1/cyP13o8UWpmYHTLOvQv90KATsPtJSnfDXqPhKaQ2GnJmt9YfbAlwyLD85MxkmNO1swlHY2tYY/g6/hhkk3L2RLaV60ZdSpFmPcDH0EBb08q8lsGZEVksTF3W0RVMx7OnZEkXrRZOwXRlUu1/BTKSyAAZrzi2/1A2lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YpvPlLW7G5HQEVr8FQ/OGcrIpahn30FAF3c2P/M7KNU=;
 b=PzNYCpjZclV6SUMZbbKItWMQBSEN+syvvUbJi0L+q2fZ57J7ZNJ/k8L0Nb/bLGbgaUGEN5MQ4AQjJFjNDBbFn8rkSYstQZb/YvjofO1UWvNBaQwLvoVf7Is6hnuIo7O6OyjqysWn/pJKf116emV1/iFzIdFi9HC7pQER6vdJNpIyrY6XEbqVbboIm4V4IkG9xE8QyVKU5gk+SNgy8wSEs9I/ecl0Fjnam0mFG22bdYtIi6gsSkmWKG3DcAXJ4BlHAROfCfewQxtMmvnRdyV/8n+0gf8AXA1Y3nWII9beCliS44Gl1R1dChfReeWmVPJmCUpAtAD/OeG8yhhsE+5cXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YpvPlLW7G5HQEVr8FQ/OGcrIpahn30FAF3c2P/M7KNU=;
 b=Tm6z13r1c/wJB5QhIsukhxFYYqzGaMg450FXiq0jGbbhcYlVFTohBSBKNkez8Ofdd+A/TfcBSsacG7nfXzTRY6tk+7SeULdD/8Y6OiaJ17CF4YkE55BUXceJ5QL3R4oESt3TSqsyW/aDKMrNbAujykPoAzLe2n4V/LwcMrTow2U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB8745.jpnprd01.prod.outlook.com
 (2603:1096:604:151::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.23; Wed, 26 Feb
 2025 01:34:53 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:34:53 +0000
Message-ID: <87eczlcwub.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 076/157] ASoC: codec: wm8741: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:34:53 +0000
X-ClientProxiedBy: TY2PR0101CA0041.apcprd01.prod.exchangelabs.com
 (2603:1096:404:8000::27) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB8745:EE_
X-MS-Office365-Filtering-Correlation-Id: 73bcca4b-9756-4e25-094b-08dd5605c4c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TWM3dBUGePIETs7o7dH9vPt264eK7E5nxUwaK3OKtF+JXeDZH+pOZxvGmNU0?=
 =?us-ascii?Q?hzN5BKjJOOWnH99DMJhH9opHoZQ6NskQ5BYPs3EQE2CihfyLoec0bRDEObND?=
 =?us-ascii?Q?Mbz7id+rsB+j+hfVGooKSVu/BvgKKGMt5U4tcohDPiM8Z+UrwzIEaEn2cCPe?=
 =?us-ascii?Q?ZktFm55l5jaL2zqKhaL821aC9Bez5AQrnrGT3OKjI+1ewoeDu8YLcGiJ57GV?=
 =?us-ascii?Q?Me5xmZqx2gXg/q3aTz86KToKdxNTx/qagi6xraoylgOHvOA3laTGEXahgFOW?=
 =?us-ascii?Q?f8ANVCpqNI/R6ho8vkPcCdB8cNwtyBqLtKpdZ6LLsJWr+D9AVihzgr1p1/QV?=
 =?us-ascii?Q?ylaO2fFQu7wjqRGYn6bzIt7TBBng1jpUYTN2OzLeH5sbrp31CaBtq3iFsb9m?=
 =?us-ascii?Q?UXhKXvpdIrzQrmW+S3+Kgz5xGC5l5Ze2dkpz6AG0t/0eZXse4QVLHnao2zp4?=
 =?us-ascii?Q?OtcBmzlXxHFAOpPtCjV21PtPdgh6OT/tzwgF6QBfZV/Jd6aFuOSSFAqXV0yH?=
 =?us-ascii?Q?Z39ePbuNrYYsG3ZbntyPCiH0MdSKjcgm4SYqL/Zk80AAA0nWNkauDELf4qws?=
 =?us-ascii?Q?K/Dl/EGaPSiVE0bRm8Ez4wqjDv3XT3KVzmMSOY9OnBK4rH4VspBp20N3YYoN?=
 =?us-ascii?Q?R4YqJceuYqjoDnD7WYyF1TC509eWTMAuvLD8oZ31Isdn9GWDwVM9XX6MqUZN?=
 =?us-ascii?Q?oUAhWABmwLQJJaNFpMyB/iHWJqqyuEBtFFBIruUicFTbu8983ADv5i9FpcCD?=
 =?us-ascii?Q?7RGWN/O7Q2zNV7I3vjIMoAaeAwElYKwppqIH4G6nrDwXY313jm4KaTdJDeBP?=
 =?us-ascii?Q?MURP7AqbHal2G6pY8bS13yEWo+q4lVfCMVDIMUwCHgnfKS36n1r/l90UGnTb?=
 =?us-ascii?Q?tafBIfaMFk78wTrVVMbkS9V4YYByEq3lArTLt3tZmYfH25DnfKPrgP4/f61u?=
 =?us-ascii?Q?JbXNFuJdUAmtgyH+I8CxjuaFHLmMCrtL7Ck1k/cPdwG3klB79IjYpTh/jCM5?=
 =?us-ascii?Q?i30kS5SNcvVBiRpJ8hOnyiCPSPiKS2NuzK403uGiMHD4RJGM9fr6oRYPPCNh?=
 =?us-ascii?Q?BdWA0CP1UigVSGvTSM5jczuMPVZxtrT5M6+fD/fY37Pbap03BaQOf/8TdNl2?=
 =?us-ascii?Q?DNw+pWJH7A+vQfHqsrse+doUkJazolKg/LSdgt4mHL/CS9Esph5hr+xq4Lu4?=
 =?us-ascii?Q?nT21AnQjEbuwulTCkEDl18ZfQLXTFBpldOf0GuktUgGj2uQ7ojeI1ziSfJTL?=
 =?us-ascii?Q?6GN3l7LHzOi2FLo0jkogshqajgSQLQiIOZT3Ldz42UfIKtKLXUyzF5uXm6W9?=
 =?us-ascii?Q?bokrNOTskhgq3xjVLMsxxVT5P5Llp5Ytvr1nI5cHbLgXARfRkjxB/JQjzMcE?=
 =?us-ascii?Q?fXI9DCCsmBX7ce8egAJWkzH2v/lv5WIF1mfM5Pm1/yvyIaQYKvVGfhDRBpLr?=
 =?us-ascii?Q?9RR+vnAZWCDw8P0lCMU8fPnTGoU2C8y6?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CUPHg0Yk7QYWpvEUY7v8a6yTfoe8J+K/zzal0fdQrjQHBg6U13uGrPl9+UeE?=
 =?us-ascii?Q?uAIahPlwT/v34B7GmukoD6DfeRlGPsMyNdye7Wvo7yEav5zJsbj1CI1iKTPP?=
 =?us-ascii?Q?0ZcQGq6opfRy2AcNalJNaua78YG2n/Rpxq9q+cgQpUzO6ZGlXB2L4+ofLZNU?=
 =?us-ascii?Q?Rpu/XZLAHAYP2/ZLJqwoBv3aaPvMBa4outN32JeMWZTUbeo81hxct+vF/zln?=
 =?us-ascii?Q?ZbRdTQ5cEHvFU5YlhNqRy7n2wkPv3vsVe4Kl/+zhY2irddL+zyriVXZn11oV?=
 =?us-ascii?Q?yM96XehJImCSuS1u1QnJ+emvTfUtfkMLxXE2YLq/HcFz1XHCoKPuVEnMrE4Z?=
 =?us-ascii?Q?TDUM1q0TpLDIFi3miN1rg6P+5XZxbRzvm6heAO6tSzqSqzjQsbAAuhHixp97?=
 =?us-ascii?Q?FJPP1xFhEFZPOXFMRFVW8K93SUWP3h0EjsFXQHGt/kABiio7E5VE1R+vgA+Q?=
 =?us-ascii?Q?kxuZ16FPhNuImuyIoYE5otEtHGO3XB/sl2STw3oI/6+hXs9B0kkNxLsNLCrY?=
 =?us-ascii?Q?hehjc+j56UMXsyrsH7l8FFGSt3fmdvz75QlXpuOIJXC0uIwOBU7ih4IukwTX?=
 =?us-ascii?Q?nHgQKr7Z+LYfzVbeFnFzQq94wslnmqx0I4tXtDESo0z312K+mMbTwCW8+78u?=
 =?us-ascii?Q?oebHorjeb7kGhuikBgg65gDxyYt4IC4e2fTkoeXWqqROKdJtfkVInaZ45gFq?=
 =?us-ascii?Q?PWtO84fr6rkexmn8O26oMGM04Hox4AiuIEX/FLjWkrVz4/IyY/5dtzmEkSIW?=
 =?us-ascii?Q?cPtHIDn7Y2UyUL30TzlzTLYShbW72VBf/7aheYAXdvZHvK2ybsIE3iSKtCRx?=
 =?us-ascii?Q?Q5szJhiAXKCB6DdewB8bBOX2S2A9Kxr+mxHyEXQEk0maMVq6HyRhZOYXsuCA?=
 =?us-ascii?Q?GTberdtuDk1rz+q95yJaWyryN707Ump0KiMWm6duJ3qwbXzYwyK/TbIClAWB?=
 =?us-ascii?Q?XAXRhfFtpMRJeVhgREV2NXaCxEPZt4Iw1RN2OJF4Ol6p0CrAoh3g6fwKZ2RJ?=
 =?us-ascii?Q?Tgu0gXXhtSepwNwH7LLT9umYFGqk7qRNa6i4H/yX8+Tt42dVAw3hY/cRZg3e?=
 =?us-ascii?Q?W7Badusiy5S3TcB6jKRYiYQ0llMYZls93GCxMSoFFfGRgK3M6nlZSfdRjzVS?=
 =?us-ascii?Q?ztfBrC6EyfZCE7Mn3kHJS750t9dPKR6ZQ8mb6pRZ9tZyhIcWwCVTYjr+yYcx?=
 =?us-ascii?Q?YDpsrasqwDsv+Jni7N4DbBEvovWQZ1C4NwdyFY/LTOr2Ue0mOHeeAqJep9aC?=
 =?us-ascii?Q?TPgYyQSKpluSneHbKlmyUMXjlulabe+8CWTI9G/9akOUvFpwp2Gyvxzp6SNh?=
 =?us-ascii?Q?uD5FS8fPZyeYkzOhQTPFIQ/s7iGwor3fLEcIO59oBFj4jZYl4f1NJhtanbGl?=
 =?us-ascii?Q?e6qybdTteT/16NuWTsBS9xFVwIbEoTdQt7qEYYxEERantbOn/Pf4DrqUM7vr?=
 =?us-ascii?Q?RkfcAUZrXSapa9m722k68rlVgQlCBqiVDOvrJKwLssArkdzf+jRG3TIzptjf?=
 =?us-ascii?Q?Nyvcwxn3Ud1ObQvR+TzEoRbOlsr0zfhNgdQv+nOJ5QCHAFlzMep+7Shu4W7y?=
 =?us-ascii?Q?BCDkdOXm7BOItDp8jdX0hRaG+lJehzHXqJWYlmnkCk7Xa9G7++YoH4eunSDw?=
 =?us-ascii?Q?JmsvZHeY1QaLbV4xe42WcAQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73bcca4b-9756-4e25-094b-08dd5605c4c2
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:34:53.3546
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pDeyyFXrZFFMjKsv9Y6C9PQibfMLgXtJqvaz4j2dCZDcmC9VsbfZfEBAhSQ1U3DNRmSyJVbGStiN84K9OLJREtzoEe8lxQd7+irsdHN5lP4wty49M19QM0SyjMeb9qYa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8745

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/wm8741.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8741.c b/sound/soc/codecs/wm8741.c
index 4863d6ac461b..4dfbb33edb09 100644
--- a/sound/soc/codecs/wm8741.c
+++ b/sound/soc/codecs/wm8741.c
@@ -308,7 +308,7 @@ static int wm8741_set_dai_fmt(struct snd_soc_dai *codec_dai,
 
 	/* check master/slave audio interface */
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		break;
 	default:
 		return -EINVAL;
-- 
2.43.0

