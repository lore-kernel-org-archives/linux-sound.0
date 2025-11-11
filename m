Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010028.outbound.protection.outlook.com [52.101.228.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED9C222568
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821220; cv=fail; b=q8DVm4OvVtqCFhs6RoImrS8QRMNTF5hYRH+fcohbxbOZkT2oRVWO3DD7tw3Q9CFafCAfYgIPPIEVymyOh7Fk7YExpmeJOKxkzUM/eRR6o4cJgCrvOsmRzRQvlu1KjgeeilLZfPuEYSrJskY1qSHDfosUH6ee4v9rTuSAE9+EY4Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821220; c=relaxed/simple;
	bh=mrYW+MPkuz+7Zu8EP5ZhqGkeBuZft93mmtMwbgM35D4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=OsxezxkLIjMIecJB/0HMInJLn2JX1Ypd6SIi67LoHFPmdf8TweNPyu/L5exScp7twBffA8no4AqqPbC7u+gWu0ud4WaKp//w7C0ErMKGa8UQ4j/tALnaW8YZIucXjF26cjTkXI1D0OlTF69iyJAo1qP42Q8ij5kGMxsclquRH6U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=RGoEsPqW; arc=fail smtp.client-ip=52.101.228.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="RGoEsPqW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CvOKFu2coYu3wsDCuJVzDjjW3JgKK5QddN2FdQvLS6PlgJj3z3cEy1jsmRYQ92eRM4VedDLOIGN4y5ytYdH+l3UMZD8e0JkljgJPT9i93400t9jn7LcyZkebwz/+XCvUvmjdlcCXo2kQZLz1wDrkSxIOatYB4BDkViWNHS4MuK9pQeCx780kWpM7IUJ7IxjDFj4SqvTZepThPZ+P47zMJqdnp17ub9MIsFIxZQclGPwxn+FCCwEqAslwJzs2Rft3zhujgGsiAHCjFbOOXwzFXf/31rCaP8V+61C3T97jgF1cwj6AiyK+jM0OMKGbwetJoZTTrcSnzhejGtD5tsDPTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZUaEhdSoptV661QOJnbbCr8Qcd3r+mklHQ0aV/gte/k=;
 b=Fr0Fu/tLk/JmktHhLP3hUas5i0isFR2Qtpie23X/6n5Znmk3KRbz3YEv/Y4SJGXGh5gJ0CeEwoH3ZnK8NvXjUhFe5oXRppbOz9HMJfMXPXbjnTEYKdL2XwpiM7haM0CWyElPYBqU8EOrn8pneJ5dtcMs53KfyJFbs+Vg87sAbmXZseCPZIcV5xxxLQ9ylMcWfe6g5SGMHrw4zEbisFA6D6zZNkVA2IbtiGmpyOxnH11aXcwucK9k6R6FRGsiMVDm0LqiImGFag2CYqKDF1tuNgbb+luEbsIAl9sJGj23KOClSfKT1mF/kg13QKxdQqCb7+E+8Vq0IsEk4SBmpVEAgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZUaEhdSoptV661QOJnbbCr8Qcd3r+mklHQ0aV/gte/k=;
 b=RGoEsPqWB7wq+MyzaQ7z5XaTCalV9AU/bIHBDaropsexDX8F2THRZUUk3Uh+2OKfnL+lmX/7K87nye/KutVtxVvlhoK60ebRKzVlSbeUqdNDq9krHxH1ReKBqt0nTm+GkVPn1k9NrS4QWmoMvtP8tfnE37qLojT1DSFsGKOuzrE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB7149.jpnprd01.prod.outlook.com
 (2603:1096:604:137::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:33:36 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:33:36 +0000
Message-ID: <875xbhwgps.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 229/292] ASoC: mediatek: mt8186-mt6366: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:33:35 +0000
X-ClientProxiedBy: TYCP286CA0129.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB7149:EE_
X-MS-Office365-Filtering-Correlation-Id: 999538b8-7dde-468b-cf66-08de20b9f37d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?McWqq7TOgNSY3cDnP8Vb/+P2laXrA1N8l6a+3uPwvB77USeGbJsQGNfQkWNS?=
 =?us-ascii?Q?aEOjkdrfNVYiaNdbzFOsTAoym9lyc+VwboRxwO9y7DgzDrrmrWd3z0FFi+Rh?=
 =?us-ascii?Q?03VI4/Itg2Iree7/cSXeyVjNs5lEo1h8lRQXaqXu+w7gXtO0VU3pSEwaYvMI?=
 =?us-ascii?Q?0DTNbC2FVkJSwI/kV3wsoLPdOuzQDY9STn/rdcRniyemjQVGfLH0OqfDIbEA?=
 =?us-ascii?Q?Ti2HY+DST1+vbXP/f3bo1hFzLj1C0mDpjOI83CFutlIgDLkiw5UD2m0WiUkI?=
 =?us-ascii?Q?aMXpVqUKdvIhcrKPbK9LfQRazW15j099emvM936gztpC4tfUvE1EZH4oU2J0?=
 =?us-ascii?Q?Y6YzovrogTaLf3naFwWFot+COrnlxpBPfLDJ7nw8TgeqEnWOoRRsr3rbfdvt?=
 =?us-ascii?Q?seZMtkT8LRz0pb6M1mvPtS5SKje5FICiRG7e309YaNDIWf66octSj4AsqQBD?=
 =?us-ascii?Q?5RhLt7YsYgHrbjOz51W0QFJWJaCbgm7JW2N9XzGez455srG177iYWBzz3p57?=
 =?us-ascii?Q?KJsMGfXOeLjSwGICTexicT7LWL7kcvpnh1jXtSe/+gcWdFOkva1kj7yYxDRK?=
 =?us-ascii?Q?sno5M+wo69fkRMcEhWJSoc5Wjy2OX5ejL12pQVFcE5bxtmM125beU8gn7ZQF?=
 =?us-ascii?Q?vCELFdEg2hp9h/LCSJuxyEYcZiIJTZkDsOU5gxiMWmtoPWAQo9TBtMejjiAe?=
 =?us-ascii?Q?kD3KADD+eN9wf34PLdZX0M1rwNeo/8aFai068UE8yrUbokRc6qzckiFntDvD?=
 =?us-ascii?Q?im4Oa+46AlQzMvAVj7qfSv3W+9SygH7yaMgMGHhW6V8guvsCeeVF1PQP8mF/?=
 =?us-ascii?Q?eyVHiH83/uR7W69q7MqPyHV/LchLphLRAD0gy6oHgB4cPmTTHSEqUWWzQrLC?=
 =?us-ascii?Q?NmaSwhLnZHq8h5J88cliklZH8j7UefQm6VCgSz7GOzurq+J/ajPOvPZ50eiI?=
 =?us-ascii?Q?4jlE1H7VYc5dTzwtLovA9RbL++JdKAWzlBDVQPc4z5OjInJyRwle8kbdNhLc?=
 =?us-ascii?Q?YYm+D0mOqMpgvQE8Kf3/Y0I0s5qYVq9oIVjtVzz9UDapizx+T01aRW5DZ73z?=
 =?us-ascii?Q?/f9VGwc19HMc9UfYEe4sCIVjxpD/ssGlwx6oaRk++2h/KK6DyoUbMmaNQUPc?=
 =?us-ascii?Q?JQglx3QJcAveWoOwxvouyaVMnvWqgcQwIsJkEfp6DOCzUmzs4//qByfyAJdQ?=
 =?us-ascii?Q?ErcetYjudPA/i8drxAhli5OS5i/iLZOAbbMmbSSXkmNa5gOu/4kHstWh1Mxg?=
 =?us-ascii?Q?MmM1d3UoUJEAF2GFrikR4t6mM2ERBONG8hu43aYaUBTF9nQyjYRMKbIq4Qij?=
 =?us-ascii?Q?c/LTT2nq0SINLDQctr4ndH5CWf1xEsZkrlKvJr7SmfmJOOQ1NyPIzXvhlSie?=
 =?us-ascii?Q?hOzNjKMuMAVtY4Jhec+SvABCDLOJuoz99Moqve+WJ/MqcXQyFdnXnfjvSWD8?=
 =?us-ascii?Q?fpHR912S28UyWFwPLQgoxqoGhEpsdqZG45KWCQ6zmUEzzVrO4aMTNMPS3w5N?=
 =?us-ascii?Q?sk+AgR4sDcMRIzLtyloK6kWvFZ3BWmxd4VW/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tKt4QcRYQ8CF4YNYyUPMD2KYl9qBhvXk+ADXI9flkE8BxT4m5OesXfzrNN2H?=
 =?us-ascii?Q?rP6jFSvhEod2WFO1sGI/w9IXWOeeL/FnKhoQQuEwhHfVRX3PIKNNE8gGMSQg?=
 =?us-ascii?Q?XGxGbPVZKOQPuO9yosmROsdKyP9XAcEnDgLA1qIjGqEtgYhD5pPmyB3uXWhg?=
 =?us-ascii?Q?Pgi7lJlD12SLx9MIh/xEmY/e6QX+kj6LurYHDixjx+GSlSVS+YV5DNihNQ8N?=
 =?us-ascii?Q?T8DDaqxbnzuLw8iIVAAU4x/Ei4EVTJVD9a2sUKBJPPmAgLYdCROC2Fqqy+jv?=
 =?us-ascii?Q?HvuqMGpm5n0v57hH4hLPiIV2tgFzC7UBjSg+U0nwtl5TSN8nE3FbGBoAtdMv?=
 =?us-ascii?Q?3Og5aObMq2V153Wt3mKWW6QIvpe/u99Jum/vzgmATgwZJlXbvXct9r5iEuLq?=
 =?us-ascii?Q?JPNxDbwtjO2YAKwfqLCDCm3wnaIPY+yPpGgOgqOgCJIO3cKN76rYY7ce+xWq?=
 =?us-ascii?Q?zCzsfcmnlu20piV1vZPlkdhuKKUitHwteBhsy1xsGQYMfo2KTdSR3Dpd0YJl?=
 =?us-ascii?Q?bcZwQx7u2M78q9XrRIPBvrno0erhgTSw6ikoXnVFn5eduo37BJG3Prz56IAW?=
 =?us-ascii?Q?MBpZWQh/aLtcQ5dCaLIGec/pAiQwAGjWdIe+n3RTi5arkrYIDLuuEifpk4+6?=
 =?us-ascii?Q?DSR3ftNH1oyQAFmR9ha/o22HNI4Ru55sqRd+Xrvw4v1cea3sj/Cs5auyzEgl?=
 =?us-ascii?Q?LEK48niElkbqzmkMjXkz1X/7Rbw9RFfM6rN3Ij46Y+sHRjQKM/zZAYHO6t5t?=
 =?us-ascii?Q?wKN32SwpDebpAUFEPDcBkM+wXA5DWel29hTwJudDC0AA9V9Czzs4OvpDvKe3?=
 =?us-ascii?Q?tooyzCWtLRsWBZ/HqctXuyt/3GPui/w6hRkTTk54vilZB3ozq4VT8H1EOfKX?=
 =?us-ascii?Q?Hw3PId/UFJmhvsy4yKvGWFPV3YglISBjjj7r3bGQRPJxd7NWe+ZpLFHFuMEF?=
 =?us-ascii?Q?96ChtMBvXUsJ/Ha+CpsPsfcCofgBgx3wI4izN1yZKZL5hwrdQ97rWn3HXzl9?=
 =?us-ascii?Q?89qJo6Y3E0nTQ7kTITFxAk8e5OdrBv36R601SLoBMBtjxMTOKKiRMc0zK2rw?=
 =?us-ascii?Q?s3y+WFKnp8e0RAjj7n6iR7uo5PXZJ2PouPyrEgPIqYtliqtQ57+4+vK2hzf3?=
 =?us-ascii?Q?U5TaoAZ0OanURJv34G8gpPvHVped9zDgXJfNtl6/gP98GPmeH04pnxzBy/6r?=
 =?us-ascii?Q?W9dOAJht+uGbP2RUtMjDChHaFcd5usQMDrSSxtAWs64vL/g33nkAM8+1cbb1?=
 =?us-ascii?Q?yKzGgR8aeL2qmxYKU5F0ZZguJWCSTHaSBpn3/poCZhRcycGogNwIj/889Tmv?=
 =?us-ascii?Q?nHh0pQS7kzlObzwqgjc3QXLQdJQrvPNoD0JBVCWA5OAgURew3yxPP3LmEtAx?=
 =?us-ascii?Q?7z6Qm2KkNrulYe7nQ3PWmf+rGvaVmYJLNQ+kpe4UfqzNTvTb1wERJd2WQSrh?=
 =?us-ascii?Q?WqZ87gwXdqHsajndixrgM8b5aIBHSoiyQgyQIDdxr0jf2QXGHGTluPduhs0X?=
 =?us-ascii?Q?GFeSqNqSpD8+9LpCX2psEPgmxTlItq/2f/Ruqh3VtlKPCgM9P4IG9RmZO1Wn?=
 =?us-ascii?Q?DN4INSC1WauzKFT08XmfX+q3eCxnqNh+jGwqP3nrr1mXpQUvQ9EYtKKYG8jd?=
 =?us-ascii?Q?ykDVWPbNYOR9z4bKycP9zYc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 999538b8-7dde-468b-cf66-08de20b9f37d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:33:36.0574
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j6AEWcEyZgR9DvZMjZN4IYbvNHPEcJTqTU3TUCoI7TM9UmZHyfxoTP04vC44cNINmmYGFPfvVkCTl0QWCXOuyvscmX4exuP17WilYPbnx1r5UJGFiM+Hecdr9lpRwUhJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7149

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
 sound/soc/mediatek/mt8186/mt8186-mt6366.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-mt6366.c b/sound/soc/mediatek/mt8186/mt8186-mt6366.c
index 45df69809cbab..2c3033f305eaf 100644
--- a/sound/soc/mediatek/mt8186/mt8186-mt6366.c
+++ b/sound/soc/mediatek/mt8186/mt8186-mt6366.c
@@ -88,9 +88,9 @@ static struct snd_soc_codec_conf mt8186_mt6366_rt1019_rt5682s_codec_conf[] = {
 static int dmic_get(struct snd_kcontrol *kcontrol,
 		    struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kcontrol);
-	struct mtk_soc_card_data *soc_card_data =
-		snd_soc_card_get_drvdata(dapm->card);
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kcontrol);
+	struct snd_soc_card *card = snd_soc_dapm_to_card(dapm);
+	struct mtk_soc_card_data *soc_card_data = snd_soc_card_get_drvdata(card);
 	struct mt8186_mt6366_rt1019_rt5682s_priv *priv = soc_card_data->mach_priv;
 
 	ucontrol->value.integer.value[0] = priv->dmic_switch;
@@ -100,15 +100,15 @@ static int dmic_get(struct snd_kcontrol *kcontrol,
 static int dmic_set(struct snd_kcontrol *kcontrol,
 		    struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kcontrol);
-	struct mtk_soc_card_data *soc_card_data =
-		snd_soc_card_get_drvdata(dapm->card);
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kcontrol);
+	struct snd_soc_card *card = snd_soc_dapm_to_card(dapm);
+	struct mtk_soc_card_data *soc_card_data = snd_soc_card_get_drvdata(card);
 	struct mt8186_mt6366_rt1019_rt5682s_priv *priv = soc_card_data->mach_priv;
 
 	priv->dmic_switch = ucontrol->value.integer.value[0];
 	if (priv->dmic_sel) {
 		gpiod_set_value(priv->dmic_sel, priv->dmic_switch);
-		dev_dbg(dapm->card->dev, "dmic_set_value %d\n",
+		dev_dbg(card->dev, "dmic_set_value %d\n",
 			 priv->dmic_switch);
 	}
 	return 0;
@@ -140,6 +140,7 @@ static const struct snd_soc_dapm_route dmic_map[] = {
 static int primary_codec_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	struct mtk_soc_card_data *soc_card_data = snd_soc_card_get_drvdata(card);
 	struct mt8186_mt6366_rt1019_rt5682s_priv *priv = soc_card_data->mach_priv;
 	int ret;
@@ -156,7 +157,7 @@ static int primary_codec_init(struct snd_soc_pcm_runtime *rtd)
 		return 0;
 	}
 
-	ret = snd_soc_dapm_new_controls(&card->dapm, dmic_widgets,
+	ret = snd_soc_dapm_new_controls(dapm, dmic_widgets,
 					ARRAY_SIZE(dmic_widgets));
 	if (ret) {
 		dev_err(card->dev, "DMic widget addition failed: %d\n", ret);
@@ -164,7 +165,7 @@ static int primary_codec_init(struct snd_soc_pcm_runtime *rtd)
 		return ret;
 	}
 
-	ret = snd_soc_dapm_add_routes(&card->dapm, dmic_map,
+	ret = snd_soc_dapm_add_routes(dapm, dmic_map,
 				      ARRAY_SIZE(dmic_map));
 
 	if (ret)
-- 
2.43.0

