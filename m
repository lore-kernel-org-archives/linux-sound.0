Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA373EFD31;
	Wed, 21 Jan 2026 13:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769001775; cv=fail; b=NKQUntwjumdUOzxf8wqv4gcSnw9r5yC/ZilkqkBIPfUZN7oJ/nYrG5Mll2dl+twsHt5Kml4kIFzGrjqp4o2A/aTzeYXW2N/07EwtykfjQzXS+5hx2gni/WbHtAYqtXRg9EcLTAE5Lmjt3i5MOgqkmly0TBrEPAL6grsX9H5Hjco=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769001775; c=relaxed/simple;
	bh=8NogvaOknDAOLYXDBt7hSj3tsQBhc782J3OhJnRopcg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kQrfXaacRWocoku5re9DmZJ/U8keOLeOwFV8kXF44/R9NsEFLy3bqHHEl0EbUxVIbJy1+wrHwaJ3f6Bc2UjLl+bYkNMKQDm6uvopVDZey10oIBEl4y9Jy/soqqOztNXiwtOIJbMFqHivD798KJj086wm22MhMay0UKWf/Pm+a3o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=SPtw2xHK; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=yqXwIsV+; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="SPtw2xHK";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="yqXwIsV+"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60L0mqFc3498261;
	Wed, 21 Jan 2026 07:22:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=WnJdVJxscDklkH8K
	1cxBkEELEblcRwixoDgVK7OOp2k=; b=SPtw2xHK7VRFLl3CPX7ltpFlPT0sb4Di
	K33vt5tc1w9va78ovONjMuCqzx/0mwAhw+/hvLXhiwnyc6//R1WT1lcgl1r0YVhF
	Guuma9hvLGelkBtcSlmhV1/Kp9tk3OSb70XvkjUtaYXvMmwdKk6FJHvGs3xfDVr/
	w8I8Z3TQLa+WHkTSbYPVObcrjFbbX6aTK3ve14Z2Z1YStYRx9NryQ0NYREh4XQG1
	ueEvQzaAe5UI4uxUzg9dQ2RgIH//5Vo0HZTH79MhVp7uzz39Qu7Gqd/1TtzmSi1x
	8LPTCUNW89SQiL8vb+O5ldtn4scn24kF+0iLsJVmegg3oADaVVWGoQ==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11023093.outbound.protection.outlook.com [40.93.196.93])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4br7qjvta5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 21 Jan 2026 07:22:49 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rKfsr3GuQOkLummsvwIBivF+FjhXpkVdlh7SIaVegv2XvKzAmABNEMkESMwYCOFnY0uNc/osb/48Yt4o1KWcmyqn9A9qAndwrSA35wpitFCtTxPCQMGvyA7gv2HcF3NL4lubj5XZery/J5kSGWIDbX2ieeSgEb/nMzMG5WglXCfgWLrCvlRHK51BY7OYXh8EfRiAk7HJGz/s1zJ68msmk9AJ+eJvxj/g64SHPR3hGOuHl+HZNWsFhbzOzNC7JAvEsnV4ZdxXmNLoNC5F/kEjvE1f6WTP+ClXLc7OFA8uGmDnCixE97seJ3WZJ/d0Km1R3qJ+Jp1LRP1Xj1gIqKK20g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WnJdVJxscDklkH8K1cxBkEELEblcRwixoDgVK7OOp2k=;
 b=aR72jbLQ7tJuYW9ZaoQOjoqUkqTWg5JZyRcRLz4p66hQOlhmdsjcy7SH3SJtIDfsxgD0gaOShDjzBv7zGKNjdvoK2xuOd6fOCRH9o/dcDRM1n9yuMRZoubEo6+zjVHAHb3ZTfI1k1az70ZX7D4XgWwi7dBwrXMWhdKn9IeXE1QVVOM11CxOj9OEIPNRJ/PkcKA0DMd6M16q+Ub7+iBNf88+gdJ9Y5wfNB1na6pgbPn0Cb0mIHpvWgt0JWVF1gc0gTa0zaMNOULnxH2InV4hAz5IvLMuCkQ5BUWGlUpp/pUZRfykdl/QokRnNzj3CoxX3L1lMosnyWD6y51lBeatmtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WnJdVJxscDklkH8K1cxBkEELEblcRwixoDgVK7OOp2k=;
 b=yqXwIsV+BFge6bGkFU2NaYU4GQDYaVeQ58qC0tqr+Wk252xJzLKd0z3zEEtcK4x0xuyhRVJm8TBDxAVGXAhcZGtLf2W5fSyTgo6NdK3JxVLwS1NvWdITjriVbdqsR/umiJACBqmUxNbCvp8C+4keBMPp7UtvnNn8HLYej6gutc0=
