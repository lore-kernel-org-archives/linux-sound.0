Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011062.outbound.protection.outlook.com [40.107.74.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1602912CD8B
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820339; cv=fail; b=IvYf2at4+6J7JxR81sFG0EPbbbenVUTZOh1kYPkZHq8AKXyLP/3bmND6QCpc+fh1u1Ams1wVsnxPcUYkRz5+/plcTmkTztzeCpWW8JC6PTo8sE0uX/scklAcUQ9uC4N4vvChZNXbcj1QIywdU2gD7RBV3YUX1c0xJaaFFfR+Q2I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820339; c=relaxed/simple;
	bh=lqal007Q+kbHFkIxzEQA9PV8sh12t0EJa93uz+8Aj48=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=EedsqJxEadPDuoBVfoMuZo3kU6sAru1F7wEnB7+gk8ncSqL4J0GULRmx9TkqNhkcpCG2OI1Rhe7PHn/1CeEqzxmxhzyT3/Y6ykOYrZL7nLozxaJ4SuLg7eFozw5Get+SYbLvzsGWdQ7iIHiUTdmV2kdktIoz+8gta5WcjJYBRJU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=X00b+Dhz; arc=fail smtp.client-ip=40.107.74.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="X00b+Dhz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WAzt/fGHOUlG0j3OkrsQIR9DM3U2PVVCJUwFGSrNIP2VeRM+KQ59XA2p7g/BILF36EceagkdOb4F7HqH/dyKa6ijN9BqhfnxCbWK6cTLTijPJ5EJwjIDWN3XaFCdmw4l8oAqh2ez/7nxaKz8iTCAC7B8BZPZ7xNa2hbIAINW6rFQyNC+K5BQXdp4hVWpW5Zj9y3dOCCtbTM5u7WHbSKNk8fhPTWzjwyPkvU5Nlk7uyEXfRsqJHCNwrF5sIooui/aHjcGQ8Z4NZhBjEXPB8LA6/1ZFFNN+qmQ8sFL1uxNfUjUuM26AZwmZobFSz2P4FLLAnctzvqKcpbtdYdjRJdMyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RGl4O7o1JpM2dRIsuaiOoq+ZXROJHQQ/B905/P19dko=;
 b=TaTrAfxSIVTsNV0ICzRNy8TPM3OjX7G2954yO7WDjg6glKTAo/gEi5uo5LIMui0XkGynqdRsO+U1hgy9qv0rAeo4qJfNe8/PJnKqN0tgYL31QsTaLpLCxVkQyNcjGZtw4qjCccGCDG6brmYuTwG7aABz4JsKw/6326i5ivrCc8615+LtnRqy6yca/3by7lmRzVqVV4PhjJg8RgssfYdqRUcOmOv/pre/AA8teyXIzfqLOPfwbi3a0FcBEYcBbDM9vFCpatMQYoA7sMtGpfSlUBl0Fs12XZUcebTggZ58IneTTVofzKzIducQMvtkSaBfK22jtXqbl5qy35Z6pBYkbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RGl4O7o1JpM2dRIsuaiOoq+ZXROJHQQ/B905/P19dko=;
 b=X00b+DhzIW7pNhYoPzaKnn2n6yRewUUWMZai6AqHTF0lgsz4f1dl8yJ32pWxo7cJP13nqfQmI+NlRw4FE/P2O+GjJ7C/Uc3akz3laNtqhxv6ehl/ZlMHRns6JLYhN3Y5UDAxNw3wmaYLD65zJPLG4ttmk6SaHDecnPCoUVnqm/4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB14299.jpnprd01.prod.outlook.com
 (2603:1096:405:20d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:18:56 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:18:56 +0000
Message-ID: <87ecq58lqo.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 024/292] ASoC: codecs: alc5623: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:18:56 +0000
X-ClientProxiedBy: TYCP286CA0345.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB14299:EE_
X-MS-Office365-Filtering-Correlation-Id: 6eac9018-d57c-4c1d-a3e7-08de20b7e71a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TeZnPx1c09KD/cjXbePogAAMaa0yqWFocmmcjxpvywa9SFwOUoI9AbE2ullL?=
 =?us-ascii?Q?3xuGDmvKNSczEd7ckW1FfIgut52ZU4w73HCex1cLi8GvB8sQNkFxg29H9Vn6?=
 =?us-ascii?Q?jsiI+cngXSjwsrJ0OD5P9HM9odbjir1MUAXgHbxAYiCD1vajetlBVtZ/YAFu?=
 =?us-ascii?Q?90KVnxkq2ejIWJ2csoZiHdASfpckwlHJwJmtSSBKiNYlCWB+kRQUG8BvEypK?=
 =?us-ascii?Q?r7/KVia3z+0cGcujGGK5DrUgR0FPTN9PsB7KGYxWX+j7wb8uZRd+X4Hmfn2i?=
 =?us-ascii?Q?r6CbNmzWs/MaE5eH/56FTOoSrELnaLTZ/Jsy6BBuWVeiLsiowTpR/vQuDU0z?=
 =?us-ascii?Q?OkGRPBvCPZwZhExh4oqWBaMN1Eph6T9NYip9j/9E4uX2lNwfEdNQMRJUzdyP?=
 =?us-ascii?Q?VzdPBnPegLGdlKEGo01gDbNqPqyLgApJtngk0kbmxtHfOOOZJ9cfOS/lATIf?=
 =?us-ascii?Q?ZDKP00VnBWRY6nuBYDc11cVX5ntGvy0KG6p1OnL/Z9PegsCrPjG++OkcR3X5?=
 =?us-ascii?Q?wiIvKPJ4BRume2KREsANv5hBTuut8035XyYDYYcG+rY9c/WgIPdg+SzirjXK?=
 =?us-ascii?Q?FBGe9zMONcFF3ANcdOwmEE/YDelCsPfjv++Bh7sIPzY2gXZ1cwaEfy290Lrb?=
 =?us-ascii?Q?i/BUQbdaV+lf6BxPDcVa2LRRHBedGBQZDebS2Q24Fv9hqZojylNK58pesh0X?=
 =?us-ascii?Q?XMFAy2gjksRdVUs6ofcEQL+q0sCfOeK3Y3PlgD+58w6tcodL6rNxr5r5lo+F?=
 =?us-ascii?Q?YFKeyNrmDEg8Ya/7Oz3//02cfOh6Rs/zl0tcQx7LgpVjB+xhL3CdWkZuj/sX?=
 =?us-ascii?Q?yLRVDRax8TufWzWib8oEAIQ0VDnDiyKDuusKamoe448EaoP+FwJ6wIevQra2?=
 =?us-ascii?Q?sFJD9xscqIz1M115iwi87eIsaeLelsL4AoLlNmW4SdTw1cMdQnxZJudJ79aZ?=
 =?us-ascii?Q?iizB6ONPsBef+IAQtmTtrP3q85IFgMlxqjKRKt1ysRsbJGUCbZ/hprp6a0+0?=
 =?us-ascii?Q?va+F8w22t68QQva5ZkhXx+Qerh6qPIHzKjiBJTLJVpHUxsrwiF6jzcFpOYaa?=
 =?us-ascii?Q?gAJbqyCK1UZbeLw5P22HRBkNJNxf4V2JbWD0TrSTJX1ouODHWOblExNocJvT?=
 =?us-ascii?Q?Bjx7bOYX/KYIixPUl7tN32Wie3c92BIHV5t2GmV/PcTg5jVVKFi2P88ojtGE?=
 =?us-ascii?Q?wg+RVRw+m0XAjheuXPugLFOhAF2Zby+hvmrCZEfzJ5t7kqW7xcZPkHb0KnrT?=
 =?us-ascii?Q?cLuFVFczF9fwqvBgpEq7I9PCgHHwiF5+Wua9rXQbx7sxAdDBUbQTfQBXlp7l?=
 =?us-ascii?Q?HkPtvmfg960UL+kRbk0AtJTTNsIyz0nULQBgdO3c7zF1XHLCSdXnoR56SScw?=
 =?us-ascii?Q?Pf5xjfF0vNskMrDt2tZBFgq5zd+Do5HAMnTk8iQ3fTAFxJeC1BsxiC4FqZRZ?=
 =?us-ascii?Q?26TveVlzayawklnjsTz02ull5IT8PSTHtlmFmJ2zD4o0ECCYsEj38xb+GMw6?=
 =?us-ascii?Q?rul3oHBn49Ovj5oHzafW5hE9xSP/22M0rukA?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0V3vIn94lcbOS7IJsiFdYYcLouAAgiaXzBkZ5YGRKbelOXOIczTGXiYIXPx4?=
 =?us-ascii?Q?H6YwqleSYOfwOcRFDfHMFj1mM6QqpUSKQsxj7vmic/oeTmAENfFqKZRjp2P5?=
 =?us-ascii?Q?NXT6ixoc9oV1f7i/DLtxo5b46Pfeoa7VPcSyihNJCb6srf16MrN+fAqHzcHL?=
 =?us-ascii?Q?Mr+S91mBdNThbyzbwBl9gSuWEbmMESfrVzIg5sYB7nLl8rmCTA0R7t7X5+kp?=
 =?us-ascii?Q?iuIic5xDtKg0KZTOfedBIeiLq+C5I8MGAAs6dWmMGKp5PqnX49kwOdB52MBp?=
 =?us-ascii?Q?FR/ftaWQdtreUtPh5bLEwVzPQtZwqF1uMtNz1AmdAJQcY9drV5kE3z3r6gGz?=
 =?us-ascii?Q?TlBecXDaaSaAPKw3DJmcLft/pOAp9RrBjxQ9V/LU54dqZNSzM5R3bc7c6SHE?=
 =?us-ascii?Q?LfhBuYcMvgwKv+c+KZLI1VGRfuaiasnIDfM6pGPLlSP+nuBSeZtQdqt1CsUj?=
 =?us-ascii?Q?Sm+hEcm52oa1iM/CXN/0riFV2Yk9FWqr0sipESOoKpuUQwcVFyWSJUPOhdiB?=
 =?us-ascii?Q?F+TXlctpObIjh9p6x78ZAtSFbcw2lKUBtcM6ezhDC0a5vT62zyC0bSsG5UaI?=
 =?us-ascii?Q?XOEu+6vGVgRkUezRigKTA95dpOoGPPfa+79zgQ8uT/0SKBg78UkbryRO2OLW?=
 =?us-ascii?Q?dLTEXl2ihESEnVPDpWNIuTPdng+v2vgMHuP2MfbzlwwkbnBqPOpx8gpTh7VO?=
 =?us-ascii?Q?ck+gCXoep3EQBaSQZgs+BFkGZkD+pNf63Q0QbiuNUWYgRFQc8fo9lcYDwEKQ?=
 =?us-ascii?Q?L3hEDqaRG+/cHXbCu1JewAy3WnnqSXILrviArRkCFbbfqBO6lE33mMRUSrUm?=
 =?us-ascii?Q?GVb0TXZ5YUb1S1rPcYAZpUl/WWw6/et67vM/Z85CB04dWXEuvRFmEW8a6At/?=
 =?us-ascii?Q?6r1fqdkxQnXyxATSTpc8gZ2FK/ytMxFZYI5yVO2q2yl1LaEJ4FgP4TLvPVYl?=
 =?us-ascii?Q?xBGAEBcFsUWmiZCjW7Z7u8p6Mi00I9glmFnQT5rSRFqPPKpaNf/3v82Hqgzx?=
 =?us-ascii?Q?rQqXfLVUvhWhiHeUCgm71O2aEnkHBdnQ0pX3CCQve4XpT8tzeg3KtEAsdLbt?=
 =?us-ascii?Q?kWoBDrp8zkhDczlYZrztdrtDakUfilHpMnpYC4kRbSYpdcMn3S8I0MHxROFt?=
 =?us-ascii?Q?qplxTSk8L9rf9LpWAj+OKx4PSDE/9CewE1t4BF+exUae5/rtdQymsPSSMK/2?=
 =?us-ascii?Q?CHqEeXJhPEk8o6dnbXieY9v5rnwitjoIfvQqVQUeXCU7KVfug/bHfo+EuZ0x?=
 =?us-ascii?Q?fs5YM68TroozN3mUTMiH+eC1cvcqN/DivdgDdFkEA+LeRBjVPWipYzoCf6Ee?=
 =?us-ascii?Q?0HiYf7P+GNivfV+u3mIB0nL5GAX5t4rosLaw37+XWwxUbcSpV7rdV/m1kjPO?=
 =?us-ascii?Q?X0dvKlalz7ry3OxL/gI02RSoc5G55zB6lGUDAuf28YqODbM49pBVHGNgDOL+?=
 =?us-ascii?Q?GWq+X5mXh+XB61c5L6n58e+trgJN+BFeIvOkI8OjipKlOTpUC6+IXMmVk3j4?=
 =?us-ascii?Q?hpj59epgqccoRqQYcfvdqTb7FGY85KQq3olEIQHBKAkbOs8J5c+MX3Zpc0rh?=
 =?us-ascii?Q?ubBEXFI4hOxh0nzu1hFi0QgoPwX1BqWDx12Bl4pmM66lwl4Q4bBwB8k7S/1n?=
 =?us-ascii?Q?h56K+1axD4B0kje4RjDwroQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eac9018-d57c-4c1d-a3e7-08de20b7e71a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:18:56.2763
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0zCh6fWz+2pzE1VS1I2aW+JfMcRVKjEHmhS0lPKhpX4UrV21DSMrZO70Dla969pv52vwRJS998ue2R21I6fJ7bkZloAw/hSIIJMiQobL1LRWx5NGaWrkn0noSSlg2jib
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14299

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
 sound/soc/codecs/alc5623.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/alc5623.c b/sound/soc/codecs/alc5623.c
index fbf7237580797..a9946dcdc9f69 100644
--- a/sound/soc/codecs/alc5623.c
+++ b/sound/soc/codecs/alc5623.c
@@ -888,7 +888,7 @@ static int alc5623_resume(struct snd_soc_component *component)
 static int alc5623_probe(struct snd_soc_component *component)
 {
 	struct alc5623_priv *alc5623 = snd_soc_component_get_drvdata(component);
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 
 	alc5623_reset(component);
 
-- 
2.43.0

