Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B924340BCDA;
	Tue,  9 Jun 2026 12:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781006909; cv=fail; b=fHAz+lL9UU4LYs3ythxrrtepnp91v2CAvEV9DWo+OAPpgzkxY0rzTtBIlNMnPen2yqYD8RM3BpPzgxczvBEH8aDdQgZLx9ZaN/9fwg17oWxJ1RrA3M/octv3NP+JR6L7o0upRgGuYn1ePidQCxrLz1FuKN8fv0fJQmuYt/4rWeo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781006909; c=relaxed/simple;
	bh=Ns5ojERrStfQMQurUmltWmzmsAQDChCwbgXCCaOb9CI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bBKp8UHEEjCiuSoJMHNg4Zr/HSpdm9ZJvEoVmerSQmU2Wp4ev1pwqfS9rE6tPNdGnbncwoZhEjp2fbuPzhRl88H3/boMbvOrZ7it8XswYkHbn3AItV95Epp61aGboSPFdftK0xjFAcwJ4quGku+G6KXXTXKcgeKTTKxJwRn4tDc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=BQps3QHi; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=ybZmZnrI; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="BQps3QHi";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="ybZmZnrI"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6595qTph211444;
	Tue, 9 Jun 2026 07:08:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=cVPf3BJ2MXo7AXLT
	LEOOPzvDEXFavamhHUw0BVqSuhc=; b=BQps3QHi8KUJloEOffWG89mG9aKIAavr
	2XfV5goSbBj7hOvw8or0K28oXJkifQQY0eGRxxUVRiQMVzB5TaVKnjU7F81JU5M+
	r3JMwvFB/oxyFiBD4eGt5885s7czlHVPRrJnG8vFG9wzj8vo9DaDkVr92lGKSrVU
	G9R5MsGFhX1fTWcAkyPkRpL7WBgjisq9WnPwgDUEGGGr8iGy6CocCJNKjk5xk/kD
	ws8LXyTOON2Cvj9n85pecWiE5IyPdGXzWfYucjEkwLa1+hoQrNZeUvCpQTsySCUn
	wLQaBJEr85MBFYRlk+eTALkt3cvKupElckj4wtRIj/6Nk05mxfQMJA==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022076.outbound.protection.outlook.com [40.93.195.76])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4emfygc4rx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 09 Jun 2026 07:08:13 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R4fVo3rLIQcxuZjjbiPGFtG2Wthcf+C5PbRp2P/DYRy1gr4iYl6Wbkk2G4gZEWSeAO/Pa2lo4+ENdaNpN5ypjUnvzgeUeTIWutM9uFJvJQUBxrid9sKS1r7J5WVy/ylldbP8HqSZAqKfCsrVTufyXfi+ubVDgP5YkYOC4FvWWhU1ABWomLR4IC1lPPuWajSf5e2lyOijtPRLRmdsgApyj4x7PEunxTC4UJI86xckEPk2MD/ZZHm9UdaQ6YPpRKNAxnRm0SkkmdJrp56mxN1PXmKdN6uC+O3hHPozbTOjVdnoXuX+j1z8+1+v1SLF+Mucuz8gj3gWkZQfi9iLH20S5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cVPf3BJ2MXo7AXLTLEOOPzvDEXFavamhHUw0BVqSuhc=;
 b=TJyYCaJI1U6cpios057sVa8uXMJD4+KAtkK8O04JUGRBpIHNjSzLI7Gzn+8nGRaDAy6d+eEhSH280X97ldydqxuW4kTQ5RKQM4wsC2j2R4/GZP4HJJhRX3cTYYjrDj69TfB4HkPkfygw82jXF5QCM4LiOSvESfxTNXs9a/fCXIt4xmk1Ofg7vQ663w1mxf7iHDbxD4NizF5wPie+F6u9o+JvDfbAaLgshCBxUxaFyU+KpdzSS4F3vHK7ZuHkFdhKBgT5CD3yGcNuti3eI2hkByK+uu5ttjuae3HQuAI/9lt9jN6ZgcvmRC3kJ3xnI1RDkq2kqTULF3W6l1K/UAYmIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cVPf3BJ2MXo7AXLTLEOOPzvDEXFavamhHUw0BVqSuhc=;
 b=ybZmZnrIkl4kZf1qFkKlGhmNOwrR7q3J+hvUvA8tEBRL8Cza3PwBUT+LrSx4X7wOvTBP98IkzG80XMM88niES6q41qf3gzMNAHgcPrdLMvpCDtm1cBb/rtTIX1wqMKkxJcB4OKipbPimvJ+WtKa4gT0aU9EgT7+XzLw9iC7ZV/M=
