Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214D226AABC
	for <linux-sound@vger.kernel.org>; Tue, 13 May 2025 10:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747131869; cv=fail; b=aDPa8YOMHu3hxWrGpMCjsb42DUVlFG6BXR2su2Z/fMSVrSLnLBdghOdVE7ovcPVVsukPgtdigHE2Zc2pqpS7sn8ujXwtR48oUzG66t23O6LEayhsv1o99J6v24QW/Oxf/nmM1OOmdXPPikNi40Zrjqx1cFmsOECFdZsqoCaZ8QI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747131869; c=relaxed/simple;
	bh=otJhHLmbvn11owZ2cTtxJLeSqoU6KTApiNjWdiSfvoY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pJCxFD9ZjG1NLhSBQMMjW9xvK1z4kGjNuY02uIxuLn9Zsnu1KMfCZzU8yjBb7f5AQ0f3URFD+hjBjfR6SbUwmjkFsCSMi4ILLBK3p45yuWnBB+WVDneVi8vAORFNADCy6dcQaBdY8i6RwVoArJyLGgEKHSDEWGTibZqemt1D69Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=YuN0ibHU; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=jw0mLL1I; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="YuN0ibHU";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="jw0mLL1I"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54D4XDK7026343;
	Tue, 13 May 2025 05:24:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=o5WhV9YIwb02p4ky+R
	O4rkYrjQKxHoJZ/t3u8jmmIFU=; b=YuN0ibHU6hg12NSKCgauhTAJuMDMHc+j0c
	eBkCIHT9X+7Afs3nTUsEYlh5VNlZ6udO8IfX25C5KXB4G786nPRYjoLgThR6Hw9E
	22Ig9WGc6QMZ3nPwpaxG6uaFVj0zFz4Z6AoTWDVyHGZxCuI5mnFIBhqwxIomvEUj
	har6JzS/DNfq6O7SSjYzagFkbV3PA8yF7n9Md79uv9xjVFntn2FgUegF67MfF4MB
	Cm1KBxNvZsytREddntZ405XWfw9FX7o2Vf4GPXN3YSyLL3vs9vf7xTSPLUVo8sl7
	Eyc8hf2srdAhzDMZQvWZI9r6r4HRT1lPaLCprdPn2LTGyr0vYJvA==
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2048.outbound.protection.outlook.com [104.47.70.48])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 46kjy0sb4y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 May 2025 05:24:16 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XjAypfaX/RjBzJ56yqSDzPpmg47een4nMSne22DBBqZfniixQXlhjKlb/Wj41CzMMcVyB3YyOYGw2lp2F+RjF4rl2+znRs6AaNTOsvFt7Qv85wqYktM8wqenH+TxB106AbNsqpGt6ixjvo5ZneS997dOtLwUF/jTyeRlZMpw2YumkfMoDcJTkUarh1ZfgtzhXNwLMwaUwTZCX9hrty+bwfmVTBpk2uhFOE5mS9EEoeWx4F1M65L/RzIWXjWKqRBUa6f8wpQJrhrSyhLTmgzm8EmT5/1CfswfEkQhicRLP1H7Nv/hZVR1ygFHYM3CW3hsf30h809AYEepFqNPmVgWWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o5WhV9YIwb02p4ky+RO4rkYrjQKxHoJZ/t3u8jmmIFU=;
 b=egY7FFzDE4aX3zEG+6SaWjA4yubuYfjfQSpX2ivMH10v7jOzLbOiE81jVc6S8RKbRD9+Y7o1wljSBF+E7KYBftG5wI8Kb7UOtBL3oz6DoSN+ONhN7iwCyBiOq6xaphP+hnfapZeui9uPsAoIRBmyDAUyvTbkVWKUmpSkdIoROo8r3IF390xhjUj37KmDfC4CV55d15mdSJYLAR7/sHAgkCZmbcn32KYdCcWf3HAuVqwiI5tEGWMrlUy5LQarKxy6bysJKtKykRUrVFeJQgcZWClYQNYr54XZAQPfjn6y9XL422fZrRLU0OCHLIEXAfFWG+T4BFAYZ9RBj5BrXYAksw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o5WhV9YIwb02p4ky+RO4rkYrjQKxHoJZ/t3u8jmmIFU=;
 b=jw0mLL1IOqJOyaku/MMJNUayPeErRnSGw5mGY1qCOX9IzksRAALOu7DLqVGNwabkzpsWnKhN73N5AvQE3hRKDlZcMLjRimoCqMoRarQQS1H64ukctuVK/3BMClSnKSJl91lnBgSJlmxaDYy8wHCeuzQm82gljJxfbuZkFPCxt7Q=
