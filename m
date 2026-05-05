Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3DED494A13;
	Tue,  5 May 2026 16:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777999748; cv=fail; b=JXA39phSNEZgQ6DF2LVnJaZL/fg7orly7nXBLklzP9h85wkni2mRZkUFS/Qll39480suvIO5I40pb1gZHGUKdmvIzq/FhRtfVM9MSJviU6cyf3Fiwu9MJuMLR3qsJI1ZfJ6rN2zAVjovvBpwWOGJGR/ECVppZ1GFrxlW38r1QHs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777999748; c=relaxed/simple;
	bh=qNk9KtTVvGScZZcDOBbgr35fcVi28eh68pnD5aWb+84=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P5M2GfEroLhJNa1bQEA8wdr8+FBl/7V7cf/HxAFmUf34oaPnj93XeI10avY2DrCX2lCkzLXG+xtQguYtGwFnKFJU9XQ+nL+um8zXoAcEem0UHKYNMLDn65bHNc+d/LEphJtW8MFFNnZ0xk1IZrm++bkrPwpUl762YmR611+xO5c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=b6+FEO25; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=kCoIYO+i; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="b6+FEO25";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="kCoIYO+i"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6454truG535416;
	Tue, 5 May 2026 11:48:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=F7SQ9z+ezTyC4RGAjZQj9KpdOmwik4Qx1ebAlNC+X9U=; b=
	b6+FEO259o1gU15q1vDNCbKjcLEelly3Xb74j7nRFu+NDk8tLUYcMs2v757J6yhi
	WqW5FFYhD7Vw6Z4Gko6NxPiw0IQE+uK9PWYtVWJvwkob9trGL5DBWAWoZ4pQryX5
	+Cug/owKAFesCUDRmpqVhajStzwZA9AgehzhF0XPbmZG1WWb3/a2wXF14nMyPb0t
	SlzjUP1/Ga7w9t2137nD6i0i4/2iTocCNCKGQj/PBkqaYt2gJe+hwmDGjHmBrajb
	/qimP1HMJsgxJN4rIDHPizAAJhXWIBcJV02CLTZwRZysqfFRXJ6Gf34X9j+F+sG1
	3q8PBSAbfnas1RIjm/AjOg==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020099.outbound.protection.outlook.com [52.101.56.99])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4dwdpk45v2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 05 May 2026 11:48:19 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tIrc7DGEcmlY4rtqTA2uZIEOCCBQ2GFTTirq8sTZIkbC7ndmhQZ8tfMri94ZmSn4HSHlH9ivyiw4lawg31ekQkyzjg10mdZ+wlp0qEx9ml0DySxmv7+O6I0TqD9kQCTVqssdFmb4BdF9/IfPrDVomr7y8vmCGp1F2wQHdeOa8Cqc7XOmlRgmgDiGsmvIfo15UCTyvytkX9xr3MBJa2sWOYGCw1+VeCxyUj7jtTz732R3lR+15IPqYq8l/O4YB7mF6EA78t/8KmJy1oEI5nQWmTT+K3s91qKlaijff//smSxqegOa58xkx1wV3g1VOt7dTQJa/NJaudAtaO+ZAuMAlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F7SQ9z+ezTyC4RGAjZQj9KpdOmwik4Qx1ebAlNC+X9U=;
 b=El6qImu/U3dDFuoQ+87aBHm+aRdaBQokzKNh8GgqwVeMPMIeDhoLYh57D/KW0GY13mk/O+IEcpHcCn0+dHh+l6UromHioufdfbx/Q6oFTioPb1EvxFHM8f4kkRZ/S5uXHXXFJ2nFLXooEzqktqkazA+Jj/2s+a3rX5yWkrtdhjJsalw6ZwU7EF6uqPJtcsRTQT7gYuuzejk1yw7r9mRxVoNre0nnfDH6qAg4U34ScPzvkJpdAAc+iqAy1skKuSAutPW6qTcJXQvSTUi2xmJh9R39AtJSZx7XHSNH+Z5XQ5DYcVBjWuiSfXX1LUWpHf9iyexD5S/PTGhES0X1Y7td3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F7SQ9z+ezTyC4RGAjZQj9KpdOmwik4Qx1ebAlNC+X9U=;
 b=kCoIYO+i/WZFosu8mbuRWG7uiGXLX6gtL0emd+2OVOo2sCEsLv1pH6/c9cRE+DrChKEBOwVzdEfMYdm9Gl7Eu6AkDVhtLJGzzPHfZMQ/MWgyrmWfAPfKXqfVok+wbk8tD7T+2qE5ARryg3nAzLPBiKUqQQXJK1F8U0NC/acT+BQ=
