Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010067.outbound.protection.outlook.com [52.101.229.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34D11DD0D4
	for <linux-sound@vger.kernel.org>; Thu,  2 Jul 2026 01:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782955261; cv=fail; b=NxVZHmO7iTilcWsmglGDeXu8Wruv0cgPQJre2gvcR6sd2+3OPucj8KjwpWL6b3UoqqbR8jmIdM9zzAdporJdeTu3jbTyDjfW+8EftRUx3JOzQjLU+X9ysyWtpPHwWf6TbIj6hel696hTS6XWCTUumv+2lCGpW4F40GDMIfBZoos=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782955261; c=relaxed/simple;
	bh=Gy/bVYyNlxOnBLpm2qFrali3CDhbVUy/2LTtpLSXqkI=;
	h=Message-ID:To:From:Subject:Content-Type:Date:MIME-Version; b=DWujFoDkcLT0lMHhfjUYbBmL3o4USaTlsJqU+zZQIyLsAMi9zDjStmY0ILqUKY9hw4asIhgZij6qMXybJZTjyJa7mgolOt7Rb6KHwsmBT9/fZY4uo2rKSVDuVtIim4+jlnoYGoHf+GMvKY0F5OmeT4F2GvRSJ9Kr/7gitj5tOOs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=OUJjBnWE; arc=fail smtp.client-ip=52.101.229.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="OUJjBnWE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NVCG1SG3iZGKwTKVzSKvJe7+gZ51n752ytrCEs3JXiLkEg81Gs8pwBo540DPjzWRY94ljM4JlHh92dPiRq07SCujbPHmMPzdnkIS7dX3TJD+kTIfjGgBzV4gozU0esCcCrSxeQANyY/UPiBZrI88oICJrZzGdGmKlKUZHGQBbuwRDXThScFwZ+sMKOW6eGABs892DL543m5Vcfartm0Vko0PU8wvyv51cGB2mVuhX+YGLWXBWOa5kI4svLkFamqdLSOdlhU3IZ5Sh93mnQY4DAaQ8O/rG19pzANtfgiX5Pv5057/XbdqqSoNWGERzLl9BCb9qgwtqMy/HUUG1mWkww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HCupINtGNcD8zl/rXg1f1U9slyciOBRDAaqodiI96FQ=;
 b=TlPrwv2OkEWjHyjmRkCZc+zzLalRrCzYpvUBU7/g27rEkCb9tQfy0W7BlRcem9fDVIkpYSCRooW5rss7K8SCJXLGLzb8mrR9JaoqCBOXAGI399UbDdUhHVenUKTBNdX/52ex++1mXxI23Mn34/zpzpgHyxq0NMkWmG+Bx3/Vb00caXyuhqj40gWlWe/HSIPnSjl58QH+o7jv4efJVR96QAtaz4y2WvTJ9mBQg/7hmdsRRF6IWT/PcUOVD9PcVmZJi/bqRoO7WM1JqPG+YoVAhRux7Hi9fCtri85cMc301CK3I5RqLj6V/ueoAI7w3Cz6vhS2d1OpCs0XGPqBWC+deA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HCupINtGNcD8zl/rXg1f1U9slyciOBRDAaqodiI96FQ=;
 b=OUJjBnWEqWvyct0Bkd2jQAdQUFl+kekGl0ecqNHR6YY3cePmDQ9zJvSSNMswFpY7IH+l211GfhDxYnKPvXpAa7SeYk4CXF+u1Nom+fhsh13BNz+YxaqpuC4nIkH+8+ZZthtE+qkIIH8S8f3hQO+t4GwvK9cyaE6uyGzO7Nx72uQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com (2603:1096:604:235::9)
 by OSCPR01MB14981.jpnprd01.prod.outlook.com (2603:1096:604:3ac::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Thu, 2 Jul 2026
 01:20:56 +0000
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834]) by OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834%5]) with mapi id 15.21.0181.008; Thu, 2 Jul 2026
 01:20:56 +0000
Message-ID: <87v7ayxk3s.wl-kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-2?Q?=22Amadeusz_S=B3awi=F1ski=22?=
 <amadeuszx.slawinski@linux.intel.com>, Bard Liao
 <yung-chuan.liao@linux.intel.com>, bui duc phuc <phucduc.bui@gmail.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, Fabio Estevam
 <festevam@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>, Lars-Peter Clausen <lars@metafoo.de>, Liam
 Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, Mark Brown
 <broonie@kernel.org>, Nicolin Chen <nicoleotsuka@gmail.com>, Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.dev>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Xiubo Li <Xiubo.Lee@gmail.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/8] ASoC: add [devm_]snd_soc_register_component_with_name()
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 2 Jul 2026 01:20:56 +0000
X-ClientProxiedBy: TYCP286CA0276.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::13) To OSRPR01MB11811.jpnprd01.prod.outlook.com
 (2603:1096:604:235::9)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSRPR01MB11811:EE_|OSCPR01MB14981:EE_
