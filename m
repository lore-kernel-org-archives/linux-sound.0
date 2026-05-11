Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4376539E6F0;
	Mon, 11 May 2026 14:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778508702; cv=fail; b=rn5HExbQQTO8XLX6qJw6l8DgeB+729v4yd6nWEfWXE6rVU1Q1vc+/EozA7Cv3AU74bIi5KhgIicOz/OjG3XmY37Yswt7WtG+EUdVhMM95DWg6lapcl9viSzSubVasIsPTwtLreet6AJZQdr2FuW4VKb0AhHazH3QueN2ZCPExPU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778508702; c=relaxed/simple;
	bh=3ZgUIw9nWIaj/ZHs++sKBCrFzlbLFXEJMM72/WZKX4k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F6+bp4jyyY9H+lB/HGRsSm4DROFWlcdJgSfxuuzFCddr7r4z2v8baQyJQhXkTzop4SqJAOk62yG5lUmtpbqeTxMoXDh9iwZc5RW1Qcjnmy33DW0VZ4hj11Ssa9y6j8kC6C3YU10sFnbgjMBek144NBnZuA4/VxoLVSE5p2D4rAI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=o1TVhjEN; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=wHhkQ3UC; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="o1TVhjEN";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="wHhkQ3UC"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B6FugX3500451;
	Mon, 11 May 2026 09:10:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=PPfnFMy+XoUAGt0vQjjDIGSq6lp3GAHpG363OQgdNJo=; b=
	o1TVhjEN5KA8fwtxCZVVOV7t7dJ7stGNInlBEuIfNvPq/6ljvcXAuOgg/IhH81xf
	wXZt1fTSzPr/0VL+becagX/UhnDd0VjQWtn5///aAgMwmiN0mIldloLdFG2q495f
	kuWpGqDoZy5qv0eltxgH8C3dimmwSWFaUItpNtjDuBGIMhtwJVzP2vwvbNc6ZiKX
	4IzxwgsDOorIztje4mY5akir4IY77F6w7HYE7GxlxfJOqjr/6xESghSUfmEXMSZE
	H8gwti0KrewDSzGaWjpgj9Q0/1fhWBj/lmec/WA4CklL7HrY5dnUDBvLe0NXGhZD
	yiRyfs4/vwum1s/Rnk4JDA==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11020083.outbound.protection.outlook.com [52.101.193.83])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4e22b0t3u6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 11 May 2026 09:10:44 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wuwyB8iaZG7taOPLFp5wc6AtmLNULNs4n0HCPpJ+pjMNGxl3f+fQoRK+FwrHc2faLSQ2fH9+mJtz/GgSY9vyCVIGQ3gYGh5h/oL1rtaDPd/uHhs+JnlpFdYucMDSVx5XosJ6V5QeXi6+8xne1txbgQotkqFDCZ/n40PQTYe2Jnec4PFxWHo1sznD7liVKE7wJh1ZfFVzyPCFTKN+RHHlpaa+eClcuDivqkKLzGX0qXb3roCkjlQCFDT32NpoFPsfsV8fibdQNSTuBiyXB6RK/srubuGcXlWMySxijH2aZD3E6OvHGrAxPtI8Vw9+JgOde+8hp0IJbL93JELgLmdtNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PPfnFMy+XoUAGt0vQjjDIGSq6lp3GAHpG363OQgdNJo=;
 b=LI9MR4loJ8Jn2hFDvmVbq41LUpdaBIpmtJuwz4FoeRV+0V2TCjXu+g7AzU1qZbx9UEsMCelA2hNSStdAwg0iRD9S0aX4dJ92Pcx5JKwl4Mnp1Beebk4Xpcy0EX4/VVmONX+TL7LUHylzmiANducNEGFMTFaxBhkcG6gXYgAHHMZlFAFSTThnb/ULaPGkhgvx8ikDytDZVsyvFj/rJ4DZusQcNYxH6dYA1ob6XAc6zaYSHMTmFJyRKhvJwtD0J3Glx7mPK06lds0dF2NXOGCNkj0s0c4dazRqmNMU4Hd8S9OJyZmmied7mWmuQ1eRgKgv8+4yE+vsPlA8ByqYy1vQEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PPfnFMy+XoUAGt0vQjjDIGSq6lp3GAHpG363OQgdNJo=;
 b=wHhkQ3UC9t6VLpU7wBaq0OyKx4b5NY056PHXUOR7ci9YOqQzhk4cNiI1RVpJTSlqByXNaU8zOi0xxvrLVFi7sQXEToDzmLutx7Rtzcmm7sdLqNi5ehSpKIClT5psa92sUGkbCLJAAlb0TmPE5u9cBnl9MXa8Sg6jv/huMaIWepk=
