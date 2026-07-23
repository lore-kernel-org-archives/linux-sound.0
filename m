Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5731524F
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 01:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784768520; cv=fail; b=puty0KlYKxcrGIweLgzkrfQTMRoWjbt5Yxgfz7O3gu7b6RC05mimMSoVT1pdqXJPCMHgFtXdWiSTJsiwO48c4HvXXTmAHZrNazbgdPVHGUxV0tuqC1zFDkQoWMjdi1iNXjkhaJRHtNcBVEUnTTJehDzyUYWzx0giKmGc3WRIsYs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784768520; c=relaxed/simple;
	bh=CSuk+6bFHqqR2+e7mNNbVjRUaCZnlQzbkpLVHWzA/XU=;
	h=From:To:CC:Date:Message-ID:References:In-Reply-To:Content-Type:
	 MIME-Version:Subject; b=tTq1oLyfg2Ctwre4d3/uVOy/tgntNHjp030krhwIRyuvbzex5CS5aJ/EFYrQzm2CH5WVWvUslCdT+VtmdBgc2RCYDHQ4RYpeHFo9WeQHnpwbSnK/3/HvRGixW9fg84dI++VX50ThGrftwYpnRvNfeIugI94qh+9rpSV/34Lc9Rk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=qm3Gzfm4; dkim=fail (1024-bit key) header.d=ti.com header.i=@ti.com header.b=FI3zrDfe reason="signature verification failed"; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="qm3Gzfm4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="FI3zrDfe"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N0YjgP933848;
	Wed, 22 Jul 2026 20:01:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=CSuk+6bFHqqR2+e7mNNbVjRUaCZnlQzbkpLVHWzA/
	XU=; b=qm3Gzfm4ht/DMr5ZuqXG7nfJbuQlKG5mP1wSt65r7q17Fps0/2bop53cb
	KlU6eo72kCRp5a0sRmbLRcCoB+XABiiEfXWRfOw6jMh9T1v1+V9wCA6XtyOzBbTe
	Kk8E8MvNbupaszr4WzjAqZqenXyGlsLebTrWmufRrKoo3X2WMKURo459woyeYg1h
	VqspnybnUZbfEJYPCYFjOkrKz7L2ubiHtvyZT7RDIRSyxonZEAEBdLIFRDHLj3RN
	IK1Hcz9izcmjhgv2YG/CcZOEE1aTMug3Sb62cRpCq8Xh9smwu3i03aEXimaN6/JR
	cXtnsBhjZuEM8m9RQh81d5gZZMNrQ==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012002.outbound.protection.outlook.com [52.101.53.2])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fjwjv43dd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 22 Jul 2026 20:01:32 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BWd6fmPqG2Cvvelkb/X2quil/hpdbIDkfBDwXCKhLl8FWRHvsQ2PJ5aPNHeDAnNfF7CJb7BNUhkFzLkOpECan8qd5tkZUKFbIUn9/f1+IckLFSYVdTgHV5/ufaLgT6ZXFyWU87G3yEoFckxNLX2BcXuwl2nTZmbaNSV04jn8y2kpcRtmi4aySgzlHfozRPOrNBtm9soO6BOGfj24aXeLV0X73TDghWWxxCDiGvMoSDIXXBfDDMi8Zf5TptZAfGeOxTfI3jgr9j+A0k1j548eP8Np1NFhu2tMVkZRxnsbKVQ0shh4/hg46Ltv7gvZuE4K11gdBG7pKMKhjfKbF44aLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CSuk+6bFHqqR2+e7mNNbVjRUaCZnlQzbkpLVHWzA/XU=;
 b=PnDU55GRsacpBBvB8Kmufjc+sUg82PUzsBRMFFmZOiYy8Ei7H74WRKD2U1J882Vr76Qi2lNf1D56GeJwN7VoAlXRMkZOiMGgdNvjFlNGLd/5evzEjyQLlbgygRT2DT3IAkCCNowfzSDztXZqmpP2XGJZrNEIwEQpkRZOOByahVWuvIg+M5CiY8PIJwea03ckFLaXGvQaIGg4KhrwqNZgfn6Fub+9oHmDzom2dY7i4CPD4ctlHl2Uoc3J7g3nb87G5soDYtkP3FgpBD8ndZ+24BBDxpuq9f6syVysfY0uPL16KSfemTb7mlVtcPjw7yR8A5M4IPklNFKR7xroZEuwmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CSuk+6bFHqqR2+e7mNNbVjRUaCZnlQzbkpLVHWzA/XU=;
 b=FI3zrDfe+oFFEznYglV5fEUi69AOpoRF3r7hhT0Evhd0rhLvYxx1TUMIhko7nSii9X/Ght1IE1S+s3oGdiTjMH0GoywhrZWuUrijilB2vrgdA2HgJ9McjXLvtKqwDliUNGWM6c8sANDnYdE6CLlw516D62jeoNv0DOzqqhXhJHQ=
