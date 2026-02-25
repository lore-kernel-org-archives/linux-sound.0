Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4593AEF4B
	for <linux-sound@vger.kernel.org>; Wed, 25 Feb 2026 14:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772028131; cv=fail; b=R0Ksp58D8+3sk/yM66IO00qwi7h3ZgIOxK42o4ok/+xgaR95IVBiG9O5000BQBCXnRlkc0g+LvC3Wcz9OWCrnT3LHE0gal5rpNXoG8j6iaJNGZ9isrmBRh9oD66e59fO66Ledzq3qG+8QFGvd5RehYG2106i8QrynV93YANBNuA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772028131; c=relaxed/simple;
	bh=YBSofe1GYjdzO8O0DOty4JXBw1OubnJKtSo389HHqvk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qvcIfXW2AFDLRLYs4Y0Mmo3Jbo6gN/DCRstRUCdXoRPK3yZeQPs6h7dlJpRu8+poG4NEW6t96w5+VjAo1U7zldqlXijTKOaFwfYiMSbtZZCwOFRsrcGvP5BEUWFf0tVVryRmgIBiqCSc4AafeS+jzA3tMhR2ROBqhVJwHJzYe0o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=CazZxJIr; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=TmVy38iZ; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="CazZxJIr";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="TmVy38iZ"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P5xWZI2374262;
	Wed, 25 Feb 2026 08:01:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=yoMhoUVZKmT217teJJHk0WcRJjBuvx47Bz98gvA+S7g=; b=
	CazZxJIrHJl575YPPI4EsZvFHOOTYfooXKY+DpWo+QkErayR/6cI4aFIPE5Gnzn2
	l84+471sUEM4YfH1smScpDEQG10a0Rbf/cFF9xjYsv5zx1GNPQd7fIohGcJs/vkp
	K+YgQDWcBwFmswz1uZtZNH7kvwMTjQkHIp0B01N0S7G2Xox/Gr2l/KWEfEqKw3Lo
	yyMsdffyVpPoHdNNT9cj9xtjBPxsoGmrULWw3X865p75IyFeu2s6TN0DRFkXFJPx
	XiQSW8Xmfp8Q8fwwsWef70gardpz3zYWmr8oEXRKgHyPKVUKD2tDUZgis9IDUCp4
	JN3daRBgifL7ZghU84tKFg==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022118.outbound.protection.outlook.com [40.93.195.118])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4cfa0j4e6y-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 25 Feb 2026 08:01:28 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c0TyhM8t1lnt88JiCh6OKND+JRqDKqUQH7VliqTo3rytYhrixK7fEizoPY41bcXCbOv3wuMKze+lbbz93HdEm4UY0pQahKqN/RZKi14riyGWA+3LenyGFj3uu21dEz2VByHDmFcQTJj1b9S0bNeYagkzXbQ/zA9vaqyxX+CCyUIJ6Qy4WgOjE4eOp1DXgti85LZZY/+ofzvGCOBrqR1KG40grbTYEu84H/nKj6gx76EI1kBLEdRFfOFtrYz5ekWx9iXtJze9o9xl3FratixmGVBBVE5SoO9gfRlKvp/fQWb740Lz/pz92HF52Y+49MD1Cm4Q1qJSYCTgp1N0xQ4DYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yoMhoUVZKmT217teJJHk0WcRJjBuvx47Bz98gvA+S7g=;
 b=LzJ8PJNMrlWEQ/Zy6Gbt89xJfePik4iQzE4VkXFJfBTRjN3DYafz32XjUct7IdnMFgzpXXHDw6MQrNbBKV9Kk1nLIZHAQZTzImlfpP729yaoyhhwyJaVI+ttif6AyJ6N0UNHr9ttZWu3cj49Au/XZid72JZfICvLFf4UXAF0MFmo9kRpVocqJYPd53IVGRKsTEUhelC4bJ9eyYAb773ZzeoyQuNFWtPDbw5SEFUAztNKy/TAe3RF2blUz1H11eDJ6Mmmnp/1fsOSXaEqbv8gAfBp1cKXKlSoMcJ9/T55Sh3JdqsWzyVxVm5ejhnUL2c7Rot1D0RwiROC44zeKDRa2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yoMhoUVZKmT217teJJHk0WcRJjBuvx47Bz98gvA+S7g=;
 b=TmVy38iZKXSRaXYEGDRuY4IT5Oc3Tp6h8L7o8f0dZ9l9oENezph73OLMQxvpLHjjrVIhjysWys0/cDYbe3pPXDft1ZUKvif4NAk+WdQL9+tEVZHtrniGOr0aVL+zYGfTfQDcnVAFRe8ztBRg0ikaUTERwfOQkq2YCG1LZVO+hy0=
