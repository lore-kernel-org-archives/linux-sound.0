Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2085.outbound.protection.outlook.com [40.107.22.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF4B231A46;
	Mon, 13 Jan 2025 09:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736759091; cv=fail; b=Cawq5/SLWfJg4n0i3PeOBcl9w+xDRJWhSlPOku8DNh/sT8APK4dxS8eZ1whU1R6pW/RbNazTMIxbB8b8rtCiBZe6fPyXmNczjw4u1F6oRig6d19/yndrYuo3w4U2PG/D0tGbaHXlLTz1Ib1lHheLKEuMOtindHHzXqXjEZuUFHI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736759091; c=relaxed/simple;
	bh=l9HKj7kO0d5ihkgKa1nFfxPYM/kdyO5wRK00IB+DZq0=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=sojeMDALRtR8hNms2nAn64blrqlhabAw2hqBQSxB7U1DmQHl7N/ib5XV8PrQ0pUQ0JaduUj1kLAiisLgyInGymYbAhbQXAp/GNaKbvfFFiGPG2LdehNDJPX/7KXxtu0g4ZjvWIcDpS3W3/uXr3F2sop0cYry+xz/m4QkACN7ifw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=g7AVXfcM; arc=fail smtp.client-ip=40.107.22.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="g7AVXfcM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fAuXp3E4BIcpg0wGiJ7/axe74yUICQHamocbv/YxVnSx+ot0J+TLzM8mdp8foJ29Ny4k/qIsEQ+uUmZROznUwF/5aKvKV3vNH/8N0eV4uYB4qyJTZLN2MSCUF5mo4MyYpQDgUgOSx8ZihYRX/yRs1HH/jmsAK3KpBCtOsOKAGEoBWtcHV3zd2piJJQrWutRwdALU2nfCaetmzYBvTEqQXPk5hgUKjtKh+c55BWZeuntI5/dGqd/jtZD49AOZPvrxNI4Nk0kzBDwEM3Y3SuO6g9VuzGP48ONP6jlERoO1zfMhhzmFqjgGATWMXtCx3RRxczQHF0AtSm6s9EidRS4PAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y0kvod1J2VYaVbkZP9QmwOXR/9EPmYoAEl1LJu3QURE=;
 b=apZQ6jBgx3yg8emvBgYIkJALQ3zMbbhUTfifqblOkcM6zYPlrP8Heqw4qFCNza6FdAwMMqi3lMk9JOodnl2nOXvrWUccuIYtEj1WC3FCe1A15c27s/OOGPU9xBoZHEvbNN/4jfL1CXZMt1SRVQdbjp9CW4Mtay0X5NATojSpkON1nKvIuiMZgw/dR1yxgnnGpivTDtCMnV3scvsN82cCE0MVs8Uf+6hKGn/AzriNvcRlTk214KwfcFMDbzakDxz3mHNHIbaDDKtMvmz1lCqXoiWbrOBYKtUXk5mHwruXzyoG6dk6k7HXvmrQgChzGgRb109BuyiYACgpN903ORzVBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y0kvod1J2VYaVbkZP9QmwOXR/9EPmYoAEl1LJu3QURE=;
 b=g7AVXfcMFXBKaNMZXEagzihnf3sLiPzelsPjUDOiJ4dPRt6B2iUZlT0FBKC7covY8f1uHiV/Z7d4bLTZNEVoMe8MKGpuUoeMIg4ZnklJv93iXekdzeyh2dpnAlOhN+bi6h4fCVv9uNsaHy5TrO+55JTSaWgHqL06/6GqL8Z+9Vbl+nXnjSNorXIp+d7TvcuAioNNYLPxVAwFO8BfvbOlRW4Tkrje7GztU0UCms1ZfLvWq0+KLkeoubq18heGujNhi2nmQtDpcqvRdd6qkrOftzinkSPwjGdIV93/9vYAUAxt2eVj3UYl+Yht4/sBbBZ3RdK+QBjnvLfUTSP0S9oRfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by GV1PR04MB10377.eurprd04.prod.outlook.com (2603:10a6:150:1d1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 09:04:45 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%3]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 09:04:45 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/2] ASoC: fsl: Support MQS on i.MX943
Date: Mon, 13 Jan 2025 17:03:19 +0800
Message-Id: <20250113090321.3193464-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0045.apcprd02.prod.outlook.com
 (2603:1096:4:196::21) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|GV1PR04MB10377:EE_
