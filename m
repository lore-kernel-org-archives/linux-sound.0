Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BBE13AF65C;
	Tue, 28 Apr 2026 13:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777381541; cv=fail; b=rNfORX8ZsbZO0bDoEw6GGTLjSi5gBWR9lJnWqGb6Nmk65u0KuwdFZMFEU7sTY75h8JsI87GxpLQHAoPN6u3/zgE8uj48HIwpfJXyMEARlaVGBp1RMjQGglo03jEcPgddiKQ+4Q525AqjcPIpeLYAgkFEClXxDV9RrvZh7hH1joo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777381541; c=relaxed/simple;
	bh=iY5c0mjuEsWZNCQCPkL0LXfiv2QpvQybCKAgVKCOHyw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=anNBT9aNubP8kLnHCDs4L5W6IwTWCK7PZ1H7kYlDwtU4H8E6A8fUet4a/D5w0gpOAtjHzh1RwCAkD3+Eg3HAhVGo0NN2V1KuLR+YOEC16rWTUamSk1A/cLUUghFtWv0xlhqMV5CD+NiStRQ4T39uvEyMnfxGNKINIeUPhJ4VLds=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=LW2Y6IjQ; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Rgy7XYEe; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="LW2Y6IjQ";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Rgy7XYEe"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S80tqG2328624;
	Tue, 28 Apr 2026 08:05:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=zYyzfjR4EXYrGfMD
	WQduDf4o35hgwLbbFwa/pTZlx/w=; b=LW2Y6IjQo6nc5GnoWZ/Hltn5KoT+QRCC
	faFCc2cL+4YTbivqhdqkP0x2o1zDAfTSDXpUJX6DMpzDWEx9hH1kC4Sqf1+YZnub
	Hq+U/YDQj0k1cydv9CVt+AOkjSLlijjnm8V2wFIY0CgRa6d+0WZ4kodFZfTxHfcu
	Am1ItACLsym5dsq5xR6ynAgN9GB0s+vHqacllqV2SkOkM8hBi7KE/Vf16oa6CSSx
	BNCpBAZnf4BUSSyk5kcT901/84wcUyq6S+BjW3BMCj/QPDLJUDyxdEqGa79eHcGv
	ehyGbCuWPgYwkKe5MNsxqewd6zARAZuf6orPWGcSB/NWcqyviLMETw==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022076.outbound.protection.outlook.com [52.101.43.76])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4dru10bnj1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 28 Apr 2026 08:05:37 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LWJ0ID4JPDO6wJuF2u0mClkJAI5RWakOdiVKYe5iprRvIq5/BUS0AIbjsJz7gXkM4MTFmvsZ9/fMOot7FAk+JnTTHxsQvFmS+wQfls0LaBMPXYKa/xaRjSrL8crRVPqYQMizgqAR5jgroVT8LrRIieyfpQQ7+TVfjdUp6kmiwTX9c1doyTfgi2B0t44rzOPTrNXRFq8z5o/vJDSqXf0qIvPtwGxAWP1Do/EwE4yvCeepOFnq0HGKyZ8lqy1RQmuyWkXXV0K2oWDOaDGfnwDrfT9QWj4kaI3wB6r6VJBkEpz70MPvMzRmoY2Qn41BRuZdyv7Pi5lK/uyyX3joYCPU8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zYyzfjR4EXYrGfMDWQduDf4o35hgwLbbFwa/pTZlx/w=;
 b=yepjlDSFHMNRuxKEQgqTDIjXOTvKBAEh134sAmey8gu1b3NIVojowzBNd5WjHEz2Qs5UKNZWN2aZrIxkCk5HmTUAmZfZyxOb8fOE0Z6V3BhxRUr0XdEuHFrEQHBkGa9GhSXW7pKlx79SgM43u+oVW8PSCoCDEsBlZdSFz5j5wlDblY5tJSRYSAUwL3bfLDKCMFNzWa0T1kxDYoOkDVlaGUbo6y/9b1aMR9NaHkFUGs2BtUPdvmcPfsN5BSrm9DGsKNGA0SsGiO4fPOuETZD82QMkNk6h99cUfq+8Vzh338Z6+8d1btkDkQUtmJsJGh0HoPNB4UtOeJI50Ad3ZNgdVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zYyzfjR4EXYrGfMDWQduDf4o35hgwLbbFwa/pTZlx/w=;
 b=Rgy7XYEeehJGBz+oAVXsD28CxW6l05GN5V/G16F9eT/klVWPJw8xTvG834Busaoq8FU04wD1oRlwpgmZPHG4Wo/5PSK0nG2pPqHvqFNFhq4hPPEDCDa/UCPnmFRlWViRvSnKvWQzGW3I/WlTXSLor6Xjvizq6RWaBz4ebOLoUz0=
