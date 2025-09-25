Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011037.outbound.protection.outlook.com [40.107.74.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E09155326
	for <linux-sound@vger.kernel.org>; Thu, 25 Sep 2025 05:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758777468; cv=fail; b=Ac/UJ+qbWHXJf+Hp7g0YT5E8S+QpsszgQJUmkBRSIGQLI646FOYyK/tsbIixMkew4z9sik07ontUVjvvvGRPeOJ6FjsW92QKrICdP3k+ZFgK0s0h6Q3uvQ1m9xuo4kBVU/8gQdNhUkA2tDfDEOsOR4uVoEbl9qiHRR2uDz0ol9A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758777468; c=relaxed/simple;
	bh=syTl3TzhBuxAa1CmkBjERLANse3nX+I0cvHkwBfIYH0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=AzjGy3mbfhMX9dFpc2s7/bClSBKVcVCKHt1NB4mlCJGxk/7sMxXylCl4Um5GFBfvCOyHfd8kVjfL5QpXWqZaaBZW9sNlZ8eNBImL+aL3QKfQNR1pWGibVEBzGOMuGa6H5ILlEcJz/u7iPzGJEu+pV6B0du6VebLUgnjNXVhNFFw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=kf9bQlYp; arc=fail smtp.client-ip=40.107.74.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="kf9bQlYp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VkIQotnbYurB4AXzOlBkVu4LhBYA15OwhNGvKkfG7y6p/QYXSq5M1d0garlqgGPa543L1o7OCiVyg2qIvHCf+Npjdl2pOXZys0CRxv2VIFUMuxet3vVzDr21MXlW9Fv5ymBolK5+DfWnLK5VbRz/MnL02fY+/RaFFJwYT2AcQi6SZaK6EosTwRVsgwHmcg7MjzQPWB3x4QJQFon0lCqpdUzL3ToIh15nVQzcsj7fg222qU9gApazuXuw7U4XFDSjfjhbImiv8ZdKjU8cSzb/ecQCR8U7kzk3I/b46xcNAKLC8SMDgC5cdbCn90EIsOqyB20srZIvjFQvGFgZ7O4dwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=plx6Z1RGheGWzn4NM7lrHmgumTZ6DFXp5B8qGQzWjq4=;
 b=JY3M9BYg7zEUZbkrrnBufIIX4V0FXwZxMzF4C2wyYmhDc23Xid3+zC3u12T0OVdCK1YWGmu3sTqi/KoB27WFAlfZd/+o/+IzMzdga35BzM3UgmsgtVzE0En5v+APO2QMAG5U+W/iuN0sY+xOgI3iK4aTJFB4/jBHI0MIRWQy39G3mHuykq9pPH11deJMjgMnO9E/neU7sd3dqniAEe2xCmSz8MBWuWSnDdgxP1ng3quBw8eY+GtCvVgxil5ZhI6NLz3qjS7tagvfL2oFCOF/k+PyQtkC2G499mIAb3u2G9O1lv1IRVXPvasaGHrDCQa/et4Hv6W0FJxAmFFB50/KUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=plx6Z1RGheGWzn4NM7lrHmgumTZ6DFXp5B8qGQzWjq4=;
 b=kf9bQlYp6QzaP5BWq/0nHCbe01xx0VY6lgJDaQ3ol7anFZY6x5dmgs51hnrsR1XLpL4tO1TW0nosKFYrTS6uxrdllc5RafKPAlXVBKV2Ow6U0V4Re5YL3HO4jXWVWWGGOPakVhFmhhaaF7lhlTq2q6TKn5RuS8moC8c8DufMPX0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB15474.jpnprd01.prod.outlook.com
 (2603:1096:405:274::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Thu, 25 Sep
 2025 05:17:42 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9160.008; Thu, 25 Sep 2025
 05:17:41 +0000
Message-ID: <875xd7yutm.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 7/8] ASoC: renesas: msiof: Add note for The possibility of R/L opposite Capture
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frcbyuv4.wl-kuninori.morimoto.gx@renesas.com>
References: <87frcbyuv4.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 25 Sep 2025 05:17:41 +0000
X-ClientProxiedBy: TYCP286CA0189.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB15474:EE_
X-MS-Office365-Filtering-Correlation-Id: 873e8f9e-8444-456a-d51b-08ddfbf2da1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9p4YWASyO2m3YW37XUOFNnxOF2vjAg7CpWxJAEyYKaFVUuRaNEt4knS9sZuW?=
 =?us-ascii?Q?JQymMHzTlk01PCx8azVfnLhJXIaq+Lr40jjXSqNC3ns4Y/0E0V616PFVi3Gi?=
 =?us-ascii?Q?zeNVFmVQjS6D57Pq36Lg3dyhN5sVDEeCGHwjqNga/kpstCYajg7BqS2KGnoq?=
 =?us-ascii?Q?MdHSXbp7BW3Pt78qZhVgaRzppJ/8aNdseIdiByI1AyLTErKx8g411Jb+gi52?=
 =?us-ascii?Q?9F03txx6Vok4R42e0K8R1Ozpz1YPCnxrYSi/pKu/8214mf5zvCmiUDRqufpl?=
 =?us-ascii?Q?SquqgTN4RojrRwwKpo0mu4C63lii8pQiOYBNUQneBqGFF2FLUqGuxzReVctr?=
 =?us-ascii?Q?xc/WhVuYw1HaePXF9BIo+hkSKD6j6nVnXJClXKKLpcoHt8VYMzQPSrsT34X8?=
 =?us-ascii?Q?nrsyyuG/0l9CdMEjBGx3AlaL6x1iJxkDygsv/p6jFAt44HpOIbcfRYGRCeyJ?=
 =?us-ascii?Q?Fnyip1V0OqO7h+TuETyLe5Ay+Ms14BlYD9gT2vcj/2kXarfMHSyQrkPZD+7a?=
 =?us-ascii?Q?yXKigVBBoVlk602LQ5N2P8IpYpT1B5lKlpvdjg0ahHClb1phyp+fEVU7Vc+5?=
 =?us-ascii?Q?UDrg7hwO5QSecOz1cDx3r9coE6ZoaRan/E78fLXK+36a0XaY2QfSflojyxKk?=
 =?us-ascii?Q?8KEiHli2i0PwypSMgv//Jdczvep+rPdK3uRwdMO6wMPq30y5aXHtdaTqg+AX?=
 =?us-ascii?Q?EeD1HVl0H6mX/ZX4VyIwOVPdTUlXbZloofSVkgkjmMbMYM6AYA+8LGVCuIdH?=
 =?us-ascii?Q?R6USrc+wRAYJsSZzfbE+CkC4iecaki+/Ig1IBgp5aKVZ9A7IaeiNZs0PewLC?=
 =?us-ascii?Q?LKTSqETdc+1aRi4yYz//36nylWfi80PEgk+DtTPy8W0Fo62SaWSCKj62w58G?=
 =?us-ascii?Q?ef8bTNZt7U/bZ2iQO6mDmVeSOuVIFH4QrQuB35PSQITmw9ihT3MAro/9LyRi?=
 =?us-ascii?Q?KDfo6i3IvQ3qG1r0eYsYi7SQmtqaifgDkayp4pt4+exbQgYbutd2tMYQe5eO?=
 =?us-ascii?Q?/ztSsUZWhE3nn1m6QNgCU72MlmhSuGKmZMNJzKRlzamUv4t+T/Nsz8AA91lp?=
 =?us-ascii?Q?XvrtnUlg2YD+fBTPy+7J6L/CDd/bDa280IeIqf56p+3ex333B/M60j+Fp/4L?=
 =?us-ascii?Q?rrKgnxPkC6vVRq/ovfVqbaZuGhHC9rD6TucGqFvtLGGq9pB/MFAJExfsTeL2?=
 =?us-ascii?Q?WRhns/s+Hik0vskK1eH7tYlO5C5XrQLX4tUtv2XHi3vTDSdA78AhqRaXimeU?=
 =?us-ascii?Q?damCFjq/ETnngoy37bXn9FBfDXJKCtQS3I9OTxqNUcPyuz07SoEYP2lxascT?=
 =?us-ascii?Q?6zBsuH5YdxKJNPIhrEUu0N7k/GiaSKIqTg/Xd/5HV41YQSsn/lgRGu7u3oJK?=
 =?us-ascii?Q?JBVfGc5uI2Vf/0aF8XwYt0rI0DrmpxWa8GN/4jZppHMgeMc+f5qD2Kz6EuTj?=
 =?us-ascii?Q?ptkzA4Efsmourv3AG4MkC++ZkOAaeRFBGOpd2mvf4Iexr/tV+GTue5YTBt39?=
 =?us-ascii?Q?eMFgLmTlLl0b5xU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UzCzE1riKxBeldBeYnZCqMvzW6f5sYnqvkVFg/jOfgJWBViNmSDDVJGNix43?=
 =?us-ascii?Q?/95TCbt68z8VOi9uAT94VWxw+j2MbeFcOp3WbWMeA+Kpx/wiIlOFvdNQltOn?=
 =?us-ascii?Q?u4T8MZpTB01plMMkPiprAyef7PxnCf1PoTIMAGVNEjai6xvz0dvTcDQeN4da?=
 =?us-ascii?Q?G+wUnzTQtG553V971daAveh6Y2yEeA4UGiBUHEspT8D23gfFKDDormkxk+p/?=
 =?us-ascii?Q?9I0Z39bqBnThRneFnP1tRJUZ6qrXYJdnPCdRi97sBsYhM/VyW/dESyNOz7cZ?=
 =?us-ascii?Q?MTCzsLZ1+kHGZAPgCIO25T7d5qPLM/Xc0Ek2+ePDpE1+hwOJgJeB0CFoX5FN?=
 =?us-ascii?Q?cjU4FbVQKVTvzOu/dGzlNxWLNgwoYAFhEYA34l6WEGVQcJCeVTRPeF4TwClp?=
 =?us-ascii?Q?DUBoPGFgW48GhgW+dTZZFbAWaSGc9vCl4ceIqcYHyuC7xq5KJUFx4EMOMCob?=
 =?us-ascii?Q?r7z8ilblDcgj4UrSqFUtUmprhEf54U49ppnXdFeaiRxeQ+eCGtSKDdwP3CWs?=
 =?us-ascii?Q?55BIHqlpEQc8UaJsjppzhs0y7+id+/BnYPz10yqYQKGq8kyhaYqKPadU/OBc?=
 =?us-ascii?Q?TP3/EHIIXznrRINByQzrqgaZHAB7BXZBkirnBJSWEqruMrnXZhFyyFwLXOV0?=
 =?us-ascii?Q?T+cgKr4MoOamfpn6Ap5UHDYBIJjPlqIi7Ijh2P/yPSBpq/zIF5JVrsQKg0Vg?=
 =?us-ascii?Q?5B5lXm1XgVa5eMUGK3xwLc7Z7N1K+6HN3ROSOJBd68ZynMFnH0j3qS8Kquzc?=
 =?us-ascii?Q?C3Sx9GR691yVl70L0Ke0Wmqi2SCx6uTUpZch8NjCe3Ow0zeTmd7TJ0DdFagc?=
 =?us-ascii?Q?hyzsnsna3HGSKq2dzNi6zUhp3uFfCsFnmdsG/jWik0UGs27v50U6BBvBVomo?=
 =?us-ascii?Q?IZkPFU38/sEMsP8EnA9jX0flK69qEjESxag8dkZmGz0cvWDsPcbCoORZkChc?=
 =?us-ascii?Q?tt1m2iMf54SWdlcdRnxj+nKpK9YinK8lDg+2ifi5sK6Ed5ezr5t2nMTipFwn?=
 =?us-ascii?Q?WMYHkMMngGdOWStlVIaMoKwCcEND7WxfWHdPMkJTd5LPMzCsBmsqrU8sO/l1?=
 =?us-ascii?Q?sb5RTVYZaTOac2n6ETMY3PoduvglHdrpdWiip3vsyiycvotte9olerlNWWHS?=
 =?us-ascii?Q?aJago2Q/3UXSIsboWiwsWpddWtORTw5Wlfc5r8jVvAjKeHRqJTA6Be/VsphO?=
 =?us-ascii?Q?kpfDXb1mcuCOLL336hzyZxh8QDx5fCeTWMfEtvy7sR23+14p/2q16Nu7giYk?=
 =?us-ascii?Q?cDjn8xUlCABKWnCnGZOY9rYZXItOxgZrmGyOekWQnfzkGRqBZcl8MPzIFHVA?=
 =?us-ascii?Q?Mgy3a2GxCXbPUHXDb8zSueG3NdAxEseIU80Z+NSC5Te7AuR2Dr9lqPZXTUBA?=
 =?us-ascii?Q?FROwPMS/kh2/jP/8P5eVQUbDLxH5S2TaC31LxlaCOm7gZf4/HmG+15vMNPqt?=
 =?us-ascii?Q?2DbymvQC93A7IR6XCker3LKzicsrXqW0/w2BWcXOMCfJtGTd5XFJrmFbwqmh?=
 =?us-ascii?Q?MWgvdLdIQWuP8suQ6erk0+d4exfyhGM9wFvH6+yxfwZiWzRfsAoUcl89DOKP?=
 =?us-ascii?Q?BbOZ+qZQ1AwgcETICamucm0zvqA7/8keRfWq3ilsQtLKd36bGAhCIr5Bi5YX?=
 =?us-ascii?Q?ExhBI1OvLlo076sKD6lAtZE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 873e8f9e-8444-456a-d51b-08ddfbf2da1c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 05:17:41.9199
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KOqhp5anA+w6u7mslxF3UlzoYawJstdhFdWGWjF2X9fEG0S7sFaVnS20gfySG94NB3uBcCi4EvFiyFZrAfjB0iGnfo4mWf4H/EpGtv9jOeVrOL4n0FXufwf54bh4ASAq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB15474

This driver is assuming MSIOF is used as Clock/Frame Consumer Mode, and
there is a case that some Codec (= Clock/Frame Provider) might output
Clock/Frame before setup MSIOF.

And, MSIOF will capture data without checking SYNC signal Hi/Low (= R/L).

This means, if MSIOF RXE bit was set as 1 in case of SYNC signal was Hi
(= R) timing, it will start capture data since next SYNC low signal (= L).
Because Linux assumes sound data is lined up as R->L->R->L->..., the data
R/L might be opposite.

The only solution in this case is start CLK/SYNC *after* MSIOF settings,
but it depends when and how Codec driver start it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Tested-by: Yusuke Goda <yusuke.goda.sx@renesas.com>
---
 sound/soc/renesas/rcar/msiof.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/sound/soc/renesas/rcar/msiof.c b/sound/soc/renesas/rcar/msiof.c
index df664800bf60..330b65b29597 100644
--- a/sound/soc/renesas/rcar/msiof.c
+++ b/sound/soc/renesas/rcar/msiof.c
@@ -46,6 +46,25 @@
  * Setup both direction (Playback/Capture) in the same time.
  */
 
+/*
+ * [NOTE-R/L]
+ *
+ * The data of Captured might be R/L opposite.
+ *
+ * This driver is assuming MSIOF is used as Clock/Frame Consumer Mode, and there is a case that some
+ * Codec (= Clock/Frame Provider) might output Clock/Frame before setup MSIOF. It depends on Codec
+ * driver implementation.
+ *
+ * MSIOF will capture data without checking SYNC signal Hi/Low (= R/L).
+ *
+ * This means, if MSIOF RXE bit was set as 1 in case of SYNC signal was Hi (= R) timing, it will
+ * start capture data since next SYNC low singla (= L). Because Linux assumes sound data is lined
+ * up as R->L->R->L->..., the data R/L will be opposite.
+ *
+ * The only solution in this case is start CLK/SYNC *after* MSIOF settings, but it depends when and
+ * how Codec driver start it.
+ */
+
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_dma.h>
-- 
2.43.0

