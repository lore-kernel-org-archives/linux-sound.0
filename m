Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B22B455173
	for <linux-sound@vger.kernel.org>; Mon,  7 Sep 2026 10:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788775264; cv=fail; b=uJpoOGoI9vUibGY6BZpztUueinzEJv0fPhiwdrxkR3kheRprWCQKyLB/SqcVRXUZi3rZ0KsmkmE07bX1+74p5sKjEs7DpuyX9MQbwpJaw83agoutnK+OarsD4oQvwZNY/iwQttCgpVH2KV41eq9ODipmxKfhj5P8JYBR8/nrSTc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788775264; c=relaxed/simple;
	bh=61BjmdjiL7/1r1C74khpsyGbMbAWRCho5w0gXXDGiZ4=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type; b=GWFwoKJ09zy2vZ+kQSoHic0rri5kjpiV9O/jLpKkWPS8Ht2wnpwoEqmrrmeOs4i05jqYa4hiLMnC4wGZ3ZXkJm8TmdN+AgxvvDEzTV3z9IPOpt3kz25wUVUyjzUfvBmhuJtoL0ATphbpbi0Bg5ij60/zwH+scTXTvGVKXyO8An0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=RglSSe00; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=PU/yRj4u; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="RglSSe00";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="PU/yRj4u"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6873fvNS1040447;
	Mon, 7 Sep 2026 05:00:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=uGtvsQHJLZpoQWhpvUrk9lb0qdAdUq7VKE02JAe55B8=; b=
	RglSSe00wLgMYaywIXNlbJ2rFffV5kl5qSZDyDf8L7cAcosxw1vJDx6FtT+nheUh
	JO44dwtqlWO/0Yese/9yq6Cu9Mya2dl54bAbB6W757duiJ3ryvZVf9Nv6OUVKzEl
	mPoMrNJAeyJPsbK3FtaQ0GJoe9+wizdVszlQ/Mx6MncS+bCgCywIjimq1eeNRotN
	uUMbr2ri4M6bk8CvXYr138TT/umxwhpI38lPb9O9MTNlakCWD2j7MzpaDNXMN0l5
	Nsz7VDunFSXCthqV1u2/fzgnCT6gEBWt8A57WpkBQW5+ahobADIb6DIUVUi+a2oi
	OnnLWqdG7mx8az7EAj3oqg==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022129.outbound.protection.outlook.com [40.107.200.129])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4gggfwhvdy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 07 Sep 2026 05:00:40 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dw0iGd9mAvalX8gSuz27yFqhbIvSwRNEA+bbnWMagVmyG/5cApWjxJD3vGY7IY8BnuRMCOrxbzBH4yUJ3lH8+j1+rfJDsaxX0WavrxLFbmetx5bxTUcvuAm0YRnr5vsceZn4lWnH4XgVkunK0ufH11nyZ/J2bor0WhT/pB4wkQnIs3o8lQ9bp/jH5M6w/U2qn+YPUhxk8nPeHTEaaAqnWqcXwKVQIdKdhGXFSsXavdHwtulQc9K+F2zKW5uV6N106tgBoZXmc5Qp1RjEXg/nlauwRxpMEHoYpZxpzl4jK9yXQwP79yOaMZBkwmBuKGtFNk6eGrFWfHx22sL8kZo3vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uGtvsQHJLZpoQWhpvUrk9lb0qdAdUq7VKE02JAe55B8=;
 b=KkWbEddcVEQfLduvF704MPnm3A9CP//gxHvfMy3S03Hj1zWIR5WFlz1w7nJiRx5J7m2NzsIbGifR2K0W60hdhi1lr7yMV8bgud4LNboafYKHEP3QPNlxrmug5QWkTeUXB80Yuz1kaasAHI7Vk/aYkc+e73L14Bv7JeG5BAL8ZxD6J6YE4xM6DRyGcm0uk70+8UJxcrR1fiMJLNLhyWrU+kXHRsOWJoM0WCpMdcrZ/51LrSqaPiYQBXkvaSIzDet6uoLkrtWAPZW2o/Z3NdFDjJAT6UzgxvrbwQYnfVls4FHBkbehkCbnSg2VaqSmOxssVqPzKgsakE1ZnEXmgjcIcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uGtvsQHJLZpoQWhpvUrk9lb0qdAdUq7VKE02JAe55B8=;
 b=PU/yRj4uNDJWikoYUcKwyjAGnxNYPGrCUOeXjKiPe5nGKlMbVl2Vf2p3zadngrMRauQALloR+pf5T3wNlw28ybzhkkBGefCN9DevqIEONHSsKUcL5H03/wsGPMEelUVIVbrWHW1xyhthEf3CaP+M9K1pUazPTas1JajOrIPui5k=
