Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011010.outbound.protection.outlook.com [52.101.125.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF22A1891A9
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820585; cv=fail; b=hlOvSRsOEUh8VtT4IitG9qF9r89Yx//N9PAxv+6ofTSsPln3PVgYfGqe+9K6kpMe2Gd3VXg3uf6Lo+encQVQusdAK/hVt3X9OBHcwcldTjsU3zoz13hD8fQQelQsAyEHCSY8CtUYW+DzTcPU7orZWEbfYkF3qw2m4Wb6oEwBTf4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820585; c=relaxed/simple;
	bh=KkyhWk+KYCiJFANeKq6cfe7OYBOiKeLnm+JOYYirhow=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=tdnsif0atMHt1pLn+/PG7KYg7XtiB4fUaslAr/BRVWh0OYfLrvJNTyyQuJSfZSNMAKKelOdOYDxE1lAmeNTHXzUdZdRKtKnexny9Agj3r1fbny8nvsordF2Dz1Tc7kseubZCgKx7oOqOIsw4BtF58aBorl7rxHb1jwYHUCOWcL4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=MyaOJPiN; arc=fail smtp.client-ip=52.101.125.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="MyaOJPiN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eB/FY8YRjrDDRICg2/gcej/FkhyWgfQtBSLACJFZd/xoYMlY5AsVqnaw4bYXtdgYXJC1YSKLbH0NH4T8xTrMi/cfUM5H+DDv6OCcR2Qho2kls3t9eVspr6HQitYi80XT081qSwFB9iEOPrwSbJfkA81Cae7DtTi2LyuIKI224HKA12i48Ve6sKnJZKAT3L7Vmx15UdhxcZZYau9j2FbNbKEnoQI6ToTdFyx+4YEK0hQz13yDfOxqFoebeHsaxX3MJhiUPxDoP/cv+f6wf9qyhz6UQk3qntx9B3bWrKo22zoIohaIuBASmzplDfoxut6uCA+J+JEa/LY2I6j8Y1P4cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zVI1Wmn+iGmRpWVShCHDVobwfTErJIFf0xyoQg4jiu0=;
 b=DACtucP6xrtVvG6XdzhurQ1+P3RLYYoUe4+qxkvRs6TA/x25G0fWHonyhSG4xwnY5S63dyFtHdWNCmLFBJbWbBPlyBQDhoVZHPO4Oy7BojFaN5eW75uTvZBXFHDB5ObqOVN2Tf9VvNRvY0W8cKR2zSAqY4CqoM7xsC8BwsRjTBVMsvD424Sd6CjQLZB9m774FRNlthSNVz9JP7vHQsWp8GyyF0fLIMOOsfqGXiDiIkC/qRMWyiLxpLEPlTAHcDcEYoMNy1XjGp8yFP8Co2z+xKvj75WNs+ENC3MUxKwNzfVEeQcFShOMZkmgz0CEU/VPoJweiXL1Wc4HgZrAB/D75w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zVI1Wmn+iGmRpWVShCHDVobwfTErJIFf0xyoQg4jiu0=;
 b=MyaOJPiN4FZOljGc179FN/sSmho1BA/hFxbvjlFcJ3aAjniN2MfjdFXm/sQntsufwrf8xGwzriOZa0vOBNYnjMWcochddGIKbpBCC6VW0QVw0qnDl6DDTILmYZef+rU1K71Wx5Hob5HGtbTY+1MvWpztFjKQidUxU3GKuOatCvI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS9PR01MB16404.jpnprd01.prod.outlook.com
 (2603:1096:604:2be::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:23:01 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:23:01 +0000
Message-ID: <87bjl95sez.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 075/292] ASoC: codecs: lpass-tx-macro: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:23:01 +0000
X-ClientProxiedBy: TYCP301CA0029.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS9PR01MB16404:EE_
X-MS-Office365-Filtering-Correlation-Id: 380c068a-b8e1-41e4-1d49-08de20b87928
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?s88bqFcTXDAs3T8WkYjp6bwB2UVfC8qDT3p7wYlOCpZf/WPDMc4RnKPzLepn?=
 =?us-ascii?Q?hFJyVMMjcfkYIPI7so5o3qwjyAQ8W2kotpWRYh/NWnY/h45ekO/d4qeuJbVL?=
 =?us-ascii?Q?cTxe6qS/DBUnxQTMZYg+CfW4utK6eRD7SGebMCAsXFZY7g8fk1XlqIf4XhGG?=
 =?us-ascii?Q?PA+9EObHzrWQjmUKg/mNxqUbbNizm3UhvY2r1NtMvfaJLyIw71aOl4ELHjPv?=
 =?us-ascii?Q?1/pT8JlcKQGATMVCXANGpe0QCDoxwZA1hKIOYp2qSQDBy3j8MiC3RzyKv8UM?=
 =?us-ascii?Q?B+Ki33jyivG25fG6ypa4TgqZDyZwwGMy74KFDCwXZl8YXh+hLlm7oRYm2Dep?=
 =?us-ascii?Q?gLFNRRFYiCXydDITaK9zG5u6uxEqgHPYEAnFdJRd16nmpIfoElNOaNb8o6HK?=
 =?us-ascii?Q?9VdBnSf5DXmor7j7JMxI5iVKRtWpDEKcDzlRxj0KMuX/eu+N60Cps6FfvtuL?=
 =?us-ascii?Q?i9NodsjJXXwjv/GIUGRpX7rHCTDAHBnJK7bLwKwElLs4/Jrfl2XtVndHzOQi?=
 =?us-ascii?Q?XtUPFB5Pfc/+9FrQtMT7aUv1RtU5FfaQQqcNhixHjJQm3YruyXnK7b8s1xcp?=
 =?us-ascii?Q?M+eqZ+sSjnlhn8g840KiV5HbiG/KRjcDMWI6tt2tWJzwei6meX+tKSHGV7Zy?=
 =?us-ascii?Q?Gf1/B5wlcp2QZlD0PAwVglMhde6Wn3ASOvIF0N4R5EorxhS4wIEHhx7xRyBA?=
 =?us-ascii?Q?4UZjHJdgZ5v6HiDS4zGF8ZwGF5woNrgTTz7mfJPW/XITcmrG/SS6xrRIj9L3?=
 =?us-ascii?Q?5cwo3fZIqVZo/t+iA97BVWiUty/3a1BtJsjhm32qXZowA76kfmvRC9Dr4SNe?=
 =?us-ascii?Q?dTFq7zuZnFAutVIiUdirZP6p1nWQi6CS9ZUGJJlK13Jx+WCNjooxn+gMOzjm?=
 =?us-ascii?Q?/wb6ryiaI7wqnCPzwdAsZX81s9ziUBnpwVC9PLcU7vtVjIpROzviSVhn8JK8?=
 =?us-ascii?Q?1uhl3t0JhY/rsKdPibtdvTIXCe01rG+H4tZ5YKnfs41pAQoESY8rVz3kxosM?=
 =?us-ascii?Q?28lX5/gqDMSPzPAmKW8c4ozlwhHamjC1rHvWKPBHzLKOdP8EAx6YoDV5jvFN?=
 =?us-ascii?Q?sIe5i4S6u4XS9n8AsVRl247pBLIijQi3zSgn/LQgvFKbPaZdt8qWMSWTu6xH?=
 =?us-ascii?Q?m8LyZlhrsDytmyalh1O8DwHDTwuJPxZkZqA3eDceEFQN2uP3++f9FbKA2sIY?=
 =?us-ascii?Q?GwhupQ7PKSsQyLs+/hscxOjNOZHkwmXlzFYupWr5AZlC5XYbZOQ9M4gV/sTE?=
 =?us-ascii?Q?nIeLPx3Wg4nDqIfHw0ysTy4AmJrwhrwc/l9gkLdvIfYWDdueUhHdyrn8vCb6?=
 =?us-ascii?Q?C/mxVOpt3Pm0FnbzV3rfM8s/Qy0ZwgEwteTEV2uMJbywQCbJqDNpRtMCG9IC?=
 =?us-ascii?Q?6QmAHWpcIGYtVNF8tvvmq4lX30raJAvi+xffbDNCRdKLuQRDNSTX8bQRXG6g?=
 =?us-ascii?Q?n1KtyxY3Oya/mMkdq1qivU9o8CkwBiU0AWzR2gQPWGx3V6kLNKdL3VGYWgsB?=
 =?us-ascii?Q?zP4QpetnzmgvYWwLShvi9lmphlpYDTvAv57b?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OnKrHXpPqsf8YsDsGRvMcHLvzmtVK7VHSpP6YwpC9n9gHlsd6B2jcaOEOnGa?=
 =?us-ascii?Q?LHeMF1u2Z9kHRxTs907B81MtEz2hOwPyTxGOVbwbkXkHRXq0uwTelN2F27ov?=
 =?us-ascii?Q?xbTjc2DnUtzBeXNBo/jFoyWDRAMyijZFzWns0J31A79AjAXxxcHUxRnRFoal?=
 =?us-ascii?Q?MPqFq9gfOUsyykpiIchBB/0aQ7GeakwXSuG7Ng137uAst8AyNOEEN5GC0Tng?=
 =?us-ascii?Q?Jrrqjgdx6Y69ILugA4NPXbBFeY50vTaKz5hObCpb8NgAnZzeUG5TIgKvozQi?=
 =?us-ascii?Q?b78QGbfKbNLf2+uPNm68HrxMkZJDz3JBAFFPxd/5Zov6RGc49vzMpDL0rhg9?=
 =?us-ascii?Q?uc/sEAcnxWJ0527O6E3m2Hr0ElOyv2pyGiiMRjy+Emk21ljpiod1AaFT0H1E?=
 =?us-ascii?Q?gJnzFi+r/+gcTtzzp7eppde0qsqaAQoCoVY+9cCE1HU5wEMNt98sQ7M22ddd?=
 =?us-ascii?Q?MggyKE2kmSlREsp0KVFJvniDLF1aRylv7j3S66vvT7j/gb1Zqwra/rTL7UNJ?=
 =?us-ascii?Q?SNd/AiQz6x7v4zWvxdNq265KY7nztzVxfDta8mZ1FDenNYH5xhrrQH14yQg6?=
 =?us-ascii?Q?r6bLjsTgFOPPuqMUfYjR4MTF3Xj6h6PUAB5X9pOv1kFiu84/gsh4oU5OL1j/?=
 =?us-ascii?Q?RJmxyiDf3vCSMApDzCwb1cBtoFP4G8TzZbTMBgP+QVKnZYsDiiIAI1B8RI5Y?=
 =?us-ascii?Q?/K2/4721E6bq9jUySyStyjVTnUJx9rYQklSox1I8WOiCTqnPZt8LTJn93cE7?=
 =?us-ascii?Q?njv8kueaDNDj1FKrTTBgBkyXy0LN8AXMn+5L9Zdq150Lwyi8ve7z2h2aNgOP?=
 =?us-ascii?Q?nvdfkLEDvEx47QvnuundbQ/zQryKPLSqK5J14BkWT68DddFKH7Y93j+g5u6a?=
 =?us-ascii?Q?a/DmwUL3FO9gyMqBGjUnwAMMHRjLY6xkkN6ORPqSxOF3rfXSsy/kbLcRLkGC?=
 =?us-ascii?Q?PYFyr42jnyu/4cYfzFREdOHGMSJsKMsa7uCCoTnSrFh78MZeIX4gLdykNzFu?=
 =?us-ascii?Q?Ti1R5ERHZIrhfPvXJGDaNunfZM2PCnFWnX7MQxdph2Y8C7OMd10y7Y67OR0W?=
 =?us-ascii?Q?G2quO7HRa94cKunIPUppnf9zCf8Mecyq50ikEDN8EmG/P0CzbtrpbQkCGFzB?=
 =?us-ascii?Q?Vhzq2HvfW7cMS0Z1uTUmxQLrlk2qp/IqvI7t/TVaPpEWY0E1mHB9yvWBzo5D?=
 =?us-ascii?Q?CoVZ+ZOCMRK72A/XXXA3sA6iodYVIh2WzTIFvJfZQyyYnrWs/vSx5de7MBsx?=
 =?us-ascii?Q?ZhpQCW4yS3BuP1biDNfiShoeZz8xu2eM+UhBzn+qH+IKvDDvurEZpjJXWQBI?=
 =?us-ascii?Q?qHfIBURXhyZY93MrPW4s3EYAqgRUjUrzLYeX4jytaLjMPZp+vvQrBVzV6j7f?=
 =?us-ascii?Q?gho0SPXHNcOdP7BLL+MqiT81aJUkh41T2eXVrE/mmI3MndohY77mo9zO8VUZ?=
 =?us-ascii?Q?Cijlv4xwD/v09xx3IkMpZBjYHYsxkEzeXmP9kEagTPfPXxFUXaiR4cZlIkzN?=
 =?us-ascii?Q?WJOYjGZiB6i9uu+PdKrvETZ7lBazK8FzAHc0LQ/vu5EmI745oWJ75koCvkDr?=
 =?us-ascii?Q?ULgx2PXoIhTTFIk+Mch075XbLWxcuwWUI/vz6l1EEhFvtpVSEFLS3F+gpcHC?=
 =?us-ascii?Q?NwY2VYj302/12KxSlZl31KU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 380c068a-b8e1-41e4-1d49-08de20b87928
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:23:01.3071
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C6KKla1CczrzgXb5UaGeFDNdZVjCYwa2f9dVeiolx97U3/BnKrNfpuDAd2gahc9hpsqT2ZasFCWKDW2kFigRUdgn6ICF6BR6eylUecDVpgSg7jpxoEOXigB6ONmIDpTc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB16404

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
 sound/soc/codecs/lpass-tx-macro.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index 1aefd3bde8183..a468789181ec5 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -800,7 +800,7 @@ static void tx_macro_update_smic_sel_v9_2(struct snd_soc_component *component,
 static int tx_macro_put_dec_enum(struct snd_kcontrol *kcontrol,
 				 struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_dapm_widget *widget = snd_soc_dapm_kcontrol_widget(kcontrol);
+	struct snd_soc_dapm_widget *widget = snd_soc_dapm_kcontrol_to_widget(kcontrol);
 	struct snd_soc_component *component = snd_soc_dapm_to_component(widget->dapm);
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	struct tx_macro *tx = snd_soc_component_get_drvdata(component);
@@ -859,7 +859,7 @@ static int tx_macro_put_dec_enum(struct snd_kcontrol *kcontrol,
 static int tx_macro_tx_mixer_get(struct snd_kcontrol *kcontrol,
 				 struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_dapm_widget *widget = snd_soc_dapm_kcontrol_widget(kcontrol);
+	struct snd_soc_dapm_widget *widget = snd_soc_dapm_kcontrol_to_widget(kcontrol);
 	struct snd_soc_component *component = snd_soc_dapm_to_component(widget->dapm);
 	struct soc_mixer_control *mc = (struct soc_mixer_control *)kcontrol->private_value;
 	u32 dai_id = widget->shift;
@@ -877,7 +877,7 @@ static int tx_macro_tx_mixer_get(struct snd_kcontrol *kcontrol,
 static int tx_macro_tx_mixer_put(struct snd_kcontrol *kcontrol,
 				 struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_dapm_widget *widget = snd_soc_dapm_kcontrol_widget(kcontrol);
+	struct snd_soc_dapm_widget *widget = snd_soc_dapm_kcontrol_to_widget(kcontrol);
 	struct snd_soc_component *component = snd_soc_dapm_to_component(widget->dapm);
 	struct snd_soc_dapm_update *update = NULL;
 	struct soc_mixer_control *mc = (struct soc_mixer_control *)kcontrol->private_value;
@@ -2081,7 +2081,7 @@ static const struct snd_kcontrol_new tx_macro_snd_controls[] = {
 
 static int tx_macro_component_extend(struct snd_soc_component *comp)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(comp);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(comp);
 	struct tx_macro *tx = snd_soc_component_get_drvdata(comp);
 	int ret;
 
-- 
2.43.0