Received: from BN9PR03CA0482.namprd03.prod.outlook.com (2603:10b6:408:130::7)
 by SA0PR19MB4191.namprd19.prod.outlook.com (2603:10b6:806:8f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Wed, 25 Feb
 2026 14:01:24 +0000
Received: from BN1PEPF0000468A.namprd05.prod.outlook.com
 (2603:10b6:408:130:cafe::37) by BN9PR03CA0482.outlook.office365.com
 (2603:10b6:408:130::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.25 via Frontend Transport; Wed,
 25 Feb 2026 14:01:17 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN1PEPF0000468A.mail.protection.outlook.com (10.167.243.135) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Wed, 25 Feb 2026 14:01:23 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 4E57F406542;
	Wed, 25 Feb 2026 14:01:22 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 2A1A9820258;
	Wed, 25 Feb 2026 14:01:22 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 2/4] ASoC: SDCA: Update counting of SU/GE DAPM routes
Date: Wed, 25 Feb 2026 14:01:16 +0000
Message-ID: <20260225140118.402695-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260225140118.402695-1-ckeepax@opensource.cirrus.com>
References: <20260225140118.402695-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468A:EE_|SA0PR19MB4191:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c5157330-b077-4337-b335-08de74765c2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|376014|36860700013|54012099003;
X-Microsoft-Antispam-Message-Info:
	HdrvoNAKJpOQ3exxOehnwYzv3KNclh80SfKqAWiQsjJu641CQAkYq0y7p3QecyAvIpFDdrgpbjtNkjJSWk2NdEXPB9OKbAsPGOEsdGxrwVdKhjRzaeC6saWCZS77Ut4NeVnnOQU8MsgZjuMmBJWiM0fpPK7qwjf2FcMx3rmJs41Lp1xA16iPtq214ZB7XZd8wLmgqwjREm4bv6DJtu1Sq80Gx+vP2RmOBVmafFVnzAjAt5lYG7VdTdIWjxIqICjJGgTiDZXzTHC5n5dg4BTLut8XK3GMg1D9pYyWjGars+KF4gcVOBmAumL38sLrzXC6QoKJnMqfLH3Kt9l7CvAv0ic1V1LR/1RMs02+Avmz2IvImu1eb9JiYzjRabWUdsd+6G0ulDsgafg73WhNXYGFmO16qXr6a2tTPeYVCMyGDJMU5tfP58mSCeSUUy1HeeC6jGFpJ9NNUEOxGe7zpbnx0PKnymvQzXmJEqsmdTserogMqOzozZn8rXd8eCFhQFoZMbwAtN1nPP5QwuCaWLu753U/Oh4zv1iYUsd6aDR5z9ppql9Fn/rqLInkhP3R1DIcfjpON6bQvDwsCNxT+qF6jp/cqY+xLEQYknIBpOlECO5LbIkino6hIvQ+HQ1c8ydLU6ht4F5kFtEHM6Vv53noeem1YIwdp4fLLpCSzYpWDo6EL1miNKXzddJNQ+sJiuroR7nMSLYQXYVYB3M86OoF0Re5aXIbItvieLN22Y5qSLYeeZaOIyTgQY7jSTy8f9rYeYfcO7cfCH1cd9XplnzJGGNEohFYT+Fg9NmBmh7zD3BpS2IHCduRfeqDOSBgQXSP1KEUmgW0rcUMq/TLBK1ngA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(376014)(36860700013)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	CxNW0IOMvreIaWDaul88vxyD+ePqifFgYQ8BvYW0hkGUzGMU0jbb0CJ69a6QUVoN8MRm5iZyqQkZdEEnYxvdbuW6oGikSTZ/B3NJ+bVPtQ0bRgSBG2ATFnWymccokJsePF+C/2X8v0L+cVvyyMpcUYT33uwQCHp+zfdW6mp3tsBGl2/f/97hsBBkORiL/Oi0eiRX/7jSUOh76+j0PnsxFEh6SYOCPOQud/8Lll9Ff220/fGlr2Xw+x6/9xPjyLbYV6luU4Qm+/xK13iC9td0DyDgEgqu87lL9PNNp/VDawfrQPR5+bRx/M0z9jRStz8ASUOYTEgPYPtPab8LL5Y98IzUQWvrmwDuTZ58qOFxXX2xqrGnkuniRmMKepgo6Ienocw/xU0x0bMpUiY3KLG7qQhmHwdktJUZ1g9jHYQ887fC+AUwjMF0uWYfiMF74L7o
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 14:01:23.2506
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5157330-b077-4337-b335-08de74765c2e
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF0000468A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR19MB4191
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDEzNCBTYWx0ZWRfX6kxPaTfFceo+
 iFturTeRE6LAxJQoy62QQwSpRM+DHSH5qUqSZl4/ZitBGLCxOLK8oYd+ncFayK48L8RgQdP0GQ7
 f7c1xQer2Cj2qnwAAQh2dzj+SNqs3ez+izrv5ltXMQxi9QlhX+b3Xmj2DMCjl9dtLD4HFc3uT1s
 tOIPJyVDBHbhL/MDCxrWmFo8h3IR+sQtkL1MV4geItufn5EW54vslL0ENsnIXebDDCvVPonPTUg
 hzzI2PvS7b0S6eiBtSs87lN62x7hVUEAUTQGiKtr3ANPLj0l4d/XnHqoIRidFn+X5rWWaMZnAYA
 RhfTJPbRwU+jU0L+d7IbusS6Ueh2nUrADui1MS5jScjdY43OzYZiZGk6CkCI/XZ1IhUKhbnXOlD
 5hXGcROTZC+xkZm0FyHpTsBz70aYGbc6NStv/CpeptIPQRzG9kyBlHBjxTvhpbR4b5bAWkmbLDV
 pRvpbTzzygJjvmZcGwg==
X-Authority-Analysis: v=2.4 cv=Q/7fIo2a c=1 sm=1 tr=0 ts=699f00b8 cx=c_pps
 a=guKoQT9KXu5tcfMvWZCEWg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=rGEzEHzxhIxyek61VA4A:9
X-Proofpoint-GUID: 0EBKt9BpMroIjKFWRpT8VgmUB74v1T01
X-Proofpoint-ORIG-GUID: 0EBKt9BpMroIjKFWRpT8VgmUB74v1T01
X-Proofpoint-Spam-Reason: safe

Device Layer Selector Unit's are controlled by a Group Entity control
rather than by the host directly. For the purposes of the ASoC class
driver the number of input routes to the SU is controlled by the number
of options within the Group Entity Selected Mode Control. ie. One valid
DAPM route for each valid route defined in the Group Entity.

Currently the code assumes that a Device Layer SU will have a number of
routes equal to the number of potential sources for the SU. ie. it
counts the routes using the SU, but then creates the routes using the
GE. However, this isn't actually true, it is perfectly allowed for the
GE to only define options for some of the potential sources of the SU.o
In such a case the number of routes return will not match those created,
leading to either an overflow of the routes array or undefined routes to
be past to the ASoC core, both of which generally lead to the sound card
failing to probe.

Update the handling for the counting of routes to count the connected
routes on the GE itself and then ignore the source routes on the SU.
This makes it match the logic generating the routes and ensuring that
both remain in sync.

Fixes: 2c8b3a8e6aa8 ("ASoC: SDCA: Create DAPM widgets and routes from DisCo")
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v1.

 sound/soc/sdca/sdca_asoc.c | 41 +++++++++++++++++++++++++++++++-------
 1 file changed, 34 insertions(+), 7 deletions(-)

diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
index a0191e5a5a7dd..b6536eeecf58f 100644
--- a/sound/soc/sdca/sdca_asoc.c
+++ b/sound/soc/sdca/sdca_asoc.c
@@ -51,6 +51,25 @@ static bool readonly_control(struct sdca_control *control)
 	return control->has_fixed || control->mode == SDCA_ACCESS_MODE_RO;
 }
 
