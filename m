Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66AE4379EEC;
	Tue, 23 Jun 2026 10:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782209933; cv=fail; b=K6fCNzDKKimxtwmZClr8mKtHoU3TbK9lghZc2inOQQBGeBcN3NZJXMzD/vtPmvd1/42+0o219sxnMYRyy42vzLEHTKBd7eBON6Mho0Q5gi3deBOhR6IFM9nKJIgRwBoO6xmmXdlKSdzRSs36bFtmt2vxGnPYbzHP3JTchBFZt7E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782209933; c=relaxed/simple;
	bh=U8HREjDTbjgI7H+5+pOgFqTc/b+j8tnwY2TJvZWA5w8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o+VZ8U7ql69Z/Ao2/xwHZSUh8+MbyiZ4rtJjZyKSAXJK96z8bDlRDLyRpPC4jRnBIAfWNBtD7Rz1aN0Kn004mhM2RvFiFNmYBZY5TbqVS9IO30T2Ju8pN5UGPGg86EgkIyC0Vl06r+rFdDvyY8IhFl1LCAdaZRc+SxyXcj36TP4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ZrwI3gHd; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=KZATtMIu; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="ZrwI3gHd";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="KZATtMIu"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N2qWxV3337655;
	Tue, 23 Jun 2026 05:18:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=GvJF28bCH+ceWV8oQ9ioBpOfmBrehvDtH/CmF+tMz6E=; b=
	ZrwI3gHda/3djOUqmReKRkYsa1bDJiBfV1CM8I1ICEiQ1RIbSG3hRl8Bx2WGRDsZ
	mQUA/oieNF1FcfKB+PTjIB5FOGmAE87gyR6uHlLfaGLyzPNgKgKMCUHrvRIi4+6O
	jIyk1gtEZ5oyr8IIGQbHyE3S7JvOdM7Etre/FLZIcHKdovukSSdo2ZAl3NSfXypj
	3SHVIkzhMdGLzgCf2lJcEIEWh9SWPy8ha9S/WYf43GTViumNY8xcZhOGeOARiOkB
	OUgcO7H7qD0ZmxsW3ZM3dEf9ypW6l4TZ5ULd046FuLd7+DvrPRpAbvadVzmUBMS8
	+kvEIpKs2c4SM6Jby5FO+g==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020097.outbound.protection.outlook.com [52.101.85.97])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4ewr8x35c7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 23 Jun 2026 05:18:26 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=twImtIldh4BrDfAPsKAaXz27oqghUZr74aq3lk9uiBlKAWoVv4VJhxeAqM+AyxxrvKmKGJ+eU7XDvQJfNNm/Qoeo3FOOJsvX59CByNvLY2ShlYEKxLhAtMO3KFtd7IHRqZf7nJYS5xSjePFK6NwcgxwV86YGfKqNdFQacR7wiyZl/aLZ7yQWGDa5tjBPsqtkNiWQZdmcsAXvhrIRIfb7qcC/DIX931R3pV4WhJR07joDf9JSZqn5XZllpVk12Anahg0rtkCvy0n2SvPwrBiulhgOPp8d/EPfUdpxAlmdUvJnLV+TsWckGW4d0Tl1+jsnodQRHcc8fxEn03lKWqVlpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GvJF28bCH+ceWV8oQ9ioBpOfmBrehvDtH/CmF+tMz6E=;
 b=N3znXS/dVKxr65CH+0QWK9SRe+zhFBl3XbLQ83wGBT6IiAgPPaNyMuN6bFlfPtSjYgIk8O+m1i14wyS/FD4ya4dVknmO8P56o7eukT47zHGsEN012NAel3UpaYjgvcGv0SdzV8Y+U2XDsktPJohEQX6lEfUsm+WmHdTBZG7CISbtaj3aUvUhELSIUXEfefHYjAtqO01jHYyfLbpzpGgDcq4lvs+J72vuoQV9m/qwvQ3XvPqyJvIsGdUUgsvArJy2zDj6wR+zecyVFJwKFU9flO+gVmWGAzOMVMjWtvOaT8MAM0qUm4B45VL0UZWEQmn18qWglEPwDap9zDjD+KJqzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=arndb.de
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GvJF28bCH+ceWV8oQ9ioBpOfmBrehvDtH/CmF+tMz6E=;
 b=KZATtMIuzWHid12E1yesv3nj3GUe21oB/ePyVR4WetrgOSBTpoKrXXFjLSYIaLWOR9CNBhs2TdYa1kjf0tqZ9Hoaj3VOca1jTWoIxXExi4YRi7hS+jWiyaDd4QYb+YYlt6jtn3iV6pfRydUSxpq7QABoAO0UYL+WXpt24r8iNTA=
