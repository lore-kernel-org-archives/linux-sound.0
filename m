Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011027.outbound.protection.outlook.com [40.107.74.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBDC2749C1
	for <linux-sound@vger.kernel.org>; Thu,  2 Jul 2026 01:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782956682; cv=fail; b=BfG9yfKYoEBCUR4ZG2kP1RNa6GJ2q55G0W8GHUByMKQNTE4XUsZ42nfxBpwsBuA1gurLQX1IiRqBa1yyxkYOuVeTjXKRWEheFtLUDpy186om2yVK14IitsZimU+l19YgxkhySHpRfq9a8jUf3Pr64+zB7VJJBVrlOyvKrsaU2/c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782956682; c=relaxed/simple;
	bh=+YysZi7bhNEm10X/CSnyAbWJtTMUxunMggbgErnJ7Fg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=quRsB0X5bN7drci1HMZaEp3aY1ytMuHKytkRg/e1LlIv/JrvszZWFyJcpb1YcoCnj2zLXTjqLxzqFCCbui8gX4JYsZclgL5KnSu46wnivGay+7TOWTN8cZZgk/bwOeL0tm0Qhpwu0xv5fAB0H8vZLrNlsNjNBErVgK2e8o+tddk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=NO6zdLZM; arc=fail smtp.client-ip=40.107.74.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="NO6zdLZM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fgCUAyY6Rras3i65RJqJFkD2LxPyTZYMG+uci1o58TJPZLEZRq5IE1dr8TZCRxZ2hOTq3tpXp1OFPxXZFWl5gnTJBnKk92SzSAYmmBhVj9wRyWFi1wz8W7UJzwa8RF/bf6yuhlpk8PJTYhHsMGpa6dPygzufok2HW4tTBZqVf3IR1VTCSetaqzr5DWab6Pp0Pt0asbYEzV0WP3DGmzeU1L/NiGay/pJ2PkHFdq/3kTGa4glN772NAHZe9Ypekscu0V4KSDl2kVu+ZPD+vnT8KjlJ+tH39thEG4sWVX0J1Rrxgh8j4FFsffjz9bjEnm4KD6odZBn5Ld51y41CIMQYXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hhYrqkP4rrRL1lMlMW+wIDTQ6MCXO0epNTzsYxXV1l0=;
 b=DibFM0TU+YJJSoPCbERO+EQEchMGm5gItvf1S6ADBxIfji+l5DYoPnZVatuBGVEXtJPq2pWyil3LB6gN2ticirGSyaYxd4mbhuT7uYSu/YMhkGxS9MsVkevwwKbg0ANDJs0U5t5gPPMdgy/hMnmvhPsXwHkvGcLHbqXdjbasDKwYXchP9FbkyWktWwrcOB7aAwX+stKz3cfqwuRrIB9A7lEk0WAAJJrYFDEf79GOGIWmHKozP38MR+1QSWHTP89EI0rcHuQdyq08pD3jjSNEQjYt+7X3Fz64Su3NVWmhcVYpak812FV0hh/oENU73Q7zo7qxBZNLOl+UZkhvWEiwNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hhYrqkP4rrRL1lMlMW+wIDTQ6MCXO0epNTzsYxXV1l0=;
 b=NO6zdLZMSWy5j2uFycEQ091KEiDia2kmi3MXNXi+LSzh7Wenb4myL9Aa1xcAu0kvYq4aOLTF4su6an+YR0XYQ9kqWzwY9oiHqiCwKUJh1LQfBAYOShGscxddfWBc7E+bzzVOuoyLQiBVq/kAwiVuNjXdn1V12TVWroT81De6YqE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com (2603:1096:604:235::9)
 by TYRPR01MB15951.jpnprd01.prod.outlook.com (2603:1096:405:2cc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Thu, 2 Jul 2026
 01:44:39 +0000
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834]) by OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834%5]) with mapi id 15.21.0181.008; Thu, 2 Jul 2026
 01:44:39 +0000
