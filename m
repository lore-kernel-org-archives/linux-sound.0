Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011025.outbound.protection.outlook.com [40.107.74.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982A522256F
	for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 01:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782179650; cv=fail; b=f7gFsdstxv7To0RWxE/5AU5R5JKYFX/F70E5Lcl4n+s+q4sQy3Bypsx+ZCCPye42NQvE5tim4cP/fLRXjK7gQ1tJiQ9FT0NwedbXp2KochGuJvMI6nyFg7WNEG3tZ6uXcXO/2/sFRfQza5cYqTyFPtJuDND8JUfFckTczh/ht5w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782179650; c=relaxed/simple;
	bh=OAl0RqQbyV5JZahWrDgBLd28VH/gx9RjCg6PuZPpqB8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=oReJIPj/n4QTGWKBw/vOcjvZRNY5bq8cgDjumcDBRwf2gHDJZT5UvNqjZrT9VSLJh4EQntTex4I9DoFYoC3D4YD3o5UQoVFh7BVX+yyjJEuNiYmv/6/vP4jlCwJqHQz+2qzJt6LVEhKEe50HU9CgP2NLKoS95/uzNB62x7F04Es=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=FwOQPWHL; arc=fail smtp.client-ip=40.107.74.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="FwOQPWHL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x7N7409cqEmu00sLdqlmlHlmLGyNRCLMDY95+OTFVm+7o3yErSUcygKpsghaqbZt0azsiMMQ40e0pUhEdFKs549W8/il/b/j1S4ajk0W1NpuIXPLMM1FRhfdCC8mS8+9lSWWfVdjUl4ZG7dSbjAWy23EzXdLVxZnunhDXsqgKI7pLHMGnC4fhHuxPvMUOxKtNigMKw7w4i1+lfqLZKMtAjPWYXhUXDMn1StzXJm86kfhr9Q8SHwb9rJXAv6WIZFjZ+TL1GCxxXCByFhNUC0jcqxIT090AEQjlhpWBzXdBkxXPb1/40GNvJYF5/9G3/aFSRRrJwdxbLlb+qPpwYzK7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pae7dVSs+ARdy1TkLwkaS8Z/QgRJsXRAAydROzoK74s=;
 b=GfA0H6ugvi5VxAemswJ1RW8XQAJMYBres92w+73eiiDhFdT6oAFQwMtWITihEtlnInUh+Z1W60xu75uPHxD1cqvZOr622IiwHd15DM4qKjK1u3Sn+LwG7DM+qhZmbDhLI8ITYE/9Wb2U8E1y/VbZgSbLRBmH7Ap6NcqRvcJMcxJc1R5miJiE/nehEznXffourV8CoFZkWUbkwRmaOI9TXnC0At0S7NuJ34Fv89sSG9zA3204D8Gegp6Pdin7S4UgjNNPcmV9wFHTHIAxO/KC0g5AuZGDNo5xhfTJxR10GZFOKO7xiKmWH3A+vAmhLzFZVXjEVKxP0T2uZTKuL5gjnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pae7dVSs+ARdy1TkLwkaS8Z/QgRJsXRAAydROzoK74s=;
 b=FwOQPWHLbHpJsB+WKx5708UfFPivKUtos9AXRV5LIdQCB0TluaWpgg3pQj1HdYa+3KzG5QNbuCytPoYIpgo2vDnS6jPC5TNt9ETqGHpBoPkGOs1trLA9ojRhA3k0tbetI/AiBiOg0N2c71qnFeY8PV9ppPtAVxVdeudIUNEqtOQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OSZPR01MB8702.jpnprd01.prod.outlook.com (2603:1096:604:15e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 23 Jun
 2026 01:54:06 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0139.018; Tue, 23 Jun 2026
 01:54:06 +0000
Message-ID: <87ik7ahvi9.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 3/4] ASoC: meson: use .auto_selectable_formats
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Kirill Marinushkin <k.marinushkin@gmail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
In-Reply-To: <87mrwmhvjd.wl-kuninori.morimoto.gx@renesas.com>
References: <87mrwmhvjd.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 23 Jun 2026 01:54:06 +0000
X-ClientProxiedBy: TYCP301CA0090.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::17) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OSZPR01MB8702:EE_
X-MS-Office365-Filtering-Correlation-Id: a4675474-7c38-4423-f92e-08ded0ca4f44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|52116014|1800799024|11063799006|56012099006|38350700014|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	jCPelZhCneWncd8EX3P7/YFAnTo4ErBihs0wYqauIm2G0VtnVfEfWy1xNwn0hVLhrMLjGSxhWbnLvyI7I1HlB7E0H6MgIozp+c5eJlLVYMmWRW+ksY1X5hzxOhXAP5BELZ8yHb3qZz51Tn4BVHuvTmVb5Q68O7HmXTlJuyKKwc/5ok+dUYE+VJzkHCXGVHcHqpLUjAahgDuypin4Zmu4vIqXSRAmNweL8JPSHjgAYnDAMGs+l6QCArBXxwTrb4iDGU7f7bMV4MLb9DjhdMAtSm9XJqnNm4qQYTDxhGLr3mOPLfPfe4viTwGYx8F9RHZVs04WtLDxDkXM9xrFTMp9rmLyG9aFIkX7OvE2nKHTZu9N+DEEBxFLst7MalrPMKAkWXJZpQ6NAtV6fzxie161STJGoQV6mkwfAu5b+K3xHh0NaWTXgARwYL30Yn0Ds6gkUtLveNW7iN7rSUxuJc71gIgBDkrcIS0LOdIBHcIBp1Jrxl5cZdzDQgCIjApjNClo7GvsVr4v9tvhW4hp4M/4q7NES4YU6oX62CnN9uC4iabnskq5ZmVIg/d72bcrT3feI4BSy2asbK4oepkoion7c3Gs1id/QsvhpMvx/P0OiCQP3o0Om+WSLURFKU8wzgx9JaAzI2PNr5FTwGTG1ye/uIuCaJbYEFqYmaG9o3W1kobQmzGjoj3YzYOmFc36RRLzPdYwclLA8pqJg1Hl33okTzQRLDTH6y3t3WZdj87wdqU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(52116014)(1800799024)(11063799006)(56012099006)(38350700014)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iw1DDtN2XoMmWvpAH0lpilLWQd0oSWFFVt7IfQUG/v1UEoJsgnMKGtyzR0A3?=
 =?us-ascii?Q?5sKW8kwNOUr8XMm342SEJ3kWJc8nvxPcg14w1Zq3MYCrBUCZNuNQ6uyRknvD?=
 =?us-ascii?Q?oloIcLfP63capkE/Qv3kPRambJhnKBJOnr+QLw/CW3lAqyG3em/0TT2dCtCd?=
 =?us-ascii?Q?IedQ588F2nlkVdRvj5kLuiUa62C7u+RhbIyIUx2tPwZV6fBkp67XvmYTdw3j?=
 =?us-ascii?Q?FRQohn5Rs1wEdQh6JBoL/o0Un7PMfnLGtV2xDMM95cLqHsECtrZoYcrrhm3q?=
 =?us-ascii?Q?FX4zUoEDIeKwQcf+xX/p0tWRZ0IDvKBWyJg6Y6hnsGbGOUAwbCFr8FMQX8tf?=
 =?us-ascii?Q?madyKZPymQIaXaQb8mAtcWGqb4fCtq6QW8BOzt9cqybQxXRHXgMT4HKc8gKs?=
 =?us-ascii?Q?R5tyOMZyo+V0AHMFC/pgqtOh7fRp7DlnG4oaWlNmBvvKOX1fUmRWPcWub72f?=
 =?us-ascii?Q?NskmCI+fJDJqYK1/UonnSUeREa7siTSZ61nmfrls+TECQVp5tdNZLckbIdbR?=
 =?us-ascii?Q?7r0B78lbl2keElDznIxUfbRDo0gUsQka4+SatVoae++zXjNOZzJ4Uo01+65N?=
 =?us-ascii?Q?LT46saz95ka2ptpJiakeylSV7LDdGtdRIqMNboIOaQwFBtOymCpn1xA0ffqE?=
 =?us-ascii?Q?OgPV7s/2RNTCmC7SX0LKpYfnaO0e9gSGUySyf4O6OFc0vnJ5mUulXD0WDjmh?=
 =?us-ascii?Q?xb7QrUlo5RDBZ9ml2lpWupEULYe3Tt0RyHPYf1wUlNrFeC4S5jPpesId7DuK?=
 =?us-ascii?Q?XacM/VfbAksrOjzaYx6H/XWthunfnslyjI0k9qrVg86E1ezTVGScPtyqX3d8?=
 =?us-ascii?Q?g4OBk38k5PqIdfAjfn9+OfTX7/AaO3LXdNYNgU/ubMhSt91moOONLrOVda47?=
 =?us-ascii?Q?Vg1N/iN6xhX9hNTy/etKvUffRnPerkjN6kJ+BcYCdm8HIZx6PLazc8uvPvWP?=
 =?us-ascii?Q?RrmMBcng5HzUcEAepXsoLSRro2WCUAKSZFuo0i4xgAjJmR9RFY7mth/sCyJj?=
 =?us-ascii?Q?zcimNdfm8750on/41Patw78YbAurlvpJg1/+ddF7RE2fxxkvxZPurccEa93+?=
 =?us-ascii?Q?uoNkLja9W7lI90oLAPbNyUsfGc5zjuKXY/BCBZCg60uUEWNWKw6vxvLxQ0wH?=
 =?us-ascii?Q?rRE7RDYQNv3Hwo4SXel8BoreWepkzJJQtZndIcqV61IdUb7WvpaCmrO1T+rU?=
 =?us-ascii?Q?upl86ojOHFb65JuHwnoZRZkx/Eo1oqrwpXBg4CsfEyQV8WhOG1ZsCMu7MluV?=
 =?us-ascii?Q?Ai1pR0KNfkjP9qQziGgfea0+vKs4nw2AeC39LAnDI5b4XMhekA9yFIonO30U?=
 =?us-ascii?Q?5Rll6gDq3glijaE9WnHWhR9x7DGTrZH4t00/H/p5ibh5LuQEsCg1hDL01Rv8?=
 =?us-ascii?Q?JR0czaKxUD5+mdvSQALEa6KjzVsPU/GhFZm/gmB/bOW2OV9HDI96ruiwZxjF?=
 =?us-ascii?Q?N9EDcQfVKRnrDFqXLkadpCxdmLjccv+s7kclbzQitMOfOUSUI+Nhefaff416?=
 =?us-ascii?Q?mob4d7EfcttGW986erkku7ADZaKr44zUopM5tGaLO95TsNLILtHrGXnyr7Yr?=
 =?us-ascii?Q?sLufZk9prlGqnLOpIhf28OCOF+r+FEXGfwtGCFoDJhYSlALH/5ZvSA57hukq?=
 =?us-ascii?Q?kqsZV0ilBFwURPabKkegvJFMfXz54BBNSTDOCkkvJ4go6iDRiwcETupil37T?=
 =?us-ascii?Q?JUkKlVbdd/KCZwgs/jJ3sr9eXsxxnW8rWTDkcRlaJCDs5ACxEzyH88LhNxc6?=
 =?us-ascii?Q?FgeiiG4CGKLelgiBaLkAMs5G8wi7/fG26mYmX4ITA/YgxpGNR1Fg?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4675474-7c38-4423-f92e-08ded0ca4f44
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 01:54:06.6740
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LLBY2kFyXnuE57AELS8iEjn3QLJFdedEoPn/qnxYrqdZNdksiS28MpNjyx0mHmnqRFOP+BM3Qt+9xcaQ3Ru9Cf60rfNjagCT5G5Uj+g07Of74srzviLAZVpFQnhDkxSH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8702

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/t9015.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/meson/t9015.c b/sound/soc/meson/t9015.c
index da1a93946d679..085f771eb244f 100644
--- a/sound/soc/meson/t9015.c
+++ b/sound/soc/meson/t9015.c
@@ -78,8 +78,14 @@ static int t9015_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	return 0;
 }
 
+static const u64 t9015_dai_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 static const struct snd_soc_dai_ops t9015_dai_ops = {
 	.set_fmt = t9015_dai_set_fmt,
+	.auto_selectable_formats = &t9015_dai_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver t9015_dai = {
-- 
2.53.0

