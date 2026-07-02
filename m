Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010055.outbound.protection.outlook.com [52.101.228.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772CF632
	for <linux-sound@vger.kernel.org>; Thu,  2 Jul 2026 01:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782956751; cv=fail; b=pcnrm/trgIEDcJS4uuD0DgLkMkdGVkzRLsKjzPaSZc6dPRc1IyDKxkCUa92mICWsMXwriw6qIZSTlgSw6buIQxVKpgpCrMWbzqdXojuBpvl4v45wAv9ZqLAkQEnKH6rIWhCJ2+A5tKUiVnNW9XeMgPIXvibCKUdoB78ucFBjVsQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782956751; c=relaxed/simple;
	bh=YysTjJxvYgAQFtFmgCg7eC09JF6TluFIkYvMJIX7578=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ifthtW4d+9/NptPDanS0NGo4apoWDQiL19WmX2ggaO2XN+rhDp/MPgV6jKjM2Tk1KJucEszubx3eRK/OG9CJoBICsoopWPJtUpj6+obQVK37r7kjUcGliQBrimY49H9bkgQ5tTbgwpHWWqKgE7AAQuAje9SCsmCtM2lkuiIQObw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=UuWl2WhX; arc=fail smtp.client-ip=52.101.228.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="UuWl2WhX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w29CVWLYwZcxd+6V07k1qgtPxCdtX3HJIaWyN4Ri+6VzFjr2fDS7oxUIXVtm0Myff3Slbnq7VH7zE8Jz/rcbZ03ZuBa4Mr4OHikT6Vz+Fvd6Gm6i9vQ9hytd86WnaYRlCFYSz5AqDlFcIKYaR3Bqlwvv7SWiZJ1NUGxfpwtPwqhVLC96rUhPBBZEBHSRJs/OL0u0V9U5d9gh8q5MFeEnWagJBKswZSPt8IohVKfM4Do0H9f8Ju7Hc2IbayGHki9HRXC6G0tNMW5ota24deeZFwG0/6i1srcjhdnjQ+whFQPPNVZHWY3oYaAxsh3Sc7zGGeoFJ3m4S4vthPWZPTI7gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tu2fZYym4ZhQIpiHTaAIvHp1JExKqbYdvBD4rJB5i5k=;
 b=uzBhqO1yZfA3bGoqZqE3afOE97drGFRlX+itNVPitQGHhtRZjgTfM4SaImNQV2M/JZovn9ArPkY8LIPRc6ebPgpHcVwLworXgWIrS4ccyZSTIZeK+uTvOFqA4ob3emoHNV2t0mXwhAB0X6seTCbBsppRSZ1/RHlPTnirFu6KEsfRs3JPeiumJJAMUezl5YovFCgGaH5qnedvZy4Z1Dc0np0qh6MqJWd/ydp/zFJWIUdti0jd8ScsXFD5y/aOk9/RBm5Lkm5j0ZT4kEQ0/PFl1a/z1/gAKdBo2xbbig8Yk2zFvygkqCWYJhyYUr/kXh2wpZSUfrmo0kLw35D5qcWqZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tu2fZYym4ZhQIpiHTaAIvHp1JExKqbYdvBD4rJB5i5k=;
 b=UuWl2WhXOwQWRNg0X4Mb6ZCmyzP+uIrgHH8fZYlM1JR4WsW6NJ0dVbsn2wp8hVKqGrf7ud+HIWb022VRmU9riw4PY434WdxfMDQQ7ZkHagptFFNMRDDKM8KKoADW/0FCaDAROrpp3VgsPpw5Y+9Zt9fzmrM2OH5kxVCpTZVM6S4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com (2603:1096:604:235::9)
 by TYYPR01MB16053.jpnprd01.prod.outlook.com (2603:1096:405:2e0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Thu, 2 Jul
 2026 01:45:48 +0000
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834]) by OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834%5]) with mapi id 15.21.0181.008; Thu, 2 Jul 2026
 01:45:48 +0000
Message-ID: <875x2yxiyc.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 09/12] ASoC: audio-graph-card: tidyup simple_util_parse_xxx() in audio_graph_parse_of()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87ik6yxj0t.wl-kuninori.morimoto.gx@renesas.com>
References: <87ik6yxj0t.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 2 Jul 2026 01:45:48 +0000
X-ClientProxiedBy: TY4P286CA0018.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2b0::12) To OSRPR01MB11811.jpnprd01.prod.outlook.com
 (2603:1096:604:235::9)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSRPR01MB11811:EE_|TYYPR01MB16053:EE_
