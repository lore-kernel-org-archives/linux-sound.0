Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB8726B0A9;
	Mon, 12 Jan 2026 14:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768228144; cv=fail; b=iVzuErnEDPygeOThx0wd2Cbk1cce2q7NIXq4Ifqvw/robxTg9zay8pBJSneUy1D9eT92bDLqw+pWYIhxNEKDuEpKN/jYsHiZnycKRkBgxTNMS2AOM9R5Og1Mz9Ej1V6EXLcQoUbuRUYTQGyTdRZnNrk4QTPzuvYa4ktprqPPgqE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768228144; c=relaxed/simple;
	bh=5IzSsSg5GNRqQ/ldnuQAzwM99S3PC/fzwRcsIochA5s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=t0Uck+Ft7bQThaA+oZBt8HMBBGWvLOjG0npPSdFnCIve+0SYh70mo6dlxwY4Vj55KUpBrTlny2GoBsyS9JbwjVwR/TZnKWBUPy0NwYmkf3iYcHdq+fMQUGnt91bZN0PaFs5ED3cDRQnY5YtntyMhxWYCFl9eu3tE6k+edf5px9I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=WACuISqc; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=mOmwKt30; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="WACuISqc";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="mOmwKt30"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C518Qs2267328;
	Mon, 12 Jan 2026 08:29:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=6oKLJsfLZcXBtd9E
	jga7+MP0cUBkkQb4b/fmK7AfdmY=; b=WACuISqc/jAmoswovcoi43gumdjYpxgL
	OSq81cffkojJhl+AIPVuEMdHMxnnUm9QQYY0ZqggxaXqadqb7uhDlzkhNroeFr88
	uko9Aculh9M/XimOUBq37pljXHcczAos+cr/wJJFMn+lZdeFP5fSfHuOj3QcWic7
	P0lPP3zcqfN75i73nfQzkn6rwwyMAxXhKLzKiGEvKlFq6+8uxjEiwnj0p0LikEiU
	grPzzDrDOIS3FD+cApkqaeqRV+owNCRjZ+2y0iiHB6ZTGYZzEu7+87U61ZFqvtoP
	esrkvpR3Q44dmIsDMVWTbRX9wcX3Xg4TJ+gmcjwFUF1vwrsVcf+wAw==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021118.outbound.protection.outlook.com [40.107.208.118])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4bkm2n1rug-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 12 Jan 2026 08:29:01 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GofCesDtE6kXU68yOQfwLUrEhsmVPZxPVJs6W8IW+XZ4N6OPl0Wdx8g1F3Ueis1XFxylrDXecJjfzKSx9NLPqn3xgGZU959+Cql70iHKI6mVHYMpbdJx/HwUJw7r+7cOBKTRbZua2WYJbfI/Nv8bFjfb+T61x70f4KizaziQfDbvj0cgqpEDsFKA7MSrWWCZBh38q1Az3EikiV7c3MX0vNmtiKrivSp/ARzqkIpdRgWiQR6xzCArQ1U1LMuYhOrH2+zfvfAIGWAxZqHphKsyEV7+Vbp/leDG53lDWOarNIKYBmeI08ZyyQk0ekHVBSqzt7IWrFaj49y1olNy3KehSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6oKLJsfLZcXBtd9Ejga7+MP0cUBkkQb4b/fmK7AfdmY=;
 b=WhffnlwN+Xd0L8J/4hevgRkuFjn64cebhMoDaq8gFQK2H6fdD+eaBMjqMMW49QKSW6PArrx4U5h3yAqhlGuMA+0GJJyydnWIaRLFSJAZeD16rSZpe2SU+ZRHmO+XybVGjJT9SaX18oKbbZr2c+x7GMGg8jO8VUyru0mLXv8FezeyUaUyzxbi7wLVw9EidHn2tQ5m76GwWmo3EMfpS+Mz5uVm5RRz7M6XHYuoQ8dejr33emgVicd/eDHR6y47CHAsLUXfJYFMRFv2fanrEgQ0WeKYMsebAMyjZu1d5hp4TPOeuEPQpzhQzYECmtLr3mq/3/Kg8RaBU7coo+I4/JC4kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6oKLJsfLZcXBtd9Ejga7+MP0cUBkkQb4b/fmK7AfdmY=;
 b=mOmwKt302v1/o+J9U4eDuCietH+WXd9wtspqJcdeuEJezHuV383a6jh6hV4gjyQtAiwHDzRaeiwLY47eNM4D2WOtZ98QZzomvQivUH387UqZkpcQXU5Q8bJFmguNxFyyqyfnS0OQqFsEc4UuXyL5mhvveI8V7CyAGiupWfdkkEI=
