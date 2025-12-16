Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD76288502;
	Tue, 16 Dec 2025 16:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765903743; cv=fail; b=fqA+hcM+q9GPKiYI+EKFxRR60DQsOcHOyF+9SOFG/8ZfqKlifESPG0Pyc5ecZQbOFG4ECGceoljV3tbwJQ7I7HrNrTtMMWTIUcqu1NkYrbw3bM05dBpI3kaI4t+NO+61hdvpcilw8QXlPC2SC07C4XJdJnXFWhFDgrCkY0zH5r4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765903743; c=relaxed/simple;
	bh=bxE4v/iikYj/Z6B3kmzeskMYazTON9i+6qXWrS1wCg4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FS2i7LQLAudQ9lTGvKUFHWg/UCoiTw+4B9B17D1pIDVFI0XylSG1/aXwHXk9v9NgbzP966Gwk5uZ/YKUlS5mCUOFTuj66W8CugrG2p1U7zOVgSZOhxPsEq4Ghxa2fmwLCfdhi6FIthgAFppxuvhOHY7fbPg58WoZng9XIbrJU9Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=kmAMEhHM; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=cDs9Rsqi; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="kmAMEhHM";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="cDs9Rsqi"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BG18HtS4074181;
	Tue, 16 Dec 2025 10:48:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=vks5qSZD/RJ4FmvCGw8a6sbPTMzSZwcK/x1BbWD9Dyw=; b=
	kmAMEhHMbpDjc67Sqd2h/egJZIOZx1bEbr7d7dgeUkEGGOf/aO3m+/+vfHogtI3z
	kJwqsZfkbu3HUh2hUv7Bp4huKaQvHBR7sMb9uUNZbOhdlOJBCQMxfLY252hx2tKy
	JK1FBktXvWpZC2LI8tJbDb9FPPMI389xS4qCqJE73YZEhioWSgByrrMDKr3wU53E
	NaVpLi1kTDL08k4Xbt3VFjt8AREqTPG2wWIz3wXH0XfQDLDjLErqIRzOwqR/Ra+J
	R7UKlDw9PdamfNrhHsQfhrPsuR0saQBBHPV4UwcVhuCKwIDXm50AQkMdUtyXdsDf
	8supgvNbrQM89n5HuQUREg==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023136.outbound.protection.outlook.com [40.107.201.136])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4b15ejbq12-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 16 Dec 2025 10:48:56 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WlcCV2JAM6D0cb3DXJuVtKzCZZpl2NyL5UhyN26cbLTPqr24vfLp+oWHonPOoCjkPDx88NRY8uRY6EbBIuJaB27iFKnRK/dGuBcAyww4Uw72Y7Nc0VkBp9h+FC7tGw5P4sjr9Y4zhZqYgIAKmY1ZKXSUV9VEDQRautuB4w1AXpEMTnMYOwm4DlWXHbUW03wzEyGr8Kj3Su1UfOChjXsGjgzK/1QERAEdDLA70Fh8w3sZC20t0CMrmu/T5+1YKpmHN6J8DsWeywRa+N3TQAxaTU/YxUpPQrbo004RTBiK3spmNjcISn/1lYRD4bOM8nYykx8wP66VGOBH2it+qT3EiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vks5qSZD/RJ4FmvCGw8a6sbPTMzSZwcK/x1BbWD9Dyw=;
 b=wrN4IVcMERVYols7Potb1yzVIjVuLLRtMOdH3BV5GcC7+Jc7q4e4jTo2/QYEUSldNHHSdqneiUpH9pE8p9pqJTmuylXkFLap+NcgYwjdpEF0/6jUmcDeNRGWo07tKQIfahKzdGfMJ5gjhS/ESDd1ldMN/6/fZlqxTkjUkz2fnqrWJXEyQj/p9cYu1CjRoWoKVCbbkpvwZVsloHPuFoIIPXGq72JmTsLUAsJNtRcmqpMqTM7x8hOfy798RY67seOJQiSqvvRefL01NUG3cugHvsswNYRaExNy7VscFH/+PqdLSxuAO3xvn/kP7XzD2mIB7EBstakGQeSBIrg0EaXjBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vks5qSZD/RJ4FmvCGw8a6sbPTMzSZwcK/x1BbWD9Dyw=;
 b=cDs9Rsqi92Aa0+7tVwYTG0J3lSrp410iQenT3NJAVvNoSvmKCPuXH7wfZ1DABr5DuiO5noB7MMsYpeaaoontFlrELE8NnOCaAN1JIlXdCCWQaTY2RQeVnoE4mh2FufRy/jMNt7OJcx7hroqlDCgLEChXmpgF4lYqeU+MtFmWQ/4=
