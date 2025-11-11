Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011069.outbound.protection.outlook.com [52.101.125.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C47207A32
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821063; cv=fail; b=Bu7m/FhcmyUMRHfgJyDN8NzkDlr/FwwFhwMfme/QiM9dkGG6kVEdRk6XgO8hA/AMxDtzGXlFDBSI0IwukkijyCoY+QTU9yhvbKuZ5llwPuhsNBiZGkVkUYpa7kY3tL5ngTtULpeA7bWNAF8Y27x5m/hiQX/Cq+zwhrMtmetQ4QQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821063; c=relaxed/simple;
	bh=h8odgePMdh+FsaYcjgJ/lBPImvj66lK1rK010jMm/9o=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=pjVYMt5H4u6frLRgAkuQhOZwX3965pNILMlj+1wThJ4pUJbdMsmU5wBU8bS17NMPJEMc9oEToNF0BTCiz58HaVhMhtLagF6DC+az1EdsGl0EE2WLvVSOSLEOLahxxdXb41F1YwZH++ackxhrghISXNI7ONUTd4Z69yejGDDUJYs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=CCoh/gtA; arc=fail smtp.client-ip=52.101.125.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="CCoh/gtA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Izp+4hvKtCf2kP7Lnd43ZGS15gOM5FXsxtuqleDfD2+H5ihY4tC8RwA5Nza7mrKIvae/5w+qVULIuk34J1ZHeuI7MbxobZ+Lc5n8T0PXfSlz0iBPMtAidWphCx84w9+0aX6p0xt/IZGtmlWDxU/Lb+VpEpaOAR/TDmgawuRl8SFiffFac1icrxmpIsZI4HQrHMSaeVSggxIKaKUKr6+9SOzKib14eO0QMbEiePAtT+acsrmsc2W5+K3HKW9ACEuGnFfyfU3smsa0EME9b3FNRCDBhQxa+8F5/XMvcvEo8lH5dEd8eFjNxtnlfuwXcWp10GtM7llRr6J+lDtYn5UwcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T5ODeTQiDpXkgO2p8oFpq1CW1yMuDJn34gNpkPp+07I=;
 b=E5+UtL1qgT2rx71S8uDGvfaGYzYzYDrPNEOUR8DFLIREsDgpNdMH4/AuaeY7qVIB1aoM9iWr+9EwrKcpVliJ//QjB+Vik43V9gEdpoRBCGu+oXhx8LAAEthYyS9TcdYpxdRjwOj2RhuvpfX64J2UFW1TLhygNBkvKsXoNkVHJYRWSZmaEmI8YvGCyVvEvzKQ3t0dd3qekuXlK8AmG6mFgLuXnDqi9eJvInb+wTVyy/4+INOTqGngUURPhCjMCR4bBROIqUrfIHBFXKbhjtuMqYNsKV80NrWsuOBFiStcL5/H5Zjc8AgPHz7SyvaTn86gkfrrAhZL6av5Of+2t3jCbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T5ODeTQiDpXkgO2p8oFpq1CW1yMuDJn34gNpkPp+07I=;
 b=CCoh/gtAEptsGkRKszvcpVU+KizGV072X48k6Q9SMVJHzJbmL01fXKK6aq4zB9FDnOhlovmBSwR8tiWXRECGeDy3ugaPp16uzfKUoeA58+6Tsnd+IcpDqDfMCCitX9lYocLP60VmkZRAXpiKuMeB7bIj7hB+DmGri5fkLrwLjtQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB16440.jpnprd01.prod.outlook.com
 (2603:1096:405:147::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.11; Tue, 11 Nov
 2025 00:31:00 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:31:00 +0000
Message-ID: <87fralxvej.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 197/292] ASoC: generic: audio-graph-card: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:31:00 +0000
X-ClientProxiedBy: TYCP286CA0064.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB16440:EE_
X-MS-Office365-Filtering-Correlation-Id: 301f18b5-ab49-45cf-87d1-08de20b996fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XPm3Vq/g2WVmeRZEpfZz9DfELNibg+JWcrwh6JWAt8XMPFvLBDwkloIDINjB?=
 =?us-ascii?Q?Io6VruiXzbTSbgf1C78G8cdKDTu9ywWjJeiY80NHk4XCcM/SP9eMss48Qhhn?=
 =?us-ascii?Q?Qo5NkpwnMmrRrqyZyaKJeaJ1bXrgjzYCtV3Vmt++yhYyNqGZdx4x6hqG83G7?=
 =?us-ascii?Q?uWynhRv4s5tqlWzgiSx7K7DSHWwj1qDdqKdJraBDmlRagYXwM8y/bRMJmSMF?=
 =?us-ascii?Q?aOlGm+tPwTK95R5rdrPbNvfRWfsyxM0i3QKstN170Z8hgr+Xybb7SEmC67Fi?=
 =?us-ascii?Q?AA4p4CQC1spZhfenCc6/SopnpOPEVs+Q+xbqP9Qqy148M8A0pHx9mnam+cS9?=
 =?us-ascii?Q?aohkpMoORMsRPxkEYKzJf9o1agaBHqO+3DK53mUZeO3sKO/WYf4VMMeBY9XA?=
 =?us-ascii?Q?pFy4VbtRuRN4oPr6qbY5Irt3k+/hCLfOovuV2TdX6KGur7f6KTt7AS1sWSxs?=
 =?us-ascii?Q?mnA4oKHuRwqXrR5BrBPlul+9oYV9Ix3Mj1dE2XQgpphDBCQxZs+TPeRvNT5A?=
 =?us-ascii?Q?mK/fq56LBkVRYVtYnMV9ii/vJaxurRb0xnFSz0yk15EV5cLUQO2sSAKDbn03?=
 =?us-ascii?Q?/q0sjnR8BkkPmD/g2oqDWX6BQC+nUvIkDBvZ/GhknMuiYeCq4cKYmRZC9JRl?=
 =?us-ascii?Q?nELxdbJOqMUluZ1Fc4HkM0A3rF9e7GLuA8JxHKuq6Rz3P29+6xEgIWb2JjD+?=
 =?us-ascii?Q?gM0JaVWQm8yoQ1X7RFtbYYGM0yyv1WtR8EbwwV3gBpmQfzgHkhgReybV9FHb?=
 =?us-ascii?Q?2+6NfSJ6hYop6FDHiitI0fNpVecWvgOWEh4mIbrWHsiOyFa0PlHGzGR4gkio?=
 =?us-ascii?Q?jsXWEfPC2qakjvneJO0eVCw3IHC7W1u3FG4tBhTv+SwHocnGz1JY+X9TjAb/?=
 =?us-ascii?Q?nzjV4T7YmbRyoOrxFQHnLMJ8UoDE9FmVb/GYRKQmgQP763s7FutrLqXGCg8t?=
 =?us-ascii?Q?21yQh5//C/LqDLVNkSUA+tDBkuHEVpSEoydkQFRNI/plqwUt+akl5cGAo7af?=
 =?us-ascii?Q?G4ijhAqLtqoN1mAgUFZJ+5epJ9cxUdsZDB9ZfCLAy9ofued0Y+LAdnUZ90k7?=
 =?us-ascii?Q?G2ajncbqhRIKxTRh3Kt2Erqneissv5ImxXQvHHNDPqSt5MrV095ByPLqyDX3?=
 =?us-ascii?Q?ap7QI/f45nfRIP+5mbf7qirvMqN8lu75wJSsPUguqTRk1YvehdsOLDP7/SBT?=
 =?us-ascii?Q?wbH2p+gQbVoadPE6UplV+vG4YaGphzun5rjwBFWc6iGizuIOiN6sZ48CFy79?=
 =?us-ascii?Q?WlM+wmhbQaf3PhXSZe7kNXRUM+e6iDkaDIh3pwHkweVQR3S04brRdppJb345?=
 =?us-ascii?Q?pld20w0KtQUQ2E1UX81vaUWdYfbLASUqPgiezrHx0DuQ6zkJL14Rd6IsTz0O?=
 =?us-ascii?Q?ErWBfSIt5LpQXQk1lmkRngnm5X24kRo5kkU2gM5xPbt/OBF2HjCSF2HiZKnw?=
 =?us-ascii?Q?XJuKi4jx+tZFx5rIZAxcip56iMXiJfHWhIzEl4rg6K2DB3ZzIq02y5pXvsd9?=
 =?us-ascii?Q?RMHK4oJjNZdYDkx9TyyfOqiiDS0OfZ/9sZ1Q?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VwNL3Sb7GXSR8ptPToQxI2g7LIGLUONxhF5dx2JB4jU3tyZO2WchVRGQKomK?=
 =?us-ascii?Q?6S3Y0mpm1oxpkO6FJzf5tbFTh+vs95FXum2SLIref9+5dXrS1OyWRaVIi67C?=
 =?us-ascii?Q?AFpy1x5wod1DOUJT58xliGOB52lz/8GIkzY4h+EqcdFfIi3v+bo18XBW8Z2a?=
 =?us-ascii?Q?pxcZfBxhTQmpfWAwBw3pcX3kGGK5eib28kh6wnqq92A8iY+L8j46kBptxzX1?=
 =?us-ascii?Q?UDyjUyMO2i8EDwzdKS1MXDjFTBRz4Cuf5jsN3LqrqwR7vMnDyyRvshPDXXXn?=
 =?us-ascii?Q?j+m/ShyS77EAcWwWMw/vxtSa0ZugFoCuR/OySnIqUxwpM3P3U9zl7YFA+Tdn?=
 =?us-ascii?Q?wPDZWYuB7RRF6BeKydTBQS/03DDEPcP59kgVuV/oARd6WuHuNFHPAPeCbhsZ?=
 =?us-ascii?Q?GK2MLPkek6TiwA9aUAI20ee41suf9C23YdynK8VNvG5+FdyYnSRIQk9h3JRp?=
 =?us-ascii?Q?lbdJZXc3Hqm/qrEiGKc4vHO+GMlNkbsvc+eqtrPyQtrTrosz9c8afKoQyksg?=
 =?us-ascii?Q?+HP1KTmmFeg6pQQQ+rp0XiIMHTDQhimbVAk38+yL9WyzHdl5rXAN7jNv2aUX?=
 =?us-ascii?Q?H3b6k0we0jW1vBRmlCwJd9eEFadzIrQCKKjlrgqhgcaFHwpNNsmbP1nPIOxl?=
 =?us-ascii?Q?8KlSZLfWn2vJZbrpX9DjRv6Jt3BUplivzQkfKFxaiAnTrrG4iDh922BkYREm?=
 =?us-ascii?Q?h2UBWNjeKr6AwQcx92xN3qAqHsfSFxlcKqzfKkFskBxzOwhFbhR0DcJXkwzz?=
 =?us-ascii?Q?yayXQlQ7IC3V2Bdrv9oab2Bg5X2f/+t0XDQ/ntN1G/jVnS0++ETmIV3ksS9F?=
 =?us-ascii?Q?v6/5wrTomAaQ+QWI1vHqfASNpJd7MTqmiIFff867k+Rb8qJesKCvZJTZkQTa?=
 =?us-ascii?Q?N6vt7hDgNeAMurnskzeLa1VTbLkEM/WG917zhhU6AxeEGSGI1cc2/Ozvb8lk?=
 =?us-ascii?Q?RwuFKNdDQYczPbWKcsMVQ4Q/+L4iSBsvlFsfW+31e+NHQagnqDslHu82ULIR?=
 =?us-ascii?Q?fwTxC2yeFrMT9LQ0r3Xyq/aY/NcUHtcr35scigvKNxgNzk7WKAUSaAiT+qW0?=
 =?us-ascii?Q?3p8SM6KYbXaU7cEkO/ztxOb2HmDZyOASl88JkknoPVKMdvU1G2aO+N+QPS7H?=
 =?us-ascii?Q?DL4nVOfkz+dtDMxQ7hJT5soFj8qEyrX6Y7LXbjHLTwYZxKiKmpcowDmnwGAV?=
 =?us-ascii?Q?eOjWByHOXENfpmBbIURq2g6aoTrryQd2Vv6tFouhhDrKYxYhjwxgJa53IyGO?=
 =?us-ascii?Q?ZSAliBYiUr3Sd2eZUTLM/2i43Uut5ktFlHcqg1NanXOIHk9z8KDB88VOQGPU?=
 =?us-ascii?Q?QdZGu/QXX87jAz5CWHkBj/P8C6EV1nbzwu6kU4qAWNbeky90bnLGCNWRKO1b?=
 =?us-ascii?Q?bJ7X8cYa6PT6Rw0/qf7tHJOYV+GGL0PI+JtmsRdMv5JN04JEK3a/p2dVVHUT?=
 =?us-ascii?Q?d40+dAxPYGpJhFu5mcJ25Jwe1aszUI5zFBaBKWHK08BgIDWaxVLoNEwyucES?=
 =?us-ascii?Q?gV5lOkdpjaj8v9Q4IjXd9J+2vFYxnhXA27cTbSFQPp7l0+Zb+nhcn1XXS3NW?=
 =?us-ascii?Q?qMAwvZl9AIWwhai9T3bjIMffPirJPxw2XvG72EX45vMoVNVZOJrxuC4ijWDT?=
 =?us-ascii?Q?Y7BLb6tp8IqN1q9CWNByjQU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 301f18b5-ab49-45cf-87d1-08de20b996fd
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:31:00.8440
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IcpRMVdNfK6SYARAztaTlxP3WeDRZiZL2kTdI75MVLoEiWUrE6hhli2hSoRFC/b8JqoRLxj56hnhHeeHALYzWEK7VMF2md3OzLmwKsByiaZCDfD0NExUL6rLFbFS/c6U
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
 sound/soc/generic/audio-graph-card.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index a8a3bad3df00d..7720cf1fd6e19 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -43,8 +43,8 @@ static int graph_outdrv_event(struct snd_soc_dapm_widget *w,
 			      struct snd_kcontrol *kcontrol,
 			      int event)
 {
-	struct snd_soc_dapm_context *dapm = w->dapm;
-	struct simple_util_priv *priv = snd_soc_card_get_drvdata(dapm->card);
+	struct snd_soc_card *card = snd_soc_dapm_to_card(w->dapm);
+	struct simple_util_priv *priv = snd_soc_card_get_drvdata(card);
 
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
-- 
2.43.0

