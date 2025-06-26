Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023077.outbound.protection.outlook.com [40.107.44.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3731BC9F4
	for <linux-sound@vger.kernel.org>; Thu, 26 Jun 2025 03:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750909496; cv=fail; b=BpbzhE5oiwM91jBcWFlR9Ot3QRg9m8PK0OEIbZNTpWXoS/ssgyniU36J9pWXptrlMvsrCxt8zSq/a+s/7ooime3obwKTWesvmL+g+lA9V7saDo0KL+hndB46eP95jEz0JXmlxdUyBpyICqJVpA/pnTZ5KqKuQBxol/XV3XPixJk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750909496; c=relaxed/simple;
	bh=RkjRVzMZdQ210GQHqylaTXhwvarKg4pvD7/NjcXuv5U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nwEMzt0+WISJ9U2g7vvRUSBEx0wkRmIqoQKT+b2WrGCDugKn+LMQcN8kETGkRC7WHeW3M/77QQJP35oUPCc/Dp21LELNFk/r65JLlUCx7pnHrtBTVxOdJ22Y3aYh12eJpBZej/h+o4aXh3BYtuD2VTkvhSIRTpdgoxXV3z2cwpo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.44.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cc2j5IirlmzYMXYY9nYDMrKEN73I8bgC5OX/FrVcxnv9fGWMnf4uwHvGCmxGoKq5scI291MkwQQyPb4Q58dSvMQFjGJvLjWocr3wNnoTk7zVGf1FKz54s4aSm1AS7sPS/0SeBttfUhx78ZC8e8RVw1KSaDCkBZc83lxIPK0MR5SCmoNdzIgozWCNt4w17K2nN7oaeOUhEwnKC/MU54Bqjch1x8WBt0fLa/smR1DzfNcu0kps0iHLMOJZgJls2qiAJN38KpIRpT37MoSdQriMzxjmP0dJx0O+kEdl+U72Lt6vFPzKTmHO8kpPRo70VeX1hQzUc378KwVatzOkT/+CyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RkjRVzMZdQ210GQHqylaTXhwvarKg4pvD7/NjcXuv5U=;
 b=XqZvpJc4sEleRXaFGkPVB1U0alTME65aGpyyk3CInKsxpGYsNvBf29X1pUpcS+ly/bnW8whz6yQ7vAwGs856HgPLePE3Vl3Z+Ipx262N5T+znj0jheE7aS4cpE1L9rEv1q/halOOH3R6Wemnh1ostLeLvKXOyCxBxhZDvZ5qe+tn054QI7f+t01G012ieg+ws09VPiXHgCwW7yUPhJwcvz5HYIL/8DW+XMBs4jgJEu99Mik5RnZ48LEMUUaFM9o5ac2YPQOHuHFTp1n0lR/wmxYfZCjnydb+NkFoNPl9qal+BlRDuDOT89xhAqqYsPt5aNQ5vahyccKz6lz2Sq4WHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from SEYPR06MB6278.apcprd06.prod.outlook.com (2603:1096:101:143::5)
 by TYZPR06MB6955.apcprd06.prod.outlook.com (2603:1096:405:40::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Thu, 26 Jun
 2025 03:44:47 +0000
Received: from SEYPR06MB6278.apcprd06.prod.outlook.com
 ([fe80::637b:524b:8f70:e636]) by SEYPR06MB6278.apcprd06.prod.outlook.com
 ([fe80::637b:524b:8f70:e636%6]) with mapi id 15.20.8857.026; Thu, 26 Jun 2025
 03:44:46 +0000
From: "Joakim  Zhang" <joakim.zhang@cixtech.com>
To: Kailang <kailang@realtek.com>, Takashi Iwai <tiwai@suse.de>
CC: "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"chris.chiu@canonical.com" <chris.chiu@canonical.com>, Geans_chen
	<geans_chen@realsil.com.cn>, cix-kernel-upstream
	<cix-kernel-upstream@cixtech.com>
Subject: RE: [PATCH V1 4/4] ALSA: hda/realtek: fix mic jack detect failed on
 alc256
Thread-Topic: [PATCH V1 4/4] ALSA: hda/realtek: fix mic jack detect failed on
 alc256
Thread-Index:
 AQHb4L8rxhSHQ+JAvEa55JNlDRN3XLQL9+CAgAWmt4CAAA8EsIAAMEeAgAE/zaCAABzZAIABmbuQ
Date: Thu, 26 Jun 2025 03:44:46 +0000
Message-ID:
 <SEYPR06MB62788CE70E017CB5FD7F5317827AA@SEYPR06MB6278.apcprd06.prod.outlook.com>
References: <20250619020844.2974160-1-joakim.zhang@cixtech.com>
	<20250619020844.2974160-5-joakim.zhang@cixtech.com>
 <87a562wqzu.wl-tiwai@suse.de> <431c41bd52224eb5ac341c9c24d52af1@realtek.com>
 <SEYPR06MB6278B03237E451616AC060E38278A@SEYPR06MB6278.apcprd06.prod.outlook.com>
 <abb90ebd8dab4cedbb831d4ad943bd56@realtek.com>
 <SEYPR06MB6278C26C6B0479C920FEB364827BA@SEYPR06MB6278.apcprd06.prod.outlook.com>
 <5f2431ca8ef2453daa9da2034798e682@realtek.com>
In-Reply-To: <5f2431ca8ef2453daa9da2034798e682@realtek.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB6278:EE_|TYZPR06MB6955:EE_
x-ms-office365-filtering-correlation-id: 885c58ef-dbd5-4482-7581-08ddb463cbbd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|7053199007|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?7KOMxOOr9vGyrHsHFsadi0AwS3H/4CqCrSz/GwvJ5gFM42TaRQxwYVOzq8Eu?=
 =?us-ascii?Q?rsaAgnulsbGixvTcNFmXCqqnmf8UasYvnOb9XL3WBZHLXx9CKP/0g3w3cTcm?=
 =?us-ascii?Q?6wwem3OAHL2RcRvZBnSsrjpUW5XMhvQwUKaL5KYbB7gcqk+DkOLgW7ZhZ2Sc?=
 =?us-ascii?Q?cSyQiGq1aVjHNONMiO/BVY2zD5TyXGhxXg8M+xEil8v/4hjrHGsCMTMASaiP?=
 =?us-ascii?Q?Wpy0xorUxWZMGZdfAbD449tXugAAh6xGXQPWgcxmOKrGTY2g5McrUUC9gj41?=
 =?us-ascii?Q?PCukIphWDEoreklS3Rao1WSJqixg1S3LgTqb3v15pJbG9vlbjvT+aOErDrAX?=
 =?us-ascii?Q?AWIJVZtO25sj4sUNfx9vPcfvmIjKDUF24uEhB95q2m4wWCP3anQcuq8/e19N?=
 =?us-ascii?Q?E5yg4KrSmrvenui514j7K4SY49i62SrzFp3UVGTf2BKEzPL9XoSM1mRut6gI?=
 =?us-ascii?Q?cROVS+Ol0S/L/RhGRGnuqny6tlam+Y5itxQpWpUa560JONK4PDGjMFS78N/l?=
 =?us-ascii?Q?Na7ed1z4Qnx3G7wG+eUeTKudriFLL/OSlrH7xTO6tg6o9nAOLIFJv+M1UqzL?=
 =?us-ascii?Q?7k0UkKXmoEU4dQK5aWPkzhqTuAZQu8yElb9oRW4EZdXccD9FWSrL8CXAMR+s?=
 =?us-ascii?Q?SVXFzFeP5UL6iRlNwxikYwU6rtb71sOYfcV/89kAB1R81dLerkBgzn2Pkqz9?=
 =?us-ascii?Q?x6nTIpsc/cZgcDhFqG6HsDv7kgl2JL+UThNRbEBf4kJEfIq7a/p9Xifxh8rk?=
 =?us-ascii?Q?8OzHs2dbF0vrSsLwgneI9BKLuXGJUIHRNbtF2TgadsVo+RQPfw7/FrEdJbWb?=
 =?us-ascii?Q?2j06TM9NHtD2CMquseezRLEaze+e+Sr94EU9hAhfF605/acWTKigKn7O4b5b?=
 =?us-ascii?Q?BuxkxAP3J5iaSbp3xhp70p35GhRTOhaOW9i5UPrFlBpo5FvYAuPrMXZY2MqL?=
 =?us-ascii?Q?sh4Y7pKuonYTpf9SHimfpW/D9Dyy/Z8+5JCrWtJ0vCvOtznnRBp9jg2MwgQ2?=
 =?us-ascii?Q?6D/hATWWjep6SF4jY3jS0aJnOHKXwy7wUhskYbHKb/q28vpR8KR8DqPe/Uy0?=
 =?us-ascii?Q?Bmk+DxKaViy3VYJbR2/M40ssXdhKEaOp6GuNGjLHC3u6OiyCxY2AIuCmZDA6?=
 =?us-ascii?Q?XkykBBJXwKHa8DzzdfrbYbq3q/yksWkz368y82NlMU6c0FpvRAgEuPhm9rJX?=
 =?us-ascii?Q?8aW05nOCtWDpC2uH1Ier2cWUtiTvneeqOvwdOsJiYCHY+aEF1KAWchGXbvb8?=
 =?us-ascii?Q?WSTNVM3og0sR+xNrmcOH4H6fifLSdPbbPW+ge5MEw5C1SfASrctv+Eezn8nE?=
 =?us-ascii?Q?zgDdztLf5CJDlO0t/Lcn7bWgtrenMTsEppdW3yh2WXkg654nlgg/S8RUnlP5?=
 =?us-ascii?Q?PpMsyOIvxjwvMVCrz95MdQw1VXyOgV/8Xe9zLoFoiyXUjXyoUJlHO+MMFOUi?=
 =?us-ascii?Q?DgpHWgkhcEeoWGV0ZGyHxfq78oaxB7FM77CIrNSMY0R3x/v+bA/wJA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB6278.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?xQa5HE2CAQM4DmMt6SKCQwY5Z6YRNmRkZ/99DZMD3iM9urutZVva42nF4svP?=
 =?us-ascii?Q?g5RIEwQoDntB9oAC7SFn1pHPBHu9Oo4by+eMyEWNQdDooA24pjEaglsMnvOU?=
 =?us-ascii?Q?UO53N8uTYFx7zGEwOcl2WZKgwwUnVZoRipjm0+5UjvCZZxcN5ajur5GBh+nG?=
 =?us-ascii?Q?WbbmyYGq/ypUt/uJXv/kn/bKxSgQgq/G2vrULWsWRmpur8HtvO3Hp1vmc+Zu?=
 =?us-ascii?Q?8KSdCXBYlz+Ac+wqZ+qb3noHOK5OpSSPsj6f+j7JktRZ8WZUhi8qRmwIVE75?=
 =?us-ascii?Q?H6KCF0t1vmCmdLoMMPYGpcEuWKgcX6PGWq2hKNJB6Y2Hw69txCVfydUZkrJq?=
 =?us-ascii?Q?8l9IiGibxZLnCkg3j2AsEw0FZy/LEiIiYHNN+k7heDPj0JBfTsHMtqlGneQZ?=
 =?us-ascii?Q?FAwjmQfJFc9ujOI7hon0XmsxHfRGs7AtkTMpdqObGGDdfFmhCSvEICqDMH07?=
 =?us-ascii?Q?k+qwj4RM2YYr4s11kpZmyI83AujVAc3wyjfVFz9mwkgmkwrELmliiIhIX2SE?=
 =?us-ascii?Q?hCmFw04uLfFjpGyX7aK+Wxj/XXxYHE/nnjVrBWgdLU015UNmOWvG9aKIjqJb?=
 =?us-ascii?Q?73p4RpPo7YpTQ/p3C/uARDXvjZAcYj1t0HHtR+5i1z2ItB9fXxBtVrCYpwWa?=
 =?us-ascii?Q?0a2xDqf0MrgAYuJxpIsKPC0DyNHcsJNwbSYZvyf3o9ul+R4yMZFOBql/eRsF?=
 =?us-ascii?Q?ABscWjTGkOTtoWaurtKVH4JaH2JUNL7BpykKDKNsbJ9XABYVkrhqEUXk7A4B?=
 =?us-ascii?Q?jsNJjHbxPj3JUvVkXo5H7D/WUwb09ikCob8MytVALqmC+f/mAIr630aYGuRB?=
 =?us-ascii?Q?wN3PcFnratW/lLL8dDyq0j+T7kBsj4sIGxiGLkla+1AuS8ivubADwaT5QxBp?=
 =?us-ascii?Q?y+BwVNyJ4X+zuWSOxy+piIPNo+hgrbmqGczyae/eBclPD0wazh5iHBj3n5mg?=
 =?us-ascii?Q?PBhpIDv4M/FWx8JMeQB+0rIo2dLJMQGLtkNua+dAs3Zzlvnl/zjZjX87bWEf?=
 =?us-ascii?Q?N4JcmKDDhXXs9TYgmoeXw68rwUGBfpozhi6/sEWdLA0KY1E91eLFY/rD9oXF?=
 =?us-ascii?Q?3GtHts6Ww8xAmqZC/8twb6eaykYzd0TvW8Dxo6F+K1yldhrzOnibxecHWtyY?=
 =?us-ascii?Q?sFSGRUVxg4ntpm4CJ/xQfXBHPK/7IxjhBGXeepzkGnO+4O2UBFjMJ4MyCdYC?=
 =?us-ascii?Q?UiSdK3ZBFNeEfOMjyHxuyiy9CCgpzT54tH2yCWtW6RSutc3oXajxtSxuh4qS?=
 =?us-ascii?Q?EzOfpJuvWltBKCh6l3KCUylhvgCWjzs7mUoBoXo8b8d2knbC0qUX2s8qqAnt?=
 =?us-ascii?Q?lzyVt+fWlEOUjNq3uJ902lsRGybfTduoZixYngj0axXzaJGmjGfoiJkZgE84?=
 =?us-ascii?Q?aWn1G6IovYXiBNQwlUxgj2RULyBmb0VA3B4gJM9JGLZ5QTiDcfYlylonJjfr?=
 =?us-ascii?Q?DOvaC5yU2E7L32X/kIv4xY9zxOF9lUUSD7gFF3mmQOWlNTbo4Z3JvSwka08P?=
 =?us-ascii?Q?J+eF0YiuOT31d+gCYShtWyD1Z444RZWFatJvSIhbmRAl14DkfrGEFsa4dWZB?=
 =?us-ascii?Q?5lpgoHjhUY/wcj6e8BNnmwy7zqEr3jT1NENHy4uc?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 885c58ef-dbd5-4482-7581-08ddb463cbbd
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2025 03:44:46.9390
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MI5jNKU1WdiQLYN8WAe8vl2QkGhEza90bHuqmYEocmJrCwoB8hNL0lON/66IpconZlCMl92AHk9U1v8/yMDw9EJwe+kSxcLjj+YcObyWyN4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6955


Hello Kailang,

> -----Original Message-----
> From: Kailang <kailang@realtek.com>
> Sent: Wednesday, June 25, 2025 11:06 AM
> To: Joakim Zhang <joakim.zhang@cixtech.com>; Takashi Iwai <tiwai@suse.de>
> Cc: perex@perex.cz; tiwai@suse.com; linux-sound@vger.kernel.org;
> chris.chiu@canonical.com; Geans_chen <geans_chen@realsil.com.cn>; cix-
> kernel-upstream <cix-kernel-upstream@cixtech.com>
> Subject: RE: [PATCH V1 4/4] ALSA: hda/realtek: fix mic jack detect failed=
 on
> alc256
>=20
>=20
> Maybe your platform need to set spec->en_3kpull_low to false.
> If spec->en_3kpull_low =3D false will help you to get MIC JD.

Yes, but don't know what exact hardware design makes this difference, do yo=
u know it?

Indeed, it's better to add a board fixup, please ignore this patch, will up=
stream later after hda controller upstreamed.

Joakim