Received: from SJ0PR13CA0124.namprd13.prod.outlook.com (2603:10b6:a03:2c6::9)
 by LV0PR19MB9478.namprd19.prod.outlook.com (2603:10b6:408:320::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 13:05:33 +0000
Received: from SJ5PEPF000001F1.namprd05.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::25) by SJ0PR13CA0124.outlook.office365.com
 (2603:10b6:a03:2c6::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Tue,
 28 Apr 2026 13:05:33 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001F1.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.18
 via Frontend Transport; Tue, 28 Apr 2026 13:05:33 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id B8CDE40654A;
	Tue, 28 Apr 2026 13:05:31 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 932E9820247;
	Tue, 28 Apr 2026 13:05:31 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: tiwai@suse.com
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ALSA: hda: cs35l56: Fix uninitialized value in cs35l56_hda_read_acpi()
Date: Tue, 28 Apr 2026 14:05:31 +0100
Message-ID: <20260428130531.169600-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F1:EE_|LV0PR19MB9478:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 88e15d17-2703-402d-5dbe-08dea526d4fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|61400799027|82310400026|18002099003|56012099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	YXaAJqLgO13qz6k+DJTva1fZ+BTttHK58NT/YGkJZbhR5+7hbIWXWBy7S3vBydRlswJ0LAonmW3JMhUmwbgFZmcx1TiX3EWEagMbdGOqnnZ5gCdWC3PmGwXWpcLUX7AJDDJqSf5bj1OFOhSxGNB7fkNX8iBSboGMoGC3a1mvuRe4ipD4etvpib1SiQxan+OblKHiGTY9rdVTATKURmGcgI0roHZFqjcBTXT94p0XHc3HtB3TflARjNR10s9N1jJxDxuhfQQ22tS5n4eigR6Qf+Py8GMRo6BJd+eSoCRl7wnIyCxTSeiq8RErPHCI9EjvJpfI4ubY3s/m5cmWzCkFlSHWPVIe8SSU3+C6QYNIbmbkoBoXFovTkEC2XdBcDrCnBpcsv/KI4L+p0R7jWUzawacCYcZ82gdHtpwzJfMUhSbxGggXdanIrWMdJFZcEqRI/Lie0RFKytwpoUftCIo/e7vgGmvUOUPz9gCSUcRxoRv0c1NyzZa3oNnaBENCn1S1jxfhCJ7u3H2fVXWkpgWQVTPAaNNBy11W3xjQ+PH7NZITcg6eBbQedP7rID4gVX9JSRtQ+aG/jjZIME8p+yfTYvMOHledlz4P5XtftgDxCXxBq5tcGsT9YLNXP0wg0AHvXSN/VrJQ+Ndj2fpJnZIZOT/8RJk5TG0ivq7T2uSUuKeJN0p0t7cwxUweWyVzg3NQO2Hc4EwUzVEI1Mr3CZcs0Jf7hqhmobpfN2s8F8aspXRf/hFbiyFHV8UASKaCIQErPHGt8ITfubrLlLgkwWT2xQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(61400799027)(82310400026)(18002099003)(56012099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PLsSHfHOjhz1Pvk4gPINobpHw1KcsR2Ig7Lyyrq4E2Y+f9VUL0mUoP/89UsRxr93IThz49avnrj1tFwPsEOmG5Byv5Q6mqa9SPpqzEHHOINYOLqIILYB5NWeHziknk7UiujJsQ9quoapmKRSG7A7AANUfVNTifi8N50Vx40C/h+tk6DcnEpXtI2RWk6OFVGN/RGIcEuuqz/gAOZLuwP3UwU8E57eifT12GmK9jgS8ZftBJjyL7OoX6WGOCry/EERvp304CTqISFRyw5PedZFCCxbqF/oyP+Zx0u4nUTHpmx4HZ3giO4Nb9yTZUsmL49e88Sgu/WcF+hSN5xmrST00AlJMKAsnAy37QU7STxlmplAP6zCbL9SgDRtkILMCW0BNK48gaaq8ht2m4jjmj6DmerFzz05tiYpSNU8DTDDT/AeZXYb70O0uxQqKDwEPMH/
X-Exchange-RoutingPolicyChecked:
	os+HgE4WeRaMf6z92XXaV/4JWwdenvF6rUPOGOl7QAYt0YPctUwiPV5VrbupUKRI9fljAWwLpoIajwP0FJBCXir0fxwwc/s6wzwHx9kgfiR+IRLe8IbZ6gz1cs1Md3fRxHDJN2IEy9h/4GbPkPEOcyKFIseSecCIIq7g3Wms4D3rK0FNso/SyJhfak9NpG3kUDxedFx4p5/eR+X0jdONycgJJI6hB2iJmYU0G2eVaxpHjmwFxvjgg7TjWuf9SboFiivc8NkdnfoLqCTagiSlSTjFtaYcxgJXtbkrgyjgYayCMwKc8Nh0sA7U2QVwFYzVspYncm8d4I6ivZ6UTQKoSQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 13:05:33.0680
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88e15d17-2703-402d-5dbe-08dea526d4fe
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF000001F1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR19MB9478
X-Proofpoint-ORIG-GUID: lnJd6V4RSwhUHfXfBgvulGuIb7B3DXXA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDExOSBTYWx0ZWRfX3H8+lx4wWqEl
 R4NbqP/nwg/npYC4xSgw+e6lyZQBXOGHLXH5MCwjkPxlPOfs2bN9462fvtBbZoIaYDMYtRKsGXf
 0CvAI5UknuauypZ5qpT5FXiIQhxZI8Tkn8xBKlcYXybJOds6CHGzj19qmvrTXhHpuRXFR4OwHWT
 DGj4WFM+3Va7FABYToSx/JjSHoaRyZVad9Kr1itbm5soRHyALPjXEY2uA2w6SEjIAFQ4Or/m0WY
 wXEc9PKo+fzO6lSlqO5mXh93/5CQVkv60f2WMUbv0ygRdiYry8mALDXhHtMRLhRwhWsyuM2VFDY
 AH1x/gDS6dOzSS/qmU7SeADesoLRnvtFfWzN6bs7/XjvmbhIungBrzrnst+y4ZoqQ5gRJFuDeQV
 wGrn5GZh5lO89/cH0ruQ7U0/8YvO1AsvanRdGfhFeD/d7HPMdbTHDLPJFCgPAMroeR9QvxH/hje
 XDSw5/WmAj16m+cyOWQ==
X-Authority-Analysis: v=2.4 cv=EuTiaycA c=1 sm=1 tr=0 ts=69f0b0a1 cx=c_pps
 a=mq2BEWkvHIB0EETDGoKRBA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=A5OVakUREuEA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=w1d2syhTAAAA:8 a=8ZKIOFAgHe5IqjuhYc0A:9
X-Proofpoint-GUID: lnJd6V4RSwhUHfXfBgvulGuIb7B3DXXA
X-Proofpoint-Spam-Reason: safe

Eliminate the uninitialized 'nval' in cs35l56_hda_read_acpi() if a
system-specific quirk overrides processing of the dev-index property.
The value is now stored in a new 'num_amps' member of struct cs35l56_hda
so that the quirk handler can set the value.

The quirk for the Lenovo Yoga Book 9i GenX  replaces the values from the
dev-index property with hardcoded indexes. So cs35l56_hda_read_acpi() would
then skip reading the property. But this left the 'nval' local variable
uninitialized when it is later passed to cirrus_scodec_get_speaker_id().

Fixes: 40b1c2f9b299 ("ALSA: hda/cs35l56: Workaround bad dev-index on Lenovo Yoga Book 9i GenX")
Reported-by: Dan Carpenter <error27@gmail.com>
Closes: https://lore.kernel.org/linux-sound/aenFesLAStjrVNy8@stanley.mountain/T/#u
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/hda/codecs/side-codecs/cs35l56_hda.c | 12 +++++++-----
 sound/hda/codecs/side-codecs/cs35l56_hda.h |  1 +
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/sound/hda/codecs/side-codecs/cs35l56_hda.c b/sound/hda/codecs/side-codecs/cs35l56_hda.c
index dc25960a4f23..4c8d01799931 100644
--- a/sound/hda/codecs/side-codecs/cs35l56_hda.c
+++ b/sound/hda/codecs/side-codecs/cs35l56_hda.c
@@ -976,6 +976,7 @@ static int cs35l56_hda_system_resume(struct device *dev)
 static int cs35l56_hda_fixup_yoga9(struct cs35l56_hda *cs35l56, int *bus_addr)
 {
 	/* The cirrus,dev-index property has the wrong values */
+	cs35l56->num_amps = 2;
 	switch (*bus_addr) {
 	case 0x30:
 		cs35l56->index = 1;
@@ -1025,7 +1026,6 @@ static int cs35l56_hda_read_acpi(struct cs35l56_hda *cs35l56, int hid, int id)
 	char hid_string[8];
 	struct acpi_device *adev;
 	const char *property, *sub;
-	size_t nval;
 	int i, ret;
 
 	/*
@@ -1061,13 +1061,14 @@ static int cs35l56_hda_read_acpi(struct cs35l56_hda *cs35l56, int hid, int id)
 			ret = -EINVAL;
 			goto err;
 		}
-		nval = ret;
+		cs35l56->num_amps = ret;
 
-		ret = device_property_read_u32_array(cs35l56->base.dev, property, values, nval);
+		ret = device_property_read_u32_array(cs35l56->base.dev, property, values,
+						     cs35l56->num_amps);
 		if (ret)
 			goto err;
 
-		for (i = 0; i < nval; i++) {
+		for (i = 0; i < cs35l56->num_amps; i++) {
 			if (values[i] == id) {
 				cs35l56->index = i;
 				break;
@@ -1090,7 +1091,8 @@ static int cs35l56_hda_read_acpi(struct cs35l56_hda *cs35l56, int hid, int id)
 			 "Read ACPI _SUB failed(%ld): fallback to generic firmware\n",
 			 PTR_ERR(sub));
 	} else {
-		ret = cirrus_scodec_get_speaker_id(cs35l56->base.dev, cs35l56->index, nval, -1);
+		ret = cirrus_scodec_get_speaker_id(cs35l56->base.dev, cs35l56->index,
+						   cs35l56->num_amps, -1);
 		if (ret == -ENOENT) {
 			cs35l56->system_name = sub;
 		} else if (ret >= 0) {
diff --git a/sound/hda/codecs/side-codecs/cs35l56_hda.h b/sound/hda/codecs/side-codecs/cs35l56_hda.h
index cb4b5e7356a3..3705af7c186b 100644
--- a/sound/hda/codecs/side-codecs/cs35l56_hda.h
+++ b/sound/hda/codecs/side-codecs/cs35l56_hda.h
@@ -26,6 +26,7 @@ struct cs35l56_hda {
 	struct work_struct dsp_work;
 
 	int index;
+	int num_amps;
 	const char *system_name;
 	const char *amp_name;
 
-- 
2.47.3

