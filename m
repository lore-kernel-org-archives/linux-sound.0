Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011057.outbound.protection.outlook.com [52.101.125.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16AE71DFDA1
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820938; cv=fail; b=la4idYJy8sMY+Qyxm0krAIQGSDG91by3qVNQw3GB35PiTPIj3o8Khz2I57WCEo9BHSGCOckjfdbwDfXMWrwsO/WgwGERoSGTTc0sHy0PXKCr5xyfG75zUUgvEKJqPVkdckCNO+jVyXe9qiALGUvo0CC4qU2ucjcAERJDVtR9bxE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820938; c=relaxed/simple;
	bh=bYcpFpPD4zrhUvRwts5Y98lPoHQij1Lsie3hy7wbFXU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=J0KzS5NSK/PxWf0tG2wV36Dl2MT5VThyhOg9b1z3E2UnpnJ+gTltQJ5IPdlwAIZL/KUiTlhaxktcRrqBsi1OQmx6VHPV3ilHtKG/kM63HKP7Timbq5+K3OBVYHsw8AHFRHvkdb43JN3h6C/xWBZnyPkbGk9pCCCWhavoMSL/gDQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=n68FjAAh; arc=fail smtp.client-ip=52.101.125.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="n68FjAAh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=djUptsKzLZWinfu503lPgHqZfauodBrTi+/+4TnuHBkde1C+UFsVPwr1QIBftKsWyPVPICpkOJdJaP2FXJFjq+WTIXpg7Ki8JAnaiZhHosgWv7v4NDU9v7F+bvag+KQvcgngctGLQj10w/hVU0RLWj+1geLHqis9BFvOXennXMLdBlKonJ9XTHGBz4/Sqd/5yf3rFIMpd7yF19FAK5o20iMWMRGOGXi91mAau3bJwAI9v0mpazdMWVmD9KrB06h2xkKZKU83WwzfwO8vdgUIZXEk+q721aJoQQT+AELZ/R+J0N735noLwLESgYbPON1IXUaDD2JZ49n1aJosTkiWBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gXLjPVR7zDk0VSg9sUytsjDy9Xc+9NGt6zcXLc18+5Q=;
 b=E/Z8AOynZ4zXLrL8UOwwhHQ2F56os0YNvmI4qe7zNm32rNbO47kWjOW2QLSt17X9We8rcgtXgrNgzALQv1bGfSMpAbTA4HRXsH6w9BHBnpj2KfITL6b5qTDGRM1G5YElQChjgSfXp7DGfBjjKSnNcnOkcZZ8sFvunZ7wJks19j8TXX7bUppsphc8HwJem/6U3mJYulkcXiTS39ST5De72KDLeKkg5WMEPYWwBXkEblGRy+ts+N4AHh7JCSlWAsRyQ4axCIN/aAyr9JJHh1xSiQ8agABWI20XA3MWyUJP9woLqSvKEJ8iDac9OKqWC79i7p3o8nF8FHTCB4hLQcl4jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gXLjPVR7zDk0VSg9sUytsjDy9Xc+9NGt6zcXLc18+5Q=;
 b=n68FjAAhfamOpHMNGSbqgM73+LLSiwTHRYAROez9r45rg/hDExFv+wT/dHknHjKVuivrd6AbJbacw1JhVm4ioOlen5WSch1CnGTGk+uJd+B7V8rDN40lGgB9oirTIuYYFxt8YVX0NJwGXXju41ZTGu2O0yyY4XouYIndJx7dm3k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB11220.jpnprd01.prod.outlook.com
 (2603:1096:400:3d2::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:28:55 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:28:54 +0000
Message-ID: <87pl9pza2i.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 165/292] ASoC: codecs: wm8776: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:28:54 +0000
X-ClientProxiedBy: TYCP286CA0167.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB11220:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d4286b5-2f47-4d67-ffa5-08de20b94b7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Vpllp4RSQAZjKDKgljaGigXHDVokg0i1WRZCoZNh7izETbJJBCKY0RakbsmL?=
 =?us-ascii?Q?7K4zG99zxuYHD0tyCe+KqR8PUpbP5sNUNEBrUFkMjs0hp8WEWa6nP3SiAGl0?=
 =?us-ascii?Q?+faAuMl6v2TyXyP7k8o3i2UJF0VryIcrilhLeO7UNS05iAAuWShSRXvijRNs?=
 =?us-ascii?Q?yhd13CbpU0nwICGpBOf+NeODr60yXp6sWRoHKL8O91jdgxq4zxaVCTg8IBh9?=
 =?us-ascii?Q?IxZu597LRPrBzm0TtV9AUY+ykQFW9MebNYpY/LbZYoC8AU4x+AeY6tBgE4Go?=
 =?us-ascii?Q?Rxlg1Ty2BT8yGjq1CncLVRuVXiBQs1Rw2b8fSR4zMtM0Lfom8kXfjNsqwt42?=
 =?us-ascii?Q?uhI5IyA/4oukcZnhEN67JZuYbOx3cOaGJ1tYxm7nEqmyJH3Cf7X3G2GJ70l5?=
 =?us-ascii?Q?k2BbKWcL/RfpLMgCjlxJWqXMnH5WaVuCYJM8dldumgoJDY6Isn8/+he14q1/?=
 =?us-ascii?Q?ZW6+GJYav6sncSgUq52iYVrOw+U2WbftlXAB+SLpKTfQ/Na7goh/TsftQEhU?=
 =?us-ascii?Q?yNOj4Rn+JC8qjsmvJrEfTTAz4k1oCRX5eyrA/wR4hQePO85D4g5UIJPxdMBU?=
 =?us-ascii?Q?El1aqxVBw/HmA+x9nPyK/zmAlWsV9OaO1g+IVM//AcyRJ9O0Xj7UaX04KNgO?=
 =?us-ascii?Q?FekKiaQ5V7leWg99qTnI0Ve2aMPMVnEQkO60nA5WOE7bJGGreFqmt1PyXGCH?=
 =?us-ascii?Q?6Uci+DfZ3mBjil8RlBF++GX3qW+m3YRY744c3gRe3/FZN9NBC5JoeNbbh6zw?=
 =?us-ascii?Q?QkN5e/3upYp6wbCEax29gpiJXqk6IC5dFW26IN8lGRzl+Im2MB05/lafBt13?=
 =?us-ascii?Q?b9MSkcLQ0uM4tYZToAET+dXvR5qSstZ/XU4Dl8+qshYcR66L36iVHNuleFBg?=
 =?us-ascii?Q?jcTcjxr1f3xDRrFVq7/v8U532xvdiX+O5LPuSYE0HVdf0mDxaueWMxELdzo1?=
 =?us-ascii?Q?fkboALmtK5DMvjXpKL1Ru74p74KLHKe/lIyiZWunhTdOuysjL0fwR/IGSfRl?=
 =?us-ascii?Q?zEPCZJWnbHchuT1i/rly9wcSTl+ZsPHst+ux/EpOygLppVvzuu+nfCKMcRWP?=
 =?us-ascii?Q?P1sIu9ei/Xp1I6RM0VBkaNIIYGtsVMSENQlvJrZGkdWUwpagmpzEv82SaHsP?=
 =?us-ascii?Q?qIwNpYum3TpRoWwT2KzYiiZ3cMLJyNp3UbyynXvIrKSv6WJ8FSerad+JN6ox?=
 =?us-ascii?Q?O79dn65tqkxcr6TIfpOcFAOms+hCljJdRLjXIHR1mvfgDGSKTZ7NK1/+78Kg?=
 =?us-ascii?Q?OM5Ozex44daq3kMiEYy7TCzXpavKC818GvRV0lL828obzQqAfJxcN6+peNPx?=
 =?us-ascii?Q?UyL640B7KHJEYN8aHj0XA90EY6bWXGyxzYNBrsYyDIcfa1GoJAMbncFQLhrR?=
 =?us-ascii?Q?fJgB51RmdeSNdvizQdh4M2Ej9TH9K+88f6QB/LOGmpgHpnypB32B2vmmZyoj?=
 =?us-ascii?Q?RZ15J05lrw0TAWk8hAj0ehwv2VJkEmgSp1iBa668Z9v2sHAeO/ThqbRVnaeg?=
 =?us-ascii?Q?dd4FwuBYfJ/xAwMxg3MdQ0wFxxlz9CaHGdly?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OCaN6VD8+bdPWI30rUyMBIeA6EmTJBOHs3QUXZI/499oivOO9uXLSMgC7N++?=
 =?us-ascii?Q?Tj3cPPt+9L3xzeSPUPlvSklswfdSgTHGlzHBVuQy29joIPcHbFs69tEiBtHz?=
 =?us-ascii?Q?T//AJFxnS1zkkzAF1mHDSsBEY7rvCqddjAeaYJmOf4RwYuNhUXEQGY5xu+bC?=
 =?us-ascii?Q?PJAsQm6rLJ9g3PJU6fV7Adtsh4KAkpJ2xyJJjjZNDuadGwoFmD5gbFDL2bpD?=
 =?us-ascii?Q?HJVLZcs/lvmy/RDAhyBndP7r6/5h6Zw0AS3KqY1mSj+69MwbUrWcTRKYu5Dv?=
 =?us-ascii?Q?D9GO+O1MgNHk3/G8QwgX4+NR2RiTuXDwsp27PI1g+zGCN6i2QndS3oyd3Ogs?=
 =?us-ascii?Q?g6FFgR8NXcjpgO1DRQMznJuTma/IOAGOmI+GpxXR7tSDe1/Hf/yxxy7n6+cG?=
 =?us-ascii?Q?kvmdqm4gJNYMJLMzMuxdWDtnaMbW3e0H6bqumAKJX2sTnBD5RlDHIVstdneP?=
 =?us-ascii?Q?4fGgCT9Zpcx5ATuO9OPfalS4ywjgfzZqJ21hWvbM3V+q17ahurACah2q26WZ?=
 =?us-ascii?Q?OWw/xdk6lS8tIE2lm4w4l8TriJMSrnJj5mU5HHjsHM+CYXMIGrU4gIFgRRHB?=
 =?us-ascii?Q?qPz9lUecew8BvU+ijPTfS6Sb99L0Bj0XEU747yZDSjetxB4EhNkeWfyLY0ci?=
 =?us-ascii?Q?hPaFwJD0mCrinM645gunkUh+jOyEdck1t0yqC0sbgvTcxHzKH1o1l8/iGvct?=
 =?us-ascii?Q?yyb0n5RihJOqiUlFU5Lo5fGcQGW+nc8SMX5o3o+Pe0iEuQl9P3sfX4Zy/FsF?=
 =?us-ascii?Q?CyI5b5qReOhwesBIBl6WIl1+6WC2ai1LV5ivSl6bGc/myBdfmhDUvImsHrG0?=
 =?us-ascii?Q?CkqUwA7of4L6WGLEl7M6v2xhnNQyqTQn8bAsaRnffjWVi/kVEqYdR5qadpx+?=
 =?us-ascii?Q?/A9An2clT2YM1TuWyUSUwx/C0HtZyBHFXlSPrXbhqMIg9KoHW42g3dIQU2Zl?=
 =?us-ascii?Q?BieB0kwXz/stYB2kwR3ilf5x8Bh5rsIZ0gS6qRgRCzprQ/RutHvAQ3ctUaTG?=
 =?us-ascii?Q?ZPxwup92GcrOhKvWFZ7p0v2nlRrHTCsML9bmsNa+GF7pZV5/RcksTCBrANgT?=
 =?us-ascii?Q?8VRYCgPx+Jgm26Bdg/GGVZrMMVasVRvd5fsM3hV+d4c9KdFiT6uCs8ucR15w?=
 =?us-ascii?Q?itTF0I7PkhCMJ4tt1gW8qeqMKNy4KP7+NI8RflGHo+i7w3J+tIEjmHmB0ZWP?=
 =?us-ascii?Q?zeJlH3UHls1zWbptr63XLYpmbRotn0CbaAvFhoTJ1CSttdV+Ge+d6VpXwO+b?=
 =?us-ascii?Q?JgElrtv0rEIo+zCHX8dYB494g3O1dEPDLL85xrxSy+7sovSDiKkj7VbyZPSE?=
 =?us-ascii?Q?y9AWXG0LlGTTobQYyQiuNaBgySwk7/yqiH8XBp/33bKIs2eGxQq14Tr/H1aq?=
 =?us-ascii?Q?bYX9l0rw8+3rOWGZ+OG1JUt9RKqLgrwhgra3g1cOUG+yvWPMzA1b5eK+Ib0O?=
 =?us-ascii?Q?YznPbB92LFCjP1O0WEqYs39oLJOc8Gsg3RlRJAle9JMeBe763obiuFtHcHN/?=
 =?us-ascii?Q?yL51gwcND0VclcFUcGVvXYrrga29z5Uep3K9fuSrxyL3mfWaJnAeHOMB1we8?=
 =?us-ascii?Q?0urUy8nII76osxtsWhgiGuqZhGVLLyjyos3FUh+puCkpu+vAztcrsNnn4lzN?=
 =?us-ascii?Q?IiDs9hPkgICt7h3AFDWIouU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d4286b5-2f47-4d67-ffa5-08de20b94b7f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:28:54.2034
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 357qeJ27QADjzB0oRmiiSyA1tucDfGRZ+aJKrTM0te+6g71t7q6LB7jw2eece7uSidI/yvHbYe6mafxzDTBT9/u2r9BPDdP232zpQyybuTtsEBwd8m5TKiQGxZu1c8DB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11220

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
 sound/soc/codecs/wm8776.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8776.c b/sound/soc/codecs/wm8776.c
index 7b73c825aed46..c3f340657f0cc 100644
--- a/sound/soc/codecs/wm8776.c
+++ b/sound/soc/codecs/wm8776.c
@@ -334,6 +334,7 @@ static int wm8776_set_bias_level(struct snd_soc_component *component,
 				 enum snd_soc_bias_level level)
 {
 	struct wm8776_priv *wm8776 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 
 	switch (level) {
 	case SND_SOC_BIAS_ON:
@@ -341,7 +342,7 @@ static int wm8776_set_bias_level(struct snd_soc_component *component,
 	case SND_SOC_BIAS_PREPARE:
 		break;
 	case SND_SOC_BIAS_STANDBY:
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF) {
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF) {
 			regcache_sync(wm8776->regmap);
 
 			/* Disable the global powerdown; DAPM does the rest */
-- 
2.43.0

