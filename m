Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3EB843BDA1;
	Thu, 13 Aug 2026 09:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786613926; cv=fail; b=CQ17fBM56gDICWSHlzvyNyntPgI34W+9H1foxGjmGbtq1H/sG/yeNa6p5sNemfcEI1z3qI9f+9YnSHQzPxEkec+bgExR6SCSLjF/B1r6BY6vD83ETtjBDGC9ckXpuTsaBFQ2wO2G7jg0yPR2Mw1O8oM4fkTN4T9icu14PtkqdQA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786613926; c=relaxed/simple;
	bh=YwxbCsWxIb8cZ2Y74PP7hSEk0GJwU7qUfYU5gNUst6M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vkv8fZaPMl0i9ciRoJlMR8ZQis83XLAXSg/rucVEk0fsNHRr/NyQ3MNOwdfyWW0JG8k59xVd5n9ZA2VcHTBkdzB6X63G5YACkKd/Qtr89q14QVO5dUX/7prhJujrGxFLMoimhbsgzYscqWoXDif9rSAkKuA/gVSo6DK7okyF7nU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=cdrbvVlA; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=B8A9Schr; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="cdrbvVlA";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="B8A9Schr"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67D4pLfQ1231356;
	Thu, 13 Aug 2026 04:38:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=nR2Bkyxw4gxPNaVZJ/
	RGRAeLsTCirJ+7zE/9u7IUSkA=; b=cdrbvVlAUj6otgwHLFwGQZyIhIuS3Vc5Vf
	TS+TI0WyZFoqQbL4q42zxQQIXMlsdFQX8E1vtnRS9PRVPgv7B+Z7CllziBPacXpH
	BY0gljq5G4/NAhYvD+wbtwEvgg35Sfii19XBJYKdoE9geZcHWngO9nN7Ya+h013z
	VrCqSTmqEU+ijkbxMZFuccBRmJXQfZ4y9FNH2ClO/hlvBhwmmLYBedw5FDt4n4yB
	DFAm240PyAvfCeUMhcuGQ+zAhKT0BdIdwxB3ph5XOy+/WTSJ8U+sqzlLFQHvSaXW
	vYe5fTi6LFTF72tNsHEH22dX8FjljMw26PL6S71bZ2tg/0PGBRZg==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020121.outbound.protection.outlook.com [52.101.56.121])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4fx1v11fq0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 13 Aug 2026 04:38:11 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U1hjtyEC5JmjxLHuq7wGe14yAB31c6Nci/EI2A/2OiqQYR5TsA546reBAA71G7VMLKuseZ02AQ1JsIGZEqRUxayAtmPicrB2MPUct36VQEYjuT603n+mRG99CUCljDb1PHDjz7cWqbOfpRujvBc7UIMGxlSGbX/UEs32hq4SWBaqxV9BVvVEe8uztBvFUbtg7FfKOBgVYnNpEI1Nvd3d29z+CpTJgMjqU0J/CLs3T9O1aZ2FaiZdflQzUFgo0dKjiIN4esishJcq5Xsgj9LKLfkUmfigIQhqV0tcj8Ah4b82H1TA5JJOEAx5SCuktZ0UIxo6+7OTgprIalP5knLA1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nR2Bkyxw4gxPNaVZJ/RGRAeLsTCirJ+7zE/9u7IUSkA=;
 b=v7DUDQLNefJKz/ADVuRvO5jls2sMzjTMe6XiLOaPvfELlcuVtCpe1f+3koORKMX9mfuq3Crob9rYbo3vnwnXKtfulHq+8PIRSQRjqk7h/IxxUndou+VVNmnBj3GRrdJfy54eiKfPXX9lbmkmxN1d4vGQC+oic7PHeJjswXXda+SsteXJ5kas8/nPfY46R3cGtlEVP7tv+ZDPjFNHOgptdOUaN8MilqfE8Eyfswfq9uPxRwTvZkWovye31wZTOBspIcxEGjjfv90VM2sm8+xpcrAqJgLQJoq66c1s+OvfwdfrHJYwpdMqRhLwDt1PRF6i1GfcoPI6jtkLnnEzRqX5Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=amd.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nR2Bkyxw4gxPNaVZJ/RGRAeLsTCirJ+7zE/9u7IUSkA=;
 b=B8A9Schr2OnKRQT1PlkCEw8XQbU/+q7N+gjWVBJfpCZ4sr0unfWkeMo85yuSas4jx0ZMXEcPasE/+NYpH0zmNZYQ/6PX7kHbTHIvFFvmPHEoOZ7tC1YSN7OZ3px5hoIIh0wGG/+9ly0ixp1BowqRRTEoPRQV3J8wInVaQYOX2fI=
