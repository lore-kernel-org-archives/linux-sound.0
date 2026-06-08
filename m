Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1836F3BE644;
	Mon,  8 Jun 2026 10:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780914527; cv=fail; b=mOg+Qi1acEP2hGTzPdHcXcnlckV3YZ9pduKezQxM5e+vp8z8IyeXV4H6L6TgcvF8DIzymXFqviUdFXfW8WE7VaC9tO965BfZo7w6j5dvGL1woAtDGrhm9IxHuHdbBjM2l13mnOrvdRRJd80m/xyaemWPt5E2ied4upLoOkC8on0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780914527; c=relaxed/simple;
	bh=03BVJYrNnCCOH+y0+XmEl0OoaKzvdLeNNyBZ8q0QgHk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UCIO3It9oMEozLph0ljbJs0AcsYEp66Bv/Bs9tH0PxEcm/6iaj/jm7fFLAZ0xu810FUEvaj+Ish45Xe+v8pR6QF0CF6KaEqL7kyCqnuVmzmEucqv0n9YUI+iJ2/575A5fZRR7/Yj9LZUgUHuBaILOhOxqVRbCtezp7B7BOqZlRI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=h3Rnbl84; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Gj2cizft; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="h3Rnbl84";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Gj2cizft"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6585U6pV3726519;
	Mon, 8 Jun 2026 05:27:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=qGW+4ObHdgEvS+uMVX0IhTx6F9cFpQZnovU4EVIelwY=; b=
	h3Rnbl84+7++1a9zZHu9LcbFx1W+XqK6rEtNwU87og//cY3+Tvf6NhCuiUKrz81S
	xsclVivG91rJRCLUTy+lnKuTYc5DkPyxe/6CPEac/Dt3lM00yW3QcGiJn8KUwsKk
	bfwFcfDnufMpMZ5SK0XVaMfjf0ETULPGjDR0bVy20lz7ap2R1MRB3rBrQPa3H2ma
	mtZkGZkUi+nLl3E55V89zJw2Fsy/j4gpgCDU36G/TQaNUBP0hPJFxisWz1oIUn8M
	gVxMOrohferO4Ls2RxsP+85BbAvkiWeC3ABezKTmpeOzjF7b1Ft3lXx9Wt/r2hBO
	OmzYdF6RENU17nSGrszMvg==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023124.outbound.protection.outlook.com [40.107.201.124])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4emgy0a8q4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 08 Jun 2026 05:27:26 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eziKzOqObN4jG+DQmFIEsuNplLA4iNi+NfTBMQZE3t/CQemi6DGhBkwQmEb/lExnaAsQpZMoOeINeVVgtZ4wLupf0GY1lKQ2Wufbk2A50ossJ0YDy+ImCl/CK3ZgYBynGPETD+QBqHqFxuYzm0dvzeiqMVeJUtjWcITsFPqgQFxwKkjL3Weg5zJ2sUamj7lxZsTLLu+PaGySjSTSSaLicOj3yAt3evrKlrhpyTcq98olSLUYIuODIbwYb7Eoze4Bupfae9jyeIQEBX0BG19wsbl5FAAYdwgdLUA28iDzT3/81NpygByI2HBA+KliJ7wA8nL4tOpKE51yPFVKLleplw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qGW+4ObHdgEvS+uMVX0IhTx6F9cFpQZnovU4EVIelwY=;
 b=QM7TjgPR2DGTTpd1xOrS/qW9WCw9/A4OeGIJtIPb8Mm79nGJUiu83hA3DMuy5YOPq6Uq8KkVEM31bSF2GmER9yNyhtppCybTATE57EBkD6KaNHo33HKD4ltlgre71O8iDHKwmBppinfZLuxbR8kIc4MPbKUoQ1l7EQ9wlKRK1LuPP5o48EnMfijLDaQqocOj4BtQ8VKmOd5oALZ3ehqVN82G0ByBl0+YoQOySd/8BCgRdnQm5EhW2wY0U+vhIAMIZtsQ/RfiN6ZJSwnIAE0eRPsvK63PnHJjqu+eK6v9Ignp8w7tv5LaBIseD4EKOKlV5mY+qgdvCJj/T+z3AxpdEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qGW+4ObHdgEvS+uMVX0IhTx6F9cFpQZnovU4EVIelwY=;
 b=Gj2cizftHAwpxHBRJ5JfBrZAju1rfIzr4V2tjlSWShi5xupQ1zntfg4l1Xx7y8guSjLzNzSRw3X0IuEIIgBYPSpofbR47OxBXT/ySl7WzcjJFsLZFab76LyOj/7vb7KY7PKwyg4601rtZ+ct6ff03KFlmK9P6cwnt8UfmdluKf8=
