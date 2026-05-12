Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5140395AC3;
	Tue, 12 May 2026 10:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778581912; cv=fail; b=PGFkFQ2NNx79P7aFh1K5PDjvZUk1gDSLoxi/ta/uzaCt8EeuQkcbusaDLtOHQLysZcE0glW3lQt8Hx6hlVo8Fppue3Dl8Bt91lFwnvGdi6boenjR9UUyfkVt0oLyO7bEZQOelweDepOT0FmEwSRLaEWlgJJfEYx9IUgYCoWWfcs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778581912; c=relaxed/simple;
	bh=8sfQCb9Elbo+5BHRF5H2eNysQzNBU9Z7QTauUEpn2d8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XVqmUX3l7/53bHsP7DUiayRxtnOqlEO2h4SkhXKMKPtiwiFvm4cr0FX0qZxse6Kfw7AfJyryKy1G9sCw4+u5JkbFVP6OsHHULU2BlamRE2bxX6g+1ah7u2KdOPxaPwetreGhsYCPVr9COjhi21cNbPn35Omr4BqcHNQDIkdo/20=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Vtn0rpno; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=pOm6lyBO; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Vtn0rpno";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="pOm6lyBO"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C7N6C61750921;
	Tue, 12 May 2026 05:31:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=hbGe20/UtY2FGWZQctwO4eVlqFZ3lLstwGNluXN+pj8=; b=
	Vtn0rpnoVXo4JN7mrtloxN0jdBC5NCatn3viCyx6rX1xsS0NNXhB9Pd+sPqoD4it
	kq3qbqPCQpZwYShyDbllm1nsnDk99RBXpWl+1Es1yu5QjMEPVHIT+I03HH1V0EbL
	UTlNLFZBxyFtwBRport5Ha3lECw4oDiaA1gyr6AnwOOzKDM70Er/stNbBWIImFxi
	KHW7aopXK/IkD49Re14acem/46NOeP02ze+NdkvJxd3Evy8X2uB8bH7+GC4YKsPo
	NCjX3n1ajvjRuQ66JkunJjcgspmIerPHdugfZhjoEhP33B5Vp3NOQiJn8ObDsVpF
	eM+CLbhimBbcUOKS90V4Dw==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021098.outbound.protection.outlook.com [52.101.62.98])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4e3nw58r89-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 12 May 2026 05:31:14 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jtZ14mhzvUOM4/PcOJhyFKsKm7f1cjki4RpxzxMgXHtFg+a4voZTDyHheQMxUSFw5+VrwcW7xyGJGwNR57F/yiNSkZJU9F7T8p9cWTokxmNtKVqClR27osffSyw2c/GAaUBla8SGsw8M46W+cCg7I5RkpPVi1OowqBtc71RvwZOmhxSXzs2zmA2MguPJOIBtg//211djl5kTxRAmRwzAPxIncyW7mGlP+D11iPRorJZ43+9YQuqmG4dT9fU/W6pxOnHS1GS5Ju4g+eM6Cer1Mtgr8fgWaUPrud2sjX7omok/qAcnJFnqufLBq++fc+R/K5+l8UT9OCOnVlfKaifh7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hbGe20/UtY2FGWZQctwO4eVlqFZ3lLstwGNluXN+pj8=;
 b=DIEYCkt+u1eFMkfnjcipQpzHNhE/troZIprMwb2LcDdSo7BdDyr0tcPbv0aIV7ld3xnZbyKYkEWbNVL9J0h38P2qfwHtjDnyEq58kx27N/AG3oimzRdpAiHBtLQUzKUtHK+C7WluGVAk2jNm9M3o+4EBVsX0UKZ3Hx3NYq/le0cOrEizGcAouEuyENxlrk6pPHWSv2FqX6y++DgEmPSyUTq8IIWJzCQ8WNDZR20LM5AOADidzKZCcvMRq9yGls+ktJngKIKLOnnVfSzZNZGzx9rTh+bVbWGDEs4bSv1aq1gN5Vada1QzzG4nL7FY93eJoLHI4oBLyESJKUeVKKKmCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hbGe20/UtY2FGWZQctwO4eVlqFZ3lLstwGNluXN+pj8=;
 b=pOm6lyBODXKYVF7bAkNWxiu+yxWzwsrKmBC9nvycXv+m4x3/F9U9C5F97QT/Az/A/oOyr5RjY2W6Ph73VPiCNx3AlvT4oZeQmFISWwB4wSS1iIq3tJV9ax8FH0+Oy3trygXA6j8TcV8BPbFvi90BsHdHN5MgZTJdQLc8qxBbQVk=
