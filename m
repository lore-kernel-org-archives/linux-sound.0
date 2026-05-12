Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07019349CF8;
	Tue, 12 May 2026 10:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778581912; cv=fail; b=qg80x2nX6RDkdygsNtag796Z3T075iBvPkVfEEac3RHOyZ+Tk0O5CEM1p1pVjvdtZNVre+KQ+fpANd3pSoSZ6oBK/U9t4XqocqzYryad4sLgCjhgf7bDlTEkyNMMRJ2wL8TGCWRy9JMzS89HxydCT5NcOtauyu2qAyFb4shj3Vg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778581912; c=relaxed/simple;
	bh=D3buYP6L3XRrwrdB9tKRtDaL5PQg2on4cAUGbUDdw+A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EZxwtypu6SatTAGLPW+FgvkIzXsV1Mw9Y4ukAwpUz/eZ0H7VOFuDJIAkVBCPLEUda0VHkGIi8mVfawVRKmmGtxSIuIZygmpedZsnrhvpApXat6U0S+zbwMf1j47/F8cAHA59rB5q4g/gDas+PQrngbhaK2PZIWAqVgMlxqCs1Is=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=iC9cTAfk; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=rMYQFG4m; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="iC9cTAfk";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="rMYQFG4m"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C4hpns1493060;
	Tue, 12 May 2026 05:31:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=kqWBK5gzX+x3VOzJ7dxHDSqFKv+zmqO/RW2t4PTA7Ec=; b=
	iC9cTAfkzLsFaVFiolGRTUS4osMBJ5MsAufdTVm0QCWAvuNH6u/yx5PROOdLp8zL
	4TY5b+zkPZbkkPZWL7ZLB7GrBJxufgQI7hQycrgLirDoLrBDcO1ql6xxgRDwWzJo
	Lsi1xYoyCSQ54ewYFY4kx/5/Ir5Z5NgSi9IOM3VzWq5XlEuz3Tbrf3PvlZ+VvxGJ
	migzo3FAJkCxqhf/vuIVU/MzfeQLvOD0enhwFyvHdcePk+vwm8ZI9yK9zX0raLHs
	O3uBYX9PuaxIdfTUNJXfhyeyDDvawSPwpueP5Y3OHdzlGICg2BjanwBdO3Q9WrOp
	nGiMHAS+75UXkkqJ9yGIsA==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020132.outbound.protection.outlook.com [40.93.198.132])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4e3nw58r7q-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 12 May 2026 05:31:10 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cGvcsi/QJLxOQgsi9XB2y94Se3Uhr3WAJk8tke+1R8DscTW6QXwi+ked0oreZdpHOJd0EHTQFtzNiZYtQ+cYwDcEAWtwYYPWyRH9fEPlbHwUgV6dnWuZa6eTlinhlzFMeZbMEET3M4mBOP6Qk57TZfMm7rW7nbfFjKUwIk7/mxXvrJ0IjCGFuBBTqCQQ7190cjfW3wEXrugMi+6tZasY66f275ajhavZzlI9M4BCvgxOcmi28NzTRkqy5cWA58GlR7E5rdYHvFhd+jBg46i/DBCpKQMszOHtJ7CDB+1p0DUcmfpMy+pU8csiVuHSENM+tvNKNXSKChYs/xuErU1hgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kqWBK5gzX+x3VOzJ7dxHDSqFKv+zmqO/RW2t4PTA7Ec=;
 b=B6XSVaY/MpVoAMiyXO7Y5VNP7XXjwN3D7BB006/XgW8aJ7mhugoWeyhK3XLQcYF9u2m3+DIj4BubtnWvNFh8jPfhszgzWSBfEUkthFfkzGKmqfpfrKYgaiJf7aiFkxjyqiO7YXpthuhrE2PFcTuzhsSmBcaBKQ3s05FYvA4iHeSSREyQcCVQ6YMmBUWWTQHpkukh4h2NmTlkbkpWWbEWLrCvcPwnsBHBuZvqaZCyCMBkX2eCSprpzrWzEnPqsj43OTqf8A76liNJXZh0zJGaMDR8I1ckcxVl6iuOekjRcnIVfEWEijlkMyvdUPX1dBO57Aqnxl7VgTEcLpigZ28PSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kqWBK5gzX+x3VOzJ7dxHDSqFKv+zmqO/RW2t4PTA7Ec=;
 b=rMYQFG4mDaUH4VxWqEdXXbTpWNeYU7/YIfVHY0qDiD6VutSrwlLudZjvGbOUzpjsfOdE0RuMacP3z6oaYAf1xmzsQc/UlrIDhmnKiDH/MW0iwfCR2VbY5sHXTPfUMU++qRekVjf8xmYM10ZwqwpcJFHxjq+sN2gSVXodGXi1kjA=
