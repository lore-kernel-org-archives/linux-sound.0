Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazhn15011022.outbound.protection.outlook.com [52.102.139.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE101377028;
	Mon,  2 Mar 2026 08:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.102.139.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772439851; cv=fail; b=Aj9mChgYM7EIvICwLvKG47hCTQx7yDW45f0y3qwttZbuJH4f1/zbJ/AdDld9uZM/5CXvpXggn/4lj/V/N1NbJL5OncVEmbHXm9c3oGweoHltZcA9OG3RXF4Tr7Wbm+317G5qNuxWT4vSHghV7h2oSb44LMInJkKPh8g7Fr89jC8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772439851; c=relaxed/simple;
	bh=24obxlTergEPj0WV+9EtSTmSGLYVT4eTH8S3ARj0wPI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QMD/w6Db0UsLZAWgLNqNbXiwZmz4LDggQ8rtmHrKgt6rBqaRlORj3gAB6HK1hztvPtBHWsZNSm9B6oOKKinN4PR5EVR1MdfB2mK7hfMjv7f+MThRibN7fzLDXOWu51i4vXBc9fANCpt4tvH+QMljXvFNK3IGg4UtOPYBq9bpBAI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=qCa+GZT7; arc=fail smtp.client-ip=52.102.139.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="qCa+GZT7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VU5fjlvTjVnMNQ2Df8Ve1NY85p+U5AuYFwOddyFiM3zFOnaPpLd4zQ0KT20qhch7SlkzZuSwX9pd8apuYOgELOb2m4lhnEUs9aqF9AqmHPRJYkxHlPjMo5ClS9PgcYn48PiSATLLPHXjtQYwrLxv6mTIf2/pNBHhJuo4EP8OQgA4AfQaH7EeC2NxVXDjMQ/brdzDzTsTwoTK10DpF5TqUxcNPt200rr7+k8tfdKeJUNLG0JF1y5bByx7nL4V5BBXG9KJcSrmplK/PCIYLNXEyClt3G7zf7V20RhlES/9MD3vPsXekcwS2HiIe60AWVjPZy7MXbDiMm8t2o+7Tng5xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2mCdDgd2dXsub5ofpDlfgbB5ji9n8IGm5aR+a0yWzT4=;
 b=VsLLCky2mLiC4V0IBCGJXRorknxzj6NPiK4uJrVcWQ50lyhM78Z82IU0BOHZZGXGfZp0b9tkHty7vxW71wkWsPGQWvuLvaMAGueRpGA4zQKtiuTVJF0FC24r2jsYfnjyiU0pqYMnIJ5HR3wEF9OCIhXYmUgUzlsYweuDQmAv7+iDLcsRQgYGvov6hIQ2TEQ6/aFnAiA2EjisB01fae1kVhMCPirFdB4nAnTkb4iJtUA1ldR/BCaA8GFWPuDemTkgZJLWwTNHZcB8EA0Bgg3D8y8xafj8IiXiM1Imr0D9QEIXBzZ2qbjsSpXFhx/i50srmJgBiUsv5xEe7/RQcDoF3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2mCdDgd2dXsub5ofpDlfgbB5ji9n8IGm5aR+a0yWzT4=;
 b=qCa+GZT7W4V4fvr6wf/XhwL4w5aUe0JMA3ywyo3JL32f25gbZ/S3UKjA5p4Rbn1j1zpRlXqyZ3eL/O+pQZyAVvB7Q+e0rWGc0tk1X2KPLHKlCtsruJ6B4+IlE6FpZButx6IGhFclnvNEgNn3LBwe7IfNqu5Wb/nGXiPqyr/vAvI=
Received: from BN9PR03CA0578.namprd03.prod.outlook.com (2603:10b6:408:10d::13)
 by PH3PPF44A241B91.namprd10.prod.outlook.com (2603:10b6:518:1::798) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.14; Mon, 2 Mar
 2026 08:24:07 +0000
Received: from BN1PEPF00005FFF.namprd05.prod.outlook.com
 (2603:10b6:408:10d:cafe::8c) by BN9PR03CA0578.outlook.office365.com
 (2603:10b6:408:10d::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.20 via Frontend Transport; Mon,
 2 Mar 2026 08:24:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN1PEPF00005FFF.mail.protection.outlook.com (10.167.243.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Mon, 2 Mar 2026 08:24:07 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 02:24:06 -0600
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 02:24:06 -0600
Received: from DLEE209.ent.ti.com ([fe80::9756:3b42:e53b:3cbe]) by
 DLEE209.ent.ti.com ([fe80::9756:3b42:e53b:3cbe%7]) with mapi id
 15.02.2562.020; Mon, 2 Mar 2026 02:24:06 -0600
From: "Xu, Baojun" <baojun.xu@ti.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "broonie@kernel.org" <broonie@kernel.org>, "tiwai@suse.de"
	<tiwai@suse.de>, "andriy.shevchenko@linux.intel.com"
	<andriy.shevchenko@linux.intel.com>, "13916275206@139.com"
	<13916275206@139.com>, "Ding, Shenghao" <shenghao-ding@ti.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "Yi, Ken" <k-yi@ti.com>, "Lo, Henry"
	<henry.lo@ti.com>, "Chen, Robin" <robinchen@ti.com>, "Wang, Will"
	<will-wang@ti.com>, "jim.shil@goertek.com" <jim.shil@goertek.com>,
	"toastcheng@google.com" <toastcheng@google.com>, "chinkaiting@google.com"
	<chinkaiting@google.com>
Subject: Re: [EXTERNAL] Re: [PATCH v1 2/2] ASoC: tas2781: Add tas5832 support
Thread-Topic: [EXTERNAL] Re: [PATCH v1 2/2] ASoC: tas2781: Add tas5832 support
Thread-Index: AQHcpvWtoQyt5WTP+EmgFSOStkCYv7WWv+mA//+cDzWAAGc+AIAEJ+hd
Date: Mon, 2 Mar 2026 08:24:06 +0000
Message-ID: <a7316acf9ba248f9ad1fab0313a95654@ti.com>
References: <20260226075737.405-1-baojun.xu@ti.com>
 <20260226075737.405-2-baojun.xu@ti.com>
 <20260227-ubiquitous-dashing-copperhead-b2c6a0@quoll>
 <9f861c7df09c4434a98a203ecff913bc@ti.com>,<63b0f42e-56e8-474f-8805-4e01bb2f189e@kernel.org>
In-Reply-To: <63b0f42e-56e8-474f-8805-4e01bb2f189e@kernel.org>
Accept-Language: en-GB, zh-CN, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-c2processedorg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFF:EE_|PH3PPF44A241B91:EE_
X-MS-Office365-Filtering-Correlation-Id: dfc43832-f106-4de9-12b0-08de783512a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|7416014|376014|36860700013|34020700016|7053199007|12100799066;
X-Microsoft-Antispam-Message-Info:
	nQw6cORzGVrqb/Jp8NRlbgXofkPiCRHKJw/nqSHgVn/C556xWtg37p+U04F2AwPvvYvQjh2w6SUNN30eR/anKVs55gumeVwizTl8zbz5Tqh4gBs9D6Z8ufMhoPjGmzwJr6zQ/jSfpGD1bYt2z0r0uihPpiYe7tg7OvKZriOtFSxRQl+G57Uw+6Xfg9dwCV9aoKk0I4dPp87OM1VELFKvEVnpkU2E/V/s3IsKq45paZsp78wrWedPDv2+dp1ZvMDdK3lqp+i50ZfIRKrtcaOQRV4hDOKVm6SRlo+Uba8Le1LLcdW3By6fDlIbGPBpDSqfxU1gTxvg3iNEy/bScIhPATq6vhABIliSVAk6bGQY7fa4WnU9JTtDJARZzvR5vUECPM1BO9AT2k/rSfkjtbjt4p7/ggjAHFWieLcXSp7vd+yP9kef8dFPatb5zp689fJo68b9AAP1xetY2uOopnyiYYNWEyMYcqx3MdsalSakiYwYfebxVPRknHiAVeRb6JqvQZ0mBvBK8VF95IcF1F3Kfvr2JeXxI9kCMUTpwCdSJljeyOldjiS3bH0Riuc7gnXD1NqdeyvB1pXX6+LwxqV8+0oNGV718Cm6MirsFpaE4a35p+5KdnN4odZJ6e7Whdg7QNBRE9RDGav+oUEUJncUIMNram4or4bT8DU1HdNtMfJ7je8zgciIu/I4m1HgI7hZhQaa5PY38+gqet59/WnUvUB28zkRey05ZueEuXeCkd1T9gtbYlcAUtutVhNL1JbLTykrmPIrg8hgE4ueYJr1Tal42pFh5ZXnBXEESFZAO4/QfR+o8qxohYHhYDgIHvcN3tMNF7/0MDuLEWekAxzA/g==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(7416014)(376014)(36860700013)(34020700016)(7053199007)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rsMnjViE8M+b1zHAvjtD9KDCjzj6HR3azm9N9T49hCbU9B2BjSjBmhBU8FZ/919ChOTEbvbU5sO2/FiR8JzMdj0QgARhywTGYoxRqp7U9hLfFPsroYpJk2m4P4WV402teeWrw9pJWWVHtFRkPz9N7I4jCdPBXOUy/buB+MSXH6J1nhFW0/2/mpQviVUk+d+w/UgkFWcma3RH2cmOwOKonX4jSfvRiggx1SH+2RUPLRIBGgZQKRFpJrrlkER0YDIw+e8MlK3qH3Ll0GWWrqGiqhPtWg0ukc0GXptsITlIN+6v3imz257jF7EOH6vLP3sjIrhgIzYy8AifjF7Nqun7vICby4h87ZVAmgtZiT9kWpLJDkXRSmrnM533dhKm4C1ZcjXmF95fsPvKCh72Fbevht8tsjjTFeROFDUNoe2b2DBUmZWaJzabd19qjiBtKaMs
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 08:24:07.3200
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dfc43832-f106-4de9-12b0-08de783512a1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF44A241B91

>=20
> ________________________________________
> From: Krzysztof Kozlowski <krzk@kernel.org>
> Sent: 27 February 2026 18:46
> To: Xu, Baojun
> Cc: broonie@kernel.org; tiwai@suse.de; andriy.shevchenko@linux.intel.com;=
 13916275206@139.com; Ding, Shenghao; linux-sound@vger.kernel.org; linux-ke=
rnel@vger.kernel.org; lgirdwood@gmail.com; robh@kernel.org; krzk+dt@kernel.=
org; conor+dt@kernel.org; devicetree@vger.kernel.org; Yi, Ken; Lo, Henry; C=
hen, Robin; Wang, Will; jim.shil@goertek.com; toastcheng@google.com; chinka=
iting@google.com
> Subject: Re: [EXTERNAL] Re: [PATCH v1 2/2] ASoC: tas2781: Add tas5832 sup=
port
>=20
> On 27/02/2026 11:40, Xu, Baojun wrote:
> >
> > ________________________________________
> >> From: Krzysztof Kozlowski <krzk@kernel.org>
> >> Sent: 27 February 2026 18:34
> >> To: Xu, Baojun
> >> Cc: broonie@kernel.org; tiwai@suse.de; andriy.shevchenko@linux.intel.c=
om; 13916275206@139.com; Ding, Shenghao; linux-sound@vger.kernel.org; linux=
-kernel@vger.kernel.org; lgirdwood@gmail.com; robh@kernel.org; krzk+dt@kern=
el.org; conor+dt@kernel.org; devicetree@vger.kernel.org; Yi, Ken; Lo, Henry=
; Chen, Robin; Wang, Will; jim.shil@goertek.com; toastcheng@google.com; chi=
nkaiting@google.com
> >> Subject: [EXTERNAL] Re: [PATCH v1 2/2] ASoC: tas2781: Add tas5832 supp=
ort
> >>
> >>>  MODULE_DEVICE_TABLE(i2c, tasdevice_id);
> >>> @@ -144,6 +145,7 @@ static const struct of_device_id tasdevice_of_mat=
ch[] =3D {
> >>>       { .compatible =3D "ti,tas5827" },
> >>>       { .compatible =3D "ti,tas5828" },
> >>>       { .compatible =3D "ti,tas5830" },
> >>> +     { .compatible =3D "ti,tas5832" },
> >>
> >> So it is fully compatible with tas5830 and most of the changes here ar=
e
> >> not needed?
> >
> > Yes, it's fully compatible with tas5827/28/30.
>=20
> Then above hunk and many others are not needed.

Hi, because those chips have different on the voltage, so the parameters
is different, have to use different firmware binary, so we must identify
every chip in the driver.

>=20
> Best regards,
> Krzysztof
>=20
>=20

Best Regards
Jim
