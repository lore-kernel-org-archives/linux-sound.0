Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011037.outbound.protection.outlook.com [52.101.125.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC051A285
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821021; cv=fail; b=g6aEIda+OpZx4ylb1QYbbBGNzty9vB5T/anoeETn7Ndkr99qdYNvhyV+M5T25MGPROshLC7hVC/9CFGW0onlwY+E6Zc9dMmrcS/zlt9X7VRK9N+RBZRny39xpmJrL8k1+ZEUCNG+tLzQ6pKTJ1MSX1blSlCUuJ5i5dYTQNN0mP8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821021; c=relaxed/simple;
	bh=MpHta8svJwEyC5Zg8pk5hHn+68TzZXuZI9AmAyiATUw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=YcBorNBq1O8cHhOsNjqI6OW4bXa/ZMaZxWuq+Hv0ObGPBVQmbVv+TPUVYkjiiVBX1LurOU+zmPXsHGNKvw+zdh7hjFipE9bYYqwSZgfHflZgq6WAeHOa7cmJoK2KVZF7lPPifzAlUSHnnlEijXRn+0XyN8qd05Hx1rPwHD3WCAI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Loe8Pkdk; arc=fail smtp.client-ip=52.101.125.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Loe8Pkdk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VThAk3YJ29uD2Ur1xz/55tmj/Ymapy+lRS4RORfumvI87ZSvo0iOJVR8uHv4pX/TR9k3WyU76cT31KyPyXLQPPrWCDeS2CJX/OUKjlcPvZ90OfmMsaiBYpFinGf4f1Mr5boDZ2CFjjzIptACrievRdZ0SX7AjFVR9mtL+QP6EHsAwGZRWctrC/SwQP5KlEmWMHKMUqyu4hKXCtO62Ech8EEugFgjAchXDkGCCXzFm39YcH9cl7GvUk0bQQ85OZxLdxLN36kmDitrZmmlLEADHRCuZshJ6zkCPmjIlm8aVhRTzW1RCPJCV0nZbnz/KaqBRDFoXjjCcuRg2UXNdi+fdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L8y85cg+0yV5TMFIAQ9pKWbViV8t0FpvN1Ex9IE/CEg=;
 b=IBTdbDMfFeTnfUwyYjJfTFlQLbQ8aHBPtWa8JwgQX4AVYzbq6y7sWD3odZZL/vq/T6T2XEBDS16oC/GZ485UzFcRkdlX0rWI4QxHqBSym/vQSEFnXayg8OQuzdMAo+VF5UEMukoiInl+2wlMFT/xaQB1W0GISoAnoEOnzzrcok5k8mOnDyASqpyjR18ToMfQogDKBUde6X188psCbxWOHz7B2CDpkDDcQSL99ve/iqihCMAe1RbbwxdRtMOQduutYLtfyxOw3xFdWMqXsqs9eUMy3oTLqFZEuFlAKW8AQtYxy2ZZTHU31EEIJEUyLWIT3SB3I9UpM9h+/b0BkNUXVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L8y85cg+0yV5TMFIAQ9pKWbViV8t0FpvN1Ex9IE/CEg=;
 b=Loe8PkdkyZ+x3qKGUUMZQX/THULDnTPIXRlH6Y/k7lAaKaF3RP5upXuoVVGr6ze005goVzm5/HUsdgOETk+Iws2EaqEKC/O1BJDzQ4lCbsfT+43rUfV3zQPFVSlF5IWzr3AGVioMmEhYtxi0HSqduVOxAiLOv0Uj9iCpdNMeJqY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB16440.jpnprd01.prod.outlook.com
 (2603:1096:405:147::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.11; Tue, 11 Nov
 2025 00:30:17 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:30:17 +0000
Message-ID: <87seelxvfr.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 188/292] ASoC: codecs: wm8998: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:30:17 +0000
X-ClientProxiedBy: TYCP286CA0283.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB16440:EE_
X-MS-Office365-Filtering-Correlation-Id: 85aeef30-3412-449d-9099-08de20b97d1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mn+31tvOUVUlrRiFaQhum9QzLNhLZuq+SfAWm5obBfV7KcdSpQ8t0v67OpZ0?=
 =?us-ascii?Q?rJsaQIYlNM/IPTSiv2UoeocHMnRVPq+ybdi8UCQUV0C3VPf9tSwqsv9yd/xX?=
 =?us-ascii?Q?Q3G60r2RdhJ/80Q949iLtT0N7HR/x8aSmDlxT5BbjPSKIDqY3qVUDtsg8mXG?=
 =?us-ascii?Q?nbW75nUZyT5ZurOZykSzNvj/3y+ozdwoaEOOtguKjKhV1Ab8EAHqiW8pFhpC?=
 =?us-ascii?Q?fjq9LDWSVx2XiinaUOP8QTMAEWKrS0LnIwkGFbw58YoRy2VnGmvE/VFuie9O?=
 =?us-ascii?Q?yyJIp/+fEIovMhjl8QgF1k+WNU3ZWdO1Bc8+jtKQtnd84w7cCnkFYZgtuUGv?=
 =?us-ascii?Q?rEpVTOWzctVOrrGlFHAV2k6eZ+lwWptUeolDbbjCtKySTDfZ5cV+GRiuzIZ7?=
 =?us-ascii?Q?iAcg4Z5Tz0ZsKfBKIWih66QsZP/pLG02F/q5yv1ldK0v4UtDODTQOvqucXcZ?=
 =?us-ascii?Q?e2G5MrD6MzVuKwUEoughoXNTr5nARxzDY8jkUHDszJaxa5q1LUzc4rzvgZSn?=
 =?us-ascii?Q?Of4UYu0gC8TVaKQ+yAAPewu1MNKqwBt2XA6h1SlaXqL+la7jGV978uSRGdHp?=
 =?us-ascii?Q?p0EsggBNgqEOSN1BqzAXfnLX20dc17oly7gAJjcMe3+OupDib9w3YDJO6oLK?=
 =?us-ascii?Q?I6KQs02sKdLlpexiLAqqFlkDYc7CQjq7Wx793PQLxUvEt8MRjo9nceLu17Cy?=
 =?us-ascii?Q?o3AFa58eDJgDoawO+YQeQeGbdbSqFkcRNyZOoJ/Lu9QWWgDu5Edyr8mPJjoS?=
 =?us-ascii?Q?/peXIQ42JCbnmLT5JWGJMdZ3dlppyufWUM2uwngM87DQ0+MXdp0GFM83EH1d?=
 =?us-ascii?Q?zM627YW0oVMg53gVngV4Qc3GvmV3wV1/DSSbkKvglIoto1eFlkblxsWXd77W?=
 =?us-ascii?Q?vP9zDUBNUEvn+A7v7wZ9gpqyrcN1aG4Mtkq8/INwoWF5huqNzBRr9xuVQF8C?=
 =?us-ascii?Q?d/SPGHqOWaoh1mx8MI2ldrmxxMyAIaEsMrnjWuCG59c6T8L9eLkBaDtYLJAb?=
 =?us-ascii?Q?z1mmG3kGCzWPCQEpFw1MKbx4rWiXFVLVrqdzn0V2KcMIy5SSbFQ8nAw08G+X?=
 =?us-ascii?Q?DmWRbwNfDfgEU2Va43uFDefpCj0tM/fPQ6i0vEwMUVh3badYlvcyV+esa2z2?=
 =?us-ascii?Q?trvzRKNIMgfguGtd2KePd+sq/489t7HqVbYZIybxge0D2C9OLWWSFOfYYAmR?=
 =?us-ascii?Q?RUBeGl0wPn5Ftp9FjCRPwGWTLhhQWBwIe6p8O4D3CaUPR9VgcUphtZgpXlY6?=
 =?us-ascii?Q?BCpzuz5CLXyAmDUFhUe73+fz7RHhQ2Wp3RJzNPEjZ06aEJCHra+5djx3esWE?=
 =?us-ascii?Q?G9lTpY9FB73CSreHB6HJfQgWuh5dtMedk3xdNCjWTsZ4yGC5qMEyCN1n8GOy?=
 =?us-ascii?Q?BxQ5uIHGUER67WNGUJF2JzuWjlIsfYPI40LrIukgDWi0QVOldz8pyjqV5AEZ?=
 =?us-ascii?Q?d3pFTuA0sl6LsrqZHX875S74M9VhShFtiHrzVNFMCvrhEf6Uz0i9Am3ynDuv?=
 =?us-ascii?Q?UXZiUDUZnSFMJXopbNr6lYPkmttK7ZqQW+Bb?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?M0UGPBVF+QTGQP5dvFhXHv/koDI+aeI69HHE8Ks7Ts/2LX/MQXZ/V3rKXfB5?=
 =?us-ascii?Q?X9QjILUw1vodth6lhSPwnInpXByQxNtWwTuWqXAcfXcV4dJW2WKB/OVHNKcu?=
 =?us-ascii?Q?nB5FDcvJ4BIANyIgCRND8aNwxnCh7NGg0B7mHkwYk4Bj+kexhYKRMJw0wu+K?=
 =?us-ascii?Q?lcRFMRWqc+CRb874IqCo9zAq6o0jkccEf78eWpcQb900i+2N5Fn+yAAeiD/b?=
 =?us-ascii?Q?Unk+imU1hSQ//ShGs03YZqJXNYMnhc9pKdRNnKVuY3QONRPvZko6xx6Q8+T/?=
 =?us-ascii?Q?Sk45fBk82yYZQwYXH6OiM3OB7h1JFy1oPjy8rJGsOA0APILTuXmCzh0rtz8D?=
 =?us-ascii?Q?l5sxW/vTwuZLGdmx8NiCh8Ga8H3AgwwyfLiasDpUobCL7GQYd7MsQy+f5Ot9?=
 =?us-ascii?Q?s0qUo+ndERrFSsJHMVJbCFRuuny36o5qe6LB91/RieXDVDlIj8ONOSlNzTBF?=
 =?us-ascii?Q?5ICmRLnNg1j/M5Fjo8xvOFXVVRLsFohlaO/bDkuIw83wmHn8Ujh86uf14JPi?=
 =?us-ascii?Q?fbdlllX/w4sC74hW5YjSlaITGAIat6qjsm0zjuT5vgK2Pz7tB1rQcBc6Xxlf?=
 =?us-ascii?Q?rQSk+L1EnCBjceO/CNuCrm0OtHbDMuLF3iuYl60G6SeSx1qf8+S8jvNQ1jl8?=
 =?us-ascii?Q?k3cF7KmrdjGeBXzafnz4IATR4NtuivYbnz6j1ewDyjx4FYFuTs4wpoy6pprf?=
 =?us-ascii?Q?6crAP7jaPfga+CBWBAJEi3hr/CP5dca+fuNMuZI8t5zs3T9oUfaJaq89ua/w?=
 =?us-ascii?Q?SfUid3nryiFoQ2nYTALNG29QtU8s6Grh/955+TzkNa4+fSsqMBrsmlEGr9y2?=
 =?us-ascii?Q?PJheTJxk1J/mqqBl2gtgbrZ0RS2ZKN7WcRNDULUkuIrOsYdm0hYMeVtkq9cO?=
 =?us-ascii?Q?XYtGu0kCuD43fVOyHprTzzSWB3ISGoU8TTrN0wrMBmYSRM6gPmWQL+dwYPKr?=
 =?us-ascii?Q?dvydk1AoPCtkJwhV0ESph1+/MX1WebIkrKJAhOrXlFsLRqCfeLsW2s3SVtAF?=
 =?us-ascii?Q?i3+ZaGZxNMWxUonY6C7tdxECoWgJvZErA4JdX2S3I+Ielne0FXEUkV7iz9ct?=
 =?us-ascii?Q?bXvEIHoTxNz3NqlUVQGRW4akqpOiIUff6G+2bsQ7gtJky9RJCppdSc+y1Qvb?=
 =?us-ascii?Q?uRP11WbNLp6fvbRxj9kLxJo9WznXKjZVeG/Ti063MoFk7AwV9HBQYNGZHjAQ?=
 =?us-ascii?Q?fntqk5cCifY6N2tfQAouzYhiiEzpGsVZFIZcjPz5D34CgK+f3Rh68RO4H31V?=
 =?us-ascii?Q?P0IU41G1VllpyGNpZMqyJ09SG8A76qN78afM8+earHy2T/wzEht8wwhL4Bmj?=
 =?us-ascii?Q?xFxl8onDDbwwGmIdlAYbQxL84Wp8dkY9XeKYU3Ylda/oiijaEICYFkfA2J/G?=
 =?us-ascii?Q?VfTH9UxJ/ZpKeys2urTBy+Fn4uBWzCQCb7/dot56nypSsuvRJUNJAiHF7ipl?=
 =?us-ascii?Q?khB34bvubPic4OQVqnhbBah46zAnMcJErVH0/YTYL15tGOB2fMyy6I0NLsg2?=
 =?us-ascii?Q?07x0lOtr4wW8UzlKGslHjugei7ujVsnjDzJzt9p5865jIZkbsSoO1Xal/gnA?=
 =?us-ascii?Q?rJS4cpRl0kgzrRDCVOqx7TKSf6ae8JmQMxeXeHJBB0IDztfvoydBF85gCIYY?=
 =?us-ascii?Q?Vhm3Dcd9rCeN9KisuPyU+34=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85aeef30-3412-449d-9099-08de20b97d1b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:30:17.4304
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3YuEqODItRXIfJmpIIOLbyM9VfI/wzpCdDXxlHOAWwROZjBxdkl3HyyF1URuEcWwg+gG++9/E9R168p1IjRXm3TMFcX7GjyYoMuyM/rvV/tlovadJ4S508KAeI/OEqHY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB16440

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
 sound/soc/codecs/wm8998.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wm8998.c b/sound/soc/codecs/wm8998.c
index b72b8a64be8fa..8e6f03d00c715 100644
--- a/sound/soc/codecs/wm8998.c
+++ b/sound/soc/codecs/wm8998.c
@@ -101,8 +101,8 @@ static int wm8998_asrc_ev(struct snd_soc_dapm_widget *w,
 static int wm8998_inmux_put(struct snd_kcontrol *kcontrol,
 			    struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_dapm_kcontrol_component(kcontrol);
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_component *component = snd_soc_dapm_kcontrol_to_component(kcontrol);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct wm8998_priv *wm8998 = snd_soc_component_get_drvdata(component);
 	struct arizona *arizona = wm8998->core.arizona;
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
@@ -1279,7 +1279,7 @@ static int wm8998_set_fll(struct snd_soc_component *component, int fll_id,
 static int wm8998_component_probe(struct snd_soc_component *component)
 {
 	struct wm8998_priv *priv = snd_soc_component_get_drvdata(component);
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct arizona *arizona = priv->core.arizona;
 	int ret;
 
@@ -1292,7 +1292,7 @@ static int wm8998_component_probe(struct snd_soc_component *component)
 
 	arizona_init_gpio(component);
 
-	snd_soc_component_disable_pin(component, "HAPTICS");
+	snd_soc_dapm_disable_pin(dapm, "HAPTICS");
 
 	return 0;
 }
-- 
2.43.0

