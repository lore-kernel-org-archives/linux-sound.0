Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E015934F244
	for <linux-sound@vger.kernel.org>; Mon, 23 Feb 2026 09:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771840503; cv=fail; b=LiVnHluTxHqcm4XPVxSNmnJOipEt33HEBPSeY0vff6JvVoNLc3ILOIqa8mkUw7S/QU9LQGIDB1i5ByPcv9GYSvyhkFpMdup73e7bjzREvWXO+0PaxjVNeUogH38WyB32InfcRMIUX6XeAFKigH5facd2XQuaO1wqWfpqlFR4U78=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771840503; c=relaxed/simple;
	bh=ad2yoWxoJuvzCX6d5JHczqxtKaAvEoiOTHrHSDBx/uc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PJZzvl2lR+SlU5AxD59yolP8UO45zKA1I9tV+TExoYW32HK6YC58EPh/bf9t7852AzgpJUChDwmK5BphY7iodFQZ0G8Y+0vkC6tpiu4Am8Jg/jpC3pscSTy3m2n581xdotpAv4lNcLXGkyVjgvPQ5M1Fre041xHAqPzr531pBLo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=nhx6tpUA; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=ZH8qr8zw; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="nhx6tpUA";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="ZH8qr8zw"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N5PCdI1162449;
	Mon, 23 Feb 2026 03:54:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=n4ZV2TYS/Sz5uJ4GyJsHjZc179l6Axd+gS/64W8dE+I=; b=
	nhx6tpUAfHlcY31a12UIGxy5qG78eA9xFwHtKg6uQlUpx6hZo8BSdORq2+1rv5ky
	oJBw5YLJuMAFK5D4OjliufbkkMtGLw0h5Vrhrpck4R9tGCX3TkcWQkvKcfhM+gD2
	vGTwqmxisfcmzyLxN0cgZyBFwEvvSGOqfq6Go2Zs/o/xCwagzxoRELHY+0Sg/nAo
	cwEU7dWfv+4O1TUfkWsFFhkAP8Tg2jq54yvbv19eoGYPQCtcR9E50SxlYsVt8dum
	rK1j0wSlq2pTnPWDs/hovp7683Am2vOAmi2T7V/3yog+e0BSJ4qfxSOFOSKHdAFi
	vCBjG+Jx3NqV719C/3wQxg==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020081.outbound.protection.outlook.com [52.101.201.81])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4cfa0j1cgm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Feb 2026 03:54:36 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wv0keoFNbBELoKmzJyzIS3eFXUSleajDhXbJBC9Ys8E3X4CR1wRVqT+5TdmBr0L4of50Ls51kvNaQ2lkdysa4G4Jbx7LPI+PUgF9ub5BNt7dEK0RPKCLsSu0m1iKmZfLYtj4Mp+suGrolwgwBEqFDzL1W0YRddL9RNMV/ZE8xrVqwxR1qC/dla41PvLt3yXwoa+HsZVQCKpFFRD1LJkhIB/HManANpXuStmJk0N9XdFM4jjsTjPdVYmgZNZge5lmoQhBWQaE9J8Usde2TTDIlAnsXdG9CD8135VcKgNf6xT7rKlePPYfrzB4NU8qoarXEaQy7w6drfVmb50psajdaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n4ZV2TYS/Sz5uJ4GyJsHjZc179l6Axd+gS/64W8dE+I=;
 b=JRiKWf4iT4a4GDDl8/nc1KiZ9MlbtTdcl5XulEGrLAcRPQjCJwsf9zL7qRLvzRyN3Sdp/F9uFUgmIpQP3QXcgMcFNxhG5ophXwonKE7vbMioZFjdvjH5PgXXGNWflwZL2zTRGG39hulZSAtbxmIJCuFkyBmdHMn2yZX3/4h652/dEcBYGaqCf36MyxhzIa/WiaA8RjpWTPXPJabPkVYusyRcn+Z/3PP4aSaBIf240vW66Q6by3O0BgOz3KxcBjZcBEJlMj2Hr6iy0Hl0J9Eq5b0AdNiLQISfbAFnTcgNkODwEJxLQk7awfEM7rUIzMX+x5TdAbrwn4c7VupNnDxnhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n4ZV2TYS/Sz5uJ4GyJsHjZc179l6Axd+gS/64W8dE+I=;
 b=ZH8qr8zwyBNZGUqMMrrTcfENTcRQm4YwbOq/HE37aw5z3O9TzchucM1iIr7SNg9UJnphezHZwVJfFz2ktgqg0h2u1xT832QwNozMjAYToVz8S8ox61hfSNnQdC0L75k+bqAo9Wa3seI25sEhJYz1BbKHrIr2pqTHKoKcuEBQcmk=
