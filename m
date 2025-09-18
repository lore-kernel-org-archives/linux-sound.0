Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BA528750B
	for <linux-sound@vger.kernel.org>; Thu, 18 Sep 2025 10:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758191119; cv=fail; b=SovYcN5YOt/n0jba3IHbzEMO+e8KCAG5pvh6KvheJk+k4iEu6JfLjnjcpWDqE0U+kK9wPUqVNYVht5nQcnCFPVFcL+I1DC8FMIXX7/0Z/bJ8bSH+sW6fCcXej8UYiJg7ZDcMJXZVCVvIQkPXJwvqsLOb/VrGKVNnmJYARLjkac8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758191119; c=relaxed/simple;
	bh=eyMMG8uy1AYSjyeTDTsiItVv5NiI9ECbpkGMbHNbU0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YWPs0oDlqigoWOOccT0DRoz+BiQWZL87hb0taBLmjmO87o1lnzfzC8ezmRf8Z8pD/kjmOUJ1M8kRIEF5yaNhNwPtYl9L6o0ZDc/DGUIlyOzmUbIwKaxAUZ4y4CsReva2lZHmLBujlx4Ur8F8G5isZQZR/dpIB6dLr3E4yjjwgHM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=QRE7LTv8; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Fd+2g6cA; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="QRE7LTv8";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Fd+2g6cA"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58HJQtFB2719007;
	Thu, 18 Sep 2025 05:25:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=uNJ7Vwmt7KkIMMfSx0
	LENwPgAzMoEUH1k/oNAaKl9ng=; b=QRE7LTv8AavMz3gMI7YaV7ooLjGo3gUJJr
	66ZYvuGiC6ZF55/gcdlTxJUYZ9wL5vhlBAdCWZRooTxLMDeawaj0g4JCPPxEyaCY
	M3RntLeyT3m5sufQGSeslbfXmJGrKtL8/m9DtK74FcW3O1XZND/FRJwc+2vBTO3U
	+b/kIJr/e1eCt0Z97VRtG5T2ICKc5wWJiD1Zs9w5f++ZFy1bQ3YhxBJ5f6Ge2v6/
	kxToJ8DGyHy6RDzJH2hYeM4/Ly0UXfhkI/xuguQINqBDQ8TuKWpqm+ZpLzvH7kqO
	g0xAhtngsav5ZeGerPmZqyPe78JpShYUuJHOhVudt7ck+/mbcBYQ==
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2126.outbound.protection.outlook.com [40.107.94.126])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 497fyktehm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 18 Sep 2025 05:25:00 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E81jcuE53GNH27Wd+qH1ceA23FoH7KuZLbmnHr31XsTLJBrPsfF21y4CiN23trimjwMks6obhBAuJnQoUQlCJp+gmtekS1ieUslo9rUE8b+FP1EzjJgGF0CHbD8AAdzk00cORopRoc2ctkgmTPmTFfjvVDlzvA130cx1V9QALRipccne14jTmBFP7Dzb7fSBB/ZBNWBbcSaxDRmoLZsO53gAdB6pG5Gq/SGfdm1wsS0svwQmu6HnfYbXan5cy39uGwdysvfE065JTN+WzOpXmJilXBLwU0wtQbNblBcpY81HqwA81XkN/yHg+f0MjbSWulGyNIrpgNQyN6jKd6N9UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uNJ7Vwmt7KkIMMfSx0LENwPgAzMoEUH1k/oNAaKl9ng=;
 b=rBRpqb+mv5toIkpV7c1GXv0XTCi/hOhpo9gx3s6RpVLlzU/uE4lTqovBsi8hBY9LKTqajaOc+mSzSHpb2QSGlmCFlZ9P7Cvz8GJlpugajv5VRcMMZMKq0xJtjh9C5aX1uPpG2n3Iw1rvry8tSukWQL8eipkdgn0gIdcvqdYf7fEDSe0FsNHUp/o5IJQ+NV5piKhS4bB16GfjAkRSUvOLM71l1gu1zCBXE4xTlPmC53EZUC78C+CeXZWNdbetIDsGK9ouO0kACDvQ3lq0N3I0vrSlgALODQE5BoxysXgdwmZj3QB9z1SnyeYW8FJ0FzCy/nz+s8SlQaX1T0Po30aXdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uNJ7Vwmt7KkIMMfSx0LENwPgAzMoEUH1k/oNAaKl9ng=;
 b=Fd+2g6cAdhRCVN/HszX3A2LLnGeux4gEkZK9Yz42HMVJmvs2qSzZ35KXHdNMrcmRIEk52QLYbK1GWwsXjEJA6sQexXx7PXYJ9W3QbRBwfwOPNLPlojLGbRWuNun1iRE3jWnPKo5SNEQotAaBEw5dCa/3Oe6dJ0ezACcLRM2ZWCM=