Received: from CH3P220CA0027.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1e8::25)
 by MW3PR19MB4187.namprd19.prod.outlook.com (2603:10b6:303:49::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Thu, 13 Aug
 2026 09:38:07 +0000
Received: from CH2PEPF00000141.namprd02.prod.outlook.com
 (2603:10b6:610:1e8:cafe::23) by CH3P220CA0027.outlook.office365.com
 (2603:10b6:610:1e8::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.15 via Frontend Transport; Thu,
 13 Aug 2026 09:38:06 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH2PEPF00000141.mail.protection.outlook.com (10.167.244.74) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.3
 via Frontend Transport; Thu, 13 Aug 2026 09:38:06 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C0018406540;
	Thu, 13 Aug 2026 09:38:04 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id AB0C9820247;
	Thu, 13 Aug 2026 09:38:04 +0000 (UTC)
Date: Thu, 13 Aug 2026 10:38:03 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Ville Saarinen <wiza@saarinenkoti.fi>
Cc: Andrey Golovko <andrey.golovko@gmail.com>,
        Antoine Monnet <antoine@montane.tech>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
        Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Robin Everaars <robineveraars@pm.me>, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: ASoC: tas2783-sdw: no stereo channel split for two mono amps ->
 mono output (AMD ACP SoundWire, ASUS ProArt PX13)
Message-ID: <an2Qe72QRRfYZuGa@opensource.cirrus.com>
References: <29e8c08b-9475-4aba-bce0-6d4a45a26d3b@gmail.com>
 <778f017a-e1c2-4ab6-9968-6e4c6285180b@montane.tech>
 <cc1960d677a7f5a5c86d48c3037c0aa6@gmail.com>
 <20260813085558.64828-1-wiza@saarinenkoti.fi>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813085558.64828-1-wiza@saarinenkoti.fi>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000141:EE_|MW3PR19MB4187:EE_
X-MS-Office365-Filtering-Correlation-Id: e1adf9e7-33da-4789-5a23-08def91e9433
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|7416014|376014|23010399003|36860700016|16102099003|18002099003|22082099003|56012099006|11063799006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	MND9k5aJGCbdmwiS3FR3FqSoJ+BH594PDmehgdEHIfg5SR6+txWFKTroxFFF9X/rZSgQoUgUvMueWCUJAkpj2nKzYCwUj311qBqf9QJEgWoFqlBZA3joScwrd1bgNp/JeM/Wca5/PjGd4016XJ5S/Gjr5qi7CAY7gAESVO3qRAv9zSzr2KTV8xHptveHe2xi2xk0cFbNuhbMBQcfT0TUOh69vhctzxY/J5TUa6NxKy8NSxXsfon6eSakhgTL4GQxAOLKxrAWPrQr26Impngmjzu7WtL3mZ3eGr1iVGeoR2iOSd58r3SUalbs6mxES7ex7+xyvPu4NkTToRXHVYRzGle2TGYnwoLshmlt+iSk4XD1w/rgijNr4dy165jAIQpPnb84UsZfk6zYw3Cls46rIrTo/Pg4dxcihH1zk3MeBzOcaX8YbplPeFWHNViMweAoOI3eC4QGpXgHY1DHRTCEBLehr2ihWNDsQ7wbuW8YhRYhcB9LCrsPBVCL4VaAh1IIqHDztdxi7KnX/dM9sBlFOk08iWEFEAUB8uEP/wsiJbcKvA+g1MUR7WYmfzw8EUTQhFV7DuLh4glQz/ZMncDjH7H7HcPXnRLJciqPZrG4XNdAFKccUkkjFP4CXeLNXlyUjhO0371CP83tM6dVRY20x2WqgCIfJI03BMTPWiMoulp/jrsvGmdInSv29jZMmavK
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(7416014)(376014)(23010399003)(36860700016)(16102099003)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qhS0MXKArAA4vLe7osltUpJZcTIHofyVe4i1ZTqx9tYPcWKthjORNk/ao/RARrb9TPx51xz3GshlwBL84LJ7g6F0gnTVPNefqXwRrIRcpUFnxQssem47PAml5HnDuNRgqF8BK17YQhSZasAICNvZOl7BmVpc10sK//Pnt/YxtjrjLJXrBqST7CUO7xDu0WDcKCKobplF0syjbwLY2aMeLLySZbJjMqeLjBBcKME+jc25vgYd6LItl9EsI3V4pPWRdwUTQbXM15JKkjY1YkArPfBfeEAEnREGVgrDLF62lBY3/IPbNEEN70pZ5BuxyWdAckBQ85btns2djyvyiq9qYgZvMR0zDe5Pv2QCfxbH5ffqtjcnIyryy4BvTzd3GVI3vzZjcZNwsqxSskDu036OWjh9n01lBfoOaqG11gMDL7wBmm70Wrr78HunLT/MsvKx
X-Exchange-RoutingPolicyChecked:
	IjNqmJgdVRVhA5rDn+qyTy39eIlAWmaArboMnFJy9I8gCnvR/m//9kn4QK0eXDTjqNgTBKCXm1gHTCX4etkOg5Tk8BOuraRKScl9IaCX0UhwA2dHbJrEREQx3lnp2Ml6369iDUhV1UX9YEzCIudy4l8HJXdZpAqP0iAGEu805hdcu9v1fe3iopaWIccaVHEL3r65wjhEo3h06tELeeOetqauBqXcBrFip3aGIq+p0lNpRTY9d6P0Yjn8BB9lTsTAJZzF5QjzWGNFwOUvezM/q4A6FX7ie+L7XetzyA+vVqqw79Y00tKdEYKHW4cxWfLUHIqCMcskhrvvwMRfLpUWGw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 09:38:06.1551
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1adf9e7-33da-4789-5a23-08def91e9433
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH2PEPF00000141.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR19MB4187
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDA2NyBTYWx0ZWRfXwQIwTEU9Ved/
 9JtmNwbbPPOCu691IzGHWT9fDM+tO78jtxirApqPU7Wqb+x9BIloPh6VEqNePlJmhQmT9uNwMDN
 RdieVpaCJPjwvn2lrWt+te4WJsE2DiY=
X-Proofpoint-ORIG-GUID: crczdDBist-0V08rb5g6z6VOE4qgUu9Y
X-Proofpoint-GUID: crczdDBist-0V08rb5g6z6VOE4qgUu9Y
X-Authority-Analysis: v=2.4 cv=ZMrnX37b c=1 sm=1 tr=0 ts=6a7d9083 cx=c_pps
 a=Xv54+KyL7ikHs1a8OOIzxg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=xAxwfzeRDxOWVgmu43AA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDA2NyBTYWx0ZWRfX9BhWHJhDaj9P
 tEkPqn5UIikEJpNEb+pipy9UaCQzrKAsrVyRpkTOoyM7aIUVIKVXny5/L60jNzoM22P5h0sZTEz
 7ho7tAyZX5t1LN+AeDzj+9OhXA8hzD5Dm0EfPS5e4ARMZrjHIKirZc9Ft6UXRj/U6Gmvzi+vfxb
 r7Zwp0V+UEb+hR7dzuLAFheER80dEdFlZdkjghwDCQfkXz6MiWdCifWdWS4vyf3K+6bvonicjco
 ZxaEujZgHhsDVWGFmE9SBHI++dju3w7YdszAROtIFV6QjHE0Kh4VSSVEj/FOH14UFkuiV6+BlZa
 rw7607MT25L5c+Ac6ey799dFt/T9BPeOBpgUp1ejd9B2qpjUZzBALuFuMCAcexqYNE6hxjNatvX
 XS/Z7V003+JriwAXczM8bKprDe08a7AwtRuJpjLKIIt8myNKRLmk4WXQNVmqLGRHJ6lB7/l2ZZV
 AhNdTkQfYe8r02irLPg==
X-Proofpoint-Spam-Reason: safe

On Thu, Aug 13, 2026 at 08:56:26AM +0000, Ville Saarinen wrote:
> > Ville measured that UDMPU23 ClusterIndex is simply not implemented on
> > his TAS2783 revision, answering COMMAND_IGNORED to writes and to a
> > plain read alike, so that route is closed at least on that silicon.
> 
> Since this is headed for a changelog: the conclusion is right, but the
> stated reason was not something I had measured. COMMAND_IGNORED was my
> word, in an earlier mail, and it was an overstatement -- the host never
> sees it. find_response_code() (drivers/soundwire/bus.c) maps
> SDW_CMD_IGNORED to -ENODATA, and a control the peripheral does not
> implement arrives as -ENODATA too, so the return code cannot tell a
> deferral from an absence.
> 
> Charles, this is why you are on Cc: the same assumption is the premise
> of the .deferrable annotation on UDMPU23 Cluster Index in the patch you
> picked up, and it does not survive the measurement below.
> 
> The discriminator is Entity 0 Function Status bit 7 (FUNCTION_BUSY),
> which a deferred command sets until the Function finishes. I have now
> read it, on this board's two amps, via the SoundWire debugfs raw command
> interface -- sdw_nread_no_pm()/sdw_nwrite_no_pm(), so the driver's
> regmap is not in the path and readable_reg/mbq_size cannot colour the
> result:
> 
>   UDMPU23 Cluster Index, read:            -ENODATA
>   UDMPU23 Cluster Index, write:           -ENODATA
>   Function Status, 20 reads after each:   0x63, unchanged, ~200 us/read
>                                           FUNCTION_BUSY never set
> 
> in three states -- idle at PDE23 PS3, during playback at PS0, and forced
> to PS0 through PDE23 -- and identically on both amps.
> 
> Controls, so the result is falsifiable in both directions: PDE23 Actual
> Power State reads correctly, and a PDE23 Requested Power State write is
> accepted and moves Actual to PS0, so reads and writes both reach the
> device. A deliberately absent entity (0x3D) returns -ENODATA in every
> one of those states, indistinguishable from Cluster Index.
> 
> So the control is not deferring, powered or unpowered, on read or on
> write. "Not implemented" remains an inference rather than a datasheet,
> and a deferral shorter than one Function Status round trip (~200 us)
> would have been missed, but the deferral reading is the one thing this
> does rule out -- and that reading is what the .deferrable annotation
> encodes.

I am not sure I totally follow this, so apologies if I am getting
the wrong end of the stick, but this sounds like the solution
here is don't use a register in the driver that isn't implemented
in the device.

Thanks,
Charles
