Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011004.outbound.protection.outlook.com [52.101.62.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651BD329E6F;
	Wed,  8 Apr 2026 13:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775655471; cv=fail; b=lIu9ChQiErWhB8BvAqumjt8WJApvAGE4tiS9w6dq5cujU7KDVBzbeMcb8Ha+PtcqhiXwuLsHlaxIsQRHGTXpmjbxuHSJzizSc5lSMUhLePmy1NSdY7gw/Q5V1n9d2cbFuVsoXIJOiM9eLitkWxxTZlxME0bfkp5AQX45v0yls1Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775655471; c=relaxed/simple;
	bh=Ht4bjzqr+mwRrRmhQhRswi5eHtm6hoZeBPVH5zQP9hk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QXCjVZNASKxy7pIGJggDfTWuFeYh6U3N7BzZ4MvNlP32QcKMIOrmvb2qw3Ee51ONIrYg1TZTZxspYckNPb7QIhJOoA1Jhq4mOt+ETft886Wknw7sTQEl7ijhFHTq6bzhDcj8aAmHfvul8PfgQTz2PQZH7YUjOXs0x68uvi2gkAI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=C/JdFnzk; arc=fail smtp.client-ip=52.101.62.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="C/JdFnzk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WOUYUJ5HzfDUTrzUct8WkhdmyRp7h2qC+jWRlJRPk4TZRYb05sErB+jrxJrphjRpEp+/rV3yELsvhr3jyNmyG+5vBfJ4ANlUOvwuKF1zaKgsTlqf7sKnnZxoUg9NFzJdxT7PXIvm/c/R2fm13GUOvRmCxxGs+1iosapnLaWUJdPlABFS5gF/hQLJ/m7GxZm0g2lVHHf/CbZDfkqySBw6fQbdg/OxNisBD6CK1KGadqj1mKnwayTTZfBwLqYNgjAM3925JJefTh5Z7n/vdVpn38LcfrIwkX7FdM4WlQgOgA0ufM3xtQBEa4SEfTxb5w764psDXinboBcaE/qvOkIr1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5C3Ht+SB6dSIw5hnZh14sjZFLQTkcifoVDxmaQ8ZHIc=;
 b=Ev9bpBpUmpiH5wl5w0W6N5LHudJbxriu+FJEY3+oyYMCA4vZG9UMcm5eCTcyuHpSSoU+NuOC+25q/Ha8gMoNL0E6gE/meLx6tb3x4Mpua8I4yILqTfSQT3MvuGqRJY0Oq+KfdlK/1wiDVo0407NAkBd/RaqgzSZMdFCRrn4yelp+dJTfVRxnjNYx6FAf+CcmR8RLvuu4rYJFEbNV+5zjfl47maspfR3QfEgZLNECAGljKSduvBmu2burWJZDF1Mcpm+TKAcOaIw4U2OjrpTMcRm1+g15DaNNH1ZsoEMCvDQ6Mey2e3OaRxFza4R1WJr1mnljg3jXjTsFBYBpYI6zFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5C3Ht+SB6dSIw5hnZh14sjZFLQTkcifoVDxmaQ8ZHIc=;
 b=C/JdFnzkTgvo5uws85HecOo4QkR95IFOPowA3Spq33QLCUH9X+HSGDZueI1XdKFwapz0d0BEQDlVSL8xPi36b+FzfpyOYtV7R9XrWlJQTnex96vU9mbtlBg6y6fFiw4QHNRFEKm2m/v8gEfVFHxCWN2KaneXzlaypAVxlvUxySk=
Received: from PH7P220CA0144.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:327::6)
 by IA3PR10MB8249.namprd10.prod.outlook.com (2603:10b6:208:571::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 8 Apr
 2026 13:37:45 +0000
Received: from CY4PEPF0000EE36.namprd05.prod.outlook.com
 (2603:10b6:510:327:cafe::f9) by PH7P220CA0144.outlook.office365.com
 (2603:10b6:510:327::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.37 via Frontend Transport; Wed,
 8 Apr 2026 13:37:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY4PEPF0000EE36.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 8 Apr 2026 13:37:45 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 8 Apr
 2026 08:37:44 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 8 Apr
 2026 08:37:44 -0500
Received: from DLEE204.ent.ti.com ([fe80::81dc:e6c6:4c37:9bc6]) by
 DLEE204.ent.ti.com ([fe80::81dc:e6c6:4c37:9bc6%14]) with mapi id
 15.02.2562.020; Wed, 8 Apr 2026 08:37:44 -0500
From: "Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>
To: Mark Brown <broonie@kernel.org>, "pierre-louis.bossart@linux.dev"
	<pierre-louis.bossart@linux.dev>
CC: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"ckeepax@opensource.cirrus.com" <ckeepax@opensource.cirrus.com>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>, "perex@perex.cz"
	<perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
	"cezary.rojewski@intel.com" <cezary.rojewski@intel.com>,
	"peter.ujfalusi@linux.intel.com" <peter.ujfalusi@linux.intel.com>,
	"yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>,
	"ranjani.sridharan@linux.intel.com" <ranjani.sridharan@linux.intel.com>,
	"kai.vehmanen@linux.intel.com" <kai.vehmanen@linux.intel.com>, "Xu, Baojun"
	<baojun.xu@ti.com>, "Ding, Shenghao" <shenghao-ding@ti.com>, "Kasargod,
 Sandeep" <sandeepk@ti.com>, "Hampiholi, Vallabha" <v-hampiholi@ti.com>
Subject: Re: [PATCH v5 1/3] ASoC: tac5xx2-sdw: add soundwire based codec
 driver
Thread-Topic: [PATCH v5 1/3] ASoC: tac5xx2-sdw: add soundwire based codec
 driver
Thread-Index: AQHcx1zhjv8jksjRpECaCKxcjcW91w==
Date: Wed, 8 Apr 2026 13:37:44 +0000
Message-ID: <f3c662fcbdb8483f9ba676e5d00837d0@ti.com>
References: <20260407094829.2391-1-niranjan.hy@ti.com>
 <476c9252-fd4d-4e9f-9f32-6ae3aa3ddc1c@sirena.org.uk>
In-Reply-To: <476c9252-fd4d-4e9f-9f32-6ae3aa3ddc1c@sirena.org.uk>
Accept-Language: en-US
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE36:EE_|IA3PR10MB8249:EE_
X-MS-Office365-Filtering-Correlation-Id: d2a1b266-94e8-4a79-9a70-08de95740437
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|7416014|82310400026|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	FrWqAbQbNUpyiDfNkh3I5rXo17b1LDbItIjAMA7VB5PXaXiMMRnGZy4FNNEor+rU/UcLEyVyTJ/0PFtP+xH0KuhcU47KZA/Fj0+f1GwogHb+j5RVkGmQL+LV3oDB1+4L50pwmZEea3zclxRU625McZ55bJsXk1rc/hekgOT+EoqUmEbBnfduwVM+6NoJ8v/04HHXEVN+KCb4BC8v4ik0iyV/wdn9hpbXgyKZF5z6gnt/bTo1xWhSSQDwP4gBN1ZOBfgtCIv6u4fkJYrA9370+cRF7k+WM90PqwZumQSrXIztXx4mGulwO3B6WGFseDwYQzpBusT90HIxQTF5T6q5ItMPCgb3Ml/8euAgETX0ZpD5yfjawHphXXCOuZ6nEPV83jOCSMj0iKlWqfADQLpdnk0EY5Une6SXsWBqEXUFPuQF9Y2ER5rCOU9xeRK/uC593xb+veSIm8t5rdGwiVtlzxvF1ObZIESjEyyHBPeiBQHJsE4YTLa0gFEblLheZ7fZC36ykEbkIol4i4vvfbb0W9S8tm2/Q6baVZEo4rOYCmXSpHRdwo7f/fCkLifELbwtpnqpsklDp2rJr276gsRDNXVU50Idzr+tKp/UYI5aEGqMKgvPi558XfzRTuZsD4Fi1WVDh8qvK1U4QOAOdCxwqPvrlNB90up5HI4fjK8MrIfnQDCctrdv7NKQmWxVnDYPb9XdE7g9OV565JGO2cdwQd7Qd6ozemlwsKhrkvNzp8ssbR/cFclTRtH8pLeQd6HoBwaxmG3k95sn3ZgZh1NcUQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(7416014)(82310400026)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KY1ThcrMStCg7UEk72rQGrxx+RV+Wx/QaTnjCLT3HKoz5331HURupDyFDf4ZvgLEuGuUIn+HC+bJ6gitUTwcO24VQb4uvMySa8no/IMnQTJwIuN+OeGjIaB7OWoGd9IgYKe6wrnUjDwaPLmWeyUSk3wi/lPOskH+f/NF2x9POF/tWBt6yn3CWbr26a+8bCCNFKzVitxniUpHxTRh9cHCz90Gp2K2OUWrsMiATniBGddig9YM0WMQf5BpK9V0heEb9UDGAsO9geDIU8PWXF+Cec450yEcIBT9HSHF/DWutUOsYb7Ht9aIyIe1/iDMvyd5Kwxx+Sk28QH2W3MFoFfVNAVEjto05MtMYJULLJtpZzFvUtKE//Uo6iJGCPG/93zuMsnMWPutQEpBFJ9mEkklXjkklC8UQN69TkpoNVWtShL/7L5+sFV2eFFFxgEYdPZM
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 13:37:45.1792
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2a1b266-94e8-4a79-9a70-08de95740437
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE36.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8249

> On 22:01-20260407, Mark Brown wrote:
> Subject: Re: [PATCH v5 1/3] ASoC: tac5xx2-sdw: add soundwire based codec =
driver
>=20
> On Tue, Apr 07, 2026 at 03:18:27PM +0530, Niranjan H Y wrote:
>=20
> > +static s32 tac_load_and_cache_firmware(struct tac5xx2_prv *tac_dev)
> > +{
...
> > +	ret =3D request_firmware(&fmw, tac_dev->fw_binaryname, tac_dev-
> >dev);
>=20
> This is happening in the SoundWire bus callback - if request_firmware()
> ends up being slow (eg, a userspace helper faffing) we might block other
> things on the bus.
I'll move this to probe and use request_firmware_nowait() to prepare
the firmware in background.

> > +
> > +		if (first) {
> > +			/* Set default value to CS:11 */
> > +			tac_dev->cx11_value =3D 1;
> > +			regmap_write(tac_dev->regmap,
> > +				     SDW_SDCA_CTL(TAC_FUNCTION_ID_SM,
> > +						  TAC_SDCA_ENT_CX11,
> > +
> 	TAC_SDCA_CTL_CX_CLK_SEL, 0),
> > +					tac_dev->cx11_value);
>=20
> This looks like it could race with tac_cx11_put() - they both write
> cx11_value but the control could be modifying it.  I can imagine that
> happening if userspace starts and is setting config while the SoundWire
> bus is coming on line.

I will drop the userspace control as Pierre suggested. The CX11 clock=20
selector will be set to the default value (CS:11) during initialization,
eliminating the race condition. The device functions correctly with this
fixed configuration for smart mic based on my testing.

Regards
Niranjan
