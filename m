Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012017.outbound.protection.outlook.com [52.101.66.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA4B355816;
	Wed, 11 Feb 2026 09:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770802454; cv=fail; b=TWwb6vBsYrnL3yrkeK6T3GJsuZ7HKvvG/+mV+/gQ7IsodbyeisE82QHoKdunj5NWqrOodPPtMhPeRelaPqQMDPv4Hk7I6JO39NJwH5KKPGNuY/1IcIyQyEFs5iP/63mW+UZJQbzU4z9+dD3CzyOjiLvp79CWK2qNarjW4ovky7g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770802454; c=relaxed/simple;
	bh=d0H0D5ihRfTilFmebOwu2D6C5GnCQYvQQUYE4PuEb7M=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=DvWfSvIleU49Yzr8SmapI2oI2BxWeJxQvYCpbgxl+TnhkLliiMQ6XxE3spL16H0gBj+tB6I4yqzDek3NQiPYT92Fv81/VyLFRTnOgLyH5TJAgSEfLGTwB2aar5M+eq0qptjhopnkchHCXhnzb9L/P13oumBtnt2Of3TuWX6Qe8Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hsQvrTju; arc=fail smtp.client-ip=52.101.66.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hsQvrTju"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VXHJkOOHqAJXMZ9v/UmKgAl90TGhs64rq3Cc6xTZUxsR++FfMmhnKaiAPFwmODN5JM3fZEDqFPq9hADZK/wISyUOZr8JOrHlYah22orD3OO6MWVd+cdogxei8+g81s01Azsmp8evQje1Cdraxm5FhjRPL9uofv+Miya4wKWS8Xo3vysokgAiQhnABiCuyiAsjsMcfxYAvVXB9RAUr+zwwKhWOMk2T/rbdlkHTRYZFZOvhzeEcb1OvyhTx2NmPLLZjilgluaS0/TIfINbv4wJfx1J4loDEiQqcjh8GHBScQVWuNc4UeZQDe/eSGwtr13AxjyiEg6SVxyfWdwp0ja7+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u6a/p13YbR6HnhO5NLeUROfhzjNUUlhqa25240mHcNc=;
 b=vFSOg8aJVZh7+HmcIk3l8SWxT7WexZ1t5uBQh6KIUMpODq/rSDzqXlN+brhkEBdAC26nbvg6s9z6nrfAxSWcSQNznHQq0eg95rSSU9eMu6cw4ExEad2+xQzHbpviY5LWuKZSFBTwCElpRVw0+0qEhFyUDyuWCTetRNPco48Mcj0o6WykEPLuomuQWhg57EkTJfx2gejSXMm/HLdJnhNwpilk4xsAESzOOfT7K7LvdYE6PVYSLyO/myYvc5dGHjSjVFMKFA5wbi99DP3lhIOxhH7Ov77USQP3BY1izMzsoJmJh1z/qEi8Vb9aHDaH0GKvkkw+y3qYb2LbO7rNfUX5yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u6a/p13YbR6HnhO5NLeUROfhzjNUUlhqa25240mHcNc=;
 b=hsQvrTjubTn/V4tlGjXG0+qVN05s3qHrRccpDJtyLlBbxenGFXjvcgirfNcNcYc0xNpX3WMk7Mq/Uwf7VCyl7MyKc8RGx+HOGL/1L4UzwV/91CPPxbYCZ/IV3l5cOyphnuoImjs6hnXS8wi606RCn6uS8VMS8TzcSOSdwO+KBVLkH0wFKvXgIxna62d/lkQ7rMz8qc6lvWCvGN2x+uFUCG+el9WtmoSNz4UM5YmxKTlJggIT4VZL9hlT+VYyhpi7PHKSzQbC+irkazVgd/y75+OaWCNjTd7fmbaUMFJQUNafJej3aDgw5iLS0pGWpMDNFC3wOyzTaXoCxOJn/G5k3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by AM8PR04MB7219.eurprd04.prod.outlook.com (2603:10a6:20b:1d3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 09:34:11 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%3]) with mapi id 15.20.9587.013; Wed, 11 Feb 2026
 09:34:11 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	ckeepax@opensource.cirrus.com,
	andriy.shevchenko@linux.intel.com,
	nichen@iscas.ac.cn,
	kuninori.morimoto.gx@renesas.com