X-MS-Office365-Filtering-Correlation-Id: aca6cc82-069c-4cbc-e15a-08dd33b1532f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GZEDPsXXfUnwxDtEb6o6BdiifL5ZxP/GBzzQ1qr3Sc2JkM2kb57LP1eoi/Qd?=
 =?us-ascii?Q?l5z5RPMxwatgZDSvtI/e6Htmbh8qMe0LQLwMjUVy98tuBl8ZqbCzk+Q0W61h?=
 =?us-ascii?Q?Ge6+bAQ77acnrJ90bTLH5T3EWYRBRls1yzPFngr4x/MqtQLCjuBYEiZDIZ0C?=
 =?us-ascii?Q?vYwtxByYopwV7FJR+jyYcGDMUnsGYfTxEb+4pGHOR6StRzMFm8QlEZXMP+Sr?=
 =?us-ascii?Q?kfWSjGxhzNepY4C23ToFfixJqEzOoAGdlyDkmFm1OmaDBu23HuzFhf03IU4m?=
 =?us-ascii?Q?VFrgEzXclKbtw/bb02/kIRaiU7tlycHqyEQTFlvFSkHYHpqgh50fmgehjHP3?=
 =?us-ascii?Q?4y6k6eiC6sX4W3r6Izes49sq0/cokS4LHfwXXZmfp12PJViBAu6tvJCMl3cY?=
 =?us-ascii?Q?Q+BhpGf/d9u7PFlxyZiFroGTrZlBEubiwYkEIk7mmQDR64G1mRvXc2dzbuO9?=
 =?us-ascii?Q?LVVto1sU2bWSFEScOGzLh21OnbVk60b4KOrYzBLqnJfXkHZxwvECVMEjE0or?=
 =?us-ascii?Q?qAxocrDHoBEGfGrlQA3L49Sio7/yFEOZld79oWjyP/ebKEzUPqCnF1SgrQYE?=
 =?us-ascii?Q?CYk7Il82yPnx1rLtHBTsv93Quhs/nedlAo4VHaK29AtYNAmLYFEHneQPa+lR?=
 =?us-ascii?Q?iMc8Acq4Kh8QeiKkhZixlv8PccLVtjyXVnFo9PsXHVhHrLo0OAhjbWAguwVx?=
 =?us-ascii?Q?kY8VCqH8w8r6iwufbtR80oWz/ERKz0pJwH6Lmpe8IYqJTE00lKCcd/pi9M/u?=
 =?us-ascii?Q?A+oFIU55EpHi/HXKBU+oc/cuVfddlaGvV8qLzEHCtsnPsJFxk8Cex8cwT3E/?=
 =?us-ascii?Q?e8RjG5CCLeLSzGlLQML77Q6Re1mCdy31u6XhPO5Gxt4W6N6SJrvCdEG0NSsX?=
 =?us-ascii?Q?OAZiewdC6+5Xh6153UQlm+t0gqVuQ0YPQfNzkVdRr42POwpwfOOSAfF1LI5z?=
 =?us-ascii?Q?jaw85OdBQAHanj9UsPWUMKx7GlTzS+i3s4Dtse1uAs6PEKMWyW7TcypE87ns?=
 =?us-ascii?Q?oRJLDEgQW7EVQtNxMJRG7e4I0h+hS+F4/sBVhUYfleAiLbRWZxOrta9MB8H/?=
 =?us-ascii?Q?/AI2VkClXxCupW6I7/phij4Wv8KaW4QpJ3VjufLdRfwkKjhwN2W6+GdXAt6o?=
 =?us-ascii?Q?OqDSBS0Jk3m0liNJOjJ9rx1uKxwqUnYzSrsioeBUaOI1vrpJ5AFFGqS9E9gI?=
 =?us-ascii?Q?MZcsj528kAXzZV7DFMMCjvPBWLImE/LiPFtdcm6KT3YOIk8UfA6a52fSg622?=
 =?us-ascii?Q?Gb5lqYx6ooYsGgGjEW8jtfZ0pSrLrt3VOEGpAODC7LNmLfdArz2D3R52vbXL?=
 =?us-ascii?Q?9hwV97RavsQ9dixVPXCQ+bjFJX7veqpjmiczh3vlQ57rs0DUpKIv88HA56mi?=
 =?us-ascii?Q?5Wic3n2OnGwOLt94FN2WfpRCuFl57YYJZqZ2yIwg7QwyG3Bhyr5t1NV8UZwO?=
 =?us-ascii?Q?0brbV+BS1HQdLtMruIhXJrGyH5hQ7HA2I0mYNlRJhkjn/6/goVBczw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xCotWBU4gMDO1vTmyXmrOREMnsDJSXAPhxY8vYB/w52mv70y8wT/UclhsOyi?=
 =?us-ascii?Q?KXlMH1WwP+GtonC+/q6KmTO5ZHmeFzXV9gVcEQRd9L7E/FNYmZ9iQQMaRB4a?=
 =?us-ascii?Q?vL4xU7Ir2Opa9lePq6jAV6LX3rJZ89i2whWFvkBvkoUhP0A0tGw/xKGW3UyQ?=
 =?us-ascii?Q?YhL0PrWZtMNzN7JHb+u70xYIhm78Aq0Be59mdt4Nq6oK6svZIcM/jrTDJ/lP?=
 =?us-ascii?Q?uKt4uqXWRyOYkl2xrhpvytlIt7JHVLEczWrXKAN67tnUxCwSiDFDOGsVE/O8?=
 =?us-ascii?Q?jL9Gu33yHkMC6Zc6PF5RKqA0UXe5iVQzUfAH2b+7rt2sQWxEMci1mjER9bUY?=
 =?us-ascii?Q?w7+vUqD6LxbD1u52JTFBnBmmBbA75sz2cz8DWD9LGknTyRZN/Yfe7K7C/GUb?=
 =?us-ascii?Q?OZaVYcbqgu0KqIFAkdyfdYVyr873KLDpIcD5mKmjKFNt+nKAXTiz0YuR8W4q?=
 =?us-ascii?Q?PHMFtqzMh850HiWWbaT9QkgtCje8t6QVfKWvHzdXbOznPjCJK9RxNrr8QvU6?=
 =?us-ascii?Q?VT4lJtgfNTjWOu3h2yWc7aiBKpVUx1NVNJgAhKgDt+CXosRWEtoDelzLnKGE?=
 =?us-ascii?Q?5Ml5xbiNLq36oRd2JBZSGm0dvLZTgBSFOTcbdQv+WwWZpnkMA+vkTQTz1wdw?=
 =?us-ascii?Q?baGv6Na3JQYotZUtBQeXShrfXiASOdHUM5NLHjZ1Qf5ctgqtTpGxnZiz7paC?=
 =?us-ascii?Q?WahSD/zZi1N13NM4zzSdALTLyjmeLFiR2Jc2sBRiCJ/YQr+H7Zd4Blfcauj5?=
 =?us-ascii?Q?IYXez9BQKASIjM0cGhXP56rOiBTFFtQqN2td6DYYj26KawokySdy2GO9b7lq?=
 =?us-ascii?Q?So6VhZNl/KgCYt0XAfnUrydGKmgIVWc0v72iC3Nm54CvoYlNt5h3W0ZvU31d?=
 =?us-ascii?Q?PqBid8AkuTde69derVHZ6nS7D8JcPpqSYn2+kR5D2Iw1jspFzVlsldRau3UR?=
 =?us-ascii?Q?3SWbyFcowR4ddPt3reg6dCy0gncT+4F+PFmFkjjZbdvkT8TNW28wCpvinzz0?=
 =?us-ascii?Q?TWVp1/0hWS828EiJ0HgdrbhWg3S3wZ+7ZjzZwgqDyQaQSvecfnO9PUr2WlHD?=
 =?us-ascii?Q?BbL8OI80ZHnC30RDB26aSlpp02cJ6Tf8LkRhDDAJICZ5I6Ds4KhmwULj7gAK?=
 =?us-ascii?Q?drvmW/W8SJBy1cfjFTliTvdl74elQzetCz0XFMhS1G9pXsTOMpkhbbQ/BCZY?=
 =?us-ascii?Q?gTobyR/MLYn8H/+cm3UKkSPmGlEnU8bEigGARPyHgv/qudqLJmVuO21C/Awm?=
 =?us-ascii?Q?uo7Z26FCB6CEwWOsD1BoHKqwFTUc5VU+eAkcSmYi6U5xYW65l3bU8YW+ca3g?=
 =?us-ascii?Q?BINqP6velMwS6TdwGxzjLkPCwaJFRXeGhXUPBOAAZ0sSEhzzKlRfEkmt/RyY?=
 =?us-ascii?Q?qTxf/eve1mEO44h4rqsr7KD7wFOj5b7HN6qHWb4+fFkzCJBQCYq1N90L2l49?=
 =?us-ascii?Q?AyyvQmMTkJVeY5Na4kg7X50ZC4uaGs5qcRp5FjBAPREzKFo1sg877hVDJcGV?=
 =?us-ascii?Q?HVRdt5R7VTNPiyudCzshfqw4m6NENFiLFohAeiXdYwFGC14b18bK5w5KE9KU?=
 =?us-ascii?Q?423iHYov7vpuydIHvVe5jglMmiKGI7uFCJ+z1wOF?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aca6cc82-069c-4cbc-e15a-08dd33b1532f
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 09:04:45.7831
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZvmNNUUr7QP4kXwiHMgJ0zTnoaXHOWi3YXE8ocPMo4knrYOFVQc/ov5lmFuR18I7v65xu4GTIVcRMWdNMezKKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10377

There are two MQS instances on the i.MX943 platform.
The definition of bit positions in the control register are
different. In order to support these MQS modules, define
two compatible strings to distinguish them.

Shengjiu Wang (2):
  ASoC: fsl_mqs: Add i.MX943 platform support
  ASoC: dt-bindings: fsl,mqs: Add compatible string for i.MX943 platform

 .../devicetree/bindings/sound/fsl,mqs.yaml    |  2 ++
 sound/soc/fsl/fsl_mqs.c                       | 28 +++++++++++++++++++
 2 files changed, 30 insertions(+)

-- 
2.34.1

