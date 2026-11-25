Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.32
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795570947;
	b=NDXbtusQyT6mATD1WIRCtQj3K9w7iqquFzfqH9wBaDafuI5xafd5G2zZe4dhrgldhBj6
	 3sn5IlcL3HTZN53BLNYp1tFzX9Wa7G4pJ9lzAqISIp4PYLjwPUizE3QeZoBuZ4Y8qei7J
	 WypB6MlV3urrcfwOKTnwN9cQEja+9T6kdYBx/q+lrMqa4g45feXyNzLwChmKKnx2rLMvF
	 lo2ASF1rkRIRio9yAkUaCS++GJbCDOiIRRrfccNRFWiMY32AoznR8y/StuMdtVVWUQ8g9
	 bY+lOfw46ZonkydqaTwdyBkBQ7ysOBftks9tYs7JLXt1ZIynW0cpA0Y82qCU04VrlEg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795570947;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:From:
	 Subject:User-Agent:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=NU2mHDQIeoWdPgPlQZHpxqZ0JSAGfukM3N7UtYlZ6AA=;
	b=GIow4veHHJxBRj6Q6ZvZH08Vzgv9+pXGxzV2+lTI5XYnByt5nHi8EPt155Tt5zN+7T0T
	 wXE6R9agk+5t6YrZZPlr9IyHdB7gSKkwg08b2UH5urQt+5DllpX3RjSF8pmUDRsxc9PmN
	 6ZlJ0wDX1pe4W/PgpWTpQm09Fumh7fYrkmei/zCD1uENHuVqYE5R2kdEaW+szQk4+0Ah4
	 6MNsML4+MTC5jXFOfLomvBc/FEg4xADYLqJIaS5q1HMrJcu25Znj0edF0u0qNJ2yz2Elv
	 zNOh7p9Uym2piZ70yTP1I8/S1MgiXMgryxq4VMMjgvk8BDdNuDnjLrmQBTwhY0BKqAg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=FP0e4oh+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.32
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011032.outbound.protection.outlook.com [52.101.125.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69C5606A31E
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 01:42:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B69C5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=FP0e4oh+
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nVYdMgIxbdYWkab0WCsw4AwyBmF539JzdpF1zdhGNmP13QEyb+f0GpPoz2qnvLP6G5nnyxB4yAY/yjZZpU9lSXBDrXp8xOsnDa6cZHfLfqnHGr+MWgO2zIKXrX46CZTpmtL8Wn3sxaQQL6hX3nxfS8oR8po3jGbZNUccHt5w8Dq0PhuPTltaK1/Rzjaf/xHAvPjyLOivWc5Vj4rwtPFfeQu4I3qHOSzDoSW1oxDHqpLwdJCOwRCb5zcyhyoCHtgVZUiol9NoYTyNTrLlC9sJ3oWS6jW8q8XBdsHT00l5nogwlSlPbiH46bg3MaYr80uNcdmkh0vHoYO9i/35V9ytYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NU2mHDQIeoWdPgPlQZHpxqZ0JSAGfukM3N7UtYlZ6AA=;
 b=gpLXeHCQMh/5XRT3DY4Gy+uyygDmV+XnLXH9q7qDKdHFqM6oyPf+dv+IM9rR13o8L2ksGoJajPQwc9ifqIBMaBByTgqFjdMic+R+jnYY1AnK2OZ1QKpv+54qzKCY3/MFlU/qljylzkgZXdO8ZvpGeS+R2R4a/oNEMEym8t9vKOgbmnuWqvGKOPSraOZ9fXRjTxQ3+3jL+bYW6Fbe2OF/EfSSCTeqWfJEyt/Bvaoyw6JtEr/6QyzzMIwS7ol5PSYQUKY3kguMZLD7DGzt0gp3txl+N0sUAPJ4DwEXSvdlDTs6of1YdncohyOIMnWVsC1903frAKIvR84AWrzQKAhIwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NU2mHDQIeoWdPgPlQZHpxqZ0JSAGfukM3N7UtYlZ6AA=;
 b=FP0e4oh+v5zr4hYOGPiaq3+bkOWAH7ldndPDroHlKZk1GYx9icqJjucLd4mcBDdHRbikedxYIywuBX4YlsU0hlzilNZqrQpo+eZbtcoS4f+s/swvJYwMiOChq5DYHmmn+pRDEvEFGAfwOrf38R32EZi2jzHnGFe8cTs4NpMtbuI=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSOPR01MB749128.jpnprd01.prod.outlook.com
 (2603:1096:604:4ba::14) by TYWPR01MB9838.jpnprd01.prod.outlook.com
 (2603:1096:400:234::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.5; Wed, 25 Nov
 2026 01:42:21 +0000
Received: from OSOPR01MB749128.jpnprd01.prod.outlook.com
 ([fe80::6a3b:d29c:c743:5180]) by OSOPR01MB749128.jpnprd01.prod.outlook.com
 ([fe80::6a3b:d29c:c743:5180%3]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 01:42:21 +0000
Message-ID: <871p89g003.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 06/27] ASoC: soc-core: move snd_soc_del_component_unlocked()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
In-Reply-To: <87a4mxg01k.wl-kuninori.morimoto.gx@renesas.com>
References: <87a4mxg01k.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 01:42:20 +0000
X-ClientProxiedBy: OSTPR01CA0078.jpnprd01.prod.outlook.com
 (2603:1096:604:218::14) To OSOPR01MB749128.jpnprd01.prod.outlook.com
 (2603:1096:604:4ba::14)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSOPR01MB749128:EE_|TYWPR01MB9838:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ca177bd-f944-4de8-359a-08df4a9558a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|23010399003|376014|366016|22082099003|18002099003|261009223027099003|56012099006|261028144727099003|11063799006|261021121427099003|261022105027099003|261102123227099003|261102130727099003|261026121527099003|261021123027099003|261026140227099003|38350700014|10067099003;
X-Microsoft-Antispam-Message-Info:
	nl8cJPft6Eobg4OkLzRcPNjtp0MI98z6kkGwJ3T05GbepB0bkXCY9DYfHpYlhjwfLdrUDcScAxtB4lLI1i6ECIRghgprThVGBcpxiyoJ7G+TJT5pDW1dpthG8F0rQOMgTO6NcbsT78FbZWyRwDUbV3+TgmPkFr8MlS243sLU1+dPeHE7G4V0w6RqEOJW9jIMaMfu7G0mKi8XV0GktGDfvIGVnflqjILCt+a5K/v6KcYRolOQluWPvZf5loW8CD8nIVjHjyPIq7GJDEk19YMQixWdYlu7X1sl38iJQLVXbBc3YrvftRzjm17JkwW5MIuefkJtAldlQiwrij0zLhVlcD2MOkVyNSHsVST1CkscTCrCsWZNOCCu1cD2jIbjxX7RmpAcUvpP2Mfbh7QfkZHC9N8Z+xzcG5df09okr6crRpdiqX3URidSxqUgqtQtCP5jxo5SQFeD4iHKWv/2ZFYfMFf+s3Azarlok25lSHFMbWS7Ti6t3zHLvInujUDhC1Lw3sEuD/Tpdn4Mw+PnHfLQvhv4uOq7fCF0dykdvoEM5MC19das1Ep+rDMlEzb8VMbK5RqHN3mCWbtXw8hnxL6m+/hHiy+fh8gqJsEFgKeMOMewcZos+USSHAUixwwJXdntD0MO/8zXW/dZkCuxNdNFBVGVoyEs0soR8sZiUaxas5MEQiBoBbcK9fz2tJUttrm4pVh92jLQsCXgE+NmGZPL5eJ+HMcJPCv+B0WgfUru/Ww=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSOPR01MB749128.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(23010399003)(376014)(366016)(22082099003)(18002099003)(261009223027099003)(56012099006)(261028144727099003)(11063799006)(261021121427099003)(261022105027099003)(261102123227099003)(261102130727099003)(261026121527099003)(261021123027099003)(261026140227099003)(38350700014)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?C+KjMqGQrSZHpZ0W/IaDQ/FvEBW0Kp4QVbcPCRu5NpFh1a78lCkM+6umLk?=
 =?iso-8859-2?Q?9vUmGqOXHh7e8CYdT21pU4auESuTV691F98N+BXsTxCJZrH7WYcrNYS5t7?=
 =?iso-8859-2?Q?NzVLXW7Wd83gRo03pijHjppxQbuoYimhqamAfFOhZ6C9N2imVmsomOo6ng?=
 =?iso-8859-2?Q?G4S+Cpxf9P5VpqwAIAjbosUyiLQ2m59abmcPCkgVqUp6K8zKUp4wVscIA6?=
 =?iso-8859-2?Q?ZvhX4C3p11NR0KYUT5wX1jnQJIDIKwLs6E7KqIPSwe+m6/YjLp09aCbqkz?=
 =?iso-8859-2?Q?ElYvNyT5heJZqkPZ5ezd29f/c/oZDPX9lnIRZ21hXH7U4QJ0T/pIufzWZX?=
 =?iso-8859-2?Q?M0uN4YAalRk1mQgdHpAaJJUcYqYVUHcU01TVh7R+WHJrxxzE/cA0O5e4EI?=
 =?iso-8859-2?Q?yTI1ffVjZHlfz5rGf9tYZowZuV0E0ZZa0nAbzc5aN09utSeMJu1c0nLMcm?=
 =?iso-8859-2?Q?y4ICLi+ZFFGtBiJZ9hpsGddzV8L43fiTCQkelfAcYbwdo36h4ynrw5SJ4j?=
 =?iso-8859-2?Q?Mo175+36CWccLcT7EfReX4QU4t6zauhyqe4LOhWEJ8FY/qHTx2q/I9vkES?=
 =?iso-8859-2?Q?RSs1jKk7HASF8S62sitZjoDOZHE9KiEdgA8TEGrB9JwwG9fOtGHSDMmE52?=
 =?iso-8859-2?Q?rr3cxzUX32Ruxkf8O25DThutRmeUH3F3T9hdJTUxWONf8wggGUnxgRNxG8?=
 =?iso-8859-2?Q?CkiV3fJrHDJP/+ielvnjuf+4s4rppOIo44FhIilYJ/yBKFQagmA6iQBcmw?=
 =?iso-8859-2?Q?KeZPqB0G1a5hLWhCnmz6Za+yGKP2hSVv6/iQdMilEzyxkoBzYpHhTqEUo7?=
 =?iso-8859-2?Q?a1MzWdH770086QVUluc0fSExGk/5RpVJAVpJvlEzM0MkFzefsuKbwgZfI3?=
 =?iso-8859-2?Q?qSvHovCGfWxiZxZPEH8cSPzQoaqwh91HOaa8Ammjz6cCnIVkCqkyRpSqAh?=
 =?iso-8859-2?Q?9dTopVn76oZe9/qiFuj4tdbnVNJMqvlYZVQB47bnQI/7MYQApAeflHvkVd?=
 =?iso-8859-2?Q?Bt/2IjQyZZk3daKLcCSeKs+kFt6lR/miShamrKHStVxwpe8ZU8B+EbZxWg?=
 =?iso-8859-2?Q?IFYz+f6oRE1L4Jrj2Hh3xmZq1DUdHgGJT7CCk5uJPvAkecN1S+rcuCc3da?=
 =?iso-8859-2?Q?Rklac9YZ4qFBtwbj2lw68KyYCGO3yTRK5JDDI9smF4/WLlo1oYArXc0s0G?=
 =?iso-8859-2?Q?dqOBk3M+lDB0FJUgHA/MjdYDVcFAL+Q8WAESVfO20BzZvFouel2EV1j4AX?=
 =?iso-8859-2?Q?aj4Kmre7PQjHp1toUuIgSPM1SeAtt5ekhy/pPB06F1HzIyKX3xi0GovQLH?=
 =?iso-8859-2?Q?cjeYbJSCNI4QNvGxzlE2+TIzP4NH7RPTV0UusN1w7p2sN1VTJwY4ryeHvL?=
 =?iso-8859-2?Q?747KSQyLmodNY1W6IjteOHW7pVSnRlQljsaW9Besrc1OMY5c1tPf4fLGTR?=
 =?iso-8859-2?Q?XH70x17iQ/NwZ+LKBOF8a5M+7TlV19CpopLOU3kZwjrqeW9eNkzvx4q/DP?=
 =?iso-8859-2?Q?lRn7TbXPyzLLo0V1/tUkizuUF6plSw6B4jIgWKBGGn/uqjjAN9k61XnF0s?=
 =?iso-8859-2?Q?GJjLMUVpxs6Iga8qw1JjH9H1QAs6NFdEBTX1NQG3tIS3HEJu+LTJ1H7nYp?=
 =?iso-8859-2?Q?QOFUNOHquNYxc84EsTfDsmHHqg6qGejncsat4Sp1FxOlk6ZmSNK42eUoTC?=
 =?iso-8859-2?Q?ykh7EMKB25n+sRblhpneeaAgnkbpnbLNXZKI8k7WaukRRnMh+X8buvR26p?=
 =?iso-8859-2?Q?VI9Gt+a89LhbAZXKiqtuQYs6LgzyFC3Rsc7HuOKhmn5jLDdpu51wnJaBal?=
 =?iso-8859-2?Q?xgtHtbzHw/mK8eJA+PWz54uIumSa9qI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ca177bd-f944-4de8-359a-08df4a9558a7
X-MS-Exchange-CrossTenant-AuthSource: OSOPR01MB749128.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 01:42:20.8930
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: meCZu6eYDJlgu+hQjN5lvr2Vt/KLEtWICkSrCc6O6NpYCx9L/DEV/VWYdqinENwl1zaFSy5yxs4PdfmZavY3ppE5guovKDNP/ZVBvp9XdpD7iVhTjDYWurwOE96w1R6g
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9838

No functional change, just for preparation for cleanup.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Alvin =A9ipraga <alvin.sipraga@analog.com>
---
 sound/soc/soc-core.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 7dfd79b4ca3e5..15d466b5ac15c 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1457,18 +1457,6 @@ static void convert_endianness_formats(struct snd_so=
c_pcm_stream *stream)
 			stream->formats |=3D endianness_format_map[i];
 }
=20
-static void snd_soc_del_component_unlocked(struct snd_soc_component *compo=
nent)
-{
-	struct snd_soc_card *card =3D component->card;
-
-	snd_soc_unregister_dais(component);
-
-	if (card)
-		snd_soc_card_unbind(card, true);
-
-	list_del(&component->list);
-}
-
 struct snd_soc_component *snd_soc_component_new(struct device *dev, const =
char *name,
 						const struct snd_soc_component_driver *driver)
 {
@@ -1505,6 +1493,18 @@ struct snd_soc_component *snd_soc_component_new(stru=
ct device *dev, const char *
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_new);
=20
+static void snd_soc_del_component_unlocked(struct snd_soc_component *compo=
nent)
+{
+	struct snd_soc_card *card =3D component->card;
+
+	snd_soc_unregister_dais(component);
+
+	if (card)
+		snd_soc_card_unbind(card, true);
+
+	list_del(&component->list);
+}
+
 int snd_soc_component_register(struct snd_soc_component *component,
 			       struct snd_soc_dai_driver *dai_drv,
 			       int num_dai)
--=20
2.53.0

