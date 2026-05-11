Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D540A402443;
	Mon, 11 May 2026 14:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778508710; cv=fail; b=C1t/h/1FjvkmyLpMftzbOacc1Ee32e6+BCGUcL7HXOLCGpBVXb6GSN3GwHzNBtorXMJzc/oMSEUb6ZkbJPIr6livaNcuHuAk/Xt79j/wV9hLCkItF4GAcJ5oT2d+YSjT6yDAdREpWxPUREWaUS/ygjTqs8bRMIKbJ9BVe+IPTLw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778508710; c=relaxed/simple;
	bh=t31bX7yY6OZ4BKfrh1cCxcXRFLLuuQiu/lPpvBi2Eq8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U7kQ5kanvlovYVbdxv+ZouqCsAKVnmIArdRZyYFq3oeotY+uye6IupiDRLgIMxXi8XitG7GXMOx3ZW2DHAP0tG/DfLEiRMng4bwzDyYEvQ49hJ5F5feO4m683JdRoMUXZF/7kkYoNp66OdazO6vn6AKIbuzWC/HEZAG1HpP+jfw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=A8IgnG3k; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=x3eyvnrv; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="A8IgnG3k";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="x3eyvnrv"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B5uSG93470159;
	Mon, 11 May 2026 09:10:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=mGX6EF7Ni7EaU6/eKJYzbdXu1T1GwYrMJ3csDL9Cn8k=; b=
	A8IgnG3k1NQhhIrRbkScyaB0UCEOAPr8mC1dph8NNqjw0l201vILRnxriXKAOas2
	FyILR1tboOOaXQwPjlQUN1uZAYyU5D4D9k6u/36wkvLJBcGq4Zw13VDeyqME8yTN
	G9+aYNZI7Fulktn0ZFRYPc+eSU3t6SFx4IljyaeB5WTobgnQpsdxB2YVjowcGXpc
	TNV4r1/OlZ9LQ9DGUyctOW0sGQWubt03BTU9++HGGjWTyMVgF43eTnyobS97fH/r
	NtosKFkwJ8uSmA2xre1/pLKBbK/0lSMRNG8UL34/Z6ZUzBLUyPF2ESgTwfX7xuuf
	yDlYdevSMnA4S1FAa59pPg==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021080.outbound.protection.outlook.com [52.101.62.80])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4e22b0t3tv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 11 May 2026 09:10:42 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G9fxpaUGgHoYtjl/240V4qOEPquOH/iK9c9ozHpo8vrhUJpvaWaReHJWjBukOrZ+eYHDrgNM30zb1ZdkVSmGuQwPUKinB+DxB4S+Uyeqf+jXaWi9gsrN2tacnTUOMHVHjpbiGkYlUwzYC++EZ27oGI4ld3+rZ5rGGJ8dr3IGMxvKt6FxKcXcmd3VvkWwKYhaSYRJ2z568GJ65vveQ9V3yCt0VjRD2rzb7Zk5Oi2i46UcY221JZrnwa0LtNNXEn/dqTMZWwazt9dY2pKSM6VcHA2CYfNqRuDny2k6nlStCEEtxvGuaz9i1yjiM11gsE21T/z0L2gXTniTYFKeX2hhfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mGX6EF7Ni7EaU6/eKJYzbdXu1T1GwYrMJ3csDL9Cn8k=;
 b=AbITaRcZcKKk9viSn48FTJySx46AzACCjaKcNuZFjzQlLdBpHDL1XnMmKgshumsURUJrvQLCMPUsbQCAFua2z/H+7APDu99dvUt8KB4uYH4AruHtdAA3aZ6IWfKb03nC3eHgM4wabVtnE/qAro+rjEjIZNaQE2HV+St474Xq7ABFARiRNjE/6holyfIt23iNDYb8dIFm2BDbtiLrqZDTkz3c8Qeb7mLOT1MMGws4jfwzbX0y516OnKOD20zeQLRrUM6Gtul+5m1o5uuy447xUAo6G53OQM2GTVuK3xugYXKoPoVsxxmL8JsPzu1U0G1XMxll7PUUxyb6cLczq5jVEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mGX6EF7Ni7EaU6/eKJYzbdXu1T1GwYrMJ3csDL9Cn8k=;
 b=x3eyvnrvjDuT0voa8Pu2jDgG4s16MFxDUFcoCZSovhiRT5gAJFSFiH1nJz7hHKQ2RtO8Sy1IHMgOh9V4Iwbs/5oe89qzcwTs0HeNMEqghOURxo8Y/2UrYoUCugn5VthcH/zYErbJWLFziercdMzvl3TLvJcMoMqGrLSqLE69d0s=