Received: from BN0PR04CA0124.namprd04.prod.outlook.com (2603:10b6:408:ed::9)
 by PH7PR19MB5487.namprd19.prod.outlook.com (2603:10b6:510:13a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Tue, 13 May
 2025 10:24:12 +0000
Received: from BL02EPF00029928.namprd02.prod.outlook.com
 (2603:10b6:408:ed:cafe::39) by BN0PR04CA0124.outlook.office365.com
 (2603:10b6:408:ed::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.25 via Frontend Transport; Tue,
 13 May 2025 10:24:12 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL02EPF00029928.mail.protection.outlook.com (10.167.249.53) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18
 via Frontend Transport; Tue, 13 May 2025 10:24:10 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id A08D7406545;
	Tue, 13 May 2025 10:24:09 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 8AD8B820244;
	Tue, 13 May 2025 10:24:09 +0000 (UTC)
Date: Tue, 13 May 2025 11:24:08 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: broonie@kernel.org, lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        peter.ujfalusi@linux.intel.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH v5 5/6] ASoC: SDCA: Create ALSA controls from DisCo
Message-ID: <aCMdyOugv7tbXJ5I@opensource.cirrus.com>
References: <20250512124240.799509-1-ckeepax@opensource.cirrus.com>
 <20250512124240.799509-6-ckeepax@opensource.cirrus.com>
 <cd574985-e434-46d9-91ff-a2782c6e8eef@linux.dev>
 <aCIsWP1Ac8WvX11n@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCIsWP1Ac8WvX11n@opensource.cirrus.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00029928:EE_|PH7PR19MB5487:EE_
X-MS-Office365-Filtering-Correlation-Id: dbf420aa-a3df-4e88-967a-08dd92084d18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|61400799027|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FzElCm1NB6xT7ixk6rNJTOvArMT6qJXrlGVy5yZhyvJxIckYVCdfMYd1iizX?=
 =?us-ascii?Q?QqEsO3s0K8wqre+sfJm2TaXPC0sMFGOkL2WS/jTYKcd3zwL/2zeQ/k64CoN7?=
 =?us-ascii?Q?p3HTaElUiXTX55WjpaDnhVmb52dwLeovccoZmcq5kwYNBESLPL4FTmAkdw5w?=
 =?us-ascii?Q?oUZ2o9+qeYQUj4TK0JyA0ay0BY9GCd+ztJp+kGY64cMEYgVIv/e3rm0KsgMM?=
 =?us-ascii?Q?xqUUhhbNdpCbpVMOVIaCVvhqucbkMxvVX341+9DSbmNSrglm/AQ7VNYGtADC?=
 =?us-ascii?Q?E379bloBDqP2DiKcWdTfoZ6xYaUUZ9HVJ5eWOkSIP/LmOGRI03ZBxpMEAEZX?=
 =?us-ascii?Q?1/OAwncW18BkX60BcvVMG2UHdg3jav3gEYY+M3Y/b7qoaPsR8/gAcuFXuDOI?=
 =?us-ascii?Q?eOrldd5IhgqyGtPOYCpy3qrwYFy5oVq89qQSrNPQ5k7nJ8Q975SiKbWRxrJw?=
 =?us-ascii?Q?/8S6K2kfk0ZweRVJAthON2WtQDjnL6K80BHxAfzbX0R8HMZi2nIQUP8QxPT2?=
 =?us-ascii?Q?UoFQLTMXObvAfwg1hzCS1Ta2MQiTyvdM8K0tZyKD/VDNz91bHA+ircR5rLr/?=
 =?us-ascii?Q?oSEp+PPbLZ+uNnvsliXpMW4ouZjwBaJRprUfQ5umWIeQkMhBAeOyTul1Bp9n?=
 =?us-ascii?Q?aewWVkoK0vGGt5md1++vDuMOUeX88+TR4fJeUKDCymi2tUCuHVGQTbUioRje?=
 =?us-ascii?Q?ubqlwPw4YS++Ixy9x+5rWF1ZZwRyyHSJzo36/hAAa4oFz+LxXf4il5QnCYjJ?=
 =?us-ascii?Q?h0iFgmy5wc4WRSOCEk/wDN1ug122OwskxSoSmZkDcpNNM9KV/Wv4+MylRsAu?=
 =?us-ascii?Q?4isPjdt7jIW+SxwzLJdInBLQLO6ENdeSCHW+zZ38BqTewgjIgQtH9+MyYS9I?=
 =?us-ascii?Q?ZrWJdUBklY/YtgjFTXZj8kvClKrRBidRe2hFJGuSk9GI8Ik3offavsnW8dFi?=
 =?us-ascii?Q?tZPco4ts6LlpMy+5RMx6y/jFFFeFy0NisRTER4M6+pq6VvHcF3570M4qHx/q?=
 =?us-ascii?Q?QNj36x2QqTLJu2Rn4ORidLu6U/R3nQ0TfI70sxSLWyY8UwhT8VXXSCVtaOU1?=
 =?us-ascii?Q?XiU1khn8HO6XgGI6SDwCyoIG7hgWYmrBpUo16xkua6pPno/+Hp56HArNEUeA?=
 =?us-ascii?Q?DqRXupPSwXsevfc6yQ1dfY+iIfNVIEFd+ouAQcLN+uFwiVvToFgIicx6xyyL?=
 =?us-ascii?Q?Q1/IM1TPJ8dGVCjkKF9mgx6ICxFJAJjl3ucF6O/CyXAzSZyQ/xRW7/t4tlAi?=
 =?us-ascii?Q?I7hzIa6sOX411s1Ao322EKBPsXI2a+zVMJSFcyG/Lf/dZsaFHA2xGjfWc06x?=
 =?us-ascii?Q?X7ad7uucgL+gBvk9ZxZ5Mhshb1P1d5tJ6Cza9m2Y/KI0ijBnLxQS9NpIXpLh?=
 =?us-ascii?Q?dblYenXa4drb1acvF01jIi6shVTu242npkWWZbhrWrL80PF6K3+5NMc06Iu/?=
 =?us-ascii?Q?cOL11dB7N+FJcKrd/u8N6SR/DQJ1l8VniTUfYr9X7wKncuaGTubDLUmaMh7w?=
 =?us-ascii?Q?XzneQN/1degqvf+ItHH6Q2SakCS+dMX0g3eN?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(61400799027)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 10:24:10.5259
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbf420aa-a3df-4e88-967a-08dd92084d18
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00029928.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB5487
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDA5OCBTYWx0ZWRfX/Dwtp0rbJXcE oIUlGgxloy+9k7q1CHXuUPDme9E2jDV2Caq95/lqXxFKzW/rZnZukKE4vhJdQjJVm0QhBmQ9xZm zkMtFjBBE1oJdc3Vb7rQpM8XZ9oA2Y+JWTfIhhupkqatdDBfYmqhWmfiwIWDlKtbSFB6kP+Dmfr
 Gp9cLtgao/WTqLSa3Z+QAkVMiDokiWOKyUMu1Lh59T2M8NVx66QOtuTmMAJboSsIMT+ADq84vcV XjPbc452eFZj5ueUH+ffEM0VjiOHGkDySn+O2yxtMO6tI6WrWjm3xMV7iNMQtF6zgqKu0zGbWAq ZepPdDrTixsowI2uIIBoN6+SQFacZXs617hW4oGpenQNnfrZWK+5bGQHWwRt6q6oifkzioSlPj9
 qiNYGiKUTT5uQK13mfcGLTVgNoYugnwPWQEqT+xDnZ2JxHTxcXb59NmUYAcSolUnDeqXH6iG
X-Authority-Analysis: v=2.4 cv=Lcc86ifi c=1 sm=1 tr=0 ts=68231dd0 cx=c_pps a=PK5aExQQjalka8oDlC/sVA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10
 a=RWc_ulEos4gA:10 a=MDZq-8n6YjI6mNipqT0A:9 a=CjuIK1q_8ugA:10 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-GUID: -okIS7QbFyL2AfexbZHCwUXB6zXcGd1J
X-Proofpoint-ORIG-GUID: -okIS7QbFyL2AfexbZHCwUXB6zXcGd1J
X-Proofpoint-Spam-Reason: safe

On Mon, May 12, 2025 at 06:14:00PM +0100, Charles Keepax wrote:
> On Mon, May 12, 2025 at 03:53:36PM +0200, Pierre-Louis Bossart wrote:
> > 
> > > +static bool exported_control(struct sdca_control *control)
> > > +{
> > > +	/* No need to export control for something that only has one value */
> > > +	if (control->has_fixed)
> > > +		return false;
> > 
> > why is that? It'd simplify userspace if there was always a way to
> > get a value, even if it's fixed?
> 
> Well mostly it is because various things in the stack get
> sad with a single value control you can't set. If we wanted
> to change that I would suggest we add a FIXME. It isn't really
> critical and I would really like to get more of this class
> driver stuff moving, it has been out for review for a really long
> time now.
> 

Thinking a little more about this user-space is going to have to
handle controls not being there as different controls will be
exported across different parts anyway, based of which options
are implemented. Also we have seen a bit of people hiding
controls by changing the access layer. Although sometimes that
does result in things that are technically not class conformant
but they do work through the Microsoft drivers, so we will likely
need to support it anyway.

Thanks,
Charles
