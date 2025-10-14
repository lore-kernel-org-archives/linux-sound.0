Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010021.outbound.protection.outlook.com [52.101.229.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20FB3081CE
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415657; cv=fail; b=bGsEbhS9Z3UWjpWqjlZ5SM476Amw5UhhD4RzV/0okKtHxk4eKgB3MHs0K5nCRmYvN6eUXDEQxeY68u1JipwezN+AIffOSaY8p0tM87sedSYsBk0sul7KWZRdcykoHfJqfizrzGVD9I5dQ3JSBDFLS5dy4D2FTTbduntymq2Mp94=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415657; c=relaxed/simple;
	bh=KfUZC7wSbh2JY+k3huUBQO+W4vWXHcWQc/FjKM7RrKI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=mlTwwdlOVKVUoqiu4WDGIwAypFNvbT3+bzsEUb7Hxfr7U88L786aYJUxvk0zYjjraEAgrW7My534vFF+vYJT/+ody96BCwcT+ynEWSG8r2t14667ksau7AEkaqKpOQ7PInMdQE1Xx6uIwXUPDGJuHsrcnGzJTTzrQYe1xKPrDuQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=NT/0gwHM; arc=fail smtp.client-ip=52.101.229.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="NT/0gwHM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MYx97OfPOIpDzDqZ1p55kVyHjbM79IHzhv6SiL+D372YPTNRzZndGkx12nq7PIVLFfhF6uft/T5CyRWXxnQx2b6gafWZjQLuU9TfgA7cYCDnJXb/9gDuEoekzRJz8CIJMRY0GGXdO7jXnc5UVI1KyiRzlGHvF9P/IADUPNgD3f4G/34HCYU4q6GadEECUqwB1XV9VNRFq1TpVyq/tmXXPjfMPch/Gv779SziDok6bK85H8H7QhnDGoBEWB1N9+FblojIww28CFBa6MdXNa+V4FiXsv6fKO2FvEnHeq+5VtkYPFOqQieljYvytjF0Bhf7HScfMH2B9QAtkCPyMSXfkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wYHIij3Ncbc1mBnoL9EU0sh0Fn7xnBKJbDZkKc0JelA=;
 b=HmkfVcZFIpwjJ3BQWAZ9zM8+9HfoT5QFjJ0Xf1NQC/KpRLO/2wP/IUvWYFZTd1He/qDxCvcLArmfORuRXOeDA8XHi30Xio316Fn8XDp+Om++VeEk0OVgZWggHxDA4ELr/rAG1QqOb4zoRqpvDpB6pwXBjop7SoQvJTdIwinu24SMqIKauzkYb7gAzjrSUcD9lXiTHkuqrfcBzuqXjmlVonGYi5fJSJipn3bd5H9IkxBqac1hOpwcO6RfjD7C58XtvVsjoi/vXQJrKT7/vepqA3iGRBDEU+7KjpJsFqnC/WbVfMyFzZphhYBzXckjV6NGBk5NO6Sov5BrC+tsOu29Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wYHIij3Ncbc1mBnoL9EU0sh0Fn7xnBKJbDZkKc0JelA=;
 b=NT/0gwHMjLdQ79w9oS0WAIbIbjIl/vbJhqQONH8eLkyUuZAAXUyi54ynAY/Zn7fWFWGqmEsljshz1e3RFd9JwZa8iqMR9zOP6CUBNka5tgCGh/Fd5s8aYS6YXrmtXfBKWc+a4VS7hgX5imZT7HkgLNQUOA6qg8dCPsyMz4joMIs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB13995.jpnprd01.prod.outlook.com
 (2603:1096:405:205::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:20:53 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:20:53 +0000
Message-ID: <87y0peru56.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 023/139] ASoC: codecs: cs42l42: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:20:53 +0000
X-ClientProxiedBy: TYCP286CA0245.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB13995:EE_
X-MS-Office365-Filtering-Correlation-Id: 0854c735-1f42-4d7b-9216-08de0ad910ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IFLAx+mhBn8oCcHYfX3sfBlBb4SqKlyI/FvIsc8qswi1+kHQ+xmx80+O1fXd?=
 =?us-ascii?Q?F7jXSmATxQuHi9fNNWsGMXIxFyWsghaf5ITu6yoMNQKsa8/JLi0qOAlKIPQe?=
 =?us-ascii?Q?CeJYbHEQwbLo+e8Tt2QO9nnJ+ILBLPYP7imctVuXTMD5q74BvFbXwm0hWaxg?=
 =?us-ascii?Q?0aK6UcFohvcXdQ67t1+RM3cUn9rWjz0VVb1/MHgUr5IGs9+qyo1UN7BngoVt?=
 =?us-ascii?Q?S6gMVCeib4MrpJKSIhD+BDW+15xcq1Xi6DhH75K/largQRFA1qbKiscYNwrj?=
 =?us-ascii?Q?1ae+vFYD9bsD+wJYChp7YsHdRIQmY+9aZAJXK/s9gwYm/j4BMq9DqWa8a3i8?=
 =?us-ascii?Q?6NMPm7J8KM2uYuI9iJb1twGr3qvg35Cg3ml3GCnHBTKuJ90JG6etonJN7+ac?=
 =?us-ascii?Q?9PCO3vYfX9nfzNt5j/cou1AxtFfzwmJubvyRp991UJAC/fmxoTTjJkBcfxTF?=
 =?us-ascii?Q?OnYeJymzkTO5LexWZJpe/fYbATJPEQtnvV2L0+/1gStY895eeV3aDrPF48P+?=
 =?us-ascii?Q?J9rqGlAxqp5mZDo7xffnhYc0F7zIImumevZU8uBM0fFbtJz2wPE1yHaMKviZ?=
 =?us-ascii?Q?u5yUq/usG9gmrYQGVlF42mCDiZQDhNYXgO2B74157SnS67xQxYzWDDXxK+C9?=
 =?us-ascii?Q?BDytMNiXeMmdvm43v64D7n/j1AKKVqjDC/YDkUG9FK+ZrfHSBPLVfPtcbgI0?=
 =?us-ascii?Q?nir7f4rJC1kT459vGBI1FjRJuUCMHytyiSH6LWFbS55AOJVtWMMihJGzBisK?=
 =?us-ascii?Q?Q+2pSmwm0ADX2L7/ZmoNYRjd0VaiVGsjwQPAMzdwdmu5WZkQh6EXYjqYDEeQ?=
 =?us-ascii?Q?a4Fv45PEarI+eb8+Xg57Wh57EDcOAhLtn1NhFE8yVfNrTDhSLkoUKZaSBi7a?=
 =?us-ascii?Q?zeUdE0sd6/aoOt4GtCzoRtvxGjE9CGMsIgDMIJ/2dAPmOgYebZ+CiUUmVow7?=
 =?us-ascii?Q?6oXiE7KbiCnJkAW53dVpzP39OGh4y087SGvq86S2oNYNQNpl7foQJsrxm2F5?=
 =?us-ascii?Q?TOpkAQSBW1CkJ0Ulilx6KNSgKe1cLGGtxpxbBYjqjjNuBkX3sihjIYWAGpZA?=
 =?us-ascii?Q?QeUcdnJ6n2UTw+IcwUbGi/LnTO/ohZ+LzJoD1LzWkpKQYLS8jsDrz/pZ7NZj?=
 =?us-ascii?Q?COonQsBYrt3s0xGbX8Wle/Yh/lsA+TVNCYMd7Ir9aoRZZyggWDvJspJbkW2i?=
 =?us-ascii?Q?nYBFNk4J4fUJ0TmKZnoTRjHWbqpQEKEEesCkNDq54aYShY3qVLV4zMzK4yIN?=
 =?us-ascii?Q?V+ulgDrO1DO+iIaoaBa46+HGJBV5NQ3blUSdwud0OvODg2XzhjnmU42i2IST?=
 =?us-ascii?Q?BtiiWvpqagiT8Q4iOetYB9LazfoIiNK6AgcBLF2bI2tKHEXtJQguIwPikBGu?=
 =?us-ascii?Q?hyRnt9t/82ITw9WGC750MDa2+HZHPkx5JOO0JqCel87YQrT10FOZA8R0K6PR?=
 =?us-ascii?Q?m/Ki7y9fKciIROX+aAtx237blb3rfMv81NjSspwtraT+axgbCP5gdBNoYuyR?=
 =?us-ascii?Q?EfWVid7kN53GnpldAOIXMqtXWZWoqMqc4srA?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YHPlowD/tevRzICW6HZHp3HcXc8HXeKTDnP2YhogCNWl09IDIxpOqL6IAiXR?=
 =?us-ascii?Q?zRle5+vCRcse01HRsE8bfLLkZtGE7J/EWy89U2AG6MXMwVSCEYbyNOKVbzE7?=
 =?us-ascii?Q?96GnJragg7FxS/xh134cEzrBV3kPcgbGHeaXKtbhVRoFwcTZ1KlI265Q5u63?=
 =?us-ascii?Q?m0E1jW6i5BnjaMOPUsBttae+1MwY77Ak11szEIBbYAig7IruhutYeKFY/9z/?=
 =?us-ascii?Q?qQSfKj030W2iNh+QT6ojyBKOF5ZCkba0+SsvMnYx7N9pNj4Ht45qxGyfso7/?=
 =?us-ascii?Q?S9jZaSMaNkgqqg01FAKYqyrwolXGv1HRh+kxRw+VpXAQYeAHQwLQ4i0k5PJi?=
 =?us-ascii?Q?i6uKUMcoXw/u/Ht42YnWT4MvhMLbxiUuzGnXtu5j2X9gm2ErWF/T2OC49Rgh?=
 =?us-ascii?Q?imZumsWKaSnIjj2I0lqyYvmJ8ulOSz026LMXWj7rUOvOVKW32hx9BctBCZ0m?=
 =?us-ascii?Q?wSnYtTq4PTayjArwed5BlKdwnpvPSrml1CIQwISbI/7U8b6DRNnG3W0pbC3f?=
 =?us-ascii?Q?5uULWqZGEqL0NmVg1clhQt3hgs9dm8VoO7UQ6Jf4MLHQ6ko3ZUI8SwvVqy+x?=
 =?us-ascii?Q?OjYyeOluJhcfn918IjeJf/H2YCBLht9P9K3JUl9Of1TTzR48PvbQc8G0oLs2?=
 =?us-ascii?Q?tfhFHZ6gPYP+8HZT5a/DQ5UBzRQBOHeJ6/hW1Gdu6gjuyQWidlbNtBCERO0q?=
 =?us-ascii?Q?MGL/f1u6lTMZxpDr2im6+gk0ZkxW4GartDcg0ckYcUvV+z7hxm1kWWIIQBox?=
 =?us-ascii?Q?YEsIBSlU+pPHJ86nD5IGCqI8w/+7mU/9oiAVIdFgpYobK2MCP322AzrYOUuC?=
 =?us-ascii?Q?YZCLt1eaj5/RA+yxKmtrXKUxxAAgDigvOmIn3l15VS6pC0r2Tji/z7Dc6Riw?=
 =?us-ascii?Q?+fZK9lCXz6hbXVretwx3fJb8pBoui7HJkaZGPGVUGRWPiqDhVgn7DxBmoec/?=
 =?us-ascii?Q?1srkORFYXRkiO0uLqNiIrxAAohj91xWHs1WJKP3KJZtkgtVmV5mkbD71h70H?=
 =?us-ascii?Q?3taGijrh51VldiC9UpEajjIuc3f/pXibWbzWAVnBFueD7ip9USGaqrOx4kGS?=
 =?us-ascii?Q?bPYh7IhNSUyZiVdPdpMPJcf+lbVYmzThlnRT89W2JmWRfHDwBN3VeZ5NWJm3?=
 =?us-ascii?Q?B5eIERg5DR+hEfo1/oDyicRQW4T9hOmKeuADZ9AGnobJODblzaEjerVRxYjS?=
 =?us-ascii?Q?DOSH58iuxU91fQuDC5hHgd0rRgE6n9E1pfLNvayUcuOBlWTfvpWX6prj1SAI?=
 =?us-ascii?Q?t+4sEA7RnLbkdMNZpwIk2QwCu7rc3WSdcuIwE/bO51cr8RXyZa+kPR3ODlod?=
 =?us-ascii?Q?BOJ7F5Vh4h2pKg/nP2NLV14lh/nwxz2HSHuAc3MRPZ2rY/WDdh8npfJ08TkL?=
 =?us-ascii?Q?wFnzIwSnTbJzP37c3sHoGPSHXqkZdC8RxV9Bn1xCA/KS9cCdaecfD3e9G9cR?=
 =?us-ascii?Q?JtHSojVZqOKYc9ohGv3+4xsnY5708UfxksLiQQZj8YfBFoxRcvJo8t8WNnKl?=
 =?us-ascii?Q?z/Rn4nUWzLyg4XAOh+HiuxshEvWeICtrgzuEC67dqgOqm9tPiIfrLjI2nxcr?=
 =?us-ascii?Q?5uJ8wtcegHDd7AAKYTGMxEg+AZnOPM6eq2GaE1XPQQ22mSwOrI+dGRgaTDlD?=
 =?us-ascii?Q?wP8/wfOmL3o9t/TOKj0QNXA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0854c735-1f42-4d7b-9216-08de0ad910ab
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:20:53.8473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1AawfjObLF+1scC0x4nQ+/QatysGGbkGdCR0QyoA0tVE25yhzOshgecMZWf7bQ4Lzxa/DP8Lkqkt5f0JbhVM2LOjvXorXf5enql44iE+xs45qArGbcWWFrHiU5GhnUfG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13995

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
 sound/soc/codecs/cs42l42.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index 78bb093fa0cc0..2652a639a79ad 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -403,7 +403,7 @@ static DECLARE_TLV_DB_SCALE(mixer_tlv, -6300, 100, true);
 static int cs42l42_slow_start_put(struct snd_kcontrol *kcontrol,
 				  struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	u8 val;
 
 	/* all bits of SLOW_START_EN must change together */
-- 
2.43.0

