Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013027.outbound.protection.outlook.com [40.107.159.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ECAE2BE7C0;
	Mon,  2 Feb 2026 10:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770029854; cv=fail; b=qcj5cKwiTFpxNeCAWMjHQ9Ol526S1Ri7RLf4RUHyrozW2yr6RKmrzzfL7KJ1Zm2D2c89vsIAiar58jUN2i5cPdiCx1PAGPKNWj+kx3Nm8rIVdh9mYWnW/KcinJ3m/eOJsFWrdLa2BggKzgkN0IyhszPLLlVvJPkUnRghbDPa3bg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770029854; c=relaxed/simple;
	bh=koqVbT9haV8hKevvv4+vTst4/cq7wqJg5Zd3zxHkCSg=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=D3Q2+2al0/s0IfYRTXzz5iabVcH1KTwEZcZXr7wGRODYK9woj8V1PFKWWnrievmM+50XzerPC9GwbwlY9eAWT2lfwP9TjVyXFknuGRkL17DIdxCr4M1gflbpsdIEBn9sQNPtBL+mVtGvaes+/zDZKr4R6KHYcfCg5PQQzVYwWYE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=HqR3F72c; arc=fail smtp.client-ip=40.107.159.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="HqR3F72c"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pDJg28bZkxde3Jv1zMDhGLrjElAezlpisl1rU3Uxoo4cXluPz3GwIxHnY16ECNTbg21b3M0e19pyHi4YHuTeYjcmF+PdZyNLFqZX7M9l3hk3KHwYEDM+xHWJcbZ+IhBwCl7YV+vf1q9oD3p1HiBh1es+6cvN4LbSEyKQANQR4G/KtJJpc/wOlnQNHFgTptW1bfZScGeeLSp43f9rATQ0c/hZ4mVSgbFXBqFDRJY/vbDSt+RXgFzGDZChedwWeoZa+sSJrTFpm1yDEjd+Sc2BlhHv7t+9TpilwhJYcs0+FxBCkkaeSlhe9npPzztburn8SMWROpKXRMvi0y1HZ1viAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0GcdCJR113dLw9CnVXcPF2ZpRBSbIV3PCQBiIZGEUcU=;
 b=wNz7ZEtc+JadTU92l77Eh0kKAAjkULQrbrFsssN8aqgMbTKo+re4Pn9pv2cHrp/tEYEvpG8dAV45V7t5SOuuHRq6DrtyL27j7XfJ4B7RpSJcItcSPgWNdL7Rmmtdx8mJF4fLrFiz1HagIdMqAji8IUvTGZbVHZi58o/ju6f3Ynr9JEsYCUfuSHoZomijalf9vyhzLVn+6W1cGF55eSxnpWA8w+acpXG/lOmJAE1wD7n6HTtoQ+d8wLGdFP6gt7qspfVU0HY5o0GUigsqtZ3APv8C7MXUdakBeGnVXbuNHzM1Dx8iDNnpMyaFgXXHckPI7wBHP53L9T4P6qoiLekeYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0GcdCJR113dLw9CnVXcPF2ZpRBSbIV3PCQBiIZGEUcU=;
 b=HqR3F72clYm7wGywna7ksqTa30WMN2nM429tTcmqjlfe58JxNI5cDbKq2kXHYDzcWHWKU1AuObxbzJp+L0TetunIGrPD0K/IDEEysiQSuGnuwb3xF4vh32xfqXfAkJtlCVi9fcYpMkB1ek607wkQ9h8ms19vNwEDeXXk6fM2QzeSXHVu1XZUHfs4pxxBw5nDjdzgxB914V7CGxUP/LwFZOWu/MUR/TmLhdtsXxjwUaTUO0Pyu2XPGoVDAx31GjwSv10UfWOz7MTTuEPMUzTeLWzPMOz2Vev98CpFmmPZVW0HYfoRG67zO5OqGQnZwYGGql8j8oL3GLyN5zAucKybeg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 by DB9PR04MB9702.eurprd04.prod.outlook.com (2603:10a6:10:301::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 10:57:29 +0000
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc]) by AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc%5]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 10:57:29 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shengjiu.wang@gmail.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND 0/2] ASoC: fsl_rpmsg: Add support for i.MX94 and i.MX952 platform
Date: Mon,  2 Feb 2026 19:56:20 +0900
Message-ID: <20260202105622.39772-1-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.50.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0199.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c3::14) To AM9PR04MB8353.eurprd04.prod.outlook.com
 (2603:10a6:20b:3ef::22)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8353:EE_|DB9PR04MB9702:EE_
