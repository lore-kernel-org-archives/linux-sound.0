Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.55
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794288235;
	b=Rt9KmeYMlnGspDrwa4eQMNBAnPvyFQ1GZfTluNnLvvp7whaj7OYs/p4iHT960rbXy+dh
	 ZxkAw1S6UIzwnjYIgfBovouaG5TsBP36yvwHynUGnSvNf2Juk23HwCEfBwxn6i1Vz3SYV
	 aL/dL4Jv/cMpWKKGk2+UZEW2QfDgdv0acHcUY9cnGgqL6NZsMDhSnofI3Dqw4jvs8euKm
	 BqdYYwGRvGZcFO9ge8buAGvXrCbykHmPWaLNitaQpEx+sHbpAQmOPRqo13g87q39M8SJc
	 lc1PA9YQF1cGiSDzFkVJngU8gJXQufknWETBoj9hkSC8fi7TlCsthshAmIoe5rBcxuw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794288235;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:From:
	 Subject:User-Agent:To:Cc:In-Reply-To:References:Content-Type:Date:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=ea6tym0gIn80S27GZx/RFOT/1ElaT/OV6YR2/AWC2Y0=;
	b=xe5Q1jTOnpsJ5kspW2tUGreSsk2ZcxUfOFNhF/3k8nYXyRa0Q2s8kxmESwTqWiUXohZe
	 Rcq7gXnGF9csTOX3tOAAfNADMX9TDCgBdtEl1Xgm6yNNdg1eYc6qQz1MOUXKuVw0IejG5
	 aJk7y3M/Q8xa8FIqmriPQBQ3zapMa4dWMM2ERrPIbqdVJHo7gvylXYLaXxeF9JJhOyPZ1
	 SLuEZUNZPBOvhp2t9B/mYLIEYIzvLaniB+c6jpvoadCRSGENqE7U44a7CGzkQqyKSbDfB
	 TP8aTpI6ohogrIvrVv9IqKg/ZYwQveZQU1xZOOeWWymAsQHlp//Sb9o+kBTNiHlwuuQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=be2V4y9U;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.55
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010055.outbound.protection.outlook.com [52.101.229.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F365A606A325
	for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 05:23:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F365A606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=be2V4y9U
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RBuC8dC61T5d9ZiMqOZE3oZX02UOBfNOmTEqXbUlShp+AhfAmC0lM2NKuxFbjHJRTIQnO8kYN1LiG+X43CG13hIfLnW9Pr/gGfI8awI6OBdNCerl5jE9p5YT1uOUBhW6T+oqUVupvXCL12xY5K7r9KZ/LItg1c3f25xNj+GcQHZlWmHZl2FRvbJ2xpjtyQUJd6jZGQvkFxL7MVQmWTqDzu/NrPMvNyH2AIKUhCxZjkKxe2a6/fLINV2tJ5WILBQpWLxfJUIz5gZHyCBp2j5PsfAy3HHkyb8lNYJv/jC2e7C8IhwBN1Gfw4Ycwi+nwI67YM7ENvGurtvRu26mSQlsjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ea6tym0gIn80S27GZx/RFOT/1ElaT/OV6YR2/AWC2Y0=;
 b=WDYW5FjhRZume8EM+agNuM2OJp7Pon6RpdxLCw/0kmZo+BVukk9zt8ewK4gDSZ884cgwQD4yRJ+KkbJT+pK6C1V2hrlcKM2x04V8dD3TO8F9fKagC+LvhYn8dPgtCAyK+FFUYRdL0bBQFvwiKrKzAS4k8MxWHxpqELVnM2Iq2sS33nTHu7jQ2WmQ2JhYBEJ8w6nXWLmwF3Ii/p4zXu3IkFEggKRq7II9Ai0de9A6pxBROh7xCO8/uKrUlv+MSMSuOQTxGHLhrClbx0vyukdXesvSzaUzxEFR/KGOtymDa6bsVS2P8X+u4cll74MbKvuwttLCBOmH20cv+hcH4E5PIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ea6tym0gIn80S27GZx/RFOT/1ElaT/OV6YR2/AWC2Y0=;
 b=be2V4y9U3iTmTxVvThw6elYt6fcSYZ3i95GGcqHIP1lECrusXqhufgF6PhQL91niAmRUCRC1erSuhOVNmnUs9okpe7Md1h0GwVufKkRpNeweZ+tuloMcCz7kdbGlwLUMJ/WB0EutSqofNsXJyMeht0GBDc+rEA+1WPRHGCcaEyw=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com (2603:1096:405:27d::8)
 by OSCPR01MB12483.jpnprd01.prod.outlook.com (2603:1096:604:32b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 10 Nov
 2026 05:23:53 +0000
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d]) by TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d%6]) with mapi id 15.21.0592.012; Tue, 10 Nov 2026
 05:23:52 +0000
