Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011013.outbound.protection.outlook.com [40.107.74.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DF6233140
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821323; cv=fail; b=N/i/Z9/4rTDqjefgita0wFSHfu6+qYS8txT/rteqRt6sr1HzXBIaOlZbIdVE7mGeqJa60v/UsoSpcr0ToouRAQG6LGGXsIETBXzgljQCfmiBwa32uNciBA9xELlUNJsP18wg4evIduhYv5/4jVd309TBUd1HQPeazIDl1AljS0o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821323; c=relaxed/simple;
	bh=4nYFGPAg2YB+GubW/ltNPnOieaqOPM1xPXczOg5LpBg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=aUmuemHKmmRxjRYnH+3ZuXCAoMLBuXRsnxD9pfPjaUU6tepeKPxctcqSLxoZ1EovbjevE0UDUGyCK040kFZ8aWH5ltVsPYjxMca/LENEyB9CjLSe9wgmfZLSNuCyNtGo5o9tIk2WX/P9WXYPHjHN4oEOluWC4fUb5CfHGaWwVbY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Sfj1a1xJ; arc=fail smtp.client-ip=40.107.74.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Sfj1a1xJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LFDmxhLdui/AifHBKpEcUMBveajLFYF7qaDCdLnLvQI1qfSZdV3xuW8Vti5C1vcLwRZkqFax0YyFHh+XQlONMhtxRAsNipheJiVHpe1rweV5l2tgVV4yTqGkVr3aPAIMSwfUbMAqKoyN5YBNy+aWMQspRziEwV68Q5b6xN/z6Y9uIVaKrWHdYIL90rMy/vLhT7wE2iQqq9B4TnWyUE3WjxAzv91LM1/AtadDBREjJan6uqUnRpSRG7e44nk2PT4WvoX2IcPp1Nthxg7tKBlfsiNGEIaTjiFSr4j2YgQL5n75Fx4cCMv7cFg0RQbz/fABDXUHJivWwZo8sUqVmphfKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=djY3mGdujOJqvS3nJd1tr3b7PEUn7hvlCyQjmtZu1XU=;
 b=acqsRASUTi9IFm5l0LJNUUGyJk4XWABIVIbPJiqj+0FFJ0j+HOmiJBHCByUBpa58RrJnZ4ywr1PJYwX2qZRELTcu9m4QV6sxkTfY1cDggr98hTGZgXiNxh5ig+dq7PKvKeXv6HKNNEbiWbp2GcIvMRWhyXB6zksmCJIN1cSwURpbX/mfs7emJixyRUWDNhNu291+AMVdKbzLzpSijPHOpqPMCD8nYh2pD08BONzP7NDuoK0df97hCwZk68Q/eZSd5gc3ooKXF0oD8OHLF7DfRXfYDRPU8x2++njy2o6jYxaOa+jK8OcBkxfZtQkUiY/XLcD/+ODMQwxxdH1l1psthQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=djY3mGdujOJqvS3nJd1tr3b7PEUn7hvlCyQjmtZu1XU=;
 b=Sfj1a1xJeZH3BXU5mcHJx01jPyRVnsAiwWIgfDuPl98fnjPhoav+VuHhLLKYpipy7lZhrHiXJ9LcvcGdPypoc1n8IK0K+kNrywcn4q5R+CKmfq+5rw/KxK5xFje2ENTDKgmRetP58Hz7YSkbVXI8ijq9GDWmVz7bAS1BtN3D8fs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB14482.jpnprd01.prod.outlook.com
 (2603:1096:405:238::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:35:19 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:35:19 +0000
Message-ID: <87y0odtni1.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 259/292] ASoC: sdw_utils: soc_sdw_cs42l43: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:35:19 +0000
X-ClientProxiedBy: TYCP301CA0036.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB14482:EE_
X-MS-Office365-Filtering-Correlation-Id: 0457d7f2-6643-48de-0bcc-08de20ba310f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?e+90Fwd4Tr4oQuSGw4wY3YW+tQPmXsxPhhzPdrayirNGlSautVI9jTcg1axI?=
 =?us-ascii?Q?YfjkxDaip6OV6dnj2mkQNJSFkO6FLAhm/zSKkof9UnryesfejxFDgpkuCycU?=
 =?us-ascii?Q?IQqkAB480xdKUfH69dNgaT3ePI/RW/AAy5O2dd3gY+ZbP8SIsQ86j3iFsHfK?=
 =?us-ascii?Q?ql86fKwRp9WTFE7IvEgnp2DRcwRU8OtIaNACXbNbuPsOgY+CyrYNW/cwfCZi?=
 =?us-ascii?Q?JSK/RKBBPnkkAxt3jAwc7N+i3FObyqUM13JalbLXP30fyd8NT0Krt/r5E83p?=
 =?us-ascii?Q?TWXrVd0VSkTlKxZtsBIkyBFpBWxC7FICH68fdkPEG/rfXT3/jvzjwuA1gJox?=
 =?us-ascii?Q?DBdZnL4yIhXSagA6qBO37brLxYcaOeKHMzTuBVD2AERQvwRhdPduNgT1/o3W?=
 =?us-ascii?Q?rSZzwsIO6WbtN9uw0jdBh7rmqBw2VQwJZBvKhxlgOWJ4SrOwhXtdUjbB9gFc?=
 =?us-ascii?Q?S0G++5fkEu9baps+zdlc3BIHZUyFbFNLRL49/ZBnVX6/HckubOIvUmHMkIwi?=
 =?us-ascii?Q?2ZJOqG0Wx7d7ZgXF+yJDcnl89ZOIORVXa7U01/mUaG6ePULQr69zCAp0noL1?=
 =?us-ascii?Q?+Db1LSzKv0uAVJ76uVMARQsPzRfttihfmVDSXohoLZuM6pXpAsXxs4XetBEz?=
 =?us-ascii?Q?2juFRY/ndHQddsuI3P7eAn5dyHvCOhKkQ1yVK/z3vmzE/LkbCggz0UdNsIBb?=
 =?us-ascii?Q?JRv2Wum4zSJIlceG8li83nmA11GNL/lkoxOi45UpVn/AZiuG46MJpBscOVQ8?=
 =?us-ascii?Q?Q90rPLUxa7F+1oX9yUZs0zTNWh4zKEfUsEzwQCxQo8XVqKWctS9uY6BHymPp?=
 =?us-ascii?Q?SaPs8KdQsgiJ0s2lb5A8V2rX0bz/YULWFxv1hiOdPKKpOPwk5jo36OYsUQbM?=
 =?us-ascii?Q?tH9+g9DQYriMHO2cdkkSuoZiXH+bbhvYtMoHrgg8/PYYeEtpHMWnXialasCp?=
 =?us-ascii?Q?vtl8dAXRP8uT3urnUSBj3DOgZu5+bHpCE/0JjdTLjALYhnSlwi44/+pEfo82?=
 =?us-ascii?Q?AXVv73Z2tVvFj6uHmIrM7lkFTBMvbPId3jH5l6QXZ7TrE7rZPvwAfsgkKr52?=
 =?us-ascii?Q?7P0wQQD9tkOAXlzcPGOx7Wxw4Fpfbv+w7fQI+J6n+ATXt8sIhEkyJdkCDqdm?=
 =?us-ascii?Q?I1lb0AsLlOhSuvf5VXCuBs+FK7/9oM7BzqJmtf22e/EDwLxGvNxg4nmh5TJy?=
 =?us-ascii?Q?5WgonxnQOQV3gfnHb17V+wiO01j1e5kYKgf8mDZECJ3pzZP1qe+xFuvoa0y/?=
 =?us-ascii?Q?ACMfF/WtKk3PPHshfYhDYE1gSfj4iNjSEQy+pW5FsA8bp+n+/dF6j/zrDUn4?=
 =?us-ascii?Q?DmNljJB/9C2PyHq9mwsMNieqIuSvzy3abZNV0epbbWAcvkZtvqOrSXSMsD+a?=
 =?us-ascii?Q?OQiQd4jtYVZ1tXjWX2Ib+mTDQbEO1YfWCiAnKf0mmajGInyfls+HUxHhUpJl?=
 =?us-ascii?Q?4q3UiL5DXqtxQRl2g40PcVHu3DiYkbl+3+dwPmRkFWUiWbfoobUzNybrwXX8?=
 =?us-ascii?Q?5mjzoHOWW9RZbL3XHYBdQNoKoZvKFWQtiU/3?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+/aZ+m+jc+LLDCpqLmFKonRA+ehXWxwkfPgIxktd7v/Nh3JvPbdNqvhH1XMh?=
 =?us-ascii?Q?ZUUOOO1uMpUWy8rMIRF+uSjpjbFi8hQ23dLPDlNNqLIaFQxN4yoqYXiGw9pj?=
 =?us-ascii?Q?o4wJx9vnSLwYv6yNN5zgSgFpzG0vM6rH7qJEwrGE65MkteKGjBqK9ls7jfau?=
 =?us-ascii?Q?xhzYYZ63lvajiALxfepBEuBZFLY3xJWnRIEUh1WvfB8MONKwuj0Vr+DlTJNY?=
 =?us-ascii?Q?kYDP064PG2FoceKH3Zli/Ff6ayyEk1nkJFeRElJjgr5Zr7CDAD9dzwjCU+jC?=
 =?us-ascii?Q?zlDJoYHQWLZjzFpCrEUoP2g+ZJIAdL2rbitadRrYXC+DT8WIOhwNBHbjy9DO?=
 =?us-ascii?Q?2wXu2vJ1q1IXMilK4z+XS8t15tnaPh9+ltRd5PZjBFKqMefzjbehNjw5TPzj?=
 =?us-ascii?Q?CuUqIBi2myVkzh95wzDdHVnWVpGnaaKQ/RCbLPTvo6m/ThP9lpkKlbS+cLtU?=
 =?us-ascii?Q?JvvT2ev/qTLqEqaYVCpK/aKvK1zR2MDmngdSRTTxZt+8BVypwgI2meNzIKcQ?=
 =?us-ascii?Q?nUMFYqAVLWqfi/6SXyGSfVwbps34JYvAbyJQAY53ek9RYwM407Zoka9XKlpo?=
 =?us-ascii?Q?GSxQbB3byuqhaAshLNSTsB/sowKoHKvsDCN9erAAwJ1OdTcZ4mxDpzQJ7zrw?=
 =?us-ascii?Q?ZZOh1ebyflABkZKsSs0USvqhqYEZuJqBwU2x76lgSYRGlB/kx/XwaQhWwnRk?=
 =?us-ascii?Q?W6h5n9sskIUi+Q31DEJRcWgbXez4TSaR/wmGvfR4L15MsVuiL5r0v5rzEkCm?=
 =?us-ascii?Q?7RKK5/ewG0zx4KZ+Dm8ZQFrtzyANnbQR7PT3OLmG9VeqYLE/I01uGRbVGnp9?=
 =?us-ascii?Q?Mvq8et/6AP5SoaWv/bi/COgv0OpFtsVIihEZSqS5JaL1AHkSn4uzIHVECf18?=
 =?us-ascii?Q?yqr7x2vP4WqzT3n8gvuS3rkVAFj8nQxCKswtMnVbTvYP7UtzgrjnPI/G0UyD?=
 =?us-ascii?Q?jAYBKiGstiKj/AaOxrboUoKY+pQOi3/NIqWZkJx64TB6bzOLPF9iIndbRvBM?=
 =?us-ascii?Q?Jg2Ql+2n2YekHV557xYbQshin5agckaq+kpa6+qVnTM0gtfG9bgnOuW3LS+Y?=
 =?us-ascii?Q?2LkYxbqwwRvgABwNka3WGlydOsEn1cwtvOPTjdE9cIYTJFJcrXxzbER9mSeW?=
 =?us-ascii?Q?fbcYKBV1rkl4XldAsm9zUgGUlmD8mNQ232cTxRLibhpr/2v5JJYGIGQWy6Pj?=
 =?us-ascii?Q?/t/Ykca89ilHjDTbXUKI1DsePZqXdr2B5eAYtmb+iEhzzjON35CfL2H2z4rI?=
 =?us-ascii?Q?m06RQxerVAJ7PTPc/XmSMQX8BxFcDwOgvNEG2OKJvdGWiHfay3tXYQp+XhM4?=
 =?us-ascii?Q?PlFvJBRiIbJNreA0lmsJEipBVLhbu5ebhCtzX1dL9PRq9QEYeePZFLd/Sm5+?=
 =?us-ascii?Q?49E4OjhvLpm9SZFETACTnqC6v8htjVqaC/bzv/PCwiE+N0PVDp4wZUZrc9oc?=
 =?us-ascii?Q?7CjNV5CWD9ithH+l7UlkRf01Ebz0WJpyhfQQQDwUEhVD8oxCvROJMuFAUgUA?=
 =?us-ascii?Q?BoTiHR8/2Yve3a2t6EBLsgsPl4K2uIV4L7PK3BAq3CJshvih2cu646K3cpqg?=
 =?us-ascii?Q?IT+ox/AUNUg/BYX+Ro2EeP9pEbfobLHTDHXtvOq/ltLrh57TrYXPd+pjrh19?=
 =?us-ascii?Q?/3ojutH7UssQpjgXCgD22/Q=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0457d7f2-6643-48de-0bcc-08de20ba310f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:35:19.3426
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lBWLm+j2lJYw0b8vLkW81MpisUHB0FcDQ8xai0y9MJLrst7fK5wWtdJwjV1LCUqeooGpUGgLBu8K38/9Juh/IBTqeByWLVBBAGpE28rZj59/AZHyIQWXw/l5lJePrH4U
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14482

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
 sound/soc/sdw_utils/soc_sdw_cs42l43.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sdw_utils/soc_sdw_cs42l43.c b/sound/soc/sdw_utils/soc_sdw_cs42l43.c
index b415d45d520d0..4c954501e5002 100644
--- a/sound/soc/sdw_utils/soc_sdw_cs42l43.c
+++ b/sound/soc/sdw_utils/soc_sdw_cs42l43.c
@@ -58,6 +58,7 @@ int asoc_sdw_cs42l43_hs_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc
 	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(rtd->card);
 	struct snd_soc_jack *jack = &ctx->sdw_headset;
 	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	int ret;
 
 	card->components = devm_kasprintf(card->dev, GFP_KERNEL, "%s hs:cs42l43",
@@ -65,7 +66,7 @@ int asoc_sdw_cs42l43_hs_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc
 	if (!card->components)
 		return -ENOMEM;
 
-	ret = snd_soc_dapm_add_routes(&card->dapm, cs42l43_hs_map,
+	ret = snd_soc_dapm_add_routes(dapm, cs42l43_hs_map,
 				      ARRAY_SIZE(cs42l43_hs_map));
 	if (ret) {
 		dev_err(card->dev, "cs42l43 hs map addition failed: %d\n", ret);
@@ -107,6 +108,7 @@ EXPORT_SYMBOL_NS(asoc_sdw_cs42l43_hs_rtd_init, "SND_SOC_SDW_UTILS");
 int asoc_sdw_cs42l43_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
 	int ret;
 
@@ -127,7 +129,7 @@ int asoc_sdw_cs42l43_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_so
 		dev_info(card->dev, "Setting CS42L43 Speaker volume limit to %d\n",
 			 CS42L43_SPK_VOLUME_0DB);
 
-	ret = snd_soc_dapm_add_routes(&card->dapm, cs42l43_spk_map,
+	ret = snd_soc_dapm_add_routes(dapm, cs42l43_spk_map,
 				      ARRAY_SIZE(cs42l43_spk_map));
 	if (ret)
 		dev_err(card->dev, "cs42l43 speaker map addition failed: %d\n", ret);
@@ -154,6 +156,7 @@ EXPORT_SYMBOL_NS(asoc_sdw_cs42l43_spk_init, "SND_SOC_SDW_UTILS");
 int asoc_sdw_cs42l43_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	int ret;
 
 	card->components = devm_kasprintf(card->dev, GFP_KERNEL, "%s mic:cs42l43-dmic",
@@ -161,7 +164,7 @@ int asoc_sdw_cs42l43_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_s
 	if (!card->components)
 		return -ENOMEM;
 
-	ret = snd_soc_dapm_add_routes(&card->dapm, cs42l43_dmic_map,
+	ret = snd_soc_dapm_add_routes(dapm, cs42l43_dmic_map,
 				      ARRAY_SIZE(cs42l43_dmic_map));
 	if (ret)
 		dev_err(card->dev, "cs42l43 dmic map addition failed: %d\n", ret);
-- 
2.43.0

