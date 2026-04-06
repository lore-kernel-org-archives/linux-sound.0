Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011006.outbound.protection.outlook.com [40.93.194.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6179C36F42E;
	Mon,  6 Apr 2026 12:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775480268; cv=fail; b=WkKu6yhD/zqzr/KH8bNLrQQokia/9Yh0BihCrq4shpLxPgSdhDEOxwybPUV6JIhStl7WRRLy8sHVAWjoAaDM+n/kMBO9ujudt0rJf3aVpaRzSkGRD7GcKcimrMzMBnmvYG8cZXf6iSFueKPunf/wX47VmKv3o/r1oBtQ12/nbOM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775480268; c=relaxed/simple;
	bh=Ls3Kzt+KpQB8WLuX/7CsYFZzydJJtqwochSAsGJyHOw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dBrFazNIFkornd62CNtfEQ7ZYbllAGBEqRHCUVwJfllfSZlOZpAStveDd8Sx+l84s2BtEzat1iuPJi0VWqDvlEPk6TV5XcyN0mTMBmfhlP7jMXycLfr5c3gXKE9zJ62q32q4te40D79e5YUAkAR2QycFDWJzgPKKyNX2rR9rjj8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=wjZxCC6C; arc=fail smtp.client-ip=40.93.194.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="wjZxCC6C"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jDUf0wWTVrO1QaVMNLPM1UbIa/dmglzA8JQ37zAl+jAiY+PDGoM+jJdJWd0pmVbhJ3b5w2sbnizRPYOaC40mFCidJgK2ICy+pbm1dsFf1UmppIr4Evg9GLA18N9Wwkx71ipeVO8EszQHTZoxeU2H/vI8D6FLZLnNZwYlacnIOAusTCuF0sJpz9t3tQZJOfW++aiSG0qk4SUKAfV5BhuBDcvfUEhd3K2g0mUPovub4omptxppevSsxZUQOWXGZ7wTvccqoFkTiVfv3G8v5J2iC+dVvocTgVC/2abrcCkaQvZu2YzuGJSPZ5KkfhbtFy/CUX6MM5N9hPk4kxwAMNLauw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=suHgICXnlOhTSTAqk91wYupXcYa5nqko4E66Y2nEkTg=;
 b=NhAtjxRJHQJTn+4Ms/BNKmMUIMo866tbO23Ine1vu16pqqEhRa4E85EMvFI4VDHYAy688f/bDuBftIEEJy+n7gMdOjtTUlGMD/Tf0VNqP5SSsH1F4G9itoBB6iyjXJIza/+7Mmee8L+TN/MWxqSpBZqi8oGjyuaA466wYtYDMWKStuPJUCme3gMX3XPD8JjhHY88HtUODhh5nBSf1idZF2lhr6kIBWIWKe5SvW8so09KurquJEpssVLF1O8C8ZP5BzDFFjyVgNvc9PB4AmcBQ5/0CZqN+esX5YvaKqw6IgkD5xriMaIMptWAGMMWxfyDZFeBxdLmlY80Uc58C8gT7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=suHgICXnlOhTSTAqk91wYupXcYa5nqko4E66Y2nEkTg=;
 b=wjZxCC6CTxokuyk/1u4ebyL9Rim63yW3JxScmdVzE5ozzShyj1AIC1K+zG062iE1o8/zqGTAbjJRFeG/Z5xQquqM/vZqRlkCnBGqifZgmt5rBCSmX326ZQe89gBAHECo4KOnwGkFfDFSh9BtiUpicu6kIIB2kZ+VEel6JI1B2Eo=
Received: from SN6PR16CA0072.namprd16.prod.outlook.com (2603:10b6:805:ca::49)
 by DS0PR10MB6871.namprd10.prod.outlook.com (2603:10b6:8:134::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Mon, 6 Apr
 2026 12:57:45 +0000
Received: from SN1PEPF000252A0.namprd05.prod.outlook.com
 (2603:10b6:805:ca:cafe::1b) by SN6PR16CA0072.outlook.office365.com
 (2603:10b6:805:ca::49) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.32 via Frontend Transport; Mon,
 6 Apr 2026 12:57:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SN1PEPF000252A0.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Mon, 6 Apr 2026 12:57:44 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 6 Apr
 2026 07:57:44 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 6 Apr
 2026 07:57:44 -0500
Received: from DLEE204.ent.ti.com ([fe80::81dc:e6c6:4c37:9bc6]) by
 DLEE204.ent.ti.com ([fe80::81dc:e6c6:4c37:9bc6%14]) with mapi id
 15.02.2562.020; Mon, 6 Apr 2026 07:57:44 -0500
From: "Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>
To: Mark Brown <broonie@kernel.org>
CC: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"ckeepax@opensource.cirrus.com" <ckeepax@opensource.cirrus.com>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>, "perex@perex.cz"
	<perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
	"cezary.rojewski@intel.com" <cezary.rojewski@intel.com>,
	"peter.ujfalusi@linux.intel.com" <peter.ujfalusi@linux.intel.com>,
	"yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>,
	"ranjani.sridharan@linux.intel.com" <ranjani.sridharan@linux.intel.com>,
	"kai.vehmanen@linux.intel.com" <kai.vehmanen@linux.intel.com>,
	"pierre-louis.bossart@linux.dev" <pierre-louis.bossart@linux.dev>, "Xu,
 Baojun" <baojun.xu@ti.com>, "Ding, Shenghao" <shenghao-ding@ti.com>,
	"Kasargod, Sandeep" <sandeepk@ti.com>, "Hampiholi, Vallabha"
	<v-hampiholi@ti.com>
Subject: Re: [PATCH v4 2/4] ASoC: tac5xx2-sdw: add soundwire based codec
 driver
Thread-Topic: [PATCH v4 2/4] ASoC: tac5xx2-sdw: add soundwire based codec
 driver
Thread-Index: AQHcxcT1zSMq0qeP3EmzHPhilQC7TA==
Date: Mon, 6 Apr 2026 12:57:44 +0000
Message-ID: <e4f3a8ec7f814c798daad9ca09504419@ti.com>
References: <20260401132148.2367-1-niranjan.hy@ti.com>
 <20260401132148.2367-2-niranjan.hy@ti.com>
 <f6b53407-1655-45fa-88c2-f7d348c78bc0@sirena.org.uk>
In-Reply-To: <f6b53407-1655-45fa-88c2-f7d348c78bc0@sirena.org.uk>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A0:EE_|DS0PR10MB6871:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a4d991e-cc2e-4964-44e9-08de93dc18bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|7416014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	olV9aCy71O9dvYrod8uXjT32MI4XqJZHLwU8MklzB0AuuoIaT4KAJYZy12vjkukSEb5TdHQjHnWfu62eYV7CC8R9dfJAyO9Xs88lTsoeDpns8D2qu1hp4HKcXI1ptuXu/rwvL6cIjiwKiqtVJ3iO6WiJBmsrnOBwODwmkZyzD8PHesLchh6Px2OU7fwDP44jjMk6JoNYGLdzEnUzNCalw4jqyLk7PSMRPx+WXRgvyKq6/ov2kQ8gZrHxHiNKkV3McT6VXMM+Ekwo0UobFl29FMgXu1Gm9ZVFTL8bHJbNvMTB6gCnsX/dM0ME89MiPjTvpJcPAgNNRgsazqcvb3DtfoA8jbtu5rcZGHujIM7HaAOj74eebT1bNMCK4kekL8DS86HZeDvUl2rZnmLW4slElVzhZeq9gMKHLlqa884Boi/Z+XmVi9DFYwDdCT0Q7CSLb2r7pbD8y7VBJ5EMv4PrMVgIMTvTPrlrW4G80vYF3vNSTfnImSYHrMnCwm6NCEWp6tkwm1xRIVFOJD9LoiW5crpSZSRISz5aoEM5kSufkPcM+AEDMy3/cJ4XeyQuyWoBC8FZiD5CcAD2O/mkvwOfzfQs9DHbPg2gAkYq9h3I9o5yck3cqdTdvQEY/ZTQllELUfGix6iVDcnEGEpf/Esn3n+GqkI3YMW/Dg96+Vk22qZN81k2yfHCNZyYSm05bx0vsCB0RWBU/6GBZic4TKcukIPHOY7kUCEz3nYXGXv6yRdTqxRSP4Z00KTQ7eFJJn65IrDqt53YOciR8pk6uFQiCA==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(7416014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ooxe8Xu+M4hVqzzeuckBWGyBxn+ZRg60zuVkeETUjmcfqn6Vc2weAQ+BgAswkHFS7JeGX5se1FFXRwS2JpPq9rimVUG+8Q53uMQcorMvmtYmWfWdpCxM4tbsqnqtf0sputoWeMiUrglTX7XxTa/QOWzFjAG3/34fY/erAg1Az1lYspHO3z0mXbTlDNF423JD8+PpH+LdWnSqX3U1hA5zHuh/PjPGUCnxipv6zTj7ElKKqTQhvCyOVjgYjEEbdgsmkotkZCADV1EEypv3ojPQdI1J9UVHTrE6s56iZXFBk0o9JIlOX5soes5csHnbsGSw0UjuH+81FE83V6rpabl08BhamyzM6tt93OORF9AfF00PvJxScdCzM81/TnNYL88EAwvQ+VMPUy6TBI4gy3jnYR7xoUnEIbNwWpDqAw9uj89Zr58+xtpZeWMlwzGFBNDC
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2026 12:57:44.9445
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a4d991e-cc2e-4964-44e9-08de93dc18bc
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6871

On 18:56-20260403, Mark Brown wrote:
Subject: Re: [PATCH v4 2/4] ASoC: tac5xx2-sdw: add soundwire based codec dr=
iver
> On Wed, Apr 01, 2026 at 06:51:46PM +0530, Niranjan H Y wrote:
>=20
> > +static int tac_interrupt_callback(struct sdw_slave *slave,
> > +				  struct sdw_slave_intr_status *status)
> > +{
> > +	struct tac5xx2_prv *tac_dev =3D dev_get_drvdata(&slave->dev);
> > +	struct device *dev =3D &slave->dev;
> > +	int ret =3D 0;
> > +	int btn_type =3D 0;
> > +	unsigned int sdca_int3;
> > +
>=20
> > +	ret =3D regmap_read(tac_dev->regmap, SDW_SCP_SDCA_INT3,
> &sdca_int3);
> > +	if (ret) {
> > +		dev_err(dev, "Failed to read SDCA_INT3: %d", ret);
> > +		return ret;
> > +	}
>=20
> Can an interrupt be generated during runtime suspend (or race with
> another thread doing a runtime suspend)?
sdw_handle_slave_alerts in drivers/soundwire/bus.c calls pm_runtime_get_syn=
c before
processing interrupts and only calls pm_runtime_put_autosuspend after the
.interrupt_callback completes. So device should be in resumed state before =
handling the alerts.

I will add protection here in next version.

Regards
Niranjan
