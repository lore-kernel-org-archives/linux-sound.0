Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648543CF666;
	Thu,  4 Jun 2026 10:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780567981; cv=fail; b=ocFktgF18TEBAdfyJHYcMPbIC8TwhOX0OXjodw81CYXx2QeLB/orjYvK7+DJ3bsFEx84P2Kqkx3rgt24V4QsAsa8vdaDSUXoJNbReLUIwTtaB287m8I4QkPI7peKZyETnkd85iUwVpK6kWqeYZ2nZLPYolfPjTcxomJ/cnBOK7s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780567981; c=relaxed/simple;
	bh=boFYpTnO7LBx/YNHTWR2ezESxh38kOGN1H5kiyq0lIE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cuaV8pH3W5ILU9dXSZSfc/T/Gfhk1PSJ5yGc34y7OtccBFaEUWQHtZisfYIl7vDwWSM+EkKpLmTjBeSzn1alGiwrh8DFSDgQ11BogJzMQLNR51ha4ysg5xJzusmwSVCYXmsMSqyNZM1RdV7+VNmlNlcSAqL/3o5N/W8dJnkWujQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=bNxEJC0+; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=N0zy2zgS; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="bNxEJC0+";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="N0zy2zgS"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6543KmpW2561607;
	Thu, 4 Jun 2026 05:12:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=uhgaZGOrARoABAJt
	koO6pF3wzfRSS7TGcjQ0iGMR7L0=; b=bNxEJC0+EnTJJ3cc8lZ1UKBhktZsa1F0
	ozKEDphpET57QDgdeTymVx8CAACNcRCEhUG1GHcUH4grAo6F5v2jiS6r3O3vWg4m
	sNR74z8oLZhJ+3xnzN2TxqhK/k6tX8EWyePrmPSsdMfI4MdmIA+2A0a3b0yknbEA
	qZOW6F9X/MvsJ8AJfuGAoUUSFcFKdDx7M9Ff5BOdNvOg7FsiFGIlPB+SEkk/mmvp
	STjsb24g874ZyXRAtg9K43VHnAetITvUqHVSD1kSbEdeDqPZDWz7/xTiCDUcR516
	rTc8h0gksAb5qGCoUedoO5uo1uqUeHAO85jQhy3TcSF2nC7DACXonQ==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022121.outbound.protection.outlook.com [40.93.195.121])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4efwa17k2b-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 04 Jun 2026 05:12:57 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WyJTOof9nCJfenRLSd+KS3V7i5Lrmu4I81wLyzOAtH8zaoodTIAuRuVXi0pzVRBtLski/zZXwgWT0tCbfNxJwcbCPo6O2ve/kgKavEKIK8qo4KhhZBII5R8oKtHm99kO2drh5nA9iB7Qm2Ir8GNLDh6K74hzAFXuIS4zSZcs1c2DRiPqR4+KzLkURRyhDeKL3ZlIV63X+EROBmydq4AkyAlvqsXiqRoiChKZe+Y21TVskgdPaNcSa6Dj1HuxcdWBjoD/VsWe5ZkYpUDn0ZKd32BP8fDFynG0vGEITGUZ6i2NuWYZAAtYMve3ot9PZDjn3d9Jp3so13TLXvqxcjH4cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uhgaZGOrARoABAJtkoO6pF3wzfRSS7TGcjQ0iGMR7L0=;
 b=L6rxDVddQ9sL1A4SRQLGbaK//Jh89sn4Ar0AYoHIcWW5J8F484ZLvVaoD8pakiPIEIDN3/l2eAHR6I3Xoemqh2zx2g7plm2Hkj2OMakWEFpXnw0BS8Wdi6wpH4H3Z1WEyuNrba5D8dfX5ATDcc+DkYmgUAz3SSc5oQqRSwFWBehfYh0Bgv2OaZGhA2KHoIyONjGiK1Ud4pMF56/7Y2lftmi/4uHKTAafDWwaBjArURoXBc0k2YXiFq/Nzk+SNP6AUXVs6xzqDdl48oq20Q0PqNxrxtkerdziZ39Ci+WblMNUc9W9Mz+C2hK+KkS4NT0+vTTBdNBNo+JguCShjPEzIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uhgaZGOrARoABAJtkoO6pF3wzfRSS7TGcjQ0iGMR7L0=;
 b=N0zy2zgSubDUTLsqqvxzQwksG95WbOd3pBWwFeCC/Au50TC5v/b+63mFHpRBcl1uGXWpuX13JoLeVv5Fp4wwPfF/dmmW8wUH5YhSSzw0ZikM9NhphlL1klYmSFANJDlXoSvr7KNjVhyoInvGgINmVH7gAfm5BlfaU4qL7xgtoiw=
