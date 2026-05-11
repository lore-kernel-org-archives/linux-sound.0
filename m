Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205F739E6F0;
	Mon, 11 May 2026 14:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778508708; cv=fail; b=lHtLaHMk8uRLuwm7NC0hBkcBkVEwjLA/GnewKgEnVW6NvV7bHitpRhgg1XM5ka2R+AF5OvdMNGy6Pn8hZSS2821np2+lBKGCxSJLkxf0nYvXpm98Yfn0M3rp2V13jkET9BgiXBQasi+poGK0+55fC57+z/qaQP0iDDYRNuDZXIE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778508708; c=relaxed/simple;
	bh=+Tcrbd9R/9i2t6IH78lBRg7ISKa9HkjRznH8aNl5F/M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uJhidnsJD484MWVHRI+SZXA+U59asGP+de2uIWl1zNXLlSSKkbok5JgGz2DYw11w+rjERxcB45/0I8urk4rWSdZOOT1sacC5OoOJKyyPQ0cyNhZULnhe5O3qi0cHj7bFDfwaV2QC6AQ+oyDVpsWAaMZXVtuQGZwYQ/U6o0HhmuM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=i2jas+a3; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=s3rW09IY; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="i2jas+a3";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="s3rW09IY"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B5t7Zj2679596;
	Mon, 11 May 2026 09:10:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=C8p0o0b9v2Fl1OICoYFSiES2tO/mJFtPukVFWoyUxCc=; b=
	i2jas+a3YUMi6NUFbpE5PfLs0TlL54vBYpJSQAriXLsHaIgJVzJn0QuT9NuDpGrm
	wa91z3+IFrHBYZrkFMPS0KMu3pZSc+vAs/yMKR6Mz5BgJmYSw2s/FZNg5I0lbrlO
	N9vsqT66R0o7o1wQKK9ssJrycWZetwSFFrCgPpgCYKJ4LzUPopMpBSJoothnIKw+
	rpL0sA1Hgj91q8dk8ChOyyg+d6lj7DyxZaWCd8USykFMLuYkEmmtQ82glpdTZaSJ
	JxCD4U3yFecnLD7gi161cu3865uKj4LC0pCX4TzItXhVQtW+oJiyBeBLskZpBBE8
	8YYdInAMMRQD22ClmqrOIw==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021129.outbound.protection.outlook.com [52.101.57.129])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4e21bft8fp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 11 May 2026 09:10:42 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cGmGYR/GtUDKDBzeH6kvumPtV5lOML4N+6bkChuZUs5VIEM+A3dq26v5otO9+x1splILh7ERGquc/LHxVhxo/oS6Gj49ONVgU+fHm7jhFy4mp3rqPpw0KlyNDtZlKwrDTZFxo8//HXQAbJaWdRYWBeRBaXV1S2K7xgnz7eD8QnodVBTu5aO9mUTWbQAMytsqbRrE5gQouwC+UIWiiH1fOI10psIsZU9Wa942IQ/nvJte3sBPboOg+ow3auhilCdK/Hl/JjVRe3dOlr/iNc9fw0Ml+/sTpjlOLrN/T2lBIv9ijbJBhmrf6OTjcr2OIGWVAMhNebBV4MuDQeNer5t9ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C8p0o0b9v2Fl1OICoYFSiES2tO/mJFtPukVFWoyUxCc=;
 b=cO6aoj145fkG4qHOrI//JbYJbvFc1rXGj+sVrgGNr2eACagf0Tz9OE0Y6gNIqjSWxFrNQPEXrqcCPN5GhHf508xgeRbcev2A55u5IPW6jzgZWMe4GOux91NB3O675wDy+BA/OCq+4lC2nexfmhVUO4EjM0bIAN0pLkTfMEBbxiF67To9uFUeVeqPIriSjK8xyGCUpGrlMdxx22my1zBj9dvUM8S9Svp6fi8B0EXQnj4C0vKGIVfh4BiV06sxsIWAr1gteC4KPreOybzsnZCiVdqP1J+rnGop88fqie8J9DS8aSYStd4DoH/M/uNYmnYtjAaNkKEKUlt5GPRl4QhqCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C8p0o0b9v2Fl1OICoYFSiES2tO/mJFtPukVFWoyUxCc=;
 b=s3rW09IYUIU4nOvUY208r0Uyx4w9Ml/jkmJou3Zd3sEq4m2VejXGckO+8KnOY223giKt6VcGl30XVjfucrzSrR9NEwU2fg60SZm09tdXRllTx1eIFTCXP5r9iOicDr4w4fiWBkDZ6SikgMdok1KKGUx+xyqEeDOBk9JR8OFxTeE=
