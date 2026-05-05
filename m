Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74F7309DCF;
	Tue,  5 May 2026 10:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777978295; cv=fail; b=IRFOCMjt5bP9EG/0d96EFLFq1c6awndQWcPfqOlnkQsG5lly3VizZUVPGJhm1rNpa2MA3cHkKxxfLRxG6Az9foPUCdpC4C5xLecQ1MR3E0ZKQ9Uy36QDlMu7oRpOJnoSn20XX71EXEwN9HAJ4gfhOvUCCOwFPdoKqBL+5+6bQ04=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777978295; c=relaxed/simple;
	bh=d165EJ9ABBQzRZ2WwTbO3Xdil2Eye5E3H5HCCV2JjZg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UNQtOUHpTPmZqzVYCorGYTsxNHGbt8+SC0bFndMEoVCw1s5cEIi2vz+MKm2tGyPwTPC+SLLRnSJv1az3CpEU2GRp+sSxJfgBe4oOA4I4wjQDrL71y0jB/GL78N+4QSZGa1PTlqpX8dqaZSf2mGgxLlrB/fciWYPFfW77SR0rS7U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=OlJUCt3B; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=SGTcZg+l; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="OlJUCt3B";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="SGTcZg+l"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6454rfad1749983;
	Tue, 5 May 2026 05:51:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=b5gidT29ywx4I492Wv8p6k/ICggrsIjObBUDCIMF2NQ=; b=
	OlJUCt3BujXsWvaNhMYXp3A9FqTsmlmQWnmloxr/JM9BCynBCFo9goekFum6mcB4
	jq9tGqT7+seHB+5bpkDkek24C2RCDedpF4dCTv1mqIl2ic0siDkVgrn+GORmTIHG
	LoFoFhHWOcI4lcczQ05o4e5YOVPO0a8MAZqDHHbduuE6oDrmaFsM4ZfTWvXoXEuC
	3g0SwoOlF8E/0hrEkWOPnG/C2h4UCKCjz3mgX8VT8x3Uj3j8a9rARHUwOe504/o7
	mmeqA4JSFkWAFylE9Dzhjzd+5ET7trujMbuGQF9Di/a1CaNCl74fh9l7Ltyvp09h
	Fzo/U0gyP5bsR+6wzRK1Rw==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020121.outbound.protection.outlook.com [52.101.46.121])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4dwep0ub46-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 05 May 2026 05:51:30 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jEene8fFi1EBe69Gt58opP4lnPSU4WXr0GsWLsrmmGo/zyXZ6lKt76mceGAFopiRcNqlpV+lBPjYZs/JnCLiSapVF4u7OG9AMwBqrO/peHhV/WmsjPun9vBFk7q9dpUZafdrt6E9sSgwkgOHC67hY8456Uwgcv4myv7Vs4fZ1NtNcX9TsCMhq8YRhAGbtHXVx8xDtzuchl3lE3S1prPQpie4m1AAYrMWbqWy9kfW2ZO5+NNgLJ9jHYgY194suAhs/jSawQYRxtw1/a5rzv7dD9iD7YxubZS1Ho2WpfqkWd0Bky4jdDUE2dcZDsWc42wqw/3Lbkia+5h8v20DIRsHmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b5gidT29ywx4I492Wv8p6k/ICggrsIjObBUDCIMF2NQ=;
 b=h0XE55DAfQGOIJ3RJWQmyplkn73Pq3SEIwvKgfZ3zuk2ObgKHsL52GvBnzVnZ0g0rtkAfMimWTxLUZ40LC06LOeX0jqPv9CAJWTtyMsriimqNkIJvi2tzYCPZyduqQr7IwYJfhn564NxQ9FCHarNTEbYM2EQOdcZ8urvlXt3Ov68CSauFGfpCohkPlRHNVN11Qi8IFib/fnGePkGutciSI+dL0pous0s1RiTN01W2GgL1S8woGpTZVNcdhLuqJQ8vjARrAzWlSaisDCz6GOsBroi1neZ8Sor7psxTxS0LF1N1uuPsN9yVgdNxst+6yo+IqT3hVWjhnRAT3ca5nt5CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b5gidT29ywx4I492Wv8p6k/ICggrsIjObBUDCIMF2NQ=;
 b=SGTcZg+lFspDCTNAEdSLRCvyBCbdHlsQctsuyb3BHGfFnKdegSSqoEVVt2nogQP920+a+ZLbkrOL/4iI69bMetqflTKieyX+z2GHhihPBcja7eCMUrsqgm+kK0eH3lc2OvlQY72TBar+LB3try8b7bBqpmTvDfEecHdyZlfdol8=