Received: from SJ0PR03CA0354.namprd03.prod.outlook.com (2603:10b6:a03:39c::29)
 by DS4PR19MB9073.namprd19.prod.outlook.com (2603:10b6:8:2a8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 14:28:53 +0000
Received: from BY1PEPF0001AE16.namprd04.prod.outlook.com
 (2603:10b6:a03:39c:cafe::5) by SJ0PR03CA0354.outlook.office365.com
 (2603:10b6:a03:39c::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Mon,
 12 Jan 2026 14:28:47 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BY1PEPF0001AE16.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.1
 via Frontend Transport; Mon, 12 Jan 2026 14:28:52 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 5FD3340654A;
	Mon, 12 Jan 2026 14:28:50 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 47259820247;
	Mon, 12 Jan 2026 14:28:50 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: tiwai@suse.com
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ALSA: hda/cs8409: Add quirk for CDB35L56-FOUR-HD
Date: Mon, 12 Jan 2026 14:28:50 +0000
Message-ID: <20260112142850.243054-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE16:EE_|DS4PR19MB9073:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 1645430d-3149-4836-25f6-08de51e6e8dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jZD/KvvcxnxmT9ywUOcWDsNFANMomJ+NjxYoVVGD+yAzdBKMt7M0Vd48IUO4?=
 =?us-ascii?Q?v35hv9lpgYcT20OxEUMZvyCiILdPXyCGxuPRS+duPJ4vhNMSPXq78MVyicE2?=
 =?us-ascii?Q?3XsO3ySpAo3d4kOpS4cg0hDLwkBLIu6Qf3LHx9onk5MBGIcZd9d0F2RAN4b1?=
 =?us-ascii?Q?NMQYtv3/SY1Sv5UvrVXkr/NzPIexSVLa+dub63P8Gn4UuanVhSk3JWflIZut?=
 =?us-ascii?Q?sx8SHbzxirel49yl4kdRINuhToIwVgf7zBYnMWAcij1Mg8TPWKDoEoGEEgMf?=
 =?us-ascii?Q?TfkTBLxKUG6Jkm4QujegjIXbPaA4P7MJIncc8sbONPlGOQlfAjrzY5oueAbY?=
 =?us-ascii?Q?vi1Ixk1Nh/yowbJ80fZMdmQTLKVLlsLyhKx6kJCg+KLPPUGqbnK06jEsboDc?=
 =?us-ascii?Q?7EhevvuaeI9HAL+ivm/pE54yC4wmev4XqGG28lzg1dnbnR1sSJyDOYBrUv2/?=
 =?us-ascii?Q?n8BqerkllMcXZR4CB+gzUiOmqSALvMooqc7Kc4yj1wBUkI76xYjEXcqu8njb?=
 =?us-ascii?Q?zsZOsOb+X1RW21HpoNVigt4RDjD3BB0rV0JSJFtWLqe1WTFl9/C2hXqMYASi?=
 =?us-ascii?Q?bbBt9R/Or8WMD+aymFa2RHfoqmDkSzjWQvFkpHqbQWiQHJIJ8CLIZJLpw8cl?=
 =?us-ascii?Q?sEhA90oE2zcvObFLGCdbrWmWmLSx2rvXiFx8X2d5jFNxsWJqllkT6LLaO1ab?=
 =?us-ascii?Q?YwWGseUBmfPaPIM3FLTrMaZI161A+w1asT1EF7UDOl8rq4WGvMLzwVnU2jod?=
 =?us-ascii?Q?eKr17r4xblzwR8CXZax7LoBPofEWOnRmzBoBC1Eg4pO6+oAf4NNS9OcNB8Zn?=
 =?us-ascii?Q?sua3tDqFFPc68rgzecmZAI88+t57GE8E/8S+PZftdaHEH6GhDhuIqmYm4Huy?=
 =?us-ascii?Q?1rb+CPpsE/RIrS8jFB8XK3QfakmAPBAWy7CBH8c+s0F32OWD5q16cH1Y3AET?=
 =?us-ascii?Q?iVy90G5AtX1bGDHbbKRU1gVyeJ62jSHf7uqoQdjPE0B/PM9MlBbNR2tpAE4R?=
 =?us-ascii?Q?LkdzXduJF6EEptfLt/HzUfJ8eZ4amPW+4crKeoIEb8uw1WZUvWhRxq5oBdnC?=
 =?us-ascii?Q?M7GRpKf2E9Z377z7VzhioTJ8dOYmLGF6Mc/DPoygVxdobJJ3+7K/kkFAMhQi?=
 =?us-ascii?Q?Kz/f+O2REO0V2O9TUjM7bnAZY8yI7YSvpG3A9ai7TOehE5Ax+RiC7HCUmb3f?=
 =?us-ascii?Q?59fufi1EL9xBOQudtIRSfCUpwYCelwOrNS3qbr9+M/y5ysaM/jbqu4G2cIC4?=
 =?us-ascii?Q?NGYAZzgChOAg8ED9RVwryiQ0B461NaNUwfb7nXwXGpLptazwQbzLmXcLqZhk?=
 =?us-ascii?Q?9lgo0QnNfTLsPrCWf2dpsLjQ5TcGEe0W77se0BG8QbLmvPLYQsdD/sVEFocF?=
 =?us-ascii?Q?gzVO2tF9f7QclIJ3pqkm48eppQsM8hu67dBV2W6KxW70kc/UWT1Pq1nzsSCq?=
 =?us-ascii?Q?EEdd46tWHWM/6ZBpQKOlMN4DbCA0U/BcSmnFB9cu4x2nol8ozNX1RJ/0JpAE?=
 =?us-ascii?Q?fgjDGceeuTYr8Mo/VuRuEzadBp/cepsSuvu2urVu3G74DLAw2t/YWADDDedY?=
 =?us-ascii?Q?cc+RNbkGlpjA68CkWrk=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 14:28:52.0912
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1645430d-3149-4836-25f6-08de51e6e8dc
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BY1PEPF0001AE16.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR19MB9073
X-Proofpoint-GUID: cxC__Yj-GXa9KUjuIFROVJVg4gVvwQQ8
X-Authority-Analysis: v=2.4 cv=JZ2xbEKV c=1 sm=1 tr=0 ts=6965052d cx=c_pps
 a=M/tNFvKf9qcYTEXzCPs7dA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=nXr097QrGHVWi8yxexYA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDExNyBTYWx0ZWRfX4VlB8Cqs6WpE
 LnOnBZ0i0bSL32fN002GcXl93lbwhRDo+J7AlQtcly7xwYm/LBTpPLmU6MasEFtotkv6/OHVUR2
 fTjxPb4TcGSWiNtxDSZ3mC6iPMJ7t2Fr3It8+tTlpRlIxJbC3vKcYKwz7LP5d8+XIoWfoVWbxVL
 +sqZpjCu7C0JpdFieFayFewPPpjPC/TIPsDbzzn+wQemntUF0D2L4kXOxtqeoBuq4n9guYKqlwG
 SsBzhrsLXyjIK4eJWcSTFK5cQy9pnHs7sFuCmp/7Dqh3eFfm4Y5oMI3C2VRpdaCqI7Pj5SqbUeE
 QW843QNSxV5YxhD62bif39Xyy3ndviB2WHDsxHWxeCPLzJ1sos4V87aB80ZiOdFREU55MArTFAA
 dsfEtZKXflT//SMub2lfBSGKATGrOx5azOnU+CL3cwEmWfxZfPYWGa57UjQiakl6QwsdicHlvFv
 SEybpyaJT6rRUsmMgjQ==
X-Proofpoint-ORIG-GUID: cxC__Yj-GXa9KUjuIFROVJVg4gVvwQQ8
X-Proofpoint-Spam-Reason: safe

From: Simon Trimmer <simont@opensource.cirrus.com>

Adds quirkiness for the Cirrus Logic CDB35L56-FOUR-HD board.
The quirk must be forced by model name "CDB35L56-FOUR-HD"
because there isn't a unique SSID that can be used. For example
in /etc/modprobe.d:

options snd-hda-intel model="CDB35L56-FOUR-HD"

The CDB35L56-FOUR-HD is not a complete PC. It is an add-on audio
board that requires a host system and replaces the normal HDA codec
on the host. Because of this there isn't an SSID that uniquely
identifies this configuration. Also, the usual host board is an
Aaeon UpXtreme, which doesn't have a unique SSID.

Because of this, the quirk must be forced by a module param.
This is acceptable because it is a development board, not an
end-user system, so there is no need for it to be detected
automatically.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
Co-developed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/hda/codecs/cirrus/Kconfig         |   1 +
 sound/hda/codecs/cirrus/cs8409-tables.c |  76 ++++++++++-
 sound/hda/codecs/cirrus/cs8409.c        | 172 ++++++++++++++++++++++++
 sound/hda/codecs/cirrus/cs8409.h        |  13 ++
 4 files changed, 261 insertions(+), 1 deletion(-)

diff --git a/sound/hda/codecs/cirrus/Kconfig b/sound/hda/codecs/cirrus/Kconfig
index ec6cbcaf64f0..d7a1b619d243 100644
--- a/sound/hda/codecs/cirrus/Kconfig
+++ b/sound/hda/codecs/cirrus/Kconfig
@@ -34,6 +34,7 @@ comment "Set to Y if you want auto-loading the codec driver"
 config SND_HDA_CODEC_CS8409
 	tristate "Build Cirrus Logic HDA bridge support"
 	select SND_HDA_GENERIC
+	select SND_HDA_SCODEC_COMPONENT
 	help
 	  Say Y or M here to include Cirrus Logic HDA bridge support
 	  such as CS8409.
diff --git a/sound/hda/codecs/cirrus/cs8409-tables.c b/sound/hda/codecs/cirrus/cs8409-tables.c
index 8c703b714a71..b9ec8fb8eab7 100644
--- a/sound/hda/codecs/cirrus/cs8409-tables.c
+++ b/sound/hda/codecs/cirrus/cs8409-tables.c
@@ -468,6 +468,70 @@ struct sub_codec dolphin_cs42l42_1 = {
 	.no_type_dect = 1,
 };
 
+/******************************************************************************
+ *                          CDB35L56-FOUR-HD Specific Arrays
+ ******************************************************************************/
+const struct hda_verb cs8409_cdb35l56_four_init_verbs[] = {
+	{ CS8409_PIN_VENDOR_WIDGET, AC_VERB_SET_PROC_STATE, 0x0001 },	/* Enable VPW processing */
+	{} /* terminator */
+};
+
+static const struct hda_pintbl cs8409_cdb35l56_four_pincfgs[] = {
+	/* 0xPPLLLLLLDDDDTTTTCCCCMMMMAAAASSSS
+	 * P = PCON:	AC_JACK_PORT_*
+	 * L = LOC:	AC_JACK_LOC_*
+	 * D = DD:	device type AC_JACK_*
+	 * T = CTYP:	AC_JACK_CONN_*
+	 * C = COL:	AC_JACK_COLOR_*
+	 * M = MISC:	?
+	 * A = DA:	AC_DEFCFG_DEF_ASSOC
+	 * S = SEQ:	Sequence number in DA group
+	 */
+	{ CS8409_PIN_ASP2_TRANSMITTER_A, 0x901000f0 },	/* ASP-2-TX */
+	/* "Mic" */
+	{ CS8409_PIN_ASP2_RECEIVER_A, 0x04a12050 },	/* ASP-2-RX */
+	{} /* terminator */
+};
+
+const struct cs8409_cir_param cs8409_cdb35l56_four_hw_cfg[] = {
+	/* +PLL1/2_EN, +I2C_EN */
+	{ CS8409_PIN_VENDOR_WIDGET, CS8409_DEV_CFG1, 0xb008 },
+	/* ASP1/2_EN=0, ASP1_STP=1 */
+	{ CS8409_PIN_VENDOR_WIDGET, CS8409_DEV_CFG2, 0x0002 },
+	/* ASP1/2_BUS_IDLE=10, +GPIO_I2C */
+	{ CS8409_PIN_VENDOR_WIDGET, CS8409_DEV_CFG3, 0x0a80 },
+	/* ASP2.A: TX.LAP=0, TX.LSZ=24 bits, TX.LCS=0 */
+	{ CS8409_PIN_VENDOR_WIDGET, ASP2_A_TX_CTRL1, 0x0800 },
+	/* ASP2.A: TX.RAP=1, TX.RSZ=24 bits, TX.RCS=0 */
+	{ CS8409_PIN_VENDOR_WIDGET, ASP2_A_TX_CTRL2, 0x2800 },
+	/* ASP2.A: RX.LAP=0, RX.LSZ=24 bits, RX.LCS=0 */
+	{ CS8409_PIN_VENDOR_WIDGET, ASP2_A_RX_CTRL1, 0x0800 },
+	/* ASP2.A: RX.RAP=1, RX.RSZ=24 bits, RX.RCS=0 */
+	{ CS8409_PIN_VENDOR_WIDGET, ASP2_A_RX_CTRL2, 0x2800 },
+	/* ASP1: LCHI = 00h */
+	{ CS8409_PIN_VENDOR_WIDGET, CS8409_ASP1_CLK_CTRL1, 0x8000 },
+	/* ASP1: MC/SC_SRCSEL=PLL1, LCPR=FFh */
+	{ CS8409_PIN_VENDOR_WIDGET, CS8409_ASP1_CLK_CTRL2, 0x28ff },
+	/* ASP1: MCEN=0, FSD=011, SCPOL_IN/OUT=0, SCDIV=1:4 */
+	{ CS8409_PIN_VENDOR_WIDGET, CS8409_ASP1_CLK_CTRL3, 0x0062 },
+	/* ASP2: LCHI=1Fh */
+	{ CS8409_PIN_VENDOR_WIDGET, CS8409_ASP2_CLK_CTRL1, 0x801f },
+	/* ASP2: MC/SC_SRCSEL=PLL1, LCPR=3Fh */
+	{ CS8409_PIN_VENDOR_WIDGET, CS8409_ASP2_CLK_CTRL2, 0x283f },
+	/* ASP2: 5050=1, MCEN=0, FSD=010, SCPOL_IN/OUT=1, SCDIV=1:16 */
+	{ CS8409_PIN_VENDOR_WIDGET, CS8409_ASP2_CLK_CTRL3, 0x805c },
+	/* ASP1/2_BEEP=0 */
+	{ CS8409_PIN_VENDOR_WIDGET, CS8409_BEEP_CFG, 0x0000 },
+	/* ASP1/2_EN=1, ASP1_STP=1 */
+	{ CS8409_PIN_VENDOR_WIDGET, CS8409_DEV_CFG2, 0x0062 },
+	/* -PLL2_EN */
+	{ CS8409_PIN_VENDOR_WIDGET, CS8409_DEV_CFG1, 0x9008 },	/* TX2.A: pre-scale att.=0 dB */
+	{ CS8409_PIN_VENDOR_WIDGET, CS8409_PRE_SCALE_ATTN2, 0x0000 },
+	/* ASP1/2_xxx_EN=1, ASP1/2_MCLK_EN=0, DMIC1_SCL_EN=1 */
+	{ CS8409_PIN_VENDOR_WIDGET, CS8409_PAD_CFG_SLW_RATE_CTRL, 0xfc03 },
+	{} /* Terminator */
+};
+
 /******************************************************************************
  *                         CS8409 Patch Driver Structs
  *                    Arrays Used for all projects using CS8409
@@ -557,7 +621,6 @@ const struct hda_quirk cs8409_fixup_tbl[] = {
 	{} /* terminator */
 };
 
-/* Dell Inspiron models with cs8409/cs42l42 */
 const struct hda_model_fixup cs8409_models[] = {
 	{ .id = CS8409_BULLSEYE, .name = "bullseye" },
 	{ .id = CS8409_WARLOCK, .name = "warlock" },
@@ -566,6 +629,7 @@ const struct hda_model_fixup cs8409_models[] = {
 	{ .id = CS8409_CYBORG, .name = "cyborg" },
 	{ .id = CS8409_DOLPHIN, .name = "dolphin" },
 	{ .id = CS8409_ODIN, .name = "odin" },
+	{ .id = CS8409_CDB35L56_FOUR_HD, .name = "CDB35L56-FOUR-HD" },
 	{}
 };
 
@@ -620,4 +684,14 @@ const struct hda_fixup cs8409_fixups[] = {
 		.chained = true,
 		.chain_id = CS8409_FIXUPS,
 	},
+	[CS8409_CDB35L56_FOUR_HD] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = cs8409_cdb35l56_four_pincfgs,
+		.chained = true,
+		.chain_id = CS8409_CDB35L56_FOUR_HD_FIXUP,
+	},
+	[CS8409_CDB35L56_FOUR_HD_FIXUP] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = cs8409_cdb35l56_four_autodet_fixup,
+	},
 };