Received: from SN4PR0501CA0109.namprd05.prod.outlook.com
 (2603:10b6:803:42::26) by DS0PR19MB7864.namprd19.prod.outlook.com
 (2603:10b6:8:155::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Thu, 18 Sep
 2025 10:24:57 +0000
Received: from SN1PEPF00036F40.namprd05.prod.outlook.com
 (2603:10b6:803:42:cafe::8e) by SN4PR0501CA0109.outlook.office365.com
 (2603:10b6:803:42::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.12 via Frontend Transport; Thu,
 18 Sep 2025 10:24:57 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF00036F40.mail.protection.outlook.com (10.167.248.24) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.12
 via Frontend Transport; Thu, 18 Sep 2025 10:24:55 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 7EF9F406547;
	Thu, 18 Sep 2025 10:24:54 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 67DDE820247;
	Thu, 18 Sep 2025 10:24:54 +0000 (UTC)
Date: Thu, 18 Sep 2025 11:24:53 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: broonie@kernel.org, rafael@kernel.org, yung-chuan.liao@linux.intel.com,
        peter.ujfalusi@linux.intel.com, shumingf@realtek.com,
        lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH v2 10/19] ASoC: SDCA: Parse XU Entity properties
Message-ID: <aMvd9XR03Lazr6NX@opensource.cirrus.com>
References: <20250912103504.2679226-1-ckeepax@opensource.cirrus.com>
 <20250912103504.2679226-11-ckeepax@opensource.cirrus.com>
 <10209600-42bf-4be1-8ad4-bf60db6f3d28@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10209600-42bf-4be1-8ad4-bf60db6f3d28@linux.dev>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F40:EE_|DS0PR19MB7864:EE_
X-MS-Office365-Filtering-Correlation-Id: 528e5912-1a12-4d8b-a4c8-08ddf69d9ce6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|61400799027|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vw0v2kx2tNI8qewFyaQnwfaL6OfyPpXbLWUL6VxpxjT6I5fabsuMTjTo5JCz?=
 =?us-ascii?Q?0w4hbVVpx3+Tqi5DFfKb7S2gYuHZSWh8mD+n7CxdpZkyBXKevzrxLU8w0Riz?=
 =?us-ascii?Q?MczEe7CyHnGfOd3Ug7Kk3DnTL4cX6JvGTBykiM2Ie+pA6Mpx2lGPl8p4ZooO?=
 =?us-ascii?Q?i9+PXhOTceyKPpVnPqlJxGGEFdJLmkq5SuFYopyUyXJAmesOSM2I/GPQ0/ja?=
 =?us-ascii?Q?CewXXmkJiTwIWs+d5WK0zwsfLVICK1n0rWWN23t6xv5xCHudT513kwqtPmZa?=
 =?us-ascii?Q?XNBd4PY+DZIfXvEdLhFqTEpM/QN3z+idXmKX1zk83rEfyIE64LrNKEP3LnGC?=
 =?us-ascii?Q?DBTB2JVJX65j8zCKqtheCKthC66mao5Vxxy/ZvDBCq2d77IiZH8pAyVLP69c?=
 =?us-ascii?Q?FsYHptmHuxoyEXqentbgKQZe7k0ehgDi9a8IckYM962nI18ivqrJCaa95LcO?=
 =?us-ascii?Q?8Gqs7iL+Fp1+a8u+gcvOkWGZdCA1n5XReCLl3PEoMckVhLuh8JirsvCOFLjp?=
 =?us-ascii?Q?rlASNs0TeJEjXOcbKhkHGr+sraKqw7TRiyhucddXVPlS5lr03AOp7mtsPxCV?=
 =?us-ascii?Q?TzhLERxpqUn390K/t7BnlgUI3UknYhiCgQQtj7vfHaWMmlLX34+MvozNhxsh?=
 =?us-ascii?Q?feA+Pyy1Nvzzq3fLdgfQdkxW7EsWB5UdFJEjuINIOlxbeO61E8hvjiiSKgEA?=
 =?us-ascii?Q?Tc98fth5IaPq1DEXXQOvoYKtFcxpiDtCOZFUOurfPkYaqqYinLtbPcIKZRwA?=
 =?us-ascii?Q?VhLV1SYqhWzH/f3ei1lgEV1vlyOF0QEUUEvBpkB2DUczEWj9mKq4FxS5Oo7K?=
 =?us-ascii?Q?/DnDurgnaWlHvwJ79n+k0RGsdm84K4sCL/vc1yVOeeutDPphBW3xPlkhGGlo?=
 =?us-ascii?Q?FObvFeSNBiAbtwtcW97cFhwQKxU74/lTInjuaGd/M6gQeK4mG5CsaRqU8fYw?=
 =?us-ascii?Q?xCSkPhW7bRBc7CRlkpEoZjbSZAdn518Yy+ruAvzO9XkMDECABNqJPLbLhrBk?=
 =?us-ascii?Q?dz343ieYr9j+MbeKEOOGWxXniVawaGHE4+zHLZu3OG7NjtTu68eqlDGdVYnK?=
 =?us-ascii?Q?qhwRFACDwF7/MIWU/koSfsXZqKzp+PuxCquPU7+UC4TxuMJjTvEcCp6g3j/h?=
 =?us-ascii?Q?Z30D5H/2elQLhEcGjvxdvtHfmrn2L5n3p6AxPz9fssPpmtQ5yzsJq+Yd1vHV?=
 =?us-ascii?Q?mQysqcHl5JmNP5XvQRu1Ry4HdzFvYG/wuFVNiES2CxIFUGvezirCxy+E/Ner?=
 =?us-ascii?Q?UkVIImKg5OEpI0lCJjNqbBQ/rdn5ehdKW6iDdpfL+qhzp9e1z2r7yw5GBbXn?=
 =?us-ascii?Q?be8oJ5PRsS8QQZHpFn81s6qy3tmFzxnEkuYmassGTlQK9TIJebEugjEZ5PHp?=
 =?us-ascii?Q?6wylTxHZIRFBldmab5+zvVC4QJXqn8Mzrhfdt7YFbRX0V2ltZ1rW1b6EDueZ?=
 =?us-ascii?Q?/uwMwgKMbgcLpkNdKVrLceHOCQBtoQ4lvFHUeNhw4eP5hbvFx5MjaaPi9/9t?=
 =?us-ascii?Q?OrWdAjfRF8uPXbSkAOzGH1J3b+iqNP37ceLX?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(61400799027)(82310400026)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 10:24:55.6422
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 528e5912-1a12-4d8b-a4c8-08ddf69d9ce6
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF00036F40.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR19MB7864
X-Proofpoint-GUID: Z5A3ATP4DBCx6yuwqWCb9VgmWXJms2fV
X-Proofpoint-ORIG-GUID: Z5A3ATP4DBCx6yuwqWCb9VgmWXJms2fV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE4MDA5NiBTYWx0ZWRfX9Hac++bIyUEW
 v0d1iLgcALXTCyCL5I7DlramQYOwOQ6Rpl9LgiBaKmisRTIwVQ8JEOkCis+rZ36dK8ve498/osE
 WCilmIIPl9upUjjDTYUnpjD0vsDdcSS29Lh+kL5/Eecu2mGAVWUedrrttJBkWnOarlh5G1VsJhe
 5IrEpZ+iQeWizAsSBEccU6yqhgk3b6gP7YNCZpeecgeCNHkgcl2DUbROgOpy+yrUiAQbNJoFEPx
 F09+VIZ9nD1YuH4Iq7dRpsmHhktML2HvCqDwAHP60cCAaSqFt0fpyoEceJUSqMGcmbga/ZJCbS8
 5n52wMx6gvpyTGh6ceHxuX8KwZumMFC2o06+2q02kdsn3f0rlsJWoCDbZP4rH0=
X-Authority-Analysis: v=2.4 cv=KvRN2XWN c=1 sm=1 tr=0 ts=68cbddfc cx=c_pps
 a=dBTsQuOS/+lY8TR7GNd4mg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=kj9zAlcOel0A:10 a=yJojWOMRYYMA:10 a=RWc_ulEos4gA:10
 a=EWQyMwWYAs0qTi1NqyQA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Reason: safe

On Wed, Sep 17, 2025 at 08:58:51PM +0200, Pierre-Louis Bossart wrote:
> 
> > +/**
> > + * enum sdca_xu_reset_machanism - SDCA FDL Resets
> > + */
> > +enum sdca_xu_reset_mechanism {
> > +	SDCA_XU_RESET_FUNCTION				= 0x0,
> > +	SDCA_XU_RESET_DEVICE				= 0x1,
> > +	SDCA_XU_RESET_BUS				= 0x2,
> > +};
> 
> It'd be worth explaining how the last two might work? The
> RESET_BUS is puzzling, if the controller performs a hard reset
> then in theory the device should lose all context. Likewise
> a RESET_DEVICE should cause the SoundWire device to fall
> off the bus and lose context as well, and in the case of a
> multi-function device it could be fun if each function causes
> a device reset. This could end-up in a boot-loop, no?

I mean yeah that one seems problematic to implement to me, but
table 322 in v1.1 defines these three resets. Its up to the
implementation of the device to pick one that works for it.

> > +static int find_sdca_entity_xu(struct device *dev,
> > +			       struct fwnode_handle *entity_node,
> > +			       struct sdca_entity *entity)
> > +{
> > +	struct sdca_entity_xu *xu = &entity->xu;
> > +	u32 tmp;
> > +	int ret;
> > +
> > +	ret = fwnode_property_read_u32(entity_node,
> > +				       "mipi-sdca-RxUMP-ownership-transition-max-delay",
> > +				       &tmp);
> > +	if (!ret)
> > +		xu->max_delay = tmp;
> 
> maybe add a sanity check on the value?
> 
> > +	ret = fwnode_property_read_u32(entity_node, "mipi-sdca-FDL-reset-mechanism",
> > +				       &tmp);
> > +	if (!ret)
> > +		xu->reset_mechanism = tmp;
> 
> same here?

None of the existing delays are sanity checking, so I think I
would vote for leaving this as future work. It would make more
sense to add it to all delays rather than just the subset we are
adding there.

Thanks,
Charles
