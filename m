Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010031.outbound.protection.outlook.com [52.101.229.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6625A309EF8
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415848; cv=fail; b=VWxkYY0000SxOd/sMn43iBrCyRS8M/Xyfzaj4XwIdWHkX+LzoWT8G9p8MQ3Jrc8QLxEOZv63j1lW93aTtnEl52rmMvRh51WguPzTESiCSGP9nPylZrvj9gGWzksQOnnbiR/1AakfCVfNuEv5vrgSRuCk/J9sNyscH1LfZafn+JU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415848; c=relaxed/simple;
	bh=QSzQNPV3iEuj0R2yGrFkJYeethBOqcM4hx4jZ2mNrz0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=hM8JhGgk2BZllKDv/OK0pbkHAW4FOf0KK4IwRGtb3uGsR59Yls3aAh5qksw+PkPdsVaJKapxuh3q3NiFydn80fYqxoDgQRg7LWHfubh9do24liCZuGCduITwQYhG764DFE3xqkT3S5Gl/6zLIpZVi1z4mn0IYxELq+DEjYY4VHs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=K0s2PY08; arc=fail smtp.client-ip=52.101.229.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="K0s2PY08"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EnlYn5B+p9FjJGpr15Nj50U7sbnaActAcG0wmkNkjeG+LqGA2kbjzCshZS3NMcWFqFtGg8Gw2YuFK4/E9nXhUMODCEfh3Gs3QWRGsx+GngW6EOyVHaOLKkGeowi5xyNO38/PUcDXheuqGEZ+jISxdrJVDrit4WkDEYsu2iYh98DC5oQTFPypqBH+XfKMyxACdJRnk7MdFVUGr7EL00uHWCBp0aIUwVKB0kB9YmW3pJEjxKNbtfhu7SG9LuJM4RQ3255bPsY3OTZI1Mm7TntJapovDG18Z3xbrzbqbUMT0o8bJCLj0EAuG3PAGp4bDrZeaT6dqGiAjOkP+FDEk6ECTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VQgMCQGAJBQ4zzXMh672d24hBuud+yfeFZqS3jt/zIY=;
 b=sC/flcMtXKUkEsElwJRebmiC0fAoNIdZ+Tg/eHzNpJLSDwQ6Rx4oOLbQP5VsJnkGq96BbuS+ZZV+AQszfd2hLeZbgYHhRqInQHfOnYMjBiGg6ePyG8jy3GYVQjJVcmOpQuhCajTT2ostsR6bqmeHH0tqIJihUIw6PmsX/+mpqRONz20MHyknMdCCVqbEsCvuC/iPbl97EC7zCYpAFYkH77qaPbFAEzIFENCik7PJDCFojiCsXwy4HI89ryEFgSWDLmf61O0hikX+Ixksmi/TtSMotiK6xnSLmnUW8NWJuY0U5/c4lpxDQ27FLjTyhpX9ZcCg23R2PcvtCiqAQGJNeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VQgMCQGAJBQ4zzXMh672d24hBuud+yfeFZqS3jt/zIY=;
 b=K0s2PY08zgmPxRLyrEQj0bTeUIn1FyH77NuJN9Tj9G1fbJq8yUEKGHJIu1uo0pQUTNHxa0wRg1Nwk+MtvqW+KV8OejJn9LEwgetBPmUB/JME5new9/WZ1f5QhIzXf0uiWyRTUMmeaWonNUaKkT8d9ZBcLdn8UTDrFsJjuvWzAMg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB8810.jpnprd01.prod.outlook.com
 (2603:1096:604:17f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:24:04 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:24:04 +0000
Message-ID: <87y0pep0v0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 073/139] ASoC: codecs: rt9123: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:24:03 +0000
X-ClientProxiedBy: TYCP286CA0335.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB8810:EE_
X-MS-Office365-Filtering-Correlation-Id: da927d14-ec72-481f-efa7-08de0ad98217
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YAM/UnaK98RmAG2U+P6zGgNgxyl4rfST8zgFqP3VsDPUcNSB6qx0O9MYn2CS?=
 =?us-ascii?Q?f4B5z97Y9v5jT2xCaiinQByTIgBfmbiLFxUUGS0tN6Nf31dxk0XMOX3Vg+BN?=
 =?us-ascii?Q?HyNuWdjSlW/d+EFZ6b745NUUvjjE5Q22moGUsyDXJRSBdgx8aOahwlseNm/z?=
 =?us-ascii?Q?CiAm6PF8/7e/uYlWIlFE0V34PB7PycTJlWsghhqj2/SUYXRAcM1f7s1zSCDr?=
 =?us-ascii?Q?8vqqRD0L4QygJBc+Skvfh1mSOOZ9vR/hqXQRjOCGyk73Y03NOcJiWmk55AiS?=
 =?us-ascii?Q?hl44nWX+4VxCzham8dmD3oC5BKsRgOgoQQ2Lz/yuW6OCenaAXuuADgSNJXqh?=
 =?us-ascii?Q?n5rx2dOD7UJdQPEauubO1FdrbiLcjN7Retelmoc+mGEVuWy7CNmaPnYnWij0?=
 =?us-ascii?Q?O6UWjG7qH1H0ucCSdxxQyaZAhP0C+H0L5LM4sW4Y1B4FtiaFknyIY6jfEUNh?=
 =?us-ascii?Q?JJqLbUeJvKMvUN/N0CATYI4+gYhExLVlZK/9vk6god0bpU8RklBcPNHRj/S1?=
 =?us-ascii?Q?liJKf6bOFKTbCQeMszTBkEYF20lGz2v15q+99GQxsp54TM1BvJUB/tuIP+MG?=
 =?us-ascii?Q?vNVz7X4QgdStZ2KOdI49aYN8lC78EkixDJV890WWX0OCMAptXaQaZ1gkRb54?=
 =?us-ascii?Q?zTX96HOf/76CK3IrqLOYcMbrpSsJtpcNTzmFzMGS0MIrYKyUI9cXn6JuGudc?=
 =?us-ascii?Q?1Jv7LHcIp8HdZOOwRCCpb3zLclZo3WpISEY/V6uiXQDN8DLhNDXJMbzVvbDN?=
 =?us-ascii?Q?BVI9FX9qLX/utl830rlSHt+smDd8Oy9xw7U6/cnVbaH8IEgLvczX22Mg3WMf?=
 =?us-ascii?Q?MHFDSRe369h4AR2TNWugwZqd0ZEz7yJEDVdA9fxxnDQGMvVvdvMBXpnNQ9pp?=
 =?us-ascii?Q?+PiPwHhxjWsw2WNM0e524ejkFoGjOuNgOE7qB1DKQoz6IqbWmdfWAOORLlMR?=
 =?us-ascii?Q?/AwX/o/JaDqzB88uY81cEjRXJb4Fc2ZBVFlgfVTSwluV0NwtDjQohaSO/VXN?=
 =?us-ascii?Q?IJtxvb1jUTs1GprGiEDGoSipDZ3EGqPqkcEscQrKBiVNWFvI5Ky5UX15NRvs?=
 =?us-ascii?Q?UTz7IuNNFF+JzKBFAG6UNH6TcDI95QS9oftBvNjWMaVem6TXk89iGMFObutd?=
 =?us-ascii?Q?0koIGq/rvg1zqWz3B3CTr9aqWqd43bfEzWhZu7JAku1T6thE22k2fbghbDap?=
 =?us-ascii?Q?LnX/UNt7/MwlEQMhNITwXvm7IQXEBt3rJG+UzKiAAEyxhvZ9SW8e3MYmbJpS?=
 =?us-ascii?Q?cNbO+swpJhKs+ioroTFKveCcMyno83l4eukAqTDXwKia8iT8w8yXu2YQFClT?=
 =?us-ascii?Q?6gMKxZ10p70ZAK1liRPNrDjIQokaA9V1pNw5eG9IsFALH7SKlc8IZtvtEK5D?=
 =?us-ascii?Q?XtNX5ekmWqttTeKC9wDjntN1XDdXYeCBf4zTt6t8cdY/WBqN42RjuVimbKVK?=
 =?us-ascii?Q?NPjbJOwuakPSToilUwRiCSyG30WvAH3kC5Coox5c1RaH6T7fE+xZDgTVPUgx?=
 =?us-ascii?Q?qpK1PtLl3m4OukdgC3tCPqS7cn/I4gvK5oP3?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?L5c4/8f3OycHm2qbCMIv/InwY5tWvRVMKh4rMHM7XKydNUkaehjHGal9Fh1N?=
 =?us-ascii?Q?bSNZOQvK2xm7VtBehKx/RGHxJxuKjAg38nsZ1ogw15lYPekNn5Tr5/SWHt8s?=
 =?us-ascii?Q?jV6uqd4hEQr8csLwll+n/1/h2wm5K5mtz8OE7Mu1BjBzZx+X8tS8O9PnFz38?=
 =?us-ascii?Q?RtjkQVldi08RDPCo8Tvgqg08/sbtQhi2KBgUipaJlHNz9zjvNFn5vRtUVrmy?=
 =?us-ascii?Q?02GPeTgVQazZwyQ4lL/BN7a+MVcxGtN78wZQX4tjUQPKxBX19Jr9rnTzTw/A?=
 =?us-ascii?Q?1ZmfD18QqTK72X/ygVHiyNair4Y14KM9sHzPZBWoemqb5ria6HrJof9fFwdp?=
 =?us-ascii?Q?EV1aSZ6zgqE0VYpiynPsrM4fKURL4RUYBwoHok1kfegtmDmK2FFWkzR5f27e?=
 =?us-ascii?Q?3DW0gcbg1CW7ssNh0o6yAY+fV7wuWIS5CkOlhSI2xVkFQ82VsIpNqk7Qw5l7?=
 =?us-ascii?Q?aGutIwqVm4GUPSGB+k2o44N+G0/An48+yuFRtBhRQE9dzdK4pujIFR74Euqw?=
 =?us-ascii?Q?8566FYsJxuRxGNOK9GbqEjgoI04n9jCMsbbMduWYKBS9Aq0Q2pVV6tesJeEY?=
 =?us-ascii?Q?d3dNAK0e0CluMWJrIOQoUlC8rEcqYMzQ+q+mMvV+aDkhJd0kHkAvgLQ7DUtj?=
 =?us-ascii?Q?HC726e7uu4Hc8awWOgmTVpzyxR1A4LzOm2t9+4sxoQ6qkM2gl9kLDloZmuc4?=
 =?us-ascii?Q?SIdw3PUfzOBd3vA99JpYL6YNyzIsDnmlKyvp2ZKnh9/ILWFlOkiMqfjUD/Oi?=
 =?us-ascii?Q?c+bjSgxPC9xmKu+z79dflBDwvc2ZDBSplSNIri6JqoFMW/GJLKDCg3Hcreoi?=
 =?us-ascii?Q?LeNzp/zzPba9vUj/Wuxqc0XzIN1NMOEJSXu7u4v9jFM6RQVf4LZ04nNCVjuM?=
 =?us-ascii?Q?1Cqo4t0GcQCBEOsA+2c1uZ+S7+ELaBIwsFOIhgBK5xe/+5nb8wrfH5w1m1VP?=
 =?us-ascii?Q?4I/EGjp5aS/fVYoOq+oXlHAg0v9EbqSHIC21VpjZmy9p1WjCe6Gx4samcxAz?=
 =?us-ascii?Q?+Z8PgWwZsyXttpLE4SNvuRwpFlHENGx3EckE4SSkMZv0unxPJqTNMYd7mY6A?=
 =?us-ascii?Q?NhD6valrqvoSMkTfksbwbJf2IKOdDedfHPl90ILgJwBszPS+MGzzaqj9YUx3?=
 =?us-ascii?Q?NZWSEFBb9nQ+9rgIlrjWBObqYSJQFdz618qiqXVhUfh3QVZdGN5fM71Io7Zm?=
 =?us-ascii?Q?PZgST6eq3uRlPOGGXo5PezWGzp9wYRtScYmJ/uJGkypT5jibl6EyfSbU1ROj?=
 =?us-ascii?Q?Tr7G0g4ltcPaADfAq8PCCAZKchKLYcJM9srQJgIWbFXAnLrAHvbc3vtVcges?=
 =?us-ascii?Q?YBE1UbAzW2qUClIvYyYbBZPtdvgZ+dEdrJRGacO5TbwnULv1FPvMkOE1YE8h?=
 =?us-ascii?Q?/dhshbreU2pfVPw/+7ERKmPo9LpAklyQOzidf0ynALMTk5IHeuZHxar0ijs3?=
 =?us-ascii?Q?Vp+K3FC8dLWcZh18SeLDIaCimzmkqyGjj0TDkVEOk5j1Syuur0LyNXDQ444M?=
 =?us-ascii?Q?y23JXUbvAMpL7RHRMMfNYleOViGM0pzZV0eSUwhe70waMnC3p86kUNr/p3eh?=
 =?us-ascii?Q?RD62CpyvWU7HB5kFa/NPPMKWTDYa3bknwQIUEZLxJVwB67IpfLr26NPu1mDL?=
 =?us-ascii?Q?yqhytLhT19xWkVuS1H6ERGc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da927d14-ec72-481f-efa7-08de0ad98217
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:24:04.0806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AV3ubLDJh655Z0O2xwxdBhVC7K1uI6kOoY5QdEr4wiPcTiBSDqrX6zKlz/pgCWglXCJ5uBMpN06pd4PK8IyWmAbuG3AsZsTzMy9Gq7VYbqaHaSN77UjUjAUMbriuyOHm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8810

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
 sound/soc/codecs/rt9123.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/rt9123.c b/sound/soc/codecs/rt9123.c
index b162824526d6b..84fd3d6861de7 100644
--- a/sound/soc/codecs/rt9123.c
+++ b/sound/soc/codecs/rt9123.c
@@ -107,7 +107,7 @@ static const struct soc_enum rt9123_i2sch_select_enum =
 
 static int rt9123_kcontrol_name_comp(struct snd_kcontrol *kcontrol, const char *s)
 {
-	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
 	const char *kctlname = kcontrol->id.name;
 
 	if (comp && comp->name_prefix)
@@ -118,7 +118,7 @@ static int rt9123_kcontrol_name_comp(struct snd_kcontrol *kcontrol, const char *
 
 static int rt9123_xhandler_get(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
 	struct device *dev = comp->dev;
 	int ret;
 
@@ -145,7 +145,7 @@ static int rt9123_xhandler_get(struct snd_kcontrol *kcontrol, struct snd_ctl_ele
 
 static int rt9123_xhandler_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
 	struct device *dev = comp->dev;
 	int ret;
 
-- 
2.43.0