Message-ID: <87h5mixj09.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 01/12] ASoC: simple-card: move simple_parse_of()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87ik6yxj0t.wl-kuninori.morimoto.gx@renesas.com>
References: <87ik6yxj0t.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 2 Jul 2026 01:44:39 +0000
X-ClientProxiedBy: TYCP286CA0361.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::17) To OSRPR01MB11811.jpnprd01.prod.outlook.com
 (2603:1096:604:235::9)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSRPR01MB11811:EE_|TYRPR01MB15951:EE_
X-MS-Office365-Filtering-Correlation-Id: 4df1b57a-dbde-4f4b-019c-08ded7db7ad4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|23010399003|366016|38350700014|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	NwFl9dPQC9rIo5H6FPExeSsA6x1we8uaxjHLyjcQ/LHzYbrL8fUtS/9yjxwz+/ZD6C1zOJcs3Z81g8p/2ORqI6OUAOApubrsxTQgy1dt7TYzpy3BfhWKko0Jrf9a3/6KAQvoXH8pLl3S7WTHfHv63aYm5YWgPiDBRyHDkXtPgK3EpDhHEP+kMe3L0NuIsrVXhvFUgLHZpHNLTbtThYmz8v0KEwF6O43HiPvhoSlWQqzdyt6zY7QHIiwCn1gPBv0GxMxBo0Z4diGoOc10xREuOyBpOIoaDBVKV5QYjezB8admDqkuGABC1XtQEk5F74Ws/eu3tVF3jE/LTypW7r82VAin8w/rCRWq1c8Vm7VgZi803qqMAq7UrcaJFmL0vRbTrP6IH4s6pLsdIUHqafvroabQKR3OsfZSBT5SHOQrxclRkg9fsjAsY84DLEoyVU1cD7CoubAeli0p0Sd9gVDE2Nt0HCyMHeK7n+a8zsI1qumtcADVYxBjDw5PSfcVuhxX63wfcnst6pPkQQ1EKCkCoZUg9nMOYzvN5szJSX2+iiKW+qrufOH7tGjZVPYYP2mLdX/qCd0+jp7TfMfTR4KvC8ntJPI+7Xt0+0nw734aleH5fvMX5uLP1rD+9SMT64lauFBATH3hpZttf3+PBJeO4Gha3l5EeB3uYoYq7Bm7qfqLqG4SjrUGoyfrU2/r1uECN4/bKZNbCQijJJfj9iYH9squsEU3QIhBAgYz9FIJwes=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSRPR01MB11811.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(23010399003)(366016)(38350700014)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eGhrwlusPhNjzypc0IN1aZWIRyy5KY2W8j3QOTwpitrfsf9hquzwHBuCcynx?=
 =?us-ascii?Q?gzOBhqeoqbdf0SIzKkbEluQnBHm3mwOSeApy1nABLugYCApS2+MvdPs53RMo?=
 =?us-ascii?Q?dpXnyt3Urh1uF+QinC8C2znovqtrgfjurp69M4NQe8NbkrPmciaA5jzQU5pJ?=
 =?us-ascii?Q?quf/CZOsCjBMIBhqYDCcu5dVkuY9nBVz636Gryzw3KJizxAbdjJly08SL41A?=
 =?us-ascii?Q?SRe9lazLFfoZ9IATq1AxKcRahco3c8L/qQh5sc7hS/nSIlRizytG2VclrI8u?=
 =?us-ascii?Q?AbiijpVBRRd96i0PflyfdIw767OOh9TTP0Uu9Yfldb6BFMJ70E7O+87g1RzG?=
 =?us-ascii?Q?446l5qNiBIK/WFVzb+bI7eyoTgbbYYc1WxEl6SVR3NWdSkwGboFhwoX7757l?=
 =?us-ascii?Q?/04gaj7oYBueQS/mNPJwRyUa55KU34e2bUdw5zuZVFcDOJdjvQbmzDX99RRT?=
 =?us-ascii?Q?z6egKtTTCBEDpdsLJYwzw9QhGVi7nRtVV0CkNAmTCxGAYAISV+tV0BLAeuIx?=
 =?us-ascii?Q?kDehvBXU0ovIsHzgZbZpnZpxKSwsku2jrULhaX5OODRL+dAALcnF5rD+/TjQ?=
 =?us-ascii?Q?dOggzGHtwG6Z4WAkco3qPOUGWsbNOKaRdgsTk+gzHJP+oa/UM9Cbl7SgNhPp?=
 =?us-ascii?Q?26uEN0LnNCSd4ixrB2i+yAy1CDO59jRzhh9gzl5t+qjkBVWCaQ+pgR85O+HM?=
 =?us-ascii?Q?ecIxxZSx6Zedg2Z6K3Q4YjSjSXG5QbOKab79UgZqhxpbYGcbQ8HkU6Mo7XTI?=
 =?us-ascii?Q?zbJknCgphDBhp7vAXI6IincPj8sUMLXQmLErMSN2EAm+RJMe+CBZeFISet10?=
 =?us-ascii?Q?ANXe8Fzrq2avrPe64RuWscGDKL1epfJjCYaWLrBEMH9lO54wRes15GK/hYis?=
 =?us-ascii?Q?hltO+B6ubXPC8V28yUQ5dVy0C2oqoyGX8+T109fizZky5e2yaFx5BEju2Nop?=
 =?us-ascii?Q?LrxL8V0GzzGB77FkgH2n4gnVWhcUtK6zBupjhdPUihxSyKAvPVIXMT5Gj7th?=
 =?us-ascii?Q?XI8+zduEsHqA26UEKf1vY4ZHLP8cWF4eI28d21kAi5rcUpX2q9LapoN6chi9?=
 =?us-ascii?Q?Eq3zbDBm7JVPioE4YAdaQVooaktXRWOmzfCE4LDG9wcQWudXWPJM8v5xbfqp?=
 =?us-ascii?Q?hzjzgAWDDHRLM+d7kt81qY3Im6b/UiYhHQ0XDSisQXFKjG+KCozdShhAG/aM?=
 =?us-ascii?Q?stzIrUyFjNwxZIBgZNOt//lJAyEApU0OYgoucgTgZxQua5Dpv8h1uFqRT4Lj?=
 =?us-ascii?Q?wJUQtEwrOwKg9V5qeWXdY7aMeyOySB54DTE2srRezTV/MM15/Pd2wJbc51zP?=
 =?us-ascii?Q?sjlugrjWuEOJuPk0HH4yDFHEL04ndEwbbYRUfTt9t8QAVto8rMfQ4+EDEEkA?=
 =?us-ascii?Q?lTRnanpD8qK+J7MVK5qH8JsDlR+4GN76sNPtbj0u5P82T9iLQaydwOhiVYxQ?=
 =?us-ascii?Q?1+XaBqt8OrL/K3Q+18bp28AlVHAOq2Nnn3OAwQePlX1StBYVxrcdKjxQ0RSI?=
 =?us-ascii?Q?ufXefv0BDoBZXrl+/yeCa9EXtEWQCF/TwwCRWmF80o/F8xS57HaY2TUuxrgZ?=
 =?us-ascii?Q?qZrx/sM1N5iboCDfnoB5UsBtdrek3fW/QbxuOUoLLQabcQ80fnle4WnT/JKW?=
 =?us-ascii?Q?9X2buJxlC0NHO5A0gl6j7FeBCZPJutk9a1eNyMRH99slxbe8OYUSjjoNl0Xk?=
 =?us-ascii?Q?sqTSSSxB+GRpLlGSeLRU6QSE8OOf3IJ2d1i7fr6+vUqr2SYPwC+9Yojy2/6j?=
 =?us-ascii?Q?vlMB/WyQQyAmJdyMtgqhIOhtugSv4pt89ENl6C/7rX8PB3yHW717?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4df1b57a-dbde-4f4b-019c-08ded7db7ad4
