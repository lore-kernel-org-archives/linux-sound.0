Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCBD72E285C
	for <linux-sound@vger.kernel.org>; Tue, 13 Jan 2026 17:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768325256; cv=fail; b=o86/QRaHLSyJtBp2nA1YiYMaTZlxz9gIrF6GmUhXYnImcu4i13qeu8AyulL4H5ktrS9mqIykHMRsF7ZF1H4fJledgoAsmoA+tEiAzv/1sHLjFMY3UVYihs8zyQS2odetiMIJgieMzoM7lwHxIbMdDjtFgr8DhAANit+7gQYmm6A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768325256; c=relaxed/simple;
	bh=GUsA7h7g1xneb+zngm3CMSxPINYDfEMcPUNHOkeSNqE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WAfq6qBgs2NHntu9wf67ll9tqvtdB03HIqHSQ9HkE4PufIU7XwnYFTOnIr4PJfIwG8UUJ8THcO4DupCkRa9FZxA50Yv02qw5NtwUMFI9kXsZcMEStYA8/0NUhL7hUjFhiWQUwM7oAzbp3fDTCQ5TooCtx+bzY+mcLgGJsfBQN5k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=X/Rnf6om; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=fG42ZP+n; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="X/Rnf6om";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="fG42ZP+n"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D570ns151079;
	Tue, 13 Jan 2026 11:27:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=YbkFC8YgtPtfP1WCWr
	mRRd6aldhTFKa9C8U1UvEh3Lo=; b=X/Rnf6om2r1TwNQ8c11HtT7DxarbIC8jSh
	M2VfSsE7NB0bvDnFGlt70FPq4ro+LSRgNm2V1ENCFCWxUuXXonH3e0Fn9Dj134E5
	A1qioXuLfWB+BJxwLxyAAQebTNK0DkJu+kw4j60DEHPUCgqR/zh78jmLrfNvcKzy
	KJ2MQ9odWznIdq3gWdIXxLWV8Ff8syPbYgNjqDCLO5mPH9svSFkCjnb7gCtwRKix
	gdhBIKBqY17rUZn6g//QS9KoQfTs3W39dm0Ogrz/tOCQRLbd1byGH4QBWyAnufJx
	QVn4CitNKLJ792TosQTvDzcfcB6xwRumnvWTX2n3SB7FRwIH//xw==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11023102.outbound.protection.outlook.com [40.93.196.102])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4bkn203a9f-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 13 Jan 2026 11:27:17 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rX5v6Ih+LmC7B76P0eKJRVZhIV37llOd6q+g9x10zK/hs3gqjjsEj9cMGtG3EP4uVIBmFZTns6gGTcJSYTA1OrnlVWf8+np9mArUGJBQ7/sKDDiXwddMZpsSPZYmpFvtQp1V68Sjo3AJx7QN+sAsajuivjXs/rzg6lednocFrtywCPm3vIOA7nCAprYSEoYoD5HPoW41CUgqcmS9ZruSYLKb0h8pkAy683Ov6gtnbeXMmpm3wocykg2OFKbr2ePkdZur+ohCGfhucell81mCFV2BVJ/4BuJF1HNydKrxM5rX0m3ZT0Xa79KAF/lkvlGqa2zKwQKqxeA+D+AZLzjiyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YbkFC8YgtPtfP1WCWrmRRd6aldhTFKa9C8U1UvEh3Lo=;
 b=Mp3OJwr2QYquJvCbCVmJVRjmd8xGf69JRZov1FNekzX290cyl1ECcVxrEfg0emCZOihC4kPrkzuo5vAS6TCvmAqfL6k8tvZGQRnFfaDzh+/auJ9W9XParzPp0L1ZIAq/yTWZUz7Wo6L+xI/XcRv8dlTfje8dG/rkfGElJdwEiF+HOoHoEfFNBZ+E3FV2FAKJ0rRUPgu0HT+piU1hGgu94hUYbm7Me3uJ0UGV0K+Pk3nf99m7e0/dTr+S1vXytSBGvVxzgjgK42ImNygPnfxuPRmV1o4CuQqks4yGMfWhO3BgW39R/JuOQ9f7L0DS5q1HtvyOguovHLQZj2JRQ62bSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YbkFC8YgtPtfP1WCWrmRRd6aldhTFKa9C8U1UvEh3Lo=;
 b=fG42ZP+n1HcNr8CsKUwp7priZk3jEgwDfyL0PtFJ1NPKLeChvqBFFb5ocXcww+DLh7f2D9HBmIaXFV9cv1CenPVS17HRe2k5KZlVxG3bCzwD/hKvv8HffsjvABvIyVA/dP4NELNtY6STtQFm4mKBj2MI6ZfSp5WjO6rHEArPNNI=
