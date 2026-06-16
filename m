Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1463AE6EB;
	Tue, 16 Jun 2026 23:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781653035; cv=fail; b=nQCciBoRhZASBLSMnxZDPbCWWJ4AtiRBJ2CG+oU8gXLKE2a9OCxiVGgXA0qzWzxnRh/+Yk3gDhX0gOE/HAsDBA99JptE0dCqxBhzW1Log7hvjPXk4n9quljaCZP4FOheU3HXzN2zvXRvMUzqDmHLibCYs0ZwArokTEMjZxKUu78=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781653035; c=relaxed/simple;
	bh=3MDwBiiNDjGAXMbPMKhqUM0EKskKva5Fmb+EJXIYG34=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=t5K+guT01l7x0EIuwl6PgkPceJWPYAjlsYLHVLEJJ7iexrPBR+ke03MLpFhZUmteZvbyvaZTmRrpxdAnrDrjpJciXpNHu2WKjNdhvYEG/FznO2pgBNRKnmXkGXeAAMjygTmqlOymkTjbJiA6gcx5We2n+fPLhASlerd7ZQtdzdE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=A3+cAHoK; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ZcDq8eiG; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="A3+cAHoK";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ZcDq8eiG"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GLTPbi187772;
	Tue, 16 Jun 2026 18:36:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=dWliB/wNeKl2Z
	LugGtEcYfRqQIHHifupCvfIK4RzzNc=; b=A3+cAHoK+VfvdsNAkoIPm5sbFiBdx
	sLO6tomzy2NOSM+7Tm8NNQBa473aspprlwkry7KPRyci4RcG/zHcE9bJGWejXx0m
	afurh+SaocAQq7LNawq6xm/QQl8aqiMzBbyU/0KHFksmYZUlsnZ5PdsoArglgFOJ
	rngSi5zcSyRlZghzc4cCFKnPJW+1rEGk9TL1ySPqwErd2kZn+bWmhTeAi1GuIzAS
	tVM3YEe13zbuUavKaQS8Ok08oEfFxmQ4gYprw4lnJVef/gTknpKBe2268ECOs4V1
	rG7bnyhe6xgU1lL4msCCBV80yhPtXTYJMy8t90yxO+GDYeC0gTx7Tv9oQ==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013071.outbound.protection.outlook.com [40.107.201.71])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4eueeu8h08-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 16 Jun 2026 18:36:55 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vc/fn1rNtNNrpqVX4Ys3lJObPiPQiV+txdYkDLLhSUcRg3EIraVBoZnLOAUAIXJwvdX5Hp+G3UQkaoF72q2mXvdYLHQbM9t4QN+NpTifoFUXbIarvs6KmRKc0NrU1XRrzKgl37k+egtjkgQOFJ3CwmP/HQPidG3QFKCsBkaazaj094m3cmBzeXI9BZPdc7vq5BCx7IWOGHY5o4oTKQwNCqJhbip/F7vsGRIE4YvrzBWnm9DBAXe4gqPcHgpiDEessqZYHsmYhtYGvffglvvOAWC3ncWYU+psww5wup0CPePn4UzhwmBYfl0YGwV0rbGe1ELySmjUCPL3Z1tFsBXSJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dWliB/wNeKl2ZLugGtEcYfRqQIHHifupCvfIK4RzzNc=;
 b=dbchih5jQ4CHq5idBOSQLY3fpmp6tQavZjAp0nt3/TrGzyK7ZZk0bKlJJSBeTM/N5S0I8xItX7VD93Pdl0p4l1DjcoJpmL7KUJlgncWXX5OZV+BqV1nYNCW2L3oJ7aNiPCL05vxNmo+6jsmpvjjIsIn1XHf3o4W44Ij2TJAe78W6DDr/qRQOVruiEq7L+GGUxa20XNt7AlB1rwLuSkXm7pNP2euZHQhwDdsQBBQu/ed0Rpn4SKHZVlQ/bdvZdykjvpGgGlQ+CAUAmIlJURN2ZW8Nnr+4syarOZ7dnb5pDMQMIcKRlJhe0LEJN3YbQIpvA4AGYuqpfMm7Y0buxjaBRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dWliB/wNeKl2ZLugGtEcYfRqQIHHifupCvfIK4RzzNc=;
 b=ZcDq8eiGoeFGmzUp91q3zW/nu+CsbKEwZzkwxFIEVdag5gSctEQrHBkJikihAmCflsgAPM5SxtAj7oudZVXRAoZn3nrRgsgWuzwjh7cGsN7RusokZDa3pW8V94uAiTGKa37BlKimaPzeGjwqS/G3yklt/I23Gn8sK4N+hYCp6AE=
