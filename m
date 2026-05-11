Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42BEE3FF891;
	Mon, 11 May 2026 14:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778508686; cv=fail; b=WuoN7jsJjAER/tQ8u0Ep/Thzx96JQXbzSWTkWV6njEy/Uoui0AjViEHFK0ph4n/ZOfiVS8GOAIPdgK+ThrMgcA3RyvygH9LH8KysAKWZKcbz0GqschKa9ohEyGZsRJgZah/EHpfDvsgD+OUV7s9hr2LkazTt01hdeSpSNCKMvpg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778508686; c=relaxed/simple;
	bh=m7A+e+bRv+L0vB8D5Ewz3omaf1CXRbc+fCZcaMBB3ts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E6DGfM1fNqhFHeKrFNiL8X/WXJNSO52mtbCHJPJHBXO5/WWYZLAG/TX02sR0XnAdadTKLSGREZh7mCk1QowtBXJmYV9oevjYJ9FhTRj94IGFq0DdQnd6TofSCwuPzb5PutdsVlGli82+QzYtzAeNqIQNovOI14i0zyS/F+UvmhY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=MEe/9QzS; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=VSL7trK4; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="MEe/9QzS";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="VSL7trK4"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B5q0RF2674250;
	Mon, 11 May 2026 09:10:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=xkBaAdwJ+727q0pLVWiKUgXuqX1FdFCqsBJE0JubQSM=; b=
	MEe/9QzS1Qgny7LqVXRZmHQ8BnsouiyOrMOnJIEKn6SmFBc2rh1xO42YK0urJdJe
	DjtW6jYr7PMrwMuyDG17u1UzYnu5vph9HQmPJk0oHXPV5s/hLKpI9lM0ACv1sE4U
	4/+izwiTJWfIu17Xc/XQvAhem8sufNu0CMt/UDHFzxFi9rF2pGw5uOy/ieeB/tG8
	Uynv73igeRE3Vbknk40O+KsIDM7jgW+aHA2h2oGOf8lvA1Sstx+JBX69rieumVjK
	xok9HNuGREvGQkQnseO5agCjg8ENob45kvfndklOZHxDYwyQpEXgMQecSwh+G2Du
	OkM4xlvJQsVy0zxb09hz0A==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022081.outbound.protection.outlook.com [40.93.195.81])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4e21bft8g3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 11 May 2026 09:10:46 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fFGIjaM9RoHjH/MdQe/VfZk4osqDiFTfinL4PxlwCaZ4rYOkWjDaIAAW7ufQKwt1UDYg8EAJKw161Vv44CGs0zWMsAFLgO6xVciQzFH3UEDXrl0kfRNWndbrhPGZ8itiIOoXwJcwTRxhBgkjHZGfsdNbnBAXKzc9kkUAantevm2bj3ySkCMA4tKqJvsS9yF2LUwCPrIQy2RPbi85meGeRsetLn8hgp8poClOPNQWD8sPbeTGFgNumcflrOvYG04uTJ2Pm6QdFHlHkJyutO+MOKScn7MnYgfW2SgJ+0i/doycOwSO8pW/gngkkQfPhxm9QZwQyOn5l///WxgjpLZP1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xkBaAdwJ+727q0pLVWiKUgXuqX1FdFCqsBJE0JubQSM=;
 b=IXr6DaJBDAVz52APAcLBZHnGYgeDbSd7LF4hWZV4J517MhhMKQCj8Sg/tAnC4nVYjtP7HQeRH0NWW5nFbzFehgD1jFhVefnseUSeD09LVyVAl0F/zo/sLtkSGCiSiGT3y2bCcEnppSeCHdObEpcXMlvptSIew53xgSmbFdchzpKTw80BuwtoWeOIL+Ll0f0SG9RQFkB18kuwntj2aLM2hbru7BGIpJLQhoKCNn14f0lVaEVgUkQxjczee5vh+9cpKFevv2xxJgUrKiV5qMhhhio4uy+J3D+FtzNz2V9A/eLzqwdooR+2KMggll7fQIcYcsZAcg9wZzpjyGoHZ3mroA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xkBaAdwJ+727q0pLVWiKUgXuqX1FdFCqsBJE0JubQSM=;
 b=VSL7trK4qI7FhO/P1spgSEw+7L+cozJ6FG0DGxex8nj8YZ5ezzFssZMWt/w38w6b5l1Hhj1LHIEn6P3owlXJeHK86HEQwBiBi+8jOGyYR87G1rq5MmqTXttC2T+kFUXXAogla2t05sMiqeJNzOVlhnvY0USAk/fVc/Gbzyh2OGQ=
