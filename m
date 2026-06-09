Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011008.outbound.protection.outlook.com [52.101.125.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BC7221FD4
	for <linux-sound@vger.kernel.org>; Tue,  9 Jun 2026 00:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780964625; cv=fail; b=PgjkkqVjbQ9kREcaoDlIsS914pddtZ4g8YbO+CBs2l3/kT63FeW2k2FWz3ZN8KE4V2U5F6P2fqi8GtjiSbTLJMSgovVORUCorb6qPB6lqDj9sUZrgstFXAzYWV39gHf9AoMap2fojShwSODJuc+QV7dYWtU/TNIW3Yo3WxSHHio=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780964625; c=relaxed/simple;
	bh=U8NL15HWyBtMDrJw0hZx4E9zif1yQr4CxxdvUF3G50c=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=GIg7yzKTvkCODo0kxO5V/uEFxPLpfMM5UfVlXjuwZGwb1omOYz1zawcFWpXASvwF3hCi7vKYFXwE1uG4ovP39UNFp5FDOjHJ7GqrfcnJ3nodsdtfuaZOclka1bz4pfvelDsq7JNJXnB0v0MqgFw0UAEUDGaLb5coqsWYIlzFZ2E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=iC+GcpuX; arc=fail smtp.client-ip=52.101.125.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="iC+GcpuX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F/LmIXRKHAwbCurVxYgy3nqFBIATyHv+siZwhgotpLmiewRjvVaU2s/ELJlYV6AHNXc23Fu/AX35p4Cr/wwSVckIzaEHhtfSKdUAd6Y+ml5/jsKzl4sZYPOVH/X0cL74ouddtSHXKhBNtQC0T3GHArqyB9+cdgIl2awLkbRbhHOa7nqcceJG1zxmvneaJ/gHxpqNM4WyYCgoK9SMGDjPv2oZk2uTP2xk63sjw70usxfqCILK/LhEpBbKAXoFnOLpIuU5c6ACVLPQPq6+X3Wgu/KUKF3zSTLU4PtulWHCVJOZjTMqArLXZoDoQsW7gABoib3najPN4SXfYBfys6YYEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3UW6ReUJFMQJh0duEOnOi0NfiAeXC6xi1FdjMCLqDzk=;
 b=Nw6KvBM0alHnstzKFM+fwdlLhfxTjlAUc3LGUfw3eK+BX5xJNx3XtZ0/rza22BC9PGg35xI5BiWn92KetqTcKCM673YGq274YRiPPzZTvIsnjKJcY2WFu0uoMUkYwGDeN1ZHv76Pd+uciSJXKUDCjN+04TsFdw7O2u36IDmwKah4QHG5aDcFUXNef4p4dKGnqjuWhYyNDIeV/NWa3kRrCXYKZcGP5F51C7xHIpXfVsBzv9oZbzKEu0dr197sWRVKLObzJDieUM5uIvmBo7oZRzENFXqSKY3ppKJL728K5aTA57LYRa6F0jyQ+G3PcCAa1Cbr38kAy+gw3pGuQtN/JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3UW6ReUJFMQJh0duEOnOi0NfiAeXC6xi1FdjMCLqDzk=;
 b=iC+GcpuXJB9eupj6Q+AP95tw0dqBv834t+tXmivBOP2OQSN5J7QClIAI4t6yVjmvyVN8xAAg0cK0Ebw5T70H6mEc7wlZEDk6rUYG2oKQ1PQkJVVcrUROyT3F1bCi7DAbjvs3Af6qQs4ztftd9hPhKNhStNF6qik4cTM+OOaevlo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com (2603:1096:604:235::9)
 by OS7PR01MB13877.jpnprd01.prod.outlook.com (2603:1096:604:36a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Tue, 9 Jun 2026
 00:23:41 +0000
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834]) by OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834%3]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 00:23:41 +0000
Message-ID: <87ik7s36k2.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 9/9] ASoC: audio-graph-card2: recommend to use auto select DAI format
To: Baojun Xu <baojun.xu@ti.com>,	Geert Uytterhoeven
 <geert+renesas@glider.be>,	Herve Codina <herve.codina@bootlin.com>,
	Jaroslav Kysela <perex@perex.cz>,	Kevin Lu <kevin-lu@ti.com>,	Liam Girdwood
 <lgirdwood@gmail.com>,	linux-sound@vger.kernel.org,	Mark Brown
 <broonie@kernel.org>,	Sen Wang <sen@ti.com>,	Shenghao Ding
 <shenghao-ding@ti.com>,	Support Opensource
 <support.opensource@diasemi.com>,	Takashi Iwai <tiwai@suse.com>,
	=?ISO-8859-1?Q?=22Uwe_Kleine-K=F6nig_=28The_Capable_Hub=29=22?=
 <u.kleine-koenig@baylibre.com>
