Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.60
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794443579;
	b=NGbeU6SsdafzccRKHu1cPm7MFa3T12Uu87yeBDpxDm3zYb/Eov4MA33LinAaC+LbZ3KT
	 O8JqoF4dx2nd7KfFx7lp32r92PBrxSNaPDJPDAflndIj9cbaexvkHBpuhgX6tML+NvX0R
	 WhEOqYaM3tzsZVjOfRnLpeHKfuYfv7/c+SxEUWiztsClWsdjGNBmMSddr9oHf+Bay5xkh
	 VSxXrzPPZu1kaf+UQ6XrbvkhNNFfhwbkufw1trzJsfDliMk1MP2hFaifnfndGARBLwFsC
	 1HKVsTokkNMSoJnMfrw4DPqhTM5zEBAXhecdQBqZCUhfMTkiGFHZsF7+ptJXY8MJ32Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794443579;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:From:
	 Subject:User-Agent:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=DHlkwn0/tXP+c+CQQMYD3Uul+lJPk03sou1uPmWDb8M=;
	b=UWLjq7w9Er9ISK9hSPOhUrDJagSsm9z8FnfuYb4wKR4nplIoueWxdT0H9GpCI6MEkdf6
	 KKe/9Y62EfGwRXvRUhggc9ueXrWVn+4+J2zjPBN+EbAaLc6SBiYQmvDUZK6a0zYMgH9S4
	 7ZCIS3EXs0U1uGSqpxUKt8HJ4V5t9gikk+B4mdRujnOYYzvkIP3XOqJIRoTHwaMBKEh7p
	 PGqs+LchXgRabtxwQg5KOsz40G/u8mxCcdQdE/3zqQTBfiPDNSz/KdKa+M1h3Hwg3pwIQ
	 4GVyO7pTTsXyWFTnHDqeEDSFPbpFf74XLua4TIKl93f1XGL4mgNN3HxGEr1p4yBlXPg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=St6qw3bn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.60
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011060.outbound.protection.outlook.com [40.107.74.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73D3606A31C
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 00:32:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B73D3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=St6qw3bn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OdMbLKnh0wl6DdQCczNwluouOZPKtZ8fUwjAmavIcWw8z8CNEzVOUmEJ7X2/O/06ueiffze0Oi+W7fxNIUaihP56QdFHq+kpWop6xMVUTa5QpzTkcQH0VWam8YSGC5av8PkJlO7pyTRQ1bibyhOY/ChzFzE8PHYxjV2ZSaeG1SyQ84YZilK4DcEj868XQ4i7clOBn6ue52SNQTdcerMu4SCJy3H/UqegGvWQsR/A0XE85Xkb68Ps89MWubD+Ld+h2NJWE2TXt/4dJe/W8tzKXXQBL2BfdH8YFMG8+35k3D3ACOKEvOUlnLGPOMG0KkMauyaC3maHziuIXTAxX/FBuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DHlkwn0/tXP+c+CQQMYD3Uul+lJPk03sou1uPmWDb8M=;
 b=G4xEruUbugEsqCyUeWAs2bXntOUbhGaERMfHjeIkTeEZ68aImpuu2jivmp5J9DY9ByL3GK59kVuRl4c4IqzAuwXfHZvMdJVrLtPHIbGp8q4kh5YFh2pQY5Fzwj61AII4RmSeOZgpz5zIZlb6hEvcj5CfOoq3wDs6HdK4f60MRbnzCdbzh5bnZ/l5BHa307GEY+mr07xl7k5Ht1JTGrqU4rhoNmDy9f/AtdxzZI0eBGInYZAkBiJHcKCcWiMsclNI+swuB49wRUM7tIjz5tu2QM7wZg5UkCEBExqnvqbzGDi7D9pBxVXaSUJ5UkmP+KyIWVO2fvfYfsOWSG1zXbFSKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DHlkwn0/tXP+c+CQQMYD3Uul+lJPk03sou1uPmWDb8M=;
 b=St6qw3bn3JwBf3nfsn75YVOiaQ6IFMP8UGzFDNY6E4DionXnWb/bwnnNt0Kujr6/DsbVq5Yoe2By0lNiz3w5NrZGX7rEFgpZjNDDwxBuz57H0U9o91R/P3EvdppENyP02JnWTwXrq/A6l5UefbKBYNliTHdLemX3mtt6CIBL+10=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com (2603:1096:405:27d::8)
 by TYCPR01MB6867.jpnprd01.prod.outlook.com (2603:1096:400:b6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Thu, 12 Nov
 2026 00:32:57 +0000
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d]) by TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d%6]) with mapi id 15.21.0615.008; Thu, 12 Nov 2026
 00:32:56 +0000
