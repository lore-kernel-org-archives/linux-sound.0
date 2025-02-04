Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010051.outbound.protection.outlook.com [52.101.229.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7431537E5
	for <linux-sound@vger.kernel.org>; Tue,  4 Feb 2025 01:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738633271; cv=fail; b=k+iv99aElliApT1Qsmh45Hu77ntF77Rzr7UStygNmWxaDReY2d5jZWBeu049MyYZas1SI7GJdu+wWMhbqscXKubdxNUvd7Lm89PsGAKDDI59kp6QjNj/2s9mbeGPlPON9l2ghO8kzx8rRDDWfeRy0AX22ensVtCr6CCq4OqHGAE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738633271; c=relaxed/simple;
	bh=+cd6sXCf/LaubT5ECxbq1+h4gpzteJrHXSTEjTq3WMc=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=cBj26Pt9F92kqNux7hdHcVgGiyYkvReq43HtPob+hLx8tFfOySeyhevx0q7AjnrwnxfSGiXDSH7ePg6XmOzX6t3MMaFltAGcj6LehG/9w4xw+YMgU0W5VBJibvkZwICqwRAH0Qiet0KdDXIK4RHbKv0jxva+fcfGRBhY0NcbdFQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=giw+qkPJ; arc=fail smtp.client-ip=52.101.229.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="giw+qkPJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aF5HwnQ0sPHgizv32MCL5GrGurawNW6uz7S891RTM4XRKK2aqAzWsqTU0izgaWkGDcfaVx8qf+qd59jwlEfQhzHwLgmhI/BflGiXoGjz8a7V8nKhQ9fZw/G+9zmQSTHT5F1eG+gkKwRdgxsUmMmUrzM/rKKbkcYfYBNsteq0yFb86gMgG30x/6/cpKF2VEcoYnaNdUM1GxgRq/drVh4vB8w1CltfsWWGFGMFwA+2msMINhUg9QACeK0LWFh5h3HEw9bUPgFVx8gYS8MQJ9AVOy0e0nAOabVkJJAegzPHx5OpfohiWZqg6Bqylu0rYXwVYILP+u8pA52YHAUyTTVPlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QDaNWHvE8bT8cyjCiOxOXOkOGkaHuQmn2mpqofsJMYE=;
 b=kjNkvetOJTi5fGybgJWapNgLWssbpnB9UeeF3d4RpeG5IHlY2H59rbVSsMRhqN0+bBUx26FGXMDLrXGPTzn4IhOS52TDrCXumHqNpLgPXOM94DnmtgSoR3NZ56vnlsZNZ2vFMku5ni3spvxixaRs7ydzub133NwwyOdujz2KUroy97ZkpYDG2YkWhH9XY+6+Ctla9QpslMXwpzfcFcMPaTcbqTMyYfrxQ1X7Dkm1el2RTDNRuChd844dNucoqYTiAhI1qb5sYle0pa2GmYpK+CIsIa2aciwJWGZFmdywU440iSypTDpF35HJC8WWbvU8j5th6twFUX+Lbue5v1XynA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QDaNWHvE8bT8cyjCiOxOXOkOGkaHuQmn2mpqofsJMYE=;
 b=giw+qkPJjRVpUdWDp7qybGdn68lFC+JmODPgMyOXm61lyn0qgSWYLq+s8xFMopYGW4mRAZ9zXrzVJUy3nS5waF2H4GgskztoiR+uHIdIJlnIPx0PrPYeMhp3HaUdvBcACaunmnOK9frOVQcxCgz3KHKBDvEKVf0Kkf9weCvuvzc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB13000.jpnprd01.prod.outlook.com
 (2603:1096:405:1dd::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Tue, 4 Feb
 2025 01:41:06 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8398.025; Tue, 4 Feb 2025
 01:41:06 +0000
Message-ID: <87o6zi32ry.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/3] ASoC: rsnd: adjust convert rate in 1%
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 4 Feb 2025 01:41:06 +0000
X-ClientProxiedBy: TYCP286CA0216.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB13000:EE_
X-MS-Office365-Filtering-Correlation-Id: 707e9147-1ce8-4083-6058-08dd44bcfde3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CQRk4XX3KvjDdrfspewlS4PROaCF9g6HXJIvjgJtHQwhXKlM8h2CmNAtk0gA?=
 =?us-ascii?Q?c6cR260hQ4RwJxtOfsR72DdFQ0nTro1aCgIzrMYdV4Nn4EUAAmJ9A1RbcIF1?=
 =?us-ascii?Q?76RmG+M4VfNfeXPynUb9/vO0KJKv6VDtLEUpdRovhlRO79LaO+hYUj3NI+MH?=
 =?us-ascii?Q?aKw1uVk9xn+/wNEiUwA7E3+0GCWpogzgX+P/mNCtU7m/+6TRDtfIV231kAVH?=
 =?us-ascii?Q?t/l/NjK/WbvMcu+psyhs47qs/YNh1GGT33WPpKUOpirO0gaOlfDO0juCBtA+?=
 =?us-ascii?Q?27V9a+OSV8w69yit+ZcjKJhcsxEfHEGrlMqIoSia9d634eDd+joyhrj6U/fW?=
 =?us-ascii?Q?Au2OtHozsv8GX0iXh3eNW6LPdnYlT+uAe/bbifIn3Bodq02xKoBUanoDFro6?=
 =?us-ascii?Q?Um4NFlff4K7kW7WWrNcygn5NmlzQjx0mueW6xGCIh9SytiSsr2ES6RiaZLXs?=
 =?us-ascii?Q?yXQkPDji+O/ChEjjYRUo3PQrPUTV0QH6lZF1Jf3gWEZLveFg6ut3AjTBKdXo?=
 =?us-ascii?Q?OaQS0RJ4rvBzIGWBSGBS4ajC7ESBq2PLwuf5+vUeGOLq5nQl6C4/MK1UOHtq?=
 =?us-ascii?Q?mbczWE8sOCs/dga6gZlXrFdgqI9DWLUgdbJjZO7Sd6Q3qyt6Xd6qsuby6AUZ?=
 =?us-ascii?Q?m8NqdMhXwKeiA/VoIv1bNSr8v6LKosaBbMJ3UNB5E7PiIRcYhuYKTv2TmZbr?=
 =?us-ascii?Q?0LkXw/bs+vKilWWnAa3Ntz9fGe9fmaL1R2zsbrnp6FicnEwxyNEXgg/wIx8A?=
 =?us-ascii?Q?jp0re/4iA85hHszYah0lsRzphOO6osiUjZtxro9yIMtjkUIdcarPlzrEe+Zl?=
 =?us-ascii?Q?Fl+tSoX+7RptGm1iyQ7bL00vBp1apDTWZSOy0ywHbkNgTbDaDW5rzxXx5ySV?=
 =?us-ascii?Q?haCZN3kC7cljK6KP7mdwVjZerWCfUiuEN7xq3bKE0l4/AFXMDYUKPT0EIGYW?=
 =?us-ascii?Q?eIpZ3eymRFv7dqgQKKTluPR0nmtpZI7ZT5/IYVI3ASjAy+bQZ+Ua6t940lmC?=
 =?us-ascii?Q?95fz6Vk4Jw6ZbqYwuPzv+oe1XPZVdthHNxuLOxNSScTFMxml7/FM2+QOpz0d?=
 =?us-ascii?Q?hXb2o5xgVrq7CR2RxrKmrLtNASQ/gJsAqdJB7nDYiK1VLo5bxy6QjM3OeX97?=
 =?us-ascii?Q?zY74AxvCtzOsqSLvCMUvORw0Y4QdOKfJm7vIL9OG7IcFHQoVy1XbsD5IrUE0?=
 =?us-ascii?Q?CGwYT3Cz9kECutrmZtCUjl2NiNBNLxC/UHAmpRV0eUVTs3efs/BmfXM+Dj0x?=
 =?us-ascii?Q?XVrRdGfPiT/GwynwFWHgLxj/O36YDw9AE1fD6JWCfz58KzWNtry6E8XzhXDC?=
 =?us-ascii?Q?vaClBo6KHS/sctZwaoEfA4TktNklVYZVjsK4uI3fMEZLPjflUxsmx5OXJntq?=
 =?us-ascii?Q?s7g246WNEsIhJzuW+4C0ZMNL3V8SWW66Ng/ieOghWsIcVELLjd9smmkiqjcp?=
 =?us-ascii?Q?Yx+/LzXbbeuvRknUanVk1wGCuORLs/v1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FkrCRMzfZ9QbtcZmPajfSGAB/XytEBtm483MoK+wO7m6JKo4JB/7hZumj525?=
 =?us-ascii?Q?gbKseI5doewrnb6/tbjUUFt69TsWlDEqNxpSi5aBlhXAtsKKe/cZToQbgVRv?=
 =?us-ascii?Q?wRcj78bDD9bE9EFo6i2WrwYbJnh62gMlc1ihV+xrmSIAPNF78+Uk4Zi8sne3?=
 =?us-ascii?Q?dRYumIT/NZgaxrYRRLV2GFc6To8wjtAkWY5rgdHoWsOVq85VgDi+sQr4wNkb?=
 =?us-ascii?Q?N6o7lzNh38s1Ex6fkgm7sDHAbviNHzZ+SBoNacFQhcXRDs2hmJE9zOIpHtS1?=
 =?us-ascii?Q?FKVUA9DMX5GUg6czhoxTFE+9oYUzW9kKTWQvLq24byNmeVWVRw/EHj7SvF3q?=
 =?us-ascii?Q?WGqaU8TPoVbVatMfaRVxB9ljQ+3tF3BO3wZc+8VbVT9w7Ae42v99G6pw8PkR?=
 =?us-ascii?Q?HycJ08AHkQI7yki+RhfXlke1Ucp/w3rbaiLF2jrWZpUtIzJ3+04lBue90mAm?=
 =?us-ascii?Q?hLk8nRMBLuqFiR7AdCrWbPdeIgeFy35W1hXwRR+2fPujnoNNdLqthETXkZJD?=
 =?us-ascii?Q?jXgij7c5sU6Hs9O2pnDVgU/37t32IQvqF94sExz/bpJC4w01Pc3B0iMvWqHn?=
 =?us-ascii?Q?ow9bK+G7eAZ1YmaHhn3pN/+NtXfvq3gRii3PeqlpuoHbu/vWtUt7QtNgkjhS?=
 =?us-ascii?Q?tK/xITEoOJjErV99bgS+7AG+jey6QNUTAL0KtFUl+GhqJsQJWW1G9rZXOo7z?=
 =?us-ascii?Q?vSIaLZDWILFGF4fc90Rs2vOSFJ+LB6HTn6cPRBqWq0V0o8VGI1qlz9PaRjYA?=
 =?us-ascii?Q?TgAum7Et1GEewrS6pE5F76Rml+JI1Kg3IWc3mDYzjmme+7Tq/oX0jCIGyPi1?=
 =?us-ascii?Q?GQ2YQVI5NWjhbtuufRvHLzXAxJbqGVppp7DQODZTJYm0KGkyQb/9CcWe71+3?=
 =?us-ascii?Q?gB1lNbOyI9YIVPYPDeYv7pjQjWneX/ykioITbxb8Tf3jrJEjZHaUZmi4yAQx?=
 =?us-ascii?Q?+i4m/zE5ZA1wBDAixdhgW6VF+yxuQZEPHbqEyA7R897YvhdTY4KVIykKDr3J?=
 =?us-ascii?Q?ex4qDbb3L8CSRQeaSsHxj1u1ZDwENwVkBQtFc0+wlQqqrU2v5XVKqFAKBXKT?=
 =?us-ascii?Q?TxiIbigsEo372yGuMeYmnhaK8qOGh323XTOM6oq6rZEY5pvgwfbv3mmQ0tLU?=
 =?us-ascii?Q?qwhGJhlsSzrdly9Lx4WOHVI5Dx1cTXrU0RFMaGi5Hbz4SWMZTRvbW+VB2k8d?=
 =?us-ascii?Q?HdlifhKVN1iWYJRBxzI3L2au8TuavZGE1Aigt89aasqVEIcfHyIVNWaWG5YQ?=
 =?us-ascii?Q?bYz9TmBRuMLocwG5QA5zPq52rJKf1J5pjFSHGnEDOdJZmRIQZEizS2HcCQiU?=
 =?us-ascii?Q?vJnfVtLUAoz0V2KoDmio+GP2FREiERq93wJ0Yhi4hX7ZhnKfAAGNFOtSP8EL?=
 =?us-ascii?Q?45tt88BEehxexHEf0db8akF82FegviR34wQsQWecQqfCZ8YXCt+Q7SgWsR4K?=
 =?us-ascii?Q?7LEHYqbYCxz+ZGqKLsbmMjhFgIPOKdCnJA1jZIpD4TwUvk/9bh+kfjGN1b6Y?=
 =?us-ascii?Q?KyASdVxY+hq+AGjaGXkbTPSV8Bynd5UGGhJ4v3mkEVg+B0crutUPQ+u1UT39?=
 =?us-ascii?Q?A8q+7sFZ3jlA5gqqL3e6bD9xeY/nXSNjqP/7XQmQ3WUSa7n1SyAa+f/giyhP?=
 =?us-ascii?Q?5iySUiAS3l7bVRDgCPHRSj4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 707e9147-1ce8-4083-6058-08dd44bcfde3
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 01:41:06.1766
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qFstObM6kXyX7lSQ2JUg9TyJkVfjeZJNGJANDzrm8Vgs1pVqnOavJlkNA7rOOEaBONpfqCMQ9JVpkwrKO5l9Rs9xi69J2XxjkezRKc/uuAyovpYrf1ennz94EnGmB6+F
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13000

Hi Mark
Cc Shimoda-san

Renesas Synchronous SRC Mode has HW limitation to be used in 1% rate
difference, but driver didn't care it. This patch-set adjust to it.

Kuninori Morimoto (3):
  ASoC: rsnd: indicate unsupported clock rate
  ASoC: rsnd: don't indicate warning on rsnd_kctrl_accept_runtime()
  ASoC: rsnd: adjust convert rate limitation

 sound/soc/renesas/rcar/core.c |  14 ----
 sound/soc/renesas/rcar/rsnd.h |   1 -
 sound/soc/renesas/rcar/src.c  | 116 +++++++++++++++++++++++++++-------
 sound/soc/renesas/rcar/ssi.c  |   3 +-
 4 files changed, 95 insertions(+), 39 deletions(-)

-- 
2.43.0

