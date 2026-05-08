Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8973F9F39
	for <linux-sound@vger.kernel.org>; Fri,  8 May 2026 15:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778253399; cv=fail; b=mQhe/tZeSThna434PfpDjRVCscrF1NH6FlT32SgCUdBNCwjvpFVJqznEOTpVAS1LWHeiOp9oZ7Ufocl7kq+BlN5oZAYuna444b5PnaWPEnQP8dinVuDpqoXcEDiDeaGo44WCcdnHuHa8J4ZiLmlWzoiqEU9YpGVNoYRw9KDBJFM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778253399; c=relaxed/simple;
	bh=fIKg5Wk8el8mVLH59MpuvJTzxrEVykXXAj4lnLXAKdU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h5fBMNicJoq+Ph9tFWtRKXEIkdPCs+EolY71R+wxp7JDgp0Do7xcJXQMDn3uXXK61WXDxfxRncaq2ezzF8qdTY4p/es8EeUFx9IYdgYwzyD9B+9c245NywesskoMmshG0EA5Zhe46B71HoEUiGosbEQ7lhSrZHDE/KTznzNsrvw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ay8AFTBe; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=mO92UyyS; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="ay8AFTBe";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="mO92UyyS"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64859vfj712816;
	Fri, 8 May 2026 10:16:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=vuwzAevJMwQegteTqZ
	bbVQBpMwssbds6FW19Ahbwn2Q=; b=ay8AFTBeTS9l8v22xG8rNf6aMOIOtxpIMP
	YIK+2KDUejQRYvXnPxdc7jLzWv5AQsWg+gh9/6CwMIk+3KWia7F1tTy/vRfluahq
	hjHH72K3ggECGA47yc3I283tgRogS6c/HBNyNJNVrJC207vHaWdSKJ5PFhIH68i/
	gO7H3Bg1Yv4wkRlQQ5kGarNEU82HSQFeNkJyftOWOaCCCQgjeC/yUzOJHhicbhZe
	NL+Le+bfPSckyI+yYe13bMIfr8UvIB60THwdzGGh+Z/PspPKzwX5UCrvY+cRGKr6
	k3Mql6Zgl/M3AKNNNes+glZXsOoUOZ504wKnbvXbMACiMxNAnW9g==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11023107.outbound.protection.outlook.com [40.93.196.107])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4e0upb9vt4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 08 May 2026 10:16:25 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jtSv2bcNTiCBcYwJ2KlmS8+dPMQ51PvE17uhk8f/CMpbeTDHHO8Rc/1a2cr67AffcKkqjfjh+uoWgMaNfu+iQjJ9Q3R3ak23O3u2Mlosvk+rtQVVbob23JQe7CrxiK8xXplTGIS0hw6Fw5TCIyadKdTxDOp7ErS8L7c+JObqYkUbRaG6zPHP+DnFiNK9xToeAZxYSZS+oa1vAlyf3WOdH5TUCrOqnNHxqMQ9W1pTYTsfyfElvs2IgVyaGpQW3AsVLjLKyOiM7isU1G1NC1YqYU6DJJRkFBdzpSq+tomUrb2/VlEtFI8aKYZkLYzgh47wvY5igFx9rOR9j66hsl+1qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vuwzAevJMwQegteTqZbbVQBpMwssbds6FW19Ahbwn2Q=;
 b=LljMRElV7VSFiiJPKgsrjIg+CpERv2n5Kh6Es4scRgyyCd84MlXHpioz/PG0Nw14gv9ToDypzoiKpRnoBFOUH5BAmS1gr4x1wdwe8UmFEluk/dHGge2M56YdOTqUd6nyhmQ0sOyT9c4J4GQZ4/vauhhzYvQ82PSt0y+63CzqzfbUd+wWsQk0jch7bGOWXKg1nN1a1y0veYJLMLxtng+G3xkd23cJKq/kpJhVwbskcNoe1gEXIPP8dBEe99667kG1zutVgkOYSStzPPUpRyP7PL+1Us2wNcBWj/QBXJkp9bs9otRW2tdMQ5Bi6EcB+YfG0MtOMu2w9D31HPyLcS43yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vuwzAevJMwQegteTqZbbVQBpMwssbds6FW19Ahbwn2Q=;
 b=mO92UyySmRaNiXVkISRHRXnltzls52zCYVzI7nnWbZukvG5ugKkmI/1kiwJ/ooaK2kpmxH8ggfTAdkju8hofZOUvVK6+BXuQyAolKaRXWlFDftONDB/3NthQlkb8cXvjJzdslVtOKvH5UNzkXHKROdUW9cxymC5sodTxtv7zHy0=
