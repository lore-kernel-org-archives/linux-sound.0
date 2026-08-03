Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94BD238332A;
	Mon,  3 Aug 2026 09:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785750518; cv=fail; b=ceESlTUCyRbJ6fUgcMzvXmm0Dmo9r8V4/VP1KGvFs1uoHshXks0zh4W2d7l+P+TbhCZBySX2cDN25JqSPF9UeAXzTE1w+wkc93vBXGgLgNr4CrHbHbFXCoOp6DDf+gr6RX0faSUCdv7QYPMKigGxpSIeHfrfc9EwCaIMrPz6om8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785750518; c=relaxed/simple;
	bh=RMfwVRtgul9J2/2UV5mYpXIpX1mSccUJHtHuaYlRdYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oViVvwzMHHL7F/05RK7PUNkLStT997lfNuJkn9n1nIcGbwaKhDec3eaoZnF4ICHp62GkGFsqk/KmYSjSSSWVszZt38yMQ0M915WEzw59xQCDTxIcE18tCznL7bitNBy66xZULtYBd+i4WPCAF09fjIR4sARql3E0v2FMbuyjAoc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Vexzojr6; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=RnSHuZ1I; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Vexzojr6";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="RnSHuZ1I"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6735FgW72933017;
	Mon, 3 Aug 2026 04:48:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=LrtWCjk6ckdFR+E7yE
	Pu+mpE9kP+o4XIrrvLjFKR3Ic=; b=Vexzojr6pwfb9curE1jQz/Xqvp2Bgc/1cM
	O4dhY0qaWpNx/GKBwSghWRk5/NJW/IbLwqBQ/g7Zrq5ls/WqwU5I49oHCjJtPfAR
	reZGo6AW/pUiNzb1YGYEIqwxmUvmdLNmKkgZX9Xp1r2TSEhJmyESo8oxFB1z2oYd
	RdjHhfsAmW3rjxdAwlAAQRYqVc5h/EqJSp2WupYTr+m7ebtPjXyzxFochYZGPfG+
	SoCQ48Ly7nSRZ6nuRNB0MtPd8FkAi1bvoaFmrDa6jPRdYU5YOlPdajGHsyphkNVp
	eqxLGjCPel4CLAqq73zNEI+Im8AoI2lxh5jmVhJ1RkTF/0b3JzRQ==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020082.outbound.protection.outlook.com [52.101.85.82])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4fse6vhprd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 03 Aug 2026 04:48:22 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GdnQjqWcrc0q+zhfYtRFCq2H5fE5v3EY2pj3VxgSp+jQSgOHsUkszRTfsGrjnUpXmyqRKUq7WxbVFy5I2wc8qunIySrdGj6pm+s8C4pGy+hdoiPdYsNkYp1pUU2JqpV0vPbVV7epal1SsrP/4vXL2ecxdPejILst3OZzGr2OLEyT2gqVOYFLlr1mb4WVjgEIumA00kqNkAF7L4IZV+s0u58xw7eeMq9ubu5T5q8DKIZfwX5gSqfhkymWxD935TiIjXIsgXe6vBWRFGXRbYGuX+Ed7aAsPHk7gIhb8AxnCtJbupXvtRtuRH4e9alVvkzzVtQBLpdgLKsmiYSmuHirUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LrtWCjk6ckdFR+E7yEPu+mpE9kP+o4XIrrvLjFKR3Ic=;
 b=m04FOkZX03Z5My4/5Hd69HfvwnjuzFoMHMWsSwfMBvi158I3ML1J/0abIME6y0RJ0KgzKkg3kH8eYy1uMt4rGrcRUqmwtk5ydx1lu1UzvJd63ZYbA8wc2LXrd2acjqgfLTbHJNhGNob2u5rSvWZGM4KQ+pQL5Uztqt2hQ94C+XHJSUjFpNxBbn1mZz1vBojlfVrVyA4C8u/Il59NJGT4idzBuWPS9YC9aAXEZv/KvyqenT6+c7sPvUa4h1tD23zyVOSPKdnF7fVy8o2u00RrxLRaMF4+zkveo8YM3WxSY+esSJkHqTCs5BGkoBIwIi9Nt2DXLmQ7R3+sS6PsDBcOMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LrtWCjk6ckdFR+E7yEPu+mpE9kP+o4XIrrvLjFKR3Ic=;
 b=RnSHuZ1IGBIPXwAlpNHJwEP8VXD7z+7mxkW1zvpi+XUGY92Z1IpcjZQgCgWP6suELw2rA55NlzfYmou7/26iLxhCZYuo8czGkD3r6s8ALm4WVJqkVpodcWHBNZSxFkSgt+mYKzaQ3Wyh6+B/tPDmi1nHvFHRcBlzv/CJCadeSZQ=
