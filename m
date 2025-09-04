Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011058.outbound.protection.outlook.com [40.107.74.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496BB1D5CC6
	for <linux-sound@vger.kernel.org>; Thu,  4 Sep 2025 05:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756963285; cv=fail; b=r4FPC6ew0skTkqiLshXzbSttoQdon8x9vAny8vtBDEY/gsaDGD5Ji0k6bdMn35KGJ5XCricJuoo7nmXi1vsWuMqvRcVaK3NCwu1XFKvHZSDaCDmduM1LzKKoWkUyipks4fwQwILzRj+3npRE+45b8cDeH3B+H4JwTSchtVjopEw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756963285; c=relaxed/simple;
	bh=uQFwY6qMFmwgePRQu7UTos21lBNFizlaS4nU8p/gLEw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ky/8hQ/ZxGNQjUyTVA5UI1+jsBvpIxZIDNY/jIRqW098jjmCcILO9DvKRLH/d2KKhnZY0H5/3R/mvGI0mq15j1BTDM/+ClNgUACs9q7xl5WjpOuh75OXFLUyso5d3wpV2jSj9QfJGzqGHpCFhzSM9YT8p47mJelLOSFFXAuOLqw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=j+KrvWwr; arc=fail smtp.client-ip=40.107.74.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="j+KrvWwr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XLkwW26ubwdOhL2H5nZAfgIV8Yp9bb1AQrAYHdGmZ2+tcSLKWOZlSswV9PtK898qYsyXtjxsyP8vxfCiHsCjAdqYB47jHujtlnept30TDEdOMd3bcfFgu80V4tX3c6xzrW1tvSMcAdEeoSNGE8wGotObPZiDdjhWpRJwaTiJwNgpn6Bkxi6AnSEMh1SLmhxMGUsxFl4oVjnjG9ttgDAFHJZhcIN/JsGfAOOnf/cSQGRa3Te0XHXt9ACR+Kw477EHRKSiN8YiK7xFOxCpnCbK7z3t7nwlzh8vP4HYLJGTF6j5tUSTlpY/GddTmSD5vKqJEwCGLhexMHpKcvgN8ImyGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=akd8O0waDS5IaLAKjUkI5nvt1UcaDnfDrnVxISv9e3Q=;
 b=dBHSSZpkCCF9wg+GlZJrRQCqn4xEc9q6ea2ZmGx4RdaeIJXwjBde7k4I/RYnMrMUqq578K3nDusTKWc8I2J4zCTkLXeyG8mSwnaPxOyYgVivy5xrz+qhlCZ6mYpIb0/aaJV3N0IvE0JIbjrrVHoWcNUz2RhCY8WQijC06KSoDV6bG7HzcxrNMmRyCAhyP+eqdoR3zxlKTQyAnMmQrRwJRLpDFnVuZz7VBk7DpJJlFImz0yTNBXI4b6AGgfyJA8Ce3lqK6VJgQoOh+5FRwA/mYw64aqwFdo2E2d1hsmJm8wPXiUECA7gk8Dzrqx3oS1gd+lGHqkioLnlcKa6+ZA9Nhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=akd8O0waDS5IaLAKjUkI5nvt1UcaDnfDrnVxISv9e3Q=;
 b=j+KrvWwrNXp2M6w5Xo53nMLpqdGnkBzZkSbycRoPijMokGJPz5GQGRmGMQaN19jjTaC9QwA3K/MD8vRN8qdycr50O1vGz5wcrUqmqSLf7xR9femnAOXhRlYDzdArayOOcfCKkYMcdvdiJcEa8eGJSPi/vTd5WDVySpwi5VOxJQk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB15650.jpnprd01.prod.outlook.com
 (2603:1096:405:288::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Thu, 4 Sep
 2025 05:21:22 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.9094.016; Thu, 4 Sep 2025
 05:21:21 +0000
Message-ID: <878qiux06m.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 04/10] ASoC: soc-component: add snd_soc_component_to_dapm()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87ecsmx07m.wl-kuninori.morimoto.gx@renesas.com>
References: <87ecsmx07m.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 4 Sep 2025 05:21:21 +0000
X-ClientProxiedBy: TYCP286CA0106.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB15650:EE_
X-MS-Office365-Filtering-Correlation-Id: 263524a6-0222-462d-628c-08ddeb72e2a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UYEB8ixMlnLyXEX973+IgR96699mJM+pSZIS1xKK2D166t9YfEGzwwzhIMxm?=
 =?us-ascii?Q?AmynqjsxKLc5aPQXgJy+DaAqMYs8cI9H97Qfr4GdbGRZbCa14fpITnn43gD0?=
 =?us-ascii?Q?c0phy4SvpDiOKl/5CMFjbUJgQmXpUIXpkjvbVAapdMUGM8q5VnPzp5jzQJui?=
 =?us-ascii?Q?a8sHjwHoQki1pmnVCfZXwz1l6XETAGxmRCe5yXo622Re4CFAgFDO8sqk6kiE?=
 =?us-ascii?Q?DIi80hM1hhliPR4vS4u7LqpmOq9Ml9bOcW5hH3XhGBGdr9WD35iHCzqB06qA?=
 =?us-ascii?Q?JFgp61vu9t+0onQCl9ZJ+ua9GGzQ2j9FifSKTEsJCTp1PRKU+xQgllXIeuob?=
 =?us-ascii?Q?U6OzgO33b7bY0aProyxLqZkurIGw4oGa3yBOWabg52K2kakmG7K3w3P56RiK?=
 =?us-ascii?Q?9DDejKNEqGZnUFTcCJExy4rAQrcdas659wSpIGhM6BJme9sCuQQjkr7TrsA9?=
 =?us-ascii?Q?qDNvroGgpny8h1X589iQTvSxcCu89XmEaGSK6naR0Lvkmv/0TAf6oFgfdqem?=
 =?us-ascii?Q?5+3reUCJQjMwq5YL5OVByrmvMQdfE2ltShIPp50hNa2kkhw2xR1oqieLkJ1G?=
 =?us-ascii?Q?DFsILBOvGqtF53c+HdVYlEW817D3wR0UGfMrCrp51HfQe+Rp4s1zBe8adzAE?=
 =?us-ascii?Q?ap6/Dl2Ferr1F9BM5MzNwJTX6+o6y5V0Or9sdlbtcr8TpcBJCgzPyTfyoK8G?=
 =?us-ascii?Q?GnQimoUKDslSA+PrRiky84mrj4nhvB322HyXqkSui6T+ii+BLQ+rpVFec2R5?=
 =?us-ascii?Q?BIWRkaqoH7Rk8+pfsp+uANOw8dff1Q/fAolqmYz3cXzFUDfitIBmJPZ1zMMn?=
 =?us-ascii?Q?2o0/EZcS/9q9JTa7qSL+yggsi68MlBHWaWX/2rZwySsPgsbi5DyX+Mqk5oHB?=
 =?us-ascii?Q?VItHfQnoc+YcT9BPmZ6k6+WSGRT1tDfMRNM1e7R3cor9emXGbZfpUO2Hl1mi?=
 =?us-ascii?Q?oBAWSxUb+IS1ZEBqqYw/E54QdNfl1J1tw9CH5LM3zthYuXRszam+wtWvlUeu?=
 =?us-ascii?Q?SeNCvh/K555n9TO10jAzxKSbu8fANBuM+6Qh2mc3wCxVQ5x8x3As/AWBTP6t?=
 =?us-ascii?Q?NtfQqauD4UoZ8gzg3xTMJBjZdY8U5po7gc51Zc9XryP0dWbeJBVxlg0v8kGn?=
 =?us-ascii?Q?f+w21/5lX+Y0KCmZmZ56qZdHaOHcVNuDnYgnsELXj8ArWsb/P1psIOpNfZj8?=
 =?us-ascii?Q?EYHQVk8x38ZjmQ3xR3m6uu15J+ylYfLx5cEx2/Ass2LodsZs0Yij7lEAjnXG?=
 =?us-ascii?Q?UAJqswyV8hsRj038+FryAMZZZzdAEA4lLzoxFqNdr1sSGBA4K+hqQWYmU1cK?=
 =?us-ascii?Q?UrtbN/djzVeToKX92RugjKI1tIe+/+yHlAfSTQuL78VUwMn/MWKegZBuGTmo?=
 =?us-ascii?Q?wo6w+y+dASBUgcTfsF3iiyS4l2xjO2GVOBnblQMaTSZojB7d7+Y6OnG0vWSl?=
 =?us-ascii?Q?/m5Cp6LPIBRts1J1+4zWi9HmjFesXR9c0XIk501rs0iWRlYwgNoIWw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3qQ3wE7ttXSb9txYLSoU0+jLW/zYpiM54ho4zOrIybPdderHj2t7CzaEebtH?=
 =?us-ascii?Q?lO3AZ/0Vy5ddEAhFHOgNYtqHWfTyLB3D0VQj1/gcejmSM7U+1oPiHmg1Sw4X?=
 =?us-ascii?Q?BbNT6kLEvz0lQUZ4BU9l6wW7S5zv88W5iZ54tdgz6hafazCXK7U5zAt7+TNU?=
 =?us-ascii?Q?vBovBCDLToEDFLxu6XQz76UH8syIEb94Nul5KCdEsp38f3C9JqnFreDAhk3v?=
 =?us-ascii?Q?Y+lA/so3Qf81FGaSqEqATfzIRat86gecPnEuVSZ8HUiCdRanmYp1EKdI/z5V?=
 =?us-ascii?Q?9GDU9SMHojbccVb+EV4fSFsw9RzQRaKsVRLFq6fmLeR3WzOppOa1VFAQYGN0?=
 =?us-ascii?Q?5FeLKhY2QFfHL6lB7TqxxoPSBTITf/J/528WvIc2T8ujFeNa/59/JIh7BMk4?=
 =?us-ascii?Q?kacoCKI7zOtgJmk9yS9AZq6GKhoxOlhuW/zFABIKMpPCPgL1WH1FEwAh0ObU?=
 =?us-ascii?Q?MGMZabCWKhvSruSaoWs15weuP0G+9dTLCerPg0pp240MLgd+Jh7SVxR8x5LF?=
 =?us-ascii?Q?EOT6nJD2VQvNcGklf8DBqAAu1rLz6+FAjEsTKFcwxnpv0+TMEuydS2pPxFYQ?=
 =?us-ascii?Q?xUZG70YhTLopTVP3Xmr9u5IzJ4cNFA8jJzGiu+mvhIeafI/AgCzLecEKyb2R?=
 =?us-ascii?Q?g+EpmLT7eiU9tfnVDZgQV+JWhNLARmAroMZ77Bg70Yzn4RCrE0Xk5YGaFefN?=
 =?us-ascii?Q?1mAXmJp0qUez0lbtAhJKlqqhetXf3+Zj5RaEkqLlcPEFDCrJW/7pWlIgsJHk?=
 =?us-ascii?Q?nd4wxqAAhiM4hxXqyX6BPD80naqrrnVK14+z3kZ/EKSn1ilLCkEaZCpVr+DH?=
 =?us-ascii?Q?+NWGCN/4oL9vaOdVSNwh7YRfBbXKroP/9uZfuGIrq+wtVn5YptLCo67DV/cm?=
 =?us-ascii?Q?dIwE0lcJGGU0ehuhUYNub8icsmHGlN70CXcTkQYBymY1vGx6LkXdvfvpWIDA?=
 =?us-ascii?Q?ZXLMGnKwAN7GXVTAk5VmiRONmSOeeUZEQQhRfdluzLnfY72zu5RtWe3oFltD?=
 =?us-ascii?Q?tb4NKHX3NV5M8FffGo076qSOS1ECGOXlflzj1cwjct/U6n49uc+t+JqG7yF+?=
 =?us-ascii?Q?+AfdfO5GUVG5dqtuxIioeODSYsuY2LptCZZXzmA0XEnK7kAkY5nLm04KHDlA?=
 =?us-ascii?Q?irsHbGrv31KPK76Ycg/v4Zapjb9D/DTnePHRmqd6/Fu3yX+QBtFbCW6WJJVY?=
 =?us-ascii?Q?XB6RWVBkf7yc1wRCdw/NYqPHuBwGnzIV8jNXU2Jli7mlJRkXVmDDEq+dfoeq?=
 =?us-ascii?Q?hSyG3VpqY1rQrqoR1SQWLzy4c7ZZ+lFUDIOSKXjWbwp84A++/05sGJi2lMl2?=
 =?us-ascii?Q?yczVexiUNj7hvg//pOfOfBqDor+tsnFHsJPdz+nwfUcyPzP6OYvHqQQpIo9e?=
 =?us-ascii?Q?13tKwmWHyV6Le5G3G54sv9ek1IDZzVVStG1GVctPt94ofrN61apyVVrEPR5b?=
 =?us-ascii?Q?LnhXHNQu+GqRfz0RKe5m34x62SX3xTHn2BGpfBcejonjL6jkATlXjFU1ZOH6?=
 =?us-ascii?Q?esyei9ckB6ibtszgZEO7DYBcyRQgxz/zGxcWBN03g1GDIJdrMBEuCw0GvP+V?=
 =?us-ascii?Q?gQa51sBsibezfjSVIS3mnpinx9In0+y7V9UNL0Gj6TzBd/5UCh/N1mMDXr62?=
 =?us-ascii?Q?TYu7qll9VbUpud+NRvxqY60=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 263524a6-0222-462d-628c-08ddeb72e2a4
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 05:21:21.9213
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Spbga+p66op0466/ILENFsiUlmpP8CUYgw4X/9INBHk87FHyeiLCSNTWd/S39A9EfdOGahbuotFXQ7zOwUMeaiZWlPaRzdjBvonsrsCil5oQ1xBhqOt3fdg3eZ/JtXQ6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15650

Because struct snd_soc_dapm_context is soc-dapm framework specific, user
driver don't need to access its member directly, we would like to hide
them. struct snd_soc_dapm_context will be removed from header in the
future.

Current dapm of card/component are using "instance", but it will be
"pointer" if snd_soc_dapm_context was removed from header.

snd_soc_component_to_dapm() is needed to switch to the new style while
maintaining compatibility

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-component.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 7322d5d4c0bdc..b954f34d6025e 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -261,16 +261,19 @@ struct snd_soc_component {
 	list_for_each_entry_safe(dai, _dai, &(component)->dai_list, list)
 
 /**
- * snd_soc_component_get_dapm() - Returns the DAPM context associated with a
+ * snd_soc_component_to_dapm() - Returns the DAPM context associated with a
  *  component
  * @component: The component for which to get the DAPM context
  */
-static inline struct snd_soc_dapm_context *snd_soc_component_get_dapm(
+static inline struct snd_soc_dapm_context *snd_soc_component_to_dapm(
 	struct snd_soc_component *component)
 {
 	return &component->dapm;
 }
 
+// FIXME
+#define snd_soc_component_get_dapm	snd_soc_component_to_dapm
+
 /**
  * snd_soc_component_cache_sync() - Sync the register cache with the hardware
  * @component: COMPONENT to sync
-- 
2.43.0