Received: from SJ0PR03CA0270.namprd03.prod.outlook.com (2603:10b6:a03:3a0::35)
 by BY5PR19MB3843.namprd19.prod.outlook.com (2603:10b6:a03:226::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 17:27:13 +0000
Received: from CO1PEPF000042A9.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::de) by SJ0PR03CA0270.outlook.office365.com
 (2603:10b6:a03:3a0::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.4 via Frontend Transport; Tue,
 13 Jan 2026 17:27:11 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CO1PEPF000042A9.mail.protection.outlook.com (10.167.243.38) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.1
 via Frontend Transport; Tue, 13 Jan 2026 17:27:12 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id E0C2D40654A;
	Tue, 13 Jan 2026 17:27:10 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id C7087820249;
	Tue, 13 Jan 2026 17:27:10 +0000 (UTC)
Date: Tue, 13 Jan 2026 17:27:09 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>, broonie@kernel.org,
        vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        peter.ujfalusi@linux.intel.com, shumingf@realtek.com,
        lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH 3/4] ASoC: SDCA: Add basic SDCA class driver
Message-ID: <aWaAbaDiuJlCnL1Q@opensource.cirrus.com>
References: <13c14d26-29ba-4d39-b96a-b12b97935d33@linux.dev>
 <aQOEREIJ8TiwZHef@opensource.cirrus.com>
 <a855b919-d21a-4564-a901-fc09e68a9087@opensource.cirrus.com>
 <382ce438-5251-4d4d-af44-863197c77b94@linux.dev>
 <aQo0d3UWKinyzTYT@opensource.cirrus.com>
 <5dcb51e4-e9e1-4b26-816a-90c92fbb200d@linux.dev>
 <aTlDoVxI0gJMQOuw@opensource.cirrus.com>
 <0c9837fd-5ca8-464a-b365-a2e2bed3d9e4@linux.dev>
 <aV0HDh57C2gdtYc5@opensource.cirrus.com>
 <030c6d7f-cccd-414f-a2b7-51df88c7991f@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <030c6d7f-cccd-414f-a2b7-51df88c7991f@linux.dev>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A9:EE_|BY5PR19MB3843:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ba752bf-2ce8-435c-58b0-08de52c8fd25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|61400799027|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QyGjpokgmul8Ktarzcg9YN2jt+sOY73dKQGKtFf8Wx4Pzlozr/Hw8jqF4bWm?=
 =?us-ascii?Q?KffM3fJBPhXnVYkhkJryVoHauRVh23sC7+NbJ+rCD5LvtD1aQ3DpNqTZz8Vu?=
 =?us-ascii?Q?+Z5cLxSXYlFJUFl0MEVb5s5eksSzvjfoU6b9EuWuXet0jiOUEeLg9ZLG6lpq?=
 =?us-ascii?Q?Sho0Zg/yWTqC4KlZncuw9oGA+4DYhBrL2uI9U3HU7mc25TaObtR0dLT4kwsP?=
 =?us-ascii?Q?5MnnxZZwMFtYD2J4WoNG8xTOctAS4iY7xOJYIC5KTp6wDEWteFqjBCNowQsP?=
 =?us-ascii?Q?tfW0BbKG+6VTbTA4ttoksCiHqQPkBbxQlsI3RRUSWjzZON/6LrXbVnFZ7HAJ?=
 =?us-ascii?Q?12z9sXuIOFjkCUTR5uf9CFuF3hgPTghWARVJanQ/V0f23Dwh5sGnGY8UmiPg?=
 =?us-ascii?Q?RjwjAfdnIVbRXeykKvlgwfnTjBPWwylG18ZzrXBhhrlgeTYAeRaN6s4B3lMi?=
 =?us-ascii?Q?0PrklSDXDlieSEL9GyDV3FLnpVGFMy8ngpC0R04cPSNxTlQfCwqJlBBrNabI?=
 =?us-ascii?Q?0k1+3zLtS0YbyOyhvXRHscJblfqVQnwg5tUQ/d3NnK9bdibQ0heWXvNLHFrk?=
 =?us-ascii?Q?R1Xdy7/NEXMU8VJuSEIfbvVnuUDWLOia+394xhmBmndHwM5dfX1kuM3kiJ0R?=
 =?us-ascii?Q?pXBhYzYfXnj+7qGU82YfcIDmEmguFuhegEieILqLP9WU9V9czxRAKtpnPCJX?=
 =?us-ascii?Q?xvm4TYJVv0fTUzhqqyT51adCd7dXrV1rz4dTwa2bfohbGW/PpUCoSBwjRjMG?=
 =?us-ascii?Q?EHm0P5Kr03qxuhTxSmTIneBTnMZzuDz107jv5BapvrJSUL5PJrwoMZ0OhSsg?=
 =?us-ascii?Q?VHPGzPGHxizXO2QzE1phmWDeBIcHBmzebI5ma26iNEXi6a/Sh4bIR2/OxdeM?=
 =?us-ascii?Q?kKqXmtODsyyxrLz24tyFKGefzoxxouo5vMSrosXoKFvzbBwik+8X6PQYuA2h?=
 =?us-ascii?Q?S6S3/RXD+Gv320hra9olR6v0pQOZ3kz3+PU5rweiqj7KMuSjhiPhzUTOai5p?=
 =?us-ascii?Q?EjA9kDag8oNdjbucC1yLibQ5Hcn/OF1lbCAP8sP7lWJnyVuRSjVCYMAWFzgw?=
 =?us-ascii?Q?5m/b+Dtqyiaz9e6kjk8lJxnaGGB9A7/t22cO/4pCXC0p9I8Y4jMi0LnViQV0?=
 =?us-ascii?Q?vNQWEtdidwbSlAI3L1ShnF7Nn5iRYmL07SIWjiz7oMBbl7iHSyP3al/UGd2U?=
 =?us-ascii?Q?DpQUHn5Mdsqy4bDrLbEf94c43DXT9ABfRL3OyBFx/wJaNb2sofbDDExJNvPf?=
 =?us-ascii?Q?QAwGDjnefQHtH8BLQwlUZ9ejZnEHSU3EjgyR/hhjzHqoKI5FDk3QG+C68cWy?=
 =?us-ascii?Q?y8Y4MBBcWRP/y/VeNfO/7+CHJJqjCnlScat/I+fqfMDpzOcm6wt/UZ+L+Di9?=
 =?us-ascii?Q?N/besEL+tyLXxDC2tMBnZGB3zcSCf+YXdqqnFgjlM1PnNItnaZzwYSK6g7n7?=
 =?us-ascii?Q?jMAEo3O0dFiKhLFSKBWeahs3bUP2EIsgrY4I2V53Mz2H2aYJsNYO8v5Ufjf+?=
 =?us-ascii?Q?FQDI9QYgej6AbjVYRJKxYyHf12K/T4j85J2NkLgmZTVPhRiHXHU2oUaJW9ZW?=
 =?us-ascii?Q?2CHkzKR8gNKa3M24/e8=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(61400799027)(54012099003);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 17:27:12.3949
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ba752bf-2ce8-435c-58b0-08de52c8fd25
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF000042A9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR19MB3843
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE0NSBTYWx0ZWRfX8MKtBdSfV6Lo
 bgH0tbRE/29tPP6sbdrZqPv4Xcj9Bl6yfRMdmQizSkoi9cIHGjkXpUKGcILD1C80rxiTH3arRGo
 JiNCwPNW1xZ0kLlK0dg9Kr77pp1Cl04Vf3YUgm/nx64XV1NIevq+sTpnfBt5dEF8a0o8uR4nFWa
 A5K7dPaGxfisxKWkdjfZ7v+QHpzec3hF65BhBWNgvpFF7nbswKPo/i2I4DGSEZcLp5K1HCZ6sjC
 ME4uK+3qy62JbW9uyEr06rlvI3Z2y3fwPMiLK2PywG0UMeVGh8iRuOhYoIqUms9zYYHZ+/0bbWQ
 sWHEiH293v7+v0UPUHxVHkTf+91dIHeX96k4My9fwaZpve8UByxYcjLJrMi9X0dHilBkY7WOPkL
 zSFpWfUXlRd8Vze2C37UA05PJa4pm/FLuatFPx1SD7rSVzwt4meWeEPumvKdFhZI17qKc2UB1QW
 gU2OfjDSoeh+pDaJAOQ==
