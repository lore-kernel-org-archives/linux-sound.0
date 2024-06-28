Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2043.outbound.protection.outlook.com [40.107.113.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368E2125DB;
	Fri, 28 Jun 2024 01:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719539273; cv=fail; b=TnarXU1jAFoD4/Rqp88rIGnOwO+mtdjp8aW3ZN3HU2+J/wGKFEjF6IJKYRfO9QG9r6sf985Y+eJBU2p95/z/zrR31JJSJ91Qn9cVvB9Qlp2Byx03Ay3MIP1W6C0R8EoIKUr1tWdBsfvFK5m6gyYGMmdGzEbldgQmWFUmf3wiI0M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719539273; c=relaxed/simple;
	bh=yMfUyPemph3YCtQ34l1j3nsKMwJ0uxckd0wbarJJEmE=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=TlbcPSpa6Harr2Cg262sOFQxQTketBTTF8KouVBp7ux0TGnfhRwoK3x+Lk7Yfrz3Tww5mbKkLdM6LmGuRaABYXAAvDJ2fzGlI00UG87lJaqsa0IOQbUEMBHRstgMl3d6u8CZjsqnZxEbcAJDHQw3SI46tNnlKuJ9wXxk34DiKRw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=k5kXgC8O; arc=fail smtp.client-ip=40.107.113.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="k5kXgC8O"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i5LbNcCqEU5ly73/R52+YlocHOKCUOyesab5YiTW3bWYGQOH1NGTzYdbper2N2rqeLGH/wuIBhlrKDo/APZ/oQbZ7JRVyu/bN7lMs/FcVeUCciaCeyIyWmpv60vD9Sdg6vUhmQi4R8Zm/Xl27NSD2nYzW21Req3hevDsUd7IfjwGaJ5GRKT5Ek4hkpvJtpiqiZg3c1sqGzuWKhmIElJP4jXLCwVbWdL7OOFNF6TL75KAPCrje6SpJWmd5EcLAQPZFsWjuUvkKflkf5jZgoGeLKhWHZ7zJzkAYZRg3AtTqbHdt3j34dk/1lqe8biD34Lqwq2b1OTQBic8Up0OpdCwhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Tf8UpneksWrbhhJrPGvFmEtI/HKBn9yRONK+Ery9l4=;
 b=LR80IR6ArcVaXP7vS23mRaR/ph8QrdfgyG/NIsDkhRLotNgEZ/qUZsIQ60df/RE1rF/xJYIVLw7Ey6kJxCbV3VxdArUMp8/hnV72xAW+qI9Sv9oWK0lcvY84kSgTJFCNHamUf9iY5Uvg7tOh7k7pr2zKz3IUAJKCnsjdwPqk1z5OzBfrRFAzaqD54KNR3BLc4Ot51IBUXsPD9sJvNiwthgrYR7jxM2ro0Q6Y7WVs3X6AwQop2J9NxljmueCL++i59No316XnD50f8ZuRoxYqMWecFJxyRczYbpZsEZkDMnFA1gfcEe90kd+xbMyLZ53AmZn2casbhCx5GFPKZdvo9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Tf8UpneksWrbhhJrPGvFmEtI/HKBn9yRONK+Ery9l4=;
 b=k5kXgC8OBqQ+wWILNKHKZ6v2pOoWMLJCkfciA3T5mNv/hhcT2bM5JkjAz+ZkFCbC0cpzkWMgwK4QbQuWrqUVm5ASv1anZRFZBk6iaOhwshh2P9YV0Z3OtKFtWjhuNnVtqk3waSdEavkTqHbFn01SDUcylLbvRCXC9My9wn1Zv0I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB11434.jpnprd01.prod.outlook.com
 (2603:1096:400:379::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Fri, 28 Jun
 2024 01:47:47 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7719.022; Fri, 28 Jun 2024
 01:47:47 +0000
Message-ID: <87frsxaldo.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 1/2] ASoC: simple-audio-mux: enable to select MUX names
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Alexandre Belloni <aleandre.belloni@bootlin.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org
In-Reply-To: <87h6ddale3.wl-kuninori.morimoto.gx@renesas.com>
References: <87h6ddale3.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 28 Jun 2024 01:47:47 +0000
X-ClientProxiedBy: TY2PR02CA0067.apcprd02.prod.outlook.com
 (2603:1096:404:e2::31) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB11434:EE_
X-MS-Office365-Filtering-Correlation-Id: fe43efdc-a508-47b9-5879-08dc97144fce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|376014|7416014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xO8vzbBOIeMCV8/Aq8LSOb63yKI0lNmKnUJngxdkIUGDqz6c7RdpbbzOFLzo?=
 =?us-ascii?Q?xBLAe12+tDod0/qVejDumQCnSxt/Zz+kfDDcLf2xnU+pKb0tP1Q9TPBNZL+C?=
 =?us-ascii?Q?gKhNvJ5foy/BJY+OZYzXzWc1fhdkDdihhiXqysLds97KTnYoC+yd/eeqhF5/?=
 =?us-ascii?Q?NqKmjC3GEGsRASM7fTKUas5inCTQQvd4wGMh4WP8NzunAYGwrtZp2RAK7UUE?=
 =?us-ascii?Q?Lp8/ZZX8pu4T1mPqfsk1yTs4ujSKBwkwYUtz6avHjUoSJq2E+a6lEiCyuH2p?=
 =?us-ascii?Q?+7O2ocYYSPriLy5grUkvc0pgFKrKhlhPqsYFZ6St+bQiGc3QpJ3q6SbiNA8H?=
 =?us-ascii?Q?bUymcdQWC2avQLFVBLoklMXMCoXt7izsNbPpqc1+4P7SGeT828bNSxnxVH1u?=
 =?us-ascii?Q?IqnF/CT8RBkw6C2VkKHcY7ehiFIVCnNUUCqPno6P3mONRHKESiCPimbxtzTQ?=
 =?us-ascii?Q?yDW8qP74RnIZ8dMbUbrOg55iyKllUarsyGCPDK+rn7ZUdmuGCnbBcCVeqEYM?=
 =?us-ascii?Q?6S68dmZj/ZSO0mgd1qkZ0rThKlU+m51kUv4Z1UTlptTa4/WHM685BCA/4vOu?=
 =?us-ascii?Q?fB/iw2x5vPFarmrFlOQeJagsV8HyDHp2M9Q22BXUlsKc2XARN6PPqjvzidf1?=
 =?us-ascii?Q?DBvCiKR46hWh8bYh9oPQNQBUYMboA/IT/JNXFJZuzlF5Ni7In8EBW2g6F/D9?=
 =?us-ascii?Q?/IH5y8uoy3fw1uCWOcy8ZU015A4viiOkuKW2TNdVw9yzmcQxBvo1otb7jcqX?=
 =?us-ascii?Q?fAzeR23QsOe6BkOMJ7SchsRc0Tnn7x24ZcBIhqkRP4RE2K4ShYY6YwCD/Xbg?=
 =?us-ascii?Q?kczDa+drvmmLHZrc76xnXRmHuz7hXgYmzRW6FnSwEa+oKWbwZOfefJkwo5nU?=
 =?us-ascii?Q?OZlPVlMdGKEOEHJpAjQMlVtp9szRE8N7F22RZr4wVOjaMhnm/a0uB3le81Qb?=
 =?us-ascii?Q?xyFQLRO/NRj+IE8THHTLJMsMBy8O9383BIqDHwvqxI+y7qmZpYd/g4sy6QUJ?=
 =?us-ascii?Q?lBGcwBiH5LShU7RX2oxYRWEyKNFK0Iklchs7Y2UbJB0qZQRKarVrZ6Drf1lr?=
 =?us-ascii?Q?6vcfCrZggTC0sQPcuVAqk4otPE/08vvYFJUdD9QJdw/YPippjPwm1LK8vEw2?=
 =?us-ascii?Q?1oPRT9dpECjipjMiugyfhcSMbYm1N3u0o4MwZzh5wAoqRx2og9WSImbSbAiz?=
 =?us-ascii?Q?FdFTaE0PaItvCSmtwb2R7hB1R7KkLepgPu62WCT6Ky8v9nOVFeZfTRBjmUe0?=
 =?us-ascii?Q?Taixhx04kNlLrEvykxL24dveXClv+OajX1Tpr6m7vKjU/zyyAgetPgYSr57a?=
 =?us-ascii?Q?xud/X5AHdh+b97ruiSIozcvxaptOqM2/qzDoYVQpuQdFHDrpxOaU+RWMWEGk?=
 =?us-ascii?Q?wrrixz8HWaZKA3nxEJmxe5atfk0dHIcHnl7U/93GDKn8PTN+Msrgrfe3IdsX?=
 =?us-ascii?Q?8BZUejzMH3U=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(7416014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kvumHVyZNFUoSF8bP74vsNdwqt+7FZQy0IFKx3/buNRbc0TshoPQ7yLGboxC?=
 =?us-ascii?Q?JWm1bMHKl+aGjMuqOA/VFiC/SUYNhwvX7wheapPKutMtqXCYDUcc7JlGddV6?=
 =?us-ascii?Q?xQKWRFEMnXYpEd65nN0pTGAjzxIpzFGSNPVtuG6t7PGIxzBBmkcePKwQAP7S?=
 =?us-ascii?Q?ZFX3pza3jE4lP56HE91w2OqqSk0ay+WxYdWTQxjUO6ZK986tRL3Eq6uTJD6U?=
 =?us-ascii?Q?6LSInvXxWDvfMSJ2qclvfyJh5CAiEkhXwsm5hhEAdugEZHmsXBwTs6oxh5C5?=
 =?us-ascii?Q?AKG5vEHgI8J5ZgjKMiOJQJ7JBlz+VlVBdhR1qgSvu0pC0A0QR25gKXXYrT9t?=
 =?us-ascii?Q?AtnRT/GLUR7v+JjoWJJX86adgboqa9Hhv4RAwRsh6v+OzKIqxb4cDsIPLs5m?=
 =?us-ascii?Q?pAJJo1Ld1lhVox1EEX2dv9vG1ho2evLlgC+E81dXwmVA/Py5ULhl9jKMNPVf?=
 =?us-ascii?Q?PdsBdWj3ivbb6lMk2bKFAOj+jPGsvmt8cvDRZNUp8t5iEnmxTpO8Gu9EWl55?=
 =?us-ascii?Q?4uSAGHMXeF1Xr0Zv+397AnbHIg92GIM6XyaqgChriUk62NSqB1DMVhnnR5N3?=
 =?us-ascii?Q?4XXVLqfLunlee6i3aeyr48fTELrJR5fAOXkNyyAj2MhpxHaweQJ9r2dRSsnW?=
 =?us-ascii?Q?qcrvEh9RoOdKrI3lQEgwHxzSm1Mbbk8U3rXcQWEKrEBguS/UtxQnQsM0+QvS?=
 =?us-ascii?Q?oHYnTZUXQg5/BNkseBFDuANqaQp80JNytnJvWjuFbTy31vxlqMVlx9SFjKx7?=
 =?us-ascii?Q?z+lP74ekMlLJtW+GvhdAaR3Je9Oshg8Fuo3hkKAgK8aQBUEiaDD3+mxTSz0l?=
 =?us-ascii?Q?ykdpGW3bKOfORX36sZInCumB/YxZIiashvgLQHUAjAHbLYF+Gk1w8bFh4gCs?=
 =?us-ascii?Q?LXOFqgJn2Ih3NuUfDXeUIFTS/NKyFrP5SdwDStcESPsUuwapKxi3Di1SuPw3?=
 =?us-ascii?Q?iWoxhhYSqnb3eMKB59R5nSg5gSQEfVk76HvxpAq90yrqCcSjVHXqGOkp1+hC?=
 =?us-ascii?Q?8dgLc1dbAQoRH7eP2NYqnHZheKNPynMFvBvamljzLi8C5GiNOQFeE/kpgDsO?=
 =?us-ascii?Q?FJ3xNzNuC6njuZAN39l8NxXiSxQ/Gk1d5e5gaB0bMMK3IXLGNZFCc39UZi9o?=
 =?us-ascii?Q?XGX9pvh1qR1ivXrIlV7pfTAd7+0UjWRbE749kZ2ND28futSEPCGXlJ6SgpHW?=
 =?us-ascii?Q?CT4/H+maJr9j3kOrkNM4U/9GhDRQEzJyrB+M0Wf6LU0RidqPzBUFDzfdICrs?=
 =?us-ascii?Q?cBD9HKdGsOUH77YOnvS8qe7CqB4Hom2gjQyO8aUMGdtI56LhRZCrMJFeHS1O?=
 =?us-ascii?Q?g1K9GKwaVA2qDj6246RgjgbpBUYyOwdu+ZTxCicMxjZU4Wqt5Y/kqC/7mluq?=
 =?us-ascii?Q?5XZe1YlDM6bF/jU9VeRE5L1hH+b/yrIiDTfwcmmogBGPJK0fm1zjYQB5XJC2?=
 =?us-ascii?Q?8x/+fWMyp25mghHQYzwN8sk4lYX3zsM4zDY8kBqsrgCTVOfBOmdK1k3ZlAuv?=
 =?us-ascii?Q?i12HW0D+8+78b44UtcWKA8SIQnINfH6731ip8lld2QMHWQJh/gC+f+W1EvJj?=
 =?us-ascii?Q?91IZgKgjwshel5bpevicDTxzaxSGRDUOI7tnwsbivIAUECOAhyJIxzG9WN0A?=
 =?us-ascii?Q?jctIG+EiEj3Qq5XlSGlYGSA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe43efdc-a508-47b9-5879-08dc97144fce
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 01:47:47.4915
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sf0JnBzzg3aiaeOnuXx4YuysZAjmN9BZ1q1YM1jdvyaVpqSAHNIBz8dloHghaCgGKO3Gr56r/cVkJ/7HeBInk747WZbkb9pLt63cTvoELTHeUQD5ZpRiK38ZI3qCqH96
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11434

simple-audio-mux is designed to be used generally, thus "Input 1" or
"Input 2" are used to selecting MUX input. This numbered inputs would
work, but might be not user friendly in some case, for example in case
of system hardware design has some clear labels.
Adds new "state-labels" property and enable to select MUX by own state
names.

Original
	> amixer set "MUX" "Input 1"

Use mux-names
	sound_mux: mux {
		compatible = "simple-audio-mux";
		mux-gpios = <...>;
		state-labels = "Label_A", "Label_B";
	};

	> amixer set "MUX" "Label_A"

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/simple-mux.c | 55 +++++++++++++++++++++++++----------
 1 file changed, 40 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/simple-mux.c b/sound/soc/codecs/simple-mux.c
index bf67de12d20b..240af0563283 100644
--- a/sound/soc/codecs/simple-mux.c
+++ b/sound/soc/codecs/simple-mux.c
@@ -9,12 +9,21 @@
 #include <linux/regulator/consumer.h>
 #include <sound/soc.h>
 
+#define MUX_TEXT_SIZE	2
+#define MUX_WIDGET_SIZE	4
+#define MUX_ROUTE_SIZE	3
 struct simple_mux {
 	struct gpio_desc *gpiod_mux;
 	unsigned int mux;
+	const char *mux_texts[MUX_TEXT_SIZE];
+	struct soc_enum mux_enum;
+	struct snd_kcontrol_new mux_mux;
+	struct snd_soc_dapm_widget mux_widgets[MUX_WIDGET_SIZE];
+	struct snd_soc_dapm_route mux_routes[MUX_ROUTE_SIZE];
+	struct snd_soc_component_driver mux_driver;
 };
 
-static const char * const simple_mux_texts[] = {
+static const char * const simple_mux_texts[MUX_TEXT_SIZE] = {
 	"Input 1", "Input 2"
 };
 
@@ -66,30 +75,23 @@ static unsigned int simple_mux_read(struct snd_soc_component *component,
 static const struct snd_kcontrol_new simple_mux_mux =
 	SOC_DAPM_ENUM_EXT("Muxer", simple_mux_enum, simple_mux_control_get, simple_mux_control_put);
 
-static const struct snd_soc_dapm_widget simple_mux_dapm_widgets[] = {
+static const struct snd_soc_dapm_widget simple_mux_dapm_widgets[MUX_WIDGET_SIZE] = {
 	SND_SOC_DAPM_INPUT("IN1"),
 	SND_SOC_DAPM_INPUT("IN2"),
-	SND_SOC_DAPM_MUX("MUX", SND_SOC_NOPM, 0, 0, &simple_mux_mux),
+	SND_SOC_DAPM_MUX("MUX", SND_SOC_NOPM, 0, 0, &simple_mux_mux), // see simple_mux_probe()
 	SND_SOC_DAPM_OUTPUT("OUT"),
 };
 
-static const struct snd_soc_dapm_route simple_mux_dapm_routes[] = {
+static const struct snd_soc_dapm_route simple_mux_dapm_routes[MUX_ROUTE_SIZE] = {
 	{ "OUT", NULL, "MUX" },
-	{ "MUX", "Input 1", "IN1" },
-	{ "MUX", "Input 2", "IN2" },
-};
-
-static const struct snd_soc_component_driver simple_mux_component_driver = {
-	.dapm_widgets		= simple_mux_dapm_widgets,
-	.num_dapm_widgets	= ARRAY_SIZE(simple_mux_dapm_widgets),
-	.dapm_routes		= simple_mux_dapm_routes,
-	.num_dapm_routes	= ARRAY_SIZE(simple_mux_dapm_routes),
-	.read			= simple_mux_read,
+	{ "MUX", "Input 1", "IN1" }, // see simple_mux_probe()
+	{ "MUX", "Input 2", "IN2" }, // see simple_mux_probe()
 };
 
 static int simple_mux_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
 	struct simple_mux *priv;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
@@ -103,7 +105,30 @@ static int simple_mux_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(priv->gpiod_mux),
 				     "Failed to get 'mux' gpio");
 
-	return devm_snd_soc_register_component(dev, &simple_mux_component_driver, NULL, 0);
+	/* Copy default settings */
+	memcpy(&priv->mux_texts,	&simple_mux_texts,		sizeof(priv->mux_texts));
+	memcpy(&priv->mux_enum,		&simple_mux_enum,		sizeof(priv->mux_enum));
+	memcpy(&priv->mux_mux,		&simple_mux_mux,		sizeof(priv->mux_mux));
+	memcpy(&priv->mux_widgets,	&simple_mux_dapm_widgets,	sizeof(priv->mux_widgets));
+	memcpy(&priv->mux_routes,	&simple_mux_dapm_routes,	sizeof(priv->mux_routes));
+
+	priv->mux_driver.dapm_widgets		= priv->mux_widgets;
+	priv->mux_driver.num_dapm_widgets	= MUX_WIDGET_SIZE;
+	priv->mux_driver.dapm_routes		= priv->mux_routes;
+	priv->mux_driver.num_dapm_routes	= MUX_ROUTE_SIZE;
+	priv->mux_driver.read			= simple_mux_read;
+
+	/* Overwrite text ("Input 1", "Input 2") if property exists */
+	of_property_read_string_array(np, "state-labels", priv->mux_texts, MUX_TEXT_SIZE);
+
+	/* switch to use priv data instead of default */
+	priv->mux_enum.texts			= priv->mux_texts;
+	priv->mux_mux.private_value		= (unsigned long)&priv->mux_enum;
+	priv->mux_widgets[2].kcontrol_news	= &priv->mux_mux;
+	priv->mux_routes[1].control		= priv->mux_texts[0]; // "Input 1"
+	priv->mux_routes[2].control		= priv->mux_texts[1]; // "Input 2"
+
+	return devm_snd_soc_register_component(dev, &priv->mux_driver, NULL, 0);
 }
 
 #ifdef CONFIG_OF
-- 
2.43.0

