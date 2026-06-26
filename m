Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011020.outbound.protection.outlook.com [40.107.74.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A783D7D9B
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 06:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782455316; cv=fail; b=pQKh71ksGfnitDYfUUr5Ph+BeAWxx3g530QEup4eQJbancj9vNlUuYxevnPFX1iPJS6AaFYlHpB7c71wF0gHsQTrRTtlg0j8ILRsLkx+aIxfEeG49F3bOkIKpFqPhS2yNNAC8hcXPx3CJ5Pw7h/7ecUrnRhBo1FOTO+rM6AyAbM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782455316; c=relaxed/simple;
	bh=OFXWKYlzpwcb1pYZu3W0VgDqWPxqGJGHdcSJcWC/nAA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=WaAgA6XyzY8kXXmbwDKmgqzCA/7KQeycLMsQw+m6SLvGbxI6a8HRMOM83Jcs0h27Q+NHzP+fExYJOBPIDNGnRyTAPfavjiHcZgcj0mQzZqR0z/EMhFmFfCUZVukYqLPKa2eg40QGdNSTTm3QoZBYX6plixtkL0dpTmftMpa/g9o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=cZcLoqcM; arc=fail smtp.client-ip=40.107.74.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="cZcLoqcM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IixdOKK3IP8IyF99sEDBtX0RlkhJt9F07EnoRARBPgxqGtBs60URaxPizmzmHH2Zz72BYt98TvZiaatLux3sZ7xTHOBiEP1cCE2PO90IqyeFdhPMzZUECm86Mtc5pMLEYX7SzbdqCd5ndbK7+VBFG8FH9Ql5wb0R5SfcX3iFo6XLJd5ee4lTolNCfxv6TasQ3+qLxSGOLu2Tjaq/9JfcDIfr/B3/N3QkFZ9b3OEAL1cUOB7QTrKFkSSrbPPlXKeLdOsDLIa425D0eBspJTFe0VSoVSJojn0LTFxLHnz9CRuozuWDR/KjrZTGoYmS5jLsbfdUlE66MQs9Ihy7+97yVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XvqD5AqvDqh3V1q26Htb3dniP0PypY51ywZwWoiARHE=;
 b=l8HPL9NUKWkaM1gQAv9kDT0HYgtFOrUuITs1vmISsukJPL2uG6oibpyC29t+aJnLd/sdL2fNikS++3ow9On+UPBZWFAI0c7ykb5KU2MU+5ZKtFdDVihk9VdEqT0WJfrlk/JcZJzx1neQoHMFMh4SisQIvPS9hL4OH6eZ3fICsDaf8PmOzmcPZD9Ue/XTe3Hb1sn1Q6Vl6dCFR3sWVFD87Mv5yjJ8cFFnlkgkTnFY/r7I/+r2S5H4iIYdFEdy339FmgkhnznWWUnwAHwgGMrtaUQuFd9FQ9h2enlPoWw6ZBEgFk44Z1EWxxW8tUHGUM3KeXP9Q6NuGLxESjEFobk5sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XvqD5AqvDqh3V1q26Htb3dniP0PypY51ywZwWoiARHE=;
 b=cZcLoqcM+UFwGJAcxJG1GR5Anri6/VqGNpHVEvH2gi29X2Uy7WDXDfNqrHfCb5b4gIhKcl6IXenKSqKIwW3NgPzKpp8t+pbyirJKKYpg3IdSlfIgByneBwhCBV3+S7GX+rmYrbFEtzZQvRveRBdqqzpcgywEbzr93+ZtPY7bmTg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS9PR01MB15751.jpnprd01.prod.outlook.com (2603:1096:604:3bd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Fri, 26 Jun
 2026 06:28:30 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0159.015; Fri, 26 Jun 2026
 06:28:30 +0000
Message-ID: <87v7b5dddd.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 08/12] ASoC: simple-card: tidyup simple_util_parse_xxx() in simple_parse_of()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <877bnlerz1.wl-kuninori.morimoto.gx@renesas.com>
References: <877bnlerz1.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 26 Jun 2026 06:28:30 +0000
X-ClientProxiedBy: TY6P301CA0002.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:3be::18) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS9PR01MB15751:EE_
X-MS-Office365-Filtering-Correlation-Id: be23c21c-e3d8-4070-8a33-08ded34c23be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|23010399003|38350700014|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	rWrGWbZhzPv6nfZXaYuYjcVE2/4YKMC8p1PwzJdx1NHYsX1b09OAyv55eJ9reJgE9GcfppptUmtVR046Dk+s7kuWSqnXh66+qR05sA0UO+kBJvtgihOobYgb9hmmLHzeOpAuRm4As7icgihPQV3D5lT7tdeBjdx26mmZ56GMbddsI95D4nbgdP/DucRPi7C6BNf+5X65FrIIUN3mXURvw0Oc+3+IFkuWgIwEh6vSJNIaGqjKV0n2AJr7YGoIlwAJsVJB0n7wbmal5JdDFsUgGGasvcJLHNiuVURYwiU/Bg6TxYcCxKPgnVIxe0BQ3Z7iSIdEOJngQmBOgCNnyQUGhDF6ZnyRRXtQhbOtAK6sc8u6DbeAEF89d/IEN/Q6b7MiYkx83Ijlk7atztARy2AUNqwar4Zb7irSb37N4GGG0OAs45YX+6Szz1bUMBLjSMrfegq3uqdOMMDRWwR+vL/khbIVG5V2/GXThjiL6CQLfbv279/RIi84FhZhF24sdRBeeWs3m5L61frYjzEhwqoZliAOqrSXypHqLFvtSVFo7IVBJaYxMSiLDhY1563bNTmzIK3Ei/ECpFrOXHOrmAPNKhHaG4w9JJV7hSuhKteRcxW6D67/aUpKxJW981Sd/CCgkG02ubRQyfD1N9Fxbz8ge9F75UqPAbsGEPMIcZjizWK25HEMJGRBAY/g/UDwBb7mZE66X4mozYWrXGSpmgKpyzTg2NwgZw75tQ/X5L7CLng=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(23010399003)(38350700014)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AuxXDla70ejElx+aC0TElKF7/k6WzdkkJgQkpRRVPJO0xYLreYlSED2ybK2V?=
 =?us-ascii?Q?07JoLUlGhFZVjDIzLCNOh5nbUMsjIxZlKP/Ha+AMspCNG+uKJvDIodmCU345?=
 =?us-ascii?Q?vW/Rl+D5pKKgo6VvttpsLNrLtnSCG7J1iG6oSAx/hmTkfNJP9w/5ur/fPqjO?=
 =?us-ascii?Q?Y3oV48o6fU9G03VxfPwmEhU8GLGUUZ7ptUKPk7ItHerhwLL6VI9UXSaLcZ6P?=
 =?us-ascii?Q?dKmp7tAHtHMSMDFXikIxQzWDY+d1q/WyESii5A9xIHyq90rpPdB9JAwluk5c?=
 =?us-ascii?Q?zlJTf0lt3wmMRmEkdiSSq/qJsGL82uoz9xWPutZnfyqSieFfT6mqxQwJWFgq?=
 =?us-ascii?Q?7eu4Xb1yJ/zL2FRf1C8UFkdkBrycS8E4J4uBhL/qis24FHtypGHPiSNXiatR?=
 =?us-ascii?Q?tvSmOigpFwEUVH5hDT3kJJ6q2wiQ53kdXy5TD1O9602ze8YX1eCiF6Zmo70M?=
 =?us-ascii?Q?0Sd2V/67zZtiQtK2ebAvgxdVdQudYHndTO8zfiXnjffJRbRD1Rm6+4+NawzJ?=
 =?us-ascii?Q?1dedrnBsLrXNoGx86ulTmE3UjyuOEjokWxA/7DdS+zaIeEmZoIx7SuHf963j?=
 =?us-ascii?Q?Oee4CgocjW4JPQb1asuVqhxoDwxcVWjZccbi88VPR6Vm2pc1nl7+rGjEumNB?=
 =?us-ascii?Q?jlmy5PNUg49GoleCsksMoVoeWRFMbJpYpzrkVKFZKx1xH/4t3/BcTpKGcK56?=
 =?us-ascii?Q?r4NwupUml9q+FoOf2F+7m23Fr/lLh4w8wxzD2qfVRGWkKMjetx9t+UoEjXMk?=
 =?us-ascii?Q?lXWY237Yk223J707gj2b15+cIiAXqF4IeTvrMi49DKg1A+1ekZ9tlP/eqQEV?=
 =?us-ascii?Q?8d2fqLf9V+4usTPSQY9dIwf6F4yLCNZm7TVLqlB97cIlotD1DEI+1rKqajR0?=
 =?us-ascii?Q?IJzsm/L1IchxycTQRt6esezodnTROOvixaUCovatvo5sDGqCdbU2Dqg2824v?=
 =?us-ascii?Q?4btE0qfnyXDA6EFeYTHK1eEaJjuwDDNt20byYLRDkzprNYSl56X8Yhh/Gg4H?=
 =?us-ascii?Q?883baVS9I5mU9/q7WY98Cjp5C6hX5PHWxE/loNIwSc/KRNdPYqvKbm4/h8SW?=
 =?us-ascii?Q?tpCcATdFTaAWINJuyNJX6WXLmaT+3vgrtOKK4W3IhTgc0pzz6In/3LpYevfD?=
 =?us-ascii?Q?JL4t67bq27Uv8W4N0jofxk7ywhV/+3KJweuFbWTQzmV+3xvSpntiYaWz0moS?=
 =?us-ascii?Q?3lTerZziPPNx9RMfoLRDbE8Cy2ibnBRdm8lmSVDvAEjQba0WpE017GlOGgrZ?=
 =?us-ascii?Q?SaVffYzBin6nfT1m2EBPgvYLC89S/NMJMuGj7zmv534Y9Ak5lPuYY55cwtQN?=
 =?us-ascii?Q?wNepKSK2mOWe5AGsgViLJv6Frba1p99ftpiQT/QgA6PHYe809+eIOD6FE8qa?=
 =?us-ascii?Q?sP8FeXit1FXtuPMoBqWo/Snbwfcfdbwgqt5569epaENd6kM/cR1Bhw2XsCD9?=
 =?us-ascii?Q?sPDjza8Mo5Qt8CU23O4U2gDqc9W42hmorP/NtEu8Uv1oJyoPnkpQz9GvsFIq?=
 =?us-ascii?Q?GvoVZ55e05/QpaNVn2KgY8dNZkv9xjNEA7mcxh4gdOXDuVclbtBP5StEwB23?=
 =?us-ascii?Q?poE2q32iAJKhrhXpH+Uz9HhOzDSnU2cYT3DMT/kiBQkX/XRTn6Cws1PtREEQ?=
 =?us-ascii?Q?K7GOPmmfORNkHLUakmOlKCw7VPfBpe0yE5u7vmHNcAEjGfBjcLnsHN4VPNEL?=
 =?us-ascii?Q?cVUncNqpJ4XVYQj1xPyR5U4AUZpOPB2lc37nbeOamX1d6NP7TUBRbLlD6Scr?=
 =?us-ascii?Q?cWVn3veSSrTPY087+b+am2ys06KshPsVcciihre3mMN9yz0f3O0j?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be23c21c-e3d8-4070-8a33-08ded34c23be
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 06:28:30.5022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ek9RdzxU89GxKWu1UvB5iDjYmv220Wx+xRno/yGp9GQm1CT8Hn+Cm/SmRR9Yk0C0zSJAsidFimnIE6rcASA0SLi5RO1S0DptfU7FqS0+ByM81T+8R5IRbbiuiM7SnBgE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB15751

