Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C83F313E36;
	Mon, 23 Feb 2026 15:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771858985; cv=fail; b=NGDduA0U/cL5OUStELIBJruEbQe+92NjIkm+unNiS/PzylwbVVIu2LAQLWhhaz4W0VXcKXoantOluQC5GLew0IQjqgGWYJsZFwVFgBvXuhG2aPzKjjW9mKzPhP1gDtby9bZ3LykUV09QDcf3mZ0gs0ocDXtXdctSoTdkxpQKHIY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771858985; c=relaxed/simple;
	bh=z0lF4F86theGOwGyUdzLnute2t3X1xTtVZ46UPOygng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JPW/PdPrRGybWRnBx9qsdB6qUU5RC3+V/KLULUiE9tlFbmj3KdrERDYbExZFLCAgp6f/gwB3OpOZ8VQa++WZsPi8w1eRJv7enCcVLH42948w3tpM+RHedsGxCgfiT5mSEYxwTb/0Ak3Jq2uQ5x7PjM3HbfqbJMj2LR2/WYENTkk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=MWLzQcIA; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=tVApGEM3; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="MWLzQcIA";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="tVApGEM3"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N4f4kg980569;
	Mon, 23 Feb 2026 09:03:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=Ss9tkKxyGz/d+J+HRs0Dzxuvx0MUjy3TFyVw/Mndo5w=; b=
	MWLzQcIAhOTq67p0hI/BMhpDERJKw9M8SsAGlGSAaDSlww5Q1/6M8sy+wxCHeSrD
	x8JGop70kk2ftEOEzzU4veaCQFzpICLIlY5AIwqmM2/fvkG1H7vqTEazTZxrW0sE
	RsRcHHDGPGTCj+BXoIiblWdn1R6ZNcfA7H9O+VjOoh83DyOW80/vjoUbpI1ehKRk
	JQiB9m7a7qWBMew/ZqWfKknAVgPgfdvRMPKOlyoDTTyppUYqo4AtcomuWfwdcYUW
	Y3AbqD0LY5lfGjDQ28HxrHTntjJxw/bniaWO5FQd5F0WoB7UbHYqqGR5SQTK3dG0
	x3cGftmIFf+VdPQaVZO6rQ==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022109.outbound.protection.outlook.com [52.101.48.109])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4cfb019mxn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Feb 2026 09:03:01 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L1gSYWSyzEtr9TXsOhTM7VatnZKhb6QuJS1bv3uqWMkA4GK6+tXK95iPQQRw9qPP1dIEKNY/ttt93JzdWRCVwh+G1l5/O9KLhSn5ImJv9/RaYo5pCF1yUIpjrA4fg/+vuDcPrF7rmJRShkmCzHd0CKNqNz2GBFw+633JuWfavkEfYngwKfQUbMFYwAAHAzh7cjjfF8aY76VJu2YTotMT/AHvqIS0Ln1BUWNeLDb6O5TnCRCjqvgYEauzFGQOot41rT2+SEx7ekKr3lZBpmYXj0e4We6MPffM6XP4LbXj/Agz70hcWTRcyC7RNSdtOesEzNdZV7I1nnJS9T422ptlqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ss9tkKxyGz/d+J+HRs0Dzxuvx0MUjy3TFyVw/Mndo5w=;
 b=VHYrpAp6VtOwcxo73PT4PSL7ZVYgA+WJYjkeLcqESVpvuFiC1ToJdGHExHhpD5gOa7DpQOtqt29LX5OBiG4wI1KUQICUxP2iw5aGmDszK+1ZW6nxfuIo+ujosdjKzPvUmQDtC8UdhmOibyVw48I8NFFFpXUFSTcwabn3n7g+G7rXKFlUPDdIbS/DE+0s/3CyDwFw1ckVXATJyisfe5HX9Tq6eXxNgM/uFpP+gidX0SLsretQ1xab8fMNGB5IdFTOJzv8DZx5JmKAlnnXYih5NFq1tr32/doyjCHfV1LDTzPBiw+kr1RwnDbd3vdw2KMJW+FdHBaDChr+A2ADXbvRsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ss9tkKxyGz/d+J+HRs0Dzxuvx0MUjy3TFyVw/Mndo5w=;
 b=tVApGEM3GKx+H8jatcP4Ih+O47fKNsWx7K5NPrlsJpqvYV/D/q/Z2GMuNgh7orYlUNHpfWQ+Csou2h6+k3EbilwVa3MQR6X+WCcTO2wiHOlVRagk8SKhZUH1t0ZYty0B8jD16oS31tji/Y19vhQuW6vZJhd6V8xq7W662Q7dMSc=