X-MS-Exchange-CrossTenant-AuthSource: OSRPR01MB11811.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 01:44:39.3569
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9eo0jvESmTalRXjXJE9ADsqNdmzM1qN0Wom/cx+A7lKiC4NNh13EZ8TL/dTAt1pwGUKaj+BHFlvqv6YAAAJH8MfktYmtipH0L3Nl5W661isviZsPyTvnPXN2rZQVPsaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15951

Move simple_parse_of() position. No functional change.
This is preparation for code cleanup.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/simple-card.c | 76 ++++++++++++++++-----------------
 1 file changed, 38 insertions(+), 38 deletions(-)

diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index b4957e0252113..456b7ebeb068f 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -517,44 +517,6 @@ static int simple_populate_aux(struct simple_util_priv *priv)
 	return simple_ret(priv, ret);
 }
 
-static int simple_parse_of(struct simple_util_priv *priv, struct link_info *li)
-{
-	struct snd_soc_card *card = simple_priv_to_card(priv);
-	int ret;
-
-	ret = simple_util_parse_widgets(card, PREFIX);
-	if (ret < 0)
-		goto end;
-
-	ret = simple_util_parse_routing(card, PREFIX);
-	if (ret < 0)
-		goto end;
-
-	ret = simple_util_parse_pin_switches(card, PREFIX);
-	if (ret < 0)
-		goto end;
-
-	/* Single/Muti DAI link(s) & New style of DT node */
-	memset(li, 0, sizeof(*li));
-	ret = simple_for_each_link(priv, li,
-				   simple_dai_link_of,
-				   simple_dai_link_of_dpcm);
-	if (ret < 0)
-		goto end;
-
-	ret = simple_util_parse_card_name(priv, PREFIX);
-	if (ret < 0)
-		goto end;
-
-	ret = simple_populate_aux(priv);
-	if (ret < 0)
-		goto end;
-
-	ret = snd_soc_of_parse_aux_devs(card, PREFIX "aux-devs");
-end:
-	return simple_ret(priv, ret);
-}
-
 static int simple_count_noml(struct simple_util_priv *priv,
 			     struct device_node *np,
 			     struct device_node *codec,
@@ -704,6 +666,44 @@ static int simple_soc_probe(struct snd_soc_card *card)
 	return simple_ret(priv, ret);
 }
 
