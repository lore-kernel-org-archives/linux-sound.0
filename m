Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4493A360EC2;
	Tue, 12 May 2026 11:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778586648; cv=fail; b=F9ODCMfH5mbf3tySxobMdF/6phejik4DaiAe2MflGXz1kfHkxICCzGXLF7VUdxl5Zs3gjbyCf1lQr0CGjnA5C3ob9XhOWzIh23dioXkYDiSsd8LzFRB+lBwZj/27GReJsQCgjdzgPBrkigxQi/UW4bsgm2d61x/kGs1cqeWnWRo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778586648; c=relaxed/simple;
	bh=DdfKi+GhFTm8nzvmSlZkpnCMEwFmrPHMLSdRrOB9FCo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U1A/lBmFPmh4eyAhczufIFdiI/TMTLfo5Qi7otJJvFmWAwHEKidNI6F8+QDW5DKvJZTRzKjV1onaNd9mHyHN5403GM9m3VtaFfq18ayUmH/bp2I2BSRm0vxhdPCMxDFerZS6lS8XbG1kqYkF4D4hwZnKavjboVI5KCNbkB+MgZ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Pw7J07rc; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=KArTR81n; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Pw7J07rc";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="KArTR81n"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C12Q1G1137580;
	Tue, 12 May 2026 06:50:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=HyaSqoVCI2fDx9LITv
	nFJmYv6VLkMvwCEC+QSbatrro=; b=Pw7J07rc3KoQdS0n+bFuEj/eeBtFeOrvF8
	JOIKTS5rxw9JBt8nKecEqTxgjhvJCosXIpNCqoHv5E5PBHaJJIG4a/4ykLYHipqY
	YCw9x1SIu6yS8CmeEwm9EtXpjVmUiRaiFdYCgGqTUMJfpcItscWSyzFAVb5TU2SB
	l5UJ5P64l+rF6XzVYs2pVPrCiitT33u30tmBrQUUOrKnS9ZncM3041Kueb6/SRzO
	t9y6t5r+ehNOARLG1Fhxre+S9qPU+bCOjNxgPPperNL945y948B5rkyflDfFQbRt
	TQRiGnCc1o1FHb1T7uORcAR0tmBxuzcvxDHot7PK2oLb/bl5+zcQ==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11020099.outbound.protection.outlook.com [52.101.61.99])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4e3nw58u0j-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 12 May 2026 06:50:09 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oJFmfoaOqK9gLEdcDSvtFJKX9vZceM49gUpQgxmGvYZSkpxXmwDs1eJ7uBQSErDdADCwBj0iuSlKZm2eBqTQoJCX0xBnr3dd3O2Ehd8V8wvtgzY+YPn4CQp26w0fs2le8oX8oP9RBB1VryEp8HSyf5N7DJeUPm680H3k4571UkOFRf/H8BWDOYR8it2Q2LBDDhYB11RZd9SSEifvbNhBzYt+Ca+Obus/tOmqG340pN0Xc7u2KbELVaX8V0g7WF5PfZs4dCv0eW5L6GjxCmmD4PG3VzP29QsxSrLA32Cne9112lsYWSMP4bnwMYmZSgr5C666QFBsHC0IbxLjZxXo0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HyaSqoVCI2fDx9LITvnFJmYv6VLkMvwCEC+QSbatrro=;
 b=DGvWRvt7flHBxlXJfxTESTildfOlNrN5bK1FhUehp7PCpSzOypO+Hg3L+gHZJGVT0dFsh/A3O9o6ZqsEhI4BrkA6c+h0XJPtbbifrywWNnr4LgnXvl02LHV+WMNesrcUQlUe7QjwFpnEdLjAArFmKVYSZsOANi+s/qpVMEZ4rebvCN95MKu6YjaZaYPY8XMeheyTYeWSjfKuazIx0/JZR63sykjrEKtDuDNJLlS/yR0fBQfZkO/ir2vPS7MTY/TzifhESBVPmyAfU+6ZCdJtdZWytqRNY+gCrJhRB7okp4otlN1kIDfcXPNRGVDvr9QBJuZL3l42wjHVxnInLzyuOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HyaSqoVCI2fDx9LITvnFJmYv6VLkMvwCEC+QSbatrro=;
 b=KArTR81nu6KkyaNiNrz7Nv0sK4wx41kYbfewp2xagyVxm4Kn+fRoavN1kEknr9/Bhw8R5U5kC5HcE9NmJ0Rvk1o3l0nwh0kgGfOCyvVTjwirELtnLudC7ss7sWB79hEH+iM9tnErbVCRO5zPxTbQw5DYvJS04tuul4rPQvju64s=