simple_parse_of() calls simple_util_parse_xxx(), but are random.
Let's gather them all in one place.

Let's keep same style with audio-graph-card/audio-graph-card2.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/simple-card.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index 4dd05e7262136..a67f4aad01883 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -704,23 +704,23 @@ static int simple_parse_of(struct simple_util_priv *priv)
 	if (ret < 0)
 		goto end;
 
-	/* Single/Muti DAI link(s) & New style of DT node */
-	memset(li, 0, sizeof(*li));
-	ret = simple_for_each_link(priv, li,
-				   simple_dai_link_of,
-				   simple_dai_link_of_dpcm);
+	ret = simple_util_parse_card_name(priv, PREFIX);
 	if (ret < 0)
 		goto err;
 
-	ret = simple_util_parse_card_name(priv, PREFIX);
+	ret = simple_util_parse_aux_devs(priv, PREFIX);
 	if (ret < 0)
 		goto err;
 
-	ret = simple_populate_aux(priv);
+	/* Single/Muti DAI link(s) & New style of DT node */
+	memset(li, 0, sizeof(*li));
+	ret = simple_for_each_link(priv, li,
+				   simple_dai_link_of,
+				   simple_dai_link_of_dpcm);
 	if (ret < 0)
 		goto err;
 
-	ret = simple_util_parse_aux_devs(priv, PREFIX);
+	ret = simple_populate_aux(priv);
 	if (ret < 0)
 		goto err;
 
-- 
2.53.0

