Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023116.outbound.protection.outlook.com [52.101.127.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87AD82AEE4;
	Fri, 28 Nov 2025 12:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764332153; cv=fail; b=lPhqsAuu3HcwM+EkCUUfGeW3YLzCDp44f3O+6KOs4tnhI1zW0HW7CLRdfZL7D87pKseCKUSD2Dv27ZcLLC6zbj+49YWgx9iNr5qofnOPpFcW2WsqGszribw2WOK2qw5lvs+yGH4jGr2ogROqO587m82hU1nQlt4KrjalV2CjtXc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764332153; c=relaxed/simple;
	bh=0g0g7N7xXD8EjBzgwebFct/CYTl3nnZ1h7haHeeKcjE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fgzXl5jQq1MKTthBsnpYsdLBg3l1NlDJiECXkhuP85QBrngvHDkIo2DSJvUAl28iX93gZbADvocfvDHPFacGuVzvBbCMWI0fUmpFx2mnJElvyvNOEBq4lgINZUK8vzZ64EFQyC3f+O9hoA2Eo8aqxiHCRjAPRS2Xw0fSPI7fChI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.127.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RNoxq60veDVIFnrHT1iFDHDUwms1+woXzxJ+BghXevx9Y4zWMQ+O2JPUshYtiITeQPaySIYEV0WB4taR8x4HuLww8Wa0BkMDnWwoZ9peje3DvAGoVvzE0hOuivTb/A6mv520oz8aIuFEjTeTzQLy8zvR1MqExyHxMwntFFfj9Cxb1piPZGFCqz6Dd1AMQWsROdGX+YbFx3yWDc0bdAGfpAxsXhIaxhUj8Cjv1a+LmPlSE2sIAvuGamR1DrKq00+psldFnqQQrOZkwz5mU+q0wC73ZkRJ3jPP2J2ZQidyWDYOFwVmzeB3r1b+NXc3yXggbwU0a9a2Dc28hPseANnmTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0g0g7N7xXD8EjBzgwebFct/CYTl3nnZ1h7haHeeKcjE=;
 b=UTqWS05+Stoqn0BKupnxtD/E/tHdHn4nclYzjucsy8QiRPlfdxpNxybhNo39ffmXXGVxUO71spaTfXNAaf3QNOd3VowYkFexfWWAxpfWAZrcW05V3HNYTN+rU1DyCQl7fuHKMVsbvOrI62KQq0OHb5X8dpRwIakkpU58WaGKzh/37tzB9pPhmifAKHorsWzdYmSWe4c6O7x013Id/4MyZx74I/d7YoCoIXbI1/hZrEt+LtEH2oOKgyxkABxTBoj5acyHcBrACR5mnffZkJQsfJbV6Il1zn5rtXpJ83RnRi3FbQjMAi8SHuMgubRFffgOTtGg9mM4jnrdKzsOt8dzdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from SEYPR06MB6226.apcprd06.prod.outlook.com (2603:1096:101:df::13)
 by TYZPR06MB5907.apcprd06.prod.outlook.com (2603:1096:400:339::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Fri, 28 Nov
 2025 12:15:45 +0000
Received: from SEYPR06MB6226.apcprd06.prod.outlook.com
 ([fe80::56e8:777c:d80e:d364]) by SEYPR06MB6226.apcprd06.prod.outlook.com
 ([fe80::56e8:777c:d80e:d364%5]) with mapi id 15.20.9366.009; Fri, 28 Nov 2025
 12:15:44 +0000
From: "Joakim  Zhang" <joakim.zhang@cixtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "broonie@kernel.org"
	<broonie@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com"
	<tiwai@suse.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, cix-kernel-upstream
	<cix-kernel-upstream@cixtech.com>
Subject: RE: [PATCH v2 1/4] ASoC: dt-bindings: add CIX IPBLOQ HDA controller
 support
Thread-Topic: [PATCH v2 1/4] ASoC: dt-bindings: add CIX IPBLOQ HDA controller
 support
Thread-Index: AQHcX4I/rWYXEfmiWkK1OjlzuYyFLbUH03+AgAACkFCAAA6QgIAAGa+Q
Date: Fri, 28 Nov 2025 12:15:44 +0000
Message-ID:
 <SEYPR06MB62266F00FF610A9506807A3282DCA@SEYPR06MB6226.apcprd06.prod.outlook.com>
References: <20251127094301.4107982-1-joakim.zhang@cixtech.com>
 <20251127094301.4107982-2-joakim.zhang@cixtech.com>
 <20251128-fearless-kittiwake-from-arcadia-662dbc@kuoka>
 <SEYPR06MB6226157DB7A5D5486500063A82DCA@SEYPR06MB6226.apcprd06.prod.outlook.com>
 <f9ce51ce-6fe9-4612-9be3-552736ea19a7@kernel.org>
In-Reply-To: <f9ce51ce-6fe9-4612-9be3-552736ea19a7@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB6226:EE_|TYZPR06MB5907:EE_
x-ms-office365-filtering-correlation-id: 30f5d27b-6b29-42d1-0205-08de2e77db3d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|10070799003|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?YnJYUE5nVGp1UUlZQ2EwZWJlNElZakIrU2sxbFVldkk4NWFMUFdtYWcva2tp?=
 =?utf-8?B?Y2Mwc0NqMkszU053TlMwVmtmbFl5RGNibkp6SVhFZ0xVZnRZek9zVkJYOXFv?=
 =?utf-8?B?Q1VaSUduMTYyVEZGOFR6MnVSNHF2eGZTREg4TEhzU3RXaTc5R3ZWVHlhZ0xZ?=
 =?utf-8?B?VURjWE5ob3k0Z2UyUGV0ZW1ram12Zk1iRThxWktlNVdKTldaVVQ4RmF3NXBv?=
 =?utf-8?B?MmQzckZUTGQrUnVtWUN2bmtYSEYzN1R6OTV2MDdCSG1NTkdQTWM0THJtZHVw?=
 =?utf-8?B?SHZRcHFPS1ZRTnBZZWhOcXJTenQ5QVpQMWJ5TTBIcDRaU3FXd3VET1c1Qlpt?=
 =?utf-8?B?WDdXOHRnSnpYRXdpWnQrYVp6ZXZ4RW9ER0Y2RnU3UGJ3cmRIWitoTWt0TGs1?=
 =?utf-8?B?MGxOVDJaZ29ESmFWUHQ1bkJQb2RpbUNMbVhJNU1IQUplN0JUbC9tVHFQSHNZ?=
 =?utf-8?B?ZWRqZGQ4UGRnU0kyRkh1S1lrYThkK1Q4U0tIUzVXOU9lek1BRmViT0lKN3RZ?=
 =?utf-8?B?REttWVd2ZnBPOTM3WEhTeEE2bmR1MGtEekpuY0lEdEtIRkt0ekdGYW9WL3ph?=
 =?utf-8?B?ZGVFZThteUZoU3dMdkM1b09vK3lwWGNwbmlwK25CMmt3R1lsUlcvZHJkUGQ0?=
 =?utf-8?B?eXJOL0lGbmNmYVB6ajZSSXBPQ01ST1o0bWU1Wmszbk9CUGRRSmFkYXovQVli?=
 =?utf-8?B?dkhRV3EvNTlKdG9sZ0Z5NmV0L1NvVzBEa3l3ZmZSbi9yTXEzeFZmR1hlVzNm?=
 =?utf-8?B?UTZHSERsNXVwSVNaSXM2eWhNNWo3L1RpTGhFTGFsV3hsZVQ4RVJhQzlSYWIw?=
 =?utf-8?B?RENDRGYxcHdoaTZLMitYYk4xaWt5YW5NR0hwOE1FdlU1bjB0akJSVlpoVm8z?=
 =?utf-8?B?RnhVcGp4UG9LWlA5R0x5bDJBWXpDQzF0ZmR2cUlwd2ltT0ZmdG01YU12U29Y?=
 =?utf-8?B?UTQ5UFZrT005Y0NPQXJJV1ZSeFF3RmFvNi9BY0lNeDc4NG9FMUpJTTNZa3pv?=
 =?utf-8?B?UUR6NkJlNEVJa0EvL25xNWFGS1VEK2lVOVVmUS9mSnZRUUtmOW9ZL3lMUlFR?=
 =?utf-8?B?UmpXTnJyalBLRXc4b1BmeU4waENYS1pKVHZPM1JaaWMxUjE0M0N1LzJUUkRu?=
 =?utf-8?B?QUhJS1VjditqZW9HQ0pjcUN2RENoa2daZHl2aVRERDBMcysvUkQwWVp4TTFC?=
 =?utf-8?B?bWI2aDE2d3krTFp1ZERxckhxWEtFeEFCSUltbHNvTU5NVHloUFRDblRnQ1pW?=
 =?utf-8?B?VFZMdkREY09ia1g0RCtCeHdoMXVXamw0aFd2Z1ViM2xWaXpHempObUNZNlUw?=
 =?utf-8?B?WXc0YXFKSzlUendIbEdpa25aMFVQdnJheS9RWTdDb3pnZHYrai9WSS9hMVIv?=
 =?utf-8?B?T2lGZTBmenNQTjh3clk2RjlkcjIzaWttckl4ODZ0ODFMZXcyTEgvWTBFd0w3?=
 =?utf-8?B?NVdqbU5zU0NVM2thUlcyMEpHaUVnR3hTbFMrZEprd2FOZkZGVlZLZFVqRzZa?=
 =?utf-8?B?ZzdFTU42ZkMzemxNVDM3TDJYak04bnAzVENRaUVMbW50NlhEK21hN0xUVTFh?=
 =?utf-8?B?SVZUbzIrT2h0NjN0Q3NLV1MzZG1SUmJYem1RTE10dWxGV2R2RFNWMGxWRHJk?=
 =?utf-8?B?WFYrV1Z6Q0txSW9YWWM0dHpaR1hNd2ZLVXVYTEttaGRpRHEvanNHay8vcWVx?=
 =?utf-8?B?Sm1oSkt3bUZjeStKVkdUa01VSGZxeFJKbVdobEVYYlJ3U21EazdPdUZ6VzA2?=
 =?utf-8?B?Q0FMM3g2VXlTNnJGbm5VanNMeVQ2K2ZjQ1JJNTUrdDVybkdsSkFLeHZJM2F1?=
 =?utf-8?B?T2tPOG5pKzJvWktCV2M2aHM0cDE2MVRMYUdhZytNMHRDNk02QUp5NkFmcXJ0?=
 =?utf-8?B?RE9ta1VmczBkemNsZDYwczJJVlpUMXAvMzltdHFIQ2VMNFNscmtXdlZNVlRJ?=
 =?utf-8?B?Nm5JRnlJL1hwdHJJUFdXUU1WQlUwYkpLeFZRUDYrTGh4SFZtQTgyNlRSaGtr?=
 =?utf-8?B?U0xYNE1Gc21nPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB6226.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VGQvdUhtM1pBbjJPMGpRM2ZEZC9KcFJPQ2JoaUh3V3BlakRqWWlkN2lZYTBq?=
 =?utf-8?B?WmpPNjhibTErL0tNSXRwNStwZkgwZXQrL1NHMnQ5YzNOL0V2TVNvQjNWb0Ev?=
 =?utf-8?B?bTRqYTlwR2tuTG1pa2lzM00rR01mZ05DUUR4cmxIb2FWN1pmUENPd25iY1dF?=
 =?utf-8?B?azJsb0l4QUpJRkJWQy82c1dHbjRXTlNMdDF0elZmSS8vd3lZNEU1NGlJdjFJ?=
 =?utf-8?B?aWZpcUh0MW9LSEVuRTBaNUJhZW5Uek82T2hpN2x3NkR2SFdHVXVvNE83bTR5?=
 =?utf-8?B?VGx0emh5bklnMlpPTjkxZFFFbkdEaFlzY3pmY2tpVCtrT0lFVXBLV29YQ0Nn?=
 =?utf-8?B?c3JFbnc1NklvQmFGVFQrdHZCN2hUNVJVK3Z1aHhSUUhpOTVGVDZ6Yi9aVCs2?=
 =?utf-8?B?VWN6ekdWMEdoVmhRRkR3NXNVNGxzZzhralExWFBJMXByRTc4cGpHM216bnV6?=
 =?utf-8?B?Z01qUFBjNmlLRlZ3SkNwSXpUY1RHQnpCQzZCNGVkbWpoUGhCQzlzZWcwdGpW?=
 =?utf-8?B?ODkyU3BPZERtQ0Z6dlpuMHBZblVNVDg0VG1xMFQxTTNPTXcwNTNxcTJrcXdC?=
 =?utf-8?B?VXd0N0x1SlVWMHJMZERueUFJZkIrRDZKTWZyUlV2cHdxN3RjbGV1VU4yZmdC?=
 =?utf-8?B?MHYxNHRXVlhqSnJoeGQ2OHdYTkJyaDYvUXpRZHc4Ui9KemRvYXNlUW5NYmZ1?=
 =?utf-8?B?MlJPY25RQzVXMHZqaHNoRTBuVXlQZ0lpQXNIYTVzQ0hRUm5KblI5akxsVXdT?=
 =?utf-8?B?bUM2Q1dyWjFIOWtQVzUwTDJzcEJhYWh2eWhrWk81anZlSllGRkdaVm5GZXI4?=
 =?utf-8?B?MURYbFNJb3YyY1gvSEtQa2hLZjl2SXdPbWJhRlZQOCtPWThjaTNrOUE5dGFV?=
 =?utf-8?B?MmRJZUQ5UXpKU3poV2k0YVVFY2k2dVVvaE1ZUWNXYVFTdXJtNXhUTzNOcEtp?=
 =?utf-8?B?R3J5a3Q3dGFtSzNhclFaczBxRDRLZHNQdmdlOURlQmtkTWZiOWgwN0NMOHRa?=
 =?utf-8?B?OVhtV2JiVTdlYlBOMHFGYWdieWI1UHNtanh0bHVJQ0o5Zk95WkZ2QjlTbDc1?=
 =?utf-8?B?SkpLMGpQL2V6K0JCL1UrMHhIdGFrdC82U0htaURDOGg1RGkxdEhOTjJKMFFI?=
 =?utf-8?B?Mm1xZlAzY3hXK1F2VjBYOG5uSFQveGR0ZDJvUElCeGsrZmpGTHFBVytzMi9I?=
 =?utf-8?B?ajF4ajJYRHhJV1B6KzdpdGhjWWNEMVI0dGoyWGdQRXFkVkdtUHJ0d1pUVTlC?=
 =?utf-8?B?dmllTGxtQ1E5WnVKSlRZNVB5WWdnK3A4YkpxdGJhUkJqWWVxdnpPZ2xtRDRM?=
 =?utf-8?B?VDdGNkJkR2hhY0lmbjVyV2VkYit3REhyR3N4YUpDZG15dU55YWs3cVVOc2Q3?=
 =?utf-8?B?dEFNNlgyNG54S0MvbGgzendobjNPYnkzdzl2V3MyRml6WmVGVEFTQzdlQzBU?=
 =?utf-8?B?TFNvWVR2QUlKeUsyOEcvc0EvbFozYkkxdTJKVnhnSDlvRWpWbnAvTHBiZjNW?=
 =?utf-8?B?c2JCUkVRUEhwbThCSkpXZkNUanpxRWNJdDllQWh6b2prRFZ2SGZUU1ZKakgr?=
 =?utf-8?B?RjlOUTMyemNWN0dUWlJVRTgyNlFBcFVCZVZUcmorUm44Z2VmLzY1a0t0STNa?=
 =?utf-8?B?a0pHenYrbHVZUkxGUG1EZks4akFMcDV5cHd5R3dncDBRZEVGR1RENFcyUHht?=
 =?utf-8?B?aW5JZXNmZ24rdkRuL2dWU0hGaWduVy9QZkZrQTREOU9BQXpkRlJZaXJQejd2?=
 =?utf-8?B?dmhLeEc4U0NsellsSk1EZnQ3WHh1dWFGV1pvb0Vabk5BZjBFS00ycHBiTVIx?=
 =?utf-8?B?YURYK0JKeEZ2SjhNNmNpWmtTVkNUbFNaOFdoN1lmbyt0bkQ4VTA4NVFNN0dO?=
 =?utf-8?B?cVZCektaYVA3dTVubFY2ZklMb2poemIyQjczREFtazc3c1A3UklMcW4zM2xu?=
 =?utf-8?B?Y21SR3B1WEM0RGFIeXhOams4OWZLTnRVRXlFOFR0eUE0NEFocXJTN3FuWVEv?=
 =?utf-8?B?cGMwZFE1SUR1V3RYZyszS3V0NGE0ZnBZNFlERFpQdFNWNlh2SWl1ZlRTQWNU?=
 =?utf-8?B?NFVPMkxkcFZyVExtdjMzN3FPbDRvTjBrNGwzK29yay96Y2VBdG1TZERiUUFs?=
 =?utf-8?B?Y2FZVlc2cGZUaEdRM0RFbno4a1dIaUc4UFRKd3dSb0lyWVFkcExDZmZhTDk0?=
 =?utf-8?Q?dguUVPFimMX8WNNuoLLkVjvg4FBUfD4TJfDfw59se9Fb?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR06MB6226.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30f5d27b-6b29-42d1-0205-08de2e77db3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2025 12:15:44.7333
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KpT8w/DlyET7curMP8VBQcw7l4NWY8ASZcEGmhybtdga3GBjHqqznZBv0q+iBFdzRm2JqiA24ymLOeS8+20JZ3AoP/NaqM8dVXVyeRWalNM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5907

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS3J6eXN6dG9mIEtvemxv
d3NraSA8a3J6a0BrZXJuZWwub3JnPg0KPiBTZW50OiBGcmlkYXksIE5vdmVtYmVyIDI4LCAyMDI1
IDY6MjkgUE0NCj4gVG86IEpvYWtpbSBaaGFuZyA8am9ha2ltLnpoYW5nQGNpeHRlY2guY29tPg0K
PiBDYzogbGdpcmR3b29kQGdtYWlsLmNvbTsgYnJvb25pZUBrZXJuZWwub3JnOyByb2JoQGtlcm5l
bC5vcmc7DQo+IGtyemsrZHRAa2VybmVsLm9yZzsgY29ub3IrZHRAa2VybmVsLm9yZzsgcGVyZXhA
cGVyZXguY3o7DQo+IHRpd2FpQHN1c2UuY29tOyBsaW51eC1zb3VuZEB2Z2VyLmtlcm5lbC5vcmc7
IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOw0KPiBjaXgta2VybmVsLXVwc3RyZWFtIDxjaXgt
a2VybmVsLXVwc3RyZWFtQGNpeHRlY2guY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDEv
NF0gQVNvQzogZHQtYmluZGluZ3M6IGFkZCBDSVggSVBCTE9RIEhEQSBjb250cm9sbGVyDQo+IHN1
cHBvcnQNCj4gDQo+IEVYVEVSTkFMIEVNQUlMDQo+IA0KPiBPbiAyOC8xMS8yMDI1IDEwOjU0LCBK
b2FraW0gWmhhbmcgd3JvdGU6DQo+ID4NCj4gPiBIZWxsbyBLcnp5c3p0b2YsDQo+ID4NCj4gPiBU
aGFua3MgZm9yIHlvdXIgcmV2aWV3Lg0KPiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tDQo+ID4+IEZyb206IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4NCj4g
Pj4gU2VudDogRnJpZGF5LCBOb3ZlbWJlciAyOCwgMjAyNSA1OjI4IFBNDQo+ID4+IFRvOiBKb2Fr
aW0gWmhhbmcgPGpvYWtpbS56aGFuZ0BjaXh0ZWNoLmNvbT4NCj4gPj4gQ2M6IGxnaXJkd29vZEBn
bWFpbC5jb207IGJyb29uaWVAa2VybmVsLm9yZzsgcm9iaEBrZXJuZWwub3JnOw0KPiA+PiBrcnpr
K2R0QGtlcm5lbC5vcmc7IGNvbm9yK2R0QGtlcm5lbC5vcmc7IHBlcmV4QHBlcmV4LmN6Ow0KPiA+
PiB0aXdhaUBzdXNlLmNvbTsgbGludXgtc291bmRAdmdlci5rZXJuZWwub3JnOw0KPiA+PiBkZXZp
Y2V0cmVlQHZnZXIua2VybmVsLm9yZzsgY2l4LWtlcm5lbC11cHN0cmVhbQ0KPiA+PiA8Y2l4LWtl
cm5lbC11cHN0cmVhbUBjaXh0ZWNoLmNvbT4NCj4gPj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAx
LzRdIEFTb0M6IGR0LWJpbmRpbmdzOiBhZGQgQ0lYIElQQkxPUSBIREENCj4gPj4gY29udHJvbGxl
ciBzdXBwb3J0DQo+ID4+DQo+ID4+IEVYVEVSTkFMIEVNQUlMDQo+ID4+DQo+ID4+IE9uIFRodSwg
Tm92IDI3LCAyMDI1IGF0IDA1OjQyOjU4UE0gKzA4MDAsIGpvYWtpbS56aGFuZ0BjaXh0ZWNoLmNv
bQ0KPiA+PiB3cm90ZToNCj4gPj4+IEZyb206IEpvYWtpbSBaaGFuZyA8am9ha2ltLnpoYW5nQGNp
eHRlY2guY29tPg0KPiA+Pj4NCj4gPj4+ICAtIGFkZCBDSVggSVBCTE9RIEhEQSBjb250cm9sbGVy
IHN1cHBvcnQNCj4gPj4NCj4gPj4gUGxlYXNlIHdyaXRlIGZ1bGwgc2VudGVuY2VzLiBMb29vayBo
b3cgb3RoZXIgY29tbWl0cyB3ZXJlIGNyZWF0ZWQsIGl0DQo+ID4+IGlzIG5vdCB0aGUgZmlyc3Qg
Y2l4IGNvbW1pdCwgcmlnaHQ/DQo+ID4NCj4gPiBZZXMsIG5vdCB0aGUgZmlyc3QgY2l4IGNvbW1p
dCwgSSB3aWxsIGhhdmUgYSBsb29rLg0KPiA+DQo+ID4+DQo+ID4+Pg0KPiA+Pj4gU2lnbmVkLW9m
Zi1ieTogSm9ha2ltIFpoYW5nIDxqb2FraW0uemhhbmdAY2l4dGVjaC5jb20+DQo+ID4+PiAtLS0N
Cj4gPj4+ICAuLi4vYmluZGluZ3Mvc291bmQvY2l4LGlwYmxvcS1oZGEueWFtbCAgICAgICAgfCA3
MSArKysrKysrKysrKysrKysrKysrDQo+ID4+PiAgMSBmaWxlIGNoYW5nZWQsIDcxIGluc2VydGlv
bnMoKykNCj4gPj4+ICBjcmVhdGUgbW9kZSAxMDA2NDQNCj4gPj4+IERvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9jaXgsaXBibG9xLWhkYS55YW1sDQo+ID4+Pg0KPiA+Pj4g
ZGlmZiAtLWdpdA0KPiA+Pj4gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291
bmQvY2l4LGlwYmxvcS1oZGEueWFtbA0KPiA+Pj4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3Mvc291bmQvY2l4LGlwYmxvcS1oZGEueWFtbA0KPiA+Pj4gbmV3IGZpbGUgbW9kZSAx
MDA2NDQNCj4gPj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uYzllNDAxNWE4MTc0DQo+ID4+PiAtLS0g
L2Rldi9udWxsDQo+ID4+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
c291bmQvY2l4LGlwYmxvcS1oZGEueWFtbA0KPiA+Pj4gQEAgLTAsMCArMSw3MSBAQA0KPiA+Pj4g
KyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNl
KSAlWUFNTCAxLjINCj4gPj4+ICstLS0NCj4gPj4+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9y
Zy9zY2hlbWFzL3NvdW5kL2NpeCxpcGJsb3EtaGRhLnlhbWwjDQo+ID4+PiArJHNjaGVtYTogaHR0
cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjDQo+ID4+PiArDQo+ID4+
PiArdGl0bGU6IENJWCBJUEJMT1EgSERBIGNvbnRyb2xsZXINCj4gPj4+ICsNCj4gPj4+ICtkZXNj
cmlwdGlvbjoNCj4gPj4+ICsgIENJWCBJUEJMT1EgSGlnaCBEZWZpbml0aW9uIEF1ZGlvIChIREEp
IENvbnRyb2xsZXINCj4gPj4+ICsNCj4gPj4+ICttYWludGFpbmVyczoNCj4gPj4+ICsgIC0gSm9h
a2ltIFpoYW5nIDxqb2FraW0uemhhbmdAY2l4dGVjaC5jb20+DQo+ID4+PiArDQo+ID4+PiArcHJv
cGVydGllczoNCj4gPj4+ICsgIGNvbXBhdGlibGU6DQo+ID4+PiArICAgIGNvbnN0OiBjaXgsaXBi
bG9xLWhkYQ0KPiA+Pg0KPiA+PiBXaGF0IGhhcHBlbmVkIGhlcmU/IFlvdSBtaXNzIFNvQyBjb21w
YXRpYmxlLiBJIGRpZCBub3QgYXNrIHRvIGNoYW5nZQ0KPiA+PiBjb21wYXRpYmxlLg0KPiA+DQo+
ID4gSSB1c2VkIHRoZSBjaXgsc2t5MS1pcGJsb3EtaGRhIGJlZm9yZSwgYnV0IHlvdSBhc2sgdG8g
dXNlIHRoZSBjb21wYXRpYmxlIGFzDQo+IHRoZSBmaWxlIG5hbWUsIEkgdGhpbmsgaXQncyBtYXkg
bm90IHF1aXRlIHN1aXRhYmxlLCBzaW5jZSB3ZSBtYXkgaGF2ZSBza3kxcCwNCj4gc2t5Mi4uLiBs
YXRlciwgc28gSSBhZGQgYSB1bmlmaWVkIGNvbXBhdGlibGUgaGVyZSBhcyBhIGZhbGxiYWNrLg0K
PiANCj4gIkZpbGVuYW1lIG11c3QgbWF0Y2ggdGhlIGNvbXBhdGlibGUuIi4gWW91ciBleHBsYW5h
dGlvbiAidXNlIGNvbXBhdGlibGUgYXMNCj4gdGhlIGZpbGVuYW1lIiBpcyBhbHNvIGNvcnJlY3Qg
LSB1c2Ugd2hhdD8gdGhlIGNvbXBhdGlibGU/IGFzIHdoYXQ/IGFzIHRoZQ0KPiBmaWxlbmFtZSBz
byBpbiBwbGFjZSBvZiBmaWxlbmFtZS4gU28gaG93IGNvdWxkIHlvdSBtYWtlIGl0IHJldmVyc2Vk
Pw0KPiBmaWxlbmFtZSBhcyB0aGUgY29tcGF0aWJsZT8NCg0KWWVzLCAiRmlsZW5hbWUgbXVzdCBt
YXRjaCB0aGUgY29tcGF0aWJsZS4iIGlzIG1lYW5pbmdmdWwsIEkgdXBkYXRlZCAiY2l4LHNreTEt
aXBibG9xLWhkYSIgdG8gImNpeCxpcGJsb3EtaGRhIiwgc2luY2UgaGVyZSB1c2UgSVAgbmFtZSBp
cyBtb3JlIHN1aXRhYmxlIGFuZCBtYXkgZm9yIGFsbCBDSVggU29DcyBsYXRlciwgaWYgdGhlcmUg
aXMgYW55IGRpZmZlcmVuY2UsIHdlIGNhbiBhbGwgb3RoZXIgY29tcGF0aWJsZXMuDQoNCj4gWW91
ciBjaGFuZ2Vsb2cgaXMgdmVyeSB2YWd1ZSBhbmQgZG9lcyBub3QgZGVzY3JpYmUgaGVyZSBhbnl0
aGluZy4gSXQncyByZWFsbHkNCj4gbm90IHVzZWZ1bC4NCg0KU29ycnksIEkgd2lsbCBsaXN0IG1v
cmUgZGV0YWlscyBuZXh0IHRpbWUuDQoNCj4gPg0KPiA+Pj4gKw0KPiA+Pj4gKyAgcmVnOg0KPiA+
Pj4gKyAgICBtYXhJdGVtczogMQ0KPiA+Pj4gKw0KPiA+Pj4gKyAgaW50ZXJydXB0czoNCj4gPj4+
ICsgICAgbWF4SXRlbXM6IDENCj4gPj4+ICsNCj4gPj4+ICsgIGNsb2NrczoNCj4gPj4+ICsgICAg
bWF4SXRlbXM6IDINCj4gPj4+ICsNCj4gPj4+ICsgIGNsb2NrLW5hbWVzOg0KPiA+Pj4gKyAgICBp
dGVtczoNCj4gPj4+ICsgICAgICAtIGNvbnN0OiBzeXNjbGsNCj4gPj4+ICsgICAgICAtIGNvbnN0
OiBjbGs0OG0NCj4gPj4NCj4gPj4gY2xrNDhtIGlzIHRoZSBuYW1lIG9mIHRoZSBwaW4vc2lnbmFs
Pw0KPiA+DQo+ID4gWWVzLCB0aGlzIElQIHJlcXVlc3RzIGEgNDhNIGNsb2NrLg0KPiA+DQo+ID4+
DQo+ID4+PiArDQo+ID4+PiArICByZXNldHM6DQo+ID4+PiArICAgIG1heEl0ZW1zOiAxDQo+ID4+
PiArDQo+ID4+PiArICByZXNldC1uYW1lczoNCj4gPj4+ICsgICAgaXRlbXM6DQo+ID4+PiArICAg
ICAgLSBjb25zdDogaGRhDQo+ID4+DQo+ID4+IFdoeSB0aGlzIGlzIGhlcmUgc3RpbGw/DQo+ID4N
Cj4gPiBJIGFtIG5vdCBxdWl0ZSB1bmRlcnN0b29kLCBkb24ndCBuZWVkIHRvIGxpc3QgdGhlIG5h
bWUgb2YgdGhlIHJlc2V0LW5hbWVzDQo+IHByb3BlcnR5Pw0KPiANCj4gTXkgYmFkLCBJIHRob3Vn
aHQgeW91IHJlY2VpdmVkIHJldmlldyB0byBkcm9wIGl0IGNvbXBsZXRlbHkuDQo+IA0KPiA+DQo+
ID4+PiArDQo+ID4+PiArICBjaXgsbW9kZWw6DQo+ID4+PiArICAgICRyZWY6IC9zY2hlbWFzL3R5
cGVzLnlhbWwjL2RlZmluaXRpb25zL3N0cmluZw0KPiA+Pj4gKyAgICBkZXNjcmlwdGlvbjoNCj4g
Pj4+ICsgICAgICBUaGUgdXNlci12aXNpYmxlIG5hbWUgb2YgdGhpcyBzb3VuZCBjb21wbGV4LiBJ
ZiB0aGlzIHByb3BlcnR5IGlzDQo+ID4+PiArICAgICAgbm90IHNwZWNpZmllZCB0aGVuIGJvYXJk
cyBjYW4gdXNlIGRlZmF1bHQgbmFtZSBwcm92aWRlZCBpbiBoZGENCj4gZHJpdmVyLg0KPiA+Pg0K
PiA+PiBZb3UgZGlkIG5vdCByZXNwb25kIHRvIHNldmVyYWwgY29tbWVudHMgYW5kIGRpZCBub3Qg
aW1wbGVtZW50IHRoZW0uDQo+ID4NCj4gPiBJIGludmVzdGlnYXRlIGl0IHNlcmlvdXNseSwgSSB0
cmllZCB0byB1c2UgdGhlIHNvdW5kLWNhcmQtY29tbW9uLnlhbWwgYnV0IGl0DQo+IHNob3VsZCBm
b3IgQVNvQywgYW5kIHRoaXMgaGRhIGNvbnRyb2xsZXIgZHJpdmVyIGRvZXNuJ3QgYmVsb25nIEFT
b0MsIHNvIEkganVzdA0KPiByZWZlciAgdG8gdGhlIGhkYSBkcml2ZXIgYXMgdGhleSBkb25lLCBz
dWNoIGFzIG52aWRpYSx0ZWdyYTMwLWhkYS55YW1sLg0KPiANCj4gWW91IHN0aWxsIHNob3VsZCB1
c2UgYSBnZW5lcmljIHByb3BlcnR5IGNvbW1vbiBmb3IgZXZlcnlvbmUsIG5vdCBjb21lIHdpdGgN
Cj4gb3duIGZsYXZvciBvZiBpdC4NCg0KT0ssIHRoYXQgIm1vZGVsIiBmcm9tIHNvdW5kLWNhcmQt
Y29tbW9uLnlhbWwgZmlsZSBtYXkgYSBnb29kIGNob2ljZS4NCg0KPiA+DQo+ID4gQW5kIHRoZSAi
IEFTb0M6IGR0LWJpbmRpbmdzOiBhZGQgQ0lYIElQQkxPUSBIREEgY29udHJvbGxlciBzdXBwb3J0
ICIgYWxzbw0KPiBub3Qgc3VpdGFibGUsIGFzIG1lbnRpb25lZCBpdCBub3QgdGhlIEFTb0MgZHJp
dmVyLCBDYW4gSSBjaGFuZ2UgdG8gIkFMU0E6IGhkYToNCj4gYWRkIENJWCBJUEJMT1EgSERBIGNv
bnRyb2xsZXIgc3VwcG9ydCAiPw0KPiANCj4gDQo+IA0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBL
cnp5c3p0b2YNCg==