In-Reply-To: <87v7bs36m0.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7bs36m0.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 9 Jun 2026 00:23:41 +0000
X-ClientProxiedBy: OS7PR01CA0163.jpnprd01.prod.outlook.com
 (2603:1096:604:24d::9) To OSRPR01MB11811.jpnprd01.prod.outlook.com
 (2603:1096:604:235::9)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSRPR01MB11811:EE_|OS7PR01MB13877:EE_
X-MS-Office365-Filtering-Correlation-Id: ac3304b1-ced0-420a-8c93-08dec5bd5c0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|921020|38350700014|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	vjHTZNxvmU+qE0vMhxNVcq+76ukMpUEaPqBrm/mU+Pi62jsX0K/LPOc+kenwxE4yJl1AB13H6RLRIOG01tATcuixlaMaHlNJZzCd5jEDj6Ks8d8ReSklDTeN+2uBGA3yOtbayonce1IzwwSw4Yt3cleSFT6aJdhAV4zzoFvKXx9Z/PuAZdKl8671PZBiJ8DUarbMkTKlKwSXSpOdkWfDuzO8NweUwFvKvddf/9F6VFxKA3op9bQI4QQk62VNGbYwPvpCAgA47XoNn+j+cNld+A9UT58ZNVmRzyDnv0NtvVLcPsd3ILZOLCvyXdcKs4KDF+8+KlZ3wcs2ZgPjyHPyInJcalhBS7Gy8HT4qhnhf1zcCBc7dbJt+zeRaWCsqkJQNsV6ocm4tux6Ranv8ZB+AF0jOKXFAVDewHwL7tTQ2iH0ur3RZLQrsp0g3UCUg3gB8ZywuBTKr91Ic69CwO3yFeIOnu9vVBrlbab34tePuZsUo7P+6Ftcb6UjfHESXe/I+dsDO2d34Or13vfJLbWLxlv/qk5rAOlvxc/rMJ+zhKGUPGePJtdoJD/oC9lZX6uflrKuuMAlLZFf4Gt6Yt7WHnuITBROahK6VVVyMc9gyZlfC/s/ee5kgEBbhtpthJ+VJxMOJROZGOYUkylLoxsMegk7qzd3hK0wJZsP66cnc4pTH0cE5TDpY299i6d8TBC8pw/FAfbNzMgAL86mJ3MQ3jAc1xQ8vQagz7stzkTg8PPSlNIUWT/P6DmiFvAorDDYaLnMsX2MHF1yMj7p0SiDVg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSRPR01MB11811.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(921020)(38350700014)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qUi7XTClgBkVk8g4ZBU9CpfSwPdkFgFUPdPcxxk293V6q3WBE06rHQot1uoY?=
 =?us-ascii?Q?LCvk5vXmQ4fg//uov1BkfvnusOGl5ou3ayYFH9e05XIjrZvtJfVTqjin9atl?=
 =?us-ascii?Q?LmsUYuIcTnWjW06g5BmjuvDn4z8GRUfYSZRkwCUgcgWZY6dvgK7jB9vP3GAK?=
 =?us-ascii?Q?INWvwQvqDwWBabk/nOSBCqDk3mn47jXAuFQUaIsMS0Sd0I+rzx5pmzxKsGD1?=
 =?us-ascii?Q?Md/sESUFJ6juNa8vXAngIwRwMlYHPpZco43IKt9vGMJB6/el0clv2FFfPhUS?=
 =?us-ascii?Q?JDsPm6CiUCQy7+zb1TjDRxfG3ueRauwQ6i0jEO5GRt2moCnq4XdO8LtJSgQ8?=
 =?us-ascii?Q?N1lXLi7fr7eJhQD3NX5sMyeFP2f/24BwtNtPJy/1lpfTviYENuCrE7hOAWvI?=
 =?us-ascii?Q?lzEk8RincFKhahJHpCmGCEdWLTqKpl9lkIgryBSwaKMbDrghw9wVTpqfUDZS?=
 =?us-ascii?Q?YF2gbfF9UnZ4CMIDqbKp4sb0X5+HQyJpyKnIbT7b4OwJxybHPQile2mdBPe8?=
 =?us-ascii?Q?n6aD8OiWYFxO7Gtws+HqC34BRbImTNPt7pnI4vVx2hcS0dNEdam+Qo1r2PXX?=
 =?us-ascii?Q?1qSQox5BKHnQ82jxZ4Z/npZPv1wpm3Cp2AJOLEBChgnyiFKI6YAIjTsdXU0i?=
 =?us-ascii?Q?GAcDuCDnYAHHHnliRLeiuMKhMXRTdsBQRhq9ghV+sun4RoojIRfk9iESl7cp?=
 =?us-ascii?Q?wNLG8HanA3gQK3q7rW8TsJx1G9SqrfuYo/evhv1ftTu0F80jpRHc0lKX+rvX?=
 =?us-ascii?Q?yHzxTaNyIT+PbW4HA8ilzCY7bkUJYqoyChAnNoLB8GUTm/jnOyIXT4a9WT6d?=
 =?us-ascii?Q?1XgyDTrqKDIgGYFyEARbvySlsJJtE0Z1q8/IWix+veQAP5DVd91WJXdmDjeb?=
 =?us-ascii?Q?pJj75sav8HycqgNwCjU1VkWnnKIDzlEpQheFVl2IlVIDUkgpAF3/CWw0iIBD?=
 =?us-ascii?Q?67vpsSrnon8spFPTZVrUJ2yVrfe15qnv+3RRMYba8ftWuVSFPZamTrmDjlgG?=
 =?us-ascii?Q?tKmM4tecyxgJpklxOiur9ocV8DxxjaH94hKQX6XM3JgXwsjMjCYG+91rs68u?=
 =?us-ascii?Q?uTU3XEA10zlsiJcqGT5rNfzFz+nPiEAxhUmdAwL1CvT6dQ+8kGnH4NtBbCdY?=
 =?us-ascii?Q?dB7njwzH8FTBHiMULjfqogYjEuhNdUn9cx3UF/LAJRT6G2NmB1PHmpKMJU91?=
 =?us-ascii?Q?QJx/OlzwIybsPZn9vSbUkMh6ADykx/93Sjrsd8srlTXvjp+HhBmRDrIvfX5l?=
 =?us-ascii?Q?DbP/IVgY4bb/HR/t/DZXRvC9FeJl8rXd02qOv3JdJR7DlVcoLAmTUjezE7CN?=
 =?us-ascii?Q?VQkCikrpkB2MLhPx1iIXx2QAqeDlBmIZmUW1bnYsyvRtsGmeuwP6zVzbUy5q?=
 =?us-ascii?Q?UBzPTNqBORSErN/bx98lQM8Ues8j6JIaQDzsaOkd1/rxeO92apGosKNULSZ4?=
 =?us-ascii?Q?l/pI5OEpCbbFCm5kqWMqOef1vy7r8uXN6cbB90A87xWBpUGe7YFGorO2yTPV?=
 =?us-ascii?Q?tfJVgetIf8UNLfRedV0k5LTd32KyzRfRZgGnzYCcsNHKbOGOPRM7T5zkkv8t?=
 =?us-ascii?Q?putxFgDgwE3r6/V4Hpxf/4Nzj3QvHZn8yAY76jqJSkEmzTKYuQy3tCR9AADq?=
 =?us-ascii?Q?l0sbSk/CJq6EOiirAXwLZvyEdIaTOp0cfQutYKAXQVJpOeI/oE7oIqE4C4Eu?=
 =?us-ascii?Q?3yTod+JMnrIWR//Il4nmfehTNzOnHGWb7/sLJUQ9vyZ7Ojpklvw27FAX8mDg?=
 =?us-ascii?Q?91ohICi5MbELDSt2pmnmFDYW9IR6QeoHs32kGrf204x+0ndLgyL4?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac3304b1-ced0-420a-8c93-08dec5bd5c0d
