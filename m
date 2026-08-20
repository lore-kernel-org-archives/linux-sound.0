Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC1838B7BA;
	Thu, 20 Aug 2026 05:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787202438; cv=fail; b=XR4PDzby6lMSfdGYDFuPAoOfJrpxdI94Ubqtt6XXDNAOzUM30jt396kHV0WAYrwy/DGyzNj1c3XOK8wW9dfIlsGO9HZQp/w+cUA2qH+dTPbSlsLll1/UhFxwv2yg0ZGXB/LtI6aDctZTtXwfUzpfJRQopG4tvloh5vIQvPUGC9w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787202438; c=relaxed/simple;
	bh=kqSw7SpbIlJjTvfxrV1shabymzM3d7qh8ZJzM+OLVWA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iSKT4w9gZRNW5Dmt9BxlkH2uzLw/QIY6jCT/zubOIM48fBaj0OdLGngmtCPKmwIcvr2+vFmykzOES7PJw7BH6sISQgrJq0psb1vgapymLp+Nb8c1BeGZ41O98LxRxLH2/Zo4NaWk2ezfq4gDKRDvp6dHxnnUBcaxrb6I5nXnNFs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=Qpl9DyC0; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=KlQM/TVZ; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="Qpl9DyC0";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="KlQM/TVZ"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K1F10O3543348;
	Thu, 20 Aug 2026 00:06:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=t3DCcrqcaVXCIYN08u4WPe3CT+Z6Bg47Vxnk6Jika
	PY=; b=Qpl9DyC0ck1NjGIOjxTVMhz2xbJx3lMlg4ru6b5/F2LYDqUTaQZdAKr7I
	dY/HP4ISyRGB83eHQ+DRlHCGStiGXjN05CaGL/Bfun96Qw7SncrWFOKRyU42RSSK
	R0e88GO3YYfypeVDiJSAPBVivD36m6f1eFjGrN4jDC5BsZGrODQT2rYZygAdHVWX
	A7ofDI0GtutEmSYl2eAGmpiDs6iFKj9Zf1YZ8s8IdlcSrilmf4l8eMrVbAYynfC9
	vzItcHIKSCHVWneyr1Jo+YPsX8kjHx6G40lA2ZQ+nbKx+bRDqCiOSqHm6GM+KL5y
	71EiLH0V2vDB3I2XlB/JNGd7OSTcA==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013052.outbound.protection.outlook.com [40.93.196.52])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4g5qrk94x3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 20 Aug 2026 00:06:52 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p6y7Gy49IaJrE0k0wsIDWSXg05P4yHYyz70rl9pfF1SzpVQXNbLqQzHaFDOBk+3KzN7CMmk15aPVVN9Od5s7COk1T0bvrnPlaxe32NxG9CLqDxpHchDLkTO50b2UZ3cUAN40K0EtdLl5mSAxrRtRe+qrZa+zhD2xq2eDT13reEk/rnG492n7zFlCf7n93w3hTnOP19ZIyR92GX+M25C/GeNPcX2L21zOGnADjTr56x8LxtJdtrqwQLahrofm/PikgC7rn69MnW4TMSd/oSJjTeCxPlUJw3rgzhmYm6DuwymKKF2/SHKhWzyur1aDxc6syBSEuKp6y/QtKzjcya0EPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t3DCcrqcaVXCIYN08u4WPe3CT+Z6Bg47Vxnk6JikaPY=;
 b=BHmUgCVc+YnNwUwr/5qkNKXhqBHKCL1NmmI5VTsmqzw5HSSnvQXJBJZ0oUS7mBRUcWefznx4TtiX2aC09b05Lo4y7m/+nnU6j0zEWmuGFwtfffYfdo5zGjZOfFGFN/4Okf6lnskH4ZbodNmS1LTnIzBatu+o7u6feXITsByWx8xMV6Z5aI9QNIR+CDAL+vwn+/2d3AVF6BKswylKhFo6JqxJWpgOo9VSPxDGaVtS23sS3mfYnF3n8Gjl4gNj93kAr4bZrAwIp8EOTTjXZDnLk7wIFvIZYq8LWl+yCXpwNwRiHr7N2OS9LUA/7252NvWJ374NVwNz1S9e9ve/4RDcww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t3DCcrqcaVXCIYN08u4WPe3CT+Z6Bg47Vxnk6JikaPY=;
 b=KlQM/TVZ+obPLXI2fCIuP8Z2mtGlf/DTgaHaVJE4d4Dakw6sbZWN6FF5jV1vLdX3535tYzBymioKwMX0PTaY5TWWumOYxz/4MQaIRoARRDiP7RxNqc7VIRMN2kBfR3zBTHIxh/fNIm0WzDbbNw4Hm8uN2+60Y3Sx/ZIlo1TYnyM=
