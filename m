Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011029.outbound.protection.outlook.com [40.107.74.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28672D8DB8
	for <linux-sound@vger.kernel.org>; Tue, 16 Dec 2025 02:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765851291; cv=fail; b=mS2PGhU/ehUyRnHepn9po2HV0XSomCwFKVMas3P+7xf4RM4Tc3+8vAfH/PH4cDTcDuBaEZaES6UFvvwOAtrU5xN12V5bwkavwdQ7TEQxXdPCaHb43wBvqca8yJTxD3qL8snayMnGT4gyIlb9Rk1qFfnthkbi1xnpnjYFnn/bFzI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765851291; c=relaxed/simple;
	bh=Zw551o/wiG0jTVzZEr86kfev8RgGLia44cr+AIa47hk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=KOPaFu4+MmI68fGNcwfUK/FAmEmiU9/U/iDiL3vVFI2STHFEcVaIeTJ8H6gpu3QqJg/YOMJ3C+mBMeffm4thN/IWkDohe80VNAJHhCp6c85ZUJOuRQ2s71srByHliZoNUXXBKlln2giXwEomv9vhqFppe5n1lp0xoHEVXOx3cxo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Pzes54v4; arc=fail smtp.client-ip=40.107.74.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Pzes54v4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PvyZXphcKNFeNRcN4XuCjaF1wuiD+p0CGzq7VGOuo+aNH9rfRKP1apo/rCocBX0qv8OLTdlJKpCuSeQ7B5ewtCSNDE2Ewrvvob+hb2Aw/Np2xGiRRjEN20Euh38OBGYw+mEYzJmIcRpafbp88nH6hgIDMfS5XUSBvVxz7f85JWINBtCfNmtdcCvdCgAWtCv+vKd4eV/OUijfbVOGqu3ZfhDc3cM8EC5gSI18zCBDOIWkxgLq3dJVWXQtFC+yXDXIDQJ8GmmeX304wSEzWDBaXKuXFER3GEho6gXYHS0SgONXJjjSQVFWCQyMVkj3WgKcMrZSMVkMmu2w6KuFTFHCbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dWC4m9yxazlQQt89dOeMwymXMzNVbc/RgYySLdk6Q8A=;
 b=Jo56B9K1JL0o/AFQCje8VHP69yZ9UPW1XsQvnW8PPC8plJaC5GVyZjr+mfEQhBzxFcIcXNEGSAKivdQ8OnPMlDPVoPCsEp1whKouPeA6yFEtHYhDTmzufz2h98MjzY5xkZdzidSlvf6yljPOzkWAsUfhhzkOFwErlQRxHN5dFZED0KqcA4jQx7P3RBpUa9Y/1oAHpCQ3+R387WIpjMjoTKgveDVt1Bs+ot4EJQTqRIjlRzBCIwG4n4MuAF1HAOTfDEAcc/CNRGssoB3W05YT1cHrHraQtIFiLPPp+daMsfE9hD1/W1T99S2t6L4debMWaEcpQ4bBqJk3qA9fGHLz/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dWC4m9yxazlQQt89dOeMwymXMzNVbc/RgYySLdk6Q8A=;
 b=Pzes54v49asiEcYoJgGOcoRk3Xkwh4iU8Zy1uqbtN442O2F6g7gvI1V0JBZ9mubrqoM907AybaCWDIy9/Fci6VJgv+Oj0HV4HV09wi+EOvsqb2ELJd0BYZknMBCfiidkqkA6/BvDzeLMfgeae6H3Vb3P/0VmP2KxYubfz7Gbljw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB8637.jpnprd01.prod.outlook.com
 (2603:1096:400:13e::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Tue, 16 Dec
 2025 02:14:45 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9434.001; Tue, 16 Dec 2025
 02:14:45 +0000
Message-ID: <87wm2nrx4a.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/8] ASoC: soc-component: remove snd_soc_component_xxx() wrapper
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87zf7jrx52.wl-kuninori.morimoto.gx@renesas.com>
References: <87zf7jrx52.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 16 Dec 2025 02:14:45 +0000
X-ClientProxiedBy: TYWPR01CA0021.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB8637:EE_
X-MS-Office365-Filtering-Correlation-Id: 68927766-82ba-4ea5-b5de-08de3c48e1d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?w2oLaKkzxw3ZXdEL+YfgCRMawwitWm7nFF42hi8zxzb1GQxPu0iwWA7upDXH?=
 =?us-ascii?Q?lx8Z+ZTnrteQfOdGFlRFWfNZNzrFX48sSmrxJpEvVRU9s63mSqOxMkv/MIza?=
 =?us-ascii?Q?8XXczsLwBOXgKqL8j/miKLSq4Q7KWHJ0UGAf5+ef6Z+I8/IJj/HjZhE/IPer?=
 =?us-ascii?Q?hixw0y3GpFJFfF7YwIWqSfqQ2AP1Q9wDvgTBfX6S3b5NnWRPtE3PNSmyJ7sn?=
 =?us-ascii?Q?2kUE1/rLe8moQgVwUVXUqXE48JYL2YL8nO5FV4Cv0QIayytbYpoViAqQZSLI?=
 =?us-ascii?Q?KFASbxQNm1lh417SFi+Bhm68wxq6idUEeMQN0WQDKnj8fJ59WmelAeqTSoAU?=
 =?us-ascii?Q?N3cJkSVTmGKs7dj/c5vPJn6jOTHS2ECjBIiFa2tLOJtVst5VlarmIFo3AhGV?=
 =?us-ascii?Q?w6XjyKW5lBwYNQJCI7slR8PA4R+Ri2u14/9tu5GzWszQvpoNnid1zYvDvFi8?=
 =?us-ascii?Q?P/iItQbGaR9Rvjyo5FXjWzhjvAhDI//qTxS9Dq8GfyBKHpdzkEtZVrBqiLv8?=
 =?us-ascii?Q?YxxziFUC5RK2/QxtR3SrL/eRSp3HI4wcoIkaQspC35koCsBZFP0woFRw4mrT?=
 =?us-ascii?Q?fnw/al16socfMj3Dqbr8AWXUL0gt/8Du+4eXEMOBYaJadiWCStDcxTMDLg6K?=
 =?us-ascii?Q?yhHEh4Q8E/IXUWE1blM4GxVycpH6lrbs33FcI9OA/SsNEgTjKt8G96UmL3yU?=
 =?us-ascii?Q?IqPoyBzthzDxgARSo7KHXIIhdP0GCMZ4lSYhYmAoFUyMfxq3hNfzHh6eLmPL?=
 =?us-ascii?Q?klQKuMw58kmYhrV51PK0HHyprugeAOBmoUzDh+4HlGGER3jRBYrHByO9cyV5?=
 =?us-ascii?Q?LSNtNERl61F57CkPO81D3yCOjdg4c6Q8fyG9pwKcEARhp/TorZ2EKE5jqeTU?=
 =?us-ascii?Q?OYldxq2qhJ7/P3VdyZm4iAQcwxb9Jj2Z27vpmnjkz3M8PWizclMrQe7ILB27?=
 =?us-ascii?Q?tu7X6+oTh24rZ/XLZlZ1Pea8AJgqUY4ogPRrCNBFbynD9vazXNtjgg7x8v+d?=
 =?us-ascii?Q?NFzcanqRkjiJjWxla2PQGhYXgLTr1vr3C1H7PFCV/qxe0TZLc1LSC4NZCauk?=
 =?us-ascii?Q?leLgVnGl6LuW+TLsbEJcaa3RORtmnGUeciCU74RFeoCWj3MUYyh2HXsWh2A5?=
 =?us-ascii?Q?2+EoGzvBCOUytwNT6pXr8jSiCuKfrgjnVvtq1WPB8MbgIe7XTf9JwqbcsOeK?=
 =?us-ascii?Q?V2lSWWJ/iefCf0mlQbbH0X5wTX6EFv0rxa0dOaKQx9h8kL065/yOpngbWzu5?=
 =?us-ascii?Q?vm8kHzWLCSUV9OqdwY21w1jEH2JpwoUjVrawHtIHgtX8n0VuxLjap+pnjtWK?=
 =?us-ascii?Q?ZvqRnUeL/MqIWjudhv8s6Nh8KgYIzfDMBrUG3hvtrijbN94nNVF3eG8/9Kaj?=
 =?us-ascii?Q?PxhjNpSJq+jEpDCrJ8bn5uSlXLq/iQIzB8I2znRCVng6QHkKYbW1Hk8IWb7O?=
 =?us-ascii?Q?H2SsQKqyBrS5gogcdwrTIFOBghLBQE1x4duiYRuQFrWLCwq3a2kVNqrBhSrV?=
 =?us-ascii?Q?6FxCM+WvnIZvdafts2XcJP3GxWWX7aJWuOgu?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?D+LNAh+hD67NaOt0NyI7DkFQvm337nTN/bfK1+5e7grMCTddbfDo4n6fDdbl?=
 =?us-ascii?Q?ZjNBC8jfTht/JHYTf+L8HZl9ZlZVPVTm5hkfNQjSCUl2T9cLCq01f+pNbRjj?=
 =?us-ascii?Q?K9ObqZiL6IDSj6yFsb6tMs5LerzUcME1gKrAWne6dlpLTJYa0P9jyUf6oouD?=
 =?us-ascii?Q?MSfIGa3tN3gLc5NguuNnrjyXARvbj655+5WnoXQLU413wotou0+BLI3TY2e8?=
 =?us-ascii?Q?9uwqRBDm0HCTJsvi9Pnjk0zhUhn3JSXLR0Irhh/xy+1ijouZcWf4f2F1Yssq?=
 =?us-ascii?Q?nXAwMKf+VGhTx8Y4QfW8HE6WOTcZP8hLn/AYCjpeqbVGsnDZgbsugVSr1M0R?=
 =?us-ascii?Q?9rQXN7jX8o3z2s7c3eEopE00FkOq5IsFr3xm/STaciYgPkvTS2GkqW/8rBwQ?=
 =?us-ascii?Q?hIBk2wmUZsgx5hZkk4PTkGybR3hw291FkVcFr/xKIC2jMWRjQKliDwjuMGCf?=
 =?us-ascii?Q?SmhDl5ds1grggi4QhJw6ljRgCdeomKpkPZ9CEzKRpXWzYkkvsMRyw4h6Hupn?=
 =?us-ascii?Q?opgGwZTEO9ReA+Ms4S4h4yugT1Iy6JKlts2qcoEr2WGONgQncbyV3Tp0w4cx?=
 =?us-ascii?Q?23OHH193RIBcByPsSCUSjQ52JjGUSMS9HXT/Cf0X/JJ+bnL2BhCHxBHa7Hzz?=
 =?us-ascii?Q?KDKEKcGbxF49MenCYLtw9tjtHMQLvPQXEt4P04sD7iSEIHsOfRJTtQS2umkc?=
 =?us-ascii?Q?3ncKkWZ4ALgyA8G+xuyxw1qqbHpJq2W+JfTUp4yw70lzp8b7LvkTQIwkqeUx?=
 =?us-ascii?Q?KCUljxSa+w4mq6x3/v4wlaFQ/OZuycyTzRbFA7lTZHZO45h+Tgt0r+DCAYZ0?=
 =?us-ascii?Q?BzeT0IRec3NYhC9wutndI1u8zyScMhbz7+tvsuBT5shfeTn4ID69o+PhFsDI?=
 =?us-ascii?Q?htj2QsOHiZvvkwFCM0Vm1seenIRlVv9syJn6FfuhBQZjkoFHAbK/7Kr1MMHg?=
 =?us-ascii?Q?flAzPHlSI1Hhu69AvjdSoRgcMKsOiwpxSdR4y0pCJTzVodDBRDCYMWI5S7El?=
 =?us-ascii?Q?qC71gCqk7MTXq9q3y1iuHHgoVylYYWKkUFqBZaaWfto2r09/5hP77LjXqJje?=
 =?us-ascii?Q?IzIMWrjIwlzhmrQ34bxlYKrg+qa+BEu3RoopvPukJ48nnTWu5HWeclbyOZMX?=
 =?us-ascii?Q?X0zPSC2x7ac0S1UysBao0bdj79dqJlzbiTQD8acMUaxanXuUd4QsltgtLGY5?=
 =?us-ascii?Q?Qg+/+MHmVrvpVE02+/xmb5rDGF2ggaYy+Q9R/08hrYKqme0+8QEfANDD8SII?=
 =?us-ascii?Q?eDJHgH78k3xdbUihAeklrxYH1UYSwgK92hrNAc+hClXad1pNPTzPQD2IUGg6?=
 =?us-ascii?Q?+lqXFVQb673UCSo1AbdXqZu2ehzoj6X6jRuIMc8a92RzzFpTmGqPMdtp4cbc?=
 =?us-ascii?Q?u5o66RBFpP87MORWDWDDuiqMsaPLeNts+xl8U2y7Y8UjcqUDtx9WDJCIylkw?=
 =?us-ascii?Q?qZ8XapdqtSjTcCP8tEpRKlKPNhpRymwk4bj8WI4ijM6ZxHhdqSGT3j7ZEYvy?=
 =?us-ascii?Q?LUTvrNWX3AmOmxXg/718oFuAMnz8NNfX1SNw542rGkSiDl+tslvnm8aCjUTC?=
 =?us-ascii?Q?WX8nce8jh2vF9iJhiZligMfuy9k1hMBcPh5yiSKfNeTZHBWn/mfWPkVzobk3?=
 =?us-ascii?Q?CFXXrtUhDcQK6+EGeGe3DUQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68927766-82ba-4ea5-b5de-08de3c48e1d6
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 02:14:45.8317
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HzkigWbYSuLtFb/F9LzVhIss5HC046bwhpKdvF3zRXtCXB66uJ4CP4vbMLuz6mVttEQWkzS/ys59jrImFe7kq193AcfinendaC9bQy7/23iyUawfUlcTl3nj2vLRZkrs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8637

Now no one is using snd_soc_component_xxx() wrapper for dapm.
Remove it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-component.h | 21 ---------
 sound/soc/soc-component.c     | 82 -----------------------------------
 2 files changed, 103 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index d78cda8668888..8b34958395ca6 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -368,27 +368,6 @@ snd_soc_component_active(struct snd_soc_component *component)
 	return component->active;
 }
 
