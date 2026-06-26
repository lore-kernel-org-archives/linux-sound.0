Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011022.outbound.protection.outlook.com [40.107.74.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4806E3D7D95
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 06:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782455310; cv=fail; b=PDIdKHPjHwpJqaR2rD4jekGTwapAyubiKW9rtJFmIPFharqtkgWXduc4bfOVp/xXlNkz5uIstSTYPLhlc6GwkYNemQOUk5Zn1VWDDq8VJ+fGzGDj2+NLkEM0JDr74ZYYm77OASDrBgjxRpIGBjKnHT8oFgFq9y03wvrX13UmXTs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782455310; c=relaxed/simple;
	bh=C/stDVonAfSRnicIT1WQH/bXBWaW/a7MDncXRSKoH/k=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=mspWouLnDcKBNwSFYXc/OVaRb2Ck35y3iVsgXoRmPfUwuGFOEimvDKCYTQJbAVpR2Twm9Rv28yv1i2xhKn6mdAz34WYLDVeTdxidDm2CZFeRRTrRaYVWw9EJvd+3RJKaewCVlOuETarIgUzDCBGQKcT7hFHzJHtlf+vhP3Ku0Bs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=grBYKq+i; arc=fail smtp.client-ip=40.107.74.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="grBYKq+i"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AbWYRxKbzapWmb3IjrwH4gqePxKxX/XKQeVHYoPUWbgBR8gZjhsBYGU3QqOPn5FiCdpHbuBobyOPd4I/aM33LLGeTX2a/lHXUmXBOMv5ysvqWCQSV0uDV6590kNoaJqqbCOEeKp3VXtrX/z6GCHWpL52za1Ua55aCrDw2dodX1PxdPASH/M+gFhvuWYLbiXXEQS9jQhV9yWF704noY6XY4vX3dhXBTVR5leZl/5BTQGBafj3QFzqKcYjEjZRFMx33tk7xUmVz0Ds1qXnOMt5WqLu+wkBmbgtGPuCxCHll5k4o3mwVUyqQB6oNkxuTMld9FwErDkpn3EIhp/BP66meQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O4BQUv7DAmCvGOkAQuFSY0ff9xqq8sKFxHDvuxLxlik=;
 b=KuJtz/1n2WajrBkM99qOIuF6LtskOqd7FIx0DTthFbfM/YjsjnWDIN2So8dw4j7sE3ngVfObh49G8WS8Yt4mGYDy+bNrv9wnhQ9nzqOWRTti1Qnz9ZREUWjwirv3Y9X/yW9tubXUKoeYl79r1ndrXz9VUWv6NK2e0FAsiArPtI7Q5KIliHLSjykB0NII/uoW+jSSHgfBA6fhDs/q3TNn/fk12BjTahirdqGgl4mcCNCXf2fc4WMAOpfvH/ZAn5n+FU9Qw/TRsMOQjTLYLqBYSI19Mc2J5PeqE+r1w2ZAPuNluhbE+te3ws8SLlUfvEszbdiud2hiPG0An3BI/eHgSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O4BQUv7DAmCvGOkAQuFSY0ff9xqq8sKFxHDvuxLxlik=;
 b=grBYKq+ivfqn9KYkMEu8qTnJezhJlKt+EUq2eMdJ5wr97Ked8No9RX9FMOu47HRyMeIGEqrz+ENOSAxWYlu1GdNloCBmMH6UAHLAf/iye3rITjb6EuAZ+4Rry5JXEbk0whDNftw0jKMf56/mzZ9F2vTxjHIaEfeib51nDL1W2Jg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS9PR01MB15751.jpnprd01.prod.outlook.com (2603:1096:604:3bd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Fri, 26 Jun
 2026 06:28:27 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0159.015; Fri, 26 Jun 2026
 06:28:27 +0000
Message-ID: <87wlvldddh.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 07/12] ASoC: simple_card_utils: add simple_util_parse_aux_devs()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <877bnlerz1.wl-kuninori.morimoto.gx@renesas.com>
References: <877bnlerz1.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 26 Jun 2026 06:28:26 +0000
X-ClientProxiedBy: TY6P286CA0039.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:3b7::7) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS9PR01MB15751:EE_
X-MS-Office365-Filtering-Correlation-Id: fabaeece-33db-4bc0-9e12-08ded34c21a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|23010399003|38350700014|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	2Xxv27CiHKubbousNZ7EBTujMGsNsC3hyIg12yBA4jZk/EC2901mawzQqCOwnzUEeZQ47msyNzRZjijVDbWpuFphVqTDbw0r+ZJT11v+d2Y3pzPS7MshLm7Hz3vaGx6CFVhAZYxX+ewe/vHcRFF8tr60yGWHXUMrL9qy+tqhPHDvMf3wzY8/g5B61Fd/faLp/me9phtqS5dVX0NgL9vWanlARBvXSCXSIBD+64BC1PCH46IsZLsm+2gfpMFJoLvePeWJ4HzLwoLkOwfLWusAfO87AxyFWDsU6ZlJEhzRaJ5WH2M5mdJV7KSc5422gwq5rCNYSnqSjnTMmw5PLGbpn3MD/tsS5WtfrAlHNxkyRNQXieZIwxvls4F7S5s6NFXgP7ZMAXpNMCFfXL9wstgcwDR0fPmqT1BIUVw5jleUAEUJVyBHyTgyr1vFkhdtnII7hTK+4OX+QVzhZUNV+OFNVoKHUlIa6m1iX8tetWkfEQ2vLiDhEifdtSVVKLnKHAIcW3w4sPiNaBcMdj7lTCdu2eZ/RfP6/Cq3SP3jF3ffhCzIKC5hi6OTpQ0dVV+u7oMutpRzhV3WmZfAcLTVYZSnzHj/3E33NoANj3oaB/w0Yz3kpZMr+Czbs4bqURIDd9Ta/bc7F7d2J0hSGTgch3cgV5vHcL0Aju7uUSw/e/X73ZLPlXc5Jqg1NYY84fPW1CTkfUCFV34zhK1tCEcvAaz8KL70/KSJ+TnegY8T3yWrwlk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(23010399003)(38350700014)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vNwlrRWPX7rlArfa5ULvMQW1P+Rugk9akwsCOXTtREO3TVaVsRj1Qg4Q4vpt?=
 =?us-ascii?Q?nVnQsfIj0kFWtu1BZcdg6poi80C6MMuSiucIve/2B9Bzo4yfnxuPnv6ho5Nd?=
 =?us-ascii?Q?coLIOmTGC/hrMfSOo1W2/r+icbr2WJLQ10rtGPUyVc4vtldgMU72BOmB5l51?=
 =?us-ascii?Q?S/0DXY1sMgyuRjl6muH6TUE1+rXoi7EN2xdq/4Zd37KE+VNNxN94Oc6wjCCX?=
 =?us-ascii?Q?npY8hepiWAxMYIzDgDXgI2iy+g3Dw3tTZhoxVOd1Fr2EuiewjUAETUeccSvT?=
 =?us-ascii?Q?xVoymmMRHTRfO9iQWaPPSY/ov1ewZak0Q1GnugVxu7s+UPFMJSWf8hNlariy?=
 =?us-ascii?Q?TqL6wYNY9k8Qa1y766J1iunVoukbpZvejWNMTclnx9t/6CXYfUX6z/OX8+Bc?=
 =?us-ascii?Q?GqsCP22uJM1dtDMc3e2EeJZdCm+ZeDQjfnrL7CdEFuTty88HraMc5y2zHLIb?=
 =?us-ascii?Q?FRQN4t1o5gI6DPCghpaRF3bN+Zs2yRv6gdI6EfMrQbqqWRyOpRL5IoyWJP8B?=
 =?us-ascii?Q?yrj9c0QuFtgTR8LwdWVMcCSuw6aEor+ZVqj5YE7GcmMlZUsVTe9nXetAsM5x?=
 =?us-ascii?Q?2f9YG2WX7Oo55efdkozK7qAI5f3umEM/5BdW3xg5IbokO8PLzjpw/OXhjrnw?=
 =?us-ascii?Q?cCb9NL5aBr3wf5+sXpVB24dmOcWGRnA3VPukC70qyqpXa2953hqwAdFQD9yr?=
 =?us-ascii?Q?RiSt8bqAclQuKbbtUzxfHm7ig5thbm830sjNmsT47XzZ5LmPbz0uBEpp2K7h?=
 =?us-ascii?Q?/bUrFiZ/W9SLtiB5v5NEd8jehRmwCdilK7goTHffBG4K/MAa70IZobLys+w9?=
 =?us-ascii?Q?BeJCjPSdj1YeR6PHQFF3DP1Xa+gWxdnYAFYZ+KWjS0rbH+0CA6FFKaKMZ9I/?=
 =?us-ascii?Q?dzUGdFPrTNN58WRhR43wmUp3mhw9Q54y8elj1WeElhoLqVj8FaqtnVGj7cm4?=
 =?us-ascii?Q?9EvyTHn0laWP7udlCJgZmp1CLUMFvOhc1th+4ZTieX9zR7TH31v1KL90emkw?=
 =?us-ascii?Q?TRGkW/ZlrCPU1l6kHRIbJn6wLuas7jGYApcc7w4/w4UVXO52Q6T9NO8pElZJ?=
 =?us-ascii?Q?W5EMcI676g3/Z065+rHXwUG7RNs0n4/UpGEmMxi2AMSp6RqN3Jn2XlVGm7h2?=
 =?us-ascii?Q?f9goFedDuzcSqXPaH/4v04nXEIm9MYZ8B3Y1M11+2thLATv9HlMZ+QusucjI?=
 =?us-ascii?Q?gXfbe7n9rnUSlRA8vJZlEH0BX8h0QLGOisNabkdby3w3qhrkvss1RO3uyJGw?=
 =?us-ascii?Q?n+/2pAxf2+dUfnGUkJJSFZvOZrELaSXrw/A7bLtdGprWTcEfhHnbkOpIqRwp?=
 =?us-ascii?Q?9zMRmxIwakytRwdKdZQHxg633CLrf7QtDUhaXiwPsCE2jTYogq95JnLCI1Iw?=
 =?us-ascii?Q?nZ4Qf7J0q681+qwchKtIWEBuPhfP3AFNIPogEpfRtUDNpSq2ZwggJ8jJdCkp?=
 =?us-ascii?Q?1SbJ9d1UPtwp4rooFX/UtAOwFkDZmyMkQEHC2BAj+wkJsjftEBDitjs3mOWV?=
 =?us-ascii?Q?tKvVZJ6DtkFdDovMM1o+1EdBv/ty/n2XBkAJKK6BUazw1U+Dx4H2X8bn8DRU?=
 =?us-ascii?Q?yV7hGKj2OpWLdd+zWzvlXyv0tIm2W/tXnv7ReLO9rO58Zix3Y/zNDu5b6esj?=
 =?us-ascii?Q?8fdF28LzaflNcCUHNOhy0izz6YDViROgR5glHdHdJPS/pMXYXevEab+eXiqI?=
 =?us-ascii?Q?e8yVhyvQEQmRTClIVkuCQQ7fFN6Dw5oruyK6CrdZXey95+7jYeGSpaKlP/hP?=
 =?us-ascii?Q?FQvXi0sp54AlkPtTcTVKTKnOP6SFS0dX1LXimK0mNEe/6tvEfYe2?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fabaeece-33db-4bc0-9e12-08ded34c21a7
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 06:28:27.0160
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FFHHcS5qvYBp+SYp4y5s8dNVtIzOwthp4F0q2veKUgey3eZzeW3+VwPtugSd67h6YScX2l+vfrS/LbVHNcvfN5b/87AHfHgtCNK+RPGn0ffR2zTnpXsB740fVsBs1KOR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB15751

