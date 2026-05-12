Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA1E395AE4;
	Tue, 12 May 2026 10:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778581896; cv=fail; b=AKqDwa27+mecO5XJ8WOD+sTKX+Zqj6VTu2AnwQJsBWgk5mvKePDypIOTjFwIwu/XUJzkhSuRerh1PB3eZmYO0dQAKHnFOYP1vQgfk/q0NbpLv9cYEdWj//Bs5iGjRLQWg+kCFBkeBIfhkkru0PFSmhTSn2ag0fNOurh90zO8d0A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778581896; c=relaxed/simple;
	bh=jabZE7pZCy7dN59+H09okXXT5vk8Whlg3hYyNu3RwiI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FV7gxtDR4O/6F264rPT6+kbBFHuA2o6NAbyAjiQtDkbudJYFDGegVtOq7sVdu5tGJHNwp/pS3ZoA3wr//IxohU5AHCucBcFx06ObPOgg6AxNCk+kAq0pXec1uc8rN2slEvpO5hSAMsgV8MtnBbbCfHKjdCVNsbkYJfbyJBOOVCQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=CbKaac3V; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=HPN4W684; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="CbKaac3V";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="HPN4W684"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C59jn1818502;
	Tue, 12 May 2026 05:31:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=WK2esk94TMTDOr1L5tpUDsvKcK/cvZWbUWAUuQXtvtw=; b=
	CbKaac3VXLbxA1nP4TyY/cw6ny8KuhCo8XKnRCw/m4SJnvW/oZ2uvUJXkiejVWsJ
	KXVrELEE2+hwu/deV/mDGaaYNqvxsqOojQ/EXUzSQ2FzVrLzi2mjCfwsTcfz8GId
	I5kXnU38THl+HuPPtvm2jw2yb9sqASiRo5EsaVC1DXHBW8vYA/YV3iG+aiiWtmc0
	tzTbyhzxPPjKBpo9M9MohEny1DVq7GRxbmccyDQhPp3Obg29+aVTkOUjW5BnHdlU
	PEKi3sPLo1rTzo16HvLyM6rvaSwLwi6Lsm0xLuUQQLaZU8dL0uSd8E8JYeynaHHV
	h17HjtB4tVJPtPBlHYeCOA==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11021121.outbound.protection.outlook.com [40.93.194.121])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4e3nvvgr39-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 12 May 2026 05:31:09 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HVqFXliYD6EjCnd04nxqzhXkW8IpxJyURE6bZa5yHthnDBJ3P5v+y6Bwp9qydhPCqcbm/TEfKX1lzfn7Ki/L87MTiFpLow6fIuNodXb4d5Az1IGVrLfxd1n204d6dRQINTurkkkuFwpl7Kzac9kTfCBWcl7A9teZv7Do9HsxomAzrviAU2/EBr9fFIkQ4RvspZwCDkG4cX0KsCrh7XsXAQTXbnGF6xAbrH/SCXibrHnyo7WvrRKbcuwyc9jyNxr+r4gqykzTXGJ1HZGbgFRMQdgPpNulWX11wUkZuyN4UzVoVHg4hc9NmLIIt55gT3fRRlwQLtlgDzllxV9F/6zcag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WK2esk94TMTDOr1L5tpUDsvKcK/cvZWbUWAUuQXtvtw=;
 b=FBloRQX4e8TbrHydwirMfArCMwLK9EcWz1edf53MJdSpsqzFg22TO+t1pk2C88gWyymIFQsigP+Wi8oHHekFydAK+faVvL3Q0s5SbCdIBjbSOIfNxlz5dX9HcxljCfhY86XRt9FE9fJGKR9e2O34O+8I9Oa7XVCp9Q7drk4d6h2+EEosMnReA68DO2r24pVM4SXVBQZQRT92IsABboOozCjnM7JFfG5WC9YchxflopyuagjqojPzl3NJ/4WQft090v+hmu41sYeILta3+T+ZxAy1SdyokPc6ZSJP3yX4dIFjurkbOHkDNXe5cacoHwHkYkRVfxc+HvvkXvVcg3oBRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WK2esk94TMTDOr1L5tpUDsvKcK/cvZWbUWAUuQXtvtw=;
 b=HPN4W684XVwg1pH/RchlmL090XkgJgCFOP4momvFyB+ujEqhjIzASgbMaW5zbMp+XXX5SXSnLI9tglHE3YJwZpfQUyWu0vlS+sA0fruK+3WQ0NDK9Nx/fUviZ5/FbyJzWltObvBD4G6LvKvcLDA+Nx2CV9nT5s7HmteCtQO6SQw=
