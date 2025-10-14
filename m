Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011069.outbound.protection.outlook.com [40.107.74.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD51B30AAB0
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415932; cv=fail; b=ofNx2GFR9GdJsSHMMnjaYXDhzVl2XatGdL4+EL7/EAMRhmeIsayqOt19t8qFuaX3wXVPvBVuEi+8Zh+rcb1gbrvU8Unq73DvrtlJXWAcD0y8WBSub/fqZJroD2jN+MFXxRT8Mjf0OgHPR6qJVfMYUEUYqWPt8yqSBPbmcv16Wb0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415932; c=relaxed/simple;
	bh=qCPE8WCEhtmgzkygs/HEROTp+aq25ZL909IONUuDnwM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=gbh6RSmQSj4gxW9rjoiIhJTAIqCbGQlSNmL0+6Ixy+MBXACPpbmDsx+wWRIloJ6uA44miqxvpeh/8haqPG15FcD54MlpIJxkQVikuJGY9EUPaa6bDrOFrrZBumSpiIAPoDNuiasF+zTDjivFx3wDQpSL28YMcHA3NfB/5oAYLh0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=pG7ZuqOr; arc=fail smtp.client-ip=40.107.74.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="pG7ZuqOr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gj5/7Cdiyr0PsWJ0aNdyZBY/DQDVdZfigwovME0bthQb5qzhN0AV+x1DE8dPVsf0avkWtPki3Dsc8OTdQdpEj9kEXCMqF+zqpeErMe9EYxwQbHZiUMbMAUvqvQPFaEAIMampx+PcNmHeIPhN2bDQdrf99YdlcEXM/GGUCG5YucZSifU/JCopAVbCGDhrTu/ZOjCJhf5Bu0R9xZtls01ju1UFce/NR+43qlTyNk9GNUUEfRQ3mzdDmNf/qtIcQMOw7XcL/vDJW+O3Gr9t2SfKA5rXFCTCtcFupjwE3nzgCQXWjbENi0Oc+VXBPP/2q8aowgQhkv7EFBZIBKVi0MdOtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=URR6Z3ObnFgkw4rGIelmMmzjSNp/ZUrywI3XbMMgrJ4=;
 b=bhr6i0mb232QXNso+E8WBup8KPFZZvcfHN1YYubDgQkHh5XCaW/lwAAlGRaElIw1VRjEsEf8joI1Etdft4CI/A9eWxmM7No+G3QJWBj/rtEdP0Q2IQrY+GDtZu/GQRrbI9OykYiYco/PkqOlbNJ0z0eUTdKb9gVsIrrn/2ppeUroahAQGlDWq96gDDLHp0vXEOQH05/QZPzi3U9pD9fazMY6jsgrzhI5EeheKXxVGSVzbp8Ht++XF8cwYPHGbVyXIeZva9+InQPgsF1/9qiGa384gGeVGh63y5JeWM8kNX0ZCQ508Wx/g8GAP3YkilZwb0rAdtMW2bC+v57qittd0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=URR6Z3ObnFgkw4rGIelmMmzjSNp/ZUrywI3XbMMgrJ4=;
 b=pG7ZuqOr4Ou4ZTviXC7oZBBn7AchgRdyPjTjmRp0m++NDPnyRaYverX75U125U1dQ/xNvZC23ObtkX4ZtI4ER3bdPoRypzNeu52C9qaQRneKv07nB+4iHnTFeOCq6nw6k0qob0/S40VowrYIkX8Wf9Ml5Xum7HMDLZQGUenryaQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10584.jpnprd01.prod.outlook.com
 (2603:1096:400:29e::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:25:27 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:25:27 +0000
Message-ID: <87347mp0sp.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 095/139] ASoC: codecs: wcd9335: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:25:26 +0000
X-ClientProxiedBy: TYCP286CA0031.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10584:EE_
X-MS-Office365-Filtering-Correlation-Id: 74676283-c27c-467e-ed6f-08de0ad9b383
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?otXtORechxF61bqfugubZ55VIV8r/lrYFUqukY/AP7F+3kQTP0Hpc5BilEgN?=
 =?us-ascii?Q?H2hWtQ5CNv9YmJOYKBHdSZMmV088oF9PSUnmcTV6bVL3/p3augIFcnF9oZQD?=
 =?us-ascii?Q?T6YidDJ7HPN3FWXt+7Kb7Fhwl5WuFWwNeI/NzpjM8mWObCgT0gNXEAuwn9zX?=
 =?us-ascii?Q?f6XQbDL3EhGv/yHrGagRVOOk1zz0j/o/WMC3MTTYdWZoDhOpF5YlNpPLMmOm?=
 =?us-ascii?Q?zG1JiAvOPEuC9LTfeSvTlEhtRanD+7X2y3Bev4xUf0+Ymh/WafnLASImO9Xm?=
 =?us-ascii?Q?d3uTcSBQLWD8ENEswLFgI3hxTIsfqqThaFwJsvxS+FpdsNv/rXYaKkyaDeSK?=
 =?us-ascii?Q?UQfTuhMoEguLFa5UMkQIxQqBvruCpzEX11HK6zedCdT7WemXJRGanuSMrWr/?=
 =?us-ascii?Q?4amukSGBhyx4IqoI+MwGNXYlaQlmv+9CQosGKqcuWz/bBTF6dr+EJCcBoI2W?=
 =?us-ascii?Q?4bHdzhEqJDiuvYHivsUR4Q7WJRPxfff9wiJx4YVFKu8e6kuhw/95sJLSHX7u?=
 =?us-ascii?Q?wDWyHHHGfL7mYlrvC2/ImeZveYuSWejxQFML5EBD8hE6IxvB+0FIOkq2wttU?=
 =?us-ascii?Q?CkiRI8T5D0TiXDrYbxIbm1aEsXX1cTp4SxtDTWm07f79DMZ4J6yaaXvoWV25?=
 =?us-ascii?Q?6GlLu9bQ3Anr43yByPXf/zj1mMtEqmDETuRydIGDyZQt6CawJkZW/zmbz/Yh?=
 =?us-ascii?Q?k12WC7QuD41X6N0994ZLIZHFGvBOwhwCCvJsGmO3lRaFyXRkkWpWkTDFH6ou?=
 =?us-ascii?Q?Lmg55hZhkL/iryNDEobFoRELS9qxWP5nsrK4vfY1PTiSstO2wCnG6Ew61UIm?=
 =?us-ascii?Q?T80P+f4mf+9r0h4oQnIIM4+31cevKX1VLBmxoBr8htfIu+cM2/3IJwWKxuwx?=
 =?us-ascii?Q?DjSvv+IWH6lwQI2n3jFOBfr/mT1sjVXClwpsHZuCXwlpKeZNS7DcXiDo6i0w?=
 =?us-ascii?Q?evX+7BykIi+vfKO1wUcM78By+t/iM1TFlCYxR8RGF27EcSD/M2c6PO7BPu9G?=
 =?us-ascii?Q?PlkPY1j6sbcaoqiYW0M8ktL+TKZa9oc40qqrgHhp8tEbFdQqSboZfFncwrW+?=
 =?us-ascii?Q?Mi/u/hDXNVOjIuZm16BULTcV8re6n2BaPWu+8k8zZbHcunJ23/tPYT7fMWAT?=
 =?us-ascii?Q?ACilkLlQ8hzR2dKpC+kwErbyziShXFuZ6P0pFYWkYw+DvFQegc2wkiBerSw8?=
 =?us-ascii?Q?uM7nLswbQK6vCP+7pDi+V6LwvFB97XNTmesI78HOSdIy3lj7hEuq5epOYZEX?=
 =?us-ascii?Q?t6yc2nE2bWDZ99JU/lA2GV9zeUN1pgxRY7IJrkcAujjNKdzA7LOxfz1yelgR?=
 =?us-ascii?Q?npRDEycP9Wo/2nSqBbOFMVyXtbZV5rdsGLjkZGzIPClNeK7nBcx+AsEce9cw?=
 =?us-ascii?Q?0F2xhI0i2oK8HtwpnjkhP3iy3ZvwheQdMJYDRUJBO8d7ljPT8GEclsviQ2pu?=
 =?us-ascii?Q?yMS/wM5TdRb1VykV5fAZOoTdGUlfeiqCrUjO/EhFcZ5JdYLtT+gQ2FwgSsbk?=
 =?us-ascii?Q?2vJQ3/vR9JzeCZ+7HsjLApoSnkV63z03h2ml?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?G0Y0ZmN/2vPLpCldXYGT3+MwPmSyIxmUzaYYY/lCA0y34wKFBdUwVMXgH6Bj?=
 =?us-ascii?Q?qCktxPO0+4NLX1323gSQIH/dxfpEEb9+4aDoSsywp+4sA41gwypzK9yJnNYj?=
 =?us-ascii?Q?GSxOHJodMIIGUn3qOI1tN7sVEbOr3D5PWVTn77nUA4XwnMf1kS+oU0k6w5jD?=
 =?us-ascii?Q?inPuIapIhOrF71NQ7mO6X7MN1QrjI+KUcxg8o8hTvgofwW0DaZt0CguscfX4?=
 =?us-ascii?Q?B4E0G7kozNFKLytu1tZUdNLqcE3tPi8wjOGNv16Sm+9Qx/t75bKjJo9+yGr4?=
 =?us-ascii?Q?NcAVa1hx4iq1w0b1/CMY3fKj+cCo17dQKi2WQZUcHBNro/6DWWnB//mzukub?=
 =?us-ascii?Q?IW49nMJuE/0QQM4ZmQHWzx0CDReOa92+5ePSHInOHlexA5CRkFsc2QsYR5H1?=
 =?us-ascii?Q?nZRJd/6/nYGZGjKNk5+ajvHKs1LD/kyyPiRy8hmha2np3HpB1yPUGkzRTEjG?=
 =?us-ascii?Q?Ga4+QR+am0bOQhOZETd4+d9XMb4xCy4oHp7Jn0oDUit1DP8Q3p88e2T2j48Q?=
 =?us-ascii?Q?t9k7hJzaIVwu6slKMgTscynZE3bN1X7J3Kw1gbMyrucyTTub+pH7CMMneLEw?=
 =?us-ascii?Q?gZaSm2aDR98YvWAccIr0PSk0MC4oXSJv6OfwmnZ5dk326etw4uXRAfdbXB15?=
 =?us-ascii?Q?PonINWHjL5NIKXC1KfYQNH2eRiQkW8pGcDHZO5uSd1YLVLDRWm+iav9YxO5Q?=
 =?us-ascii?Q?K7PEkFhaJsaqex8wxTAzA+wSpUdt4ls+wIejF6GK3i5j6NhUqw3vw2+6maFO?=
 =?us-ascii?Q?5A0VTmuwKCCTUbmjV+8x57kx8HkK74c2Ib5WkbsdNP2z3940VP5MNyKUKgN3?=
 =?us-ascii?Q?3NNzey/5vNgtFmTbkieFCEaU/wn7YOTPZ+G8ObqhgFZbsloDaQ11I6P4Uljz?=
 =?us-ascii?Q?MqgOduItcWnhfwmBcpvSnPggodSMX3fvvYDFhFF5qtRKn68CiZ0WtSV2xSBi?=
 =?us-ascii?Q?LGhWrxNwX1KGs1XNczRkLpYkVR+EyjYuAiQDbFEGlZ57yyH3sFuRHBywMTPu?=
 =?us-ascii?Q?g5YnezQ1rMeFFjtIcOQ93vlnOlYZDAnuSD/ExCzT7+qAKaSYO1yaymxzufyw?=
 =?us-ascii?Q?QbssGjxDYAudQn/UJfCmgW0zl/HcuNMyBLJESq8fi5Au0Mnb45vJ8g9MbooV?=
 =?us-ascii?Q?G7USRZROrQZ9CcdNGR6MLAHikGoKkN/MEUk3a8m0DqYoNdtEfDAVRo/XC51e?=
 =?us-ascii?Q?xTVetCVUC+IyJFIf7Zy674/gV6Or8w8WWGLfpdPXxA5qHAptnfLjfwcZi6nj?=
 =?us-ascii?Q?jENMVZIakclK7rF1F3Ts6aqzClxk+9QSXyiv5i22vm57C6uFOnR6EtOB4DwW?=
 =?us-ascii?Q?NJ2sv1LWwTjtQvheYLnEQEfQnGVz4g6wzOzODl6CIeZetrwE9xTrLIZkrmMg?=
 =?us-ascii?Q?6v/22KCBCIcTtQMS24ub9mH0CcjuPGLJgb7aynf9b+8RxF2iED+oeb/eqoWc?=
 =?us-ascii?Q?xGct2YyR7h+oYzKPK6kPleSFXdjYV6e4AorVaIeylmrG3OqKSZxfrVnBLhJg?=
 =?us-ascii?Q?3A98PJAd59sNqyguGedamL9DBDddPaElNvGhH2jlRoGANH60spkuPk66JQ0H?=
 =?us-ascii?Q?Chw5WN48JI2sF0IO3AVOKqLzq7OhOT1WdMMBN0dVxNip8wX02KVzGWG9au9u?=
 =?us-ascii?Q?dM8EdRn08v/clMgQz1gtv6M=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74676283-c27c-467e-ed6f-08de0ad9b383
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:25:26.9990
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NTBplY4jvyevPKQHnCJvGYVQO07D9uI+OdqfYJcIkpjBcnD/TZvmHWH/TEv246I8FZ92fYWeyj7pKTD8261v0jsSD4k8ByFLgpceDALnVQGg+NG04bK2fplLGS+77zyB
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
 sound/soc/codecs/wcd9335.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
index 1c050b8c19de4..5485c558b879d 100644
--- a/sound/soc/codecs/wcd9335.c
+++ b/sound/soc/codecs/wcd9335.c
@@ -2177,7 +2177,7 @@ static int wcd9335_get_compander(struct snd_kcontrol *kc,
 			       struct snd_ctl_elem_value *ucontrol)
 {
 
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kc);
+	struct snd_soc_component *component = snd_kcontrol_chip(kc);
 	int comp = ((struct soc_mixer_control *)kc->private_value)->shift;
 	struct wcd9335_codec *wcd = dev_get_drvdata(component->dev);
 
@@ -2188,7 +2188,7 @@ static int wcd9335_get_compander(struct snd_kcontrol *kc,
 static int wcd9335_set_compander(struct snd_kcontrol *kc,
 				 struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kc);
+	struct snd_soc_component *component = snd_kcontrol_chip(kc);
 	struct wcd9335_codec *wcd = dev_get_drvdata(component->dev);
 	int comp = ((struct soc_mixer_control *) kc->private_value)->shift;
 	int value = ucontrol->value.integer.value[0];
@@ -2227,7 +2227,7 @@ static int wcd9335_set_compander(struct snd_kcontrol *kc,
 static int wcd9335_rx_hph_mode_get(struct snd_kcontrol *kc,
 				 struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kc);
+	struct snd_soc_component *component = snd_kcontrol_chip(kc);
 	struct wcd9335_codec *wcd = dev_get_drvdata(component->dev);
 
 	ucontrol->value.enumerated.item[0] = wcd->hph_mode;
@@ -2238,7 +2238,7 @@ static int wcd9335_rx_hph_mode_get(struct snd_kcontrol *kc,
 static int wcd9335_rx_hph_mode_put(struct snd_kcontrol *kc,
 				 struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kc);
+	struct snd_soc_component *component = snd_kcontrol_chip(kc);
 	struct wcd9335_codec *wcd = dev_get_drvdata(component->dev);
 	u32 mode_val;
 
-- 
2.43.0

