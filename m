Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011011.outbound.protection.outlook.com [40.107.74.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF31630AADA
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415937; cv=fail; b=tU1I8i1L0ueN0ZaPNKTGBhP/F61Xa4BgwLiB9dr2soJq6CU7QFfM72GOKfJL74GwXqNFbafadMg4yoSxQHIiGT2TW6e8Hz+Ecf9Oq10hV8zF+Z4Y2cn9JWDKhCsNIlQOKvE7/Pqa9HOtln0075RbOETBUrAS2ustvgNQaXz5Tks=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415937; c=relaxed/simple;
	bh=aTRPzz8ykNlJtSme+ovDC+A08opGf21j4P2ghbSdKB4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Aj9/uvLtHI59tDNIaNY8AGHBEGoKgyuQWdbTF+wtUeJzoMdthH3iYAaqsjF0YqT6MnDTIXhZws39xjbLLwF6XXm7ko2v1b60OQpnkGkHQYDYjTikT64BMI7idkLp/b/lfkdBWzRKMT3QBhPcPyjT4Y4OV3qlKQgQzb32RaNfZ3Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=gZ3mI8Rz; arc=fail smtp.client-ip=40.107.74.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="gZ3mI8Rz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hgQ3n9m3bGlqtbe6roCtos6ojtbyD502LZmIvhReWLAtgTKAeUjAkFbIs8HJJ5rJvhlO/HCtVwnG0QA1ojP6p51763tRe+RcrPCGy0nBcSO3xjpkaCmvmUtGAAWZq+NMnZZQ4T91zDOm/dZ7ISgwGrgBPQnX83AfSBsX0yn87oHaJUWH3LrTIPY+JVTKq9GU82YfIUllT/tUBWjhRDiwtloupElIxOXebnmu7aOxyj6cPI3905EqH7P5xZp+rhF5qX0U3uA+AqH9zyqHZpo1HAUVeXjJD68wt4+NGUDAYu0J89wdPCkPIXxJGFw6NCi6CpJAtJ13hbb4TcMShhThOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JOi8wfn5+HL15Lk920IQ6NiVwZuj5a6a4HKWn+2z4U8=;
 b=JqYg3Ol6nzc95YLqvxlTnkBHArHqcYj7SeHar/flHKU/DJZC37U4No/46hhWOmuyNCS9shqzBA41OHII/pmJ6YuoaMYGqTkXj0/olJZJRtJaKWX6SX5WhaIBnR78UZET8jNEkjAyfWSgyQ0LLSs/bh+W3Yyg7PsfegFOs+udLUGxSRF+SvpvuggGvCzwAnhJ1qWJYjnCed3yWsBK/stfZBfgcaXIKTEWmI5Xorh25Ezz50UMXlbFcpBeeeHes3GP+UY6G8TfAwMrOfFi/mmRvd3eM8Wil55dXkg12nNjjVxuoG8XJVL6nQ4lsN8miuxndqPYnV9JktEGnNtjFD6GHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JOi8wfn5+HL15Lk920IQ6NiVwZuj5a6a4HKWn+2z4U8=;
 b=gZ3mI8Rzt/ym/e67Uqj73DrwXhcO9XuvhSSe5RPtT9+HkO3yRmc4Bz8pgQXmXZsWh7a0cVQR0BiZ/nT+7221/0qQC+THuhg/iS2R+QLQB39OL/Mdv/QWa4ZS802oGZkbTkWOzCn3F8ngu5Y0Ay+832IZloCFjb0LgTcvrMCiSEA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10584.jpnprd01.prod.outlook.com
 (2603:1096:400:29e::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:25:34 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:25:33 +0000
Message-ID: <87zf9unm82.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 097/139] ASoC: codecs: wcd937x: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:25:33 +0000
X-ClientProxiedBy: TYWPR01CA0044.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10584:EE_
X-MS-Office365-Filtering-Correlation-Id: 202be52d-5056-4be6-869e-08de0ad9b7a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AKs7GHUUYiEn+dcAQ8Emfznk8dOh2mULTQWWx9IiWfRzUIqMO+U6fTimty8f?=
 =?us-ascii?Q?fG4i7AuEjbISkkoaQGyGGVlGaQWJAMUvpYX8aQA+wS5DZ9ayLKPt3WOScecL?=
 =?us-ascii?Q?Eip4oj39dTt9vKhuihUdHaPYUaqrt1REXSKEMHiLeSd5n+glAa87ZZdNGL4m?=
 =?us-ascii?Q?GbkoL3anV/mCS2BuI6LNhzCj4yZQNTdOaGPx+lo5Mty714nhnM4d1fNWAl7j?=
 =?us-ascii?Q?Ac4GJHLAMaXx6uhuAIMvfTcHZZfvxJBnneoNpJQsOxyqpxX/WPLgOCwtPfug?=
 =?us-ascii?Q?Iaw8pTACH4BzLExfN6uVOSUjsFptX41wIjS7lbo0VxOG+cSDCYu3QW6RG0f2?=
 =?us-ascii?Q?mdoxMgeuFSABE+Xc16OGBXhK9sj7WUxE/mm//SSbvAlSTF6UMd8Ox8o/kycG?=
 =?us-ascii?Q?ixwMfT+HSJQGFZBAct841dGYC1PRUdowaSv/GReSC++jLoagH/Co5Iv212mE?=
 =?us-ascii?Q?6jwESWzpEvY0SjP2iRXzf5QNNYF+uX57NpYuDxYYP/OeN17Pnfou6HZAL1YB?=
 =?us-ascii?Q?OHZxsL7z+1BF7SkJn3Hi/Cel0oGyaiqTa5v+LJ4snwCeMFv+w+V5xeKdomNH?=
 =?us-ascii?Q?sOsVlnlg6POGO46aRdwSOq8GRd5ExQubmqk9+atagRzy0/G8wohTum//7p8s?=
 =?us-ascii?Q?1/AjpIWCOKhjTHym8uYSYIfqpPLgVKyTRbohE9+JDrPv5+oQkMzbEOqxWTEy?=
 =?us-ascii?Q?kqruWqwsOipo7o6ZOyFZLv0CSVTo9FL0t8Q3eu+YgCx2BK0YxpB8aRRw/oWy?=
 =?us-ascii?Q?k9hjaG1uqKjFrVt2aSQ8w7lZPW1RieYxcXnqLh1FHCbzUoaMhILi0yruasEE?=
 =?us-ascii?Q?+Gz/ZfUzIGIV1SWWQGN1e4whmqfwRA3sy2BU5OAfl74dxGjzI2XDO6o5oPyb?=
 =?us-ascii?Q?zfGD5IyHFK+scT7ZsH9SJOAyTdPnVY2Up9iAS+kIXk4mp6hdqBseDC7TPcty?=
 =?us-ascii?Q?Hi8nVyN0AErhKZ/1foWxP+oRrIbmwVkxXFW4/3WHAPtT+NAzQ/hE0hj5lIbi?=
 =?us-ascii?Q?kvZeTGSe29Dr1tapCzmnIKe3LLLt7w8cDswpk5b7bqaUeVEpWTvx85k6dtDv?=
 =?us-ascii?Q?HcSolwTwdrB3+HeWsYOlYKvEIr1y2owIAnUIdDXVdzXRM62EJy5Hfwbr+q7p?=
 =?us-ascii?Q?fuCl2ti3NzloxvW0rLtV4y6g6kTyP32euHLCsDrV6R5Vserp9l4zjYWXHtEu?=
 =?us-ascii?Q?ZPohl6LDKYDNMB8p7Z4UKJF+qY7EhK01FhFzCswSVq21IbN7VlN9BYxy1AEz?=
 =?us-ascii?Q?zYrjAVDZWxaUjWaC/HR60SXP0BYp4hvWpXJGvBYnCO/9i/2SbrAzGOER+jbq?=
 =?us-ascii?Q?6VJJ0xPhsG3gZoNPLw82slrhAPfQOptuIfBJxI0TQQQ3YpmQ44XoOJd00oo+?=
 =?us-ascii?Q?RxeozVL7cGUo/MdNBnrL42iqiT/GY/j8YsVEEsiHvG+ZAfM2ij0TD2u92Vk/?=
 =?us-ascii?Q?D9ESbAIL8PTATgDF6ThsyQdLWSLyZpEnum0mru+jA5WyKww9T7t/0OYMnfej?=
 =?us-ascii?Q?5m9gWu46RU5mw8ISyfGzdeKA9PzdZikFCrQm?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qO7T7CGEl/wsJh+Y7PyLdboGibRnI54HmnieL50gLYghH9LBUml2RvWX1Yf5?=
 =?us-ascii?Q?lHWqj3corEEb/4JtQchigj6A8LYea3JIKAjaa5Bxkb/jv2Rd81DE3BZ1Ylsk?=
 =?us-ascii?Q?fFA+vfkeMxPZSKfMRPx815aXeYTqELYVjywZV+tJe6kpBRBH1rBIat18zms1?=
 =?us-ascii?Q?1LEVG4NH1YL1Cn0uJEvb9h/d9ZCl3656hrOm9dVD4ZlXEN6vQEyGvnX0t7r1?=
 =?us-ascii?Q?tFv6rTk/hCKdbvzbjYk1aqidS9YbiuoSQ1MTsGHqkTVJXq2NCP0xPo4cymc8?=
 =?us-ascii?Q?ZmnQu9CWguhS8mbXlIjB/oVaYpPyvM/EX5YhW757e8LbUObf/CCEM+3lBdBQ?=
 =?us-ascii?Q?BHRjHJHwQaNk42toelvxGCsiiGYgGzXaTzzS1ybriPDxZQYPgslF2Zq/M/K0?=
 =?us-ascii?Q?klpypeMtJ2zucBS5B9UQQWC34yQcaqDkvT/fCY0OEdr7yzu/lAWSTCvE1y23?=
 =?us-ascii?Q?fOODK3qggjSvtKt2xFkVwyKDg98CEmFi3s9eOYiDcoJPyl63CY+BGnDZwWPa?=
 =?us-ascii?Q?XivLKdsdsUa2kAIS2KUfQ5NMttq1KMj8Ibux+p9q3KYle32IHJHjEAmGQBQo?=
 =?us-ascii?Q?pBhPIPM3Ek83BOPn5uRrvRQXvCqhVSDukuOatsbzFNHuk8eNX3cDPGlnRoXX?=
 =?us-ascii?Q?W/AC8VdyHh7oWrlDcV+jDFrJXOkbnugySsIQ5bBxWO9mshFzn+1k+jHboYz+?=
 =?us-ascii?Q?f1E1HvnCSwrPVX5BLoHIaKSmBKfAxIAeuqnG1RAZrB/Rw2Tck0u4sSOxH/6v?=
 =?us-ascii?Q?hWcUEXXB3pbkMf0n3CluprRJ3MHRGPaL/LIIpHMifoOzlimnXEkhBlXx7UDR?=
 =?us-ascii?Q?ZlGSHiwST2gNY3ry3L7XWn/Y3l8PSVfedPuyYOT7COf+5IV7vgAgEPaQiNJm?=
 =?us-ascii?Q?IdFwSfZFf9Sl5+NNdR09x72ioJKuccJIZunmZ+O9wJEvHTnvRmeVGuPpxD6Q?=
 =?us-ascii?Q?dy22KGsvIR90F/sL21jTtG1cklfRuz4j0x7I6zAejlggGeopSD73vlPKEmxL?=
 =?us-ascii?Q?58+j+/YSeHhuMthb2jLFs3FBROH4UnxlVhU+1+Knyb5NGmHxk7E2lzjZ+jUi?=
 =?us-ascii?Q?fCDWupawxwKuHfPQsgEJVBlolXa4nvh/M+HiGMbAgSipwQZIBLugK61DIEs0?=
 =?us-ascii?Q?XUGa8QVGLWWyEUY22EhnH9nXds/uZ7J9uue0o6Zo1vu0whFYAomEviSN8Oim?=
 =?us-ascii?Q?di6MmU4FZTKmxdZj37ZVhcbW2DqWrVD9YqNy005v3pjrWdKa+YxTsLoVvNrw?=
 =?us-ascii?Q?PSu3l2bt4P/XrndQFcIcKXMGSqhzlYdaR4C/1NEOuW4s4YtMgJbhZcyiAEPK?=
 =?us-ascii?Q?EalCQodjNQiFk2YstGiofEWRN74sOuUuRMtcxrS0fjSUsVkv/N5n3ks1EPCk?=
 =?us-ascii?Q?CJkenQ4Q9e7QkzY193VQyzYlGj6njQlsDxkqJxiPvLGlFiPZGjNSZAI5R5t+?=
 =?us-ascii?Q?7mGdSIopxGGf6tODRkYFswfQc8F5jx6J6lCWvj3k3xzi6nguFdnPCu45OZOI?=
 =?us-ascii?Q?PDXF+PSc5K/Q4fTxf4bVpiAL6QtmvQWCV1sZWGs/j23iGTBPo2H5ADdrOjTe?=
 =?us-ascii?Q?qmD4DzxyAVp6ryQiOEZdbqQx+r9IqQWoy5XYx55+ykwdqKPlIsH75THUQZgw?=
 =?us-ascii?Q?FmPuUoNEOiI9d0VKzvpgZak=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 202be52d-5056-4be6-869e-08de0ad9b7a0
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:25:33.9226
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g2THgoibwZisvRvIttmXO5gIesrRjBfmsh4UxYysov1OVpxuEDwLEtsGyuk9AgCFmkzlj6coCUNgRjJBsdAVPreBc8cSqbx90Z1pA6NgXTZNXoLjw9yeMxDWX80LXSc2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10584

We have very similar name functions (A)(B). Both gets component from
snd_kcontrol, but (A) is used in callback functions which is registered
through snd_soc_add_component_controls(), (B) is used through
snd_soc_dapm_new_widgets().

	(A) snd_soc_kcontrol_component()
	(B) snd_soc_dapm_kcontrol_component()

(B) is using very picky way to get component but using it is necessary in
ASoC. But (A) is just wrapper function to snd_kcontrol_chip(), and directly
using it without wrapper is very common way on ALSA.
To reduce confusions of similar function, let's use common way on (A).

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/wcd937x.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/wcd937x.c b/sound/soc/codecs/wcd937x.c
index 421ec7a2d6bdc..e7b9ba284cd34 100644
--- a/sound/soc/codecs/wcd937x.c
+++ b/sound/soc/codecs/wcd937x.c
@@ -1208,7 +1208,7 @@ static int wcd937x_connect_port(struct wcd937x_sdw_priv *wcd, u8 port_idx, u8 ch
 static int wcd937x_rx_hph_mode_get(struct snd_kcontrol *kcontrol,
 				   struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wcd937x_priv *wcd937x = snd_soc_component_get_drvdata(component);
 
 	ucontrol->value.integer.value[0] = wcd937x->hph_mode;
@@ -1218,8 +1218,7 @@ static int wcd937x_rx_hph_mode_get(struct snd_kcontrol *kcontrol,
 static int wcd937x_rx_hph_mode_put(struct snd_kcontrol *kcontrol,
 				   struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-				snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wcd937x_priv *wcd937x = snd_soc_component_get_drvdata(component);
 	u32 mode_val;
 
@@ -1251,7 +1250,7 @@ static int wcd937x_rx_hph_mode_put(struct snd_kcontrol *kcontrol,
 static int wcd937x_get_compander(struct snd_kcontrol *kcontrol,
 				 struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wcd937x_priv *wcd937x = snd_soc_component_get_drvdata(component);
 	struct soc_mixer_control *mc;
 	bool hphr;
@@ -1267,7 +1266,7 @@ static int wcd937x_get_compander(struct snd_kcontrol *kcontrol,
 static int wcd937x_set_compander(struct snd_kcontrol *kcontrol,
 				 struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wcd937x_priv *wcd937x = snd_soc_component_get_drvdata(component);
 	struct wcd937x_sdw_priv *wcd = wcd937x->sdw_priv[AIF1_PB];
 	int value = ucontrol->value.integer.value[0];
@@ -1304,7 +1303,7 @@ static int wcd937x_get_swr_port(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
 	struct soc_mixer_control *mixer = (struct soc_mixer_control *)kcontrol->private_value;
-	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
 	struct wcd937x_priv *wcd937x = snd_soc_component_get_drvdata(comp);
 	struct wcd937x_sdw_priv *wcd;
 	int dai_id = mixer->shift;
@@ -1323,7 +1322,7 @@ static int wcd937x_set_swr_port(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
 	struct soc_mixer_control *mixer = (struct soc_mixer_control *)kcontrol->private_value;
-	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
 	struct wcd937x_priv *wcd937x = snd_soc_component_get_drvdata(comp);
 	struct wcd937x_sdw_priv *wcd;
 	int dai_id = mixer->shift;
@@ -1951,7 +1950,7 @@ static const struct wcd_mbhc_cb mbhc_cb = {
 static int wcd937x_get_hph_type(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wcd937x_priv *wcd937x = snd_soc_component_get_drvdata(component);
 
 	ucontrol->value.integer.value[0] = wcd_mbhc_get_hph_type(wcd937x->wcd_mbhc);
@@ -1965,8 +1964,7 @@ static int wcd937x_hph_impedance_get(struct snd_kcontrol *kcontrol,
 	u32 zl, zr;
 	bool hphr;
 	struct soc_mixer_control *mc;
-	struct snd_soc_component *component =
-					snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wcd937x_priv *wcd937x = snd_soc_component_get_drvdata(component);
 
 	mc = (struct soc_mixer_control *)(kcontrol->private_value);
-- 
2.43.0

