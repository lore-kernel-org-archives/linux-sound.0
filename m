Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010040.outbound.protection.outlook.com [52.101.229.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64B934FF45
	for <linux-sound@vger.kernel.org>; Wed, 16 Sep 2026 00:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789519747; cv=fail; b=LJ7iG7XhNMn1efNns1Seii4MQTCs3qhhpLM+M1+CmLSPEZhTLcP2JqrohdYnA1vXDkreiL/PyP1fYNoMnKVRFowWc5raP/QcwuDoytuTX9XleSQ9hgEhzjLr2/o/1mw3JLzMcUnCFcD4siNd97CEcTW2vLd4q71FE3/nTk0lQBg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789519747; c=relaxed/simple;
	bh=+kMju2EeVc6VvzJZQAtrtlc55wXw2wPK3Wz/JEY1r8k=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=kjozIIL3wZ9LURJDqnZkFk2BpDWlZQV88wi4dEgtl0uLZp0gWnK6Q/LTWML1z5e71b51ZBsqBrk+5fHITOEge+As/h3rrsaLIQ87E/FGtODBvxYJAedBZ3OMteBLDVlmQ5nTafUCgg9VXSRYpGAva2Fsp8+kxCn1HVAOyGmR/PQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=nxPrJgu2; arc=fail smtp.client-ip=52.101.229.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="nxPrJgu2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XEY2D60vlZMQ0s7BVRsoidS3blkmID7atJSiF8qjHOKwBarherPbW0AP/672JZ+omh5RCi5V8MF1z4D+r6k9BCdQalyguc7r5oNYWqThdMtxQO3GdDGke57ZRjbS2Mk3d80ubeRFsigYe/uYqTate+B9H+IOMJzIqwUxecCMZh2jmUZNNMOYDnFp6ns343B6YgF42IH7yG9ei9o/1bkz8XK8L1zZIwfe51QqIkf+/AaG7qMFNlQpEeDgY6ySH310wk5i/4XBzarQ/nZ6kWVkVQnvS6hJXsh9K6qIpU0eWaqruXpVOrFBdLclMev3MfwTb/KZNhgJsQ4Bx787Y64oqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dXn2bjtiBRO/EQBTcSVFA4cUW76VoDXg4GJG96oIGMM=;
 b=H+hCOZejZvUImqeJw8xoZzjG5i61seE5aBIIlU3ymeriUmzsVIP3DFPU6r3yezULJFpxagoQi5ob3N3HaALcV9LcWX/+34TD3lXM56uiJ58mioFGHZPjlT/NNM05mfpWN7xnKH8lDQjpMRCujl1a9geNDdQGJMyJ0wibPrBZaLnwJUfGuRW+C9AYSZxw4exKcBFsLOk/jl0lN6UFBF3X7AN3gPdU6PWGQyz0W7Prx658cPOB9ZWaEBTeu76UcsUeJhN2bPTBdLAppHcuLhzgn9RgDqBlqHJHrtXQrXCDCwBMj+pAcFUNSjsS1PX3HMlCXIrtItqvBf8M32vqM7csZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dXn2bjtiBRO/EQBTcSVFA4cUW76VoDXg4GJG96oIGMM=;
 b=nxPrJgu2F26k8W9Z1l43YxEkMq0CvFTqE6+93tZEYWX+oFruxPlaDc1qx9v/NE+5itV4uv4bnBfYkcS/oJZ90OOn9F8zPp1XX+b2AVAbPMUL4/1Fhzgb5QOV+AVFpZHx1nSS0KYKsPx2K7lNUbSRuVR8RpEFqh2sx43RpUmWQ40=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12) by OSZPR01MB9424.jpnprd01.prod.outlook.com
 (2603:1096:604:1d8::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.11; Wed, 16 Sep
 2026 00:48:52 +0000
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45]) by TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45%6]) with mapi id 15.21.0428.009; Wed, 16 Sep 2026
 00:48:52 +0000
