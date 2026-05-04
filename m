Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B963A5453;
	Mon,  4 May 2026 11:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777892886; cv=fail; b=CjkWVdWRNcKwJ3chz9aNmTwHJvvR+VrAi+iYkuXOJnG9dTRjqF82yjKNzt7tJNBTF0vzJxxot/kWGExQN2B6dgRsS5i+upeTju/cSAe9cCa/+fJDjbb0BZ3TKv1xvGWVA4Ra6KOU0HuPra4wOTFkATc2/6q9ljsR0R8hYLiDZkI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777892886; c=relaxed/simple;
	bh=I7DpR7R2Iqe+iRHTOMOMTZkxgPHhXA25kxz+GbJQ368=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gTyPHqJYQtmYaJmX3MQyzZk4rssKTIvdZd8Q21CyfXyY2AkF2o6eGtAGbIJ2EfKgdgEMKIejrWypqBxrZpPsSn2FtzXjtUxSW6yh0PMYD/JOaw/+NWi2rncqixLB7AWyZx7l3Ez6FyTAU8yJaDGEoMv4OsNVQJTaT3Mr8kC7bWA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=nTKW4Pxn; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=AxkrpY6+; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="nTKW4Pxn";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="AxkrpY6+"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6447g4ZY3898377;
	Mon, 4 May 2026 06:07:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=AYEsBrOj1xE8yXCh
	7o2G0kYq+bVD8vpERyP+but/tgI=; b=nTKW4PxnuGRjlblp1a6FIT3EYakjr50I
	T1+PdQKIKRk0YoyDwC/OQo9h9W0uHtN52hhzsAdoa/d6z5LvEiT9vEIas9iIxGOf
	0yUDW3BbMCXYVKAS3YlKFNNLzW/RVh6Yfrsum7l4jg1e7z9LekxS34dVW93+ofMJ
	46hTmPM5PvgxEYfSrReNF7ie4CgAxN6Slj7AAJEoHxL/Fxj66cs4RP2Rsc9QZyyA
	3wsFk5JTGpqGUEvoV6TNzFVGko7wBzC5QZPdOOmFB+83ldTfK5a7PA7pxbozUBFF
	7usXAdig3m5cZqbNgOyNvu5J9xiWba13Qrk8tJe7g/E1FQlDQqyi5A==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11023135.outbound.protection.outlook.com [40.93.196.135])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4dwep0srxt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 04 May 2026 06:07:50 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S0wkZtfLZTDH/TAW+6hU3zcKFm7e4op+lvdkowvmZzXmDMt38nj9+WJ2+QMEy6C5mMi51JczqqXm3ZqEFiohnAbgBWLUJTT+JC2YJcckPZe7epqdpah6VJUEGxO57pZfHdGCBt1uEJgk+9PtxLwYDwzxKSWlq3vOpouv8WJPUAPighYOpmKU7dTrz64VawD7M72sTvloGfoVe+LIFDkk5vBkrgnaWCAB93Uj3WuyTqnQJP5tSFUQB6HsqMmsp6gmgsC2ixeHX+QpztVemJtUQ83UW872QW7jXeHvwuYAmtYHZzN76LXGe/mA2qOka8yhLs/FGS3XMKxquj4dfRUJnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AYEsBrOj1xE8yXCh7o2G0kYq+bVD8vpERyP+but/tgI=;
 b=jA2+tamvYUVqIYiyJhqQyVEi2JD3q4q96P5/bcmqSxLAdelNLJwxUWiUIQiOxeMnA7KewW167bKTHnd/ikfUEClWCIddTyCX9NPjjVuefN8Q/FXoJiAuH7BpHOQ/Ex+etXR0RFV+dBfy92HKGCEOqsdXAIwmoOSO4taGa3OXS8T5gFiBq/IUTL+ghpxE5PSuo1/C+gvIBlgjZ3TR+lPuYmbX+00iMGluNElQJ4TnapIa4SldCf5pw4WY/GO1A4sp6PxenJqYm6cxA0Kq/yW6NcrQu2BZq/k07BbbAHVBHKowqqWRuckjG2vA7rP0etB0Qh1jpLktX8zL/dZHkTG7FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AYEsBrOj1xE8yXCh7o2G0kYq+bVD8vpERyP+but/tgI=;
 b=AxkrpY6+7K4VBm4RXsCNbYN1rVqv+k/XXE2NS8CWHG8WIqn1zmKUpMHBWoHzh7eaHzARzEuVB7M9lBqAaN9oIquBa2SdFIO5uU+8lyrj3HyO3DiRAu6GcP2MypgycLgScNGq+YFKFPyBVU82rdhf20n+88Hn0Dr4bp2VoK62NDo=
