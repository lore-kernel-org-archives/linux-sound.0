Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117E0A41
	for <linux-sound@vger.kernel.org>; Fri, 12 Sep 2025 10:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757673231; cv=fail; b=QwY1kinJbDoVZDrl7IyJXgpXPSLM3jPAw6vImaf44TqyAL8C45Bm5nT9kFOijmsvdf+cMlYS5jg5VDpnJFdU1g+cNP4GgeGUK9orjktvJQSjzOmZtfEb+Runc2wfubG+hOKND7PqDJPYEJsBEpzNaGUrwOa/fmuIw0O0fw1xQnQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757673231; c=relaxed/simple;
	bh=UXWjv7MkmkjetrMdpYEOyrESTY9w4cobV2QGkXpjGCA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uN52nfh3B7DEg2Z7ByhBmFJpN7ohWco+Fd0jGfsYyTco5Kp8GSAbVngrUOPeUtJOux9DEshMsQfU/vFBAGLsg2HHhfRW32yzCUUBgp+NH5EbwGUAYw0OC3hDQ0/+6y1vSqSW3l3ctp2XiTcuhY97kMLRPGpwXGtV7ISN3kPGjzc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=X3LuB+EQ; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=YM7jNCOY; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="X3LuB+EQ";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="YM7jNCOY"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58C4oDt81137784;
	Fri, 12 Sep 2025 05:33:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=9xE514m2qfFrQf9tvU
	YcccuULqC3H+JRfU0QKD/gUz0=; b=X3LuB+EQV/YBuPOup8cnGtEe1yWSzdFaa6
	EigiVYa8nk9hrNqD+pjkDA5khen3TazfZqL+sDfjomDaTmW0NRfXdym6GjUyoOnB
	9QGZSWGu4kMmo/crjtNPPAegGHBkcu6poqNq004MyHR9P2lS4OEpUYtML7X1CVIR
	yMOfkqLllSXRnVtqGQzUzJFFm3QJ0L1YNuuG0eDttF+uUP2c2BxzPwnVBFn1vEsk
	Lcntk3j8vJaQBKoKATrxXMWSFYUOwzLTkov7+gQxqaUjW5SGG2Gz/gsWBEHnwI6v
	/dBGaF4WoK0Yc451lrEztYQylZVEXWpdRHlj4+2rWPGa5O+rucmw==
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02on2137.outbound.protection.outlook.com [40.107.95.137])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 492q6tcpfh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 05:33:20 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bcVSoDbYFPt69YE4FzHsoQjT4NY5F7eiYrR9hyiT3OWVma5TUx0NNw7r17K067u3lTgZlR7HBy52Rf7ZcqzIFBf1sT2v5/Px0Lgt6+7fzwwVAieEdbyijQdN2l9D8ug7GTeepVLAX0p3FjC7bemcGQnZqUa7FKZyMW9iDKSojvLSugBQPq3LtYVm9lp5RXfCH0mNMsMJXN4E+2xhaaFJA26mNey3zR7JHUqiD+bz3kiynku5wpg3uTVlMraP67Xxi9+494GlmPu+wmrkmk14xtdq6loBxOdUlHcrzBs3Ub2noX8imSG7uOYn0Zg+Ii8H4Rcq5WkDHeeF1leNcJTazA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9xE514m2qfFrQf9tvUYcccuULqC3H+JRfU0QKD/gUz0=;
 b=nGX7QkOz98946IQBCigZ2Fi3paFWNK2Vk3QhfXIYE9mAc8GiCL+9NpqqDbdgPmQihz4P0cXsiVt0NI3PZEFu8aVfIxJPTLtqDWdl8D1VnFyZeLBfJLrFocxT8lAKUKuFe2MO+RNCrb2O2O6V6gHExWsY5L2lh3Mqqc0sqoClsQHVZMPrtN+A8COKrYkPmp11bVByiJQbbq7tsK6FnJLL3ePfKplzIOQ3ud58JBPV2SiYKaWxvRegbgFmuQW5ckIfjn4lutTxyvTEMjs2mKFfwB9MKVSV6sn5jJk/Qdy1FSdcuh1yQLmmcdcZxHXIKziwCpdRhxoVYT6sqK+nT9u7LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9xE514m2qfFrQf9tvUYcccuULqC3H+JRfU0QKD/gUz0=;
 b=YM7jNCOYggwSqI4rrGK7IMYoKJg9zxDcE+JXA4WEDfKonKYlKmmoRUqk6Nkm21A2gYaB7nzq6GME/3A3osTeNjt1v7VmAKpRx/MPfC/oZk8L50Jxd3fC0WB7ksvRGZSoWOui5zIz9YOodJ4tLAovH1gYxRkwSyz5cchwrbElcSQ=
