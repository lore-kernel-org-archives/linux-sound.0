Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010038.outbound.protection.outlook.com [52.101.229.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0803E145B27
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820436; cv=fail; b=M1ksC1IuD+hniSlgRBPb1mdv0u8CY3mHmQ35xdBd+zbFwtWNfwOWFFTAC4mWoFzFr8gf9hlNSPoRP0Uqsxr7MrXqjYXt3IMTtYgb8hG15lS55/UCdPRGa/mHfZOmTezVdCF+x9mlwlrpjxf3YJm5C5RPjb5SIgelth4D2mAfXS4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820436; c=relaxed/simple;
	bh=Hgif6Ijm9i7WJ/re0nZ8y/Os2Mkew45FdVnGYASxNWI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=GcvYpTuDYYEoqVawDtV97qG/c15fknLiJtLtg1iOr6rIpQHhcbUThs3SOvS5Jy9f3GqRJn5pYQbtrw18NDvLX4/8hG92d2iyZ9aLGJswJJRISDxx7YuRt00DSATqodZ/x4oF4YMEi9KACl08GO6RF6pbhMhgIwq58MbZOX+xc00=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=jZ1+i+St; arc=fail smtp.client-ip=52.101.229.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="jZ1+i+St"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D8xr6jBUiV7399ZikWqMEzNZutu3N723ui/3OevlEHSWCNCUUfX5Cj0SWjs85gfnhV9x4mcmeV0RU/sLVSzsA4PYBSmXWXKNOBlynsWg50LOcl0So4xsktIaZTKhMmWE0PbS2iekuf5t3yaRmOI9EwjRz8uAQPBzVwqlzfG429GD/lUgwmABrD9Tek1icj3U+FK+xqjISHzL3UDvOP2wZQg6Z0XaEPzlLnkSOSnN0y2jEEaaBg0/tGOMiWjB+hSQPAKTqvSJxvChf768QSBMFMVEnfgXYDqotAi51BqUy4FfBVR5ULP+kDdQsjbF6JnY1EtQhtex5pFETpKEB1qPcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O42KVDWI8C9XD9CcIeUYgi6T3BpQW0RUcK/fpsfheR4=;
 b=LHPCP4O7H+7vghuKZJA+nUQdOLID6zPvJ0kyTXS/wbsoZ709mwb+qBAv1v/bOnzdLMS+6CunpInvBLW37jd6bkKH7RePT4CZbGhnMKQfKiFfLKEHNq4Rx6beRq2X0UHsaIfrvhebJnEFcnIGQsAz4GW0taG+M4XHuonDewVUXWuM9E3n2YqBd7to4BboHzyjKGMr22GPr3P7m3rW9ZmbWdzzQY0aVrYSNZ5tIyYkD2OdwBoROrggtR7qiQySoHuDdIduv38n5zUHMdtLsEF939B5Q3v83f8OAtFsVgG95fD7cFw3LhXhkyWbWLSahTdN5n1UqgxhEiQWImYVYcraDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O42KVDWI8C9XD9CcIeUYgi6T3BpQW0RUcK/fpsfheR4=;
 b=jZ1+i+Stc6nL8ZuBflgGw8jUhg1xGe9P8pzOcNmFnzTXTtq7wGkF3Aij0Wybe3E9p0anp3JV+a6PJHEmObG6WDpetJzbaFJaw2roMlOVDQzifhHumTn8lmM+Nxxnrdl705okTdsn0K74GuE3M/kftVLY0aUf0bzcWCs4pA6wTvI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB6994.jpnprd01.prod.outlook.com
 (2603:1096:400:bd::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:20:33 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:20:33 +0000
Message-ID: <87wm3x773j.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 035/292] ASoC: codecs: cs4234: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:20:32 +0000
X-ClientProxiedBy: TY4PR01CA0043.jpnprd01.prod.outlook.com
 (2603:1096:405:2bd::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB6994:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dae8d38-b5a2-4f38-fad6-08de20b820ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Aaay+85Q6L9t1tOlZ6qa1p/+EkNjvfCKSoF3Lo+NAOEuwNRtra4TwwMCVl3h?=
 =?us-ascii?Q?ThRFG9KfaGPR0W79pm6bIwxmFnzFU09YiRiiEYpWqhgaVUNMjkXNRJeNopvb?=
 =?us-ascii?Q?pUVyUeAni35B3Q66/cmljLj4HiqS0bP+Iz+RyFvK4gvlTxHURGzeLrVV7awT?=
 =?us-ascii?Q?e4C/3PEDzTvrYH8KcC53pi6t+MA3YJT43/jALgs/hdGQenmODG2Eod3LgSzT?=
 =?us-ascii?Q?NrsuLvWdGNdOnKgdu+jaVmj+2lf7w4ur4gO7L0K1KPiCGVx6/kJZGWM+m/Yf?=
 =?us-ascii?Q?4SGM6CdCDCLZADWSKFHYFePkkOishSK04nXGa4CWDRQffFdoTB3Z+5rFRv//?=
 =?us-ascii?Q?0PcDpZ2dagbyaseuprYk1CG8KaDl2kgo1J3kVnxtjir5CMg5Yb6XlqH4KfYV?=
 =?us-ascii?Q?c5Gi0/E1WVeRzdVR7DyWX+L0enClM2x96PjpQJSyABSqQQbvkaPEygyvLUWN?=
 =?us-ascii?Q?A3uFV4dzFm2MRS97UUsYmFIAKpBWHtxZc7hiER6FwdXudEvMcsrer4a6t9hb?=
 =?us-ascii?Q?U4HYauN/MoC7PkOzBaJJ7Bl6z9oe1BqQVwjg1Kb4PZrgICOT8tezQTn+BAoZ?=
 =?us-ascii?Q?Je4C8GBq0onDE1BT5bja1H3Lr3iATVU0qk13wqurJvMxmJIfTn/KEyWBRHU6?=
 =?us-ascii?Q?DZvSFquEDf5PsHlNXk5/OKgbelYxpbonC6I5cCzGW5Tqo/9D0mN2gxKBcg16?=
 =?us-ascii?Q?C2sq7k2X4aiEQBjww2r4Iyg7kV7DYuAc1IrnBw/QaLiNvAS6PLBEgzQ/QRMv?=
 =?us-ascii?Q?Ivqos8VT3wD19dmQZOe0rOLOLjKYJhnLS4FQ6I0u3WvOh9AtwPT31jE3ku6Q?=
 =?us-ascii?Q?UmNUJ7timeN9q0zTzx4s3A7p5luBGXZ/8AeIm7dYt0w3/5KKWvLcSF2bSK7c?=
 =?us-ascii?Q?nzlxumHqd/XKUbihCeZ/Y8a8/TRIbZgtasqkPQ+ogRTKnuWg48I7/leNF8eD?=
 =?us-ascii?Q?3SrkvaLkSs/qkmKdZdUyXsdVqnIhvQ4X9q+Xt+qZe+BaLfhgVoWHlHQXZXiK?=
 =?us-ascii?Q?PeUZuUlCdLzU1Gijo4R9z+aCu5xJITpDbDqsyNBE4PiDIjNq9N5iIjyq1fmI?=
 =?us-ascii?Q?S8Gjd0XKjSTWpoW8CSNLQGJGTNG1augMSio+9Q61EK/YvoDTHDva+aUFo5fa?=
 =?us-ascii?Q?ROXYfUaazQ5PMxCJ4F4aC9BgzPhtcL4gShuh5WjQL5ag8j0bjYCF4r3kwap9?=
 =?us-ascii?Q?2wamPsoZrFDOCsaMRB1mj1liGdiupfsR/n47pZXekFhFQE2l9ZuZATIlTl15?=
 =?us-ascii?Q?V473Jz1C/n/pJJ8QSBqr/zFCxD/3SzrjBOBGSafTg//Z8QQPlerzPRHk2a1F?=
 =?us-ascii?Q?ShYqY+beTDxRoyf3CoYYxvd280ApZY4NgCBO+9JApgQN1jaCU6mEdgqXe+Zs?=
 =?us-ascii?Q?RVRyZN5Tnc8XZ+VY078VA0a0fz4jPjygFOl8voY1tWanEpI0dTMVt1DOJaHR?=
 =?us-ascii?Q?zm2MUQQFLn+ipK822rBqEC06UTfRoIXa9FCudBJupj/kEzWSomj4s6BfOWhW?=
 =?us-ascii?Q?PdeCLWYb+WuN2nTuUWLu/zZla2BffAwMjD1m?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5mvj2UFx7FfVn1UV/DPyUH8XtI4bqkrKZClnvv6zNtC9OAlyRdQdBvGLd2om?=
 =?us-ascii?Q?4zQbTNLQlVwia+7tS6OH24cn1o5VEEO/IQAayILIT9imak8mJGw2UjnVrEvF?=
 =?us-ascii?Q?O6mWvPllmYHu5anR6+WW/JpEg4KxQb3secZKUigYkZ4ukfetIvpovHwVccX1?=
 =?us-ascii?Q?ufCPELeDrVQUCAtNrxZTQJQQBnJrInNxokRcHCW7MyoRv0HtfumfzcgBs+S4?=
 =?us-ascii?Q?jFaociD9ltmjrp4aWT/MsTOyCOBojkGTFGTGKvhctdmK1VarOHOQiwJc0G+Q?=
 =?us-ascii?Q?7PTGyXOkocMxiBm3nJhAV/xbjWaHbEc4DLGCugHi/hEGjImAwol7AqqgunMZ?=
 =?us-ascii?Q?Y2wTInAYBwl9VYtOH+FNxauXiHB4upHWf/SvIPaKYIve43lAEHeonhHQ75/K?=
 =?us-ascii?Q?qHvgY7XvhpsdeUnVPs3uU17KQO2z8wc/4XvmmaVac+N2J6d8Z+x3CX1k5TWp?=
 =?us-ascii?Q?zNja27uhRv1PAUruQB+4Pem0CaTnqeW7jTtdKWtFMDMexWnknK0TtViPpuDn?=
 =?us-ascii?Q?VzOvZU6br23kEDxvzkco1FSSBALMI2o9ZAHgx6oIJEp/t7TiHxjtiTLENvlC?=
 =?us-ascii?Q?6rLwuGihfFMDqa0jltQDKTqlDjcbpK534C3y2bKJaNsrdRXjxWmnsb9psBl5?=
 =?us-ascii?Q?y1FId0ambGtp+clt8ohZBGnSsEpkaZwmfTeRNKDqCYgxSErYttUesEs07EU0?=
 =?us-ascii?Q?ZhD6XIkDJDIkZ6acJbaiCGm/oH1MZXwSJaM+BfkBSZqKed8dtIJn1OKGUgvO?=
 =?us-ascii?Q?89FFVOfdrip6sUFa9yDEVZZ8Kaca96O4hy48cCBHFeRhzohBZ9RC2rdsTLPA?=
 =?us-ascii?Q?8EToIBM8Ro8JnzsWIwbQH1SP/4ykOnOgZDSVl99FoinKl8ipFD1vdWxUmrsH?=
 =?us-ascii?Q?O6c/3xXcoy5rVQN1e16RTGnTB/U5bNqBiEAKBE7Cg0uTcUnvB1VrXvhnHlfF?=
 =?us-ascii?Q?4pq/FmmyY5CcxAk+JxCtOfvnqYu+oa96XZLNDmqFmTaoVQYKhM1trCQEDDuE?=
 =?us-ascii?Q?PtbAIkWw1px/QZskZeBRVxLxDDBcZ/zNCqsqFrQzT6s6Q5Z4f7iovdd5fGUm?=
 =?us-ascii?Q?LOMaGEnLiyvAOA0nHrytdIu+u3sMIEfl+lcvl3PueqvmN70bYpBbfmHX3j4k?=
 =?us-ascii?Q?1nW6RsCQPknf2LGZ399ZaEJL4c7jjKmCJ17u3zqiK5UfSNlurbX4eEQaX+R7?=
 =?us-ascii?Q?gzeb57N+3wwKAL8AwGYpV8jE8dim9kIVAAMvMgz8xXaZAsf22hdDh6XepKSB?=
 =?us-ascii?Q?Q+ntKoNHdkrtL8x5hWrZdpCVrZSyXWtzeaZRavceD1yBNyk2OtxqSbzV5ZqR?=
 =?us-ascii?Q?BsIo6jZWjn1EiV9PrInVPDWjMT57ez1Tv5Vf+t4rQRYjCrDXkMEoPfcmWxX4?=
 =?us-ascii?Q?foJW+C5UHhOgNEWBhs3zhlIKuAXmGkfci846X2CBOiLKbQLgB+lrHeHuhNoT?=
 =?us-ascii?Q?+08QLa5ptengOvz3xPMPgcOh1eLq7N+MQH7KXSZtYfUroTFzOYUZ3JMxvHyu?=
 =?us-ascii?Q?NyERMcEr/qz1WyAbJ/iQtY+fKAcvkyhiTfpwmuw/Ub0a7sCal86XJIlzStRS?=
 =?us-ascii?Q?WoQbSgj+7B+Spg+JjccgnRLnMdM0bWRAs7yfg0ifW8K9zNFOnAm626jCeCqn?=
 =?us-ascii?Q?+IAvoaojnhea4DSSotTIk8k=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dae8d38-b5a2-4f38-fad6-08de20b820ca
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:20:33.0595
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v7GISTwrwuRwxU73J6T9vTuoH6oTP+n/T4+nocIltEpBRXfg4w8oevuk23xRUkpH9OLsvrXkvETjIGsthscWWXoxLMUfC2y/MSleqxCpY0SIRFnnDA+Sd/6OfycLZH5T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6994

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
 sound/soc/codecs/cs4234.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs4234.c b/sound/soc/codecs/cs4234.c
index fab4695644bce..89c424dd838b8 100644
--- a/sound/soc/codecs/cs4234.c
+++ b/sound/soc/codecs/cs4234.c
@@ -87,7 +87,7 @@ static int cs4234_dac14_grp_delay_put(struct snd_kcontrol *kctrl,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kctrl);
 	struct cs4234 *cs4234 = snd_soc_component_get_drvdata(component);
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	unsigned int val = 0;
 	int ret = 0;
 
@@ -126,10 +126,11 @@ static int cs4234_set_bias_level(struct snd_soc_component *component,
 				 enum snd_soc_bias_level level)
 {
 	struct cs4234 *cs4234 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 
 	switch (level) {
 	case SND_SOC_BIAS_PREPARE:
-		switch (snd_soc_component_get_bias_level(component)) {
+		switch (snd_soc_dapm_get_bias_level(dapm)) {
 		case SND_SOC_BIAS_STANDBY:
 			wait_for_completion(&cs4234->vq_ramp_complete);
 			break;
-- 
2.43.0

