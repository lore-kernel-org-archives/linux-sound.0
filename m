Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C2A3CBE75;
	Thu, 21 May 2026 12:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779366325; cv=fail; b=G+3Xa628F0vIqutVtfw0l3XySQIAVeEcNeKkZHY/UFas6B0Q44y21q7k92+rUQUgv32FO0kOqdYQM5cdcA0BDFrTwMpdURLikWubzcJxbYhnGcGP5cKWWcGG+Yel4Ds7/ypwLvk3Lhlpvq0Z8/E3w0fljj0ywuthcdSS7q8eCbE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779366325; c=relaxed/simple;
	bh=Ew1wMea70Lh92aOOvUFrIY8u9xgh61UBV3qyZ1jtFKk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CzaeBDIm2SfqM0EZpPzi5dn4JgIKJO6rda9P8unQ008Vc6sKDBeSIS7Ze7FcXJ+TZG0BNmIEB7QDB5cyhumIb6srmSJmhzR7UHq1b9nYqOV/+B5fjSJ5aei7cpx15h1hXoHW2hI+q5IsD9TaccxiOQwdFjXJtiGfCIoDyWBOeqg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=p/S6uaQP; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=iVoDoR1y; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="p/S6uaQP";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="iVoDoR1y"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L4TG5t2634342;
	Thu, 21 May 2026 07:25:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=9TZ+oEOhZgx1kcke4q4GBv3U2Bz02CPd89jzrkSgrS4=; b=
	p/S6uaQPWCwmyf5CWwg3oGLRX6GNh42qxpxUy52A8tlzmDxjC4NWDRhPJ5OAHCFq
	Cohp+3PqdDy5/WUztdOpY1xQdWbdIKlT2iFKkEPpqND28UFXH0GOiZuHuwFhrkpe
	yBr0KW4URTRUssBpOCaVyY3wIJOL1ARv+dwPq1OANTPGiBC3FPkwRmBn13MRiVmN
	Imi56ksSO6CeBxyldt6LH2n41eKuaCKPai9wjjvOz/VpdeUEBMMPYI1/2slpbd2Q
	cuyfoWXRhluc2HdKUcPApj8qJ+8shmQaot4YFMvKT0yL2NOdHsPHjuWBWZdbccqv
	OfPIC2mtT37Y567zduPcFw==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021093.outbound.protection.outlook.com [52.101.62.93])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4e93xcjerk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 21 May 2026 07:25:18 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FxusqbdO93oJGuxXpUMZGFv8+StXJnO7weR/k7tZmvzmEk5vJIp+xTd8yrvOX9j3s/hteON/49VPZ//ywJJDUFIU8Nqf/fms/hpUJ8Z/8vYtd9It1CZmiuXr9CKMOak8dBGqeDNfu7AKKpNcZlqMudestwnX/kIwUb7huIWnvyu422Kz9IwlFHIQTiQDR6DyIzB18SVOHSSPpZqmI+gki4oGBYMaUPU+AKBgWkjkOoRlmVCA1rgKD6LFEeb8X4NvTT32t+X0hchITAIFmBfIkpf1mUzIGX6rV3dgvbV+L4M1QVLgCN4NHt8hwZGa9LDHsa2pSk1Wb8yU3xhlLzd4PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9TZ+oEOhZgx1kcke4q4GBv3U2Bz02CPd89jzrkSgrS4=;
 b=Be7SWTNNDLEkCnxIijCrtRuyQhC6x84vuiTp8dZI0bzbFa6Q781n3Uds/IjDNbPxqVAKsune1PQ0KpKMEqnv0MhScHRFqh9Nqu7edJap3qmo4HphQb5LUl6pC6f5OJ3pl5XvQI6rNAKHXFAcMfeWdFRXVzQ76PFzNtBKa8+GTXZ2uhrCr3j84oGTjjRd9QYvB2KJGe/yvi35D4TVXcXJkStr5loHU9MLl1DK9mRELMXFFkmtYcHrF9OGMZCxwGkxBxhaXC8HPQ2C+9G/QaScRYO8bevRUaolrGoIPavN9RQ65Q5DabUH6P0TSjWEAthjfwlad0G4+Uj0Us+jOVflSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9TZ+oEOhZgx1kcke4q4GBv3U2Bz02CPd89jzrkSgrS4=;
 b=iVoDoR1yk2myMfo+ws+gy2l7Dt8HyGQmR/1jOIq6FAGQE4v9jWYDR5AXzBuKzFbipzRKET95UHZQ6r5aR3SHRGg3WvapWqwRoIJKpPCUgUxgEVBPB+j2K7TUWxdKXto027zfXfZUof6V+u+1vzyfwoO1LGsheW6oAa8IH/xt5xo=
