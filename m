Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011005.outbound.protection.outlook.com [40.107.74.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD921A3154
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820724; cv=fail; b=iDbgky9ZLcvbvKPBhG2a7bpKWgIP0lEbrVpLE9zYTX+3PNvg2kHs4CMj09ReEhLenWpZxJNObkhXxwkR56uND31lVVRCSworN660tFddY9fgrGJRJj8vr+PCId16HTrNRdKBLUPkg2C5TaSXsHS/0wgPLDP0LO+zMRt4jFwcCLc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820724; c=relaxed/simple;
	bh=HWqQDCk1ndX6iKtr7aUMNU865N4NLEOpzZ3wLEJGRkA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=dIwE7eL2lWcV2gqOVWIIK0Kb3wTYEWRe9McQcMEkK1NeFa0ACJJnah+hP4E6ln5FB6R2tfg5/FrSLQDzjQnPCLGxIyCOd6ObMS0fvLxqlQUgAeOXOhQlezMNFaJm6HzkMTdvL/ve68CDfGRhab8HBexxGGSzemvgnQ39sT6PVaA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Q6/KcKa/; arc=fail smtp.client-ip=40.107.74.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Q6/KcKa/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X0sKmeq4mSwpgq2WHYOBdOEVGYPl4L1iB5p0bANyxry14GzsgWEgHNBlSUbJWlW4vH8bkzZdHAmDC+eeGxQfs6TM/h2np9TKMU3bS6BWDQW2fJtwx5mKBkkYbBjyW7by7BI39gRkvruq45oVuY8ZglI60gLqP3t3u7ZwVEHeDYgdHRiMIOcQW8D7g/EvOFfKluA3yd3t1SyyaoSl8ESYddRln23EqBpgn91PHkj6g6v4u9f/XzsnaB8XeaqT5I/tLuq6V6sgBilsaMWvcYDft1F/keuBoM3oVeTOhQWvStJ08oJX0KEbUK9pfGZI6S/NGQLDyjXl/EBEf8Ju5/muKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=haWt3U+jGIyjPOiTnjnLRmdjHocbw6qlZhMnMokCiT8=;
 b=tA++nTn7SbAkl2RpyJuAbYfNTl0StVS7ioDC+N1fIuAHDv/6tycw5ZpdCL5NVFVWxw28z8AsEz4cSTvYjV4d23tjzqCsSCA+aGFHmEF1b+PETvxt+EaP2BCIuQWaTLvSqjDXxwQSZpPWfuFXtnMK9Pn6B6BPU6jLXW6s2YzTJ/Q8vjVyeeUadZHKtmjRAsoKtT81TgKkJCyIFVv32VHT8XKyzwz5Yhi4GxfchAcEadvYvlES3JEJ+9svF2jbSfI7H0cCKaYkHDqcl6TBR1K9/9wyxQFNc2I6LLnCM95yUcsBa979AcHbl5WWZoiqoNx4hOkCq8chzguYrJrmhr367w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=haWt3U+jGIyjPOiTnjnLRmdjHocbw6qlZhMnMokCiT8=;
 b=Q6/KcKa/0Ib1D8XOvTMjMo6EuX8/5WugHPyY9kdjjX8jG7IeZ8Uxm39Vf9AWtUzcaOnGTExCDMrqdFmOlJpHtdSpBqaQIp0+7ircZaAHsIcy9PmqpaL7/Ef0MmgDmpw8FDG/6VytdH3ZKr77tgGdU9vZK1vB6VQcexi861IezAs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB14439.jpnprd01.prod.outlook.com
 (2603:1096:604:3a6::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:25:21 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:25:21 +0000
Message-ID: <87seel2z67.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 113/292] ASoC: codecs: rt5665: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:25:21 +0000
X-ClientProxiedBy: TY4P286CA0074.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36d::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB14439:EE_
X-MS-Office365-Filtering-Correlation-Id: 35ebfb0f-6aa3-4d50-ab3a-08de20b8cc90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Z4HakEhPo7EvOVOS2Xk7525Hn5wSW8572wJZRu3WEQPyoSb1NBgQRO9FpR2a?=
 =?us-ascii?Q?fEgbGyRIGLH5pB+hQD6YGsgUJTDbDlT692khfdNlYEigWOJk1aleaj/eLhgj?=
 =?us-ascii?Q?yAkEDODwufJVX9fCVMocvi6TxtjAdjUeipkkpclh7BD8efOKdK2oai0LDwaB?=
 =?us-ascii?Q?Feq1n1MJFy2/dQGWobTfUqL0GcuR3Cjw92Zd21L8UPwKuNLa6ut9BvN2f5OQ?=
 =?us-ascii?Q?+ccjOtucCPK3RKaEpE1IGH4yn6QNJd1VygBk5FXP0U5QJJrVWHv8COqJWJte?=
 =?us-ascii?Q?1zvhQs51WJh8VM8u83+rwbLRymQQlOdYEPxy+BixV/wQd8cVSmAkrFiOW8IP?=
 =?us-ascii?Q?FM3dYhoa0NPd9O4aXgR+6f++W3n5tPTJ6CKL1EnMwInbzCyxMIM+Os7roOFu?=
 =?us-ascii?Q?SwtDL174sV1mEplGyV8mfE3E7IkOKPFknVRDqYNq+0PgmTxk7qaMepL5/0Pa?=
 =?us-ascii?Q?+xrUqX3z6y1deAqcOTplvgUY2+lChUwjh6/DO46K5TdKrWqnY01xSSFDLQic?=
 =?us-ascii?Q?zJ1bO6LSXkOXodjfPow+VO13gc9lFDpmGZsrf2u/od4gK5EYMydoO/IiV2t0?=
 =?us-ascii?Q?0pzqA4pH/1e8vmSrSfd6G9X7/1F4FTpeMLFESKq5BHt6nHHMtHeB5H+XMvel?=
 =?us-ascii?Q?Dr/8vLZy9Wrq7Y5lsr/x8xyFG7/u7ArCUk8Q8q5mXIIvDhA0PqqEXaBk3bhp?=
 =?us-ascii?Q?TgtbXrS71tk2vnrFROL/r1eiW+EKCSYvkiMZrnwFxNqG8EqVM0tXGiZLfAyo?=
 =?us-ascii?Q?EdyH7TNd0FjsWLDRNXuD7sAPKYi2xbv9qnQkWtbNHLi44xJBZlN9HOLb2PBy?=
 =?us-ascii?Q?7m95qVv3pZV/dNdeerxznyTKMghYjwRAasK/dY13ea7Vl6Lqy8UHriXYU77+?=
 =?us-ascii?Q?8kWwdMq97brvO9SlAOcERSk6MFXge2km3Ltb3UrvAk7v4pSAOq+/PiU66KWK?=
 =?us-ascii?Q?ZDbw5H/VfIe3dxJE8uWG4kcUyV7NCsPwT1ct7ssOFnXoLV9TvRmaef/a/meC?=
 =?us-ascii?Q?tqwZjbTSWxzin2va2H85GmmohIaUGecsI2EG2irRqpavnfxxJvuAG3pyzSkF?=
 =?us-ascii?Q?WJe2EWX5F7INY+NAlGXRAvJ4K2XIykEvpkoSjrIaFpYuKRvjScj89aFWsdP9?=
 =?us-ascii?Q?4GCq0vnX4nNGMl2jYg1HNgBTNF6svxKvjbt2GoIcRcZHsjP875L6zTjwR5BB?=
 =?us-ascii?Q?/ypO9CggtFyMzYQauZJcz4F4664pphxvsAflGZEcgZQREqafXGhWXHhsMv5f?=
 =?us-ascii?Q?luWBD9SETCALu8n3VldMtx3NVq6uVFA2iiREjb336YFy9YDHAS+G/HmtlM4L?=
 =?us-ascii?Q?BvZL1ojj4QFuTPnGXCQVp3WCy3juxCDDdL1Y1gfS2sMIVteedeQff/MagAny?=
 =?us-ascii?Q?bteCURKsY3IctDgMSjjZEUbJrADHQXrFsoEkfxJ1CtZDy8CBoE9s+VT66Rg0?=
 =?us-ascii?Q?5tSx5x00Zg08FIoRC6YvSVv79gwOEtnvrkYI9nm2K/3E7Ip4Rs3yep6j4RGC?=
 =?us-ascii?Q?/iXcRCuEiM7WhSkubyrCVeyBMjG9MxuS+5Vp?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pbUhQttDbqFh/M/hUw1YhUGrN/FrmBufeqEQmEFGO1NkbAB7JI2kJntMZb+4?=
 =?us-ascii?Q?re/xrbcAvCs2k5dexKPKz/ST1SFReyTNko/mnPAjGkHy43d2bJ2LzjJXO2zZ?=
 =?us-ascii?Q?aUxH23Ha1y7kdpWry5hfI4ELD6yI6mzIXrW/86GK7tMsN8ZW7BiTwcXj4b5C?=
 =?us-ascii?Q?waF15CNnbhXSAZnTKSYUzpSyjRTqEAxv+TsNYD8bWjp90lQDikD5TF5i7UP8?=
 =?us-ascii?Q?PN7qML05GWKIfir8o10KKh5dHsI5nd0hCR84wAI5/zfapJMj/4ubVtI6TIy8?=
 =?us-ascii?Q?nfzBxbCC9jppt6zilpHijJ2L2Pa2PL/eRm+iqwRPsoVJFSWMT4LeAVh5cFaE?=
 =?us-ascii?Q?5aEQdIa4+zZUWys1hMLZiBJ7BR2f18/RBuIeas53sXsIJ1PHhvWoJ+tA7Djg?=
 =?us-ascii?Q?Zm0V2WYOx08fqOsBZqX80wyRGIRGW6h5ETRUDzXeLeId5FfCyzVZAdJEZyZ7?=
 =?us-ascii?Q?CxrigXh7l5gjeqQMNUDhbwpN/k584/PnGx4uZC3qEeW2ZYveSORSvLR5EJcA?=
 =?us-ascii?Q?y3KbQp7XjxgVuluufkMqDg8HiB1bx9rBOtSo714hi9TBrF9j789gKGWEE8LW?=
 =?us-ascii?Q?5NknopVre0etL2qq3AWrgoL0NW9+EGbpEf6fspVodGwqaDBG/uyWyZszQbeG?=
 =?us-ascii?Q?3Fn75DyjlQndekIMclrLDBrBtFz8oKAgOo72osJj6Gc81CnkyGdjgVJ2CuaK?=
 =?us-ascii?Q?89EQdJZ4XspQmyXx7c4LlfxxHc38SkcwQ/E2kDqyKEo9fBlw8MGA+oSjzGWF?=
 =?us-ascii?Q?/gqyh0X/cqopb0MPmqVbGhIBMj9Awqiw1u6OkeT7ozKZlfifuvCjM1omN5fH?=
 =?us-ascii?Q?nIuJiy6ykA7r03GoXdyO5ykcHSR9woi7rgpyRePPTLOaJBOr/6QzQu8i/EgO?=
 =?us-ascii?Q?Ai04uODUCRy6BCBL7ZkUTkT/lT23bNMS18R/Ws1zVXXqcA2BO/CfJpxf57PS?=
 =?us-ascii?Q?lA/3aFe01tXTxsmify5W0QtY0DcuA39onVbS7BNUUjAaYeEnmhXU4wjV9QVC?=
 =?us-ascii?Q?lueSguhmJdJr+KHfH70wPEEu+dx+ENndJIdFODivmxc04tg08gsAnIt7CJ7T?=
 =?us-ascii?Q?+nIlkB1QI9wSLUg6cprHnafMmIriS7y+6VENQhulh779jdZmhesfxZ2n0x63?=
 =?us-ascii?Q?JdAcekKOeIujuBsMvaaBK16PSDJP9p3+ADYTGUC9tEbyDBlxCyIleyzJ9D77?=
 =?us-ascii?Q?MOTm0n4bER6O07Gpq0E0UtjxCh2JvfV+q5UlXb5BGJ5JgFG4VLGzsA+4KAUQ?=
 =?us-ascii?Q?FiKWl9mKjZ1FyUIEE3yFb6ScQ2ei4RKY/tpt/OWl5lllqGbR70p5hRqZd1Cj?=
 =?us-ascii?Q?CnoUEFiVJ0x/FTw0XDXqWHW0x4z7A84C2bl3qj0qW8y7p2xf2zZ3TMMivUx8?=
 =?us-ascii?Q?eDZn0vDdUt6B1lgSOPLzZMla2a0Xn36FfOClakdUnmCcKNLGGS6DxwKqRjJQ?=
 =?us-ascii?Q?ydAABpA1V2OfVJcsAYfmYvQYlmsYkn+qzHYiHyEBs6Mc6O/X6buT210NRFWZ?=
 =?us-ascii?Q?rKeSFafHxkKnXdPnAO9jmnlKIjgQ3NDEJ7rifpCPh594nxhd2B8aL/wAWYLG?=
 =?us-ascii?Q?C+IBojR5MMlA1FM1OqSwDai8xiLSI6DiZkoB3TbbXcTIatf1w/XlhFCkhDay?=
 =?us-ascii?Q?Y+nngeT9x3m4eJsGB1vxAW8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35ebfb0f-6aa3-4d50-ab3a-08de20b8cc90
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:25:21.2597
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QSC/A7HThSfXOfj1xyE4CI3biW+t5Jyi788Y4FjASakIOp7Wy4bRE8eisZBIjw5FmFeT8gzoLBG00UHyItK2l6eNLXKVCpdM+5k6uqx7QhSeQ0VubiWq1kNiEZ68rR8d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14439

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
 sound/soc/codecs/rt5665.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt5665.c b/sound/soc/codecs/rt5665.c
index ca0f0fb4bebaf..c7beccd54b162 100644
--- a/sound/soc/codecs/rt5665.c
+++ b/sound/soc/codecs/rt5665.c
@@ -1067,7 +1067,7 @@ static void rt5665_enable_push_button_irq(struct snd_soc_component *component,
 static int rt5665_headset_detect(struct snd_soc_component *component, int jack_insert)
 {
 	struct rt5665_priv *rt5665 = snd_soc_component_get_drvdata(component);
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	unsigned int sar_hs_type, val;
 
 	if (jack_insert) {
-- 
2.43.0