X-MS-Office365-Filtering-Correlation-Id: f76c22f9-5eb6-44c1-7bf4-08de6249db7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/Z3jSdttMBxCZzPhXi3eUZEhiTPi+G6Oa8QzGG/kaAMr4lF08ZyEjyPSc/1u?=
 =?us-ascii?Q?bGDQwvBJXIBga6T/HiKNDXzcRuf8j1uARuddiBuJV6ec+HPdnGLA0CaB7NUd?=
 =?us-ascii?Q?CyNkBKbJqzsXkdMRjbrCIc/vA9FD0QkX2rb2D+j4bvaRy+wb1EI2JWYRreAF?=
 =?us-ascii?Q?ynILD0bJbAnJscRjfq4I9+eU3HXekO6vpW4qYNLJWBOmS763g5QNnTEPraA9?=
 =?us-ascii?Q?+cnBOnSl/ol4h62pnpzla+GFbMO9vJrf0yopeOlvES1doYD92DkIa6eLuuK6?=
 =?us-ascii?Q?G0FGjBHHaZxWoZYiVIbdrCAYUlzD93rFUYfSRoHF60sMkAkhMOGoj26IPS0i?=
 =?us-ascii?Q?5lROxkjYO0385movymWOPOb4E/DzU4ki+epivaE3ZY7IMy8T230lIIigLA5J?=
 =?us-ascii?Q?I4kXTFInSWSHtFHcDaBIOW0MpWVI/RpOTHFvM5syWaeiPyyoQTj3vw9YWefr?=
 =?us-ascii?Q?gm3U5pxC1+TyoMbJ+DSxh6D+UU++H26HWy9gbXo8DJ/0hXpEqkcwT0zOVVtB?=
 =?us-ascii?Q?vstxqwMQVjb4jBF57R2qr7nrH74QGdrAP+4nngSaXaEM3MHdN77zHeO3BZgp?=
 =?us-ascii?Q?oS5ZEc1MO4RAdfMdWkH6IMfpuuJMIaQEJM66ppEuY56bzjjb18qbHQ7/fYjJ?=
 =?us-ascii?Q?GDXk2FDzM/y279yfy45+YbVf+NcJiCLiu34Gs4AWoJzddrz0iVUigk+VX1iH?=
 =?us-ascii?Q?o2PEsBRD0BzorccmmNx1iCotWHkHWdBMFyCbExQjvOaB2NWV5nWqQUm7rNk/?=
 =?us-ascii?Q?N9M6x6HGVt3QzsPAIDA6srIcckaG5AeZic6rEu3VGSIlaBZETxbAK5QlMYql?=
 =?us-ascii?Q?AweFtmK2dS/8dXNAPHpJGPEyjuYIMoFSYQkaV8MMFxNSioFZSzDgnbl6XOWZ?=
 =?us-ascii?Q?vTgwSGS1XddO4Z64FUC6l1jwZy+SSpNApUoGsv7DoAWadL3ei2TTmuExauoZ?=
 =?us-ascii?Q?2NLQnbz+BaR7DYcMSzQnqhuO9PcbBcq5FSEX+9o+IEarkeTwP5wX9bIO4ow1?=
 =?us-ascii?Q?/tv3Qb1Qz2JcBH1uuxsphRTGPgKCCDVzKhmrTHblSv5bknoLZMRfZ6bgvNF5?=
 =?us-ascii?Q?HdQaMvn7sK6zm+cTR+17oKD8N8vAdyuf3guUt+woCauPacJTH2k8/4t04nlW?=
 =?us-ascii?Q?aOjLD81V4X6VsXKEcrSAHGA1Hx8eMbEf6Ynkky2ScgYB6MBmra8J/bQtaLAG?=
 =?us-ascii?Q?A0xDK2cJrPOHhPOXwxiv7+bp2k5xZkiFJKP3wbgeAARl4pTg9v4n1O5ATJUk?=
 =?us-ascii?Q?v75NHeSE5nm2RTYq50xCUkRjOc7uOSoR2SCkMXyNrUBsYkfoXpV4k6nstp+x?=
 =?us-ascii?Q?gRuD2B7UodkeVj/iiAoG/FhDFpf4jRHOBxnXrAHKiUQ70+Cb7u0Cjb6hb+vH?=
 =?us-ascii?Q?W2yHRm0RXhW83Nd68gqEhotLq9RZ5+Q8yAKAYRQQlW3OBIqLPU3jnjrFhrg2?=
 =?us-ascii?Q?jptQLmPfcqqtBqYkNTpwKbUgpSy80NgazFoNIwNI5fa3q3l+6/qBRSLPmbyy?=
 =?us-ascii?Q?LpZIawUTdvlgfsImIaFcpcDCQovPjO6nca2iOYdHQ4VZ20uwLbJVxx6CwH4c?=
 =?us-ascii?Q?5i8cWQmvJk4krXO5pq2DtvcngH+47z+wFTHD45h7hekhDGw8tob4ghfBtY2q?=
 =?us-ascii?Q?216rK6K9D5O66s7TS5lcZ7c=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8353.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+ppRIlCN5LlgZNTJCrmtUCqy2Tprsq+PR5IAVEURdHjCcQvN7hvZ2s9kIlWn?=
 =?us-ascii?Q?qYnrWhcweqPWWlViwx/g2qL0kMXhu5ObSI/HUiVOo9fn487nHvv6VAb3hZXb?=
 =?us-ascii?Q?jcdNJSHxKx5dw80NmovJYwcr/aIp7NDri3oCRcwUYO2mb3euKcCbkscczzRK?=
 =?us-ascii?Q?YBZb/z+F0Ji/addjqI8WAY0CoiQnjfxnn/Z4OFa50gUetLztuV/1+fxnCZdx?=
 =?us-ascii?Q?Hkq45fDyo9QF9BrQS4rEXUTc+JJ92NUJKMz20ZQbp/wEgvwvnXpK2jlOkZrM?=
 =?us-ascii?Q?e2jl3112qQfxT9c6+wbic9jFfO3DbCLWke3IDu2BntdvlvZFaSv6Vnr9+VLH?=
 =?us-ascii?Q?X8MUv4Y+EISgGTwF+AMPecn2jsfdazYyvaNEdUJVaOzmAEwf6yliDZtbk0vr?=
 =?us-ascii?Q?Q6KraKP/X5xZZnjPvR1sALFk9zfkR/oqRhzQv+h4go6vjuxPP1Sbvy6orxMu?=
 =?us-ascii?Q?HZ40h297jRrX6+i5hRzqU24S56KmzXUVrx0nf0dkhT0vW63B4NJOkst1lWi2?=
 =?us-ascii?Q?NehfiI448OsEramd/EvOSq7hd4o2t3bmjORv823UoHnFL1r/bS09dDKcPgHr?=
 =?us-ascii?Q?IjYGITsFIPqPZYy+gDcnE6weemRDKBCmsVC0ftawC2Ouk2h2Sai87ZH5MUTs?=
 =?us-ascii?Q?4SNbgk5uUhl7u/AJH73Wb57EFCzn89qQTUBrrbL5cSb4Tub5S9+yGmNgmtNY?=
 =?us-ascii?Q?s+TdOU/WvfjULDDhMh/6ztq9sDCFqhRvFs8LPePXBgjT1VrFbF4lxU/UPWkf?=
 =?us-ascii?Q?AIeAqXR0i374kzDLcHGeSusLaZJ7qqUDzGyZ1KeQLYZzocSFHnxlCd00ZCMl?=
 =?us-ascii?Q?ZC97LLT8GxAiKc2GGI27FNptVrC6/BXoqGokrOpvpQrDGQWvr8qpNhtqpwbv?=
 =?us-ascii?Q?67HWNYZC0CfCOIOeN1cJqWJY2TbDryKIfzj/iY55AIGh7GBHgswiW0drJGYp?=
 =?us-ascii?Q?EKfFRIFr3f98J/ZjRFA4XWVRb/MDJLqkJRBZROBAijGXUAES5HPh1+BjJ+1A?=
 =?us-ascii?Q?kZj+oQn26FIy2BSdq8jyScWefnZM2sb6sl69ZiCO7seHe6MIdt+YMOUu538r?=
 =?us-ascii?Q?APOdZkO+BDdLJgbuj8HNdWU2Nf3yf1lk3ygPjCd5+7wGl0CS/OOqNmJhXcMM?=
 =?us-ascii?Q?tOcKpFfDGvgQqkk6uSSHKHTQMrZM/FbW7bT/uVkw6EDWrGXRszmP1PTWQRCM?=
 =?us-ascii?Q?8OiDO455NeDz1Nv8AfJ++d73RONaYDbbuih4pxxUHIrlLOStKS0ZyRNxC6a9?=
 =?us-ascii?Q?DLsyyVvbUfz1bcbG+1f0wFQGHDkiG+qOVD4LzIsOc4KoKS52hrM+OchthpuP?=
 =?us-ascii?Q?vVi7U4bfua73gGlx78wBr9DhZMsvCP728o4MOKUDPfU1V7OaEsMpu9BIv9Py?=
 =?us-ascii?Q?P9gzJ8JvFS7srFjrwvjx+91IWTCa8OC/DfQv1wAFqGRt0GxjCdQC2peDDs+e?=
 =?us-ascii?Q?GMas98q2o7IV3dlxExdtwyj5CW+GEYNTPInJbS7wmlI4XVdHzU4pQgIj4bGg?=
 =?us-ascii?Q?zJXMxEiyl9xGzyMzdledVHYjioguWJPwFFppYHYuBfBrFZJxW8SmjM+jHrb1?=
 =?us-ascii?Q?n+guAf5DDhMXU76V5EyLL7pLAINQekXYkwnN8rmXKIKDkqbc89/IfD586IgK?=
 =?us-ascii?Q?HTYEiXB42I1/1bsxNzBQ+B+UqpOzFLqya8llt2c8WXcEu2zRlqYsoPdOQ4DH?=
 =?us-ascii?Q?C45ppvCkwre/TSabLW9oIMf8FbHT5UiAxXzm3pUI6KIPeKjHoGI7zESdZT6n?=
 =?us-ascii?Q?XVgd4wA4zg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f76c22f9-5eb6-44c1-7bf4-08de6249db7a
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8353.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 10:57:29.4354
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GrPvB8ueqnOySTfS36fcFCIAqL1ziJIUefIXakuCcnO5y476xnZwDuTTNqpSs3Hdn6J9cxxmwV3SXRE9TfMQUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9702

Add rpmsg audio support for i.MX94 and i.MX952 platform.
Resend to correct recipient list.

Chancel Liu (2):
  ASoC: dt-bindings: fsl_rpmsg: Add compatible string for i.MX94
  ASoC: dt-bindings: fsl_rpmsg: Add compatible string for i.MX952

 .../devicetree/bindings/sound/fsl,rpmsg.yaml  | 22 ++++++++++++-------
 1 file changed, 14 insertions(+), 8 deletions(-)

--
2.50.1