-/* component pin */
-int snd_soc_component_enable_pin(struct snd_soc_component *component,
-				 const char *pin);
-int snd_soc_component_enable_pin_unlocked(struct snd_soc_component *component,
-					  const char *pin);
-int snd_soc_component_disable_pin(struct snd_soc_component *component,
-				  const char *pin);
-int snd_soc_component_disable_pin_unlocked(struct snd_soc_component *component,
-					   const char *pin);
-int snd_soc_component_nc_pin(struct snd_soc_component *component,
-			     const char *pin);
-int snd_soc_component_nc_pin_unlocked(struct snd_soc_component *component,
-				      const char *pin);
-int snd_soc_component_get_pin_status(struct snd_soc_component *component,
-				     const char *pin);
-int snd_soc_component_force_enable_pin(struct snd_soc_component *component,
-				       const char *pin);
-int snd_soc_component_force_enable_pin_unlocked(
-	struct snd_soc_component *component,
-	const char *pin);
-
 /* component controls */
 struct snd_kcontrol *snd_soc_component_get_kcontrol(struct snd_soc_component *component,
 						    const char * const ctl);
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index c815fd1b3fd19..89f236ab30341 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -142,88 +142,6 @@ int snd_soc_component_set_bias_level(struct snd_soc_component *component,
 	return soc_component_ret(component, ret);
 }
 
