Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011049.outbound.protection.outlook.com [40.107.74.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32DD618BBAE
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533504; cv=fail; b=SdPHEXUSLJDPBOudTVnALwNd0CedhKuf4CReERUM2NmC2AbJ2mGEfi9Nr30PfT6r4JWm99lxHJEG9CLC45YrAwTSj2AWp8F/tW6WXtOlj7xskiU6Os/LBelOk1fq5RdXCJnUQ7O4cW7LszhLI+EwqdoD3+jhvhXOrksp3gtdcm0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533504; c=relaxed/simple;
	bh=ONB9LIKYz6fIRsVsNhihrpIjWlxIh4t0G+CoWMXSvCI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=q82pRUdIxENGOOpOQCP73/qVmG9SI7qNufboomnvgnjzjNTcdr2hn8Ok1iuPC5bIVNEPC6jbRHYqaZj+KMyrMJ2E7EredGd3fVoQykjC5IM8lqzltXzTfdCEOQ3VPTHuLBQLnx1IRtIcy+wxFwhawUv9euDcSJScverF6korLzc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=lJEoPwXe; arc=fail smtp.client-ip=40.107.74.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="lJEoPwXe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dt3uDYVYUfDRXFocYY2c9o8sXmPSIZGBh8uPMFUQqKVSJtalh489JaZILaR/zgWZgmFpnos+aezeF6LrmVOiuJHM5LALoDTUhSFS9ARNEW0Cf4ZYOm75YS5toZsHgqXC5wrS9xa3fw1CJgvm4Bse2sBnzY0E8tJxpf0Tk91KBs5fT3UgDs0Dl7IkEY+GLYYVpupiKSUawfwwfRtR9rn83hSq6LYKFog7lhTgL2pFaG0xTV2qYREy4l6GXVy4+8R7lpGEYA1MktJEVK1QPPCRIhMWShq0LJGmOogTbaqErm03gGJdBWWBvopVt9WUNjP+7lMGhBU5E+X43j2BE24QiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=onV8Jlp89KlRb0DxSFM185JkJyf9j9mw3jpMRF+6eRg=;
 b=WJ5rove+0tBaY4YV5sWGHriChzG8gQzIsTyAlC2GLGtYoY+jmg0Gjka6+uFqYo4agnt5zLJoU10HO5Khtt6kQC/QPDlojZdu710XdfqMqPAr71ak3yJWAeNGW4d32YFMLkZGYS9ysK5PQvf1UrdYek39fWdIdIdT5TjUvQKK3eMSRtAl8D4+zLTFrmAvm0+JYMDXTbCnzjLBa3qKLAlP5ds+q1ZrsYlRbRl3xV7St0DA6afv3avTqrZCuaLWRBtYQ/CfZtA9j7kUK9bfpX5ZYK1Waxph95cCFcrQrg6Tg1Ec9NvaSXwqablYjZ1y3U88NFZdBscXw0wRISJwQufJaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=onV8Jlp89KlRb0DxSFM185JkJyf9j9mw3jpMRF+6eRg=;
 b=lJEoPwXeKMD4wcZ9LqunGtFxO+qDmVhayW8CtlOnxVEWbtayfs2qjLslJNx0lCU6ry8PujwHBC70993yzKHgvplLem2UaWqxZ+JRqtrA9h6ilgKaUL3EoszV/mndSSH5E0cNKitP80NQFyLK4Kst/CYU36DXShWsqfbk01EgyJ4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB14997.jpnprd01.prod.outlook.com
 (2603:1096:604:3a9::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Wed, 26 Feb
 2025 01:31:41 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:31:40 +0000
Message-ID: <87frk1fq4j.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 025/157] ASoC: codec: cs42l51: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:31:40 +0000
X-ClientProxiedBy: TYCP286CA0285.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB14997:EE_
X-MS-Office365-Filtering-Correlation-Id: ab1e6941-c1bf-4193-6f77-08dd560551f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cvMMZbcDLx/12Grcb2BM9wzJbNwdMVTHvrnlBHgtBB/t8wT091HKdJPtlirQ?=
 =?us-ascii?Q?eA/0+rEJvuvzjSPuM6CLOYNyK0wiLPGWF06d7SJeiJa4GbpZrIdsVcNYmPyd?=
 =?us-ascii?Q?YM63T2AJm/3KAqQAKFgnpl12zO4Mg5t6BdEGnK10n3A8LJv5f5WXEGX6tGXt?=
 =?us-ascii?Q?STw7eoh4KFD+5WsRzHAq5j3cO8FkIE6sSuu3kyssNPZx74SCPrFNxAPnIrDr?=
 =?us-ascii?Q?tWRImUAGnjP+ibnxJ/fw2fYskZCr4ABsrkA2/zmngxW811Is8Juo7sLJd6fY?=
 =?us-ascii?Q?zXy67ikXQdA7P0KqQ0WV/z0VB0WZScSEnRNLhbLrhRNP0wsLtWH4YtLFcUdv?=
 =?us-ascii?Q?r8oEohtYCBdSkLBe1eDCGKgYTpT7el3yUhqPN0Fgc+T0JQT0GM3o3lZRfJPJ?=
 =?us-ascii?Q?NNWCAPtBW/+IQ44qnpKpoCQl1ksi1XstYtaBNt5N9jXs2+OdxJZaWCScuKlo?=
 =?us-ascii?Q?KlZ7I+CC7ArGZHFONbfFU0UNNERQdC2EjQl/oz3NxetmEcZRJa2LMafv3O7m?=
 =?us-ascii?Q?xwElZlqiO/PGgJ5+g8/E/M/JbvP971AYHKttAJrStKtNmETP5yRGuy7/kYXQ?=
 =?us-ascii?Q?DGJSQCmBEMRuTRZ4BNlZmN2gKpzUx7DBkbgO2g1GVgmIx3mFwHVtsEztCDD/?=
 =?us-ascii?Q?mpjz3048Rpvqy6xE1fEM4zTGPyzM8+siuVIgTri2+QuH23nVqiw8GlsPy1DG?=
 =?us-ascii?Q?NTAkXc0QvdmodAcT0/QIK8KlDAJyJEQkldE0YNP3gV1PG3W5AQFY4oZFJDbz?=
 =?us-ascii?Q?iOuV6QGx3B20QsHsWKNyK2arywD1zf5b+Wztvbxkkn2BP78nArPTyFPSG6oP?=
 =?us-ascii?Q?GnLsqUaG+0FWPbSBByTankm5DJ5562HoL1f5ZSrKzh8qtZxJto0vlpCIqDnA?=
 =?us-ascii?Q?jL2H+/hiuNzjb0gluUyFGudmxirPQ1CSdQ4aq0sbkpiPWQK0s8GZJnCWXaN6?=
 =?us-ascii?Q?+6hxnArNtNmQUYRx8ziVOjON5iHiO2JzXrR9paWw8/r0QrHXn41CaaICtmCW?=
 =?us-ascii?Q?mTnuj20S/TEdZn2E1qYalwynXnfRB0NzaKUonDvKEk5eBWqfDh42Es4SOEun?=
 =?us-ascii?Q?uscNJtTFiMrwFn6fAlYGeiPmxAOjXcMJZjmwsc/aWnLGwDBQlehZWdEg2MIc?=
 =?us-ascii?Q?NEQ2fVI6YhoX3QhOF9le77+9IAKVuey7Y1sEGXkGmtN6fjkaNEFh/qPvZdDe?=
 =?us-ascii?Q?ZrDlBAu+3B0RlU1nyAVduJQ5gH77O3y8RmZ+D3rIjpthcz/UAnOkxSRd6zDy?=
 =?us-ascii?Q?L+GIpYgnzb4iswhGDy2zXp+A2qnvttB/covL9U9OMlAxS/3nOtM6D3kkSa3f?=
 =?us-ascii?Q?n3NLH1wWa3dLE/Hjkt2JPS8YskSfHiUqXQjkurifC2ehjSslfSmwbyVs8t/j?=
 =?us-ascii?Q?bWV18XdgMDzucv5BKYJ226Fp5cJmKQYfAEBlK7EwMq6ILIQeepuGk8VzECab?=
 =?us-ascii?Q?nywFD5eRPgNBbmmgswA/wWectiUs398Z?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RY8Ey5ZjhG/c6B27ESmljdXEi58CY4Je+wmPreCbZN06fre/8ellPesGsLwb?=
 =?us-ascii?Q?y+SCSbGgkjHDjw/PCe4Wcn6akjfu1oPq8lEM2/m6q1cFUydymBhwjl0BZ55h?=
 =?us-ascii?Q?rRYl1DlHn/tZmp4YVQTTvvj7MPepIpsBF7L9Gev+xjm+UNFL8uhV0utbFYBj?=
 =?us-ascii?Q?XYIaqBA7Sr/qh2oKxs7ezW8S2jmdkExWcKmXD6LOGPX5GkGqZeCAjKDplGOO?=
 =?us-ascii?Q?KCfg/RV+YpQe1Aa6B88Bd9WsJJHPunTMxR3TA6oieKgISCaqO3TgXuyl6LxJ?=
 =?us-ascii?Q?lgr++mPJiDE70MMRoKjHuzBN2By7KBxMX2sjqRDZ6lTqdBczYcrYIOHRiY/J?=
 =?us-ascii?Q?y3l3chDe9FCA9c2BnU0/50xr5xrnJYgcaqVtWXOR/gYfii3kE7Ecv9yuiPEX?=
 =?us-ascii?Q?46CG/Cn02eGmbAJPKM3lrG1m2dguGPLI+XTMwLgkSVTtdZDEhBoBQBcBNtBo?=
 =?us-ascii?Q?h915H3Hiw04eYo6e/pxwkzvm8duG6X0E1CKJYslWaDgRdNuZ3MNmbCJwcBZf?=
 =?us-ascii?Q?Q2FAkziiEMxnbS6CH67Z5VikYvvfJ4PoJbK2izvkRxTeH2Y7z05PJHnKaRTC?=
 =?us-ascii?Q?Sa049sYRzRZe9z73LCcd/5vofM3qe1B42W0ts5LMJzukEBXNXiQ/EGs9sjmj?=
 =?us-ascii?Q?JbPi0aHielDjL7ZmWXIP4CHy+8Y7hqFZ+1GXHXfUDtJUPX/2YO84CvFvEeu+?=
 =?us-ascii?Q?wtEpfOhvwsP3sJo3LZFlOLEXzqQknnktOtoCutfIBzOrK2l/Ykf4U5BVJqlx?=
 =?us-ascii?Q?6LTiyFEao+fPCMId8fY8svt4Wc6QPu+NQer+A7h/OUSoA3CRmcZmoHSl/RDo?=
 =?us-ascii?Q?AWZIRIRwHzrktHABU4Ghuy+ynbpCwBuO4GAeH9Ia5xVCJTx/NQMJKPW8RhFD?=
 =?us-ascii?Q?ov8l+ksoTy6A5nJeEn0dXUuR6W5uJq40n3v2ZDUB6tOMA4sRlHGaRIOIjDeV?=
 =?us-ascii?Q?nXNBhsWYY7e/u9K6xVgtzgSa24VlT/Cf2qQ2jXVeDRqhCIk+y83JWTRox6UW?=
 =?us-ascii?Q?4srJlurYLu9RDJA8AVTENp/nqxQwqZp0aiAUSUeSc+g+XpTXyfwpezDvgKct?=
 =?us-ascii?Q?VukSDTFGezTtr/NdOKQtJDcQk3f5Ypz5oeCSbRh1ZV8oJRuTbTJ+TIjVne+V?=
 =?us-ascii?Q?SPdZpUN4bwlnodlQjs3dlBlYc/+WoZXfqxw/GKI1JggUJUK5agsdM9+QJMFE?=
 =?us-ascii?Q?H/9ld+Unr7zqqATlx7Kk6VH1aloMHTK/QWOSWihjhxl5BeYdM1K7sllnSoEE?=
 =?us-ascii?Q?xxzQGf3esn18JrNtorNQT8bpLhiV1x/iWCcjuhWfMBTCwCGiBbqbv6dXO1kc?=
 =?us-ascii?Q?ZnnZG6sQOSCnGA7Wz7HjhjdeEvzpjxDzVFlCzyfgIWdd2sA/80luXCnlvV3s?=
 =?us-ascii?Q?sDVCCDsrNDrodQsFoluEJUy9LT7kMF4U1HuioO9WakTKGW9MPuQbxRaffUch?=
 =?us-ascii?Q?Bxh4gH22oZYMtIVuZ8gajT2RFL7henM2zRypuUBH3z6vucw5WubLolaIiSE0?=
 =?us-ascii?Q?uqSdbTSsg7n0VQSgh2u6d3ZhRfWxRGpuCS0xsb/THU4KVU7Vf5opPRbEjEQC?=
 =?us-ascii?Q?q/k7Q4WtDGbiEvAHwmcIkS1LK9e5YxFcK+X2vPRidNd1Mq4w1xXdNLS9xMuS?=
 =?us-ascii?Q?DfO2GS1tvAYpEx651pcNVag=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab1e6941-c1bf-4193-6f77-08dd560551f9
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:31:40.8110
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IHhKtsNogV5zZ7V4qMmHc/RIqH0G9uzf5z2ptgtRoFYuvXwUgJF3ttkOgeZpCXS1AHRVjutKs6gHdmOZMIvjGb1AAeDhKF7MnDfZlq9aGc4P7MbccBytDzJj9GduEPXb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14997

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/cs42l51.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs42l51.c b/sound/soc/codecs/cs42l51.c
index 6e51954bdb1e..0602d03095d6 100644
--- a/sound/soc/codecs/cs42l51.c
+++ b/sound/soc/codecs/cs42l51.c
@@ -322,10 +322,10 @@ static int cs42l51_set_dai_fmt(struct snd_soc_dai *codec_dai,
 	}
 
 	switch (format & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		cs42l51->func = MODE_MASTER;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		cs42l51->func = MODE_SLAVE_AUTO;
 		break;
 	default:
-- 
2.43.0

