Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010030.outbound.protection.outlook.com [52.101.229.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6194A28
	for <linux-sound@vger.kernel.org>; Thu,  9 Jan 2025 00:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736381642; cv=fail; b=VIDNy93Ho6TgR97pnpCHnCBeKjTCz6h2EXxOvpFzUhumM/K1egxoPc/OlpXsVzKQm8l6VVUb5xrlr6+VYfJ/6RkkHY+zfrDsMsWS8E77VmH/1TmKpbvWzWh2OV/cCbCka1hR1itCZ9mBuKb8WZQoH8YvKQX18m3JCnhnJt6NMtU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736381642; c=relaxed/simple;
	bh=yKlQ8U6GC+P86DyTKDZ+K8/tOzhEILjWAZlTIvna06w=;
	h=Message-ID:To:From:Subject:Content-Type:Date:MIME-Version; b=Ok83/turgTWeSorb68+97qwy0A0UjxCkKBej5H47fcOSP8L1epEeLxboRpBVMJ+RNlWrMJ3snOWlApVET2cTa8Rb2pDQFd6kv3GZsBZP/62fS/aOr16hLwuGZIdeeZsBaFYhPz2F64m5lFfPvXVY+ZloTOWOpSn3p64RfFIOvTU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=PatnqwKQ; arc=fail smtp.client-ip=52.101.229.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="PatnqwKQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AQiyqrZBSzt8yR3kg2pxGZeCP90VtwPnP8VrT3PMyQqpoP74t3IwyFUKVnmjpipgmTFpN1XO155pfu7bJMrFQ7U6Pi8CE3KereMQsZxC8KItPrVJGHi1NBFlrFajG6RRiLTEkDoWpDbBpYAObZYrUL/3fsDp/RO+BtTIK7dTKH5xZBoFjDBl5feKLzqwNoeg7qPYIOE9j0gG5/45TicAQiDKD3I+kdBMWQHUImJZlKBdPxLEP6aY3aoXZYbJ/piszh23Kl/gmOTi2zcqPy7V76Q+VzyuwBCNr9D1MpnjHEGvb8VsfRUpZn+NR0O30SNa3flI9Wu3lS7PGmx+SmQooA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NiCO3gX9Ky2Y2xo7yuteobWFzKG3zyS6z1Rt1OKjuf8=;
 b=ha+SDvqiXKI0klzXFKd6HQ7LHT6Mwvq/so44gaxESlYv6RJoGOIlumL8NJFvoqjXDt0LZzTgvaWA2dO5kD1ZaeDZynEedxUdZNhofUSDs+wnqu9js995hYF94lY+y9rZFmUqv3+2sFWrFJbvj9jUV/sOC74rl/AApBOaFl8ucGeuQA+4l7ckw0yQRQXuic+2Z1ZqpUMndktygHaZhjhWxV/Vg2QWa2PWSdrqVeX/GJ84v0dGvjukox1uVO5Ps7FwszeTslTEgJsSnMt3rJdEsRNEymApgz2tjG3vL6FnyD1uz5qA8oOqS1VAFX1bDFZfAFeFG1hOwZpZ3e2PuHw3BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NiCO3gX9Ky2Y2xo7yuteobWFzKG3zyS6z1Rt1OKjuf8=;
 b=PatnqwKQA1Xb1gGsHP8n1p2ibKjiCrZJG6PtVh3vxan1Reza25UMjpm7wxYaAYrepT2IlczB3Y3cOhkHYH+bL151jJSiXaGfF1jeUK4MANsrnrJmQOPpowcWOb/CTYTYenkh9E8umq3jwr2DO/ym05V4+SsfnhxXi+m3fMUjr9E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14) by OS3PR01MB7143.jpnprd01.prod.outlook.com
 (2603:1096:604:125::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Thu, 9 Jan
 2025 00:13:57 +0000
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8]) by TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8%5]) with mapi id 15.20.8335.011; Thu, 9 Jan 2025
 00:13:56 +0000
Message-ID: <87wmf4269n.wl-kuninori.morimoto.gx@renesas.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>, Brent Lu
 <brent.lu@intel.com>, Cezary Rojewski <cezary.rojewski@intel.com>, Jaroslav
 Kysela <perex@perex.cz>, Kai Vehmanen <kai.vehmanen@linux.intel.com>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Peter
 Ujfalusi <peter.ujfalusi@linux.intel.com>, Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/2] ASoC: remove disable_route_checks
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 9 Jan 2025 00:13:56 +0000
X-ClientProxiedBy: TY2PR0101CA0011.apcprd01.prod.exchangelabs.com
 (2603:1096:404:92::23) To TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB10906:EE_|OS3PR01MB7143:EE_
