Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010053.outbound.protection.outlook.com [52.101.85.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFD733A713;
	Wed,  1 Apr 2026 02:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775012102; cv=fail; b=EBsNaRaK7xy5uAJP3GD6aN/sPs+qmFkMey5nNEiPgnWaBG0wZamWB6bj/3RA/6JW2w75Nz7N+PeH3KzMpECTJEG7jq0n4U3ANJDwjMxg5FrZhPAhGKG3oGWQ47JPYw35k/8S7HsqneiMSveeM7PDGQbvcLVpl6fZuRrAva54ubM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775012102; c=relaxed/simple;
	bh=aGa0AgVq6wIYIY3Rm5wQ3p4BrYDZjlhH8qYhP5zZDIc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ddQYFZ/G5E+rfX8qXtjQYKDgBiCndMXnfvmLCw/TvQ16B6fBNaCMht0qmejfDk10BoN0oxHS9aoKWxiGNOD1vYUpTfw3A/wxW8XA7Y0vIeYRApFYiKMN2YQmn1Ij0bWC2mc5a89p+hHZcX/6u312WhiCcgT3AFmlQjpUpJ3x7QE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=b3zRXW59; arc=fail smtp.client-ip=52.101.85.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="b3zRXW59"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AUcjQsR2xQXm8t8tf7DBYYTN/G9Dp7wC69ZitJsWEPIHpn1SZf7d7dXoHyEkQc8viCsJsXsN7xUAxBS1v6KSKL3TGIZfkSBOqN11Q9DD6QOrIBmsDU2Lce7RqWg61LtRpZQsA3PEls6jfDJeSlUBhFPGP4t69vm1zWK9RQhJDe7hh5zK8zIRX7v2VgWmJJDIBfQZon5qX8VZcmta4YYVYseSTpaeHEeS2Ik/SjfvjU/bo+FGNEkVodYsj5qBufP+xXTavzlMAlq53/E8TDk0z5OIVMGxX3c5efDmpiifYwUsE4CeGur5FaQZURUZknpwROcbPhod70oFNQ1Z8l1X0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J+X0iTT1fLeRZpIRgZoenpqpcK8Wg3XJFoztsWH2/qg=;
 b=W4yuCbti2mgxth7J6DuYHXRioMWzDLHSX0Y+5iwJKdqUJ5wdqdMda8AqscXDVcDNrx1GI3dVSEZ1E7NabH/TiSaX/XJ4ch093a83Mo8+UI3k8ujqoKerxIw3mSGhmY9pIJRWm05yM4olbKFWC0cKvWf4lSCo6iF2bQDBddb6dUIJFPBqSoi8cc6KgdX2mriDBR4EOiUW/ej8oYrHe1J1R2J0HJ8LEvyLL73jRiBjVFXGnII26q19LA+dRXEtXSMOPDi5r17IEJP10baLLT5RfZZGKYUJkyqY1jPDX6G3aq2DbTIhzES0lqxqmSZi9hBNC6IPZu7lk9T325q60ngjtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J+X0iTT1fLeRZpIRgZoenpqpcK8Wg3XJFoztsWH2/qg=;
 b=b3zRXW59YFKeiUQgS2jh3CbMtTQeG9N6EAXV0EJFDQSrAj/kMc+YJqGLzYss9RB8RtxlMmytJXi9FvTOhUDr1gS+TUJ2kgJ1STU6XbplBmxERSuWIxmRpmt4xC6jMB5BuI/pTddgDnO7SjqpIyrf2Agvh8jJRreRdcWdLXNkwNw=
Received: from BL1P222CA0013.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:2c7::18)
 by SJ0PR10MB6351.namprd10.prod.outlook.com (2603:10b6:a03:479::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Wed, 1 Apr
 2026 02:53:38 +0000
Received: from MN1PEPF0000ECDB.namprd02.prod.outlook.com
 (2603:10b6:208:2c7:cafe::61) by BL1P222CA0013.outlook.office365.com
 (2603:10b6:208:2c7::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.29 via Frontend Transport; Wed,
 1 Apr 2026 02:53:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 MN1PEPF0000ECDB.mail.protection.outlook.com (10.167.242.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 1 Apr 2026 02:53:37 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 31 Mar
 2026 21:53:36 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 31 Mar
 2026 21:53:36 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 31 Mar 2026 21:53:36 -0500
Received: from [128.247.81.246] (mz02jj9v.dhcp.ti.com [128.247.81.246])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6312raV33441292;
	Tue, 31 Mar 2026 21:53:36 -0500
Message-ID: <2ad3a6a4-34a1-4ef8-8308-77d023127783@ti.com>
Date: Tue, 31 Mar 2026 21:53:36 -0500
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/4] ASoC: Add TAS675x quad-channel Class-D amplifier
 driver
To: <linux-sound@vger.kernel.org>
CC: <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<perex@perex.cz>, <tiwai@suse.com>, <shenghao-ding@ti.com>,
	<kevin-lu@ti.com>, <baojun.xu@ti.com>, <niranjan.hy@ti.com>,
	<l-badrinarayanan@ti.com>, <devarsht@ti.com>, <v-singh1@ti.com>,
	<linux-kernel@vger.kernel.org>
References: <20260401024210.28542-1-sen@ti.com>
Content-Language: en-US
From: Sen Wang <sen@ti.com>
In-Reply-To: <20260401024210.28542-1-sen@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECDB:EE_|SJ0PR10MB6351:EE_
X-MS-Office365-Filtering-Correlation-Id: bc13dcc0-aa48-48a7-2f75-08de8f99df77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|7416014|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	XCqfBm5C63scSlsMyot9h7kI5zYRaaXosFj7VycrjbyEHLcArsyVldqr9llMQn+OeV8ZphT7P/w8bCsdzedU5RLC0zOC2ZsWTbwaAsb99coyQ8/IxrXSp4POr2KxirCnwBojvDbt3U83rFquJC8enlguwRrKYGVm/A7OhCN3el8B2fNL7cp6Y8m/VZkDdhR7s261FTWp1dTBCOWZFYPBk6AnglnBjkCoNrMEwcSKeGQLY+RbN3mxBqBS6DO8QVBqRDdrS5PvqWLTPUvL8vSemP6kC1syx2+XTmPPBCQOm4u1j2r9sjLoRRu8c74k0AL/1MqanMMUxs+CySP1YlY/iTqMc/UJUaerda7ZMoUxqpxuoJQnKMNdX7l/yjwNcdnqB52DthygUIuW0vJmL8pFbwD+T7KAwZ3CiD0rEZy4kemIcUimdsd5OFtdn+SGJ2nu5fBlUO07/UOmGo9wNmt4tApXVK2gmPhLv9WTKbQ3+vu1jSFjqTxKrM6FtZqI6i5ujUXBH8D4UtaU+EdRIUzajb/4m6CwnRfIHRDOU3oWVOt65AkS8WGtmDo6DxtkSDlB5HZDAY2iHidi4f9Q4rS4tzk+DZSl+Q0B3e1D6BjuPX1csc+qrlEcnD3flb0b9xB3E+FvJIF4pJaxPTqOWFUXJ614l3HZUI+RNlTJWSmAGtsk6ZMOuV6LPacdVLHM3oe5k3h8Yp61M2Nz1BiRP+VI4xlEbl+n8c5QV8xv1Z+73hzkrORvppoTkey/8C5yAlG+0ZCgVj5RPOueFgIyHWMX/Q==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(7416014)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gsYTpYY26zfGK0ca4lHrRoAXNffOFJjwwLUsWbtxkh3XYLnTuNJQC+90zllN10fF6QfllirVXDR1+/oIH0m05cXkq6EwaPC8Fqp22qbMvfJPu6Tn3elAh1MbjBVQbTR1OZR4hWsFsHYcrbsiEcCpnV1gDGaWX34pQwcH3HYHdJSEWlccG2Tr51uqpb6daWJO9MDXWtMQkkzIE3LkMjv0239qSTCCY4oj+dRu6RPJhEVSb/vime38rIpHHMRYwuyvSEPKJjHFb0v3drD1bYBy7gmKkBI+VG1T8j5CX38vaEvDmjUHfwr5n/evUepHmzPxdAe8KE26DYSGi05lwhR9rA2MRhf8b8viZyDknj+B4QjbcVu4VaCiArJT1ldgFOisLpYzzeNsGokRTTZZlCSmmmSeM3+Af5BNiDj1JwqspUaSdkvIMa83gVfoDPZt58vc
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 02:53:37.3890
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc13dcc0-aa48-48a7-2f75-08de8f99df77
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECDB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB6351

On 3/31/26 21:42, Sen Wang wrote:

Apologies, the RFC tag was included by mistake. This is a proper 
upstream submission, please kindly ignore the RFC tag.

> This series adds support for the TI TAS675x (TAS6754, TAS67524)
> quad-channel automotive Class-D amplifiers. The devices have an
> integrated DSP and load diagnostics, and are controlled over I2C.
> 
> Patch 1 adds the dt-binding, patch 2 the codec driver, patch 3 the
> ALSA mixer controls documentation, and patch 4 adds the MAINTAINERS
> entry.
> 
> Tested on AM62D-EVM with a TAS67CD-AEC daughter card, on setups &
> test procedures, refer to the Github repository.
> 
> GitHub: https://github.com/SenWang125/tas67-linux
> 
> Sen Wang (4):
>    dt-bindings: sound: Add ti,tas675x
>    ASoC: codecs: Add TAS675x quad-channel audio amplifier driver
>    Documentation: sound: Add TAS675x codec mixer controls documentation
>    MAINTAINERS: add entry for TAS675x audio amplifier
> 
>   .../devicetree/bindings/sound/ti,tas675x.yaml |  278 +++
>   Documentation/sound/codecs/index.rst          |    1 +
>   Documentation/sound/codecs/tas675x.rst        |  618 +++++
>   MAINTAINERS                                   |    4 +
>   sound/soc/codecs/Kconfig                      |   12 +
>   sound/soc/codecs/Makefile                     |    2 +
>   sound/soc/codecs/tas675x.c                    | 2172 +++++++++++++++++
>   sound/soc/codecs/tas675x.h                    |  367 +++
>   8 files changed, 3454 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/sound/ti,tas675x.yaml
>   create mode 100644 Documentation/sound/codecs/tas675x.rst
>   create mode 100644 sound/soc/codecs/tas675x.c
>   create mode 100644 sound/soc/codecs/tas675x.h
> 