Message-ID: <87fqzavx57.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Alvin =?ISO-8859-2?Q?=A9ipraga?= <alvin.sipraga@analog.com>
Cc: Mark Brown <broonie@kernel.org>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 07/10] ASoC: soc-dai: rename snd_soc_dai_stream_active()
In-Reply-To: <aqke4IixnU_L9osp@analog.com>
References: <87qziwliaj.wl-kuninori.morimoto.gx@renesas.com>
	<87h5jsli4y.wl-kuninori.morimoto.gx@renesas.com>
	<aqiS7yz4IIYzU6ml@analog.com>
	<874ifrrsy5.wl-kuninori.morimoto.gx@renesas.com>
	<aqke4IixnU_L9osp@analog.com>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 16 Sep 2026 00:48:52 +0000
X-ClientProxiedBy: TYCP286CA0073.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::18) To TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB14118:EE_|OSZPR01MB9424:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c19288e-d9b7-498d-547c-08df138c4775
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|52116014|38350700014|18002099003|22082099003|56012099006|11063799006|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	a3ATtsUycX1YuRrR4l0Ug82OaOpsoveBWyqlZn+LrUUqYEGpvBIT+PGohtOclbcvaFmFG8TriGy24BMkgukj4I9cKpkidxyZxmB8DJhEZvex4UTsJcmNe8CrD5aLd/Xj3R8gxrf62uRnCxFCSYAOW4XGYUaPVsFg0L7QFSQjkw4FsfMNaaYmirTMXfg7ISYXy8f1ITUZzqf9y1Q3KVnrsJfssA3GQE6t0EP6s1GLT/aTeJy1gY3Hv0mC2cthwjqtqDkUxeXrHojUEirbwb8JTA0ntWGkurtibs3wRpAmUJF79S4rFBHVNICYmQOcuQEFBtRDZypx6nN6gqRg4LZTLhs3JmwsUZPetAFJof1FSuALJ9kNaZOo9FkpNIVEui2vyt0yL9aWCBNHzp7XpWSyPboL0TNoOAhGFeZS6QyUHdYxOz8yFrCLejSzp6x2by5EP54FUztVjeLmqLlqCNSXClhkwrpJGmNCAu1stQ7fi9VVGkmkCGDUPi0koUWlwnfbzJhl4LACGh+K2VHgRfOSBVWmzfKgyyItn5eokDewYUjgY1nxWsbBCsa1c9YQUCgs5iafw0CIsl7T8AlUMjdwtvqHxPJil9rwIii/xqiXx9riTnlik4Oyaj8tQwwPZ9Qkq7e78rEgNTFs9rTcioBbfM2DTSd4JkwkB3yriwT3s2VLwXCGZI+jBNHAeNciXFatjqbK4nuVY+y+lf7/M8Jraa2dBSvhZ2343BEEBILVxAM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB14118.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(52116014)(38350700014)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jRjU+cPMbkBONEOoBcKYAWIqTNERjr9kwmD0/7G4itgPH5VkLx/0fhw+529+?=
 =?us-ascii?Q?BTmDLR6xIlzV2ogWpPhn2AWx5B+mGvxzSaU+Rxm1cIfPQVXlj+WMKY0g2phX?=
 =?us-ascii?Q?B7xRL+vZqQuqV/vcdCjzcQivOwkP3eoNghDyerh4ZnqbethLAZDdOP3U1QFS?=
 =?us-ascii?Q?5QC+Euu6pZOr/AU5p84Gz4BPnKdJElcn8Gxz70gXHHKY3m4xQAUvGDHrbmlI?=
 =?us-ascii?Q?ZpD+vSb8wVwlE9E/suaCyF6Ig7U5Xo1aZlFpxmlwsY/UqzRCQdQzhWxVDk7L?=
 =?us-ascii?Q?+6ERRPE738OBfWZ3Mwt3hKYgZCxk2vxYTc5tQudPiv6f5S6Ck9SbbEbfPQkX?=
 =?us-ascii?Q?GilrlLPPKLmkfhcMhOm3/z7oX4UgzKdwZPPZUFqq4flIB4MAP8iRa0jhsMMm?=
 =?us-ascii?Q?qBdsnzQT27dDZA/cEY//amyKumCSxwsArgMSUMX5LkrsSyp+bD2oO7p2Q+1a?=
 =?us-ascii?Q?MpLIy4b1IghQawr9NGgvlilfs9owZBWKmO3z6tpeGbJZ9v6fIKUbZSzu+Zy6?=
 =?us-ascii?Q?z1FD4bsQNZGhcJRqQqN8PtzAcJUqsh7AHeQ4MrbDYoYaV4AuCHJ8KQOaspN2?=
 =?us-ascii?Q?kucajwUrSz4HgDDDlL60ZaknQlO8HSOROtvBKhqWTkn1cCEYdRm3lYh1HOeS?=
 =?us-ascii?Q?NfJCWR6/Ok04Tp93TG3djgB7swawB2jq601H75NSk1oE3E+tDmRijRuUrlEK?=
 =?us-ascii?Q?9xGGhKcusOlkkg9b45nClnn3IIJNQylz92ic4Pb4NXWw/Whin3MVcn5Wrvxi?=
 =?us-ascii?Q?717mxHKdpboIWI+wXIw06OzSf2t68HBkCwrnF6PkN93s2zUg2A3J3Q0Cgy5X?=
 =?us-ascii?Q?ihztZC2y1+WCFPaneki5yXaCqDnMS0gOnck3b41AqlGwtJKdLX7rj9HHnWwJ?=
 =?us-ascii?Q?OFtnCE17wh9gCYxZv0QvMIv5CrJWp+xi3V0/WmV8M0zfwRKYxLencxci/idU?=
 =?us-ascii?Q?oY5rUfLebNPtUnBbxBtbVF1ORmbHXV0P1D+IT/exz4nShpfWU2Njr3kPBS66?=
 =?us-ascii?Q?PO1WuZuGs7CCn1+31V0qayD1g9yhOrDZLLdFbpYX7zWPoBQqXwA0jlZh882P?=
 =?us-ascii?Q?1xgfrUbHAEA2gmI8v56bJc7/CPkD0VgKk2axq+oIHg5HnvrbfvKyDMmg7L8V?=
 =?us-ascii?Q?G7XW5VbT4eLveVoqGUG5NJ5uZbLn3UIgVF1S82xIftr/9OaKy1p1+ajD+Ici?=
 =?us-ascii?Q?P7SvnJQTXd7BS1D9qvkD7J4+fUClJhgJDi38JPkWIu1EMwT0AFHxOf7x3MCe?=
 =?us-ascii?Q?S6Qfn+rkZ0Iwi5n5YqkHU+gfj63PU18TJNgY+9WnHDle3wTZJ0pR0jx5flr6?=
 =?us-ascii?Q?ePBpqqv5NbP58o4CkaiJUXzzn1hIAo5vVJoWQhFDzodtrwEVkN00hxcOcxyN?=
 =?us-ascii?Q?ofSh3PfJ/suXIAIRu5iGOCmsA/Ptl4YQCB80BtHxt3wM9zoLVw0/JvsC+0Gp?=
 =?us-ascii?Q?4Bg57+UgaQ6yDF6nwIeBrTHeQKfdnB8gR+Sqf3WKLZLp1Cbzq/EfyValSmvD?=
 =?us-ascii?Q?rsZIEhK71nJbOlAMvjqsi2l/P+rc4kflTbNnx9ICBbKg8T/IK2jPUzReDvTe?=
 =?us-ascii?Q?chxB9ZtkqQyoRnB3YPGEipwev+yZ1azC014fv2ONEvSWk0/zk9WcPyyebuY9?=
 =?us-ascii?Q?ARSw9h27KyzXlO4CQiDUx2shB37ngnm4oUH809PvwHMRAwedHpq7UOXWFZ/v?=
 =?us-ascii?Q?gZx1gVx+CLh1+qZR2ebU43ZIl/UgiGodJ3PR5lm34FIl9CmK8WbYrb5rj2eq?=
 =?us-ascii?Q?4JErFTBSgjuIhTl67Ihr3W4ETdDsmwFM1mpm75RWosjDI2L0FVUj?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c19288e-d9b7-498d-547c-08df138c4775
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB14118.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 00:48:52.7294
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KuhDiG/EczitObarbHtyAJb9QmhLaQTLG+nXJqi2VX+NNzIsbeM/ouCS5uj7pHddDBoJRLgvldULDQwVEnQFEeFCnp7Qbr7+UYrsFkCF4NAKn4w59l0yQd6vSheolG+A
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9424