Received: from SJ0PR03CA0032.namprd03.prod.outlook.com (2603:10b6:a03:33e::7)
 by DM6PR19MB3867.namprd19.prod.outlook.com (2603:10b6:5:248::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 14:10:38 +0000
Received: from MWH0EPF000C6191.namprd02.prod.outlook.com
 (2603:10b6:a03:33e:cafe::ba) by SJ0PR03CA0032.outlook.office365.com
 (2603:10b6:a03:33e::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Mon,
 11 May 2026 14:10:38 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000C6191.mail.protection.outlook.com (10.167.249.106) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Mon, 11 May 2026 14:10:37 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 917E840655D;
	Mon, 11 May 2026 14:10:33 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 5760F822549;
	Mon, 11 May 2026 14:10:33 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        niranjan.hy@ti.com, shenghao-ding@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v2 08/18] ASoC: rt712: Use new SoundWire enumeration helper
Date: Mon, 11 May 2026 15:10:19 +0100
Message-ID: <20260511141029.851125-9-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6191:EE_|DM6PR19MB3867:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a1ceaea8-12c4-4066-e71b-08deaf6713a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|61400799027|7416014|376014|3023799003|11063799003|56012099003|22082099003|16102099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	R/0Z2D98nPFiaNOi2UvU5qS43ccVN+Resu9j0gZ7fA7A6uG/PbgCH9NxQdn5ssJWc2khpUn6zqX1S59MN5v6bGmGcWGaDyzyUWONrdYK2KfoZ/LTgQ43qcj6zunv7TJ1w9v+4iO7siZkF9QzhlHDYX0H6ojE9cUjAh6z8rzD4H4RtH/ZjOipkApYWVSiE37iAHSNKDmVAhjZ+oVZHg+mSs7zzz8EFpQVfWAMakxAlONO49I60qwtjleCa0bjx77u87d4pYiobOMQ/8xxQfLRky8Bg2SnwtLeDUa1vLDY4g+EH5mtaBdce6QlhjzWRjhOwPFCWqeNthztBxo7l73H1nosOEl00ppfEabCcdl4PiJ/5dLucrnm1heVHQaURBOdUQrJJvK0/Ak47lfPjDGK8Q86gBI5/YZTVcgW1iCFPYGxq9sFwp5pBKs2iA9I+M1SaWDYO5IW5YR7ioa1iqn4swb8dWKN4LaX+nzlgZnoju28nfxeHN/DJb5HUh/ZWW3kw+BkS1AZEKUy6bj8CdaeairuFWMlY76dXpKtM8iQ6AnllXh7aRru6gYQ4kMag5tj/t4VdX5A8BYWH7q/FmitB17ABcC+9ehE2qworsKKSvEbnWbrkcBQ0NSKx/npifhuB0lnCmfhsSqtlJpa8TtdZDMI/5IQjljpCvfjQPurnt8oMejpz6CxePzz5Ocy3/BgPoXJqm7gJMk+7neO9d5S9FkZFh12vL93zcgM4kBh7xM=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(61400799027)(7416014)(376014)(3023799003)(11063799003)(56012099003)(22082099003)(16102099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jQuERPt1vulCtb3n2CgPfHS8zcya2Yb24oD8KYXOpdQUL3Y/hFeMjTBlIsuppZw7/wkNekA2fLQ4/d9cp6mfbVMV5atHJz1YDEOcxKGRUcHZ9HvlBD8vw2QPQlwNFm8dIfgaUtaNtAoGS4A5sjJDlJgDotuCu7lDMvjOqMZXgJD/oTgmO+umRCqPHqgRZnrNfox5QkHJqgFQAJsGwOc73gCWZIVGisgm5vCQjsTXVz/zBjkOhicmfKiRsAp5QKzUOk96hNoEIq2hMJKRV/nWZ4B8rlfqNqGBWJxf8xQcrmt2Od1WWKSiDKy+ulIHKbd2+Ybl7m4pudG9bOsVhL3zWzLCwYes96aD6kuC+vV0dYIxp2mmu79285+STY/FjuQ///6EZeNN0R5rRA3bWCagWxAnPBSyEpLe3hUmyww6kWP16yolKn2B4EpdyvHsqA1i
X-Exchange-RoutingPolicyChecked:
	SQgV7FdA1brlpbfgg/YuC0zRsWgEDzx231daGe966801bl4vWh3lWYw/gAIWvYhc1/j9MeGid7cu4u1Ee3zQZ7jZAR6fo7dbhHUA2GzuV5Vwy2tfnCsD/enWrYDttFnms48kfs7ZV/Y0+hJFMRYzmrrBtiEOkioL3tk98b51w+tjD+OdGd8GHOJADzA0BzfOKrqjn/F63p+/DP/L6K1BB6vjRwJ1CTBuJEhk/IVkatghmsklHPLe1XktlxbaHkV8w4ug6tPxC1hHITcWpP0DjF9jqxJZYbSb5x73G6cT3249SUTggX3iE4tGVkvfCHZISVSIxCFg+JKKb4re8Q6fPA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 14:10:37.6107
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1ceaea8-12c4-4066-e71b-08deaf6713a4
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000C6191.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR19MB3867
X-Proofpoint-GUID: Dxg7giCm6L7R0LavJuuehMHuwGeYbstR
X-Proofpoint-ORIG-GUID: Dxg7giCm6L7R0LavJuuehMHuwGeYbstR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDE1NyBTYWx0ZWRfX9rt4zcmLj16N
 VjuU7XphCE9GXonP01PNxRttpbKOU7KBht5qMvPEBCrMq+Mrio850gVz4mVNo+75DUuX1qHYF89
 eb+HoIhL0cOPbd3Vj2zKPOJZS6WRQkXIQcjW3s5+ZYRXs0lajWyGR5ufjLiKWwCyZ5WIiFRrbmm
 SFOe2IKetjoSphPrYn7LVRcArEnQqGrAsb/8D6JxQyVtW/UWr/CY4aDBRXnPRrgR6HfbrgemsO4
 CVVjv0WjBVsEr4Ie/qUKx6zin6rxhhdnBm3dUE0GnQKDcDGwzW/7AAnfzVQVUm2Td/SVWLqCy3Q
 DKrRKxWeiviTM4bjusXFvHvMufnqfdlCA6HZegBjb486jAPFgay/EjeJ48UQqrMmer6U3izp5Fc
 Hb/2buYpsTF0DcsS+STCwutqBvGuun2kCaEvazeVQjsgsJFCP4wQatpLSHJLwror+B9ATZHQima
 eqENRvZUhKhPhIyUpfg==
X-Authority-Analysis: v=2.4 cv=UdxhjqSN c=1 sm=1 tr=0 ts=6a01e364 cx=c_pps
 a=Z408G3IxvFbrXbiWnw16Dg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=RuJZr_uWk9hIvXmwfU8A:9
X-Proofpoint-Spam-Reason: safe

Update the driver to use the new core helper that waits for the device
to enumerate on SoundWire and be initialised by the SoundWire core.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v1.

 sound/soc/codecs/rt712-sdca-dmic.c | 19 ++++---------------
 sound/soc/codecs/rt712-sdca-sdw.c  | 16 ++++------------
 2 files changed, 8 insertions(+), 27 deletions(-)

diff --git a/sound/soc/codecs/rt712-sdca-dmic.c b/sound/soc/codecs/rt712-sdca-dmic.c
index 4d83544ef2049..4c5c2f5ba5edf 100644
--- a/sound/soc/codecs/rt712-sdca-dmic.c
+++ b/sound/soc/codecs/rt712-sdca-dmic.c
@@ -905,26 +905,15 @@ static int rt712_sdca_dmic_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt712_sdca_dmic_priv *rt712 = dev_get_drvdata(dev);
-	unsigned long time;
+	int ret;
 
 	if (!rt712->first_hw_init)
 		return 0;
 
-	if (!slave->unattach_request)
-		goto regmap_sync;
-
-	time = wait_for_completion_timeout(&slave->initialization_complete,
-				msecs_to_jiffies(RT712_PROBE_TIMEOUT));
-	if (!time) {
-		dev_err(&slave->dev, "%s: Initialization not complete, timed out\n",
-			__func__);
-		sdw_show_ping_status(slave->bus, true);
-
-		return -ETIMEDOUT;
-	}
+	ret = sdw_slave_wait_for_init(slave, RT712_PROBE_TIMEOUT);
+	if (ret)
+		return ret;
 
-regmap_sync:
-	slave->unattach_request = 0;
 	regcache_cache_only(rt712->regmap, false);
 	regcache_sync(rt712->regmap);
 	regcache_cache_only(rt712->mbq_regmap, false);
diff --git a/sound/soc/codecs/rt712-sdca-sdw.c b/sound/soc/codecs/rt712-sdca-sdw.c
index 8c82887174db2..5817321804736 100644
--- a/sound/soc/codecs/rt712-sdca-sdw.c
+++ b/sound/soc/codecs/rt712-sdca-sdw.c
@@ -450,7 +450,7 @@ static int rt712_sdca_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt712_sdca_priv *rt712 = dev_get_drvdata(dev);
-	unsigned long time;
+	int ret;
 
 	if (!rt712->first_hw_init)
 		return 0;
@@ -464,20 +464,12 @@ static int rt712_sdca_dev_resume(struct device *dev)
 			rt712->disable_irq = false;
 		}
 		mutex_unlock(&rt712->disable_irq_lock);
-		goto regmap_sync;
 	}
 
-	time = wait_for_completion_timeout(&slave->initialization_complete,
-				msecs_to_jiffies(RT712_PROBE_TIMEOUT));
-	if (!time) {
-		dev_err(&slave->dev, "%s: Initialization not complete, timed out\n", __func__);
-		sdw_show_ping_status(slave->bus, true);
+	ret = sdw_slave_wait_for_init(slave, RT712_PROBE_TIMEOUT);
+	if (ret)
+		return ret;
 
-		return -ETIMEDOUT;
-	}
-
-regmap_sync:
-	slave->unattach_request = 0;
 	regcache_cache_only(rt712->regmap, false);
 	regcache_sync(rt712->regmap);
 	regcache_cache_only(rt712->mbq_regmap, false);
-- 
2.47.3