Received: from SJ0PR03CA0048.namprd03.prod.outlook.com (2603:10b6:a03:33e::23)
 by SJ1PR19MB6307.namprd19.prod.outlook.com (2603:10b6:a03:456::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Thu, 4 Jun 2026
 10:12:53 +0000
Received: from SJ5PEPF000001D6.namprd05.prod.outlook.com
 (2603:10b6:a03:33e:cafe::69) by SJ0PR03CA0048.outlook.office365.com
 (2603:10b6:a03:33e::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Thu, 4
 Jun 2026 10:12:53 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001D6.mail.protection.outlook.com (10.167.242.58) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via
 Frontend Transport; Thu, 4 Jun 2026 10:12:51 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 8AEB5406540;
	Thu,  4 Jun 2026 10:12:50 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.13])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 651B982024A;
	Thu,  4 Jun 2026 10:12:50 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ASoC: wm_adsp: Fix NULL dereference when removing firmware controls
Date: Thu,  4 Jun 2026 11:12:44 +0100
Message-ID: <20260604101244.1402862-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D6:EE_|SJ1PR19MB6307:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: af7b4404-64aa-48e6-c0ae-08dec221d68d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|61400799027|376014|82310400026|18002099003|16102099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	xXZO8j281WuRtHfd0M6N3DnBsj9/9UvXr/ZkIdjvBsx61avpb/gaLXljYluxyb+tA6x7Q9DrTWAKYmGwvEsngtKlmS40ujdOug3ZYd5zKJoVQEsAP0amZPsTCUO0h8O8v9Uhf7n5/72kl8iyMECjGhc7Y7Nx1PIQf+wieG7R123FFhtIpUzQwTgduO/Hg1uUVMaPqO2EYM1SKHlIHVo/wxQjK57xGXhg7in43GjjT58V5xgicQDQZu8A/T+oVDFG3oVlDglayuj/SJRt/oQu+oM40k2hPu6CjOs57CNJU1eloplOY2/MyMbIqvzZSyITA7s3pw7ND2G6fygEgF+kxxEID8SBF5o7vm0aSRSB5cMZ6UYSla0P0gZQedIf+7mPprYvBrZg3R/d6bdBN8tROANNRGdcHDNo/WpFRo+VPB21qGeJphirOQO+34vD+8hep3sqc4sy0akOp/z+W5wKe65rqHtmKoAabZYFFDWvgNrhC/7qmHaNZcv/In6uOOmLRLCfw7y9RhZ8bnTVYxpY3idYKwTJ/zurCX7ZwVnQK7Ei//gVDJLz6L3212kH29EXeoPeRx0fgOrFrQpblMZpMQXpdm6iXbOE84dBP2VAm912srlz7sCX+E0HsojKEv9/hvB540kRnvj6xH3p4q2nCfdjrffySkDFrCQMzoWSYwCdBF94Vpf7cqvYT0LJMOtsrNwd3YErBlcKz0KIaw+FR/+RGXF1djepuIghIK5yoL0=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(61400799027)(376014)(82310400026)(18002099003)(16102099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	YAUiXVqHZvUnHXlze9GCu4VTErJ8ybuvb7ROM4TxIwRs3eRW01qVn6g6kL2B8BUr+06cH5RmGyyYDOm5YhVGCsOsl+Oo13L3lmVK06efeth1GV1QekdHuCumzsK1hzLWXUeCNERBRkec0/PasJ5P11zkIsH8xQfACvEvuX0bwXjJgMdNRqlNIrVGV+Y5LLTWUcLMiFSvv4RT94vt2mAWiRQVJaQQF9jlBCOUZiLV7yOoOxLcY7Vi0EC8Z9k0M1HR0kIbE5ha5TFOWgE583gwuLyZw1HfL+b3jr6Jq7qejNCxTT6Dq02NJ+6KdYiD8ZGt9LuXHvNP6QjtzYCo/YIh0QoLNgLSNC0gEJmen71yjCdGvufdw4IazBcfJ/+5y21RSn/jLatbAfrhPlXitFvGyR6WtDENKumatEclTubC+9S5CVb88rS5MsNwLd0VIfws
X-Exchange-RoutingPolicyChecked:
	A3fMsWWYGlK7SSr9RYm3QZIYDvgcLjpCvlq0aIdDYoXioYCJD7VOFvir48yWVA4qFAM5Vad/NbFxJQDSFjmwE89do1XGM5m83RDAEOP9HsYZ3znsTLgXE+smsbQhsbZGIZYaKj4nAnkxbE916MOTcBMetMlgnyb8Hr7db0DlmYptywKlL4DncOo8kV9TeQ1ZP9c06obZh5eWYg3NIDyHNqm1W5MKOHZa7NeCY/UL1PHBIf4FHvEd6UFyxHBdLIMITcgZ1MI/plQkGcgv2nAWJynrCvxwIBh1DtTnK9PENaXcayZ28H6ro8ylkUpznPQUh9oesFpTDbx5K7vPcyy2uQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 10:12:51.9222
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af7b4404-64aa-48e6-c0ae-08dec221d68d
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF000001D6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR19MB6307
X-Authority-Analysis: v=2.4 cv=WZ48rUhX c=1 sm=1 tr=0 ts=6a214faa cx=c_pps
 a=DyfKEl/nMH7vw8kk6njFLg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=dTEy-3RDs1DIgDRvKMMA:9
