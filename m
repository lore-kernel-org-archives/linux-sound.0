Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11012046.outbound.protection.outlook.com [52.101.126.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EFE9328635;
	Mon,  9 Feb 2026 09:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770629964; cv=fail; b=snje2zIdbQCqL20fvSvVKI/Ewe0I8PKgjdr/uVXJwcBq6PBMdo/FIqLbGDKhpcnWRFC/VmzQH1MLTjwbxmYIAVeD2nVQ+vXoLBCouKXYSaQJSlaVxTk9qH3YcydVi7AI88+R1TqMkpYQ8OHAOItzKGP25UE4Dq12EHSfx3kT4i8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770629964; c=relaxed/simple;
	bh=+Ee5yG+Un/3Cg67uFnyGFAsx7DpQYED7qXSdYGrb3BU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MJ1IA5LdvvKQTpuBRAstd0zJmJolljlzHJyCpdEjoSk6YPpNbW9oafBagYbkcJkPe1SzqtnWgDrP+OnlHSD/mCTmjUcp6sHt6HlCkqpTgKiqgr3A0AngdYF4ZvDV2uA+Hs2ETXjvHNAWCLyY6RtY3uT7ePh+VTK8imP+YVQYd14=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=aE0A+nzM; arc=fail smtp.client-ip=52.101.126.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="aE0A+nzM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uhlUVubQZ90W/NZ7WOMObK+obuMaXWz6Skg+KZvOPaBEbaEvWnOncLvumO5Hu213BtuKFSPNu2QKPIQQZaYb2dSmTo0gmeXkoYwFNL6BIJRca+967yGU67rvao8RqkDvrULApj/0vQvlkK0oiXScXPPwGsZMPAzRxV/c4Zf8DQHht91Y8njziJAlrPujX9fODN+7EIsUy8p/41vzDk8Frq290xvwBmD+srg9hQjddvUqEOTwbYpLcuNprwIVzVca8ioQM4UgxPJnWbHk3fRVkkoWDQqmgnboVnSs1WyNsu0Ecz65ckZEZv5yvMObEwfpP4hNdWVDQEccaz5Mu2yKVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Ee5yG+Un/3Cg67uFnyGFAsx7DpQYED7qXSdYGrb3BU=;
 b=wm4+HdLhrX8uUX3k81NOL2T0DfsbyonLE6QhIwhdPHLrTsRQrK6WZ4IRBDBCMXZ71n/f3+HvstEpOml45ZSsSsIaDzrYhJRixlOyhitHCUPvE+Lnn5/IBScEyNF6mj7pGg1SwQ84VjXY89BlaThT5X7DSb7udJt0KY1f/9fcD6ROqEfBx4NfzW8z5oAxi7uyntgV95SfUS+71xfNXVG+LSUKpaJKSAwi7AJ+moquTgbr3Su9Upoh7nZhtK0BFfZ2TadWbL6mNwWnTaLQt4rESimF94LMEzzqAYa2oDg24SNfCYf2YMBfEBBnha6s6NCsVEKHd3Mqj2QrVeUX9tLZbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Ee5yG+Un/3Cg67uFnyGFAsx7DpQYED7qXSdYGrb3BU=;
 b=aE0A+nzM2Er9QzwBmO+MvsgeKNC8E0yWw7VdIZBHac2DeZPdoQGb2DJvth+QhBbuyT3bb5FYKIb8n6by1lB92v6eazuSMpRtqOFFk4CFOill67Xebh3cyG7jdkzZ3cfQ/OLWclcLkYRrJetZsBoJ+U4VGa8ZAIktN5l1r20CumE41mRqmUjtFSPOiNT1zrIqziDTjDHWKQVAMV0RqvnUBFCBaV33WCWYc2smvZPNJsQE2+O6aRL/IFzNgp4Ub8N7k8gO+ax1TiOUYnIdp803DO5LfvhvJFOIhnXe9Ns7IK+azQtAnq8V791BBVJgEV8Rbd2IgLzVMUaD06p81rEgsQ==
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com (2603:1096:400:358::7)
 by TYSPR06MB7207.apcprd06.prod.outlook.com (2603:1096:405:8f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 09:39:18 +0000
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc]) by TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc%4]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 09:39:15 +0000
From: =?gb2312?B?uvrBrMfa?= <hulianqin@vivo.com>
To: Takashi Iwai <tiwai@suse.de>
CC: "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
	Cryolitia PukNgae <cryolitia@uniontech.com>, "pav@iki.fi" <pav@iki.fi>,
	"jussi@sonarnerd.net" <jussi@sonarnerd.net>, "roy.vegard.ovesen@gmail.com"
	<roy.vegard.ovesen@gmail.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject:
 =?gb2312?B?tPC4tDogtPC4tDogW1BBVENIXSBBTFNBOiB1c2ItYXVkaW86IEFkZCBpZmFj?=
 =?gb2312?Q?e_reset_and_delay_quirk_for_AB13X_USB_Audio?=