Received: from DM6PR10CA0026.namprd10.prod.outlook.com (2603:10b6:5:60::39) by
 CH2PR19MB8915.namprd19.prod.outlook.com (2603:10b6:610:281::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 10:31:08 +0000
Received: from CY4PEPF0000E9D1.namprd03.prod.outlook.com
 (2603:10b6:5:60:cafe::4e) by DM6PR10CA0026.outlook.office365.com
 (2603:10b6:5:60::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.11 via Frontend Transport; Tue,
 12 May 2026 10:31:08 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000E9D1.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Tue, 12 May 2026 10:31:08 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id B04B2406568;
	Tue, 12 May 2026 10:31:02 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 82A20822550;
	Tue, 12 May 2026 10:31:02 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        niranjan.hy@ti.com, shenghao-ding@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v4 18/18] ASoC: tas2783: Use new SoundWire enumeration helper
Date: Tue, 12 May 2026 11:30:22 +0100
Message-ID: <20260512103022.1154645-19-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D1:EE_|CH2PR19MB8915:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 53d4556d-54f1-4409-1e1c-08deb0119480
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|7416014|376014|36860700016|82310400026|22082099003|18002099003|16102099003|56012099003|11063799003|3023799003;
X-Microsoft-Antispam-Message-Info:
	IAR6k+WWT7hp8EQvtims5j7Wy2yMktWkAC6tibO58JTe1eoxb/6poaUh2rKVWEGA4QFf/RApLcEqFtLoaSChc3wrEA7zkd3DpjZeiHrAQCvZNaMNeXZvfUEtOwSRHqgqiD0QBm58/n1FNEGlk/yQou0M6xAYqDj+99l5TMP/NVnOfyCRbIwhft4bJGs9vpE5fKeWrGSiIeQUAycyfccD6cHmWgBB+xHkUYbX2/GFl8KyjQSG9n0STCfrqjXB1pPm6u9E8eRJiDAZQBMq/rhJQw+zctojdlOSg1rUrw2hPLPi8qfQErhEWBj2CNa7hZEJu8y4cePJ0P+haU18GE62jAtBX99G147jdEi0GzLJlf+FXX0Z34MrJSJzKkpCu2yHsD+OjTH/Rltau7QYLTDoOeWb7tpk8rmcHS/QlFWWjxHX44QFDEZCu6L0wHw9sSydAIsIegCs1LElyKs27Fen25/G3UbWRZPnPJXPDlxopOLbAnqrcD2r8Ue3pG9TqVXdh5vfZOXwnCeesTDnJsw4hYItVA6ssJQYdaZ4sZ1mNsv8RmljUi0UDxBcvOcicWO0r/qWQ8E47OtOns1h8Rh89d2bjP5pPunZxoRBCFTbGTOJmfLrj7Gv4n1iRSEXiq2uHpPwobJTOe9rRf+PCRMpw41sG6nFKM3mcA5sUSNEt5dAYIJna8an6icXEq/Hoh8rIlhd+7sbWVMcrICf9K7Q2sxUkwm+s131AObsn8JJVhk=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(7416014)(376014)(36860700016)(82310400026)(22082099003)(18002099003)(16102099003)(56012099003)(11063799003)(3023799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	96LI3XmB37MNL7hEI2PTWYe6sSraLYowcPpDksi8+m9wkZEhnaWVrcDldW8XmLMJYbNkMU8Uq8/pobhQnp6vTjCgX23riw6GtlnaiXyQe4oZ/hLSGJaOEM11UVsg3pb8yKYbz6C4wys75uTxkQZKCw/ZVXsli5snT+ZuDhz7oZaNiVbcI59CR1wpfkPvY4l7GmMGvJuTrbvQFzsdclB7onXMmemy6FkhZrLtOEMd6hIE35MHRBV6LMOj6o4ajap/nPZjEIEzbV4NW3J55QAw+tAJDzWGCK897qg8W9MmmKZmBYQtIrR5QM9DIE1zKtXUpm9N5xxIjVDY9oTOhIK+Rslu8v9BXysQwU1i/9IkufaBR862nIuPjRF3GNCcoC2/y5upF2MiLwkIZfPU31C1B8l8CF3+Bhk9oxqryaCaHJYsieDZaKsZFCYGwjuQGfE0
X-Exchange-RoutingPolicyChecked:
	fNhepLgUX2MIcPnKHOL5NTu5P3OsGejO1vhXfs66LbkmRbls+x51qYf4NHdlKahE9X8BmFGKf4Lcc8znH1CNkVx7jPJgIE+GkWu4yI1Nr0mN79xWztrkB44KppQI+O4uyHlFIBAn7650gjE2ShFn56/p9MbUvxB/OkHzf6SEY9k6zb5dkmyPrUWZjNUkOvnrQPGryfrgJ6QIf2V3Y1bI6rRpC2L5PeR7rwrDsd72D7K+17tD+YrSCdjMfliOXHkfh47fBxqeUucaxW60BbuClV4oxpOa0+gV2BBkdxTV9PWJTQSnA37ehyGBQwF5K1JU6OFjpZ5JkXEUIEmq9T3avA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 10:31:08.2690
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53d4556d-54f1-4409-1e1c-08deb0119480
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000E9D1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR19MB8915
X-Proofpoint-GUID: LwpgFCs7_0UNgiSL17C6badGhYk0hi07
X-Proofpoint-ORIG-GUID: LwpgFCs7_0UNgiSL17C6badGhYk0hi07
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEwOCBTYWx0ZWRfX+O31seoeFrvS
 LV18cMkq53qia51l7S6kN8k7CwnwfJN2tdwikFbtA312IBItBX/M6FR+8+Rz6BBPSvpmgedfPm9
 +yz89aYR24nvKAOuJsI2Ko2QBPB7olDl1ZFSlrWAAKshUb4IorGmnB+pbrDwzajUVicW68tbJ/V
 XLHYYRfPvZzFn98Ycjulpj3JQWf5kyqnXhER0Oj1WuUQ0mfrMn7N/2XJ0gFNcn8QQMiHTr/sprm
 N7bLPgY74WIpznfYqhZpHSmqbMQFRXaF7Wyc1Y2b6IiOqdNRMGwTogGV5Wqa0Fs7pMxaoZaWfVi
 PUMOA6pfsQZqAYU+ViUKxQ/Yo7w88syNdQjAXZRQ4qoATrp/NuQZUk8LwSl1bT0CiWQaHsKWo+3
 6Z2DJCR/FFJFP44yZaEnJg3VvdMrY7X2BtMnnNOLjG3zUTmp1PmqkebrAvvKpEpb+FtqGT/MG9O
 X5kjFFIiemFXKVXkTHA==
X-Authority-Analysis: v=2.4 cv=KsJ9H2WN c=1 sm=1 tr=0 ts=6a030172 cx=c_pps
 a=B7IIg8ZWzcecfbiAWLR44Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
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

