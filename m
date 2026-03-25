Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2012E3D16E1
	for <linux-sound@vger.kernel.org>; Wed, 25 Mar 2026 14:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774448621; cv=fail; b=kgPQcoGEmj2RjPFzF0MQodsZ6Xq1VhMxu5zzKR4sifSI/TI3viGmYypSaXOqphefeSqdVHyapbVKusljeMIVQi7OMiBJcafvdNFccWbzERHOJ3i7hHhEDh8i9ukBwzpO+0IYl4E3A8huImoVSLmQE9oQE4BKYiVjb0laHDm28M0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774448621; c=relaxed/simple;
	bh=CE7alAOXM8+ia2C7PW5GQIfiT7hALNC+hQztpizSru4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CZDYn9XTMvBshuajqcTnQ2bdXSuSzV4udwjpRFzPNl9rn6fidz813xP7dNfCC7c8wr7jHJki0Vl0V8WAoIV4iUP7SHGJQGCfF4a/8kDepfeC3ImSGJrOAg60UriqeSrmKWwaOh//pepuI/vG6B9lgV8L8l3V7jIayPjiLoysXJE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=EmSgFgub; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=oEkn8WPt; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="EmSgFgub";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="oEkn8WPt"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P6aB8V1310760;
	Wed, 25 Mar 2026 09:23:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=zOmuPPFzHWNEPWiD5A
	h46UbXltC64Krc9ParxMOV4pE=; b=EmSgFgubjg5jvSVZHo6y1scX2auclRPMw/
	O/V7/1d9wHRmX0KsvRban0evMv2L5yeQ8YQ3ml/+NQ7bYiQdmU6/6TDdjUvA24Qs
	+Ucf/MXnYmq3EA8e9eumJaU0q4MZP/O0V79sJk1I3FhXVOMJjdokxYgDzd30qs6R
	JZgLVr3u1BBIzXRTZZh0ME21fIlTEO0IGi8+WDMO/iuPqQpYYe+YNbMzJoALH+Ye
	Aklh5y/9mi6NSBbxqRpzegNEPMu9uc4ZslBWM1eyNWsjIMd6uLoqQzFWeUS70hGx
	RVgQieNsyurkME8DEww+4yYxwNyBMLJe0houO+0JwTjT5/NUuWUw==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022111.outbound.protection.outlook.com [52.101.43.111])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4d1rqxvu8b-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 25 Mar 2026 09:23:15 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VQBnXVthz5kDnt5QrjFUaRf/tP4u+QcNxoTZ4j9NJPxVAEpOoIiDL9aesDp8rsz38hCF3RDLjaiRQ56l9dyoaDKeg6oufdwIiu5aGNEb2M28pRd3Tf/t6thDbA+h3bDRw62FsF+SyygzD/nDwg00rdkT3dUeIfkx0YhaKNWnu5F8gN97XFgcYhZhPw5jtcXrLJzvQYhzcZ2oebvVUxJCm9w3dIU0DojGlLy7frz/BxDu1wnEsYo/hh06oZiC6xFRqCzOnhmjlEHoCcw1etpfPhVAcrR7GEqOajCM0YZ+7De5jGs23ZU8XYoXdP8g3VqEti38XnX2haXOGXLgxx4/Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zOmuPPFzHWNEPWiD5Ah46UbXltC64Krc9ParxMOV4pE=;
 b=qgOTZjhVspVqwxM7fd1A1KHOy58uZHOLAZpU6BeHwPlGTJeXR1r1SQYKu3I6YsGEnzwSpiwB6dI0h7Y3t/yIbyk4iWsheoXaQ3IczootJXmAzj8ge1wFnhjmSxP3Kds3MagwUzM2xv9HdkuIeppVg2lvqvbv48bKcNKhGOlDCtvK70DfVBF2G1gfcWALBVJzF75C000BHMXdSisCAbtKVRHHyrtYrY6PySu3gZoATAFkXe/EFM8xZ6mY2IhLnLFxe4mWKxs+wg6H27y/VjXKDt1A8Gq7aO4gAdPnieRjvkdLU/XgNYGBdvL0gYACJXBXUp9yYR8EHO1c49gngI7uFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=gmail.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zOmuPPFzHWNEPWiD5Ah46UbXltC64Krc9ParxMOV4pE=;
 b=oEkn8WPt7uizXLe6TOPQlW91ei6GTKBRcGJDue6hL8b6ZuI994qCT9orb7O1Cyo4lsAy3siB1TVfwW6jbauhxkJqE/9wORmTQGg+N6ZQC+5xEi2MyaB0e+21ewS4aZzlz8c4g4eMgxGhbIEpesnduCMVEEOJhH9WUpXRKZvmb0E=
