Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E241F946C;
	Mon, 11 May 2026 14:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778508678; cv=fail; b=n43jc4Qxg6h6FSnfUUiJxv9hsyPaAW1MUVe2ZzhgNw5ApL4kZRstN81LMDAQwZVitKBSYXyVpfFYY8sdDh0wL/u0rbTd5WVP4KcKSTcOd2TBc437nWIVTkLYhERKLjg/Tb1dixZC9pareqc0JQK5v8bU/mzWq6V7TDCcEfW3sOo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778508678; c=relaxed/simple;
	bh=s7nr5FtXq6mc1Q5qMufK4DXsN0s/fZj9UR5p7gKYsyg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AAgoefuZE0orJ870ul9/8zRprC+MjDzKiw3AxpzbbU49T5vULGWmMe+o+fHYOOHIYl8k6afruo9sEKgekNCEh/fZOq1/CuKubJQit6ZB9F7ADkpryNRxT5t+i59CGxr1twSzw6fT8Dzifbj+qpgpFxJi1cgr8SfyEmOz8fcJ2Ys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=K0+MIJUT; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Qhc+jDKG; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="K0+MIJUT";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Qhc+jDKG"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B5k8JD3453589;
	Mon, 11 May 2026 09:10:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=afFf8Vwh78Xno02SGAlxK8QER7WYjjCaAavgiXhYM9M=; b=
	K0+MIJUTeFbQF0et0YJp6BKKTS3BI8flwJ8hPJvDSwqVPHcDjV1lGT/Qk034yhFN
	UsbPT3Hqt5B/vt0xUUawUk+t9H/ATLKMyQ8fPQ/5KM4PfSs2SghriVU7CZWOxUwh
	lIjX9W/hR3Co3diIVSTtnUOO2PQJdW4Gq7TKVRLATdEpHVfs2zrZwV90Bzv1hhlC
	5C4nV5+UQtpvBEAaQm/Nm0hUpF6WHKY6G6Vg3isW4ceNqIUSx70IXd2xu2G7BHUW
	I1hohJSxXRxMD/nXqy724cOltKYIqE9qtyqoeSUAL06EqSEy4fpW/AXqJ6nrTXr2
	ADASYRcJbftmNRYTm1fjMA==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022114.outbound.protection.outlook.com [52.101.53.114])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4e22b0t3tu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 11 May 2026 09:10:42 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZPGertPKXOR4aVZuAD01asfq3MapcNkxJWPkuXWNWwERxpMAQR887ExbC2b6q1iw1DKbKvFxexW//sevWD7oFvVe3kyI3l94C91eV/Xuw6WUwxaxJFpUfUEHhRt9K5eC8p/hPL1QHX0kyUQE5l2uArLrPAf1HkZtg8rkif/hfedqoh9iDCDqdol1Ia1UVAxYms/nRxARUr4QLSIOdzUDYTk2sxItypsknjM0oqLVHfE+ETIFVufBqhhdF5rCn5icQ1SI9zWfDyjYgRb1xjvGihb89YhNN/kvZlagXMVFYSsOmWsrLeiRlpHqT6iYO4DpgMoDIpjfmCrVb1rqTOOGEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=afFf8Vwh78Xno02SGAlxK8QER7WYjjCaAavgiXhYM9M=;
 b=THa5M9gxaa0L91AXNQzXtRZEcppO6Hq+riiu+ggV/xT4PrBd1E1fPAed9JT9aVNFO3W4IfYBSoeWqZ5gK0EUKNUZlSc2D+pgk/atq/wTmR04S++u5EtyMcAAuUIr21WGILGVjSvFM6tmyIUM3zLhfiqK0w/ERjYAXHha2gaSi2Dx7+Bbw+nmXEf0nGWUdg/5kQCnWiRp08AKY8DoNy4fzvtx0uZhG+cZg+qo6xzFzFnB16e9jPnBqZqOwoHF6loByPMsbyG96xJ+A8Tzxzvngy4yYrNmt5xkRnZw8oXL2eWL6jn8yezXVSZzENgWhC8I/vnu5wH6UYh7Mk7AKFa8Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=afFf8Vwh78Xno02SGAlxK8QER7WYjjCaAavgiXhYM9M=;
 b=Qhc+jDKG7kNxM95BcXJEg+GeplppP/kt5h4zzXqyGZIecADomBp4jMOoGJOdP2tIWDkEJ0R23aYK86M7fM4AuK4nUppeVHX7GVqqRdoJUZCjqD4PKU+0gPvvQha3OxKnx0Yg/YHKSU7xjM5Fs0L3kj5+P2wC+nrawSfnYYiXJqg=