Received: from CH0PR03CA0033.namprd03.prod.outlook.com (2603:10b6:610:b3::8)
 by DS4PPF23AFB5C06.namprd19.prod.outlook.com (2603:10b6:f:fc00::a14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 10:00:35 +0000
Received: from BN2PEPF0000A805.namprd02.prod.outlook.com
 (2603:10b6:610:b3:cafe::29) by CH0PR03CA0033.outlook.office365.com
 (2603:10b6:610:b3::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Mon, 7
 Sep 2026 10:00:34 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF0000A805.mail.protection.outlook.com (10.167.245.169) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.5
 via Frontend Transport; Mon, 7 Sep 2026 10:00:34 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D6910406543;
	Mon,  7 Sep 2026 10:00:32 +0000 (UTC)
Received: from LONNCK4V044 (LONNCK4V044.ad.cirrus.com [198.61.68.151])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id AC165820247;
	Mon,  7 Sep 2026 10:00:32 +0000 (UTC)
From: "Stefan Binding \(Opensource\)" <sbinding@opensource.cirrus.com>
To: "'KM.Plass'" <kmplass@pm.me>, <linux-sound@vger.kernel.org>
Cc: <tiwai@suse.de>, <patches@opensource.cirrus.com>
References: <e93b780f-2989-4353-9316-71df451f7da7@pm.me>
In-Reply-To: <e93b780f-2989-4353-9316-71df451f7da7@pm.me>
Subject: RE: BUG] cs35l41-hda: OTP_BOOT_DONE timeout / I2C lost arbitration persists independent of bus speed (Lenovo Legion Slim 7 16APH8, BIOS M1CN48WW)
Date: Mon, 7 Sep 2026 11:00:32 +0100
Message-ID: <012001dd3eaf$b89515c0$29bf4140$@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQFys7Q5AwpYcGwLEgDlmPtr2Vat8beX98Og
Content-Language: en-gb
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A805:EE_|DS4PPF23AFB5C06:EE_
X-MS-Office365-Filtering-Correlation-Id: e11facd4-9434-422e-3b9c-08df0cc6dc1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700016|376014|82310400026|23010399003|34020700016|13003099007|6133799003|3023799007|10067099003|56012099006|5023799004|11063799006|22082099003|16102099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	7tP0medbX9+Jp8qPtYqv/ibg99zfe6d0kucTf4xKHYqOkrxrmyiXzHI+1FOdPhas9KEn9B6pflydOrSyRfehTeyh1NyLvEL+A3bcFqSRSdLN65q2G5/gQIc0G+bsuc/jfk63GRkaM4xH3WH7aD57pysN3vBExSkqShUeW/HGjm+Qi1jgEn1uv9ffmTHYdzHYoClGp3pZk0Kx5hwsaSNRUT5YXS3sFingz961drQrOSuJsKxHf+pub0KpYZjigoNcVIAT75Eu+q6UZK9gmO5Mon/lvxEIwN3LLGEcOT2IfMLSrjtTdttezQnkAST75z9R+DACPNbwnwS43/qEaKf6SR2cT2gM3wMuA1AwQaEHFzf79aklDz+qpHV1374KEtOT15u7zWdzZl/aZDzxCdUcmgPA4RZZz7ABCRCMauNWSuG0gPtgCEoF/3HWg1x8IfXL0Husmjt+iEC643ZQBgIeLLwnGrcSC8lrOUfVkegCKbCqyZSP15iSIS9N8XVViuxDOfTECHC9i8LPEmsNQxqh/iWZbbTavMDOX/UQwpo1GSuYh5oKe9agcD32Bt4oFhH4pFB+a4NVejP5kYSBbJzFl3CPy3GLmcjoR027xMHrUdJIQhZub0MGg3cw4usRRm6foHu8NMFOIaYC9Q5dnBjnTA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700016)(376014)(82310400026)(23010399003)(34020700016)(13003099007)(6133799003)(3023799007)(10067099003)(56012099006)(5023799004)(11063799006)(22082099003)(16102099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Y4vxkHL0yhGdrWdU3Tbna+urmaNmy6WYgkkiNJAx1UJTyEYDpWfmPZkc/wnONCxvk1JomKS7miT5Zt/mV9CAUUoVfNYn7FQXUJNCJtGdGa7BFIM8RAbzVWZyRCd7ZCkZtXMRfCZ2v5NDSBGLOg11ZPhoBF1v0+3EqkE1Ht2iK5JYcDPnYBs7nWo7xQdR2qbkdQlzT72IfmlGEPTSzZ6meapclAITyuZhsQhx9vlfMmSC8N0+V+mx8Jg5Z47mUm6Pmz0cxcoH1Vi5zPD9n826RR0DQeuOtXOoSTXx+UyFz5wgYerw8arZsdRQnZDyr83O72wNUTsTaDg803DvQUCcWA9L3mrAuWeqjvzWA1MF05SRr4wF1ZgWOpEc1YI+8WvEjJ1IlS/aUNiEKDPhrURLs6Zc/XZyrro7y4dwoA7OWAupe4VBu4dehk8zra3GUq0J
X-Exchange-RoutingPolicyChecked:
	jCTNw9itCB6w0C5vMM60YZcbsChceKQNM3TQqlgkGMq5Dvr/RGej/xPYeCXuBSCH9bd1dp1fbyICVFiZA2L3iaX989yfPtHw0LX5bPzJ34UdreM5bHYAkwYfN5g3v6tmVYvu8XQRodX0s/JBLXicIzwghLsKJSNPgRmFG60ATgvqkd2QiaYeVVLTYJAJYXS8ls7/vXpBTTm0Ol+wtxLWoSHXd/dOgRG986jvjP5WoeaYd28I6YORARzoJ4q4KLB819/XQiFIzTlOpa3dMMValuqgXB8MkhyQql+ykdcqNc25KdnrA009XhgyEgrepaGRgiLZuYgB464MHPTIEPxV2g==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 10:00:34.3529
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e11facd4-9434-422e-3b9c-08df0cc6dc1a
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF0000A805.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF23AFB5C06
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEwOSBTYWx0ZWRfXzjOtsNEt/LDS
 pEuLBFZWiEK8EdLkXlOZtFebqPnf+r92egqeRoZaakP6b4yR453Bx8lV8/jvEObc7swWUhPQVOv
 X+mCowfU7K5ww1WZjpkkuHXDfCt8cFc=
X-Proofpoint-ORIG-GUID: WqFQ26z5doPkT7ca5vTBoKKq44QshZb5
X-Proofpoint-GUID: WqFQ26z5doPkT7ca5vTBoKKq44QshZb5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEwOSBTYWx0ZWRfX/Uy+Bravbpn3
 MlZk/O9XDZBUZuqxA049VxerLZHtvFAOp0ubRcUkGonqrAVwt6gJe0XOwKNuBM+wj21GhNUcNuK
 0vGxFvft460eXkgqUtuVAwz/jkK+0EfaZt0twID1QyZIyeEiQ/+Y+7sayujjq55z/EB3PWhMfkq
 Koj1Hs3UnduX3Rh6ZzJygL9OSRohhUGcMg4pttaXCoBNrQjVeyvYbwBVi5m9jwDAyqQWcJcecEi
 I6TZdo0fmTuPRkkXrmhBYG8s/z3f8Byo60G0h7QlGaYX8J2jQEl8HqcVw75w30wg/q30Q1TPhtK
 GvXmeGQYdho8/U6cUoNOvsridY9I9nZuguLdUfJyqoFw8c7g4xlPPEen73OC1M9aB7plqC+AcJo
 GFP8neeWGTltDhPwGA78+ZJaq/J4XQKPDNcuu2ccTLk6riVk3WwyOAgcBntA4UnVqOohUhyK0AE
 IhteA0MYO1T7hh3mGmw==
X-Authority-Analysis: v=2.4 cv=fK4JG5ae c=1 sm=1 tr=0 ts=6a9e8b48 cx=c_pps
 a=qarI89rSqn+7JjoOq/Qxcw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=VwQbUJbxAAAA:8 a=q3BuFKFLAAAA:8 a=w1d2syhTAAAA:8 a=OuFyQsNlvgJ2J24q6RQA:9
 a=QEXdDO2ut3YA:10 a=O6bLEc4LrUH1DrlkqwND:22
X-Proofpoint-Spam-Reason: safe

Hi,

Please create a bugzilla ticket at the below address and CC Cirrus =
Patches (patches@opensource.cirrus.com) to it, we will investigate the =
issue as soon as we can.

https://bugzilla.kernel.org/

Please attach an acpi dump and dmesg to the ticket.

Creating a public Bugzilla allows others with the same laptop to find =
relevant information pertaining to this issue.

Thanks,

Stefan

> -----Original Message-----
> From: KM.Plass <kmplass@pm.me>
> Sent: Sunday, September 6, 2026 10:17 PM
> To: linux-sound@vger.kernel.org
> Cc: sbinding@opensource.cirrus.com; tiwai@suse.de
> Subject: BUG] cs35l41-hda: OTP_BOOT_DONE timeout / I2C lost =
arbitration
> persists independent of bus speed (Lenovo Legion Slim 7 16APH8, BIOS
> M1CN48WW)
>=20
> Hi there.
>=20
> System information
> Machine: Lenovo Legion Slim 7 16APH8 (82Y4), AMD Ryzen 7 7840HS BIOS
> version: M1CN48WW
> Kernel: 7.0.0-31-generic (Ubuntu)
> ACPI subsystem ID reported by driver: 17AA38B7 Audio codec: =
cs35l41-hda
> (I2C, ACPI HID "CSC3551"), 2 amplifiers at I2C addresses 0x40 and 0x41 =
on
> _SB.I2CD (i2c-designware controller instance
> AMDI0010:03)
> Symptom
>=20
> Both amplifier instances fail probe with:
>=20
> cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: Failed waiting for
> OTP_BOOT_DONE cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: probe with
> driver cs35l41-hda failed with error -11 cs35l41-hda =
i2c-CSC3551:00-cs35l41-
> hda.1: Failed waiting for OTP_BOOT_DONE cs35l41-hda i2c-CSC3551:00-
> cs35l41-hda.1: probe with driver cs35l41-hda failed with error -11
>=20
> occurring at the exact same timestamps as:
>=20
> i2c_designware AMDI0010:03: i2c_dw_handle_tx_abort: lost arbitration
>=20
> (repeated ~30 times within a few milliseconds, matching the probe =
attempts).
>=20
> Internal speakers remain silent; headphones and Bluetooth audio work
> normally, isolating the problem to the internal CS35L41 amplifiers.
>=20
> Background: a known fix for this exact SSID does not resolve the issue =
on this
> BIOS revision
>=20
> A community-documented DSDT workaround exists for this exact model and
> subsystem ID (17AA38B7) on an earlier BIOS revision (M1CN42WW):
> lowering the I2C bus speed for both amplifiers from 1 MHz to 400 kHz =
in the
> DSDT resolves the "lost arbitration" failure there. Reference:
> https://forum.garudalinux.org/t/fix-lenovo-legion-slim-7-16aph8-82y4-
> silent-speakers-on-linux-cs35l41-at-400-khz/48722
>=20
> On BIOS M1CN48WW this fix does NOT resolve the issue. I tested all of =
the
> following I2C bus speeds by patching the DSDT (I2cSerialBusV2 =
resources for
> both 0x40 and 0x41 on _SB.I2CD) and loading the modified table via the
> kernel's initrd ACPI table-upgrade mechanism (confirmed successfully =
loaded
> via ACPI: DSDT ACPI table found in initrd,
> CONFIG_ACPI_TABLE_UPGRADE=3Dy):
>=20
> 1 MHz (0x000F4240) - original firmware value - fails
> 400 kHz (0x00061A80) - matches the published M1CN42WW fix - fails
> identically
> 100 kHz (0x000186A0) - the speed the i2c-designware driver itself =
already
> force-downgrades AMDI0010:00 to, logged as "known not-working"
> at 400 kHz on that other bus instance - fails identically
>=20
> All three speeds produce the exact same "lost arbitration" and "Failed =
waiting
> for OTP_BOOT_DONE" errors at the same point in boot. This strongly =
suggests
> I2C clock speed is not the (sole) root cause on this particular =
BIOS/board
> revision.
>=20
> Kernel-side configuration checked
>=20
> The cs35l41_hda_property.c table entry for this SSID appears correct:
>=20
> { "17AA38B7", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, =
1, -1,
> 0, 0, 0 },
>=20
> reset_gpio_index =3D 0 correctly maps to the only GpioIo resource with
> IoRestrictionOutputOnly (ACPI pin 0x0082) among the GPIO resources
> appended to the device's _CRS (the SPK1 device has no _DSD at all; =
full _CRS
> excerpt below).
>=20
> /sys/kernel/debug/gpio confirms this pin (#130) has already been =
claimed as
> an output by some consumer (shown as output with state low), so GPIO
> acquisition itself does not appear to be failing. dmesg contains no =
"Unable to
> get" / gpiod error messages related to this device or HID.
>=20
> I was not able to determine, from userspace logs alone, whether the =
reset line
> is toggled with correct timing relative to the first I2C transaction =
(assertion
> duration / settle time before the driver attempts to talk to the amp) =
- this
> would require kernel-side GPIO tracing or a hardware logic analyzer, =
which I
> don't have access to.
>=20
> Relevant ACPI _CRS excerpt (Device SPK1, decompiled DSDT) Method =
(_CRS,
> 0, NotSerialized) {
>      Name (IBUF, ResourceTemplate ()
>      {
>          I2cSerialBusV2 (0x0040, ControllerInitiated, 0x000F4240,
>              AddressingMode7Bit, "\_SB.I2CD", 0x00, ResourceConsumer, =
,
> Exclusive, )
>          I2cSerialBusV2 (0x0041, ControllerInitiated, 0x000F4240,
>              AddressingMode7Bit, "\_SB.I2CD", 0x00, ResourceConsumer, =
,
> Exclusive, )
>      })
>      Return (ConcatenateResTemplate (IBUF, GPIA)) }
>=20
> Name (GPIA, ResourceTemplate ()
> {
>      GpioIo (Exclusive, PullNone, 0x0000, 0x0000, =
IoRestrictionOutputOnly,
>          "\_SB.GPIO", 0x00, ResourceConsumer, , ) { 0x0082 }
>      GpioIo (Exclusive, PullNone, 0x0000, 0x0000, =
IoRestrictionInputOnly,
>          "\_SB.GPIO", 0x00, ResourceConsumer, , ) { 0x0055 }
>      GpioIo (Shared, PullUp, 0x0064, 0x0000, IoRestrictionInputOnly,
>          "\_SB.GPIO", 0x00, ResourceConsumer, , ) { 0x005A }
>      GpioInt (Edge, ActiveLow, Shared, PullNone, 0x0064,
>          "\_SB.GPIO", 0x00, ResourceConsumer, , ) { 0x005A }
> })
> Attachments to include when submitting
> Full dmesg output from a boot with the original (1 MHz) DSDT Full =
dmesg
> output from a boot with the 400 kHz DSDT test Full dmesg output from a =
boot
> with the 100 kHz DSDT test Full decompiled DSDT (iasl -d dsdt.aml) or =
at least
> the complete SPK1 device block plus the _SB.I2CD scope Question for
> maintainers
>=20
> Is there a known timing/sequencing difference for CS35L41 reset =
handling on
> M1CN48WW (or in general for this board's GPIO controller / AMDI0010
> revision) that could cause "lost arbitration" independent of I2C clock =
speed?
> Could this point to an incorrect reset assertion duration or settle =
time rather
> than clock speed, and if so, is this adjustable from DSDT/userspace, =
or would
> it require a driver change (e.g. an additional delay after deasserting =
reset
> before the first OTP_BOOT_DONE poll)?
>=20
> Happy to provide any additional logs, test patches, or run further =
tests on this
> hardware.
>=20
> BTW: I'm not into computing, just tried to solve that problem using =
Claude.
>=20