Received: from CH0PR03CA0322.namprd03.prod.outlook.com (2603:10b6:610:118::27)
 by DM6PR10MB4378.namprd10.prod.outlook.com (2603:10b6:5:211::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 23:36:52 +0000
Received: from DS3PEPF0000C380.namprd04.prod.outlook.com
 (2603:10b6:610:118:cafe::56) by CH0PR03CA0322.outlook.office365.com
 (2603:10b6:610:118::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Tue,
 16 Jun 2026 23:36:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS3PEPF0000C380.mail.protection.outlook.com (10.167.23.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Tue, 16 Jun 2026 23:36:51 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 16 Jun
 2026 18:36:51 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 16 Jun
 2026 18:36:51 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 16 Jun 2026 18:36:51 -0500
Received: from localhost (mz02jj9v.dhcp.ti.com [128.247.81.246])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65GNapB31070714;
	Tue, 16 Jun 2026 18:36:51 -0500
From: Sen Wang <sen@ti.com>
To: <broonie@kernel.org>, <shenghao-ding@ti.com>, <kevin-lu@ti.com>,
        <baojun.xu@ti.com>
CC: <lgirdwood@gmail.com>, <perex@perex.cz>, <tiwai@suse.com>,
        <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Sen Wang
	<sen@ti.com>
Subject: [PATCH] ASoC: tlv320aic3x: restrict CLKDIV bypass Q values in dual-rate mode
Date: Tue, 16 Jun 2026 18:33:22 -0500
Message-ID: <20260616233322.873081-1-sen@ti.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C380:EE_|DM6PR10MB4378:EE_
X-MS-Office365-Filtering-Correlation-Id: fb93b96c-53bf-49c3-773d-08decc0024a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|376014|82310400026|1800799024|56012099006|5023799004|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info:
	rR9dLj5JXEPw/SlSVhf2OpSUvVNsZPxIsxESHsqH5f11gubjC8yLvKs4V/AvGHNI9zusFcrKlOm64xO6V9s8xY4BJXlA0e2E+b4jww5hV1Yy7A2vkYdmxHW2kH6n+DoXWhT4P5Lg7kkROe9vpH+DDOQtQvYnP7tcMrP+3mPE7HZYEh6etd9PfeBFpsg72uJfJrZ1zhWLuI4kLjr3+PIsPZQngcAr+CbriOiTp0c2LF9Sqze+A+4gqRr0yqdHum18h3PwGv6K2zAIEXpui/rugjRJM7mqDGrJ6GAGlOTnDJd+bv/VNkVyK+Pj8nxwhfFrhvu6hSiMOr86xnUTGq3N3u8HGDRKM5MrycsyAwvX7oMSHwQl2f1WC+Kk/RM5vUqCiQ0+97zPbjAI3jcUOHFOI3X+Y1pX7Ytcu/jfgeIEUMpFQcEXwjjLVEnS6cYL6xHgXm4uOmR9IQmY0zbFt7T0nB37o+9qY2twn47acuBhDGQEaVwYOpda4GEnqipGJf095D2u/6ER9prrMrm7XUIKhGJVEWYfhco94Le5uLPxbPX1DATdfe/GNJXmLQURVLKHKyepEhwoZLbh2wGOOZi/Q4OBcclUG5DvfYf0PSi+60Jw5GKajp7RGgSRJHDnLdEHMY6MLXiUmIb8P6FnFgplqaKIsJcLkauaXTTw12r6Mmm+KSeGqzoeOg7cFbHVbmm2UwmMK//P4sjNQjhBQIaGC54btL1MGOXCbyE9Hqix3AM=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(82310400026)(1800799024)(56012099006)(5023799004)(3023799007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tq1hOfLZ6PNj9J6CqShcmsFPQVtNjV/mU77FOO3PKnC+YjK3xXJcsBeYGMqYZMX7iFHWZ0a7MnDdkyWBEWe/yRzmRVj/N5fhKpM/ii/NtX7FX6FXJEnFHevCW99xWcYDGheFRcxQxo5muMCwCrwg7EqbKf9g6nhygcMWGDydgPvmOZpiylo1YFZRr0oqQEADK8UbyG8frS5xbXxNLWPN/20j7ePoruhJUnOzuwczSQiu4EQLPGOSX2U6uOmYf4vW/BKbJlCJ/+OJ2Ds5bm70GZTjmdsULOU5lfQQImEq4qMPnSpSSfok5GRbSlMd8J4CiNiEwr/r0Xh9ube0kshBD0mEX9IJ6fbjY8CgHwOfhPqOlY00oZJCpc85av3j9fxqyN4v2ntqdjcA6VJ/0BikGpRi6ZIBqOtjepY5J2ltE0/bAiM1/XelIjYgo4lj1frE
X-Exchange-RoutingPolicyChecked:
	K8R4esJg979PFjWzZbCsdVtZnnIGwSITta0YpSQuKzWLWgKAEzETXBEjpHI7uVE3V1Mixb51/cK2sT2AUlmpxVOa7pRSLh7dMLaL1rkl3O7rMCyoqP6cugqSCPYTnt/6isZo28jNcu4s71EJuHTK3DkMsbYDp5dio2PXQF5kCQTCIU3XGbaiwBsE+0dd9KIPs5AJ1eziEw1ffVnuwZUhP+fcECCmNv5nTJssv6j7uS/OuoMpEHSUFDgPBzyFncm5VFNiJxFROKOuTFnYUOS3WibTEOLwdIxdMlnhM4u6PnDChjsU0ZT5ocBnEU3aGbSCEOB5ZMDZpCk7piuzUml54Q==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 23:36:51.8909
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb93b96c-53bf-49c3-773d-08decc0024a2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C380.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4378
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDIzOCBTYWx0ZWRfX+I8c0EefHJdQ
 j6IHgcA+5vet86wwV+CQoVPeVxVsiNdIgDBQ/J8lhq5HkrqP67WJtHIDbgpVakg8pQnwFgl4yfT
 3GYwbyJ7nf0s7FgL9gSklraIDBAmrHQ=
X-Proofpoint-ORIG-GUID: wSIntBRboaZbfNRkVZSRx9Aa54WSWMwE
X-Proofpoint-GUID: wSIntBRboaZbfNRkVZSRx9Aa54WSWMwE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDIzOCBTYWx0ZWRfX6DoNCUwaaxiq
 dJLjvuXHPpbdi9ZU3uHSRv0MG1NnjSyIEeri3NZjfFw2JL07vLJ+yIhs/nQGr7id8TsB6z9t1NJ
 Mclgve2DqbEvjQPXYhd89hM9LJbdFimzSiMU1rwz/dxEPy9eqe8jKtX1aN2Va2jEHCM0dwWVwTa
 grSbFh8g+GhzPhUGaznhO2NWX82rRrkPN7DVzXm12oxRy86vSMBD19KNxVxlCNDwSUHyFRLcaum
 xiQWtNxOr72JG0O87TiUDM2MRmOaGrZkmn/GcIfETR0xWQHVr7uAI7LebCZQBtHtuSt6Z1m7pxn
 zziIGEvLxKYfhiEkm55iAVGufJMmH/DYLV9nso1FmuGOTGA6i3VlapVH9xbSf9kMzq5odxwFWDP
 74mqn3dFICDhAvRdcvrbg6k+rAN+5g42mXRQMoop0O3gchcSCSSD91sIty6ElXwVz3JtEFSeFXy
 9Dj3O/DdXxbawq23VHg==
X-Authority-Analysis: v=2.4 cv=KdvidwYD c=1 sm=1 tr=0 ts=6a31de17 cx=c_pps
 a=eHfeAi0ej4loD7KcX6Y+qw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=xl2lC9WySoTkB5sgvgEA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606160238

The datasheet documents that when the PLL is disabled and dual-rate mode
is enabled, only Q values {4, 8, 9, 12, 16} are valid for the CLKDIV
bypass path; all other Q values produce invalid bitclock output.

The existing loop iterates Q from 2 to 17 without this restriction,
causing silent audio failure when an out-of-spec Q is picked.

Restrict the Q search to the allowed set in dual-rate mode.

Fixes: 4f9c16ccfa26 ("[ALSA] soc - tlv320aic3x - revisit clock setup")
Suggested-by: Mir Jeffres <m-jeffres@ti.com>
Signed-off-by: Sen Wang <sen@ti.com>
---
 sound/soc/codecs/tlv320aic3x.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/tlv320aic3x.c b/sound/soc/codecs/tlv320aic3x.c
index eea8ca285f8e..0e5e8002cd01 100644
--- a/sound/soc/codecs/tlv320aic3x.c
+++ b/sound/soc/codecs/tlv320aic3x.c
@@ -1049,11 +1049,13 @@ static int aic3x_hw_params(struct snd_pcm_substream *substream,
 			   struct snd_pcm_hw_params *params,
 			   struct snd_soc_dai *dai)
 {
+	static const u8 dual_rate_q[] = {4, 8, 9, 12, 16};
 	struct snd_soc_component *component = dai->component;
 	struct aic3x_priv *aic3x = snd_soc_component_get_drvdata(component);
 	int codec_clk = 0, bypass_pll = 0, fsref, last_clk = 0;
 	u8 data, j, r, p, pll_q, pll_p = 1, pll_r = 1, pll_j = 1;
 	u16 d, pll_d = 1;
+	bool dual_rate;
 	int clk;
 	int width = aic3x->slot_width;
 
@@ -1079,14 +1081,25 @@ static int aic3x_hw_params(struct snd_pcm_substream *substream,
 
 	/* Fsref can be 44100 or 48000 */
 	fsref = (params_rate(params) % 11025 == 0) ? 44100 : 48000;
+	dual_rate = params_rate(params) >= 64000;
 
 	/* Try to find a value for Q which allows us to bypass the PLL and
 	 * generate CODEC_CLK directly. */
-	for (pll_q = 2; pll_q < 18; pll_q++)
-		if (aic3x->sysclk / (128 * pll_q) == fsref) {
-			bypass_pll = 1;
-			break;
+	if (dual_rate) {
+		for (int i = 0; i < ARRAY_SIZE(dual_rate_q); i++) {
+			pll_q = dual_rate_q[i];
+			if (aic3x->sysclk / (128 * pll_q) == fsref) {
+				bypass_pll = 1;
+				break;
+			}
 		}
+	} else {
+		for (pll_q = 2; pll_q < 18; pll_q++)
+			if (aic3x->sysclk / (128 * pll_q) == fsref) {
+				bypass_pll = 1;
+				break;
+			}
+	}
 
 	if (bypass_pll) {
 		pll_q &= 0xf;
@@ -1106,13 +1119,13 @@ static int aic3x_hw_params(struct snd_pcm_substream *substream,
 	 * right DAC to right channel input */
 	data = (LDAC2LCH | RDAC2RCH);
 	data |= (fsref == 44100) ? FSREF_44100 : FSREF_48000;
-	if (params_rate(params) >= 64000)
+	if (dual_rate)
 		data |= DUAL_RATE_MODE;
 	snd_soc_component_write(component, AIC3X_CODEC_DATAPATH_REG, data);
 
 	/* codec sample rate select */
 	data = (fsref * 20) / params_rate(params);
-	if (params_rate(params) < 64000)
+	if (!dual_rate)
 		data /= 2;
 	data /= 5;
 	data -= 2;
-- 
2.43.0