diff --git a/sound/hda/codecs/cirrus/cs8409.c b/sound/hda/codecs/cirrus/cs8409.c
index 2c02d3be89ee..61b6a15d6291 100644
--- a/sound/hda/codecs/cirrus/cs8409.c
+++ b/sound/hda/codecs/cirrus/cs8409.c
@@ -6,14 +6,19 @@
  *                    Cirrus Logic International Semiconductor Ltd.
  */
 
+#include <linux/acpi.h>
+#include <linux/cleanup.h>
+#include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/slab.h>
 #include <linux/module.h>
+#include <linux/spi/spi.h>
 #include <sound/core.h>
 #include <linux/mutex.h>
 #include <linux/iopoll.h>
 
 #include "cs8409.h"
+#include "../side-codecs/hda_component.h"
 
 /******************************************************************************
  *                        CS8409 Specific Functions
@@ -1216,6 +1221,172 @@ void cs8409_cs42l42_fixups(struct hda_codec *codec, const struct hda_fixup *fix,
 	}
 }
 
+static int cs8409_comp_bind(struct device *dev)
+{
+	struct hda_codec *codec = dev_to_hda_codec(dev);
+	struct cs8409_spec *spec = codec->spec;
+
+	return hda_component_manager_bind(codec, &spec->comps);
+}
+
+static void cs8409_comp_unbind(struct device *dev)
+{
+	struct hda_codec *codec = dev_to_hda_codec(dev);
+	struct cs8409_spec *spec = codec->spec;
+
+	hda_component_manager_unbind(codec, &spec->comps);
+}
+
+static const struct component_master_ops cs8409_comp_master_ops = {
+	.bind = cs8409_comp_bind,
+	.unbind = cs8409_comp_unbind,
+};
+
+static void cs8409_comp_playback_hook(struct hda_pcm_stream *hinfo, struct hda_codec *codec,
+				      struct snd_pcm_substream *sub, int action)
+{
+	struct cs8409_spec *spec = codec->spec;
+
+	hda_component_manager_playback_hook(&spec->comps, action);
+}
+
+static void cs8409_cdb35l56_four_hw_init(struct hda_codec *codec)
+{
+	const struct cs8409_cir_param *seq = cs8409_cdb35l56_four_hw_cfg;
+
+	for (; seq->nid; seq++)
+		cs8409_vendor_coef_set(codec, seq->cir, seq->coeff);
+}
+
+static int cs8409_spk_sw_get(struct snd_kcontrol *kcontrol,
+			     struct snd_ctl_elem_value *ucontrol)
+{
+	struct hda_codec *codec = snd_kcontrol_chip(kcontrol);
+	struct cs8409_spec *spec = codec->spec;
+
+	ucontrol->value.integer.value[0] = !spec->speaker_muted;
+
+	return 0;
+}
+
+static int cs8409_spk_sw_put(struct snd_kcontrol *kcontrol,
+			     struct snd_ctl_elem_value *ucontrol)
+{
+	struct hda_codec *codec = snd_kcontrol_chip(kcontrol);
+	struct cs8409_spec *spec = codec->spec;
+	bool muted = !ucontrol->value.integer.value[0];
+
+	if (muted == spec->speaker_muted)
+		return 0;
+
+	spec->speaker_muted = muted;
+
+	return 1;
+}
+
+static const struct snd_kcontrol_new cs8409_spk_sw_component_ctrl = {
+	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+	.info = snd_ctl_boolean_mono_info,
+	.get = cs8409_spk_sw_get,
+	.put = cs8409_spk_sw_put,
+};
+
+void cs8409_cdb35l56_four_autodet_fixup(struct hda_codec *codec,
+				  const struct hda_fixup *fix,
+				  int action)
+{
+	struct device *dev = hda_codec_dev(codec);
+	struct cs8409_spec *spec = codec->spec;
+	struct acpi_device *adev;
+	const char *bus = NULL;
+	static const struct {
+		const char *hid;
+		const char *name;
+	} acpi_ids[] = {{ "CSC3554", "cs35l54-hda" },
+			{ "CSC3556", "cs35l56-hda" },
+			{ "CSC3557", "cs35l57-hda" }};
+	char *match;
+	int i, count = 0, count_devindex = 0;
+	int ret;
+
+	switch (action) {
+	case HDA_FIXUP_ACT_PRE_PROBE: {
+		for (i = 0; i < ARRAY_SIZE(acpi_ids); ++i) {
+			adev = acpi_dev_get_first_match_dev(acpi_ids[i].hid, NULL, -1);
+			if (adev)
+				break;
+		}
+		if (!adev) {
+			dev_err(dev, "Failed to find ACPI entry for a Cirrus Amp\n");
+			return;
+		}
+
+		count = i2c_acpi_client_count(adev);
+		if (count > 0) {
+			bus = "i2c";
+		} else {
+			count = acpi_spi_count_resources(adev);
+			if (count > 0)
+				bus = "spi";
+		}
+
+		struct fwnode_handle *fwnode __free(fwnode_handle) =
+			fwnode_handle_get(acpi_fwnode_handle(adev));
+		acpi_dev_put(adev);
+
+		if (!bus) {
+			dev_err(dev, "Did not find any buses for %s\n", acpi_ids[i].hid);
+			return;
+		}
+
+		if (!fwnode) {
+			dev_err(dev, "Could not get fwnode for %s\n", acpi_ids[i].hid);
+			return;
+		}
+
+		/*
+		 * When available the cirrus,dev-index property is an accurate
+		 * count of the amps in a system and is used in preference to
+		 * the count of bus devices that can contain additional address
+		 * alias entries.
+		 */
+		count_devindex = fwnode_property_count_u32(fwnode, "cirrus,dev-index");
+		if (count_devindex > 0)
+			count = count_devindex;
+
+		match = devm_kasprintf(dev, GFP_KERNEL, "-%%s:00-%s.%%d", acpi_ids[i].name);
+		if (!match)
+			return;
+		dev_info(dev, "Found %d %s on %s (%s)\n", count, acpi_ids[i].hid, bus, match);
+
+		ret = hda_component_manager_init(codec, &spec->comps, count, bus,
+						 acpi_ids[i].hid, match,
+						 &cs8409_comp_master_ops);
+		if (ret)
+			return;
+
+		spec->gen.pcm_playback_hook = cs8409_comp_playback_hook;
+
+		snd_hda_add_verbs(codec, cs8409_cdb35l56_four_init_verbs);
+		snd_hda_sequence_write(codec, cs8409_cdb35l56_four_init_verbs);
+		break;
+	}
+	case HDA_FIXUP_ACT_PROBE:
+		spec->speaker_muted = 0; /* speakers begin enabled */
+		snd_hda_gen_add_kctl(&spec->gen, "Speaker Playback Switch",
+				     &cs8409_spk_sw_component_ctrl);
+		spec->gen.stream_analog_playback = &cs42l42_48k_pcm_analog_playback;
+		snd_hda_codec_set_name(codec, "CS8409/CS35L56");
+		break;
+	case HDA_FIXUP_ACT_INIT:
+		cs8409_cdb35l56_four_hw_init(codec);
+		break;
+	case HDA_FIXUP_ACT_FREE:
+		hda_component_manager_free(&spec->comps, &cs8409_comp_master_ops);
+		break;
+	}
+}
+
 /******************************************************************************
  *                          Dolphin Specific Functions
  *                               CS8409/ 2 X CS42L42
@@ -1473,3 +1644,4 @@ module_hda_codec_driver(cs8409_driver);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Cirrus Logic HDA bridge");
+MODULE_IMPORT_NS("SND_HDA_SCODEC_COMPONENT");
diff --git a/sound/hda/codecs/cirrus/cs8409.h b/sound/hda/codecs/cirrus/cs8409.h
index 7fe56f4a73bc..be1714a84fff 100644
--- a/sound/hda/codecs/cirrus/cs8409.h
+++ b/sound/hda/codecs/cirrus/cs8409.h
@@ -18,6 +18,7 @@
 #include "hda_auto_parser.h"
 #include "hda_jack.h"
 #include "../generic.h"
+#include "../side-codecs/hda_component.h"
 
 /* CS8409 Specific Definitions */
 