Hi Alvin

Thank you for your feedback.

> I agree _active() <=> _action() is not an obvious relationship. But the
> _action() form is just an internal thing to avoid code duplication in
> snd_soc_runtime_activate()/deactivate():
(snip)
> Since it's internal, I wouldn't care too much about the naming. It could
> also be snd_soc_dai_active_update(dai, +/-1). Or maybe _push/_pop? But
> even as a native English speaker, I think _action() is quite fine.
(snip)
> Most users of snd_soc_dai_active() just treat it as a boolean.
> changing it from "active" to "count", we would be advertising the
> internal reference counter, which suggests to the author that he/she
> should maybe care about it. I don't think drivers should care about it
> though. Especially for more niche things like DPCM, the reference
> counter value can be surprising.

Basically I have no big objection from my side. But I have few concern.

1. Most users are using it as boolean. This is OK. But it is count
   up/down on .active value. It is confusable ? Indeed it is internal
   things, but this kind of confusion load some issue.

   I want to rename .active to .count

-	xxx->active += xxx;
+	xxx->count  += xxx;

   But the function is keeping _active().  Maybe _is_active() is more
   good naming (?), and use bool.
	
-	unsigned int xxx_active()
+	bool         xxx_is_active()
	{
-		return   xxx->count;
+		return !!xxx->count;
	}