+static int ge_count_routes(struct sdca_entity *entity)
+{
+	int count = 0;
+	int i, j;
+
+	for (i = 0; i < entity->ge.num_modes; i++) {
+		struct sdca_ge_mode *mode = &entity->ge.modes[i];
+
+		for (j = 0; j < mode->num_controls; j++) {
+			struct sdca_ge_control *affected = &mode->controls[j];
+
+			if (affected->sel != SDCA_CTL_SU_SELECTOR || affected->val)
+				count++;
+		}
+	}
+
+	return count;
+}
+
 /**
  * sdca_asoc_count_component - count the various component parts
  * @dev: Pointer to the device against which allocations will be done.
@@ -74,6 +93,7 @@ int sdca_asoc_count_component(struct device *dev, struct sdca_function_data *fun
 			      int *num_widgets, int *num_routes, int *num_controls,
 			      int *num_dais)
 {
+	struct sdca_control *control;
 	int i, j;
 
 	*num_widgets = function->num_entities - 1;
@@ -83,6 +103,7 @@ int sdca_asoc_count_component(struct device *dev, struct sdca_function_data *fun
 
 	for (i = 0; i < function->num_entities - 1; i++) {
 		struct sdca_entity *entity = &function->entities[i];
+		bool skip_primary_routes = false;
 
 		/* Add supply/DAI widget connections */
 		switch (entity->type) {
@@ -96,6 +117,17 @@ int sdca_asoc_count_component(struct device *dev, struct sdca_function_data *fun
 		case SDCA_ENTITY_TYPE_PDE:
 			*num_routes += entity->pde.num_managed;
 			break;
+		case SDCA_ENTITY_TYPE_GE:
+			*num_routes += ge_count_routes(entity);
+			skip_primary_routes = true;
+			break;
+		case SDCA_ENTITY_TYPE_SU:
+			control = sdca_selector_find_control(dev, entity, SDCA_CTL_SU_SELECTOR);
+			if (!control)
+				return -EINVAL;
+
+			skip_primary_routes = (control->layers == SDCA_ACCESS_LAYER_DEVICE);
+			break;
 		default:
 			break;
 		}
@@ -104,7 +136,8 @@ int sdca_asoc_count_component(struct device *dev, struct sdca_function_data *fun
 			(*num_routes)++;
 
 		/* Add primary entity connections from DisCo */
-		*num_routes += entity->num_sources;
+		if (!skip_primary_routes)
+			*num_routes += entity->num_sources;
 
 		for (j = 0; j < entity->num_controls; j++) {
 			if (exported_control(entity, &entity->controls[j]))
@@ -442,7 +475,6 @@ static int entity_parse_su_device(struct device *dev,
 				  struct snd_soc_dapm_route **route)
 {
 	struct sdca_control_range *range;
-	int num_routes = 0;
 	int i, j;
 
 	if (!entity->group) {
@@ -478,11 +510,6 @@ static int entity_parse_su_device(struct device *dev,
 				return -EINVAL;
 			}
 
-			if (++num_routes > entity->num_sources) {
-				dev_err(dev, "%s: too many input routes\n", entity->label);
-				return -EINVAL;
-			}
-
 			term = sdca_range_search(range, SDCA_SELECTED_MODE_INDEX,
 						 mode->val, SDCA_SELECTED_MODE_TERM_TYPE);
 			if (!term) {
-- 
2.47.3

