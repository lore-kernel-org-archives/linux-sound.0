Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97434DB56F;
	Tue, 12 May 2026 10:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778580876; cv=fail; b=Cdou8QKg55I24FQaeI4hUj8Sc2iLkn3DgOskdHUGC/nbykrV+ZgrGdGPl7RdMD3gb7AdCI4jL+IsfM9vHpRFNFX9FiqWAV8WId87zoBpQvb1UDFkaYRWjg3vGS4m+qD4R9TSeFwyBbdoNt9yYKPoNr49UlaYzMJr87ur+l32wUg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778580876; c=relaxed/simple;
	bh=oUYrTIaomR49E5k4matlKCrhUa/FCXIvFMLx4zIHD0M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fTTkCWyA88Gc0s9FThs+bEPk1qvDDZ1GhdS9aJzHDkP5J69t2lwWxy658CwDBXMWzKEa7MuBCpgP+KIRup3kQ9YFLBx7oSe88+XpRZZmvvW5VtENhwZkKZfRmksW+OUEr3+emoaUH8KoDciZBuxSPC87JunG/mWwwRzZs0rdF5w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=XjCqnl6u; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=EvH6hIRB; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="XjCqnl6u";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="EvH6hIRB"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C4hpmm1493060;
	Tue, 12 May 2026 05:14:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=BGGKowfEF9UYJcPjtjdRfDqyygEP6rtjGPVJKz3ssYQ=; b=
	XjCqnl6u+GZN8yZWMgEPberY2UpDgEjArbDv3XFLz29X6Y8r8GN0CcA9gAbaKbkD
	uIvdtTemNC6n5VNqcuhmzJpiFrHylK3Qi1YOm+lgcfJ6tvAdv1k/7Go41DuyBkHO
	yyku42VcRMno9MXddmfv6Y4jK+6lWg3sdIFlnGiiT3KPjGncgn8FtlSrP/SpvBaU
	BV7HY2rWWMCrnVf6CukDfYSs/oPR3G99D64LS+Kmu5MF+2KhliGXk5qiC0JX1Sv+
	1xq3zisdQddcEvlbVl3WjTJ4JATY4NI5SPsJY+EXEKbVsOAtKwVRivdc/D+JWmpH
	2ke7D4JB0w63B4xtBXlQ5Q==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021102.outbound.protection.outlook.com [52.101.62.102])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4e3nw58q8h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 12 May 2026 05:14:01 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RcMrsFcQ0k9sOLxm0+1qKCnF0g4mdWsxFAIysyTXlmnoBLYEgbiatxq9xOXS1JkcahrtPTiM+bI0/d1OArLq/Kfr+kPQlZYapr0cxGJVDrlWPWdRZzu1eBkTRBX8kUCoOh6QlKHyxnlNEaOzFVWHX6Isf4CgBIRfY7z7mGByXQws3RUjJcsMD20B/IOpOcO0qpshVUASCcsVbyhVvXFfWnPu0c/xkMePN+37Cbdne6Iv2h3z5m1nRactQwx0CP29Z4wf6kf2tGmfxNkSpvB14aFFlw57TaWSMpeDvAMAmL7RWzNBQJRDrmOvXmQooe7Z5ssaWdJvLLTXsBj0jzzMxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BGGKowfEF9UYJcPjtjdRfDqyygEP6rtjGPVJKz3ssYQ=;
 b=n32ILoFoeiJjlL22D/2zThJLNphVoujaOIpOZIqxqwVseYCb47bPxX0O01CR30MumGn4aLklSPvqbyTGWPxKov2EzW/2REQoyi07gyfBSmpYVdfAVhCWWeWZwJviQgZl/PTHzNsa/dtflvfUpnfsirrerOsFsw1NDbdmi2iTak+j4ll2gXJ3t0CwHq9k86po8G5PVVmB2wLH8RcbePoZR4QvE5LwCdW1TQxcULmEqknWpqQTrlqWJ2zjRgIDQtxPZTgJEHIbLKT8JaboW3hyQJsKwNb2w6OSn0GXdJcQOQHbW9Eb7JgaUCQidzozmLDXZj2RSarFhelr0KNk2qIwXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BGGKowfEF9UYJcPjtjdRfDqyygEP6rtjGPVJKz3ssYQ=;
 b=EvH6hIRBQdeX+P2V4nYjE/y/KiTW4IDPvZdmDzhjW/g5mem2WUR/bbGLdnxjaRite1C96OAWZnkBfS6XK6Imm9Z8z19tV1fCn3zgXA6k/OXuQ+9mobzR9GD/R36j4nivAs7JhwTlIZ8P/b4TrVAIbChe1lBy344eAsEBKwQI4Bw=
