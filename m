Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010052.outbound.protection.outlook.com [52.101.229.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA0E37703B
	for <linux-sound@vger.kernel.org>; Wed, 13 May 2026 01:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778636923; cv=fail; b=dP4/pMsaUgjQQAPWaZKij6JB9vacsXWboio2SwQAtvuvHv12Y9lBSD/KBPrzmmVps3vhgiNixzLEAKkXUJdorSlSBsp5/Xr9I8o+jz5GGGsY5VFzjkrNxKzfEJwD+Q32+P7ovWKblfy4TS2gKopKg4pi0x7++zn16mpPauWlmwE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778636923; c=relaxed/simple;
	bh=WgA2eB7osbpY9iaFq4yA0AmhMGEJoz3hqaU2TugQkEA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Vpk3jLIFAHt/UMd4nwcEtT4HS50XBfKOu4thpDgg1NoUMUiZR3vQUKXtVzMxj3z2ickQEbnjTHwt2AZ54fRp5YASbRUX0b2mGXHwQWRJuJPHysCx8eEzTnsyg1pjHmti/guXUtccyX4cxQTDnv3cw0sntdRtd52EnZzU7NnfaJo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Oxrn3pRV; arc=fail smtp.client-ip=52.101.229.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Oxrn3pRV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MxbKlxy994rlqeC0GHw1hKO3qzTqp+yi0LOfeKki3NwEBugu0stlDUrBe/beuHMZFFwb6KXXkQ3UxHeSAo3/yAdDbt10nIq7VBLJNHh1fpk9AYYZCmOK0BIrln2sXAP09L9BNtmuMa4rJlcER6L2kuMADFobmELk3v11JRpxlTkatPE1CZ27vPqc24pfk+ShnEdQTCctOFEWiQTDI43xuoqHbaFdiMJRaBdZwpz3tUI3tQlLJZIRjpvp6Tz4goQbdp7hRBSM4Wtsr+cTo6SGHUV3KzEmd+2tJa0aXKNsuVN5RQXDmGph1N1BghB6H/I5DoQzHbMg8ylimkvkJtdEEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d67oaNKPXxmj5C/xsWWH2Yi0BIb/RLmyFmcsFdvg5O0=;
 b=vzDQzrQSCjvumzn3Nvfy00lK45kIHQGrdMUw1YWgKOhQG2U07qcdxV8Y6bfFh4Jixdm3urALCNFxZOlfXd6gjGWIRQjO1gK1OnOxGKIagU5A+HemKjGapSAX6pleGy6LYqtpTciiEh0IeA1nH114sSHwlweW8eStKqr4aKr4NFVTFLTOOWOkJ3Us5s0Cm7QgiDhuTLYNPCwVIz9l6KI/ECXGCpkjX6jFsN68r1ohzHEQcIbpDU4OB88x3yb3x134EYxjPK/MrfLkuAclgWng43r8rJ8Z/Spprdbl4KdyWh3YQWA/YfeesNDYjTn80IolJzqV7ihmKjlvbfoWtrFlDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d67oaNKPXxmj5C/xsWWH2Yi0BIb/RLmyFmcsFdvg5O0=;
 b=Oxrn3pRV3InGxIDH0v9hGuvnFcwz1M9CwMPjHy1hc35+joXRSnMlJgL0SQ1z+vB7iIa0d6meU0Kw09j55iRUO79LGnHc52YRtx9sSzmKaZ8Ak5QwAcYU45/2DEpBxGXIjZBAAQtdMF8TXjFkSI211bFbUCpz/unEgWOtWnWEYtI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY7PR01MB16179.jpnprd01.prod.outlook.com (2603:1096:405:2aa::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 01:48:36 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 01:48:36 +0000
Message-ID: <87y0ho5bbf.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/2] ASoC: soc-core: add soc_rebind_card()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>,
	"Rojewski, Cezary" <cezary.rojewski@intel.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87zf245bc3.wl-kuninori.morimoto.gx@renesas.com>
References: <87zf245bc3.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 13 May 2026 01:48:36 +0000
X-ClientProxiedBy: TY4P286CA0040.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2b2::19) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY7PR01MB16179:EE_
X-MS-Office365-Filtering-Correlation-Id: eeaae39b-6bef-4b88-8aad-08deb091bfa3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|56012099003|18002099003|11063799003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	OGGgT8P+1fveVajfEmA2jSy5YMrq375vLS5oIBPGJoGqlHrzDALo5LcfPCCyhd+5/D0wyYnvi6vYfVCmmwDWZTQQL8V/xPmde+6odI2YRDjBGHozKOtJO8LyraBIeoo075wMMyuTvLfXXXWHqLDbAn85GUeb1a/gAp1/NrGqh8IwDfMMLN0Jhdpo7Gy/KH6xPuFIa0ADGKT6PgidJx7mtgEFXsAwmHj4hQWcluD3EDLgxiTleEcDgtttNdU6nlDbM22pfmGU3tIcnmoWGE02Eq+3wZWzvGrVrgOQ7s++SXH7OjdK37m3js8N2LAn3BLPg48anfM80MR98mcnuQfT4qR1Bfwq951tei8GVgmaJM40WVZRsUDF8dPVzkiEL81ypBc7bxjLI48AINIY3hdcI6kmRqmkhQudOcsG2EKeTY13BvurQpp+3JcT5eGPtQ0ssIzXP7PLW3BvHyo2rZZYc1rhyxSNff06fwxAwE5xnZLoJ6HlMjjyQMpTvbAU7zotc57iLuvwq6tR6yMswqyI9rkTWloLyJctUg6Klyp0VIHh7jYkA8FlSpS0dMKemyf26PI3Tqt5SPXoh+f1foiybeJbTQNqbSX5n0SNXMYxwdWD/ONSsDUr4vk6UYJpi2pNMzkEgnQW4TnCTdIn/6XJvB9/pQqddQkCKCgh6oe31T97tln1Uum2Y8+7IvgihbPCYAdx0kUw0GDITM8bzkhb9tIGkzuAUGBVAIlRsBaZUc2+OTgMNOYtE4pAkhWfp/3T
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(56012099003)(18002099003)(11063799003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GhnwzptQeloS3WeCb0NViJDzjMNU8SLhghCgL61QHBGIVicgFPNUTBw3g/Jk?=
 =?us-ascii?Q?Xn4F4D7r2qTIxXD0mXm5o6RHqLFPZxi+PqF7D7vIylw+zVAXy8yO/eajMI1k?=
 =?us-ascii?Q?xpiqJPeAzrnuZNXuendePoqFCn31FusHxwu9yLiaNPZNxUSwQbUSNQC7JdA5?=
 =?us-ascii?Q?Th6GDBV6IaBuXuCN+P6UiEaoeqftKID7JlYZBSq5znaXW5vVm5xBCQjq2FUn?=
 =?us-ascii?Q?mSH738E9heiQ91tLz2E6l5W50LuXrkhSAesMhEsfzXwJyNQqamO+kqFzc2fe?=
 =?us-ascii?Q?Sq6KRatQYK5ssQ38lmMLULuUR+V69ew5KqT0F5kX+QXEnODrb+nfBL/b+KBa?=
 =?us-ascii?Q?gO7H2jFrzsavAZysMI82fp77ioaNzipcmtU7qy2gBNUpW7J2nfUr1awlScEQ?=
 =?us-ascii?Q?xNNYwiSw+ahIRrt9/Wv7cblbDSSQ+tp5rkACYzIBYipW1r6lUpkoE0HI42/P?=
 =?us-ascii?Q?25IKV6A/0a18c6DjXhvYJsl5U58VLDULajuPNoNl61+p77V1dorqeNu0MXF1?=
 =?us-ascii?Q?vJ+H8myZ+8YZgcUbh2gJ0BVBNXpf6liOAG8LT0yMpQuPuUPRtE+YjwVk132k?=
 =?us-ascii?Q?TwHLVaK8XEAH1uz42nP8ojPEp0ID5wVZ5TkjCdthoe6opjAg15e2nB/3qqvA?=
 =?us-ascii?Q?uf6W7V+HgYQ4afXwV7aU8s+XwIpkihNc6fZz3Y9nISaFg69Zd28kTkZcJexf?=
 =?us-ascii?Q?9Cs6sYypbtE9TdULfrlmCug8+sAkl2pqKAaeEKpNtf4AzN1YYbQlvDYi0xaX?=
 =?us-ascii?Q?WxccKijsibqhvOVP/jxs2yUavzrPwiPg6Bt5u44KnUablQX9RyvSDUS7nHzG?=
 =?us-ascii?Q?vV8T6yd3V2ItSNIrYitGCij4x3sRgsgOUTD9FCIZkFLU7LrSuT9qejdPJUCa?=
 =?us-ascii?Q?7UF73ra5PNlpnW9S4RZW9viF2c87A7R9a6ZVvnwuJAsAceihiGohqr56xGso?=
 =?us-ascii?Q?0HPUgRg2kMIpYMvotUK5OykJOlLN0YkpxSCRsOSGZ677Nzi/k12x1UBwhVsY?=
 =?us-ascii?Q?xOKIxBzXAsnIpyOR1YpTeOW1XoEKbyOHwWm8YQutOrjOSuFiJHky/EENnjXe?=
 =?us-ascii?Q?kIesYBMq4q94icv3cdA8qzbOWITXfzTLCGx+EajqS0aK4WwEhAUPUsNxKxLe?=
 =?us-ascii?Q?UCGP0Ep1ZJPA3SSQ3XpA56MofRmL5Pkr0GhOYPmcsj7eebsoG8sO4UtP4Wqp?=
 =?us-ascii?Q?QpiA+mdw7pQyrqpz+MveABzJhGFsIDXWh8RD1fD7+HJCLW/5yTDe07il4MLI?=
 =?us-ascii?Q?qW0N5kgG6vJLnO16LqnE3hPIjeWOcopS8QoRYBSn0kiowZnNB3Cfnxmjhplf?=
 =?us-ascii?Q?ydGOjU4PCN/A8k8Cn0lhsBKLstL9rsBzndx/IcVPB9hEVIJm5mm0+Or6k3o7?=
 =?us-ascii?Q?pMstkgrNuXK4nM2iVXKuaMIVa98qZnE7h1tljZxSD8IQPrKmGgWR7ZcrqHyr?=
 =?us-ascii?Q?Q+dMClm5Bvvn2Uru9t4IRY6xQb/LlesxSeCoO+k4VoFTGOctP38ttygenOu5?=
 =?us-ascii?Q?mSexYodpnlflA3bAqW7q9WOezpX62YRYLzNZZ3lqp6hSGeVO398JdM8rzZ0m?=
 =?us-ascii?Q?72eyjkr+tWjtGhuS75RcS5HdzM5qHNRmLH9EJItuvVYJ7brXc2LuHzyLvzPB?=
 =?us-ascii?Q?gp+8OJncBL9rrl6Jtiu6/qN+WhMCMlvHbGHAqAM4h7rt+rw55EeSvnP//bd6?=
 =?us-ascii?Q?OSJNM+g8auK3yaEH8kDRKKDZTe/7Bijr/Ib+0iefRbPIF6olfZesWLzp//du?=
 =?us-ascii?Q?XhWUPbW0zjtdSPSx3h0n2p/x/cU3Hu54ApgEnkPnWBjZ+jjY8s83?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eeaae39b-6bef-4b88-8aad-08deb091bfa3
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 01:48:36.6075
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o4BYxWVEzWZaWaMVOY6wvc75leNDK30VGsD99pOWP2BHf9d3aiXUJ7jHG26Zeigqifowc3IrUNK31wRq3S0py1cPMgrSxjHhB+PieeWhf05V3NzqS6pCs374TFhJer/n
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB16179

snd_soc_add_component() try to rebind Card. Which can be done
as Card function. Let's add soc_rebind_card() for it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-core.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 691fd7fc5030d..ae8467d88978e 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2197,6 +2197,14 @@ static int call_soc_bind_card(struct snd_soc_card *card)
 	return snd_soc_bind_card(card);
 }
 
+static void soc_rebind_card(void)
+{
+	struct snd_soc_card *card, *c;
+
+	list_for_each_entry_safe(card, c, &unbind_card_list, list)
+		call_soc_bind_card(card);
+}
+
 /* probes a new socdev */
 static int soc_probe(struct platform_device *pdev)
 {
@@ -2708,7 +2716,6 @@ int snd_soc_add_component(struct snd_soc_component *component,
 			  struct snd_soc_dai_driver *dai_drv,
 			  int num_dai)
 {
-	struct snd_soc_card *card, *c;
 	int ret;
 	int i;
 	guard(mutex)(&client_mutex);
@@ -2736,8 +2743,7 @@ int snd_soc_add_component(struct snd_soc_component *component,
 	/* see for_each_component */
 	list_add(&component->list, &component_list);
 
-	list_for_each_entry_safe(card, c, &unbind_card_list, list)
-		call_soc_bind_card(card);
+	soc_rebind_card();
 
 err_cleanup:
 	if (ret < 0)
-- 
2.43.0

