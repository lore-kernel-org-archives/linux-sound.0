Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072733BA256;
	Mon,  9 Mar 2026 12:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773060354; cv=fail; b=UE/YcuNe4XqOcIYv3/O5Bwj2bszqH7f27uy+2S5mb8dQ47MP2w1syhez2s/slH0MNarJ7HbIBOPd0sy83AFWR6mLhOvY91gyzslXHcGO5EPEaLEtRwc1QptnrGWZCC2EjxBW2NpEw8aZTUrhqRMVun78OuNUjg5mzyahJXeC5rA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773060354; c=relaxed/simple;
	bh=7FwWhCec+rMASWMECxh+NMGELt7Eyiu/COEECFmnZXg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lg7IITH7HqDwcWt9TQVXM5gijQMMisj6bP5CrdkCFK/msN9aM3KPjuEp5pDKjn5g+mk+WN4LvIb/+j4BRSa7DSDux2YK2cUN2nHycx3Drtaq6fH1YeYhncPi/mfbI7EDyIZoL+qvCu3D4U2bOpV3UJtTvG5tzRbE/5GAutN/VKs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=f9YQ7dvu; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=aIPKzXjM; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="f9YQ7dvu";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="aIPKzXjM"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6297UJkA984806;
	Mon, 9 Mar 2026 07:45:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=fRVcHgIr5lwe+kud
	Q4kouuQRQrXGkMauLW86yC6La5c=; b=f9YQ7dvuu9OX9SNnvDqSuuWl9Lm68X16
	YSlNoccNfAdjoyj4H42Cu0uW5xQk9AtC+fUMI4tAwJrNYanB07QudTNDqw06YoTf
	ByyrOhZPLhtJMNgORD5lG5sGXNp85IFPTCIqgdFwm/gplnRVGSuLX9hDWAhQHmFQ
	ULzgt/53+YaUkpuBoFkua1ouLWeBBV4ONjLjORfzRprEOPZuR+3pL3l4BtVEwSQE
	HtO/Rlm8Y7C7JJu1pAsj/l0Q1eugjMkhxkQVzAmd0Fd4wM1B+12PtwBq0l1mN+7m
	mKbI9L1/3/LB5TsmiUVpjXFsAGfa1bvwVvBFpSIf3EK2flY2GoxO7g==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020116.outbound.protection.outlook.com [52.101.85.116])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4crja49rq0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 09 Mar 2026 07:45:49 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BOLWPvE3LKSxUSfS/OsgD/vXxlwEdlWNfKxos4nk8ne/b0ux3u90fyLdrVlQq1F/MWIHJh4lYHal7Tbyeo4fA3nK8owa4QR+1pGYuZ9EH56OOSMEH6OWY4rJWWXXiQueqUugs2FO8qoB1pTnxapF4u/MM0AVj20KFjcdP09WEqfFgZwCT2pXW0yjD7yjhDlcZkK057qJiIyV26x2yY+B5CbFakPLRnwb44VbtM6XKmv/SVSVknOfo/RxYJAAa+CDp4hhVUCmhAciwZihH6jlVRJ5EN8wiLsnnT/leDFeBOPLYkar7uRhrmn+/S7lde0Ap3sm+2QbntNj6K7WPEfmeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fRVcHgIr5lwe+kudQ4kouuQRQrXGkMauLW86yC6La5c=;
 b=iJ3ZDei0JsjlvstWpEAx9DlxCeE/4WBHUNyYXeSaJVNaSSj1EltxtD1D68f5T0tWfh3MZbnpfHmzoZzwc4SZ1FOxxlH5eZoYp6r1N7phRzAGCC1fAD5JIdo/CfiYh2ETCVXyAsLsw9N7f/bYtkK7wgwa6nrfOyTpRPSxtDSnldRBn5SRgou3bqfVvgNHuJ/rozhl/HkpSpw/7Ywn9yCM/Gx3ttvhH4cMtZhCiKybY3ocpvWFb+4z+qRfLHKIpi4X1z9Sg0l6rR7MgE1f7qRdMweEDu3K3nb6yw5BWLLmUdMhUxBZy09XcGkFfU9XnYY3wCynPRyILCPldTV+E2xTrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fRVcHgIr5lwe+kudQ4kouuQRQrXGkMauLW86yC6La5c=;
 b=aIPKzXjMVfIkJRv1Ugxu500XzhHtSBIuXIzaBPJc9aaJ5U2zHaVNwyz9PZw9xwbRycgwRUUD90rrA7DG9uAOYeAEvghUl8uSlCNY0VgBqWhSMAt7Sts3abmjzwiACuzm3+4ey9F2Fb5GLxlPtiJHy7TOY3cfOgmxf2qa6UetL2M=