Received: from SJ0P220CA0008.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::17)
 by DS7PR19MB4453.namprd19.prod.outlook.com (2603:10b6:5:2ca::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.10; Mon, 8 Jun 2026
 10:27:22 +0000
Received: from MWH0EPF000A6735.namprd04.prod.outlook.com
 (2603:10b6:a03:41b:cafe::40) by SJ0P220CA0008.outlook.office365.com
 (2603:10b6:a03:41b::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.13 via Frontend Transport; Mon, 8
 Jun 2026 10:27:22 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000A6735.mail.protection.outlook.com (10.167.249.27) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.7
 via Frontend Transport; Mon, 8 Jun 2026 10:27:21 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 0DDFE40655D;
	Mon,  8 Jun 2026 10:27:18 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id E246482024A;
	Mon,  8 Jun 2026 10:27:17 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org, lee@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        srini@kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3 06/10] ASoC: wcd937x: Use new SoundWire enumeration helper
Date: Mon,  8 Jun 2026 11:27:10 +0100
Message-ID: <20260608102714.2503120-7-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260608102714.2503120-1-ckeepax@opensource.cirrus.com>
References: <20260608102714.2503120-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6735:EE_|DS7PR19MB4453:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8fd095c7-2d1d-499c-40d1-08dec5488689
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|7416014|61400799027|82310400026|56012099006|11063799006|6133799003|18002099003|16102099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	SmDFYNP1n6NcR+oKA4ZH7Gogwq4x1V/fZQFf/Up6xTQQbpRB0+jnqkodh8BTmWksIo5yswwBELwBpV/80StlVFv6jeHOghO9vVHkCnVq7cM6TD0RAhfpIDpuVJwmxVvWGppJhSR9WxW/TLQuWA0ThtKonRweaZ77y7dEFH5/UgLM/r3kXvjYBIohv+aCS4ZSqudrmTgzgO8PZXThKj/UtmblpXkkF0AUgCWTIydqeIYn6QoreJpxDKLyMMjCfCy3zXs8PFLWH0hecVhhNO48UiDdqEFuQ6LRCG0ibrXjfZxfQRwA032ANrH0ww861wIzsOW0HKDhzTu82KeZ91rJ6i2Z5upZIYA8i5ST4WJfvYVv7v1vy7ebh84OgHtrNaiWWh2KPXpPd5D7WEZ31QOve2xwGInb37ar51xq6h/IZF4CD4StsDRTQEwmbuncw5XT+8fNH/etHdSPpX/jIeofEACGKUHwSFPBaXUMPdFPGZI+IhNwU1CsHf/DaGn+BTqDA6AeX9KJgo1sELyb/E/gC0HQrlbxlYzgLU4VZ+gBKNYoi6N+U5TS0eHVC4j6++qAHZYJr1AbMm0kwgomOWxKCMNcnXoxwKCfgV7lQ+rE3SxCdvX933hFU/pSaRirk540Co/xjxkhHN2cLE2B5FSRr8KGFcGOUFMMGmAyuv4RBsWwkztHsJNGqW+wGXrebTAgO8xiiM/rS81Q+gnIuePMIwI2uVfrE/swoQUhgoyMKeQ=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(7416014)(61400799027)(82310400026)(56012099006)(11063799006)(6133799003)(18002099003)(16102099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Mmr4CewzrwluWKO01RTbzJ1MTfvoIt0QO8evhY81Q8UbPtZ4/6cuNDYgyVGh85s8frEknXL1iOvJ90R7k+jrnTCO1xObgAnf1O+YkotuoVTSMAfME+aAD4EGupBwO9CNrhpWvrY/CB0haS73Ljkfpf4EC9hbaYTlBigwXcxCc8NxZ/+7p6kayQFMEcIgKKBv8v3GUFlPtIT4ACKG+AkmDr0ywn90Bg++hpnAaygcvRPb77px3fppmHJeZMdsDif2wtaW73kStHBGTTzb5mN887Gvka0zl8XJg6zV/NYRRPURWGsFugOkUFmkTyKvEeEhmqH65HOYnEd0lIH0W3YInYfBpu/B1dLpJPmBN4qy5xPVWh/kaCoXk5zsHJO6wKEL5Df3y8pB2hfIrIwZpa+o6wLZGYyGGU6xGOjNeJJmYT10apWgyvCjdXnomb7IA8th
X-Exchange-RoutingPolicyChecked:
	NReeKxI9rNj6z9/v7rBepwFcqG1HwcwSsEpl4wdOncOD09VnrWxLEf+tybSggnm3ntzSxnFvT8K3QRGv0YIlXrgdMIxsP3tBg9bOd5BOfl8303guDl0qo8K9dGB24gCRMjIbeBaj8rfdmOy3LewHOgaEOn8JsN1Ie5zxzZ+pB4vAzInRv4M7LHDwnMfcljISN2UVHfeqBt6DHk0aKVDI3MK9lAgyGR03xYj/SeUUL9RRNF6QaqJUqzVf1lUOFuS7Dt4rPoc62AiOn2axrt/hbQ7/jiEnVb2t2YN9YBZvoKYM+Ludj0kJY1L+MyJ+eRtQSXFy5JlqUi74vrZli2XU5Q==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 10:27:21.5381
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fd095c7-2d1d-499c-40d1-08dec5488689
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000A6735.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR19MB4453
X-Authority-Analysis: v=2.4 cv=GP441ONK c=1 sm=1 tr=0 ts=6a26990e cx=c_pps
 a=6mrLUOsRrbGUgCFc9Veheg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=EUspDBNiAAAA:8 a=w1d2syhTAAAA:8 a=Uk30oNBv9cZ-rtdV3UwA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA5NyBTYWx0ZWRfX5Qr67QpoX4xd
 YnVmq/KZd5BSlCiAPmgmjdE2lIzOTCbayVTzV4A1OBU74zXVlq0RDn3An5UkCSGToBfKaKQ7SbK
 fJkzTcgTorzNo6/jR5Nevk02oRgwKI/RiqLnKoR3eKvSyIIHWidDgce++eGtUKMhktg9g9aCyKq
 ju3O9npjA6fNMPSMcM7RoNDhWCAhgO3FlTZwCI/YAT6rwSO4T9Dx3BDAz/Oi0lB8ROOdoh8/kyq
 5KBrbcY9ktaH9uStEbPtFQavfRovVeVpQMSbVoUg34UKJaNMAwQiEJakAt70pYDD8MI0KeSnWCX
 WeNmFBGPX3f4kU4vRvoPOixRRbCe49devFIQAYKdOMQ1MvjVOWwtuuDmESHjGpcfqVqcwoja1aT
 iVCCDb+PHhwVGVyEGT4jKqYkv1d2FWnnNVuR0G9Xw7pcFRO/h5B5+7MNbDYH/44B0HUgwbT+SIb
 fBKulmUgW6l+FFyaxQg==
X-Proofpoint-ORIG-GUID: pFdb2mr4VlXKGDypJ2fJ11mcxbQVzskZ
X-Proofpoint-GUID: pFdb2mr4VlXKGDypJ2fJ11mcxbQVzskZ
X-Proofpoint-Spam-Reason: safe

Now the new wait for SoundWire enumeration helper no longer depends on
unattach_request it is safe to use from probe time. Update the driver
to use the new core helper.

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Tested-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No change since v2.

 sound/soc/codecs/wcd937x.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/wcd937x.c b/sound/soc/codecs/wcd937x.c
index 72a53f95d6887..e0169e783ee96 100644
--- a/sound/soc/codecs/wcd937x.c
+++ b/sound/soc/codecs/wcd937x.c
@@ -2499,18 +2499,13 @@ static int wcd937x_soc_codec_probe(struct snd_soc_component *component)
 {
 	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct wcd937x_priv *wcd937x = snd_soc_component_get_drvdata(component);
-	struct sdw_slave *tx_sdw_dev = wcd937x->tx_sdw_dev;
 	struct device *dev = component->dev;
-	unsigned long time_left;
 	int i, ret;
 	u32 chipid;
 
-	time_left = wait_for_completion_timeout(&tx_sdw_dev->initialization_complete,
-						msecs_to_jiffies(5000));
-	if (!time_left) {
-		dev_err(dev, "soundwire device init timeout\n");
-		return -ETIMEDOUT;
-	}
+	ret = sdw_slave_wait_for_init(wcd937x->tx_sdw_dev, 5000);
+	if (ret)
+		return ret;
 
 	snd_soc_component_init_regmap(component, wcd937x->regmap);
 	ret = pm_runtime_resume_and_get(dev);
-- 
2.47.3

