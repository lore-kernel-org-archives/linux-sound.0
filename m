Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011046.outbound.protection.outlook.com [40.107.74.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0F7149E17
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820474; cv=fail; b=td6aG4PjJ+kGBO2tMytRQlJ2yU3sj7101T3F6rcKFbpR7bl0HaXMCZG6zgXhFQ6lNhIj8wNo0MO9tHAq5vrdE/8Ee6AHIcJ/FnBxUoisMI6jRZOdhhZn3TGZy5krWKoj1eG7gQp26W4erFlh/kbXraXWzGapfW+6diaEr2zn4gw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820474; c=relaxed/simple;
	bh=+UsNyJnviCmO3ToXei7j5hpW8cn7o8t+OKW/09grXVQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Lnh8DkcoQY4bbB1QNJ22yI32/FAueklxHZP+EvQfOkOb/R0HohqCaSFNoXsKlgnGJSgqnaBaXnMYL+ct87Hym9n17YlfNoiBXW919j/KB8rwtCHUDJtD/i1qT6/h2fW5skhKE/iRLFFReIfBvi88vmJgijxY6Mh8uK8i9BDQaks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Yz6r0gco; arc=fail smtp.client-ip=40.107.74.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Yz6r0gco"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D9oB3kcy7M6+5JqsyiO3fGYcLdihPHP8eMpYdROMTJdjEDYiEr8wO+My8OGzFyLj7LedhcWt4c0geDthctifmqrFVwI/Y1S7V2e60sI13XWPHM1kpLZIwZVkL24KtbZibBd5cN4ug49uaZvt536ypwAq59hY/K8fUdeinimsQCehY004sCp3XqJntLvbbHQSOVJkwo+bCxMViYYUAqlijzG+muIysTie584TurTb86J86PXFGVhKLmAsAoiF+2jpgFVutGocarK/svLlVsWQp8Ok8eWCGW4h8mcEZq5roxDUP03XI4PbWC38WAhtFPJP4jfeqF8QRWust1sEULoh9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3g8x6hFLOORudQUsp3U7Y3pjVt9hfBHj/p28SeFARlQ=;
 b=khV8vZfTVHjflUxtKuGbLwv/GwzEAK4WLZ2hYZNuu1DpVVCg7vbj2vCWStQQzYi4++xbzonJwyBEZYY5MGuts4/IyOZLeNZX27b6Dker4vxpJlqvr1xlJRtokEX5zzW/PzFcPNjlnEfvF7pxZzDy49AcD6e/8ldHbBAPOOJ1M+HVTUatWKQcXP8zjup1i8BpGBusLtlV/VrNoifJ24qOAqLXY5vvC73Rz9gxsXxjYNMvJDhbod9JNXdmaYnLvP8R2kEr3nXUqCVcOP8yT5rmKsmGa4MxoXzUjBH5y9reQ9859/flydwqgZpCHx5zobYCLAzfd5KI0lzpV94fEt97yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3g8x6hFLOORudQUsp3U7Y3pjVt9hfBHj/p28SeFARlQ=;
 b=Yz6r0gcoK5gUd1CyxrXAzucbBhsTDkBwHeNrKS2JOMv+8u2q2SIlZDKF1ZRGaquy5gIlJvE30saNViaBYfPIIDD172vT5MpVimzfR82WvSEI1s/wJsvXC5MD0p5jtZRof2ELTwrwrW01ueVergNl3m/BU7utvIh17vyIbPGOK/A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS7PR01MB14361.jpnprd01.prod.outlook.com
 (2603:1096:604:38b::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:21:10 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:21:10 +0000
Message-ID: <87ikfh772h.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 045/292] ASoC: codecs: cs47l35: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:21:10 +0000
X-ClientProxiedBy: TY4PR01CA0050.jpnprd01.prod.outlook.com
 (2603:1096:405:372::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS7PR01MB14361:EE_
X-MS-Office365-Filtering-Correlation-Id: a3bfb31a-eb1b-4a84-fc9e-08de20b83716
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/yFnglxILjJTI9B9hFx63OJYU4+u/KBXjTGM1NkrcrfYYx6I8ojXTR9gOsfe?=
 =?us-ascii?Q?ewBl0LrMZVqddswDwbRtwx2z6azwVouOEiCk2PUwE4RbDrxzXTchTkDRMIGp?=
 =?us-ascii?Q?w2MTzoHp6N+lhvx1Mo/p0pGk2OXNq8leyTmIcgH/Eujmu1OEw44sKbTKLrlD?=
 =?us-ascii?Q?SuPQsqs6tyUI+yPpq0F3a+wzUKt2FiW1ILl1uPVLpRyLXdwMhGTednvmvRj+?=
 =?us-ascii?Q?W7JM6BVXriDsaeMorwXfHwaiFVCLe5srkHUV+OkJEEw2tOP2bMJ05vROgGRx?=
 =?us-ascii?Q?VKly9prYsN9YvL0hqd49swxBajjy8u7eHvUSRjtJ8lk4bd3/x2epOOQXEhu3?=
 =?us-ascii?Q?rr4uRwqbLoiAjwP7g1sYCttgCPztcw3nqlhdMaRlLPN8D9ma/ZsJ0RMaa+Ax?=
 =?us-ascii?Q?VLOp6TjqUSveGgPbcOgm/KnnLQavk0hLjE9q+MOvbmKAxbYfSjWgosXTS7Bi?=
 =?us-ascii?Q?lmyPSwAC9v4x/1CZgvuwf1ChYy6EeBsQYHzkcxedlXA6tLv8lPHhpl0Sp+np?=
 =?us-ascii?Q?gJ69l+FxlrFcVf62UxO24MyOU+NYHPPKJBtvQ1KwJp9rNZeiyaE4hduikgrw?=
 =?us-ascii?Q?sgUAv2WIq3PDMwdwzB5AtlvmhAC7m62n1zanHyMvd3HymeBE0HcGQNuOnVGl?=
 =?us-ascii?Q?RzzpnZJdabtmysZdDcR2Idk6HD1GhVmAVxszMYvTan0KcWB6lFNtVHddhvj/?=
 =?us-ascii?Q?TTGRA3jKtJsNRidbqdIM9+bSx+gWr939Ukiby7rQvB9tln/tautFRTgyNaTW?=
 =?us-ascii?Q?ycAJhHw6EKLtwfioxSsq11PJGfSepbctMpGwguOb8BLNc3WC2usc/32c1+D0?=
 =?us-ascii?Q?+1gmvZJdQPl6snb5Wkv4zfIwFZzj8lLihukqp9bbU/WglUDO97GbuLYyQZXA?=
 =?us-ascii?Q?BRaZHQPWYywamUqNM6mklPDswR+LVZrWBf0/tc3IOD8QEsxgOU7ttvceVCyL?=
 =?us-ascii?Q?fK28ifc4+Ophts5WAPB5NGv80BrvEQhjW7vl25AnRQGoJcsioqGojMKtigHX?=
 =?us-ascii?Q?DgaG9lfcOnUgwxCE1mQGYfb4pgN7xnGuah1Lj+p+9pQcNsnF2lFhFaiPf97e?=
 =?us-ascii?Q?YeLEJInuP4k5D3wXZXvfrF/Ml7MplwN7uHiCrbkWVCRXKASN0UsDE0+Mkf2l?=
 =?us-ascii?Q?1c9NIIuN8cCb3jVc7croUfffEFGuEjnJE9v45MlB+6RMWJcsdHxYSHuSA2ii?=
 =?us-ascii?Q?8CJHMBk1wv1XlcVFgVRi4mnx2BJHz39Qo/pVPFpKflc243GeH395Gaof+hsM?=
 =?us-ascii?Q?bHzkbaOJ+O30d+8Ptggh7xaZCMn5Ap9T0mo7lH2U1Yh86QAIIWwdQkVPrI5v?=
 =?us-ascii?Q?yPKk1JJqU/uYGgXuPk3mwGd0tuDac/8FhkT0jALTNotJjqtyDWbiY07/QuvT?=
 =?us-ascii?Q?MbxzKzvwo2SbhNTKXtBGdEa7f8wax4UUIRaLWtohti3uvU5AqTqtI1NBTSMp?=
 =?us-ascii?Q?gaB2PWceUoXlpFh8sxzVyu0NvZG+qqOuR+bL0yUFwcNmqg7K9//+uUfQMvER?=
 =?us-ascii?Q?ZJs4gpViUAJmawDQ05tgUJxtUPLha1Gm0jJ7?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5ex2xYnYvWvpl6+/H0khhZPfNX+lKDRYVjo2XeM3ggr1h1K1AysD/tP6+dvd?=
 =?us-ascii?Q?SOi26H7fCkhWT6TUHdJlcHx1izBcVrcsycIE3MY38gs0pdL2Xc5r5zlif9tY?=
 =?us-ascii?Q?vdKMNqEHKiaQTHXRnfVmf56QdRNYaxqwOIjleJLditgwJkzTnOdI9ioCHUez?=
 =?us-ascii?Q?+94+DK6XDSzEVSgpvOqMZNGdAKGMDwKfrer2Rur/sxzpVMHYtZCvWZPpbSQd?=
 =?us-ascii?Q?ixZIkeuQ/GyZ70f6sG+14g5w3KJYHzXwS95fEN1C1RyjpWjNqiuMtyKVIdSC?=
 =?us-ascii?Q?VLfAkW3uRYyTyyhMk+4EikxcefrvrBZbwILxNI1bijXHBEX7z1Vl9kieEW8s?=
 =?us-ascii?Q?bYppubvJJ75ssjrcz7341KA29470fJeH+HVwrlJvvbqw2la1QM66DduuRTq/?=
 =?us-ascii?Q?w9FsQKeA2kSQ9ikrnAkYcXF1DEaetVNQwQ7DzMdMUcAh2j6Pzl9b1vKqw8+t?=
 =?us-ascii?Q?hMcNxtbQAwmK5/dFfglIaZYqCb/dyv81Ccgcck5ULShpGI2Rw7wD/iO0GU3Q?=
 =?us-ascii?Q?zi5Ikt66zujc8Ft1ahua8SWQPrAqXeAH4r9Pqm6DboFLS6a8JXmkxj7cSn+f?=
 =?us-ascii?Q?ARjuLVFAIxG6nAUDlgF2YVZl3gjKtIlkvC8KL8XH5u/sn8Nan/3+EAcJEE0O?=
 =?us-ascii?Q?htNWC9nKZKW95sUlTkGbHIEsIqmk1SzVPzPBuHP9phCLDpZe2dHG09dvwesg?=
 =?us-ascii?Q?xNcivPdw0c5LFeHpRd0dl2N2dh89aWZAy/WT0rUjgWkIIzC2V2xMlvcgO7pQ?=
 =?us-ascii?Q?4I5Pcao/syu/l2C6eoguznmnGWnpIIGqQbvOnEueYEhAWNPSEU4tKrY7sKZP?=
 =?us-ascii?Q?lOQ5VYLVhAobuQ29S55rBJB8Jadascn4XCfk3bi7KZRfmn9uGjmuOYB1TcTq?=
 =?us-ascii?Q?vTk/yvPU2H8KTsw6CLnxhctW3LJBbg3i7KDf/8BiSlIVfnk18itLCg2NUnS9?=
 =?us-ascii?Q?QqyNEfHasFzTlGwUqW5o1k3NKbDyEgfdLHbtXg403i2Ig1/Rv36f0easPYsL?=
 =?us-ascii?Q?WG0hWijntfLLQl51lQVZMnbwntdKeB6LqcVoVdBTsMJy1VoJmLAU6DBKplJb?=
 =?us-ascii?Q?VbfP61WtnRlwGMPALZ70X3VOWuv+UDP5B6RKOwqEY3ZlH09bZ2rL+bhAZxV8?=
 =?us-ascii?Q?QJrdw8bFs8MeFOl2lbqqdbvNdmDoZR8BQw3yWFMudVQeq7SvmHg1ciEXoJnk?=
 =?us-ascii?Q?0oZwUrmgsRwiWoECqu+sQc35vd6QR8+vKGtAkyKdG9bI/ki1d4aCBzSqUJUN?=
 =?us-ascii?Q?mw7wI/xqTYBXLVXt3l8T8EKehNEkZlJWnqYvPLvECV72j9F7zLCLzDvMgZIZ?=
 =?us-ascii?Q?26P/mB0UPgqsYiGOXgj5pEEzJfavCHqrP5eGd/Prlo7mGstoqHFX/rhD65uN?=
 =?us-ascii?Q?UVoO1HR53dZNeI4j7LgffgachTzJkLS2jM7Fo6Cb0/jP/AKIwC/n7khZCMm0?=
 =?us-ascii?Q?0z55PK+31lP+cN0B+PYSpBRuRSGP3yDIAFjVmXtLFVUZonLEyQxVFinbcQLF?=
 =?us-ascii?Q?EokNasOSOozfVkfACjPz8IiQM/73uzmRoGDwtbm7Hn7+ZNjh8u+etJCoYEnp?=
 =?us-ascii?Q?zX1g0W5T1D/c+DnLvggaXzJ5X1DfQ6hjK9ehMZt/rK6iSS6IsDhbrMPp6jRo?=
 =?us-ascii?Q?R+oieUaG78VWsPYbp16qX5U=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3bfb31a-eb1b-4a84-fc9e-08de20b83716
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:21:10.4217
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zy7Td19px+FMU45PfqrWghc9wzpDnLH9Vo+aJwJOu8l+mYRlPdCmV1SX4AV2bA87PO5Vqa7gyMxmpVxi4BvHNyvV/JxQiTzgQQ4vnF2y3Iu8OoWLPijYF0DBOp9Vpb6T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB14361

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
 sound/soc/codecs/cs47l35.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs47l35.c b/sound/soc/codecs/cs47l35.c
index 85555c7a2e4bc..a8fe5a99a8bb5 100644
--- a/sound/soc/codecs/cs47l35.c
+++ b/sound/soc/codecs/cs47l35.c
@@ -1559,6 +1559,7 @@ static const struct snd_soc_dapm_route cs47l35_mono_routes[] = {
 
 static int cs47l35_component_probe(struct snd_soc_component *component)
 {
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct cs47l35 *cs47l35 = snd_soc_component_get_drvdata(component);
 	struct madera *madera = cs47l35->core.madera;
 	int i, ret;
@@ -1566,7 +1567,7 @@ static int cs47l35_component_probe(struct snd_soc_component *component)
 	snd_soc_component_init_regmap(component, madera->regmap);
 
 	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = snd_soc_component_get_dapm(component);
+	madera->dapm = snd_soc_component_to_dapm(component);
 	mutex_unlock(&madera->dapm_ptr_lock);
 
 	ret = madera_init_inputs(component);
@@ -1579,7 +1580,7 @@ static int cs47l35_component_probe(struct snd_soc_component *component)
 	if (ret)
 		return ret;
 
-	snd_soc_component_disable_pin(component, "HAPTICS");
+	snd_soc_dapm_disable_pin(dapm, "HAPTICS");
 
 	ret = snd_soc_add_component_controls(component,
 					     madera_adsp_rate_controls,
-- 
2.43.0

