Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023137.outbound.protection.outlook.com [52.101.127.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4442A19ABAC
	for <linux-sound@vger.kernel.org>; Tue,  1 Jul 2025 06:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751351716; cv=fail; b=mnI8pOT/F5+Y4UhQ0NumvdDJdNUuGOXSEnssxLsd4s/Ekab7iSHTwa/S1rrG/K+tv0+yq/wA5G9j4Yji3oIcTlf6SZdNI5lzzXUuiW28SPFYMVTfXF2EwXDIeby0vZzMN3HKzhjogRst2NxNVAFvnAFxTSfdUYsdCNJRgvUA1rg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751351716; c=relaxed/simple;
	bh=ywwmMLXfB2ED2kAv8RWqYtdbEiFULcflKB6YzGfdOpY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lrWIifAh+ly/w1PwGlwb2Vthh9QWyZLOpIW2dBbjUHvFYnBWjLqaDsewPCGzk+RShasHcHt86MwuKlOFxu6wf8LrXr+9bmGN/mj+LB4EfGOmPIk5KqemVer6SQ8g74P1q8OQfa5JMDVY/McQgqODjXlIFF7Kml7Jv2mg9jDi+VE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.127.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wCRAxRMhnAJ2LgTM0L1GG5cjBbGT4ewx+puHca7hxRztZs9D1vepisMVXVprZ5GN2CQk2f7Lg598H/E6asOo4tzvQqMD7QZN8YXz81s6zve0PdV0UgsplSwa9GITEn2urswcVaOqasrWs63W8kUnN0L3oxhltxbiyA6Vid+dcJcLJZgBTLfjPcKdMMZfI9bPV/XsZztHA+8GQSCjSPu1lqS+dR+HQVi9uzRzhgoJKjeo7kQVJ3C7YFIOo40YxQAtKNtAbOI1zUpLaMfsS81funC9NRKraexGogZviq6zzqTTkabCGKIIVwtHLIs4EXqCyjrPd61NQYIKfnv9Em58uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JD4dvJ2+ng3mfIyVjE9kBLKLLO5v/APIg1qgd1k1cTo=;
 b=jIB9x7O7Ft9iC0zrGhAepStQvdLG9wGx4zzk4Ce6KWiu6KnVOW4d354ZQk/SQjYiRbvM2BQouyECui4rpWbM9jXzCEuw9NnT5fy5kGFba//RT9CFpR4w6wqzv2p2NgD7v2znw1l/EB5Lu24qyf2vs9Tczh3fEfODRyaNMOzMkR3ugPb5/auaLAFOopDkRv7RbX/fiV5D/vhkTWtOpFTUYkmB8CvsFDl0sqK5YJNi9zUFsg82jYbM3b0pStIR1TjcSV7dS888IuEMtgAJM3CZquzBh1XRFr5YuxvbYX4KWMYB5Eb8y29FFtl5evlXHFSxkK1fXuske2M/awowEJK7xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from SEYPR06MB6278.apcprd06.prod.outlook.com (2603:1096:101:143::5)
 by TYZPR06MB5049.apcprd06.prod.outlook.com (2603:1096:400:1ca::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Tue, 1 Jul
 2025 06:35:06 +0000
Received: from SEYPR06MB6278.apcprd06.prod.outlook.com
 ([fe80::637b:524b:8f70:e636]) by SEYPR06MB6278.apcprd06.prod.outlook.com
 ([fe80::637b:524b:8f70:e636%6]) with mapi id 15.20.8880.027; Tue, 1 Jul 2025
 06:35:05 +0000
From: "Joakim  Zhang" <joakim.zhang@cixtech.com>
To: Takashi Iwai <tiwai@suse.de>
CC: Kailang <kailang@realtek.com>, "perex@perex.cz" <perex@perex.cz>,
	"tiwai@suse.com" <tiwai@suse.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "chris.chiu@canonical.com"
	<chris.chiu@canonical.com>, Geans_chen <geans_chen@realsil.com.cn>
Subject: RE: [PATCH V1 4/4] ALSA: hda/realtek: fix mic jack detect failed on
 alc256
Thread-Topic: [PATCH V1 4/4] ALSA: hda/realtek: fix mic jack detect failed on
 alc256
Thread-Index:
 AQHb4L8rxhSHQ+JAvEa55JNlDRN3XLQL9+CAgAWmt4CAAA8EsIAAMEeAgAE/zaCAABzZAIABmbuQgAAnGgCAB7AeMIAAK3iAgAAHvGA=
Date: Tue, 1 Jul 2025 06:35:05 +0000
Message-ID:
 <SEYPR06MB6278B60285176A9B98ECB65F8241A@SEYPR06MB6278.apcprd06.prod.outlook.com>
References: <20250619020844.2974160-1-joakim.zhang@cixtech.com>
	<20250619020844.2974160-5-joakim.zhang@cixtech.com>
	<87a562wqzu.wl-tiwai@suse.de>	<431c41bd52224eb5ac341c9c24d52af1@realtek.com>
	<SEYPR06MB6278B03237E451616AC060E38278A@SEYPR06MB6278.apcprd06.prod.outlook.com>
	<abb90ebd8dab4cedbb831d4ad943bd56@realtek.com>
	<SEYPR06MB6278C26C6B0479C920FEB364827BA@SEYPR06MB6278.apcprd06.prod.outlook.com>
	<5f2431ca8ef2453daa9da2034798e682@realtek.com>
	<SEYPR06MB62788CE70E017CB5FD7F5317827AA@SEYPR06MB6278.apcprd06.prod.outlook.com>
	<a0d71d7f93a94800881c8c67c9e715f8@realtek.com>
	<SEYPR06MB62789527920A36FC01B665988241A@SEYPR06MB6278.apcprd06.prod.outlook.com>
 <87cyake9w0.wl-tiwai@suse.de>
In-Reply-To: <87cyake9w0.wl-tiwai@suse.de>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB6278:EE_|TYZPR06MB5049:EE_
x-ms-office365-filtering-correlation-id: 5ddcf66d-0f27-4b22-0800-08ddb8696ab1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?m2tus4oWkQv7VN8TBTev3z22bNMsO4nnTwl1mXB/5Xoh0cQyzeThksmmW/di?=
 =?us-ascii?Q?Ol/j2W2f7IofaLOtmCub0F2nctDk8qjqAa0XOz0Z1RdIpCbMYbpiNeHKlyl9?=
 =?us-ascii?Q?S8/PBrFkHdAk6IzW6sF89ELb7g3cKsspc21oxjZPk7uCoTD+MuADsjtZMYCq?=
 =?us-ascii?Q?+qPRcPV+gjb6g43NXPpCjizcnn/XojIVicKTlmDw3xEU5reUjXJQFjLdxrGJ?=
 =?us-ascii?Q?iOnAYOsapRz94Udk7YKxw9ZV2UJhOJuiicfw2R0WXXHT8qwWyNgC8ZoUoSDB?=
 =?us-ascii?Q?oToqpNBl4onXcszcUyuUXTVxa8WZ5qsVG2ixwuaMg1Q1xQrMrB+SqajLqAou?=
 =?us-ascii?Q?pI5IHU3cXuirUaRPMokgFS0Y/9MOE/0KdDs0R8JW5NTz4mmAo/5SrCWSLaAv?=
 =?us-ascii?Q?SPp7taj+j6Ezr84CxWbho530CbznCSjNG844xD1PpUPjnQICeMfFY4W3qaZ1?=
 =?us-ascii?Q?l7shsZDKrcScqhncMArXKyVHF0jwjTZSG2zzUXcbhopxRP+6bU3G380Om6XY?=
 =?us-ascii?Q?1VLNLyawMzpX/UlWH9/Of1eDxcAskZoFg6mdcDcr2OdiIcCJEkkHlbqWRwks?=
 =?us-ascii?Q?mnRTUXyd4F3blR7hslI16QknuhaQZA7jIXoopiZqAt80lt6E+vRl+HeQPhum?=
 =?us-ascii?Q?ojSpoZK9CXQtmvOX7sH+38307+0811TfskTI3WPWeI5s1ZoCLgX/icmwezYy?=
 =?us-ascii?Q?fMQZ+TqdXKW9JU7jmM+SZJsQj/4EhS7Mj55AgZsh9Net/OZXkFJeZhBIdpWf?=
 =?us-ascii?Q?pI9Q2+7cENGTk3Ym73HP6hJs/9+mkAL6R9UyNAnVhLAaI9MqtmWYz7uCK7YE?=
 =?us-ascii?Q?W0oL4nnsYGEOa7ZfjKF4NgXOE8WdwUfEg3UMKI9VH+UoHQjbK+PNDkfdOivU?=
 =?us-ascii?Q?Y+tgdu8M1jxqh5AHtQmeU+tv4Uda3Sa4C9SDzvR17ekOtM8AcsxId/2aIpRW?=
 =?us-ascii?Q?8R+XTrmou4BOdCuzldavQgorU/YZ/EfRty5M/h1OJh1BIK3WZveN4bVaP+vu?=
 =?us-ascii?Q?wo1vXVVA8VxWLG0COif++pyMDzzawECzNjWYHMihN7Jl8bXq9muNLkiC/6JO?=
 =?us-ascii?Q?6q18QecFU1CiNbvbvEU0ST8tG2Xvqa3yxMe/1LxwaF0/cQmN/6vEpJHlfek+?=
 =?us-ascii?Q?h8vhisK1G+TZ5b1xa+lWMRrkAOUqzwOgqF1X49dG+ns43BKAOVxW3Po7taLw?=
 =?us-ascii?Q?NiM8/fTYONCc/IUQhTFUxssD2jHj2SU9lnL29R6bEYMzpXTQXRzZ9KWhtg6q?=
 =?us-ascii?Q?zs8PqV/B84YdlMKtSNhPg01MP8lHWfyL63+gJ27+w3xnhnN2wr21ISmzTz+B?=
 =?us-ascii?Q?+mjcXbVvIisIJ77CBQ1B3sMeiYEYrqXFcAZVSrW/nCOVdhc0ee+ngsEwfGS1?=
 =?us-ascii?Q?1B6a/2NHJT1wUfPourwKdHl3E4gq2CfkDOQTpLrUgnbxuz8AHr8LCLLL+2b6?=
 =?us-ascii?Q?AmnqdqsusCZVMSQJpvfDcJLcZIaDg4bzfZQh0SfZL+Eqj2l8BDXcgw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB6278.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?VkWtaUcJPCxD2WtqpI9dkHrexM/f7Np0ggZ/Kxkv+QOvN9RqR/BjC7iA3dl9?=
 =?us-ascii?Q?HzYiNxHw0NxLTsatoQCceRcqWRP+lgN9DvE/4CzVPzlOVxRbBFZOlv8uUDUt?=
 =?us-ascii?Q?SzoHudFkShQDzUK3eqgmCcBkMS6CqjN2Rhyq6Fy6LAKxXo1X1TbBYpnwsFRa?=
 =?us-ascii?Q?l4BfRi7H1GxVbuRuGhRzLRSyNfDX8dWuH7esQ6aEQG0v9hwf/PdjKewergp4?=
 =?us-ascii?Q?blsc2Rikc8gyFU655NNos6CevpiXZOToIH/hwtKHRXn85EN59a49bezgqLtn?=
 =?us-ascii?Q?8BTqcHhxxbpURLSkksuxyuG26JjZRYdt9s27phlRyIYoO+A9BEtwH6X9+2T7?=
 =?us-ascii?Q?63aUzNAjV1tbCuOCZ0KQdrJXEYdLa+cBJ3848V2X6oHl4jXiDJeha+hHtOpW?=
 =?us-ascii?Q?DSzc6RTEB0k9dxKDeJjyRsw4Lu2+kpbTyS648QhlhfT5Ax9PZrlRvh6zVY9m?=
 =?us-ascii?Q?tA+p+2WNw1xF8lp42sNwYwLNffHVXnhHJTFyVcBJhl63xN4JFphen6Pzk+um?=
 =?us-ascii?Q?qFH8Jv8nqKdskv+dPLwIaNEtQcqT1hO6KHhZDuw7PeQ2uq0wLHYq3MOJXm36?=
 =?us-ascii?Q?G3eMUQnfI2hIawYEJs6EnhsilLdjHQuCZKv/bj4ddJ/4YccjCcKYju+h+REM?=
 =?us-ascii?Q?NEANcCpPr1Ep8SYO9NNbkS/lhZ+cBNIPOudsJ7+mjH1aWfPYSAnfovyGFHEp?=
 =?us-ascii?Q?k7qO06qteWMoyjVKpaIjHOgmxf9oXb2axQrqel/RAEjvxLPhXIhO0dck84Qs?=
 =?us-ascii?Q?1QdVurZI0qaqOjzwbewB+W1apTt1EDkbAC+nQxZbwzXYAylwghbAz+wWRi69?=
 =?us-ascii?Q?3PxCgILqAWZY474rcUkvgv0OsDfUTyQFzzoR0mNwlQZeg6Lw6nYqujiAMgjf?=
 =?us-ascii?Q?bDLYiWl4RoPqrvyOUPEwXrnACvs1uRuCC4FOr1OBrSwTcFvtPNUtditLliR+?=
 =?us-ascii?Q?Wn31YJdr1dTvRjJL4nijXv4Mo1STIlZtgz+TKV0Ah0X6ngrGAghYz+0Uxo8a?=
 =?us-ascii?Q?ivLK2L06trR9fsWRnNMzhyxmaz2+USfU8w1QPEw3+rEl7TYManKiaFJ4b0ii?=
 =?us-ascii?Q?wbPgKcAzF50a5BZYNYrc9nNc0KbW8D/jh226jktt9TTHBMCsOlDcJIwJL10n?=
 =?us-ascii?Q?XaPWEMIHzsJB2Dk8PVErDJ76uw75NlDPvkWJHaAYQc7UZfLvIruzeMH7E4Jy?=
 =?us-ascii?Q?YXOU16Z6arbCTNiGJ+CBwJ76p/sb122gWjFMcQvt78a6PSkAr0HF5E9EG2eK?=
 =?us-ascii?Q?OXI+FCWfuyPQL1okrkM5+kH4QcGEc00TJce0n3f+C9E4fUkZidYSn/ot2rJx?=
 =?us-ascii?Q?1P2ruUJvoXQEjH3WZAmiVY7N2CbLGElUO893dm8kup6DwKWdUrttcJ/kRdXR?=
 =?us-ascii?Q?mtPDvOwTEY6obIJeY1ECKKM+snmHbKblcq7/c8aDWy/+2vufxVpkjZWf5ewI?=
 =?us-ascii?Q?8fGbN7eHvcO/E4VhkXy8LnKzirMODP51p/VO79OseVFzRIljig2L6JLtsvDc?=
 =?us-ascii?Q?TIDSZ9y+Rg1ufxm4zPLnPx6dWJrJbzU7JLsX1TXJru5xX/fKmvj/RqW1Jemg?=
 =?us-ascii?Q?ftwA3Pns8JGQeB0NloqYiyMJOQWMJc5+YaBzeZh2?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR06MB6278.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ddcf66d-0f27-4b22-0800-08ddb8696ab1
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2025 06:35:05.7342
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dsnJ4yqvPsJfC2+Zdwb62KIs9ptlgmFWdyjgLETq4+2u+VJdgD3ltgEwj4ya6u3CErx2OzjK2qQ8I562l8ho2sM+XYAf64Xe3GQataCKucg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5049


Hello Takashi,

Thanks a lot for your help.

> > Hello Kailang,
> >
> > I'd like to insert another question through this. That would be appreci=
ated if
> you could have a look.
> >
> > After system boot, we can see the default mixer status as below:
> >
> > root@cix-localhost:~# amixer -c 0 contents
> > numid=3D14,iface=3DCARD,name=3D'Headphone Jack'
> >   ; type=3DBOOLEAN,access=3Dr-------,values=3D1
> >   : values=3Don
> > numid=3D12,iface=3DCARD,name=3D'Internal Mic Phantom Jack'
> >   ; type=3DBOOLEAN,access=3Dr-------,values=3D1
> >   : values=3Don
> > numid=3D13,iface=3DCARD,name=3D'Mic Jack'
> >   ; type=3DBOOLEAN,access=3Dr-------,values=3D1
> >   : values=3Don
> > numid=3D15,iface=3DCARD,name=3D'Speaker Phantom Jack'
> >   ; type=3DBOOLEAN,access=3Dr-------,values=3D1
> >   : values=3Don
> > numid=3D11,iface=3DMIXER,name=3D'Master Playback Switch'
> >   ; type=3DBOOLEAN,access=3Drw------,values=3D1
> >   : values=3Don
> > numid=3D10,iface=3DMIXER,name=3D'Master Playback Volume'
> >   ; type=3DINTEGER,access=3Drw---R--,values=3D1,min=3D0,max=3D87,step=
=3D0
> >   : values=3D60
> >   | dBscale-min=3D-65.25dB,step=3D0.75dB,mute=3D0
> > numid=3D2,iface=3DMIXER,name=3D'Headphone Playback Switch'
> >   ; type=3DBOOLEAN,access=3Drw------,values=3D2
> >   : values=3Don,on
> > numid=3D1,iface=3DMIXER,name=3D'Headphone Playback Volume'
> >   ; type=3DINTEGER,access=3Drw---R--,values=3D2,min=3D0,max=3D87,step=
=3D0
> >   : values=3D87,87
> >   | dBscale-min=3D-65.25dB,step=3D0.75dB,mute=3D0
> > numid=3D9,iface=3DMIXER,name=3D'Mic Boost Volume'
> >   ; type=3DINTEGER,access=3Drw---R--,values=3D2,min=3D0,max=3D3,step=3D=
0
> >   : values=3D0,0
> >   | dBscale-min=3D0.00dB,step=3D10.00dB,mute=3D0
> > numid=3D7,iface=3DMIXER,name=3D'Capture Switch'
> >   ; type=3DBOOLEAN,access=3Drw------,values=3D2
> >   : values=3Don,on
> > numid=3D6,iface=3DMIXER,name=3D'Capture Volume'
> >   ; type=3DINTEGER,access=3Drw---R--,values=3D2,min=3D0,max=3D63,step=
=3D0
> >   : values=3D39,39
> >   | dBscale-min=3D-17.25dB,step=3D0.75dB,mute=3D0
> > numid=3D5,iface=3DMIXER,name=3D'Auto-Mute Mode'
> >   ; type=3DENUMERATED,access=3Drw------,values=3D1,items=3D2
> >   ; Item #0 'Disabled'
> >   ; Item #1 'Enabled'
> >   : values=3D1
> > numid=3D8,iface=3DMIXER,name=3D'Internal Mic Boost Volume'
> >   ; type=3DINTEGER,access=3Drw---R--,values=3D2,min=3D0,max=3D3,step=3D=
0
> >   : values=3D0,0
> >   | dBscale-min=3D0.00dB,step=3D10.00dB,mute=3D0
> > numid=3D4,iface=3DMIXER,name=3D'Speaker Playback Switch'
> >   ; type=3DBOOLEAN,access=3Drw------,values=3D2
> >   : values=3Doff,off
> > numid=3D3,iface=3DMIXER,name=3D'Speaker Playback Volume'
> >   ; type=3DINTEGER,access=3Drw---R--,values=3D2,min=3D0,max=3D87,step=
=3D0
> >   : values=3D0,0
> >   | dBscale-min=3D-65.25dB,step=3D0.75dB,mute=3D0
> > numid=3D17,iface=3DPCM,name=3D'Capture Channel Map'
> >   ; type=3DINTEGER,access=3Dr----R--,values=3D2,min=3D0,max=3D36,step=
=3D0
> >   : values=3D0,0
> >   | container
> >     | chmap-fixed=3DFL,FR
> > numid=3D16,iface=3DPCM,name=3D'Playback Channel Map'
> >   ; type=3DINTEGER,access=3Dr----R--,values=3D2,min=3D0,max=3D36,step=
=3D0
> >   : values=3D0,0
> >   | container
> >     | chmap-fixed=3DFL,FR
> >
> > It can auto switch 'Headphone Playback Switch'/'Headphone Playback
> > Volume' and 'Speaker Playback Switch'/'Speaker Playback Volume', when
> > I plugin the headset or not, but I have not found the related logic, co=
uld you
> please help clarify a bit?
>=20
> Isn't it "Auto-Mute Mode"?  If it's set, the speaker is muted automatical=
ly
> when the headphone/headset jack is plugged by the kernel driver itself.

What strange is 'Auto-Mute Mode' would be disabled after headset plugin/out=
 several times, don' t know the reason....
However, it seems that speaker and headphone/headset still can auto switch.=
 Please see below mixer status.

root@cix-localhost:~# amixer -c 0 contents
numid=3D14,iface=3DCARD,name=3D'Headphone Jack'
  ; type=3DBOOLEAN,access=3Dr-------,values=3D1
  : values=3Don
numid=3D12,iface=3DCARD,name=3D'Internal Mic Phantom Jack'
  ; type=3DBOOLEAN,access=3Dr-------,values=3D1
  : values=3Don
numid=3D13,iface=3DCARD,name=3D'Mic Jack'
  ; type=3DBOOLEAN,access=3Dr-------,values=3D1
  : values=3Don
numid=3D15,iface=3DCARD,name=3D'Speaker Phantom Jack'
  ; type=3DBOOLEAN,access=3Dr-------,values=3D1
  : values=3Don
numid=3D11,iface=3DMIXER,name=3D'Master Playback Switch'
  ; type=3DBOOLEAN,access=3Drw------,values=3D1
  : values=3Don
numid=3D10,iface=3DMIXER,name=3D'Master Playback Volume'
  ; type=3DINTEGER,access=3Drw---R--,values=3D1,min=3D0,max=3D87,step=3D0
  : values=3D60
  | dBscale-min=3D-65.25dB,step=3D0.75dB,mute=3D0
numid=3D2,iface=3DMIXER,name=3D'Headphone Playback Switch'
  ; type=3DBOOLEAN,access=3Drw------,values=3D2
  : values=3Don,on
numid=3D1,iface=3DMIXER,name=3D'Headphone Playback Volume'
  ; type=3DINTEGER,access=3Drw---R--,values=3D2,min=3D0,max=3D87,step=3D0
  : values=3D87,87
  | dBscale-min=3D-65.25dB,step=3D0.75dB,mute=3D0
numid=3D9,iface=3DMIXER,name=3D'Mic Boost Volume'
  ; type=3DINTEGER,access=3Drw---R--,values=3D2,min=3D0,max=3D3,step=3D0
  : values=3D0,0
  | dBscale-min=3D0.00dB,step=3D10.00dB,mute=3D0
numid=3D7,iface=3DMIXER,name=3D'Capture Switch'
  ; type=3DBOOLEAN,access=3Drw------,values=3D2
  : values=3Don,on
numid=3D6,iface=3DMIXER,name=3D'Capture Volume'
  ; type=3DINTEGER,access=3Drw---R--,values=3D2,min=3D0,max=3D63,step=3D0
  : values=3D39,39
  | dBscale-min=3D-17.25dB,step=3D0.75dB,mute=3D0
numid=3D5,iface=3DMIXER,name=3D'Auto-Mute Mode'
  ; type=3DENUMERATED,access=3Drw------,values=3D1,items=3D2
  ; Item #0 'Disabled'
  ; Item #1 'Enabled'
  : values=3D0                                                             =
                                                                           =
                    // disabled
numid=3D8,iface=3DMIXER,name=3D'Internal Mic Boost Volume'
  ; type=3DINTEGER,access=3Drw---R--,values=3D2,min=3D0,max=3D3,step=3D0
  : values=3D0,0
  | dBscale-min=3D0.00dB,step=3D10.00dB,mute=3D0
numid=3D4,iface=3DMIXER,name=3D'Speaker Playback Switch'
  ; type=3DBOOLEAN,access=3Drw------,values=3D2
  : values=3Doff,off
numid=3D3,iface=3DMIXER,name=3D'Speaker Playback Volume'
  ; type=3DINTEGER,access=3Drw---R--,values=3D2,min=3D0,max=3D87,step=3D0
  : values=3D0,0
  | dBscale-min=3D-65.25dB,step=3D0.75dB,mute=3D0
numid=3D17,iface=3DPCM,name=3D'Capture Channel Map'
  ; type=3DINTEGER,access=3Dr----R--,values=3D2,min=3D0,max=3D36,step=3D0
  : values=3D0,0
  | container
    | chmap-fixed=3DFL,FR
numid=3D16,iface=3DPCM,name=3D'Playback Channel Map'
  ; type=3DINTEGER,access=3Dr----R--,values=3D2,min=3D0,max=3D36,step=3D0
  : values=3D0,0
  | container
    | chmap-fixed=3DFL,FR



root@cix-localhost:~# amixer -c 0 contents
numid=3D14,iface=3DCARD,name=3D'Headphone Jack'
  ; type=3DBOOLEAN,access=3Dr-------,values=3D1
  : values=3Doff
numid=3D12,iface=3DCARD,name=3D'Internal Mic Phantom Jack'
  ; type=3DBOOLEAN,access=3Dr-------,values=3D1
  : values=3Don
numid=3D13,iface=3DCARD,name=3D'Mic Jack'
  ; type=3DBOOLEAN,access=3Dr-------,values=3D1
  : values=3Doff
numid=3D15,iface=3DCARD,name=3D'Speaker Phantom Jack'
  ; type=3DBOOLEAN,access=3Dr-------,values=3D1
  : values=3Don
numid=3D11,iface=3DMIXER,name=3D'Master Playback Switch'
  ; type=3DBOOLEAN,access=3Drw------,values=3D1
  : values=3Don
numid=3D10,iface=3DMIXER,name=3D'Master Playback Volume'
  ; type=3DINTEGER,access=3Drw---R--,values=3D1,min=3D0,max=3D87,step=3D0
  : values=3D60
  | dBscale-min=3D-65.25dB,step=3D0.75dB,mute=3D0
numid=3D2,iface=3DMIXER,name=3D'Headphone Playback Switch'
  ; type=3DBOOLEAN,access=3Drw------,values=3D2
  : values=3Doff,off
numid=3D1,iface=3DMIXER,name=3D'Headphone Playback Volume'
  ; type=3DINTEGER,access=3Drw---R--,values=3D2,min=3D0,max=3D87,step=3D0
  : values=3D0,0
  | dBscale-min=3D-65.25dB,step=3D0.75dB,mute=3D0
numid=3D9,iface=3DMIXER,name=3D'Mic Boost Volume'
  ; type=3DINTEGER,access=3Drw---R--,values=3D2,min=3D0,max=3D3,step=3D0
  : values=3D0,0
  | dBscale-min=3D0.00dB,step=3D10.00dB,mute=3D0
numid=3D7,iface=3DMIXER,name=3D'Capture Switch'
  ; type=3DBOOLEAN,access=3Drw------,values=3D2
  : values=3Don,on
numid=3D6,iface=3DMIXER,name=3D'Capture Volume'
  ; type=3DINTEGER,access=3Drw---R--,values=3D2,min=3D0,max=3D63,step=3D0
  : values=3D39,39
  | dBscale-min=3D-17.25dB,step=3D0.75dB,mute=3D0
numid=3D5,iface=3DMIXER,name=3D'Auto-Mute Mode'
  ; type=3DENUMERATED,access=3Drw------,values=3D1,items=3D2
  ; Item #0 'Disabled'
  ; Item #1 'Enabled'
  : values=3D0                                                             =
                             // disabled
numid=3D8,iface=3DMIXER,name=3D'Internal Mic Boost Volume'
  ; type=3DINTEGER,access=3Drw---R--,values=3D2,min=3D0,max=3D3,step=3D0
  : values=3D0,0
  | dBscale-min=3D0.00dB,step=3D10.00dB,mute=3D0
numid=3D4,iface=3DMIXER,name=3D'Speaker Playback Switch'
  ; type=3DBOOLEAN,access=3Drw------,values=3D2
  : values=3Don,on
numid=3D3,iface=3DMIXER,name=3D'Speaker Playback Volume'
  ; type=3DINTEGER,access=3Drw---R--,values=3D2,min=3D0,max=3D87,step=3D0
  : values=3D87,87
  | dBscale-min=3D-65.25dB,step=3D0.75dB,mute=3D0
numid=3D17,iface=3DPCM,name=3D'Capture Channel Map'
  ; type=3DINTEGER,access=3Dr----R--,values=3D2,min=3D0,max=3D36,step=3D0
  : values=3D0,0
  | container
    | chmap-fixed=3DFL,FR
numid=3D16,iface=3DPCM,name=3D'Playback Channel Map'
  ; type=3DINTEGER,access=3Dr----R--,values=3D2,min=3D0,max=3D36,step=3D0
  : values=3D0,0
  | container
    | chmap-fixed=3DFL,FR