Received: from BN9P220CA0007.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:13e::12)
 by BLAPR19MB4561.namprd19.prod.outlook.com (2603:10b6:208:295::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Tue, 9 Jun 2026
 12:08:08 +0000
Received: from BN1PEPF0000468C.namprd05.prod.outlook.com
 (2603:10b6:408:13e:cafe::73) by BN9P220CA0007.outlook.office365.com
 (2603:10b6:408:13e::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.10 via Frontend Transport; Tue, 9
 Jun 2026 12:08:08 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN1PEPF0000468C.mail.protection.outlook.com (10.167.243.137) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.7
 via Frontend Transport; Tue, 9 Jun 2026 12:08:07 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 23B8440654F;
	Tue,  9 Jun 2026 12:08:07 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.13])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 061CE82024A;
	Tue,  9 Jun 2026 12:08:07 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 0/2] ASoC: cs35l56: Fix some cleanup memory leaks
Date: Tue,  9 Jun 2026 13:07:36 +0100
Message-ID: <20260609120738.284770-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468C:EE_|BLAPR19MB4561:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f302bf1e-04b4-4ec7-9407-08dec61fc4d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|30052699003|82310400026|61400799027|18002099003|16102099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	Nl0hWfJKtl+6caqkrkuTOsmXLFSAj8/qNYdsGa/TjN7lEDKCDYvBNsgKYYrCsubkKm/8QuqlhtRMCesMNHwMyam8tWLwvZ8xpbVBAdlQGPoYdgr9KetUzTBKsn+yYbxjlfiB45Cguj8RJxeGHECmWVTdGiYtcahi8Lc6JcDDgczFY7hXuNd+q3cxj0oopkH8TjBK/WysB21ULOrJy7ctHMC9ocCujJB2ZtzMmVN5dsw+N9LsX2d+pAAeBYGavzk6brWHbhmaWsk9+lDAEsRH3OORnlQag7I2XHm4iLCA+CHJTSFXY0+CR574tPy9R92p4m4Cs4GXsgspdJU4/ksb61PPdE5OBB0pO5Zgms69Rr0i1S2fu6J1d6LKufqmPW6Z4B3i1Heev1vBowksolCYceya1uebJNODxcl5uvB09ltriVfIqF6QkfvxMe+B519dWFZadW/YSnvrCdxlcKTU2+/VqglIrSL0cnOXE58D7jqs8uTLH4Oc0zv6fOptqLYbE/viSI6uh8T1RjSDjfN/9KeQpPl5NeScUl0kF2CXOnylXaNHwlhFOOqUxlZWs1ol2NTxw1A49RKUa8720qSLr9UwgAr632e+9DPC8jEbgyMapGRNY16DBr4HwjB7GlvnEC8gC7+jDeY6Qiso3HLqqGc7+1kyYXG78bKeMMj/YzOP57W6Jqobc87FB0Azsy6WD0RkFcFh907KgPGjBMh9gYQNSOqZCFihr0jWPyNqF0c=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(30052699003)(82310400026)(61400799027)(18002099003)(16102099003)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	E5ueEpixM4otMtLqrbZtN2c4s/vyTaQaKw0LK11ngkxcmngGbv/9DUTeSdG+AVOP8T3a/GBxW+dSD9XQfkcy4GjcDLgoxNNsz0tETJsOfrONk7o1Jy/1M16xnQhHHviaeMadgLTKDM9nehYJAHV1Ew7r5HX4CUTFmGbRcucFtU8tza/rt2AZbBf44k6oV+57ekOufzINZfGefLZIlIfdUuQIK8IZXHbKW0BEyuFhVkloheG2eH05RrDUdwGyXmsRaPrfBfLD9yyZCWMoZic4iNMGCs5KJ+c0BG7yK2qXv5XcOM7kXL59NhyX7IYyzYKigIdVRw7La32nwO2L4mb3kPZ4KPTLgvaFZ9DjUjauPjHOVOUIbAuW6SXia4xCt6WmhdSoZlPmpnV/pEGikGImDSUXUiChnHrVdeFLxT2zktR6ghJm8TW90mMhAIUXgbs2
X-Exchange-RoutingPolicyChecked:
	hJ4JcAf5/LdJekjvbk+JfRDzi5eQVAj13ParMbWG9qngpDnPibG9KPNXYTN2VuYzGafD4wNZHvLmDoa9sSGZnE1jpIeK5T0NQYrpnQhFWuH6ttk2w6lduBpftMzQinMYzBaI6l5NJobxzjQ+nqZ/gNBt2/0l/LQxn8Q/hrRP9zPC5FRxV2c2G/DfaKYcRwsXL60+2xx6F6Qhn4U0b9LT5CFkXL+tQcYvX3oJ3QOTt64UTkcz2thSromUQgRGJVt/ESaQKjiY4SJz3CyG41sQcLAAPx5Zxuva5oY/vWH3U7aIM71JJI9LG+U4dRwkVXX+kTsBt8VM9BrekFzM1rhuDA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 12:08:07.9352
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f302bf1e-04b4-4ec7-9407-08dec61fc4d0
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF0000468C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR19MB4561
X-Authority-Analysis: v=2.4 cv=Wt4b99fv c=1 sm=1 tr=0 ts=6a28022d cx=c_pps
 a=eCb8aTw/9lghk0zZp47djg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=ax0RIfqEGphyJT2I5GgA:9