Received: from MN0P221CA0023.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:52a::9)
 by LV1PR19MB8912.namprd19.prod.outlook.com (2603:10b6:408:2b4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 14:10:38 +0000
Received: from BN3PEPF0000B36D.namprd21.prod.outlook.com
 (2603:10b6:208:52a:cafe::f4) by MN0P221CA0023.outlook.office365.com
 (2603:10b6:208:52a::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Mon,
 11 May 2026 14:10:38 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B36D.mail.protection.outlook.com (10.167.243.164) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.3 via
 Frontend Transport; Mon, 11 May 2026 14:10:37 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 9639E406560;
	Mon, 11 May 2026 14:10:33 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 5EF5582254D;
	Mon, 11 May 2026 14:10:33 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        niranjan.hy@ti.com, shenghao-ding@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v2 10/18] ASoc: rt721: Use new SoundWire enumeration helper
Date: Mon, 11 May 2026 15:10:21 +0100
Message-ID: <20260511141029.851125-11-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260511141029.851125-1-ckeepax@opensource.cirrus.com>
References: <20260511141029.851125-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36D:EE_|LV1PR19MB8912:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0be496bb-16bf-46ae-eaeb-08deaf6713b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|61400799027|376014|7416014|11063799003|3023799003|56012099003|16102099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	d9GukbNfWFpfv05+gDTAIfts+V1PPZs53Nney5duJod8KXk9ckiGd1E0WyMic5ObhCSNm48nix57/NBnJO7rCH8FbqoC79/vvgKNLhYXzvfSbpRYrhi/BITabmBOIVfAKhJbt1b3IOPtezCHpyN2NLxvqTpqYR4FbmKD5N67BL9q32cBNBHH0grQts12QlmRB/q+B9UTcBeJrsMcw19cZnbyZmx7kMQrxTRU7zsfLasTLsVF1u7BZG6/DivDtmaoWa8Dmw+sq/yWjfywBNqWvVuPK0AWgtz1GvkrhdrTYlzGGhOx9JhaDXCV5ThYMTFp65iDbma2XUZCVa9ANiQULYty/yWBMn6ETXbYDvr36nkZporEFwL3qtweAxgy1uGPtbDwQa5aYiTgUhI0TCatzq79C32f8fdKe0D0Dg0Wvaox+MPV5ErZeygLQWParbNrZbWsbDweNWd+lZrYNbA4cOk+W8eDhg+huaHdtjPAxRgzlqF0OFb9+S0nUeHrqQGYbGWvELcOhZKHSb29S13IuWs0RC6Kj6f2yvD8IKxGodQLu4PbiFPoQhkGsHxokc9xBSNOAf64N1DRLw4gFuMnqam56awglxmnFY3p+fSTZAPxGThg79AfFCYdssTYkwoMHXdy/yPYHLi+lyKW5qB+vQuOkmCOU+LamZoYr2v8AvTMoBH3+t9CQ4oh+513n9ytBjfyK2g83GUG7yzt1daE9sJJMYLLjNrd5LZ7/GxuPf0=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(61400799027)(376014)(7416014)(11063799003)(3023799003)(56012099003)(16102099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	H+xrll3LvS0Ozqju9jU7HG25UvtRCAUg296gtPORAUZ6Rl9Ku2/bCtLVfXGoefPiZvykmU8gwpNYF7Ptkzc/1CiSv1CnUQbYyUEULdPhP1/PD8TkS9Dezqyt9amWfFVu2SAJ4CtikyUbgLsv1yW4RkLPXj1o3kUDwTQPqndpTYfTNnvnRnNtMNMgNSmpNefH7H0Z+YC5UjszkEnlWSV5bSZskZ3Ae5KcRIpr3w+vXJoSckvKBwy7PiBSBDzCN+vx7Ml4kgLn3FCiibnDM/t5XK1/8hrb3359BDMNLvtUx2vzgo3JEQawMjbLl5TLcMqRJcTYARzKtFtEyglo+DEID7uCM2J7vYkto02WHOsCRbWXcaU26ssHfC7JNp+E0NooU4WVCMYrCul6R2kkjEX29ik40i/Zza+hxUZZg8F9It86nx7JDnZFVu1wunw9JKRF
X-Exchange-RoutingPolicyChecked:
	oBjTsKvfLxfAHfUz1YYvL3CzSYDC8ozxs/uiJUq+ohp+CrIjHXX6od3D1eHIqEm1iPnTweolDs0620Mrne9+dkn61/bv1iQp4TbGeEXUURE1fVnA9DUNf+yywhROx7UMs8NdDXC5z7PSu1vUxP0ZaLp8jZwQ65mu94z2k/wIBie1IQRd7nLqm6wWsea5keG0j/p7+GPbbiiPhs8yYU5JGkwge+6gCUd1na75bhKuIH0EdJTdDZsy9bhhF5bbQ5ZeqpuOypBlr1ufsiR6LIDcvVcaflpagNDJ49WM6c3I63+uJTpFc/rSqr7TSAzt7lZlGBBJOQxlIEhGnDvUkpRkzg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 14:10:37.7921
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0be496bb-16bf-46ae-eaeb-08deaf6713b1
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B36D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR19MB8912
X-Authority-Analysis: v=2.4 cv=DYsnbPtW c=1 sm=1 tr=0 ts=6a01e366 cx=c_pps
 a=kzlga8Pj6Xs+ezKxcisf3A==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=_kLIPOSdNJ7StitxxVsA:9
X-Proofpoint-GUID: PwntaysYcyFLFF1zkVLgQjhS1TdT0blG
X-Proofpoint-ORIG-GUID: PwntaysYcyFLFF1zkVLgQjhS1TdT0blG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDE1NyBTYWx0ZWRfX/9LYHpKMQVFX
 nO+sfriA/82O7EzDCWQJib2UgksZCcRImMhKr76UQ92LDgSU8opBOdW52v50upWoMYgjnANSSII
 3RHxWKfMXvuCzug7JYo/jncjNDukcJvuCTioPLJgNBsokSpNHqK9TsmWKffRy2M4Xzdb+7/HyY4
 DmGq7C9Z1mdsDt8z8T4qQhY1j6ekJVed5iTiEr8DN4EMWMeQbD1JZ7+tjlo3iN1MF4Syd/Nln+F
 o+jiRjVYYkesQmqAq+/wweEzvJnB4gft3rTm3klqsGt+4LJfP+WkgpaB/910v7L4aC85ncfrIF3
 Fk/HEMrVgih2XoAdH+DrUmk2FlCClKhAApQ3eiB8QDMeP3hN72+pijvj2fHYY7K64EZtCXMDa+8
 /QMMkFa+H7jHHKuBLUhTTt0BaK8AUDylfGlB3tv/9y1QuwT6lr3gebn2JJ4x3I2SRyVuQNGzhzG
 q3004aSIz1axnzxHwtw==
X-Proofpoint-Spam-Reason: safe

Update the driver to use the new core helper that waits for the device
to enumerate on SoundWire and be initialised by the SoundWire core.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v1.

 sound/soc/codecs/rt721-sdca-sdw.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/rt721-sdca-sdw.c b/sound/soc/codecs/rt721-sdca-sdw.c
index 6eb8512975b85..58606209316a4 100644
--- a/sound/soc/codecs/rt721-sdca-sdw.c
+++ b/sound/soc/codecs/rt721-sdca-sdw.c
@@ -489,7 +489,7 @@ static int rt721_sdca_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt721_sdca_priv *rt721 = dev_get_drvdata(dev);
-	unsigned long time;
+	int ret;
 
 	if (!rt721->first_hw_init)
 		return 0;
@@ -502,20 +502,12 @@ static int rt721_sdca_dev_resume(struct device *dev)
 			rt721->disable_irq = false;
 		}
 		mutex_unlock(&rt721->disable_irq_lock);
-		goto regmap_sync;
 	}
 
-	time = wait_for_completion_timeout(&slave->initialization_complete,
-				msecs_to_jiffies(RT721_PROBE_TIMEOUT));
-	if (!time) {
-		dev_err(&slave->dev, "Initialization not complete, timed out\n");
-		sdw_show_ping_status(slave->bus, true);
+	ret = sdw_slave_wait_for_init(slave, RT721_PROBE_TIMEOUT);
+	if (ret)
+		return ret;
 
-		return -ETIMEDOUT;
-	}
-
-regmap_sync:
-	slave->unattach_request = 0;
 	regcache_cache_only(rt721->regmap, false);
 	regcache_sync(rt721->regmap);
 	regcache_cache_only(rt721->mbq_regmap, false);
-- 
2.47.3