Received: from BL0PR05CA0019.namprd05.prod.outlook.com (2603:10b6:208:91::29)
 by DM4PR19MB6557.namprd19.prod.outlook.com (2603:10b6:8:ba::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.23; Mon, 11 May 2026 14:10:38 +0000
Received: from BL6PEPF0001AB4D.namprd04.prod.outlook.com
 (2603:10b6:208:91:cafe::24) by BL0PR05CA0019.outlook.office365.com
 (2603:10b6:208:91::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.15 via Frontend Transport; Mon, 11
 May 2026 14:10:37 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF0001AB4D.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Mon, 11 May 2026 14:10:37 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 924D340655E;
	Mon, 11 May 2026 14:10:33 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 5B16782254A;
	Mon, 11 May 2026 14:10:33 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        niranjan.hy@ti.com, shenghao-ding@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v2 09/18] ASoC: rt715: Use new SoundWire enumeration helper
Date: Mon, 11 May 2026 15:10:20 +0100
Message-ID: <20260511141029.851125-10-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4D:EE_|DM4PR19MB6557:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9bb7d7fb-3212-4c2c-5b35-08deaf67137f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|36860700016|61400799027|18002099003|22082099003|16102099003|11063799003|56012099003|3023799003;
X-Microsoft-Antispam-Message-Info:
	nTiAn38PiUCGbRVhcjr7yOZCUpwvoxIRuqQV725S2teqn19Ppvt3pznjg0fc0hUrlN8p/Gut/6yHt12cgE5Q4v3GdWf5W6jHSo+yfRia+bWieeHUC9SMz/dyDv6y/7FcY4qri6x+4hv9pggkydqB8TfV98z5qV7lLxaIsj9UksoT9NZgw7y2kWO2/O5zUpoquFKsjVpIa/nkfQkaDkC02m28CrdCq6weYWSpuQnnrwewvPnHvaVtY4+p/1Mwj4VUX1XCQyVc9iYCS/ymTg9Q7izhod8LnuqeD1aSZt+1WgWEVKLXuyuJv71gLe0klFk9AxBJH5G8RLrvqw/H1VaSYmFCBjQTWZNDCI104mFmvGUTaJD3gh3O+8hOS4HiZr5XrsA+8fay8ebL27njbEb3bFreCZ7STFJ55FaJRdi3lPbiELCX2L0oPi06NoUbuNfwHG76l4IS6S9w+S/2Llz8L6fuRSu5O6kkJFDBi2ddPeNOX5ud1KhwFQxBrKUNINaUPW0t8S2VkiBbZWleObThjSWJE8BRykPyOkW06W8QnObPzh+3c8tSYOl1bFkDV4yxjzbGS9ntqnWCQ7B8fmtIS55MQBJSbTxFezxb1Uf24tvscWJGeKHSu6HtQ/8t+0Z+mUvpXsih1ibLjQalZLSGzoe3Q0xB4WmUghJmh528ZbACRZLtVwj9daUNvtpyUJSivsF+7nQyN9K578eFSiEr/HVSfOYgGIiH/NFS2nzKMtw=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700016)(61400799027)(18002099003)(22082099003)(16102099003)(11063799003)(56012099003)(3023799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9iIVEGALBoWJtzka8r9VIH1+HQuULr7hCSCjW9HihapzNfjSslVcMp4oIwsUQ3gGxnWn0A3DyCM0EOjHYOm1PhdIfnUXcp5YRwBrPZ7rAgC/WQtXkubghKEf0DQVkNQleDwkJA8oiphEKupsFeprXP6IhORkStz4laCcQY8RV2JhsrWQW8qq9tiYnrfEl37mNp/kpGnYPlVxXeFyHHIXvB87OR4O3jv9pCwLlEqBVb8l2DoDLYznahlnK/zvnVrz+/e/2x2BtWK/sGYmi0Vq5SNVfeLPy7E3hbJMr5Qve639OdikSDNW+rPs8vK7COHfAK6m00Fpe79scrBUhHxhZRjlRPGSay8CMew86PiXIFez+HRw5UadnA2dnP0uh2WWYzTDGEJz6NKmFtU4//WjU9m0Uwd+mH1eNTNd05YAIUtuSnugGHKgGJpXcfhAI33A
X-Exchange-RoutingPolicyChecked:
	PxAyS8VxY/+E7cK5GmT2D/2AU/bEVhDzUTWJ5FaI3aj3qDGI/JoXy6b+FNMnV0HEh4AAmrhroleNBf89zDE5Yw3P9q7TaK3NmektYLdcra1mgdUv5QswvPqcEI+Vk4Yi1lJyd4gouTPCZbFsjPnETaTSHvCACkbrFPbMYBxB+nu13LwDXhsFsv89pX0ScLVWBZxmNDq8lmnkUpNubLhC8+yxjM26IxM2uqWxgHeRsvTZwLqLeOF9QKkgfxzjS5CfC4jw2p1x5UCc/Te/szGPJAaoR0Fytt3GfJXRwVSIOSeJQPr65H6E9UFkul2m+qWqjR103wUPf9qmPZszdK46iA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 14:10:37.4736
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bb7d7fb-3212-4c2c-5b35-08deaf67137f
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF0001AB4D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR19MB6557
X-Proofpoint-GUID: 95EGXEDF41Nqsy2DrBynqKISnDPNqcNO
X-Proofpoint-ORIG-GUID: 95EGXEDF41Nqsy2DrBynqKISnDPNqcNO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDE1NyBTYWx0ZWRfX2CBt69dO/AWk
 ZIGINT1MzeabwKq659j8jjwgH5ACOqt3kNE+lWsJzaqq/+cPJtLiPiKJPu/jkSIMKNZxsimNWBR
 cPJp7IL5wvZp6CLLF6Cln9u01MjA2oyzVQDOlNZrio9g9RjowLZ/GngVjsnNNoCXNxq1BwDm9sL
 P1KOA6yreYX+tqzZRtc5y0KUHyv4PHN1UBUTAEvektPZE4SYSM+VNvC+hNnp+76Rr1E+Umos+9x
 JJs1uAlQTOUA7CfRi5M+Ah/O9s0VKSFZLsylBYkd04yLZRmkNtKoaON9et0mTvpwWEmcxRNNLQw
 jevpyBXQnj+biJrgPErL4LYIbPdp71m8dP0BZEn4NibIHJojWghslgmYZl2Nb1XkauGNevoLNRB
 /AgnKUO1SUimyRGpiYd7Qtc0Ch0PYQkBs4ze0qd/bxCWwjETPIk17QIB+nODtaKHZ4BDkvfyW7b
 2V+0+g+kdtPEX2j4A/w==
X-Authority-Analysis: v=2.4 cv=UdxhjqSN c=1 sm=1 tr=0 ts=6a01e362 cx=c_pps
 a=PPij9JC9dsFwf49xmEs+Gw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
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

 sound/soc/codecs/rt715-sdca-sdw.c | 18 ++++--------------
 sound/soc/codecs/rt715-sdw.c      | 18 ++++--------------
 2 files changed, 8 insertions(+), 28 deletions(-)

diff --git a/sound/soc/codecs/rt715-sdca-sdw.c b/sound/soc/codecs/rt715-sdca-sdw.c
index 968bc183b8d8c..4b9815b5628db 100644
--- a/sound/soc/codecs/rt715-sdca-sdw.c
+++ b/sound/soc/codecs/rt715-sdca-sdw.c
@@ -224,25 +224,15 @@ static int rt715_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt715_sdca_priv *rt715 = dev_get_drvdata(dev);
-	unsigned long time;
+	int ret;
 
 	if (!rt715->first_hw_init)
 		return 0;
 
-	if (!slave->unattach_request)
-		goto regmap_sync;
+	ret = sdw_slave_wait_for_init(slave, RT715_PROBE_TIMEOUT);
+	if (ret)
+		return ret;
 
-	time = wait_for_completion_timeout(&slave->initialization_complete,
-					   msecs_to_jiffies(RT715_PROBE_TIMEOUT));
-	if (!time) {
-		dev_err(&slave->dev, "%s: Initialization not complete, timed out\n", __func__);
-		sdw_show_ping_status(slave->bus, true);
-
-		return -ETIMEDOUT;
-	}
-
-regmap_sync:
-	slave->unattach_request = 0;
 	regcache_cache_only(rt715->regmap, false);
 	regcache_sync_region(rt715->regmap,
 		SDW_SDCA_CTL(FUN_JACK_CODEC, RT715_SDCA_ST_EN, RT715_SDCA_ST_CTRL,
diff --git a/sound/soc/codecs/rt715-sdw.c b/sound/soc/codecs/rt715-sdw.c
index 49c91d015be4d..7f83a8f1a06e9 100644
--- a/sound/soc/codecs/rt715-sdw.c
+++ b/sound/soc/codecs/rt715-sdw.c
@@ -501,25 +501,15 @@ static int rt715_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt715_priv *rt715 = dev_get_drvdata(dev);
-	unsigned long time;
+	int ret;
 
 	if (!rt715->first_hw_init)
 		return 0;
 
-	if (!slave->unattach_request)
-		goto regmap_sync;
-
-	time = wait_for_completion_timeout(&slave->initialization_complete,
-					   msecs_to_jiffies(RT715_PROBE_TIMEOUT));
-	if (!time) {
-		dev_err(&slave->dev, "%s: Initialization not complete, timed out\n", __func__);
-		sdw_show_ping_status(slave->bus, true);
-
-		return -ETIMEDOUT;
-	}
+	ret = sdw_slave_wait_for_init(slave, RT715_PROBE_TIMEOUT);
+	if (ret)
+		return ret;
 
-regmap_sync:
-	slave->unattach_request = 0;
 	regcache_cache_only(rt715->regmap, false);
 	regcache_sync_region(rt715->regmap, 0x3000, 0x8fff);
 	regcache_sync_region(rt715->regmap, 0x752039, 0x752039);
-- 
2.47.3