Received: from SJ0PR03CA0159.namprd03.prod.outlook.com (2603:10b6:a03:338::14)
 by BY3PR19MB4897.namprd19.prod.outlook.com (2603:10b6:a03:363::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 16:48:13 +0000
Received: from CO1PEPF000075ED.namprd03.prod.outlook.com
 (2603:10b6:a03:338:cafe::c7) by SJ0PR03CA0159.outlook.office365.com
 (2603:10b6:a03:338::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.23 via Frontend Transport; Tue,
 5 May 2026 16:48:13 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CO1PEPF000075ED.mail.protection.outlook.com (10.167.249.36) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Tue, 5 May 2026 16:48:12 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 414A140655B;
	Tue,  5 May 2026 16:48:11 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 02A0D822546;
	Tue,  5 May 2026 16:48:11 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        shenghao-ding@ti.com, niranjan.hy@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH 06/17] ASoC: rt711: Use new SoundWire enumeration helper
Date: Tue,  5 May 2026 17:47:56 +0100
Message-ID: <20260505164807.4108684-7-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260505164807.4108684-1-ckeepax@opensource.cirrus.com>
References: <20260505164807.4108684-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075ED:EE_|BY3PR19MB4897:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a88b77b0-1006-4a8d-9595-08deaac618f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|7416014|36860700016|82310400026|22082099003|16102099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	dm/2fqcJGMu8XhpwqjYGx2Pw1fSCQ99O0DAZnI1t46pQBF+MLS/Y31qeZQfaBM9hOMiweA13ykPUtR0XNYWIH0HoYWxxwfDyaTjpfS4n3FWkdncnppYgyzuZqariG9AEIGj0pt6xjEQHvalLUWZjqgaWsRsFnbhugimiw6sECTQ4QkUhmRHbAmYOY4ra5ZnFmKf7xe/W1wUDd5c6JLNEkTRhs28RDmhKnZmCSGapNhoXRzraH/t8MmNr0LI+jbfKF/HLaJzX7JXAC9YLTFGKDXUkr1FwZBuJdzL1ZT8n0AKdsARjMZjismp+yjw6EUYNDh87iPKSGTsgPVn0O7qn3o1CHxLBIKJQpEyc2RTZhD+EeftK9ZpRD2/ZJZPDaeGHzqnktgRF4qRAJLDaJP7jBGiA2JKrcHN0EdSkC/kGryebnNIm2+JN1MjbLNrbP4wDn0QbMPvILtAq/OVnE2byMehIaK286vuWrvZ6rtfF2HB27aexAgARNamf7n81nBNY4nSmsdHXO8u9CB2f83u/dh8dBq+Qlr0zGglvsLVXqy+cvDe/OkGF+T9HJ+jH4OUkBbwXGSXt8vtEHPZd6rO985qZH9YA0z/FYiC7B/2HZ9Qj/e7uj0v91sOkVnAoPVtP979MaBUZzpX4pwZbLye3e0mj8Ql1hfh2XOTyrm/5eYaWgth5ChON3p2y40dqP2FXDXsRnoOrBBZikjOGk+yqabE3LzCQsFpF6Dsa+Ot+Jc0=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(7416014)(36860700016)(82310400026)(22082099003)(16102099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+xSQlHHrqnZBWJpgcx1Dudj4tKbmogabPW6iKrKb8/TRl2CGaYPh86o4QN56ieZOOr17+QqcQiugD8gHdd/hEwMUAQz4HgiaiTlKh92gdFhibRWZ4KK0jpZdxtjuqv9K6+c/kl8g+I1yWK5P/2kKHhx1OzgYeUB+RhXZ5lEDzLoGMCuNpEHa1Epy3HBJJPiMFNYfDI8D6xNTnhx/Fsadx7MPJSt0Ua46OopBs4DH8aKOOiZdn5Ldx8FI5+FERm4o4s+kiHpIYM2ttZW9VN0BXDRdK4WWmwuFzvPp+yC+/n53++1Bo2q9vZP5n9a5+S/iker29Qx5iz1ilkvk5f9YGmZNL7n+/e79QD86jSWNanwksMtvlAW8aRz2x01o88Z6ss4nJ/H9yh7YcwM+fPsjQ3Q5dy8FxG4COphGI7gnRBTn1OcDDUJDoYNf3s/vDmWq
X-Exchange-RoutingPolicyChecked:
	cv77O93JmwYryiDoagyN7S86KaTKC/0o8Mi1H7qGRwwCy4SMSQydzkC/wRszUCiHw4aIdhFRtBRiH8jbuKpFZKpkyXW6Z/ZuBC00eOjgJaebJnyxbuWe3mA0dpWQIFfezhj2WhJCYxQOxL1WbHwgvBdvPAp5pqjc8JphF+CXzulpHUvP9Qyuk6OEYDSRWEXgGJzsVLprBQC87MMKAh5uHATkhlmzdWpIaEpeT0x+ZpG8360uN6HHdIwsMJl0J+UhToGRFe02T6Kis/2c9CYOg/On+ueIcPVT5fwunlPbHpWAbzw9JcqGqnmZIdBQv9fSxvhL4qlxDkSV8JgDtIvuIQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 16:48:12.9093
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a88b77b0-1006-4a8d-9595-08deaac618f8
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF000075ED.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR19MB4897
X-Proofpoint-GUID: cz1-1HPrAEjX_qadhPDXlhWVD7Lj_xiE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDE2MyBTYWx0ZWRfX0nq/mWnv5g4o
 4cGvmfecyMcMUbUnViYx9aRSkq7xuzn/mzmhfn81IW4OM6JvahqQ5jzRL9cMkHcyxDsxWExe+da
 V3SaarxICqK1qgpK6m8GCZDdmzTIN/gLTDFoFmfmg/Ug6IvdGer5j3nmp/Czd0Mljw4hNkQXDLk
 khWhyI95xrAMU3cXlec1oKguqldpZa9svQqVGCDoc8pJFufdMZQx7rvrMnuhHAoTbf2zfswk9BD
 556ZX6QWy85dF74fbEnynYl3OClJ+9IxNPs4AMiGXK/qkDy2ic2XyApVOTxwna354pdyo9tnt5A
 WOVl1Latd/vHDsaI48/ZSQMSfPq77+dlvIKQ4pqk4TC9HrFxcK8K4X9kQtHd14hxIHohcN7cT0X
 oe6tlIjkMzO9dlA+iYkzU60/2DX+/L71p5gj0QZreh4N3zrMbfvf3Vm84rGY10+Lcdqq+hMgxGO
 iK5HQCvgq8csfBJqljg==
X-Proofpoint-ORIG-GUID: cz1-1HPrAEjX_qadhPDXlhWVD7Lj_xiE
X-Authority-Analysis: v=2.4 cv=LZcMLDfi c=1 sm=1 tr=0 ts=69fa1f53 cx=c_pps
 a=gw0jr/XWmcdhwQv4PjOuaQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=RuJZr_uWk9hIvXmwfU8A:9
X-Proofpoint-Spam-Reason: safe

Update the driver to use the new core helper that waits for the device
to enumerate on SoundWire and be initialised by the SoundWire core.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/rt711-sdca-sdw.c | 16 ++++------------
 sound/soc/codecs/rt711-sdw.c      | 14 ++++----------
 2 files changed, 8 insertions(+), 22 deletions(-)

diff --git a/sound/soc/codecs/rt711-sdca-sdw.c b/sound/soc/codecs/rt711-sdca-sdw.c
index 49dacceddf815..a8164fc3979ab 100644
--- a/sound/soc/codecs/rt711-sdca-sdw.c
+++ b/sound/soc/codecs/rt711-sdca-sdw.c
@@ -438,7 +438,7 @@ static int rt711_sdca_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt711_sdca_priv *rt711 = dev_get_drvdata(dev);
-	unsigned long time;
+	int ret;
 
 	if (!rt711->first_hw_init)
 		return 0;
@@ -451,20 +451,12 @@ static int rt711_sdca_dev_resume(struct device *dev)
 			rt711->disable_irq = false;
 		}
 		mutex_unlock(&rt711->disable_irq_lock);
-		goto regmap_sync;
 	}
 