Received: from CH0PR04CA0075.namprd04.prod.outlook.com (2603:10b6:610:74::20)
 by IA1PR19MB6132.namprd19.prod.outlook.com (2603:10b6:208:3d4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Tue, 23 Jun
 2026 10:18:22 +0000
Received: from CH2PEPF00000146.namprd02.prod.outlook.com
 (2603:10b6:610:74:cafe::6e) by CH0PR04CA0075.outlook.office365.com
 (2603:10b6:610:74::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.14 via Frontend Transport; Tue,
 23 Jun 2026 10:18:22 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH2PEPF00000146.mail.protection.outlook.com (10.167.244.103) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.10
 via Frontend Transport; Tue, 23 Jun 2026 10:18:21 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 5732A406554;
	Tue, 23 Jun 2026 10:18:19 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 306FF822545;
	Tue, 23 Jun 2026 10:18:19 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: vkoul@kernel.org, arnd@arndb.de, lgirdwood@gmail.com,
        pierre-louis.bossart@linux.dev, yung-chuan.liao@linux.intel.com,
        peter.ujfalusi@linux.intel.com, oder_chiou@realtek.com,
        jack.yu@realtek.com, shumingf@realtek.com, niranjan.hy@ti.com,
        shenghao-ding@ti.com, kevin-lu@ti.com, baojun.xu@ti.com, sen@ti.com,
        zhangyi@everest-semi.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v2 4/5] ASoC: ti: Add back local call to sdw_show_ping_status()
Date: Tue, 23 Jun 2026 11:18:13 +0100
Message-ID: <20260623101814.24044-5-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260623101814.24044-1-ckeepax@opensource.cirrus.com>
References: <20260623101814.24044-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000146:EE_|IA1PR19MB6132:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a053f66b-f531-4b5c-c297-08ded110c0e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|61400799027|36860700016|7416014|376014|11063799006|56012099006|22082099003|16102099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	bQ/Pb6z0N3HkZD3gj1l8EBH0PqDN4OysR/jYKfOtiSzUWmrf30R3wcd5ajEh6TqVp2HWawNvLQ1IQaIBu517dwSsolWhmt4zFuwUOCGq9lw9cMTWVAsjMCQO89tgYvrb5/gvYgQMHpypMkWlwSOeKVdHaHw0cuK/HRCF3/1LyvTWFu8nS3RI6lNhUnVbvXw0+ru71/YVzjPobEqyGz+vg7UbfDcXm8ldGvpzrNjYJ2tMYsKrR25oQ0sTD1TAPhiFRoIFSKbF0pRjGe/kK+BSNnyetB97u6B78+IPZfcNs/Hb7TQBZZfkejXdox4TUiYCR/qdbA9ifN6zCIMwmv5CmP8HrxlEAo56GMXXxFmlOobaSpYrSH4enzZI5miezbEwRJKnZFhdGule3x71M1Yc4gLdw5A7VUNelokvutt+nv7BLmmAeBNVhByd126zlre3sK7bZQZEDP7sthZwkEMRib4jm6frY9ABP5n/ye/itPhETjILDIqzZPfbgj+MBOYQcxiz/SAyyMSYVJw2nTzHJlNSsw2uK9UupXSl0R3uBjJp3Nyj7bbIVw5xI+mev/RASyzuxt0kqDTINPMkwp88jMRV6RSQEtw0nKkuifmYipP3oC0TrouH0VD1WYxo+m0Ar35c4X+XkCz1sL49oPSMwN3lD+kEQN7L+JYSmDHIHGOWzPKc8/O1umjihgapAG+1YYewFRV3HO74c2ADubQtbA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(61400799027)(36860700016)(7416014)(376014)(11063799006)(56012099006)(22082099003)(16102099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	c/ZPYlWrUPlUwCe62TLf0bmxw46SEAqkP1LnSd2iSDvBgvig7xPqitOuZLY+69JOf9hh6jHRMw+MyXQMxGdRpEScnuhPyymr7gkz0CpeSa0T1lNoobHCVNrnGlDb3Uy0YBqWseIbCRwEE7y4Emk5ci0Md4r5j6jNGm70UYP69i7VIthRSyxDg0hbx/XpNAep432hKc9EAIT8D2bQbk+eJqqjBRUcGddfXBpiGPB1SFd6CH3X88rnYgz/yymDf++UM/sI+63dxUilvE6ppzjy3obV2l9Axb6Wsk9bsLGmIR0My1w90CxiigcNFaYyjjjCD65BcT/8+2zBy+elWTl3KA0qVP3BOZk5g7lCZEVrGzls0C4eDiHLC6dOMhRa7jT1yjS9n3B7rQzpGCy97uO0KCb5CNKcoPtblWSnk0KfJwkAfVTxktJnFNSaFDIu4De3
X-Exchange-RoutingPolicyChecked:
	rU7Tx4YZGpBuFPvhKRNYu8XqUXuziWSCB85T2JuffZJnyNahVyqjjJw/gNzo3ra5vsbNrpB3KXKcegZ6+64KotvLiIN1OWacyNanLHDH7/VhlwFsqqvp2uXli42ofbQURM65o8JermG31+mcAZuWqBDuP1+HQUnvZnietdNfR3S8myGGMd7Wse5w4XewUYzAe9SOn2l0vOt7vC+y3tMvfGMHjlUmpPbum6nM9Jtycz4U6k4reKdQ7AWezxXCFH44arNaM3JU0BkuR5GzWiM3E65SonQ4+e8Q18RUX41dyFC6z+UIUONaPCDokvHbhHXhAKHpJaeSURfQ440B9pi21A==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 10:18:21.7057
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a053f66b-f531-4b5c-c297-08ded110c0e9
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH2PEPF00000146.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR19MB6132
X-Authority-Analysis: v=2.4 cv=UJ3t2ify c=1 sm=1 tr=0 ts=6a3a5d72 cx=c_pps
 a=WbwzdlnB7+o+U6PX47Rpew==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=TbzWVHjKyxCIu6qPmWMA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA4MyBTYWx0ZWRfX74UTb0hmQncP
 1mdAgwbjjtrMy5ui+itr1q3RN5x4lZir9/ur916LjTYC5ptTTrQI0IRDAJS3O6LNqUz1FbSU1Bc
 cfnjQ33YwhU0yj4xwSv2QiQMtcUDlTqZgvovgi12dStphAiDDW1uFPCDnCoaqee7WYHMVROht6e
 0Im3kOIqKaHvWtTEeshfZrGNC2TtOrvdXEeHOb1oRFo+RH9VyqChwfeYohUhMVjh0nE+n3Ly5Dg
 KwSa/Bjd4vnUGLXNu6rHU16fGFMS+woiCIkqUqQfOcQYYIzMqEDInCs8t2mStnTvSF2++T+VrIB
 fAQi0kz8JF/aN67NhA34J2uzyA7/WpxZ9KsBk2QkgzON1fsm74OVDkyUuYTXY7l28UMk3cW7bKJ
 YFOmrxus7ZWgwYLJEEIsuLlcHA0kSLZjeSzQidLRLOsddeEy/qZyXCdH8qvodBzQOkblsXGxgdc
 IP9zeyz6YnarbQbu3+Q==
X-Proofpoint-ORIG-GUID: cC_mX8nSmgapfakox3unpRnxoFO1l4Fk
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA4MyBTYWx0ZWRfXxxK+N/z4SfWD
 EwehFP/JYC5veBN44Xjk6rsQFMMKtQRgHKtnqCBOfgALY3FlhiDsS354czYlnnQGmuKnFqgtWAv
 qpVtMr58nXaWpKteOgjN0KMtRJVDcOo=
X-Proofpoint-GUID: cC_mX8nSmgapfakox3unpRnxoFO1l4Fk
X-Proofpoint-Spam-Reason: safe

As the core no longer calls this debug helper add it back to the drivers
that originally called it.

Acked-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v1.

 sound/soc/codecs/tac5xx2-sdw.c | 4 +++-
 sound/soc/codecs/tas2783-sdw.c | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/tac5xx2-sdw.c b/sound/soc/codecs/tac5xx2-sdw.c
index bb12cfb6da12b..ace06f5ab58c1 100644
--- a/sound/soc/codecs/tac5xx2-sdw.c
+++ b/sound/soc/codecs/tac5xx2-sdw.c
@@ -1445,8 +1445,10 @@ static s32 tac5xx2_sdca_dev_resume(struct device *dev)
 	}
 
 	ret = sdw_slave_wait_for_init(slave, TAC5XX2_PROBE_TIMEOUT_MS);
-	if (ret)
+	if (ret) {
+		sdw_show_ping_status(slave->bus, true);
 		return ret;
+	}
 
 	regcache_cache_only(tac_dev->regmap, false);
 	regcache_mark_dirty(tac_dev->regmap);
diff --git a/sound/soc/codecs/tas2783-sdw.c b/sound/soc/codecs/tas2783-sdw.c
index 7d70e7e3f24f4..1127ea59b5e4c 100644
--- a/sound/soc/codecs/tas2783-sdw.c
+++ b/sound/soc/codecs/tas2783-sdw.c
@@ -1083,8 +1083,10 @@ static s32 tas2783_sdca_dev_resume(struct device *dev)
 	int ret;
 
 	ret = sdw_slave_wait_for_init(slave, TAS2783_PROBE_TIMEOUT);
-	if (ret)
+	if (ret) {
+		sdw_show_ping_status(slave->bus, true);
 		return ret;
+	}
 
 	regcache_cache_only(tas_dev->regmap, false);
 	regcache_sync(tas_dev->regmap);
-- 
2.47.3

