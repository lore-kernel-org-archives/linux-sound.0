Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011007.outbound.protection.outlook.com [52.101.125.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B650A189906
	for <linux-sound@vger.kernel.org>; Thu, 26 Jun 2025 02:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750903923; cv=fail; b=RM84TGjn/hiNMcHTDOm0cSGBy7tOfHVnoVLhNIh8CJDcmksN7jKq6a7t6i5sSLkNrerdx44DayTIkFJVVRetTsF4dvQUnr2+i8iTWqdGx8DwBG1DvygVYrel2Jyy69yABSQDFX0k45iP2z5OeoEOVpXqnEaM2bFR9783ESNHZgs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750903923; c=relaxed/simple;
	bh=lmUv8PQUhRAeseEdz70lcmFLBme1ctlr7FMty6KZ2Zg=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=FQ5xbTcYAUyqR3eZ5xWnp1RQiHKer9y0+9q7MyB8To4Gd7sZZ0YBnXRMaFOJ/Wzskuvs96XqguBIYqQDT6PV4lNVqWjxgWaXrw9RuAkRUlH0ZIXDMQIes/Zk1v81uoL4Dvj6h4hSF8gi1R3r1mwOVSvGXNNbEldnwRxQGfTXAgw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Us9J98B3; arc=fail smtp.client-ip=52.101.125.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Us9J98B3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SzpkqN+nUX5OpqDdLeA1I2dTCTjY2it9m1SlBZAkaYQRnMdryhfoc9FRTHQ9SaP2HNcFMT2d1DQLI3bJxGPupknWTnSYoBxePLfnbskVKUpOakY2c7ReBTKVDs4MyxniGxf1GDhYzUP9LSikf9mmXGHcZoWjjcPqch1yXSkhQY5GLL7MZbPQw6djBfff+z2a4uQX0y8QuqACf9O1ZEV/NQjw9j5taCnFEBYSDbo4s11NKHwtSeww5m/MgFsxR81/r6YTpIwe+T5If4d1gFNZG+DtwIcJFuqfETR/ETbEfQtM0Et4mkT/SWxly3Cra03O+Ry7pUt63EBqCSrN/4NtGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=utaq8h80rVKrsbgKz8DkOBDMSq1DYwnHx2IPLbG5KDs=;
 b=GWPZiHcqvbAzbp8XOE0fI/E1C7ODvI+si0D2E0mFyBB5ejoQcfabLqJ+0bjOnvlo0Y6IQ014ZkcAZoBy2aug2DGBuOXQfqtNZW/4+cQ8KUfAimgW9QoW14BR97ZjFVembauHw6Xq5DPmWH4c7qSpBeHrDQUKkWYErHt48hwvImqvNaQctZe4B3PSF0zO5O7WhmNvQ/etbiSkfnLBcP9VhibpNnNyPj3Tne3rdWhNmzYKl1zZB97MmuTGikQSUlw3gXMhO4k/s9XV2F/rANFYF8yQlVBo801aWU2QnrcH0bp0CRrm2T2jUJcvcZF7o38fI7vho3TL8zZUMox8AEFBEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=utaq8h80rVKrsbgKz8DkOBDMSq1DYwnHx2IPLbG5KDs=;
 b=Us9J98B3yIRrgLdfwyGURgtzTjIBD5akjK4eGquo84nvJqAogP5z9KNypcv2xhC7rL3jLKdkCoV/+pHCnUzWAQD+hHz0HQu4LRUhLdtXFsgjL6NwqXoYi97/TxHAYII+ms/me+hvsX9lGt/Lrbg+znl9v+XV98W+dGgfJ3A5jIM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14) by TY4PR01MB14355.jpnprd01.prod.outlook.com
 (2603:1096:405:23d::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Thu, 26 Jun
 2025 02:11:57 +0000
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8]) by TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8%4]) with mapi id 15.20.8880.015; Thu, 26 Jun 2025
 02:11:57 +0000
