Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8FA3C5856;
	Wed, 17 Jun 2026 08:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781684114; cv=fail; b=gS92RkVM0RM72J3UiDgb2REOwJ/yVZbp0mg2BSwIg1X9R8nK+REXmu21w/nyUNatg/5DqBhdG5trVNHJ7PY69AFEsWSzBHXIpQwL/7uefr2KjcmyMbkdrexRZhcp0XPClPnBMot3thEgDgwUiFEWJjYwIjSYEXAjSfzhNTYh9LE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781684114; c=relaxed/simple;
	bh=BMCs+e6Zt1SLz5Cc9HLCj1mhv/UvQPqoIAbPsROss4E=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jp+ZBMu1hvKDV5ou4FkTq8liDOkFAC8KwSw4XCgEf9I51YAMyqZj8rgkcUQTM+nkN8IYNzLKnZeePPjHwsBgOuuzHMvOrBghQRRx0j0cvEp7FA5MTEd8nY2A7ukZtjMgmiSIpjeqcjrwPz+1XCuxwHjjXkfIuTuU8sg+r/YY6HY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=RayJXNUP; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=QCiStxF9; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="RayJXNUP";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="QCiStxF9"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H5Wj4M2093423;
	Wed, 17 Jun 2026 03:14:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=vMNzFL1JUGQUZU07ss
	uZ5QaL4CTRvErVEo3hyUMSgG4=; b=RayJXNUP6twHmYxS2GP7WSNr+78C+45wEm
	DfkUKtYU/bz6F076AcavxHt/H1rX1tuNbWMPaW8Qz5CrSczEeetQDBnSpEqwYEkA
	lhpHJm3qhZQLTp8r1poCXt04rh795yTe4FsKtTwIdgpFYu455jItfVVotn4ZGf9m
	15uf50OeXjJd+GNRLq7HVyeziTOUWWXrpb+Al5ZCke5DFe5bDyjvyKG/ZU4Gea6v
	SIBdrnaxitPt0lavyJfxCJwc9WtA5dBw+Rp/u25Q5lzSHqc5reFES67TTk++YJnc
	20Xz0n9Y/AP5Oijye1BBdk+tozfkM/lEn9l6llf2VhBbeMCRLWbg==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020084.outbound.protection.outlook.com [52.101.201.84])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4eueefrm2j-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 17 Jun 2026 03:14:26 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VGnMdToxk6nM79LEsqHyNE2OC6TKT1X1v3niGNm10UmM0us2bNvMxM575AaD9Ch0GMHyoPYnMvXVhhwkyLiLhd/dh5mv9jbvgkIf+1DONMQVdRUFbyiyiayFxfNvRvQqWcAFek5h6oD18lok/h6xJjIicSf8X2zK2szvPnWZMdfFgT2/HS3w6CXqhtZfPq0XvakL6kMGvcKysb9TMRmPJt0syc1v4jPhX67QBgzSQkEZ7xE0argYiqOvhLxWtj6kOlZzmcGXlk8ekthg4HKHkkDvzPv27aLh0JYeKuTUhntgCzcy3nbM7j5qPLij5n34YkyUMB/ipRa29vLAW3rqGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vMNzFL1JUGQUZU07ssuZ5QaL4CTRvErVEo3hyUMSgG4=;
 b=GpGDB7q9UpVphnCyS20TC7dRfdnWc1UFAyl1HurDer7BW8ZDp3FXMzn5H0yGsHtWm46qfsyeyV12X1bEKsuoBpmqB4BXjmQoxM1LFZylyqUpYBwJaTA3meo68JpEMpbndHQJgL0vqSvXrXBpskWxWNr0/qqHAtjeZQZjcFGhxv4I6dRod5NPG+dp77VfYIUrvENuNFtZYndjYqlmXSw4z8ybtXwXbVkiJUHCNFT4dIARQ367ZvW+3TjYlOYABEAm4ewm2NUA0sgxcFTjqR6RRB58qxY0rDeo//Jc8O7xw7I23CRbfoUi1PVspeQ7CPmDC7LYEUjBYOeOd6vcVCToPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=canonical.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vMNzFL1JUGQUZU07ssuZ5QaL4CTRvErVEo3hyUMSgG4=;
 b=QCiStxF9oejdcXuzepaCMfSILoS7zpzpJg/+C2NUsfxeDQV2QR9OV5B4+wwQrBK27E7NX1rjlX7EbvvB4afWaTO2IGeHomcmG9lROIbGzyFSMR+L3tMI9MVu2qfaBQWZNid0a9E1exqya5zA2G2GpvX2CePE0d487w7YXHgoMKI=
