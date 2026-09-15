Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899773DEAC0
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 15:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789484728; cv=fail; b=e5PWQFfwfPcVwvuHLPOAIMFECcEzAW8o3bPN6j95giZbHOJAEAKBbbJbYoSzbzkSLgPMD1RturiXB+Ht6BarVTH85JREEh15VoG+/aGmSY5sOW0/7F/llmwVuvx3rt/EtNy9Z5apmjQPXF/UhERb+xqir4EFcxrLNIXkUNz4G+M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789484728; c=relaxed/simple;
	bh=XemMfWN0krMSfN0HNQKQl82jV0m1i8H0KEDritBr2jY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=G2p9KqfG9w0AEgLFzaiPdBKHIX1fLlM6Rwds64Nnc52qy3hjxB2ci49NmWCugmXQ9TD8ivunJM+Qcgy2wQU5H6CAnlBJk2ARUsUItfm4uRJD9MK2C2Y67io5A0XBY9VPh7Iby0k36qdsLFQFGF16qu/ryk/1uIQl/2yW/hV8Ack=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=ZEZV2Urb; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="ZEZV2Urb"
Received: from pps.filterd (m0516787.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FD06DJ1036826;
	Tue, 15 Sep 2026 11:05:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=mZFrk
	WnFNQX5LGGT+IY3fn4m0ZOrjZQ3cq4ldU78oyU=; b=ZEZV2Urb3yevcpxUDLmBr
	vsd/5JNiJe8tJIiMGsy0Ua5t9taayUEiY9c5ZnWpBbureXHgqGwsL9aOUhHJfMKW
	6oHewumGa2SgrmzviguZW4HCsXabgfsYfRxCENZZ/V4YVuaHwl5FuiKuBtoVcdSQ
	zQIRbZIOF018zXNTJe/jzR7PPzAeZsL3XxzA7gOvh9IkYGAuTHw4NWawy46TcOuq
	AT0xPWVNxhkVNFJUNz7JTCqBq1I8R+gSrJPTCvmoxk6mmuyvP1LfPC2n7Hj2UU0A
	HybtOUau9WveulSeMy9lFBr4Vc55slbn08V489k1RmAQdWUrCFuO/4nWYRwMEX/i
	Q==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011069.outbound.protection.outlook.com [52.101.62.69])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4gq43rhgp1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 15 Sep 2026 11:05:15 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VtlhBiDul6Ftt4DJmCvCCST/b8M2ZV40bbqyfOkK+wgCJ+X/DWATxdALQZGbsYq2vIsg1ytJlL9+FmUecInr+5g6pDTc3LFCcgmhzVFspUyQntZBsKZuvm8NSN3Q3Qu/o+Gnbw/k6ConescJn45tfvH9q2Oy2PitOrBt2HwN/U8BFKTq782B/ktURzG2jBDtj7w4v+WoGaqQqgtTwUo+OUod4PKqcyrtKBMx7xv36ZxiIIo+SQeSy+IeEX8+PFffxqM+e83scJAEQ+QT0smqnbndPLUuRoIXHg7k17ghhQVGcGrXSszUeo8+RZuaImnqq1f4etHSsT2QqfbflwDqBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mZFrkWnFNQX5LGGT+IY3fn4m0ZOrjZQ3cq4ldU78oyU=;
 b=vVvhfZHAbeECBeZ4jd2Dl7WySRbju99Zo9bPK6F71xEzuveUej37KRrKFAZOQI+ZkXr0y3OggvubllJPgs2qHpp//7q4LkF3B4fUeaeRSAM2kYjEYBjcKms7m00YGeAcqbTzYpI4oGtIm6mIiP9Me9AVlBayGiLPJnxgQr8yEgj+0piXBCviDovbYRjpRMpBw/ZmQAjDjGG003T/r+Y6PC3lDnH5VdG6fQ4odEXq2VmtiX1/Y156Jg6grpZ/2lwby6JgPMA6Sb/uwcOkEdCuaL/qp1jPtn2lvD4O3w5WL00L6z17KIEs9y40xyMf7IsRID2eD5oN+mZ9vFMhgIzk5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from DM4PR03MB5981.namprd03.prod.outlook.com (2603:10b6:5:388::24)
 by SA3PR03MB878648.namprd03.prod.outlook.com (2603:10b6:806:50f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 15:05:11 +0000
Received: from DM4PR03MB5981.namprd03.prod.outlook.com
 ([fe80::7af0:3071:4d42:63ed]) by DM4PR03MB5981.namprd03.prod.outlook.com
 ([fe80::7af0:3071:4d42:63ed%5]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 15:05:11 +0000
Date: Tue, 15 Sep 2026 17:05:09 +0200
From: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-sound@vger.kernel.org
Subject: Re: [PATCH 06/10] ASoC: soc-dai: add snd_soc_dai_{set/to}_priv()
Message-ID: <aqlembWzLcfpbkST@analog.com>
References: <87qziwliaj.wl-kuninori.morimoto.gx@renesas.com>
 <87ik48li5d.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87ik48li5d.wl-kuninori.morimoto.gx@renesas.com>
X-ClientProxiedBy: AS4P190CA0014.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5de::18) To DM4PR03MB5981.namprd03.prod.outlook.com
 (2603:10b6:5:388::24)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB5981:EE_|SA3PR03MB878648:EE_
X-MS-Office365-Filtering-Correlation-Id: c0d75c2c-90d6-4d34-de0f-08df133abd76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|18002099003|10067099003|3023799007|4143699003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	bvkUSi76M+nokv9fc/zlNk9Jbuc2DlYf/1DjbQkdVNhZSjvMPnStbnSwdePuCfSC3DVrgCF+MA4sGtqtHscLDVFAQK7ENh0pTF9gLnqmM2q9R6S9h0JksQr6e3rxbCwBmUvX0ncB398M93cH7kZl62h4whDCFaqr3wf6hNfH+u4jWcz4Anyxy0HPQrFv4deEL68Ly7Wyk3BDY3u0mXJtSj0dMng0Vrzduddx1ndZ0rc4me98HAPBUBRYwqHjqn6I9s9ODhHKvUIQXn5N4ik+DnnuNrRZEjyExFMD4OW8Nmp9m1BGLyle/e9rTkByFJd+wYKDsx7nRSny7y0j5Hi+OjS3x5GwCz7zipKKTKpemGMwktxYwSFc8QDepCPz95D1ir2mJZkMS5hFmKkOcVlalWbNleOUtzQaFiMJ/FxVWwyqgs9dk+kRaqoOVe39b7FK5qt7PcZj/V6ipoU9qE3dW9AetfBTFX+qXo99UhEMcZPaZqo3m46BM/6tSuDxGh4etpRXSLP+hjk8ChZQOlbRDVmZAhI6PoahDJxfrZS+yU1QOPH8upFlYWcKSIyK7wO5uPTyZP3G7O3lq06oHvlzA1yi3pXU08g8Q0epUUGiBCd2Q8pBXz0vdle2MgrxzbnRSNHHwmSxk1Aa1yzifVor52lPHgvpiqnIZtX2iu27ub4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB5981.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(18002099003)(10067099003)(3023799007)(4143699003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bzRCanBVWHRjaEd3VmhYdjBRKzVpVkdSeHZnUDliLytHbEwyMm9hclppRFNx?=
 =?utf-8?B?d09mQ2RlV0dzWXlhd08vUEIyeU41Mi85VFlnbUFwNzVaZ0QxRERhZUxzV1Rq?=
 =?utf-8?B?MjEyRFdTMm1NcUg0R2QrRVozTEhrUWJoK3QzTE5Rdk1WWnlhUXVsclZVamxi?=
 =?utf-8?B?cHk3Qmt3d1dlNURRZUVBeFNRWTF2VThDaDRzcHVwYlFJU2dtVzNGUW0rZ3Zk?=
 =?utf-8?B?TW5mRlY3YU5KWG5jZkc2aDVXWHVNTmNBSEFqcUpjbExONWFXd0JPUHNGRWp0?=
 =?utf-8?B?Y2lmeFRidEN4QmFnVjgyM0pSWmJRcGtMdWJrU21kSWZnRWpuamRpZnBYSzVG?=
 =?utf-8?B?UUdRVlZtM3lnSHh1clJ2ZENNcm83N2F0L3owOTFlZGE2NHlpcmM1YlYrZzdh?=
 =?utf-8?B?bU84S2RPanVUczZCTEEycFcwaUgwSVhaZ0xkU3BCSmNxZUNuOThVZmxWVFAx?=
 =?utf-8?B?bFByVjk0akdZOVQ4T3lib3B5MTdZU2NJdkJDNEJMQ254V05PSUJnYk9MM0hn?=
 =?utf-8?B?VEY1NXhOS2x3NzVoL002VmM2M0pIcFJuUWZrb2FESGhhZmIxbC93RDUxamhi?=
 =?utf-8?B?aHM4dTVrdG4wNjhhcnRDYVlYRjZkQjQveWZ5Z3QrQ3g1ZXZrSzIxS3ZKZG8w?=
 =?utf-8?B?NHJ1aHJ2eHlxd3IvRGVvVXRtTHdMc1pFa0VPOTVkMmxZdVVxZTE0NG5VYjN5?=
 =?utf-8?B?K3pIZ0tTdkpZOVBTMFU4YkVRcXN5VHVDQ01vNXgvaG92SFJqdm9oU2FKY3kv?=
 =?utf-8?B?TkR4QWlLZWtZOUVtZUgwNlFGMXF1ZlRYeFV5bVdnbDJIUnVNSnFPQlVySzBm?=
 =?utf-8?B?NXlZa3pMb2pycGd2ajk1V1gwOXJ5RFE5MkRUUUloamZRdlMydFRIcDBzZ0FJ?=
 =?utf-8?B?MzJhWTRpQ3pOYVQrTnZIU0FRZThORlFtTytaQlNsb0Q2WlhVcUN5bWxmN2x0?=
 =?utf-8?B?VkxhT1J4OHdhd1RwdFZZNXNNSWg5dldmT0JLQWYrR3RPdzVySWQvUVhrVTFR?=
 =?utf-8?B?aXdlVGlMcEh2a1JPeUFubGpCcHVscXN0akNtU2pvMkQ1cWs1dU5ZbWpsN3RF?=
 =?utf-8?B?UzRNdGhVZWNONVJIQ29KS1hKcXVnTEdiRlh0aC9KTEl0enp2eUZzZ0RrNXBL?=
 =?utf-8?B?REhzWnl4WUFhdDZUNWNYazV0YXFuSjdJRXNWTXowV21lejB0N0Q3UkdKeG5z?=
 =?utf-8?B?NHFlMFVCMHl0bVVyd2lJT25kalQrTWRUYnVlbDZsQVRkemM0OXZDNTQzd3NP?=
 =?utf-8?B?NUZJdkdGQmQybUxvU25neVRBQklGMVk0eUtqd1dCanh4SlRHdU5PWXh4UFVH?=
 =?utf-8?B?SzdwQU8yZS95eGlCcDcyTEd3TE5XN1VGS2kxMENOZFZGWjdDZFU0VWVCK2Rv?=
 =?utf-8?B?LzlKZmUxQWlPY2U5MDNKOG5xU0ZlSEFXL2dMck1BZkx3djdmUm0rSWFVQ0wx?=
 =?utf-8?B?MzN0cDladXdMTnJLNkhjaHNyZGpjMElmcUlLTXJ3WG1IbmVsdlI4cFRTK01G?=
 =?utf-8?B?QVNBWUhweUo4TDRRNXNqaWx1dmhQNDRSeVVTa2Y2enFvT0MvRUNzMUVNR0Nh?=
 =?utf-8?B?bW1NbWFOSzZPQUt2M1pJS3hUZ0V5cFVFQkIyWE9XTHUranBZTWVpK0RQdXlN?=
 =?utf-8?B?bDIwUm1hTnEyRkpOTkFyd3RJdktDaUdmaFRmQ3lUSHZ3citBUFBLZGZ4eXhu?=
 =?utf-8?B?SVA4bjlsUDcyUlRUNjJVaTFJSmlYMzFOZEhLL1htbSt2TmY2V1pDd0dWa2Zp?=
 =?utf-8?B?Qno5SUJjTW9jUWVOOXZZbktNUWlQUERpbThsMFkyMWJBSkQzVlhYZlJZdEpY?=
 =?utf-8?B?cXlsdUErMVNGSURwTnloV3Erc0xnM0svMlJRemsvSXBQL01pNGh1M3Y4S3U4?=
 =?utf-8?B?RzBTR0NDQjZJVnlJVzdwQ1hqbUJENHE1NUo5T2xab3o2L2pNUFBHL00vdGw2?=
 =?utf-8?B?N0loc1VLemViWjlvK3Y5enhDMG5VdHFsaVlObno0Q3Q4K3lZb1poQW9aRGlk?=
 =?utf-8?B?dGY4T2R6MWFlYTZnbXRsYTR5SWdGUllsQ0duVjArR3NvdjNZNjg0RVlkMXBJ?=
 =?utf-8?B?R2FYcFIzQXZCbmd3SkJaUDFSbGFMQ0NDQjhtYWpFVXEwQWw4cVdBMU9qaUFa?=
 =?utf-8?B?RzJmbFM4RVZiTjZjSVA5MHNHRVhuTDF1UlhlZWpGQU5jQndOcHQ3MFlvWVFn?=
 =?utf-8?B?L3c4c3I5bE81Q2U0Y1pXMmlCRFFsUzNEakNBdmJ5d1ZhczJ2bmtyZEhrK2dI?=
 =?utf-8?B?S2hITGpzVnFVVGFObjRFSm1OR0tsMURLbDZZZnh2RHRFZHlsZEg0NHVpWWdo?=
 =?utf-8?B?bzF0V2NJT2J6L1ZpTXdWWWh6TWM3UEg0WFpvdkQ3SjJXaWQzcjZtUT09?=
X-Exchange-RoutingPolicyChecked:
	SY5gqdtYT/5W8Bomos7E15p4wjCxK6htf3uzk08emhMp/W3RTAzR/Fp/DKGQzOvGfYtZJp7qKv5wAO6jQ3DJgzUEKxqbk+uSWcb0sWmtl3H12p1a+iDc/Xs/Hq/HSqcN4oxDfZLzisyeES5TbCkZm4III0jcbDhJc983l+2zXB74DJKwo1keH7m8iHaR990OgIjuYAQC5y54PqhlIYZfmuSldfdbXKtWnm/Pnqm7FMR1bmddPUwaKJpTKVVYjQlBFmnFGQcWcQObPlPx3+9uJfDUNiJRFjc+mlm09xoGAFBbh49uxI0GEMbtTNhVbjKKYvVGqXhfTZu7ZI1P9/Rk/Q==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0d75c2c-90d6-4d34-de0f-08df133abd76
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB5981.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 15:05:11.8518
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IeUvAU6D6DBtVksXZ5CJtyeCR+jJ0ZCnr8L/dy7dGO7MxedZpFdni4u2WYeYwHas/ttpXlfOZ3ZCOTHzIDTfKlKrAk+/GBt7lYGGZSOOJ3g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB878648
X-Proofpoint-ORIG-GUID: Jjq0GLGBDLFZnqXs52O5BF57T4dbsZnp
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDIxOSBTYWx0ZWRfX3qcgsmobz+5/
 cYmIjRA8/t93ZF9LMC/1XAOTcHGXX7hP72DAKgCruDzkpeO7x+7ratzKZX2ARzzjnXaGMZt6H3z
 qi7EkqLp+W5QOcBqGDzggU9t0b0z/D75y412UcBaehTK5kXyCtOK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDIxOSBTYWx0ZWRfX/i8UCi30zoHA
 ylVRWhRu1S7mLFXqDaYnfLAdN1zZJIpd33G7UNoy3lSsP9VN7efCzPTqHYTBj7xXURq/O4Vj2R7
 a5c+JVM9TR4BYq0900bMno9ikuunmfA2mJEXZihYZGrNFtZfBobXYB42R9qubD+Vg6oTB4seF98
 U1HA597+GWBdg0BYJ05+KHmsXGFi4TTZ/Oxs0HWBRWwrqHM9Pn+wmnWCfyNboPeopXozCDgKkIx
 iq8U9SvGp9UbQsJHqG2rvKod01n8jvrZYlsybtmqLsshuhSnIK+i0tA3pENpp1aBst5ffrWmPDs
 xqiwDqTde6TIJ+FcbS5Ad7vG2vPY7ex4xhYn6QfdbJYCGXXix9uvIlM9j6FmpWaSMrvvcP9YJft
 ij4oJItMc5i5/iVV63kDQYrTs8O1v+X2fXOulwYU9e+OrH7UU7qf3GGsQn5gCndf7hHTdZl//Bb
 7wKBWvlJKIpwy3Of1rw==
X-Authority-Analysis: v=2.4 cv=HZeB3SE8 c=1 sm=1 tr=0 ts=6aa95eab cx=c_pps
 a=/8oI+ICX6VsmSI+SRIYafw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=OmVn7CZJonkx5R5zMQLL:22
 a=yC-0_ovQAAAA:8 a=gAnH3GRIAAAA:8 a=4E8i0L-mUvEna9AbHK4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: Jjq0GLGBDLFZnqXs52O5BF57T4dbsZnp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1011 suspectscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150219

On Mon, Sep 14, 2026 at 01:46:07AM +0000, Kuninori Morimoto wrote:
> DAI parameter will be capsuled soon, will be not enable to access from
> each drivers. DAI priv has been mainly referred from SoundWire driver.
> Let's add snd_soc_dai_{set/to}_priv() for it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Alvin Šipraga <alvin.sipraga@analog.com>

> ---
>  include/sound/soc-dai.h    |  2 ++
>  sound/soc/sdca/sdca_asoc.c |  4 ++--
>  sound/soc/soc-dai.c        | 12 ++++++++++++
>  3 files changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
> index c5544f1789425..e91f87ca57689 100644
> --- a/include/sound/soc-dai.h
> +++ b/include/sound/soc-dai.h
> @@ -567,6 +567,8 @@ void snd_soc_dai_symmetric_get_params(struct snd_soc_dai *dai,
>  				      unsigned int *symmetric_rate,
>  				      unsigned int *symmetric_channels,
>  				      unsigned int *symmetric_sample_bits);
> +void snd_soc_dai_set_priv(struct snd_soc_dai *dai, void *priv);
> +void *snd_soc_dai_to_priv(struct snd_soc_dai *dai);
>  
>  /* REMOVE ME */
>  #define snd_soc_dai_get_pcm_stream			snd_soc_dai_pcm_stream_get
> diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
> index ce2e7c2707657..ccc579f878ff1 100644
> --- a/sound/soc/sdca/sdca_asoc.c
> +++ b/sound/soc/sdca/sdca_asoc.c
> @@ -1507,7 +1507,7 @@ int sdca_asoc_set_constraints(struct device *dev, struct regmap *regmap,
>  		return ret;
>  	}
>  
> -	dai->priv = constraint;
> +	snd_soc_dai_set_priv(dai, constraint);
>  
>  	return 0;
>  }
> @@ -1523,7 +1523,7 @@ EXPORT_SYMBOL_NS(sdca_asoc_set_constraints, "SND_SOC_SDCA");
>  void sdca_asoc_free_constraints(struct snd_pcm_substream *substream,
>  				struct snd_soc_dai *dai)
>  {
> -	struct snd_pcm_hw_constraint_list *constraint = dai->priv;
> +	struct snd_pcm_hw_constraint_list *constraint = snd_soc_dai_to_priv(dai);
>  
>  	kfree(constraint);
>  }
> diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
> index b9a3d29d60914..1df58861c8388 100644
> --- a/sound/soc/soc-dai.c
> +++ b/sound/soc/soc-dai.c
> @@ -32,6 +32,18 @@ struct snd_soc_dai_driver *snd_soc_dai_to_driver(const struct snd_soc_dai *dai)
>  }
>  EXPORT_SYMBOL_GPL(snd_soc_dai_to_driver);
>  
> +void snd_soc_dai_set_priv(struct snd_soc_dai *dai, void *priv)
> +{
> +	dai->priv = priv;
> +}
> +EXPORT_SYMBOL_GPL(snd_soc_dai_set_priv);
> +
> +void *snd_soc_dai_to_priv(struct snd_soc_dai *dai)
> +{
> +	return dai->priv;
> +}
> +EXPORT_SYMBOL_GPL(snd_soc_dai_to_priv);
> +
>  struct snd_soc_dai *snd_soc_dai_from_list(struct list_head *list)
>  {
>  	return list_entry(list, typeof(struct snd_soc_dai), list);
> -- 
> 2.53.0
> 
