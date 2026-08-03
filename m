Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168C33ACEFE;
	Mon,  3 Aug 2026 09:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785748008; cv=fail; b=az/j4Zw/YsOJzz2bOXl6MJXrdSacvxplSYBYk1iEr8TM6mYn9LHH+Mo/V8qqn3oWnhJwQAv4DtMBY7OwEq6RI7OrGPyNewvov0IsZxD31InjRq8YMBNFAPB4nr5OagbEVSTsVpWG3Ccarj8SKk63H+PKopBx4nQzIKKWU9OlAg4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785748008; c=relaxed/simple;
	bh=SnW/HpzhxRS8e9iBjzfCChUU9Tq5GZGR1ubB9mVMYHM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rao/e59L2n1LEo9lbJmj3Pzyxnhjl+e8tmB87PJWUsRVJAU+NXRCN6sv1V0cDl1s+UnLzDZ7mfHU9JYdssGsLYkA/9i4SLNYtot/OlgAfV7qfqtJXlROokWyrcUGJA7RxipDq4nNqIygsAJbiGTHcMKPRtrpJP2kYxRNnsnX6rI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=TTPlFKe+; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=LLFh3tW1; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="TTPlFKe+";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="LLFh3tW1"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6734WGcE2863463;
	Mon, 3 Aug 2026 04:06:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=SnW/HpzhxRS8e9iBjzfCChUU9Tq5GZGR1ubB9mVMYHM=; b=
	TTPlFKe+Gzv/kls4Wp2RM+zpLya1CDDiq4hyNQ9kYNtgZWm1JM6Ajoq3Jfay0gRA
	YgVKzfDvtB8kXWZoqHtFgJx5yxdEX5vt5VGt7L0nzDUDOguHnQ9gf2O/4pKjjcVQ
	yyK9OKjW6ro/tOSLI4wD4bOAWLBPWTIzIl6yiFRKh4hEOAQECmXCXjwKMGR3vrvI
	Kc8g8psRMKS2cCT6XuV9MlcLRXKfzNpcZSfWqPPJF9S+sAgukoHv2gA58Ck5Awz0
	BZco9e0NmNAWIOWxkcb0+r3483vZtCBcqF0ed7s7EZ3hsAJUMz6jqXaNkE5UgETn
	stbSCekVliDlU4PRlrvqtQ==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022108.outbound.protection.outlook.com [40.93.195.108])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4fse6vhnd1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 03 Aug 2026 04:06:25 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LBTCRn3LCM7RUEXQDv+KKecMpC05nBKg30+zahMGexe0DH3Bcj+8jcbgQfy+6j3d7fZVV0RRBVLaj/4irLdf+edm1diy0yUi52auQpVjQBq9TrGamUP+T/viff5WBH63jsJm5mTYKHwDG1r00NJjEn7PrHn8nwfbpSuwSN/sjq/mD20YRAPZVvLGWevebrt34THEXG87o8aEIG2Xr+V4xdR77G4xFEm+rDLUUXiJALnTjR+UjsN5aGb2briVumwMmLePVg/P+w7Dict4aPwqnSqPerW8eG1yAKGWRFT65NRsdxunxdEA8xkdCkukLjIiSDyOzaSpUiwV7ihpCfbAPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SnW/HpzhxRS8e9iBjzfCChUU9Tq5GZGR1ubB9mVMYHM=;
 b=huJagVXJsvUl5rACNLzw2T5hh6eMC0rBHdpSciiJ2UMpnRNTOHqblo955Kk+BJz9/YocdPAQLdBJi2bFqgF318nm7tmEM80LHU1LCdLS4SuA8aYa2Jwu9e3DLI1rYX8rWvllNzlLptYw6DxX+xVe4GDaexZ19S65BbkHT9nK7QObKb7A/VijRAam0mU1JgQSA4M8TtLRPjVeo0Jfhrlg5qrtlrV/EyNxeHNztoYRFq5MjexM3muwl400+pLGleGWNW5AbwiYbiV+2fitM/3H+tbrhBuCzSfWPKiAV2Z4zTEABRiF8ULcy2ON3Xy154Ks5awwpsUJ74SPudX3UARnRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SnW/HpzhxRS8e9iBjzfCChUU9Tq5GZGR1ubB9mVMYHM=;
 b=LLFh3tW1LQZ74f9Puvx2X9qqAAwPzsZ3J1jKzHn8He3nG0Zb3LKKBxLw7uQSzMsxQnSogxiLlD7h0l90zdUBy4NRGlGM2HzRySgFxjfLv5ai2P3rGAjt2P8G35r7M7n0tx/aCXA1PYYcm+zn2cyTvtooOqwsr+tLWYLWxIf0CPg=
