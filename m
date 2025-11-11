Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011052.outbound.protection.outlook.com [52.101.125.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7F91E0DCB
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820921; cv=fail; b=kU3XUly5aChQhm5S+4x9IH9+T7JVa9E4kDek3P12iIpzPS6VB3fLCY9WJ0eDqKcpCNsP3UCyA+6Gok2KooKnHlxiUnd1ZaAcFLUufU+6gjMjtitCDqsfcQxuMlAbqzUWuj3ktuVx9SyFJli8lPD/5L8qNWQxS9CGqUjwvCa03MU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820921; c=relaxed/simple;
	bh=cbo4tMyf6nRrC6xlT6GqoEE3M0Nf+dqDpJ09azma+8M=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=gjj7anitToSTNYSA5cX2FcEBDoaymYNDuvHWhVAc62GkS7hmk4Hzkz+23saaW8uecdkiJmjQhI+QFo3UJNJcniZ4H51jSn1Q0lPw9YGrN4vB/IbYRhjDOePFlLSlxMZppsJvse7ow6eC1RYia7AKag60s8nHppYLrErOUQLzL4k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=HhL7iqeq; arc=fail smtp.client-ip=52.101.125.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="HhL7iqeq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OgxMn4TLd8H3z/klWnagqrYG+FVSJQlwWXLqJjvRTuww99VkSmv7arhXRnWo9InuPaEvILCd6SgIoQmO8M/QIRwKoiaYB7/Rc9QVTkbk1vZOAGT9FYntXQEik8RKW5/6dWIpH+ZfoEgzyki+l8nvo00lAV0jAeky9LLAujsj72EIVZS5ThDO8G0ojYlBstwy9w/2vOPNBopp2tcMhtyBI5cUpmBdUU7yU+V1t02B3I2dh3CR/BsTx7WfjTjvIVzLxIZzmmGI2KWddBn2Twe1kErmor9HZ20pxfvf/YVSMNDknLkNrrTx2jcUchEoUDmZfpnZB2A8v8ei+VjtC67GVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RlYxXDasj/HtFCmDaA0rDpk8Rq0zuDKu9pc2Rwn8UyA=;
 b=wgGec5rGDI3AGe6YknvEiyJf9qbqdNlOV6kUb44kh3cPzZsBBWVM/Uzy85JQRS7iK0yr4e/ZZU6fipM1v8yRMlIvJvixiNDZvr32oQStjAsFtQbK8yMgGDcXzWTFNdm0mHwt5CvWvgv7I0mkPyehwTdUAl9hI2yKp6Dxw4/9tyTW106Zo6YEIAum/yhqHn9nnwxQn8yjKI+12GVOVkVPelZq+GYIYAqq5xH56yJ7lv4clfHoj4VLaIH/RoSaY5zg2fDXlrTl7CoZzIDRnoQW+BBFYfKO+F02dB40tzz+9GkC21OUOUz1BoE4FfkfJheE6eonMPmianU1r/R9QOg9Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RlYxXDasj/HtFCmDaA0rDpk8Rq0zuDKu9pc2Rwn8UyA=;
 b=HhL7iqeqQoZUpQAiz8scMNBMAGlHgaLW3U5BJONIdfA0nQsWBfbX7JIArOEPZP7JHLD6qDNb5o8VV4FrQvtv8qG0morst3MbO3JqwuHRjXf3bxYDHUzLwifzJJ/vVYqz0ugx1uKQzdIzPl3aBjDYZl7vHEwB25v6InzEM6gUMEU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB12798.jpnprd01.prod.outlook.com
 (2603:1096:405:1e9::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:28:38 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:28:38 +0000
Message-ID: <87v7jhza2y.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 161/292] ASoC: codecs: wm8737: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:28:37 +0000
X-ClientProxiedBy: TY4PR01CA0009.jpnprd01.prod.outlook.com
 (2603:1096:405:26e::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB12798:EE_
X-MS-Office365-Filtering-Correlation-Id: ba52765b-0322-4b57-1635-08de20b941da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nz0JYrcXbCQY5MoDjkpISI4o0SKzqzgCl9nI0Vt00dF9Rb2z7O4vC4JODK6I?=
 =?us-ascii?Q?vac7E/38tXsg7TfzY3gB38gjR1fsJbqcTuC7XWxmCBjZ2NGjSL0B5EDDE8Ta?=
 =?us-ascii?Q?az3h7v3D+wau9rOl35A3y65EzsHhqPPIFLKlQ1gIXNXeRPpJxWRVfSHKkGJt?=
 =?us-ascii?Q?klHl4FxIYgcYVXG1DZp5nvSIbebcgMLvTzupyo7FjEJAXZJJUXY/mWTAAh/O?=
 =?us-ascii?Q?6/X0ziMPUIylqXkrtGJwgjbmKgNtwgxUIqSxGZq8wrj1svraGp6TwycfRgSC?=
 =?us-ascii?Q?NXO8mvM5duQ8RucICtC5x/oz1DGS94KsME4oimfjzmWvgFH7ZAp9d8oPd3KT?=
 =?us-ascii?Q?TbTvViYmO3k3lAQAYWHnSJ64870ZuZBNmwwBArW30OM0qYAz2v2j/sB0TVim?=
 =?us-ascii?Q?GH8Py2V+wjMIhNCgI77418bJrEp2yFBBAav5QWnXxmnB5m8HfLL3Tf9zwyTk?=
 =?us-ascii?Q?Kr3efNNjGxJ8WmULish6VEfcE/awgl6tNYDrAnEuyCYw+ougiek3VT8stTy+?=
 =?us-ascii?Q?/rGHh+iAg6NxV+4WBj3y4nGJsQkVfuXNTQt6MPLWOwtjTNorGJC1hZSQcX/4?=
 =?us-ascii?Q?2z/hPY8FjIoZGyH7V6q/Bm2v8L/I9oKQus293+mrT+Yb4dN2KPqFnmPxILDM?=
 =?us-ascii?Q?h5TgJ1NwBk45sPmw3BZDQeZeN3uShlyEP9WN2LK00LdxmGdolaEmjtupA+rO?=
 =?us-ascii?Q?IaBeOt1+UNUb/UUFb3QG+S2HG1L90WHS2s+jaJDNpOhW1ZR+qEw1QWIfRpYk?=
 =?us-ascii?Q?hxhYrHcJFXwhG4oF/fsplJZqhp6ColSvExloUz4AJi79VFrD1t04pYwc4RiE?=
 =?us-ascii?Q?2801QSTVTj17gsoKdnj6wAS0D378DXZ4lFCN5vEhXjgvw9Cbci5NRT4E2Wqb?=
 =?us-ascii?Q?46jcOMe5aoceNf9kW7A3PTSJQNOnyTQKvtFrzOLH1kTebvklRsWBouZaWznY?=
 =?us-ascii?Q?bycvy9WkNxlpU17Bh8uGjShFEFjqRoNr2ppTXrjxabWqii+RHuIm7MbtdN5b?=
 =?us-ascii?Q?B7dkGpKK+lNQhS0C1WtOzjARGZc4+bgax3uNsCRPBUUiWvM6mRWOKEwk+E+5?=
 =?us-ascii?Q?Dd+nOMBwG4xoWVGsU3yBQ+5SWVCtuv+k8iMKC9tRlsKIHsMbP+Mq16dlflo6?=
 =?us-ascii?Q?BukpnsyBWHnYVrrHZH/i1spF8+IGpcMRuGDVhN+cDYCklUj6Qk4EKZM3aHSN?=
 =?us-ascii?Q?7vw0EkuEmXIYG6MkKIdy0DQQJ2NFgXRFA6HSH9hiPVmZZT8N5BAXs26F1bvn?=
 =?us-ascii?Q?39w49m3LNCn+ytjrEPCj+8RwP9XgsW97zSQGws9KyUlKoz07ktBx31Lrcrdb?=
 =?us-ascii?Q?DjAJ46+8oT2396b8ZoO1qQmqc0OfxmWcZ49mRf/hLkk2SRe8EiwMuiqOcib7?=
 =?us-ascii?Q?ngYmM+1R2qDrNw8KoCLefuNj+SNlrl1I771SfrYbqZrkEXnmXf0UFuWprc+v?=
 =?us-ascii?Q?kg6jldzH9J1iq7IuaoLNFg3l3biuqJs1qZO9dU2B9SF/axR1/0ttCHChhSAz?=
 =?us-ascii?Q?YyGALngq7ez29uZyCP7Pk08Wh1CJ9VAynxwE?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Iac5yx+fIBgKB5VJOF3EjOxcnskwnn2U8eT6D1mF37yXguwSFUR60wsqYOuS?=
 =?us-ascii?Q?hnteQa7DHkWP5nTT4j2n6BYHT/wZRkjwTE+KwZKmtv35ha1vKi5fUOZ/1SXB?=
 =?us-ascii?Q?8m/w9sFJwjGF2kuq9XjE//gPDBaGOVQLOKW/RnO56ZAWHpUJHd88T+nFTuU8?=
 =?us-ascii?Q?1cHhINtraKa1X1MYLlLJ/epeK7EB5lYmixBymO0Cm98bIO7dx7aodeY4+WJf?=
 =?us-ascii?Q?OlxEe8iERdRToObcBp4VFBzY9QAdQhJTpBFEeymzL9xP003hMmrdUXj44n2S?=
 =?us-ascii?Q?AjIz9LrP6QG6IWIoXK9tBFlsSHn2wdhXs70swGjb3qNkr7CMsso7W4hOOig1?=
 =?us-ascii?Q?/n1a/q3/c/0iUFR90AYGCgCECKJwyjZ7cFNWJ79VBwt/CLepZDpkJ4SGq02P?=
 =?us-ascii?Q?0MRcNuddRQrKxb6i3k+Nv79B61aWHkIolIpr/4YDtVFbKlCRRz9yEF7lvPJC?=
 =?us-ascii?Q?yNrRNSfYekRpl2yvAF1Ymr/ZmB4aWQQsdAIX572aJL3CehijENnW23hDegPm?=
 =?us-ascii?Q?3P0/kuRiWiJicaB62Zu9gztrZc0xH7GG8wm2yDTiqGUqSx1PkL6AWYXdO8St?=
 =?us-ascii?Q?gsjMV6a+x4jiREQwumXX38nuMU9r7Ieff8cWEUOQonlhFG4stCvV1Wi5o688?=
 =?us-ascii?Q?Y6u4GvHnWx2+/CBCAPq3cdXS2PKEhhps/hdlXqcvg1KScaT16zTlRES88c5c?=
 =?us-ascii?Q?r8hZbnLC3c7O/ebXHQu7+BTMQHSXaUrQg4593gR+lzolPyFe/gYz2SNVBOBR?=
 =?us-ascii?Q?Cyc7ePdsRA+7+tPISrm0pLAwEQNpQLFPKsFylrkE3YUDeLtsxEylROVqcYPE?=
 =?us-ascii?Q?TPUY1RVmoWARlwVu0MzMlHq3lgtBFhL2vwisct17oXZQs341O/DWiDX4lept?=
 =?us-ascii?Q?OEGQ6LvzmyN/KxBNu6mG49mau0DJPNcVGbWfwSFr8llL/L/Jf2mAXIqKT8E6?=
 =?us-ascii?Q?JkKUuC6tmNGM7CENWrQpVRiyWbmpJGKej3blvVBn8QLxSN/KgRmBUgA3B9q6?=
 =?us-ascii?Q?2H6YpioPIjz8wg4UJWuY2yQ+b8ZM6qlkI14G52uwMDDWar6/PwedRM608heR?=
 =?us-ascii?Q?yUckKtQPPB9qss1J5Pzi9rCPPX+5o9oDUNkY5MPaq82Kp1LsggRqnhLxNmsR?=
 =?us-ascii?Q?Ban/WYS2E7kODoBr0n4Yydc0gxDPsUg2nEzcyXI8aL23IuXJPSgfTy5pZop+?=
 =?us-ascii?Q?lLsvGqTFEWyAaEdzVd4l87c580em1vTn4ZkllzPoy2CWqmm5gc2+qmnZmZCk?=
 =?us-ascii?Q?VYo4sZEkbt/U3m1Sw+EDAw+F35kgkrP6T10YMljKN/U1H9YC5ryBoGKPfrQS?=
 =?us-ascii?Q?qs6GgmOQUIxhf48DmN9DpnQPGFTaVF6JL8nbLJnrDfe+64MwJ/I98QBD9CDu?=
 =?us-ascii?Q?qQ86R/eRW5pv16xGcf3SH0fEMWx7JHz+hEFyt34syI3MN85GLvZRVhRBy2Zw?=
 =?us-ascii?Q?48NDHTRsy+Ar82ex/CkHPw6WoVS57/DOACc6nfXqTfc/dBNBknJiPThUe49a?=
 =?us-ascii?Q?8M7TgsgbkWGNVRSFULWDlXLsjHQ0o/WQquZNmU3Vn/BOVDjLDRR7WSqPmmxj?=
 =?us-ascii?Q?4RTxFVcMvJUgCjqCB4d6GLD3896vusQxsOjMgo/gZraj2sqsAu9VneYz+kl1?=
 =?us-ascii?Q?JQO3Aw5RhJVKywTIlempy9I=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba52765b-0322-4b57-1635-08de20b941da
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:28:38.0226
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S1F7FabHI6TdkP5sXZn7niN8PQT/uK34sphor11CZCa4kpYV8/PozFMw3Im/rtXlLrbWkQSFQIOEPIlefKHKHA4rd+TqFkv7yx4/Rh1wPwI4mgmu2sPMzc4hTNK+ZlSz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB12798

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
 sound/soc/codecs/wm8737.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8737.c b/sound/soc/codecs/wm8737.c
index f7e48f27649de..fee8a37ed1df2 100644
--- a/sound/soc/codecs/wm8737.c
+++ b/sound/soc/codecs/wm8737.c
@@ -452,6 +452,7 @@ static int wm8737_set_bias_level(struct snd_soc_component *component,
 				 enum snd_soc_bias_level level)
 {
 	struct wm8737_priv *wm8737 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	int ret;
 
 	switch (level) {
@@ -465,7 +466,7 @@ static int wm8737_set_bias_level(struct snd_soc_component *component,
 		break;
 
 	case SND_SOC_BIAS_STANDBY:
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF) {
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF) {
 			ret = regulator_bulk_enable(ARRAY_SIZE(wm8737->supplies),
 						    wm8737->supplies);
 			if (ret != 0) {
@@ -537,6 +538,7 @@ static struct snd_soc_dai_driver wm8737_dai = {
 static int wm8737_probe(struct snd_soc_component *component)
 {
 	struct wm8737_priv *wm8737 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	int ret;
 
 	ret = regulator_bulk_enable(ARRAY_SIZE(wm8737->supplies),
@@ -557,7 +559,7 @@ static int wm8737_probe(struct snd_soc_component *component)
 	snd_soc_component_update_bits(component, WM8737_RIGHT_PGA_VOLUME, WM8737_RVU,
 			    WM8737_RVU);
 
-	snd_soc_component_force_bias_level(component, SND_SOC_BIAS_STANDBY);
+	snd_soc_dapm_force_bias_level(dapm, SND_SOC_BIAS_STANDBY);
 
 	/* Bias level configuration will have done an extra enable */
 	regulator_bulk_disable(ARRAY_SIZE(wm8737->supplies), wm8737->supplies);
-- 
2.43.0