Received: from DS7PR03CA0223.namprd03.prod.outlook.com (2603:10b6:5:3ba::18)
 by DM6PR19MB3835.namprd19.prod.outlook.com (2603:10b6:5:24a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Mon, 23 Feb
 2026 15:02:58 +0000
Received: from DS3PEPF000099DB.namprd04.prod.outlook.com
 (2603:10b6:5:3ba:cafe::16) by DS7PR03CA0223.outlook.office365.com
 (2603:10b6:5:3ba::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Mon,
 23 Feb 2026 15:02:52 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS3PEPF000099DB.mail.protection.outlook.com (10.167.17.197) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Mon, 23 Feb 2026 15:02:57 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id A4800406542;
	Mon, 23 Feb 2026 15:02:56 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 8A6C9820257;
	Mon, 23 Feb 2026 15:02:56 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 1/3] soundwire: intel_auxdevice: Add CS47L47 to wake_capable_list
Date: Mon, 23 Feb 2026 15:02:54 +0000
Message-ID: <20260223150256.326143-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260223150256.326143-1-rf@opensource.cirrus.com>
References: <20260223150256.326143-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DB:EE_|DM6PR19MB3835:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 16758657-d45a-4bba-48ce-08de72eca179
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|376014|36860700013|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cHzMdulFtD7/o7HlYgCnLZmxZmqZiOyQduL4mOnNABT1GRNRN0vXr74V1qY8?=
 =?us-ascii?Q?C0YTvh0PlKKIHCYRekoxIfkNT7L8eEyHaxjsLSiViHpOncwPjvZDkODCZIte?=
 =?us-ascii?Q?Fx2bdjrSTBXx57nFJVD+FBE2Ihpt1jdWmU3E+gFiksktiWGMRn2H8kUI1UfX?=
 =?us-ascii?Q?GOMLG2Vk3cEmhd/5egGOgErKyfYfLF3dIk57DJzydz4qzmM9vw8yKfE8I3O3?=
 =?us-ascii?Q?VrxHaCSlJtlEuqzSrX88j8+VRE/wSnW1ipOGBu4xdUJjA4kisrBUwe3uqVh2?=
 =?us-ascii?Q?Lt8kXs6NlLCweESDbGx6BkM9X+3+bWGdePl7rR1qk8T4/8fsr+FhM41m5bvT?=
 =?us-ascii?Q?FS78EO3aLkIA/W92wZXmD4bnOQQ3R7ZOdtZr0jA9+OmIK29mBLGk4bbku2PR?=
 =?us-ascii?Q?bo/ObURNIJmvsY5TR0QA16fsHS8/XPWmJTLl2RsWb/CZIl206/spEZmPY0nI?=
 =?us-ascii?Q?/OzLdIZNopEsFNRznPdE5TFB2QxI8MoL/7mUaLqPDpkeOuj3Ohi5qApkbEpf?=
 =?us-ascii?Q?bLR13Wvfl/tiWpT7+EvJNb+zrn6gGk2GGmXiZjbKScKouhTler6uCTgwmGCa?=
 =?us-ascii?Q?Zd8yXhWPo7q0W0DCc1O17341crzW16/++fiJvaG3ZUyepsHJ8VP4SJZ3oZLE?=
 =?us-ascii?Q?pIhUdPpbPZjVtmBQNW2/v8sR/tqi5PJrulilA1fYFn1OeOMO9P2QkTwtO6+Y?=
 =?us-ascii?Q?DE7yhiU7v5ZrZLHTM1vFhm9Kbqyd5jY29JvAtFg1LvoY1oIbRJwFt5WAKZPL?=
 =?us-ascii?Q?CjEuTdd0AZu4W5b4srB+Pr3ARoi6C4u9QXglw5l/zRbMLo0y7qfUp/5km+cC?=
 =?us-ascii?Q?SEUUzoGQJ2yZx01KgyhRb/PtrnGzU1NNHIWvcz7nUHQQLo5wklvDgkbo6fLe?=
 =?us-ascii?Q?XCLWUegwW7++/o7nDqRd7dkOJxUneTPwhcxBJKOGTSx6AwaxUG8pvB+Lf61G?=
 =?us-ascii?Q?yb6OXH0TNXDI9RYyDhLWVj4xfiEmzc9Gsxc7NAA2Pca1Z6LgCs5ENFWGIsGb?=
 =?us-ascii?Q?AbHy79zXGA/dK3bZoiV4SKCwerdn0uUB+2U2aJMo0D3GE+vIyn4NrT8Pr/Bg?=
 =?us-ascii?Q?dvsLobJvOnI39Qhm06zWCoqNie6Yj2wd0RGcXs75pLnjbEm1hT1xSRyzNcnM?=
 =?us-ascii?Q?sP9cA0d5O1oUjSAi7n91ij6yNejQ67PR/SNCqqyPfplXyfyuH/Lb5VyGyIHI?=
 =?us-ascii?Q?THYqM4tfyJwFQlAblHC0/esg1GQswEftO5JAzZi1rJLpxkoB498MCs9SKgfS?=
 =?us-ascii?Q?Bypy1fDcGj3sDN4oZsWcM3grq1OGt2o1HnVsxAGoIJ5izsTnPbBTYfVuTopN?=
 =?us-ascii?Q?1RF7ZhKSXlSofO7EdUYQuJCRbxXE1M+YOhPsQ/nPSGuZFB46SILFNuw9K+EW?=
 =?us-ascii?Q?ayEalD+h7MbkH+BJefwOzwvm5eTw+J31H90sIZ1oNMANTYC0cFYu8CDPf5dd?=
 =?us-ascii?Q?WcWZ7AWtjBiWdq4nh0cZpL9xzbzmOJT15UjspTTdxhjsKYJw2YbkA4+nD9Fq?=
 =?us-ascii?Q?LvqjgkfJlIqTtBFlIGy3OzUse6qR7J7Xx7wXmxAV7ppMb4LTqeZZ095FAFX9?=
 =?us-ascii?Q?FI6Tbr5y8W3Xap9cE0H8YZKnpR5Vhqbj6i5a/ZR20xTpQ/MsFW4526Iul7Am?=
 =?us-ascii?Q?R21WqvrG9yBLgdOE+jnYAbAMzn+O0Jg7tOqVo0r7bBPPXviIMPFor0U81Dpr?=
 =?us-ascii?Q?dLnQ/g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(376014)(36860700013)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	FVYSynrSXp7pKbgr+pUf8kb0nEYyJcASZu1hItf8EI14b/2YtFraNP0y1NO5zu8yU5CaoRHxCnOJL7Cc+JJW1SVyOBJ4ki2fKr7umjWjmScKc9uDScoxjbIJKiAaU7szZcQ8gELY2ijSiXtDLZsHjVcuAKZUAI9ZHslcHVbB48WQm8ZUAehPOn9CqILczd4fMfUrwzRgseXicd5dyjlyJxeqdCXtavD4iMNkJ5/f9Vne1E8dkR4NepPs/qEIajAMK0RlPDQ2RJ7g5L6J9z8ysoeGTPze7jFa62GQfSPm8wEFaSg9NtJ49pTnS0Zgn03xEVmFsxLpj7rSP0gQXE8TBVLI5AjLnccOUNE/GWt0IieMw8Z6YPiLFmdT6jGaOuJuMhDqqDrZH5KfB2aaiESIz0AfjOOLLznyaVa5CfZFS8I7v2BjL8R04+uQVydnkIDx
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 15:02:57.7383
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16758657-d45a-4bba-48ce-08de72eca179
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS3PEPF000099DB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR19MB3835
X-Proofpoint-ORIG-GUID: vS1nxV_U9_tOyeZPz94YN1QxPorSHsnY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDEyOCBTYWx0ZWRfX0QlOfBr9OE5K
 77XwPvCRqPL9h/WKxOxK44+qNr+rtZeP8/H4m/KHUg1MkJ9QE8pqTm9Ly5NsrrBMwtmldvPu74N
 +dRwl8mQeyMN+ybfDdbAavNTmHX30QVGIqAwNzCN6z5omuS1IvTdhzHw1grtY11UHHR1hT0RlL/
 FuAPJzq4p6/j+h4njOYWwkhEbQkxOcIHYiQLnwvncSBV+Fb+7817IhfqyIdkoszKmtFvvw3K6YA
 O9GE7ea5/gCBLeVvyegIBQaVrz6X+xlKY1UdgxeG97DtcEKWIoYIRoEUGZGsvUd7anG3oT2NIT4
 AZlDsNk1kymGeAteKqC73WSnmIdx5AraP5LTfB2OvgaXXFpYakGACgFHP1a1JhkeXQNyQok7kRW
 iuJPCQjmkkRa71PMZgKeYwz9q8iBvLM9dfvIR518dnUI++Sv8MjXbKW/h235yAr/OIDOktdaKij
 p3nARP9ViTA7MUqoMtA==
X-Authority-Analysis: v=2.4 cv=V99wEOni c=1 sm=1 tr=0 ts=699c6c25 cx=c_pps
 a=d6SuDfCU3ZZz3a5uGz2bWA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=vmxGoAGNsa9OIgSPdicA:9
X-Proofpoint-GUID: vS1nxV_U9_tOyeZPz94YN1QxPorSHsnY
X-Proofpoint-Spam-Reason: safe

The Cirrus Logic CS47L47 codec can generate Jack events so add it to
the wake-capable list.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 drivers/soundwire/intel_auxdevice.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soundwire/intel_auxdevice.c b/drivers/soundwire/intel_auxdevice.c
index 8752b0e3ce74c..9b92ffdfc73b7 100644
--- a/drivers/soundwire/intel_auxdevice.c
+++ b/drivers/soundwire/intel_auxdevice.c
@@ -53,6 +53,7 @@ struct wake_capable_part {
 static struct wake_capable_part wake_capable_list[] = {
 	{0x01fa, 0x4243},
 	{0x01fa, 0x4245},
+	{0x01fa, 0x4747},
 	{0x025d, 0x5682},
 	{0x025d, 0x700},
 	{0x025d, 0x711},
-- 
2.47.3

