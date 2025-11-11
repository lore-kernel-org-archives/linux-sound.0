Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010034.outbound.protection.outlook.com [52.101.228.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53FA1B394F
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820757; cv=fail; b=axktNhHJrvaRY6oUsDBxsv9gp2FiN7FVDR29a0jjBu0RFnXLlRcs8w7AERxOIbSy2m9Kd9WWDl7of7RTwj1IbRPo1Jh23tQn+mcItml0yrSUYyralGyX46WgDazrk/aTuyMxeONiK3uz1gj36fklivMW2bGi9ivjDfx1vl8x724=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820757; c=relaxed/simple;
	bh=9GA0LWWMQ7t+Zq0hd+4D05EVOagVZZ9nbAVlRSHfYfM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=gar4v56Hwri+uDltGT/BzTFgr59u4A6hDHSJN23vtxquCaFFdzjqWNzB5rdEO8yZTyw5B5lR3rRsCZ8Gka8MExF8zyfcPLyG+mGlHgU8SpJhAeIa+MjE2jxNBNIyWpdqE0pMM+WCubpIEp0l4Kq8zqZds4XiviDmleXK9WucLQw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=aA/T5XRW; arc=fail smtp.client-ip=52.101.228.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="aA/T5XRW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zj5zniS5uzbTt2fTAOuzDtyGeXX2k/KKzZeMn5C/cSOTaSI8yhBPMLn0TD2ukWo/caYzuZ45lNDo2htOT6/eEdQ2xipIvdD7qPFI3yA48XeK2afGD3fU+zfA2dK0tTDZrRokWeTDWsN5wSQ7eX/AK3u6+9q8fORxrBY0TZOBDlcx6+0mLQIfinCGk8RmRR6W394xgO+JQapP6ALpeXPmNCLtpwugn1U+7zAIOjfLftuuqWUHd959qbapKRucKG47HTM7ogFqK3Htl7MANXY9Wi/6nJndrUFcahSXA/4XVyGyhfeaBvEaxfMKrR/Gg64nPXwyweWW+cPDTIb5QzPJYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iZionWAoiHv8hlwiceE+b+csvbdf1+rQlx5TrCSTeDA=;
 b=aY0Ldddsl8XPrmUjC1bDxGl6f5UUD6rVY+bMBa2SLPEn48KPP4/mZQhsCdnKINS25Ft9X0d8WlmW329Jt6rH4peLYhv7fWoo2C6mtQb2kejBQMMftOJmSV8s9S2nhulxd8AHldu7abAnVSm9NDSQAlqcujg/0lwt/qdEy0ajT1EoaJgJ7v+ws6JIj9RdfjfqBrzd1LkkB9dQh8cdPYY06u9AeAM/KBugmwKDrWuQyT0MPdMERwSt9PPTXgSP4IROJVVQAuOhdJDmoxOsFRyJXVFk7rLqLU5+w37l4azxQSnRtth8PkNXyyW88bwljy3Byhw4ElgaxPNBtJfwLzBL8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iZionWAoiHv8hlwiceE+b+csvbdf1+rQlx5TrCSTeDA=;
 b=aA/T5XRW9otzDuPmdiQR1ySh20+aLh3DuOKYb5Qr14POMFvxCdSgcE8AEbIf7Vh8noA32BYVGyBI0EcdoMmHc/63q+K4chvDqhnqsYR0lalJt9cZhWuupvPwElWXd0mnr7r6cYrBnfFp+x0MRiSbZhEDbWT/JNABR82+M+kEoJU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB14439.jpnprd01.prod.outlook.com
 (2603:1096:604:3a6::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:25:53 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:25:53 +0000
Message-ID: <87fral2z5a.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 122/292] ASoC: codecs: rt712-sdca-dmic: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:25:53 +0000
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
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB14439:EE_
X-MS-Office365-Filtering-Correlation-Id: 2094c46e-ce78-4aa5-a979-08de20b8dfd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vtqpVhQsujjaSR8apYLTG5T8C2cQJvBqDMEOOWWR9cwis2DgBdOLEY7MnLoZ?=
 =?us-ascii?Q?wBne7ZC5AplCw9uWX0CMF/7B37vQQaHL2Q9qb3S5PnWvVflaFidtfo84iy/2?=
 =?us-ascii?Q?zOd15CxUD3G8iodjzFbpJQ9hgO0NSK1hzOMhI5TIekrVsw97cTPD2gywrU5I?=
 =?us-ascii?Q?EPb87LShLupd+kA6djHddIInlnvuOV1s0ccy7r8lNH7RlHfc2EeiMRG41J1k?=
 =?us-ascii?Q?S7LGeXQqdYDP1Lv4YJXvnSKNrqER4rm7QpQa2UdnVOjJIVFpJW39HpU+sqyl?=
 =?us-ascii?Q?60l/ZdJOzxZ23yP3HrpUwM8gAQMmOvpZpno83jHf1TShPyW+TVWkD9NTNT65?=
 =?us-ascii?Q?25n3auGe+R61mz7hAt6mdh6+P5ch0MDWhgTTLpAcxvp8G+pf3BHlGQvF28m6?=
 =?us-ascii?Q?yJ4X5JkK92q6DzPMi64UhkLbntCJdGRvL6wZNC/LK2KXnz7QBzPoySGvc2PO?=
 =?us-ascii?Q?nvZ5aFcl9Ny8vseOBK/l+bxZUkGr90EgurCz6AdhTMpmRv/UdU9q/mI8I119?=
 =?us-ascii?Q?/qTu2VAVZ/eI5OiQDkL+NWX0ABXURF6U4WeNrD2h44SRbC3hV/wkQFTRFEQE?=
 =?us-ascii?Q?xT9kAC/QsJTDsCqCEwZ48xCdmfrSNB+37JCfCV4YJSh/7fLRXc0Dpx6JRFuW?=
 =?us-ascii?Q?Yr64ST8AgFUz4bul1Nh01CGPTliQhhXexVtRPNFH4/uNZk5wah991o/WTQCS?=
 =?us-ascii?Q?0K7C6GEU2aZZJN7u3yFS/fkvSXgOBzRG5LAPsnbKnC/MtEcNJreH9qlGbH7b?=
 =?us-ascii?Q?W7XfCiAFKAa2bZ7Hv3PBF+AGjK7+4j1bD28eK1KxM3VdiKX5lFNEdLfnfk91?=
 =?us-ascii?Q?wy9MusnMBToqyUGeDodJrwdCIeDNDiMyFqFSWFMdU4p6989lKXB+jARQfvFE?=
 =?us-ascii?Q?BaaSD23W30SN8Xfj7ClBo6pYYBhn51u3YPCdMnydDhejmvohr04tFnhgJEi2?=
 =?us-ascii?Q?CsOJNOl0e7sVX1iaKeQTVc6pd5QHkcehZwkhW/ACXCC7M+Z/6EOp3ORsoR4d?=
 =?us-ascii?Q?VFYfzIwOGPzfGgCnVzTXc9k1dkxWMXuOHdkLreOGH6zzZXQXW1eb/SpL20i/?=
 =?us-ascii?Q?xx82jSPGWNZZE8/0SGXzWfiM+XOs3DzYBun7Sq02xRTRBM1XWpmcypz4MT5t?=
 =?us-ascii?Q?98RCKsVo3/0ufZDSC/Xez8X07y/+D3uCxc7R1nDzHrCDYVH37lHUKlIDY6sd?=
 =?us-ascii?Q?ObZJBz0VPN1rg8vHJEEduNpF2a9ZLuPQcdSOuCsE/jdrZptVQtHYb7kfuqVg?=
 =?us-ascii?Q?Av57UvbCevmtMTZ/3wjh+Juz1JtU/gcdGpiiMJnilAe/10+LCVgrzVSWQjDS?=
 =?us-ascii?Q?0/+sC9Bd/4GbwAOk1/zNQwnLv2R9O2nP8bJD5P2dQjUqkKUEogPzEiJwmEVo?=
 =?us-ascii?Q?mDTHldRxHtZb8pDKQpCaBhNX/Stn1tTdmVZ9HpOZ2bliDiwaM7PnsEAhJK63?=
 =?us-ascii?Q?JC53KhldhMF+40Ki3Z0OgBd9EszxSRBiQ8FJMVeTgi4FMKiq6ePccjCV2ewY?=
 =?us-ascii?Q?c3aB2BYN4tH/9OT077BAoUwSVOKpvBBGV2a8?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Elxb2OWTYC4uVeW+GPmQsa7C2C3PR3wzQ2A3+F5p5z8haB0NA7Kfcayeh3mj?=
 =?us-ascii?Q?IsiB2zUVhsFLJt/4ioc2M1a2LZkMeZo2wvqd5SnkjqBoUA1HAoex1whpTf9V?=
 =?us-ascii?Q?JlEHATEoWnEkC8cgbSrSVnSLgSOn6sH89lPr2F8L2oVu2snbLTFyi+cXVGOG?=
 =?us-ascii?Q?D7G2fizXwoit6wFD2f3lRGqNg1INrZaZjqsWoFGNFqSeFY+DH2dT/f61U7oN?=
 =?us-ascii?Q?zYpV0ybpULR9pXKVhMFq3kryTF8L1cQjeFtv+MXNT1H4v8/K7MCOwAAmYlfm?=
 =?us-ascii?Q?Hm3QayfCdBl+wEO671Aip4VVluKfaIu946xd1Q1KsX9jhq8GlZUwFXVIElRk?=
 =?us-ascii?Q?UKyBWTggxPcE98jgOh8o0FySeV4h7CU5qa6z+pH4q3kdVa4Rjq+MCj421dGO?=
 =?us-ascii?Q?f5RQaYlNjYILGJxSaFrJo1rxqFoQeZR2zpaHH1utQfILSixHvm5jMq27cN3j?=
 =?us-ascii?Q?/zOKw68xXYNmNs3oMhduOJQYOTnRolm3tExIO1mXjSZxboc/Ur4uePx321+M?=
 =?us-ascii?Q?wwnovkAohx+jwYSIIfdlpW5JYNJyI8c4U4O5cxucaWiSQe2jSrqxKVGBsuzV?=
 =?us-ascii?Q?ZOqe2ioJ/+syQIiYQAMFrlDNqh8aBrLDP5JN3wHVVUrbv7tPxTFX6ZiTURh2?=
 =?us-ascii?Q?BYsdNixvFWtW2qdfK6WumBH83DaFJfVldET1zFReY/ZRo5earuVDAXf6Vtmg?=
 =?us-ascii?Q?XfV6ITWJsDw8lIlP20SNJxOSffNKh+GV2eEXSiSMaW7bst+lcxGnlWd0YkwK?=
 =?us-ascii?Q?7Y+w0/pYsVihIQ3Aak9B7yW1N0ysRQGm+wCAPXmj/OB1MXgTviqrWJ0kEix/?=
 =?us-ascii?Q?0E+lDzQcKe97RjIyP1gXW0eMVCb+VlQq+VKxrbuZ+YbOz/GMBmy/LcuEd7pA?=
 =?us-ascii?Q?CnHaFKSNeJPvy+AtT3ZCo/entwH0+hnddwMNZ5OyUKl7NJIdTJqDH9++9voU?=
 =?us-ascii?Q?Wtd5NyVcpMv4qwoD70QBmaljUmAEP+3ecvXo+NQrMjmDAYP6uDAt+mEAbxaQ?=
 =?us-ascii?Q?XSryttusTdKp2QU/Kz8nw5yQu1KSboJ2QgMUeyt+LKMrNsZFruTbCX8ExDUx?=
 =?us-ascii?Q?NOoDXihcJZu9NAq/RRg8lLdWCF/ln6ElHbIgdgRNqcXhSwAFPf+HwOcxKQKa?=
 =?us-ascii?Q?w1ehyS6kQLW9tYC5Nww5xk2iDrJsr9y6pjYEaYM7BDnUe1JW5BU4j/xrRcMG?=
 =?us-ascii?Q?p5g79+mb+pSllGdJHsUkxmMCKFI5s6GNkF7d/cuX74eNUFl09nGioimGQLGp?=
 =?us-ascii?Q?ZmWizigAiKnPI/+ikRd6v4BskIhxEFiRpDBA/zvLz2f5PrCOC/biOGrMkLWg?=
 =?us-ascii?Q?hiJl8WzGKySVA0xf4pV5ct6Yo48D7iJ3ZE+U0ZZ227O+GTJc9ioKLER+Umgk?=
 =?us-ascii?Q?u4hccXpfYm12lYKzKFIOtWozOueUhOO80ou/q1FnGPNYRv76ClItKlmC3uiY?=
 =?us-ascii?Q?aBuSr9mn85VRCsLwTaSw7MUIcV4wFXMDGA/h8w8dWgPsoZsPksf/oZyL7bs+?=
 =?us-ascii?Q?rzF+hkVtnj+uv2X3DvYErS82Qd0Gd8alx/9yjKPkTsftIJDB8Y/TWO8hJTWi?=
 =?us-ascii?Q?2y0+EoFfbsTF2ESb3sbIHQZ1Ja0kC2kSdyvx6znvnpzHm85c5DeEi0s51hzl?=
 =?us-ascii?Q?Dckd06Z+FwkNuBITwr441g4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2094c46e-ce78-4aa5-a979-08de20b8dfd9
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:25:53.6308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BkYctHRhwjOePa7U63M99PITfzrpM8cmOB4VgwjKQ1c8UPprrPDIdKdOC5kb0YCgA/eAZQCmax+dK13YQtGWgh4iWggegBAuAq2oHsu8Itg3NCWF7pzJ+G0VkwFF30RW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14439

This patch converts below functions.

dapm->dev					-> snd_soc_dapm_to_dev()
dapm->card					-> snd_soc_dapm_to_card()
dapm->component					-> snd_soc_dapm_to_component()

dapm_kcontrol_get_value()			-> snd_soc_dapm_kcontrol_get_value()

snd_soc_component_enable_pin()			-> snd_soc_dapm_enable_pin()
snd_soc_component_enable_pin_unlocked()		-> snd_soc_dapm_enable_pin_unlocked()
snd_soc_component_disable_pin()			-> snd_soc_dapm_disable_pin()
snd_soc_component_disable_pin_unlocked()	-> snd_soc_dapm_disable_pin_unlocked()
snd_soc_component_nc_pin()			-> snd_soc_dapm_nc_pin()
snd_soc_component_nc_pin_unlocked()		-> snd_soc_dapm_nc_pin_unlocked()
snd_soc_component_get_pin_status()		-> snd_soc_dapm_get_pin_status()
snd_soc_component_force_enable_pin()		-> snd_soc_dapm_force_enable_pin()
snd_soc_component_force_enable_pin_unlocked()	-> snd_soc_dapm_force_enable_pin_unlocked()
snd_soc_component_force_bias_level()		-> snd_soc_dapm_force_bias_level()
snd_soc_component_get_bias_level()		-> snd_soc_dapm_get_bias_level()
snd_soc_component_init_bias_level()		-> snd_soc_dapm_init_bias_level()
snd_soc_component_get_dapm()			-> snd_soc_component_to_dapm()

snd_soc_dapm_kcontrol_component()		-> snd_soc_dapm_kcontrol_to_component()
snd_soc_dapm_kcontrol_widget()			-> snd_soc_dapm_kcontrol_to_widget()
snd_soc_dapm_kcontrol_dapm()			-> snd_soc_dapm_kcontrol_to_dapm()
snd_soc_dapm_np_pin()				-> snd_soc_dapm_disable_pin()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/rt712-sdca-dmic.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/rt712-sdca-dmic.c b/sound/soc/codecs/rt712-sdca-dmic.c
index 42f8f7b8bed08..2928649e80e4e 100644
--- a/sound/soc/codecs/rt712-sdca-dmic.c
+++ b/sound/soc/codecs/rt712-sdca-dmic.c
@@ -429,8 +429,7 @@ static const struct snd_kcontrol_new rt712_sdca_dmic_snd_controls[] = {
 static int rt712_sdca_dmic_mux_get(struct snd_kcontrol *kcontrol,
 			struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_dapm_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_soc_dapm_kcontrol_to_component(kcontrol);
 	struct rt712_sdca_dmic_priv *rt712 = snd_soc_component_get_drvdata(component);
 	unsigned int val = 0, mask_sft;
 
@@ -452,10 +451,8 @@ static int rt712_sdca_dmic_mux_get(struct snd_kcontrol *kcontrol,
 static int rt712_sdca_dmic_mux_put(struct snd_kcontrol *kcontrol,
 			struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_dapm_kcontrol_component(kcontrol);
-	struct snd_soc_dapm_context *dapm =
-		snd_soc_dapm_kcontrol_dapm(kcontrol);
+	struct snd_soc_component *component = snd_soc_dapm_kcontrol_to_component(kcontrol);
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kcontrol);
 	struct rt712_sdca_dmic_priv *rt712 = snd_soc_component_get_drvdata(component);
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	unsigned int *item = ucontrol->value.enumerated.item;
-- 
2.43.0