Received: from SJ0PR03CA0152.namprd03.prod.outlook.com (2603:10b6:a03:338::7)
 by PH7PR19MB5821.namprd19.prod.outlook.com (2603:10b6:510:1d4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Thu, 21 May
 2026 12:25:14 +0000
Received: from SJ5PEPF000001F3.namprd05.prod.outlook.com
 (2603:10b6:a03:338:cafe::11) by SJ0PR03CA0152.outlook.office365.com
 (2603:10b6:a03:338::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.16 via Frontend Transport; Thu, 21
 May 2026 12:25:14 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001F3.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Thu, 21 May 2026 12:25:13 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 40CC440654A;
	Thu, 21 May 2026 12:25:12 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.13])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 2A0B482025A;
	Thu, 21 May 2026 12:25:12 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 1/3] ASoC: cs-amp-lib: Fix wrong sizeof() in _cs_amp_set_efi_calibration_data()
Date: Thu, 21 May 2026 13:25:09 +0100
Message-ID: <20260521122511.987322-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260521122511.987322-1-rf@opensource.cirrus.com>
References: <20260521122511.987322-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F3:EE_|PH7PR19MB5821:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e39b0794-622b-48fe-b2ec-08deb734025f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|61400799027|30052699003|11063799006|56012099003|18002099003|22082099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	ufJ4zMJnFLJWk8GfWfkCC6Ql/cwqxeJO5UMYWi+xmSutu0LMy4FJM4uumL649/4BbW8oSXJbhO6qOSogNX3HHCFDpEP+aHtisni/8q2jtOQv7pCDJ3Ug0leAax0DH6eIexuNsuw/2/OQiZtdE5De8RaiIIP2sJR+i+w6m3N8E5+/Rf6joloZtcJCWlxKJToC5idy8xX8Iy6HHlwxXNN+EM/mBK9jaYZSo9H0qyhWdmZgWO8wKgde2uUjVjTz15u8fdR76aoaMl6QTzk/DQ9wh96KQjV74lGAe3V74AzZTxuY0R+FL5EJ0WwAmXwTvc9wndWwFxPfoEmclnXHnTKylKhS9a5WJNM+TVN9NDHalR+p1BUM0tAbOEdg7vf7pcneqwqZTJpNbro6JY5ezo7nO+6pHC64ZtYR1aTYUm9/2HqqbsrmjfDZJKRIgOaDt90zebjHkz5nvbG6T60xuF4qqbLM5x2qQ+oO2/lfzzPv+gdkQg6Et7tu+TwxV8ym0f83A6n6K+yCT+kWtnV3omkSUSwJZHVChcIRl2IuW2avmFG0jvEDcotDqJ8mB4lHHJ6dUD98mA0gIXJmIkmMA1j62RLQtFqoEuaWDX/612+7ajwOlttkRoJLt2xPKughGHNVbMvde1T2PtG/rF/tGwCJZ7yNYjLxRFSBkyMdqV2qbwV0yxs1EXn8p4U49D/wdI4PoHBSZvl9hgS24EuJnEAcKAz3iIeFbZaXV95Y1UjbaLA=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(61400799027)(30052699003)(11063799006)(56012099003)(18002099003)(22082099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	XE6nRJ0p51+AJ7py9mmsGrPPewDS1ENiunuYilCJWiQsaUrB8ucZsQwL2meB+l8AODMHfjCp30ff71aP569WVqkVpW52qi4X/hc6UfczdDu8DAWEdbVrWja4EKX8Ark7I+31L/9lPUHyzGQRX8xfyrjO9LZa3ytP7qrzs+0CqNiWslwYuinkVFJ6SJ3lG+9URy6nEhkImhppjtnhaH6SxZKstpgcM4tSMFm8OJi91GYp6wBalX4UiaEMFjdkflj876+6C7JlYyz/bZ2SYCDCgZ08GdIwjUtwDWI+2vnM3vNCQYmyF8J5n1ji5+mPVY+Hoy4N35hYIc66XBUG5aLN+VdGxZRoMVxejnzpAKh/6kp4QOqZ8VAjLY0bl6x633idWT1V4/omDHLoYH5djspxeQnps/dYbVHwOz5fEpxj170WOwLHuY+6WG2FZWeIhOko
X-Exchange-RoutingPolicyChecked:
	su/osYvW0BcXrnx7dAvxqM+H7PJ6w4E117I03L7Q1uuE8Ex0HJ4YacLjf+oECCnmJNJZe2eE2G7pzv8GNSk5luDpZTKQ6uSnH4y/kj/5IoReXjlgkfZK/90E4+GubcFlU8o1ezowV+YwdrzzVPw/+WWt61YkgG0HslcOgCxoLB7actHXqhencwq5eTVdDh4vmanClfZafVHn1YprbiWpwmFXFtBr7DnZdQ+4RD8+aK9c+Zl3t0OaGk02C3+EO/cXLoPti9sPvRho7fhUlYtKgcadyWbPnyUXciI6thK++23cHxDqUR+fJowdRfufreoOC2TzUyf+5Q5RlrazolvVOg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 12:25:13.5849
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e39b0794-622b-48fe-b2ec-08deb734025f
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF000001F3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB5821
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEyNCBTYWx0ZWRfX7otzwBpEX2im
 KfHvox160fzpLvB+vncw7vHLkszme+q+J5ackRELXKWiUnRpPBZCJ8kczwu2yP6zmUOxdo/1VhB
 sVJE182MuUXMDxVRYJ7stTKJ6LMkWfXzr98a+jQ5kFMBmdcCdlx4AtJl2mNKt46eZLzuGT4WJZz
 8uRM5Yo/y/GxCb1bnsTSAriJ9Jx3C7t2/jaZ048Tx5yXpb9zeYfAMZBPqhw8yRX9bpQomMB35A/
 PnDUksgeXFrcCjpyExobiJ0SVRaGIz6H89UlxnYLW+7MNRrjDEPNM2Mt5YJTon+h2cHPqUURHWE
 t15xAonddkF1Ujj55o09ZGGFHIA8LGLOuWEvi02ER/8HdV6MK/nShVDN2igktazjdqEPq5J5qPH
 r/YTn9p8T9Jp2QPhTtk/9QyIAP8CRBoCPZNun33+J8PTPvs8WLNAsCRNStyDknIzohqIqG5JXeM
 315I9ZgvtXUvxQobsRw==
X-Proofpoint-GUID: 7ZN1H8C_6cJE5xjn6-twyW7XE28Dclj1
X-Authority-Analysis: v=2.4 cv=Wrgb99fv c=1 sm=1 tr=0 ts=6a0ef9af cx=c_pps
 a=y4zkFa5omBjxxVHSBTJAWA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=TS7Ed_d5VwyFwgGqxuQA:9
X-Proofpoint-ORIG-GUID: 7ZN1H8C_6cJE5xjn6-twyW7XE28Dclj1
X-Proofpoint-Spam-Reason: safe

When calculating data->count replace the incorrect sizeof(data) with use
of struct_offset().

The faulty sizeof(data) was incorrectly calculating the size of the
pointer instead of the size of the struct pointed to. As it happens, both
values are 8 on a 64-bit CPU. In the unlikely event of using this code on
a 32-bit CPU the number of available bytes would be calculated 4 larger
than is actually available.

Instead of changing to sizeof(*data) it has been replaced by
struct_offset() because it has better chance of detecting these sorts of
typos. Also the offset of the data[] array is actually what we want to know
here anyway.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Fixes: 2b62e66626f0 ("ASoC: cs-amp-lib: Add function to write calibration to UEFI")
---
 sound/soc/codecs/cs-amp-lib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs-amp-lib.c b/sound/soc/codecs/cs-amp-lib.c
index b34b1f5f121f..881c6f2264f3 100644
--- a/sound/soc/codecs/cs-amp-lib.c
+++ b/sound/soc/codecs/cs-amp-lib.c
@@ -500,7 +500,7 @@ static int _cs_amp_set_efi_calibration_data(struct device *dev, int amp_index, i
 	 * must be set.
 	 */
 	if (data->count == 0)
-		data->count = (data->size - sizeof(data)) / sizeof(data->data[0]);
+		data->count = (data->size - struct_offset(data, data)) / sizeof(data->data[0]);
 
 	if (amp_index < 0) {
 		/* Is there already a slot for this target? */
-- 
2.47.3

