Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013035.outbound.protection.outlook.com [40.107.201.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF193168E1;
	Thu, 30 Apr 2026 11:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777548087; cv=fail; b=KyOf28C+NaGiw6rb93lLhjkoaa3vTsIzqjNmSi/bhotIlVdvRYqIoEl/a4Q6X4M3zn4nR436R4KIVYF+vE6mA/VYMQK8L96BWD8715R8nGPWd+4VGirUKcIV4Uyb1dTi/usXaoDAuq2X4UpBBGpxpDTTMDu9CK/RvQRmOyYhEus=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777548087; c=relaxed/simple;
	bh=xRSaU+8i7woTJooeEXmNZyjaM6ZxrHk9ikKfCdr3gjk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=oSFsEo+Q9m3bS1pJbEs83ZKdjdUMdFhu8NKVqXFvI+vaj1vD8/p4BGKHoZJ2Vzg5YrArNM0DfmGhRhBTHA3s3Tg4HMYvk+ZrhSQpwU92A6Gxw0azvEEEa3R5N/E0var3X8vPK8nMj3fMZvV+anUhDAN9/Fq8uvfa8NpmBJOPStk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=neV1XuDF; arc=fail smtp.client-ip=40.107.201.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="neV1XuDF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JnvSAt/1lzpSYgpQGLIVPywHmCQESzrW4fWGR0ysctg9zgWQQ9sBShCpaEwu2ylkM8JMumJ319NaK0F169Rho0Uw4JBFWvkRiAe64YNCCBrQSYpsrIodz1ORDXwuEyCCMirob0c/HsHM7JZLKfNHlbUBX03swIilIgBP7LnYrjtf7olNoh7KcSjFukSjuovMnAnjBOOq5uWUQ8vrhV0bgNoiXauIIZQrLs4jm0dzLPQNjG62bj7xfpi8DlsOz/WSMcJBP+DPECRcgWELs4kasSG6tsjFDS2bwMwlwBvOxz+NNrMkkyuF0AI13r63NbB2U1L+JYrOYDs5ZpPaE23B8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xmwcmVH5xurQDvXJDrV/1hplMZTJfQaWMxAPBUuEhjU=;
 b=SkXToB3vb2R6WIznuvNEu9ALHCcdSmdYfRTXEbMcOABRT7csmFOoqvCzsyKF86Q1ergwHqm38zdzY5m08kDtbg8HZcbtamj4+VzPvU1VTggZmv/AmKk3BRmoeQ+apnAOB78fG5qs+gcSZdPcBrb7esDjrK1mPWEZXx1OYf7SPH8w6AkNiV+2AdDnfBGFPoCXWvoPfvWfhNyCm5vcaKEJCMafkbzqvm1gwpNMKvw+cFICxttMQzVOZpOg7Kx3H6C0c256SDFUki4Om4BQsBQqCxOhPvyM08LncvBzyGeu2FWOMZ8SkL8Lnr0ggRg7C3nZHM92UZHOL4lnpdfnzZivLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xmwcmVH5xurQDvXJDrV/1hplMZTJfQaWMxAPBUuEhjU=;
 b=neV1XuDFZ+I3JfpdM4SjiDEGt6pTMITBuhP3QTAJ/wzf2CbgNu28NsGlDSHwyPR51sxO/BBTAIwMvo/7gKLu+3S9RgUgPn8rz6AWFceAFJv183XfNI6XkIvuuZy8jq7aBCv1agVaxs+VtgVMdSAPPQ5NW9vKBvjXxGgYrcFT+uI=
Received: from CYZPR17CA0010.namprd17.prod.outlook.com (2603:10b6:930:8c::12)
 by CY8PR10MB7194.namprd10.prod.outlook.com (2603:10b6:930:77::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 11:21:21 +0000
Received: from CH1PEPF0000A345.namprd04.prod.outlook.com
 (2603:10b6:930:8c:cafe::9b) by CYZPR17CA0010.outlook.office365.com
 (2603:10b6:930:8c::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.21 via Frontend Transport; Thu,
 30 Apr 2026 11:21:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH1PEPF0000A345.mail.protection.outlook.com (10.167.244.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Thu, 30 Apr 2026 11:21:21 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 30 Apr
 2026 06:21:12 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 30 Apr
 2026 06:21:12 -0500
Received: from DLEE204.ent.ti.com ([fe80::81dc:e6c6:4c37:9bc6]) by
 DLEE204.ent.ti.com ([fe80::81dc:e6c6:4c37:9bc6%14]) with mapi id
 15.02.2562.020; Thu, 30 Apr 2026 06:21:12 -0500
From: "Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>
To: Mark Brown <broonie@kernel.org>
CC: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"ckeepax@opensource.cirrus.com" <ckeepax@opensource.cirrus.com>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>, "perex@perex.cz"
	<perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
	"cezary.rojewski@intel.com" <cezary.rojewski@intel.com>,
	"peter.ujfalusi@linux.intel.com" <peter.ujfalusi@linux.intel.com>,
	"yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>,
	"ranjani.sridharan@linux.intel.com" <ranjani.sridharan@linux.intel.com>,
	"kai.vehmanen@linux.intel.com" <kai.vehmanen@linux.intel.com>,
	"pierre-louis.bossart@linux.dev" <pierre-louis.bossart@linux.dev>, "Xu,
 Baojun" <baojun.xu@ti.com>, "Ding, Shenghao" <shenghao-ding@ti.com>,
	"Kasargod, Sandeep" <sandeepk@ti.com>, "Hampiholi, Vallabha"
	<v-hampiholi@ti.com>
Subject: Re: [PATCH v13 1/4] ASoC: SDCA: Add PDE verification reusable helper
Thread-Topic: [PATCH v13 1/4] ASoC: SDCA: Add PDE verification reusable helper
Thread-Index: AQHc2JNzndceWa7RuE+Tye1X93xR3w==
Date: Thu, 30 Apr 2026 11:21:11 +0000
Message-ID: <bf2728235dd9445b94f762fcea09e685@ti.com>
References: <20260430072324.2183-1-niranjan.hy@ti.com>
 <afM1ib1iQG0ha5l_@sirena.co.uk>
In-Reply-To: <afM1ib1iQG0ha5l_@sirena.co.uk>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A345:EE_|CY8PR10MB7194:EE_
X-MS-Office365-Filtering-Correlation-Id: 97b0816a-5b32-4057-cfdd-08dea6aa9b40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|7416014|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	D71qnot/7t9lsEHlzWvDFmDYM5/Ci74MPfHfsx4zHJgaUu34ObHFgiPuHBloHa35q/zR5fosughaf9aFacjKXr9B/0O2QMQHj49zjJoQK/peYZ2yPRkibsr7uFtA3Kxo4f9O+iDm88/CHYELPRsVYwpkww26+j9L4fPDe+pD2PspIkX7ewYMaaaFwcAKB8Ee0M9/RbZDGx6f3e/qx+C1EYWojd1yChWqVScQG3BHA1RvkOmd5keSXRVhcNpjU/TO02c4FQziPM0q+K/h0aaVMLzhUOO+CWEnOBM037f4YREnRJJNnadv3wRjflVrtiJGUHQ8dqZCGsmzq2/jHcfY2LysZdZkVOtkUA9jDiTsp0X1FIcjCRxckJtvWXQd4byjmZWYNuuEMghMhQOqqIOR+cfZ5qvcHD/7y1/oaDsSo7gHXE1cDYD/Aa0cSCBAQC04DqAKb/U0smpkxNecXCdA8xXPEqgpFGEh2OO/qbr3+JoaafZFhquuOP/9OqzNJh7BZ9sEUqUahe6254vuxwGxxkEL/2a7GqMqA4HMolf/HMopezxBZm5W6yeldNRhINBkGxklFewr+eSXzldl9wnIjE16u2cbCDpCyGZln7peHpXFv6i3rLWJsnA36rxu66CyE0nKVQ9RYWE6niWjvAc/jXINavjAxCwYdxDBAi/i4XSdtuvGUIHTFUJQc0HAarPM1S7TG8UwCh0ns9BRRYcMxP+oGEzMXU1IhwSIw7dQfZfrK4c8Uylr7BmF60nMwEkMdoRpV6mK5G34fK3PvCYmQQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(7416014)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/Byr0BUb10V3NNcpVP6n54fKzO3czR+ci6cWgf7rscWF2VYIcNVrOgh5K3G29UBbqPtIlmu+SJMNJIuEMIRe5MKJvn/v2dGJd0RGJGzbnepwQ9OPu0kistsZdMPRS1F9clQjCRecZ74zfppVVuJSMjuarUezVgJPCBfy33HdRIUCw+tfkYJweh+LKyFJjvKdzzKgebCBd+f1831B31SclS352Ih2sTAfu9xUdIe/SN6T2VKeM9cSVh5NCQcZzP59R1ztw0dko+qwV+oHDwtkBUMfDosWKXbAKkw+H2YZaHNZZrF/n1ejtxgrWNdRFpjYmPvkGH2W5gqcFXwH4NEXtSsI/gGovFoBJLOrehUwL7Wup7TYibgVsNTEZ061wY++i8orHmRoGwfTGD023WPLyQ08OUhCdDWZIf5WqncjL9TLgPi9dHvUF+siDCRcPzYk
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 11:21:21.1596
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97b0816a-5b32-4057-cfdd-08dea6aa9b40
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A345.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7194

> On 16:27-20260430, Mark Brown wrote:
> Subject: Re: [PATCH v13 1/4] ASoC: SDCA: Add PDE verification reusable he=
lper
> On Thu, Apr 30, 2026 at 12:53:21PM +0530, Niranjan H Y wrote:
> >   Implement sdca_asoc_pde_ensure_ps() helper function to poll for PDE
> > power state transitions. Per SDCA specification, after writing
> > REQUESTED_PS, drivers must poll ACTUAL_PS until the target power state
> > is reached.
>=20
> You've not copied me on the rest of the series so I don't know what's
> going on with dependencies.  When sending a patch series it is important
> to ensure that all the various maintainers understand what the
> relationship between the patches as the expecation is that there will be
> interdependencies.  Either copy everyone on the whole series or at least
> copy them on the cover letter and explain what's going on.  If there are
> no strong interdependencies then it's generally simplest to just send
> the patches separately to avoid any possible confusion.

My apologies, I am yet to send the rest of the series.
Accidentally sent this alone. Next time I will send all the patches at once=
.

Sorry for the inconvenience.=20

Regards
Niranjan


