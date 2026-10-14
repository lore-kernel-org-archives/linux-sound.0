Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010008.outbound.protection.outlook.com [52.101.229.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0344937B020
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 02:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791946727; cv=fail; b=BGWDgOMzYDxCrAiOfiWvxafYhS63jux46No1GkT7pP+E2w9f/+yjQqZ0hKnWJ9BIPbY2/nuJstnxehqLtIZhZNdxBa6TDVYhFuN+tF5oiHC1IHhdtpBPCZPTYtfsQFxpp44HHB/73GQsEzjemxtHfo/cKl+Gj/AXQKtkBoRykY8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791946727; c=relaxed/simple;
	bh=/MqIZtOODnJRk7wDNBZo4uS4cz0JP9kLHK37EqjVAKc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Wg8wIgWFDVohqrUBIf8mL5yMP3Bt7l9VakNUWHhF762PJE1FRy08q+xxwXoolsnixVs2E0qiLzdISr0ijdTzs5zzBJ22eG6MxvFl2J1BMiTyBclZTev9FhrsMNLZqQ/6fDVrOM1tfx7mOxBcQ4GOVqZCXtjXOX+ANXIiOb1W8Aw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=UbvYU9M8; arc=fail smtp.client-ip=52.101.229.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="UbvYU9M8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q1syhdk2TIr1eCtuIelGzGUYuWJbMyQrFNNEmpyvk9qHRSFivcsXi4bBtfGrgSnBw32KPW+D2MoSKP+Nzs3/wWCOp5Ry8SxEEV/MXcKbu4SGPTjkrXSU6KRg9C01rdzYCbBdTeoEXZ0jk9RyRxe4tcw6sczkt9ucO1IAQekVvBFTlzKor3dwx2E9coj4b0/9/w5g1ROll9l3aqXeEnMAVdQLJl/rhXXey24OodJws6blw133X18PGnGSuVJaktIVcEPjcgc+nzz0zRI4tbeh53+dsH2idxR2vgN+5tsb3WuWnGvv88UPiPx437D9Q9E7K6uXElWpWfw+gM3iLtTcAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BW72+/fg77N/ZiWaz84jbMcHFuPO3Nk3BXPMNidKfao=;
 b=jezt0+tCxXsSiQ6wpBThIpK/1gL3EKkaMxCZ+bmW/HJthTowm1QyPwDbV//6JWauw93X+OlYKo3l1jJjrVHUcH/IamNNEsIlRwDbRSt2v+75f3xjs2MdmfwFN//UHp5IyagAe5Qn/7rZGp8jL8nPzggjgyPm3QQOmf/OS1nreRn5FF1VFDVYj2fD+vKn3lzpHY1wHfwHvZ7FlYNcbsl8wtwkuxGymufJu2qfiT+XIIepsxVtxs1IO3MmvqpGmnG320dz3tE8vCQ4nkn2fZdFOwVE9RnrcGXPRg/E2EzTboGHEYYgv/HvcIiEEMYU3gRhNLNfQNMRAGXtkKdOXyAy2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BW72+/fg77N/ZiWaz84jbMcHFuPO3Nk3BXPMNidKfao=;
 b=UbvYU9M8A5xVwqPVY2eSEyBvGlacdPJJkLBcmy6u1sUWpdqeyYn80V4u6Zc3Yr4sUP5PwLNvxuyOY+alYrbRl6FaT8tDdLaCkjPQ7AeTf+7Icckm9gCA2rXOhlFpjpnMsVb0b41mRRPxYW7784P5zFLeEYCBK9CwFyNK+jz5xGk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS9PR01MB820914.jpnprd01.prod.outlook.com
 (2603:1096:604:50f::14) by OSCPR01MB14695.jpnprd01.prod.outlook.com
 (2603:1096:604:3b0::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Wed, 14 Oct
 2026 02:58:43 +0000
Received: from OS9PR01MB820914.jpnprd01.prod.outlook.com
 ([fe80::12e4:c507:3730:2294]) by OS9PR01MB820914.jpnprd01.prod.outlook.com
 ([fe80::12e4:c507:3730:2294%6]) with mapi id 15.21.0496.021; Wed, 14 Oct 2026
 02:58:43 +0000
Message-ID: <87o6cxyom4.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 01/13] ASoC: soc-component: tidyup be_hw_params_fixup() define position
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87pkxdyoml.wl-kuninori.morimoto.gx@renesas.com>
References: <87pkxdyoml.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 02:58:43 +0000
X-ClientProxiedBy: OS7PR01CA0095.jpnprd01.prod.outlook.com
 (2603:1096:604:256::15) To OS9PR01MB820914.jpnprd01.prod.outlook.com
 (2603:1096:604:50f::14)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB820914:EE_|OSCPR01MB14695:EE_
X-MS-Office365-Filtering-Correlation-Id: 46ba21ee-6ec2-4245-079e-08df299f0f04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|52116014|366016|1800799024|38350700014|56012099006|11063799006|261009223027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	PtMOlR5ZqtXV9d14a/frZD1HjDT5iEG52V+eEcjfYqifcskltbGBmOaEocuySTwdN8U68N9Brg3RUZYuBmCXfMkgHgo0Q38M2g+DBkOL8Os4ZZJXYtWYnPRTMhSPqd4OhOwgXqdXTHgiKAcUAC1FJBxBEc7QGEsOZoXL6s34zR29PKY2HEB/iV5NGm+QFH7ROkrjq/LWds7nvwNdaRkaHwoZCaUlrDQHMbWxyxFzRfaIQDpZBYkinxUOmCVPRvLHkp+7XHxxjvqlsnNkfRMyfX0Vi79nO5vA2ABN57XDwceF3wPnD78gzYQKZah4LkqXrFfTnTv2CmyS8ObWS9o3WUk3+2+6QygWi5JchFHh9qr4RxkTzgefKVYLsop3YiL5nt1ltrv+ws6pvXpTZl3XAvAjE4KSQB8JdJOotM9Gdw8jljfRsfgBK5fPMcYNIopXfNf+PTW1gUxC3Ie62L8vFc2HrKPB+ERkIsusUeVRhHUkS26F4stp0aKlPl6S8SKcjdsHRNg/Re8AEDws6Z61SG99zkoV+T8zPV+lC9vF+lbJPYZcqNzjLhwbK031tFeXROh6OGb2IfyKJ11Wtt8IIKFSQ3r6CV+k0LbBiQOAFNmXwEA8tGS+lH+Hq7DsmiiJLK8rnvdMoDTL0I8rPzcsg4uLtAPaMstMA31P01GZJEAma2Dq0kaf8Q0bQd1s38s/YS0NMVCP5SVBw0GVW7iBpMTbA7IRWqKdK0kLs8EeWwM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB820914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(52116014)(366016)(1800799024)(38350700014)(56012099006)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?65y5U0moEvXHoYdifVZDwh6qqDxerXc5RVDgE/8+kNJSjrSoa79kWCxtbx?=
 =?iso-8859-2?Q?vR7P88gV30jDi0abdUFfOsrEIDBJtDapdi+988/+PpHl89YKPLXmVt1c6U?=
 =?iso-8859-2?Q?VAWstHOtK+7Hu8LdIitM9dmPXUyY4aHCQ+DzwgwVDQMGytZusaoMT7hkqH?=
 =?iso-8859-2?Q?8oJF1XDXKPGmy5MPRGbsd/XGNMED7x9IaQv+mp5i+I7oDJwRIqqf7QKwlq?=
 =?iso-8859-2?Q?5Zt4Plf7cTPgHXyINt8pqNyw2BiGZ2yq0+T3h4aAmvKFhy3CNnU0E0On4r?=
 =?iso-8859-2?Q?s18G8hu+HUFHckHI4Xll8AEd0Qm1teB0vSEqHR+tDIDOqmlT6poJiwvcde?=
 =?iso-8859-2?Q?2uTfWyaEBTfKC9cw1GgQzhYG4mk+bonaNPFZVbSJlOrhbtaLeJNhkK0ulJ?=
 =?iso-8859-2?Q?tiUqoHZzq/Aime8bxIp30iSzVHAb5sQMT166THhLlI9LcWdRySPcn9XDY5?=
 =?iso-8859-2?Q?v5M2BxB9qr9rU3kQTP5/PgBo8I2SOOalnoJ8EdRNIM9nBZz19lE57jGtbV?=
 =?iso-8859-2?Q?mknVeCcRilNIP5BjXlKGjUrfJA5hSnvfb4NZJQgcoj6E4bcLlDEeVBbeh6?=
 =?iso-8859-2?Q?mBD7aWIXyn4aomMKjuM4TC3DH+ZeXKUBzRLDdaB1UMC6kn3pBCYz9xRuzF?=
 =?iso-8859-2?Q?slrXGHtqotRGmYwFFxGsTR421Se8J1A7yk9ghKcB7HuTvBb+a+Vx1YXPpy?=
 =?iso-8859-2?Q?flvZEPMZgBetij3XrC+YQrrze0O+XFGiq+THI9Kyp4Ef8mi0UTo/x3kHNL?=
 =?iso-8859-2?Q?zDnOpUPFNplhYfL4ewT+E7pampDXS5fLFWkxQ8tlS+awo6/Kn1c1b0HuFn?=
 =?iso-8859-2?Q?WtcMaIVYyioBJYeIKT2bN1VSjb9RI+TlHGlfF3XRtxbKYo4s51IXONoM+X?=
 =?iso-8859-2?Q?HT51foTwFX6jeh0Lq+/5y1MprTSxubnQaxxtlemfIl+m3DypvAwu9W2CPT?=
 =?iso-8859-2?Q?PNIqvxd9aeph8RdiXimFO45VpuRm4tPoJa6q22jWvORz7HsnCNj0jR0xyC?=
 =?iso-8859-2?Q?GRMADrDOLPMVsADNpPbwgQzp/+IWkCgg71DzcisrUqkSp7yVpJesBAs8Mt?=
 =?iso-8859-2?Q?iBPYnSxxneyZpQBF9Cghv0jTV2SWSWr/RYJsxtsJAk9hkWTqH+JstWm3b3?=
 =?iso-8859-2?Q?gIkh1ISCzdeDgisG1JbC1HbGi8l9p4tKpld5DVtkv90x1upHW0bZ+G7XPp?=
 =?iso-8859-2?Q?s8zFLJgweNyr9wvCuNm+Sl/FUZK/wBq5NJCtzW/8Mlxk8ILyXlWTtf02ZY?=
 =?iso-8859-2?Q?rZmP0wcuXMr/WJ73MU7+F/34T6+m2QkKkgQSkicq9OwyOAEdE69gfTUsOA?=
 =?iso-8859-2?Q?yVFV9VKs5E4pS+ctbcUikLBw6RjI/dcFitJxVZ3oM7wPEoAIarBKcaVS5l?=
 =?iso-8859-2?Q?6MihAjdWsXgIPiR8jXOSvl+kMuD37a5JADTFKYByGj5Pq6U0NQmjhGQosj?=
 =?iso-8859-2?Q?XAOnG3os23xgUn+mqUlzmk46VXCnbjC9MmyjNhIlk/TQe3IEmpptM0563c?=
 =?iso-8859-2?Q?+rB8DaJtPtnsosVVbLFsG3dV2XbiGWC5CA5VK+8Doye1BAo4x5sZdUucBC?=
 =?iso-8859-2?Q?oyiUMEepfRtnM2zU9217EXw67Lpm9cKuVAwDo6Ua1fw2g+1gjJG84PHII3?=
 =?iso-8859-2?Q?bL63mnrBwEzehhIT9LpTgpcLtZ/LpXgLR49QngL0YTEU2nC77ijI/YRwZ6?=
 =?iso-8859-2?Q?tsWypB17WNqjCvoD585CdpbSt284Do/CIPW2ZpThpIVNWDYEPUnBCBBYnI?=
 =?iso-8859-2?Q?Z0lhTwmy+NZDpcblkwkuKXBICFJHvfGUYXMW21Qj8PVd2W2iJRbofnKQ0i?=
 =?iso-8859-2?Q?BrxNZIDJVrzkIfgJPECJJQAJPQ/sNJIGfIKbmi3vlJIx48mTX7MS?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46ba21ee-6ec2-4245-079e-08df299f0f04
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB820914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 02:58:43.8909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MDRqEARhq6PntIM+O8hfiITS4YF5qar6eVR+UZ2qGZcltv8/QCobeGs4KWdxg9bdMgHCR+W5HeHXjeKFHJGOkjz76Dtz21GMnnd6wDFFKGbPv2gxJPaSRp/oaAxvjq5t
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14695

be_hw_params_fixup() is one of snd_soc_component_driver callback
function, but is defined as alone in a remote location.
Let's move it to the same place as other callbacks.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Alvin =A9ipraga <alvin.sipraga@analog.com>
---
 include/sound/soc-component.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index ac5e9412582e7..61898a45d83f1 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -154,6 +154,8 @@ struct snd_soc_component_driver {
 		   struct snd_pcm_substream *substream);
 	snd_pcm_sframes_t (*delay)(struct snd_soc_component *component,
 				   struct snd_pcm_substream *substream);
+	int (*be_hw_params_fixup)(struct snd_soc_pcm_runtime *rtd,
+				  struct snd_pcm_hw_params *params);
=20
 	const struct snd_compress_ops *compress_ops;
=20
@@ -197,8 +199,7 @@ struct snd_soc_component_driver {
 	/* this component uses topology and ignore machine driver FEs */
 	const char *ignore_machine;
 	const char *topology_name_prefix;
-	int (*be_hw_params_fixup)(struct snd_soc_pcm_runtime *rtd,
-				  struct snd_pcm_hw_params *params);
+
 	bool use_dai_pcm_id;	/* use DAI link PCM ID as PCM device number */
 	int be_pcm_base;	/* base device ID for all BE PCMs */
=20
--=20
2.53.0

