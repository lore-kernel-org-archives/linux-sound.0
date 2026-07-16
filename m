Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512EA4302FB;
	Thu, 16 Jul 2026 14:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784212029; cv=fail; b=Z5CJaLeA0HOxUZLYxy7cPGdzS70gP3EBhqsyASsZ5xKTNlEttolQkvoNSYiGsbCk4Sj0wF7DQIIn+Pacv8m4R/RA7zNriDMV5G5KgqIx7Lq62vk7d9MNWnNYxlPoXwv2L/2z0Q5SLjkjaALeQw+a7PyI9k2wyR+sWQL03Ng2jMw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784212029; c=relaxed/simple;
	bh=YdHqavXlDXQf+30jT2MVUSd+UDSlSjZs5xigxNjvfxA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EbGDmsFUalb3oANNtRi27Gji6KsT1phX9+7RHzJf1yMf6IYjvx/9wuJ4M8AfyHpju/0FLsV9zh+vWz8a17mJzSJezjKi6cJmWz+7yqJpwtcPwdvqH6ZchZckNm0vTVl4R2qYpg+MBjoPM28YL+Ls7tSd/gQMsrY/X8Hx8vZ3Zec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=jKRqs4jy; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=MZgAGGfr; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="jKRqs4jy";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="MZgAGGfr"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G4iPoj2661140;
	Thu, 16 Jul 2026 09:26:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=neQrV2iaP2NqKC32lr3hV0WEINT8b70Kd7vQphEqmVs=; b=
	jKRqs4jyQ7S+rqoGK4RyHRjFQtDqaOkghTpmSlMTHiHrESHRuuXrAQxYVCNHIVjw
	QWaYg/JGItjFEq8LIRsqvFYEfncIppTDUmi0ncCTHfWwbM39nsSgbGDwW0wKefR8
	XgZ0AHSyOSOyAH65ewWgHJ/WEZmSGae3UizlzI/sv2qNDXjHFdhRO1TCriAyPMpP
	h+UKGju3hEGW6qjS9HQowgaTyzqBKtRaLQVraDc1Lhwo4Mo7ScHsZS/CPpKwy175
	iVxEGMaeDqKqFcJ91tGdyeIfN2H+zUcKYN9UizK8O3T6QoFrgWU2EdvoFMYvzzax
	ftUydKHbLGOuzyft47eo1A==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022104.outbound.protection.outlook.com [40.107.200.104])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4fbk7vy9r6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 16 Jul 2026 09:26:50 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L8+eJBsyIHrNxTC4Fwk/Acuv3cVTUWjHiX9jAyIPUaVrC26+OYvx7opX40//XMm/LzmpuFdNrOtaDWt4ujxiKN0iYwUU+A4Xv2ZkZhHrNQdmaK1yz6TFnkTSvCsODESUNj1kDEmB+68z/8B4BL4PZqD4/juT5cvNemBHXidX+D1sxE95AnMySI9p5dG1b+DrbVel54g0IFf0O//1eP1iWBprNTi/wbuuzpcHcSNnH7CCIvam3uZ7W/U2H2bBJqYN1+KP3IQ8yIHFGqnJuYMez3F91hC2Wx9dQpFw031V/730aoFC91mCPhsOdws5Gb9c33pkZU1bGHfqS5V1GFm8LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=neQrV2iaP2NqKC32lr3hV0WEINT8b70Kd7vQphEqmVs=;
 b=OW1YsDSIEk3yDVK35mhOl4MFXSDTyEaKKeT+6g3OyKpW/VhN2A09PeB3iLj20v4FPQhAzCYRmm7KrjR4+8KekxY6MsuXKoOjO1tbs74Senptl/cewYWChx4usNLM+a5lcfaphwmddDC0WDK8NDrR/juTZPqU/NrEouXVrYcCq7Itqt2rc2GCX2MHYtto/8WRVL21ije3vaoo3/UWygfYHzSbRyOC/9cp5bWbe47MjXo3aiH+m71q9YS5obsL6qQw8IoUF1WZ3Sr3Y0Ngus9/dlQ3fZS1vq4k6mto4hbSk1+t85gQ7gZifywj8J6cg08VSsTdPCsdzDWteZB+vCBEhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=neQrV2iaP2NqKC32lr3hV0WEINT8b70Kd7vQphEqmVs=;
 b=MZgAGGfr4cQWc8a4TNChXOhgs2fFVZxkPZpCd4TU2rkHS/FV6QhBUdFVYiVWARI2POsGV6bSR2F/ZJhIgGlGd4no2VKlpL0M5KrE0lZ4zmQBh11LbUtC6pAt6yrCMu60dloR6RJnIzBWj56fNuhLMXAIJSfJb455pdkUwqgRQKM=
