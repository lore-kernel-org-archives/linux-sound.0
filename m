Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azhn15010016.outbound.protection.outlook.com [52.102.138.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDFF630DEB6;
	Fri, 27 Feb 2026 10:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.102.138.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772188862; cv=fail; b=JPWl7hu4lrgs4grJ676hhOj7lboaqGE7+lHHfbmfa2cwKehP1DfiInBO6fJJL2/K9vcj/eQkvm4wSvnIkrkhXISTkeexgjqJMF3VA1GmRoAlNowKkUmIw4wlvJafM8zKvn/HRqK/Ftd1slm3lpClHJsK1Xja778UzPs+8BsMnIs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772188862; c=relaxed/simple;
	bh=OH6Gpemt24GxH3W4ZdP8Q5u458b2kNSSAvlJpKd+118=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Uu78wGN1uT+/QRh8cBoRCNhodHSx5x03l0io1kjRKDemHA4GqrsMOg4sYBufxz96mY6IyBgru7qcQcESeL0KKe9HhG+bWBQ7zUyBsv5TwGnWS5EDCI2HHaGLKSaZIolJTFyiaBrT28xSct6qxRHlf2+hbZrXvVLbIGep6sfrsuk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=kS7YlI+w; arc=fail smtp.client-ip=52.102.138.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="kS7YlI+w"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LhH0bgRKKFGxi39mg+lKx9Ka2lo3UNohbfPKzNtoTUkwFhcWceYimpe4WP/htsX0enwYMoAPDkg67tNMVAqAwnJgTaBANRGGj2STi5EkaIk9fweaeAAPjhuomQHCTf9kQMgKdgaxsiAzF7Z/b8MRQTYdAJ6B+5UXlLxg0JOz9eAUz/P4apo9YrdtVzGlzROIFYuTe7QXBJt+/ru4pF3+qPY4SxabFbUmB5x3aiqMQDcZ+D7ajwHp7hHQOlCAvZzUUcwb+DFr1keu+4tMlYisDj7+naYEwd8spe0t3q4pkuQTj9a5xoJzWc7ufwvCzeCrC9FV5+y7cbi7fU4CufOiUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JRkDWZ2yQRi8OxgchxnYShqzV2ieFh2KYbSjzfuPwXg=;
 b=h6L78di53+aFXKc+BlBNAEKtf56C+1SOXeEouB4jKYAzdKFUzSkbYRl0e4UgZ511hxkic1OAB+Bw6DK/249vPSBl+t2njHeBfGuILfnkVqKEgKnuFWtPyILlw30pmWhxP/iBvNljs9ayLSgEEFFZIzNeqkMl0e1FWfyVdXOi09DaZgOPn1CbRd8swzaNbAgFgK+szZiXfnjAe677K5UIA+ybzpDeZ5fIqEnVkbrw8rakzX1d48/8qdkQiEaHfye14wse90PedIPjNZI2bQGeU2uELfIOBH/oqe/t/vXxtkqyPeyo/gJuyb36UyqCVtc8Fj0wDEVBwKRLJT1ZstL6jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JRkDWZ2yQRi8OxgchxnYShqzV2ieFh2KYbSjzfuPwXg=;
 b=kS7YlI+w5H7RvqBv16w7C34q3NLI/3lxM+zwXrXQr8yDu7e6F4EhFjdpmpQb2pZhPDPKwxidYcMFBxeJ0M56U6EBZTL7f17XTRRIscWrAzkx5B7Y+O+iI3NKRkjusieI4r+FTkESlbwgz9s7ieDK34nUN56DuB1I0PU776rHZmY=
Received: from DM6PR13CA0004.namprd13.prod.outlook.com (2603:10b6:5:bc::17) by
 LV8PR10MB7919.namprd10.prod.outlook.com (2603:10b6:408:203::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Fri, 27 Feb
 2026 10:40:57 +0000
Received: from DM2PEPF00003FC8.namprd04.prod.outlook.com
 (2603:10b6:5:bc:cafe::fe) by DM6PR13CA0004.outlook.office365.com
 (2603:10b6:5:bc::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.14 via Frontend Transport; Fri,
 27 Feb 2026 10:40:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DM2PEPF00003FC8.mail.protection.outlook.com (10.167.23.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Fri, 27 Feb 2026 10:40:57 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 27 Feb
 2026 04:40:57 -0600
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 27 Feb
 2026 04:40:56 -0600
Received: from DLEE209.ent.ti.com ([fe80::9756:3b42:e53b:3cbe]) by
 DLEE209.ent.ti.com ([fe80::9756:3b42:e53b:3cbe%7]) with mapi id
 15.02.2562.020; Fri, 27 Feb 2026 04:40:56 -0600
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
Thread-Index: AQHcpvWtoQyt5WTP+EmgFSOStkCYv7WWv+mA//+cDzU=
Date: Fri, 27 Feb 2026 10:40:56 +0000
Message-ID: <9f861c7df09c4434a98a203ecff913bc@ti.com>
References: <20260226075737.405-1-baojun.xu@ti.com>
 <20260226075737.405-2-baojun.xu@ti.com>,<20260227-ubiquitous-dashing-copperhead-b2c6a0@quoll>
In-Reply-To: <20260227-ubiquitous-dashing-copperhead-b2c6a0@quoll>
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
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC8:EE_|LV8PR10MB7919:EE_
X-MS-Office365-Filtering-Correlation-Id: c0b9ad9a-3220-4540-78d0-08de75ecb0f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|34020700016|82310400026|36860700013|1800799024|7053199007|12100799066;
X-Microsoft-Antispam-Message-Info:
	H6qKiVD/J7lINrgeZdrKcX9dbd6jqZryO6MsrzKFsIFO94gdPycxyo1UBqahb5Rp/qx+qAgavdIGSxpbS9rTpHMcXYYfoRCq/0WC2rsBTMKDkwwymOekN2pIlGxOinXjlccMVXQXaE6F0c9a4zouQdWHnjSkvl7fUU/2F/EX0flCCReCScfYQ/GivF6yAozIAJo0+ofws2VUNMy5Jo0j2Q/XzAqeV/dosb1YlyoYt4yZ3TmPWRtI41gkp2MsBuWyAqJ0cMaoQW914SKZ2axV3Sq5JbJighQa4Ud8a7/Kl/vg8CR1u/DcH80+teN7/WoROq3CeT9PYLQeguqkhseADVjotdoizOa7UCbGD1bVp2zBjncMeo6/MMU/e3ZFyzn+mUYa2FpoWRqLjkMhGenvlsmn2A60ydAAr/wkJPnSLRRG384vzhAP+f6xgrDQYfLPxulv8OPwqkeXdAfwqEoKHeL6pJpdhtLBDL0zJ+w8tS5dlmdQSwtsuXaiKoOREaww9ocZIAyHp1LIgZ5T2hXSucgk8H0NhqtUDpkM/4oOJezIRTaOvj5uC3+BnUfW4IBUZjAKgA9Zo+6CbWuTBP3/L2F2NG9sasI4vELrjLaFMQXUZIBr2sEydhRpUlBrSIIs7MNX0RNpiabpWTNUZjofBAJpTJyf1Anou/QyonhB+kWH4gnWHXLIKAkA/kDMu8WXYT4XijANu/NxqKrtge8KOe2ZPz6RL7T+sHCCqE8PjIoqunOjE8Tv2QoTgwT63+5AmbOyi925f37nvdGGQqQX37wA8MqA2GOev/LqqPuFWOebcpu5pXTSvzCkozHxgYtc8gUNEFHAoH6z9FvNcUGzwA==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(34020700016)(82310400026)(36860700013)(1800799024)(7053199007)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JMgsmCFSws3P/ehsIT8O7VzbxwjpkDAEN2vdT18rQHAUOjlNw+AmiHK2kjVVIbAjofs4nclcl2Bzp+NNzoGJ1S//+BH9TkIPwZcV35HyB1yawVuRVywD02Sca/xXECBCEW78erIHOecey4k2sud318mAqz2JPzwwOvff5lmhnrlfOZ0ZZpFhlyJ5h83HUegyuDdnpeKZQR03kB3u0okdGVgKb9OnY/hG0Aj1BfBBdrXYwTBjacEyW53x1GZ085j+2yvHjFoaea+wP/YmCwPUtarFw9CarTHz+Ai9u16wOAVoCVihcjfwB/BmSwajZIgCnSqdaWZoWqHFn6p4TcyBRbIxYIbnFG+vjTcWA/qSFCo9XoS5KlLpi9hb+aOQvaY0Vp4Y1LulXRyDBE5CQ+Be/VQ4DkYKBQ1j1GpVrKR2LNSWq0om3xrklSm/FMXSgK4Z
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 10:40:57.4013
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0b9ad9a-3220-4540-78d0-08de75ecb0f9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM2PEPF00003FC8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7919


________________________________________
> From: Krzysztof Kozlowski <krzk@kernel.org>
> Sent: 27 February 2026 18:34
> To: Xu, Baojun
> Cc: broonie@kernel.org; tiwai@suse.de; andriy.shevchenko@linux.intel.com;=
 13916275206@139.com; Ding, Shenghao; linux-sound@vger.kernel.org; linux-ke=
rnel@vger.kernel.org; lgirdwood@gmail.com; robh@kernel.org; krzk+dt@kernel.=
org; conor+dt@kernel.org; devicetree@vger.kernel.org; Yi, Ken; Lo, Henry; C=
hen, Robin; Wang, Will; jim.shil@goertek.com; toastcheng@google.com; chinka=
iting@google.com
> Subject: [EXTERNAL] Re: [PATCH v1 2/2] ASoC: tas2781: Add tas5832 support
>=20
> >  MODULE_DEVICE_TABLE(i2c, tasdevice_id);
> > @@ -144,6 +145,7 @@ static const struct of_device_id tasdevice_of_match=
[] =3D {
> >       { .compatible =3D "ti,tas5827" },
> >       { .compatible =3D "ti,tas5828" },
> >       { .compatible =3D "ti,tas5830" },
> > +     { .compatible =3D "ti,tas5832" },
>=20
> So it is fully compatible with tas5830 and most of the changes here are
> not needed?

Yes, it's fully compatible with tas5827/28/30.

> Best regards,
> Krzysztof
>=20

Best Regards
Jim=
