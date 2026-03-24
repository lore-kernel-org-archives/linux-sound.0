Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010056.outbound.protection.outlook.com [52.101.61.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41391ACED5;
	Tue, 24 Mar 2026 03:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774323389; cv=fail; b=gSEaIkEdTKE/q2dkaRVnF7ZVraAdCkrEpDCUxCx58WTIXTnOx3z1CGlrUSX/W01EK5Go5QZHcLQyqMxQUHYXd9uZaOT76QbaDLB5aOz15Fbvs/Tu6BjQvnUIQmlVJd7tBcyDl+NrFXF5MRxKilq+pWg9TyJk+b3qVLwWekcCgJk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774323389; c=relaxed/simple;
	bh=mV8kd7NDJe1YZQYSeNvC5DtW3DgtKw6u7nXVH6vTZKo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=oLfyDoA18lMpQaGu9hUjUptalPsJWjHsWy9w6ouIoJNknvDGmcBdMK9YHeGKyv61m64LQv1S/pWf2rhQiJuDVOIEOrdqIo1MdEnzOb98fdroFVq62vUUZr2qbk+KTkSr7xxZRxePJ9LEo6SIO3jnu7ZXaXz7xe+uReofe7O3dgc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=fZTxp1Ts; arc=fail smtp.client-ip=52.101.61.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="fZTxp1Ts"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t54McUNavMD7xexO8pWM5AHIxjVpWP2XWkT11lz0VBCulf0aCujjbFHpeMB1IPk2ZjLcSk4ewbIVO4Rmh5rKPoSoKnj/Gxp/UWWqh4H9LcPKR6VuC1EX+hF8zEegyNfZgbnlfvXMiISTZ6KUMwN2DhGVnpd8FFcFwZmJoaP9CWK5CLnZCg4wN0bCYzWIrLOwVSB1Jpm8ibzk3Kqemz2YC9ZpVOtuAV9PpuZe0LaOQ5BQfszZF1YbGqwoMfAqtWvbWqxWd8ZFOA0FJNFs7Zo1XFXSMdozS00qMm9NGfVI9BzSP4TTDgZV2cKQs/Ugamv7gXKhiX1TRskuAz8M6vFMqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fYDDK3+nbav1LW0bMM0Pux20wP6E2fHgtYN4KmH3GU8=;
 b=cGgG8dBQOaATDvpCDMr3TkYJQCZ3JagPvzQht2vxB0qaQo47Rf+2KVhS6IGu2wfQEKl5lQSUYlN7CMZBroUtcnJoqMFypNu3mzirOnGAMTPe30vDn1zZzGMO+5BQ81qjkAaozc0cMZMbPNj9RZOjBI8ifUbwRFNq3IO3mWYTAzowpQYQJ12NYYQtP5RnNOpH2hotDOZzdm0uqSvMELRLIl8Q9UZN+KPtkwAVKvK9bmMVBZa4oSolCqxCoBnW6T+OYuc6Len8wBdyBWl3feOyJD+ofgoa86bUgDzcJIwRjSvPg5dFmN4E/3mm9Xw555JtTFs3qqHLqdwvxND/Zw2+rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fYDDK3+nbav1LW0bMM0Pux20wP6E2fHgtYN4KmH3GU8=;
 b=fZTxp1Ts9qR0FAUTd0mP75QinWE50fTmmjigXtYkuNJ7uJRgrdR4IHvaqGLwsHlj+fnm1qgSbIQEcs/ahhRi4XIlxCoCFtlu1f8BJDoBB7xCCrpekWR6NQX2S8ID8NHEgNyU2wukrf2wWLRdRYvnjPi6Ty/dYLqt9bY5n0iRoyo=
Received: from PH8PR07CA0015.namprd07.prod.outlook.com (2603:10b6:510:2cd::20)
 by SA1PR10MB997630.namprd10.prod.outlook.com (2603:10b6:806:4b4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 03:36:25 +0000
Received: from SN1PEPF0002BA4D.namprd03.prod.outlook.com
 (2603:10b6:510:2cd:cafe::28) by PH8PR07CA0015.outlook.office365.com
 (2603:10b6:510:2cd::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Tue,
 24 Mar 2026 03:36:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SN1PEPF0002BA4D.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Tue, 24 Mar 2026 03:36:24 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Mar
 2026 22:36:24 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Mar
 2026 22:36:24 -0500
Received: from DLEE204.ent.ti.com ([fe80::81dc:e6c6:4c37:9bc6]) by
 DLEE204.ent.ti.com ([fe80::81dc:e6c6:4c37:9bc6%14]) with mapi id
 15.02.2562.020; Mon, 23 Mar 2026 22:36:24 -0500
From: "Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>
To: Mark Brown <broonie@kernel.org>, "pierre-louis.bossart@linux.dev"
	<pierre-louis.bossart@linux.dev>
CC: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>, "perex@perex.cz"
	<perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
	"cezary.rojewski@intel.com" <cezary.rojewski@intel.com>,
	"peter.ujfalusi@linux.intel.com" <peter.ujfalusi@linux.intel.com>,
	"yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>,
	"ranjani.sridharan@linux.intel.com" <ranjani.sridharan@linux.intel.com>,
	"kai.vehmanen@linux.intel.com" <kai.vehmanen@linux.intel.com>, "Xu, Baojun"
	<baojun.xu@ti.com>, "Ding, Shenghao" <shenghao-ding@ti.com>, "Kasargod,
 Sandeep" <sandeepk@ti.com>, "Hampiholi, Vallabha" <v-hampiholi@ti.com>
Subject: Re: [PATCH v1 1/4] ASoC: sdw_utils: add vendor_id to
 asoc_sdw_codec_info
Thread-Topic: [PATCH v1 1/4] ASoC: sdw_utils: add vendor_id to
 asoc_sdw_codec_info
Thread-Index: AQHcuz9jiFd5QBzwtE6Pp0LcYAYpvg==
Date: Tue, 24 Mar 2026 03:36:23 +0000
Message-ID: <3ee4864ab7b647d09c58b70ffdfa5d66@ti.com>
References: <20260323041505.2088-1-niranjan.hy@ti.com>
 <8fd1e3d6-c3ca-4b6d-bd36-4ef9f4b6de8a@sirena.org.uk>
In-Reply-To: <8fd1e3d6-c3ca-4b6d-bd36-4ef9f4b6de8a@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-c2processedorg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4D:EE_|SA1PR10MB997630:EE_
X-MS-Office365-Filtering-Correlation-Id: ba66b92b-d3bf-4ef0-1a4c-08de8956866b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|7416014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	3yn19ImOEy12HJZunQzgzCkD+uJaRz3qVlLQcbsZ8CrSoyuYgxqbXCb6E3KcWhcPCjOpDNMdrFfheIZTvBInw1hMFEuFP9uiZ13FBKgsdn+o4sajiDYn1lBupsPUJu8YDojdH9WCu8E+x/Bw6wxBcPpU0o2YNw3qTDp9paCEQPh8v4qusn7yolD3fjEZmKpkIb/rNf/dJEzEzHn/P/ITOEFgARTLHT3dZxAcF40rQXoeevZ1Dfc11K3BcqVQfMj/l8gSBBQF9MmTTWOyrraVbBTjg/1IMLMK9sAq6Q1AsKjiIPmWS5nM/EOOKROrBaKuMNQioaDJBOgWC+bk+iB72I5kNjU760tqLGIFbPF0Sq3HN2L+tjAO4zdtg3PUy3DS14S9ij7wqTnTSfQLeumVOy+/WlnxE2urqEl1zx6QbA/+IigIL4AE9pJzJOKZGdlvnt4cmANRZHehf2fL7tJJWalz7qgnJWJOxUqpdvlv/Qf90or8WWSiJxUdCVmdPhJHgLtD9Mqb1h6keeDn+ga4fZ25HKKCUSRqnoSMumJFdPgIGiHW5mH+gycgcZ8TCUzsXhQMGwzEPtT7YLwHkw6KZxXwaHF8aWhvmGmaQzJ020CKnWKHY1Skeo8zck45cc4q709fO+xfwnKiV1QhIsCRmjUuIKn1j8zb1mTShOJSXrv1B7s2Vhbzh94Z2SXqrs/BJQHRbMVKBBUiHC4v7gqXbw==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(7416014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	GOXa5T3u3eOM7lospE/ODbM2jfwq3WvIzg4L+jDyfPNobu7dklC+jYpEWKoLKzsKT6o1AQg7g7yJo1G+zGh01C/lzkjiL1oLBTbjJN2aYzz7mE3ZN0dJdGOYZN7P8YzlUPxFpL+nmFDRe6AooE8pCrB59PrOIq+ZdK58tEWHIr1hvCmqwZvAYh4EBPraK5Wn+EyrgugI3boaYnRsn/Y923myTDbSxvdGbwK8plUhFLx0Q5TXpWnP6UGJdVf90F2On4lmqucunlmRcduBHSltXybIUMQKJW+Jy+g5sLM7Eh6arK4eNgogWiifejEfKvQdOsYPPxEx7FGjks5W6lXeRt3xrYjlhm7xoeS51RXE2KYUBi1lrY0y7Xi4/FnJCrz2em5T1JFgw+bFC1mjW3vzSJBUvMCu+tR0lLdx4FfuRQvVzGn/FgT+I9iXuAERllWN
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 03:36:24.7945
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba66b92b-d3bf-4ef0-1a4c-08de8956866b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB997630

> On 03:45-20260324, Mark Brown wrote:
> Subject: Re: [PATCH v1 1/4] ASoC: sdw_utils: add vendor_id to asoc_sdw_co=
dec_info
> On Mon, Mar 23, 2026 at 09:45:05AM +0530, Niranjan H Y wrote:
> >  struct asoc_sdw_codec_info has part_id which is not
> > sufficient to uniquely identify devices. This change
> > adds the vendor_id field and updates the codec_info
> > list with the corresponding vendor id as per the
> > Manufacturer's id in https://mid.mipi.org/
>=20
> Does this need rebasing against current code, there were some Cirrus
> machines added recently?
I will rebase and send this one patch alone first based on Pierre-Louis Bos=
sart's comments.

Regards
Niranjan