Received: from BYAPR05CA0102.namprd05.prod.outlook.com (2603:10b6:a03:e0::43)
 by MN0PR19MB5754.namprd19.prod.outlook.com (2603:10b6:208:375::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 14:23:09 +0000
Received: from MWH0EPF000C618E.namprd02.prod.outlook.com
 (2603:10b6:a03:e0:cafe::55) by BYAPR05CA0102.outlook.office365.com
 (2603:10b6:a03:e0::43) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.20 via Frontend Transport; Wed,
 25 Mar 2026 14:23:09 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000C618E.mail.protection.outlook.com (10.167.249.100) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.21
 via Frontend Transport; Wed, 25 Mar 2026 14:23:08 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id DE757406550;
	Wed, 25 Mar 2026 14:23:06 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id C9865820247;
	Wed, 25 Mar 2026 14:23:06 +0000 (UTC)
Date: Wed, 25 Mar 2026 14:23:05 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: shumingf@realtek.com
Cc: broonie@kernel.org, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        lars@metafoo.de, flove@realtek.com, oder_chiou@realtek.com,
        jack.yu@realtek.com, derek.fang@realtek.com
Subject: Re: [PATCH v2 2/2] ASoC: SDCA: fix finding wrong entity
Message-ID: <acPvyZiPnOiTayPH@opensource.cirrus.com>
References: <20260325110406.3232420-1-shumingf@realtek.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325110406.3232420-1-shumingf@realtek.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C618E:EE_|MN0PR19MB5754:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a894468-b344-4519-37c5-08de8a7a09b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|61400799027|376014|82310400026|18002099003|16102099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	A6tO/tsjuuWD9a6K6h+m2gOaf/oo8iR62Lascsy+0rOFq6EOR/ZPI6zwEgfrnC77ov8xagQuq5DtPdm0x0n0l3AsfspnvZS1Yuw40Jcvzcw2Cog0L+E6LRA/Vjh9c9/uKtuh08IFUCpanSFkBUMoh8Aw1oCorTuE8Kz11ladRMZSaZ1fHrYpYAkhIEiGYrriXwZlvrNy9pjeIhvSSLzQ5fH/oRanVgv+6dyiRybT/Xtp2S9poJ1MeRZM881cb6F3EnGKvQOKMXUOAClwVWEjG+QHxHX6lhyrzCYHXUwXvunsbEMTZQ/l3VeSWPtvZ2JPwzLIlpFygku5ruxcI1G4nUguPNqVjiTIBD2V5iz4F1bYrItp5JwJ9C4XGKDeWA3xYvDVzzCPoisZDUqPDMIB8mmUXPj2CX3cIvCEaIrLyNVeoBlGtu7c7WDXqaJALz/uwy2UkxuDvdvUShAA+9Vm4wup6spVAIwEpIUTJrVbLJCKh+wMXUHV8exGnr23tFH086IrJVZy8mt88fErROO6fJHnsYIHVByFhe56zcvH1uofx7oK05TBznf5OJDI1qX5CH+v3N2nhQDD/DkopEWVBSULAHp4UNdDBpQd/G9zucQEwJJ23WE6mf4lQTrOwl8o2V86KM8TIGW+Jmeo0RfFv+cUpZQGuxhedBD1QWtOTMIAzscGSI9gaZI4puwrv2xRA/miGOHvKIkhJesn+6asWHu2pCSKIgolSpVWZ1/O+RwZInkACBuLXH1o9bPBC4dV47cDfgkBeW3FTM+7TjlvuQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(61400799027)(376014)(82310400026)(18002099003)(16102099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Brm98tK8+se1exK3gttmHE/+Z5zV5Zi+QlCUrXREifER8ksb8NWl8mdSraEaMXQnWZEl0xpcAGi0iyKNYibPqecWw5bVfsENt8NPWC5Z5HWeysRpmvL4Ln4+6S1n1bQArXlpf9LKYK4xP2gDf6d27q7lTcm2PlWTznLwIxtESoHQcKNFkOonQ0PbufHGFOKUcanHTri9rnSN0qqiZ5FKGEw75wiGFgWhTx8C3od4ihBwaqOJ+ujGVI//FeHMBQeCBMPNBgXqM2P4AU++nqsId9SU2bLUAny4TZw5ayIi2F0VHSS85NVLjmF1ulJrzY3XraEW8PepxmmA82ALHcY6NAS2J7VdpPPoQZE1ugUhQ18ciLlxfoqZl6b1Y8ws8jJJm4pjpyRI37JPuBCEm+kjQIvJekbqOOYESd5B6oN5znDCxe4bd6G3Za5byTaFILiU
X-Exchange-RoutingPolicyChecked:
	VyfON+Mw7e6lbMMicvpk3twB+cm6yPUXLwOGHEO1KVRcnGQTVODF06rib1wFt//VvICyIhFJQ9k/gyRgFuHZSBjfmiyHj6LowIbbe6GTFaV1vRQydvhHE3SvWrRhiRrRwOAZ5sGSaJrkB3DHa7txioypaaOzu30bhL1VBVak0kzcAtIvTC+zHPINgjHBqrLMzQ8m2GBRuFt9HCYz9XDaGrfiCzFjYHHoqbgnU1a6Lg8m077ztzXLndFU+rsVVVDGg7GhzTepnUzPpz/gUhoQrcdIyvOOGm7FCLvqe9nAAHysgYEcRDh4foKsnJ7WRwQIiZ+v2bNb63VL4xlb7pLA+A==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 14:23:08.1814
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a894468-b344-4519-37c5-08de8a7a09b0
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000C618E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR19MB5754
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDEwMyBTYWx0ZWRfX54zdFqrosOQu
 BG0ei5F4lJYYkhceqSaYojLycZ/n4Fh/FPhLF1GiD9/Rf4PprDOV/e9i931m4KAWhoOB9tSsA3X
 jL0kFRFLsWeY1+ngLToMIm/swwc5L5iXFU4JmHRdFYub7SXckXV3nPVHvq8Z9YPVEFOXptfijk7
 eC4W3Bu3s19C38uLSrGPyExlKjys24dXXAJ1eWWj2M8p5sQyhHoFGIMt0L0oIWHSodD6H8pAlyz
 fINtY2bWBeH1rDNyvzJ0ft7OFbaTXU+XwpbHW3hW9PYEgG1bXCc/yT5fzDSjs9LTY1Cr/zZXLev
 v0zcif7LSn7ptuzA9Odew5mH9Wi0qi3aSY8Ov1mGS5Vui1eiKZpNfNm5wyMNHVrTdXp9fZqFmWN
 biV3tBJ242iJolleQhaO793EDSfz1KGjqbqYs/t+Ub5jlrem9+pHZbPQhFFjEiR8UyuGCy24gUv
 jVU1nuKldkzPXtVmxhA==
X-Authority-Analysis: v=2.4 cv=DKiCIiNb c=1 sm=1 tr=0 ts=69c3efd3 cx=c_pps
 a=Gg7HfhqIPUY1o8E1DfVvqA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=n9Sqmae0AAAA:8 a=w1d2syhTAAAA:8 a=_jcflPutsmBtAD2ua_QA:9 a=CjuIK1q_8ugA:10
 a=UmAUUZEt6-oIqEbegvw9:22
X-Proofpoint-ORIG-GUID: jT9iQUuXifEC4sVvyptNVICx7lVZA3AF
X-Proofpoint-GUID: jT9iQUuXifEC4sVvyptNVICx7lVZA3AF
X-Proofpoint-Spam-Reason: safe

On Wed, Mar 25, 2026 at 07:04:06PM +0800, shumingf@realtek.com wrote:
> From: Shuming Fan <shumingf@realtek.com>
> 
> This patch fixes an issue like:
> where searching for the entity 'FU 11' could incorrectly match 'FU 113' first.
> The driver should first perform an exact match on the full string name.
> If no exact match is found, it can then fall back to a partial match.
> 
> Fixes: 48fa77af2f4a ("ASoC: SDCA: Add terminal type into input/output widget name")
> Signed-off-by: Shuming Fan <shumingf@realtek.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