Received: from MW4P220CA0028.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::33)
 by DS3PR19MB997164.namprd19.prod.outlook.com (2603:10b6:8:344::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 10:31:06 +0000
Received: from CO1PEPF000066E9.namprd05.prod.outlook.com
 (2603:10b6:303:115:cafe::f5) by MW4P220CA0028.outlook.office365.com
 (2603:10b6:303:115::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Tue,
 12 May 2026 10:31:06 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CO1PEPF000066E9.mail.protection.outlook.com (10.167.249.11) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Tue, 12 May 2026 10:31:06 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 9F661406560;
	Tue, 12 May 2026 10:31:02 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 6445A82254A;
	Tue, 12 May 2026 10:31:02 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        niranjan.hy@ti.com, shenghao-ding@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v4 11/18] ASoC: rt722: Use new SoundWire enumeration helper
Date: Tue, 12 May 2026 11:30:15 +0100
Message-ID: <20260512103022.1154645-12-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260512103022.1154645-1-ckeepax@opensource.cirrus.com>
References: <20260512103022.1154645-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E9:EE_|DS3PR19MB997164:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c51d9024-b50a-491c-c6c8-08deb011932d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700016|82310400026|61400799027|56012099003|22082099003|16102099003|18002099003|11063799003|3023799003;
X-Microsoft-Antispam-Message-Info:
	udgGDzKPAJ/HfA1tYcSSPUcPqMoN07oeDqf0w32JaJD6OTXpiS0F+sSE+LdOVlx+7SvLnZ16I9kFuytxo4kOq7R9wKBoY2f9PccexRKwA7d+FG+szGjOXeLlrrrXQb1HGnxm3lMhlT4y/xY/OZMddYfsM+e0z/7bPDJuOqwxHW5kxoF3v9yZBp+4k8X6d8i+yUdhbST6bW/HWqqTfDG3ErmcSwO1B5acgGE/+N3yX8wKc6/xcthCV+WVIV1D9QQY3ZwIopwdbsIFeGXbvZkH08LUTFJeGXlbzYNEFwhXRgRNu5vC+xvlo5x51pKLH3iszerSRWTREwB2PBFcL/Kjjb6VUxZfkNOVnfGn39hux74cNzS5A94d/gL6QZrUWL5YDO0D1Xoz7kYlgLuv+/LArL7G5pQANakz33xOMZbyKKAdC/8rqjJt7fd9FCnVJvZp2fOIAVsJHLHs42R1ir1xom6ARQN4n80cqjWjCb1c3wpxl3wylv7zp4irACsigscj9CHOZgbsYAgYy4ubEK6+eatY2qVBqIi7uQf3N2hJKWnZDsI0hHTO7+g6A3fTwSZw3eb8fwjj5wT70mXdooJRu3H/tsP21uY5W5TUj4akMZ7Q37IoS1bL+429ESpEQsL2mvCxTG1weNBH0RVNPukSrabEvghI2mkfe63kmMDdqbLL34KzYdX8yi+/xlUcPiDdwVmHWYmWgkdgplhXQDa1JLrQvQHzHyd9qqaS1QmDSkc=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700016)(82310400026)(61400799027)(56012099003)(22082099003)(16102099003)(18002099003)(11063799003)(3023799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	LmxoIFKfux26bdD8suxhjMrlvXBkcpUfq5lrpDNxCCAV77JaY4GuDttIPp1FLOrZd2Q+tG+dx3jshAGPXXL2Z84Bjg2tYt27XiHb2NvqEN+iN9RiXV61LwnEuzvmzPsmXMnvcHCyIyju+8+byD5c6d2HIvxIu7gtUbnjrJpIYlJLdhWPx/woDZf1jMelHkJE0zXhTLVNSsTCk6qgxVemhQRnWIg4j/pWt5jLTxAUgoMzyvBjpo8bpMqLdmgHohVAgJjpZZP952wMndyRGsD86NMmm13aXxDzrF8N1slmjcXx2uS85styEIH6QUudzhv5j5nYSpIfqN2PLSBBeCC2MdeC7+Mj+3IS5MC7sp9bYrPjpPLxxClRTuGCAjmANUgBcvDWs7XMfrSbGeW+i5fO2iq8HB0ZfWZwskKPw7dmOiydEPrRYv3evVW5s7tPvGzD
X-Exchange-RoutingPolicyChecked:
	GSGMbbFnKgPuvm0LlD35L0vU038tXN0B7BoIbuqWe6FXb2XZdNh0M2+fwfDHiTWyD2lHnXb0JQ9Sqh+vtp34dDDwy05Fl3BHf5Y4wm2Kfm4e1Mj5q2WXw9oVMKPPKgq8S9mtXuKbdhD5L7g1IF8e430/a0V/bLeDwpUuppKTFbJFHKglWdu8cjDfQOdmSALUlywKgpQzHuUcTH/I4SKq8yvHTCMOLGpmZ870K+Q7TPmjM+jteOgRRcMTHRKBi36KQHY/Bq4AFACm+KN197dZYRamQf3TsqXiiz0lMuiCtI7xjbhzkBOqGC5EyH+HVarpHS5Y4i5b9tuwGRdI+La+NA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 10:31:06.0224
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c51d9024-b50a-491c-c6c8-08deb011932d
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF000066E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR19MB997164
X-Proofpoint-GUID: t1w60mP53t1cJH3QVTOddQWag_WRd-QQ
X-Proofpoint-ORIG-GUID: t1w60mP53t1cJH3QVTOddQWag_WRd-QQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEwOCBTYWx0ZWRfX4VnoLWeKddmS
 bACs3bwnGpmS5wFh+NnmHT+K/li1CXH8CUgLFNDeFTwCElyhRiGzB/dS/UBqmKM8Y2bqpeqCZjy
 dTSWe0b4pUMGFgC7mz+aGaSFa5KxotkVJ0xccd2MIsY70RCCxW83eFObaSWBNZ63HGj3Jn3oRrk
 S7QZVXad6Q0hpRIETBhLvk/FPI93sTJhzWhd58wx6IH4cdttBTpipynm+m9jKndPzcSP+GrJ876
 2wAb4N961I2ePrsssIs1sJsqZ2x5i8HCij/UEnwtLh8pqhjNxTPsvGzq6kBq3ZiYND7sjfE/xrb
 zOT/WZbS65a5vf4hjlFiUQcNNU//UpQhDrpyfjSK109IkanLNPdj1J6/FxxgxK2759A8GS7VCcw
 ATSj6wh4y7eBs+9v11x6/n7qT9tY/8D3EF7BP2/sCNd7YKzjrwaqRqmSGak3BBjE/abz9lfHs4/
 hZc7htAYhy5kizTu/PA==
X-Authority-Analysis: v=2.4 cv=KsJ9H2WN c=1 sm=1 tr=0 ts=6a03016e cx=c_pps
 a=APpQm0mLgNUAkX6qZvPSjQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=_kLIPOSdNJ7StitxxVsA:9
X-Proofpoint-Spam-Reason: safe

Update the driver to use the new core helper that waits for the device
to enumerate on SoundWire and be initialised by the SoundWire core.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v3.

 sound/soc/codecs/rt722-sdca-sdw.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/rt722-sdca-sdw.c b/sound/soc/codecs/rt722-sdca-sdw.c
index 0a5b3ffa90daf..a5feba3d0c182 100644
--- a/sound/soc/codecs/rt722-sdca-sdw.c
+++ b/sound/soc/codecs/rt722-sdca-sdw.c
@@ -501,7 +501,7 @@ static int rt722_sdca_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt722_sdca_priv *rt722 = dev_get_drvdata(dev);
-	unsigned long time;
+	int ret;
 
 	if (!rt722->first_hw_init)
 		return 0;
@@ -514,20 +514,12 @@ static int rt722_sdca_dev_resume(struct device *dev)
 			rt722->disable_irq = false;
 		}
 		mutex_unlock(&rt722->disable_irq_lock);
-		goto regmap_sync;
 	}
 
-	time = wait_for_completion_timeout(&slave->initialization_complete,
-				msecs_to_jiffies(RT722_PROBE_TIMEOUT));
-	if (!time) {
-		dev_err(&slave->dev, "Initialization not complete, timed out\n");
-		sdw_show_ping_status(slave->bus, true);
+	ret = sdw_slave_wait_for_init(slave, RT722_PROBE_TIMEOUT);
+	if (ret)
+		return ret;
 
-		return -ETIMEDOUT;
-	}
-
-regmap_sync:
-	slave->unattach_request = 0;
 	regcache_cache_only(rt722->regmap, false);
 	regcache_sync(rt722->regmap);
 	return 0;
-- 
2.47.3