Received: from CH0P221CA0013.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11c::6)
 by SAWPR19MB997276.namprd19.prod.outlook.com (2603:10b6:806:4e0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Thu, 16 Jul
 2026 14:26:45 +0000
Received: from CH1PEPF0000AD7A.namprd04.prod.outlook.com
 (2603:10b6:610:11c:cafe::3c) by CH0P221CA0013.outlook.office365.com
 (2603:10b6:610:11c::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.12 via Frontend Transport; Thu,
 16 Jul 2026 14:26:44 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH1PEPF0000AD7A.mail.protection.outlook.com (10.167.244.59) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.5
 via Frontend Transport; Thu, 16 Jul 2026 14:26:44 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 0A125406545;
	Thu, 16 Jul 2026 14:26:43 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id E5EB1822545;
	Thu, 16 Jul 2026 14:26:42 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v3 4/4] ASoC: SDCA: Switch to fixup_controls callback for IRQ registration
Date: Thu, 16 Jul 2026 15:26:39 +0100
Message-ID: <20260716142639.2306757-5-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260716142639.2306757-1-ckeepax@opensource.cirrus.com>
References: <20260716142639.2306757-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7A:EE_|SAWPR19MB997276:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9838c2ea-f7c2-4f2e-c064-08dee3464325
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|61400799027|376014|82310400026|36860700016|3023799007|10067099003|16102099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	08392mib6zry11M4+T/A4wBmgsFl1Xf1mM+e9obc+9A+ugHdXOVoV1k7Xj21gGnKK8rEYpnMStfnA+ra2PeSP+FMsbwxexqlBxzrHO4doNjNaJTLD5/Od4WNl2KI9a17Me8wNXfYA1PgRUd5s7ipnuZHo9vklQox9CMx2+sLrO5MNarnehQhqb4t/A2yB8WlqKVT9guQoTREM9ezdQsXY7MxeY/AQZeQ6rL+6fEVetmziG5Q23K/27cKZ9ZgI7d881xljGnCKgccf8a5ibti3zEdA5ckw40HJjNx/vMeXE8flDG44N9GoRCiHKhBtTY3GUORctqWrG9Kr+1Jgdg6oPky7h+QilwAJy75rjLCu/Y6sbGKCSCmuTeKyOyIRxoJJ0+3Yq9Ecxby6YvWhzweTD012+NUc92Viljfkrb0diamycCjw93oYXcvCWbA8mAMf+J2ECsKgJTBQnHgNCuH3IEwzcMbSLyTCpUp20MvxBOU40VSF6TuBPVQSphNy41q61W8hhnAi4v2I/OPgaHIVBClAPCXzA8zSFtOq4R3G60Gl86mIEC1z/FhwSqwT2l+e59gQLgyGhjjjJwns51D1OyNPLLaRhWPgmzroC8gSYCtmRxc/ZqEej/nXjLMGXU6Ik4JE6wkMKrL8aknfKvdVtwK/OwvuXx1rl7ioUfYlq9JM+dv7ai5iW7bHX2+zGUzvIqsspBuEV/krRFpFzsU5Q==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(61400799027)(376014)(82310400026)(36860700016)(3023799007)(10067099003)(16102099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fNRxRzhqjIhQC6kqrpjX6D/RLsvHqToSjEFd1/oyaLixgHSQbC/5KUGPAbZugXfGESO/o8lAuUDTa6TPH4IQAQU6xKc1V1vCzVA9uzk8+wkFd767o9qrOxbd6lfgQ1xqyX2MNJQwy3Hpeoo2YOBqxe7hB2ZnejNiwCF7Hkkt/c3+POOKrBiZKYhoZz+Z/b+ikuhe9j+iVwIYrAlanBqUWrthERHtc1FhPWCTrMwHS1g8K1iCCuc5gKHEyxk2TSmeaahQMSqAYOztkHfzyjzcDADJOkOv3eGHCsRGPq7EUK7L2MYoErj789w1g80hzW3U1N444p5KZPiPplSkdbIjwGXIbnZ6/LEwlio3G/pH0AYGBnhb/X+fQTu/z1pyLprEL9Bff1wlZHcVKl1l5/jYLIo7aa/G+pv0MEL7Tx5B4JnatVEReEj8TYPm9oXRvEiX
X-Exchange-RoutingPolicyChecked:
	sU2xLZmjnK4bvHR/G+zHeKDR628RJ3vYb4z9u3g2OhNKWFBjviO71kO4Hos+gLlkhu8gdTGbAW4Bv2Y1XJcnta9DFFPyDCkkKWrH8FgtjXmXEr3qjRbL7nd52nP7YO1iiyE5fCKVks9uRb8ikGAteWg9mg53MUyD/VT4n0VheIlVCXzMSbYkWmHKOci+cdyVSH7l6mt97Tr/Tm5UltwbA5npNXuXLrKKiW1SD7JqU8bhEQkUAqcHIfzhFNAKJlwhLAmLhNxQMgb49PIEWKGZpFwzoRRx0djU+Oevq01dwpFHOMrIKxpYWwEvdZodi83lncwhpMDPu3tDXehpt+N94A==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 14:26:44.4601
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9838c2ea-f7c2-4f2e-c064-08dee3464325
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH1PEPF0000AD7A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR19MB997276
X-Authority-Analysis: v=2.4 cv=V71NF+ni c=1 sm=1 tr=0 ts=6a58ea2a cx=c_pps
 a=Yy30xeOXBChOadhm8XbUsQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=wSoEbFGUnSHqE_z0LMIA:9
X-Proofpoint-ORIG-GUID: JExYJHoR_ybjXxy12Ej-1GrleV8vf9Fc
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE0OSBTYWx0ZWRfXySxSgJdbH5Le
 JZKF5CnfpB15nbMUbnGz16eXrk6tJbl+uZSI78XoR/+i3iKnwrH/G5x6NpN7/kphmlNllDJamWs
 +YMTK1lq4XeNJHCW3sHL+kQAwZstnMw=
X-Proofpoint-GUID: JExYJHoR_ybjXxy12Ej-1GrleV8vf9Fc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE0OSBTYWx0ZWRfX29h0tqqprTIo
 411xyYiv4cQ60S69G6kcqp/WQ+uAR7fn+817kja8lwz7OePt66Mi49BRuEI4K5ifIkXYh5QsJkA
 +DbYawdt6wPzJR6gKTwipqtrlbVbtsjssUIECgCihGNilmnBjowPfo2oJ/xQ3/jQsLC1ZN/YMqL
 vTzBeyrziywxAl28CtvV9njOfZcp0q2eRqBG3QmJTPOQpMmaHFE1Xjjn8iQogdOMCY5uEDYS5eP
 jbQFkYk9ppnKhPOnc7Vt0EfwDP/EHj2UxXp9XFGSbtLDVeR31aAOxXF3+3guQRCZh0UnrhNosAH
 rwZNApBVw/cL2Cpfm3Y0I/HrBRmJEvsz08tlmgavgk/4f7f+Gmfj1VSh+uYf+OeMj2Y3a1rrPWE
 M0V2CgopNDtmRl7mNt2z4M6K1MF8E2salXJnXsoihyLocY25qUDfitIHvBU8TXNL4jqcFdfWjIY
 3JbjWrpw6Q1vhMZMXLw==
X-Proofpoint-Spam-Reason: safe

Currently there are some race conditions around the boot of SDCA
jack detection. The core creates DAPM widgets/routes quite a
long time before it creates the associated ALSA control, and
the jack detection IRQ is currently registered in component
probe. At the time of component probe, the DAPM widgets exist,
shortly after this the DAPM routes are added. At the time the DAPM
routes are added the register value for the control is checked
and the appropriate path is connected. The existing handling
in the SDCA jack IRQ handles the case the control doesn't exist
and updates the registers directly, which works until the DAPM
routes are added.  After the routes are added the DAPM graph has
already set connected on a particular DAPM path, which will not
be updated until an IRQ is received when the control is present.
Thus those updated are usually not reflected in the resulting
DAPM graph which can lead to the audio path being erroneously
powered on/off.

Switch to the new fixup_controls callback to register the
IRQs, this is guaranteed to run after all the controls have
been created. Which means we can avoid the aforementioned race
condition and as a bonus no longer need to concern ourselves
with a case where the IRQ handler runs and the ALSA control
is unavailable.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v2:
 - Add back bus remove
 - Change the call in bus remove to sdca_irq_cleanup_late()

 sound/soc/sdca/sdca_class_function.c |  6 ++--
 sound/soc/sdca/sdca_jack.c           | 44 ++++++++++++----------------
 2 files changed, 22 insertions(+), 28 deletions(-)

diff --git a/sound/soc/sdca/sdca_class_function.c b/sound/soc/sdca/sdca_class_function.c
index 1496a15f7d2ac..2fb2b043c979c 100644
--- a/sound/soc/sdca/sdca_class_function.c
+++ b/sound/soc/sdca/sdca_class_function.c
@@ -191,7 +191,7 @@ static const struct snd_soc_dai_ops class_function_sdw_ops = {
 	.hw_free	= class_function_sdw_remove_peripheral,
 };
 
-static int class_function_component_probe(struct snd_soc_component *component)
+static int class_function_component_fixup_controls(struct snd_soc_component *component)
 {
 	struct class_function_drv *drv = snd_soc_component_get_drvdata(component);
 	struct sdca_class_drv *core = drv->core;
@@ -217,7 +217,7 @@ static int class_function_set_jack(struct snd_soc_component *component,
 }
 
 static const struct snd_soc_component_driver class_function_component_drv = {
-	.probe			= class_function_component_probe,
+	.fixup_controls		= class_function_component_fixup_controls,
 	.remove			= class_function_component_remove,
 	.endianness		= 1,
 };
@@ -408,7 +408,7 @@ static void class_function_remove(struct auxiliary_device *auxdev)
 {
 	struct class_function_drv *drv = auxiliary_get_drvdata(auxdev);
 
-	sdca_irq_cleanup(drv->dev, drv->function, drv->core->irq_info);
+	sdca_irq_cleanup_late(drv->dev, drv->function, drv->core->irq_info);
 }
 
 static int class_function_runtime_suspend(struct device *dev)
diff --git a/sound/soc/sdca/sdca_jack.c b/sound/soc/sdca/sdca_jack.c
index ae9636622a840..2ac74b9826736 100644
--- a/sound/soc/sdca/sdca_jack.c
+++ b/sound/soc/sdca/sdca_jack.c
@@ -41,6 +41,7 @@ int sdca_jack_process(struct sdca_interrupt *interrupt)
 	struct jack_state *state = interrupt->priv;
 	struct snd_kcontrol *kctl = state->kctl;
 	struct snd_ctl_elem_value *ucontrol __free(kfree) = NULL;
+	struct soc_enum *soc_enum;
 	unsigned int reg, val;
 	int ret;
 
@@ -55,10 +56,12 @@ int sdca_jack_process(struct sdca_interrupt *interrupt)
 			return -ENOMEM;
 
 		kctl = snd_soc_component_get_kcontrol(component, name);
-		if (!kctl)
-			dev_dbg(dev, "control not found: %s\n", name);
-		else
-			state->kctl = kctl;
+		if (!kctl) {
+			dev_err(dev, "control not found: %s\n", name);
+			return -ENODEV;
+		}
+
+		state->kctl = kctl;
 	}
 
 	reg = SDW_SDCA_CTL(interrupt->function->desc->adr, interrupt->entity->id,
@@ -96,30 +99,21 @@ int sdca_jack_process(struct sdca_interrupt *interrupt)
 
 	dev_dbg(dev, "%s: %#x\n", interrupt->name, val);
 
-	if (kctl) {
-		struct soc_enum *soc_enum = (struct soc_enum *)kctl->private_value;
-
-		ucontrol = kzalloc_obj(*ucontrol);
-		if (!ucontrol)
-			return -ENOMEM;
-
-		ucontrol->value.enumerated.item[0] = snd_soc_enum_val_to_item(soc_enum, val);
+	ucontrol = kzalloc_obj(*ucontrol);
+	if (!ucontrol)
+		return -ENOMEM;
 
-		ret = snd_soc_dapm_put_enum_double(kctl, ucontrol);
-		if (ret < 0) {
-			dev_err(dev, "failed to update selected mode: %d\n", ret);
-			return ret;
-		}
+	soc_enum = (struct soc_enum *)kctl->private_value;
+	ucontrol->value.enumerated.item[0] = snd_soc_enum_val_to_item(soc_enum, val);
 
-		snd_ctl_notify(card->snd_card, SNDRV_CTL_EVENT_MASK_VALUE, &kctl->id);
-	} else {
-		ret = regmap_write(interrupt->function_regmap, reg, val);
-		if (ret) {
-			dev_err(dev, "failed to write selected mode: %d\n", ret);
-			return ret;
-		}
+	ret = snd_soc_dapm_put_enum_double(kctl, ucontrol);
+	if (ret < 0) {
+		dev_err(dev, "failed to update selected mode: %d\n", ret);
+		return ret;
 	}
 
+	snd_ctl_notify(card->snd_card, SNDRV_CTL_EVENT_MASK_VALUE, &kctl->id);
+
 	return sdca_jack_report(interrupt);
 }
 EXPORT_SYMBOL_NS_GPL(sdca_jack_process, "SND_SOC_SDCA");
@@ -192,7 +186,7 @@ int sdca_jack_set_jack(struct sdca_interrupt_info *info, struct snd_soc_jack *ja
 		struct sdca_control_range *range;
 		struct jack_state *jack_state;
 
-		if (!interrupt->irq)
+		if (!interrupt->dev)
 			continue;
 
 		switch (SDCA_CTL_TYPE(entity->type, control->sel)) {
-- 
2.47.3

