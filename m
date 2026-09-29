Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011035.outbound.protection.outlook.com [40.107.74.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6633EBF0F
	for <linux-sound@vger.kernel.org>; Tue, 29 Sep 2026 05:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790659809; cv=fail; b=UBa+0Tz35QNEgfWULjSmi3GRgNJpec1E36abMfe2yjXbY09Xx0Lu3Y6ANOhQ/S1xjAD2s0tyHPl/e5zKHwh9DQK7KOFAXtJ6R0DEp9F/J6E0VKj7ITfSYaKwyYORDzvq9iDxoVD/Qy/MjPxjxvuMklZ99OfLRyj8SXtrkW6TkX8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790659809; c=relaxed/simple;
	bh=aznnGwclwZ762VBkuQ8DbcMIbYY/lqa9+1C342Ojddc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=iKgMS5FfoeZ9Gg8f3w2XL/HVojQ+UwNpLfGb8rrWC9nfiJHWftB0js+astePUtqqvsjZ6B7D2eMrm4p5PTG57rqw8WaPOD14VNvelYpk/vD7FH6v0Iz5wyOkz0wwohqaVTV1ZPB2ZZSiqO6BEEdszTPfHoK8uR8V4nVjtunB9xo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=mrrophmC; arc=fail smtp.client-ip=40.107.74.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="mrrophmC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bYQau232mQ/Xs+bgMdjncbfp6wgE16wyl9bwYCAM2RHECO0sfKnRtht9ShjaKBDxTydNH4VaW5bd/HgwJB8NQ2Q2aonMyJt1EnZQJK70VCVgN1tEcSxDEHosITJ7SoZc9PX1H2bGwxJKMT7FimqdCtzaTKGkayEq7SfkkI9fRTq7kSVMusttnOeLliLjFHkt3BqlgrXN2aRrx2Z5xZL8D+lMXYJofMBocO+8h10YIKxrXvcnwTWfwzQnWHQprAs/t/N/WzKr0oHyPYZ7l0kLFFPIFJfDMVZtXsvaaHcyZZOMA3fwlqJpFCWbAIfkyDN+7+t/nFz0B5WUR1x2nnsCew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DLmeLV6DI2+l2ekQ5otXRBaQEXQk2yhoAoOUjwfbAtY=;
 b=YeN08cLLH6u7fY9zNVVXXGDE5pvu2LwuvfydG+cYfvucx1jYZGkgcxLCZ3XMDANb2qCuqNUgD9IxbCeSJBB9PcedU6+r0g/rbla3P+54G+pTWCNT3/qUntqfIlYoviqKqdbvA8IW6vLvONLBIlSV+x6RovpDsiwQWul+BAO7bLdzeu3ePzz4gVw3yjQuf+CukKvP3WReeZJLmoZm0YsA1VyKVadF2iXYglJzmc+Mr0UHRbeBpYkTF3ZbY0n0nUlvJbF0cy+0ZIJxrlZj4Pz0SLT2LlMpSL3/WKlqeTcCIu07m6+146zrnVpP+mI4o1ZAEM1xLQyl0gXuvs/hF0lB7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DLmeLV6DI2+l2ekQ5otXRBaQEXQk2yhoAoOUjwfbAtY=;
 b=mrrophmCkMiZmtz+65PDLwHm2yKmFdt4sVveTlj/0BPJ5g/7Q7LTmr9n0XbJONchR3cmiyrM0F7NpzxeuogVLJNzHwMuMKbQ2+bEDdIMf4GZH1RICZEq+nNNmVXmkwIuNFxkY3nv+CAu1OlPkADip846BHrH4hX5siUqpANEa2M=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12) by TYYPR01MB12208.jpnprd01.prod.outlook.com
 (2603:1096:405:f3::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 05:30:06 +0000
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45]) by TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45%6]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 05:30:06 +0000
Message-ID: <87ececeiaq.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 08/14] ASoC: soc-component: move snd_soc_component_to_dapm() to soc-component.c
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87pkxweibu.wl-kuninori.morimoto.gx@renesas.com>
References: <87pkxweibu.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 29 Sep 2026 05:30:05 +0000
X-ClientProxiedBy: TY6P301CA0014.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:3be::19) To TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB14118:EE_|TYYPR01MB12208:EE_
X-MS-Office365-Filtering-Correlation-Id: ad8cf098-04f8-4868-44dd-08df1deab825
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|23010399003|18002099003|22082099003|38350700014|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	Si4BshUVmvIaOGWHqJJdt/TCVL6C/RB/XNK3GPPEkQG2JE/3Oqndzay5lA6rvk58NjuFJ+u4emsDZw0W0v9OI6oPLreZa3hj0dCivUkNQwVYl2m4NLYP0Ul13rjwAGgOWgaeM7hunRePfxGJvO0vQOkf24kv0NKVKiOWQNMnoX1epwXrv8DCRNPR1Qu5+yxnCGF5X8GZzaXZJKPtloMsUD3ByONY65UAGlelun+kDL9yT8pxtmtVPsV5TWCdlv/tg7iymLsOteIkXumLR8E5UvmFHPBqVtuGNjP8HtsZdF83csak8dNDFGNClFIQDcyHtrN09rtVv3Sc3+B4Hks5OUlZYjMiGH0bfOFWxYzqfeqgI9n5RDZ39sxiPBek0+3FxW1ElIidzCBIyX95uLA3bxp6JAiBjPMvuH/T9Tx/jUEMyGbhVq1nfpewXPwRa8ofMQBT79+Whlyihxe2lgm9MQNMqRfi/cQGajlsx7MZffK5BNI0jiQYBp2g6ZFaMi65HtNFwe1mKmrtw85WCFb+4REAPF+J8KxpshmLiva7XVwr+kIm7FbgoB8gBUI8IbgbDLIVwrBOiUJIx0Af+txOEnDQrobi84fvU1tL2E6wGU0qlNaEgf1qodtQfr6VrIiTtav1ASD1P5zEMpitbeqb6k6MNW1uJz/i8bqKyNS444WMQ3r0kyL6ysKI1oe7ywTBQ7NxVVCBlZ79ROVHGfJQ9OtbILUQ4GPlvN0hTkadP/8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB14118.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(23010399003)(18002099003)(22082099003)(38350700014)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cftAsNMXqYR5AkBsMKFGJuF1hEtDA6ZwWVYdJWzoon3dhsxP/Qh73QOEaTDv?=
 =?us-ascii?Q?H1wV5sGYX5xDYbKelaeRDlirVCfILVkzBfxmlLOO1LBN4N23IBOwrnsG5Auk?=
 =?us-ascii?Q?BD4PnoUB7vAkE70e2h1obY4bmy97oPsOqxCLeb9hnOVDpHbPALyZG4UBaQaL?=
 =?us-ascii?Q?Ay3tpNz7pnY+Hm+sMyF84IVj6hbo2UlFIED4unVDFeXmUBrf+NrOnhdln3LI?=
 =?us-ascii?Q?J+Y6leuiHoeKNriW6aVM52gLZQkTW1PxwT80wuwq1xDegpI1bG8gutYqWkQj?=
 =?us-ascii?Q?kQ7/yJVi5sJdq//jE9Y5GWy6pM29g9AY1pJhQQS90KrlmQUggHTgNzxyAxJz?=
 =?us-ascii?Q?E3Ckt5gc5jU+oOPdjjQJSZg12MaxRnraW3GiALvBOWwNmbhgG5TwV6k6Ji4h?=
 =?us-ascii?Q?pBy7VmycsuNCaJOxiOD3fwoBjtbbzUO6pqcr3MEYB3ospiyw+8j2xrpsEI3S?=
 =?us-ascii?Q?ZrrTt/Qh7Nf8z+PMXtSl34ey/II4DfrOxhYqsy1wogYYgcRj29FyTMJgnSIX?=
 =?us-ascii?Q?+DRtrN/u8cvWeMfPnio5AHjvO26oQp0RPZL6m4JDYCUnydN4bSykA3j2vSup?=
 =?us-ascii?Q?2md6UYGm5+mhh13VpHNzuCZ8SnGvCE151mUPsAOr05v7Wp3AWZOdacQtsB3d?=
 =?us-ascii?Q?CB9An6u/hMXVWRa/Y5m9tqA5vCqYZxvl1JFr6wbP859ddJLe+NC6wq2uajbX?=
 =?us-ascii?Q?dFsK2p9JYFktS1L+Wgq0Iudkn5IwPiNTfHPKMkJNYE6OJwV/d/jJINvTVsX9?=
 =?us-ascii?Q?3BD+UZgW9a0T/TCDSVr6NfKrmKLsZVsavguk2GgOdUK0ZLE1YSSl+7dGKxOs?=
 =?us-ascii?Q?AmwC++rz3mhyQbMHL/atmc5bKncwgFAVBNiSCDgdiIaDZG5v6orGfRWSMjxN?=
 =?us-ascii?Q?PBf+1swKjmKUihzF4p0x9+rUEBrdCQCGDqRHBMenu1JSIzQlwZf9T+agaAL6?=
 =?us-ascii?Q?Qq4P+wjZa2iLvfOjqKoZMOAnsUf7LIXSzJYCEMNXy5a+b75dUrER4OwtmBAo?=
 =?us-ascii?Q?yzgVSMXHSWjE9uFM6VK2sLQlk6rC39oJDnyPwVksofpeP71kSOww721L8bmC?=
 =?us-ascii?Q?YJ96yg1nPYW6vtHt/XQqk/I8SG6Xs3tN2FW+Ns1DOdBO5Chbbh6MNTGUCch4?=
 =?us-ascii?Q?eOxX8S11Pka8HrPjEUGTvdF+GzyoSTj/AUNVv+GfTv1XEefvsWqtU1Ybf1D4?=
 =?us-ascii?Q?y/mSr1+d6YhUDrlMo/a0X8BInUYD+QIAgw8hBqN4H0+PKAk7HZht0jxuheLu?=
 =?us-ascii?Q?eWy/hqUpKrn2upb6ZfOOeAhrqVoKCtVd0UYdjdNhTOwCjYPoYGOGa48OpIT1?=
 =?us-ascii?Q?GvCgg6COYAqFxvWmYk96jkFZbsKysej1j6EgkX+hiRcBysyqW9f63fjmm+rv?=
 =?us-ascii?Q?eXjwQnPMDXQoCl5wbHN9WhWJfg9gnHscJp4C4ldnv7lbCqGe80FqeMVOK0BW?=
 =?us-ascii?Q?z3Rvb/NG8ODUUlrW8u3Ux+gw+9bweC1+/dmy64MDZgnYF+ta1NYd2NmX7CzT?=
 =?us-ascii?Q?U1ZligMFN6jHzk1HfOYknraGtISsQJFoAXpnw7U633Zq1ok1scDqjypKQbHy?=
 =?us-ascii?Q?/Cl4Ejj/8wsU06FII8wWKp0t96c3S9DO718iquLGDfvx7D6NCNgJWnL3BIKR?=
 =?us-ascii?Q?tt8UtZQyhpfMJdgiKUORL4CScSb6Bbn98008VJ0egKLRvW7hCl0V6NPFiUQD?=
 =?us-ascii?Q?GXUNq8E9G0HOAKXRT6eofuvxWy/p9qWplvu7B8ardZLrQGUwJEcg0x9RGsSo?=
 =?us-ascii?Q?HhJMqT/z6uXWesYj32dFhM4Sg3NzXbZa1HTgdid5tO6tYuEABesf?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad8cf098-04f8-4868-44dd-08df1deab825
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB14118.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 05:30:05.9867
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NYGdYyCDBsULStLY5gC6ZNMTBfZktGFXMaNAkJSiJ30+C//xIEg0tVl3AEkTa7nk8V5+DAhLCg3P6gtFeQ35sN1oQ4FjVHOZ7i0esUd2CaaB13fHXy9JSDI/kNNxzLzc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12208

