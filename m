Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C543F3F7A95;
	Wed, 25 Mar 2026 17:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774458540; cv=fail; b=Sqw9YMJuL2lBcU79/lg53gYIo1iZxouyoPoQ1sehkQOmnQOpchI1cdIfI7UjPoBe66VL1Giz64GScY1Z+cEDYudFK8+BuCHZi0NuBumQJQB5OCB+Zbxpz/mtpz1eLtcD1W6RAHeXbmKkJBslV/ZjFOS7TBjvszILJedX4sFWT00=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774458540; c=relaxed/simple;
	bh=N5YinraOKjtK9w6FtRKeGfgGSI+9du1+yDmJc7nwXvU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=M7yC70NisQQ6bnHsWOeEFVKnP2MNjOE0/U4sYwvkHd2vxM1S1qwLigTHmez8SGFpfzJhTaC9IWsPd7pElv/nSZOjTBlYjDq5jzw2zr75qkOBtg+bRXb/n5BmyE2LMWCWtVfZgQXURo6aBoRxlDdZbP1D0uYIuUznTPyFo7CZPQY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=o8YBkYyH; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=IwYle2dT; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="o8YBkYyH";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="IwYle2dT"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OKQCwn695310;
	Wed, 25 Mar 2026 12:08:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=+aHIbjmhY8CZnYL2
	liae639DGNEkDBkgiG9N6gbtolE=; b=o8YBkYyHTVnMjr/OKxhcyLwpAhmFvJOu
	iNkfKAKHozcUAUHBu3nQqxZI7OuqdUX/0vI17lfZmjVfuAGl/aJ7GEW6yV2nVdo9
	KaXjqlMN85bDXLFWbvN8ISkhZrQ3dVUg9zzahGmTreFy8XqVWxpfKnLg5n4kV9kU
	Oz1+LpNXrFtQUvhqF3qe4GBjNt+P8FZknuXWKa0uCUUVYCEaUunUF018kMaYFa2m
	pQ/iCCg0g+q2i/Gvi4EXEsRgr7YU3Zg47aPfavJih9HadGFA2+7xfEJFE5by9Nu1
	W0BJx+bysjtUa1Qi4HDRD55jr3izUc8AkRD7MqE5IFmhsSuFshLY4g==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020108.outbound.protection.outlook.com [52.101.201.108])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4d1qrfd5d1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 25 Mar 2026 12:08:48 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MzC0j0zJ3PlTBnJqI/zjYEKAKKljccdh73oNEI8c2lyo/3DrPWe15/NrvoUokUUMT2PasHoAkYu4pXNHIcFg5w9J+7ZjSw9pwpCJH8a7AFLkui8UCxKSaeviPOs4j3I5pN43msBSg5F3D6Wc9EBSR1baJVOI2NSYBWcdp8Zt0lYJA283HX2OiINNBJbZvZb3cxX/077TIujUqFjPLhqexNFvbZp+KXlKNMCrLdpGZw5YVSkAEvqoFVNEI+KbUrE5UMKElKNb8S9cvyaHPievJpjSECF+nZ7sEBin7Dn5npWcZPbM5m/S4yBdBGXq5+qD5RDdG99pL0mJHl2zLsy2Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+aHIbjmhY8CZnYL2liae639DGNEkDBkgiG9N6gbtolE=;
 b=n1QPVPgYKDP46Ike4g15RF8eYdhq11M/AHkQmKuZeY7WVKz8yMMhZ1aQgm61vCpvfcnf/8Od6IZk/se/rAG+mihJF4PRwYjaBp7SQmMejG7qeL7ZiO7fDaaV3UW69hdQXvz9QyDw7xnddpD456p9pKpga8mGStfrY9KcHMruZut+2+LGBxRa8rwtN8oZB1RKhbDR4VPCxgwk9mSBQiVQIo6x1t227MSE9oWHVLWkL9otuViA2d/pffPNUoJKdMWSFRdIiJcuBAOKgV3P1O3YiRL6kj+ORysIqFfUYBh4kOBw3Q7H+ivDNhO9SGX2CU9ZnYdVtmVuWzu5WXOVxJQZhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+aHIbjmhY8CZnYL2liae639DGNEkDBkgiG9N6gbtolE=;
 b=IwYle2dTChw94YlGWPjX77xzomm3DosDakn5Z7Ml7L2Eg048cnvkTrozfiuSD64xv8DnF11Zat6/NZlfMW7ZAEqqN07cGb+7PJAxoCBZcls0jxR01Yvhx/44DTuLhgkVZtyfYQWvTTt8nW/8sDqZ+6Au8Jg+TGEtiYDB5dQVQXU=