Received: from SA1P222CA0181.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c4::28)
 by PH7PR19MB5701.namprd19.prod.outlook.com (2603:10b6:510:1e0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Mon, 3 Aug
 2026 09:06:20 +0000
Received: from SA2PEPF00003AE4.namprd02.prod.outlook.com
 (2603:10b6:806:3c4:cafe::21) by SA1P222CA0181.outlook.office365.com
 (2603:10b6:806:3c4::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.18 via Frontend Transport; Mon, 3
 Aug 2026 09:06:20 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF00003AE4.mail.protection.outlook.com (10.167.248.4) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8
 via Frontend Transport; Mon, 3 Aug 2026 09:06:19 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 98031406541;
	Mon,  3 Aug 2026 09:06:18 +0000 (UTC)
Received: from [198.90.208.11] (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 7AD1B82025A;
	Mon,  3 Aug 2026 09:06:18 +0000 (UTC)
Message-ID: <9f71658a-9b12-41c4-8514-19dcf0521146@opensource.cirrus.com>
Date: Mon, 3 Aug 2026 10:06:18 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: Intel: soc-acpi-intel-ptl-match: add
 cs42l43_cs35l57_l0 support
To: Cristian La Spina <cristian.laspina@kernel.srl>,
        Cezary Rojewski <cezary.rojewski@intel.com>,
        Liam Girdwood <liam.r.girdwood@linux.intel.com>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
References: <20260802155741.202067-1-cristian.laspina@kernel.srl>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20260802155741.202067-1-cristian.laspina@kernel.srl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE4:EE_|PH7PR19MB5701:EE_
X-MS-Office365-Filtering-Correlation-Id: f184db1f-8a32-4d6a-277f-08def13e7bc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|61400799027|23010399003|36860700016|921020|13003099007|16102099003|18002099003|22082099003|3023799007|11063799006|5023799004|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	XuvyBxbFdQ/MaMHCmZGZIzTR2hm3Ogqe2fkqihX1sB234BxFVAeWwgjGfh7K9/GUM1sL5JTLUS5h1WBxk670fcwl+D9S6VXUMACNKQf4wan1AsE2ku6yuDAzpL4zumfbGbKcRmcoe71l2s+o5BS+YyXeq+M99ofk9umxLRSjdlvIaYFhx9W6S+8t5U57BRQvBQOu+0Gp7u9QZSuC/0au9gK1uVdYJPJNfB78mtbet5yGcAsgR+Ibph5JevXmzN/Qm+upFj0l3rQqaiZrBU45BmpmV7sSU+Y8ysndBccW3l2ZukM/8zcQudwLSrk9ID3PUK4GSUEkk2FK+bLqwS0DO7EKcOCwy56M88UCUpn5t0r9DZ/Fnn6xEVzY+wz291extunXdr0tlrkyU2MxMZKCNj1zjT4WzN6Dfb6sqwY/ESyNwZtDhFWH4PRiyvEzYh8syJCMw6Us4ZvKB/9B31ooUCHOD9PevRCD4yzyLa2Kd9kKnZojA0g9X3sMVq81zPkuP/ZIWPBVUkxTaUOcoZfcXxwWOIfotv4ObPbAZEz7vTjDR3ulI80orZvJnVC4rQIcmaFeItGg4DRFpkqC8uQhFOdrCfpnrweewUBQ8tLN6deJqAqIzoGiKMtk1AMsfJm8g/A9X+7EcRNKqQAcDa3VBq2qu2XfTVSuLLo5s09g3XxIoEJfaQ0FzuNRpeeTT06yxQKNQh94gevmrAaCnNIHY7SMnZJoTmVZBL3RtwU2cDlrBViSfKw1SqYqxjNauxb4
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(61400799027)(23010399003)(36860700016)(921020)(13003099007)(16102099003)(18002099003)(22082099003)(3023799007)(11063799006)(5023799004)(56012099006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Kjs2pXWmJMUVTHiLBGIkf4SZMtw4Lw94HHqmz1GdU1k9x6tRssz7httl+eXi7lwBCF+D63StxeIRBwYwaMey7TIB1ApNCOuXqNSiMEnPreGkMeTVXyRjHzvhnK5YKLZN3goxSUOaOLsGSnRTqvoe1qBkAPqkSewwR39ntKjJ6do+54QWHOkGNL3Gyy4iQQPm69dBqZj0H9LljDe0XmDB9PJsJGgihNORkyyHqCgy+4WHYWfzNEkEnc+m1XYEElA/f0g0DtJeahc+91cW8vGH+9f7b43LN1klUTWOZTkzbpTFsvSohPCGFXUml81BdKWmIKk0jK03EGUd5oqbTjNUYSS1bV0wN9eJzWrNGIYhvaiwUCd+a/I7nSsaMjerJ2O+hRDf0yqxnm6Gs1WQmQiDHuqLgT6WRLxWK97XnDD84WwTsERnEADHjKzhvt2qBAvP
X-Exchange-RoutingPolicyChecked:
	VSgGCor7EOnnnWd4763JMQLfrIvSiY58Ix6koqa7hPjHAowZi9OL8+tWJpdm5uik5xRVxVzNPwAVUVH+hdoTcEwtqgd5j3RiTG7SXtt+hDrE97J2hsH7VkdrgWBQrIvlmP1M+og8ya02D4bJmnuu2Wrh8HrPbt9IltBxTvBt+z/mUe4Z0oXUcOo4a71i4sr/IdFpszndsjbAgz+fHx161UMYYMBTrMYCCbzWeGGaxy6C8i+8WiG84FCeL8iW4Nd5D5ovt85yU9054znNgm6l8V6K9tF3/MvWKwq2nXJwCioIqNKNxej0g4ZgXp2DlYcVY5ulgThKoh6ZAJ7zY2tbHQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 09:06:19.7474
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f184db1f-8a32-4d6a-277f-08def13e7bc8
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF00003AE4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB5701
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA4MCBTYWx0ZWRfX7eIoQHYtjXKP
 Z0a8UmTuOo5cmHxr4eBYUHdAG4OHIiMjPrkH+fsWsB2mekCOhw/2U/W2gO0hYwwnCrTN6DP9MTu
 UVPP9uQPpbC+cwvanT44qHmfNniFJtA=
X-Proofpoint-GUID: BN9Iszso5bEoTKBUP8Fu28dst881Pi21
X-Proofpoint-ORIG-GUID: BN9Iszso5bEoTKBUP8Fu28dst881Pi21
X-Authority-Analysis: v=2.4 cv=N+MZ0W9B c=1 sm=1 tr=0 ts=6a705a11 cx=c_pps
 a=F8yC87VG0lzwhDI2wa7IUg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=NEAV23lmAAAA:8 a=jL3iIiXDIwD06o7JYiUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA4MCBTYWx0ZWRfX+cKH2hbg/lpO
 uzY+VNTPEZpWiaxHLVICo0xlP6uAUcQfIP77LVUK2oxBqM1F9kHZPrPUOiX77db9M451CKd2MAw
 sO0Ba5CCTgPr66ARhhRlspcVAPhNlp9BWY0YrFvj8Tn1CYnf5UVGNk2kW0SFDrFrK3QeJqtgqbB
 F/qDZ2rGatOxBan8f3ZPjy20MXm12XePWV7ynNPSLgvwPi6tEz8hywfUhi87PjYexa0lGa3UCNz
 Zwc/I4b71yoaICRjDAS3fTTFtX1+w3w6baBQsLGCEMiv2r+eCU0S2Cq81QXBec06ErpFPrZt+0L
 Re/TjtwdR4wI9M2Aa5PsI5zaV4NmOdmQaMrGDyreb89cEEVnMZCiJEYbNlJRVn6MZAAEQyzeoc+
 VZZvopxGLyrFsH/ftph6D6fR7LvfA1ie4KjE4xUKIg3ShWCVxgzx90hr2maaZ0SLvzPVuXCbzBp
 Rz/d6dbUsKp74R77xyQ==
X-Proofpoint-Spam-Reason: safe

On 02/08/2026 4:57 pm, Cristian La Spina wrote:
> The Lenovo Yoga 9 2-in-1 14IPH11 puts its CS42L43 codec and both CS35L57
> amplifiers on SoundWire link 0, as described by its DSDT:

<SNIP>

> so this laptop matches nothing at all
That is expected. PTL and beyond should be using function topologies,
not legacy match tables.

> and no
> card is created: speakers, headphone jack and microphones are all
> silent, leaving HDMI as the only output.

That is not expected. Please provide dmesg output. You can create a bug
report at https://github.com/thesofproject/linux and attach it there.

> Add a match for that layout.
Please don't add match table entries unless there is some reason why
functional topology is impossible on a system. There shouldn't be any
need for match tables for this. It can cause problems because it will
match any system that has that combination of devices even if it also
has other devices, so it can "capture" a system that was previously
working with function topologies.