X-Authority-Analysis: v=2.4 cv=LPVrgZW9 c=1 sm=1 tr=0 ts=69668076 cx=c_pps
 a=9MoqB078x+EmXT3bS47rQQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=m-sObxSO_DTsdHn6HuAA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: VEOGQ7nxCj3J42YKtNeCoIWvX36B4Snr
X-Proofpoint-ORIG-GUID: VEOGQ7nxCj3J42YKtNeCoIWvX36B4Snr
X-Proofpoint-Spam-Reason: safe

On Tue, Jan 06, 2026 at 06:10:06PM +0100, Pierre-Louis Bossart wrote:
> On 1/6/26 13:58, Charles Keepax wrote:
> > On Sat, Dec 20, 2025 at 12:04:47PM +0100, Pierre-Louis Bossart wrote:
> >> On 12/10/25 10:55, Charles Keepax wrote:
> >>> On Tue, Dec 09, 2025 at 12:47:06PM +0000, Pierre-Louis Bossart wrote:
> >> The only issue I have with it is whether one would deregister
> >> the child device on a soft reset or whenever the device
> >> loses sync? It'd be somewhat ugly to do so, but then again
> >> we have the issue that for the second enumeration we already
> >> have a probed child driver, which would bring us back to an
> >> async model really. The 'beauty' of the current model is
> >> that the probe does nothing really, everything happens at
> >> enumeration/sync loss. If we dynamically add/remove child
> >> devices it'll be 'fun' really quickly.
> > 
> > Yeah that is one of the questions I have pondered a few times.
> > Were I usually get to is separating out expected cases of
> > something dropping off the bus and unexpected cases. For say
> > suspend/resume it is quite likely the device will drop off the
> > bus and that is expected and probably shouldn't result in the
> > child drivers being removed, as it will as you say become 'fun'
> > very quickly. However, an unexpected drop off the bus during
> > normal operation is really a pretty fatal error. In many ways the
> > best thing to do is probably to remove the child drivers in this
> > case, since that will tear down the sound card, and allow
> > everything to be rebuilt. But these are far from fully formed
> > ideas, for the most part at the moment we just report things went
> > bad.
> 
> A device falling off the bus is not that rare in early
> bring-up or experimental platforms.  IIRC some devices will
> require a full reset after firmware download.  Not to mention
> the glitches that can be seen consistently after clock stop
> on some platforms.

