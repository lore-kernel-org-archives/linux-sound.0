Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F9D3AB287;
	Wed, 10 Jun 2026 09:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781084082; cv=fail; b=CsIDLAXeGW8TfAECrwKy1O6jLr6QivYNi9toNw+8B3IMEbPBWozesOBBobc31g62J4ZoyJvIhAUDdFYE0G8s8vPViMJjTqgfwLAecTj8XSF6/6Lnd0s43Mw5GcREHJNSXyhlNq4KbLeg96NEGJ6j8/5SFNXc/1EwYAhbburctXA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781084082; c=relaxed/simple;
	bh=iWBXunY3cAKIBB0UWwZlPc4GOkLkclAtz2a8eJ2IK/E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZthSRbiobjV9IzKNXxmHR3FAnricOEjbOP3v/H7wwVFWtJP3AUS8C9+ySzzKHySQHJSZ+nat1bHMHM4K5GL0OCSUZSqnNXiOhy71a28lh0mrTplQNPpcuEavFTFRkcUNCgh6/kXjdVA8iZJnjorlqTLanprXHbqMfllU9H1B6VA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Zf7DhVez; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=OQF6+3rY; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Zf7DhVez";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="OQF6+3rY"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659NMmn31999339;
	Wed, 10 Jun 2026 04:34:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=Kv/Y33Xnhrsi7zGNvJj0vzHUWCOCVATXme7uuFmB8ps=; b=
	Zf7DhVezqWX2BVepzVgHZBFj97nE5sLHMJ7/7Mc2YTe9kiTbIULMzJaVzq++0l8w
	4dCbLRGd69OPl0uXkwN0fQdfVHXl3Hz4my/2h/q/LTVG2Z/5cP6baWR89ylGRZV7
	x0CLSk7kiefqBx3siBzEYSRz2A0haXSACZYG+s3ONf71VjdS+AZXo2W5RG7apcwN
	JQnYWikFlyxRmqUp4D0FJpfOjsJRXIRoiDBr39g+rv0LBgVfCM6B9tjZP+dhpSt5
	C2ItI4OKa3Jk+a9hBocE8bARCIaum8ZVS3rjtWmcOX709VjneKx9mV+ewwsTA99/
	GeWaTkZk8oSPkF5uJKjdKA==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020083.outbound.protection.outlook.com [40.93.198.83])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4emfyge1vm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 10 Jun 2026 04:34:38 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fkg4oT5yLX1EV8xTdXGFVP8HvgEkZU7Rj3rQRszy1pBy94GnHO7n0ow6/lBrwg1rvemylO+ao2g4yePUWCOI0n2PyNkR7Yz1Uk4fWYS6dfWLLc/DYgydEY3kwBN/IhoIT1UnA8lXyJFajGk0XGJDz7xLAIctf0vVsYQmzDY4IjO62IVQyZenn9eZgrhx2X7CCnmmPrNfkryNF76yVHhMCTQ0eCSBX6KswFk/fiS3XV4SeQgwxeaJ3Ku9Hh4ABHQtaosNazfnw2kNnOqFGu439bp5ezbBshFUPLBgFoidDXpX/gxyINlhatVO04+uVVDFU0VHyWGR5VoDME2riHfyQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kv/Y33Xnhrsi7zGNvJj0vzHUWCOCVATXme7uuFmB8ps=;
 b=JXGEX6P30rs02ZCxFZn5FESolbtsZqhbMqCrKCqwcQC9/KG7Fc40MwkB7+TkFoug3XtmcIutx6zTSG1Y1Vg2gaQzPc8yr0H1HFw4IGBC7rwa8I5pjsEP8ZT5775mhMgOlgM0dl6pdLLmJGjYLcBctvH/kZS5vVguaj4SBLOTj5SXVfnX0w8UJloSTHS+BdX/gflgZZxum9EjHDG7R0JMc8JGcEK8sNWjxLFNvkqjXJdhKmzm1qmkyWyzMj0CnYQIx78vjMcGNEvOaJNGOWYVTgAgb0Vx3pMYwyvWZw/dsWyI/z/PsgDJFeR+VvmwvlfALXY2OFJ/vMlcgVutCAIaZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kv/Y33Xnhrsi7zGNvJj0vzHUWCOCVATXme7uuFmB8ps=;
 b=OQF6+3rYnhNhaUQIKG0S39jaJ5elVJZXpFYJt+oAZpC07YvIBvah4VbyeqjGSlduHE2+9hr4S0jIp81fS9AuEVwiywh27mdUIe0SMdyUjlojAUGmXjIluFx4Fy1Bzq4812XzERZa6u3O6wqibU1kFedlQoY46hy98qVcg1H89jE=