X-MS-Office365-Filtering-Correlation-Id: 2122042b-f7e5-4730-3c47-08ded7dba406
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|52116014|376014|56012099006|11063799006|38350700014|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Bxsmkf4oyAYdd2axSKMQ0rCXGKOJlPENjoGlhYfDhiwRmQW3m3GJ+staRSgv3EbFEKhxWXkDjU4HF3+KInJSUT3brmsbgEssR07qmrglgBwkbbXZlA6UTnGHnXExqOAD3yLC7+b9On2zr/zJwkfBojfCWUhOLB55T5DTt8z9ymjtl7GKoJysZEp8DYWLxNIDiJcZIqXG6l6ccQ4FQ9Z/YaZo3rokvFpadn6Zk2doyM/uyq0EMa1zWJPcK0IRn0j/ScjH7lpg0ltI57x9/IMmTCP5SrUtQJ1pDLd71OUklPKFM0PZMw16IzOb9x40qV8nhpk7D8nGUc17OEH8jJ5GThfIY+FoTMi9sfSwNQGjcWwiS3uuRH2DE0pnJI8a9I0WgIV0IftfW2DpjxN6L125eHSkCnYPPOo3JXbFrWXQZ/AeBPuFpkj3oDljX0e9dCQ9YqFdmjxPwwl6OQ3ayr1RFiMO42ChfTpJJ6LJQjvaRok3wZrcAAoO0egcdQhp78NUNLwCaqfru7kcRVXK6DX5JtZJA9YSV6et8frM8TcQDADmTNx4Kx8m+0h7nrXyuI9oWsnf7liqF4NnVxStEFQrfA9gdP5DsrGe/tdd29M/mQn5d5UKuYZuy4PLUCvSCqd7KAY+qTtdeUVytC75AStqV7sa5+PuYDSIFPlF98jn0tndtGxmIGwqNGf+DRbBIU6S8QS9sMU12chrtWHpDyz0vIGP0vsT8BtJv2B8ulnnqew=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSRPR01MB11811.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(52116014)(376014)(56012099006)(11063799006)(38350700014)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gG00mRpbTvJdwVOIOsko9N4kzVQWTqBk+o/bZwbFjBwgR1W7BPtlZlNfo+fm?=
 =?us-ascii?Q?4yMZXIy9JaLwTrg67VoVaEJkM6EjGExMa+q0pT+UV7AmqoAc5rd1gsu/snnG?=
 =?us-ascii?Q?tWuG+Fj+z833pyCPxITBXeWMmOtOpXhIDdxUXy3QR4o/PfpmtYtP5QgWmbxm?=
 =?us-ascii?Q?h58h0joBbtvhrf4IJaDJsvWEJmJjFOy5aMGJl1C+i6FH5RPBWYz3cK4xGnvy?=
 =?us-ascii?Q?K1nhqWW4WMLCjbXDvrkEKQcvPHmssqn5SCz363YIyzskn+UwDLlJIg9L6nlp?=
 =?us-ascii?Q?sSbsv44EfeY8gqp2DqvhjNVsBkDPdyfZ948FZ88DADlN98KRqu+C2cj3RNwK?=
 =?us-ascii?Q?YLwpXyFEFrMzjQC+S2yd9Khm8QoMvQ+hrM1ekvXT2qzk/PQ8f/qNP2XmFxU4?=
 =?us-ascii?Q?LbI8jkLU4oXB8S5uuyrjITxw6E7lBP9QLwZOkeDTsprKfpf2ZrRiksImvm9k?=
 =?us-ascii?Q?qunHdYlpHIaSGkfeXCP1uul+U1eCaUuTC0oFf/709tq1bHRjDNMAJpkfDbC5?=
 =?us-ascii?Q?G2YRIrEBMOg8/5GRO65KxEYqCGGdRSEmAuZKVjM9KPLPn9oJjzhVzfpi6WX7?=
 =?us-ascii?Q?X+o9Nbny2Gdjq4jd4Q90OiSu8CCNGVCaTVjzKa1zLzsqZON1GrZI4BZavcaf?=
 =?us-ascii?Q?5O9wcSUDsHKwYi+wDqdUIrumr0qLDcpXW1lHIOHMrYDN+0uEcYgOFAxWlzIW?=
 =?us-ascii?Q?E80ll2P1464EtNAbeD56SMfVdWVsls2DJjsbBPbN8pH9o2plFLEHxSky8or5?=
 =?us-ascii?Q?b16FK86XX+W7lkF9stoJ/9heNNPd9ciK63q5gIMz30y4WzmUxH9pVhd6yGa1?=
 =?us-ascii?Q?APp2WlZdsCjtD6NTcYH5CjEVbSGTtT9BZdjlaSflbWnU1eccW6ood2jNsyDW?=
 =?us-ascii?Q?fD0bcwzn8hQqOqrRLLMhAkJ46vOy7PdSADyd8hQmMXg6k/bCmTE7ydVjxuDH?=
 =?us-ascii?Q?C+hLn27kxyiKGlmrR3P8vfuud6VARQxqMTgTPEjc0dbLJFEWlx5KOglSet8i?=
 =?us-ascii?Q?0NNuiK/wudSy0g3QWRtb/pGYtwfD2aDpWCArQDcgZP7YSjsJwHwxau6yAFp9?=
 =?us-ascii?Q?4I2lpdJGm+uzplBB3apu1pfmGpxTdL4Kw0nvmtMfZVveqoXhfxfdg2vdBzgI?=
 =?us-ascii?Q?0/8bJ3aAaJiNr7eC7FtRBZqauaB/7SJdsfBJvXNXi6yrDKCofGNklXfPni76?=
 =?us-ascii?Q?Bva9Paa1SBtp15p9NVff9UBf6v88BaBDUIO0u0qUPaVzrbF1BO9MSMIZcBDj?=
 =?us-ascii?Q?as6MfYt7ytrKz0dV5uPxoiPd0QGoysSh4WPqSDtthavpt1Cle3FnK1826Nv9?=
 =?us-ascii?Q?yVudGRoDxPOfGnWeKD0h/xXWk1vDYsGyUDCsKko3mCaTNq/gTMnUWZmYFvX7?=
 =?us-ascii?Q?K3D450ti03lol0cU5GdtFJoYb9erlMoPkFAYCDnhfFy33hq/GgW5ZEJfYX86?=
 =?us-ascii?Q?GiLBppJ1PIYGfsIvJGUMq0CvyW24Crj758CzyhNJ+MnHXlfm296O99iYwpEh?=
 =?us-ascii?Q?VOOf2ys4K/4oLosz8P3d6klAuytmQbrga8lKgPafjO9B/oxh+D1bRagF7ybu?=
 =?us-ascii?Q?3M1wDLQB2I/w5UxOP57gzDSU9q2PBMF0GBn2acjWN1EPeD/v9Rfmvi7yviPO?=
 =?us-ascii?Q?56k0hwBhFYHO0oZVTiDU6ZhjAtVTGNtMIJdnt32SLRekw3vH5g8NcSCgSg9A?=
 =?us-ascii?Q?VmQRn57VMBqYYiZWGOv3JJdyYhxQSYYjHGdu38DkV3WA81vYO4MzCij5vyTs?=
 =?us-ascii?Q?ouQDqQaSHc0563PJQgCPor52jMnsbeJIQwOqgoFi+8VGzR40lmv8?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2122042b-f7e5-4730-3c47-08ded7dba406