So doing a reset after firmware download should be fine, I would
consider than an expected drop off.

> My take is that it's better to 'hide' some of the low-level
> detail and keep the card visible to apps, always.

I would agree here, it is better if the card stays present and
hides non-error states.

> That means the drivers need to deal with cases where accesses
> to devices might be delayed due to slow sync or sync loss. As
> long as everything recovers we are good to go.

Yeah that is a point we slightly disagree on, I really am not
a huge fan of auto-recovery stuff. Been involved in too many
situations where the auto-recovery recovers *most* of the time
and takes a 1/10 fail to a 1/10000 fail.

Taking this case, if the device loses sync during audio that
is gonna glitch the audio, which makes it a problem I will be
expected to fix. I would rather get a report the audio stopped
with a log up to that point, than get reports of audio glitches.

> >> That's precisely the problem, the model assumes something
> >> that is broken left and right in practice.
> >> Exhibit A is the PCI/HDaudio parts where we rely on an async
> >> probe due to the module handling.
> > 
> > I think I am perhaps not totally familiar with the issues on the
> > PCI/HDaudio side. What is the primary issue here?
> 
> The HDAudio side loads different modules, which can take a lot
> of time. For that reason, the driver probe returns immediately
> but most of the processing is done in a workqueue. This leads
> to two problems
> a) if the processing fails for some reason, we have no way
>    of signaling any error.
> b) if the card is created independently from the PCI driver,
>    e.g. with ACPI information, then we have no way of telling
>    that the resources needed by the card are available.

I mean sure it does make the boot look faster, but is it really
faster as the devices weren't actually ready when we told
user-space they were? And now we have to deal with the problems
outlined here, as well as what happens if user-space/another
driver tries to use the device whilst it is in this
not-quite-ready state. It feels like we sacrifice quite a lot
for appearing faster.

> >> You also have devices that require firmware download to be
> >> functional, or some sort of internal ramp-up needed.
> > 
> > Yeah these can be fairly annoying. But both of these can be
> > tackled with either handling the situation in probe, or if that
> > makes boot too slow, moving to a similar child driver approach.
> 
> Both options are not so good IMHO...

What is it you dislike about them? Just the slower boot, or
something more fundamental?

Thanks,
Charles