+static int simple_parse_of(struct simple_util_priv *priv, struct link_info *li)
+{
+	struct snd_soc_card *card = simple_priv_to_card(priv);
+	int ret;
+
+	ret = simple_util_parse_widgets(card, PREFIX);
+	if (ret < 0)
+		goto end;
+
+	ret = simple_util_parse_routing(card, PREFIX);
+	if (ret < 0)
+		goto end;
+
+	ret = simple_util_parse_pin_switches(card, PREFIX);
+	if (ret < 0)
+		goto end;
+
+	/* Single/Muti DAI link(s) & New style of DT node */
+	memset(li, 0, sizeof(*li));
+	ret = simple_for_each_link(priv, li,
+				   simple_dai_link_of,
+				   simple_dai_link_of_dpcm);
+	if (ret < 0)
+		goto end;
+
+	ret = simple_util_parse_card_name(priv, PREFIX);
+	if (ret < 0)
+		goto end;
+
+	ret = simple_populate_aux(priv);
+	if (ret < 0)
+		goto end;
+
+	ret = snd_soc_of_parse_aux_devs(card, PREFIX "aux-devs");
+end:
+	return simple_ret(priv, ret);
+}
+
 static int simple_probe(struct platform_device *pdev)
 {
 	struct simple_util_priv *priv;
-- 
2.53.0