2. From non-English speaker (or only me ?) point of view,
   active / action are very confusable. The diff is "ve" / "on" only :(

	snd_soc_dai_active()
	snd_soc_dai_action()
	                ^^

   I personally would like to grep related things by same grep.
   So I would like to use active_update() instead.
   # Ah, so _is_active() is not good match to this naming...

	snd_soc_dai_active()
	snd_soc_dai_active_update()
	^^^^^^^^^^^^^^^^^^

   # this is one of the reason why I want to use get/set at end of
   # function. But is a little bit strange name and different from
   # traditional naming
   #	snd_soc_dai_xxx_get()		snd_soc_dai_get_xxx()
   #	snd_soc_dai_xxx_set()		snd_soc_dai_set_xxx()
   #	^^^^^^^^^^^^^^^^		^^^^^^^^^^^^   ^^^^

These are not a big deal, and I don't want to start bicycle shed mail here.
If you have no big objection about above, I will use it.
If you have, I will use your idea.

> As best as I can tell, it's a marker saying that the DAI's .startup op
> has been called successfully. If it goes from nonzero to zero, then it's
> guaranteed that .shutdown has also been called. Nonzero is also
> equivalent to PCM .open having been called, except for codec2codec where
> there's no PCM.

Yes.

> snd_soc_component_active() always follows snd_soc_dai_active(). That is,
> the following condition is always true:
> 
>   !!snd_soc_component_active(dai->component) == !!snd_soc_dai_active(dai)

Maybe not always ?
For example, if Component has many DAIs or, Component is used as "platform"
(= DAI is not working, but Component is working)

	component (1)
	  - DAI1 (1)
=>	  - DAI2 (0)

> Personally I always found it surprising that DAI .startup can get called
> multiple times on the same substream. (I think this is just a DPCM
> thing though?) Unlike .hw_params, here is no new info to act on I think.
> So maybe the core can guarantee balanced calls of .startup/.shutdown
> per-substream, and the guards can be removed. Equally for .set_sysclk,
> it's mostly the machine driver's fault if it does that when the PCM is
> open. Along the same lines, maybe the core can help here.

Yeah, agree.
I will focus to capsuling for a while, but this can be next focus point.
(Actually I already have next topic, after capsuling)


Thank you for your help !!

Best regards
---
Kuninori Morimoto