Received: from MW4PR03CA0356.namprd03.prod.outlook.com (2603:10b6:303:dc::31)
 by CO6PR19MB4785.namprd19.prod.outlook.com (2603:10b6:5:34c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Wed, 17 Jun
 2026 08:14:24 +0000
Received: from MWH0EPF000C618E.namprd02.prod.outlook.com
 (2603:10b6:303:dc:cafe::b) by MW4PR03CA0356.outlook.office365.com
 (2603:10b6:303:dc::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Wed,
 17 Jun 2026 08:14:23 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000C618E.mail.protection.outlook.com (10.167.249.100) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.8
 via Frontend Transport; Wed, 17 Jun 2026 08:14:23 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 2D8B8406544;
	Wed, 17 Jun 2026 08:14:21 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 0D78682025A;
	Wed, 17 Jun 2026 08:14:21 +0000 (UTC)
Date: Wed, 17 Jun 2026 09:14:19 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        Shuming Fan <shumingf@realtek.com>, Niranjan H Y <niranjan.hy@ti.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Mac Chiang <mac.chiang@intel.corp-partner.google.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Miaoqian Lin <linmq006@gmail.com>, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, broonie@kernel.org
Subject: Re: [PATCH] ASoC: sdw_utils: fix missing component_name for cs42l43
 part_id 0x2A3B
Message-ID: <ajJXW1c6NU3SljGr@opensource.cirrus.com>
References: <20260610041753.1151088-1-acelan.kao@canonical.com>
 <178127688584.48375.17454457885369484858.b4-ty@b4>
 <ai+++2m8HWB7F6eM@opensource.cirrus.com>
 <ajISWtufxlriqFP7@acelan-Precision-5480>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ajISWtufxlriqFP7@acelan-Precision-5480>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C618E:EE_|CO6PR19MB4785:EE_
X-MS-Office365-Filtering-Correlation-Id: 466db429-3cd9-4a8b-ccf5-08decc4870c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|23010399003|376014|7416014|36860700016|11063799006|4143699003|921020|56012099006|16102099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	za9t4RntCZGkmLBTlA7opdX3l5oL7DHGaOGoWOF5NiKVGZo6dNLGJWb4YwRR3mGHkIvejz8f/0lW6XMUMnjjtip9C+yMY005Uky7a2BHfdu8Syh3JI3x9xdTv2U4/oNL9NXPGvxM0Mnhjhi72eKhjIZWhXZj9vAJdfIeqlAhrtWLXAfJ1gb3YR1dOj46d9PDaCSw3aIjQQ0D/3NaCoI1NKRd59yXr3AmxSZEQq0Z/sL84jY24/NBJj2kr3PLPrJDR9w/nrkw9TaXnyRbYacgOhSlHaMQXyXs7iavMHHqk/agVlyfeRk5mIhgyFYcQGzzn590g5K0VTPv6RlozRABT88M+b1ibw6SEGBR8mCyT8dtu2RiQrlopNZ9Hfba5KIdyp6qdfEGuAMgeaoQLGkzrfFcBUh/waQGDex6O9xwfvhtTZa4uZdKpNczHqrpn0jmDm2dXI+m4043rYKTbdnh3I2Ob0Z1uQ+N5OtK/tO1rLTWiQbukNBfebI7UvbZ2P/qwLJFFkzvGM4J4PtVAWBzXePThfz8ELdvwQ/eOljRf7eUz0MHfr4n094I+vGk8eSzwPz+veHbhuduJc0kziX/REA9H4dL1hYfxvTVMzz4z5GWUcx/mvOdq2QCWxdAn5YdPpQPv7Ks5BZKwxeFq5vRZ5jK7upHJiCZlVM/n8OqW0QEEzbR+xxWZ5D1dgy+dTAqSrdLafwrtapfjzSF1PmMDm5/RL9/NxLuw+7CzVhkdSoy5IQtPSv/c7yYVcjdfIVAAZnrBMWnEOzlT4i0GY8STg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(23010399003)(376014)(7416014)(36860700016)(11063799006)(4143699003)(921020)(56012099006)(16102099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	EKWqDTi7G1zfIdbGA68A6haemp42tKE+yWoKqHlfaFAtK5cE6ZL8kkXXS1izE+XWIuyEkaTfUyaFjCnAk50/zUTq/JmUak3s5RqjqBp7xlKb5wbZAmINBkZ3v5soj8oUeV/+05OrR2901+HWHrlzDVb49yhfDgjM8ZQCcMMbimQO1jDvoQcUjmj/QvPw+KoLFgehC8Y3QOJH3qFJ7ZMEFzCUXGRS5wmGPQDcy8q3HXjO73HOK9nH7VcHdgudrFFuW7a5cRxBfFszFL/DlUorjciSy1uVQANjrqUKkmCqCGYMpyF86P9Cp66XtWvFTFHeioZGy1vE3WzGdbntYpmn+uSLR508lhAega1n8FL9eSNfW96IlrK96wVdx2/BAlQ7GjdIDAvSoTdLlvx1AsoqnmggfWvY3KiQmRdTZz2Z0TlEFA9ekPS/0OLsSw0M8mCe
X-Exchange-RoutingPolicyChecked:
	hFF1klZPUUnHS0tKRLQ9Tqsh9IIm1EpENy25BaNu2nNicBCuaVVguv9ntwBAJdizliZVt1eGoKBhvw2zXu+9c9x8pMYBUN+JNb6qlOC+yUfxy8z3w2hc+lCRsdI3Imt8Izt6QYt5mqroW9E/jmY5OwlmddZg4KwVSjfm3xXNt6InJyh9MnVEbzs23KcOhjurYiDLa1sL/wTgYQVw5JpTVFqRomTCIz2zH+4qDbgjYrjriy7IzEiCTY4s816DA656Zak7HxFdmPWqiBih0twYqBY9ihuOR3rdmcAIpjRQeJcEUEC1vznTR+8ePQpd7oPv6zqWUAZWJbeMxAahKrncXw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 08:14:23.1451
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 466db429-3cd9-4a8b-ccf5-08decc4870c2
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000C618E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR19MB4785
X-Proofpoint-GUID: XpXs1nh5JmN3WEtYhVFD8yz0KK_DMkdV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDA3NiBTYWx0ZWRfX+G3z97mGONj6
 X0KZAgBUipfhTmETRkrC+x/N7SvTegiiUEhLCrmpcb6nJhhRGaMEmM8R6Y7g3nmPM3a0lpM490b
 dUARjJZoe+8L77NECPj5r7HGRi7q86JIOQhwtOAr7eZRpIU6NNQUL4MHJkxNaz6SttERk/ns/i1
 uw7TwNelyzxEvTuJuxNLWYOLwvQhhkofNuB0bBNYGTyqtIOP0znrLfdxH464vel6DdJocXEBQd3
 Uu9v4VUUqqoTU+Y5NTzRE9/BO9Smb2dCXhJ5pvTe+lwB0uRu+EYlCb1/Gix9PBpMjb8w6s+yE/R
 Bwi5WbAk/yWcWByslFv9zy8gvZJxJvX6Oam/RZZ49Tw7p/xXduVPkwsMhl2OdpPPIesn7fyojif
 KoWxruzSydzv4PWJfCIZtmFCoUeAQVi3FgQrGv37Y5dfVnpE2scV6Itse5svAtrkOj4x2fay3+C
 KVJiNbx4VyNj1iJZ21Q==
X-Proofpoint-ORIG-GUID: XpXs1nh5JmN3WEtYhVFD8yz0KK_DMkdV
X-Authority-Analysis: v=2.4 cv=Wukb99fv c=1 sm=1 tr=0 ts=6a325762 cx=c_pps
 a=MpfTxiBaMh6MIwR6HTKnTw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=6C7osMconCw01Ea4QV4A:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDA3NiBTYWx0ZWRfX4lAnRgBXnBe0
 2EMGfG3hG2BA1F5vRQYV4qPbxZe/zelza9grkwpVWXykKa6wGE4SEujOClADDWTXk/eOY2yye8L
 vUrK8HYmBtqOoAdGejXqvzpo5C0oWe0=
X-Proofpoint-Spam-Reason: safe

On Wed, Jun 17, 2026 at 11:22:50AM +0800, Chia-Lin Kao (AceLan) wrote:
> On Mon, Jun 15, 2026 at 09:59:39AM +0100, Charles Keepax wrote:
> > On Fri, Jun 12, 2026 at 04:08:05PM +0100, Mark Brown wrote:
> > > On Wed, 10 Jun 2026 12:17:53 +0800, Chia-Lin Kao (AceLan) wrote:
> > Did you get a bounce email for this patch from the Cirrus folks
> > and if so can I get a copy of that?
> I did get some bounce emails, but none of them are from cirrus.
> Maybe the email has been dropped silently.
> 
> And if this is the issue, I doubt you will receive this email.

Interestingly I did get this one :-) Thanks for checking will
keep chasing the IT people at this end.

Thanks,
Charles