Received: from CH0PR03CA0041.namprd03.prod.outlook.com (2603:10b6:610:b3::16)
 by IA0PR10MB7349.namprd10.prod.outlook.com (2603:10b6:208:40d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 01:01:27 +0000
Received: from DS2PEPF00003441.namprd04.prod.outlook.com
 (2603:10b6:610:b3:cafe::44) by CH0PR03CA0041.outlook.office365.com
 (2603:10b6:610:b3::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Thu,
 23 Jul 2026 01:01:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS2PEPF00003441.mail.protection.outlook.com (10.167.17.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Thu, 23 Jul 2026 01:01:26 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 22 Jul
 2026 20:01:26 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 22 Jul
 2026 20:01:25 -0500
Received: from DLEE208.ent.ti.com ([fe80::1fe3:c5a4:bb4c:c052]) by
 DLEE208.ent.ti.com ([fe80::1fe3:c5a4:bb4c:c052%20]) with mapi id
 15.02.2562.037; Wed, 22 Jul 2026 20:01:25 -0500
From: "Ding, Shenghao" <shenghao-ding@ti.com>
To: Mark Brown <broonie@kernel.org>
CC: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
        "tiwai@suse.de" <tiwai@suse.de>,
        "13916275206@139.com" <13916275206@139.com>,
        "perex@perex.cz" <perex@perex.cz>,
        "lgirdwood@gmail.com"
	<lgirdwood@gmail.com>,
        "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>,
        "Xu, Baojun" <baojun.xu@ti.com>
Thread-Topic: [EXTERNAL] Re: [PATCH v2] ASoC: tas2781: Add calibration
 kcontrols for TAS2573
Thread-Index: AQHdFxqGvss6zyOfB0iPTXRx8DhS+LZ4g0yAgAHKw+A=
Date: Thu, 23 Jul 2026 01:01:25 +0000
Message-ID: <8e1b31f1a2f94745abfca7ab8237e155@ti.com>
References: <20260719010409.1555-1-shenghao-ding@ti.com>
 <0ef9314b-e21b-462e-a42f-4057058d7399@sirena.org.uk>
In-Reply-To: <0ef9314b-e21b-462e-a42f-4057058d7399@sirena.org.uk>
Accept-Language: en-US, zh-CN
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003441:EE_|IA0PR10MB7349:EE_
X-MS-Office365-Filtering-Correlation-Id: 844ca3ba-5a9d-4808-a1ff-08dee855ec5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|23010399003|10067099003|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	8Profir7LnJsqV4ElmzBMfagqtFwkMGIPy2GL49fcebywlF0E6E8H7aZ9vv2y/WkBC/FvXJPHc5MzP71pmOTFH+wBcY0EISlny1ovyWsPcgQC76V4Hafz7vxgd1qfBQlNIcUkOUP5C9EFeoGKO3IkWBiK0nyH3xBKHYG+vdN9JUf4r1wNewM4k0y1rvaIDBRFW8dFGZFKBWw4jzpmw8b0wQTkxN6K3526WQhdpV8sMdtxsNl5uOY68rek/4YqErN9dEDuf1jAL8lXZYvH1pgoCmG+nsPhb2O9LeM4notlq/iDSwosf9HWpkot6cEtuSzLRxobFGuXZTfrdQaXIGdOhIUoKzdRCuKzYgfwsp7KSr8JvlMYbEeaaeOf/SE89LpT4o0Lt8uTftWBNHlg0PvnTtuXQeZ1xyOn2Tml9Xxj2Mr/lyAQFJrfm8Oluq0SaRa/jiiKCtChSGYv8G3D8siItzoLP5OEU3nYCJ9wsz0uX2Tp69qW9wEnsWWq57A8wAs/a2kTpHz6vPhvKHIE6Sd2VVqfJI/IK8KX2za2z6HbTXSkoDRBZ1mSvCXPRFB6i8KSBeF6tl4T5pSKv5AnNFbNCAhPGq55kn90zbl2qIc531mg1QZzkuwLZKn1bJRolXJRQ/Yki5kA8MZUDIHhZHtVUm7vvPOBNBhknmECV5rv07k9RIJsSqmLQkEHQnG/GG3
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(23010399003)(10067099003)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gGmFsOQu8BnMHvaG5P9vmc1Ev4RbsgQ4k3U0Ru6nIs3sCEXkJnYawtp0QpQuyRPlqhNPtl9aUdjMGgzKnprJafv69pSlLgKaWLTJ6GpTb1RtJjqd3GGPOrxhbXZsBmNOmD/yVqUF1NMPG3YH6mQkxuTe1vOflYPKW3qZTBZ358ZrsjhfqOkgAtlJpktrcJ+HPAUqns0vehDnWJoxuLaLBDtMf8IntUuS6bE0v9eR5O/8at8YXwhnbbSoa4qLE9Y1lGFXBGx51jRBYgOAFUncjJoDwyDPBL/85yjvGL5BzqlMd9FCSOEaDoGVw+BRtPKhX5GquL0G0nGC0ZXlij0D7rnzEgnZ65UAJ0KeU3MMN1p446HOkzchZ71+G5UEWzyCNxyQSzpfyTmcsENuX627lk8VYP62fIw7G30yTZApnYovITQtX94kiOozNKS42kaS
X-Exchange-RoutingPolicyChecked:
	GKN7O9mvLWCbtoyZm28jAuClAh6TltsAomQhOXnclNWPadB7m2/C4B5CezeKeyGoUqmh1x0maTiPdmPkiCNEQskM4yw5XEqs6MvDTNGR3GT7KREG83cbXF9a3hKzz4EiAUtlzX7hb3Gx1eJCiPUNWG0Ipm5/ypASl0Otrf4NH+2vX/IrC7WgsZIq4Qi3kAHixeOtcNQxi//prg6ISQmeoDSW/hcrH4Qr9iJXalTvET21BfAgW7SgIiTJQlsxNusiIiCrtRVLl9ygMmDquzxPIYorbvh4HZmiggcBC8bn47UVK51nvL9Er1j5XcmTrsPvWDtXfa9n0OMmbJTF5YnO4A==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 01:01:26.7509
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 844ca3ba-5a9d-4808-a1ff-08dee855ec5c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003441.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7349
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDAwNyBTYWx0ZWRfX+pbxGygzez23
 cOtUx3tAvpzu/1bmSYIDFKM9AITp8FTfaYv6mIV+C+Lzo1pPLFkVGjl7cOXtWWmnE93IcBf30yw
 emCkwrtURllZK7eoKLsm/vAN2oWjzfU=
X-Proofpoint-ORIG-GUID: GfjvqReWN7sAM_LYKXpNvv737I-3Gevi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDAwNyBTYWx0ZWRfX9Y8EsWcHD/3Q
 7mruG8sOo6UwTXjSJaoYujU4kCo2aQs5ElSlhqG3weT6pjctildBsuTrL/qu+rVFP+fHi8sS9sm
 4A8DbGvPAsuGyD0sSVIHLpEIFP+0UaR8pzlXTHHdPgyMOEHsJ1Z+PRt6k51EVC9hajxFrdD9mb5
 FCWEkrEnYe61S6S9nN4pobTQ1vFxISO17wQDnHAT649jW774Nfh9WKMqrrmjRgN+Wp72L32CbUr
 s3ZucVnJf2vPjSp1DRW4aWbFnvKpyZEEP9SbraMO23ZdsUgrTTYyfz+3TFIma5HzGsm0yN4exEh
 NiT+v14AXcx8kcMjLsR/rOa3WSxD/46q5GeFAdjwUihiK0ZJl037dXL+nr8NahQAGA/OcjIQBpy
 gR/mBLfK8P3jBga1+5gRABGz5v3cE4Xa2r++yV7E/7bhN5UeJ2o11J0BCf7AemTTDbJxnIlFmMW
 b2fe/hF3SsfAw2DoF9g==
X-Proofpoint-GUID: GfjvqReWN7sAM_LYKXpNvv737I-3Gevi
X-Authority-Analysis: v=2.4 cv=PsyjqQM3 c=1 sm=1 tr=0 ts=6a6167ed cx=c_pps
 a=boTDQTO5XcRoDQ12XycLVw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=xqWC_Br6kY4A:10 a=AiXEp2iUk68A:10
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8 a=QyXUC8HyAAAA:8 a=59-QbVjxAAAA:8
 a=pGLkceISAAAA:8 a=z2VislExGG2PmlaI0LAA:9 a=CjuIK1q_8ugA:10
 a=IGXNCFnflQ0gJHagSJzg:22
Subject: RE:  Re: [PATCH v2] ASoC: tas2781: Add calibration kcontrols for
 TAS2573
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230007



> -----Original Message-----
> From: Mark Brown <broonie@kernel.org>
> Sent: Wednesday, July 22, 2026 12:35 AM
> To: Ding, Shenghao <shenghao-ding@ti.com>
> Cc: andriy.shevchenko@linux.intel.com; tiwai@suse.de;
> 13916275206@139.com; perex@perex.cz; lgirdwood@gmail.com; linux-
> sound@vger.kernel.org; Xu, Baojun <baojun.xu@ti.com>
> Subject: [EXTERNAL] Re: [PATCH v2] ASoC: tas2781: Add calibration kcontro=
ls
> for TAS2573
>=20
> On Sun, Jul 19, 2026 at 09:04:09AM +0800, Shenghao Ding wrote:
> > Add calibration kcontrols for TAS2573 in TAS2781 driver to support
> > device-specific calibration settings.
>=20
> This doesn't apply against current code, please check and resend.
>=20
> It looks like this is more than just some controls, it looks like it can
> also load the resulting calibration?

The controls include start, stop, and calibration status and value query,
