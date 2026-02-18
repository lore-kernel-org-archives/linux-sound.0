Received: from mx08-001d1705.pphosted.com (mx08-001d1705.pphosted.com [185.183.30.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C4F340A7D;
	Wed, 18 Feb 2026 17:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.30.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771436915; cv=fail; b=ADlIJ9fDqZX4qeJndcD+Fq/zQmfBCP2KmX6QHUE1jq3xobXjYPUDVh69O2E+GEqyOMjksmZs6bE6Jssnitzxe3nME0mpKmY66few6VGylTJd037BKn4DnFRMXfBi222qVJB613B4zGD0sPLw9x6G8zUWoJFz4TuQIBWS+vSXTxs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771436915; c=relaxed/simple;
	bh=Bnrl8tyoIAwXok3CleAaC6+exyLhyDxuWjYpA0gHnh0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=lsFcPLyPRBiTGywmpegSW1Rc9CVqLtuDAKRUOnjCX3pBc2gEmL4FvQDdxPOJffLwgm+FBFCHI4igV4oPbpXcEeKQtDo/RXweFeHNO5zy7ku7RM+tt09A9fAJfZVymw4tc+mmTCpfZesVe4wkrDrZvN3TLxqsp1Qv/nIYAyoKr7o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=keZaGhHi; arc=fail smtp.client-ip=185.183.30.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="keZaGhHi"
Received: from pps.filterd (m0209321.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61IF9DCC1471637;
	Wed, 18 Feb 2026 17:48:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=S1; bh=7PCggj0
	sfDFyLVGTkndKR40vnUHu6a+oYj1nNZICP50=; b=keZaGhHiy3ZH2wW4drbLW1+
	4i0kopaw8DRtSzj04kJ6Cv2CsFX+g+42np8NAYcQLLCwgY8iJ7ESCDH+MbZ8Pfz2
	fnYku0gCqr6wIpOjh+9M3Y/gOF8Z48laR6puS/xGK3hnSnRwvlPqiMyx5TYgPput
	u9iePpl9fG+ER+8sOoh/VM1BU3Ao399fSdB+SsopWmJRKdhwPbOMu/nK6hYowk5m
	TwUqeOXG5Jnn30wzo71yLj2iZN3ExJbVdinZ55zj8SLP5FKaorwto6ugumxi0ZN+
	8KJyx9qdS9jP2HDO8uzkREm/Wdhldg4xmDDcZDCuxRnyznlvTFUELqSHLg1pLnQ=
	=
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011035.outbound.protection.outlook.com [52.101.52.35])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 4caj2g4p6x-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Wed, 18 Feb 2026 17:48:13 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mqqV0F8/KrMq/Lg+RjFlvm35QU6W3rZsZgHyHuKx3mOwtLKBXk/Em+UJUPEgeYkQAtzNuIjIL+o3aEFAyx1AAuJJHFArVb4F35qyRE4WBSasE/tnbLTwsa8inMuw0VlzMhWAOF8dl8LbTaF+vt+0KlBmu0jJ+1KrjHBerSLzFmQA4YS7F8o+1l0yI83RZcChvnihPgmn0FtFKJ+8lsbS5skoQKPa0cFELWEcM7M8d1OzEzo6BPOa27t9ftjlqc+9OjdHNRmBWmFYXkVGaxTDeLNGEtbawOif8Fa+K6gotZwWhrf9m3qyKDPviZcF2jYv6euPXbCww+CZtkTPgNqE6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e00uFNJJgKk4m5YCA05Pq8lFzRiu9SHhYcvuO1xlS40=;
 b=qqLFXFk2OWIoUxPl3NU2GwHaWiK3B4iPMdWBjg/16CnjStET6Jgs+eQVAWiY/Hwl9jfBzkRU6AZjSmv/zMtG/Vm65LAVxcQJCl/p82Aj+lk90x7TS4gS6Lwn+yC2ALCSvAmsMap36tuD7YxMlJ1MHVFNJbpJXmStnZ8U3y7CEMQ+x+QPLX45o8t1zvlcXoiiApmVept8XNiAi51EHyVmZRLWWF/IQpLgVI+NpG78nj6x2FxrsATFeTffwbESjUE9jHa8PQ8Sx7YnIiihpUBClyy6aQltcaDVVMJ4ey+CgizqYevIF7Y6VRRlCkFjzbSOGtVDJl9UCiU7xAODJ4sqZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from MW5PR13MB5632.namprd13.prod.outlook.com (2603:10b6:303:197::16)
 by SJ0PR13MB5270.namprd13.prod.outlook.com (2603:10b6:a03:3d3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Wed, 18 Feb
 2026 17:48:05 +0000
Received: from MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::29e9:b355:cabf:66f1]) by MW5PR13MB5632.namprd13.prod.outlook.com
 ([fe80::29e9:b355:cabf:66f1%4]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 17:48:04 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: Richard Fontana <rfontana@redhat.com>
CC: "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
        "clemens@ladisch.de" <clemens@ladisch.de>,
        "tglx@kernel.org"
	<tglx@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-spdx@vger.kernel.org" <linux-spdx@vger.kernel.org>,
        "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2] ALSA: opl4: Add SPDX id lines to files in opl4 driver
Thread-Topic: [PATCH v2] ALSA: opl4: Add SPDX id lines to files in opl4 driver
Thread-Index: AQHcoGRfJrZ7PzPj3kSJ6+rH02a38rWHpoGAgAESLHA=
Date: Wed, 18 Feb 2026 17:48:04 +0000
Message-ID:
 <MW5PR13MB5632BEAEA246600D8FB90661FD6AA@MW5PR13MB5632.namprd13.prod.outlook.com>
References: <20260217232230.241142-1-tim.bird@sony.com>
 <CAC1cPGw=rRQufzodjtfA8YQt0+1u_AtcFw1PxM_Ldqkrj_SiBg@mail.gmail.com>
In-Reply-To:
 <CAC1cPGw=rRQufzodjtfA8YQt0+1u_AtcFw1PxM_Ldqkrj_SiBg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR13MB5632:EE_|SJ0PR13MB5270:EE_
x-ms-office365-filtering-correlation-id: 17c31022-cc12-4bf7-cd37-08de6f15de27
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?RTNSUHh3OXNteWZVQ2xpQ0tqYWlzaXdVRU1ZVncxRkwwRFN0VW9qOUxZMFJT?=
 =?utf-8?B?ZzBPOVlIbUEzVmFEa3h5VHFRaHRjb3pkUEV2Lzk0bTRZUm5GbTF3YjZhdThO?=
 =?utf-8?B?ODc3NzlyWk9udFpoYzhsa1ZjZlV6K2FpQktMYm8yNTVtT05Wb3FLSlZtMmJx?=
 =?utf-8?B?K2cxNGN5YlJ2NkZTc21WVnpHTGZFNEZlekRYQ0NCZVNBL0Y4VWpmWGMzRjV6?=
 =?utf-8?B?QmNKdUlPYTZPTU04L25YY1U0d2dhSnloMjQ4N1AzTUNkeFdqVkxFckZDWmpF?=
 =?utf-8?B?NnFoSm02WVdFelBKYjlGSXNiY0xFaHpYOGxZYTllTDFCQmNLTzJyWUlhaEFO?=
 =?utf-8?B?RnBqa21xUFczN2l6VUtNU1NmQ2FNeEsvcTJORDVFcGxhSzFObWxFeVdDdTJZ?=
 =?utf-8?B?MjFTNEEzcnZEZHBzcjl6c2kyd3BwMGdHWHhSZ2R1OEwxZmt6bHVkQkdFdFV3?=
 =?utf-8?B?d2prRFlUZ3NFZE1xeDNNOGhTNW54ckMyeGpwUVRXQjdyM1VMVThleUQ1d255?=
 =?utf-8?B?Q3lpMkdSSmtmTVA4MXJESzh6Sm9MRkhsRjNsUzNBWkNaNWdoRWRDd2RtWjVT?=
 =?utf-8?B?Tm5KNVJpcmVwamNOWW5KcWIxOGcvdFl0VWV0RTU1L0Y0bm0xaGs3YmNOM2FQ?=
 =?utf-8?B?ZjBDb2JUYXRtN0lQaUxodlpWdG5Mc0s3b3VjZlZNLy93U245NktMYXlJYXNi?=
 =?utf-8?B?VFhEVUFmcFBhcGNjaWp1V2tnU09uTytTckwwUHRvZ2x4ZFFLNmswUW4zbnVX?=
 =?utf-8?B?cWZuR0FNOUo3SllWNXdZRHFJbjJkTDVPbENaM2c3QlZkVUQxMWJVR1cwVGw1?=
 =?utf-8?B?ZmM3aWl0a1FWekcyaHRIQXBpak1FdXdLMVRrNFA0aGxBM2pDZHhTK0k0anNa?=
 =?utf-8?B?UjUwTjdyTEtIVHZKOFhFeUwvNktrYldjK1hReGt6V0ZiTzY3TkxTTWVBN1F1?=
 =?utf-8?B?REJZWXFnQjIzaEVJUVo0aTJsRC9rMmg4b01SaXE2UGM4ajlKdE5uSmFxTTZY?=
 =?utf-8?B?YUxrL2gyQWRCQlFoekt2dzFCWlo5czhBWS9sb0xXaEl3eGNTZlB2TlhINWIw?=
 =?utf-8?B?azlWVkxXSytMa2k4MFhKMnVvR2dxNmltWk0yNUZXWVNLenlodHJDRGVwRjhu?=
 =?utf-8?B?ek5QNWltTTZvMTEyL1lxYVBhZFN1eHk0alIzOEl2NkZHRnpicTdWdXl2b3l6?=
 =?utf-8?B?cnArczB0YXRsVk5hSXI3RHB6UzhudFZidWgrd25veUZRc1VrcytPTHdtNEVW?=
 =?utf-8?B?WFkrL1V4enBya0dIM0E5bGUrRk1iQzFwVWtJampOMXN4U1l6N0xXTkJobjBT?=
 =?utf-8?B?L3M1YVNkdU9lNUdIR1BzVktVY1cwQjZMeEV1MW5lN2RwVk1sSWV1cjQwSGwv?=
 =?utf-8?B?U1lXSjYrc2wzZU5GdHR4bHIvRURUbjdVOEp5a0FWbzNlSWdUcDlwNkFaNGha?=
 =?utf-8?B?aElsb0c5QVlHbWR1ekdhTDJLM1pRMm5SeXdIQ3dVZTU2Tnc0YmdEb012UUxX?=
 =?utf-8?B?TStSc29sS2NtN1V0UWtQQ1dFbFpZMUlmWDR4YjRsMTQyaDVUVVhRclc1NGJT?=
 =?utf-8?B?cnF5QU1ZYTdvMU56eERTQWxPYVpBekIwbk05QnZWMXZKTE5QVzFWTlcwSEVV?=
 =?utf-8?B?TUVsc242KzF4azJhZ0QrSmhXTkpGVTNBQzNyTGZoYjNjdDduZVFTYmRqU0lF?=
 =?utf-8?B?Ulk1aEVkL3oycmRLbGJKQjZnalFpakxacC91a3lGbDlnNWJVS0xlbDFrbCs2?=
 =?utf-8?B?VllKbUVCUFlDYm1xK2tLYXlnZG5meGFZL05xV09FQ3phQWtob2dzWFV1UVdG?=
 =?utf-8?B?em5PcEs1ajNLeEUrZk9vNkVJWXBBelpRYmF2TGs4OHlBLzVMdTdKRWIrQ3ZY?=
 =?utf-8?B?OEw4a2U5NGJZS0k2aVJxQ1ljSjFQU2I4cWUxcEVRWStWcEJCV0o4Nmk2c21H?=
 =?utf-8?B?azNzd3pROEtOc2JZZy9qS3h6VGpWWTAzdkc2K01nQjJKeXZCOWVVOGRjT0hC?=
 =?utf-8?B?blVxWk16SVFpVFdKU2l1LzJ6THRtaGpLVFlwL3pXUnBGVVk0aldOZHQ0VUVX?=
 =?utf-8?B?TnR5TE9CTVRrdWlNUnluZk9lNkhXaGswa1FHd2wrQkVWRy96NXU5ckNOMTB4?=
 =?utf-8?B?UUx5UlVVbnVURklGVlhLWkxoc1M0by9ERTJIZkoyYWFkclVNb1pVVkJranB5?=
 =?utf-8?Q?yIuOi2zpaltYxxaonpPoxGU=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR13MB5632.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WDZjQTUwdDI5NktlUk4wbUpLS2ppWjhkTEZCT044d0x0Q3oyR1BPbmVJNTJm?=
 =?utf-8?B?TjY4RjhBelR5cmRXZzhwb0swN253cXVzTitkTEc1V3NpWm0rM2UxWUEyZjB1?=
 =?utf-8?B?SGtJZW1qaTFIeENVTVl0Y2dmTVNVVGpSNU5BeUlXVUxIeURZMFFjT0hib1BU?=
 =?utf-8?B?QVhRVm9iOU8xcWRIOHVqWUxHYUtUVnhCbWJFdEk4alhCTHVORXJvZVdLVWx0?=
 =?utf-8?B?N1FnV0tyeC85RS9IakZVZTQwWWJZa3I1SUtIQ05aREhQREprSE1yNFlBUmdP?=
 =?utf-8?B?R0FNZXIyNFN1RGJDUFh0aU9tdWdFUkFLMVlGWFlVRW9MdTFySlN6KzRZekJK?=
 =?utf-8?B?NEorNFhubnBsS3M5RXhvY01UWW93elhLTGh3NHYxUi93WFJFckM2TVVkNHVi?=
 =?utf-8?B?dUltRlhoOTZWeWoxdkM2MVg1a01OckxHNkp6UE9wUStYZzZkK2k4ck9vS0xX?=
 =?utf-8?B?OWVUQzdQVGt6anZKanRUMTVJUHNLbEgxTzI5YWZ3dkREbTJRT0xOOHFBYkIw?=
 =?utf-8?B?NXBkNnFucVNNZjlFRHZrT1NtOWIvT2FXbmlEVmtPbXF3c2VqdnBBZXFJb25T?=
 =?utf-8?B?RW0wbFZDYzJ5eUVSTGdXcWZjZkhMZHpML0ZVcS9iMGhNY2E0U1pkbFY3QTlL?=
 =?utf-8?B?WjlSMWg3M2w0MDBzYXdraEZBNVMyM1lkWjBKd2Y2NXNCT1h2aGF3TXpyZ05k?=
 =?utf-8?B?aDYzUzdRSkUwekpDMm5HSGxMRmdLNEtkVUtXWndTdjdId3FaU0JERGRpUi9I?=
 =?utf-8?B?aE1DRVo1b2dYdmcwUURHZ29GYWMwYkFqWjFIZ3dFMWVEeVMxdVBOaHNNSzM5?=
 =?utf-8?B?YlBDVUc5b2pOTDhNdC8xN0dCa2VIbUVBc1d5ZE05cXNMaFRIMERDWXNsUC8r?=
 =?utf-8?B?emVrRDQwQ2prbGFlSGZMWU5DNUxQdjA2WEd0czZVMVFzUmJjaHFLaWZRb1Zt?=
 =?utf-8?B?VURPQ29lYW5jZGNpamVzMlhnVDhuK2N1V05vWjhzSFptODhQMmx3OGZWdW1Z?=
 =?utf-8?B?RWhvOVBwS0FYanZLYlIwYmNVQUNRei85aHlMOFlaTzFVSXgzbjZzak9ZNmZK?=
 =?utf-8?B?Q0kxQllxT01tNkErTld0V21zVldhaFVKakFPaThSS0h6WWFzYW5LaXhFY3Rk?=
 =?utf-8?B?Tk5TWkxwUWVtdmpDM2ZkUmxqaEZSS3h6akJobFJlYWg0cUtqM3FkS2tzM3NS?=
 =?utf-8?B?Y1B2Ni9wcGVsS25CTTdDUTRTVE9idHA4N3M5enpIcHFlVVdnY2ZxclN3TmVT?=
 =?utf-8?B?V0RnemtTNlA4TU9iQkZ0MG1ESWRrOS9xSUx1VGlXUzhtZ2JJeUJLa1Vpems3?=
 =?utf-8?B?cUNrNy94VHgrMkU5Mmw4bWxhcURoQ200TzlxSmg4NHdsSHNzRjVyNklBRVpF?=
 =?utf-8?B?azhUa0pkVll3T212ZE4vSFhNUVYxR3NxUjFLeWp1b3BWMWwwZkZXT24yOGtE?=
 =?utf-8?B?WWorU2dWSzZZbGdGOG9HQm5NdDZpMXRtMVd4c1lnK1VSVEh2MXNCNEgveVdV?=
 =?utf-8?B?T0N6akgyTWZZZU1QS2I4cS9YYVdVSk1Cc3BUdGNBN1QzQ1N3M1FtdVE5dXlS?=
 =?utf-8?B?RmpCU3B0eHR3VU1OZmZQM2dDWDJPdytFUVMrQUdDVFlQdWk4YXBnaEpqbmNE?=
 =?utf-8?B?YmQ3N0paalN1VU9PM1U3Z2I3aFFIRS9hTStJMHFiSWhqL0RiRk4yZ3pVbXJr?=
 =?utf-8?B?bE9MNmhsTFUyUytJQ1BoQnhJOE9sNmVYaWdBdko3K0QrZE5HZ0ZkTDhaOUsw?=
 =?utf-8?B?WWNpclNWcExrcC9RcnRxUTdxR1JMN245VHJzYlNrVUpsWXJrMk5nQWxDV0Rs?=
 =?utf-8?B?d3puaFBGTWx4TFJBZXAyK0pBQVVLUjBVNU9uVHdPNUVRMUlkcWIzdCtJcXhO?=
 =?utf-8?B?L0Q0V1dhaEpEK1lNWEtCV09uTkdiUGoreVpqbWtHcXNIYkw4ejdMWjd4NTYw?=
 =?utf-8?B?RWVzWWltblJ2N0RPUWZxblJsWkF3NXZQUUE1NHM3THFJcktOUUVXSjdsVFIr?=
 =?utf-8?B?TEs4Vm1INmpKQXRKNUtEbFlzVmxDZzloQzFVdUI0WUhtdVZNZ3BlblAzamhy?=
 =?utf-8?B?bFFBcm03SDNwU3JZc3pWUjYyQi95cmN6d0NENXN3VlhneTJYY0RqOHFzSjJr?=
 =?utf-8?B?Q0xyV1k5MlNKZXVMV3dRS0wya3VmdHZUOHpiREhrUDVnSThKVkN5SHRjajBa?=
 =?utf-8?B?RUxWUVJBSzFnb3hvS0VIeTMwcFZRV3N0YmVaRVd2aEsyV2RqZ1EwRU9HdnF0?=
 =?utf-8?B?YjBPODF0WldnaHFxVGtmdkhQN0pQTG9TV05qMUp2bXk2a1p3NUFVSHJiVzZW?=
 =?utf-8?Q?nzngC2PAkxRhmhLkhd?=
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	v/9yVyq2T92l/jrK384C5vZGlaa0UuBDWuu34Jv78tOmua6hzdqmVlYfRQOf8NncSKrwLqVoC+t2N2O3/AZWUtPesWPE8cr6bOasSfRoU+3GeAbInl4DdowuNUGe/ZDhAtdx8YvRgbwZ/4xWBrVV6W+J/JuCPFQ6geypiMRsRR3NCxW5uI2HsqLPcCia+OBfNTf0bdAp5tb3ELBdTt9T1z0ETQXY8N9mYJhalr82AkYcq2U9TLYP093gwf3WwF847E/EX/aSIlaM3jXWfjdvNS1V3Va6chQ43Gbk9fSjBtQnKdoJS3hS1aNR770WwLF8qGK4MpsX4pUTpPG5KjPGbS4d84dmEkH94vxkBoxB4DjygvL8CA83ymk8wklmWI6K4lbf0VF2ta6Mid0ON9CgasUMQmX+TavEsV4IOqLLOzhephHSmDIXSMx96UDLGRw7kDBax7gtjStfkEVpSJD2ouZvzll3Y6NCGS+8jBYBMa7wXzklJU545b6Mnd39Eh5KSo/KVCN0bq/4pitBlrOyQ9BN96kUlnneg/2upcFWbykJkXYkPkV8T6FRPE5Pl8akJ7/WtUPliD7Z17GIRStie9Ew4JUwjxkS3+ahjuDA34l4mUAtqPATZpLIxJBFIAEL
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR13MB5632.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17c31022-cc12-4bf7-cd37-08de6f15de27
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2026 17:48:04.4931
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ltgLBSntducXFQDFhfkje9BIVzt95Wx5cWxB9b1pWWwYrngWsKOtkZ8o4KSPeg6hpCEw1ci/BjkcLOIOc0A+Tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR13MB5270
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=YJaSCBGx c=1 sm=1 tr=0 ts=6995fb5d cx=c_pps
 a=2EogD3SZGC0twO92opjmhQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=xR56lInIT_wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=24AZYWMyAAAA:8
 a=OfH5PFulAAAA:20 a=20KFwNOVAAAA:8 a=z6gsHLkEAAAA:8 a=iox4zFpeAAAA:8
 a=VwQbUJbxAAAA:8 a=ag1SF4gXAAAA:8 a=kCkhx62WD4vayAXbCegA:9 a=QEXdDO2ut3YA:10
 a=bG88sKzkDEFeXWNnvthB:22 a=WzC6qhA0u3u7Ye7llzcV:22 a=Yupwre4RP9_Eg_Bd0iYG:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDE1MiBTYWx0ZWRfX4R3zhoD+1+02
 yACRap841Mfb1y23mENZsTfW4p6WzMgSYpwhvsKjZ4PU+quZlSryiTK/YAh0mZVDnd5WP8D8Wz4
 fcCga81y/J5YrgdPq69d/4twSnXKbMlFhj3R1fV53Hg0FbqTm3teMq23tJXXY5rc9FD+YCcVGwe
 oHfa8G5I9vhHVvaCO7f3eWJqCYlZpVBNbM2yX7HwRCMNyV5iqBXxRzvH4SXfbjyGkAtoKOmrDOc
 Tjli61SBYyQkRlh6tdLUdYvBzCol9TaEernCyCFW44ou5xpbICGMk5gCVcyJrdzeefyHDTkdiTP
 GL64a4aqT+W44pfVfkh0HVn6v4LnDsvV4iyg4UqnSQZzy/IxEfgcBj224SuVwjNz7bQ8np1rMCS
 r0iS1zZzrMvc3SWFJoZa6vT25nEZ7XXBQlnS+YFOlrQ3P0Amzbg4VVeZckQCD4axpHHYTSIQYE8
 /dL0ou4bUb0t03eG+Pw==
X-Proofpoint-GUID: 6L5O5BIzhlTnJVluj20rhA-rdwQHqIZs
X-Proofpoint-ORIG-GUID: 6L5O5BIzhlTnJVluj20rhA-rdwQHqIZs
X-Sony-Outbound-GUID: 6L5O5BIzhlTnJVluj20rhA-rdwQHqIZs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-18_03,2026-02-18_01,2025-10-01_01



> -----Original Message-----
> From: Richard Fontana <rfontana@redhat.com>
> Sent: Tuesday, February 17, 2026 6:12 PM
> To: Bird, Tim <Tim.Bird@sony.com>
> Cc: perex@perex.cz; tiwai@suse.com; clemens@ladisch.de; tglx@kernel.org; =
gregkh@linuxfoundation.org; linux-spdx@vger.kernel.org;
> linux-sound@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH v2] ALSA: opl4: Add SPDX id lines to files in opl4 dr=
iver
>=20
> On Tue, Feb 17, 2026 at 6:=E2=80=8A23 PM Tim Bird <tim.=E2=80=8Abird@=E2=
=80=8Asony.=E2=80=8Acom> wrote: > > Add a license file for the BSD-Source-C=
ode license variant. > Add
> "SPDX-License-Identifier GPL-2.=E2=80=8A0-or-later OR BSD-Source-Code" > =
to files using this license
>=20
> On Tue, Feb 17, 2026 at 6:23=E2=80=AFPM Tim Bird <tim.bird@sony.com> wrot=
e:
> >
> > Add a license file for the BSD-Source-Code license variant.
> > Add "SPDX-License-Identifier GPL-2.0-or-later OR BSD-Source-Code"
> > to files using this license and the 'Alternatively...' language.
> > Remove the boilerplate text from the files.
>=20
> [. . .]
> > +License-Text:
> > +
> > +Copyright (c) <year> <owner> . All rights reserved.
> > +
> > +Redistribution and use in source and binary forms, with or without
> > +modification, are permitted provided that the following conditions are=
 met:
> > +
> > + - Redistributions of source code must retain the above copyright noti=
ce,
> > +   this list of conditions and the following disclaimer,
> > +   without modification.
> > +
> > + - The name of the author may not be used to endorse or promote produc=
ts
> > +   derived from this software without specific prior written permissio=
n.
> > +
> > +THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS "AS IS" AND
> > +ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
> > +IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PUR=
POSE
> > +ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE=
 FOR
> > +ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
> > +DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
> > +OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
> > +HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, ST=
RICT
> > +LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY =
WAY
> > +OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
> > +SUCH DAMAGE.
>=20
> This isn't (at least not currently) `BSD-Source-Code`. See:
> https://spdx.org/licenses/BSD-Source-Code.html
> and https://github.com/spdx/license-list-XML/blob/main/src/BSD-Source-Cod=
e.xml

Yeah.  I used the wording from the files in the Linux kernel.  There are ab=
out 3 variations of
the wording for this license that I have found so far.  I included the URL =
for the SPDX version
in the kernel's license file in this patch.

Here is the wording from the SPDX site:
-----
Redistribution and use of this software in source and binary forms, with or=
 without modification, are permitted provided that the following conditions=
 are met:

* Redistributions of source code must retain the above copyright notice, th=
is list of conditions and the following disclaimer.
* Neither the name of Deusty nor the names of its contributors may be used =
to endorse or promote products derived from this software without specific =
prior written permission of Deusty, LLC.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"=
 AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE =
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE =
ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE L=
IABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUE=
NTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOO=
DS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HO=
WEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LI=
ABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT=
 OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DA=
MAGE.
-----

While there *are* textual differences, I believe the two versions of the te=
xt are semantically equivalent.

The one in the patch was submitted by Clemens Ladisch in the original opl4 =
driver submission.  I haven't
done an exact count yet, but I believe this variant of the wording is used =
in more places than other
variants in the kernel.  My preference is to use the wording variant that w=
as most commonly used
by kernel contributors, so that the kernel's LICENSE file matches the most =
places where the license
text was replaced with an SPDX-License-Identifier line.

I've been trying to avoid having to make a kernel LICENSE file for every mi=
nor variant of otherwise
semantically the same license text.  I believe dealing with this plethora o=
f license variants is one reason the
SPDX work stalled out previously.

Let me know if you think the text in the kernel's License file  (for a give=
n license) must be an exact match
for the spdx web site text for the license.  A separate question is whether=
 it's appropriate to use the same
SPDX ID for variations on the same license text.  I believe it is, in this =
case, but I'm open to hearing
other opinions.
 -- Tim

