Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010063.outbound.protection.outlook.com [52.101.229.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A2F307AC6
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415600; cv=fail; b=u1oBsNOWqKsang0AvXF5bZZAdq1SYSOiYGUpim31oVC161L2JPu0MvK2k3TtBHrzFfWTeZuHMKxER5SFo/9MTZGEhQ0/xGQBKzoSCm43aDR8Q9+yKPHUlj93ylTH8YnpnDqkmk2dToncMBZ34mYJv3wch378GvF57cgaWg+6QmE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415600; c=relaxed/simple;
	bh=gwttNH1RcRn8Rav4YG1MHAVvVxArd06TsE+JyoEMMKg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=qY30uz77Ak9PqfdcVQAvsLLkx4MqI0sxSU1Oazi5eWzmzeMdN+N/kv0sbgsu5OhirXioNVp6nXIpORM+Iy48TJ4yWw/fNtKEPKY7vGvOiuwpL2ST7fdB75WQqb2nPdey1hw4YnBIbI57U0u9f3Q1QNB672467OsGKenNyDB9O3k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=SyUTmmnL; arc=fail smtp.client-ip=52.101.229.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="SyUTmmnL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YkfSlKVQV/nYqVLybegEzDiWQpA3SWAvdEVE6EeY99yCHIub/6nbY8c0487Md5LbsMpCv0Bcb4OjnTWNMBV+aVAcKqJs6RemXzCJR+X7KRrgfvhW8AC3DzQBuwwao/093LIMF+XXEAVirlGWP7X1IRoOW52ApDmd7+OY0eHHLYgNr451Obf3Gz4/zbvTW2+HgXAwzbtFR1mDYmMcdF0g0UwDjiqb0gu/JOB1qhO6RIwMcscud4QbpYFuuWVZuL/ZeVXwjgtLKka3sOdINHiNsi6phoHCHo4jxV9xpP1SWtZB4hpDw0OrFetNklMCXPRv4dxKhrZjPQ1XGjfF2yQZYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lm7f7WZ79p8X1lRgw4zsEj6e7xfkg/9dhOAM3scwry4=;
 b=L5+n7+13/hW/9j+zELFnaxkY2U8UG/vqlEWhjNMqKrNX5x7p5V/PUIPtTYXZobGKtuA1KZwHCJssxX7k7Jzd4xZBbtwX30KKv40zmy7Mm8A03DlC06O+OSV54ATo5MYIA+OYCV1M9/rnhoDABRWjdn9v6GiJNw8ojr9sEQYUaiB0drVJfU5e1P7PMwxOYJrP1mHu+l8bWMUysEzM7f+yXQQMl7stzMsc2uT+A0My2xpOWt+/DHOr2WbgzCi+xRjU1HTh6pd8rgx0yzEoXQg6AACtTetJlwm1k4NSiFK8rtMsEetQIG7965LuylxIZZsB1VM8QzeoYF3WMXfkmWdrVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lm7f7WZ79p8X1lRgw4zsEj6e7xfkg/9dhOAM3scwry4=;
 b=SyUTmmnLN2negghsUyx5Q8AcF5qt7sXCYysJdR04rPFoFSIUY3wLuYf3pY2aPj+7stgI9khMIa9WeCCMB/f74fCWMmIYNLQWm/eHuez1vLFRcQs6IZQ4ERB63/hyazuXDUrvwf3j5dZyGsoGh9Rrrr+jQDEt5vZQC3auymKU2PU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB13923.jpnprd01.prod.outlook.com
 (2603:1096:405:1fb::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:19:56 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:19:56 +0000
Message-ID: <87jz0yt8r8.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 008/139] ASoC: codecs: ak4641: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:19:56 +0000
X-ClientProxiedBy: TYCP286CA0081.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB13923:EE_
X-MS-Office365-Filtering-Correlation-Id: bb692e9c-ae91-4de8-90c7-08de0ad8ee5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?i2EOztWO8botb5jZO0UND5rn03B64EnEqT1cVimd9Lk+CtinRsuUEqfwxPGC?=
 =?us-ascii?Q?zaN5F/zdAZG2N70oeKHIr/wAH5r/nAGhnQspnZRznurDdhiuyYQDOsCBsibI?=
 =?us-ascii?Q?xWTB6gC7oaWVIZ1zcIQS3iPcDAugPb0d1joVjG76un/Dg+cAeHUQHB8Ixpfd?=
 =?us-ascii?Q?CbRfUppqzuXCVjDaf6cqajPDzcpiPPLUmSCjTehOsGU5qzeG0ikhXvYzB3UE?=
 =?us-ascii?Q?T9SCI7JEDii9OMUs9dbMxpCVbWP9iinZqAMjA9bMBXO29OrMghhNDCShA7L8?=
 =?us-ascii?Q?r5Ai5Bzqm6NKCRaErXD0e72cW/zlZuQh5WoPu1c5S8Wjce5oDi0PmNW53azv?=
 =?us-ascii?Q?mFlZKBduydu0MD3dAERlrI831FDNS+hH+lQo+ZnxxUJi47lseGetZ0B4vKd6?=
 =?us-ascii?Q?pKBMBcLQM7y4Ao6lxSl4vVeA5IKmPSTmz/IqfV0qVW4GdX4SYaNbkrJ4bGYw?=
 =?us-ascii?Q?pyAkF0qoJtmuHvqohQzigOmo3+ZFJbzb6LoIVOVkCdT5Kh8VSjqEnuNvW3u3?=
 =?us-ascii?Q?Ub1/VOjsU/E1V8ThcPC/CVb8NgUPXWMMB2EyVfUgrgH/yGXf9rgeVD+x0X4p?=
 =?us-ascii?Q?AKcfKA9zhUCfBwWce+FU011QhNCzX3N5DK03oVPGf/FBgFixjbhs2GjUWV/m?=
 =?us-ascii?Q?kLa8aOIOV0eWWLZHdYLZuPfwhNLuvWed/Z6iK7uC7sovMfPJtaLBAWPdg8Vx?=
 =?us-ascii?Q?DeZd0bmYSJn28YzO/HB6mcExAkIawgjcJueWeKu1sLJ1h9g1HpkxNw0tYec7?=
 =?us-ascii?Q?a1mCAqb/i0Qe+iN0NdRhQXQY3/YnpwiMnVzwm2urrLKZemEfkt3XAqBxbByQ?=
 =?us-ascii?Q?c2PQPK3g+NLGqCDZ8QGtLb5PiOJ7paSlF7pFxYYDVEOs/vrYpnPsziAzpMY+?=
 =?us-ascii?Q?UyiNtA48YaV88FA/AnDpnX0jedJAga8hAVMA7l8qoF97FwcISX9eNqAQKcb/?=
 =?us-ascii?Q?h8g/1z/C2nvUo6K3l0Y89oWVO3LPeUy91gSWqCf93jkpJi0E/MDIJcHls57z?=
 =?us-ascii?Q?LACYJsrdL6Lr57OQwc5m+SjFRjE9zFtIxky3/UOT/reTWplFJzjd6EVy8Pd4?=
 =?us-ascii?Q?i7dOg4540J2wEc5LLGwIb3UkPR7vHFSPhseeekvMMLPDiQEMWKLrlGs/SzMH?=
 =?us-ascii?Q?ciKih/QeRdpflZ9OW0W1vfhski3on22PPmazjNBdD8Vkido0Twsm1c7kV7aG?=
 =?us-ascii?Q?U7Z7wx+54gK3iitS310FFmcPgNUIDo/pSvSM++PGPXXIKs/A9frtgnHS7DnG?=
 =?us-ascii?Q?udSf3G4zUMTVITiKiM2iXhB4WPz8jiYKLspXvnWV9zCzjjvgKt8T8dq3tdRS?=
 =?us-ascii?Q?EEkoh0vmRLFiSVAKllZNGhdquw/Oldoq/pKFM2VY2ga86zECd9awAIezhKl0?=
 =?us-ascii?Q?3YkVoU8qheptGlAbvUmDKUHEBZsMoH6M/oeLA+FVu5CepvCYWL8A11zoyCxz?=
 =?us-ascii?Q?fe8zVEZictrT2Vp4LZJAXQ/Iukb7Bedz6Gsbb0bj+1qf66ckKj/DVXe8zWYq?=
 =?us-ascii?Q?cQumy6gxs9OYWcc5OqsPm6JerI+aPEXleE4M?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cbPdCrVsX65z3eBocXJ1mvlcQ3VIyJC8cnM0CUWx9NBwcoRPYVlbMlN/KYH9?=
 =?us-ascii?Q?FPwq/kNhNZePa9X+4UsWc34IHcH6NUnV8yoypqiC/0KiZf8nZwDgHi1uKsbq?=
 =?us-ascii?Q?Ep+KCBsqxWd5X7Z5XIw37pS4VaGQmx586DpliQxoklXcFRNigJbYrgUIMO3p?=
 =?us-ascii?Q?AQ4kCqEgFJIdC3aJvpmMVLDaPNElkzeuwl88QTgJd/dXs1Aee0SCi6iRgVwq?=
 =?us-ascii?Q?BBB5TRTE2+j6tsn4IMETJ5hqUdZbdWU+2KylQ526EmApmVVf1J0g2NAv1Naz?=
 =?us-ascii?Q?Eobq3g3UuPi/FZmKZcaDzljopx+1mqIhoB6AxociAnT6kmENCsX9HvYbS6qL?=
 =?us-ascii?Q?kH/sLSf5MmZbjidzSEY22rZfmzpA+Y/FWvxsjiSIE5GH+tdrHMre2vbf9g7Z?=
 =?us-ascii?Q?LhJrdi7KL/kmuj/1Ik6yU6Y8rdUrmgu+MqooMwHixA9ts6Rx+KYIImzrb44h?=
 =?us-ascii?Q?uv7yDrLwJAKEp31noPdLI5VT+5fuOR/Noe/4K9AeI4K9/245YJrX4taQz7yS?=
 =?us-ascii?Q?u39pQO+ZPmOxvTCARqKaLaB6WBPlrN4ecr23slPJQTKgLJhAAkMrfcpf9CkD?=
 =?us-ascii?Q?rKzYE1dnmyjCZy1W1tMsN/CKjbc/Efd00/zbwWOcUN4NiWtxW10mIZMEn/1N?=
 =?us-ascii?Q?y0AAoagb9ty6RCTvk/HsihpDc9XhqyROK5AFvVYfeOslLL+GxuHmtdIpnDoW?=
 =?us-ascii?Q?RySA68uzeqw0yX4DHf3g8E4OJgUbowLJeYM4ADPtsIfFhJVO+jSg86MRprye?=
 =?us-ascii?Q?qHGn1nci2pZAmrF6a8KRI2J6kkU+1Eftnfei8t/qMII4nurEdMQ+Pq6INZBn?=
 =?us-ascii?Q?d2WGkX6i3RoU5ajH+WaRco7s/RDy1R2YgnetZG0Z0pCh+FxltjYLb8k0k4ZZ?=
 =?us-ascii?Q?jbeD5WmJ6XZpNNNZEU3qegHjNKthqahMw90na/6u7sEqY3+/V4q4rV8oVg7A?=
 =?us-ascii?Q?DGRgjqbegxH/UqyAfMYpmmwyboZeHOTTK1go0kNoaC5kEI7/21Z21SdFN5Z/?=
 =?us-ascii?Q?fXC/Y0lGFRVdI5GI0xgroKHYYRDtGUdFBFJ6tg/nTz0TwM17PR1DeOC6916Z?=
 =?us-ascii?Q?WhflIwE7GZPp/tY5kqGUeI+sCc2i7VFeZ0MAp6kPWHBW1CS1yKSG8Fo21gVW?=
 =?us-ascii?Q?3pJU6bdXpoueDAfVzX+BoqRSrN56bZoARN9otmqLlIiZGFpFYaUVKnvQZucZ?=
 =?us-ascii?Q?cPLPXo3bqkKMnCIEYyIMDQe4Y+Os9s/n8NYPO01uUXJgKZjUgJEV8aTkIl4y?=
 =?us-ascii?Q?jjNB/Yu90CFyZ93p/nJ2HVhoahYDUSUPG6tnCj6mTvp4iwG3NJ3fKsSA++vN?=
 =?us-ascii?Q?oS6mbFc0H0/2UhWx2iwS93OYr00LHUBd/dMmvldDKUczP/Nw3RH/uVXhySsR?=
 =?us-ascii?Q?DqdwsYrR2bM99vUlfLl+u/aZ4Ls/javMW/PSsY53HJdOk8Lh60cGykDHy+za?=
 =?us-ascii?Q?Mfr12sZblLb5Z4tG1cJqb1oQvcVTfFjPEMQtyVeLWyodt3k0AIWOZajD4Lyl?=
 =?us-ascii?Q?ez6gepUIrD5jZKodWKlmqYKFmqA7eS86A4OxyYXNoEsXK4iCWeSybzvWxa8f?=
 =?us-ascii?Q?k3PsvQtfWg8tzTlfrcbSNbUU907fX9VOC4xOfaj5x9WBYkJ9fDChETWWEV+p?=
 =?us-ascii?Q?o9i9giv9+R5/1bcZMiJX/wo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb692e9c-ae91-4de8-90c7-08de0ad8ee5a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:19:56.2904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JkIzAFmwUP08xUELcRMItUGSgKLHtTnPkOcG4IEjL29ukfPMTPwfJYxodjNLCMOQ9ewRkdcn2XrPuF6F9B5lPqcOOuoPxbAAa6DE/LFqofgU+sSY8LaCxHeuMOv1DAf4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13923

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
 sound/soc/codecs/ak4641.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/ak4641.c b/sound/soc/codecs/ak4641.c
index ec33e7d73c6c2..53c5d3f50353f 100644
--- a/sound/soc/codecs/ak4641.c
+++ b/sound/soc/codecs/ak4641.c
@@ -91,7 +91,7 @@ static int ak4641_set_deemph(struct snd_soc_component *component)
 static int ak4641_put_deemph(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct ak4641_priv *ak4641 = snd_soc_component_get_drvdata(component);
 	int deemph = ucontrol->value.integer.value[0];
 
@@ -106,7 +106,7 @@ static int ak4641_put_deemph(struct snd_kcontrol *kcontrol,
 static int ak4641_get_deemph(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct ak4641_priv *ak4641 = snd_soc_component_get_drvdata(component);
 
 	ucontrol->value.integer.value[0] = ak4641->deemph;
-- 
2.43.0

