Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3361C2E11A6;
	Tue, 10 Mar 2026 14:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773152322; cv=fail; b=b4FYAg/NtIOJMwNAdD4+Jp6ry+Xmr0rLA1NJ5lgzYAJu+T8vSX89ufSSbWX8IGbbUuKzBO7XmD2EOyFz8D7sWLwwjTA8kqrwMgxHsnFvq2AfGYxjKopdlMIjnBj6rDBEG+4w34zlOwtnMrubJStfBGSamD7rM0k9ky1jDZ7IbRA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773152322; c=relaxed/simple;
	bh=1SOk4yWKjrd1gqKR/S0/eW2Dk1wRAcwZDCsZ4PoE6ww=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O3+7AEbVT90nObwrFttxkPtfDAA6Ist7oX9RRrxhSDzs/Wuul+Z6A8XPAx7Vv0XO2sFwXLeG9pI54F3ujB6xuQJcyW/p5JPqjnPhAhEeRunk4oAe5jgF6s8wS2gBbfArOwViY8Z9yCEOZsqJw1NQQbwhQE0MdlcXfwdtl1W+ep8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=MfFb5vkh; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=vTgQyiKO; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="MfFb5vkh";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="vTgQyiKO"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629KwXJE2289610;
	Tue, 10 Mar 2026 09:18:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=tDT5S2JAONkN5qQa5aaZGdUfXkh9ODE7THwq9uQ5vKc=; b=
	MfFb5vkh0VqL7gBrbBBKMeEFxuT+Ly5EkP29AzohDFSpfWOBuDTQ/QqShh9pmEr+
	mhM2NCLWak4VxSsjyK9+iyCwXatPtJgOUzn4Fk940sYLxMaiYe7jvmDdcAOPst7h
	XBGQB6Fk64vBc/asfQhNdRRXJqzGMiNL4vTpT4bbvIS5c5hrr/NRpPCd/OiwrZaD
	e1JbrAH0G6ag/XMZiFrgiZyfVvxsRK5RwKjTshoOzsc6Fl7+iLfdUQiCZBaXjSzP
	9iLgVthQzmVaYzKlbifycijCVaXrLZuYQfIdyaPJ/tRmlchq/27h67ybolMMkeWs
	Hud1nYvBhhmK8SBgqHYoyA==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021082.outbound.protection.outlook.com [52.101.57.82])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4crja4bk2g-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 10 Mar 2026 09:18:28 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Svr57Hrg/vWfnpYjU6dpwP77fi/EzlcPNTuSNb13oTaSpFKOEGL+/xq38cHsa9wWaHM7R/SRCu5g2JqjWxa5s5/otwhs6ZLWtkyiayprx45udtixIbWXVfdRmgUkLz0+VOSTNs8DLGYcBkPlXITxvM1w9z1MqKTKgwpcAaWaLJSBPOwaSGYY+MspjfCHI1QgbKkuzOlZEb8yoh87c00utrGjL64qJIFF6ublMMAIOzdKRefp1o/kzCDRj+io7ikdwZXtH9m4yRbPTz51uFiqWedil8LUfnF8XLyyWHgXP9J8i47twd4hsXQIpCB7qvlZKLDHPTyrdXo/4PBWDwDj3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tDT5S2JAONkN5qQa5aaZGdUfXkh9ODE7THwq9uQ5vKc=;
 b=gGEZdVmJh+XKQwwUffI+P6sitx0JGp9W8GHif5gV/oYnqZQvtVMYk+Yo4VghtMV2GBztDpA8wqFUSYcjdFpE4znvOF6t28iW9P8MNOnPHT+US5MFpE72NYnzNH6dskzQ7x6e2E1Yi2lFyQpZu3tuDgSffRM/5qoY/CMyPO4JIlerWRL3aMTtJxDx+nd4MseOYbQ47OLi6+bX6aRxG0yl4KeKGUrK0RCWCdebos19NcNWwRJfbOKdz398EkFDvWyKVdiPvO1X1YfmDklNC9YKxqBrMndXCKzgeONfSa7a/6AT6EkOhmV/824H1fGkPqy+bWPNWEsIYFWOwTEzVp2BiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tDT5S2JAONkN5qQa5aaZGdUfXkh9ODE7THwq9uQ5vKc=;
 b=vTgQyiKON7OW3mY4JLw4Fm0ZcrxaISbVSSRBY3hPTYWxDsqqyFOvJDtaR2CHprf3hmXU0ifoiEfpniUqz1LxwOttYgyM35h0wn0dkRXNG7YtQIkrBEqCYjiAyhvn+hkL591MLh2AN1uQbVQlLFcyGJtTtmqwOUNM69Ik3rpJqvo=