@@ -271,6 +272,8 @@ enum {
 	CS8409_DOLPHIN,
 	CS8409_DOLPHIN_FIXUPS,
 	CS8409_ODIN,
+	CS8409_CDB35L56_FOUR_HD,
+	CS8409_CDB35L56_FOUR_HD_FIXUP,
 };
 
 enum {
@@ -341,12 +344,17 @@ struct cs8409_spec {
 	unsigned int capture_started:1;
 	unsigned int init_done:1;
 	unsigned int build_ctrl_done:1;
+	unsigned int speaker_muted:1;
 
 	/* verb exec op override */
 	int (*exec_verb)(struct hdac_device *dev, unsigned int cmd, unsigned int flags,
 			 unsigned int *res);
 	/* unsol_event op override */
 	void (*unsol_event)(struct hda_codec *codec, unsigned int res);
+
+	/* component binding */
+	struct component_match *match;
+	struct hda_component_parent comps;
 };
 
 extern const struct snd_kcontrol_new cs42l42_dac_volume_mixer;
@@ -374,4 +382,9 @@ extern struct sub_codec dolphin_cs42l42_1;
 void cs8409_cs42l42_fixups(struct hda_codec *codec, const struct hda_fixup *fix, int action);
 void dolphin_fixups(struct hda_codec *codec, const struct hda_fixup *fix, int action);
 
+extern const struct cs8409_cir_param cs8409_cdb35l56_four_hw_cfg[];
+extern const struct hda_verb cs8409_cdb35l56_four_init_verbs[];
+void cs8409_cdb35l56_four_autodet_fixup(struct hda_codec *codec, const struct hda_fixup *fix,
+					int action);
+
 #endif
-- 
2.47.3