X-Proofpoint-GUID: kcTBTawlGeFYnIm4MER_l52Wqm0E1nVv
X-Proofpoint-ORIG-GUID: kcTBTawlGeFYnIm4MER_l52Wqm0E1nVv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDExNSBTYWx0ZWRfX0SCEBnv/yTUB
 CmLZSb+OxoC9euZUQF61b33eEcIBW805g+2WcqmcsJetDW3J7hPRDhOsijh4zCC9YeCGOCYsbI3
 RDeUuM5MUu+QLvLRdNSRoyC8x4OuWrQZ1kkJtrN9c5Q8kNPH+sfo1t4P/rFNSQWuy6wjPKFb0p5
 Xh3OlqcdH3e6bTVfcSkVbMLzEh8EZUr11WZDmfE2LeaLu/k8x1MXSnn/Jq3aoiNU0M37nJRK/V2
 eoSLdsGczMWZ6gg7RyEh0rG3lrqAn/FVcbQxiXtcOrMp9qmpGsFJs95cLjC7JraVzb9/COgidgw
 cxdgdmfL9kfv6aegyMztMZ5cQrLsM5DNd4/JG+ystlBwlEmootuQGblxnXZqxlpT94/JBCoVzz4
 duKUZzZyBBbbJiD0Qjb9E3CnkZEGWMRkJKpeWRA8kP7/4vu7fOvJzCz0nTvETLiLmMqo9ElLjYN
 e1SxG64EMcTRH1e+uqQ==
X-Proofpoint-Spam-Reason: safe

These are for-next.

They are not urgent because it only leaks memory if the driver failed to
component_probe or is removed, which wouldn't happen in normal use.

These two patches fix some memory leaks:
- The memory allocated by wm_adsp/cs_dsp was not freed.
- If component_probe() failed it didn't clean up.

Richard Fitzgerald (2):
  ASoC: cs35l56: Fix missing calls to wm_adsp2_remove()
  ASoC: cs35l56: Cleanup if component_probe fails

 sound/soc/codecs/cs35l56.c | 20 ++++++++++++++++++--
 sound/soc/codecs/wm_adsp.c |  7 +++++++
 2 files changed, 25 insertions(+), 2 deletions(-)

-- 
2.47.3

