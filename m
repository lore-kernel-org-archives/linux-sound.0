Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011061.outbound.protection.outlook.com [40.107.74.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04F420297C
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821083; cv=fail; b=CslHlLprcCmeLxWIAylQVEQI2s7cqbMswP7rsoB6Dv0lTFZ8rl1jKKgWUB4H7u8q9mZXRMc6r97/wTILzF7WjMPT7Z+32p5EPm99dqi7iXZxHIY/91OxRwppzR6XNjiHiyOCOy/gYI/Y3w+p2XpBn4LANb37ABsJ36FAHHGvZLU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821083; c=relaxed/simple;
	bh=6XL3XBcX1r3ryX3JdpzsAJuS3gxIEKjMh9zxdeQjHq4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ugVuRtzPOmr5w/Ger5LnmP9RxsWlcJ9gp7Kav5f4ibK10HMFULrqp3vUB0e3u/VwQhEp1wDG9PwMJKWjmRksTkfCpuoO7x6PjVOPvkp4vqjnpxGRcu+fZ8O+urKKWTwH6nTlBdMFtW5QF5MnRyB4CZ50q+HtmzIve6kyhGva3/g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=DNRjHwPw; arc=fail smtp.client-ip=40.107.74.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="DNRjHwPw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VYPE0fRRhZAVsG1mlMAwDS8/3QvOU4Hr7qUfbDyRPs/ywIKXAllzLPU44eHZP0dvj/kv0WBoc59Zlr+e/mtmYpqSPjicWi1b/0u84NKGiUvCGyyE3pM85eo2BtUOGyPn4YVO5tRPCjAPT2JwUQ5qyVfCcSwAGPdDcpCGnszHJjUvyBt+Ytr1hG1Rsg+1Oq3XFH8G6abZ6rgNH2EIpyCgQ6Lz7qbk90SSG00XrMqPXq4lhHAlsZqrUREGda9JDQNhEpqKBnseSW27RtZ/zFXJsqiS8tU9h4WkYEG7TXEDdZB4dFMdBKGCnThORpD/zHbkRJD8ptv4ShbJkRAQ6sHbmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qTLkcuf0AS9RWsBRx+etMspWtqHM1+TF2R8rwlqE1Rs=;
 b=sFQd7iu+veePONHcp009P1YKTbNFl6L5IOQZSXtCDbRNRdDOfr93a13WSNqErTWIMKZQfB9N1bHrEZx361VXJ68LflDXY08TzpdyWwmrkT+usEKSfuh1WKDauwfqHjrnjaGVb5oW5RykhZB4AOGvESOHwHCDJsyP5HsomBYKmAa4EuP59SSSyM7Gxccz5fGRfDrVCka+sPORqqcwXesVMd1mD8oYrfaU7RguCIdbInapYueg3inB2N13T95WIVG9AGa0nDQsHZpxxo3snVunMHJ84sHFa3RI+6+r7XgKTIFt8RlCxkDiUgbgrj/UnvaqAL5tkst2YBZGdFaH98AqqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qTLkcuf0AS9RWsBRx+etMspWtqHM1+TF2R8rwlqE1Rs=;
 b=DNRjHwPw3NnaAZqWbVyYr3pLXHT7mOdf2lcAJsfGmuPCyu3lVXi2sMGgBfh19dEjVS1hpwRJOWwAb0vnijTs+NanXq9KnuKivHq9/Isw4AX6KDo6VXdcVW9TMMP1YyiuYTHfojSI1sgjUFO2VK2yA355WTrNHKZjYKUXJxiNMgU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB9810.jpnprd01.prod.outlook.com
 (2603:1096:400:222::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:31:18 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:31:18 +0000
Message-ID: <878qgdxve1.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 202/292] ASoC: intel: avs: rt274: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:31:18 +0000
X-ClientProxiedBy: TYCP301CA0059.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB9810:EE_
X-MS-Office365-Filtering-Correlation-Id: 05415608-59fb-4930-e7a6-08de20b9a19d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qAIWtaLzLUSXoq7UycqsYVC42zYBP9l2FEoAluACQu13o1tCaKIzxTV0XxFi?=
 =?us-ascii?Q?NWLWiyDVYUMMCMl7uOEA+WfzlBMB0FRRDGvLRXQ5Y1KKYmbh1OvV1zWmwoc8?=
 =?us-ascii?Q?h7RLnjwiGdCEPwh+SL/71Vm3Ss6UvVX0GCzZbeCxuBQ/M9x35NR336B7fQ7c?=
 =?us-ascii?Q?wMqXj/La67Frh/Tngp/nLUwDXfzLsmGGLBESdypmi7cI+yjNpo6kei9K3K77?=
 =?us-ascii?Q?JLMas/6+OlqOvI9eaUBXHuktLqjWkpq8oyeNLbpoZbVDMw7IH32rHxqovs6P?=
 =?us-ascii?Q?UaXqPEAoLf8DIxKkVavRPfBR9WYZLxu4fXlKseYj5nuXmEcMWJLpR5V2Qih1?=
 =?us-ascii?Q?xI4OOJsxfbouWx9PfZXQHzrrtvlQhpSlXEvbMEnqR8Q0+2ba5/LkoI1RkKYt?=
 =?us-ascii?Q?ZZUURyK9bNEHefl8tgFGBZTSZG/xwUb7BpA42wMXQsmNVzivR/IN377Ee3hp?=
 =?us-ascii?Q?P39xaqFpcDzbOVcOCyGUJo4fVjKaM8a+1xU1ekR9+V+s8i1us4JGGMkfhf5O?=
 =?us-ascii?Q?W1ujlp04NetFJz97QPORDrIz/iuxAC0FRPwgcOUpsdsz4U6D359X8nQ7pJf4?=
 =?us-ascii?Q?pjfR8cRSjXcIDw1HQaebVOBWUBDKew9+A3F/t+5HEbetVYWANVNsA0LUDuje?=
 =?us-ascii?Q?/KVKMG/L85hcTyNJXuQNIphNwVSSO9YPoc7yVv10ebRypMePLwCYSkoelIzc?=
 =?us-ascii?Q?gqTdePeBSUrGnSQbuW8oIowX+nGD2oxGxt+RC/mDIa1n788yKILIJ6UL+9oZ?=
 =?us-ascii?Q?hj1n3xqK1bD1j8vfUyCn0vdSrH6TZ20KOqokrH0jBLZBDPnVVyVaVdnG0GOg?=
 =?us-ascii?Q?3Zp37Ajva2gYzPBmbUCe9b/1nm6MuSCmNEcsilFHX//8bODL910gH1tHg3VJ?=
 =?us-ascii?Q?jgHPlucDmTvP5U49+2y4XGS0/iTbGg8uDxdhNJ917PV7sQmwaG8uk7uPCkh+?=
 =?us-ascii?Q?JP6CwvFeIXIHZ+Ir+W0NgF4oIPrHbgItfLhyJuX3v4qG95jWvujoLqwAY8O7?=
 =?us-ascii?Q?lZqzay7L0+LlJc375e8qRfq+vvLU6hJgJp23HT7fG0svm/4mla64WtBHcdNp?=
 =?us-ascii?Q?UKH/pdLoUJKAj4QWwcC10geJ3PPvJjcCRVmOWCKkKghPuuVo0OaDOQ+NqfVT?=
 =?us-ascii?Q?jFm8vR6Q7VU/omuXW8IDXsQSzX0DdbNkfAropxzP3WSIVgXVQB07pie+NHsp?=
 =?us-ascii?Q?hrzGczljZEIexRb1SDKzG7AAkbgd5YPnTNFKnYK8Y7HaCNmWUMo2/6uwPeWI?=
 =?us-ascii?Q?lt5iV4mNQ9+V2Gz2P4tDM7niaWe6PZa+0dwDOpvmPCRFzRUZth9IgzZGhDcj?=
 =?us-ascii?Q?4kjOakHB81/fWNqGP44HJk91toKuaHE4nGP7hPHvAfhT2vl8zrDCj8qbOFlR?=
 =?us-ascii?Q?Kh8PtWQFiqSBaX56Y6GsOZ4byMmmm3soJCzLOLKpX3qJCaTvEjUkAH6M7WY5?=
 =?us-ascii?Q?V9j8TAOf+GlqRIHTWraA1mkLDhDK0W902NXI2AcYCpv8TeooYOEO85M78/4Z?=
 =?us-ascii?Q?hdOICX+t86KObr9fBAy/awFNz1E+lCBx7Zsu?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TMMJ1nxl3zqhT+XlvYGKwfTKDwOuY+F3VQEptXtMJyGRa60OP60Z52eYN804?=
 =?us-ascii?Q?5V5YD3u67Arubrer2sxIUH6I1Z3EbAekKTfsmkgI5XzdxWZAi4GClhTCFNvP?=
 =?us-ascii?Q?BKBVjjnCsShtuj22uptU3kg4g17qUCXgvCl4Ef0+RdLL29vG0V+Mm2ruSuiV?=
 =?us-ascii?Q?9mKaK+vdM1PHsAMtyGx9lF7kIOusc5Rzv+vGEf11xOrwlBszx6m1UJXifnxm?=
 =?us-ascii?Q?puNNDSWCyNOCsDR58HGqoEmnDCPtmJC2Pu/gQtSYLduVZ+bVREc8HH1z6l7s?=
 =?us-ascii?Q?EmG3mH+qbSm/I7WWc6tcWfrdH100B3Ebl/VrM03V2g4arpIDdK60XGiijh5C?=
 =?us-ascii?Q?3v8UA5Bi4KhP6Y9DahXWHinuB2mXESpA4y5Yl3ZcIiRgqClrIla0ALBfA4gK?=
 =?us-ascii?Q?jflyjWQZw1zLzHETBFRhUnF81BStvXbiX/91Xh/KC+lPSuvMeghOMaxnKODS?=
 =?us-ascii?Q?9q++7c5rC/CHjuVZfl/j3n4pJmKX57MGDAoEi7RFsn1hbAbDAKpJKmp8HT9d?=
 =?us-ascii?Q?+mpITk7JTPUWfKUsXpuz8+BfOEZpt1tscj22nof6OG4mwuzmM2XJAsufqLQB?=
 =?us-ascii?Q?9XEIULubHskcK01USownSskQYtJKtYiDk23PA1wCM1whTPn8n4I5L1cqYibl?=
 =?us-ascii?Q?0UDt9fYLB6lyS+VJiJBygCvhJe60XydiYP7WOr6JbxpvgG/7jr2HT0YRcWbu?=
 =?us-ascii?Q?yoT2Mjtpd4LjuGGhdQ5O5b2LriX4kSShQleelq3kCigfb2DVu9HdRWL4PCpn?=
 =?us-ascii?Q?z23tcI6II1viFnt3tv6fRTiW1EmLlExxnViWQV2/T0uJQlnlJUH8LgO30/G0?=
 =?us-ascii?Q?DUz0qvAndhbktRvmSh+S19AwLed8kXpIo/eDBA4M87oS+PmKcwI69A7Mfmus?=
 =?us-ascii?Q?bgSHnfgeycmS5ryrR+t8XxQNVJrubUcrzO6QBoILHN0QtgvBC8xFw3b7hFYi?=
 =?us-ascii?Q?MlVJFibVpJSbpuuFdrwJMHXOqDyRwH5ZaHl2ZsFmIY0t8gHe3lsosYH7C+tM?=
 =?us-ascii?Q?KDN/m4UkU4l2GJsB9Q1H29eJ87HLMYyC7zhFvKoZUwb1fUFLOcxoEYlPOWYp?=
 =?us-ascii?Q?So5hZpJQP6TBTzUS4Asb0/JS3NCjTCpBemhVY7afWVwCAg6+ApFT06GB/yjm?=
 =?us-ascii?Q?gyHvFx/i5GaT3rKJcR3BoMfrcc5pbuizrOKKNg5kvguY84Ykrjb/4dOr/Fb1?=
 =?us-ascii?Q?AmwQn8dL39fbO12HdmzRyDhYAY3S9z10j0bMavwmBk6Ub8IatPoSXbzflmLw?=
 =?us-ascii?Q?BG45ScEe34rngegpkix6GE3z27WzNCDXFbbvPOQGk6/TXMtB9zzmvQ3AjiOp?=
 =?us-ascii?Q?Oqcxv0zNoHaQrWMv7eB5W8AgWPcunxmKTNrgkLRy4r2w+HgDHQORPh0r8626?=
 =?us-ascii?Q?I1XFqkEB2DHh9kxim5dPH3CcwAoLkyEeEg8QE6o3n8vPPt1Bwyw5W+oxD8EJ?=
 =?us-ascii?Q?AJTuuwqkbHnSwwxZJajh5ohRZO0DBU/IT7EdYfYlX6ZocTRsztuO4r2tIoSU?=
 =?us-ascii?Q?jq1TjGsBs4oC6fAfBMy48YMCMx/bZSJNrFZgPvrxbxPfJXwATGz6w+0TAa7H?=
 =?us-ascii?Q?cd93BkWbnVQFr2Dpzosb46cCv0ntAVkSYDw9L9KSJo8tKlQxCtvVZIsV3S77?=
 =?us-ascii?Q?rfz7Ex4irtTJ4MRsfCkLD5U=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05415608-59fb-4930-e7a6-08de20b9a19d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:31:18.6431
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1k0K1toJgs66/Nx6P6ML2ggsD7sJrAjgPSxtk9M2r+/kvmPDWCLAZxcS83u5EOUKbjfIWsEROmfH51BTGlOwK0cTjOm/Gk/+8bFUc+MfzZX+jvK7tIpCQnV067aUzsew
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9810

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
 sound/soc/intel/avs/boards/rt274.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/avs/boards/rt274.c b/sound/soc/intel/avs/boards/rt274.c
index 4055ecc60838f..a689f4c80867b 100644
--- a/sound/soc/intel/avs/boards/rt274.c
+++ b/sound/soc/intel/avs/boards/rt274.c
@@ -27,8 +27,7 @@ static const struct snd_kcontrol_new card_controls[] = {
 static int
 avs_rt274_clock_control(struct snd_soc_dapm_widget *w, struct snd_kcontrol *control, int event)
 {
-	struct snd_soc_dapm_context *dapm = w->dapm;
-	struct snd_soc_card *card = dapm->card;
+	struct snd_soc_card *card = snd_soc_dapm_to_card(w->dapm);
 	struct snd_soc_dai *codec_dai;
 	int ret;
 
@@ -93,6 +92,7 @@ static int avs_rt274_codec_init(struct snd_soc_pcm_runtime *runtime)
 	struct snd_soc_jack_pin *pins;
 	struct snd_soc_jack *jack;
 	struct snd_soc_card *card = runtime->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	int num_pins, ret;
 
 	jack = snd_soc_card_get_drvdata(card);
@@ -117,7 +117,7 @@ static int avs_rt274_codec_init(struct snd_soc_pcm_runtime *runtime)
 		return ret;
 	}
 
-	card->dapm.idle_bias = false;
+	snd_soc_dapm_set_idle_bias(dapm, false);
 
 	return 0;
 }
-- 
2.43.0

