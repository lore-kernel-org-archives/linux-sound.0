Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A253F3FCB2A;
	Mon, 11 May 2026 14:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778508681; cv=fail; b=eHEt8F/hUD8kzdMsZcmlwLgkqssBQ0+DK1hne/OoACvBe6ZMB8a4SwpNJuf3ZpMSA6rYL4wKyuVmJ2940wxvJs14JmZG36AwT1W0iovi8PV9aeELBPLCJ+Z5cEgBOxEeYtvnBSZKRFzVxG5IHQUc6uFMw/vwkSUXqt02LCw8OYg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778508681; c=relaxed/simple;
	bh=K8nhGfY9nb34rIcMr5JMETBKWtGKdQuoL6osZxanjUw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TJab0oz269EN/qRW880XXCIYIUlJjz1KovaYD3Eb4Qf5Bgzq+evNJE3IV92VYBnVz+rIyC/uhIjBGi0LPv0dAOu7kBNMulVPONyUbYpkpveejvRFY5MqxZbIYl+yiQ7Eo4EauZfW5mkUwjXt1PQZfLaLs7+XbnCdswpQ68IaJOk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=PJZ99AaE; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=tt63Agil; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="PJZ99AaE";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="tt63Agil"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B5t7Zk2679596;
	Mon, 11 May 2026 09:10:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=d9pfQBZhG72R6X/zJh+CbVqHJaltHHMe8ZOd5Oc35J8=; b=
	PJZ99AaEEO9JFjoBME8YhNwOj92DDxSU9rvUXp2Rr0ZORlgDYgPODsVFILVp4fXa
	0jYzqbeJc0+hy3/rUHd4MyxvYX3Hj5CUkBXmrcPUsGZVPLADF04EMeRQkh1F1pg4
	DxQTQclW0IrH9t03c6RMgGvrWMR9+QaBgNjNHOm/onpJeAMzWCdVsaNDrFIHXzWF
	WqvEVHDpnHZtGoNZagEE26LWzEoNFp82vqDCvTwdyA58otsaGZOyCSyny8Hl9OPA
	/frstPeVDdDKMKiMX0CPJLCmfHf1OdrlTxflOhjq+5vDSM4Lqkpcff9JBs/IwC0t
	FFBK0TCgFTONsEIt+b3/QA==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11023101.outbound.protection.outlook.com [40.93.196.101])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4e21bft8ft-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 11 May 2026 09:10:43 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H7TkXZo8ctUVO7MsN8YqOwSHAabZ2We5tvfmfMjOk9+oRfCN0UV+XhoUf9UK3bDbptT2f3YEOotrOtk+ajpMQoJHl5BCsHfQQ5jf9DEIDR9phGk3A4mE7P5y6iuz01HdUvDS7FkJ5RdCv/syeUqcFCXjm1+74Fa4TQdUhpcYYHV3zRYMnr9Wcc2KouBceNv4jwbDuapCXSUY2NEGsM8pkJVX8gTHt7SCDWER8mre0Xbeer/puT5Uv+WefoADGjB6C82SHiQy6JwMVorHaCHKGZZTb+eklZOrKW5X2AECWOd9XfVQSXRljGTPxMAizA2cRuW8nNQW65qG+xdfcX/FHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d9pfQBZhG72R6X/zJh+CbVqHJaltHHMe8ZOd5Oc35J8=;
 b=OV4Eir32vzqeJyMRSrmvuFNEzcSROBp5Y/7U39jYRTkCRVqWLun7X+8Jdr8V/80dkJnDZ8yF2SA9XoXQRuBk2nq34YxqvPaZlHpYDCkovQJi8ZFojvpO3BQgxF/MpvOjoEHLsynyEmxznTgQH8WI2Lb6omKEDe4FNGOawhXkSdj0PJ5y1EPHDja3/f0uKdue/z3NHUKLGhoM4fSCyHlrvMLkSN76qocSPn2ZWBqU+nQwIZDKOlNJSMQb9T2ELgRYoLnfzdEqt4ngoivbBG96gBTMDgzGZQobYDMTkR4ygiFbViIoqEIIWnzfzt3f9+ItP+tpyxsvA9Ds+Ap9LvK9rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d9pfQBZhG72R6X/zJh+CbVqHJaltHHMe8ZOd5Oc35J8=;
 b=tt63AgilbMxXsUtltM/xCCBeJAKqbZcGgG+iNEkUUV8NyPI8mkwUBmzKl8L4euDEy1NgMEqt/Koi0D+nc1mw3WJTU2Eo5nMvEwa41pijtN6wcUvXZ34aGcty1c2PBuzIQT9vxdPMoRRuatV3X5n1jqXOhBz6kNe3Sd1tCtXtA8k=
