Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010060.outbound.protection.outlook.com [52.101.228.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E33163
	for <linux-sound@vger.kernel.org>; Wed,  5 Feb 2025 00:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738714428; cv=fail; b=bx4xFb21eXd6x9vr6dhJ53laZaqmbDgKeZ4C6sMcRDFX7S9jS+OZRHE0SFCvScXECvU3MKzIL+1fIdLpfvUBaf7ZYVSE3RATovDJjq1oahBZQMVeW4f5iFkEd1GuPUUVpm/LSifB0k5YciwB1I9aEy15dQaDF+mq3lQxaIXXqwk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738714428; c=relaxed/simple;
	bh=DWKewGVj8+NYCAcgT47zg2h9QKj5LuM8vAJ6AW6x1xg=;
	h=Message-ID:From:To:Cc:Subject:Content-Type:Date:MIME-Version; b=V8jvMI6KEf4gsMLStZWqhC2ndliqVKG9QOHf6lnWngJwWNLRpK1aaJyRqzx7vEhlzUPYVjzLiWUIHTGThhe/PCqmiANfqvVl19WGSG2yqbWurQxGQ+rRD00Qpk3WGFTifZKqcnYbmBReFOTz7JHWqZTnFeWmk2EsnnHnw6+WaFU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=OTHmkAAV; arc=fail smtp.client-ip=52.101.228.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="OTHmkAAV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Omh3Pffo976jvau4vgB9W2KFQBnF2aLA5v44I+8OFEK2uPwk+BnenW32rezDQ2trX8b7koG0MWvVMzMxK8aUI3W5Hiaby7dUlYHMZy05X0HcgmHWGGss44eB6+BZuYByjxXht2JUoyLbW0au477EXUVux0sohAQ19+D0uqluKrakrVAIQAAbeXou+HSA3U3Op3bxSsaCNdCIAnejn3f0wu0JvK/qkN3ZQ0URumyU/lIizhhWt/iqDT6ALLBE+O/a/ebxaODQXixKj44X6PBYISzJJqS7oOa9CzfVys0Sk8R91cSTJ8u7kuUJ6fRt3dVTdkirYUsCBuGfwkTJX6X+Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MSFqV1eAykBQambU+yz9LnCViA0578A9+G5b7roort8=;
 b=CEsW6yVNDSntX1/f2R+7WFIQo7OKMLswqxrfY7tUiGCDHGFne9S43gAeRvSi8HDK3BQgBcJ2G7ByniuU6Wu7Xu1zDdpawyxhUh5vj+91cumETd9JWUc1b1krbD7nZmHA+eYScCoxKenMLXvY91Qei9bQYsoV/0MUvAtsprR+XIKQzHAv9JebJLLZhkRT4mIg6LfFVwfbB5+OkAOnnC7sy0Ie68Vz1Mcmh239k40guqzw6G1FFnE18FWP5SIOBZYCIUiGsF7LJINjNWPnIEkZYgPIq3bxXY9ay8S/lfIcYDsaCTSqkP09boSBQntL1PHPlucHaI9tAreSBDaFjTCkZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MSFqV1eAykBQambU+yz9LnCViA0578A9+G5b7roort8=;
 b=OTHmkAAVvaFkAetuZxngdTN8muyH4gymyzJtkn6PVDC8b+ZjkhOfVTKgMYiw2lgefSf8Pz2sOjZ5UU/4b9y5QHZ57zxhAFNdSeZtQpIXyYImL0xKhGc19CnN6C5MEa3KVbwJHHOVmkmmkU9paJsx9hItOv3rZIRq4gr0Hvb2eZA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB7036.jpnprd01.prod.outlook.com
 (2603:1096:604:13e::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Wed, 5 Feb
 2025 00:13:40 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8422.009; Wed, 5 Feb 2025
 00:13:40 +0000
Message-ID: <87h6592qq3.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH v2 0/7] ASoC: and adn use snd_soc_ret()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 5 Feb 2025 00:13:40 +0000
X-ClientProxiedBy: TYCP286CA0339.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB7036:EE_
X-MS-Office365-Filtering-Correlation-Id: 460226ff-5c09-437e-f0e5-08dd4579f194
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kqKlBHVu6uLGiWfF/LRL2Xcsvd+KhKOFb4q+dQ8/Z7B2eJIHPyfyfMzq+ESo?=
 =?us-ascii?Q?ETtqd6c567iJnjM/HfvrkIcwZiAzKRoLzU4U4fy8E5bs8eb055MeH2SqhTpZ?=
 =?us-ascii?Q?ZkJmhveiVdrzX7Hc33yR9Khho/wFTPxh9tUJ/eWBB771f6QEU6j4cBb1ZkUn?=
 =?us-ascii?Q?QGpLcv3TKSbZK/d7nIFrHb7yUPEMCeCgZkXYHc6cvrk25TsIZr5eH2ljSW3D?=
 =?us-ascii?Q?Zrebc1YhqRHdHAnmkmfsbskkdEUMpmEnGHpvjohFnQrwiORtyVOrYAAdziCQ?=
 =?us-ascii?Q?CO2rnCsadyDHLKVoFufj8J45Xv4ZWc4GnBwjsKDeE9TC+OVl+k0TDKdOEIjy?=
 =?us-ascii?Q?vD+/DU1q26ZBW75XmDpDQTdE36ScuTDSI1ZPnDK0Km50hCaw7urud+0juinU?=
 =?us-ascii?Q?dn+eEd4SeOLqyk3GrgZvURrxdRkYnx3hV7hBEoHL2Uagp3Rv/Anshzw1D6Qd?=
 =?us-ascii?Q?z/hZaQ69F4y3dHU/GrGMm5x0Z35Idd6vz3DCPN/EQy7GPU9jnInU6fv3GWO8?=
 =?us-ascii?Q?H7YmqsmaWfRHz2tM+oXpcCZPqZlh2C35qWMdanMs+QPQ7l1kPgcIcDtQxa9j?=
 =?us-ascii?Q?x2/BxdSt1rMPHlP23MpqTF5Dom7awlrCPCejUHDVOEHuQeY1jwSirbkEEnS0?=
 =?us-ascii?Q?GuqqVOF9jRtTB6J5i/zp2pA1jQMyqkdD57qnAX6TJZ8hju6FNK1tUUebormX?=
 =?us-ascii?Q?wIkS82esVDC2YL0EsfHhTEzrJVrPxvcVGVq/Zz/S2wf5vIPy3WCU3d907FIC?=
 =?us-ascii?Q?l5qKhpjODkl+w93Y41d7u5ceuM0+CUc7t2i7n9RiAISGT2hHRrrHlF6zG6ml?=
 =?us-ascii?Q?LG18R60d86zy4wPCWCzmsFaJzTC0zZvGA8wxijxS9yVV+O9C/KlMasSPLZLw?=
 =?us-ascii?Q?vEDSzNZQv9Rlc7GSdFuUsvmAv2ZbcyDAdULzXsqJKXyBLcRqbvGgrFLWZ4P9?=
 =?us-ascii?Q?1cWf/dCw+7emsHPXilbPzKdVy/PgFD4InVy1NkfvrF6b/th3glKOsSPg/DxF?=
 =?us-ascii?Q?V/zGhwF95pp6mzdZ5LdkGztrWNQUYWR9WDPje9doK21Iawt31JvpdcSw7b+p?=
 =?us-ascii?Q?VGq9GPLLbkkzGEKi2a1tSkeEtcFnFtgFWO+5LmCk5SFmy4CxKzHeTMLL4RZE?=
 =?us-ascii?Q?Rw0lLmDNy7xHjBzgwwmzpMyaV6DBDQm3QKdUgfQPhqLrdKRHFTaI4BSpmKW6?=
 =?us-ascii?Q?F9q0TY46XqvoGsKsbWgVlEmOXRnC6DGeWy0vYivyqOL98GLPGmYgiH4kmt1P?=
 =?us-ascii?Q?E75Ah6nYw1LEs5jImtoxmOGdpUF25rIuK4DYaGgJSdYw5BGVXKW3amBPDjEl?=
 =?us-ascii?Q?dGL6ibkiDz67Fx+wkLqFKg8xcs1J+uwOn+DtnxlMEhptO8rVD6CZf4wG/Htl?=
 =?us-ascii?Q?vDt/w8QBBoDclVnyMSgqZEd3aVvLnK1E8Exs72b9zz8AaskLe718sedZWmAL?=
 =?us-ascii?Q?gx7XwKfjO8PqbuUYRYE+ZM/j5jXIHPCJ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BaCrpZPxH6GmGn0mPHWXrUVDOv5BuQGiF2d4bOvrjRmwGKIkTbR/ZdZ7R8lZ?=
 =?us-ascii?Q?n0Ux3qQz762UtBkaKBorsdbKGzf7n6YRGSibZYUX/1Y6lnF7oKrw+D+OHZyz?=
 =?us-ascii?Q?Qj3RbMj5Yxm1qgPoMFFhSeRGYWWV+vOIZGRSncFKyjRpcNj9Nq31eOUnssFr?=
 =?us-ascii?Q?t80H+Y3FW+9qxPNQfREL25Px37uCUUJoRAx4SpjiRXmbgs3CmDcvHcdl18O/?=
 =?us-ascii?Q?jFoNqBJoJRa2ZIwj7Ll78rZu1MWz5w5flF4RyfmRGJi2WOLm3HPvLQ/EzzZE?=
 =?us-ascii?Q?BGCO6ugf8zHPUtGGlmlYpA3lKO7KUccrfV/OoUdRA/HveVGk2g450i/diU64?=
 =?us-ascii?Q?Ld18aFLYLx73ErJv3brSbJ4rLviklxAc19KvQxf1SKBkaPI+Vg5Ch9WDhtXa?=
 =?us-ascii?Q?vyFLPvGVc//nFBHPwFBlE6MP5U2S7jYnitpIF14V2nL1ISGgb9UENSo3b6vh?=
 =?us-ascii?Q?/zJYaWh/XO8ZYEddSNcVttsJ2yBH+dAOMrkfP24PnP/EX4wuZb4W32amDpXw?=
 =?us-ascii?Q?F93zo0nRnDO7Co7tnPvlFjKde9WZEI5bxbTGBrc1+VNd42075gDP9DbYtkuB?=
 =?us-ascii?Q?rOSDk6rK6nMjOuJV3n4BnbBbryXSWh1zREXC/P246v0T8JnyQngBXs4AnVrZ?=
 =?us-ascii?Q?nfuje36ckenKQ0n7vGz/78qcU9hscwTpYzfgXzDP/jMo2cZEgedWckAnQ1g7?=
 =?us-ascii?Q?5bQHF57KgxZZuV2iekBuDcs1nfMuey1FRxovJHqTMqBozwHEUodBji2q0Z63?=
 =?us-ascii?Q?qlfUamc2AXDiMH4AbihqG8RVH+KHuAg39ddFI/p24UiHvwD9t6WhaACL6nXV?=
 =?us-ascii?Q?GxjlLPRJljOIfSnvDeRPgM613Do8uSrzIrZ2aT+o126Xb20yz5BFLY6ekEXy?=
 =?us-ascii?Q?NZPsJLrkkp5RShPA9Z9kVBhN9O4yKVniYWxJUD0jzVsA1EYzxB6VeAJGcXGS?=
 =?us-ascii?Q?AR+gMFJACGTiwSqhwASD+7b69lc4oDTldWj2kUS8ByQCTDFdWloFj91k8jYa?=
 =?us-ascii?Q?MpwD1wxP6QHBTCKl+1ZEcU/vHpOR9+LlYD+pZzvTpWZcZS1SL+dNBkjZ3ndy?=
 =?us-ascii?Q?r0GxBQFz+60TShIY2Czrups0KGuTzJLjACCevs4VmBjM0fPCcZnJbI+YjGKo?=
 =?us-ascii?Q?qr3uel4SRURD1sHAiv9xnZ88wKcviDuGGAZ6bRNFndpZBX01C3FB7b+iO24F?=
 =?us-ascii?Q?y201TOFCZXI64d/UGcnh72WFi1IPpZJDWLivvM9sCiKOITcwAA0SiXGXgW5L?=
 =?us-ascii?Q?jKkNtXZbUUTfEBN71WR9IavbpUD+/LaOctDy5u4/uMKedcvtn1RGAlFklcAF?=
 =?us-ascii?Q?04mNXoqamhw6gsv0/Hjfb1U6sKspK9FyuFG4hlp2pgueL+BD8A51g4fT+owo?=
 =?us-ascii?Q?kKh7Naz6fwpF/xjKrYQS0vgXhbfTu4MSZzZiCvQcJ/trhzPYiCR3nY5nQSrx?=
 =?us-ascii?Q?2eNF143eHwu0Xn70xcXDb4B4q3lRMFIW/F4IukuhCg+PJhJxlCGzTzQB2LhB?=
 =?us-ascii?Q?1znD5ZvIsx6AVo2iaJlfrIpQOw3GXR3rOCDPxCDxLryEA9TzYZNz0K77YbQu?=
 =?us-ascii?Q?EPyRl6QIsCBktHzUzYgAJL6L+pegM/jSa0s4yuesCDpqhb7xYSi8SzyYx8iq?=
 =?us-ascii?Q?ltgvycxaCqiEjEBbdQOteZo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 460226ff-5c09-437e-f0e5-08dd4579f194
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 00:13:40.3998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dDE5huF/sitQ3gBmTlQAPl1KxbN/URk+BXClnjpVBbPa3DM77WrWOTki/Cx4aRbzuhFOeCLlviS1f9LUNSfwjf4bIq4ZzkXBpVO2qRZJnoO60WXht7lAGA+NPVwLjcL6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7036


Hi Mark

Each ASoC framwark is using own snd_xxx_ret() function, but we can share
these. This patch-set adds new snd_soc_ret() and use it.

checkpatch indicates that ENOTSUPP is not a SUSV4 error code, prefer to
use EOPNOTSUPP. So this patch-set adds it, but not remove existing ENOTSUPP.

Link: https://lore.kernel.org/r/8734gvsg5i.wl-kuninori.morimoto.gx@renesas.com


v1 -> v2
	- Based on my previous "v2 ASoC: simple-card-utils.c: add missing dlc->of_node"
	- care EOPNOTSUPP

Kuninori Morimoto (7):
  ASoC: add common snd_soc_ret() and use it
  ASoC: soc-utils: care -EOPNOTSUPP on snd_soc_ret()
  ASoC: soc-pcm: use snd_soc_ret()
  ASoC: simple-card: use snd_soc_ret()
  ASoC: simple-card-utils: use snd_soc_ret()
  ASoC: audio-graph-card: use snd_soc_ret()
  ASoC: audio-graph-card2: use snd_soc_ret()

 include/sound/simple_card_utils.h     |   8 +-
 include/sound/soc.h                   |   1 +
 sound/soc/generic/audio-graph-card.c  |  97 ++++++++-------
 sound/soc/generic/audio-graph-card2.c |  95 ++++++++------
 sound/soc/generic/simple-card-utils.c | 170 +++++++++++++++-----------
 sound/soc/generic/simple-card.c       | 132 +++++++++++---------
 sound/soc/soc-card.c                  |  14 +--
 sound/soc/soc-component.c             |  38 ++----
 sound/soc/soc-dai.c                   |  18 +--
 sound/soc/soc-link.c                  |  18 +--
 sound/soc/soc-pcm.c                   | 114 +++++++----------
 sound/soc/soc-utils.c                 |  27 ++++
 12 files changed, 371 insertions(+), 361 deletions(-)

-- 
2.43.0