X-MS-Exchange-CrossTenant-AuthSource: OSRPR01MB11811.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 01:45:48.3950
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 38Pdf+xIy6728HpPJZkuZjJAH42mauUESjpwUYhyUOmDLY+e/1fjfvikwaRqc4EBEKFT6A8iaq8/z1d7Jdvu/dhHvHupWn7TKaMwDTcPisbrzQhKPnwEdo1XNJJvakyR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB16053

audio_graph_parse_of() calls simple_util_parse_xxx(), but are random.
Let's gather them all in one place.

Let's keep same style with simple-card/audio-graph-card2.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/audio-graph-card.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index 273b0c82ebea4..f5e36c777ac63 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -587,6 +587,10 @@ int audio_graph_parse_of(struct simple_util_priv *priv, struct device *dev)
 	if (ret < 0)
 		goto end;
 
+	ret = simple_util_parse_card_name(priv, NULL);
+	if (ret < 0)
+		goto err;
+
 	memset(li, 0, sizeof(*li));
 	ret = graph_for_each_link(priv, li,
 				  graph_dai_link_of,
@@ -594,10 +598,6 @@ int audio_graph_parse_of(struct simple_util_priv *priv, struct device *dev)
 	if (ret < 0)
 		goto err;
 
-	ret = simple_util_parse_card_name(priv, NULL);
-	if (ret < 0)
-		goto err;
-
 	snd_soc_card_set_drvdata(card, priv);
 
 	simple_util_debug_info(priv);
-- 
2.53.0