Received: from SA9PR13CA0007.namprd13.prod.outlook.com (2603:10b6:806:21::12)
 by EA3PR19MB9637.namprd19.prod.outlook.com (2603:10b6:303:2b6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 10:13:56 +0000
Received: from SN1PEPF00036F3F.namprd05.prod.outlook.com
 (2603:10b6:806:21:cafe::31) by SA9PR13CA0007.outlook.office365.com
 (2603:10b6:806:21::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.16 via Frontend Transport; Tue, 12
 May 2026 10:13:55 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF00036F3F.mail.protection.outlook.com (10.167.248.23) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Tue, 12 May 2026 10:13:55 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D6CA8406560;
	Tue, 12 May 2026 10:13:51 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id B429D82254D;
	Tue, 12 May 2026 10:13:51 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        niranjan.hy@ti.com, shenghao-ding@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v3 09/18] ASoC: rt715: Use new SoundWire enumeration helper
Date: Tue, 12 May 2026 11:13:39 +0100
Message-ID: <20260512101348.1138044-10-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260512101348.1138044-1-ckeepax@opensource.cirrus.com>
References: <20260512101348.1138044-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3F:EE_|EA3PR19MB9637:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a5f25adf-3cb7-4deb-828a-08deb00f2cf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|7416014|36860700016|376014|22082099003|16102099003|18002099003|56012099003|11063799003|3023799003;
X-Microsoft-Antispam-Message-Info:
	bTLcIncaoTmaEdf9bgHkxrLfhYYLS31ldqryKJfpwbH5RLnJzt5XESKbKqdgHAexFIDNqgDNbAAbInCxSAdran8ufih/cEvvRZsn0ht/62YGg/lcG2/gvA79r9yqpo/+J4/mv6eMnVIOy3A0oZpuNedYXsFxOmgy7m/c8n48xBiYOxSaEhXSTvoFz2N0I2e7SSkEqOilqVjwA1/CgEuIBh+WVTD/XGppE2irW5X24e6bn8BFSTfQVvB3eowPVn2TzJAAZ7rgUUqvaadwsXYTgW5+V7fUHD7ZJ1ZctfQuBNd9gknn+TrswUqvKoBTJSmQxmiuoPp1jt0sQVRzqKlC8j4g+CIAkv/C8b8Zm9RPZBdQOAJdrU3pebt4k4nnm/kq8/750rR+1J+99XXkV8kw27nqSbJBTzm6zrfrRwkU25ay3cYY4EnQPK0tGaT9gIMzA1PYvSke4uRA8Hu9bDpN85ogir5tfx/p3UHT5CR+QoNOP5bqMJOJg1FRQLNfU11nSm1/iIobZt4RJquO+4xRudCI85hUVPzECn4utJTPMGjni/iSu32j99b377QI3nj5cx9DHeUOJ6whF5pjZB7HtFXouKL5rIG1XpfpcFxcwS5UFaHWCLGV8fLNzpRorkKL6m9ViMXloPiWZqRJvjQcld/hPF1Iu28nhrKttFUiG6FOuSeNkX+JbGqMgBNWfuDgzscZ9x4X2FKpr2JHlY82muXdyyaLEBB0N0dLlSPASvY=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(7416014)(36860700016)(376014)(22082099003)(16102099003)(18002099003)(56012099003)(11063799003)(3023799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	MEln+kF2rRikSwJU+VyYet4tordzRt8wz9kkuT9spO2AoAi156KWHr7yyLfUzGIW8ELicBxyNeobdbqGJQDgmgd4nCBIoXcZDMxFtMfnXb2nXGUeffVh+0vuU3zgsGfqqzobmaQKIOqLCra+sXASa3kNtQYa/3sXxwcFyVzBHPHIKp/Gqr0hUv3UxqCUaulBOemUE4LGUDlNeaPngJ4O5R/apksUALKoNpa0dahGfl2UyGEbMiqV1iN1nvskHJetPua4R8JvOHoFI7v+6sQbyzO8MhcMVGF4OmQboqo5fYyscPnNqwjir8sm812abeMzZ4NX4YWH++rrqRYAkg813zHF31L7vZKQph4xGIEEDOzQeNxRVAS3YDU0J5HcHiflPUQ0DMmdM1IXp+XUJ0rRlf5vIFJX980wclHdAT8f6NzzlNY4ym5I7uI5DaZWdg/e
X-Exchange-RoutingPolicyChecked:
	o0+7HEEFJtxN2R2pmuS9vgu4+0ht8YUJnEVee8K+Rzae3BMPTf5y+/WpjHKSLoLpSa4AdbkNOIokScG9ke1txktKC07FwXSVqgPxRcK46VIv9MqAfyY9s8Q9utF3wK1QcOLxfObskt1/UypjnzUFlndFqllkqD1/fP8vAxUuDZMGqufYLFixzT9hYi1RjAScg1g0Evviph4oRYZmhewJJWJ4oIwfOEx5ENJAue8u6B7qpPFPiMMmJq9byfI1mPz4Cqr/0hZ6fbfvYxdxx9zTSSKp8/zirVQWZ/ikRmv4BX6SRZpJlrFODWaefIXZoX8QkVvB/07lexm/sWa6Za3nww==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 10:13:55.5608
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5f25adf-3cb7-4deb-828a-08deb00f2cf5
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF00036F3F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EA3PR19MB9637
X-Proofpoint-GUID: uSJAE8v1fO20iIxnZEukQhTUQXcoaBca
X-Proofpoint-ORIG-GUID: uSJAE8v1fO20iIxnZEukQhTUQXcoaBca
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEwNSBTYWx0ZWRfX2iniZtgyUJut
 QrzHcvvxwirqlwG8TcwQUzjA6czx+sAoNrLAF7hSNHHH07bRWiU/VDugArKcT4XT1N5Qg2YsCKz
 EgboEZ2tpCmnxkBZxC0jTWI/qpYYQ05fg+KTj8SHUxirmcxkZQw3r3hhLWGhaMBTYck/YKPL+rt
 YXUCgUbl+q4qPGRR84yAn9zFTV0fR7TXwbkOMtsKJNZyrvN2sou24o1oBibFBYH0wZmpKyr5Xhp
 c3/r1KVQ3tF/3/UzfccPTeoXZ3WziBX2qzmSG6agrWIVZR8sIqLBsef7+g69bNkKZboDZbwdwKb
 9ZicP6dWe4GawQ2Q8qUvpjEC0I782/jIFgGYjSvtjFsU/jjNgVVr02dcpEdDeW7/GtiLN5pC0tY
 IavbI7j3f6pn7Worn3KQ4+cJ6m1b1/RsvGT/dhvuXmWBWvAc74tNc7lKJczfDSAAtHQLXXEuvQX
 d8486jeZfbmn58fDBUA==
X-Authority-Analysis: v=2.4 cv=KsJ9H2WN c=1 sm=1 tr=0 ts=6a02fd69 cx=c_pps
 a=ZFdWVeMVgMUaj9i/bB0qbQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=RuJZr_uWk9hIvXmwfU8A:9
X-Proofpoint-Spam-Reason: safe

Update the driver to use the new core helper that waits for the device
to enumerate on SoundWire and be initialised by the SoundWire core.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v2.

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