Thread-Topic:
 =?gb2312?B?tPC4tDogW1BBVENIXSBBTFNBOiB1c2ItYXVkaW86IEFkZCBpZmFjZSByZXNl?=
 =?gb2312?Q?t_and_delay_quirk_for_AB13X_USB_Audio?=
Thread-Index: AdyZnvAYs5iJc+ksR6+Zx3IA7JWG3AABkmOAAAAtT2AAAFinAAAAGUMQ
Date: Mon, 9 Feb 2026 09:39:15 +0000
Message-ID:
 <TYUPR06MB62179F99EB21A5141AB4B60AD265A@TYUPR06MB6217.apcprd06.prod.outlook.com>
References:
 <TYUPR06MB6217522D0DB6E2C9DF46B56ED265A@TYUPR06MB6217.apcprd06.prod.outlook.com>
	<87h5rq2s0g.wl-tiwai@suse.de>
	<TYUPR06MB621791C06D1E683E87FBA590D265A@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <87cy2e2rbh.wl-tiwai@suse.de>
In-Reply-To: <87cy2e2rbh.wl-tiwai@suse.de>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYUPR06MB6217:EE_|TYSPR06MB7207:EE_
x-ms-office365-filtering-correlation-id: abfaf3b2-a387-466d-280c-08de67bf1728
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|42112799006|38070700021;
x-microsoft-antispam-message-info:
 =?gb2312?B?UWo4S3JCWFdrMFcvVEhjeTduK0JEakJXT2NFOXlXcGZSdzJBOHNHajhuTTAx?=
 =?gb2312?B?dTBKSDViazJmekpGcStIR1ZHWnBRNjcxYWxGbHlRemxMZWZBYW5iRzYzTmFP?=
 =?gb2312?B?cWsrMUpMRGpqd3V5VmV2Zk9HN1pkQm9RcHB3OXFvWHJ2Tmg5U3VLdWJwN1dG?=
 =?gb2312?B?MlhodVdTK2tOQXlQQ1QrRHJjMmxvditrbjdsMGZXWDBuVUZXS1VUL2lqMHJR?=
 =?gb2312?B?eGJFNXNaMHhvNEo5S3I2Sk5hRzQyZUN2alltOHNXbVhQbjBvK2dNUDBKZ3k5?=
 =?gb2312?B?V3BpVHRha3U5VlU2bkp5S1NtQTBXRW1KVHIwL1VJMDBsYUZDUTRRc09jaGE5?=
 =?gb2312?B?SkJnNi8zRGwzVFlweWJVTmRYMGZlS1drdHJ1Y2d5OWVVdVBGR1ppM3VMY21h?=
 =?gb2312?B?NlE5Zk42T1hHUkVkNU5EMU12NUx2bTIzVytQeFluakRhalZRQU5PWk85S0NX?=
 =?gb2312?B?dUZ0M21VbG9tTW05eC9rdzA2cndEeWFBc2JJcldIQ3c2US9TQ3VqZExEN00r?=
 =?gb2312?B?bmFybEVWb0UvL2UyZVJNeFVPUjRsRXkzaTFmK0IyM0NRVHZ5amU5Ry9qYWlS?=
 =?gb2312?B?UXpXVGl5MzJJSUxZNzZsMEdTUGV3T3ZTbzFnWkRLNjZSVTVyYWxLS2RZbXNq?=
 =?gb2312?B?QlFnWS8xTW9UM0dNMWpKMG1tbEp4d2ttVk9rNmVCN1BzUjduRUJHZlExcXJM?=
 =?gb2312?B?Q0dDMXhYT2FoZTUveXJXL2hmN1pFcSs2YzRxTjU4ZnJnVHQrZk1pMGpwanBw?=
 =?gb2312?B?U0NnK3VLREpOd0tTdDJFMWJFN1p0QldiV3MxTzF5VkpsS2YzVGxHRFVUS3Rj?=
 =?gb2312?B?VXZpRlJ3UFUzTDNEUEI0Y0d2aUdHNkRYTnZvOVI5a1JHNGNWRyt2dXBzaFl4?=
 =?gb2312?B?SUFRUGJQejJwSzhxUXBMNVAybkxQam4xUlU3aFNLaFdYYXVRZ0tRdkRBNWs1?=
 =?gb2312?B?cytpaFZHcUZITHB1RS9LTTdtOXFGTk0vU0pRa21pVWNJeG93TFFBZ0xDRnI0?=
 =?gb2312?B?KzF3S0xhR2ExWmFzd1pWVDRlSkQ5U2FHOXpRSXZCdUYya1lVb2tUK0NHK2Uw?=
 =?gb2312?B?L0lwODltNkZGVTlSZU5ER3AvazlDdGEzZDl5cXRDL1BlNHB0U2dSR0Y3WmFB?=
 =?gb2312?B?VmFMeXAwUm53WFNqcTlNTGtNWGdSck9aYTVjUXIrenRVejNOb2E2Y2JFblNI?=
 =?gb2312?B?eHc4YlM5enkzL0RDRGswQVk3dFhNTUxCeHdGbEpZVTZQZTZvSmRxemJyUUlk?=
 =?gb2312?B?TFBDQ3ZsQS9ja1p0MDhLeWdqZlQwMTV4TDBhWkYyVG12RFZjOFl6RzlUSUJG?=
 =?gb2312?B?NHpUN3VYSHR5Z3V2aEdiT082bEFCRDZKNmdBSGNPdnhzd3hrSnIrdUxGSmk5?=
 =?gb2312?B?MHk0VDZTaE5FcTFGNlArMzVFY1paVEkrTXBpWHB3S3FRU2xhalhIalNMczYr?=
 =?gb2312?B?RUVGMzdISzBnREl4Q1owcVJnSWcveFlXMU9lcHV4RVpKc3F2eGZET2FtSE9X?=
 =?gb2312?B?U2hraWVFL0xwMDBOWkJCSEVic25hMzUvS0FKL2h6cDRmelRxaVppcUN1U1dY?=
 =?gb2312?B?bzIzMTlsb2FSOFlab3F6NjhMWHlvVlZOblBma2ZWTWVVMURxSTJUQ1lhTzhs?=
 =?gb2312?B?VmhTbGJnU25nLzJSVkY0SlpVUUdWUnFYRERPdDZjeW5NN3JEZmlqTkRDVGsy?=
 =?gb2312?B?dWFnR2tjSDhsTTI1dU9MeDdET2tQUEovcnBwcmlyMDlHTWxYMXlFWXA5ODhQ?=
 =?gb2312?B?d0R5T1B6elcrQ3pSbVF2WTNud0RWWW1xN1YraWlzdzBVRFlXNTNkQ2o4OVo4?=
 =?gb2312?B?SXREWHZna2hmNEY5TUw3TUlXVjk0MHRFMHJKS21wMHVXdTBqWHF1ZGtkU1h1?=
 =?gb2312?B?ejdIenZDZWc1ZU9yU2dzUDBxTktxSE1PcTloSng3alZNK05DQ3ROdHBoQ2Rt?=
 =?gb2312?B?OEUrRzR2WDkyYWMveWlncm82bmJxa1ZBeVRDZjhnenY5M0hjMEtUR2p1Rngv?=
 =?gb2312?B?SlRlbEhOUE1nMk05ekFWZEFDVk1pa0pMRkdhSVV0a0xCUE5DRnlYTjVCQmFR?=
 =?gb2312?B?dDdReVVLMHlyWlI2dUlCamFxN050cHBIWVVZOXBDZWEyUlVOR25PeFN0eDJh?=
 =?gb2312?B?alBvWlM4NlJwUXB4RUh1OGpwSUNaRCtUa1I0VklzcUZQQUVQVXlEQk5qc1Zp?=
 =?gb2312?Q?b1d3G/2eG2qHlqk03MSF04Y=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYUPR06MB6217.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(42112799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?WmRiWUdwTW5hbkppdFlQNDl1Vm5IRWs4Q3hmc2R6UnpjZFd0VDROdXovOEpD?=
 =?gb2312?B?VUtQYm1pcHdma1VxdUo5YmdGVW1pU1BIM2FvSUMvUjlud1lJcUREZCtDc1pM?=
 =?gb2312?B?Q2ExWFRmRXhJbi9QdnU1YmMrRG1zYzFQZHBid2licG9HWHJURFgvQTRQNzBK?=
 =?gb2312?B?WGVEVWk1YndlWE10OTRFUDJNQXhmaWNQRUszOHV3bEJ1d21Tc0xhU1NCQzhG?=
 =?gb2312?B?Q29FZE5WTUtnSXUrQ1lENnVGZmR3Y3Zsc1FPT21HMU5PRGpwUWpMaXZjdDJn?=
 =?gb2312?B?L01INTk1WDA5NFI2Z3ZNMnVsM0hOdEVtdFNZRCtWTVhVSUdVR1BWWlJNMnpp?=
 =?gb2312?B?VWk1RzI3b282eXR0dlFoK3lIWnFXdy9hSUlMT3phbjZyMlFiVFdPbTFvdDBz?=
 =?gb2312?B?KzluMUphRFFiVERiTFNSRG85NWRlUnNKOTdXSmoxb2tDbmtoN1BIZHF5cnV4?=
 =?gb2312?B?N3FKTGVSeklOeXNkT3ZVUDBUM1I1bXQ0RHRzYkdtSUswSkowVldwRllkd0hJ?=
 =?gb2312?B?V1dRZFR2L1JxOStsYXpnT3FlSEhKOXFjdkdINEw5SFNvU1J3bGpLVGJaMTZ1?=
 =?gb2312?B?OThWMkl6YkFYeU10Rk5XeFB4NW1LZWhYTzhJZ3NxL01rZWF2T3RPVUtOMW9m?=
 =?gb2312?B?YWE0bWZWWEp5cy9RZ2htRGhJbDVNbDdyYXB2ZUdJUU5SazlaU3h1dnNwSmln?=
 =?gb2312?B?N0tXem8za2tOa2ladjA0T1FjdWJ2VnI4Sy9vYTBwa1dTT2IzQ1dpWkZsSEkw?=
 =?gb2312?B?NWdEdmQyR0hxSk40Q3lDS1MvbkZYb3FEamZIanh3Tms2TFVrWUZtSjVweU5I?=
 =?gb2312?B?SG0rbWUwUXpXbzhHK1U3cUtzbUpVMWZOaFB6RU83Sy93UFBVTndtQkdQQldD?=
 =?gb2312?B?c1hiZnZkTjgzMEt3d3RRUzU2TGx3M3dXUTl2dWlyWDYwMmU5bXJ6N2VKTHF6?=
 =?gb2312?B?bUlJMkZGMmsxSEJscUJyZUk0WHE4ZjMwb1VJL3pJbkdrT3BIMVZHQjlDbDE0?=
 =?gb2312?B?L01Nc1UrbkVuWDFJRXdRSkg2eUZ2NkRFWVRLTmQ4YW94SzdjQkxTWHZacmJN?=
 =?gb2312?B?d282TjRaUDNSTGdHcGo2bGxPWitWclRrNHJPMm4vTjErTy9sa2gvaVFjemgz?=
 =?gb2312?B?UXJFQXBVSHpHY042ekV4WjR5ZG1CRTB5WUpyV3FnVmpFZVJHWjJNV25PZVZU?=
 =?gb2312?B?UVd6Z2F6TDdDdGZBRXlrSnpXTWdwQmxha1dzTjdPMXJzbVJBcXlzYlVpZ3BF?=
 =?gb2312?B?SDczODFnamEydm8wMjVVang4MEZHM2s2QXZlUmJUZjlTRlFlaUdCZzM5NmNS?=
 =?gb2312?B?dldmMm9mVmh2dzNieGU5Q25KNFBWY2JoaG9UZHR2NHNaOWkvNUY2NVhKR2ZG?=
 =?gb2312?B?bVFMZHErRWNDRExtS2tmWTVrb0VzTGU3cnNzVUFQaTZvRmVGV2gzWVF4Q0R0?=
 =?gb2312?B?Qk52V0puVTZOV0Z5Yld0U3RTMjZ2RGdsejV4bVJSd01sRWhybFNwNVBKN3ND?=
 =?gb2312?B?TUMwdkJlLzkwRUZUa1hpRVZWTGw5WndZSWxJM3I3QWRTTXVLZ2U4UEF5Sktt?=
 =?gb2312?B?Lzh0MDBYbmJFSUlWMUZYdlBmY0ZvR2FCc1BvVTRJRVBMbGVpTjVvQ09oNyth?=
 =?gb2312?B?QTlmSFoxUjg4aEJ5bjRkVDZuQ1hybFR4bFArOE9ML3pscTdQTVB1K2U1N2Mw?=
 =?gb2312?B?eWlZdnlpQ3VtdVp3SndFQndFS0lDdmpmVkorMU5maTRnMDE4Tm5JNFcwMFYy?=
 =?gb2312?B?R3IyVmpRRGlWTTZvUzNBSENjTWEwYWcyc3R5dlV3aHVMdGxXbjVRRHhUOGh3?=
 =?gb2312?B?d3pMVi83LzFlWDVscFdCelN6QWdxdW4zK1NZRW1sN1Y0MHM5UlhuVVcrUG5l?=
 =?gb2312?B?Vm9ZYW44MU1FRXN5TVlFWkFIUWR5YzBPYkxWcCtra2dvSi9GbFZNUTZjNTdT?=
 =?gb2312?B?Vzd3ZndIT2M2TktmTXRrWjBROGF0QmVNSytaRytMbDN2VU5nQlhNWm85eFMw?=
 =?gb2312?B?YkNhd1NnWEptM2JXdTZBa1BLcTgwNnpGMXVLSnlmM0FsTmNiOWU2S0N6WU9X?=
 =?gb2312?B?R2R6VGFFUzFpNnZodTMxdHp4alI4SE5UYUdQSHZBd05TblVUUGlEOURxakN5?=
 =?gb2312?B?U2xndmMrNStqVHZJQ1lhUHFNY1JURUw4OEVZKytMWEFDWFFVZHcrYTZQQXg2?=
 =?gb2312?B?VnRlQURjSElLNnBQclQ0R0lUcWtHSS9tTW1HaUtOVUp6M0tPbFBwLy8yR0pl?=
 =?gb2312?B?SG5jN3VuNTRkSFVaVHhtdDBnd0RqMDIrYVMxVjFORWhzL09COTVhTWszMHJI?=
 =?gb2312?Q?jARsCaTkx3xkrZnPRR?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYUPR06MB6217.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abfaf3b2-a387-466d-280c-08de67bf1728
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2026 09:39:15.7918
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4hPnPiRbq2jBruz9ar1BMAkEbnqt/4D4P4sQxVlBLv2mRjhhnqGE1YSoOsYhTcp/DVKv7C/d5B5HecfOj/6/Og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB7207

SGkgIFRha2FzaGk6DQoNCj4gPiA+ID4gU2V0dGluZyB1cCB0aGUgaW50ZXJmYWNlIHdoZW4gc3Vz
cGVuZGVkL3Jlc3VtZWluZyBmYWlsIG9uIHRoaXMgY2FyZC4NCj4gPiA+ID4gQWRkaW5nIGEgcmVz
ZXQgYW5kIGRlbGF5IHF1aXJrIHdpbGwgZWxpbWluYXRlIHRoaXMgcHJvYmxlbS4NCj4gPiA+ID4N
Cj4gPiA+ID4gdXNiIDEtMTogTmV3IFVTQiBkZXZpY2UgZm91bmQsIGlkVmVuZG9yPTAwMWYsIGlk
UHJvZHVjdD0wYjIxDQo+ID4gPiA+IHVzYiAxLTE6IE5ldyBVU0IgZGV2aWNlIHN0cmluZ3M6IE1m
cj0xLCBQcm9kdWN0PTIsIFNlcmlhbE51bWJlcj0zDQo+ID4gPiA+IHVzYiAxLTE6IFByb2R1Y3Q6
IEFCMTNYIFVTQiBBdWRpbw0KPiA+ID4gPiB1c2IgMS0xOiBNYW51ZmFjdHVyZXI6IEdlbmVyaWMN
Cj4gPiA+ID4gdXNiIDEtMTogU2VyaWFsTnVtYmVyOiAyMDIxMDkyNjE3MjAxNg0KPiA+ID4gPg0K
PiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBMaWFucWluIEh1IDxodWxpYW5xaW5Adml2by5jb20+DQo+
ID4gPg0KPiA+ID4gVGhhbmtzLCBhcHBsaWVkIG5vdy4NCj4gPiA+IEJ1dC4uLg0KPiA+ID4NCj4g
PiA+ID4NCj4gPiA+ID4gIHNvdW5kL3VzYi9xdWlya3MuYyB8IDIgKysNCj4gPiA+ID4gIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCj4gPiA+DQo+ID4gPiBUaG9zZSBsaW5lcyBtdXN0
IGJlIGFmdGVyIHRoZSBkZWxpbWl0ZXIgbGluZSAnLS0nLg0KPiA+ID4gSSBndWVzcyB5b3UgYWNj
aWRlbnRhbGx5IHJlbW92ZWQgdGhhdCBsaW5lLg0KPiA+ID4gUGxlYXNlIGNoZWNrIGF0IHRoZSBu
ZXh0IHRpbWUuDQo+ID4NCj4gPiBJIGFjY2lkZW50YWxseSBkZWxldGVkIGl0LiBEbyBJIG5lZWQg
dG8gbW9kaWZ5IGl0IGFuZCByZXNlbmQgdGhlIHBhdGNoPw0KPiANCj4gTm8gd29ycnksIEkgYWxy
ZWFkeSBhcHBsaWVkIHdpdGggdGhlIG1hbnVhbCBlZGl0Lg0KDQpPSywgSSdsbCBjaGVjayBpdCBt
b3JlIHRob3JvdWdobHkgbmV4dCB0aW1lLg0KDQpUaGFua3MNCkxpYW5xaW4NCg==