Message-ID: <87fqx628jr.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 14/27] ASoC: soc-component: add snd_soc_component_name_prefix()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
In-Reply-To: <87zeve28ol.wl-kuninori.morimoto.gx@renesas.com>
References: <87zeve28ol.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 00:32:56 +0000
X-ClientProxiedBy: TYCPR01CA0121.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::8) To TYYPR01MB15175.jpnprd01.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 0c36e101-509a-4f8b-abb5-08df40547f58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|23010399003|18002099003|22082099003|261009223027099003|11063799006|56012099006|261102130727099003|261102123227099003|261026121527099003|261021121427099003|38350700014|260925021311599003|260925022911599003|10067099003|260925021911599003;
X-Microsoft-Antispam-Message-Info:
	20x88xFNiydxrMIkSJqrdm9mDuWepvpF2xHt9c5OcJGLJZAVI9HMwCBO5HV4/fGRnv6yoM4ztWR/SkIL7eFprY3GQAy+NyVVR0g0fzL9Pc5Jddfe0ATBilzqBHbsjSdJ4H3nDk1qxiaFQkGdyTPz/z/bkXZYvbZEFP1tD8s2iwZ3KCukwAo3kPeD3hH3gkwwxa4dc9SJt82LIlKWTz9jYbR1foegm5ibw9ge4GULnFrx2yfFJIwPMQYNSw/bNWFKH/Hjus40cMBsTuW80/Hecyf5pRaaA+Ggy9iPFLIdTqbsJy7ypPuGaRC8E5mBwSwHEf4O/328Kz5cxmgpqBSJJYsGUbLsaqwo6bJ9S0WPYTbiR24TrLn2RbhRpIsrHXKpQynTc1Hut5/jjaWtgWt/L3pOeUNFysrRunAGyI/YTs+5145ihL8IiF4AZoD8D8ZScAxHrlAkQRNgsTFvWsVlrxfCTvWiyks3Kx2ZSbSz/DJ/QAj8E6hiKf4RrfYO0rOfx5hkbNgBwiRHAHrkEpbFh8Ewf6Lrb4r7oSPx6ucboC2YJudPEEJ5JzpwUxG0mK9ITtChlGJeQM72upAb0823/Ye87N+1lEsDUTo9Cc0cwsEWZhJykSpRNV44MUTMHwdBxgdZhXA+A4GtPyYJrhxvPk+xBvXajPcMD+SCCY0bQMltb0ZXWvOMA+Y0zvyQ0fEqxSrIbZMAM9pPVOVu36sWXg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15175.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(23010399003)(18002099003)(22082099003)(261009223027099003)(11063799006)(56012099006)(261102130727099003)(261102123227099003)(261026121527099003)(261021121427099003)(38350700014)(260925021311599003)(260925022911599003)(10067099003)(260925021911599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?qkVir0UZBXmIPAlOO6H/XTxqDQ9wJM2L7DI6cQQJKiQPivbdGvD/97S8yc?=
 =?iso-8859-2?Q?wgAAuSB1PlhwH8JO0FPislXntM3WJ931oivFUQaGh3CqrRTrx5xbWnAIZ4?=
 =?iso-8859-2?Q?9vbFzkgQWqFZ+KpMZaZ90oj19d/kz0ImuK3h2Mp/obyMc0wZdvab1/tKxm?=
 =?iso-8859-2?Q?kgMDqBaWsk5soJ9tz9vr6ssccZyxv66uip2qWTt+G7USji3TpnmVh+EXpe?=
 =?iso-8859-2?Q?qdIDj9CoHospg4HsT7NucPnSNTW/ANavAU2WnS6N6IUdaetr8KJYzgccf2?=
 =?iso-8859-2?Q?GDuhOk18bwF8jEFULtqyHIOAgPPmSAYHqlUpMWyeCMvkBFXWWJhK/jr4C1?=
 =?iso-8859-2?Q?kpwZR9an2aHGpY+Rqz5ouQhaWUzLFcHsnvyUahIgHt4IRKEPR1sRtj8+Hk?=
 =?iso-8859-2?Q?cWzpgnGIG1tpKIsdf49FoSWyg356+zquLRbkI/+k/7JIwzk3vfuSAnytWv?=
 =?iso-8859-2?Q?Y9FxQo+YrRUUoL5O4uwcEPZoMrGX6IJ2Tw361dXicdvQOPwRiHZG/2koHe?=
 =?iso-8859-2?Q?/sy1GjqnE5Xc6A5eVJZZt7OebC7nHB0oH9JF+5XC75k0tHdAfot2Qzp5ga?=
 =?iso-8859-2?Q?XvpAAdR9HMNxvzFXD3hin/bZWjIW8deBYC9M6CF4Qy0CQVON0SDNGeV39s?=
 =?iso-8859-2?Q?47a1LYLWXMKcOWJ6Pc6tq8A1QhANSob+UT1Q/4Pbu/4L8//XTF26o0v2pL?=
 =?iso-8859-2?Q?2NzFFmPOf5wldFxrso3c0wEdtpMO8qcKzrp7J1I8uBQy0pAb+zVhJdYZuW?=
 =?iso-8859-2?Q?9qA2BFHA6nSBt2b+VVMCQvjr+WyTo6PhPwxDvFs/5kiej7gz8rS2rdXDUY?=
 =?iso-8859-2?Q?k7qEc5z3YBDtB6S2y0YYWvfUaNmEkAppH1ZG6MmZ05TA+NjhpxglMYC45+?=
 =?iso-8859-2?Q?9g5Fg/7drcV4Sr2J1eh6Szc9WDhpsNOxrXLzUFgEuv7EKFq+aASm2x9i4Z?=
 =?iso-8859-2?Q?cPa0Jtskdz0UUDLTvw8nN0Rf+xS+is/5/nUd6owdUk1Hbdm16+6jqDYhvk?=
 =?iso-8859-2?Q?IXo/NAonVk2yP1iHOk8U8NL7K2ITm8E+GmFrYviAYIGlc5t+FI1uAJTnHL?=
 =?iso-8859-2?Q?bwXzeOuWGA7hpAdojIGpQ+eN72v2DZEn2G1eKpLiEqenmxmu4MmnPdWf3P?=
 =?iso-8859-2?Q?XxJjAGv/ZoMrvSdhgJPkNEoESHWfSD31ovhv28Ipxz1J/v2pkQTBQJRYfa?=
 =?iso-8859-2?Q?zIcuhR0jrapfpeaS7ManQUh0w1b3p1g8HgOg74+Ql5U3BpM2y2doqv6mNx?=
 =?iso-8859-2?Q?azCK/NHi3zz446Szl64zdp8vUxTxuAIM6AgXw0zpkAlEK7FvB4iJ3AEy1i?=
 =?iso-8859-2?Q?nyjBn4wc+ZKgI4bKuhra1dqykwTgLh7fyBnfdXz6VESdxfxCVtCt9RRVrH?=
 =?iso-8859-2?Q?8ENQh2YyZ74uxS4ald4m83wNiRuvnX3WCcY9QyCansaKBiBWMhaBSi8zV3?=
 =?iso-8859-2?Q?qtGlA0oB4vSdk8YxjQ4Sg+3YbmgtytQeo7ztRg2POTHGm5cWgXqPDcqQ3o?=
 =?iso-8859-2?Q?lyzMJYiLRLMCtC46yB1aLKX5O3yqZF0n/Bjx3IOrvz9HBTRSiFvV5PomPW?=
 =?iso-8859-2?Q?OzHxDQOF/IU5Sm+Pig67mhqlYIYygNtpsEhsiCdLqm8Wc6iy/HphJpBqHW?=
 =?iso-8859-2?Q?0ctnL1lbR/25iwj0VhDBJgBvdDF8r5qkb9VPkK2Wy3ENwYvC3Wl5YykBaQ?=
 =?iso-8859-2?Q?Nk2PAG0YKQneVfx/afxVc5v2KiihZSCdz0QEEF1Hbo7Gox2ksVjiQe0RQG?=
 =?iso-8859-2?Q?52Lv5qYKfPVkCQHNuvDt8KOuxNt9JfdXRv2VFiN0IjM6THYA7R+v+GVBMG?=
 =?iso-8859-2?Q?cYIn3YxbjyyZn8sJt/aPs2+3Q6I/ysJZkxsPlotnbI7CN6H6A74A?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c36e101-509a-4f8b-abb5-08df40547f58
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15175.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 00:32:56.9128
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CpDIoaXyzI5ARTk9juGWOdZty8e36MrMXTPIZiZPlKvzkUVRnoPjku30P68mf8ORjNy4ZJdOmSuldBHH04eEY+CnE2OCeCH/AShmesoaZeNrsy/sclyHtoMAfhn4u2gb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6867

struct snd_soc_component will be capsuled soon, its member will not be
able to access from non soc-component.c.

Add snd_soc_component_name_prefix() to soc-component.c

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Alvin =A9ipraga <alvin.sipraga@analog.com>
---
 include/sound/soc-component.h | 1 +
 sound/soc/soc-component.c     | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index caed32327daca..e78e0c9cc9d0d 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -289,6 +289,7 @@ int devm_snd_soc_register_component(struct device *dev,
 void snd_soc_unregister_component(struct device *dev);
=20
 const char *snd_soc_component_name(struct snd_soc_component *component);
+const char *snd_soc_component_name_prefix(struct snd_soc_component *compon=
ent);
=20
 void snd_soc_component_set_priv(struct snd_soc_component *component, void =
*priv);
 void *snd_soc_component_to_priv(struct snd_soc_component *component);
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 0a89fa8cd7fbe..e3156189343fd 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -43,6 +43,12 @@ const char *snd_soc_component_name(struct snd_soc_compon=
ent *component)
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_name);
=20
+const char *snd_soc_component_name_prefix(struct snd_soc_component *compon=
ent)
+{
+	return component->name_prefix;
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_name_prefix);
+
 void snd_soc_component_set_priv(struct snd_soc_component *component, void =
*priv)
 {
 	component->priv =3D priv;
--=20
2.53.0

