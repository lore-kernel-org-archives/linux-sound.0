Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011062.outbound.protection.outlook.com [52.101.125.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDCC7126C16
	for <linux-sound@vger.kernel.org>; Tue,  3 Dec 2024 02:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733191837; cv=fail; b=r++gPRe9Bm7JoHgX8BQhR1HOG4Mdti4+WOlCEnyKnI/hAEFxuz4X2lYOO9zVI+CoRDDluprVTfk/AR31Ft+tLICtLDd31TTY1uKDcwyqo/RLTNucrMa6cB3XD2LiSAkbyCn1LVblpx4nKzK9q7XARjPw1t5pYWQqSsv0AgM/TSc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733191837; c=relaxed/simple;
	bh=Zen84/cWsFr2aNgHwBZrT5PR9aS8iPW/b0BhqwRibGg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Ki+9gmXOPAZQocwKtGwIJlx6XnZTWL6Uz0dW3fTKTRMsC3PIL+WyiDvfvqhqEyUF8Q3VRcyESLGFTIKONK+p4L+dsBoGwIeTuC9+bbZAHSThk5+61QFUCVnl550L3U52UfPctJ0wpDUBT5zdFZ1k6PYqog9EUUsi2t29ls5+lX8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=LCYSJOvk; arc=fail smtp.client-ip=52.101.125.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="LCYSJOvk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ex3PymQnJX+jylcsvbonohbBThftn9p/GD/FVM32IHcIG7E6ugmYme7kZaY6VB1Dsq/10V7O1HnkCbxctR47zMDyPB+GVCkHZ+1dJJNmDtH0bcF9TdVyHdSVCverUwnBB8P2gby/OljCs/DfAITDM0fBeWBGSY2Q1JzdpX5ifVCMSvoad9I949yUxiKLbixjn+L+1ao+GKiAF3rTG7Y/WMvNyQ1QGEPCV3rzqRutk9rS8s8+Lygh0vxofU7qYKqWKrGXEsUH9IvjFIbpzcp3sSuZqIHW3PaEl0lLpx3VvhA3X8Lc/boGmeKg+kSogLolSIle1+Q/5ZzS+2yTJfqtNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ftbDbBMxfzhNs4aqJ4+HazyW/PeW9B7DfWlraZopxPk=;
 b=qzMsZRycLjtEsxZyWWwxieEd7bq+N5/V80jdPq7/nPLrdO7BawwqBW8VfpzCwbqUtlO1J1NOV1/7OMAKFHdbw7utsxKY1Z9++t0u/tjhVKId9XysTY1+kGbLDcbEzPrJSCAGyoLmR2XavnurClMfI/1QVGR1kc4sm41S1LNUR6J5IhO0yGm/9tQqKoaXr8t/uHqtFNn+4yJ3/SP5zYRWhEY2/3Pyr5D+SVZ30eJ48xgZHsIYfNxYbcXJ5Kth4TT+f0I4yfygVifDeMKg0bJIFE7sigkXRFT8pkvSLXzJoBSndj516ZYVDbRDTusZpt04vzZlbiRv9b3O/CNkWSBO8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ftbDbBMxfzhNs4aqJ4+HazyW/PeW9B7DfWlraZopxPk=;
 b=LCYSJOvkR+IjNkbW5qmqkC8n/sKz0DTK2vtqlpatWiaKBXF2VwQ86hJk788ZJBHE6H1QC5BakFGkCsn5eqE2HMicQR6Uj2h8LmZ/AidTFypT0HgOX2hbEe/HyVabahs26fRoBPvidWlp8ekeixxn8Z9DwhC34iT7FutC38cEPkQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB13047.jpnprd01.prod.outlook.com
 (2603:1096:405:1cf::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Tue, 3 Dec
 2024 02:10:33 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 02:10:33 +0000
Message-ID: <87o71tfrdz.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 3/3] ASoC: simple-card-utils: use for_each_of_graph_port() on graph_get_dai_id()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87ser5frep.wl-kuninori.morimoto.gx@renesas.com>
References: <87ser5frep.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 3 Dec 2024 02:10:32 +0000
X-ClientProxiedBy: TYCP286CA0241.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB13047:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a4a18d9-20b4-4e36-0c41-08dd133faafe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nfwMUuDivA4yuSSbGn96MA9WRHPJbZqMZZnucARrnM0r0QI2lHhMNl091+W0?=
 =?us-ascii?Q?TD74M6K7Dr6/9E272JLBdhktGg4xgw+IIvjVp2E4uQ6o+u7AcByrcR89Xcbj?=
 =?us-ascii?Q?+gGkvzPk5HYi4v2sJWH/Mj9vx4hIeGJKEeEmm8t5U/6NvzVP/FEohMFDGvTW?=
 =?us-ascii?Q?cs8tTJ4GeSAWLY5BTHvIz1rZ095WTwm0NqNWAajoHyjrEPCr1fyXKW/CuTTe?=
 =?us-ascii?Q?DO1pia+0UPQgYPRI7brB4XmvSjKWK9s78A8bxwPzbP7MsL7OW+Gu7caE2pdG?=
 =?us-ascii?Q?XP6t60cJVDu/RwlC/hHSPmgz+oMrmTHl0ZlDXLvbLxQ7CUtk6cmsolu5zHTI?=
 =?us-ascii?Q?g78h5mJNJIFstSIB5X7r4IcM0CulL7ewEw+YmOcjUogYRiF2MTROgAOiYdFC?=
 =?us-ascii?Q?IrQCTmcGeygSRzP+eC8ZD9vxUkl+/d8emlMWZtYHV83obKnIkKd5SBhGSoKi?=
 =?us-ascii?Q?aCWE2Aj/OW0J1rRu3WtDkvyYkptiecGs1ezTHzvqIqyvmlY17ouGDr3x6jd+?=
 =?us-ascii?Q?UiksO5JKeEVo2uan1cC/uDC3QDraMD+vbF/EBY3ZW8hcTFuo6lFbZ2gV0VQC?=
 =?us-ascii?Q?iMeWrZTfX0ZVdqoMicuzHTYeNqsQygYJVrykj87uFMMt8WRZ5Rkb92Ch9CEF?=
 =?us-ascii?Q?7f7Q07RtmtCpdpzt6yPnMPspCJfEJzsvLfb7IPV219H2vANGTkyNpBchZKoi?=
 =?us-ascii?Q?F8uZ7ciBsRDLmLjIqkHa5O4WV747uQKoc7ht7kW2W+HYAGL7AsfFkN3i2dtL?=
 =?us-ascii?Q?AaFT6BBIqij7ffh1D7B5ESmVsjpsHkIPk3lQ7BumLcKa0jlHX2E9Okvi5pJk?=
 =?us-ascii?Q?6ozbuxIVTGkC2Lzw0cATJfnH7yjS6GR5PsoT2fktoSExkDwlmz6h6hYXC3Gd?=
 =?us-ascii?Q?IjDkbyuNrnHSpBxQmbWXLM4brnFu6OSiB7jYoOxh6s/oetyxhA2urwo0OwhF?=
 =?us-ascii?Q?dTQRcliRCLhh8m8AtXpHbt7JzaZsjszWXROBcHK61ookdn6zG2AghjwvHXMN?=
 =?us-ascii?Q?6Z/B4leObsCZqyIY8Fri8XY3DNrOE0YCQ212G+ZyhSS0vICkTv/nWjaYaeXa?=
 =?us-ascii?Q?Fi6Zvmq/TsWjY1U6xxPuPpoid9O9sH4W0yAOb+VRnbWvZHqrU9Nn9aEPL74S?=
 =?us-ascii?Q?ddehS8s0EQcsSQ+SoSEFWSZXUwqx7I7hzSU1nP6r6HfF9/d0zn6m14e/reJv?=
 =?us-ascii?Q?SX8d1PLYkEraJYb/VB8njQzGd11vscILQxnvGu9nqb0nwcDtCOezhhS7qZmZ?=
 =?us-ascii?Q?b680uOUqcJZ256AQ8zzqPWzJ3vJa8HH3KtLeOtICKh73SPsVUZdOG1oXiYIY?=
 =?us-ascii?Q?uyfIRYyfLl+dZcIIahMS602ZEfZqWVztrXkMVBfbGExT27iyuW3zEb4Z+M+q?=
 =?us-ascii?Q?MFl4CsYuT6YeRznvwN8lE2pShHRoSWlqgNDT1vLRzBlVSXjH4g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LTVo7VdZPb8FvqsbQU2ksCtBCF4UtC65oFvvVy6oxeLtM0RL/En1w80niaWl?=
 =?us-ascii?Q?oDkoYRdTPiy7Mkc+uzO21K/B7i6jU9rY5wNwq8nFt3pBtr9juPNhDH1xE2yz?=
 =?us-ascii?Q?vgRhnyf59jOO0cEKFOGe45FtdbVbdYuGjyb8c+oDcQ28hmlCArTaPB473VaE?=
 =?us-ascii?Q?ggfHswIj8PN6WN/wsctYy/MU7zrHI9xBq9DBAT3AiOcnCb/Dt7pvHYCtkJOe?=
 =?us-ascii?Q?23HWTbOF5kQcYpoiDXXBZDWsnP0BKfOi5wW0mBQR/OYq1qXtnBTDsmiKF38C?=
 =?us-ascii?Q?oNhBwy0xN82VwaC86uH3jhqVgp8VXL+cK6o69ptULCS9hSHIpQQp/QBWCSOS?=
 =?us-ascii?Q?Vomd4df2Lb20/ATWcj/viPT20vJf9Du6nfQYkhLBx3XbvmBJS7+VPxA/+uXu?=
 =?us-ascii?Q?q04JgGJx3HgBD2+mxVzpmf2mYMwxQBqQFXxzRdvXwyM9YD6y3LX8KtAqxjQt?=
 =?us-ascii?Q?xoMz8XCcQbGcgz7l8vL0y8tbF+HcEXWwlbZRlgSkJNhZ2W8Ke6GjmvtYQEUB?=
 =?us-ascii?Q?N9l3cDjzGhbLURUWWB5vO+T0iZ2UZoq3TqdrQOrrLspPnC0zVOoksx4USTCq?=
 =?us-ascii?Q?Nh7SZUffuZU44Di7PSgkeG31P5qCj3g7PtJeIvwTEPG4Xm5ReDfo0tGQbI1k?=
 =?us-ascii?Q?r9PQq7EKeiA0twxpLtTBkPk5q2o+Err475qNAsvDEvdlrm+Gk4IJQ0CC65x9?=
 =?us-ascii?Q?4+C0vT4+V33kfeyp8Kg7ZZNH+nb1rkLMXfTNi2vSXr2wNkKgzBskkLgMS3FE?=
 =?us-ascii?Q?l0eODuWkYc9TpmD+17dq37EQcdMYF4+us6rfO5B9A0eDmXthLWzej9yGs2Zt?=
 =?us-ascii?Q?OUbzMilEZFIvNFAcEJ//5mSJrDd8BvLLBzkBDvJL+XOIcepjnnzudupXV0lg?=
 =?us-ascii?Q?cThcFkdwQSOZPPpKWM+b+QQcE9k20KfWWBgVLS9o4Lmp/zxgHWZ7fHxafY63?=
 =?us-ascii?Q?xasdSeMEruTdMJFGN14X13DjQxPEg3VkNCwSs7UQUweMcWZmnKoN0oplLk/i?=
 =?us-ascii?Q?ztqHAtuMl1LGvmJKNmku32Gxu5UwmStNkHlcSIBhI7FGBpZKG0rwMsr4CMSz?=
 =?us-ascii?Q?ifOiojCtt5UNXWdNqqXtM3Ru2gSv+yRSpLDgxeFo5QyAj/IqWwx7GNhlkvti?=
 =?us-ascii?Q?hoHEKukb8t3hQOaxBwM+eVMh6x9ZGlJYkecvKxcZoRqhXKJx7kT4ax3x19Vn?=
 =?us-ascii?Q?DZEp8LZno5yxWdH/QjhROw0CRCCP6723sAchGRPFt/JA2re3phlHJRzY26mB?=
 =?us-ascii?Q?pYzzw3WXJHp81Yh0a4Fjv9M982LQHwl96IxVaCaA+zFrvTuy69oosPxXcM20?=
 =?us-ascii?Q?3AufW5xbasl+TnBiAloPTXH3ZzaImPT/Vcxipy5P4qqiazXNVvzWoKhtnzHZ?=
 =?us-ascii?Q?FJ2uH87nCYSVByHups0QWg7ylx1OvJylKl0blM1Lnner4bLU3FWAEn9NNkG6?=
 =?us-ascii?Q?W2TVvXP59GHMngnMf+jyiG3jvO6L1xQSjUBZ2/mwVuYLZwU/GAjoqv5Jg2s7?=
 =?us-ascii?Q?h/nm3pMqhHGt5CAEF5HnTa95Ar88d4vvPLlROOYjCQL8ePhG1iUwSB+8Ioih?=
 =?us-ascii?Q?aBru1d3UqzteuSpO32TSlpNMvPzjI74JwxQItPBUgX+pWyXPWkTXtgZFtu71?=
 =?us-ascii?Q?t7RKPwclXTFgTC0kh1/NqQg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a4a18d9-20b4-4e36-0c41-08dd133faafe
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 02:10:33.0413
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9qUg06GfCpXS9woUqNHGaOol1d4kb51p33Ju0O4Y9OMgAJWOYNgF3k9QhaEbama6wPAsNAaZRpEZ6M7+umIM/wwqRXgVSmPgNMTDV0tjh7Py7diF3cT1uIVxFEgp51fv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB13047

Because DT check when compiling become very strict in these days,
we need to add reg = <x> if it has multi port/endpoint, otherwise
it will get error or warning. But it was not so strict and/or
mandatry before.

Current code is counting "endpoint" to get DAI ID, but it should count
"port" instead, otherwise strange ID will be used for DAI if it was multi
connected case (A). There is no issue if it was not multi connected (B).

One note is that this code will be used if neither port/endpoint doesn't
have reg = <x> property on DT.

case (A)

	/* This should be handled as DAI-0 */
	port@0 {
		endpoint@0 {  }	/* It will be DAI-0 by endpoint count */
		endpoint@1 {  }	/* It will be DAI-1 by endpoint count */
	};
	/* This should be handled as DAI-1 */
	port@1 {
		endpoint {  }	/* It will be DAI-2 by endpoint count */
	};

case (B)
	/* both endpoint cound and port count are same */
	port@0 {
		endpoint { ... }
	};
	port@1 {
		endpoint { ... }
	};

It will be issue if Audio-Graph-Card is used with Multi Connection.
No issue will be happen with Audio-Graph-Card2 / Simple-Card.

This patch uses for_each_of_graph_port() instead of
for_each_endpoint_of_node(), and thus, we can use "break" to quit
from loop. Because for_each_of_graph_port() uses __free(device_node)
inside.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/simple-card-utils.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index f67a1e58e821c..6c5a1c5a6b3b2 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -1026,7 +1026,6 @@ static int graph_get_dai_id(struct device_node *ep)
 {
 	struct device_node *node __free(device_node) = of_graph_get_port_parent(ep);
 	struct device_node *port __free(device_node) = of_get_parent(ep);
-	struct device_node *endpoint;
 	struct of_endpoint info;
 	int i, id;
 	int ret;
@@ -1062,9 +1061,11 @@ static int graph_get_dai_id(struct device_node *ep)
 	 */
 	i = 0;
 	id = -1;
-	for_each_endpoint_of_node(node, endpoint) {
-		if (endpoint == ep)
+	for_each_of_graph_port(node, p) {
+		if (port == p) {
 			id = i;
+			break;
+		}
 		i++;
 	}
 
-- 
2.43.0