X-Proofpoint-GUID: KDYUtTshFcx8M0JDMSw7gaiVjxdLs3DS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA5OCBTYWx0ZWRfX+w3ajmWtIj9F
 pLOrE7kapUSgDF+c7zc1hJWsZF/5wkljuJoYWD8nRUqDKOqjM2QOsN5jKssUZIz+3F9wJBtPLlf
 UiaUzvsIrF6ylfigz751Rrp+nxvUvUx2MZZd7wtUYBk1lgnggVWs99LTunNPJ05GnkUQtZEUS4e
 ERsSMr5vR1MlLm5OjeZKcsQUcE8QVR4RA9EZhsTqe7P059O0MHH7B3ZZwiX+HwwiMAkHFDqnaBQ
 yBzht2xjijKFh2VWALc7TjwjSgiU/QNfJ+TERMSHGjJH4LyM7Ii1fZ+GYrTSN7Cy0jOyeYgqTr3
 VViCwNfvb456AJqxEKfpuf0PpDYxJcksQ8kDm4kzEeoy+4yqkZ9hyris88dChS8WaxelDqCljc3
 fr2SnhbFx1dz5bhGQCanecm3ZYuz+/9hD7PlPBCS3OulpqadYL4OluKEplrWMCvVq/52EYWClVj
 P2mWInIOcwJydiCsBig==
X-Proofpoint-ORIG-GUID: KDYUtTshFcx8M0JDMSw7gaiVjxdLs3DS
X-Proofpoint-Spam-Reason: safe

In wm_adsp_control_remove() check that the priv pointer is not NULL
before attempting to cleanup what it points to.

When cs_dsp creates a control it calls wm_adsp_control_add_cb() so that
wm_adsp can create its own private control data. There are two cases
where private data is not created:

1. The control is a SYSTEM control, so an ALSA control is not created.

2. The codec driver has registered a control_add() callback that
   hides the control, so wm_adsp_control_add() is not called.

When cs_dsp_remove destroys its control list it calls
wm_adsp_control_remove() for each control. But wm_adsp_control_remove()
was attempting to cleanup the private data pointed to by cs_ctl->priv
without checking the pointer for NULL.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Fixes: 0700bc2fb94c ("ASoC: wm_adsp: Separate generic cs_dsp_coeff_ctl handling")
---
 sound/soc/codecs/wm_adsp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index a637e22c3929..ca630c9948e4 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -679,6 +679,9 @@ static void wm_adsp_control_remove(struct cs_dsp_coeff_ctl *cs_ctl)
 {
 	struct wm_coeff_ctl *ctl = cs_ctl->priv;
 
+	if (!ctl)
+		return;
+
 	cancel_work_sync(&ctl->work);
 
 	kfree(ctl->name);
-- 
2.47.3