Message-ID: <87y0tf1cb6.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 00/11] ASoC: soc-dapm: cleanups
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 26 Jun 2025 02:11:57 +0000
X-ClientProxiedBy: TY4PR01CA0042.jpnprd01.prod.outlook.com
 (2603:1096:405:2bd::7) To TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB10906:EE_|TY4PR01MB14355:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b0b6546-b9dc-4e5e-6e04-08ddb456d40c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1KKgGU5waqtX/yid9bLglG6mkK8x1O55UnI0MfP2yxHjym+lvAbIqUhSB9GN?=
 =?us-ascii?Q?JH6jWegtnJkCFKmck3SbWeu/6domOWCRCqT42QgznUkqNCXYxjejS6umJnTG?=
 =?us-ascii?Q?Tvs90WoBDYyNeucCbZpVnoZnQMyKx2wo4vVTOh+pwJfkPCIXbMz2m3oDbnoA?=
 =?us-ascii?Q?thRxh/hDw0I21SBieBPNENK/8zEb85P4J8BI6dc0vfy1UfMiupaHhMaJiloX?=
 =?us-ascii?Q?8udsXmzytvvBweJG5vUpgcgtj03qi5envcY4hUozRT1sar5+vFJun1vS8NVy?=
 =?us-ascii?Q?f5edbhMIgozo+eIzJEGWCd9zMHo0mkSLlhDCp78FeZW76hnJmLPcMzRYV5n6?=
 =?us-ascii?Q?yahXm+Bh1vPeeVCzbZufbwUYdZZpSPlXY0ZLgi7fNlQXrpfWVe6U+d6bY2Bv?=
 =?us-ascii?Q?xms19+XzM+3RL0FR5UcTlPDjjpc7u+j7cXuygFADG5pebvoxDnrUICHXXGkE?=
 =?us-ascii?Q?i8t3OjEP3c1a/7cj2p/e6RSCnyTd0QA5GZxxW7Wo3ZvXdZonfw7ePXX+DJuY?=
 =?us-ascii?Q?yKKKe7BPouQ/Jj82WYuX0z+b5KFkmbkpC+ihyA96P6PlUcsFbyvHOzmxYnRo?=
 =?us-ascii?Q?TgOaQwGBtMaYq/7zq0pGV5afLHvhXm2Fb8Qc+FyyroY3lqi1jD7e68308UZg?=
 =?us-ascii?Q?6Bsa+zaLt3fVpsbKy/ZZ8I6DFFOKZYhWt9JBTOSuqKZmI+UBBHxHjoQ/rhVd?=
 =?us-ascii?Q?WyDFqp1O8Ua1VLvtbQUMW4PBgkB728bpBFL54J3+/u9LxTr4TdSfCMMDRKjZ?=
 =?us-ascii?Q?7/9HlQj0BDNjeANj94T6vpvUSeGtFdN0F9nnrQJGA9Lbpm+8iqQ4uy29loMx?=
 =?us-ascii?Q?5fWnlT9PFXxGywZLeKI233/P9KNlYdPMfCZbJiC8dpZyJmEp1qWDFbWFKH0x?=
 =?us-ascii?Q?ogLi+gLTVgp4dbjuY2R8Y/hoayqWwT2z1ynxl3eVU0kh3I0JSYey9aIU9bwo?=
 =?us-ascii?Q?VNZ+3222VhBMlTDhanwcWrKMq+vuIDex6+llrXRa7LGrXl+NG9o0OawiqBnF?=
 =?us-ascii?Q?rIQ1B5Z1/x3+xI4Er9A8MpHJ9kCIjm/gw790Fds444Yoj25jClZ94TtodFi9?=
 =?us-ascii?Q?zGcbes+3tbI6p+jU0C/2isKno943GxQVFg4fpefef6V3KjF4Hqb3zPHl/jjz?=
 =?us-ascii?Q?H+NwpgcpczKIj6jKpvUcKJNvNo7iOq6NE1lmQRz2RBoRu8/TMzr3TKsL7ZRC?=
 =?us-ascii?Q?QaT6aF88uYoIthVNzZHCzr1yCdWlH08RDqCs5Gku9VrArkEuthWovKNCpX/0?=
 =?us-ascii?Q?YAkt3S7OR1kXttH06eSsdI67V+5i7ZjEQpDezB+915L4Vvwmg6HsGn4yrZsF?=
 =?us-ascii?Q?tXiH3/3Eqzc7bfemCA4XYU5aXTGbahF8Ub6NdqooKTlY9eIUKVn4Cth1FCXV?=
 =?us-ascii?Q?4jO3m25Sx38IGn6ztB4JXI1WIFM8O3NWAZ/hsB5MfPLT5lUQsgkSERHjSKbN?=
 =?us-ascii?Q?ISnXJrbo8PqLCHRMg23cgzmfnwec50924kUrn8G7qpFeDlMlpPLgWA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB10906.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5mnSdK3pB3VD0zxMe5NFCWw3yTKAFRIFYfYful8OJ4cMt30ebFFrz/fJe3C6?=
 =?us-ascii?Q?zCGE39H+P8+FA2OX0RXuGBayR2XjphiPzy5XcLjIuozHW9O6qidDR+5rillE?=
 =?us-ascii?Q?XyXpMJwS13VjoFCmmlKDCzy9zfpAosvpilHpyhw79mb7xGljYpfJ8sI3jgqw?=
 =?us-ascii?Q?RxVraYZ8CucdppfL5fQ4dzT2rPndLT/+u2nW2uvW+LGoPG0HEw/kqV31/jcC?=
 =?us-ascii?Q?kFUrZa1OAqhuHKece6opoINN1LHuHhvrbQ2/qEDK5IfgQbNZU6UEG/Mb0564?=
 =?us-ascii?Q?M7GrM8lpSM1UkSYasJ5RTFXjXJo/BQy4FnJP5oCdHrJcWBjckWXNCwvSXCIh?=
 =?us-ascii?Q?1jtmtBR5Ula9Mpue3UoQA5qrOm3Vfvz6WyRjDfPz6w6Yw1KRnqIxzBTslHGP?=
 =?us-ascii?Q?JBc+Z92Bmn1G6DHLfC/gLOht1zgrV51ElJYSX92cK9ynjSpzyADihpMRuWaG?=
 =?us-ascii?Q?qMEtid5no6x0oCpFmT7Hpsu3yMZ3STOE5CIw1U1SUgoj9MnNJXwt+RSlYw1S?=
 =?us-ascii?Q?KXGE+ADsm/5f+4mA9ch9QTDw2KTkMY9FCsqfXrjA0Kycyk7eyuCjHbnVH9MH?=
 =?us-ascii?Q?LSmFwkz7dyACtffwFtPTxIEkP7J9Hwno7U14too/tLj5oYl3xctBwvj1ANUH?=
 =?us-ascii?Q?4Q0/gRHfrO9axwyLUxTroabMmgCQl7D1QzDM233FDYoObtTxtO++CJA7tioi?=
 =?us-ascii?Q?ozNnmHiJDsQ3V741IMluUE0potJ57981kcT1yeNQ6viAvZluDqdQ/anOV0wd?=
 =?us-ascii?Q?/yNuRb/4DyinhIQ/Ihbqw6kf0WI7Ws2KJnLsNIJLx+nO1Gx9dRZZq1lDS8Jv?=
 =?us-ascii?Q?lw5v1UtvkxtTwWW8RXu8gE7zL/kJa8PQEEkKv3Yw9jhKgvjwoE/EmVlwsdTr?=
 =?us-ascii?Q?RHAsBuhTBYsR/ogHS9Kh5x1+gq/7cV4W/la//5znHHvQ3oBlHJwHsXMBP8+C?=
 =?us-ascii?Q?BABeqn1+7ir6aQNCvhmQuam6onuerhaPh2M3Ye6tjxohjr3aR8ycN5loHy/V?=
 =?us-ascii?Q?ZJstZR1e3Vf7Q7zovgWGmx1EVa3Zz6twfzLkVXgC4nd/SvF3/guzIs5WA8zg?=
 =?us-ascii?Q?4yaUiD7+aSevUpKsDem8gdiLN6sESGYlJjyIBfdes0+idQaxU8+8EDW9Hn3L?=
 =?us-ascii?Q?H4cQ1b1Rr+ZX3v4vrZxUYhM1kAP0ygV89Fa3H4p/BQ2PYL681XQcp39yLuKj?=
 =?us-ascii?Q?bJ64H0P8hmFEOcvD3+UuBkS9qDyfrW5t5w5SgqVccOZSBpq528ShAbDKGGVQ?=
 =?us-ascii?Q?AMalwaFy2eFLaibHCZU/8txJxr3tbi5Fa6ic8eFe+xlnw80ZJba4NaO9aLEP?=
 =?us-ascii?Q?AkFVfzulJxNcX+qDYF8FQ9gIl0wzkeaYtNcrb2lUUOWIfu+yHPVzdG4koR8/?=
 =?us-ascii?Q?d+9fZMFrFRZP8zYmNvD1ojZRt9AYjdkkdpO68sGlHMvfTaosj9lqMm97fzpj?=
 =?us-ascii?Q?kMED7h0gjRlHLhJCeNcOmTPEKa0ApUvxtf6YwaCrUh0Vnzm+vXhxArRB77tD?=
 =?us-ascii?Q?dS+7Ny1TWjKRnyndlqrKvdQoAW3/m5yNR8e7IPh/GlKrCMjbhCn3l8E+vo8K?=
 =?us-ascii?Q?stZJP4aPZxVrnSYqQOrxCqgMRHaChYOAopnXzCAW1xBtSgo4TTWnhJ614X/W?=
 =?us-ascii?Q?ttXb9MbdbY2Z7lFoG+9wl+Q=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b0b6546-b9dc-4e5e-6e04-08ddb456d40c
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB10906.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 02:11:57.5496
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M4DQNqiPZPla9Euy3e6lSeIMECJqmPXasXp+4mt/OxFKDECrmTD3OcgbIFqNh6n5Z/TGLEQXq4IN7Zbl/qA+sYNSMZWP6PKN5VAY2jzHwcLYzjlhGIIn9EkUghr2SidX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14355