Received: from CH2PR18CA0005.namprd18.prod.outlook.com (2603:10b6:610:4f::15)
 by CO1PR19MB5080.namprd19.prod.outlook.com (2603:10b6:303:f1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Wed, 10 Jun
 2026 09:34:35 +0000
Received: from DS2PEPF00003444.namprd04.prod.outlook.com
 (2603:10b6:610:4f:cafe::4f) by CH2PR18CA0005.outlook.office365.com
 (2603:10b6:610:4f::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.11 via Frontend Transport; Wed,
 10 Jun 2026 09:34:34 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS2PEPF00003444.mail.protection.outlook.com (10.167.17.71) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.7
 via Frontend Transport; Wed, 10 Jun 2026 09:34:34 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id DC9D240654B;
	Wed, 10 Jun 2026 09:34:32 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.13])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id C26CD82254A;
	Wed, 10 Jun 2026 09:34:32 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 1/3] ASoC: cs35l56: Fix missing calls to wm_adsp2_remove()
Date: Wed, 10 Jun 2026 10:34:30 +0100
Message-ID: <20260610093432.557375-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260610093432.557375-1-rf@opensource.cirrus.com>
References: <20260610093432.557375-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003444:EE_|CO1PR19MB5080:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 11a9decc-52b2-40c4-58f1-08dec6d37b6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|61400799027|376014|11063799006|56012099006|18002099003|16102099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	xHXVgwYWz3E9llzEmsAgb4QUdeP5/PIohwShwU1RLtlBpp+dfUuufcB765J9ahNEbOy5naKCW0/4aiDm6tT6hp4mMer0/xi1ou13/Y5waExFEQEufXQsSC1dldwbQvkLOf0nFM5Wd+QnbaU39L7JHunv2qVBC8a9BQh1N/BZTuzqjTomDKHuKvJ1TJyEbAf+oZDVJU8DI4tar8TSw9GaovMZdmD43jZZCvGDloVExUtbHiIO16AvwYo/x27LTXfINMrzxiEnUgtxctor3KznJ52hhWupSPI6k99+tBCh8tkb1pAa5hN3IUoF9dQs3wrMHYEoDCkRna6f7tnPW3Wu/amyX4arug9/+VkSYtgrJjRCkfr1ipOaQP08v55ilYprA0Kd3FCRic6aFzf4UHSmYgVBBwXhIni29heonYyy7OleTdguBK96hOwIQCu57SYJ6cX8MUEDbUUdWuc+tTuYr1S6PUhiCqbBBniWdrvfqRTIGI1HbAKY9qFSpmlMY4Sv7ELstJTcAbIr2o3Xwm+TizBD/3rnx75kl9yVlKEDy2GCXxFG7S5YAE/jvkElZietKVBmyYi2zT1KhQv0UgpWTv/uBgXdhiJ7SVZknEGNqlddyRyqIf4Wxvd8V+yfhSBbuJOeGfdl51NvX9xkHFxnaIywdiTOqNGLbnssEymskcceddCSTRgO/hkPJs4Fb3HBXpEH7GcEQXlp6FIyDNQCumbvJsiQXAAukYCFJ9JhJ8A=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(61400799027)(376014)(11063799006)(56012099006)(18002099003)(16102099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lttwbqWBDoQo+YTPIoUlmQoOrZbtwqk2uXxzVwPP1VhGm2HO30t5FkVA4hjnafEkLmfmaKYnkdqwVW3+1FuGFP3AoNKMLhneVyeooCl8Rk7BJZkid4M+M99k7M/WriWUWMabCCEWoOdnKWfSaBTltwVMfRe3OWdqhQluhAA917U5pX5wbXdr/v4EW5fru/29wH3nwV22wXymsasqjYDrKlg2XKNkcQjLS4P4VV6Flj58V4S0srd5Ftlu1O0eVG4u/crOKWFoSNE6MGmVGLFfkFST8TQ8zDo2w1Br9bx/rH9i8rLlv2dLDS50PB+RZuWCUhF7quaEk73de9C+iGM6Qo4Xouf6FW1+uoynb2z1O1nCb9WfKs6+IEdJ4a2UP3xD/qGRn7QAJM1R8Bwb1kcO/Qr/NEHZAPaBn9MvjMgjS2TKaw5Na3xsaRsRNsiq7AEM
X-Exchange-RoutingPolicyChecked:
	EXSmR7yY6iM22SMEkFn5UrYJ43tuVQ4kg8D233DlqNZnCtl9t3rY0zd1nSeuzK1yYNIRNTn4cHkGGqBl/O+8Z7gjZXDxe60UcFCKV+iSeHtynvpXXPFwlcov2vTI2uKPRYSSICp6D8IskIG8TxJeSPS8H/EeLZd+aJHWGklD96Y5x2EeqQcQEYrSgmzlChvq+z3tAxwm2dBALjvacjA9AXa1+PR6Ds+Ag4JRFF33+QfvVgdGsu0JVexeVY4OvP0lgHbn1sRgV612jKXyv53bCokR/66cM/xEADRc9i3+kGV1pyPnf38Ex5kffNzaCO2NX5wdDqwIx/BodCEwQz3wrg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 09:34:34.1655
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11a9decc-52b2-40c4-58f1-08dec6d37b6e
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS2PEPF00003444.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR19MB5080
X-Authority-Analysis: v=2.4 cv=Wt4b99fv c=1 sm=1 tr=0 ts=6a292fae cx=c_pps
 a=N2BSJ/IBjBq6ipLGDtrT5w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=AQBjrmBz-BZPdndYv68A:9
X-Proofpoint-GUID: YVr9S-pIJ3QmPQmUq0EQg1xqqzb-9RjI
X-Proofpoint-ORIG-GUID: YVr9S-pIJ3QmPQmUq0EQg1xqqzb-9RjI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA5MCBTYWx0ZWRfX+smSdLmgcLEO
 5i8rscw8Ww+4Kx4eiYoDG9mzhdvb+sk8zoXDEj5uuDAsGx12tx9zRAF0cbHx07+wj60jGNU+5P+
 rIy/EMLZFc8wDdM0x/7RI2icntH2pgw5+8TLpkLqFThuT2x8MQUT7NHNyib59ixp5kykwaPRIQc
 WCMd2n1i8hS9L9VYwbAfD6bDXN2SP5rUvyABOwOsO7PAWmBuN3ZYxIa5OSCypbzgls87m1yIMuD
 1fqeLJQCjnkSk5+Cbf8yHosmsR4/ADbATDXlVr8ctUeJhtmMT0sULWY76Fa7zVJlZHl/g/Prvn8
 sWwPVA7ASJAq+SubJ6ZcnKcbbmvQzwuX72GE9b23usuk9IG/eh1lvNqZXRMF5PQ8XvlBJsXS9gS
 0rMlwvZRQlGYZ6iGk7hGFU32eRZ6J50cyz7k+f5+OiBm+ASyhvWKJBMYTQ1jPtWfmJP7D5l0nLg
 BxK23yEEbWq56em6V8w==
X-Proofpoint-Spam-Reason: safe

Call wm_adsp2_remove() in cs35l56_remove() and the error path of
cs35l56_common_probe().

Depends on commit 7d3fb78b5503 ("ASoC: wm_adsp: Fix NULL dereference
when removing firmware controls").

The call to wm_halo_init() during driver probe should be paired with
a call to wm_adsp2_remove() but this was missing. The consequence
would be a memory leak of the control lists in the cs_dsp driver.

Fixes: e49611252900 ("ASoC: cs35l56: Add driver for Cirrus Logic CS35L56")
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
No changes in V2.

 sound/soc/codecs/cs35l56.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 0f78b1284eaa..9dcbdf8c8054 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -1997,11 +1997,14 @@ int cs35l56_common_probe(struct cs35l56_private *cs35l56)
 					 cs35l56_dai, ARRAY_SIZE(cs35l56_dai));
 	if (ret < 0) {
 		dev_err_probe(cs35l56->base.dev, ret, "Register codec failed\n");
-		goto err;
+		goto err_remove_wm_adsp;
 	}
 
 	return 0;
 
+err_remove_wm_adsp:
+	wm_adsp2_remove(&cs35l56->dsp);
+
 err:
 	gpiod_set_value_cansleep(cs35l56->base.reset_gpio, 0);
 	regulator_bulk_disable(ARRAY_SIZE(cs35l56->supplies), cs35l56->supplies);
@@ -2110,6 +2113,8 @@ void cs35l56_remove(struct cs35l56_private *cs35l56)
 
 	destroy_workqueue(cs35l56->dsp_wq);
 
+	wm_adsp2_remove(&cs35l56->dsp);
+
 	pm_runtime_dont_use_autosuspend(cs35l56->base.dev);
 	pm_runtime_suspend(cs35l56->base.dev);
 	pm_runtime_disable(cs35l56->base.dev);
-- 
2.47.3