Received: from BYAPR06CA0030.namprd06.prod.outlook.com (2603:10b6:a03:d4::43)
 by PH7PR19MB5989.namprd19.prod.outlook.com (2603:10b6:510:1dc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 14:10:38 +0000
Received: from MWH0EPF000C6184.namprd02.prod.outlook.com
 (2603:10b6:a03:d4:cafe::13) by BYAPR06CA0030.outlook.office365.com
 (2603:10b6:a03:d4::43) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Mon,
 11 May 2026 14:10:38 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000C6184.mail.protection.outlook.com (10.167.249.116) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Mon, 11 May 2026 14:10:38 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 9596D40655F;
	Mon, 11 May 2026 14:10:33 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 635D082024A;
	Mon, 11 May 2026 14:10:33 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        niranjan.hy@ti.com, shenghao-ding@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v2 11/18] ASoC: rt722: Use new SoundWire enumeration helper
Date: Mon, 11 May 2026 15:10:22 +0100
Message-ID: <20260511141029.851125-12-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6184:EE_|PH7PR19MB5989:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: baea2045-4c68-4b91-9a4a-08deaf671401
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|7416014|376014|36860700016|82310400026|3023799003|11063799003|56012099003|16102099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	K2Zty1wxdNXrjVDWJb0YVgRe3dvEZrju4XyoDewHCH0IKHqmAS/2CJiZJD58O+Biv/HXRR9inFZOzxuNWrA0zAc20bc/+BGoxPtKqHlMit7LnMJUxtxeLvCDint2B62mj7VNrNOB0ipslGBt1mQ3qKbLlB7TkQYaE/sINrcIU3HlX0mt2UwgQNMwiBBk8bsieSMbifSijPiQwEmIiXa3WIoJNeVwEk2C8lH1wSFJnpNM1ZVTn0ocomenKxfI3K555g79V3CA5LgjJWXlzABHWBE4G3ZV7Gpb5PnGDtbwLIy9zE/eeWZz52jKI+G6XS7iTtACk9FCTpES4Lq/8uqPEgVziEkcHqI8yegBxeYXS/ZunOkiSkBRuMdPITIr2XkSvFUneWI0TwfmqgahsOf9ge8E4I486wm2IWB/eGj8wNK72+8BTqMpTSRxF15ZlO5xK0k12bGpoEzA0xDPj8AjL79VfDIbqabX79MngrA35Yl/xwZICsTXtZCDPQs+rb6+4FKsjW+Iae5BnyJgWFIDIQIxSDl89tZFBVUpYmFzVp785q576uZatsiTzauUUCUAXIKlGgrqplLdrf5qvwUBcqy06I7DlBblVVX5Jryx+rKB8iuau8gAZ6Ez0LS0H6mM2DmX8AHAY/6l6PpwKjmFYBA+HZ2XTFmBzvSm5fqwz5VesUoVvb8lHrG/99ybJLEKr1/YsEpkQfhKpsXsak4yYpz1zCOlUgzDU1lg3bBhBpA=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(7416014)(376014)(36860700016)(82310400026)(3023799003)(11063799003)(56012099003)(16102099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dSjI+asN+chMG19RohUoc2+op5lqV+yg1btRx0T1Y0U+FN4SMpkjhs6It4VAopPOwZtQtJRK9dWhlmmzLh1hgYRtXhZ0SRoXQfmwaPPI35i01GUiYOy+wstocgOI0utAIkgC1X1vr8KO28KgttfK9z3VI/+sgZcA/fDkjI7zWnDdYshhHK+CUiVNeFZQC5AEWPP8Lndi1Z7eUeWpvCCzoXpTq9hr5QVoAeuBgs+3JCG8zk0bFhr8xDpzu6h5PtgqXIRirRourryeaJmUF/I79qgfw/N63d9hR93qynT/vBX5Wr3CGasQtwEU8Rq2CDO+M0CewvObDLQXEqvJioy1iPW1zSfD3lVZb90SDIbLaqRbCM7xeiXu29wGGANypLpmbKAGsei3KlRRiRy0r2q1EP98jFHF+U7SEC7bHcGMHcPsh4xihST4og6KoGiqR7+s
X-Exchange-RoutingPolicyChecked:
	hp1WIpYOW60K+5Ci0UxoayS/1L6TgH/enm1SJ23rvlGGIk+caKwVqWd8YlwRLqLFWMgAdwDBeKWeflw8UAhWFq8U/mqBUY9y29jG8NebrLVPtXIuFCMQtg7fnNMDdBy34N88MMP1QO3Zgxg3nCqypzR+LIBYFx1ft+nUbHm2ZRXJwbo98aeAADTye3XOk9ZU/gTjz6/vIkgEU86iGDeoOteDu9aqb/4wBxjJeaDM8Ulgn7sFMtMGP4n0fRFelLyiJ72m/04OtzQ7lfOBDzuNr6uFA5s551qfY+xJlzfTYizkn3qnfFroHBSRtCuXFqYvd4zDvwobCcWi4cj7uNn3+Q==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 14:10:38.2053
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: baea2045-4c68-4b91-9a4a-08deaf671401
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000C6184.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB5989
X-Authority-Analysis: v=2.4 cv=DYsnbPtW c=1 sm=1 tr=0 ts=6a01e362 cx=c_pps
 a=0kdhZxwYHPUST2xGnFlr3w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=_kLIPOSdNJ7StitxxVsA:9
X-Proofpoint-GUID: TcR9t3zNCcUErwN6ufnDiPYKznLroKVs
X-Proofpoint-ORIG-GUID: TcR9t3zNCcUErwN6ufnDiPYKznLroKVs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDE1NyBTYWx0ZWRfXwF9iBJqjsvEl
 O2W+dZ6NaibgsDY8R0rLtfwDpMY2rWeWVrdTFlRy8GRJ2MlQPyMaNekr6AiMToe1i9UsI1X5g7V
 LEIyL74ZOWxypQ+zl7xdSCSn9HlNK1IJ79FaGy59Z4mJdZfiPlX/QJmURoBPJ1yaV30jOMn5u4q
 6r2p0eAnm1iYQ7G5NIF8AaSCB7lToHqjLv921zhWSF5GPke1de9ArT5L+7hW7mXSARGpS0vSRSC
 g1ydVAIhgkp/HGjyIZmmQ8Dl++WQ5mnpWqOqPGFTcwl1WSXOO/592QMaDjkyKzifv4AR8WidaUc
 L4UtYMONwTfsoxf7MuK0tQHWP9pEmawFrtTbSeot4AjWqGeNsK9DpGew8YT/iEXGv7tkMR10j93
 DY9Xqtc8wCbk724M9tQh/bdFlcvpgWwpP9V45ME5H8u4IEnv5HfXbj6OtYorjUlKbgpg8hXUtbY
 TxDbCqoi+nXVEA4CeGA==
X-Proofpoint-Spam-Reason: safe

Update the driver to use the new core helper that waits for the device
to enumerate on SoundWire and be initialised by the SoundWire core.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v1.

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

