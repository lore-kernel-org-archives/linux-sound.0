Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010052.outbound.protection.outlook.com [52.101.228.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE0F1C84A6
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820871; cv=fail; b=QeUjbUALeUStd8QVBEAVJtLJEdoMFmbz7i4CSr3JDzh0qDN0+qCWPNe95STnsdf4HuhdrA9miII/9A0WSwoNDqeXKES0Humdfj7vm0Y5tyx5e0F9WcnlCHKbwO0yZ/rORTmgf7TFwBKiuZsvqGdxN9P9C/BzXfVoY+7R8SPCMDs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820871; c=relaxed/simple;
	bh=A1MBENChlNHkkJVh4nqldoHhdGcOPHNPg0hvOvepm3g=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=PhH4KH1bznbGn9H1VogHxHwaXpIJNeXlibD2vMVa4SCLz0qy+RZaZ/IJtlYAwYEIoBMuLceXxb/d4O0ckUlqQ6j3wZCxxns3ush32Orq+/yjAvyAlJwI4JN9h0dwgdBWt95vj4vZIvPOnWPuQWQaS4o/SmNcLBDgi8LzL18BN0s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=S3+pilNb; arc=fail smtp.client-ip=52.101.228.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="S3+pilNb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XmibgkO6hi8Ik7tfWoQ74kybQoO+eg7mz172i4dqS51N8kkS1gcUGMyoUY77BDGujbeXyHGCQkCOQznfd1xUB9M01ecDeMdL0kc/2P4BZtaAHtBTrRWnugm2xCIV3Y0Vw0f9n7A8KUdnXXOJ8+9rmZiI76zCdNBXUMxHjvo7FRrk/MtjGb18snpvgtUkgJjY+iiXCKQtoEOFkdjazFh75WKOpv3Vrclm1RWbd81riAZB6mmshfAKqPnE9HQgKqlAHB2y79GdeClDWn6pF2Xm9x2gX6M/o0JcZoADlcysrC3LsOPHqu1yf276644dkWDsdkIncoAdFjsHFlJVaXIK6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0EzetNDPySOyDot17A2XrbZCtPqlNfN8Z037hYa/yE8=;
 b=BwNll0Sx/IUHEX5WtyX2CUbCtGQxY7Qb4vvmPNMlxSdiXVYN+7S1LKytEWaI45bXMO2zZ+vks+b4tR9A67H+v0I5eadsOlZMWVaYqL4gazhz7AwKaUSp3d1RJasvk2ZCnV/cP8GIQr3abd7dQcgbeQ/4E7zMe+ilBtbQGIXbLO3PRSqe+kSBMezx6O2tmSXMOzwpzXj/z0IBHdihzRd+Ma57jpOaYxBT7sL9npBzZg/lDRlqL6ROlrvpt7KBV7KggbxbyJ/9i80Y7tbiCGcPz9qDYRYkMB+7wszCrhaZkkQ3cW2lTI4Yp+RwQYadFZ4cIRbO08+7ysXFYxbNHd3StQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0EzetNDPySOyDot17A2XrbZCtPqlNfN8Z037hYa/yE8=;
 b=S3+pilNbcJ3y2yjeCY3lLKU47TZmt3fEMZObuhnRB/nw2IlZTxu0jDjNshgwjcZEtwH4Vq+yqX8/eGG+4Hm1cZQQR+zksAYkBEbMiR8Z/BPVK1dDjneFNy9xcVy+zyk6Kdlb9f0YJgAzdALZGZB8MmXii79fbKcpmVWEcNOlfzY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB12798.jpnprd01.prod.outlook.com
 (2603:1096:405:1e9::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:27:46 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:27:46 +0000
Message-ID: <87fral1khp.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 147/292] ASoC: codecs: wcd934x: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:27:46 +0000
X-ClientProxiedBy: TYCP286CA0190.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB12798:EE_
X-MS-Office365-Filtering-Correlation-Id: a2912d11-6e38-4676-7913-08de20b92335
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Kom8LXGrch+3Au6znga3Ex4OT1nUH6B/VIHVWGgnrxxjmisP7L3Iu1yVr3H+?=
 =?us-ascii?Q?POBQeTxP8DQ0Q4Mt4IM6TrKbFJ97LC8K9MQgymKE+uOObL5Kc5/YD300bya0?=
 =?us-ascii?Q?LnXkPHgO3bw/BaLQtulZzCAaRb2tl9UGo4XnFUug1EZoYtvGle0emADGslWe?=
 =?us-ascii?Q?ejK6GadlXFXVArglElwQWNzcjEqoR+FQKCF9jFT8Xxi2PCJzbRV5nnLcMKyK?=
 =?us-ascii?Q?I23wLGOhNMSGkhUTfA5yceS8sVdVt9mW4AmOu83jjAFQVXhvhqdMZcW5+8nd?=
 =?us-ascii?Q?7CmlCsP7xGeA4tacVJSMRI0eKuobzbvRtv73mW/Z4Vb8+5xfJ1ErfK/EeeMM?=
 =?us-ascii?Q?5NXnTPOivILiOBJY478YXokJpCjP1SpakiBa868N/d2GWwlqQtZq3v4mJR+F?=
 =?us-ascii?Q?Oz6aEZRLXzNfa9xs6hHZm471gHnDpxs2f/ZfZ9U2qoU2VpolkNTQUqgDXa2P?=
 =?us-ascii?Q?UbXJGXH9GVM2tukWbW1e+lzIZS7akYmwxo7u/Vi6YJp1L2aDUGUTf09yPlRZ?=
 =?us-ascii?Q?NMV6vjwlLRn26VW0quLy8RZLeQT5FAy8ydBQFoJIiwyYdXzK3go6WSI5w10I?=
 =?us-ascii?Q?1HDa5LC/++xIpz5ELzchbhm1cIZSBADIR2QBYBuMMSoI6peN8EYCE4560UXz?=
 =?us-ascii?Q?JK5Ti0WbZG7tqz41WVQqDl5EmFoORoQy6eJFBMMDctlTWCIuKtI2HCQACgd1?=
 =?us-ascii?Q?IgMAbhoGuu9XfYRfMj51aYJmRCaz7v/zymUVsp+N8OxAWMzE6tnHuSgjv+YX?=
 =?us-ascii?Q?1FxXNeYMAuOtooyLXkKzBT1nkpgP9fpsLvi851+fFs+Ts6oPY1rjbucYcw/d?=
 =?us-ascii?Q?1JZEKTIw0TPOND309eoDBA4jmiYaf+yjro0xGLCeBwQ1WVyTeP0Va/gjliQY?=
 =?us-ascii?Q?JS+QP2Wnv3a8eqQFkQUDaznskv7+LoQmnY2w/xI6mF+FQJrgN+Yt+ZatYItE?=
 =?us-ascii?Q?nesPF6xMmMUTX6XRyCKiomxXo0xnqZWsZ+0L+CsESRLoICKlVth8Uafg8CTF?=
 =?us-ascii?Q?5EgUoYBAsRCcOM2BNylfw19Hg9+OUPNVh2vLaB7GOZH44IQ46tUt6ocdFqou?=
 =?us-ascii?Q?Nj89FAF32ilF7TmuKLUI++2g5VTID0MWwXvmZlqZV3Rx5Lff1N9cCV9PJbrU?=
 =?us-ascii?Q?xqOtAEO5mNJxvqY4QINEvZOLaNfZ26ZrLRdrejz5LFh8T3QeBccCR3j9yHbK?=
 =?us-ascii?Q?r4xJPdOKcvVBF3XNGhMYBL8iin+ohl8PTp5Qm619FRbzGeCakDi2aOytRR+L?=
 =?us-ascii?Q?/NQX+rh11s2Gzh1kQOwbkwzyk5m2ESMLyalaOjdmDSgtZqYiPagrJJhUW4x2?=
 =?us-ascii?Q?bO1bAUk9hVDFb2sKCEuZ2Gs1Kn+TCOghLwt9XL1lJKUe+D9fAE07Llc86ENF?=
 =?us-ascii?Q?AmXXr1a+k8X5QNUfAIsuQqJIwqdxPqh9uYeC3ZNsXHxNj3YHKNmunqsGz6/d?=
 =?us-ascii?Q?UJdhY0EaEj3ceMjf+jv1rT/ddkcLfGZlPb6bDs4fvYoRHbVSEtgnEAHJ8oQR?=
 =?us-ascii?Q?RcexxIxETFIDwSzVC0F6YrU2Le8ySBdYg4jA?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?G1hIMGmQ/2IdQhlBa8kwLLVkIMH76VNzqa9jNERp/8t45fLf6VHBwpahxpga?=
 =?us-ascii?Q?Uyz3v2EIYQORs/t1ASc9YJwpE2UF5hB1wd3lt1G038YMAw9TmMq7rXW/FEsx?=
 =?us-ascii?Q?nUFWQ6ns02miNRxkxiRjZygHQxOcZx/xveA6S2NVuHlx0wT+nuiP+8x2gIaA?=
 =?us-ascii?Q?40+qcBSxkyhWkT19qGigDeKNyo9ThHmTndg7H6jOM23sB4NXR5goFFSjyaoR?=
 =?us-ascii?Q?G+30etaj/FJqhQp8uWnRMbaKp5dpcw8WvGLqBtP1fCJPBsJFAfTB1l5uBCY8?=
 =?us-ascii?Q?0Z54QAALTvPYcik+nF7JnHUh9UsaRrNVcGU8cfSD3bTQbjUkF83t0FpcYeJ4?=
 =?us-ascii?Q?zGB7m1P8r6RT35dI2TQH5ULiWVn3+jnGT4TYi22vvaAq3Dr/HQh0OwmPUCsM?=
 =?us-ascii?Q?mX3A4ibvJuoNjXlmFFcZdKZyF76Dn7hSBF6+XieaDo0D1JQZPjhde5xCc8qA?=
 =?us-ascii?Q?WFzpNUwtDUP+1OE0JLzANteR3yqMfd5/hdYaJU/YpayuVM/XNSHMfDLobJao?=
 =?us-ascii?Q?pT5Jmd1kBssBUcvqsAXZJ4qfWnhWRtcrDy4W/VvagGhvHM0IHoTqyYBYAU5e?=
 =?us-ascii?Q?GcAtYDSep0eElpxYWptauvWobFjvT45BxQN0458zCb6SwA2f4QHJVMMpfkbe?=
 =?us-ascii?Q?jc6/uPa5XIuN+ysg5a5CF4ovA3BM3fFvQ3QhRto4ys9j6zsOs1julam5gMLR?=
 =?us-ascii?Q?sEFaH7ZFQGIb7J9HR/JrKVQgzvVtJVnwvE3kPnRAjZ69g9WL5/WsAbutvk1v?=
 =?us-ascii?Q?du9RwN02SYvkxVwJFt5k7FHw/9mNL48cGqSmeJ1O5fTEcPCCcdYRZehs9IRk?=
 =?us-ascii?Q?EJP2UXe7WrHiwBAVHXJAWHNn2VGFqVY3aWiCesUXHz8vFoBd+uCa75qSEVIS?=
 =?us-ascii?Q?U1C4M8jjSBvaXkacKRkpGsXeM7LDlgA3Ifty1Q3ImnyUNy4xPv8d7hiJYDZ6?=
 =?us-ascii?Q?LHQCLzQMvn9mxekWvJTx3pLl8UTgFOaGmH9EyhejAVdCNZL8u3sCI7IxZPCc?=
 =?us-ascii?Q?Lvsl94/qTi3KmQ10vxOXbGtrX4s1CBb3pInkXjcd9jCJ9bLQ5BfP84d4iYPn?=
 =?us-ascii?Q?vtbKq3GkZ/7ndtnuy8XaxlWKl8TdTK4n4I6DiiuL0tYdMdlZbkYQxcO3cFho?=
 =?us-ascii?Q?KKQ6gbPCgl7jJbE4mgNqbAZmQkJ+rAu1c6rEzKJpnWtQlpd1kcLI8XJSdXUU?=
 =?us-ascii?Q?L6wHbusfl1BatPY4zchK5SLh+aBYrQNxIOjCxpwbs8URT9J/J5Rgyv451zmd?=
 =?us-ascii?Q?2CtwdlND41jk76STq3LNhTLbF/2fQbA9FaKzWLPCGURriSJl4f9F6YBC0UO/?=
 =?us-ascii?Q?5GT8J639UtXLn6indehw3RiN/iILINESAdkbNhTIc7qjiCfFugELgx9KonkY?=
 =?us-ascii?Q?vqD6zKRmKIpCcpYSk0Z2C1KREQ1EY0HKhffv87yHCXFPKW1BXaSX7NWt0Kg2?=
 =?us-ascii?Q?/0ky3lEadxz5qJzPJX/uOG+5PZTUK/XOPpvoPEs4yaMO2Ar803C224rVvCyf?=
 =?us-ascii?Q?4OqHC3i7+fidF7zpu+6uPNeyK2Jfn0zsTCXmSXUEHnuDE4AugXKkofswymv0?=
 =?us-ascii?Q?WuZIUEQIrMELBxUOqEK+yQ3eyraMX8b3XQoXIarjJsamANTGEavm9kyAsTOx?=
 =?us-ascii?Q?JlMrGk/4ofdY1V1aJnL4AwY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2912d11-6e38-4676-7913-08de20b92335
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:27:46.6446
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G9bpHzfTmhxiKHqchJVXaChiL0vwJ0j1P/3vhNz0bu2sDg1RMVZK1dtIIQHiJK/nEShX0LYYdsNau5KGNq4/ZOc9fiSgwTEJVl3J0FCmqNATvbspddLxviGxfcBGHaKM
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
 sound/soc/codecs/wcd934x.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index e8df380bdff38..c8db33f78a1b5 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -3250,9 +3250,10 @@ static int wcd934x_rx_hph_mode_put(struct snd_kcontrol *kc,
 static int slim_rx_mux_get(struct snd_kcontrol *kc,
 			   struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kc);
-	struct snd_soc_dapm_widget *w = snd_soc_dapm_kcontrol_widget(kc);
-	struct wcd934x_codec *wcd = dev_get_drvdata(dapm->dev);
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kc);
+	struct snd_soc_dapm_widget *w = snd_soc_dapm_kcontrol_to_widget(kc);
+	struct device *dev = snd_soc_dapm_to_dev(dapm);
+	struct wcd934x_codec *wcd = dev_get_drvdata(dev);
 
 	ucontrol->value.enumerated.item[0] = wcd->rx_port_value[w->shift];
 
@@ -3287,8 +3288,9 @@ static int slim_rx_mux_to_dai_id(int mux)
 static int slim_rx_mux_put(struct snd_kcontrol *kc,
 			   struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_dapm_widget *w = snd_soc_dapm_kcontrol_widget(kc);
-	struct wcd934x_codec *wcd = dev_get_drvdata(w->dapm->dev);
+	struct snd_soc_dapm_widget *w = snd_soc_dapm_kcontrol_to_widget(kc);
+	struct device *dev = snd_soc_dapm_to_dev(w->dapm);
+	struct wcd934x_codec *wcd = dev_get_drvdata(dev);
 	struct soc_enum *e = (struct soc_enum *)kc->private_value;
 	struct snd_soc_dapm_update *update = NULL;
 	struct wcd934x_slim_ch *ch, *c;
@@ -3355,7 +3357,7 @@ static int wcd934x_int_dem_inp_mux_put(struct snd_kcontrol *kc,
 	struct snd_soc_component *component;
 	int reg, val;
 
-	component = snd_soc_dapm_kcontrol_component(kc);
+	component = snd_soc_dapm_kcontrol_to_component(kc);
 	val = ucontrol->value.enumerated.item[0];
 	if (e->reg == WCD934X_CDC_RX0_RX_PATH_SEC0)
 		reg = WCD934X_CDC_RX0_RX_PATH_CFG0;
@@ -3388,7 +3390,7 @@ static int wcd934x_dec_enum_put(struct snd_kcontrol *kcontrol,
 	u16 mic_sel_reg = 0;
 	u8 mic_sel;
 
-	comp = snd_soc_dapm_kcontrol_component(kcontrol);
+	comp = snd_soc_dapm_kcontrol_to_component(kcontrol);
 
 	val = ucontrol->value.enumerated.item[0];
 	if (val > e->items - 1)
@@ -3767,8 +3769,9 @@ static const struct snd_kcontrol_new cdc_if_tx13_inp1_mux =
 static int slim_tx_mixer_get(struct snd_kcontrol *kc,
 			     struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kc);
-	struct wcd934x_codec *wcd = dev_get_drvdata(dapm->dev);
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kc);
+	struct device *dev = snd_soc_dapm_to_dev(dapm);
+	struct wcd934x_codec *wcd = dev_get_drvdata(dev);
 	struct soc_mixer_control *mixer =
 			(struct soc_mixer_control *)kc->private_value;
 	int port_id = mixer->shift;
@@ -3781,8 +3784,9 @@ static int slim_tx_mixer_get(struct snd_kcontrol *kc,
 static int slim_tx_mixer_put(struct snd_kcontrol *kc,
 			     struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_dapm_widget *widget = snd_soc_dapm_kcontrol_widget(kc);
-	struct wcd934x_codec *wcd = dev_get_drvdata(widget->dapm->dev);
+	struct snd_soc_dapm_widget *widget = snd_soc_dapm_kcontrol_to_widget(kc);
+	struct device *dev = snd_soc_dapm_to_dev(widget->dapm);
+	struct wcd934x_codec *wcd = dev_get_drvdata(dev);
 	struct snd_soc_dapm_update *update = NULL;
 	struct soc_mixer_control *mixer =
 			(struct soc_mixer_control *)kc->private_value;
-- 
2.43.0