Received: from BL1PR13CA0241.namprd13.prod.outlook.com (2603:10b6:208:2ba::6)
 by DM6PR19MB4121.namprd19.prod.outlook.com (2603:10b6:5:24e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Wed, 21 Jan
 2026 13:22:45 +0000
Received: from BL6PEPF0001AB77.namprd02.prod.outlook.com
 (2603:10b6:208:2ba:cafe::a4) by BL1PR13CA0241.outlook.office365.com
 (2603:10b6:208:2ba::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.2 via Frontend Transport; Wed,
 21 Jan 2026 13:22:45 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF0001AB77.mail.protection.outlook.com (10.167.242.170) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.4
 via Frontend Transport; Wed, 21 Jan 2026 13:22:44 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C16E4406540;
	Wed, 21 Jan 2026 13:22:43 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id B5059820249;
	Wed, 21 Jan 2026 13:22:43 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 0/5] ASoC: cs35l56: Add support for new Dell laptops
Date: Wed, 21 Jan 2026 13:22:38 +0000
Message-ID: <20260121132243.1256019-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB77:EE_|DM6PR19MB4121:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 371c6404-dba3-4564-0ebc-08de58f029bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|61400799027|36860700013|82310400026|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2oZFrBd7PVBx5e6x9O9mV6IYkWMh54/wUx7mhP90FrYGfh7lWm/jCR/wwMOo?=
 =?us-ascii?Q?I7dRUznXlim0cK8D5ziiwDoTEHYTVH63kyYxBPSBMoiDXy7jwvdB62Xj9Ydx?=
 =?us-ascii?Q?QorevMn5iGhNSLxkWwxiIElAbStprmTMRimUWLtcb1AVvPtpQfACD6cHEB09?=
 =?us-ascii?Q?9I4u5cXd3mejP75qT21ZwI4T9r8+0VrPqm8bweyicVtQSG6bWOgyCbOfQ7gq?=
 =?us-ascii?Q?/SO8Z891wp1THCzBL+3Dqx9c0G9jDUYE5nUnGoF5puiehIuuFBNu/uaJyNsw?=
 =?us-ascii?Q?wnP3IzASUWnn4/kkR/A9Un3CHqfnhj1dfQn1oqsfNl181DsDIYoJf94smyaq?=
 =?us-ascii?Q?TPe2k8Tp49Pc4wsO8MqHeG4ht6oQ3Q8VOaXg5/jmtfozf24th5BbqWZ2aZ+m?=
 =?us-ascii?Q?IELfvWH5JNoY/c9whkrAg+WtrQMFXxNPgIg+8sCragR/g8h0DYXQtW51ZBOM?=
 =?us-ascii?Q?rjQLERPtHovOezFOmi7Y9BMqJq3xuY0JH8xd2bMRLUMSJj7WeQCe8x1b16Na?=
 =?us-ascii?Q?ulfSH9RkwKb9mYcYAQ2iFgt/mygP2fdx1hxB4o6VI6rQrW1eA8kY78CUqkSw?=
 =?us-ascii?Q?0/Dk41TugNeXW4NuOFaTeaEL+xGAuM9ZPbQO30+lVEsZjg1XHwubJXGQwuWi?=
 =?us-ascii?Q?gTSQxrt326ajbWTz+SphhJB6O4nyU5tqwUk1esAIQIaytaLjzB8ZC02jpaHy?=
 =?us-ascii?Q?hxGa2bQrV7nyZjy79SauCLwcmgPQpisuVmf3fX/IRcXIxVLu0FDbWoy757Kg?=
 =?us-ascii?Q?fLaXt2f3hDNXcxkzOuZvRWOHHvr6d9W+pvhMAFp7zyFUkTlD6LHwzcvz7o1I?=
 =?us-ascii?Q?cusvvH0TKKcADdujX0n4p6y3A/C/4vhEWADIXcqxIbS8BW13ji8Pni/NYd5j?=
 =?us-ascii?Q?3Pueq2mOd+mk4KJXTGonyYrton45YwiyUgZKPm4vT6kfAVFCgFKpHC8bH7d4?=
 =?us-ascii?Q?i9eZvQOGXT3B1ZpONqxq3UJMvNhmsuSh9ihoDND5BnLxsMyFmOW6UrIAnaHE?=
 =?us-ascii?Q?Xk/Kk1bsFg0DwM/6NmDCXo0TPsGCx2hur2b3i+fqW9mPIL4ZvLBpOSMl623F?=
 =?us-ascii?Q?C6M/O4VQCk3QQphXXG6U90X1cDbKXUMUxYhgBSCo8ThJigBHfzqsqIq5Mkw+?=
 =?us-ascii?Q?dNqyUhgyD+lqy58eLm5AGw6ZgmWeZL1/JlpfbrsGJPzxjdohHGGz7CUB3RLa?=
 =?us-ascii?Q?1WjHIRhwZKvh0Hro3ldCHK44sxpf+153ohlE3IV9jyFIzc9qMKVR2WyNyQq5?=
 =?us-ascii?Q?Fy566V9aO8+iPFxSotd76CxRi4w0UCt6xZTfLFXIK4XVURUh4s1tmM7JOIUZ?=
 =?us-ascii?Q?ANe4LT6Wk6qOZ8NnlhcUwBqcx6ayAgGOxWZ7BRcnJHv1u4vrrK5D7jyAiLJc?=
 =?us-ascii?Q?cFX9ttorBUbrmN8OBfFGTs31GiRcRuFPmYtF6WdRsBJHRGrYwBiqUZFF6E5p?=
 =?us-ascii?Q?+al8w84anhuTeeVs7kNpAH1oKZMytLh9kCOrpB6iPwe6x7NJgYwBOF/LY0j0?=
 =?us-ascii?Q?z4WPASJjpupHVy6UvV73vKDE1IGnm03F1VxjXChdyXxH9A8HVrN+RDEjJmpf?=
 =?us-ascii?Q?x34iWxZ6OCMyHeAQiWFHj7F6nUY04kJa1blCpccIi2R1lMKPN00BRz/D6vbB?=
 =?us-ascii?Q?bFUd5DpR1c1SkVAcPFM+xDuFjXEV2qXQ2+PvgSRCCuD+c/Aywk83730izuA7?=
 =?us-ascii?Q?Ere4qA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(61400799027)(36860700013)(82310400026)(54012099003);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 13:22:44.6649
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 371c6404-dba3-4564-0ebc-08de58f029bb
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF0001AB77.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR19MB4121
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDExMiBTYWx0ZWRfX6dD2VE9pA7p6
 bbXmjjlGRwaG1h/v3bry/KROVB/a7a8jn2gB3lJsk49w4csfu5EeJ4yHD9DC/fSFCTTYK9RZXBw
 LkoV5mH+lsGTqlPPmUUph3PPGvhtdw+1ZhQxZIaAAo3gHrjUddTxPu0H2lnoUrqYBhlpdZzuhir
 a0CMUUqfPsM2YRV74XhkjsnxEhFDk4B76uGRBhnivykGQVG6aOEwQiNjfTpMuImftioMfD84sEc
 NKMsfNhaQIywjAj8ru7KPIuzdKEe+d3CyHbFPXD7H1jV81YVVdMEu3LvT36FRJ12Ogp/Dr72RgH
 tKzirsX0xKGdVEC1ty5GXxcmJ8dC2j90BqSZ6dUfEZm/YhXew2mIAdzmq3mKMIaqFN8m93M3oZB
 dkWXjv2AUaRxcbUITXhgoXhMwJT7ZrFLISf6BYdbwN0VUFRCd4TrwEdUK1Y9SOAQNObN1sB4bAq
 Bn4E+aGi5781dANCjAw==
X-Proofpoint-GUID: mMcvD_UZ0GkWkqXtykBOUUQajpSrHdxi
X-Authority-Analysis: v=2.4 cv=GrRPO01C c=1 sm=1 tr=0 ts=6970d329 cx=c_pps
 a=0mOrEJ06uaCo+Tyi64Ng2Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=_MW4D8evzXUMaHk2zocA:9
X-Proofpoint-ORIG-GUID: mMcvD_UZ0GkWkqXtykBOUUQajpSrHdxi
X-Proofpoint-Spam-Reason: safe

On new Dell models the driver must read a UEFI variable to get a
variant identifier for the audio hardware. Without this, the driver
cannot know which firmware file to load to the amps.

Patch #1 and #2 are the new support.
The other patches are for KUnit testing.

Richard Fitzgerald (5):
  ASoC: cs-amp-lib: Support Dell SSIDExV2 UEFI variable
  ASoC: cs35l56: Use vendor-specific qualifier in firmware file search
  ASoC: cs-amp-lib-test: Tests for reading SSIDExV2
  ASoC: cs-amp-lib: Add a Kconfig symbol for enabling test hooks
  ASoC: cs35l56: Add KUnit testing of cs35l56_set_fw_suffix()

 include/sound/cs-amp-lib.h         |   3 +
 sound/soc/codecs/Kconfig           |  18 ++
 sound/soc/codecs/Makefile          |   2 +
 sound/soc/codecs/cs-amp-lib-test.c | 169 +++++++++++++
 sound/soc/codecs/cs-amp-lib.c      | 131 ++++++++++-
 sound/soc/codecs/cs35l56-test.c    | 365 +++++++++++++++++++++++++++++
 sound/soc/codecs/cs35l56.c         |  74 ++++--
 sound/soc/codecs/cs35l56.h         |   4 +
 8 files changed, 741 insertions(+), 25 deletions(-)
 create mode 100644 sound/soc/codecs/cs35l56-test.c

-- 
2.47.3