Hi Mark

These are cleanup patches for soc-dapm.
This is prepare to hiding snd_soc_dapm_context inside soc-dapm.c

Kuninori Morimoto (11):
  ASoC: soc-dapm: remove unnecessary definition
  ASoC: soc-dapm: remove EXPORT_SYMBOL_GPL() from unneeded function
  ASoC: soc-dapm: remove snd_soc_dapm_nc_pin[_unlocked]()
  ASoC: soc-dapm: remove snd_soc_dapm_weak_routes()
  ASoC: soc-dapm: reordering function definitions
  ASoC: soc-dapm: reordering header definitions
  ASoC: soc-dapm: use component instead of cmpnt
  ASoC: soc-dapm: use common name for dapm
  ASoC: soc-dapm: add prefix on dapm_mark_endpoints_dirty()
  ASoC: soc-dapm: add prefix on dapm_xxx_event()
  ASoC: soc-dapm: add prefix on soc_dapm_dev_attrs

 include/sound/soc-dapm.h                  |  235 +++--
 sound/soc/mediatek/mt8188/mt8188-mt6359.c |    4 +-
 sound/soc/soc-core.c                      |    8 +-
 sound/soc/soc-dapm.c                      | 1004 +++++++++------------
 4 files changed, 548 insertions(+), 703 deletions(-)

-- 
2.43.0