X-MS-Exchange-CrossTenant-AuthSource: OSRPR01MB11811.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 00:23:41.8529
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TMoGpkpfCY+Zc5W6JNiQY0zs6Lc7Q72gSr+7X3X2vfx4GUDAoXn1EoOu9nS+/FJT5Vo9mv8eTN3HZlzeeS4qcUAO6Nr3RBIMd00LPZodI55qs6brbJEzbKPw1xG9MD6/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB13877

"Simple Audio Card", "Audio Graph Card", "Audio Graph Card2" are
possible to set DAI format via DT.

OTOH, ASoC is supporting .auto_selectable_formats to select DAI
format automatically. Let's recommend to use it on "Audio Graph Card2".
One note is that it keeps supporting DAI format setting via DT.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/audio-graph-card2.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index 0202ed0ee78e8..6894bb936cfd2 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -778,6 +778,18 @@ static void graph_link_init(struct simple_util_priv *priv,
 	graph_parse_daifmt(ports_cpu,	&daifmt);
 	graph_parse_daifmt(ports_codec,	&daifmt);
 	graph_parse_daifmt(lnk,		&daifmt);
+	if (daifmt) {
+		struct device *dev = simple_priv_to_dev(priv);
+
+		/*
+		 * Recommend to use Auto Select by using .auto_selectable_formats.
+		 * linux/sound/soc/renesas/rcar/core.c can be good sample for it.
+		 *
+		 * One note is that Audio Graph Card2 still keeps compatible to set
+		 * DAI format via DT.
+		 */
+		dev_warn_once(dev, "use .auto_selectable_formats on each corresponding CPU/Codec driver");
+	}
 
 	graph_util_parse_link_direction(lnk,		&playback_only, &capture_only);
 	graph_util_parse_link_direction(ports_cpu,	&playback_only, &capture_only);
-- 
2.53.0