Message-ID: <871p8tntsn.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 05/20] ASoC: soc-component: move snd_soc_of_xlate_dai_name() to soc-component.c
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <878q31nttj.wl-kuninori.morimoto.gx@renesas.com>
References: <878q31nttj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 10 Nov 2026 05:23:52 +0000
X-ClientProxiedBy: OS7P286CA0030.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:26d::15) To TYYPR01MB15175.jpnprd01.prod.outlook.com
 (2603:1096:405:27d::8)
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
X-MS-TrafficTypeDiagnostic: TYYPR01MB15175:EE_|OSCPR01MB12483:EE_
X-MS-Office365-Filtering-Correlation-Id: 03ec2e42-19e1-4204-5376-08df3eeacf14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|52116014|366016|18002099003|22082099003|10067099003|3023799007|11063799006|261022105027099003|261102130727099003|261102123227099003|261028144727099003|261026121527099003|261009223027099003|261026140227099003|56012099006|261021123027099003|261021121427099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	E9xoL+84tP8dLlNXBmmltp7WE1e+qEuvv+Wr9mkQiuM/Pjb1z3zjjcWQJNnHKs0YqcjC8TjiBYeFbiTcpgJqIpYlr6OCrawa+ts+t68zFyiJhqtODSkk5E0FkuLI+qdSw7Pw9ulKD1RaHCLfFrWAXRY0gyut/t3C765JVpRK4R/IyePR3sr1C+M3cNbm/6+ecyg68woX9Jk35WAtr0aIU51IEtmVV0L5UOJ+MEUsT+ssuSKj83lTW1/ZozXplJFZvfGkmVyK82BLEEONQUDi0Aaun5jm6juQmgKKafFhOKPdQ/tKIYBN7q4vvaxtA+DrSxSMDxgaliy4e7ukZFgmc1oyrN57LYJ5gSp/1MA2SZs7JK0nBIyLhv+WMLIdMwsnNco35RUXxQIMxcEvM6kKnqZA5a0oDWfQEwKWgas3Nl/pk1A1hLp+Lxr6TYNWXPe9jR8eZjZ/NP3FOmlZzxzafPUNXlyILBQluvFpKIsWWyt0RcIPgO3FD/vsvdMscdW/e71oA11stOxFs1rZiCs1agckkIUWrq/3kKuXWq4+UKK1JfqxFkfZhfPJ+RPhqoyH2O9PVhmtnOc/6Tmg7eLIRu/ePXtqIxO2TWQin4JOIyiyaqIChnAdGyWs682YBI0KeIxdk54oLj/Gr4PxIuhn3UOunP6ZBecgFFAq9TWPRPp5aW1SuNYZMB7bHwbLIfZXgJ7mwJUJXu4kmCGRgM7w92Q6fX36ws9urp3QXsWTCKQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15175.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(52116014)(366016)(18002099003)(22082099003)(10067099003)(3023799007)(11063799006)(261022105027099003)(261102130727099003)(261102123227099003)(261028144727099003)(261026121527099003)(261009223027099003)(261026140227099003)(56012099006)(261021123027099003)(261021121427099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+rJKEg68fyWakun9sU3Y4GodxagoflLmHxqbeuKiObxG84eFMk0C30kv3wqY?=
 =?us-ascii?Q?7AUF+0rNNNx6wOqPlAeMZcf0dqyPtJacTX1qzOs28LvVRDGKY0FVUC0LiSD+?=
 =?us-ascii?Q?DtY5lcmRne/+0My5nBGUU0qfUkbN1mrjv/qXwpVIfg2VIU6+QPiVl3BoXVxj?=
 =?us-ascii?Q?PVKzblz4kuunU199pp8VVtn8aPmd3By4gUkYX0/8hewauh4tv2tbEy06J9ax?=
 =?us-ascii?Q?xsQ1koxApIhSeeHyhL5CatSB5k7QCauq7L+63/7hxXHMwCo2IAxU+tVBIfw1?=
 =?us-ascii?Q?xB2exvO39wlVZe7PidOiw6Gzr6tSxZYGX/TAg48Mqghyspf7PoWOJjIbi+at?=
 =?us-ascii?Q?GffX35N3Myrv+ghDMxGCSBN1e+VpoZnOkxCqB5uahq9Aaa3QmOEXqIFvnmYk?=
 =?us-ascii?Q?lIwZxgfWQHZh6NxLrpsIZNtHM4qpSRpnQZRpww6zlw5ARfjEPecjF8kRHzNQ?=
 =?us-ascii?Q?GodLHkBqEfFlKqP1BDQcz3sDpoRAn7AfB8g9DFYbC4ZVhJNoQ+UoNpTS5pUM?=
 =?us-ascii?Q?uOvFeukq4kYOljs1MXt/cYfLuz28N9SaAA5SO4pvguWmWhHQxNEYgqYjquAW?=
 =?us-ascii?Q?J877JNuC53ppGNVN4u4yknGnw81jCu9XRGphw5lhL5rldCUWTacZbvxkqJTs?=
 =?us-ascii?Q?C3xn0GktxXRk/fT/l48E2Y3xlVSn1WizkR0v1Hz+SC1lD/CfEZ2cMJ8qiV6U?=
 =?us-ascii?Q?RqCBqtfOwDgz/Bk8Ssl2JRVD2b+NWYsq7ZYVwMWKLDklM5Ksn8MUT2p0dWLi?=
 =?us-ascii?Q?Xx/KJquym5rwlMkwGQ2QSB21+dYkp1oWvI+i7I1FxTiZtNjZrUabXa5dwDIA?=
 =?us-ascii?Q?BKV7bFTwf4VxbMpZkHXkCd/SfawcwkANkQSXSHjG2rnVeT5tmQSGOUMuXKUJ?=
 =?us-ascii?Q?8YlXMb3iZGfz2sJdML/UrrhBiGIMR7vLK24bsieXxtgp1HLcrbLeO7whaWdJ?=
 =?us-ascii?Q?40HtaXtg373nz1rTsbbNF0ihj4pmXkKR+VLdty8pPOzFjeOBg7FB0fvcR1XY?=
 =?us-ascii?Q?vYX3nIntV+0v2tPvcSrF3qd9HQKCflIpN3h9LIuYeMD6/HpEWfz9zMoTf968?=
 =?us-ascii?Q?4e8JwdYYYLbASMXSvPTLd4dDEAoLC3D3A7VyznWJVmE4T0ptOPc4mpHmVL0x?=
 =?us-ascii?Q?abnsF8cOP4wf83obhjR2NREqxPQbZzI7uyZ286FYDMU33Co+h2rB7GOKfky8?=
 =?us-ascii?Q?Thr3hJcqIacfAlr+IcaSa1PYWqCnOO375edr9bUaEN33a+A7GAdFWIcNMFgC?=
 =?us-ascii?Q?erGhcmjDgim5TUJeOLiAN4TyGSf4VoussrroJXq82oGGRG1oaYqCd2uJXnw8?=
 =?us-ascii?Q?0rygXw70QYK2oImki2KK6jBTgvyirkVQ4WlVeuzLKbzuiAzUukkeO++vNB52?=
 =?us-ascii?Q?afm5Izo8PvsbEgN27yT4CRrrllq+vKwE3r+IsIcntMSda/vcV1j1xNGf8463?=
 =?us-ascii?Q?xMADGrzuZ8JVa64mZVWmJEkb1pjTlalkzzdxgKKRpOuE5mORNwfqDBG/mohH?=
 =?us-ascii?Q?mK+2zxVL0EGpa4ioaLl1Z/5bqJp0QPF6FK9p2ZC/eDEFMCTk4gyN56i+Saao?=
 =?us-ascii?Q?d+nq5z76RK17dcGVqmRLiXLEcBvQGW1odcuX13UX4Z6+6uQNKtiWOcZ4QGPS?=
 =?us-ascii?Q?lPwVeglvp1JGpzY+WigJzATo09N9G2W2w+DW4Bw1t3F7qhqtyUpBA+6uyeUZ?=
 =?us-ascii?Q?lAn/nlUHv3a5En7u18P0RqSnfsjKEO83qRuKUDyV+cXCODDyVbSm8DBvVKbQ?=
 =?us-ascii?Q?pOT4LARqDfi1Nr7XAzVQuLlT1w3nNlA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03ec2e42-19e1-4204-5376-08df3eeacf14
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15175.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 05:23:52.9207
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QGF48B/ZhsNcZAESA7a/yav+90iFOS9aGkUCtn3ygb8aTfRIyrt5DQzlpP2CBC9h9moPyklCFramTPg/Q+aTSCcdUFjijRx3N5g4l8t7gQEa+hQk7v8YakaN4QhzfWG6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB12483

struct snd_soc_component will be capsuled soon, its member will not be
able to access from non soc-component.c.

move snd_soc_of_xlate_dai_name() to soc-component.c

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-component.h |  5 ++++-
 include/sound/soc.h           |  3 ---
 sound/soc/soc-component.c     | 33 +++++++++++++++++++++++++++++++++
 sound/soc/soc-core.c          | 33 ---------------------------------
 4 files changed, 37 insertions(+), 37 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 009e0140a15cb..6d5740d5a5e21 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -400,6 +400,9 @@ int snd_soc_component_of_xlate_dai_id(struct snd_soc_component *component,
 int snd_soc_component_of_xlate_dai_name(struct snd_soc_component *component,
 					const struct of_phandle_args *args,
 					const char **dai_name);
+int snd_soc_component_of_simple_xlate_dai_name(struct snd_soc_component *component,
+					       const struct of_phandle_args *args,
+					       const char **dai_name);
 int snd_soc_component_compr_open(struct snd_soc_component *component,
 				 struct snd_compr_stream *cstream);
 void snd_soc_component_compr_free(struct snd_soc_component *component,
@@ -460,5 +463,5 @@ void snd_soc_pcm_component_delay(struct snd_pcm_substream *substream,
 #define snd_soc_lookup_component_nolocked		snd_soc_component_lookup_nolock
 #define snd_soc_lookup_component			snd_soc_component_lookup
 #define snd_soc_lookup_component_by_name		snd_soc_component_lookup_by_name
-
+#define snd_soc_of_xlate_dai_name			snd_soc_component_of_simple_xlate_dai_name
 #endif /* __SOC_COMPONENT_H */
diff --git a/include/sound/soc.h b/include/sound/soc.h
index 338ba5cf85fb3..5abebfa329b52 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1303,9 +1303,6 @@ int snd_soc_of_parse_tdm_slot(struct device_node *np,
 			      unsigned int *rx_mask,
 			      unsigned int *slots,
 			      unsigned int *slot_width);
-int snd_soc_of_xlate_dai_name(struct snd_soc_component *component,
-			      const struct of_phandle_args *args,
-			      const char **dai_name);
 void snd_soc_of_parse_node_prefix(struct device_node *np,
 				   struct snd_soc_codec_conf *codec_conf,
 				   struct device_node *of_node,
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 080568810ea5d..f717204fec60d 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -1803,3 +1803,36 @@ int devm_snd_soc_register_component(struct device *dev,
 	return ret;
 }
 EXPORT_SYMBOL_GPL(devm_snd_soc_register_component);
+
+/**
+ * snd_soc_component_of_simple_xlate_dai_name - Resolve a sound-dai phandle argument to a
+ *                             DAI name by searching the component DAI list.
+ * @component: ASoC component to search.
+ * @args:      Phandle arguments from the sound-dai property; args[0] is the
+ *             DAI ID.
+ * @dai_name:  Output pointer set to the matched DAI name on success.
+ *
+ * Return: 0 on success, -EINVAL if args_count != 1 or no match is found.
+ */
+int snd_soc_component_of_simple_xlate_dai_name(struct snd_soc_component *component,
+					       const struct of_phandle_args *args,
+					       const char **dai_name)
+{
+	struct snd_soc_dai *dai;
+	int id;
+
+	if (args->args_count != 1)
+		return -EINVAL;
+
+	id = args->args[0];
+
+	for_each_component_dais(component, dai) {
+		if (dai->driver->id == id) {
+			*dai_name = snd_soc_dai_name(dai);
+			return 0;
+		}
+	}
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_of_simple_xlate_dai_name);
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index b0dfdfe8d4a29..54a6d696d59cf 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1593,39 +1593,6 @@ int snd_soc_of_parse_tdm_slot(struct device_node *np,
 }
 EXPORT_SYMBOL_GPL(snd_soc_of_parse_tdm_slot);
 
-/**
- * snd_soc_of_xlate_dai_name - Resolve a sound-dai phandle argument to a
- *                             DAI name by searching the component DAI list.
- * @component: ASoC component to search.
- * @args:      Phandle arguments from the sound-dai property; args[0] is the
- *             DAI ID.
- * @dai_name:  Output pointer set to the matched DAI name on success.
- *
- * Return: 0 on success, -EINVAL if args_count != 1 or no match is found.
- */
-int snd_soc_of_xlate_dai_name(struct snd_soc_component *component,
-			      const struct of_phandle_args *args,
-			      const char **dai_name)
-{
-	struct snd_soc_dai *dai;
-	int id;
-
-	if (args->args_count != 1)
-		return -EINVAL;
-
-	id = args->args[0];
-
-	for_each_component_dais(component, dai) {
-		if (dai->driver->id == id) {
-			*dai_name = snd_soc_dai_name(dai);
-			return 0;
-		}
-	}
-
-	return -EINVAL;
-}
-EXPORT_SYMBOL_GPL(snd_soc_of_xlate_dai_name);
-
 void snd_soc_dlc_use_cpu_as_platform(struct snd_soc_dai_link_component *platforms,
 				     struct snd_soc_dai_link_component *cpus)
 {
-- 
2.53.0