X-MS-Office365-Filtering-Correlation-Id: f3c60c6f-d069-4f52-31ba-08dd30428237
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sY3wwJ0tZEuO3rK5UVdkiWYOqiZeq3Z3hq7hvqtJkVevjnSW63gkrYz7Hpor?=
 =?us-ascii?Q?wfYtXLSomkSN3xfdntXWUFSBRGPs1IQ2hingK0ow8xEteHFJblD2os77WTHU?=
 =?us-ascii?Q?hn30vS+jzakz7qFLdrroO4TA0meEq11pHmHp+WawBMNNbFc7ZL2+7pEqKz/z?=
 =?us-ascii?Q?x2pVzba+8LQC6k4V+UvxL0Wk0YhPtIuJYt/rXQrSiadKIf0t6NEnreh5+WYZ?=
 =?us-ascii?Q?6u9uX2Q9OSdn9rnlYEGM2Uq8i5yUbHrR+zIPDzpEtACJ8uVorGkBU5c/8Pyt?=
 =?us-ascii?Q?Wf+6vwg7IQtncb3NXuFtwj1RZmhB+V6exT6n8O81yt+Oxg13OOMNl5l5eOAd?=
 =?us-ascii?Q?K+4jIl4ZGklqAhZgU9Wl1qPghRkl2Gopr/AFxvEFzN7mrmXlePcedW4SqkQ4?=
 =?us-ascii?Q?nDjFUyC9hv+J3fubWhCZOs1B37Q4Lfg7N4xeQb3IrVLjUkNKWLSRSAuIPlJw?=
 =?us-ascii?Q?2prZpi/WCZN+WRAIhMc4fyiIZIOGwtfdpQb+NzSA+5OUY95lilE9I7kNbFiH?=
 =?us-ascii?Q?P6DsXIly+NXgZ+7DUveNF1mA80eYkz4M//W5P8pIV4mydcB04pubn61hLQJJ?=
 =?us-ascii?Q?+EeVmRcqyF2f4pSLSCxcd+Tc9STo1hhFTWZQoK4cemusz3Q6yvsxAu0V5uM5?=
 =?us-ascii?Q?MZYS5k5VtIa2iZtYIWFZOOX/AtHttBcd/mq6UJHn6F9buG3VPzQ4fnNURdQ1?=
 =?us-ascii?Q?r8IFT6Uj21FKvNoMDG5y89gRlyLn/28x4vV+7LOUAbs12AhxAx/OoHW9NGf/?=
 =?us-ascii?Q?yCUFaszAFN/ceklMQ/SqeP6qqm8MCpjC8Lml7gOO5BzjLVBp86tIgbV3KitP?=
 =?us-ascii?Q?VqHvZJgwcdXKlrOPCVI05/eimSmmZrgRYDcgdBcFtCRlcQR9KbAc+/+ssuxM?=
 =?us-ascii?Q?GMwvRbNdPT5qTv475MPVE9T8Pzb8tCG5DtQfCYqzqE6TjcBJyXsyoIK2/BL2?=
 =?us-ascii?Q?O/2hvXYGOrQl6IClWA0VXw1EroK/GLGTH8J+8d6D5cfX7Xc0jSZCzSDsl/Qp?=
 =?us-ascii?Q?W5w0tXxRykUvgY4YAAtq44l2MjUBLouTmzuucae3XqAm4hZ8pCS20LD50542?=
 =?us-ascii?Q?q00NCFQGpRLcigAxGzYkmuWfTLn5+6gPcX/hJFaziGdOk5nAdOP9nVdbteHy?=
 =?us-ascii?Q?9oEJX5Dv0UdF/x9K9kM1kap8gRP+hUi9lY2Cu4OC5Fi7MwUJsbjBx95Bngem?=
 =?us-ascii?Q?AMWxqvb0wBHjlKyo7YcV4uvQhONHnxjIIAf0CEvavqsfcIMoRuzf77IQ7HyZ?=
 =?us-ascii?Q?YcIu9D0CkK/8XCOKjXsg9JE3FbkzbpsOG16SjtXenOI1qSlz+TZNBPhmqj76?=
 =?us-ascii?Q?my72pKsdjUyOTzatBp79/AQ1KpM/8lpO4R4r9R8Yw7dAuLvY4b1fKjK0U3LI?=
 =?us-ascii?Q?IrllazRoV80yeZnyrS0H9qjCDx2MaeiTpJ5d8pzrKm+SK3/P4rksfZ6LiNwY?=
 =?us-ascii?Q?D1xHy3oH+SL+cbBqnC6gXcVgsl2wUjqd?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB10906.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cOu4sgnhIIZrURPJUosqqzFpxc8Y9BD/TbOxRt4+77OBmP/zPqor8f3UEpfy?=
 =?us-ascii?Q?j4C/6mmt2BYnjtWIb+aDUha/iILBFHWxxMiCm729brbdfklapkuTHRe0wu6k?=
 =?us-ascii?Q?dKZAcBvCev6Jaa1sSDi/gfjMgdIVbKGmMfysbZYRQDO50IsLbFKLTp4O9Lni?=
 =?us-ascii?Q?x/F6WLubMX34FDM8H+IEewWvXgbCLX29NMum3t3gZWssEIy5osT2Jm0Y2sP2?=
 =?us-ascii?Q?2Mu+YQbael7UrayzpFhLBcpU4QJIVk4hpf1IXjttKkLJ+8CVW9P9DaAlF9Zl?=
 =?us-ascii?Q?7USbagUydPR/sLMe8KBO4WygNMYP1aAnKYX3WGgoIdHGBRznkoP3cXZSB8rx?=
 =?us-ascii?Q?rGKszvpfTexzKeoVbr5+TK1AfvIWr8Hc/r4OTR5Op6OS9qF6XyeheUvKxGpk?=
 =?us-ascii?Q?cZZDDhUX2ZP62EM4k+/zR1ovYh4+l1OsIPB5c92NDlRQglqtHyYckw3oyJwd?=
 =?us-ascii?Q?63eLLG9UtmXldEOo0AoIcOkNNEz52vF6GK8MuVQN1kOnJMpb+Ao3lIz6x086?=
 =?us-ascii?Q?kWvWAaeVhJvGtEwn1jpAcfYctzUk9xZ82RP4LGdTTgQdMrY+Gd4hkkvjv1Fz?=
 =?us-ascii?Q?bwgHCh/BiNDs3HzacMLgyCl2nhlxcN5KzxIB8y3K5wcf32kS4sxWgItj4r91?=
 =?us-ascii?Q?AAWIDsoq8ol0XfDi3O7UKQpr7jNHElI+frXA542KCwWcktHCzDdAN2j0iLmL?=
 =?us-ascii?Q?mglgIcqzNDrDqD6mK+YLPuHxr+qM7cvIPstEmNlM86zIQ6MSdNLDq7LzVcQ0?=
 =?us-ascii?Q?tThHyGeD9x5CIq5cRK+J0bzXsEK1vmzFsGc4aAlOYPwDxdVN/+tR0b9vt81C?=
 =?us-ascii?Q?qWsvZki4ph7eLg+GsoqcsUYy6eICE1BXB+4mwrDMG/m31agAd9aPuMg6rUaE?=
 =?us-ascii?Q?49L7JXwCxHCZnOY0gPqC+ElR+O+XtKcfSeGaiJRn4jEJ7ZJwWybH0oowf+4k?=
 =?us-ascii?Q?j+ZBqlimA5KfR63lLy5tEDUnXQmqz3m3W0ilipFRsQc0FmMCWVdkTl1VK5xV?=
 =?us-ascii?Q?W1SjkN/hJ/3Q31RP0vqkI0nbf2wmPgGXw2Ji95CAj7HK83H671MtzEIjBwnm?=
 =?us-ascii?Q?Ns0Uvqv9zOWI5V0ggCPcfFkcxz5KGMY3OJrHCkrC5jbSY1NW9lLpqHQPyoL0?=
 =?us-ascii?Q?qlyS2QJJdm6e+4y+AnQMVBSyn7g/fTJaE4XYvMnJqy0pX0AsQ9EH4Q3oh7+Z?=
 =?us-ascii?Q?yI4CoKxGuX9RFmeMTduK1mPHAnE+87vCpmALYxHgZmseTb492v8LCPfaoZCn?=
 =?us-ascii?Q?Rs7ft3GzEHp/fH31l5ZaNoj4rnSe454R0n/7OA0sVigPe7mITRqTuMvCu2I1?=
 =?us-ascii?Q?MtJElcIlwiRpQnEafuS//i4dZE3i9pRm0VgP5/UmYhLx3h7uEdF94MKTX625?=
 =?us-ascii?Q?d13qR+jKFcBIcFo8zpJ+HiLVuFNuY3ZZ08aYyMQbDgTt3BCjO+FP0rTLKl+z?=
 =?us-ascii?Q?yLmMl6qN56G15YchH8jGOEasUWLngpksEBzmvTUKskhsV/MLCRnGgzGiPQDW?=
 =?us-ascii?Q?AG8GwSdD6TELsfKe0//AClLwPecA/DieziCQ5zXRCof6adMslhP+unAZpcik?=
 =?us-ascii?Q?h1c15oQQYY1tUoLqfpUHkiuKlyMXHAaggxR46vPzJHTSflvgXEXrJGErajHR?=
 =?us-ascii?Q?7/yCN7Dl0W50ZL+LUr6MHhs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3c60c6f-d069-4f52-31ba-08dd30428237
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB10906.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 00:13:56.8993
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dnw32tB9uK4jIGDvkvv56UK+E2w4ZaxoELo+iQxH7m+2iPUB0/LEh3VwVpYpH7Drsh/HW48r2bzZq4E3s7RyRc7XkCnpbuBBlniTArb3TuXk6qIyYuz/jvkmJhhTwAjl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7143


Hi Mark, Intel test team

ASoC framwork has disable_route_checks flag. Intel is the last user of it,
but it seems it exists in dead code. So we can remove it.

But I can't test it. This patch needs Intel team's Tested-by.

Kuninori Morimoto (2):
  ASoC: intel: remove disable_route_checks
  ASoC: remove disable_route_checks

 include/sound/soc.h                          |  1 -
 sound/soc/intel/boards/skl_hda_dsp_generic.c |  2 --
 sound/soc/soc-core.c                         | 29 +++-----------------
 sound/soc/soc-topology.c                     | 12 ++------
 4 files changed, 6 insertions(+), 38 deletions(-)

-- 
2.43.0

