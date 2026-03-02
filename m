Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazhn15012046.outbound.protection.outlook.com [52.102.140.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2355F2741B5;
	Mon,  2 Mar 2026 09:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.102.140.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772444275; cv=fail; b=HXRP5cawjoU86D08IeUZwWvNW3z1m4Tlmm8gqoRiJWruGdjpOVIz1KYd293QuiUIE3QpTDEXa9R68mJmsoORr0R5/u/2iZl2APq3vE/EThvV8usKAYcu3waW3tqiOhNd/r2hm4jH44+Fxx47SGt6HK6LClBve/kCH6RNzh2+E4E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772444275; c=relaxed/simple;
	bh=6AnvJijqFAJDBZSMuFmOpA8BZ/Z3VstNd+uMXliW0hw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uLUGucS9zNvz31VwzsBcDJfuG5QdLFnKSmUXjzQnOuPhTEdV4U2sIh7GlKFvmJRuAP/nu0Q869Llqi37PHcEwQ0mA7L+Qd6T9B8o45oSoU0mh05bafvHR1EWHn7VsMcraBUTr0EnfO5HIlJxcgn5a7JxIyF+SC0koNj3hsfHICM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=P7sYM5PL; arc=fail smtp.client-ip=52.102.140.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="P7sYM5PL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qJWQhg6YHv5m0gk6qE532uTzypakVAtTebbC9MpXoHJOpZhbivFVcAr+pvX9dHAnoQ8po9LwgVVtRhk1Dbes5FN5hXYc0ij3ekQBRUO7A6uBJobRgsuNtQnMRzAYsIjISMj/IRQe/fD6m5Pre87HYtSXyzdJFzSbT90Iugdh7RYXba0dH8N3tzy+1JJDG0c+6qU6d8J0GV8aETKBejSvzzk2BW0YheP4BkSBZxMxVfGKnh95XjUksCsWZ70kZxMGj4qz3Eh97i63Ll6P5B54vcYAYbAKRvrM1LaztHcnqDpruvHkPAARmxOu1vuDag4suRjQJW+F5d7FanFKH5y6bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BI9jBkLk2GsaijQSbprGN2vKxypsOzxd7FjpY5WqAgg=;
 b=iPPAg7avd4BuOgs+Lh33YrIcpRMfLkCpoNobOW3VB7tdgAT05Z56rAHHLRkv0FRP/vnSNxC+BxfhNCYJSyhXa/93vOzqrp5vZ6OEI21uxmPzBZds7fbmifSBk6E9VXMwcbsVB8F/Ogf5FviPZXeb4SE8RpP27LerDUFG2cXC3Kgy4NZO73gGn4MmMmJS2EASybNrwIfiIHiBfPdB8X9KlaIynocQhpwpkgiPeJn5HbbwQZt7dVBP7qVYfEovEggL0Ud4d1TLdbavt74YO+ar2JOOGkwn6RjvxdgjxYk2M8bzRN54WEaR8nGcA+VTt5ae08vWFkiH8hLYeQPdkjKsyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BI9jBkLk2GsaijQSbprGN2vKxypsOzxd7FjpY5WqAgg=;
 b=P7sYM5PLVqCfqv9UHYMTZg5HIue2iZukkBVAN1StnTYUbARPcWfkdqflRqzqGXcqwpM/oRl5JLL/PF1p9ovslA1HdDqhkUtTkzn+YARS+2tmY+PybnQ+rLO17P3hElQAmfgetQKK2FWljNTswoCFJmjkJurtMzmJuoobnpIwjIU=
Received: from MN0P220CA0003.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:52e::32)
 by DS7PR10MB7228.namprd10.prod.outlook.com (2603:10b6:8:e3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Mon, 2 Mar
 2026 09:37:51 +0000
Received: from MN1PEPF0000ECDA.namprd02.prod.outlook.com
 (2603:10b6:208:52e:cafe::ca) by MN0P220CA0003.outlook.office365.com
 (2603:10b6:208:52e::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.21 via Frontend Transport; Mon,
 2 Mar 2026 09:37:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 MN1PEPF0000ECDA.mail.protection.outlook.com (10.167.242.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Mon, 2 Mar 2026 09:37:50 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 03:37:30 -0600
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 03:37:29 -0600
Received: from DLEE209.ent.ti.com ([fe80::9756:3b42:e53b:3cbe]) by
 DLEE209.ent.ti.com ([fe80::9756:3b42:e53b:3cbe%7]) with mapi id
 15.02.2562.020; Mon, 2 Mar 2026 03:37:29 -0600
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
Thread-Index: AQHcpvWtoQyt5WTP+EmgFSOStkCYv7WWv+mA//+cDzWAAGc+AIAEJ+hdgABw/wD//5/rkYAAaE2A//+cj+w=
Date: Mon, 2 Mar 2026 09:37:29 +0000
Message-ID: <ff6d64fd8f954e82832e7470e20f955e@ti.com>
References: <20260226075737.405-1-baojun.xu@ti.com>
 <20260226075737.405-2-baojun.xu@ti.com>
 <20260227-ubiquitous-dashing-copperhead-b2c6a0@quoll>
 <9f861c7df09c4434a98a203ecff913bc@ti.com>
 <63b0f42e-56e8-474f-8805-4e01bb2f189e@kernel.org>
 <a7316acf9ba248f9ad1fab0313a95654@ti.com>
 <3cfa4036-e7a7-4cde-9dab-a171a63bdee3@kernel.org>
 <4865c7f626a340d7847354512367577e@ti.com>,<596f90d0-8dbd-4afe-a722-bf2ba65e1776@kernel.org>
In-Reply-To: <596f90d0-8dbd-4afe-a722-bf2ba65e1776@kernel.org>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECDA:EE_|DS7PR10MB7228:EE_
X-MS-Office365-Filtering-Correlation-Id: 876c1a48-7fd7-4029-8693-08de783f5ed8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|36860700013|34020700016|1800799024|7053199007|12100799066;
X-Microsoft-Antispam-Message-Info:
	oPphCQhV/7qlA5gUJ+sY90gUp5JtMibiz3io6ZBQ1QYgB0nW5pM8ou5AZAUTeBGnZf3PBWz1nD1oFAwPfd+ZJbE/SX8WXAWMJ8h+FqcgidKyzE8VXYXDLeyIWbGCCpRMYsgne27trNkF4cR+t3NBhvd0lk/i+C/MtfktgSQmepsMtgB0amOdzYjL9WP+czeC+tRWGDSTwA/8zrAL25+B1TQ1T03zEf+Ex84c+ye3cvfKD/KXNyMKMokAToixnxPy3rw+DHgjbYKxz9+Um2AYLL6pxmBo4m/sLDsFm/k1sv/AYbZO2hE8cHvNeWz6juE3V7tCIdnrAIxwbW/V4upVHCwUlwaNaD8cQ3YTfqWr0QTh5mqhk6EvSGIBHBpHZbfALi/doe76NvJwQZa2oYxFtwTwuiDQYcq7xogyRATpqciw/vuyX0UiZsHvccxd9rVqWoO/ndA5xKuIl+yx+FqwaRWvAX+2BXR3QP2obSPLYG3yGGgwq4rg0e7jcCklE6Eaa/CJOi/DeuHY8xg57nuc9CdO02JR43IhAr/00YQoNTJmUSIsuhnQ6Y020Ohi5ESX82eV6uQuFB6YgK2OdJari59wTAnXIHIUIUjxtYs3K4gQqjAtaCOTAdEe+2tH0SjVGsXxE2hwMkPJ2pKJYKKSgJWIF2GWqrdUGHkIbQBYI+WfvKzNvxcUOAK66YPtk2zJ8buiId3GW0+3lTH713kJOPXjvpQXFbJa2LHlz6vKFWpivlP8qC3YZahmiTmnrzl7R7/kFWoTb/OSBN8NcB1+A+PirhIGyD1F1OrwSky1umRzzBRtL0WMG18aMLwePzUxBspJM65OpZlqIqiDaGzNAA==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700013)(34020700016)(1800799024)(7053199007)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Pl3+uBSioJ3efHYph2rsE7WUg+kEueGDvphfuvhbiodUXsqUev05ZrnvwbW/hUeBKXvJzGjwtvk6fBVNus50RuIxm8FUjmq3sktB+Lbk3wAweeESk86SA3s9ONQdRQg2M7DbGAL3bdsvHIlZTvAE+CtiJrZuZH4rlKhuDJCobzKpM9tw/9/oKA9r1ekDOuSDSbN7xi5HwufsCcc3F9CTF8yBkagcxsLIX6nDlF0blJDRJO+A8ImaPjsQ39RSNL9JloMAWfNT5hnDiMjy7uBvOJXEbaD5RTwOz2SfEw3CnjRWdnfot4uqOdrLsvVYZRhWDA2KHrBa5un7aIE5RU4Th5zRkKeW+d3tCrZHcVDhODbwYIoHV3YwU6IOPl1YRkqld30dkna3rdFIK7OViVwSrZErnjUQIkXqIR+RmiGDpdnSTJKvsi+LmwVmtqqSQYYN
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 09:37:50.1445
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 876c1a48-7fd7-4029-8693-08de783f5ed8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECDA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7228

>=20
> ________________________________________
> From: Krzysztof Kozlowski <krzk@kernel.org>
> Sent: 02 March 2026 17:27
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
> On 02/03/2026 10:22, Xu, Baojun wrote:
> >>
> >> ________________________________________
> >> From: Krzysztof Kozlowski <krzk@kernel.org>
> >> Sent: 02 March 2026 16:58
> >> To: Xu, Baojun
> >> Cc: broonie@kernel.org; tiwai@suse.de; andriy.shevchenko@linux.intel.c=
om; 13916275206@139.com; Ding, Shenghao; linux-sound@vger.kernel.org; linux=
-kernel@vger.kernel.org; lgirdwood@gmail.com; robh@kernel.org; krzk+dt@kern=
el.org; conor+dt@kernel.org; devicetree@vger.kernel.org; Yi, Ken; Lo, Henry=
; Chen, Robin; Wang, Will; jim.shil@goertek.com; toastcheng@google.com; chi=
nkaiting@google.com
> >> Subject: Re: [EXTERNAL] Re: [PATCH v1 2/2] ASoC: tas2781: Add tas5832 =
support
> >>
> >> On 02/03/2026 09:24, Xu, Baojun wrote:
> >>>>>>
> >>>>>>>  MODULE_DEVICE_TABLE(i2c, tasdevice_id);
> >>>>>>> @@ -144,6 +145,7 @@ static const struct of_device_id tasdevice_of=
_match[] =3D {
> >>>>>>>       { .compatible =3D "ti,tas5827" },
> >>>>>>>       { .compatible =3D "ti,tas5828" },
> >>>>>>>       { .compatible =3D "ti,tas5830" },
> >>>>>>> +     { .compatible =3D "ti,tas5832" },
> >>>>>>
> >>>>>> So it is fully compatible with tas5830 and most of the changes her=
e are
> >>>>>> not needed?
> >>>>>
> >>>>> Yes, it's fully compatible with tas5827/28/30.
> >>>>
> >>>> Then above hunk and many others are not needed.
> >>>
> >>> Hi, because those chips have different on the voltage, so the paramet=
ers
> >>> is different, have to use different firmware binary, so we must ident=
ify
> >>> every chip in the driver.
> >>
> >> That would explain other ID tables (and should be briefly mentioned in
> >> the commit msg), but not this one, because here you do not customize t=
he
> >> binary at all.
> >>
> >
> > Hi, we save the chip_id in the dev_name:
> > strscpy(tas_priv->dev_name, tasdevice_id[tas_priv->chip_id].name,
> >       sizeof(tas_priv->dev_name));
>=20
> And where do you see the name in above table?
>=20
Hi, in the patch of first email, I has added "tas5832" in array tasdevice_i=
d.

diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2c.=
c
index 41b89fcc69c3..9228b3b6383b 100644
--- a/sound/soc/codecs/tas2781-i2c.c
+++ b/sound/soc/codecs/tas2781-i2c.c
@@ -119,6 +119,7 @@ static const struct i2c_device_id tasdevice_id[] =3D {
 	{ "tas5827", TAS5827 },
 	{ "tas5828", TAS5828 },
 	{ "tas5830", TAS5830 },
+	{ "tas5832", TAS5832 },
 	{}
 };
=20
Best Regards
Jim