Received: from PH8P222CA0030.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:2d7::11)
 by EA3PR19MB9351.namprd19.prod.outlook.com (2603:10b6:303:2b7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 10:31:05 +0000
Received: from CY4PEPF0000E9CF.namprd03.prod.outlook.com
 (2603:10b6:510:2d7:cafe::70) by PH8P222CA0030.outlook.office365.com
 (2603:10b6:510:2d7::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Tue,
 12 May 2026 10:31:04 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000E9CF.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Tue, 12 May 2026 10:31:03 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 71FBE406557;
	Tue, 12 May 2026 10:31:02 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 3FA1D82254E;
	Tue, 12 May 2026 10:31:02 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        niranjan.hy@ti.com, shenghao-ding@ti.com, kevin-lu@ti.com,
        baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v4 03/18] ASoC: cs42l42: Use new SoundWire enumeration helper
Date: Tue, 12 May 2026 11:30:07 +0100
Message-ID: <20260512103022.1154645-4-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CF:EE_|EA3PR19MB9351:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4dd7c8a5-818f-451d-4a50-08deb01191b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|61400799027|7416014|11063799003|56012099003|3023799003|22082099003|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	kZY5nTv7a7+9D+DQE4ZSGBwGD7JVAOPulzsEnJJKUIPv66gzsRJE8tIn6m5i1yFfALubeSdlw2RmGQCOwf1ct+Nujg7ULpjNVfP9LPgSh+kXiobYMDAp0cboINEdQNg9p85NspJioDXeOG7n8cPKfvWWEQFJyJvxkKtik6XJZ7KCikkRGVUd+spTYbqUgHzlE1SSE/nssQGWsCIjjf/z8zjjrB34QRgDZ/Kt8QNW7EkYYeMq2ilQHHx9/J2YeHG5Dq6TprnzbqPVspw0gZu8RDnANP9wngelR8dSijMUlyZsikJ8cfIe151SvJnyPoLqBD3t2P3vSul0baH+VxrEvKTG1I58if6pEvWNNA5f5FU4DxZ0ezZcx6k9Irb03jJROX3slwQiHLAovfp2yhJl1vOMFwqqYvfzymuUWkw/WY+91yKL3/JWm+DuibzBlTpSM5R3U10uirJfhlm1+iljUH82Pys7Gs2Yxb6D+4r888slwLVVLo0Pln3ahpZrkYGc8HrA1dtlii3HshBAdSc/uh/L0I6i+/k24Jueo+cwdphS+KHucTcitD9wQkrIBNoR+fBMLEmCSgk03sp+BRKI0P0wiDWBlUTpdVJ9NsRHGwwWBEvZn6SwS9jg84+PeT5UY2pWckLOWnNTsahrvsgehJVuVHtYv9LxLJAr/ohn7WQxSckA7JyqVq3lGQeHzEKUj7XSULGndix/fmN3kfabFqN/tHwtYItwMRmEqdEFtKA=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(61400799027)(7416014)(11063799003)(56012099003)(3023799003)(22082099003)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/ONmshkorh4K/kZTyijByEQJn1y9u3icKbUCL/mND6XVX9NbbHxT44lpq5OisB0khjRPZ7ZYXXeUttvtfZmw8IoGaD0cg8CsZciKd1QqJUcHGUvte2S+IuWGlIwRqoE/sdAPHy7KdoEYzv4WDtfW8LbrzIOvKOSgMD6SEHtmwKxwLssCs9ziwUx4XdI9nk49pDr1sSL0jkl58MnBSezFqrqOS1DDHSEAoLs469y3d/uiP8DL8cXmZ7noptfL2iCppmNzh1vxiMtVXGt9gOgNGlSD+TafMZOehEgoQ+utHIj2NO/9XrFhN+/OO26JBiUTbVYBo0q/+5rrHpqD06VBt3i0ykHy3slbLLa2tYQ8982Aj8cI6ivK2apI1td1AZyfwB5M7Lz9Mv6DRNOwxo2T0EmTCXB314Sj8HaMZD1t97zpqMAybQkZJlGMAmTMTSbi
X-Exchange-RoutingPolicyChecked:
	Z7++dmfI7GE3msGsN25lY+liUFG7DyDjABgkRseS3i6WLR53IHVLXEJuCJ7HnKvDeC0EF51+lYEPjWjwgiSxH68CRr68tCa2YgryF50LtEuZ/TRlujE6K51xH7VThx/fpHfUMc6w/uVFQCLY9Ky+XTVhSKglRIFARCSUZAuXd681ek5KTJheswtUawhw9DqXZ1eO5TM3QMZ1kt3dc05/8p04yDgHYAKBfkOXMcGzeN75WLoeORgBIACF3EiOxc8sTShs/1brwTp8P8Exvo6ZfuqTUFih+Zavh1+2Hl5T/PIiEHjq7kvANyzWRujH97cRF6BSM8YTXpIFR+UhG6qpXQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 10:31:03.6118
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dd7c8a5-818f-451d-4a50-08deb01191b9
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000E9CF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EA3PR19MB9351
X-Proofpoint-ORIG-GUID: oeEAnH841iDcIe5jh-voQ0Z60YSfmmNM
X-Authority-Analysis: v=2.4 cv=CdY4Irrl c=1 sm=1 tr=0 ts=6a03016d cx=c_pps
 a=GRNSBXvNJw0HWouCR8jgEQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=_kLIPOSdNJ7StitxxVsA:9
X-Proofpoint-GUID: oeEAnH841iDcIe5jh-voQ0Z60YSfmmNM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEwOCBTYWx0ZWRfX7vE3ebkFY5Qc
 TfViIXBPMlLfGo06v5vc12TbtHFK8L+T9VZs5ZKIt5Ic4sFyH5JrnPaJ/rz7dLX7lvHBa3oYxII
 6ED6J/+E/3+EsTmsawI4aJn8DFqRa9kWHJXv2CqM48gBldmMLL/S0ESAsMYDDI7/swXOD7EfPT6
 Hvv597pI2ZFU+afWuay/CU2mYsHCCUVX7KR1LCboZvy4o4iQy80xBvkSIpVatZTnCekfLAbmLt6
 Q72p5pyfLrZ2Vv2dWwl05fmtK16MIxJvgpECKDD67wuryejdKS8Ea4Aogc4GSTUWKUpyORuQ8Bl
 5OifKE12kuNOsw7nABQ6qkl164/uwKv2DZx5zdwUp8YrBfQx8itDbrzoQ4sp5m/bYs/2gFCjZB/
 vdrqGnbGZ+2dfAWg+oaLXbb2o50L5EyKWXK4EBG52v6v5UVYv6UCa7FokuDZw2Oc5pYDzWKZOxI
 cpq6D+r2MpzyqOTQUUA==
X-Proofpoint-Spam-Reason: safe

Update the driver to use the new core helper that waits for the device
to enumerate on SoundWire and be initialised by the SoundWire core.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v3.

 sound/soc/codecs/cs42l42-sdw.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/cs42l42-sdw.c b/sound/soc/codecs/cs42l42-sdw.c
index d5999ad9ff9b4..b8256ce0b8fbe 100644
--- a/sound/soc/codecs/cs42l42-sdw.c
+++ b/sound/soc/codecs/cs42l42-sdw.c
@@ -433,19 +433,16 @@ static const struct reg_sequence cs42l42_soft_reboot_seq[] = {
 static int cs42l42_sdw_handle_unattach(struct cs42l42_private *cs42l42)
 {
 	struct sdw_slave *peripheral = cs42l42->sdw_peripheral;
+	int ret;
 
 	if (!peripheral->unattach_request)
 		return 0;
 
 	/* Cannot access registers until master re-attaches. */
 	dev_dbg(&peripheral->dev, "Wait for initialization_complete\n");
-	if (!wait_for_completion_timeout(&peripheral->initialization_complete,
-					 msecs_to_jiffies(5000))) {
-		dev_err(&peripheral->dev, "initialization_complete timed out\n");
-		return -ETIMEDOUT;
-	}
-
-	peripheral->unattach_request = 0;
+	ret = sdw_slave_wait_for_init(peripheral, 5000);
+	if (ret)
+		return ret;
 
 	/*
 	 * After a bus reset there must be a reconfiguration reset to
-- 
2.47.3