X-MS-Office365-Filtering-Correlation-Id: 526ddd0c-5cde-45c8-e56b-08ded7d82adf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|23010399003|52116014|376014|1800799024|56012099006|18002099003|11063799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	VugFiEt8Cl4Nv3SvcdTnix3nvWDtO3vLmpivOx40uSEAWsgCY43NJU4/tBl0evcKwOp0/fPj1uSpdQDykzKxbg6C5knrnCETiLzBNy7kjImA6ob1OmGETU9GLbuWl2nuARQVqAmCdBxjqcFKBPp7xbEU+QudAkQ8Y2l+RGOZqoe6SwpDyt1LwwJvC2j5PAjsN8eOrfYO9R//TNjKfZGlPJMKUlSu+dL3gLRjJmA7fubo0SHANzVbZ/PsWndxmKnkQmwlYhl5qyMpb4N9e6+W6cPI4BDtScgE7QSoHw+A8eFC98pWVssMNbyzw+yF8jE4917ex9REGKvoZ8zuW0z5E9HEltB/zdGjoq+bJ3/HytCSEsoTQwFpJ5gTDp7r9zOF1H3h8Hmczidie7ArIyhvXib69otVta0Gfj5GvDE5ZW+63D+dHZqP1ZZaXsJuWthXuhiiPM3dRDIvuJICeA3GUefDfDH8XZojfzaDCY5Un13pjZK5uJVPiBl+2U7JTaEFQTqteSzN3pgKu3FSXBfxC9kT4aGRKsc5IfVcIa+r425oSU3vvC+IHmb7RiTs9CO2C1sUjQBveu2HVexcIqudnbWT9SD1LXtcCGJw/E9ueNHM/9P50F7cqW7GUbw1paA7542pP3HAbzkOElzgjkZsRPZmIRKOwbv6C/xyjuioYjwiLZQxDc09uuBjNmHANH/2v4rUPf3/twOKDg/ag7VHBzifzNM3uw+HO/lQhSzrKMRGFeTbDk+WJsPLAOfFElfa
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSRPR01MB11811.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(23010399003)(52116014)(376014)(1800799024)(56012099006)(18002099003)(11063799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NKD7yaKltKAl1GIAH2jN8xLnWKbZHpWWYjOKoEAEmdMHBeBHfJf638EoywMZ?=
 =?us-ascii?Q?lmP4nQijrbl5np3tIO6eOkMlmP4dToDZ6i8gZSwJAFVuWlxGKeFQmp5RBkGL?=
 =?us-ascii?Q?me/43+8HKTVO+cnhn/vvOfsZlAY5miirhzHv0/Y3mD0VYSFaM3lRjne0fsMZ?=
 =?us-ascii?Q?IyMYb9duuPD67uPfX0g9G4wVUcHQmIC3UHSSgpJOBbnLEJP/nyMHC0PLYWgx?=
 =?us-ascii?Q?cTBNLzNe+CqFXSZX9VIdfOvARFkSUquJFkuYufMIpid2fEtQZJDqtuPV0BDs?=
 =?us-ascii?Q?x9j3UzkJCyDO571MNVutQ5XXWp8UfmV0OND0CDvWJKF93xO5NfYrTypZQias?=
 =?us-ascii?Q?aj30fjlGBeC3KsMxcOSVEJm+C73KkbHV2BUFHBtEa+AGccFT7QIVDpCeaHQF?=
 =?us-ascii?Q?Qbjec5ozncIGPASyWWYGYtBKWBucteXkIRR0Ju7SN+lW6feRdKPJlJtSq0M5?=
 =?us-ascii?Q?jVeMtk8gWVOo31l5n0jlDVoo0P0M84d8iVCHknrgzQI/FxYpED1iLUO0kwx5?=
 =?us-ascii?Q?X25fOdK9JjDZy1uHWXTQP6cp4YPPuwo4AwIlprdyqf9P0HSORT0f3d2M2pfY?=
 =?us-ascii?Q?qXA8U6WSsg7F+AAS/tOWcyz8f0LPc0kDL7Ci2lR045gQsgpGah+YC7FINm+X?=
 =?us-ascii?Q?RraJhWolWHd0QRbv5FDq/BgpwAT48qcL5wsHu74KNJbBLxwdTlUXRb03QBKj?=
 =?us-ascii?Q?fKT2VQrGv9m0NdoDaKaaGcoUJwgHfrYLyl4gFRRMQeLLs4M0G0Z6vEokP/ua?=
 =?us-ascii?Q?HoYofBvjmVGgzfh8wck7Mj1Y/jNmmdcUUEOgzY1043i16IehW/AkbN9FAv1h?=
 =?us-ascii?Q?TtSc6vcbi7Za3jUt0w7zhfP9lB4Z7YG8Yf6vY3OU2rJEUv+FjKvIpOxjxZUJ?=
 =?us-ascii?Q?jOS5TpeGMg2Lq8qgrCD4X8Wj+/D6QD65QJhHeEzqJld9ZHS+Wdu0G/FZmmff?=
 =?us-ascii?Q?Q0vGemPblrxdKzbJ8P6BL21qKVV5smuv7byorDgIMZFNVEvWi0dNXc7d0DVT?=
 =?us-ascii?Q?JvvIwC9SW89q1mV4NfwLtmMdQ5kP2q3/EL1DWdyZTokHItR58gGI8IcjsPGG?=
 =?us-ascii?Q?mF+zcJJlhdqt6LCBSNwv59CUiJ3Xqe9+cQKOyukabaMXzr99Axpt+XsCAWK6?=
 =?us-ascii?Q?/FvTgNU8Z6uzF9mEHjyyh6IksYQnwg4UUfxSdIdA9W+Ftl2TSrtzQoaiS+vh?=
 =?us-ascii?Q?8N23KJXKolv70eL3EFmDqYJzsXbU4Ymu6eusf7kB/+3f9VnNHrvcdzs8FZw1?=
 =?us-ascii?Q?V43dBTKIrLhCuSDhHujZu5R8niF+xec2UoYx+x3/dvj15BZId1R71mvrK97N?=
 =?us-ascii?Q?YT5eYm/Hu/3DBZo6Dype53AcN0FsgsufUjavbpMaZiVQsrfZM7YPOmIO4UkF?=
 =?us-ascii?Q?HkM6uK7BDx1CkSXOhihX8B8Z1dpvgnSS6wnnkbXsokpC9dSI41cBWMt638q6?=
 =?us-ascii?Q?Wb7Y34igufW8yRtbVzpdaC5XQLJ87szGwp0oimIERuKbw0vYS1Mq0ZjtZg5o?=
 =?us-ascii?Q?TrAvVmxUogWX1uLFDDd7mDjqS/7fttrOJdlRo5kNnnimmnG3TI6UE4eFlCsW?=
 =?us-ascii?Q?24BwRfmy8kzjz9Hse8PyuPXDebJgw38Pej9jdSUwK2FVuXHaK+5QbgqAh15Q?=
 =?us-ascii?Q?0IoHfOWLAk/CrEnF8G989hyCPGHAo6lOn0mmsYfh7eXVRzTo6dsZ4qLHnO41?=
 =?us-ascii?Q?Ao9e8WG4cMEamIS4+uw1YjmUTK5l2+r7xf56flBxnpdPZDRtHjW+NXPz5IfX?=
 =?us-ascii?Q?tkhLrsd58iVyQePsXQhwuEmBU5ODHdnLKgP21gGqTBoge2tzhYk9?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 526ddd0c-5cde-45c8-e56b-08ded7d82adf
X-MS-Exchange-CrossTenant-AuthSource: OSRPR01MB11811.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 01:20:56.7918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IxHmVslen0q06rAUdTPQFEsZduySsC9Vtp0kPNpEWxwAk85IWlWPs+mv+QgwsmRoYov+ImEFJJjsZ+HxUm/Otq8OyaH12fL3TWvrcoK8CbelhiB7Zm4uMaB1J7dN3ZVl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14981


Hi

Current component has component->name, to setup it, user need to use
snd_soc_component_initialize() / snd_soc_add_component() directly
instead of using snd_soc_register_component().

Conversely, there is no reason to use them for anything other than that
purpose. Current code style interferes with Componet capsuling.

Originally, this patch-set was posted as "ASoC: intel: use component_name
for Component name". But during discussion, I changed mind to use other way.

Therefore, I merged the patch-set and patches which I have planed to submit
later. So, I didn't add "v2" on Subject.

The header has become a bit more complex, but there is no functional change.

Link: https://lore.kernel.org/r/87fr29esth.wl-kuninori.morimoto.gx@renesas.com

Kuninori Morimoto (8):
  ASoC: soc-component: add [devm_]snd_soc_register_component_with_name()
  ASoC: soc-component: add .priv
  ASoC: intel: avs: use snd_soc_component_register_with_name()
  ASoC: intel: avs: probes: use snd_soc_component_register_with_name()
  ASoC: intel: catpt: pcm: use snd_soc_component_register_with_name()
  ASoC: soc-generic-dmaengine-pcm: use use snd_soc_component_register_with_name()
  ASoC: soc-topology-test: use snd_soc_component_register()
  ASoC: soc-core: makes snd_soc_component_initialize() / snd_soc_add_component() local

 include/sound/dmaengine_pcm.h         |  6 ---
 include/sound/soc-component.h         |  5 ++
 include/sound/soc.h                   | 71 +++++++++++++++++++++++----
 sound/soc/fsl/fsl_asrc_dma.c          |  4 +-
 sound/soc/intel/avs/avs.h             |  5 +-
 sound/soc/intel/avs/ipc.c             |  2 +-
 sound/soc/intel/avs/pcm.c             | 16 ++++--
 sound/soc/intel/avs/probes.c          | 19 +++----
 sound/soc/intel/catpt/pcm.c           | 19 ++-----
 sound/soc/soc-component.c             |  6 +++
 sound/soc/soc-core.c                  | 28 ++++++-----
 sound/soc/soc-devres.c                | 12 +++--
 sound/soc/soc-generic-dmaengine-pcm.c | 25 +++++-----
 sound/soc/soc-topology-test.c         | 67 ++++++-------------------
 14 files changed, 147 insertions(+), 138 deletions(-)

-- 
2.53.0