Received: from CH0PR04CA0097.namprd04.prod.outlook.com (2603:10b6:610:75::12)
 by IA0PR19MB7242.namprd19.prod.outlook.com (2603:10b6:208:43c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 17:08:43 +0000
Received: from CH1PEPF0000AD82.namprd04.prod.outlook.com
 (2603:10b6:610:75:cafe::e9) by CH0PR04CA0097.outlook.office365.com
 (2603:10b6:610:75::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.32 via Frontend Transport; Wed,
 25 Mar 2026 17:08:28 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH1PEPF0000AD82.mail.protection.outlook.com (10.167.244.91) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.21
 via Frontend Transport; Wed, 25 Mar 2026 17:08:43 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 206E640654A;
	Wed, 25 Mar 2026 17:08:42 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id F3ED6820247;
	Wed, 25 Mar 2026 17:08:41 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 0/2] ASoC: cs35l56: Support for factory calibration through ALSA controls
Date: Wed, 25 Mar 2026 17:08:39 +0000
Message-ID: <20260325170841.1405368-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD82:EE_|IA0PR19MB7242:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 298c1835-a1f0-4024-e21b-08de8a912b40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|36860700016|376014|56012099003|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eD/001eSMPZFUhR6ZH/letXNqsXHYUqUe1VrfsWSY0ZRmVZ4AisvzPwYMlJL?=
 =?us-ascii?Q?0ms6NHd7PV5hq9yQa8VN7h2BNwbRUf77Srei4XXpEOu+DahlzBJfw8Cf29pL?=
 =?us-ascii?Q?QOBnyr0V+qw0WIpHpc6E9ROJw2HvnRzYKzqdv+AGmTjNJ31E2nzJx9I0ZJKl?=
 =?us-ascii?Q?2jle5oZCQh1J3znDhVxojca1rRzNFbLyqUP0mJf0rOXpHHMspSHV/R3u4ydG?=
 =?us-ascii?Q?gdHQfjK8KsQN5TwK1NuXu1qkRf/3ERS6HOjkxWUPEyEZZxFqa3D5+i6+QSzm?=
 =?us-ascii?Q?pktXDkIDkBcm6kZf8qhjzp4oURN9I8Luo8d/swog3+EyJmFWdmnm3DVyCT/E?=
 =?us-ascii?Q?CTvPyPWq3G6FmMV7Tjy6KrtrLBVuyNn0TJqWviSugsKdpZHMjUD/pSNfa19C?=
 =?us-ascii?Q?EEAxV2r+HQaIw74l0zRS4kOENwCqWgJOn4tyOSwNu8bYYvThDwUBh1Lhq0IU?=
 =?us-ascii?Q?di4iG3/RXJoiEAfruRk9fOnWKwm24kRI1Jho9Uxd7L3sHUrl1jz89eBlvfL9?=
 =?us-ascii?Q?YbC1/GOQIaksXkMQqD0FoURISXjOKawTPKS6XGhcWSu6N+T2Kzta4ztQVk39?=
 =?us-ascii?Q?O3AaC94HsG5Dw95TPsUWoRimA55JWP1blfjDu/0ILfRyjOAWxi57J/l4Ss+J?=
 =?us-ascii?Q?FUEJrDdCXowhTo0xYQXd68yrHb3cIzWJLxWwMjPruQaiu6cAWLUfi5xT8wJf?=
 =?us-ascii?Q?aXdHKxJLq9qOaSuuTjDF4d1F3uE3GApF7tWMEWb05gLhkAbmprRjMlkqyR5e?=
 =?us-ascii?Q?ejk6BXIiQ50zB/J6QjZnkr+wYUTe7zQeq4KMYRzhvcZO5pxEhDf3OYdynjat?=
 =?us-ascii?Q?PGj6+g3yFxsua6tjrUY1iqbQegkIOQvyp5PjQ0Vhn+BARWkRjMxR0ascdYwr?=
 =?us-ascii?Q?yRtGP+bad6GEivWoUpnAnurmMLrL/Qoz9LpvxmveexcPfa/vN+7FrroG5NiQ?=
 =?us-ascii?Q?42aaPR5xcphqkgoE3URfPFIx8zFsXzq7lsjYnResr+jyrLfydUpZDU/slQgI?=
 =?us-ascii?Q?YN8ZdIGI7kMjC8wubudRS0JdwL7ffKhlfNLx0XyMb8o1HAw=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(36860700016)(376014)(56012099003)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/KeyDx9mvsTAFkk6iZUz7DnokGdbOC4O4FefKfW4h/dysqznMSJrDEtxir4oGzlTZO5m5ttDg8pY4gWMPM58mgj2Q+/luyv6fs15V9jEg0L+Ez96FJnzEyteotHvIK1d/M2XvZxymB33+txjx+jyMuIv0KWB4I9cHz5KKcUDAtkhWkM6EFTRbqGfGdTFPIhnJhZYMdXAVGUUgFTUcTLYEB+/qthgFRSDQB4+vd+loTHFXHZQieGLaOGt2K7YHQnR3+I9Tv2ODDjqX8+nlp4V9UUV0XLhEWUvSd1/gJmz3Yd9KkkzCXu7JOzh/8J7YIzGQBjAU2xHdcn/RaA2qL6+SO3CwWI3t0F4Yr6jIv5oXwNV4zCYD3d1/G1NpVaOzmbf8fvmga3Ezw+hqCcsMtFa4BQzilsdDAAOMHYfcdtWc9fxhxmmzGqdIkE3F4d2AM6D
X-Exchange-RoutingPolicyChecked:
	m0uHy+BOlQFlUMhwykS+GtOaWDg4xmCAK7yURzxX7vew7bTo2CIDNmZZ1ldl7bNsbWGrYGuFKtO4S3noplShzq5xYrgiRpl51TxZTMOzw+FwG1QcvCDUvxriXt8l6U7RxUNReHkD1UNov3t0KbZiLLRqwBfCcJsh84whQS3sdyiAFoTTgPpo6v4Y4g+V9HtZ5RWpwVMfWs29u3SCp6CfNqgrfavh6XD8NLL88JEHX3RqPTUE1ZkNzhJtvWbyXqun71KhGXN1vVx97Itl3QIlUb4UGjs/xRWmaSbArNnFaNxcfaG//IKL5SFvvwUFC/Aj8VSCKm7dVQY7L1RMxEW7Kg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 17:08:43.1388
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 298c1835-a1f0-4024-e21b-08de8a912b40
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH1PEPF0000AD82.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR19MB7242
X-Proofpoint-GUID: uxMkF_cEJjGOGKkTiCidfCkcvJKAn0Zx
X-Proofpoint-ORIG-GUID: uxMkF_cEJjGOGKkTiCidfCkcvJKAn0Zx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDEyMyBTYWx0ZWRfX+KLIsGbWXbra
 toCqVVgj3kYN6ArMU2wSVUs12xSNLDGLBnHCg2SEqcSJHaCwBcyZrouHIAS50SudsQ/ai8IEJaN
 lmw2Hh5PGe6T+agNar0kfw6upj14xsbeN2mRQ5SQYs6jxZ8tCIKfK1o1DqRbTQ1hLvQ7m5yntAA
 WOg1c+XnTQ9u+GcxAqu4Faem2pwk8iHrFI/YTAcPKup9zLaQNcrZJNhJ8AaqdJFRLb3bvgrsqh3
 k6KlD3M7H4XGNTWd2/uWYT09Z++uO1THBu0qRTD5JGTG1GfdUYjKK1wWCI7Ytl3PLNS/rWeZSm7
 /+XEY+ysIt1EJQg8Ou/pSNr+kCBSWV1SjeFc9C9Y18KDMeK9svf0d9ca/LslORLJ+XR0DcueJy9
 fwoXLFE5DB7fc8kRugYfx3olpZauk7lr+xEhse2GqlMxBAdHLXgyvQcG8R6Q2JSMjLl5Ok+nRqH
 vVXaIBv8yYIJN8VL9rQ==
X-Authority-Analysis: v=2.4 cv=FM0WBuos c=1 sm=1 tr=0 ts=69c416a0 cx=c_pps
 a=92GwzG7YO648zpZZqM2iiA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=vhlvV-9bzOn8wpw6sE8A:9
X-Proofpoint-Spam-Reason: safe

Factory calibration is normally done through debugfs files.
Google have requested that factory calibration can be performed by
repair shops. These repair shops only have access to the standard
"user" kernel, which does not include debugfs.

Patch #1 adds a new control definition macro to create a boolean control
         with specified access permissions. (new in V2)
         
Patch #2 is the implementation in the cs35l56 driver.

Changes in V2:
- Rename "Calibrate" control to "Calibrate Switch" to conform to naming
  convention for boolean controls.
- Mark "Calibrate Switch" control volatile.
- Cache the value written to the "CAL_AMBIENT" control so that a read will
  return the last set value.
- Return 1 from writing "CAL_AMBIENT" if the value was changed.
- Return 1 from writing the "Calibrate Switch" control to true because
  that always causes some activity in the amp.
- Replace use of the confusing in_range() with normal comparisons against
  limits and make the limits the same as the control definition.
- Simplify the code in cs35l56_calibrate_ctl_set(). It's a boolean so the
  value written to it is either false or true.

Richard Fitzgerald (2):
  ASoC: soc.h: Add SOC_SINGLE_BOOL_EXT_ACC() to allow setting access
    flags
  ASoC: cs35l56: Allow factory calibration through ALSA controls

 include/sound/cs35l56.h           |  1 +
 include/sound/soc.h               |  6 ++
 sound/soc/codecs/Kconfig          | 13 +++++
 sound/soc/codecs/cs35l56-shared.c |  9 +++
 sound/soc/codecs/cs35l56.c        | 96 +++++++++++++++++++++++++++++++
 sound/soc/codecs/cs35l56.h        |  2 +
 6 files changed, 127 insertions(+)

-- 
2.47.3

