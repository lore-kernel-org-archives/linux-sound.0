Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8103A3FFAD4;
	Mon, 11 May 2026 14:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778508690; cv=fail; b=dpvLDE2qtXUk61JKXG8Bbk6CqYH5sZcRu2uzLLlSjdI5y5Y+wRnnTIXHJIEUtP0BS2r2MGzslBZ3K6N/cOVFxMSI2mJ44sJvXNw/ltbjqxzjzosmd1kbBObkCokBb5QBSNhkH8I7vqm5ozzGdX26UEz+5CEB7jOkWIItA1YIeO4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778508690; c=relaxed/simple;
	bh=rr1i13pOHicgGCb9BdiIVY0Rrq+Pdv96JgeXdnYeBDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fMWhjEEWDJe/QIVRHAS6yZbqTqIYbwW81aWNgp2NEQDM2Ap7wrNjrS6VLSTfXHabJshBl3MkP1am65ePUfoFuF+PpELfdoTx4a0dGuDb5BjQUmpM7TlIzmrwYFzcbV00hnMOuFv98FF423fPOBBsWqec4Ptl9+MZwa6W4rhZTGE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=SeamF9J6; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=AbNyv/jr; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="SeamF9J6";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="AbNyv/jr"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B5k8JE3453589;
	Mon, 11 May 2026 09:10:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=ydX/lSnC5xh03+qbIi/R5POKPSm7SUIvDB3wmk1Doz4=; b=
	SeamF9J6YhpwY2wzbXSfXlMjMAEK5tw84LCxMfHapyF3wc1So1sHDu+sfUb4/w3R
	JwHdicaot8sE6TEHKQh7R5BpX4246LGzc8N1e7h/h0vFEAYKhZyjCGfniJUcL6ie
	PmumtQRGh492ha1GPXPIE1z4FF0W66jva6F4fy0wFCVB2OkmwcQ134qO8so3GVD7
	R2/e77qc6/hL18yCr6+WQJE0wfsdjydxkRF6rCcCYozIJThOI4l2hGGVaTCxW5gG
	MLDZ+9R3ZU2IYdEv0zsQG9QIzVphglSwC9qmhY1Hr6OfN3g2UA+vUNN4CfOrmj0g
	ewhux8o86rA59UO4fZc53Q==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023089.outbound.protection.outlook.com [40.93.201.89])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4e22b0t3u5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 11 May 2026 09:10:44 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WpEgx7UJZVUPfw793UOkN5AXu8lZkg4GOCrjXtmYgkWL03lno6RsMwV92AMjVP24JjKGVoj5XMaIDMaVWE1vxzn9cIRM7r7ybacFRl16636XiC8u2wJ/SjNNVnGWiVMl+RtaCToTOyv5hbhOKBA9LnD1DlMgjv7a6iQeAoM3lsUIp2pMOP2QiyhqQo+DG3jjSwbzvpqGHqH0e1Llvjbr1GRh6ElDURxXdXW7j0zs3MSb9+RobPD58vaVXsvD248XleT7nE6btlglpxFzbEEtr3XD40WTkjjv52gDqjc2CIsH785f5J+CrRolY2C8+EPwjxcRivaQkNzj0M17qQXHuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ydX/lSnC5xh03+qbIi/R5POKPSm7SUIvDB3wmk1Doz4=;
 b=aFZXuuUtXeM9b4WmwF5AQtkcSpLZ1g7pplvNS8EzcNdpPaglVCJeuGX1g0MBOfwTA9UALTHiksgPDVzwsO+av0/70vwDiKzYvy/LM1oal6vQ2qIPg8GPdiPArZw/HL6btQKwFOOZovnkxn2WIn77oInXyfzo7HxklrdvkmfUhTUt7PQ6okDQNb8f96jTbn0z/tbvC9DGBpbcrkqtklMN26uCPiBMGYwc+PmxdRfWxbYmom3K13i4pzuksQ1BLjzl2BrDD3HBIyX7vB2ZpSpdQx/yf2ENr998XP/ejshr5Syb3LCmUCBfc8jVArw0e5tzhtXo/qQzjOrX3edfz312IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ydX/lSnC5xh03+qbIi/R5POKPSm7SUIvDB3wmk1Doz4=;
 b=AbNyv/jrTGGW290AmQB6vrxNYsE/lNhlwI928r0gyDNnyddNeqlOh1bIgvbw5d81QcOGHWKIMNPGQWfJO5KCyh+JbpQAFm0bsl+lDXuYFN6AFs4po1NJccC9skRodUqw5iVI1Uci2r1wFj9vkQzrYh4xXbRoZE2Rl9+VET+k4Rk=