Received: from SJ0PR05CA0071.namprd05.prod.outlook.com (2603:10b6:a03:332::16)
 by DS0PR19MB7792.namprd19.prod.outlook.com (2603:10b6:8:115::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 14:10:39 +0000
Received: from MWH0EPF000C6194.namprd02.prod.outlook.com
 (2603:10b6:a03:332:cafe::92) by SJ0PR05CA0071.outlook.office365.com
 (2603:10b6:a03:332::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.14 via Frontend Transport; Mon, 11
 May 2026 14:10:38 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000C6194.mail.protection.outlook.com (10.167.249.104) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Mon, 11 May 2026 14:10:38 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 97217406561;
	Mon, 11 May 2026 14:10:33 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 682BC82254E;
	Mon, 11 May 2026 14:10:33 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        niranjan.hy@ti.com, shenghao-ding@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v2 12/18] ASoC: rt1017: Use new SoundWire enumeration helper
Date: Mon, 11 May 2026 15:10:23 +0100
Message-ID: <20260511141029.851125-13-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6194:EE_|DS0PR19MB7792:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9ff55d78-265a-4b96-a5f8-08deaf671426
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|7416014|376014|61400799027|11063799003|22082099003|56012099003|18002099003|16102099003|3023799003;
X-Microsoft-Antispam-Message-Info:
	nWHoOvBBvZsum0+jpFRKMHbxJ85pyO4DEBwI9tl+KplCgCWVZTwuCr1MJAWhznn0IAroDbSg0C1tZCpiTyKJy5ekyFFdKA8w0bGqcP6BXthn5h1PEt2B9IRw2f26VxcmLwxbTiKCq+D8U8T1gkINeP7Ydm+/Bg9uEyCsdjgNW6QOZGvrh5RJbRdTEVCMOjrETZPVg6VAVCQwQOW1Ladld4cHN+dhXglqnRv1WRldfaR72j/9SMFL3jEfnomK7fZedECc4VDIkpKtqPDr1evHPG4fy1ofZ/xvXHPG2t1akesjsW2irdg8UvTUEt/hL6HKkg9y0G+xY37KSZNXmfJRhImOrPbVXrr8ZuTFpCHv7PbI5+KLf+PQHbJLXpKltNXGVXhxh0XR+T4OnNwccwQgVJPBkhEYxJsoacC/a+NEjVhCTbIssyd9VYj6VXc8PMRZ2NMlXJXGnEgQg/F9IuRqamlhiZiA5e/oG1LvCs4l+PerAPGgJ8hBtFzuget7sjQuPXYqZa4qVCrYNIv89MvczloemhJrO/pdVDGXozXat3ph0/CKPsHyoG2FKy88NQ/7u6hECxRGD8xYgUreUBpHYWHj9QxxZX6Ux6S74wJOE0efa6C8Apf8TS/j1Rk/4VEnYt+f8AGvm8YB2bVb8/RqdVjxVFuEQ/UeTxQ0ISMQogvNIialLYwN7JJKdAE/58h2wvsRNW5ledddihgwenlAM/APT3+MCP6afomk9cyFIf0=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(7416014)(376014)(61400799027)(11063799003)(22082099003)(56012099003)(18002099003)(16102099003)(3023799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tU3zp60aHoMMRLTfYz0TPFpsbHvy6byJWPw0HC/6aK/3v1+4J8aQLYPgGvlYSm/Z+43dKF+h/pGvNrV1ueJ+x+EzlCdvqdbEcW8xBTHWnjWafxLjKAZtVNki7iz/qwgS9tZjz87WjSbPK2b6sES7gZsYbs7SgJyEIS78+kifjfgF9QVFNtTYAHc7qWaK83QOov9buWLpCOqUlQObvLoDBTKPKmqfSMyU5D7KlbUzAz4h/X5InavS0Ivd+OVjSRLjsEWyelbZ/bgNOtNAsls2+ByakWIDlfsFDJO2QGmx3vKprK+y0kC5pH4FLNL6wdilhIQ+VDV0OJfTxOd0XzUE3y3HrM797O3VBvRju0rUt9vVsUb1O9dtsYVo21WbCmW2oN7AsOpA8HrQd2mV9AyipmxwRhrbGIDwx4MhNm6uvCO3ogcoYTbfrlFvkV9CWX5B
X-Exchange-RoutingPolicyChecked:
	GLSGrRgO7W33YVrZdcqsX+2DrI9iDW0VTgV9z1MgcBIafftBlbr8F29y2GzqpJYePlK2GXtgnSBm4VcG+xnDV0GWh2nrgJgAhGXl16mtI3f80aGn3xYSfDXAvWsRHqXcdFfeTt+RghUe64ynhHUfxzwErBd5HqzZkIO6J0rulBPRLH7VxuUq+lm0ikxp03547LC40rAQkF/frjE3FUaXW8gNjvO6ZERqIMR04XmJC6jsPDjS/NpoRETMR6FyvFYZXDeQF75IwaJXsAWQZi2O0r7YffQUaiGMAfY8TOOMShcVaS5V3Tl19qOHZ3ouRBWCvrVKYT+sy+Td2tVEAsMRxw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 14:10:38.4505
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ff55d78-265a-4b96-a5f8-08deaf671426
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000C6194.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR19MB7792
X-Authority-Analysis: v=2.4 cv=DYsnbPtW c=1 sm=1 tr=0 ts=6a01e363 cx=c_pps
 a=8P4KAFraM2L8FVmDPFuExA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=IoCDlSAkw28XYy5mOB4A:9
X-Proofpoint-GUID: -8puuOUVUUzdY4xINswCyogc8s7u-EPb
X-Proofpoint-ORIG-GUID: -8puuOUVUUzdY4xINswCyogc8s7u-EPb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDE1NyBTYWx0ZWRfX27uAStLGkrLz
 lMbrN4EKyIpTZOXQg+HDRz8OWziDs8j5YHWMh5G7E2WUJA8nHibhShW9B19SkKc2GWZZZlkObRh
 QwlHkglooDDvQXtprrlsBZ/QwPzjp96WWCUvu+uHuSkZQ3Nr/d9HeLMFgQtZPr5ydzv9wd+QDi6
 J51esn2xSfPt3/+rVvfffXznevumgd0gm0RRXymi7Q+asbxN8vgpFfcu5HWGqMWfsGK3Vkqfavk
 +w+K1HqavRTo0V82am42Y8hMwMnOAtN/uA3mZVnMFxEUbQKCxNc7g+/cCo6dsouY0IeR/BzNa2X
 1tqifet2LRfYwsaK8FsHTqYw0Uk8kBRqDIxhFuE+04V82vQfYMekWL9EUweH8VNRsnz7TwMwmie
 Wo7BtQaxV5xzhjW3N4wx9D6mhcxqW9dYx6MglrzMqdSKzg6n4LDVhyN1HiPG3Kxp4kqKwBR+V4M
 QEdQkCEih5zeg9l2UOA==
X-Proofpoint-Spam-Reason: safe

Update the driver to use the new core helper that waits for the device
to enumerate on SoundWire and be initialised by the SoundWire core.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v1.

 sound/soc/codecs/rt1017-sdca-sdw.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/sound/soc/codecs/rt1017-sdca-sdw.c b/sound/soc/codecs/rt1017-sdca-sdw.c
index 148b36173a257..d62e8a2536767 100644
--- a/sound/soc/codecs/rt1017-sdca-sdw.c
+++ b/sound/soc/codecs/rt1017-sdca-sdw.c
@@ -773,25 +773,15 @@ static int rt1017_sdca_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt1017_sdca_priv *rt1017 = dev_get_drvdata(dev);
-	unsigned long time;
+	int ret;
 
 	if (!rt1017->first_hw_init)
 		return 0;
 
-	if (!slave->unattach_request)
-		goto regmap_sync;
-
-	time = wait_for_completion_timeout(&slave->initialization_complete,
-				msecs_to_jiffies(RT1017_PROBE_TIMEOUT));
-	if (!time) {
-		dev_err(&slave->dev, "Initialization not complete, timed out\n");
-		sdw_show_ping_status(slave->bus, true);
-
-		return -ETIMEDOUT;
-	}
+	ret = sdw_slave_wait_for_init(slave, RT1017_PROBE_TIMEOUT);
+	if (ret)
+		return ret;
 
-regmap_sync:
-	slave->unattach_request = 0;
 	regcache_cache_only(rt1017->regmap, false);
 	regcache_sync(rt1017->regmap);
 
-- 
2.47.3