-int snd_soc_component_enable_pin(struct snd_soc_component *component,
-				 const char *pin)
-{
-	struct snd_soc_dapm_context *dapm =
-		snd_soc_component_get_dapm(component);
-	return snd_soc_dapm_enable_pin(dapm, pin);
-}
-EXPORT_SYMBOL_GPL(snd_soc_component_enable_pin);
-
-int snd_soc_component_enable_pin_unlocked(struct snd_soc_component *component,
-					  const char *pin)
-{
-	struct snd_soc_dapm_context *dapm =
-		snd_soc_component_get_dapm(component);
-	return snd_soc_dapm_enable_pin_unlocked(dapm, pin);
-}
-EXPORT_SYMBOL_GPL(snd_soc_component_enable_pin_unlocked);
-
-int snd_soc_component_disable_pin(struct snd_soc_component *component,
-				  const char *pin)
-{
-	struct snd_soc_dapm_context *dapm =
-		snd_soc_component_get_dapm(component);
-	return snd_soc_dapm_disable_pin(dapm, pin);
-}
-EXPORT_SYMBOL_GPL(snd_soc_component_disable_pin);
-
-int snd_soc_component_disable_pin_unlocked(struct snd_soc_component *component,
-					   const char *pin)
-{
-	struct snd_soc_dapm_context *dapm = 
-		snd_soc_component_get_dapm(component);
-	return snd_soc_dapm_disable_pin_unlocked(dapm, pin);
-}
-EXPORT_SYMBOL_GPL(snd_soc_component_disable_pin_unlocked);
-
-int snd_soc_component_nc_pin(struct snd_soc_component *component,
-			     const char *pin)
-{
-	struct snd_soc_dapm_context *dapm =
-		snd_soc_component_get_dapm(component);
-	return snd_soc_dapm_nc_pin(dapm, pin);
-}
-EXPORT_SYMBOL_GPL(snd_soc_component_nc_pin);
-
-int snd_soc_component_nc_pin_unlocked(struct snd_soc_component *component,
-				      const char *pin)
-{
-	struct snd_soc_dapm_context *dapm =
-		snd_soc_component_get_dapm(component);
-	return snd_soc_dapm_nc_pin_unlocked(dapm, pin);
-}
-EXPORT_SYMBOL_GPL(snd_soc_component_nc_pin_unlocked);
-
-int snd_soc_component_get_pin_status(struct snd_soc_component *component,
-				     const char *pin)
-{
-	struct snd_soc_dapm_context *dapm =
-		snd_soc_component_get_dapm(component);
-	return snd_soc_dapm_get_pin_status(dapm, pin);
-}
-EXPORT_SYMBOL_GPL(snd_soc_component_get_pin_status);
-
-int snd_soc_component_force_enable_pin(struct snd_soc_component *component,
-				       const char *pin)
-{
-	struct snd_soc_dapm_context *dapm =
-		snd_soc_component_get_dapm(component);
-	return snd_soc_dapm_force_enable_pin(dapm, pin);
-}
-EXPORT_SYMBOL_GPL(snd_soc_component_force_enable_pin);
-
-int snd_soc_component_force_enable_pin_unlocked(
-	struct snd_soc_component *component,
-	const char *pin)
-{
-	struct snd_soc_dapm_context *dapm =
-		snd_soc_component_get_dapm(component);
-	return snd_soc_dapm_force_enable_pin_unlocked(dapm, pin);
-}
-EXPORT_SYMBOL_GPL(snd_soc_component_force_enable_pin_unlocked);
-
 static void soc_get_kcontrol_name(struct snd_soc_component *component,
 				  char *buf, int size, const char * const ctl)
 {
-- 
2.43.0