Received: from BL1PR13CA0329.namprd13.prod.outlook.com (2603:10b6:208:2c1::34)
 by DS3PR19MB9488.namprd19.prod.outlook.com (2603:10b6:8:2e3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Mon, 3 Aug
 2026 09:48:19 +0000
Received: from BL6PEPF0001AB75.namprd02.prod.outlook.com
 (2603:10b6:208:2c1:cafe::36) by BL1PR13CA0329.outlook.office365.com
 (2603:10b6:208:2c1::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.12 via Frontend Transport; Mon, 3
 Aug 2026 09:48:19 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF0001AB75.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8
 via Frontend Transport; Mon, 3 Aug 2026 09:48:18 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id E4E63406543;
	Mon,  3 Aug 2026 09:48:17 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id CA6B982025A;
	Mon,  3 Aug 2026 09:48:17 +0000 (UTC)
Date: Mon, 3 Aug 2026 10:48:16 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Cristian La Spina <cristian.laspina@kernel.srl>,
        Cezary Rojewski <cezary.rojewski@intel.com>,
        Liam Girdwood <liam.r.girdwood@linux.intel.com>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH] ASoC: Intel: soc-acpi-intel-ptl-match: add
 cs42l43_cs35l57_l0 support
Message-ID: <anBj4B4Rv44EFqoL@opensource.cirrus.com>
References: <20260802155741.202067-1-cristian.laspina@kernel.srl>
 <9f71658a-9b12-41c4-8514-19dcf0521146@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9f71658a-9b12-41c4-8514-19dcf0521146@opensource.cirrus.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB75:EE_|DS3PR19MB9488:EE_
X-MS-Office365-Filtering-Correlation-Id: b0bc3244-d3bb-4b4c-3374-08def1445929
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|376014|7416014|61400799027|82310400026|3023799007|5023799004|10067099003|11063799006|56012099006|4143699003|16102099003|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	bJX6GzW4YVQoy885kcXPlK+iMwHqiN4MI3dPF8Ad6lYHtI7O8p8UBncpA891PW1YhernrMn25EVlZ142bEcwlY9KhlT+0eZ/K2lciVixETDm8zgBBckTesDzgOpCPrFjLpe80JFAMrZYciuY1NUfoWlmDLrMhFHjORx4G3lKBv2UvwYavOaNKSPBGWSp/8Zq7c77RmcTe0q2kNmnlb8KRPaA5rwZ9Ci4JMAUFvqkBykGFP6oF2WDnj5tLO8EwbwCNhPn/J4yqwGGmo+39XoIaQUgyJ4rVyTLnxKMy30LUgxhBKCAuM/R/vJuZ3IRDlSHHEHB4O70WQPcb4IXJlNjfyY51w5gsYuwGjhoZXPFht7txY1cPbGeXM4KOyqyEOPh7Z002S46R6W7WmcFgla0K41x0PqnjtzN8ZefdUmaL+FUJdOlJ36i78PQBCdWleurYq9ACvLPwgD1WcID7sCXPfizip+BU0nIhJkP6A7tyZHcmKz/UsZJAxc/fKs7Ac6l9e8/JrnsBSbHrmWu3UCM330foASRwkO1ZY0Tk4m9gF800Kp4w8rw2hy81T4PjGnBJvz5PtPcjT3q967Ac9uW46l/ZzwM5DxYcE36ozXJOYCoCu5lgKnD7BDNDMeFJpydfHYShM3IOc+ATxoVWN85Cysz0GaSF0OsB8pPs+gbdW8Ofkiopx+tO4ipvobTlE9wMNy8sd2hYSLzt1Vh4LwwYg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(7416014)(61400799027)(82310400026)(3023799007)(5023799004)(10067099003)(11063799006)(56012099006)(4143699003)(16102099003)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3IZs348Eq5N85NUzu6PoLmaMPIvN8pn+iS0UgXYqjd5Owe8shCO+vTMlT/EMmn4F3SoMM2c0cINv3dr5YpYfW9CCqzKcTe2HhxJ2FSUfiarebiV6G1Y5vdeT5Qbb6bzVLD38XFc4WD3umQfYM7mhBLZz5LqXScH9qLDVrKeO+YSp7+DSoEQ33KU2zb9obn5Gkei+omV2pmaJ/Lo+tUw75z99jF0bkefGp4m1B9+VIkg+pF/W20jP4K+zgxg6lEdPj2nougSNdEbcr1rW7Icnm6pNwxyxYFqdNS8a69XwHKDqGAi7NODRhBiSsp7ImzQxQlsjdjwA+SZ+Aym4kLiE+vV6DhnbLfiJXrcuUSBFzb+ofjmHXiCC2yof7hjGtT2Gf9QaHU+Ea9CeMZ3Tm80U8bdr4CCgkcbsSapXTTRtrfzKsRrDrso4fLXWgN18lp6I
X-Exchange-RoutingPolicyChecked:
	JO+p2N06/I6dLVUDMCMXFYJGXlw/zHAyeBRBsiW76XRTs85YoSJ5NAHJTJ+geFOvgibYjhhMB0/j/XEZQl64Gn55edp3jiTSDq/RI5qHeEbZct2wMyzEOFM3Qxzn9U9ElKipxDvO71axnrf3e2wJTla4YA35xz4fOOAnySzXi20NcEeCuZ4gWMl1CiylY5lhyFzk+YlvlZ7l73JoqQWXqLWQdWJh7A4axGq3yj54USfgQZPSNmcCtAo3RzBM6TmrklyWPXrzrri+El9yfQ+SWI7GYenHC/O+MaNQ3eQG92eZXFaO5T1iq4VGWWxCnmdQiub50CrFzI0sStvMzDLWtQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 09:48:18.7064
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0bc3244-d3bb-4b4c-3374-08def1445929
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF0001AB75.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR19MB9488
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA4NyBTYWx0ZWRfX52sX5oG/4d5t
 rEoDSt/UYj7gk3yU45Z1XJwb2ZOXuaPcQ3/zxzJfHx5qnCMQDxJy9HOj0fLIVO9UWDcB3H6H4cl
 67EQjdhv6TSyJwvhLOeSFtyDUZA0lQU=
X-Proofpoint-GUID: 0GC1Y79s3UgA67DsOK9aaf5i1flctT9o
X-Proofpoint-ORIG-GUID: 0GC1Y79s3UgA67DsOK9aaf5i1flctT9o
X-Authority-Analysis: v=2.4 cv=N+MZ0W9B c=1 sm=1 tr=0 ts=6a7063e6 cx=c_pps
 a=NnP4WoPY/9ItU/dr56klNw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=NEAV23lmAAAA:8 a=-Lhn0JHMzdsGMaVNdj4A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA4NyBTYWx0ZWRfX/GUJ8ceil1Ad
 KQ01pCLGhI/ruICIdnBJ6eojio2LOEEm79SuPWablnyaYcruGQ8hGkJadLOiv0GlbPFZnywxOuw
 ri0oRoUU+BtkjgEIQATXpWz1VfaJW8OdjdV0PXp/96ShZsfywDix0TIGfbScut5YR+gKAophBtN
 4GgaYz4O27fTNZKySbaRjGEAnfmmdwHEVaPhpi1bRmVPo5wPXi6LEEQavw+0GrXGWBgXnY99j0U
 a3XpvwvrVLyGIJNO+mjcSBsZln6Jx86nYbSC0PdGbLiMhKom/kOCouL+fKRMbrL9jaRU8FsZlR7
 K6mCekashm2vlLeOFx7/QlXYmY9go2992zkqJbxYGENj2cCyrq02SwDQtItekXRTWAkeNfMquQu
 1zUZtpuPd4IoM8jVr2iyZ0/73H6+OM8DWtAMrDmQptR2ac9tznE6yCAYJraDFj76tUSPDxkaoxY
 XwoGsqedmQogkLobAbA==
X-Proofpoint-Spam-Reason: safe

On Mon, Aug 03, 2026 at 10:06:18AM +0100, Richard Fitzgerald wrote:
> On 02/08/2026 4:57 pm, Cristian La Spina wrote:
> > The Lenovo Yoga 9 2-in-1 14IPH11 puts its CS42L43 codec and both CS35L57
> > amplifiers on SoundWire link 0, as described by its DSDT:
> 
> <SNIP>
> 
> > so this laptop matches nothing at all
> That is expected. PTL and beyond should be using function topologies,
> not legacy match tables.
> 
> > and no
> > card is created: speakers, headphone jack and microphones are all
> > silent, leaving HDMI as the only output.
> 
> That is not expected. Please provide dmesg output. You can create a bug
> report at https://github.com/thesofproject/linux and attach it there.
> 
> > Add a match for that layout.
> Please don't add match table entries unless there is some reason why
> functional topology is impossible on a system. There shouldn't be any
> need for match tables for this. It can cause problems because it will
> match any system that has that combination of devices even if it also
> has other devices, so it can "capture" a system that was previously
> working with function topologies.

Yeah everything needed for this laptop should be upstream now
(the last patch is still making it's way out of Vinod's SoundWire
tree into Linus's tree), primary discussion was on here:

https://github.com/thesofproject/linux/issues/5801

All the patches can be found here:

https://github.com/charleskeepax/linux/commits/v7.0-cs42l43/

Thanks,
Charles