Received: from SJ0PR13CA0037.namprd13.prod.outlook.com (2603:10b6:a03:2c2::12)
 by IA1PR19MB8977.namprd19.prod.outlook.com (2603:10b6:208:592::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Mon, 9 Mar
 2026 12:45:46 +0000
Received: from CO1PEPF000066E9.namprd05.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::d2) by SJ0PR13CA0037.outlook.office365.com
 (2603:10b6:a03:2c2::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.22 via Frontend Transport; Mon,
 9 Mar 2026 12:45:30 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CO1PEPF000066E9.mail.protection.outlook.com (10.167.249.11) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18
 via Frontend Transport; Mon, 9 Mar 2026 12:45:44 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 98FEB406540;
	Mon,  9 Mar 2026 12:45:43 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 8B2A5820249;
	Mon,  9 Mar 2026 12:45:43 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ASoC: cs35l56: Put OTP register defines in correct address order
Date: Mon,  9 Mar 2026 12:45:43 +0000
Message-ID: <20260309124543.1135247-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E9:EE_|IA1PR19MB8977:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: dd153d30-d168-436a-6b05-08de7dd9c823
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|61400799027|54012099003;
X-Microsoft-Antispam-Message-Info:
	3yLJyyJcbQWNAz9ta/qUp+H9sPJc2OpePWAIaAIFMPheLRYvV94YlZqGbr+bysOvEieSO30qpGlIfB2BuJXNzBCidMZjDMyzJRcZBHV+fMHs6tOZWilGBfk6vNqile9lJdvbKLeD3R2DE9yvEX7S1LWyQFqZguTZQK3f21mE3rggDoA0lRbeOpnU2EHSK+GODeQIpvVV0ldW8CnDwjWze6rq+ti/Us29kphLOPRCGeHlb2dgfIiPiMye6ZdpEdF9lrpmGZ0HdJGuvfs2N9YKpcsXbDtcWiF/ccg+xC2GaFK5MmhiVery1GyOjG6qTJ4nigR3SmxcymPUdKJ7R+/S3NKca5R+JwHtn9wfNuC8vbfr+2+39aly6jc2mOFjKkyGRqZBKasCFtiK2wUJsGVcFmLKFXvOw1pOfdIYoVuO/RMx/zCjZ+C57Gykm6eNWrh30LSXKHlRrgr8hC4WDvQZ0XM7mmCzknyiOuxdG9CTSD8lTTrrx6ACh4m+ffpd6aIbZ9GPyu/Z07d49SMw0TzP9uUAyttXPL3wPxGp26BEZBnE5aZtTF7h/Yx8Qt3u4w0V9wLY7JAwzFfD5hLzpiquyqtj2lA/lD2mpZUVlyubj1yO0upm5oczCoolMkzV0pC9MO6WyzyCYsEbO5xBp/4cs3JN+f3XAMcsMjCVACK3O8EGNl9xXozUoq3v53orRLisBxmQFZy/oAGx55nZNqWBmclD7lOuLPhzR8ZU6S0W+wQK5SsaAYfwvu5bES1drFdB+hX6ZHv+y34F7hOIRQ+wWQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(61400799027)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	j7ngbFYE9HBpk1prfLOp+lQ7a9RXuNGk8YLCoZYwMgOs/f4bwKXzri6s+sExXZSDAF5qzVPZw/jarkyYkZnEJkZyVmjHP6itIFlJZBSwa2grfn403qYHaT5CL/i8fm/leF09lCl+TFUBcC2FdgqcgRLPnc5mCnwUaxVxEPXYhZcNvvq1JD72caof3oPbni/cy1ItOSw/gpuqn+TSQkEedrVEPx+UIDdNpKnoXdLirueSlL7iEkr7wM5xqaLtOzdOuHn3kkCXn3Ox3yktwxzKFTc8DbglP3pfKirAacCRn2w7anOTAUQGfXF1IGCoW3EDGhNNIc4dOFFfB4CRsppqfnuUYAs9PX4Jg+9LsPncvY5lN2luCFW63YzgnszRrvb77fAtzdclWdh8NP06/S9Gh3JcFjePDvCqYnKqGT7YPgb4uO5X5oOopJLto+6DLTVp
X-Exchange-RoutingPolicyChecked:
	Lh+l3E18qAGJ6DUnMIedeOMrj1VWPUITdidJOAlt8RRx8NTzcvxLLLC4ldwXxpFP26xWcY4SplLBvzE3bueZBJ9H3YtvXqTiqU7ko1jzFH98ArRm9I9ZNyJlpy+sGrApLe8P2VxELppCgHU/kduIA4woBQ02MOjDizbJVgBTtDauv2Qn2G6t/NYWJlMdebQVnNS2laYMAavTIjZMd8ybB/EydFMpZvuRJD2G+cALX4nH/HWLmpW5v2GDTQtltgbUoOQtt72UNwEeRqDrKuBfjw5bctH21XIw0aDTE/5S0pl2H6Jq0w5FRNQcHpVOlmbKrW7HEvB1DJ0SBGIYrhfreg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 12:45:44.9047
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd153d30-d168-436a-6b05-08de7dd9c823
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF000066E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR19MB8977
X-Proofpoint-ORIG-GUID: aGjmYvSHW6n9NSG53rM4FZ5hhJWEd2fh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDExNiBTYWx0ZWRfXwGn6IrA7yG5D
 BTtyI2/RgTqkR3LfovkUSWLmWm+fSfiAyW6JT2GgtSPT4XXuPDtLGmjOQVXflRtlOFbbZSoFAa2
 WozomqJssQdV/032J7Xa1qHvREsQvN/Dnq/4CGfFsmaiJUdXaCZeyOZqp4lLm07giIcMBLJisfk
 /bVUrbZzpoarZyowoaGuCPW6L85VdpSLcTM6/Fv/LkG/34HgWtp0O75ynH6jxrDNMejoN/K43xO
 RIBSd7pz0voKj7YdJgveMBqMBLSSXuWdM3hyGgFvxs7qQVQyqleNiKVEpDbqcfEI1Y9eOPXqQOp
 NPhsZYAS24TvBe1vBitasp89vftqv4xuuBOCeq2+qZ6YR1dhG2u1El7aRyaKADZFWb3PlSiZ2BQ
 GNSj6zZLsvPBk9muyy7SOEUbh/rI73GwvmEj2Fd8YHq5mKi5RyQTJ9gDeO7c7bc/cMrnynS8khe
 XzbvOYINax8lCcZ7zVg==
X-Proofpoint-GUID: aGjmYvSHW6n9NSG53rM4FZ5hhJWEd2fh
X-Authority-Analysis: v=2.4 cv=WNVyn3sR c=1 sm=1 tr=0 ts=69aec0fd cx=c_pps
 a=/2nJIMlxEBAz38jMsEt+9g==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=F3IwD0-GtqOCRAb2zP8A:9
X-Proofpoint-Spam-Reason: safe

Move the defines for the OTP registers to keep the register defines in
order of increasing address.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 include/sound/cs35l56.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/sound/cs35l56.h b/include/sound/cs35l56.h
index 28f9f5940ab6..7ca25487030a 100644
--- a/include/sound/cs35l56.h
+++ b/include/sound/cs35l56.h
@@ -32,9 +32,6 @@ struct snd_ctl_elem_value;
 #define CS35L56_UPDATE_REGS				0x0002A0C
 #define CS35L56_REFCLK_INPUT				0x0002C04
 #define CS35L56_GLOBAL_SAMPLE_RATE			0x0002C0C
-#define CS35L56_OTP_MEM_53				0x00300D4
-#define CS35L56_OTP_MEM_54				0x00300D8
-#define CS35L56_OTP_MEM_55				0x00300DC
 #define CS35L56_ASP1_ENABLES1				0x0004800
 #define CS35L56_ASP1_CONTROL1				0x0004804
 #define CS35L56_ASP1_CONTROL2				0x0004808
@@ -86,6 +83,9 @@ struct snd_ctl_elem_value;
 #define CS35L56_DIE_STS1				0x0017040
 #define CS35L56_DIE_STS2				0x0017044
 #define CS35L56_DSP_RESTRICT_STS1			0x00190F0
+#define CS35L56_OTP_MEM_53				0x00300D4
+#define CS35L56_OTP_MEM_54				0x00300D8
+#define CS35L56_OTP_MEM_55				0x00300DC
 #define CS35L56_DSP1_XMEM_PACKED_0			0x2000000
 #define CS35L56_DSP1_XMEM_PACKED_6143			0x2005FFC
 #define CS35L56_DSP1_XMEM_UNPACKED32_0			0x2400000
-- 
2.47.3