Received: from MW4PR03CA0003.namprd03.prod.outlook.com (2603:10b6:303:8f::8)
 by DS0PR19MB7246.namprd19.prod.outlook.com (2603:10b6:8:13c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Tue, 10 Mar
 2026 14:18:22 +0000
Received: from CO1PEPF00012E81.namprd03.prod.outlook.com
 (2603:10b6:303:8f:cafe::43) by MW4PR03CA0003.outlook.office365.com
 (2603:10b6:303:8f::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Tue,
 10 Mar 2026 14:18:02 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CO1PEPF00012E81.mail.protection.outlook.com (10.167.249.56) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18
 via Frontend Transport; Tue, 10 Mar 2026 14:18:21 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C7C2D406579;
	Tue, 10 Mar 2026 14:18:17 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 9C327822546;
	Tue, 10 Mar 2026 14:18:17 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 08/10] ASoC: wm_adsp: Add KUnit test cases for '/' in firmware filenames
Date: Tue, 10 Mar 2026 14:18:15 +0000
Message-ID: <20260310141817.1871794-9-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260310141817.1871794-1-rf@opensource.cirrus.com>
References: <20260310141817.1871794-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E81:EE_|DS0PR19MB7246:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b6b54789-979c-4643-19fa-08de7eafe250
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|61400799027|36860700016|54012099003|18002099003|22082099003|56012099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	yZTufVlrYACvyy6fsXF/WqQYVUUZmP499PFqmr0+5B+Xb25cc5RYfMP2jWYstGJAsSL6TssFta2LaUPacjmR5aNHQWzKxZ5EO7J9QkfjUqeXHxJwb4xAsp53Y8n2VfWPsaQRKTiJVUxeehgrgS3aAYhekP5eHl0JkopZFSaGK0JZTvRJ68q2goABXw8Qg1Cur5SkGFcxbOuKymyU9hGC0uMTEh2vpDRIwgsWNFhW2Z46PQ1rRN0EEgX8q1IzrjxtS0nRsq+YOmQHMm5U1srPlm4Y5kd8B6qzwd7YvfuvDX+vMmveRy4cPDEAjOwsgvHU1xAymos2zRpcEukFIvpM+vQIfk2qzZijAitLR+HybErfrO0A5XiXmQ0QSPNZyqzkhC8ZqtCbpwgdKLbQ9BcQ5pnXK7oQJVnXOjjR7PgWay1d9vcWpTk7FDvuhbJGSo+WhXDDJwo6/uI7eBbpEK/mQ+dycAYk9c/HhiqE96BEQ0k4yL2HXOpb/0z8prAgpPmAUFFURDl1l1uJBBj1lVIiNkTYzD+I3I0PN0gtO3MMxNfqF1crY0t/9ItgOR6lTXYQ130xJEgaGcb7JB5voUHQ4s+tvKUryBJpHBfBVbCwkOm0H03mffaqb0h7fFLm7HEBdX4Px3ORKzPfvvFcStf22ip96qGh2FaP7/zs81oDF8qKVbIvYzUVN90pdplvHIiUvy8ogeCEHRfazsA82HiFn+X8C5rP6e32ceIUHs7P0/2eo29VD511u84LR448Lnkhc8NaLJt6gMIkJQlRuki3Sg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(61400799027)(36860700016)(54012099003)(18002099003)(22082099003)(56012099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZvdqksLAli9Jo5HsS6eeN91MErNkFLYmZodTsMPi++hzZR4UgEQUxFcNqKpUTvyFzl35HI/KRgEmiHCb+xzkPEZgKSnEHBbcPWdCdQSbc4OOZVWiwVRV0mGqAnYJrKui7Gj6pOQB52eZP8CaecMT8dxqGnpc5UqKmdKsNo2URfnNTT3bzb8Dqez8RxiZi7oB9Qrrh2r4jGKpWZUEnxUw/dGZchHKX+8TCVK3/g4PXQsN3YEv4dpX5eb9UP36WSpCo4vDdGRHzzxTaQl6owj0V6/Tzdf6uGkNPch/eOuSFcVy1KqhCmjQBbOFPCvqKj5L8BMhuV0K9V2um80WeRGS/n+Jm6b5XRDehx12bJi8xzQLvFZu62G577u1Slef+s3uqVJg04PEIaqS0UWe3uhsNEX6m6Q1jdoUU7xJ69tQcPds6T0Gaj/qM2fe+BluWfhM
X-Exchange-RoutingPolicyChecked:
	D2xjwKHJImch7LRpCAXauJCqgAbG53roT++O7kVfB/PHzRn56Tq6KZnORThhbwvYDB4LIYbt4marG3TxCO8ueKxx5a+9EOp9td1ox5B/t9WQSyDZTZvifJOiBJ+eisHIDcJjFNOpgFZvMlyqJp+ZVTHlMbM78YC7huNKYzDGW05EsVcFH1bViUEZJzqKZ5/og24rifi5tX0ZEti6WrMhWQ1YL0yzpBANdJ6NXXC8GpCBT43zp+TYrdTNMDkOZA0oC1/oK7MMTnT7uBKx2a5bGld2X9biZ3n99a3imMT/coacTnHd/QlGBWhPm2iMXRGogB+fK1uNJMJ+NJKv9SdaPw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 14:18:21.1251
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6b54789-979c-4643-19fa-08de7eafe250
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF00012E81.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR19MB7246
X-Proofpoint-ORIG-GUID: 5P30-auquksHS_xeeI8jSxeNfmJBoo_o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEyNCBTYWx0ZWRfXyxLAm/x04Kqn
 6nlnGew1eNS8mANXrB0jaGMmmhnH/tSW5GPkMfJ1O/81k24Md+v5h5xhAPPv/POtAbu0DC2csb1
 HHptV1Om9Uc95AfvHt6QLS8Zk6s1QZ/lN4nyZCj0tdmdDtvoe0HVhRj7eyjNOwq+QjQcK0N5hg+
 h+FAYKcGvgMMnI9Uy4BEz682BPXicxAF5zO/At1GsR99ZxFR0d2CSsPwJtC7AhsTvBtQJaFzAT9
 nH8Ye6O623zL1CUvw9h/Vw7fhWOO6Xu4NLCNJdvJ9yjSTqa0/wZD0eb9rLYHzFyGWJWEGiWcksu
 5r07DiaCWr+iIl/KTqs/+pu1ORUCxaGpGbg2ej3HC+nmZHL+VsJRRAxNkNJmc5HzvlsvJJDjBdp
 QCbmlxf5NISZUAufm4DhHRHm3TixoDyyD1z1HHJRDul4NoJv4lpK4jpihHZhsEuKBNgBkJhnrlm
 MVZxVj8ENMOwOKyfMfw==
X-Proofpoint-GUID: 5P30-auquksHS_xeeI8jSxeNfmJBoo_o
X-Authority-Analysis: v=2.4 cv=WNVyn3sR c=1 sm=1 tr=0 ts=69b02834 cx=c_pps
 a=ub9VQ7IHc6Y/4yCKmbqoEA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=DjHVjw-X5isnz-IzJVsA:9
X-Proofpoint-Spam-Reason: safe

Add test cases that '/' in the system name or ALSA prefix are converted
to '-' in the firmware filename.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/wm_adsp_fw_find_test.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/sound/soc/codecs/wm_adsp_fw_find_test.c b/sound/soc/codecs/wm_adsp_fw_find_test.c
index 556221d38a50..11047851fd80 100644
--- a/sound/soc/codecs/wm_adsp_fw_find_test.c
+++ b/sound/soc/codecs/wm_adsp_fw_find_test.c
@@ -949,6 +949,13 @@ static const struct wm_adsp_fw_find_test_params wm_adsp_fw_find_normalization_ca
 			"cirrus/cs1234-dsp1-mbc-vss-vendor-device.wmfw "
 			"cirrus/cs1234-dsp1-mbc-vss-vendor-device.bin",
 	},
+	{
+		.part = "cs1234", .dsp_name = "dsp1", .system_name = "Vendor/Device",
+		.expect_wmfw = "cirrus/cs1234-dsp1-mbc-vss-vendor-device.wmfw",
+		.expected_searches =
+			"cirrus/cs1234-dsp1-mbc-vss-vendor-device.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss-vendor-device.bin",
+	},
 	{
 		.part = "cs1234", .dsp_name = "dsp1", .system_name = "1234:56AB",
 		.expect_wmfw = "cirrus/cs1234-dsp1-mbc-vss-1234-56ab.wmfw",
@@ -997,6 +1004,14 @@ static const struct wm_adsp_fw_find_test_params wm_adsp_fw_find_normalization_ca
 			"cirrus/cs1234-dsp1-mbc-vss-abc-cs1234.1.wmfw "
 			"cirrus/cs1234-dsp1-mbc-vss-abc-cs1234.1.bin",
 	},
+	{
+		.part = "cs1234", .dsp_name = "dsp1", .system_name = "abc",
+		.alsa_name = "Spk/Jack",
+		.expect_wmfw = "cirrus/cs1234-dsp1-mbc-vss-abc-spk-jack.wmfw",
+		.expected_searches =
+			"cirrus/cs1234-dsp1-mbc-vss-abc-spk-jack.wmfw "
+			"cirrus/cs1234-dsp1-mbc-vss-abc-spk-jack.bin",
+	},
 };
 KUNIT_ARRAY_PARAM(wm_adsp_fw_find_normalization,
 		  wm_adsp_fw_find_normalization_cases,
-- 
2.47.3

