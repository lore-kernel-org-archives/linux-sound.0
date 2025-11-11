Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011000.outbound.protection.outlook.com [52.101.125.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560BC1F0995
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821042; cv=fail; b=Bi9w8kOyWYtqQipP4MmtLaO7lJhorCU88DdJ8sxwBFQDpqwYdBciA+9JS2kpIdf9xZxEQuJwz5sp6H+R5T65kufQ9uSK6C41Dw79RyjVU8pR6PhzoUezEGWwUeWOd4X9NsmxjgdBbxI/HP2hBf0NXOBjs9tMBKLGpG20LyOSpPs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821042; c=relaxed/simple;
	bh=PU6ESBHt95blmhN3po/DAoyAJ7LvpRcs0Kzuq8y7iQg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=fRVH/qXk8BoS+ixei7NFH62KcPUHvR+POwN00XPJ0Z/tC3Msn8UmGK4dcrpOPP8YnlrKvi+yhWgwg65Ge5VRZKXYhXyWAM7yW3Ses/8hqwHiiEJW5SB7QgDtzbK9W8oOLWWlp6H7+NH6rEQitFgBLs71yK9F/P3aPEzO7//gmbk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=pRfttW4c; arc=fail smtp.client-ip=52.101.125.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="pRfttW4c"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dSxffiLDwgUOasdWMmmBm4liG+dcfy6GlquUSk9gB5/QoOCnGghpdcGIaIH1TRNBiNFTyEhT9c7JrIuOzQLWmOsGbZP7JmRtBGZmdC3e6a2gye7kch67dVoWmtP+tU/57xwcN9Foxfphmm262jc3UHq06K4FDn8vdpW6EylV94mxLdmECUaxAMQwDEiKn7iUsI6K8N8ajR2h47+ZXAOThAV5GwQ5tWekkLMC6/bFOwX/PF/PTXi8Th0tKP8Qq2VYn6RZokIGVS8PMr1bx6Ahc4O6s+lKVVCE+mqRJWq/Neg6CRaeeGnA+8el/7S1JoDX3KTtLW4CCFlXV2qIExtZJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ydvnOcmz+077FUJEbm+C6rS2x2twXmE+/xaj9OKckc=;
 b=Z8HN9z3H93bf/3YQ9jScmBfEpNpqmX+oGe8g6s+qqTcbkTsC8Qvf9ebFRt62BpgHGkBDkSb0kcZbOVIgnR0RrzJ9NaDoKvNvKNFtAHJvtTSF50aJG4//KrnKDxPYoyYLWIEY1Qv1okXI/ErmGzwm4fvhkaad1INc/9ihsbw/3ScHZOX6Ohx0dyDh1Vy1QqbCxbp+YJXSdaJvxI8VnBNsqB8BbdAqwnQMAKPcuDgoGX/9QSuZ0hypFMTIqrFxaaJfYNywdsc67Txn0C6p6slLz2YP2TreXgPocduvfVVDYtl5n2UT12oIoLtmgx9a9ofwBZsSTpk+0vu7pnDZeTHUww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ydvnOcmz+077FUJEbm+C6rS2x2twXmE+/xaj9OKckc=;
 b=pRfttW4ccLtWxA/MlckeBOBn0P5uwMEzbu8fbvZvQRmehuWQ+Z+rU8gmEjQBJkFALCktcJICVGMK6X83ZsJ1o4YNmL/P/qCEMd7Uh4aUW9ekTfgXDJVPa6Ty0QLw9p4vjTK6Ms0iYhVjdZ/f6drZztn9lUiI7QqBk6CXSWlnKAs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB16440.jpnprd01.prod.outlook.com
 (2603:1096:405:147::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.11; Tue, 11 Nov
 2025 00:30:38 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:30:37 +0000
Message-ID: <87o6p9xvf6.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 191/292] ASoC: codecs: wm9712: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:30:37 +0000
X-ClientProxiedBy: TYCP286CA0094.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB16440:EE_
X-MS-Office365-Filtering-Correlation-Id: 4217c4a1-6918-422a-8f09-08de20b9894d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oGpb7OFAh9dGJttuYZTiRW2WkYQorz8mRZzWnenLT6e4kD4GdYvqqi9+IkCi?=
 =?us-ascii?Q?2umiYivYYJ9mnNQS1rtnHkbpui0ujHfAe4dAbZViBCOrF+KKJ36EfIKRnWg6?=
 =?us-ascii?Q?notAIb6IEVqKW3Kha/45/rAYGLEUeI2QAMSDmnPZiFr6s+eH4ZOVkvReWszm?=
 =?us-ascii?Q?YYUanx3HWIJN9KKBEspORKu8KNlj2bQurf/YjVZeEJv3OBG0eTlFamauh3o9?=
 =?us-ascii?Q?zQ7BIHr5ntWpzq5nk8muuBUQKLVnpPZhJNlFZzkbrerfbMz/3fVjgJKfAEeH?=
 =?us-ascii?Q?BPBkfb/+ytOijkeRFL35KBeMUx9hWRiNqOMiL1mopfCChOEY1eRIY9kd8Tnp?=
 =?us-ascii?Q?lqPc2vM0lUPc6AcxBDejayyTCe16fmF9OvLV5SsZemd6UvBTn3QPLf7KzBPx?=
 =?us-ascii?Q?tut14hs3d4Fm194XN/MzxFfLoAXUrQAANB0+QzNWdxwaTpDSA6UpmVlBn03X?=
 =?us-ascii?Q?7XdtZz6cX4hlERN00rrq/dc1I5IWoVuJ+iLztzAtKCyeiBEWW9twxThX12uH?=
 =?us-ascii?Q?W+vMDwOE8EYOawiyK0Wo/yMFBMQT/7Gwiw6u8ZLd3g4ulkG3KQCNlEyVwYw3?=
 =?us-ascii?Q?fxpgavJi0xH2gCkh2FXV/M11KYOFyzRaUkJusHoVQw0vI04PsFGI5n7j0Zt8?=
 =?us-ascii?Q?+ITSUXS1HdGhwb16VV0ETsQPmV6V7QBlASmZz7N5Z1cUFVMCkBvsH/roAQy3?=
 =?us-ascii?Q?zJKVS7WthilXhk9lb+94yUjqVK5JhHyJYJK5k9vrghNLtVkk34Cxp2zv3DLS?=
 =?us-ascii?Q?oxGTHZHUql1CmsXEZwYOPiS/8+7aIP6HyRQK5hhdQ7uqHilx+NKZXMC6tgR4?=
 =?us-ascii?Q?2/5GoO+G9A7V83BDQ5kR0f0pEGmmyPCvwm822v+l77hsWhGbRh93Pja1cnAI?=
 =?us-ascii?Q?0m25PhQlhTCU+0TwHKI32P7u166UnGkY65aznciZV3eYV9yDHHkGiQC9cmn8?=
 =?us-ascii?Q?kjz2YJ0IngC+q+pOZp9drbZCd5zR/GBBoTRTK+7EKkoLgz/qh1dtQ9UR7aao?=
 =?us-ascii?Q?uZDlvfTuVakuSsLcK4gXzt32KulbNxbqdVio805i0cPYga0F9AciOW2QAfUi?=
 =?us-ascii?Q?11XFT3qndVr4sEn7HC2LHvA+aWhtWPfy8lhKqMMenlGqM4iTsWuFv1pXW75n?=
 =?us-ascii?Q?m6cAsOJ6t4CFGahOWc4wBAAhBpaWRL0xNVili5QjSjGpS+oH+4xXAtN5Q+gU?=
 =?us-ascii?Q?UcwceLaKgyLkocEooH570K1k3A5ZyzpOTSFRBM+6AcIeGx3xsCVfSRZtCjpC?=
 =?us-ascii?Q?V8mVE+5kUZ0HE7S6PI2+RP9SWNuVOGHsnC3ZhASUqZjDu8JwbAF8Dx2p1P5H?=
 =?us-ascii?Q?2z37844Kilz2Vk/m4gCf8OoLHMioixUQ66RRNzLqUUO9UwtYNRFXmbWg47Ra?=
 =?us-ascii?Q?dBfsH0iFPjZsJESQVJn8rCqj/uaOCqdkG53CHrTznX49tDlg+NeuuPoSPTlD?=
 =?us-ascii?Q?94uAQgIar1UrpKg23IKhDHPdyCf7RgG0bXHE5V/Il6qbO+x8VE0taLP6dLP2?=
 =?us-ascii?Q?lICcZSBUuzlLDjegQD8xCia6a9KofAyBgihq?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zQrbW0lqYzSOhb5mT6+FaNZqy5vYdHti1u+OTViE++pOGGxgCDNmedpt4SOg?=
 =?us-ascii?Q?Tce3Lu+/uwIP59C4vD3WWJpeQ6ynoVdq0I2HBgfvqyBVgYYrPgv3q+4I3LTK?=
 =?us-ascii?Q?VwggRI8O4C34YwI5fT0fcI0lbiWFmbJTfwsFylgcrDVXE+C3gInuWOwo6AZH?=
 =?us-ascii?Q?GSott0kyjQHIAqN1acuFZvfLCSHDeGJlNMUYE1jdIcN7d2mV4L4WZl5YmF0B?=
 =?us-ascii?Q?a/rkG4EIKgEJ8Zk51fAEG05mYwaO9D2A0B34k8n3shU/s5w8QyxAgRK9N873?=
 =?us-ascii?Q?68N+KSgjuyVuxNie1fUa/HLuV0LFeVjEd5OBNonazlMqBZQYgU90aZ3Nsixu?=
 =?us-ascii?Q?Uz2SZNzVJuMrZsxaepZah8UI++iKQBRVhIc7CH3zAcyAyqu3jQQEwuTYgAL2?=
 =?us-ascii?Q?RyPlFecQwL07d9nsKg2LsGqUAYDo8fsGkbh3FH9Bp7PeVN1t02C8MzOouZl7?=
 =?us-ascii?Q?bIq0NkesEVkws3SzmJs4+MFWmZBzKTLvZQ92BZl3LVad5/KYimDgAc5sTRhS?=
 =?us-ascii?Q?7aVNul7tpSEn06AVVJWyR8zdiJYi1GcQ9vcFk8DaLx7jxd+cedy5kbXCEiUI?=
 =?us-ascii?Q?brFQuMtLEQZJ7FXyOaRD3UkIpaheXEEqClTMb7YC24YOr5u+W82vQeo1+6e9?=
 =?us-ascii?Q?8D71ku0lENbyGDnXw64XWIF+9qWMZu3uu6McOeWlA+wY6UAdzdpb6aeR/eUP?=
 =?us-ascii?Q?+aN95xPpf6OZeLghnJ8xpeEQww8oLwA0bXrZ5ekoKvNmtv9qFfjS3CECPVTq?=
 =?us-ascii?Q?XIb+T5lz/2xkJ84ON2ePh0b4cZ0nNw7dN42gQSPWuYX+RExedo2g6bnmGz8N?=
 =?us-ascii?Q?o241RrmSyKo9Y1CE6IPAFjQ55PoUtnFMo//sFiC3oehQ4LUKs8agaY4PmqFo?=
 =?us-ascii?Q?A1EKP9pjy2WkfDywzwnWjAOGo9nWIihABn4TZHfoYugq3bRMhqH+nG3NOll5?=
 =?us-ascii?Q?5QqH6BiXLL1/fzk+ISjkim+89Rv8s89CZfVBEuYmF/jrzWDSFVexHEFFp4Nz?=
 =?us-ascii?Q?KuU0r7HpzDCtO3L386biMjR62OzYcsFIWfcToSBxgjr4ruPXuxQ1n570gb3w?=
 =?us-ascii?Q?C6+ivePAE2T181DMUTzwK952UQG002MfUMOVQuo2Tx87sxjld0JoJevnWOJh?=
 =?us-ascii?Q?SYhzYrcTwr9trnmBxO3IHGvRX9PI2j9DuzGkWU4v223PHpvACEP/qLGF9vf/?=
 =?us-ascii?Q?1Y4KAKWj26BbLePCya0ZFhGphxteKPuhDO71Pryl84gxJ3Ft0IIWMuU6Wzkv?=
 =?us-ascii?Q?zJllC5HF9s9jbyMk0s0PlV/UpsKJ+iZrSKBFIQzJEn6Mlsz7vH0XkkoeZ3Yp?=
 =?us-ascii?Q?88ZxfsuY2S/Wd/dmkKBuBnHiTGEnqIipM0DRUYBEYl4crtUX7IkKqimPudFo?=
 =?us-ascii?Q?6v4PV76blmyyymwlHvc8cbP43S950JSa7ceyssvfipAAFXMsvmnwI8uHaStU?=
 =?us-ascii?Q?gPq1zlPx37E4mfHAlfJylUeZ2TEXoHr2BR625wPzZK9fmn0Oqi5qYdY0FgrB?=
 =?us-ascii?Q?5z0C0Z6wvy5F5ahw5551cAH9eF0m8pvRtGwl9t8SzMCh1Ps2KLbwP3ZKRhAD?=
 =?us-ascii?Q?5sa5win8bcIZpzWhi6+eQDoFPz0JhSyKkLG3t/fy2xzOqTfg7ovt8x+F/H25?=
 =?us-ascii?Q?PJWyF6VN+/oXXmomIeLOOS8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4217c4a1-6918-422a-8f09-08de20b9894d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:30:37.9067
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kXqCEPN5Ops92VRNIxSm0DtcCh+dZDe4JxtZEU0q0bZuG6HTsI5ZU9D78v1bmWsgZMhDxxfAsScr/8a9+gwHeyJeHqInWd5RUZd60Hqpl/LaN6AALcTi5AY/8cA2NWF+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB16440

This patch converts below functions.

dapm->dev					-> snd_soc_dapm_to_dev()
dapm->card					-> snd_soc_dapm_to_card()
dapm->component					-> snd_soc_dapm_to_component()

dapm_kcontrol_get_value()			-> snd_soc_dapm_kcontrol_get_value()

snd_soc_component_enable_pin()			-> snd_soc_dapm_enable_pin()
snd_soc_component_enable_pin_unlocked()		-> snd_soc_dapm_enable_pin_unlocked()
snd_soc_component_disable_pin()			-> snd_soc_dapm_disable_pin()
snd_soc_component_disable_pin_unlocked()	-> snd_soc_dapm_disable_pin_unlocked()
snd_soc_component_nc_pin()			-> snd_soc_dapm_nc_pin()
snd_soc_component_nc_pin_unlocked()		-> snd_soc_dapm_nc_pin_unlocked()
snd_soc_component_get_pin_status()		-> snd_soc_dapm_get_pin_status()
snd_soc_component_force_enable_pin()		-> snd_soc_dapm_force_enable_pin()
snd_soc_component_force_enable_pin_unlocked()	-> snd_soc_dapm_force_enable_pin_unlocked()
snd_soc_component_force_bias_level()		-> snd_soc_dapm_force_bias_level()
snd_soc_component_get_bias_level()		-> snd_soc_dapm_get_bias_level()
snd_soc_component_init_bias_level()		-> snd_soc_dapm_init_bias_level()
snd_soc_component_get_dapm()			-> snd_soc_component_to_dapm()

snd_soc_dapm_kcontrol_component()		-> snd_soc_dapm_kcontrol_to_component()
snd_soc_dapm_kcontrol_widget()			-> snd_soc_dapm_kcontrol_to_widget()
snd_soc_dapm_kcontrol_dapm()			-> snd_soc_dapm_kcontrol_to_dapm()
snd_soc_dapm_np_pin()				-> snd_soc_dapm_disable_pin()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/wm9712.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/wm9712.c b/sound/soc/codecs/wm9712.c
index 8ff4b5f13b3a4..83cd42fa0c281 100644
--- a/sound/soc/codecs/wm9712.c
+++ b/sound/soc/codecs/wm9712.c
@@ -215,7 +215,7 @@ static const unsigned int wm9712_mixer_mute_regs[] = {
 static int wm9712_hp_mixer_put(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kcontrol);
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kcontrol);
 	struct snd_soc_component *component = snd_soc_dapm_to_component(dapm);
 	struct wm9712_priv *wm9712 = snd_soc_component_get_drvdata(component);
 	unsigned int val = ucontrol->value.integer.value[0];
@@ -259,7 +259,7 @@ static int wm9712_hp_mixer_put(struct snd_kcontrol *kcontrol,
 static int wm9712_hp_mixer_get(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kcontrol);
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kcontrol);
 	struct snd_soc_component *component = snd_soc_dapm_to_component(dapm);
 	struct wm9712_priv *wm9712 = snd_soc_component_get_drvdata(component);
 	struct soc_mixer_control *mc =
@@ -611,6 +611,7 @@ static int wm9712_set_bias_level(struct snd_soc_component *component,
 static int wm9712_soc_resume(struct snd_soc_component *component)
 {
 	struct wm9712_priv *wm9712 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	int ret;
 
 	ret = snd_ac97_reset(wm9712->ac97, true, WM9712_VENDOR_ID,
@@ -618,7 +619,7 @@ static int wm9712_soc_resume(struct snd_soc_component *component)
 	if (ret < 0)
 		return ret;
 
-	snd_soc_component_force_bias_level(component, SND_SOC_BIAS_STANDBY);
+	snd_soc_dapm_force_bias_level(dapm, SND_SOC_BIAS_STANDBY);
 
 	if (ret == 0)
 		snd_soc_component_cache_sync(component);
-- 
2.43.0