Received: from BL1P223CA0026.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:2c4::31)
 by MW3PR19MB4283.namprd19.prod.outlook.com (2603:10b6:303:41::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.19; Mon, 23 Feb
 2026 09:54:32 +0000
Received: from BL6PEPF00020E65.namprd04.prod.outlook.com
 (2603:10b6:208:2c4:cafe::f0) by BL1P223CA0026.outlook.office365.com
 (2603:10b6:208:2c4::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Mon,
 23 Feb 2026 09:54:22 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF00020E65.mail.protection.outlook.com (10.167.249.26) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Mon, 23 Feb 2026 09:54:31 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id B36A3406544;
	Mon, 23 Feb 2026 09:54:29 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 94FFD822542;
	Mon, 23 Feb 2026 09:54:29 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 3/4] ASoC: SDCA: Improve mapping of Q7.8 SDCA volumes
Date: Mon, 23 Feb 2026 09:54:24 +0000
Message-ID: <20260223095425.3905703-4-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260223095425.3905703-1-ckeepax@opensource.cirrus.com>
References: <20260223095425.3905703-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E65:EE_|MW3PR19MB4283:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9964e949-c546-4d0f-ef05-08de72c18a94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|61400799027|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZITeUDUQ+QVG9MQ0QoXernAQCzITOMnCRm1+J0ybcvO/4O09PF4qxkQe8d/V?=
 =?us-ascii?Q?uhrwXe27YgHl5K2ZspUv+P9AyWioo+XAidQguatN0fy2KDijpEJQHWwjRHwk?=
 =?us-ascii?Q?2JWbU+c/lSxy7kFCq5ZKVU7DAcUmL+zFyB1AgepB/Tz08nzmSLK81CgU+SJS?=
 =?us-ascii?Q?9HkvKU3HW6x0MtW6tx4AGzlNpstWbzHDBbwYnMgjg49QUkXEfUUbYeWUZUGY?=
 =?us-ascii?Q?AAAhspvxrgK6iytQFXNdSf55aGV3ZQMYvu1ib0k9rAWkrnKLeMyhAcvCRupT?=
 =?us-ascii?Q?/bggyP8RXJiCeac9HbXE+d0gpFPx2jXfgrIPPKPrThsDqfL1apTxn7ZxBrHG?=
 =?us-ascii?Q?7+SrsOWqsW+xYHh9JZUyA2oBngWPrkr/BqU+Cnc0u1uJ8weQe101ndPGMY5z?=
 =?us-ascii?Q?/jPl5CLPCVA2iNm5WVQLTIDDz808S8LaK/iDzRKvxTd3gPJAvDv91IfbcVD6?=
 =?us-ascii?Q?CX6b/ZCDjFXwgmz4ayuuihxS5+hn5M2IwP3XVkQZDT6tQ7oPI7ysMzKPe5Dm?=
 =?us-ascii?Q?+sn0TeLfM+0UiP0kJgq0vemItX9jyXSg5TYH27kSZkKBUwM+WcsSQVpkct3t?=
 =?us-ascii?Q?bCssQgQ/wYiQC7JlwFgABQA568OURHpw0qPA1FVRXmwPc7cu5nLK3ergl6hx?=
 =?us-ascii?Q?RlQu4Sl5WOE+o/i1Vog/bqNoMrSposHQZD3pB3ppO5uWmYWckPrnoDC3zjD8?=
 =?us-ascii?Q?YYuFkOiwoqjOYdBECNGQ17kouWq2+yS7/fzY1fFaBblhYjqemmpWdKMaR6U+?=
 =?us-ascii?Q?GUPwhf21Eh9XfZ841YQBF3PsEL9kTOSWaQvo0v0xF6D6KPXce0Qy3Iq4Jl3V?=
 =?us-ascii?Q?SNmFRplKR61K/IpVfKPXIAXv7t9sAWuxQyHGBusZQ6xnYsU5KhcXvhzCZqWT?=
 =?us-ascii?Q?psnzN44yQPVwipcDG9XfRf+sNVrjNErw7Z2I3rIms3yGEwWoRkHZ3/kgcmoH?=
 =?us-ascii?Q?cYEbfdCrDS+SVm8Ohn2dBE8YYaYNU7BDUzNQptH7Sv4Bn32YMrtYIknj3Ds9?=
 =?us-ascii?Q?AkWEU7fenvfJv5tlvk8tqp8F4NCUjxrOmsjnGmEuyP6pD++4jTmkBVZOGZLF?=
 =?us-ascii?Q?KtK0o3xKHrtAGvEnLCsdZfSNq9zdNyoJSKk/pmi1GYo3JmarnoAKgpUc0O0X?=
 =?us-ascii?Q?wiZwiwIfeW8s92QFbuI+7BKOW8v56H09OqfchPh8jaMt6qtkmr9Ps7OhdORV?=
 =?us-ascii?Q?7U18yoH7Z/8dSA4N4iI2Wg1UDsQfH0/wwVvShp2xTIdjXE4nNXFnNXzfmut7?=
 =?us-ascii?Q?R31tybpDRsQODzQQVT4QwrIIXGzTZ6cSJJ/A82x3GKmuBhat7Dg1cX7kTgvR?=
 =?us-ascii?Q?MrsaRLBN9D98y/af92zNTBzURQguCYWpZ856EydXCD2UZbSgwvJeAkobJ8G+?=
 =?us-ascii?Q?U8wGtw+V+JRug9LsiJ6+WnJcbOZ2bQlmYws5kb41ZCEBRHXoyOV255LSVLbp?=
 =?us-ascii?Q?wyVjoUsFQuSWWDNbgzaLtASr+lj0hZU+TU/t0oqXVhOIl4bsyFWw5PAQdiKH?=
 =?us-ascii?Q?cr1D05BJjk9STE0RmPJ3Po5ZjjRcLMoERrSS6V+ZvC37ctSH+K7h5d5IaRsG?=
 =?us-ascii?Q?wXsNqMwyGVwsy1lI64pyHJcZ6lP7pNBdU6kPrImyhXqAQUPvf8XmhAjVovYG?=
 =?us-ascii?Q?JUY5WyQ2Bc1ciMFs6Ru8L9L1ut6vFQNSVt46jW4Sj7zcpbOGNav9gn8UcKY8?=
 =?us-ascii?Q?N3AEtA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(61400799027)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	69lm3jZEQPEZ8bN3NMRFyv2BzU1vu/fxROxtxA4hULmkoG/63SoYHlILEB2hqY/nbGsuS7S1uRvjfrddxNXHadtlAByc8hXQcfyzjqUxHJ2GONGOw0U5e16LukHP6FykcYJXFXsceexG+mSUqHvJAPu+kurUlax6CcxKwV5HZvoOboqABTmlCiovqW22nJN8MvQo4+0FPBRe0IU/8i1hN/9ZlEqJKwgT6gUrsJhrZ4OwUDF4Pfk+wFS8VunlsiZPZB/Do2TyIBcW7a5gFBHlcKX7NnrmGnKf3Ki8vQbGuc3k2GUudfJjWlJhWlpE7kHP3e97jS4nqkviPQGhLuWWduRBSqOu/DEfC3Bd8IlwbNjRa2mv+7ZXMhzt0Yr8YdSiNMXXFrv92gteqwyIFuUKkaHVQPqvVXY+rFcl7DN1WYrq236QRcjAfaj2UysiSsct
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 09:54:31.0408
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9964e949-c546-4d0f-ef05-08de72c18a94
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF00020E65.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR19MB4283
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4NSBTYWx0ZWRfX6oP7gkR9NeC5
 oU5eN0/xxAOhzYggJp8Kt+puXDLsAvWVf7rcnur3wG/ab1cxOAH54IA/XqmzXTCjmSZncqKy4rG
 JEMocxE0jYID7g4ngPjyTUklLlkM50sNj5opVPOmLNBzonR8zECP1/pe5BAiMkdnajYGXDuBzT4
 qu0JnghXXU3nlu6Yi0fOeSm5x6a3YZiY4uipXgp2PLSF3TP/Yj24sRH4wxlpgvRqYHgwfqXx4pX
 ihdC4TKTNOmR+NX5wYcf8qvF3bAY2vQiIJtMpKe4rYePmXWtO+66AuKUyI6BhGN7FZ2j29sWhHa
 5+A/lOUxNPOEuM2UZJCtiLEj2gvOdhSDOhYjw87KUoO0qJB2BsyyopugbQlNF8CoVDKkqztprMp
 zfFIHAK6eMDXvbtWbSMkHZSD3Tzxhon4lbnsaLckITaDgkd7+uQvjjVcrChx4H6CsLXg4gFLwgE
 h+p2TWHNe+ZEUjKYDpQ==
X-Authority-Analysis: v=2.4 cv=Q/7fIo2a c=1 sm=1 tr=0 ts=699c23dc cx=c_pps
 a=L67c5INE8ymjFE86/o9Zpw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=g530hjAR1Ctr6Iqj50AA:9
X-Proofpoint-GUID: SELwx3tkItiWNtxRwBRA3-9fwXDiOeff
X-Proofpoint-ORIG-GUID: SELwx3tkItiWNtxRwBRA3-9fwXDiOeff
X-Proofpoint-Spam-Reason: safe

SDCA measures volumes in 256ths of a dB, whereas ALSA measures
volumes in 100ths of a dB. Currently the SDCA volume controls are
mapped to ALSA controls by mapping the step size and working out
the number of steps for this mapped step size. Due to quantization
of the step size this means the number of steps in the ALSA
control will rarely match the number of steps in the SDCA control,
leading to skipped values and multiple values that map to the
same volume. This is not a huge problem, the volume is still
increasing and the differences will be small but it is not really
desirable.

It is simpler and more accurate to count the number of steps based on
the SDCA volume levels. This gives a 1-to-1 mapping between control
values and register volumes. The TLV is based on a minimum and maximum
volume so still accurately specifies the volume range.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/sdca/sdca_asoc.c |  6 ++----
 sound/soc/soc-ops.c        | 12 ++----------
 2 files changed, 4 insertions(+), 14 deletions(-)

diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
index b6536eeecf58f..e6f7c2778bec5 100644
--- a/sound/soc/sdca/sdca_asoc.c
+++ b/sound/soc/sdca/sdca_asoc.c
@@ -841,10 +841,8 @@ static int control_limit_kctl(struct device *dev,
 	tlv[2] = (min * 100) >> 8;
 	tlv[3] = (max * 100) >> 8;
 
-	step = (step * 100) >> 8;
-
-	mc->min = ((int)tlv[2] / step);
-	mc->max = ((int)tlv[3] / step);
+	mc->min = min / step;
+	mc->max = max / step;
 	mc->shift = step;
 	mc->sign_bit = 15;
 	mc->sdca_q78 = 1;
diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index f966d4e13c7fc..8ae6609ca9618 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -120,25 +120,17 @@ static int sdca_soc_q78_reg_to_ctl(struct soc_mixer_control *mc, unsigned int re
 		return -EINVAL;
 
 	val = sign_extend32(val, mc->sign_bit);
-	val = (((val * 100) >> 8) / (int)mc->shift);
-	val -= mc->min;
 
-	return val & mask;
+	return ((val / mc->shift) - mc->min) & mask;
 }
 
 static unsigned int sdca_soc_q78_ctl_to_reg(struct soc_mixer_control *mc, int val,
 					 unsigned int mask, unsigned int shift, int max)
 {
-	unsigned int ret_val;
-	int reg_val;
-
 	if (WARN_ON(!mc->shift))
 		return -EINVAL;
 
-	reg_val = val + mc->min;
-	ret_val = (int)((reg_val * mc->shift) << 8) / 100;
-
-	return ret_val & mask;
+	return ((val + mc->min) * mc->shift) & mask;
 }
 
 static int soc_mixer_reg_to_ctl(struct soc_mixer_control *mc, unsigned int reg_val,
-- 
2.47.3