Subject: [PATCH 0/3] ASoC: codec: fixes for ak4458 and ak5558 codecs
Date: Wed, 11 Feb 2026 17:35:24 +0800
Message-Id: <20260211093527.2892297-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0040.apcprd02.prod.outlook.com
 (2603:1096:4:196::6) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|AM8PR04MB7219:EE_
X-MS-Office365-Filtering-Correlation-Id: 55eea2a5-0056-40d6-8b4f-08de6950b62c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|19092799006|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SP1HGYwbuSBJ/Sf1dfNDL7tgC2gmFQqDPx+kGajgS+dubaJXKbFNtoo309lc?=
 =?us-ascii?Q?ir5pSrXQvbZNYWCWEdO1ZahEex0C8Jhr3E60zFVwYnakEBXRlTmVXFEmr3xb?=
 =?us-ascii?Q?F7U8paksQULnFHT7JborHKCoZUzXSjYfOJ7Dm0fj61lomZs6IS5tLF5TMgu6?=
 =?us-ascii?Q?zGByrJDi4hyLQYvbnlZxUsTZkSp3z8pD5Oteq6EvibC6LgC7XsWw8DYbl/h6?=
 =?us-ascii?Q?K5lqCV1sP+mjYRFWDiuwjr0jfxRgnB4QJGMMLl+F1usXQwJEYs/9WBmfIDkM?=
 =?us-ascii?Q?DvnsdMh3EkWYRQzKU942SKq0Btt8/bC96LiISgL6o7N25FaZfbjH8hqICADZ?=
 =?us-ascii?Q?wMj00+Rs/kZdWYcUXnotsUnKJwEkDRwDisFH88I221TeSxeV5+VB48SUcy50?=
 =?us-ascii?Q?Y8gmyI27DMO9o/fdXkhMtd4r+BZlilLxtzATrEEYv7FKmYaGa9IYFL13YG8n?=
 =?us-ascii?Q?V+N2xgSr5AKU28rA5AtvEKDJ5qZywuOGfLyq5MDISejFlHNTt57s0xF3KDLi?=
 =?us-ascii?Q?k8v5774ckGd/ppC/1Fli4LWnqRK2eZgA5aw/heovebQ04wncxFyIIS7XvHXw?=
 =?us-ascii?Q?dsShlJ9pmjzfYvm9/K5/UJCw3m/zLII+EL7jv54XL5rKNCDtQOwZi03doyWM?=
 =?us-ascii?Q?N6XMn1y1zg8sezL3xOkIoq8r3XJlnLIna+YDpBQJ4xBQag1vzsSdX1zDjJrA?=
 =?us-ascii?Q?bgrDuNX9i7t0Grdw8R5IrqoxVRHa0ln0N0fC1TOxvTOMv152+k++Pf1QAlRQ?=
 =?us-ascii?Q?K4Kg2qu78+Erm7YGOzA9WPlayGnMc+/dzZLpytJTXf/3aDFNFd7NrodsQG6b?=
 =?us-ascii?Q?R53N8Pjuab5cXnXpFlA1nWHvNpZDIhRy9cCe5Vo5MpMWYx1Y2SPX7RZlB+e7?=
 =?us-ascii?Q?dP22PX2QoWiCrWxT+bycQIIRc3qahLM4yKshoVgqoPN4MgtFX+dG0FWWrptj?=
 =?us-ascii?Q?sCH0IJYVSOXvUD/7SiCJyfx4r/uoh0ymw5EvWz4g5008ABnR9CRcgd0nq0zd?=
 =?us-ascii?Q?VAASm0r934mDZG4a4DSzBrilEs1FstB3KjOqlY/wra97+eKMgcHKvnayXJNh?=
 =?us-ascii?Q?zKIkwl44Yd8cqzTmloW3rTucGmUUd8K/8+JfgsRjGV1P6A+zHRLHe5O80Fvh?=
 =?us-ascii?Q?5gqnuZjgkJp53jID/XImEmuqNklXs2ntT2ohaSZI0+9xeQjvu/cGwzvxDJMr?=
 =?us-ascii?Q?uVA3rsYSrKP/Pc62e+jTQbVU3Si7z9scG45XkhAyrG35ojQLp6sojHzzOVji?=
 =?us-ascii?Q?s6K5HKwcW0gP3vvRWFC176rZ8qKdroumdBVAEwFmZhKCcDWNPhGOf9kutgCZ?=
 =?us-ascii?Q?eRXjsxFGml4c9wsqw3lqhQmuVeVdhEoUGgbifxKXL0YMcb38cdF5b6pVNqUR?=
 =?us-ascii?Q?hpqqFk26rKhDpQcVXFBpVqDSPY84H9OVC1SUEEW3jkCL6nJwYyDhp012mXdr?=
 =?us-ascii?Q?Ai28e3J4FjvJnR8u/sy4cseXhTrqBB3zL9LeShxRrjuUWNvgrWNCDMbNT9tk?=
 =?us-ascii?Q?pLv+E7/rBULIMRzU604RYeGJxNeuBI64VMGwTbC4YqUVwpkYdhFj655hrHPT?=
 =?us-ascii?Q?QqXG75i8ZTwMMgtlqyNjKt/XTKEUVAVsOm6MgGrkavsJQ/LceeAWDin8ChPm?=
 =?us-ascii?Q?QrTcQIuLGCZywQz1aXdQNSXLTAwso+Hh266eFfxLjtVF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(19092799006)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aUWqqZyGvcJxrdGaDR9qmz80aU03/VkleGpm7syIvyqviQN3yF9DkHJH8yRG?=
 =?us-ascii?Q?apAzqMqb0gCp58G0MokTz9ZYdHESZcsRoAG7R+enu3RKTrNBJuYR1XpWBS2F?=
 =?us-ascii?Q?imvzZV/8FFphv+SUZ096uJZnLvHsxWIeYbYaTVpGK7pWPGGK869Y7P4ViStC?=
 =?us-ascii?Q?vlDAbaBadRykc2lmgpqR7YlQubn3qny8H3RtC+A/W/3l5JIuZ93GbRmq0asm?=
 =?us-ascii?Q?+PtphOOxLNBDxAs1RCoAol+NP59arKGHvyzbVENpal8tVjZRZbkMlyty/N9I?=
 =?us-ascii?Q?zB+jRjoex43qLEShy0wXprGt2AxaV8YJdc2XKqx/zC2EC1hhQEBOF7RO75Tl?=
 =?us-ascii?Q?prAxe+85gpTPippRzybV5NR4atmav4Vw2cPGwhNyu8bGtTr979PgcZ08jth7?=
 =?us-ascii?Q?ufRx6Taqsbj4fxoSAokGHwN/KyPT+JTBvcO5h0N3k/rnNdSOmzevziE2wvlU?=
 =?us-ascii?Q?cxIqexg8AolzXPu1iSXXKmzhSSXBPKF5vtE3AIj+utEsV9Thxw4Spmu/KcjU?=
 =?us-ascii?Q?iEwFoPlPeIYKy7eLNwt5GqPM3qKBkfwmbvYtGLUrLUdGCqYtc5o87PAGQkew?=
 =?us-ascii?Q?dud26siLo02QzXLlbiRHTBD9JnLkc6UnG+dZ12Lxe98g6mfWPvSDlDrJppKj?=
 =?us-ascii?Q?tIm6eOa8vvM8sVJiyoltQYyiFsNh7uSbfqswwRabv5TgE+HAGbKGeaT7zDv6?=
 =?us-ascii?Q?ioQPvELKWT+lV5o/AtBrE4JAovGIu+6cBAL0Q6EvoiqUKl+fsB3bgWIl2FeE?=
 =?us-ascii?Q?jjeiXy0nxQSfRSf0J4uo9VM5jNpUEUngqGFVF4cNRBcc30h83rl2q9yoD9DF?=
 =?us-ascii?Q?IP4WSlwk8EOVNCdYE57YcYNyUdkN357pDqaYoJGZcEpMgqAlq450QEFclhdH?=
 =?us-ascii?Q?d94cT0rh8uByUXOZbOY83SbYyEKXs+d9d9yuF0NJj2Bj3+0rs7+v8h8vdwxl?=
 =?us-ascii?Q?8I4rTVus1bass4FJRK3aYi9HFWi7ZQtd7y4EsNIM7JPKX8sPow8I/q4zflEG?=
 =?us-ascii?Q?/qOvzBHkriK4lEM3bqXL519G7MOTeI9BYXpC8W4OcyFWdFwJLfW/agb9oZz5?=
 =?us-ascii?Q?iXSS9r7LZk3cH7POVyN3xoe3uj1ZGdnXuAv09YFo5ww5NAGpm/wyACOd4Ni2?=
 =?us-ascii?Q?Ue9jRlmBUUVcwrS3a2wRQAyrV9hajBP2U2M5uTcal+ARsaUs69mFZ7uB/yeZ?=
 =?us-ascii?Q?w5qr3htfxI/og323KZQdVSIckOaovBe6xQZUm7EmfhDXUzvANLlt2NUHQqOA?=
 =?us-ascii?Q?mc8pa4MUBmLA7IlR89OlyDZ2GwXes2IhsN5PddZgqkrWKAAAzN/m3Hd8gfjZ?=
 =?us-ascii?Q?4vSAg1qg8OY9qE//Z06UyFlSIwK55MwGGILRIcjYxM8dSnH/t72Szp+0qVpH?=
 =?us-ascii?Q?dMC3M9wjFXtGNvRa/c/dgTiZpj/KXxBK/ylwhiKYtSOPiBuynuwCB5ize4xi?=
 =?us-ascii?Q?rRb/QdhA7GstOwxfL+MABP+xAjbPgWiaxbL5bjx63VKPRtsC78Vz6O6W6dOV?=
 =?us-ascii?Q?WIkktU0Atde6Brufy2/wU3aaEQ0t+M3OM3FyiNEsqKihxqGrRRBs5G9Y/jmC?=
 =?us-ascii?Q?G05j6S/unkDny+9loDqm5oSRVasKvu/BgMl3MWzvlGWueKd8uj5uj0v5BvMM?=
 =?us-ascii?Q?xbwSLt45utWDcEq+2a4PiLWt+C4x6iEqVd/aMD6WYBEZAq8yRdTmmINseMOX?=
 =?us-ascii?Q?GS/NsGa5NVzS8iIJkMEZ7iJrc0QWnBrMDQIAOe4KhzE4fSCJt6bbA5iSNP3N?=
 =?us-ascii?Q?hwZCD31HoA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55eea2a5-0056-40d6-8b4f-08de6950b62c
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 09:34:11.1518
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aCAEYYPKv5KDQhp7waRCNlZnaMNHLGYEm3OBIiJuoM/WFpD4QIi4J2wTLSORuueCIW7wh1LddGpvHEl7Q2QzjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7219

Fix the binding document of ak4458
Fix the supply name of ak4458 and ak5558

Shengjiu Wang (3):
  ASoC: dt-bindings: asahi-kasei,ak4458: set unevaluatedProperties:false
  ASoC: ak4458: Fix the supply names
  ASoC: ak5558: Fix the supply names

 .../devicetree/bindings/sound/asahi-kasei,ak4458.yaml         | 2 +-
 sound/soc/codecs/ak4458.c                                     | 4 ++--
 sound/soc/codecs/ak5558.c                                     | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.34.1

