Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011060.outbound.protection.outlook.com [52.101.125.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD7610957
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820230; cv=fail; b=Vsi9BN+L9h0FQJwkZcJyLRTp1Efan1qZ72RD0B95G83hn9sgptozGmw78yTIpNlrxgnBxRraG2xWnEHMO5Jd8dxwZGff27zbTypeMR9CSK3930fGZN7bN4nglFpQ6gCbLmx7HE5XNdfAdDQCSmPesH0ZwEFAJ5JQ8+UTD02fM58=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820230; c=relaxed/simple;
	bh=1iGcKoV8P/KsYs4r9FcWshGBiKGm8us3D95rS1h56Wk=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=FTA5NaYqq4V7ZtyXkk2ZLebdvVCWXFhS25glHV9SsDPlQY1kOXwBrt7wYooqM1hME+SafLrPkjse08V7USEneLNS/BvZDmrXgmAj7e8VWDL5NrGXgAF2W5muvSBN/XfIk7ZcvydXD8eOXz0BQBc6O3DO9ZlOBdmYubg6DvbT04M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=FGs88LYB; arc=fail smtp.client-ip=52.101.125.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="FGs88LYB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z6OdXrB3Ck5NgDguc4H73QKILLlqDYxCahyJbxkjUzosSARiLTpRtyI/MYSc9gGEDpfYxNtekZFUv3asaxiQ8qPgWVKwUDfgNpl4yQeBt+eU1ZqkNuD156dJmMbNHU7XkgkXkOPq/F/9pXU4NQYaf/aNZB8aFCo3REUI5OaMSJmIGXJcENs0udhww0eOZEykopy6+hUcWshu4MW+Vg3Un8/NEM2CU9VPbmJrmUiNtsr/TLL7i1peQFECSUC9OQsKO+7eidHmkgk7ivjM0Qacc4RozOgRgKVms3upkAsL0yX7CDT9ZTZLWlqZdiUwEKnRBN1KV9gDm8bYrVoyU7z7pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iraVV8jrYAzHNDxbg9JY/8gnHEcfo73C3nww6Pu4Wn8=;
 b=XEeOHOlrJ8zi0HEeuHijf4oQcUEXmxYzhh1N/9JjUNqh8wMSmE0zpzR3We20mBfk3WTbTI+Ybi96ntrb9Hwa851uF6G/aS1rlWU+7Om6YlM/xb4tl8o8N3WQ0MI5AZ6h7klcPfNwqjcOR0elfGART8bBzl3xKYDDxVEAvU9v+3wxQqQX5pImtMUhJYX4Lnh+R5Co7AC6mT88QmEQj3U87eMm6OHF7kw1/GlRJTlLsddw0B5tiPbyCIBbt14qzWa4JzJic02jljSNmEk72mb50WXIa0YfDYDJIiJ09nH1/Xqpk+9F58FFVmJG1Omlrur/0kSANgi3lFUenDXy91pl6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iraVV8jrYAzHNDxbg9JY/8gnHEcfo73C3nww6Pu4Wn8=;
 b=FGs88LYB7lfURTHWvZJIyRnQrO9aIYamqoSl71jP8HDJUuOPbme1AOTAYeMZICs6Fhkr3Avd9IWCXzLkhg6XVYoyKya8LT08XTB3NGfad9ktTG4TiO8KckW4mf8pmY1jVi15iKOVG6jgz06NTnOUhBUtDEWRuks1KQZa/2bn4Dw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB7893.jpnprd01.prod.outlook.com
 (2603:1096:400:182::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:17:02 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:17:02 +0000
Message-ID: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 000/292] ASoC: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:17:02 +0000
X-ClientProxiedBy: TYCP286CA0321.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB7893:EE_
X-MS-Office365-Filtering-Correlation-Id: 364f244e-eb9c-4097-9384-08de20b7a344
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?d2WPgYaoelKAevNsJh85K/rT1EZhu9/ATp4d50gxfKHqPT3Vwy2b9YfLONIR?=
 =?us-ascii?Q?DX9/Lt9quSvP0gZ11kic/fXaVuLZkSCkBaPzGEFAJQpeKJj/Uuqzu8ylyRJ5?=
 =?us-ascii?Q?xeRfc4/+fG+13KzJ6SMgn/ypPaQ3tzFrnaIZHXHlLAi83FuCAcsuNgjAkCVr?=
 =?us-ascii?Q?NWLnb76YBHzbybWySHvcly4bMgBZuZK+d45ZW/mgj6BeGWW3j7nxEaxJHE8c?=
 =?us-ascii?Q?l22Nb2LLJ4xy2s4eqOCzxBRlMSK8MMpov9Lwkd/K830j6xu3naei4XDRAmqV?=
 =?us-ascii?Q?eEpNr82M4E9tan+tEy4Lhd/gmYSTvyjyQi4PvmDdFQ0nsAcwXbMMYDV+kieO?=
 =?us-ascii?Q?J2rBjSudDeAGVIBypk+HripOsaB/dDF4EVjcXvhTQrB09G3u9BihdW0q9dMA?=
 =?us-ascii?Q?wegbU6v6EYvSaEtzt6834wbPwvX3n54ZOhLC/v+7kYhN5bsJp/XhsPwy7tSE?=
 =?us-ascii?Q?ecHgeitVBpSZ/hTob1qHBNvoqQWDdABUNXeF/GdSOKBkXpWXc6/UXTQbyJQ+?=
 =?us-ascii?Q?nu+c2S2juXpKgWfv1IyUQMeJ0wvx2UAcf4YgEE6qtzzdrmRNyyzJztAtTPW2?=
 =?us-ascii?Q?X6L7V1maW7nadoRIrIsiORx2ZTIC2j0Dy69txT9y279S2dhVDnWnTNHUbKPM?=
 =?us-ascii?Q?uw11MEsgR8CRujduEsEd0F3uVSmNduUsXBDPtB4V99YV62WCVko7FdaQCVtk?=
 =?us-ascii?Q?qUcFurS9UOLk5CttnPG2CFiNexn0/m1pHin+hGgzP8oESZh+BbdVzkM4xMVA?=
 =?us-ascii?Q?xlvo64haTzZbzFQrmRnCLJY6IRgjjPxji2qz0PQ6eMtQyeZJqUMUHuyjaOFJ?=
 =?us-ascii?Q?Jkk2iHGuHMI0O7NLh5Gpo8+T3THAFEELc8d5v24MhzbSLM2/nwNc+zxmV4a3?=
 =?us-ascii?Q?PtwMw+iVmTmnZADkybD4x45zm/9iVHvJC6ZbRVF919nOtUdGuxsZCJlTZZ8k?=
 =?us-ascii?Q?eeZUZy1rafIJHkia4dfm9uMXKzuqOL9mbk9gyJ848cUTKAAOukp9S00zbomv?=
 =?us-ascii?Q?s/Ri2K58+WdQHem7Zbav9x89p/gsWxBRkZHMYG7se9Ev6vA2iDAEUBmzouQT?=
 =?us-ascii?Q?COL3lLyM6ao4f+SGDsTw+Ov3JEbifHi13v8U5ui8MKRZB9LmPLEpwM1YLQVw?=
 =?us-ascii?Q?fOXswu91xqN8BEWc8yLe60r/bu48GVzVZ29XiBJ+s9UAhko/owv33tuTE3sn?=
 =?us-ascii?Q?8ToruLEJ4ShBtH3MLpGjlW1JUUC8/jTYH52EgaGj15xkdvYWSNIefGW9QzLR?=
 =?us-ascii?Q?rMxtK7cQRFxB9JeV/oUAfizUXjNwXcKWsZiJbX6ZVNlAbwKwv2DkRQHc7Ist?=
 =?us-ascii?Q?M1233Jg8rt2/YMS0PBTkCt6eqxo+twz9RA7paT6QdOqCOZbHtVcZGOH7a9i8?=
 =?us-ascii?Q?RUq69FUrodXXrcolB75KPsmeQWl+O7XWlLbCYYyy487RgSxJuVBnt8i4du3O?=
 =?us-ascii?Q?v/VcEBMUT44qBuoBxlL/ETWkzNzzj22lnVneOFLoE7idzOnLAx1CIQIVeuQs?=
 =?us-ascii?Q?w6HYzS5dZhGvD+JCpmwmV06yw0s8b/Hu4lES?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8RW4t1Ynsv2UachsZ1RYU5WJMkdY+ONOr/FVEzbSafJYUZd7OcmyiJeIRpE3?=
 =?us-ascii?Q?aZV6KQP3lsC0zL/SIdmGKnhtaYope/gfVWc4k8FbAFghIlonCtqcJgyCQu2X?=
 =?us-ascii?Q?Sn0JJfEpOWSA5FUz+vN8GoK9EHWBJiHdPA83I+s0HDe3AS+9EQkKtOXtarob?=
 =?us-ascii?Q?t5f3naoldy4v98Za27cauNsOunUZsh4sbGqJy29IPBZAwU80miV+ANCVJ/4O?=
 =?us-ascii?Q?nswzGNf5XzavidRDJQx1hFWiQHhkDZnRv6DUpz0LSu4CMDI11L02BG4A9Y/R?=
 =?us-ascii?Q?z1tGAQLT8ZJdCgiTBEX6vIki2vAcWEmlBKpSc3gEQaWBsyak1suD2xwFQwSh?=
 =?us-ascii?Q?IuVhPFbRDikjuJlCZHc/cVnAb8YiKf+UoqfdK3VbDKFwjsE1droYY9uw+Jnq?=
 =?us-ascii?Q?xAeg2uh89SSJAgEkUQv59MtEewVjp8v7TT/rISyXgQGU0XO7PHrqFkBVS7zA?=
 =?us-ascii?Q?KKOaPZfpw8CapPSy+kWRXpF8quUzQI4LQOf5fUGS+Ku7w1+1qqjG/+BKXMSN?=
 =?us-ascii?Q?2nG/LOVSiENUIfyJbipzHIvt4qHY7flPp0f3esz5Yl11Yq4yCvy5sVfGDEVT?=
 =?us-ascii?Q?k54Dd7CMofZDXhjHpzPpG9en6FKh5Nwd7tXzAAv7IdMiRWidVgAdGalc8Xkf?=
 =?us-ascii?Q?dQMLn1zClZd+JcD4oFETqY9wcJg/2UH3zr26Nwmi+wjGO3CXd/4aJYqoEEvd?=
 =?us-ascii?Q?1mBZxCWOFEiekGzCp6Xg6oomL13x1xqwOzfyTUHiXZApPZcnOjfM75f6c4FI?=
 =?us-ascii?Q?06cViwLt8/V6Nqu3hzGlY58VlCfTOc/I1qTFPbhQqdgI2+sUoq+2674QvZxE?=
 =?us-ascii?Q?hGVuf2yXcnp/5ewpTVMMhDxRd/2xifpT17Q69xPx7riN+QpI1PwjdDmZHWW8?=
 =?us-ascii?Q?CNdAc/7DpXQZ3An58eZoj0kvbpLT8IsisLTHg/2sjBnj0YgAa0RteJ0G4NFC?=
 =?us-ascii?Q?lnJQ5tvq7NhWe5GSUQJfWluYaNuGd3IL8NOU6o/dyeGMOprO1hEirjeODOAO?=
 =?us-ascii?Q?eOjt5hLpOP1gvsAlYKBIrsnyEW+9il9bCfU8r45lmlmKpFSk58IOe6BzvNK4?=
 =?us-ascii?Q?4GXFb836j6qGJhYh0nL3rUmfc1p3VOKgkW3TIyqHSPlvgCjZGLWOXlvoKvsP?=
 =?us-ascii?Q?XuWzYAZT+f8wXjNHLvIh/dcLpMGa2eawWHTTtesgNH+xoz4VbroRAeF5l8h5?=
 =?us-ascii?Q?Ze2hkeKO7IYfmT6246id6R0bN+6CD5BXf+jJ6WOCKyHde+RdENp3QyvJ+/XR?=
 =?us-ascii?Q?AUpJCW0jtrnQjrSuwXGtqAS8Z2MkpA0i6dkJhPo3xfBodvvUkJdOI+5GcQHG?=
 =?us-ascii?Q?9eYDIJhV4RJCxcnLySjaKl3+W5w/0RJmw3E6xDAg3FxdhsQWReSl0H3SvvAB?=
 =?us-ascii?Q?MYo2OjODFC6BsPSB+0fkcWes7G8c71dMcV4Cb2Fmf0nbD0u3fDdhTzgfyqCb?=
 =?us-ascii?Q?nbq10SzK8p/qvjru+s3OV6HJ52FujaXdGzuldXeWCCGtBUIKStUFPr8c/fVU?=
 =?us-ascii?Q?D33zAUW1NpptBFoUlzGQoonft94CInk5gIvc4Z3rQd+0k+zFaMxRcdiI6CQk?=
 =?us-ascii?Q?QI3Z0faSmaYhe4lRhtBIMOu86b8YaZFPj2B4VAmM62+VoO2xvfOfKK82oJUj?=
 =?us-ascii?Q?/vthuqzRh6j53qevUHt3wAA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 364f244e-eb9c-4097-9384-08de20b7a344
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:17:02.5284
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bATEsWO/4ihSfiErnODVGwzQ75qICXNl+R+MHctlHm8DpQPVx2Lz+0Y+qJCUnYRISfJdkU6/Y8aoIRKxcYxzR+plmY5Bw1KXgWlwdFlMC93j/ROytkRm0v4zHKLvjCVF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7893


Hi Mark

This patch-set convert many functions to snd_soc_dapm_xxx().
This is preparation to move struct snd_soc_dapm_context into soc-dapm.c.

For backport easy, this patch-set is added for each drivers.

Kuninori Morimoto (292):
  ASoC: arizona-haptics: convert to snd_soc_dapm_xxx()
  ASoC: arizona-micsupp: convert to snd_soc_dapm_xxx()
  ASoC: audio_codec: convert to snd_soc_dapm_xxx()
  ASoC: audio_helper: convert to snd_soc_dapm_xxx()
  ASoC: audio_topology: convert to snd_soc_dapm_xxx()
  ASoC: soc.h: convert to snd_soc_dapm_xxx()
  ASoC: asoc.h: convert to snd_soc_dapm_xxx()
  ASoC: amd: acp-mach-common: convert to snd_soc_dapm_xxx()
  ASoC: amd: acp3x-es83xx: convert to snd_soc_dapm_xxx()
  ASoC: amd: acp5x-mach: convert to snd_soc_dapm_xxx()
  ASoC: atmel: sam9g20_wm8731: convert to snd_soc_dapm_xxx()
  ASoC: atmel: tse850-pcm5142: convert to snd_soc_dapm_xxx()
  ASoC: codecs: ab8500: convert to snd_soc_dapm_xxx()
  ASoC: codecs: 88pm860x: convert to snd_soc_dapm_xxx()
  ASoC: codecs: ad1836: convert to snd_soc_dapm_xxx()
  ASoC: codecs: ad193x: convert to snd_soc_dapm_xxx()
  ASoC: codecs: adau1761: convert to snd_soc_dapm_xxx()
  ASoC: codecs: adau1781: convert to snd_soc_dapm_xxx()
  ASoC: codecs: adau17x1: convert to snd_soc_dapm_xxx()
  ASoC: codecs: adau1977: convert to snd_soc_dapm_xxx()
  ASoC: codecs: adau7118: convert to snd_soc_dapm_xxx()
  ASoC: codecs: adav80x: convert to snd_soc_dapm_xxx()
  ASoC: codecs: ak4641: convert to snd_soc_dapm_xxx()
  ASoC: codecs: alc5623: convert to snd_soc_dapm_xxx()
  ASoC: codecs: arizona-jack: convert to snd_soc_dapm_xxx()
  ASoC: codecs: arizona: convert to snd_soc_dapm_xxx()
  ASoC: codecs: audio-iio-aux: convert to snd_soc_dapm_xxx()
  ASoC: codecs: aw88261: convert to snd_soc_dapm_xxx()
  ASoC: codecs: aw88395: convert to snd_soc_dapm_xxx()
  ASoC: codecs: cpcap: convert to snd_soc_dapm_xxx()
  ASoC: codecs: cs35l33: convert to snd_soc_dapm_xxx()
  ASoC: codecs: cs35l41: convert to snd_soc_dapm_xxx()
  ASoC: codecs: cs35l45: convert to snd_soc_dapm_xxx()
  ASoC: codecs: cs35l56: convert to snd_soc_dapm_xxx()
  ASoC: codecs: cs4234: convert to snd_soc_dapm_xxx()
  ASoC: codecs: cs42l43-jack: convert to snd_soc_dapm_xxx()
  ASoC: codecs: cs42l43: convert to snd_soc_dapm_xxx()
  ASoC: codecs: cs42l51: convert to snd_soc_dapm_xxx()
  ASoC: codecs: cs42l52: convert to snd_soc_dapm_xxx()
  ASoC: codecs: cs42l56: convert to snd_soc_dapm_xxx()
  ASoC: codecs: cs42l73: convert to snd_soc_dapm_xxx()
  ASoC: codecs: cs42xx8: convert to snd_soc_dapm_xxx()
  ASoC: codecs: cs47l15: convert to snd_soc_dapm_xxx()
  ASoC: codecs: cs47l24: convert to snd_soc_dapm_xxx()
  ASoC: codecs: cs47l35: convert to snd_soc_dapm_xxx()
  ASoC: codecs: cs47l85: convert to snd_soc_dapm_xxx()
  ASoC: codecs: cs47l90: convert to snd_soc_dapm_xxx()
  ASoC: codecs: cs47l92: convert to snd_soc_dapm_xxx()
  ASoC: codecs: cs48l32: convert to snd_soc_dapm_xxx()
  ASoC: codecs: cs530x: convert to snd_soc_dapm_xxx()
  ASoC: codecs: cs53l30: convert to snd_soc_dapm_xxx()
  ASoC: codecs: cx20442: convert to snd_soc_dapm_xxx()
  ASoC: codecs: cs2072x: convert to snd_soc_dapm_xxx()
  ASoC: codecs: da7213: convert to snd_soc_dapm_xxx()
  ASoC: codecs: da7218: convert to snd_soc_dapm_xxx()
  ASoC: codecs: da7219-aad: convert to snd_soc_dapm_xxx()
  ASoC: codecs: da7219: convert to snd_soc_dapm_xxx()
  ASoC: codecs: da732x: convert to snd_soc_dapm_xxx()
  ASoC: codecs: da9055: convert to snd_soc_dapm_xxx()
  ASoC: codecs: es7134: convert to snd_soc_dapm_xxx()
  ASoC: codecs: es8311: convert to snd_soc_dapm_xxx()
  ASoC: codecs: es8316: convert to snd_soc_dapm_xxx()
  ASoC: codecs: es8326: convert to snd_soc_dapm_xxx()
  ASoC: codecs: es8328: convert to snd_soc_dapm_xxx()
  ASoC: codecs: es8389: convert to snd_soc_dapm_xxx()
  ASoC: codecs: hda: convert to snd_soc_dapm_xxx()
  ASoC: codecs: hdac_hda: convert to snd_soc_dapm_xxx()
  ASoC: codecs: hdac_hdmi: convert to snd_soc_dapm_xxx()
  ASoC: codecs: hdmi-codec: convert to snd_soc_dapm_xxx()
  ASoC: codecs: jz4740: convert to snd_soc_dapm_xxx()
  ASoC: codecs: jz4760: convert to snd_soc_dapm_xxx()
  ASoC: codecs: jz4770: convert to snd_soc_dapm_xxx()
  ASoC: codecs: lm49453: convert to snd_soc_dapm_xxx()
  ASoC: codecs: lpass-rx-macro: convert to snd_soc_dapm_xxx()
  ASoC: codecs: lpass-tx-macro: convert to snd_soc_dapm_xxx()
  ASoC: codecs: lpass-va-macro: convert to snd_soc_dapm_xxx()
  ASoC: codecs: lpass-wsa-macro: convert to snd_soc_dapm_xxx()
  ASoC: codecs: madera: convert to snd_soc_dapm_xxx()
  ASoC: codecs: max98088: convert to snd_soc_dapm_xxx()
  ASoC: codecs: max98090: convert to snd_soc_dapm_xxx()
  ASoC: codecs: max98095: convert to snd_soc_dapm_xxx()
  ASoC: codecs: max98373: convert to snd_soc_dapm_xxx()
  ASoC: codecs: max98390: convert to snd_soc_dapm_xxx()
  ASoC: codecs: max98396: convert to snd_soc_dapm_xxx()
  ASoC: codecs: max9850: convert to snd_soc_dapm_xxx()
  ASoC: codecs: max9867: convert to snd_soc_dapm_xxx()
  ASoC: codecs: ml26124: convert to snd_soc_dapm_xxx()
  ASoC: codecs: mt6357: convert to snd_soc_dapm_xxx()
  ASoC: codecs: mt6358: convert to snd_soc_dapm_xxx()
  ASoC: codecs: mt6359: convert to snd_soc_dapm_xxx()
  ASoC: codecs: nau8810: convert to snd_soc_dapm_xxx()
  ASoC: codecs: nau8821: convert to snd_soc_dapm_xxx()
  ASoC: codecs: nau8822: convert to snd_soc_dapm_xxx()
  ASoC: codecs: nau8824: convert to snd_soc_dapm_xxx()
  ASoC: codecs: nau8825: convert to snd_soc_dapm_xxx()
  ASoC: codecs: pcm186x: convert to snd_soc_dapm_xxx()
  ASoC: codecs: pcm512x: convert to snd_soc_dapm_xxx()
  ASoC: codecs: rk3308: convert to snd_soc_dapm_xxx()
  ASoC: codecs: rt1011: convert to snd_soc_dapm_xxx()
  ASoC: codecs: rt1015: convert to snd_soc_dapm_xxx()
  ASoC: codecs: rt274: convert to snd_soc_dapm_xxx()
  ASoC: codecs: rt286: convert to snd_soc_dapm_xxx()
  ASoC: codecs: rt298: convert to snd_soc_dapm_xxx()
  ASoC: codecs: rt5514: convert to snd_soc_dapm_xxx()
  ASoC: codecs: rt5516: convert to snd_soc_dapm_xxx()
  ASoC: codecs: rt5631: convert to snd_soc_dapm_xxx()
  ASoC: codecs: rt5640: convert to snd_soc_dapm_xxx()
  ASoC: codecs: rt5645: convert to snd_soc_dapm_xxx()
  ASoC: codecs: rt5651: convert to snd_soc_dapm_xxx()
  ASoC: codecs: rt5659: convert to snd_soc_dapm_xxx()
  ASoC: codecs: rt5660: convert to snd_soc_dapm_xxx()
  ASoC: codecs: rt5663: convert to snd_soc_dapm_xxx()
  ASoC: codecs: rt5665: convert to snd_soc_dapm_xxx()
  ASoC: codecs: rt5668: convert to snd_soc_dapm_xxx()
  ASoC: codecs: rt5670: convert to snd_soc_dapm_xxx()
  ASoC: codecs: rt5677: convert to snd_soc_dapm_xxx()
  ASoC: codecs: rt5682: convert to snd_soc_dapm_xxx()
  ASoC: codecs: rt5682s: convert to snd_soc_dapm_xxx()
  ASoC: codecs: rt700: convert to snd_soc_dapm_xxx()
  ASoC: codecs: rt711-sdca: convert to snd_soc_dapm_xxx()
  ASoC: codecs: rt711: convert to snd_soc_dapm_xxx()
  ASoC: codecs: rt712-sdca-dmic: convert to snd_soc_dapm_xxx()
  ASoC: codecs: rt712-sdca: convert to snd_soc_dapm_xxx()
  ASoC: codecs: rt715-sdca: convert to snd_soc_dapm_xxx()
  ASoC: codecs: rt715: convert to snd_soc_dapm_xxx()
  ASoC: codecs: rt721-sdca: convert to snd_soc_dapm_xxx()
  ASoC: codecs: simple-mux: convert to snd_soc_dapm_xxx()
  ASoC: codecs: sma1303: convert to snd_soc_dapm_xxx()
  ASoC: codecs: sma1307: convert to snd_soc_dapm_xxx()
  ASoC: codecs: ssm2518: convert to snd_soc_dapm_xxx()
  ASoC: codecs: ssm2602: convert to snd_soc_dapm_xxx()
  ASoC: codecs: ssm4567: convert to snd_soc_dapm_xxx()
  ASoC: codecs: sta32x: convert to snd_soc_dapm_xxx()
  ASoC: codecs: sta350: convert to snd_soc_dapm_xxx()
  ASoC: codecs: sta529: convert to snd_soc_dapm_xxx()
  ASoC: codecs: tas571x: convert to snd_soc_dapm_xxx()
  ASoC: codecs: tas6424: convert to snd_soc_dapm_xxx()
  ASoC: codecs: tlv320adc3xxx: convert to snd_soc_dapm_xxx()
  ASoC: codecs: tlv320aic31xx: convert to snd_soc_dapm_xxx()
  ASoC: codecs: tlv320aic32x4: convert to snd_soc_dapm_xxx()
  ASoC: codecs: tlv320aic3x: convert to snd_soc_dapm_xxx()
  ASoC: codecs: tlv320dac33: convert to snd_soc_dapm_xxx()
  ASoC: codecs: twl4030: convert to snd_soc_dapm_xxx()
  ASoC: codecs: twl6040: convert to snd_soc_dapm_xxx()
  ASoC: codecs: uda1380: convert to snd_soc_dapm_xxx()
  ASoC: codecs: wcd9335: convert to snd_soc_dapm_xxx()
  ASoC: codecs: wcd934x: convert to snd_soc_dapm_xxx()
  ASoC: codecs: wcd937x: convert to snd_soc_dapm_xxx()
  ASoC: codecs: wm0010: convert to snd_soc_dapm_xxx()
  ASoC: codecs: wm5100: convert to snd_soc_dapm_xxx()
  ASoC: codecs: wm5102: convert to snd_soc_dapm_xxx()
  ASoC: codecs: wm5110: convert to snd_soc_dapm_xxx()
  ASoC: codecs: wm8350: convert to snd_soc_dapm_xxx()
  ASoC: codecs: wm8400: convert to snd_soc_dapm_xxx()
  ASoC: codecs: wm8510: convert to snd_soc_dapm_xxx()
  ASoC: codecs: wm8523: convert to snd_soc_dapm_xxx()
  ASoC: codecs: wm8580: convert to snd_soc_dapm_xxx()
  ASoC: codecs: wm8711: convert to snd_soc_dapm_xxx()
  ASoC: codecs: wm8728: convert to snd_soc_dapm_xxx()
  ASoC: codecs: wm8731: convert to snd_soc_dapm_xxx()
  ASoC: codecs: wm8737: convert to snd_soc_dapm_xxx()
  ASoC: codecs: wm8750: convert to snd_soc_dapm_xxx()
  ASoC: codecs: wm8753: convert to snd_soc_dapm_xxx()
  ASoC: codecs: wm8770: convert to snd_soc_dapm_xxx()
  ASoC: codecs: wm8776: convert to snd_soc_dapm_xxx()
  ASoC: codecs: wm8804: convert to snd_soc_dapm_xxx()
  ASoC: codecs: wm8900: convert to snd_soc_dapm_xxx()
  ASoC: codecs: wm8903: convert to snd_soc_dapm_xxx()
  ASoC: codecs: wm8904: convert to snd_soc_dapm_xxx()
  ASoC: codecs: wm8940: convert to snd_soc_dapm_xxx()
  ASoC: codecs: wm8955: convert to snd_soc_dapm_xxx()
  ASoC: codecs: wm8960: convert to snd_soc_dapm_xxx()
  ASoC: codecs: wm8961: convert to snd_soc_dapm_xxx()
  ASoC: codecs: wm8962: convert to snd_soc_dapm_xxx()
  ASoC: codecs: wm8971: convert to snd_soc_dapm_xxx()
  ASoC: codecs: wm8974: convert to snd_soc_dapm_xxx()
  ASoC: codecs: wm8978: convert to snd_soc_dapm_xxx()
  ASoC: codecs: wm8983: convert to snd_soc_dapm_xxx()
  ASoC: codecs: wm8985: convert to snd_soc_dapm_xxx()
  ASoC: codecs: wm8988: convert to snd_soc_dapm_xxx()
  ASoC: codecs: wm8990: convert to snd_soc_dapm_xxx()
  ASoC: codecs: wm8991: convert to snd_soc_dapm_xxx()
  ASoC: codecs: wm8993: convert to snd_soc_dapm_xxx()
  ASoC: codecs: wm8994: convert to snd_soc_dapm_xxx()
  ASoC: codecs: wm8995: convert to snd_soc_dapm_xxx()
  ASoC: codecs: wm8996: convert to snd_soc_dapm_xxx()
  ASoC: codecs: wm8997: convert to snd_soc_dapm_xxx()
  ASoC: codecs: wm8998: convert to snd_soc_dapm_xxx()
  ASoC: codecs: wm9081: convert to snd_soc_dapm_xxx()
  ASoC: codecs: wm9090: convert to snd_soc_dapm_xxx()
  ASoC: codecs: wm9712: convert to snd_soc_dapm_xxx()
  ASoC: codecs: wm9713: convert to snd_soc_dapm_xxx()
  ASoC: codecs: wm_adsp: convert to snd_soc_dapm_xxx()
  ASoC: codecs: wm_hubs: convert to snd_soc_dapm_xxx()
  ASoC: fsl: fsl-asoc-card: convert to snd_soc_dapm_xxx()
  ASoC: fsl: imx-rpmsg: convert to snd_soc_dapm_xxx()
  ASoC: generic: audio-graph-card: convert to snd_soc_dapm_xxx()
  ASoC: intel: atom: sst-atom-controls: convert to snd_soc_dapm_xxx()
  ASoC: intel: avs: da7219: convert to snd_soc_dapm_xxx()
  ASoC: intel: avs: es8336: convert to snd_soc_dapm_xxx()
  ASoC: intel: avs: nau8825: convert to snd_soc_dapm_xxx()
  ASoC: intel: avs: rt274: convert to snd_soc_dapm_xxx()
  ASoC: intel: avs: rt5514: convert to snd_soc_dapm_xxx()
  ASoC: intel: avs: rt5640: convert to snd_soc_dapm_xxx()
  ASoC: intel: avs: control: convert to snd_soc_dapm_xxx()
  ASoC: intel: avs: pcm: convert to snd_soc_dapm_xxx()
  ASoC: intel: boards: bdw-rt5677: convert to snd_soc_dapm_xxx()
  ASoC: intel: boards: bytcht_cx2072x: convert to snd_soc_dapm_xxx()
  ASoC: intel: boards: bytcht_es8316: convert to snd_soc_dapm_xxx()
  ASoC: intel: boards: bytcr_rt5640: convert to snd_soc_dapm_xxx()
  ASoC: intel: boards: bytcr_rt5651: convert to snd_soc_dapm_xxx()
  ASoC: intel: boards: bytcr_wm5102: convert to snd_soc_dapm_xxx()
  ASoC: intel: boards: cht_bsw_max98090_ti: convert to
    snd_soc_dapm_xxx()
  ASoC: intel: boards: cht_bsw_rt5645: convert to snd_soc_dapm_xxx()
  ASoC: intel: boards: cht_bsw_rt5672: convert to snd_soc_dapm_xxx()
  ASoC: intel: boards: sof_board_helpers: convert to snd_soc_dapm_xxx()
  ASoC: intel: boards: sof_cirrus_common: convert to snd_soc_dapm_xxx()
  ASoC: intel: boards: sof_da7219: convert to snd_soc_dapm_xxx()
  ASoC: intel: boards: sof_es8336: convert to snd_soc_dapm_xxx()
  ASoC: intel: boards: sof_maxim_common: convert to snd_soc_dapm_xxx()
  ASoC: intel: boards: sof_nau8825: convert to snd_soc_dapm_xxx()
  ASoC: intel: boards: sof_nuvoton_common: convert to snd_soc_dapm_xxx()
  ASoC: intel: boards: sof_pcm512x: convert to snd_soc_dapm_xxx()
  ASoC: intel: boards: sof_realtek_common: convert to snd_soc_dapm_xxx()
  ASoC: intel: boards: sof_rt5682: convert to snd_soc_dapm_xxx()
  ASoC: mediatek: mtk-afe-platform-driver: convert to snd_soc_dapm_xxx()
  ASoC: mediatek: mtk-dsp-sof-common: convert to snd_soc_dapm_xxx()
  ASoC: mediatek: mt8186-mt6366-common: convert to snd_soc_dapm_xxx()
  ASoC: mediatek: mt8186-mt6366: convert to snd_soc_dapm_xxx()
  ASoC: mediatek: mt8188-mt6359: convert to snd_soc_dapm_xxx()
  ASoC: mediatek: mt8195-mt6359: convert to snd_soc_dapm_xxx()
  ASoC: mediatek: mt8365-afe-pcm: convert to snd_soc_dapm_xxx()
  ASoC: meson: aiu-acodec-ctrl: convert to snd_soc_dapm_xxx()
  ASoC: meson: aiu-codec-ctrl: convert to snd_soc_dapm_xxx()
  ASoC: meson: axg-spdifout: convert to snd_soc_dapm_xxx()
  ASoC: meson: axg-tdm-interface: convert to snd_soc_dapm_xxx()
  ASoC: meson: g12a-toacodec: convert to snd_soc_dapm_xxx()
  ASoC: meson: g12a-tohdmitx: convert to snd_soc_dapm_xxx()
  ASoC: meson: t9015: convert to snd_soc_dapm_xxx()
  ASoC: pxa: spitz: convert to snd_soc_dapm_xxx()
  ASoC: qcom: q6routing: convert to snd_soc_dapm_xxx()
  ASoC: qcom: q6usb: convert to snd_soc_dapm_xxx()
  ASoC: qcom: topology: convert to snd_soc_dapm_xxx()
  ASoC: qcom: sc7180: convert to snd_soc_dapm_xxx()
  ASoC: rockchip: rk3288_hdmi_analog: convert to snd_soc_dapm_xxx()
  ASoC: rockchip: rockchip_max98090: convert to snd_soc_dapm_xxx()
  ASoC: samsung: aries_wm8994: convert to snd_soc_dapm_xxx()
  ASoC: samsung: bells: convert to snd_soc_dapm_xxx()
  ASoC: samsung: littlemill: convert to snd_soc_dapm_xxx()
  ASoC: samsung: lowland: convert to snd_soc_dapm_xxx()
  ASoC: samsung: midas_wm1811: convert to snd_soc_dapm_xxx()
  ASoC: samsung: smdk_wm8994: convert to snd_soc_dapm_xxx()
  ASoC: samsung: speyside: convert to snd_soc_dapm_xxx()
  ASoC: samsung: tm2_wm5110: convert to snd_soc_dapm_xxx()
  ASoC: samsung: tobermory: convert to snd_soc_dapm_xxx()
  ASoC: sdca: sdca_asoc: convert to snd_soc_dapm_xxx()
  ASoC: sdw_utils: soc_sdw_bridge_cs35l56: convert to snd_soc_dapm_xxx()
  ASoC: sdw_utils: soc_sdw_cs42l42: convert to snd_soc_dapm_xxx()
  ASoC: sdw_utils: soc_sdw_cs42l43: convert to snd_soc_dapm_xxx()
  ASoC: sdw_utils: soc_sdw_cs_amp: convert to snd_soc_dapm_xxx()
  ASoC: sdw_utils: soc_sdw_dmic: convert to snd_soc_dapm_xxx()
  ASoC: sdw_utils: soc_sdw_maxim: convert to snd_soc_dapm_xxx()
  ASoC: sdw_utils: soc_sdw_rt5682: convert to snd_soc_dapm_xxx()
  ASoC: sdw_utils: soc_sdw_rt700: convert to snd_soc_dapm_xxx()
  ASoC: sdw_utils: soc_sdw_rt711: convert to snd_soc_dapm_xxx()
  ASoC: sdw_utils: soc_sdw_rt_amp: convert to snd_soc_dapm_xxx()
  ASoC: sdw_utils: soc_sdw_rt_mf_sdca: convert to snd_soc_dapm_xxx()
  ASoC: sdw_utils: soc_sdw_rt_sdca_jack_common: convert to
    snd_soc_dapm_xxx()
  ASoC: sdw_utils: soc_sdw_ti_amp: convert to snd_soc_dapm_xxx()
  ASoC: sdw_utils: soc_sdw_utils: convert to snd_soc_dapm_xxx()
  ASoC: soc-core: convert to snd_soc_dapm_xxx()
  ASoC: soc-dapm: convert to snd_soc_dapm_xxx()
  ASoC: soc-jack: convert to snd_soc_dapm_xxx()
  ASoC: soc-pcm: convert to snd_soc_dapm_xxx()
  ASoC: soc-topology: convert to snd_soc_dapm_xxx()
  ASoC: sof-client-probes: convert to snd_soc_dapm_xxx()
  ASoC: sunxi: sun4i-codec: convert to snd_soc_dapm_xxx()
  ASoC: sunxi: sun50i-codec-analog: convert to snd_soc_dapm_xxx()
  ASoC: sunxi: sun8i-codec-analog: convert to snd_soc_dapm_xxx()
  ASoC: sunxi: sun8i-codec: convert to snd_soc_dapm_xxx()
  ASoC: tegra: tegra210_ahub: convert to snd_soc_dapm_xxx()
  ASoC: tegra: tegra_asoc_machine: convert to snd_soc_dapm_xxx()
  ASoC: tegra: tegra_wm8903: convert to snd_soc_dapm_xxx()
  ASoC: ti: ams-delta: convert to snd_soc_dapm_xxx()
  ASoC: ti: davinci-evm: convert to snd_soc_dapm_xxx()
  ASoC: ti: j721e-evm: convert to snd_soc_dapm_xxx()
  ASoC: ti: n810: convert to snd_soc_dapm_xxx()
  ASoC: ti: omap-abe-twl6040: convert to snd_soc_dapm_xxx()
  ASoC: ti: omap-twl4030: convert to snd_soc_dapm_xxx()
  ASoC: ti: omap3pandora: convert to snd_soc_dapm_xxx()
  ASoC: ti: rx51: convert to snd_soc_dapm_xxx()
  ASoC: ux500: mop500_ab8500: convert to snd_soc_dapm_xxx()

 drivers/input/misc/arizona-haptics.c          |  14 +-
 drivers/regulator/arizona-micsupp.c           |   8 +-
 drivers/staging/greybus/audio_codec.c         |  16 +-
 drivers/staging/greybus/audio_helper.c        |   9 +-
 drivers/staging/greybus/audio_topology.c      |  14 +-
 include/sound/soc.h                           |   8 +-
 include/trace/events/asoc.h                   |   4 +-
 sound/soc/amd/acp/acp-mach-common.c           |  40 ++--
 sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c |  10 +-
 sound/soc/amd/vangogh/acp5x-mach.c            |   3 +-
 sound/soc/atmel/sam9g20_wm8731.c              |   2 +-
 sound/soc/atmel/tse850-pcm5142.c              |  32 +--
 sound/soc/codecs/88pm860x-codec.c             |   3 +-
 sound/soc/codecs/ab8500-codec.c               |   6 +-
 sound/soc/codecs/ad1836.c                     |   2 +-
 sound/soc/codecs/ad193x.c                     |   4 +-
 sound/soc/codecs/adau1761.c                   |   9 +-
 sound/soc/codecs/adau1781.c                   |   2 +-
 sound/soc/codecs/adau17x1.c                   |  14 +-
 sound/soc/codecs/adau1977.c                   |   5 +-
 sound/soc/codecs/adau7118.c                   |   7 +-
 sound/soc/codecs/adav80x.c                    |   6 +-
 sound/soc/codecs/ak4641.c                     |   3 +-
 sound/soc/codecs/alc5623.c                    |   2 +-
 sound/soc/codecs/arizona-jack.c               |   8 +-
 sound/soc/codecs/arizona.c                    |  18 +-
 sound/soc/codecs/audio-iio-aux.c              |   2 +-
 sound/soc/codecs/aw88261.c                    |   2 +-
 sound/soc/codecs/aw88395/aw88395.c            |   2 +-
 sound/soc/codecs/cpcap.c                      |  21 +-
 sound/soc/codecs/cs35l33.c                    |   4 +-
 sound/soc/codecs/cs35l41.c                    |   2 +-
 sound/soc/codecs/cs35l45.c                    |   6 +-
 sound/soc/codecs/cs35l56.c                    |  14 +-
 sound/soc/codecs/cs4234.c                     |   5 +-
 sound/soc/codecs/cs42l43-jack.c               |   8 +-
 sound/soc/codecs/cs42l43.c                    |  16 +-
 sound/soc/codecs/cs42l51.c                    |   2 +-
 sound/soc/codecs/cs42l52.c                    |   5 +-
 sound/soc/codecs/cs42l56.c                    |   5 +-
 sound/soc/codecs/cs42l73.c                    |   3 +-
 sound/soc/codecs/cs42xx8.c                    |   2 +-
 sound/soc/codecs/cs47l15.c                    |   5 +-
 sound/soc/codecs/cs47l24.c                    |   4 +-
 sound/soc/codecs/cs47l35.c                    |   5 +-
 sound/soc/codecs/cs47l85.c                    |   5 +-
 sound/soc/codecs/cs47l90.c                    |   5 +-
 sound/soc/codecs/cs47l92.c                    |  11 +-
 sound/soc/codecs/cs48l32.c                    |  18 +-
 sound/soc/codecs/cs530x.c                     |  12 +-
 sound/soc/codecs/cs53l30.c                    |   9 +-
 sound/soc/codecs/cx20442.c                    |   5 +-
 sound/soc/codecs/cx2072x.c                    |   6 +-
 sound/soc/codecs/da7213.c                     |   5 +-
 sound/soc/codecs/da7218.c                     |   5 +-
 sound/soc/codecs/da7219-aad.c                 |  10 +-
 sound/soc/codecs/da7219.c                     |  13 +-
 sound/soc/codecs/da732x.c                     |   3 +-
 sound/soc/codecs/da9055.c                     |   4 +-
 sound/soc/codecs/es7134.c                     |   2 +-
 sound/soc/codecs/es8311.c                     |   3 +-
 sound/soc/codecs/es8316.c                     |   4 +-
 sound/soc/codecs/es8326.c                     |   4 +-
 sound/soc/codecs/es8328.c                     |   4 +-
 sound/soc/codecs/es8389.c                     |   4 +-
 sound/soc/codecs/hda.c                        |   2 +-
 sound/soc/codecs/hdac_hda.c                   |   4 +-
 sound/soc/codecs/hdac_hdmi.c                  |  35 ++--
 sound/soc/codecs/hdmi-codec.c                 |   2 +-
 sound/soc/codecs/jz4740.c                     |   3 +-
 sound/soc/codecs/jz4760.c                     |   7 +-
 sound/soc/codecs/jz4770.c                     |   8 +-
 sound/soc/codecs/lm49453.c                    |   3 +-
 sound/soc/codecs/lpass-rx-macro.c             |   8 +-
 sound/soc/codecs/lpass-tx-macro.c             |   8 +-
 sound/soc/codecs/lpass-va-macro.c             |   9 +-
 sound/soc/codecs/lpass-wsa-macro.c            |  12 +-
 sound/soc/codecs/madera.c                     |  27 +--
 sound/soc/codecs/max98088.c                   |   6 +-
 sound/soc/codecs/max98090.c                   |   7 +-
 sound/soc/codecs/max98095.c                   |  11 +-
 sound/soc/codecs/max98373.c                   |   3 +-
 sound/soc/codecs/max98390.c                   |   2 +-
 sound/soc/codecs/max98396.c                   |  11 +-
 sound/soc/codecs/max9850.c                    |   3 +-
 sound/soc/codecs/max9867.c                    |  11 +-
 sound/soc/codecs/ml26124.c                    |   3 +-
 sound/soc/codecs/mt6357.c                     |   2 +-
 sound/soc/codecs/mt6358.c                     |  14 +-
 sound/soc/codecs/mt6359.c                     |  12 +-
 sound/soc/codecs/nau8810.c                    |   3 +-
 sound/soc/codecs/nau8821.c                    |  28 +--
 sound/soc/codecs/nau8822.c                    |  14 +-
 sound/soc/codecs/nau8824.c                    |  10 +-
 sound/soc/codecs/nau8825.c                    |   6 +-
 sound/soc/codecs/pcm186x.c                    |   6 +-
 sound/soc/codecs/pcm512x.c                    |   9 +-
 sound/soc/codecs/rk3308_codec.c               |   3 +-
 sound/soc/codecs/rt1011.c                     |  18 +-
 sound/soc/codecs/rt1015.c                     |   5 +-
 sound/soc/codecs/rt274.c                      |   5 +-
 sound/soc/codecs/rt286.c                      |   8 +-
 sound/soc/codecs/rt298.c                      |   9 +-
 sound/soc/codecs/rt5514.c                     |   8 +-
 sound/soc/codecs/rt5616.c                     |   5 +-
 sound/soc/codecs/rt5631.c                     |   6 +-
 sound/soc/codecs/rt5640.c                     |  19 +-
 sound/soc/codecs/rt5645.c                     |  15 +-
 sound/soc/codecs/rt5651.c                     |  13 +-
 sound/soc/codecs/rt5659.c                     |  11 +-
 sound/soc/codecs/rt5660.c                     |   5 +-
 sound/soc/codecs/rt5663.c                     |   4 +-
 sound/soc/codecs/rt5665.c                     |   2 +-
 sound/soc/codecs/rt5668.c                     |   3 +-
 sound/soc/codecs/rt5670.c                     |   9 +-
 sound/soc/codecs/rt5677.c                     |  14 +-
 sound/soc/codecs/rt5682.c                     |  10 +-
 sound/soc/codecs/rt5682s.c                    |   5 +-
 sound/soc/codecs/rt700.c                      |  28 +--
 sound/soc/codecs/rt711-sdca.c                 |   9 +-
 sound/soc/codecs/rt711.c                      |  28 +--
 sound/soc/codecs/rt712-sdca-dmic.c            |   9 +-
 sound/soc/codecs/rt712-sdca.c                 |  20 +-
 sound/soc/codecs/rt715-sdca.c                 |   9 +-
 sound/soc/codecs/rt715.c                      |  35 ++--
 sound/soc/codecs/rt721-sdca.c                 |   9 +-
 sound/soc/codecs/simple-mux.c                 |   7 +-
 sound/soc/codecs/sma1303.c                    |   7 +-
 sound/soc/codecs/sma1307.c                    |  59 +++---
 sound/soc/codecs/ssm2518.c                    |   3 +-
 sound/soc/codecs/ssm2602.c                    |   4 +-
 sound/soc/codecs/ssm4567.c                    |   3 +-
 sound/soc/codecs/sta32x.c                     |   6 +-
 sound/soc/codecs/sta350.c                     |   6 +-
 sound/soc/codecs/sta529.c                     |   3 +-
 sound/soc/codecs/tas571x.c                    |   3 +-
 sound/soc/codecs/tas6424.c                    |   4 +-
 sound/soc/codecs/tlv320adc3xxx.c              |   4 +-
 sound/soc/codecs/tlv320aic31xx.c              |  14 +-
 sound/soc/codecs/tlv320aic32x4.c              |   3 +-
 sound/soc/codecs/tlv320aic3x.c                |  11 +-
 sound/soc/codecs/tlv320dac33.c                |   5 +-
 sound/soc/codecs/twl4030.c                    |   4 +-
 sound/soc/codecs/twl6040.c                    |   7 +-
 sound/soc/codecs/uda1380.c                    |   3 +-
 sound/soc/codecs/wcd9335.c                    |  26 ++-
 sound/soc/codecs/wcd934x.c                    |  26 ++-
 sound/soc/codecs/wcd937x.c                    |   2 +-
 sound/soc/codecs/wm0010.c                     |   5 +-
 sound/soc/codecs/wm5100.c                     |   4 +-
 sound/soc/codecs/wm5102.c                     |   4 +-
 sound/soc/codecs/wm5110.c                     |  10 +-
 sound/soc/codecs/wm8350.c                     |   3 +-
 sound/soc/codecs/wm8400.c                     |   3 +-
 sound/soc/codecs/wm8510.c                     |   3 +-
 sound/soc/codecs/wm8523.c                     |   3 +-
 sound/soc/codecs/wm8580.c                     |   6 +-
 sound/soc/codecs/wm8711.c                     |   3 +-
 sound/soc/codecs/wm8728.c                     |   3 +-
 sound/soc/codecs/wm8731.c                     |   5 +-
 sound/soc/codecs/wm8737.c                     |   6 +-
 sound/soc/codecs/wm8750.c                     |   3 +-
 sound/soc/codecs/wm8753.c                     |   3 +-
 sound/soc/codecs/wm8770.c                     |   3 +-
 sound/soc/codecs/wm8776.c                     |   3 +-
 sound/soc/codecs/wm8804.c                     |   4 +-
 sound/soc/codecs/wm8900.c                     |  12 +-
 sound/soc/codecs/wm8903.c                     |   6 +-
 sound/soc/codecs/wm8904.c                     |   9 +-
 sound/soc/codecs/wm8940.c                     |   6 +-
 sound/soc/codecs/wm8955.c                     |   6 +-
 sound/soc/codecs/wm8960.c                     |  12 +-
 sound/soc/codecs/wm8961.c                     |   5 +-
 sound/soc/codecs/wm8962.c                     |  22 +-
 sound/soc/codecs/wm8971.c                     |   3 +-
 sound/soc/codecs/wm8974.c                     |   3 +-
 sound/soc/codecs/wm8978.c                     |   9 +-
 sound/soc/codecs/wm8983.c                     |   3 +-
 sound/soc/codecs/wm8985.c                     |   5 +-
 sound/soc/codecs/wm8988.c                     |   3 +-
 sound/soc/codecs/wm8990.c                     |   7 +-
 sound/soc/codecs/wm8991.c                     |   3 +-
 sound/soc/codecs/wm8993.c                     |  13 +-
 sound/soc/codecs/wm8994.c                     |  36 ++--
 sound/soc/codecs/wm8995.c                     |   7 +-
 sound/soc/codecs/wm8996.c                     |   9 +-
 sound/soc/codecs/wm8997.c                     |   4 +-
 sound/soc/codecs/wm8998.c                     |   8 +-
 sound/soc/codecs/wm9081.c                     |   3 +-
 sound/soc/codecs/wm9090.c                     |   5 +-
 sound/soc/codecs/wm9712.c                     |   7 +-
 sound/soc/codecs/wm9713.c                     |   7 +-
 sound/soc/codecs/wm_adsp.c                    |  11 +-
 sound/soc/codecs/wm_hubs.c                    |   8 +-
 sound/soc/fsl/fsl-asoc-card.c                 |   4 +-
 sound/soc/fsl/imx-rpmsg.c                     |   2 +-
 sound/soc/generic/audio-graph-card.c          |   4 +-
 sound/soc/intel/atom/sst-atom-controls.c      |   7 +-
 sound/soc/intel/avs/boards/da7219.c           |   3 +-
 sound/soc/intel/avs/boards/es8336.c           |   5 +-
 sound/soc/intel/avs/boards/nau8825.c          |   3 +-
 sound/soc/intel/avs/boards/rt274.c            |   6 +-
 sound/soc/intel/avs/boards/rt5514.c           |   3 +-
 sound/soc/intel/avs/boards/rt5640.c           |   3 +-
 sound/soc/intel/avs/control.c                 |   7 +-
 sound/soc/intel/avs/pcm.c                     |   2 +-
 sound/soc/intel/boards/bdw-rt5677.c           |   9 +-
 sound/soc/intel/boards/bytcht_cx2072x.c       |   3 +-
 sound/soc/intel/boards/bytcht_es8316.c        |   9 +-
 sound/soc/intel/boards/bytcr_rt5640.c         |  25 +--
 sound/soc/intel/boards/bytcr_rt5651.c         |  18 +-
 sound/soc/intel/boards/bytcr_wm5102.c         |  14 +-
 sound/soc/intel/boards/cht_bsw_max98090_ti.c  |   5 +-
 sound/soc/intel/boards/cht_bsw_rt5645.c       |  12 +-
 sound/soc/intel/boards/cht_bsw_rt5672.c       |   8 +-
 sound/soc/intel/boards/sof_board_helpers.c    |  10 +-
 sound/soc/intel/boards/sof_cirrus_common.c    |   5 +-
 sound/soc/intel/boards/sof_da7219.c           |   5 +-
 sound/soc/intel/boards/sof_es8336.c           |  12 +-
 sound/soc/intel/boards/sof_maxim_common.c     |  22 +-
 sound/soc/intel/boards/sof_nau8825.c          |   2 +-
 sound/soc/intel/boards/sof_nuvoton_common.c   |   5 +-
 sound/soc/intel/boards/sof_pcm512x.c          |   5 +-
 sound/soc/intel/boards/sof_realtek_common.c   |  34 +--
 sound/soc/intel/boards/sof_rt5682.c           |   7 +-
 .../mediatek/common/mtk-afe-platform-driver.c |   7 +-
 .../soc/mediatek/common/mtk-dsp-sof-common.c  |   5 +-
 .../mediatek/mt8186/mt8186-mt6366-common.c    |   2 +-
 sound/soc/mediatek/mt8186/mt8186-mt6366.c     |  19 +-
 sound/soc/mediatek/mt8188/mt8188-mt6359.c     |  17 +-
 sound/soc/mediatek/mt8195/mt8195-mt6359.c     |  21 +-
 sound/soc/mediatek/mt8365/mt8365-afe-pcm.c    |   3 +-
 sound/soc/meson/aiu-acodec-ctrl.c             |   6 +-
 sound/soc/meson/aiu-codec-ctrl.c              |   6 +-
 sound/soc/meson/axg-spdifout.c                |   4 +-
 sound/soc/meson/axg-tdm-interface.c           |   4 +-
 sound/soc/meson/g12a-toacodec.c               |   6 +-
 sound/soc/meson/g12a-tohdmitx.c               |  12 +-
 sound/soc/meson/t9015.c                       |   4 +-
 sound/soc/pxa/spitz.c                         |   9 +-
 sound/soc/qcom/qdsp6/q6routing.c              |   6 +-
 sound/soc/qcom/qdsp6/q6usb.c                  |   3 +-
 sound/soc/qcom/qdsp6/topology.c               |  12 +-
 sound/soc/qcom/sc7180.c                       |  10 +-
 sound/soc/rockchip/rk3288_hdmi_analog.c       |   3 +-
 sound/soc/rockchip/rockchip_max98090.c        |   2 +-
 sound/soc/samsung/aries_wm8994.c              |   6 +-
 sound/soc/samsung/bells.c                     |   6 +-
 sound/soc/samsung/littlemill.c                |   8 +-
 sound/soc/samsung/lowland.c                   |   3 +-
 sound/soc/samsung/midas_wm1811.c              |   8 +-
 sound/soc/samsung/smdk_wm8994.c               |  30 +--
 sound/soc/samsung/speyside.c                  |  24 ++-
 sound/soc/samsung/tm2_wm5110.c                |   7 +-
 sound/soc/samsung/tobermory.c                 |   6 +-
 sound/soc/sdca/sdca_asoc.c                    |   4 +-
 sound/soc/sdw_utils/soc_sdw_bridge_cs35l56.c  |   5 +-
 sound/soc/sdw_utils/soc_sdw_cs42l42.c         |   3 +-
 sound/soc/sdw_utils/soc_sdw_cs42l43.c         |   9 +-
 sound/soc/sdw_utils/soc_sdw_cs_amp.c          |   3 +-
 sound/soc/sdw_utils/soc_sdw_dmic.c            |   5 +-
 sound/soc/sdw_utils/soc_sdw_maxim.c           |   8 +-
 sound/soc/sdw_utils/soc_sdw_rt5682.c          |   3 +-
 sound/soc/sdw_utils/soc_sdw_rt700.c           |   3 +-
 sound/soc/sdw_utils/soc_sdw_rt711.c           |   3 +-
 sound/soc/sdw_utils/soc_sdw_rt_amp.c          |   5 +-
 sound/soc/sdw_utils/soc_sdw_rt_mf_sdca.c      |   3 +-
 .../sdw_utils/soc_sdw_rt_sdca_jack_common.c   |  11 +-
 sound/soc/sdw_utils/soc_sdw_ti_amp.c          |   3 +-
 sound/soc/sdw_utils/soc_sdw_utils.c           |   3 +-
 sound/soc/soc-core.c                          |  37 ++--
 sound/soc/soc-dapm.c                          | 196 +++++++++++-------
 sound/soc/soc-jack.c                          |   2 +-
 sound/soc/soc-pcm.c                           |   2 +-
 sound/soc/soc-topology.c                      |  10 +-
 sound/soc/sof/sof-client-probes.c             |  11 +-
 sound/soc/sunxi/sun4i-codec.c                 |   3 +-
 sound/soc/sunxi/sun50i-codec-analog.c         |   2 +-
 sound/soc/sunxi/sun8i-codec-analog.c          |  14 +-
 sound/soc/sunxi/sun8i-codec.c                 |   4 +-
 sound/soc/tegra/tegra210_ahub.c               |   6 +-
 sound/soc/tegra/tegra_asoc_machine.c          |  11 +-
 sound/soc/tegra/tegra_wm8903.c                |   3 +-
 sound/soc/ti/ams-delta.c                      |   8 +-
 sound/soc/ti/davinci-evm.c                    |  11 +-
 sound/soc/ti/j721e-evm.c                      |   2 +-
 sound/soc/ti/n810.c                           |  12 +-
 sound/soc/ti/omap-abe-twl6040.c               |   2 +-
 sound/soc/ti/omap-twl4030.c                   |   2 +-
 sound/soc/ti/omap3pandora.c                   |  36 ++--
 sound/soc/ti/rx51.c                           |  17 +-
 sound/soc/ux500/mop500_ab8500.c               |   2 +-
 292 files changed, 1391 insertions(+), 1214 deletions(-)

-- 
2.43.0