Received: from BLAP220CA0007.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:32c::12)
 by LV3PR19MB8256.namprd19.prod.outlook.com (2603:10b6:408:1a5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Fri, 8 May
 2026 15:16:22 +0000
Received: from MN1PEPF0000ECD5.namprd02.prod.outlook.com
 (2603:10b6:208:32c:cafe::bd) by BLAP220CA0007.outlook.office365.com
 (2603:10b6:208:32c::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.19 via Frontend Transport; Fri,
 8 May 2026 15:16:22 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MN1PEPF0000ECD5.mail.protection.outlook.com (10.167.242.133) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Fri, 8 May 2026 15:16:21 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 955BA40654F;
	Fri,  8 May 2026 15:16:20 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 7304B82024A;
	Fri,  8 May 2026 15:16:20 +0000 (UTC)
Date: Fri, 8 May 2026 16:16:19 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Tobias Bachmann <tobac@mailbox.org>
Cc: linux-sound@vger.kernel.org, Richard Fitzgerald <rf@opensource.cirrus.com>,
        David Rhodes <david.rhodes@cirrus.com>, patches@opensource.cirrus.com,
        Mark Brown <broonie@kernel.org>
Subject: Re: ASoC: cs42l43: SDCA reattach timeout on Dell XPS 14 Panther
 Lake; chip stuck across distros and kernels; worked initially; still working
 at hardware level
Message-ID: <af3+Q1jx7z5tL+Yn@opensource.cirrus.com>
References: <cLVwl4lrR76pLtv8VxMSaA@mailbox.org>
 <5QsknC2RSUiRut94Zp-HMw@mailbox.org>
 <af2hpsMI1N6NDQG5@opensource.cirrus.com>
 <K3WbtGOFTfOCSdq0caVYzA@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <K3WbtGOFTfOCSdq0caVYzA@mailbox.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD5:EE_|LV3PR19MB8256:EE_
X-MS-Office365-Filtering-Correlation-Id: d735ab6a-826b-4dd4-a117-08dead14c340
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|61400799027|82310400026|22082099003|56012099003|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	ubXmb8CH1wn/zLybbUPxWljO+m++wSKu3CltdPA8jIj3UFhXW+Q0NLY2VmW1jDpcoHE93aCDOxsaV7BwMEKKAy0wPl69XSz+k0g+wyqcxVjpErCJB0hvvp9MQgWx9YgTqflTGQ2DgVWfJ7triREsMtX0IWBpW1ijX5oHievS7OkdnIfvZhAnYEhhicQ7QG+MiBHILOoVxjKfKAiiojH2qWyIA0kVv22F3Zrh29+M8IAffTJ3R3aqtRY9fM5nsSVRBLpu5yjaWS1Kyvne8lnfFw610UJ+B3yjukfGyYISMMevnBorkmpfGG+H7W6hm51+TsC8LsSJAepQ9Jje2VanpE6Sc1q+czZtWsrOQZdF91XLE0XldFCINn3TosfUWVF0a+fxzlATbIUK3brpMQ667HfDuj9Iqmz5TrlmLM3WE4MOL9/2p1buEi0tNfJopwBaNvM+Q1VgOQJ50gtzi3NeMpdKBQBo0SkubFl2LpiAw26B++MQf4TYu3FCpJwSTThbivxeuQ8IzffU9mlW+sHthmszHVwq1AUrrrh3pCvejOosLw4laxtjgQr2RX15o+gZ7yLj2ojATisrwjvpcd3upvpmWYEfKFpcKCEA0kp/e0xRmqK3FRNOEDsTTJaRgt/nXCHgCln2cI8wAWKEMHyxfIzk0ZdAjTBk3D+hxTREBsDU6mEQ7kY7QVbDrHrlmTneNBekBIQHc0W2f+9o2+4WrEFZ3UQI9mD0wIH3G0bp8U4=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(61400799027)(82310400026)(22082099003)(56012099003)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	pd8809Mi4l0B4wzpgKdCQCLitol3saNQoCxjrh2VisqOirtm0/hmMrIPUqSOQVzoUctbYyfG+fJdqHY1Xug46YNxyzg/KqUZMBXecUDBtowOW8uO0WYZ90tHFitRNh9gD8FOO6WpKpXMRbtzpM/MW3YUCgof08ApYrPVzPY+MUnvyqPwoUmdmMJfcT76/R4L6H4FPkQ/9LHtG/OOmOKGGCiUDVUaw/Fo+ahLK5R2m1BHZFUB0zjmQ362q4VPB5m1oBIFB5OT+KW5yFcq+wavEF5lRUaQepJoeeZRPyTo6yYaGFNsnGaReWcFiJ86YwzQUC0OaqthTUzhaUootGLCqbR63SmISqugcQyngPdQaslG/db0U1l+tLpuh75WR17MHqvBgj+mvdPfPX4JE9zlAXKKHRswNlnC2znrcc/t92ubBeX5ZF/QCBPr31yXLp3E
X-Exchange-RoutingPolicyChecked:
	LW18MIt1YdXOlqhgmaq1e2jwoULoRnBSNCaDej/K4nE1S8M8uC4ldAddN8dk4x6axzEhRBA2acFa+++r/KaVyasE/hI8IAve85lrmixvVflewaUNaRbTOT+oFzmOGvaN5fOO8YNdV5oQ821bCnPGVSjC8sZaWdZ8iyeDoLu95FJ8Hil9GA0wR9nXb9whc7yGc/ljlPBSEY/3ER3Et8tvzZ0APADwRgADzHQFeYtPxFyotNYv1NFf/1KUYKZbmBwNHgkTDPt4bMR8kMx8m/RdpG46mbO5tptY9hZYCuw5sNuNEOSm2W6FHepFYUhVZzX8R+OKod5y38pKTgQpi6C+Pw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 15:16:21.7873
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d735ab6a-826b-4dd4-a117-08dead14c340
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MN1PEPF0000ECD5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR19MB8256
X-Authority-Analysis: v=2.4 cv=L9otheT8 c=1 sm=1 tr=0 ts=69fdfe49 cx=c_pps
 a=slu7Q4BvoA09i0qrEz4xsw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=1pJoS-mktQdqODq8DQMA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDE1MiBTYWx0ZWRfX+OUjiLEs20jr
 M13WGX7Z7/rhNcZ0ON4Bgdia374e3Sx6Izi8YveYNgyg1Vp4P8l+MOT7Noy56bwbQrPm69+tXAw
 +/gyQQLYuqpiw170hS3gPuugJjk8RATgUzFG+4CQaFB5sI+l8jGtalwIRVLTGptpRzhb103XpH/
 FLcydScvKZPTcJ0habuJroh4W2LlQgTxJtEJfQcrXu2K9DriQzb97glX3ve9MAng8RIt6aMuT+x
 WENc7OnVtYNKYX3QdRwiZ9z1iyaBGBteMcH2aroqnPuqRNruXHLwtNOYXlpnnK4ER4CDF7G9mjo
 L5/pSXfBv83PjDL1oN3eshtF05Zo3JiZpcOgJsZz+KMi5996Nv0547TRfhWry/5x5em7c4j8DBJ
 N/7zIvkzfFD8WrqxwxnrKlDIUcYY28P4Y0SjmZvo6tD+xiNeErKNA4bgsqJOZx/DQcF/oYVO2ih
 mybhIVUn9nRYi9Nl1Bg==
X-Proofpoint-GUID: wRot3MEhzO20roA8fLgiQ_jf84aVIE--
X-Proofpoint-ORIG-GUID: wRot3MEhzO20roA8fLgiQ_jf84aVIE--
X-Proofpoint-Spam-Reason: safe

On Fri, May 08, 2026 at 04:56:03PM +0200, Tobias Bachmann wrote:
> On Fri, May 08, 2026 at 10:41:10AM CEST, Charles Keepax wrote:
> > On Thu, May 07, 2026 at 08:53:27PM +0200, Tobias Bachmann wrote:
> > > On Thur, May 07, 2026, 05:35:37PM CEST, Charles Keepax wrote:
> Tested the SSDT approach, but got the same SDCA reattach timeout 
> as before.
> 
> Verified the SSDT is present and correctly loaded:
> - dmesg shows: ACPI: Table Upgrade: install [SSDT- TOBAC- DISCS42]
> - acpidump captured it as ssdt16.dat (107 bytes)
> - iasl -d shows the live table contents are exactly the
>   intended _STA = Zero method on \_SB.PC00.HDAS.IDA.SNDW.SWD6
> 
> From what I can gather, the audio path doesn't appear to gate on _STA 
> for this device:
> - soundwire sdw-master-0-0 still reports SDW Slave Addr
>   3001fa424501
> - ACPI still announces the SDCA functions: device:29 SmartMic,
>   device:2a UAJ, device:2b HID
> - sdca_class still binds and reaches "probe complete"
> - sdca_class sdw:0:0:01fa:4245:01: timed out waiting for
>   device re-attach (5s after probe complete)
> - No soundcard created

Hmm... yeah I think maybe your kernel is missing:

de67b4ea168f ("soundwire: slave: Don't register devices that are disabled in ACPI")

I think that was only moved into Linus's tree after v7.0. If
possible you could pull that in and retest.

Thanks,
Charles