Received: from MN2PR07CA0030.namprd07.prod.outlook.com (2603:10b6:208:1a0::40)
 by BY5PR19MB4068.namprd19.prod.outlook.com (2603:10b6:a03:228::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 10:33:16 +0000
Received: from BN3PEPF0000B06F.namprd21.prod.outlook.com
 (2603:10b6:208:1a0:cafe::c0) by MN2PR07CA0030.outlook.office365.com
 (2603:10b6:208:1a0::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.16 via Frontend Transport; Fri,
 12 Sep 2025 10:33:15 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B06F.mail.protection.outlook.com (10.167.243.74) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.0
 via Frontend Transport; Fri, 12 Sep 2025 10:33:14 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id AAA52406540;
	Fri, 12 Sep 2025 10:33:12 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 916DE82024A;
	Fri, 12 Sep 2025 10:33:12 +0000 (UTC)
Date: Fri, 12 Sep 2025 11:33:11 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: broonie@kernel.org, rafael@kernel.org, yung-chuan.liao@linux.intel.com,
        peter.ujfalusi@linux.intel.com, shumingf@realtek.com,
        lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH 09/15] ASoC: SDCA: Add UMP buffer helper functions
Message-ID: <aMP25yy/pxSlshf/@opensource.cirrus.com>
References: <aL7W3iS1YxGfk/AP@opensource.cirrus.com>
 <2a069e04-8f72-48b2-af5c-6b45a0ea8e5e@linux.dev>
 <aMBbavEX2RyzBy1o@opensource.cirrus.com>
 <6ee44392-afef-4c63-a8af-f50931b15551@linux.dev>
 <aMF/H8yejQ51B65X@opensource.cirrus.com>
 <0c440de8-764a-40a4-b040-a343ac3687f2@linux.dev>
 <aMGbz3l2n0q9Fhkh@opensource.cirrus.com>
 <4ddd1987-427d-409a-af89-7b505df5fa34@linux.dev>
 <aMLJip1e61LlEjwx@opensource.cirrus.com>
 <384bd185-9aad-4590-9251-41c572dde3c2@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <384bd185-9aad-4590-9251-41c572dde3c2@linux.dev>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06F:EE_|BY5PR19MB4068:EE_
X-MS-Office365-Filtering-Correlation-Id: fc49501a-26d1-4277-8a20-08ddf1e7c778
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8qjyegjDIQsci3yM35Y/GceSoRY8V1qNGv/p0Wa50asgIWgXdfZUwyq8aJJL?=
 =?us-ascii?Q?2d01b4Vp/4eI7oDZKzYjvII/hqG93AZ7GEtTVNcTWBGSELobWnSinbLXMAkD?=
 =?us-ascii?Q?HdZ/9qzy45jaa8fxB12gI/ESg3zWn6MhU6rTQXo9AaLE82slytJhitV4BflO?=
 =?us-ascii?Q?LAkV9kohwWbTKdIF/vcQ4BoK8SdcZcn0ShWTff19LtZsUunuteC8nJ3bhaVI?=
 =?us-ascii?Q?qFAWv5WRk5cN1aHXTCVZ/4eMJna4YKVTUwSJEOPcGTUxHq7Pw+MqN0P/nTFd?=
 =?us-ascii?Q?BVmH9uhIwTT5reoCknKG2lgvV24OjPBR93hm5IBkaRnCYfLAzhdOmrIBqrPI?=
 =?us-ascii?Q?6IGDWOiu4e7N0jGPd7rM5lM37z09zEMsDI4N8Cy7mHXcN26OTG5+zn2wg6Nw?=
 =?us-ascii?Q?sgGtkn0t5dmpQfx9p1i+5xM1f941wlTX7LSTN6CtPkjO/R+6VOkBOCtyCtJd?=
 =?us-ascii?Q?v5zXU+1/WRx5YGlpptwBKWwrXQA+BKBrRPc/9WoHCVuTr/C3Vo1ePs3LjAab?=
 =?us-ascii?Q?1kgqc2kjbYwVYLPqJ/z057VTc1gaCC4N1vgbKjesc6O6yWnOt7AI4534Zg6i?=
 =?us-ascii?Q?u1hEvOoyGaGT0OrCWqMUqIEDl5NWcTqmK9uiYofgKu8Ag1fkJCJCkrwaJyly?=
 =?us-ascii?Q?qP9B+TrsrVtiBzU8IF9wcXm+Z6+ZjMXy4eJEmQs78Mv+Y3sEOnelYGeDyNcr?=
 =?us-ascii?Q?fkhoVk/c6gTyvaBRHXGc3uRzxNb8htx0sqdaCmaqLGgBq3/pM9NgnQ/RQ/kH?=
 =?us-ascii?Q?ZwmdHwdMoNH+fXAsmchFUvae5vqfZa8uyjMY2dXUL3rmOxz4Io65P1+n7xM8?=
 =?us-ascii?Q?Mw4QZsn7Dxrd9/l9K5yfQ9R9KRH1eT7IDumJdteZyO9xEwMYNfTtyWdMPZ+h?=
 =?us-ascii?Q?es/WmJSGltmOCMs3Qt9ZvCD/9mqcvkYwOY0DydP0FrQVoeB6kTSIYHL93TU8?=
 =?us-ascii?Q?vPXBxjv9vleCuxEgBNCK05YZEwMHE7WEw0oAwbNeWRO+n8N2VL3rv7hLDetz?=
 =?us-ascii?Q?LTm+usfrct6wbK/6NzCvM2f/mvdns4kCOZex/uZ7YFzmiMGQgMYnsHn18kQK?=
 =?us-ascii?Q?ppbG648My/j0CrgSLKbZlwk0s5YzVu4rdI8x8CTTHKfWGq/P8gWHKL3j1WzH?=
 =?us-ascii?Q?ELdzCN88AETmc3vAwkHGRGNAHspFGRBXP/1rKDS9oqWmPXdHx/Uy/Hu/mrZ7?=
 =?us-ascii?Q?8mBWt3DDiHNdziwzdSralb97J8DHgk0ZW/8sWg2qxEaUZL6+OEtD1ymZDPUf?=
 =?us-ascii?Q?Mtpn8Jqa7n4dpCrHXc++1IR1TCb8g2ixh2aTGkw7rmMMDSES7ehzTEA6kuuK?=
 =?us-ascii?Q?D4kFTbRfxvfKPCMBSh9KYcPnGrbvZ1rDW2fbRJ2nhKSTca9uzXpdQKoQLRGT?=
 =?us-ascii?Q?9rG+vma9BwV0mX3gMdVTI7A+prbwGBAykcKhgANdGpc0NKYIZ98Wo6jCCWCm?=
 =?us-ascii?Q?NkSbLTrAZCwrum6vr18ERha0KTm65wbNanWcr45wSylHGmFweHzPEfL/k30S?=
 =?us-ascii?Q?Zb/5NMCp+IIO9I1DZtOwu0TDlRBAtnFTgV0q?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(61400799027)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 10:33:14.0629
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc49501a-26d1-4277-8a20-08ddf1e7c778
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B06F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR19MB4068
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEyMDA5OSBTYWx0ZWRfX4F9D2m7SlYw9
 JRidOfvUA15DOXTrZiBB2mNC9ceYHH77Nd2tRaMeDepWCilyoexuw+t/8YcO1LqdtMLpEldFMNZ
 O4IlxEbLaxVUCc1qkPs12Do8aXNPcxvW/eH7SpeZ3TWtK5m8ZTU3QWIV8cnK0bl1sEv8lxeQ5bl
 /bDAt1ER6B6NUL4V+z6BT8jHzc4yRilQFX5zncOv+1KLZtuBhhwmVKrn4dnYaaoiph6SQf9obSy
 YCd1Q6DK3ewRY2EQZWknHgpeDeJvDL8j626+2x6ygm4jTeBqmhpg/8JPBnqozKn3ps6S9jqQGh6
 UcIzPyG32tzEATynVD6aIPPUlxVzeotZfAU6Wa31+42RxVtrZtofHrKvVKyOTY=
X-Proofpoint-GUID: TKrmGkvK0j3VVUGAB7raz1xyOr3Dv8Wj
X-Authority-Analysis: v=2.4 cv=X71SKHTe c=1 sm=1 tr=0 ts=68c3f6f1 cx=c_pps
 a=FUT2VZ02y2sEaM13OGTzjA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=kj9zAlcOel0A:10 a=yJojWOMRYYMA:10 a=RWc_ulEos4gA:10
 a=m9ZXKl_lNSOlSQ1EGuAA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: TKrmGkvK0j3VVUGAB7raz1xyOr3Dv8Wj
X-Proofpoint-Spam-Reason: safe

On Fri, Sep 12, 2025 at 12:15:45PM +0200, Pierre-Louis Bossart wrote:
> On 9/11/25 15:07, Charles Keepax wrote:
> > On Thu, Sep 11, 2025 at 02:33:46PM +0200, Pierre-Louis Bossart wrote:
> >>> Once these timeouts exist we have to pick values for them,
> >>> because SDCA is a huge huge fan of asking you to wait for
> >>> something but not saying for how long. If you have any thoughts
> >>> on this that would be appreciated too, but mostly I will just
> >>> pluck some vaguely reasonable sounding values as I did for the
> >>> existing FDL timeouts.
> >>
> >> The SDCA 1.0 spec defines DisCo properties for UMP timeouts,
> >> just do a search for "ownership-transition-max-delay". Table 139
> >> page 236 defines this property specifically for XUs and hence
> >> the low-level protocol FDL is based on.
> >>
> >> The description reads:
> >>
> >> "
> >> The maximum time allowed for Device to change the
> >> ownership from Device to Host in an Rx UMP when Host
> >> Software is waiting for the owner to change back to Host.
> >> "
> >>
> >> As usual it's quite possible that platform firmware is broken
> >> with bad values, but the design intent was to provide a timeout
> >> value for software to use. Ignoring these properties doesn't
> >> seem quite right to me...
> > 
> > No, I had missed this property! That is excellent. Don't suppose
> > you have a similar magic touch with the "Wait until there are
> > no new requests for File Download" in the Class Software Load
> > Sequence?
> 
> Glad I was able to help!
> 
> The FDL state machine is rather complicated, I can't pretend
> understanding it fully :-(

Ha, you and me both.

> My limited understanding is that the Host doesn't control which
> firmware files need to be downloaded. The Device will provide
> detailed information back to the host. That's how I interpret
> the vague statement in Figure 213:
> 
> "Device interprets
> FDL_Host_request and perhaps
> requests one or more new
> FDL_Set_Index(es)."
> 
> IOW the number of sets to download is indicated in the
> FDLD_Needs_set control. Based on the bit pattern in Table 240,
> there can be up to 8 sets (3 bits).
> 
> The main issue I have is that the files will be transmitted
> by chunks. I am not quite sure who defines the size of
> the chunks, but each chunk should be handled by the same
> "ownership-transition-max-delay" property. It's rather odd that
> the timeout doesn't depend on the size of the chunk, but assuming
> this is correct the time to download should be bound by number of
> sets x number of chunks per set x ownership-transition-max-delay.

Our devices only download a since chunk so we haven't added
support yet for the indirect FDL yet. Which keeps things a
little simpler and means we can file work out the chunk size as a
problem for later. Although my rough interpretation of that bit
is that the chunk size is defined by the UMP buffer itself, so
basically the host fills the whole buffer each time, but if the
file is larger than the buffer it takes a few goes to send it all.

> That's the limited extended of my FDL "magic touch" I am afraid...

Yeah mainly my question was that it says "wait until" but I have
never been able to define what that wait is. One possible
interpretation is as soon as you see the device not requesting
FDL you can progress, but perhaps a safer interpretation is if
you see X milliseconds without an FDL request you can progress
which is what we have gone with in the code for now. Was really
just hoping you were going to be like "you also missed this other
useful DisCo property" :-)

But I am just about to push up a v2 so we can carry on the chats
on those.

Thanks,
Charles
