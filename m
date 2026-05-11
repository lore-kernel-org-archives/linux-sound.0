Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC1D3FCB27;
	Mon, 11 May 2026 14:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778508702; cv=fail; b=G4p5Hdszpp9R8lgzXK2rpCZamqmrKohFFL5gr/sm40QmUjGo5MNshFD2araHRm4WMsPtcIbFbs61VnuP++hwh8dVqcKsKTZGODFbElO2dLK2tsG06lPQdnDcdlxcdUUk0LvPg6uVbobb8DWoAcMCeQ1cwknNTiShSdvFwug5SOM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778508702; c=relaxed/simple;
	bh=TZqUIRoFl9sQHmf06y/kCEtZY67b6ssnjQktvpOeIlE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qAaIp3wJFVE+WLsI/jINZTTFtvnHn+ocMa78pkTO8o4Wf4O+rM/1j4Ec3o+SVJfkyIDXmCiqAOJTkcB2MPpCKAJdJF6ZBRAfba/7qMZRKGfzl2Z4sa9NZAkJVNjBXv69Kc+7V57wK/RfpAAbmr0EOH5IG7b5tNsNLw9uNiL/lgk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=evPOIfxM; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=J9ZB8dTJ; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="evPOIfxM";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="J9ZB8dTJ"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B5q0RE2674250;
	Mon, 11 May 2026 09:10:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=zLhFEiSUP/5y8BSSszO8bE3v1NZKPAYT2zdfrb2pw+0=; b=
	evPOIfxM2GptiXHuwFXyhrhux3L7tHikBnHFkslFBGZJW/8nDCCGTWPqyRnkuH3M
	aZxXwxi78VU48bUhhxHzEdjzjj8kEk/Ca7FWH7Mz+t3MLa8sFYEVtMauFYC6KC7C
	dUsu9852r2lSeVfcHay69ZsWRFK1IGvt1c8CYnPL383GzqVPQ73H0jQJhjmi3zEZ
	RPc1IymqFFm4Iz3Dk0uJPk27p0RSyG70svYeOgSRLSyzpiugOFLYRY0d/7ywusUd
	fGM7fO6RoPGja+MKq8VZnyo67c94J3ejTo4oHgF7LH+isJl+ripN9XBzr8VbjJYZ
	2txQ7M/LNeVKc0h0Xv6E9Q==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022139.outbound.protection.outlook.com [52.101.53.139])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4e21bft8fy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 11 May 2026 09:10:46 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yfyue593cd/AHVNUWhFSr9cR8GpBiUWN6rgArqnWMrUu3Sh2fH4YvlSdCL9jcYRLKhBBXFZPYz+wvK5GsXk9yXjh1yzJFLcVQzJwR2kyhy0NAN8FgpwQZgwRLkZNzBQyy60ZT3dHe1+gGzTLNBO7JeyR3KVn+8fe57iGqWI/P2tJWqU67az+HRUhrEo0wFNKBvn3u8jKk9h9cyBNBtrDiDFHN46EonQRk7vw7jy+ZTe8FzctfAqHF/iaJdEU+8bs0OqFqPTcwA/rnDQV1J4OrlkyBpZQ9f41P7hpa4d858VaEBnMTP3e1f2HON17pJFcvYTfAVJ0tJrDGo758LymFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zLhFEiSUP/5y8BSSszO8bE3v1NZKPAYT2zdfrb2pw+0=;
 b=vjS5PmJYKuInnE8j121Jqf0eiv4DWMUftE5o/AKI3A8U73iwCEdsM6Oc47a7YWoSS8fgAXwFlUbGyYfqa8HOTc/UjwuyRIO6F88a/fuimQK2CwqF5pKpzDfcVGMC+Ias3y3fhoIOcTolqSk5td4dZd6g7de4a25I6I/De6nzKlkXrXn4Awib7Sd0uK0OUtphs2CMR8rnLPLX/9JIPUVdutGW8A5yR7vF7kgwbikSFwm5Ze0Oj8HasTT9mYqQkDbaNw4mOh7xsfL1xbSsT2l/L7sZ1Ig6bn9r+7boIQuhBJVvj75EYfGLoYvHvV8MSJC3iprMMvnN10lC1z8kIoNIpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zLhFEiSUP/5y8BSSszO8bE3v1NZKPAYT2zdfrb2pw+0=;
 b=J9ZB8dTJOxfoCo2JmyYr8sA+xY0H9DHijuX4FFn04BBBJY1d3gqnaKDTNSWcC1z1XfM6ndgzNRyo/X93K5ZB+TMNs1iSypRDB9dMCEgwE9skLWFrpSsvf7JvBlPxwB7ah/ckDrcPC6vpW0uGQU4yUED/vyM4OLaS7vGmTfEgsVk=
