Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011012.outbound.protection.outlook.com [52.101.125.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C6139280D
	for <linux-sound@vger.kernel.org>; Wed, 22 Apr 2026 02:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776826551; cv=fail; b=JS37k0cANyKJhySpzC+2vVxGNG+KvuwzraLCPJrDOefwZfc2Vfdl6vZfoNn7oQaW7zeCxxvtow2RX/KkBW1Jm0RsbSCEcFi4RKoP6T/Q9a5bFeDZ23y0zqyna8IfuNhLlClbXDszSWQ4Z4Pxb0JRFSiTq04uqC4BH0qtWUMxad0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776826551; c=relaxed/simple;
	bh=RdjXwAPFkAr/6FJLmEwKGQ9C4OIN9/ZUfGMsU30OY08=;
	h=Message-ID:From:To:Subject:Content-Type:Date:MIME-Version; b=hqbHyG+k6vf8wiCtdXByVdtzWfxeGFnUaPbaBbn2RTB+bteKOGQNYtvGMJfDLfDObBdw7EzlddWEwEs3QOeJ1IQnw1zEcD70Nc9RSP/M0dgw37Dtk1qbETacP3RenvSNWvDM9NS5713WEuMgsXX3GVoUcdNAnUHxrJcMFOWMxBQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=jBkZLUwg; arc=fail smtp.client-ip=52.101.125.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="jBkZLUwg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uQ3zl6BxPjNhAqWcZ+nZu0wYflObyTUzvvwqnMF0JnQLD9hR7NeiP/gyFjQ3WzvOIa5DtP6RvKoc0S7PNe+vQi29j65QJSmIMEUiBYss+DhdMn9+D+bAZsNa6JcaQrDgC/8JnNYCxWl8lOF+mzalYAAEqVR/hfrcqqXdZwm3Zj7ZMO2vqCiIzQMIxCCMwVhHNdwt0vQi8cLhnweHNdtuTLRZnr3J4x5gpA+LKVK4Kq4HbVd4cDTcdKhAHkljAEEcAFK4d6Jl6EpkCmWReHx0YgetiNH68Hsr30tvWeChwDeEE6Fqpx26k9Yk6TxrE1vBVFyZb0jfeHYWe8jPzeI3HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6VhQy11wmNOWYA2vfKE8PgxlkeDrqQp8+1xo8Ikmm+M=;
 b=a6RjHgbUPb6H7WuDV8E18ANfTuzNA2suHwc5FozcnTGpLyP+Jn5RdESGbww9qUEJiV4zo4af4JKsF5hpBvxk5ANv0aBEaixU51AFzXcKw4lcm48wrrQ5T+j1lQj5EN6fd4Yc3JgYIpSC81rPPSpgCJ8n3/V1TFtUe223znRCyATZhAub/VIdSdS7qTpfaCErgQAYHUIlBSK/Lg7C0bT1kwWsfyclLeArvCFBC5zmrp0YwlIm4pYiLt8bctEmeYyIQ9bZp9cJNYUal18uQiHOTa6lrxOXYrzLHNNBG/ddGfodmzSdhdtJo5cMyxS2LojZFzBvCYb7pj4ES7NKjzO3Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6VhQy11wmNOWYA2vfKE8PgxlkeDrqQp8+1xo8Ikmm+M=;
 b=jBkZLUwgME9CwiDLJRNSpdXKig5CT2+8lKf+p5V+FYAV1/fVXbzEVgPQmMmQKDuTnj+sW/NdRj1pVU0vTcn8LcfUwJFgCxDWNrZU2b3LWCJ65G6ars0iivRcTkssaewoq887neEBhJaYAHZdkbdJE89hX3sWJwSlTb56C0T1NuY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY3PR01MB11763.jpnprd01.prod.outlook.com (2603:1096:400:40a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Wed, 22 Apr
 2026 02:55:31 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.20.9846.016; Wed, 22 Apr 2026
 02:55:31 +0000
Message-ID: <87ik9jk8kd.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Janusz Krzysztofik <jmkrzyszt@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Peter Ujfalusi <peter.ujfalusi@gmail.com>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: [RFC][PATCH 0/2] ASoC: move card->pop_time to soc-dapm
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 22 Apr 2026 02:55:31 +0000
X-ClientProxiedBy: TY4P286CA0133.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37f::16) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY3PR01MB11763:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a335e76-3b18-49e8-0891-08dea01a9de4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Y7tauf6iU4iNzFA9jSNCXf75XGvQnL/a8z3Sd8BPqPLBlXhO2A7dm1QwFURoIVySxN9cdZTCBGthEb9SMbxwFCi5vd4aCiUXmO6pJe6KR3ndKJyHC27N3D9FYAFVIe5V6ebuEM/37AILM9bqiyK58ns43cNhjdqlF+qVnIU//b0E/hrbJYwJPdCdogHM4WYhEBH85c+MsACm9nUbE/1vEZRDbOWhn/mBKq72YbF/v0m/EdW1AuL56JVytcaknlYhE8BO+rgrR15flWjYJ+yGjSv7TFzA2Qqrm0N3eYtu8YmQJ1v1uiUFjxpbIc960jl+tRx53zc7Xp+BSB3KObWSOw5v1UB8w3MQQbp1HrruowwumVwVklTlOMzHY03ND1c71pznZjdC0hFqvawbOKj9sK1Pk2mabMZy7YlAYgsZZxkHmQLuiKKvkXLlwLlkUqyZ79ezqHLRwOrbUhKlS1KwFlE47ngNtV1NIkRsJyu546vJM1lfEcpsERC1vlNp5d3AS+fKaQ8eY9LWRrthRpqyJdHqlaj2WhDJ3CnJf0aeUTrylZQmbskM3UCvAt8vLGqE2MZ+N8WL802ZlQiCKgcC8v63xIejn6GMP3EvtK3peSaS0C8C0HYS+MpaFUM+V8rMxoOrLfQRSmy4PKzZt28/4OX/tY0KKdOP7B3NVeeakWgiJm1F2csd+4bauAySvZYAKcZlGrPwqTaUQg4hhf0tUJZTIARnOLJg6xpLFk9PqYJtf5DAz60wwY9JiV7DGryAQ+G90zO5TYyM0WRoW2va/5rFRiJPrhGdvbTiBtLe4gU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xIoQ9UuzEajRnIeMBhxkrU/kJ+8YXAw9TMCfLG1c8KjaNF8VYo3IERUyVMjE?=
 =?us-ascii?Q?p/Z3DobCPz8vUdkHI1U8PSG/SewT251LgyDcA6yiXL+nCHvIKunwNEtSv6dR?=
 =?us-ascii?Q?fUu10PfYRVX1mVebzatbMXrHJHgguXtRwqgm6/Li9hkv0D4KyNbtFY038ePQ?=
 =?us-ascii?Q?SRF6obU4eHXTOz2HFdqYPOkQfNum9+fqbn4XP7lKEn/1lVS8F6/7Hds+ofW/?=
 =?us-ascii?Q?rXxJurMu5qFGyf8NOswMzmDdr48sXcO4GSQ52mD9ccvXKpjE2a5uML1aWe2I?=
 =?us-ascii?Q?JObiRJLAjtf937JoiwaE0dOz/E/H2zZCW4u/4E12wDvqnWtlvDY2IQQerK9d?=
 =?us-ascii?Q?84RySCgVTzNtE6clSq7uMPZvLItgApB350YeuRivF9Y/V/6iiTuK1GB6uc6W?=
 =?us-ascii?Q?tVER++co6uSdrDPaBUnFmSJ3rXCxfZ1t0bmhxuvZdWZIumsG6rvV8tZEy6h9?=
 =?us-ascii?Q?FJ8jrDEMgiKkINV7Ewk2SdYSplSwO1oXoAKXXjmr8Z4srJQha1to1ixWz9AJ?=
 =?us-ascii?Q?hSrgActbiJJUn39/DuhaGNyw34O/+XdFieZ5zQOqbL1LRgom9M0WQ6b6Qva+?=
 =?us-ascii?Q?YBHbnqqRiYJ3ySR/SCM9m+3Uyxjs0zIdCR1itu3OzmbzvzjgwML2TMeToal0?=
 =?us-ascii?Q?3QtABo1JhI3ZSi7OYu3g5binvmTMYoAYIXWDt86icdUyiAr575zpyLRFnbbM?=
 =?us-ascii?Q?z78i6xMX2wvgxc/praoMZ3+5RkjSO5w0RaNyP+8xb5zktPB6yWtSymkyrS75?=
 =?us-ascii?Q?X+BsQz7GWUFK+R1dmEb3F2IyhmQwQT/XLGOTYfZXbK/kOdXLbhB3fnFmf+ao?=
 =?us-ascii?Q?wiraJB2bVGk5iES/AOxe+MjFsDOs79QbV7t7vHQVbG8tiSXdCBx0ZO9UWyKm?=
 =?us-ascii?Q?NCARfZoqvdRDeJCxRxrcGzvwLKQQtFoMtYHx8eOFs1sBAYa2wLsa7D9INGtc?=
 =?us-ascii?Q?5YygBWlN37jjFrkNdJpUUaz1TaTeHzWj0XHlf2OKsAKbYHJ1Rxt/u+WiWX3A?=
 =?us-ascii?Q?/At06nGvguLuyExSA+fxO3Q2oT26dEAM6kbein3G8ut1Uwklj8nKQDLyCR+p?=
 =?us-ascii?Q?9VZNCvLL0XAwPy0Ib4DHhozIzCAQFRXNglofF1VwjwgzPOrKev3E/zDZ3Gkw?=
 =?us-ascii?Q?Ixdd1+EhSMMH3nvKPW5TtZwIPjQoLbzYBAdVwgio8cge/uhIULYQfZdeJtII?=
 =?us-ascii?Q?a5BKkBgKBfkiOI4ZhFxu5HdgneusEr7h2PysBW6uhR+SKYR7NckrWu7/4P2L?=
 =?us-ascii?Q?bWn5P44EpJmbB1vchBLO1gerJKVFji/kcfeFdEjBF0xRfwteL7qa08W7SgmH?=
 =?us-ascii?Q?3iLb3LgUdfs3IWJrFES9s6WbnhRKQnTo/PcupxOScfEC+7extWRNW6U9Y6fI?=
 =?us-ascii?Q?bG5XVpnIKa+6fvEkXyRWarJcZ4ri4T4mmcN9aaA1ZA4vbvySY6rALMETk6T4?=
 =?us-ascii?Q?5aEr5aLaJxv9gXqx6PXRx5JtxQ9pP8PtxOiBRfm4ob7wfskokylwKai3gYTq?=
 =?us-ascii?Q?TJEeA9QuctOQTBtdqiZA7ax8a64nsuMkTSHdLXny1D5Z+ihFP+Dranv8t4c1?=
 =?us-ascii?Q?bNWW3PSNshH0UhbJxsQnIpA5RhTovQmg6SFtbI31ouCOCNXJ2ofCPLziYVQR?=
 =?us-ascii?Q?GvDoe7EkDcARYBb0bUcFw8C107IZzX2/Z7P9K2XGYYfbAAHDtUOX7D2UoCA7?=
 =?us-ascii?Q?XaIa+x0eDHZFCOdn/xE5EQVX9RPsbLLR5gFzweWennNZIAqSRYbs8yZ8VbKm?=
 =?us-ascii?Q?/vOKwVaJ8tdIhprzYGnZ0vliyiKJxywVC1gBqs7KWIqfzYIYmPcl?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a335e76-3b18-49e8-0891-08dea01a9de4
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 02:55:31.3619
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 38fDA3VMIHdAK8pqzaecdGR1WGfsP9KPPj1QGyLZyrvKMC+wEnkA+YTV0ieGWfJRCckbkDDBttnYsU/tPLG6gbj8zSX+pQcKi/63QXQd/WgV7BgciTvkOTEQVlgzcrhp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11763


Hi Mark, Janusz, Peter.

This patch moves card->pop_time to soc-dapm.
card->pop_time is used only on TI, and Janusz posted patch which will stop
using it. It was posted at 12 Apr 2026, and [1/2] is it as-is.

[2/2] will move card->pop_time to soc-dapm. We can use it via debugfs.
I have added [RFC] on Subject.

Janusz Krzysztofik (1):
  ASoC: ti: ams-delta: Stop (ab)using card->pop_time

Kuninori Morimoto (1):
  ASoC: soc-dapm: move card->pop_time to soc-dapm.c

 include/sound/soc-dapm.h   |  1 +
 include/sound/soc.h        |  2 --
 sound/soc/codecs/cx20442.c | 11 ++++++-----
 sound/soc/codecs/cx20442.h |  5 +++++
 sound/soc/soc-core.c       |  4 +---
 sound/soc/soc-dapm.c       | 30 ++++++++++++++++++------------
 sound/soc/ti/ams-delta.c   | 16 ++++++++--------
 7 files changed, 39 insertions(+), 30 deletions(-)

-- 
2.43.0