Received: from DS7P220CA0012.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:1ca::9) by
 BY3PR19MB5137.namprd19.prod.outlook.com (2603:10b6:a03:36c::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.18; Tue, 12 May 2026 11:50:04 +0000
Received: from DS1PEPF00017094.namprd03.prod.outlook.com
 (2603:10b6:8:1ca:cafe::54) by DS7P220CA0012.outlook.office365.com
 (2603:10b6:8:1ca::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.12 via Frontend Transport; Tue,
 12 May 2026 11:50:04 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS1PEPF00017094.mail.protection.outlook.com (10.167.17.137) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Tue, 12 May 2026 11:50:04 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 9234D40654F;
	Tue, 12 May 2026 11:50:02 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 79503820244;
	Tue, 12 May 2026 11:50:02 +0000 (UTC)
Date: Tue, 12 May 2026 12:50:01 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: "Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>
Cc: "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "pierre-louis.bossart@linux.dev" <pierre-louis.bossart@linux.dev>,
        "yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "peter.ujfalusi@linux.intel.com" <peter.ujfalusi@linux.intel.com>,
        "oder_chiou@realtek.com" <oder_chiou@realtek.com>,
        "jack.yu@realtek.com" <jack.yu@realtek.com>,
        "shumingf@realtek.com" <shumingf@realtek.com>,
        "Ding, Shenghao" <shenghao-ding@ti.com>,
        "vkoul@kernel.org" <vkoul@kernel.org>, "Lu, Kevin" <kevin-lu@ti.com>,
        "Xu, Baojun" <baojun.xu@ti.com>, "Wang, Sen" <sen@ti.com>,
        "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>
Subject: Re: [PATCH v3 00/18] Add a new SoundWire enumeration helper
Message-ID: <agMT6U7taeXbviPx@opensource.cirrus.com>
References: <20260512101348.1138044-1-ckeepax@opensource.cirrus.com>
 <03d209d9d1014c0c927e971d47e32dd3@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <03d209d9d1014c0c927e971d47e32dd3@ti.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017094:EE_|BY3PR19MB5137:EE_
X-MS-Office365-Filtering-Correlation-Id: c35cc421-ed1f-4e97-cd10-08deb01c9b45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|61400799027|36860700016|11063799003|22082099003|16102099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	s4lknXqGr6jxHSyIiBmUbxtTfFIMzAsz+vgj3rqLIMRoU0tmGcQ2+tAt6h8JkYCPL/xU1ZJuAPWRMdzlLAw5eDfZm5NKKbhHNcxZJHGPGUs8qY8uSQ3AxHw6ptQ7wbXg1iRFpuzZRYWTQ2elqc/uBbHMSTRI/BZy5INlLW7tzxLop14ffms08OkXgPsq75jxuy/NvYihaXzg0pHgJSyECkT78An0MJVHimrF1jPbmG/iAVrWvfKCzjaSgrluiSbzPbofsQ1ypElKmqfYAMEp7CmMrVM55GPQsFf7tTNdDZTaFU5gS7BYiQTdltNXc0yNwvSU3QkbdlOS2mwcrV4co3Kd4vxV4FSH9Ky4nSuQ2ESLkCMXGR4JsiqZeUSKpjgo7IeL5bJvNLk9+tCQHl59mCg/ugI6RzcpXJOY1AOitgd359vA/V0/pKYqxYEthlHJiNX1C0QLgWYY1CVddsRYG4PX1JtPSC7Dq7SziebUSeEkIrQ1++/8twjgSGJF9j+L3HJIlVqO2+5mQutYpJ91sOAzUt8Kzxq0WrI1aRakCpiKukZGfuPgHSkpptHoL82yO9KJkubLhzjEFdO3oDsBvDOp0k9g6WlPWOKzcURSHjH0SYnJr/yo8JMk8sklw1hFJWozJOVtdBIJlZo1JfAQekOWetNPFvXcV1jWXlMXu57Pj9GJ+Nn67r+i5bvzuAz25liM0Lsypm8+PWxiumFA8ejE1LguQ5jYQETPX/0PHek=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(61400799027)(36860700016)(11063799003)(22082099003)(16102099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hymz08Yex0hIFTql0FCD0ZFE8v8GwYrB9YKXaFHXSniLcgKgIIQXgSjJ6Bn9fWu3akXQueD3UPUigIF01t/Lt6WfSCFlzNTJ7a9WCBf3vEtBjngbFRmi6ZCQYVtG/j7FGZNO9PLODzk8AkwiEdhiTDNiJBPjv7DXbavbArer3zISRnO3hDrCTs8o1BJOY3sM894WC913bkxucU5mJpvcfOeIAYdIyZRSVmXCkZnFsX6vuquRGta1UPgJRuNflNzA58Je/azVHW8Pg4Eu0uLVk54w1Yvt6w2UFqzWov3rDonnXWTPTnanHUPSZa9POk5R1AceSuzperAz1uZGUQ+fC5QXTJuQf3GNLyk4ikqbjU0NHkdkfY6PRKrK9okgROXrMnwwqAIZvJyn60UtAEZmd/M7wdG4YZlMu184Fycyc795KsMnmnK2xyDP+b+qd/IS
X-Exchange-RoutingPolicyChecked:
	VEmg0c1zy58lVGyGLMFJzKE3kDUDR54wbaSJFvYikgUTg1NrpG56F+XB/F5vNo0vO5G2LiTGZ61GnFEmJKvULlchsgzAVkjFW7eFiL6FYB5p5sCWl1aEA0ng33a769gFVJgyyCnxZx3bI8Gs8C03yEiBgDBeoXjuY0xMnde3o0gjXtVZzz79JSA6teSPXJ8QYZmPwPniceSzVUZQt9Coezzub5KRsgOJDPlJUvc59AECUasxuWgtK05GYH3FErMy4U+FiwAsRqApCx48bTUU+eWvUlw/Q6DStkSDB16phqTEfnELGneyFD2INdW2JSwnnb6Ej9wjGI/gYdnv8HWWuA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 11:50:04.1129
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c35cc421-ed1f-4e97-cd10-08deb01c9b45
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS1PEPF00017094.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR19MB5137
X-Proofpoint-GUID: gIB-_nxb-Ia8iwbadk55O8llXt5BFBG1
X-Proofpoint-ORIG-GUID: gIB-_nxb-Ia8iwbadk55O8llXt5BFBG1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEyMiBTYWx0ZWRfXyukgkZm/ogBF
 9M0CzzswQsSWjELXe8BT7zQlRr5f0OjOEhjbjm6V3987omm2aLmsEOmALQr86fy+BJhEGdIWvVJ
 3zCKI6oJMdCyxVqahjdlLBnvXd9E6CU5EGL3YgKKe5MIgq/4Qm8uHId8VToHY7yQsbkl1lyX75t
 0mqs7xLWLZY8Gu8QbzklIJRxIFD8JGLel4TKSdvUkNj6gY0sef7S6Js/UOz/CEXArUFTB7ASE2J
 NmOctp87ywWiNS2bYGgvleitLQLTGDaYCozNYALWUOtuzn+rOJBpnfBMazlf6ixAgMkviHpY6KK
 Nxlu5QtL7niVQL1VXSDjnVVLt/OLZv3WjwnCzhULnt2QGrFIs1xTG+zcNDzPlajx6dFoaPx5BOx
 VOaDUcjTPwWkspBXiwZSAfOk4YZaZGKgGgczsxMe0jyzEnxwiVluGXLp66RKT5Zji50/M/hyiZF
 mnNyxAxghwDGPXs9BXw==
X-Authority-Analysis: v=2.4 cv=KsJ9H2WN c=1 sm=1 tr=0 ts=6a0313f1 cx=c_pps
 a=28alEw5rgIF+mKGwt3XJ8g==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=7GHbxa7IaBGN01zRNfMA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Reason: safe

On Tue, May 12, 2026 at 11:13:15AM +0000, Holalu Yogendra, Niranjan wrote:
> > On 15:44-20260512, Charles Keepax wrote:
> > Subject: [PATCH v3 00/18] Add a new SoundWire enumeration helper
> > 
> > Add a new SoundWire enumeration helper function, many drivers have
> > almost identical code in runtime resume so it makes sense to move this
> > to the core.
> >
> Last week we merged new driver tac5xx2-sdw.c 
> Should this series include the change as well ? If not, I can add a new patch once this series is merged. 

Ah yes thanks, I did miss that one. Its not essential we do this
all in one go since the old way still works. So yeah if I have to
do another spin I will add that, otherwise we can fix later.

Thanks,
Charles
