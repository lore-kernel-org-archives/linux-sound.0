Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011004.outbound.protection.outlook.com [52.101.125.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382ED2DF156;
	Mon,  9 Mar 2026 23:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773098061; cv=fail; b=WhZ+j+vTCEvMlJKZ4b8fFlRdp3d6ErpxS6hDMYZ/6PuCzQDyYej84lJJm64iJJ3NBoM2NQr/9qODssCrV/n5jXljGXYXWCZsXSEE9102k2AOkH3ZfxxHzBvtFagOwEuT/kDvEb3gAzMlFm8buUFStLBCOxPS/UU/ClF0NGzAj4Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773098061; c=relaxed/simple;
	bh=P2jFoewbmP75HlzrM7wC2B7CAdwyZ3iVOmU6alxa7jk=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=LGpHJojGc5sUOjSqt9bV4EUJ7ZS+/NVrsEHuaOclIc0aKPRUNB2hM6HCYfGamcQbwLeZ+JrdAI52KT87MfG1IXISWg+OcU/6/9+AgSuKlDuIeqZLP6RatqQe5NiHHPnIxX4XvEYG8GaWq3N3hpklWvgEmXFQlB0JnYN4tZwNfy4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=plh5w1z3; arc=fail smtp.client-ip=52.101.125.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="plh5w1z3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sX2C/jBJxrvq/r0DvNzhvQ6PIg2MMuAd4S3BaklMUMc/IMGeZX90heed7K0G3pSEK+/1VGebzwvyCnpRpVFMrKRVfO/D6Lp30KCWxl+4oHtB57KbMaWOm2lTtLICefMkySqkM6+d8Ya6JufsZufyRl/HgV8e/tZnUDUJoTbKMmQGWDf/5SNrf3+J8bfmorGlmS3z7Ei/64XQ7HE9wFkSNxkDn2+j+CGeRP+eDLtpP/iETXqAqEOZ/DBA8gHsN537H/3VP+0kk1CqyPSXtUdIgqBEpmAWGv4vkuZztX9AV8DtWr53LUm+JvYjxb9BYZVkVm9Kcg4gi1jJUJhZCI0zoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R5R6V72pwAafOGgVDTaDZexdJCbhXEMWcDSohUWU8LM=;
 b=ivNkMbNs7AmKtxuZ3V+TKr3mpFlqZwoMpmHVBW6f4EVsJ+5+6WvgeDLWXrNdaDJfl8gx32Apae/DfPEWJaTNFZeNm18zbl074vFTIRc9fJKVHYizwRJGwbTI1zwIBJshrUbuFyXcOsRCDIzedFQH9RHpW+He5c62ucOyNqlmHK7fioXcW5oWdjj0Y/hMbl3yrmfCZDCNP1XJJZsE+fA4JDRordxJ4BtOvxIB5SaIUgvh1q+NNMHXgzq1OHcoaTuuATo9ZeYOl2IsO18JQZqwFpMAFXY4UQG6dL5+Up3qwlldQ9kdE+CqzHORBIwiltyLORLGKDvRF5h/XlhBdytZsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R5R6V72pwAafOGgVDTaDZexdJCbhXEMWcDSohUWU8LM=;
 b=plh5w1z3duXALKRPlexkixFq8S0OX5Be5T9OfhNRNBGmwpT8yICaGaApCSAeRZimFKy5q+r/vNfO7nUhRwj2C0LZFFtCCEPKjDqU8GRWKBG8CkGlitvfXBQoLtIBuU4P8eWa1MBbEgXklcLbYj4WYen66kVk/40aKqT0W384TTA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by OS9PR01MB12229.jpnprd01.prod.outlook.com (2603:1096:604:2e1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Mon, 9 Mar
 2026 23:14:16 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9678.024; Mon, 9 Mar 2026
 23:14:11 +0000
Message-ID: <87cy1c1tq6.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Sen Wang <sen@ti.com>
Cc: <broonie@kernel.org>,
	<lgirdwood@gmail.com>,
	<perex@perex.cz>,
	<tiwai@suse.com>,
	<devarsht@ti.com>,
	<v-singh1@ti.com>,
	<linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] ASoC: simple-card-utils: fix graph_util_is_ports0() for DT overlays
In-Reply-To: <20260309042109.2576612-1-sen@ti.com>
References: <20260309042109.2576612-1-sen@ti.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 9 Mar 2026 23:14:10 +0000
X-ClientProxiedBy: OS0PR01CA0082.jpnprd01.prod.outlook.com
 (2603:1096:604:99::29) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|OS9PR01MB12229:EE_
X-MS-Office365-Filtering-Correlation-Id: 31244b4a-94ba-441e-0b6a-08de7e319284
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	HHuryXzKBWXQpD7KFbghlxyodNSoJThrrf8whdGOknorjhXGxCTzsmaRQ70KQ+vnfnzU7kDf0gd5qG/yl2bYYgMnI2mv41IhsZ3dhO4YsIEjpqNW8UDWVMHrl6/wx+xTQtIo/QYliIL0C2YrosntgVKKTCRpjPwzoxUMQG8A75KMSRqjGI9nggGCh0aSAspju5MSSCG0I6/UsoQeau4QyxjoVUvUr8um+bI9ro5T2Lm/QSQaZbzz5lKk8xkfiU8w5ORL+aCEygFHZbrlkWucVXNIx90sFV0UF+cEDId5VYtv+hnzY3YESSS1fTmG60iGwF0lg/Oq3spOT1BAa01WG/fI33JXXPzXjB5CGWNcyl9P6zy2ELFEdY1etckbZNGObqwvzLMweE8K2LNNvYQ9YrSUSlH5QaZK5i6lykguMrinNpQfOt/G+32afJ0jrRdJvNQGi/ekWPnKsLxW76Vlp3B6hO+Cfc14CXt79M3hnkRPIWItdQneJewmZzjxVF/BoDycRmXNBTEiS49rC5SkYFQIcj1R+jvlEOBqy1zoScU9vodDRdideSwQ0VYRsRKXFprcAGAOCiGRXGfwaK/nLcPI1PBfWH0B8UCuZBcOX8vvxUX5UiLDpdqaqweDzi81Suo7d3t8TXItOM5WLJS9z/QnqOjnW7uw4xGfoaVH8wYQI57nO08/bVkGYTTpU3E2naJQZwtRs5ay3w0Ugs/rwnfSvDQlAHxTcQQ01iPoxQjJrmroORHQiLmuXg68pZgqpQGGXpKLltGWoNaFqDFFWp6dAeZ0A02zwJrH+3aiOQI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4H6n/tvlIcEnhL1reAQyxHPI8YPyEcOHQIMgne5sqWVp8D01jLx6KNnD8ps9?=
 =?us-ascii?Q?FSWLBzecHqV73dPP4p/PdXK85Uehfdr3RyA9AGKRdc8SJ8BupGXVOmGIlvwA?=
 =?us-ascii?Q?PptYQIeAGf7EicXcgS5Fv6LKQYClT7tKQFesB5FIEIvDn3F7jvJ3EdPE+FoQ?=
 =?us-ascii?Q?tZD2Euelu1plrhfFzwX/fvWCr3YiI4VxIp+hfaV4f56bChNPZhEJyiFXre5N?=
 =?us-ascii?Q?V8LJ3OK3ac+RxSZg2i6dg9oOWMpY9EToVVi/0+br5+Kx6QGg5kJXLrj/arTO?=
 =?us-ascii?Q?iVUHmyet8npQWQfnWIq/alnDxozEGOtJa62MeQm4zbSfphALA5weGdaFs8iB?=
 =?us-ascii?Q?qdv3cGdtnUsIqrJ9QJdEcUXW0rKihhI5uj53DT1R2nU9c8ZMNWXRWHAtt1eT?=
 =?us-ascii?Q?OyNhir6iCkQThOxfVQZCbowXF6KZ14woZAP08I5eHaS1XGK0FXSAssrjP+sa?=
 =?us-ascii?Q?xj5PJg2Bt+yC5VNRE0FRAc8uQvolLKck+lZjK8nJih+0MDhSD0xwdvBXABY8?=
 =?us-ascii?Q?DpAQXr/k7PIlchIzy++CLvzyoWWR+JVOyrk/p4IaUqYE91GLg3yw5rH+lGgj?=
 =?us-ascii?Q?Odwz6WuF28ZlrszxvtZQJZhX1gDGDK+bUiG3U2Ioo0hFLER7SpqNs9vUXA1s?=
 =?us-ascii?Q?Jo0hIbq9s2SNN9fhsWFLRZVRDE5WDvRizg4TKjgms8N9Vt3RaFJWV12VDG4i?=
 =?us-ascii?Q?it28Sb9GfovgevzQzHmTwCdk1TOIflwIvz/dGSLBV+Be7SaxxJtHCtFCuH4h?=
 =?us-ascii?Q?epLpw9c/cfWnkE3FcBBaPOI8/ZT5JIsNDW2P8Zis9s5ccp+NIn1//8hCL7i/?=
 =?us-ascii?Q?6bMG7Kl38gGdBEKYdG5I5FsTWWqlT5zaOwC7cHIVY94FhY840SGTo85i+c4k?=
 =?us-ascii?Q?urlZ1asT0O9tQiX7GAwYv0WE8oA/AFYNY7JZGcwn6L8+ZmNBIFbLnk0BLngw?=
 =?us-ascii?Q?oy20FnKaHmTnKJ+AYOhbb2No/Q4ZdNtm+v1YhCNa16Y9W7Xrzyy2tv451APb?=
 =?us-ascii?Q?i5xjKt/j5Ak8hI5pK2SKGUdfdkH23N04gii7fkdbZX5Xbj43BZHUr07n/E8g?=
 =?us-ascii?Q?VgjLIIA2ADhJFUSS2YO+TKo7jkqQIVWqxRQVb+GmDRLThcQuO1xR6suAhT59?=
 =?us-ascii?Q?gC/hWMELY0HoczKTAxw43Dbj/RlyMVjHBXzSLBbC4w7l0gEQdjb9vDrl/YQO?=
 =?us-ascii?Q?HhmbqwWtXRX4aoVEuw/r1GwQoPQ2Wqfc4/FYeLOfa7xFFjDwiiPhvOAQGmmv?=
 =?us-ascii?Q?A7OZd6lLDIAoHfTOuvQE0euUtUrSXAWn+Meu147sw/3JVAOLSsF00ai7KftK?=
 =?us-ascii?Q?rOSJQTdBOeLQtajbeARKQWRtznjWzF5GLNtAF0agLecbr9w3o4mo3LYQAzw2?=
 =?us-ascii?Q?xeqDGWLZMONigteWvHL3DjsUHEM8UZP9B8xqJw/rp2sofJ6AhikrmgpRJxHY?=
 =?us-ascii?Q?WzKBU5WWhBRbCFZ9my9eo/eksBxs4vb8UnSLDSIuoj98laZ0xeXLUIhLSw0b?=
 =?us-ascii?Q?6lntMFw/xLAtSjWpIBMpIKanmlw+IynBzotU77GiCC8rEM1/PRUziVHyW0OG?=
 =?us-ascii?Q?X0Y6eQwLbNJSBqLkUSCbA578YgUu838XZZOPQuM1aHoCYewN9/Nlh8cEJEp/?=
 =?us-ascii?Q?AOeVbCxyuTAzO4yAFJguKtIiRF34zYtuC5VDc7MzMm5ulb59B34UcHkGTiqS?=
 =?us-ascii?Q?ib/licHfz6ybH30QkaNXmkf9iAfJ9TiAVFsBZAa2b28w6N+EjeKGU14vr5ng?=
 =?us-ascii?Q?Y1VFjTARde5syvCN4w8OP89WcEdoJ+lJnHjVQcjhHjAHqxNk3Ikw?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31244b4a-94ba-441e-0b6a-08de7e319284
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 23:14:11.1030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: moC8eWeJadnSiJ/wVvZud1nn+6DuGokoZtP4q2h2xieMk8vw8WDFZ75npZGULX4AsB57CbO8PcJnwFERYVZMKfPNEU9Bo5AyFwT113IfMzu8PO7AhmMLGOCRa5ap9kWO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB12229


Hi Sen

> graph_util_is_ports0() identifies DPCM front-end (ports@0) vs back-end
> (ports@1) by calling of_get_child_by_name() to find the first "ports"
> child and comparing pointers. This relies on child iteration order
> matching DTS source order.
> 
> When the DPCM topology comes from a DT overlay, __of_attach_node()
> inserts new children at the head of the sibling list, reversing the
> order. of_get_child_by_name() then returns ports@1 instead of ports@0,
> causing all front-end links to be classified as back-ends. The card
> registers with no PCM devices.
> 
> Fix this by matching the unit address directly from the node name
> instead of relying on sibling order.
> 
> Fixes: 92939252458f ("ASoC: simple-card-utils: add asoc_graph_is_ports0()")
> Signed-off-by: Sen Wang <sen@ti.com>
> ---

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>


Thank you for your help !!

Best regards
---
Kuninori Morimoto