Received: from MN0PR03CA0014.namprd03.prod.outlook.com (2603:10b6:208:52f::30)
 by SA1PR19MB997342.namprd19.prod.outlook.com (2603:10b6:806:4c4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 14:10:39 +0000
Received: from BN3PEPF0000B371.namprd21.prod.outlook.com
 (2603:10b6:208:52f:cafe::c0) by MN0PR03CA0014.outlook.office365.com
 (2603:10b6:208:52f::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Mon,
 11 May 2026 14:10:38 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B371.mail.protection.outlook.com (10.167.243.168) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.3 via
 Frontend Transport; Mon, 11 May 2026 14:10:38 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id A0589406566;
	Mon, 11 May 2026 14:10:33 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 83B02822542;
	Mon, 11 May 2026 14:10:33 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        niranjan.hy@ti.com, shenghao-ding@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v2 17/18] ASoC: rt5682: Use new SoundWire enumeration helper
Date: Mon, 11 May 2026 15:10:28 +0100
Message-ID: <20260511141029.851125-18-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B371:EE_|SA1PR19MB997342:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 59e20dc2-aed7-4535-751f-08deaf671408
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|7416014|376014|36860700016|82310400026|3023799003|11063799003|56012099003|16102099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	jnrvL3PbmYrujlBBR/M61obOttBaYfKkNpb/GZjvCTOBKHhbX2HCTbJQh2awb9qMrLHPvh2BR9vsZsdsCksMVZBDnsn9rsoZcKcaRTatiE1xC5R+taETTGS8p9LvCTXwPyeDfKuA0MAUIYXo9PEVY3Mmnny/3CRlfaCv1EJN0orIdA5nOxt6rCRNjeYpVlP0bjejKnE0UUEMHAX1aMPK2c+LcAyDIzDCoSCCvqp7WKGDinEwXan6+ndD28CDdQ1E97ow+JRJzRzv+nuKNF6f15oHrS5wNbGxlnygR0BgubN97nUJKvmFXzk9QIFF8JMuWDa7Q2qApWbuJpZWhM/sQCjwJCYner4LlTIg52Xdi1SCbIS7IT+1prG8FV8gS5dzB+gJPMH1n06niG+Q9Lw9AKMzmtdY2t0cZ+AbjznYYrH93GrqQJqQSo40bmvs7VT1OzvTxw5l0OwN8bsGU7511vb7EeegQ7KAAI4JGUKglAaoeZgfyti0T5VmbHNJnMN4bDVynC/MfL1VclkzKsGSKoga3admxxNiCTNAQrpgKaQ9T1qIcSRZ64UcNNY5PMPiQ1v6PSHdDTjTBe+K/rhdDSkjmZvwiZ/C+XP3XGooNjYmQnXyfvKvU7TRQ5+VX1JM7+Cq92gOJNY4RhmzTckkuyyZhlIIesDfHc5w7KyNpg2clMcY6AUFNZ+LHvLBqULba8Jtmp9xlYXkufvHsooYgt/3PtTx6eCbBYZc18SSBKI=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(7416014)(376014)(36860700016)(82310400026)(3023799003)(11063799003)(56012099003)(16102099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	E1qkA2SVcN20rN2OlB2xw2eENDUxiXIZB+F2mRmf+c9ZbZ0poKXfHHU5Yq2XctV9X4ouiW89N5LbHHnS4ikw/uUTt5uNQl5SriwJ6YMwSiEwJWhXuCJEfNgGSB+IkqNZL4mEd/yl1wPUSSJGYWKJNruE5BXz6K3zsL4vXCfIhF7jZ1elAe2GGUF0s/n58GIP99alxg5ePZlL2eKvVC67romDejbqSJC/7fFtugZsfYZxyDNWJuM22wd0uKURWpVWdTX8JCtLCT9Ta9O4s6A9jmNHvyqRl7xIjyf8WjAaq+rxIpqJrsDtmzbl+YBlk/L/Ju9aiiTMpzZz4Lpa2a7nqpae4FAf1OmisWzJVSINLorebCZIgCeTL1Drl4yRJrKHZ9MAMCHoAkldH60VoDzk6e6F/G7L9nc3w/kNbzVrih3gCp3hB/fgetkR1Vstn09c
X-Exchange-RoutingPolicyChecked:
	sOH77wTAghj6pnYVWJAOnGo79WdMSaPCrCfTfDNwSHkSToziDp4b9+fO+JlP2OhQ1uJ4HolN95fWcRmUl666NH+JLCh6e35Jqu1d4AegBN1Ya+jxavUXo9rmoxIps+U9FaD/0NDObb4XTs2hJ2kkH7p/Xb5MbCKg6XiOb4WkvK0avqvin83tEZHQ69wyfAjb2t7k/zrzuXfORJKJoSXi9VwYkNiUpKyAhcnmSmYLpfd7jiRQsXHadYVFHL2p6G4Ein87KV4FcYpD4EZ9uGkiSbYCyTKUjFddbyNIAdLB3VkykWgrMe/JUDJn3dRR6pTz46wh3x14fFyazWtj+TFbiA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 14:10:38.3660
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59e20dc2-aed7-4535-751f-08deaf671408
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B371.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR19MB997342
X-Proofpoint-GUID: Ft0YcCKMt5lLYyHyRFv9L8V6FeERuaKT
X-Proofpoint-ORIG-GUID: Ft0YcCKMt5lLYyHyRFv9L8V6FeERuaKT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDE1NyBTYWx0ZWRfX2wlnkynHrrO9
 2mdwfOQ1CKrm4D6Slen2OlwD1i1gE6UN4a0LLce2wMVTY9Bq1WUxI2/8ly0TSX+GkButecSOBWC
 nuFy8ExxtJ3lWbf2V6VkFmMeay9BxXQ9F7CqjmeQMeCFzUvHe3mya67iL1gBYBFzQmKyZbPWg97
 E3OastfU5ac9aZbc0spVaRbBJpqUJxzTRxnYkltJilXqKm9/Asutb5vSLsud4c5wbPQmO5RzOgN
 N2+hQ/j8QZTcVnlEQ2+fc58sH6jr0axcoxkYj3wpZhdvhEzW+654BpnaIlCSNfjRfkcBZzl4I4r
 QJ6LA5CYBtXiNRY9bDM7RqkgoGt5+HCRZOm6oyxjyMI9AxkFhMOxZpmbgG4QOBu2cELBhcHFKr6
 +3pUdJBFB1uELojddL23IGYsbZ5HMif66XdmP8XXaUuVzMze/WUkxI+f1FCR3z58zVkXJzDC3Dq
 llvVmNAYXw2BWiKwNrQ==
X-Authority-Analysis: v=2.4 cv=UdxhjqSN c=1 sm=1 tr=0 ts=6a01e362 cx=c_pps
 a=rDyEm/81vvKQCy/iKDMZrQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
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

 sound/soc/codecs/rt5682-sdw.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/rt5682-sdw.c b/sound/soc/codecs/rt5682-sdw.c
index fc464538ceffb..ec2a35a0cacde 100644
--- a/sound/soc/codecs/rt5682-sdw.c
+++ b/sound/soc/codecs/rt5682-sdw.c
@@ -754,7 +754,7 @@ static int rt5682_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt5682_priv *rt5682 = dev_get_drvdata(dev);
-	unsigned long time;
+	int ret;
 
 	if (!rt5682->first_hw_init)
 		return 0;
@@ -766,20 +766,12 @@ static int rt5682_dev_resume(struct device *dev)
 			rt5682->disable_irq = false;
 		}
 		mutex_unlock(&rt5682->disable_irq_lock);
-		goto regmap_sync;
 	}
 
-	time = wait_for_completion_timeout(&slave->initialization_complete,
-				msecs_to_jiffies(RT5682_PROBE_TIMEOUT));
-	if (!time) {
-		dev_err(&slave->dev, "%s: Initialization not complete, timed out\n", __func__);
-		sdw_show_ping_status(slave->bus, true);
-
-		return -ETIMEDOUT;
-	}
+	ret = sdw_slave_wait_for_init(slave, RT5682_PROBE_TIMEOUT);
+	if (ret)
+		return ret;
 
-regmap_sync:
-	slave->unattach_request = 0;
 	regcache_cache_only(rt5682->sdw_regmap, false);
 	regcache_cache_only(rt5682->regmap, false);
 	regcache_sync(rt5682->regmap);
-- 
2.47.3