Received: from SJ0PR03CA0340.namprd03.prod.outlook.com (2603:10b6:a03:39c::15)
 by PH0PR19MB5457.namprd19.prod.outlook.com (2603:10b6:510:fc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 10:51:26 +0000
Received: from SJ5PEPF000001F3.namprd05.prod.outlook.com
 (2603:10b6:a03:39c:cafe::e3) by SJ0PR03CA0340.outlook.office365.com
 (2603:10b6:a03:39c::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.27 via Frontend Transport; Tue,
 5 May 2026 10:51:26 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001F3.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Tue, 5 May 2026 10:51:26 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 45956406550;
	Tue,  5 May 2026 10:51:24 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 2EC0682025A;
	Tue,  5 May 2026 10:51:24 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 1/2] ASoC: wm_adsp_fw_find_test: Redirect wm_adsp_release_firmware_files()
Date: Tue,  5 May 2026 11:51:22 +0100
Message-ID: <20260505105123.3539778-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260505105123.3539778-1-rf@opensource.cirrus.com>
References: <20260505105123.3539778-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F3:EE_|PH0PR19MB5457:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4e1e7361-285c-410f-c3d2-08deaa944176
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|61400799027|36860700016|82310400026|16102099003|18002099003|22082099003|56012099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	V8BxyEn1EjCQCDyPTzyjwfPosMeCzBp2lf+w796g9hWlNzzHd5oMkDsr5KQM/rt/j+K29wTYYKdZ+FIKBWo/3hZ5FnP4OOtqFAC4VD3Q3r4d6HLFtvZ7A/nZdeK88Z7DsrufctucixJhc//YwKvT+Ay+u1JcmFbE4mkDhrzcISHhJkvMMYEwhrR7c2r8Xtg9N9VUHe2MtqdelU3n9IwwCs0gyxxg1G2ahqYhhCHed5p8mZjaCtjDOgn7j6457EES3ZZZWWah5Uqi685imClZ9Hns0URxArZyhGANuzAYOByMlRp3A8znq74l6lrv+rSrReWYAwCm8XlIegPzVRT+Wy/etwWVWGQ9ufpM/kpj9gHX7TpvUOFO24P4KIK+JMFmFIuzIX2DSYWoHzSbbkOo2pXUTyOOnoR9DAlct4UkxI4FPoJ8QWe1yYur6zLLp0sf/4z8JAJ67/zM2pHQDzqZ2h6+Z8/gU+JXF24z1VEqcDbYSapFoGY6BQUzOdW9v80TN8IHMaUdO1oaOUJyXUeP/nN0xlGrwhKeXkXSceNCLpjslah1j6776C0dowQgrQaMdMy4dKpp4Q5RYX4mgp5t0M2mTwWgcHEGyytGpCFb6IVfJnArI4ddpnEbbfreqIXIPvMRQQwYKc4LdWEqQRlxwAahfMSdo/w6hnWIxv80AyK9xuKka+AMwKLws3yhu+1v
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(61400799027)(36860700016)(82310400026)(16102099003)(18002099003)(22082099003)(56012099003)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PSN9K+xKjy7hsckYTEjvLkOIjwATWHVuN8fvw4N1ME7iRR0gv3eT3N+a3L8GHILSLbFD5OwvIur+4efJYQ2VtWzwKz6v8LpHWIK6I9iUHWvJe0OBnU85JrXhyQotUseYK+g9IVz95AIuaX8a0q7iav16c3pSbIz3qRX61GlRhkrxsxzTlaNoMWBehl8hOouJm867BdF05tplBYSF9PdtFQEMHN/D4OYwail6Z14WumZzB0qA9SJk1yhQGS6M0wHSGHQkZoOd9c0P/UYglf/C5ogTT9QSmstbQR5ki5OfZhlitR+GOTFwPAGdAbeGpAmcrP/nvYXMeXjFAbGUUvRaRGN9wF4k+rY6K/sw3iikzFhPsgTdCX2rlo7xDBClnbu+0JSlY9aUWQ0Je3lTrUOJVzGXbFwtmFCyTx3DTtcGksmNHiedfevKeGAcNYdHpr2L
X-Exchange-RoutingPolicyChecked:
	lSBYW8u+9/VUjEZsG03i7XSt0+Rs3ecQHIhunFEU/7BSU+SZSPKdE3EvN1MjqTQ0E23CUWI35eCBb/59tY7FrWiYqSf7EapQaprk4prFRLGJn+YbkecQJDvp5H9zxmIUAV1grhKvjvL5g+TenyVdsCbiBgXl1Wyd/q86SMnYr9MhUOHLNonj78QAVEF8gN7qIPdeMDbj7I49F8QIqz0LvoJQ5LLz/aLp27Sp0S0a9z2VUesX0svAkiEtaPvvunOxZBSFjxOpC9QTBstbhpxRjTssRA8zqovvmmipi+arFHzeKYoRR4UGAeflzBejyggeHjmAq7us+Dnhg/Og+FoO6g==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 10:51:26.0030
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e1e7361-285c-410f-c3d2-08deaa944176
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF000001F3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR19MB5457
X-Proofpoint-ORIG-GUID: Ka5N9ohFT3oA1yZqvwKnZE9DTNpyLj-Z
X-Authority-Analysis: v=2.4 cv=fcCdDUQF c=1 sm=1 tr=0 ts=69f9cbb2 cx=c_pps
 a=pjPKNKgC2VgaEdt9hcwoBQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=c92rfblmAAAA:8 a=w1d2syhTAAAA:8 a=ZwyWdNs7Rt41VlKHrT8A:9
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDEwMSBTYWx0ZWRfX+NOeHuf78zli
 k+z9xW3gNwYfgvmLtX5T9LyEaI0YBkRSsBZw+7bdYpsZwvqnKtsMpY0x/brf82vJUwtKbquNoXu
 XcyERZ7aWjnpock4dV4nYzzNcEUJRXAjJA0zc/y3hm1iW6jE5Uj1QvgUgGvjyazxMwhj2xvXelk
 2Wfz07y7BQNdDPPVi+MStII2wMj2PDaKYS06cqgSD53fgAeTaOqq8IGFDkr0atn04YBpvGdRDYI
 l+IKvNMIIV9kloc0WBoxSclnBpC2u1b0UWURMBL69r8BQvTEmYLj3H+iVGDiH2rW6CrWbUs6Z89
 buUeESVOBQ4HI0lNDrKnVgenRXL3CL/h7W5crBKKd/5zqBTZ4Mdi4U1CMK6vOFRpRhPx1WMn605
 nc+lfFwTCx++Lgab1YCiLvpsE7V6kH2pUr89aUt1PQFAObccIjez/rjG0z4z0F0P+n43KPjSXAg
 MIMxxyYHsICvCyUUIbQ==
X-Proofpoint-GUID: Ka5N9ohFT3oA1yZqvwKnZE9DTNpyLj-Z
X-Proofpoint-Spam-Reason: safe

Redirect wm_adsp_release_firmware_files() to a replacement function that
handles the dummy firmware created by the tests. Use the same cleanup
function to cleanup in the test exit() function. Also call it on each
loop in wm_adsp_fw_find_test_find_firmware_byindex() to free the created
strings before reusing priv->found_fw on the next loop.

wm_adsp_release_firmware_files() will pass the struct firmware* pointers
to release_firmware(). But the pointers created by the tests are dummies
and must not be passed to release_firmware().

The test never invokes wm_adsp_release_firmware_files() so it wasn't
redirected. But the error handling in wm_adsp_request_firmware_files()
calls wm_adsp_release_firmware_files(). The redirected function makes
this safe.

Using the same cleanup function to perform cleanup from the test exit()
handler and wm_adsp_fw_find_test_find_firmware_byindex() avoids the risk
of duplicate cleanup code that all needs updating if there is any change
to the cleanup requirements.

This problem was found by https://sashiko.dev.

Fixes: bf2d44d07de7 ("ASoC: wm_adsp: Add kunit test for firmware file search")
Closes: https://sashiko.dev/#/patchset/20260326100853.1582886-1-rf%40opensource.cirrus.com
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/wm_adsp_fw_find_test.c | 56 ++++++++++++++++++++-----
 1 file changed, 46 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/wm_adsp_fw_find_test.c b/sound/soc/codecs/wm_adsp_fw_find_test.c
index d0c7fb30a95d..516ba08eb5ba 100644
--- a/sound/soc/codecs/wm_adsp_fw_find_test.c
+++ b/sound/soc/codecs/wm_adsp_fw_find_test.c
@@ -45,6 +45,34 @@ struct wm_adsp_fw_find_test_params {
 /* Dummy struct firmware to return from wm_adsp_request_firmware_files */
 static const struct firmware wm_adsp_find_test_dummy_firmware;
 
+static void wm_adsp_fw_find_test_release_firmware_files_stub(struct wm_adsp_fw_files *fw)
+{
+	/*
+	 * fw->wmfw.firmware and fw->coeff.firmware allocated by this KUnit
+	 * test are dummies not allocated by the real request_firmware() call
+	 * so they must not be passed to release_firmware().
+	 * This function replaces wm_adsp_release_firmware_files().
+	 */
+
+	if (!fw)
+		return;
+
+	kfree(fw->wmfw.filename);
+	kfree(fw->coeff.filename);
+
+	fw->wmfw.firmware = NULL;
+	fw->coeff.firmware = NULL;
+	fw->wmfw.filename = NULL;
+	fw->coeff.filename = NULL;
+}
+
+static void wm_adsp_free_found_fw(struct kunit *test)
+{
+	struct wm_adsp_fw_find_test *priv = test->priv;
+
+	wm_adsp_fw_find_test_release_firmware_files_stub(&priv->found_fw);
+}
+
 /* Simple lookup of a filename in a list of names */
 static int wm_adsp_fw_find_test_firmware_request_simple_stub(const struct firmware **firmware,
 							     const char *filename,
@@ -97,9 +125,14 @@ static void wm_adsp_fw_find_test_pick_file(struct kunit *test)
 	kunit_activate_static_stub(test,
 				   wm_adsp_firmware_request,
 				   wm_adsp_fw_find_test_firmware_request_simple_stub);
+	kunit_activate_static_stub(test,
+				   wm_adsp_release_firmware_files,
+				   wm_adsp_fw_find_test_release_firmware_files_stub);
 
 	ret = wm_adsp_request_firmware_files(dsp, &priv->found_fw);
 	kunit_deactivate_static_stub(test, wm_adsp_firmware_request);
+	kunit_deactivate_static_stub(test, wm_adsp_release_firmware_files);
+
 	KUNIT_EXPECT_EQ_MSG(test, ret,
 			    (params->expect_wmfw || params->expect_bin) ? 0 : -ENOENT,
 			    "%s\n", priv->searched_fw_files);
@@ -173,10 +206,13 @@ static void wm_adsp_fw_find_test_search_order(struct kunit *test)
 	kunit_activate_static_stub(test,
 				   wm_adsp_firmware_request,
 				   wm_adsp_fw_find_test_firmware_request_stub);
+	kunit_activate_static_stub(test,
+				   wm_adsp_release_firmware_files,
+				   wm_adsp_fw_find_test_release_firmware_files_stub);
 
 	wm_adsp_request_firmware_files(dsp, &priv->found_fw);
-
 	kunit_deactivate_static_stub(test, wm_adsp_firmware_request);
+	kunit_deactivate_static_stub(test, wm_adsp_release_firmware_files);
 
 	KUNIT_EXPECT_STREQ(test, priv->searched_fw_files, params->expected_searches);
 
@@ -201,6 +237,7 @@ static void wm_adsp_fw_find_test_find_firmware_byindex(struct kunit *test)
 
 	dsp->cs_dsp.name = "cs1234";
 	dsp->part = "dsp1";
+
 	for (dsp->fw = 0;; dsp->fw++) {
 		fw_name = wm_adsp_get_fwf_name_by_index(dsp->fw);
 		if (!fw_name)
@@ -209,14 +246,21 @@ static void wm_adsp_fw_find_test_find_firmware_byindex(struct kunit *test)
 		kunit_activate_static_stub(test,
 					   wm_adsp_firmware_request,
 					   wm_adsp_fw_find_test_firmware_request_stub);
+		kunit_activate_static_stub(test,
+					   wm_adsp_release_firmware_files,
+					   wm_adsp_fw_find_test_release_firmware_files_stub);
 
 		wm_adsp_request_firmware_files(dsp, &priv->found_fw);
+
 		kunit_deactivate_static_stub(test, wm_adsp_firmware_request);
+		kunit_deactivate_static_stub(test, wm_adsp_release_firmware_files);
 
 		KUNIT_EXPECT_NOT_NULL_MSG(test,
 					  strstr(priv->searched_fw_files, fw_name),
 					  "fw#%d Did not find '%s' in '%s'\n",
 					  dsp->fw, fw_name, priv->searched_fw_files);
+
+		wm_adsp_free_found_fw(test);
 	}
 }
 
@@ -255,15 +299,7 @@ static int wm_adsp_fw_find_test_case_init(struct kunit *test)
 
 static void wm_adsp_fw_find_test_case_exit(struct kunit *test)
 {
-	struct wm_adsp_fw_find_test *priv = test->priv;
-
-	/*
-	 * priv->found_wmfw_firmware and priv->found_bin_firmware are
-	 * dummies not allocated by the real request_firmware() call they
-	 * must not be passed to release_firmware().
-	 */
-	kfree(priv->found_fw.wmfw.filename);
-	kfree(priv->found_fw.coeff.filename);
+	wm_adsp_free_found_fw(test);
 }
 
 static void wm_adsp_fw_find_test_param_desc(const struct wm_adsp_fw_find_test_params *param,
-- 
2.47.3

