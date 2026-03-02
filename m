Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazhn15010019.outbound.protection.outlook.com [52.102.128.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E827B38F62B;
	Mon,  2 Mar 2026 09:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.102.128.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772443330; cv=fail; b=BmKxeC5TSke8ylex5ck85HMbyRRbplIplTUlQYMMg6UZb/wFjm666BgqJFXQ4Vux0sPBjK5hh05B2MKcsw4mPFnpQWvtM/JTJUdswxrnitIe5N04d0sfd8I4TkdB3zhNYqmxh049sg77a7am3xPCYSsm66JFVEWChBv+4AOw7/M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772443330; c=relaxed/simple;
	bh=LJu+NisrzUoe2YML1h4bsc0UNKwCTgoEl/fY1BPuTfg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=K6OAZQc+kHipewq2TC/40G1pomhk40KDoEHBXQmrhW8Bbv1xI/k3rNzPokRuiqCjwggP6yBW3oHkBX4B7q01+BspK0ElvUW9sCJs/c7C72Oyaj/Rlx32MR6csugB9mk4cUhmfFvKwanDR7ORSZpGJt+81cnX8aryfRlOfTHlEh4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=K3ih6pag; arc=fail smtp.client-ip=52.102.128.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="K3ih6pag"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BwpT3Gh/CPf7hTgbjD7sKpGmpo7hAuGkKOBz7Ux9JeoOLFPH4lqvn0mlzHAeq+DTdLVABTKvcvKmLiGYnRppFLHpit+ks7aJDhHnFqaReEeXp5avfxxG8/gGD1d0STiNYr3Z0fJpimEZusl5l0d5/uxG2Ci7pifoYkYoTbJUw3KN01+KYkOgaK3UZJvmPvYvBnzsNEMRgmqUadLaW3zfo/wYPBr+ldSXUkTHTXbInefygzJlcqKaPPYvrN4ZAwtRqj6p5S1vGQioCbCVi1+8c+QOzPUzYQhZaFIPgEBrhT5d2C2xNu3fB0rvTf9PCX1SOZqSHSWtsluzKlntAobsOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Fb0F5gbfZI/BuwfTMS6vRx0W+ZF77uFvLkVjcP/lXA=;
 b=S9WQ8VlD0VdeH9ysooOZgiU+m48zrUiV4XFU4MT+0PbD8lH0SxK6bf6Tv6luMAgXzAN+RWRNfU60Xw8m3DPtM+ibyZdsWxrqTk+s0beayiKMISU7Y6ST9RqBvvTEInsdqlYvJkLSkeOJqrnfgy4S5ikNhHzrexEX0iQk3IeZA/O80fc3USu5FGeR9F0+wlAjDe2CLE0HInHkTNqYZhsmu02Iq3vQ9b8GmKtEJsA5SwQrBIsuIu3wPekkPmwGn5/4yO68h+Ljd+ZK1lPWUs0ELtLrejNw4U3Pb0gFslXo663E8vmMCvW6Oqh+Y3f9PxV3s2Is8iY0PcpYGoEuryJEaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Fb0F5gbfZI/BuwfTMS6vRx0W+ZF77uFvLkVjcP/lXA=;
 b=K3ih6pagLlFIUeAm8Ilef9lfHXbK+hn9Y7c/V3RxBSPQ10HqMiaz8LZKqj89NLBLgWTE32L8sBWetXJDlGMD0cDt7+3VYInjBXTCN0VNsh7a5IN/wBy5IjveMOoJLkynhBMnwHRQBsTpdbqdedusIYcVV1T9uwrkE8PY7iimOvs=
Received: from BYAPR11CA0097.namprd11.prod.outlook.com (2603:10b6:a03:f4::38)
 by IA4PR10MB8374.namprd10.prod.outlook.com (2603:10b6:208:55c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Mon, 2 Mar
 2026 09:22:06 +0000
Received: from SJ1PEPF00002315.namprd03.prod.outlook.com
 (2603:10b6:a03:f4:cafe::e1) by BYAPR11CA0097.outlook.office365.com
 (2603:10b6:a03:f4::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.18 via Frontend Transport; Mon,
 2 Mar 2026 09:22:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF00002315.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Mon, 2 Mar 2026 09:22:06 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 03:22:02 -0600
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 03:22:01 -0600
Received: from DLEE209.ent.ti.com ([fe80::9756:3b42:e53b:3cbe]) by
 DLEE209.ent.ti.com ([fe80::9756:3b42:e53b:3cbe%7]) with mapi id
 15.02.2562.020; Mon, 2 Mar 2026 03:22:01 -0600
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
Thread-Index: AQHcpvWtoQyt5WTP+EmgFSOStkCYv7WWv+mA//+cDzWAAGc+AIAEJ+hdgABw/wD//5/rkQ==
Date: Mon, 2 Mar 2026 09:22:01 +0000
Message-ID: <4865c7f626a340d7847354512367577e@ti.com>
References: <20260226075737.405-1-baojun.xu@ti.com>
 <20260226075737.405-2-baojun.xu@ti.com>
 <20260227-ubiquitous-dashing-copperhead-b2c6a0@quoll>
 <9f861c7df09c4434a98a203ecff913bc@ti.com>
 <63b0f42e-56e8-474f-8805-4e01bb2f189e@kernel.org>
 <a7316acf9ba248f9ad1fab0313a95654@ti.com>,<3cfa4036-e7a7-4cde-9dab-a171a63bdee3@kernel.org>
In-Reply-To: <3cfa4036-e7a7-4cde-9dab-a171a63bdee3@kernel.org>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002315:EE_|IA4PR10MB8374:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e71ea75-d441-44e4-62fc-08de783d2c3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|34020700016|7416014|376014|36860700013|1800799024|7053199007|12100799066;
X-Microsoft-Antispam-Message-Info:
	H01Cgb3Qyuihm0EvYBBGvkDcYgNo5o0YPW5flDzjGzGyvT32fFe6hAZt5ZXwDA3VfT/jRweXnV78YtRbqf6cj7oKW+5dqJuejOTuvWvwLHec3rn1NtyWntkTfRkUqAfmZ4i/62INgkJQao7fg9yq6TQbqy1wCSA5w7hB03bze1wFmV8EukT0+AODZRqvAvOxMuKhtpNUjQs+Ply1YsVg25PhVg94yhppTMtMjlIA561eJ6Y+/J0979Q45+zqMZvw02sro5CM7myXRA2w+5PjiqrquExGBl9wmONXYGurli4sxBbIzPHBEnZL7+ueH41WrfMIR03lKaLYkSFiG3YfdM0RZmz3tM0nIxz56q7hgObcYkg82Xz+i4VfCGfx9Goxf2tfH+kKmsI/caAMWnAna7urZ4VqVDQAfDl6iQWifRE6dOSzO3LkqrrM37x+StHqIwT2y2Ba9SY3+J1EHO+9g7hmY95gOVJT6qVlUA5iOsP4fJx7IKkyK6h31IeTw4daG/Xa4rs360ufXxhP5dVDkay1Gw/3utbS88Qk9SP5DLnuH5zbkBLHdvVreJ47AR4QzNDxh2xrZhoD+0D6lp5bskw6iFSpzVZj9teyomA71CKheniF0dU86FbJ6MTb/P4rgVn0wrUgTMCcGK1SJgyEouJLvjQAOmsl6xXImRSMXFaH+Ge4w6SBVdH9Ogg6DjZUJpSYRIXvAGSeLi8+yG9zxiH8zzZexBBMcQWlX7PTAB/Eb1OvOIteTQO9YQnMvii9eeLNR8Pt02EnKrjtVQIct025Wn26l/ylBB7y5UpQcgG//H54p0bcGVZecDrj5mnSiWX+piqtJa1lmY1JZevxBQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(34020700016)(7416014)(376014)(36860700013)(1800799024)(7053199007)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	XzBz+qamCMU/GOrTKvj+RSQkeL36/Z4EDbVjfJqKlAMktp2P4ar9eERUVrmICBrc4m8sVWwtFBQ+QoC7JknuSPRPoP9EjEyZP9/eTEEmRolff/Prumb7MAQi/aDPW8SAVczNSTu/hWoPySm9kwJiFnyW2w3yC0QYtxo7S3tYrNcvQBZ/H1ZPOekjBXcdFCBYDjEwBzUCNfyKiVAQC/99rVrjm+eVojbFvIyc9n9iec7LyQ51BPLRqB3fQvRYbMpbw57wMy6MqLcIdEKxTbUFgaBxAuGZITou2Z+5U/lNlujqTSF24M8czloQk9HWAIc3aXAUImjEiIyaPGl8ioAGYv3nhOeS/SpLln4RGSBPEZZn7XAQ1JW6A152zF8EfXHiQb/wt2BClnLBt+lOemqceg2lPtqiTG6REiG/ygPvyqGwqRa9Z+MUIBiM8IT8zSOm
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 09:22:06.2563
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e71ea75-d441-44e4-62fc-08de783d2c3e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002315.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8374

>=20
> ________________________________________
> From: Krzysztof Kozlowski <krzk@kernel.org>
> Sent: 02 March 2026 16:58
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
> On 02/03/2026 09:24, Xu, Baojun wrote:
> >>>>
> >>>>>  MODULE_DEVICE_TABLE(i2c, tasdevice_id);
> >>>>> @@ -144,6 +145,7 @@ static const struct of_device_id tasdevice_of_m=
atch[] =3D {
> >>>>>       { .compatible =3D "ti,tas5827" },
> >>>>>       { .compatible =3D "ti,tas5828" },
> >>>>>       { .compatible =3D "ti,tas5830" },
> >>>>> +     { .compatible =3D "ti,tas5832" },
> >>>>
> >>>> So it is fully compatible with tas5830 and most of the changes here =
are
> >>>> not needed?
> >>>
> >>> Yes, it's fully compatible with tas5827/28/30.
> >>
> >> Then above hunk and many others are not needed.
> >
> > Hi, because those chips have different on the voltage, so the parameter=
s
> > is different, have to use different firmware binary, so we must identif=
y
> > every chip in the driver.
>=20
> That would explain other ID tables (and should be briefly mentioned in
> the commit msg), but not this one, because here you do not customize the
> binary at all.
>=20

Hi, we save the chip_id in the dev_name:
strscpy(tas_priv->dev_name, tasdevice_id[tas_priv->chip_id].name,
	sizeof(tas_priv->dev_name));

And get firmware binary from this dev_name:
scnprintf(tas_priv->rca_binaryname, 64, "%sRCA%d.bin",
	tas_priv->dev_name, tas_priv->ndev);

> Best regards,
> Krzysztof
>=20
>=20
>=20
Best Regards
Jim