-	time = wait_for_completion_timeout(&slave->initialization_complete,
-				msecs_to_jiffies(RT711_PROBE_TIMEOUT));
-	if (!time) {
-		dev_err(&slave->dev, "%s: Initialization not complete, timed out\n", __func__);
-		sdw_show_ping_status(slave->bus, true);
+	ret = sdw_slave_wait_for_init(slave, RT711_PROBE_TIMEOUT);
+	if (ret)
+		return ret;
 
-		return -ETIMEDOUT;
-	}
-
-regmap_sync:
-	slave->unattach_request = 0;
 	regcache_cache_only(rt711->regmap, false);
 	regcache_sync(rt711->regmap);
 	regcache_cache_only(rt711->mbq_regmap, false);
diff --git a/sound/soc/codecs/rt711-sdw.c b/sound/soc/codecs/rt711-sdw.c
index 72ddf4cebdf36..df3c43f2ab6b8 100644
--- a/sound/soc/codecs/rt711-sdw.c
+++ b/sound/soc/codecs/rt711-sdw.c
@@ -530,7 +530,7 @@ static int rt711_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt711_priv *rt711 = dev_get_drvdata(dev);
-	unsigned long time;
+	int ret;
 
 	if (!rt711->first_hw_init)
 		return 0;
@@ -542,18 +542,12 @@ static int rt711_dev_resume(struct device *dev)
 			rt711->disable_irq = false;
 		}
 		mutex_unlock(&rt711->disable_irq_lock);
-		goto regmap_sync;
 	}
 
-	time = wait_for_completion_timeout(&slave->initialization_complete,
-				msecs_to_jiffies(RT711_PROBE_TIMEOUT));
-	if (!time) {
-		dev_err(&slave->dev, "%s: Initialization not complete, timed out\n", __func__);
-		return -ETIMEDOUT;
-	}
+	ret = sdw_slave_wait_for_init(slave, RT711_PROBE_TIMEOUT);
+	if (ret)
+		return ret;
 
-regmap_sync:
-	slave->unattach_request = 0;
 	regcache_cache_only(rt711->regmap, false);
 	regcache_sync_region(rt711->regmap, 0x3000, 0x8fff);
 	regcache_sync_region(rt711->regmap, 0x752009, 0x752091);
-- 
2.47.3