We are using snd_soc_of_parse_aux_devs() directly, but can use
simple_util_parse_property(). use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/simple_card_utils.h     | 5 +++++
 sound/soc/generic/audio-graph-card2.c | 2 +-
 sound/soc/generic/simple-card.c       | 2 +-
 3 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/include/sound/simple_card_utils.h b/include/sound/simple_card_utils.h
index dfa1b5fb7aa87..ff9747c6aa49c 100644
--- a/include/sound/simple_card_utils.h
+++ b/include/sound/simple_card_utils.h
@@ -210,6 +210,11 @@ static inline int simple_util_parse_pin_switches(struct simple_util_priv *priv,
 					  prefix, "pin-switches");
 }
 
+static inline int simple_util_parse_aux_devs(struct simple_util_priv *priv, char *prefix)
+{
+	return simple_util_parse_property(priv, snd_soc_of_parse_aux_devs,
+					  prefix, "aux-devs");
+}
 
 int simple_util_init_jack(struct snd_soc_card *card,
 			       struct simple_util_jack *sjack,
diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index 7daff3b54e052..9c5fff368e39d 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -1375,7 +1375,7 @@ int audio_graph2_parse_of(struct simple_util_priv *priv, struct device *dev,
 
 	simple_util_debug_info(priv);
 
-	ret = snd_soc_of_parse_aux_devs(card, "aux-devs");
+	ret = simple_util_parse_aux_devs(priv, NULL);
 	if (ret < 0)
 		goto err;
 
diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index 6e432733649fe..4dd05e7262136 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -720,7 +720,7 @@ static int simple_parse_of(struct simple_util_priv *priv)
 	if (ret < 0)
 		goto err;
 
-	ret = snd_soc_of_parse_aux_devs(card, PREFIX "aux-devs");
+	ret = simple_util_parse_aux_devs(priv, PREFIX);
 	if (ret < 0)
 		goto err;
 
-- 
2.53.0