Received: from SJ0PR03CA0225.namprd03.prod.outlook.com (2603:10b6:a03:39f::20)
 by DM3PPF31546F867.namprd19.prod.outlook.com (2603:10b6:f:fc00::715) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.12; Tue, 16 Dec
 2025 16:48:48 +0000
Received: from SJ5PEPF000001CD.namprd05.prod.outlook.com
 (2603:10b6:a03:39f:cafe::2e) by SJ0PR03CA0225.outlook.office365.com
 (2603:10b6:a03:39f::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Tue,
 16 Dec 2025 16:48:47 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001CD.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6
 via Frontend Transport; Tue, 16 Dec 2025 16:48:47 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id B984E406542;
	Tue, 16 Dec 2025 16:48:45 +0000 (UTC)
Received: from lonswws02.ad.cirrus.com (lonswws02.ad.cirrus.com [198.90.188.42])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 31941822544;
	Tue, 16 Dec 2025 16:48:45 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PATCH v1 1/2] ALSA: hda/realtek: Add support for HP Trekker Laptop
Date: Tue, 16 Dec 2025 16:48:12 +0000
Message-ID: <20251216164830.832148-2-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251216164830.832148-1-sbinding@opensource.cirrus.com>
References: <20251216164830.832148-1-sbinding@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CD:EE_|DM3PPF31546F867:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 26ef2017-9082-41e4-e3d6-08de3cc2fbde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2fmpDU8AQ0CSCmlQHJcZdIlmzSGyZFtEqDO3dQSlPZz1fcInNokD+kENJXg8?=
 =?us-ascii?Q?C28kqcr2DDBpfVGTjBzeOEekuHfp8TQSarcI88/SMbjC7OHpl2OQNM7DmBc+?=
 =?us-ascii?Q?QN9ha1mM1CAL4Gl88yfbLnmOEFtliwupEq/75elxDdkObhoq67uo1Wek7g1l?=
 =?us-ascii?Q?QZ8Tatocoo59t56+OWRYoGhuckiQ7js473LyDgrQ+kgqApuB44AoGMWvQ3Vw?=
 =?us-ascii?Q?zAYAKSpFmZ/sO3hdizWen1PbPRvxFq0ulC1Fjh24GN7fWQJrHBrbswZj3vxA?=
 =?us-ascii?Q?Yv1TNpKsI7k38EErKrw2eDa0E8quSD37Hx7BQFqmW9qOC3egowliD1HHu3Mf?=
 =?us-ascii?Q?jaI245tbxQc7pZKpsz2uvwlqRBXTM7T3/Tz/EJfcscnnN8GBUXP9i/dHBwon?=
 =?us-ascii?Q?gpHK7A9yycc6TRfjToP12qVzlL0ePFdfDS8ffHkyr+19P7W3dgAnsKAuj8zm?=
 =?us-ascii?Q?ytDBd2nKtR3wBPansAc1Tg/rU2wRB+7kMytw9sb8eG7BesbmFMQcsZepJgh3?=
 =?us-ascii?Q?9nzYftKJIkRfpfyQtJm1D2DYZT/EkHYgP0dz9RmNF67fMeBNzarbZ1uMP7m0?=
 =?us-ascii?Q?tHa+OozSmHC3GoViY1sSFoYzsu9bq+mQcZc6vCs0v8v3EfkQmKiVmnHxzAdN?=
 =?us-ascii?Q?f/sCenZtgwjTIvGvIZY/Hk8VH+8MipbrTSrl57DLl73Wh4UFy7ea5/Eo7/pH?=
 =?us-ascii?Q?y/EuEbFz2jhBsx2kCvp8MwqTQuVfEX+1X/EhilpZx8HFyiCiaD63D/Apu/Zu?=
 =?us-ascii?Q?knmrUuSD7X48iadC0redNTzctQJ2oDn70m/tcDLU/E7/RIKIOluI+R4fjbI3?=
 =?us-ascii?Q?ZmNxQf0zg2KZMpXyfnL/ygwJZ3NEQlHr+l0NYF9nRgS8q/7nk2neuetVqbZM?=
 =?us-ascii?Q?TeTlifsuP1c7gyMY7vnZHtHjypRtYaHFSbOZbAMM1xERdCsua2Fk+Vxm470Z?=
 =?us-ascii?Q?icGEowxFOGZnY9QZ1/TE62MY4oGFBZB4MgM9wuLHCf4Mt/Odc39ehMTzlznO?=
 =?us-ascii?Q?ICS0DYOTErx1sOTwYD+thfUUw+MNUOl+mRO7A94lB+3IxYcHzm17mXD2S7qz?=
 =?us-ascii?Q?XW/gyJNtl+KrBTLSoZlt3Z13uw4aTnLBBNZ1XSGNNlXBd3Eq97vKGokPQAlK?=
 =?us-ascii?Q?qTFwP/UBYvy9wvc2q4NGkSUWyX4HxIkz1EQYyYvinynXRc/GgaKix03r/9DU?=
 =?us-ascii?Q?zh/2O6JAWY2s0u/tJMwvg+k5rrVsS5T7r3AC/fADfLyhxzyIP5AFJSUNQhXb?=
 =?us-ascii?Q?NOro7KhdWfokoIFFfRTBG7QUK5YhQXr6nwWXzmuxGnNVpwAR/Sghst29vQkT?=
 =?us-ascii?Q?dF1Oo41ilOloJmK7uhY0IIh/Sf6JZbwYQ2Kj29J+NDNRoCiUn10H/Rtepsnk?=
 =?us-ascii?Q?W/mRliWsGMDFmyr4ztofLUsNzDU51UqMY7kmJWWOqiCquX+QYZL3e0wDmbFC?=
 =?us-ascii?Q?u3pykS+kaA7VwxhzpXsdFjCapRr3fuIWeW/TkjEjbxw2aFKa8OAq6Ias/tTY?=
 =?us-ascii?Q?lxDD47+Ija0esd+txGrgvmMxVaQJFSTnn7Iwh/CjB6g6db1He0sDAe4RbZu0?=
 =?us-ascii?Q?AbzSPWGFxAW4Ud+FZVE=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 16:48:47.6782
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26ef2017-9082-41e4-e3d6-08de3cc2fbde
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF000001CD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF31546F867
X-Authority-Analysis: v=2.4 cv=ZZUQ98VA c=1 sm=1 tr=0 ts=69418d78 cx=c_pps
 a=Ec8ZIgkrxK8GE6F7YKoxaA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=2lyKzjhrc2nKIjESmZUA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDE0NCBTYWx0ZWRfX9S2hgQDDB09S
 R9rukAW1euAntisXKcpDqK8XqeWaThdxT+GSSI0V4AEa5joikwlHFJTqkYVV8n9v1fGL4qSo8jV
 /ycbTa8X0fopW0Z2/8UCzGDZXXGjpXNluOi18OEB+Nqa3q02BOfU4erU+ohlS6A6RHzZLo+AK5H
 zi6+eu00WLXNaKhIdwOJT24yeI6E8ipx26HHBB5E8jLWrQWabQJHCfcxBB/294VcU8JqztwIkM0
 BHA9bwt0Y7yrBycHWShlVtSgfocLSY61a/qQ4T2Xp8DsMTqXZDAcQfUVf8yKSvIsOY5j0fQLShD
 PZZiHcyTjAWd0F0Pvr2EPUgPWKBu3Gj3Pz2K3wZxlHkvC1qeGPL3XK4CWdKV42lFlW4rn2tN+1r
 tl9hi0j0sWyGGikMoaCa+xE7LT9ggg==
X-Proofpoint-ORIG-GUID: qnemfkr2pt4nGWKImOYLBs9laVtfVisz
X-Proofpoint-GUID: qnemfkr2pt4nGWKImOYLBs9laVtfVisz
X-Proofpoint-Spam-Reason: safe

Laptops use 2 CS35L41 Amps with HDA, using Internal boost, with I2C

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index c8a9b9b15cb4..ec57c075757c 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -6795,6 +6795,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8f40, "HP ZBook 8 G2a 14", ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x8f41, "HP ZBook 8 G2a 16", ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x8f42, "HP ZBook 8 G2a 14W", ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED),
+	SND_PCI_QUIRK(0x103c, 0x8f57, "HP Trekker G7JC", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8f62, "HP ZBook 8 G2a 16W", ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED),
 	SND_PCI_QUIRK(0x1043, 0x1032, "ASUS VivoBook X513EA", ALC256_FIXUP_ASUS_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1043, 0x1034, "ASUS GU605C", ALC285_FIXUP_ASUS_GU605_SPI_SPEAKER2_TO_DAC1),
-- 
2.43.0

