Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011028.outbound.protection.outlook.com [40.107.74.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE96425A628
	for <linux-sound@vger.kernel.org>; Wed,  5 Feb 2025 00:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738714821; cv=fail; b=MR8Hg+0r560wehj70CaQep1ldQsx1dSII9DeCVxXQ5PQUL0FMqGy9+lNG8CEdeBtqYI4LPF4KND3CbmjWP5UKqJ8eH4wHjsZbrKpm5YZss6nn/Olw6d3BBIZadCghLt+WEhKcv/CwTEr6jXydG8AbWAd4SM03qwaTUOwTKoATpY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738714821; c=relaxed/simple;
	bh=bVxVNpUa12K5QgzjAVIQN/kpudZs+QXD+ynIelNt1NQ=;
	h=Message-ID:From:To:Cc:Subject:Content-Type:Date:MIME-Version; b=a4XWWtROz3naTrOMCUrf7tCtDyr0ZzOAqcWLvrt2dJuGVzF7kTdS5KAgcOU4gwlwpXM8z3AM1D8JBs1z0X4wbR5IAPVpQBYVzz0rSRW16viBDwsFyEA2yksI/Rp2yyCgyCpJutlkLNXF3WAu2KmymQjJpecjbuXkhpQwXIuxrBQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=YpM6CyXc; arc=fail smtp.client-ip=40.107.74.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="YpM6CyXc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O2MmGusrYwdsXiIZLpBigRCBAyAFRcspZ921GBfD8pXGvKSFqqOduLyYQG97flXEzmGik4O79D83KB6LhONDndKjVBLwtWcRCBrnOupp9a9jafR9FmMzCOil10p7TJezf9aKeqXXjufpSadHFZBqPh182QuDfcjeV1CWwvojB8ESBBQCQznmk80DH2ApQCbfdWSp/z2+Utdkq89CR01fe0edc5A5SCet/FtC0L1dbaszDtLFOaQCnQKZ37sbrvX8cUtoA1zCtqFPLWJh5b/RHzzpy1hMh0Zj8Ny81rjBlFbN1OD1OOymRs6tsDfyhWKMVfAmFRmK01fOzFdofHZ/CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wCmaN5DZ+b2VSiH5zh6sMwIbIc5Fy0p1M+M4GOQLpYQ=;
 b=oliFaX7YIil6mbjhDkFoaHv6bkYWVH7EL4+RQVXdNndPHWkvRVhD0wDUX7cY2ni8gisjyxj5sl4GFnvSuCiKDtIm+zeSAoLUyx7s9KQmXnyZgiqA+VMIf6yESz40GYbqQ9XAT8k2wRjhrApc5AONRMcRCqWSlhvnNxgkDhhgoSp3azOLrjlVpDBF+mgrBI4i0RZQPzWVkv/1AMygVQQDakYvnE/EdyrU0BS4JogBHJRalJgcQ0nhR9s4/J/uGmfiMnJFSIDgW/qarJFEpHHd8Lc7Aq9t7nqp7RGGyRxBtKvFdxZmpY7VM8ys6iip2I5wQ5zNnXtBfez9MbtY3+8+7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wCmaN5DZ+b2VSiH5zh6sMwIbIc5Fy0p1M+M4GOQLpYQ=;
 b=YpM6CyXczQ+AVMfYA80dfEZTAh85BR/EQO78bZ/EqUDEVwm+xGv3MZC79fa3jAwupejCbrxGjI063lO4NxjstLpTpb8V5tpr7oPUh8kqzyUl0W9KHoe29WbUjc19zfCfP9i6PojzLRRUjOZHjvElYr48vjmSPEu0NihN1j0nlJE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10242.jpnprd01.prod.outlook.com
 (2603:1096:400:1d4::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.26; Wed, 5 Feb
 2025 00:20:16 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8422.009; Wed, 5 Feb 2025
 00:20:16 +0000
Message-ID: <875xlp2qf4.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 0/3] ASoC: rsnd: adjust convert rate in 1%
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 5 Feb 2025 00:20:16 +0000
X-ClientProxiedBy: TYCP286CA0314.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10242:EE_
X-MS-Office365-Filtering-Correlation-Id: 72d1d637-6e13-4210-e915-08dd457add9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NIo4pZQbulsiubKBP6Pwkmjdo/ntqaRRn84vA+EZKYEj82nJ1u3wr8mRF5gw?=
 =?us-ascii?Q?s3mzHTgYuN2vl30RiYHDWWfyF6FA0rxoTT8KSbHGTuXl/EBa9oB9MnztqZqe?=
 =?us-ascii?Q?bHXTlvxC9JYUfxO6CUlO83S30rUk2kBQApn/lGMFXu+MTP4ZaEJxzQ1UtK1F?=
 =?us-ascii?Q?PVAy0JZ1FIXysjTxljNDYup+LISzl/gKCr53FpuSogBJ33a8pIi/QRW/8i8C?=
 =?us-ascii?Q?luEDoHXuZ1gqdnJKo+7Qupl4RytdCFAukd7OcX8DJqgXgS04KaGpM3CjmfFH?=
 =?us-ascii?Q?BwkUZrfWR3lw5Q9enCQE2pjE7PFmRJFcM6znN2pkff2eHfcEIb6ozcmgvF8O?=
 =?us-ascii?Q?EJ1RKa5/M715jlkZVmEvfOfft6aDccyJrrLbHLqX66sVzKK7UQmwZ0zuYvsI?=
 =?us-ascii?Q?GHd5tIsZUuwKwYPKXhAEPsyCsiBORPvu6/0xtxGO3Y7XBH+5tTQxyqbGHGP3?=
 =?us-ascii?Q?CxB5kgrmvm325HuMHjSEut1k1iQdrIaZinxETxgm5UJshIrWLXBE7FXeY1UL?=
 =?us-ascii?Q?GjkV5qPox3DbzkkQtcCI67WKj9lsQg26rQ6ZHSeR8QHF0vYPa57rfmoGYw4e?=
 =?us-ascii?Q?ZC8weM8axcLBS0DSwc+dxno0+heYDzzH4AUZdQYvgFdM/oG6t7epHQGjJxBV?=
 =?us-ascii?Q?ozo51s8raZ7jrUct731sd/X4eMg8LJ8/BdszWshzbc8sp0ZagW1QOTbvT+LM?=
 =?us-ascii?Q?09YX0uL6qAs996UPKon0zoeMVLJxQJG1Bh3wqofJIB5C5bnZ6rtcaydpYhdL?=
 =?us-ascii?Q?zOFmU9jTnMLII4JQ7MwcN29gL4h8fUj/VTTpVhyr+fWVO4WCHPl8cAeMVFlc?=
 =?us-ascii?Q?lWOz58lx7IZDD2nGS6bsvjR2fD+LV96YfA7NZw6BzXa88fD7O+PE5XE+KEIa?=
 =?us-ascii?Q?cmJyXuXmYMzJ7B81dIcSfLJYfrVurCOSC0d0PgShOnYU8uR814FSs/QrQDPF?=
 =?us-ascii?Q?oj26bI9zyKwRSKDMrZ5ra6H4zrY0pe3kNvOCxSyrtXjbS8WMeQ0Rh0c19GQw?=
 =?us-ascii?Q?NenJOqCLBwt8PObWElpy5iSZw2MjJagIku9iixMx5LGLIicJX8OxzqBbpy19?=
 =?us-ascii?Q?YsxVmVAZGGooWyJ+JMg4EtKRiDMGY84yeWxJFZ1oWBLTF4k/qWERr4+xoRDI?=
 =?us-ascii?Q?TnLT9FKhWgn2r0PH1OBQNaGZPHcAw9Lhv3keV5hlWhNYP/VmsF980N0Hnxf1?=
 =?us-ascii?Q?ZxQtno5kaxDDsrBQRkAtdoSXbC/4tPIKLc3PzeKWva92swqKDvSDkxWKzKp3?=
 =?us-ascii?Q?C4Vr95r1nb1R1B0esisgB6PcvEC3RBcuYea2Ooplba8XqyoM95X+i8D+8Yrq?=
 =?us-ascii?Q?NvaJ3JOJjg1kZkGMte2bKPti4Lf8IgC0FZjBgdD4YAIuhNmpaWUdkflKpqFo?=
 =?us-ascii?Q?5BOphb+6/HxNpSZghENX2WxLQdL9P6xuqANhNExh220DTE6u3kkURA2WgwG6?=
 =?us-ascii?Q?8GkLjZdjq0vPPWAGmzZIuZd2XuVnVIn0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?a3eLWlOI5SC/9U64BNhAq7/UaOIphEf2OW1JHSWJMDLObi+SyjA03IxPcX95?=
 =?us-ascii?Q?BBHNVVSA5MoxBcT4kvczyRENhNy1W0IsILhB7anu67Tq5sDVGRztww1e7M0Y?=
 =?us-ascii?Q?x07gjzez+lqzxBqYibxDRVn0LqM7qKqAYvegcwZrTXDiop27TXwX64d313U5?=
 =?us-ascii?Q?fn78f5CPHKwE4USysvv1KYaZpoE8aFmc0j8IGzJhytlAuNgRgVmxj1cCq+W3?=
 =?us-ascii?Q?5ybmHo0ddkips+yT2VtE9kVOAz8zCOSlbsBnQmshOeLOFxigqod0mDHg6YRw?=
 =?us-ascii?Q?iqlXnEItxAQdGwCc95UdCtSlnIDffuDyo1UwvdUOKtAklLVBy0LGq7VpHKYg?=
 =?us-ascii?Q?aaBF5p99odsvt4ip5tRlgRmjb2qASW5y1fFTa2K0ysoKhuuLt1vEquxXKEFg?=
 =?us-ascii?Q?veh8rdm+e5NGuzRDsJYq1lxe2lkDB8a+/vXuWWL3RlZL4P7bphELAReA6WVz?=
 =?us-ascii?Q?DkKPM/CjKdYbeSUxhL03eeOafNGn9H/s9X+umBc+Eyyqiw8rQGQcf57cK1+u?=
 =?us-ascii?Q?qI+0NyEzfj0BRMlVl6eKWjFFeC5rHcFWCsrkbKZa3Al99lD4wqHCqLPTOehE?=
 =?us-ascii?Q?W2RJJSDOfrqWJu6+adHm22itv8J3re8btQkkS5TBHwVsqvLRRlFhkgH37rxs?=
 =?us-ascii?Q?w3BHQ1Bvo/8enyKJuGT2+299o/GRIpNMOMuzuJsrXBNh3WcIU2WgmdxrnONb?=
 =?us-ascii?Q?JaZ9TaBNEIY8Eau+Ix4h+C9OeDryo++tSnMDfBWXRevIB3CSVpWwazWQnZmr?=
 =?us-ascii?Q?WygJflZvqRNhhJvX2DqDgjjoeyyB2QUCH5rdGh4WLnxFIfzUd5nJaHVrsAfA?=
 =?us-ascii?Q?VzY5pXzy354tGrGH939uzgicjlb9Ei9hpgkYrg2+pLV22JtSyIgLGoQnLcxq?=
 =?us-ascii?Q?aIuXPUoLFaJSeE4g7S0YKEAC+8DODkVY+eRjOvH29IlO4Oyms5tMY1TBIr7e?=
 =?us-ascii?Q?YbXM1/x7kz0CJ9sFqD8fTDgLuwt51s7It2yEo+uDb+g1k4uhe7pjPiDyS3v8?=
 =?us-ascii?Q?RXr4tUrYrfPvdzrF14yImFmaoiv9Qjiv9vgwL7969ax0lLGFLU0nubFdLz+V?=
 =?us-ascii?Q?BAuIijaSvzUMMn0Gx1elLbszOuwSqYRIlqrL6Hr4pcpp4flANn8OD1EZ4SKj?=
 =?us-ascii?Q?mpjoR+DuBqSKa16HYo/3vr2EViIGNVY4Ek7iIKCPVitxjfzVZmhbrrp3eqRq?=
 =?us-ascii?Q?JxpUPAYXj/sZEyzqUyu8kkO4v3upp65+k+uKbYZVdEvMKELreyb1SbG2sDnH?=
 =?us-ascii?Q?QMqweTgzW3l08/vvCe18RnPNty9LeI7PySVpH+VRaVSnKl+94vBHx6mHRYfx?=
 =?us-ascii?Q?MWehux8f58/lGp0JbVlP9/+7zas8jjCszUFsphyp+TjIwtUNp/FDhiWyh17Y?=
 =?us-ascii?Q?G2j2OCcU/DuJ8LtGGkgADMLZpwoU7CW2S49NMcOyg5QZTxFzA+z7uqcOOGj3?=
 =?us-ascii?Q?2RfOPCspajKrxoqoEM9AKdLmKNDz4VdqLeI+rkX2E271MG8x53/3FWaBA+wv?=
 =?us-ascii?Q?yJE+r4ugVyYBCJgRId4DDXNd7yTvoitXBpdqldaZbXHTzJueF8amheakA9PM?=
 =?us-ascii?Q?DaC+vTbUrOx4kRL8MSqf10vxzukh19O645MQMHrK+ezm+XvNJpE9hcEMJAXc?=
 =?us-ascii?Q?Gf98Ryb+iNEPHNfibSePJWY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72d1d637-6e13-4210-e915-08dd457add9d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 00:20:16.3822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o+Ke+R4/yHvHYskyoKDcyU5+NPY93WDBk9h6B2FEY3VJnhiOI6JW9BUlsRRP3kYNxyslDskb3Cf/GDFKIi1XQnwMoQ0da1GkxXqvYyePMQHitQMPTyrjggd/A/yxZgI4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10242


Hi Mark
Cc Shimoda-san

Renesas Synchronous SRC Mode has HW limitation to be used in 1% rate
difference, but driver didn't care it. This patch-set adjust to it.

Link: https://lore.kernel.org/r/87o6zi32ry.wl-kuninori.morimoto.gx@renesas.com

v1 -> v2
	- tidyup git-log line
	- add Shimoda-san's Reviewd-by

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