struct snd_soc_component will be capsuled soon, its member will not be
able to access from non soc-component.c.

Move snd_soc_component_to_dapm() to soc-component.c

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-component.h | 11 +----------
 sound/soc/soc-component.c     |  6 ++++++
 2 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index f2dccd3c9ca8e..306d61b2cb5eb 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -272,16 +272,7 @@ struct snd_soc_component {
 	     snd_soc_dai_to_list(dai) != &(component)->dai_list;		\
 	     dai = _dai, _dai = snd_soc_dai_from_list(snd_soc_dai_to_list(_dai)->next))
 
-/**
- * snd_soc_component_to_dapm() - Returns the DAPM context associated with a
- *  component
- * @component: The component for which to get the DAPM context
- */
-static inline struct snd_soc_dapm_context *snd_soc_component_to_dapm(
-	struct snd_soc_component *component)
-{
-	return component->dapm;
-}
+struct snd_soc_dapm_context *snd_soc_component_to_dapm(struct snd_soc_component *component);
 
 /**
  * snd_soc_component_cache_sync() - Sync the register cache with the hardware
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 78b348269707d..9b89061e4675c 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -68,6 +68,12 @@ void *snd_soc_component_to_priv(struct snd_soc_component *component)
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_to_priv);
 
+struct snd_soc_dapm_context *snd_soc_component_to_dapm(struct snd_soc_component *component)
+{
+	return component->dapm;
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_to_dapm);
+
 /*
  * We might want to check substream by using list.
  * In such case, we can update these macros.
-- 
2.53.0