Received: from BN9PR03CA0885.namprd03.prod.outlook.com (2603:10b6:408:13c::20)
 by DM4PR10MB6813.namprd10.prod.outlook.com (2603:10b6:8:10b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 05:06:49 +0000
Received: from BL6PEPF0001AB51.namprd04.prod.outlook.com
 (2603:10b6:408:13c:cafe::2f) by BN9PR03CA0885.outlook.office365.com
 (2603:10b6:408:13c::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.8 via Frontend Transport; Thu, 20
 Aug 2026 05:06:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL6PEPF0001AB51.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Thu, 20 Aug 2026 05:06:48 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 00:06:46 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 00:06:46 -0500
Received: from DLEE204.ent.ti.com ([fe80::d7f6:c8c9:f453:6bdf]) by
 DLEE204.ent.ti.com ([fe80::d7f6:c8c9:f453:6bdf%14]) with mapi id
 15.02.2562.045; Thu, 20 Aug 2026 00:06:46 -0500
From: "Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>
To: Mark Brown <broonie@kernel.org>
CC: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "ckeepax@opensource.cirrus.com" <ckeepax@opensource.cirrus.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "perex@perex.cz"
	<perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
        "cezary.rojewski@intel.com" <cezary.rojewski@intel.com>,
        "peter.ujfalusi@linux.intel.com" <peter.ujfalusi@linux.intel.com>,
        "yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>,
        "kai.vehmanen@linux.intel.com" <kai.vehmanen@linux.intel.com>,
        "pierre-louis.bossart@linux.dev" <pierre-louis.bossart@linux.dev>,
        "Xu,
 Baojun" <baojun.xu@ti.com>,
        "Ding, Shenghao" <shenghao-ding@ti.com>,
        "Kasargod, Sandeep" <sandeepk@ti.com>,
        "Hampiholi, Vallabha"
	<v-hampiholi@ti.com>
Subject: Re: [PATCH v1 1/2] ASoC: tac5xx2-sdw: update default regmap registers
Thread-Topic: [PATCH v1 1/2] ASoC: tac5xx2-sdw: update default regmap
 registers
Thread-Index: AQHdMGGzmf4u9hVA80euLjMlD+QA/g==
Date: Thu, 20 Aug 2026 05:06:46 +0000
Message-ID: <c72295dee2c045d9a230096cac1f0b01@ti.com>
References: <20260819053427.2277-1-niranjan.hy@ti.com>
 <b714ed66-e722-461b-8cce-8535a14acc75@sirena.org.uk>
In-Reply-To: <b714ed66-e722-461b-8cce-8535a14acc75@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB51:EE_|DM4PR10MB6813:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bb6dce4-e627-452c-ae8f-08defe78d70d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|7416014|23010399003|22082099003|18002099003|4143699003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	tG4EfDgYcc+i8+8jFp2qaWQycSdp73/fTr58Lejd30WOSvbbMmvBRaPkrR4bUUi3bZ9SyE7ntVuEYAc6by0tV1IDZu5LSOvxLv/nsS/Kioc48mNWyk7rMqtSfrmNjcYMaZj/A/SPNoJCqGgkLI3zcKo5Q51QXYNlDi8Oiq19nTh4lkvdSUPreOtW71bzGVmZ7MV1zHAc09WrhLSxeq4fWreeLWb4/wvLNbqvBoBlUcfF3vjxoOTzspBz53rh7Mw2MFUfQ6SM6h/y9QWY6cJf15cCjzqrjGaNNbSZ7L6g9VSxW+j/tIHI90rL2i/OGzjEQ1oZTyiwnvjmHV9DvTtrYyAValdFU9wzzNJe9DHTs6mJ6tsopaw3b6HohFDnwB8gpfQP+BmQhRDHZLRJd1CnUPh6RZ+YiIfOr32EjAQ4HeshpvvP2T/AyupJd0YT+gvi1hcaeiGvAaIDiOfcyVqoJvjOt7LHK1f62w+IA7KN/F87k4ICWLel7fCm0vXrNB89ojAUk+jcjAXBCgotvKfeyhkFc5YyeQFSm5C03oGSo1uj/lFZ+uPirXHBTbjhfIQCF0VaWC1wAx2ntkgEh8B/Jjj3aBtytqcwL4YNeokxpNzKuQ9zoecNFXSrh70G5pll4rh6K65gzJwQz+Hn64ykeNzDQYyeAx3TnLD6ENcN03KBMxQlt72PzQ3U+Ff8vbXPBZyyat0iXlZJ5Bv/fOFZfA==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(7416014)(23010399003)(22082099003)(18002099003)(4143699003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	X2ZfrZAcxHlZzrL8G7qmtwW6h//COfQs2i6NXyCMpkQ0NfRP4YuPqEVtOfsZOJ2dOr0JUYlu960Ddd3N9qM0ZWzqN2OCFsWQ/x0mJi/66LlHZ5DkRttFWfyiEQDlLa+v6y0686GVTXCP2vo3daMKIhioVyuCM5PUyHDQiOTNB9PTt+K8drFBVN7ikeM4cBlKSlJe5+N0JBe6mQCygHMBvBgIZ6OX0LkL6PKVlztkEcduEox3wYLKclwwWBiZ1q2Rc/HrlQgfRanrx8wFhBZT2Si8wspg9/i/PJte2U1todo7Bxj3usrqKJwV1/OOuJwphHUXODMfI/NJRB8BpZnBnifNOBmX4Vl6P9M7jLErjRbKb6Romrsk6m1Fc8auDnu2JFQO7q2ggz+NtUN8vROzNEfaEw85h6hUU9wqFHWWx6fdevzUWpwp7EzMw12zTa6A
X-Exchange-RoutingPolicyChecked:
	n+GEcMBcWWUbXADkw9UKO64Zl5PUzWrZ6DY+MY0RhOMroYZcnTLBQ4k0fe7RldBoFg3SbrVg4TAsQTVVtgft6lMJ4Cq00BgVUuOddPq/51zpOIjMVqiLwAzRTk2nH7qeNx0R88LbeTaLBbJKeTrzYAnnVnt+RMyVT7DU6yBJgLmATK0XbYc6vDyXpZEyVG4mwV37Y8rfRg1aVL8aLzBT6gnpjg0zdBDkqJVBOlxRWRGaBfbNjsJCk9OI/0mL5Ej29/4YP3/YTjWuSlPfbK1ngzeJ5RvsJIWP6qai5hMpAKQqQ1ieIfMz9iyIeP7Y9ZaZCjLePivm59Q4ESI9jcorvQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 05:06:48.9460
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bb6dce4-e627-452c-ae8f-08defe78d70d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB51.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6813
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDAzNCBTYWx0ZWRfX6D/7v+4VcYB9
 bPJ378mZtfly+Yh7bT5bWWwgxbQ967vEwKodgh988VlDCvgLoqufrQxLpgP+PKFy11B0rn1wO2w
 C/dVAqWk2M6ohS0xg1gqVp8wzHafjp6T5OnrJOvu4n+pTPV0yl0e7N8yHC8FHsCfM/QvYBdXDxv
 7RyIveMUvuuxFpkualhYKnUA7cO5QwH5cCVbqv+KgiwdL/BqqzPw/bhMxH8C4MA6gTV+AhTq/J/
 ENrMqWz7KylDwtrSBullICp8qZlmbmwK3e9i3KRbRlaM/KVVp8oAXj2DG+q0gNYSVFTxpphTZu5
 VhEx1UW7SIwISNfzOysOEvMdP0Xgu9RW67JdIn55yUiuUSQX0G09DRScxbp4oQLfuiMmnskclw5
 qhx52kuaGCFxV77P49JL1KBYvJV+x/WkNvvVxVCKqQq1p91RNzATpD+C8UYWPLnIDhROdaSOiRH
 SRuIsU7AH0ZOLWyaVpw==
X-Proofpoint-GUID: 9XVkunufessNr2jgWCHKuzeWoGmRgMhG
X-Authority-Analysis: v=2.4 cv=JprBas4C c=1 sm=1 tr=0 ts=6a868b6c cx=c_pps
 a=6cA/pxPA0XCUgbB+gUSklg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=xqWC_Br6kY4A:10 a=hd59Zx_pdMwA:10
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=JzYDQ0wOeIjl_Y-uJFQA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: 9XVkunufessNr2jgWCHKuzeWoGmRgMhG
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDAzNCBTYWx0ZWRfXwzFp9C0B/0V5
 WxSO+lF2nKt+BfCqYSNG/3b+Htbu77IuH36jBgAJd4X7Z4nigJ0EUUIzIUC7W9sKRhSoCMiywAs
 8nGAVoQ43V/DOUInCLHP9P9Jtx+f9Rk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200034

> On 19:17-20260819, Mark Brown wrote:
> Subject: Re: [PATCH v1 1/2] ASoC: tac5xx2-sdw: update default regmap regi=
sters
>
> > On Wed, Aug 19, 2026 at 11:04:26AM +0530, Niranjan H Y wrote:
>=20
> > -	REG_SEQ0(SDW_SDCA_CTL(TAC_FUNCTION_ID_SA, TAC_SDCA_ENT_FU23,
> > -			      TAC_SDCA_CHANNEL_GAIN, TAC_CHANNEL_LEFT), 0),
> > -	REG_SEQ0(SDW_SDCA_CTL(TAC_FUNCTION_ID_SA, TAC_SDCA_ENT_FU23,
> > -			      TAC_SDCA_CHANNEL_GAIN,  TAC_CHANNEL_RIGHT), 0),
>=20
> The new macros use _CHANEL_VOLUME and _MASTER_GAIN, there's none using _C=
HANNEL_GAIN?

This was intentional to drop CHANNEL_GAIN as it is found to be not required=
 for FU23.

I think I will add cleaner fix in next patch. What we need really are
#define TAC_SDCA_MASTER_GAIN	0x0B ( should be probably renamed to *_CHANNEL=
_GAIN )
#define TAC_SDCA_CHANNEL_VOLUME	0x02

And need to drop the duplicate macro=20
#define TAC_SDCA_CHANNEL_GAIN	0x02

Regards
Niranjan