Received: from BN9PR03CA0738.namprd03.prod.outlook.com (2603:10b6:408:110::23)
 by CO6PR19MB5371.namprd19.prod.outlook.com (2603:10b6:303:146::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 14:10:39 +0000
Received: from BN3PEPF0000B373.namprd21.prod.outlook.com
 (2603:10b6:408:110:cafe::9) by BN9PR03CA0738.outlook.office365.com
 (2603:10b6:408:110::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Mon,
 11 May 2026 14:10:38 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B373.mail.protection.outlook.com (10.167.243.170) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.3 via
 Frontend Transport; Mon, 11 May 2026 14:10:38 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id A0447406564;
	Mon, 11 May 2026 14:10:33 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 7FD7282026C;
	Mon, 11 May 2026 14:10:33 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        niranjan.hy@ti.com, shenghao-ding@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v2 16/18] ASoC: rt1320: Use new SoundWire enumeration helper
Date: Mon, 11 May 2026 15:10:27 +0100
Message-ID: <20260511141029.851125-17-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B373:EE_|CO6PR19MB5371:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0d0b336f-dad6-46be-2384-08deaf67140b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|36860700016|61400799027|18002099003|16102099003|22082099003|11063799003|56012099003|3023799003;
X-Microsoft-Antispam-Message-Info:
	/AkqmTB3RGm9vvIGzSna630ceUUz+5buUn0umeXWgMlOaFwYMdoDPyFnSIv7DBFcGTQ3PI7vY7BKhoijouF7yp0O7xU1gbXs1DeDpv8arvZ8QDUEvv1eg9H0hFBVGtt2NIeM0NkATNyv5TMkpMa+YB/GquJ87V7OM7Ye/e58bXEON5QLYcyhM8vOYEDR5Cpr1CBmSfqY7VpT5Cf4zWPYoVC82ZAgbRnJhqhW2kc+Kn0//YeqS5R1W68KltecFLFG160YYNIbdlcNt8X7CYZZ+EQ26I0QXtn0E1DWORCXRE0/e4LoaCuNGLukhbBg/JcVERp9Scs6b5Od9IGXS3/Rs6/xvD6iGyH2qxhwNB5UQDxkIW7mkba+jwvT88n8YywdRxqvPLP46aVNS7ov3EOaZMEBycqyiefQ7vua+y6I6V7BPLcEy/0yl+lsbj+p59oMnin31xKHJtbGzkzuyBBqOYUEJyAsKvodXoOu7gvWBpol/erpcvxO9XWz1Un8SWUYWFrhq97/jFPDcNBe1n1GiNWL6cxxwmmm/2Fil+b8WL0WJ7G14QbtRFZm8uNWcN2LD2WVmBJ3+Bj8ctwpUaIxrZeezEZQmgM6+hasCqd6KqUuWJjVqY3yMevMlqNpQztpicn1GhxUK5qgVn0M+KXJz76SXAAp9Ys3QA2TWzf5Cw2PhyeWZtbE8b+WVIAoGznXBVd0JPSiL0hyDAnbl0SGj2+Qbcrl2YSJ118hzlIiFL4=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700016)(61400799027)(18002099003)(16102099003)(22082099003)(11063799003)(56012099003)(3023799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	J/aFqlbMnzw00pyb/gD+rZI7VSE6h9lc2le4rbl1dyeuS3XT78VcM5S573ePB899J9jQtj+DtfFtrqebfIUgrCQdulY1rZEdkN2Xe3T1u9aw73nt3p4FxJ2XAzjt7rj56iZTHzSzHc+koqAIu8QlexkaDaHRK2Rx9zY7mrUMN4IYjZtDvkBzRm0vlxFnF90VeSXyHQZJPhbmWpqJwWMwtiVWJN1jkF6wECVUwvWgh/L8mdSVbu3vbpYSALxbkRy89WiC/ymIOTLO/F4wEhPhQdnTxmBx+M/mF9P9hw8EWpnPbmWUhQK7tsDiRFKr5YwDSYoaFcA3BBXyjXdMo0O+Y8G/SAxTOH7Gl6rGxi966EHDTA0Zp+Giy+7fxHnaB9ESczHucrq7bI1Qm/9rehvqwSkdntuRgqgG4Z57mpEPDkSpws+WTxOK6runmST/rOKd
X-Exchange-RoutingPolicyChecked:
	JVCZVbQ0IGQznV/Wbp0dCom3xlFU7YJwVDAG+SdkAqzilgZhxl/o2DbBHBd1wnwosn8Q46KU2bEA4KXVEFs41Y6w+rNx3ZYouvh6BSbNL5t41ABbqzKoVnuTN4LQ8VP5hAqrtkypBuUDhTE0I2mhKzL5jfJh4t0+Kcj+1FN+Bl5sgnLApYnA3J47i3MPWDqyfr1k2l9Z8sS1Xi31rOQw8RWj9KxsitX+8wzfAApev4VqlFEOD4YJkhfbtWFjwFFpvLVW17lR/fZxBWi3AQco/uA9bM7ZdqYXtGj5N6z/dctD9tfcm1kvO5D4SY7JI84da1lf1XCZAZubKdL0Ta/xgQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 14:10:38.3764
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d0b336f-dad6-46be-2384-08deaf67140b
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B373.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR19MB5371
X-Proofpoint-GUID: SRVOCzb782rKBP0xB8OSkmPq41rl7DpY
X-Proofpoint-ORIG-GUID: SRVOCzb782rKBP0xB8OSkmPq41rl7DpY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDE1NyBTYWx0ZWRfX16xr6JApj4D4
 /QeQnCBy2645iU2wjCCbCqcU/ImctZh7fukoWalRaG29x91200Ys2NYg1/zW86UqxvbQIVKCpQ0
 4TnzHutVcBTH92jc2Lx8YQpIExYwEfU7jqqfmRa26UhoKEBJ98v1wA+HjKtvy4qUQ2j240BGRnv
 GT4NAbYF355eOflgwbW2Uxqp+pJDqTGgX+GFSZylyZualG19kWibL9aUcgwe92eGrv1kvHihUO+
 FRRlene8dWiwngVaQRxnw8+HCB8NEAh8Y7O2RhWxdgKSTOSNHZvVMK4jgErJWFUw82eqMlXP0w6
 5TyH227/nG8v8KET+Ew/gXfgdRS8MAPtdNhRSv8S4+NoA34wTo8N1SEGsc0ly7c6U31OW38Q0T1
 Oiy8DKLQYBg2Muf96NaQaSpTNEBxsbcqU2djUyJ8MsFks+MHbZcytp4xY5oz46L1KoJJ5zydqnf
 B+MlGBGoPv5eMoCYlRA==
X-Authority-Analysis: v=2.4 cv=UdxhjqSN c=1 sm=1 tr=0 ts=6a01e364 cx=c_pps
 a=RG8qMewYDjj7uFcuyQSAxw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=_kLIPOSdNJ7StitxxVsA:9
X-Proofpoint-Spam-Reason: safe

Update the driver to use the new core helper that waits for the device
to enumerate on SoundWire and be initialised by the SoundWire core.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v1.

 sound/soc/codecs/rt1320-sdw.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/rt1320-sdw.c b/sound/soc/codecs/rt1320-sdw.c
index 192faa431b5e9..13493b85f3c95 100644
--- a/sound/soc/codecs/rt1320-sdw.c
+++ b/sound/soc/codecs/rt1320-sdw.c
@@ -3053,23 +3053,15 @@ static int rt1320_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt1320_sdw_priv *rt1320 = dev_get_drvdata(dev);
-	unsigned long time;
+	int ret;
 
 	if (!rt1320->first_hw_init)
 		return 0;
 
-	if (!slave->unattach_request)
-		goto regmap_sync;
-
-	time = wait_for_completion_timeout(&slave->initialization_complete,
-				msecs_to_jiffies(RT1320_PROBE_TIMEOUT));
-	if (!time) {
-		dev_err(&slave->dev, "%s: Initialization not complete, timed out\n", __func__);
-		return -ETIMEDOUT;
-	}
+	ret = sdw_slave_wait_for_init(slave, RT1320_PROBE_TIMEOUT);
+	if (ret)
+		return ret;
 
-regmap_sync:
-	slave->unattach_request = 0;
 	regcache_cache_only(rt1320->regmap, false);
 	regcache_sync(rt1320->regmap);
 	regcache_cache_only(rt1320->mbq_regmap, false);
-- 
2.47.3