Received: from SJ0PR05CA0198.namprd05.prod.outlook.com (2603:10b6:a03:330::23)
 by DS4PR19MB9051.namprd19.prod.outlook.com (2603:10b6:8:2ac::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 11:07:46 +0000
Received: from CO1PEPF00012E5F.namprd05.prod.outlook.com
 (2603:10b6:a03:330:cafe::e5) by SJ0PR05CA0198.outlook.office365.com
 (2603:10b6:a03:330::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.11 via Frontend Transport; Mon,
 4 May 2026 11:07:46 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CO1PEPF00012E5F.mail.protection.outlook.com (10.167.249.68) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Mon, 4 May 2026 11:07:45 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D5EFA40654A;
	Mon,  4 May 2026 11:07:43 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id C8AAA82024A;
	Mon,  4 May 2026 11:07:43 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ASoC: cs35l56: Use devres to destroy workqueue
Date: Mon,  4 May 2026 12:07:43 +0100
Message-ID: <20260504110743.3341869-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E5F:EE_|DS4PR19MB9051:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2bb0cd49-2335-41cd-b368-08dea9cd5ec0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|61400799027|376014|13003099007|16102099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	zbX+ZbfEe4peQjlLFaTuNY4G0mQ9RAgDzjoH86XxOUeyfiz4TnnGAUeKJ7F2u4qqPX97DnrUuQP8TRVNql+ao4DMSKCbQ+KVy6uac/wt2ke0zoUcFWeiompbPCWGm4HAUI66lZvOQr58VhYEbrdDKRKhCuSepXZ1gCGdmNxM5j45UCvqdrQ4ZQelSRVFREOTQCGIfyStly4gfAc4wGKPxgWoGqZz29n+PbfLPQx6k3xKNpqantExOpRK0Q+wlFYLRD0fSOTJaF6P/+xm8tlhG60xnFwo5u5gk4k2aYw4QzTF8cYHbpo4Y81PriMrk/zYuN8g/K0RCWu5c0RvXTc7ngR1e4UVMFnTUBQHXhjUQ/ti3QFTXXNE1NjTm2Z4eEn2IbRjy82nNfyA2mP7RQRCdx2162PF+VNYNhdo2PW6RPUJKoFOC464WJF8MzC97hGBxST7XCMnfbT6a+Of+PCoPCmNR+bze8AqCBT3Oop+/GhNQDLe4ZphtY6mO2KOSPlzgwzmfOH9WYOIpgkBm/2E/WdhoCpA7t2mDBMM1I0H6BuIoc7Tqwh66a0eGus7GNDL63q4lr93VcP3KrkENOGeqzyNIkccJ8ZQ2sYNz6IzMpW5qT49wtiLslTg8Hkus6jdDMeY6Ogi0u7/vyB5pa2DDXlw0CPvYCKVRF/WmrX0AKk=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(61400799027)(376014)(13003099007)(16102099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KBoGD6Ubd8VHskmS0hmIyuAuOZ+5iwkwyAlaKb6+nOfIKHUPD3HfPVJsNvYaYooItk8k1sOrbq0G2suOLwZFycCzihaSuj81g3JOe2kdVOdInCm28SH93UNi4rfxkAGaa/QNIj3Nf/RC3PnisUY/Df9iuQlpEy2g66+qSnwiMhfZAxevWHlFcBVnCNcrATpvSQ7In4yvYiN66gVe3t4esUEeTc6UY2o54U5hseoT8yvhgj5hYYPnv2ssD2t7q2cvx3r0r/eA/N8CnabmICYK/vniJ1ggBUuXMvMsBavqn3Bz2XGWQ8bXryUnH2qjWtG1K/1B7A7o6opDVyNxXw6z88hQkFZJ/TsYPci1eHL8LiN+rkd3+9H2QFfMjAxUQkFdT0hka/ALHZcUulYBNzMEEyM74BRUJzzVziLRdzwZDAWuXZ8Xg3fNM4CSmxcs6kqL
X-Exchange-RoutingPolicyChecked:
	ufRBlpg3gbyHmAHZym9CK+9vkXfqJHDw5yyjLCn3qM9gukGpDGH29wOvuUxicUS7bqts0DmvH5zD4ZuKhXBvR26ImZg5lYfif4q7geQJrZRJRJfEtsfaGEXvVLYZot1l8ZxYs/nbNsHcRiZAY3zTvs7kygxk184lMbNleCZI4aU/0XGJNoV28jbj9fPXVDq7zqFMWPTXL9fXGYTOmmQBkeOatRuQDMnRZ0N/+vjN9DHzCmwBqZ9Bahb2AMRLs6eVA5ApWxmI/Srl4bhG9EbMp/3SRsCRkVxqbwQ13UWnOnGepRLpbZjgynStSjdvlfd3B7ZaR2opmkuVk3QPnlWk8Q==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 11:07:45.2996
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bb0cd49-2335-41cd-b368-08dea9cd5ec0
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF00012E5F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR19MB9051
X-Proofpoint-ORIG-GUID: quLPRdxSGwmhrJ3-NV1peIvTjOD6dNB2
X-Authority-Analysis: v=2.4 cv=fcCdDUQF c=1 sm=1 tr=0 ts=69f87e06 cx=c_pps
 a=7ntddG0dgv3FSiXqKUebxQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=c92rfblmAAAA:8 a=w1d2syhTAAAA:8 a=G87uJf3W4_HJWmRZa8QA:9
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDExNyBTYWx0ZWRfX/I9wRAfDjHw9
 /Qo8YVeTFHuhbOaBu1DFkoHC1Yev6z4sRJcDg+TUgoU3Hji3lhC0fviErd16okKlUhhqsuQatXx
 vMLnjw+nBMYBKQxfR+AhknB8pRsLTUau+kMSi7CdDDKtUTkEYECAiVrt0YIgpARKLSsGADMKacO
 8yt0W0cBFToBwWzWVNmr9E7VVW7IQnI5bNpD5QZwffEdUR83RzXjyBfUdfH6tXzA6oWbq586wj2
 oWlkeQBuoxPJHVapKZBIsWXNbqHdl/1bDeTarGzs74Y50Fc5qNi3io9q+LLqGfeLc2U2JDqZ+3b
 MfVDrYhqhZSjr2ThOjNDCLjrkvhvM6TGCgtfphu0bmSGrbjYXV2URkyyUdE7XMwDDGxRceSg69Q
 4h6qu0CpoH0hUbZ1yE7eGlSX3tUd8Fql2lpPmQiRk86T09AY9+1lnF9tjx93iQhTIo8pXLkHK2j
 QecGuH+3ak3yTZKr50g==
X-Proofpoint-GUID: quLPRdxSGwmhrJ3-NV1peIvTjOD6dNB2
X-Proofpoint-Spam-Reason: safe

In cs35l56_dsp_init() use devm_add_action_or_reset() to add a devres
cleanup function that flushes and destroys the workqueue. This replaces
manually calling destroy_workqueue().

The error path in cs35l56_common_probe() did not call destroy_workqueue().
Using devres keeps the destroy_workqueue() automatically ordered relative
to all the other devres-managed cleanup.

The call to destroy_workqueue() in cs35l56_remove() has been deleted.

The use of devres cleanup was suggested by https://sashiko.dev to avoid a
small cleanup inversion window if destroy_workqueue() is called in the
error path of cs35l56_common_probe().

Fixes: e49611252900 ("ASoC: cs35l56: Add driver for Cirrus Logic CS35L56")
Closes: https://sashiko.dev/#/patchset/20260501103002.2843735-1-rf%40opensource.cirrus.com
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 378017fcea10..030051292534 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -1627,6 +1627,14 @@ static int cs35l56_control_add_nop(struct wm_adsp *dsp, struct cs_dsp_coeff_ctl
 	return 0;
 }
 
+static void cs35l56_dsp_workqueue_destroy(void *data)
+{
+	struct workqueue_struct *wq = data;
+
+	flush_workqueue(wq);
+	destroy_workqueue(wq);
+}
+
 static int cs35l56_dsp_init(struct cs35l56_private *cs35l56)
 {
 	struct wm_adsp *dsp;
@@ -1636,6 +1644,12 @@ static int cs35l56_dsp_init(struct cs35l56_private *cs35l56)
 	if (!cs35l56->dsp_wq)
 		return -ENOMEM;
 
+	ret = devm_add_action_or_reset(cs35l56->base.dev,
+				       cs35l56_dsp_workqueue_destroy,
+				       cs35l56->dsp_wq);
+	if (ret)
+		return ret;
+
 	INIT_WORK(&cs35l56->dsp_work, cs35l56_dsp_work);
 
 	dsp = &cs35l56->dsp;
@@ -2066,8 +2080,6 @@ void cs35l56_remove(struct cs35l56_private *cs35l56)
 	if (cs35l56->base.irq)
 		devm_free_irq(cs35l56->base.dev, cs35l56->base.irq, &cs35l56->base);
 
-	destroy_workqueue(cs35l56->dsp_wq);
-
 	pm_runtime_dont_use_autosuspend(cs35l56->base.dev);
 	pm_runtime_suspend(cs35l56->base.dev);
 	pm_runtime_disable(cs35l56->base.dev);
-- 
2.47.3