Received: from BN8PR04CA0050.namprd04.prod.outlook.com (2603:10b6:408:d4::24)
 by CH0PR19MB7850.namprd19.prod.outlook.com (2603:10b6:610:189::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 14:10:39 +0000
Received: from BL6PEPF0001AB4B.namprd04.prod.outlook.com
 (2603:10b6:408:d4:cafe::e7) by BN8PR04CA0050.outlook.office365.com
 (2603:10b6:408:d4::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.22 via Frontend Transport; Mon,
 11 May 2026 14:10:39 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF0001AB4B.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Mon, 11 May 2026 14:10:38 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id A3FA0406567;
	Mon, 11 May 2026 14:10:33 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 881AD822544;
	Mon, 11 May 2026 14:10:33 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        niranjan.hy@ti.com, shenghao-ding@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v2 18/18] ASoC: tas2783: Use new SoundWire enumeration helper
Date: Mon, 11 May 2026 15:10:29 +0100
Message-ID: <20260511141029.851125-19-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4B:EE_|CH0PR19MB7850:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2e8ffa23-0cab-445b-f7b0-08deaf671467
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|7416014|376014|61400799027|11063799003|22082099003|56012099003|18002099003|16102099003|3023799003;
X-Microsoft-Antispam-Message-Info:
	BBSaLCpAnSzFltWZenKNRd7t4JBK2vBxIAz0brm3YK1wBpz0nhb5y38SX7ylS61I9hoGDPIKpCZWDu89o0shprTimAgXgC3hcI7r2f4qnhOfgA6TY+YQbasGO0AuVPj0bwVBvY2deCErGNq0NwQNZUS0m5f6iK0oh2WkFmhn+osHpjMno9pUjoaWb+SJRzN/BbbJlw6lIYGn3wy87DK/42Yszs1NhdhFK91tqcgocak37TtAPqNDldGfg49n/DVWM88ejp0ZtnW7qdnj9a6nazjifwkkSjv1H5tdupByb5vGm8xqhQppVHTHqwIjc035WujTl5jn9UWpjXMCxrRZyYSje6pb/vvCwTAf91bSdS3CQLZ0tYpzenI04kJHwAas7R5FS3VH0MMovDYD6WfrJUzGCzFM+IRTs8tzS5SaOK+19tbFD+EU8GwtgqpQqB37XFtwm/2HA1XL2kP96YrMfFzDOwkF5F+Vj9qGU7W6ZWrXS33NEoYOJsrPh1T0V4kcLl78s6VcFLpgM8JO4osBZCtkuaVi0vyxX5bY2e1jR0uZRhjkuDtd0r82TrlsPIbNmYMPjmr4hSFQDwOadO7J6elalEVLqwUhM9k5JOhnazYrL0X6BwvdMKtVFq/novRtuLAVfNaNtK/J/iUugLef8N9jlkUEWqKkY7wpPue7HLDjNfqCtoQTqOxJ/IKHTRsGScEFdoEvs43qHXwE9QHehx/xJwdc2zYolZEze7Ddsao=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(7416014)(376014)(61400799027)(11063799003)(22082099003)(56012099003)(18002099003)(16102099003)(3023799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5ZCZKH0hC5mBS59pjTKPCMh3cGj3RiZjbD0NKNrU0B1fDYseVRfmdr3eqRm4SsBQMkUe+qImD7ebFePOrKTQVaaoCchRmjJx0BrkDJ92ZxNi9CRwe/i3yZTMevSKGn2n0W9iiN7pTAJgYl3MmMaA6whO046ikurxqQSBCvGXI35HtU86mPQM2mYLubRUTaf1HLkCO/uc+R16gH7bXgFegZaudBdySvpp+aW8uot/veZ/qlPLqO7mKh0/ym/IyDPCfGG2LyjkDnW+2KFq3oD7ZBZS4iV7FeXcBTFzNL2lZTcW7R1nvOCyv6uaah1AEl+NDD1ZBw4+k/XZ27RXHPPzF1OXNFibsUdJlNOhK1YRh0hcgPfeoRvPXHYHxGyxNLEAYRHxhVrxt5gHeIeeCna39A0chM5tOudx3Jyf18d7owit8XQnHF8NRLd9BsjhXghm
X-Exchange-RoutingPolicyChecked:
	WDzATSLCisO5aguKnOG9zRakRCGjQ3M6GyPnN5LTDyuk1wfoSxl6vN/AAKtd+G1wm3wmlNHpVogv1glot1MAZQfuI37JL3kWSmCx4VpqM4bQY9ZcOY6P3QH3uipQ4aLKUVCbrkouM199fw8+gbEB7SJxNN7nFBLrE6IxIcTFljO1C6Bg4HFYowjJGtLRfXpCkLmX/XOJxsARu4ZL/PHiLy0LTDRMmoo79cPR96vFvvGatYhySvEqAJxzYIFL/kK8ZnwEoQs/b67+bJAcCDNbiGW/rjz2kOguPfcNN6sOGfZPisoPDR6e3UpWHCy4MXLShykWY2W1nOJE9cArwaZlGg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 14:10:38.9981
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e8ffa23-0cab-445b-f7b0-08deaf671467
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF0001AB4B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR19MB7850
X-Authority-Analysis: v=2.4 cv=DYsnbPtW c=1 sm=1 tr=0 ts=6a01e366 cx=c_pps
 a=cbpO+9MDPorBMVlaIuc8EQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=_kLIPOSdNJ7StitxxVsA:9
X-Proofpoint-GUID: Cg88SOf1xfY4GyUzqFfFEaXMDuADoo5d
X-Proofpoint-ORIG-GUID: Cg88SOf1xfY4GyUzqFfFEaXMDuADoo5d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDE1NyBTYWx0ZWRfXzDoolwowzsZf
 EiSGm37unwQ1MKIWxViHerSS7KIdw3xINQNWuwT3seuuko8XmRzJrs43gsl7s13R9s2hbSypKuK
 yCfg4TjKNUIcJCiEUQZYT3Eqw99HHvmiOZZHndwt+xKUvKGmubHfywloBWKoMRf3FkPH0y/uqkD
 8bOTdcC36RGx9K3PvgM3fk0ZmLSc+c8pBWmXYx5P2cEKtrnO165PpdtFQmHU9s3HdGrZ3oEZNys
 s76y9U73Hh7y6Q9Mf+fTdXmLTH1Yh/q0al2sVReZzaNew5oe03TgSEyHojU4KPN/autF91+NMS2
 +PCtvRRwB04GJYAn9YFwfyKMAWJw0JzLQtVNNnfgxhT57L+MP5evX3SS1GOUFFMl3Kr45H32JkE
 ygdLIHRljuBzksZ2Etb/eI6Z0X4OAgkyLazs7pkqCeiROSljNF7NzJ7GH3k+qewuTOxbnm02XSV
 nX1hL+mhkJdwJT+KNLg==
X-Proofpoint-Spam-Reason: safe

Update the driver to use the new core helper that waits for the device
to enumerate on SoundWire and be initialised by the SoundWire core.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v1.

 sound/soc/codecs/tas2783-sdw.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/sound/soc/codecs/tas2783-sdw.c b/sound/soc/codecs/tas2783-sdw.c
index 38009168c5a11..69d03ddc7a0ba 100644
--- a/sound/soc/codecs/tas2783-sdw.c
+++ b/sound/soc/codecs/tas2783-sdw.c
@@ -1082,22 +1082,12 @@ static s32 tas2783_sdca_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct tas2783_prv *tas_dev = dev_get_drvdata(dev);
-	unsigned long t;
-
-	if (!slave->unattach_request)
-		goto regmap_sync;
-
-	t = wait_for_completion_timeout(&slave->initialization_complete,
-					msecs_to_jiffies(TAS2783_PROBE_TIMEOUT));
-	if (!t) {
-		dev_err(&slave->dev, "resume: initialization timed out\n");
-		sdw_show_ping_status(slave->bus, true);
-		return -ETIMEDOUT;
-	}
+	int ret;
 
-	slave->unattach_request = 0;
+	ret = sdw_slave_wait_for_init(slave, TAS2783_PROBE_TIMEOUT);
+	if (ret)
+		return ret;
 
-regmap_sync:
 	regcache_cache_only(tas_dev->regmap, false);
 	regcache_sync(tas_dev->regmap);
 	return 0;
-- 
2.47.3

