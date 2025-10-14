Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010037.outbound.protection.outlook.com [52.101.228.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80BE9309F0D
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415866; cv=fail; b=ouLHMRkFhZ3zZ1aucqdhoZF8SZy//PE56SKcpMNSYsXyDM9wHGNlMOIu8NtM5Sp3+GT+dXi7CrAESa4EKn0Hf4EhNL3UKjZ5/PFZo3PJTu71BbzTutKX7q4AxYX5tNQ7UuHs/cDLZnbW8TUBXzSljjzQPumQLKVudHDYMBuoO6M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415866; c=relaxed/simple;
	bh=o19HTEUK8D0FjgGFFHJfWPzqrOuLwklq66rZlNclbos=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ogEM9sTLGetdsFlM5BPrNLoaqzr1GXLcEBLf/f48sz2aXHHmWZY0re0xSEGvH30yCHH4K6kdZXlSsvwkvFdM+xU+ok5PKuaXt6fU1+0KeadXVqsqevBlt+IeDgg3LUGu9jFGPMjOl0DggSaoDEqyBMVkjlZ6/1tMnA7aF9r3NrI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=FptuQhKK; arc=fail smtp.client-ip=52.101.228.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="FptuQhKK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yh9wm2jp+ZeSWryRbx+A3faMNhJ3k5ntXzvRyAWnDA7RuTC9C+Uo3N2qFoGD3f32hwVe1bLJj6p01fvT0iiIv7VssaTT/fu+hWiY3B3QIJrUAfA/HWUYdiUud8LbryrwICYBBonZtJFAMQ0Pltmar6N0CXpzU+ZM0ntkYKDmnouV7l3ZEFVX+YyM8O1m7PUqedubEbL/tqjXBZsqbb8HkXm3ITWxeiDDlf8qmaswKa8B36PMJP1Wqai94ar22RJ7TIsL3RSZklNi+PYsh+MbPPDwofS+Qw60JUJl8r+8CwW6yPdtTrJ7By06xAu/z1ukZsZ0oOVyQfzZXuhjhq+mBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=goikrC4LpBCr8UPaqQNbk4ooGfF0uPDejX9QKJKGnGQ=;
 b=IKEWdWEShg4yA8Ss6F7x69XX/QqHEx/cnIvdnTIEJeV+10rKV0HGnYBpkDz4fVdGtYv7lxgKAxvjl40jNCTD19v3BU5mFZeWuLxJ0X5WkZCugZFehPXhoTZtBiro0IN41OexchGPf6Lq2ow7ilEMMDQvJEdsDa4eJEHth0CjbZ/84DixGF6p7PaH29riMH9NIph/5hZ+2MidEcFmXd+HV9LEFWD7IiyufI37u7+kK58TWcTXXLWjA6VzRTsj4VKhZstwpNQ1Crgnb68hrgl3aZQFqnH+mPoPUfx/PMO+QJZ597Jet2NUaiqXI7KZudkIiHXyPam0LUpoummVlqQeVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=goikrC4LpBCr8UPaqQNbk4ooGfF0uPDejX9QKJKGnGQ=;
 b=FptuQhKKjaF9XYi5fB8ZwfwrfulF7mgqYLD/wBlH9S8hOsKrMZEE42pDorJKUuQeXsgcsOnDB6vIoBbgLKGRtujwnHLhD9m0iVjQ0WK2tiXqGO07xHEXL7PHXdcq69tlTgLRTex83WE2iniWHPSCbXyeUJ3qmdHDj+QvwbYJRuU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9449.jpnprd01.prod.outlook.com
 (2603:1096:400:199::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:24:22 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:24:22 +0000
Message-ID: <87qzv6p0ui.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 078/139] ASoC: codecs: sta350: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:24:22 +0000
X-ClientProxiedBy: TYCP286CA0358.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9449:EE_
X-MS-Office365-Filtering-Correlation-Id: 529ad484-1f82-4274-7dab-08de0ad98cf0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pW3ia1vVnV6iT0jETQVbEnBrF57YflzfRcMXPNSzCMQziR1Y7AI5+BDnhl0b?=
 =?us-ascii?Q?UW+Yj3ZEvRjGz2MdscMSFq10VScbEGy2S1P+luu4J7WgZWqlIiT3oHQ5gLa3?=
 =?us-ascii?Q?e29zMur+lhf48Zjx9boAZWNt/cfDvOrQIIlryFsAGANN9bDCTkSPSszbG19l?=
 =?us-ascii?Q?b9j2xBCZu955TGXsp3afgLPpK5Xfrmsf9MiiyxSZGsWrE1FOdm4SRKpbGwrN?=
 =?us-ascii?Q?yKmEds7f33eELND1mxbBtpRP5cnZeNVq1QA0WKkrKW5PwVhGwxox6mAWNXbm?=
 =?us-ascii?Q?KYEcbImnQ/8akF4wA39Q9m1Ueyj5sZB1P62qzFMpG5HLMYZ6gB77/QaindjS?=
 =?us-ascii?Q?nfQLef2lYA4yTqsGCQwNS2OFZEskYy89edQ0vPM3UNcIFoGGNcNBI/HuVk5m?=
 =?us-ascii?Q?3BuaJz5K+3sPSvGMh9yqZ3fNxQTQxpoNEtsfDTDWZ55yTCElljHc2IkjResC?=
 =?us-ascii?Q?TPeQUUqqWDa37SDCA4ityUXoIecwdm7emySQmZQpXLMwWb1vVsk8Yrj1We4w?=
 =?us-ascii?Q?P7ML/6ej5bh/RpEgA+kMESf7qzgAY3zFkgzBkcpVgQi1g1JxTBqHezT27hia?=
 =?us-ascii?Q?v0iTqflU+NNoArRU7ufNgESJKA5QKnOHTZslZvaYLylQK7WfOEx9V8Rv0Q7o?=
 =?us-ascii?Q?iH7PbpYRfX3q38MBzlQSgsoCTZzfZsz+J9DuuIuh3ysUloeUliL5dTFyJGRU?=
 =?us-ascii?Q?T1RVWjaqGAiGZjiAEPIalbwz8Nw/DZS0pHda5aIpjT3mwtgv+Of5jOZEt/gr?=
 =?us-ascii?Q?gn3eEAB7HYTImvBp8cqeD2jIrFGldksatob4Xz2zVHcxAnhxFsl4C3jIMso4?=
 =?us-ascii?Q?9dA6IzRBnamwpgIbnp2GAza0dfThNL+b8JA7YEbaJhpugUqlMfyOZIF9IJOn?=
 =?us-ascii?Q?GPAgo5Ho7ekAamM/6NN0bVj/gGybbI9gKlQxh86evEUpmHAlKj4yo4zMZrvv?=
 =?us-ascii?Q?nBwnVww4RrS7FHiepGll7blH5u9FW4kqE4jitasToNKBbc7IGrpdUujMHdwm?=
 =?us-ascii?Q?L4sVkFFgL1/HqhtUj8Q1NVyfjl/NPDsPP8oxUK7vfodPFjbNcVvpJYGz6UPS?=
 =?us-ascii?Q?6Q4+D+4RBJ87A9TsBeSJUDxRznGD1oq/794uOQ+PT3vbfhZktXDmC/4OYc/y?=
 =?us-ascii?Q?GWz14TBMYhgYg2NdJ8NAi8Kf7fO7Yxx31olNaoPMqyOCL1Olox6XKO6vtGSj?=
 =?us-ascii?Q?VvGlQnEAF+a7e5J4idwRRDDz6q+pT5Mh9wbyWogntuXupvTRLXPYm5exc5ML?=
 =?us-ascii?Q?FyBaIPY3cq4pVwTgjLR4FP2k6CYvFNQVbULLPhxPZPSggko5rg3VPTkW5Luw?=
 =?us-ascii?Q?igVxqhDvgqNbgJHsteENrjPFNpyLqqtXsfqcL7qcdvo8GNa/pxjnwuKNNwoj?=
 =?us-ascii?Q?HSO65Mg3bAmADqxpxVNKm3QRsH5C/36lwAim6rV0K0bqeqlFjayt/O6UCLRR?=
 =?us-ascii?Q?Y7ZtEk17P5C9SBA+RVmXr+qXHwx5jFBqcPxUDbPMQXO6lGFpghdw9p6NxdT4?=
 =?us-ascii?Q?4Wbuf2FYD5ApOwBXl94zsthuP8rPdk8bXXUV?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?762Z1OEnWKV84m9CRpO5ANGa22SF3wK3Ujonzj4UuW1HRuqvjlNwPjD+gV/U?=
 =?us-ascii?Q?vZABC1tUWgou72FN0RJObT/CrT9yS/d7FwYLVnLdK399WqZo7FcF42HiLTD4?=
 =?us-ascii?Q?aszQqER2QlvxguXsQFHp1u/x1Cz4k06RCjhl6gbNBNAhdumjGzjfDOSZcbnk?=
 =?us-ascii?Q?6yoy4hX4+bmj8/Af+cEcJTolQqo3Giz/rTBxFTKVq41eotfu1RyJqcW2FEFG?=
 =?us-ascii?Q?bCgSybY5/U1FFOPh1WfEH0sNoWRo7KEqzUTTYIMqiLIFvcHMy7mGyfkI1uiO?=
 =?us-ascii?Q?pnsH9WgcOZY6UQEKkAxUzAEfrmyDXNqQHOxeAB+9FiiD9lAhBnIGN5cJ1WcL?=
 =?us-ascii?Q?BWA3RReqstk95SI9aOOO8zc0kNVl1CAJmOcUhFUfiuw9sBex4C4jbyD2zTsz?=
 =?us-ascii?Q?TF8+ZrFw2HfB+ZJgLkR54PRC2FGQcn3d4+Y1vyumHypqf/6eUFhutBzwj8UI?=
 =?us-ascii?Q?qnE8y34Jn4MwOsGFxa9VFdKnZ0uKtI8ACT25MpheeOvPtwioaO5h8v3HJWBt?=
 =?us-ascii?Q?lh1lTEpysUaMdjXIj5Z3VZDQlFkamt89YKiYipYNUDo2aekVtvchG0iLqNyg?=
 =?us-ascii?Q?/nqxK+fmgPdYAAA/HbKxnS7TGgrmvPsvCFKA4F3/uj3q/XVCg6R+76dEuZVy?=
 =?us-ascii?Q?iTgAMlJqhy3xkXrjH3n5Bjsc6l8P8IIAvaZKxffEfZ+u3QUy+dPws45YefCh?=
 =?us-ascii?Q?8y1Y7a8EQuOQ3WKbPmE6GhPWhfrbO1irfMMJ1rMxz4pD+GSud7InKfvkyV7n?=
 =?us-ascii?Q?dBg3q1x4XWz/OWWQyQFrSbrcMofG8IjZhrvt3ARtTTlVzifqjdnnPI6Uo9s0?=
 =?us-ascii?Q?hmt0u/nCf5WDuoEJVJrV+7VyabGJ1BW06DEmpsOfTi7pebksqh0Kd13ZIncs?=
 =?us-ascii?Q?vW5YTM35rQvJxrt/P+xGOReqVendNM2Z8z8f8TYTd1IC6MY9WbsxEvSs2gRW?=
 =?us-ascii?Q?0WM073EFGQtdoPCJaNwIJ5jbLfeD9v7IsQI/dKW2WcmkuAbh3fLbfDyxr11W?=
 =?us-ascii?Q?M9bVWHcBHrFY87zg8BJ+xJSD0uWL6epQ6cZfz+uCQVHjTCpT0xHuCvXRatjr?=
 =?us-ascii?Q?TEjVjYURO8JVGBU4cQHqupDc7/yM5Xqk4dSV/iGf4n6ejkNZSL1qc+bVBxD/?=
 =?us-ascii?Q?PHXDacrhwLTwEMCSdPE/fEJ7VdzNnwLzr/o6pD6fsziB8xKz5tvFvsBmsuT3?=
 =?us-ascii?Q?s2xM+xps/QuAudARVkoA2PRAyLnVpRSnxC8vQNjiQtqqKGT2G8AMyQ9rFbLW?=
 =?us-ascii?Q?cRwJ51UWosfLgmS+U84J8TCUl4J7PuJIOox/r6Epylled8GHfQcdMj0xoo1P?=
 =?us-ascii?Q?l8Fv2JhBJo0lv/+mow6Ur1o92i2iuD2Bi4+D+DK7w7I3v1VVpcAyQ32wctou?=
 =?us-ascii?Q?TdCH1z0NJp4UGHt8r6UrA+nwYZG5BprmCU3C3Mi2llobuIEBZVKHAP9KLEYG?=
 =?us-ascii?Q?p3c/zcPBOJ1VAjeJ1Dao9iwOUaXVlbiZJLTu6uNLuoeF3/aPTj56w6m74RaB?=
 =?us-ascii?Q?jRqr16SdbZ6r2aJD43i34P4VkY1kldLnZhDMG+HODVSzchUwbLspVPoHK8g5?=
 =?us-ascii?Q?gbw7kuuXKiTTfpvS2eoSLjDiQgav/Y5QsdsGkH5o/Mp74UmP4QX0MCORZufY?=
 =?us-ascii?Q?RD4MZHhEA8uZacZA9x5z8LQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 529ad484-1f82-4274-7dab-08de0ad98cf0
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:24:22.3408
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iAg20eYQJlBoJQXpOwLNhfZrw/7hkPvKo+S7cw/oh+4+WFemLG/tUlvYUwmAs2mPWWvjSd/DYRFC3hNjsbdg/FLmmQ60uth4faqBNX8s231zz569RRq1HWC4DqUdAorA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9449

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
 sound/soc/codecs/sta350.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/sta350.c b/sound/soc/codecs/sta350.c
index d1450de926524..29bdfa662ebd8 100644
--- a/sound/soc/codecs/sta350.c
+++ b/sound/soc/codecs/sta350.c
@@ -301,7 +301,7 @@ static int sta350_coefficient_info(struct snd_kcontrol *kcontrol,
 static int sta350_coefficient_get(struct snd_kcontrol *kcontrol,
 				  struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct sta350_priv *sta350 = snd_soc_component_get_drvdata(component);
 	int numcoef = kcontrol->private_value >> 16;
 	int index = kcontrol->private_value & 0xffff;
@@ -343,7 +343,7 @@ static int sta350_coefficient_get(struct snd_kcontrol *kcontrol,
 static int sta350_coefficient_put(struct snd_kcontrol *kcontrol,
 				  struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct sta350_priv *sta350 = snd_soc_component_get_drvdata(component);
 	int numcoef = kcontrol->private_value >> 16;
 	int index = kcontrol->private_value & 0xffff;
-- 
2.43.0

