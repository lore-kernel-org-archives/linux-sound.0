Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010019.outbound.protection.outlook.com [52.101.228.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B1B195;
	Mon, 12 May 2025 02:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747017319; cv=fail; b=BqKyk3BweYnqKsVeiR3JeJ5cFGVx+/KsYVQil2NfC7zalyiaGhkfmxMFZMppS4vMZIQFFtkiQBxsJCllPYvdrrx2Jky7REq/e26dP+XZNIMz/R7Dqf33Z6dqjL22UMCfDJQH3W3kzM+xY1zONPDYEYVhbHU/FHJe6BaPZJ1sdzE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747017319; c=relaxed/simple;
	bh=sUij7JQgVkaoUQ+++ZrWKeneC09HCKScEY3+riiW1/8=;
	h=Date:Message-ID:From:Subject:To:Cc:Content-Type:MIME-Version; b=Hyda7aWlEnOAVa/Ad5Xhb+b936zJ+Aq6tulJQ0DjRSNYbghOhjn4USBKuyJxuHu2+TwS1ZSwAB9X+KFaQkRbDll3g/fDQeFAxqm86NI4YoSmOOWCb1+0gpnA+359SAXHum5wjlEV2SvnAicGVwAu8ZgRfyh7WTW1G7SlRI9m1/c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=nfMzX3Ns; arc=fail smtp.client-ip=52.101.228.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="nfMzX3Ns"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p+SRnwJ05rsKUi6fVTsaDG1DXoa0BgcZo33Ra7lvILK3WbujiOHXv6hBJ7235/kh/R2oVERiHO4AI5zrXItFQJgqpr8A/E/Uk6HP6vsHcLTked5lZOpANpLYyHl6ZcsyU3LOxElVAjvBXe2mXLvXzuZy1oZIUosqsLUs5ljE8QgXDRP0kH9iUZN2nH004KSVecOS8J2XcJg4V3EmMV9AieMquERgaW8lRgCmFP5uT52EUZtReywJhMwVi9guBYoyczjuxnNKjhVHzppmyQkP8r6GWuiRVbuo3K4jJioR4PmynZoVfHKGEL/plIihGXcxY6No9B5qkCd1SXYyKI32qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7dfCdfN1POZ9hVf/mYSz4IqOdeaaaFEZx24PeBkKQTY=;
 b=Z2x2TwBwj9mDI5QkI/4cVbxf1N+U2wARZO0SBgUt8yIX5qHXzPobQmJqPdHnasyhu5AvsSDr70mEKtZxbFaiE2QeHOFoOFwsCT5+IHWwXRLJ/fu55u8G01JZiD52yjnfAKHHw1Tcnf4C84kahQdBKoCKQKqFYosba1z+w4eBPyCdQwv6LhA6nRdKT1/FJezAmpafh/BYmgcKZa/EMTzNBkE3FkC49SVK9jSwVYi+MfJuXSLz7h3ZdRzK2qUNLOyQTbV8gSInqAXGUhIWMAvoEyVs780eVrxoCn541jPSf8iVXj9VCNJ5pNeR7DTJqgm6aFOWDx0N65GPaEbSB40YqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7dfCdfN1POZ9hVf/mYSz4IqOdeaaaFEZx24PeBkKQTY=;
 b=nfMzX3Ns4dazdKEEQ/GX9Ef6ZmLPSbll0/RnQQj0i03QimFqsGv6XfQ91RCeBM5oLmAheVYxSKh9/Aix5eiVBry6y2juP0k95F97XU5eIKfcP70KvBoqPbDFhU1irIy8XtNpchmk7J3fgnHPY/4gPb3edChiNkEYWGRscaxD7Bw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10948.jpnprd01.prod.outlook.com
 (2603:1096:400:394::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Mon, 12 May
 2025 02:35:14 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 02:35:14 +0000
Date: Mon, 12 May 2025 11:35:14 +0900
Message-ID: <87ecwuy2sd.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: dt-bindings: audio-graph-card2: reference audio-graph routing property
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
X-ClientProxiedBy: TYBP286CA0004.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:ce::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10948:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a008a8a-fd78-4e6a-24d0-08dd90fda020
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mSkbr80OBKILfHg1l9b2FTVyc6CzADP1iWDQDF7PH1EsAB41xVyTnPWiv4N8?=
 =?us-ascii?Q?6noZ+9ztMlJdlNUu5nx1tFPOHIJRtxm5ygZ31+o6x/DiW2VthpZnT9L1kTd8?=
 =?us-ascii?Q?h4xb4/vUCqqEbUk6rp6VJ5GvhBUxvByeyJwKV0UpXmoWQnBLPTC9990LxLbG?=
 =?us-ascii?Q?jPvIdfEhI+iefN/SMLwqgH8FxwkH7irqbGwl8n5sQ2YayDEMG0/wdZmrn9oN?=
 =?us-ascii?Q?WiiLej2OTwii1QDwRqTYNA431Yzh/+3UYy4gGE8AiosioCPUkzgZej3+zF/t?=
 =?us-ascii?Q?FyI8SQ4IV0YTCYXeemtFDvo8wdoEDfLaA7z7Yxmjm5aokDyRoPff4mh6Kk3m?=
 =?us-ascii?Q?LRiIbMYojZW4cI5pxIIm0itK6OKXvIgrNHibUpvioXiPVn6LH32ciAmSOLTK?=
 =?us-ascii?Q?MgYtyPCMpkyGhcleuZvKG7jcf7NQ/KKDkHcSxzh0RvIZqY8NeEQ1NPkA3TF4?=
 =?us-ascii?Q?HcjYbQ6ek9y6juEW7DcrF2BS9NDJSojohgcl56fyhwSGCBdFEQBN7RG2Le5N?=
 =?us-ascii?Q?aEXuiPhWLpve8QhCUv0fiVt+DR90PtqT8xhxJXkiHORDM7BZkIite+jxUXKU?=
 =?us-ascii?Q?+rQPLeZhPxG0Rs9uVHAOYQaZlrPBml3ssZE1ok1U+TIMSHAs25COz0b63RbK?=
 =?us-ascii?Q?RTYRG022C6+i0qVERWHFD6qHEYzSqLObL0KC2t98fxRvzkEW2HkLo+IRxKyI?=
 =?us-ascii?Q?wOTH4PDfH/n2yHob1XWHzwRKDTPRX3OqS7SaYZYFw91wjQA2Cucf49dLYP91?=
 =?us-ascii?Q?le29vTUOLNfSSnqjsT9gGp/yLIdeitGj7uablWc0dkDiTNFZ/yIxTTqNRq6R?=
 =?us-ascii?Q?KbNwhfiMxezXyh3btS6voq/kHt/NVqM5OaVYS4ZxAzeBV2N6JTNiaqT1lGw/?=
 =?us-ascii?Q?YrEcCcfZ2213maNRUQF5EGMPYFjdFGB1M946epgxJ3L1rVfzcxCpKWDHXJfC?=
 =?us-ascii?Q?av4MfcQLEoiGJyDkBbHEsuILW4eYV3V0ViuoEiRU+MZyOniFNakXuoOTNSHM?=
 =?us-ascii?Q?kOEUHy5wf5MpYP7Jvsjf0WQSkpEYRSliSK9fxcpMjIw76RGile4yqS9J0nge?=
 =?us-ascii?Q?ap3Ln+CLxbGE2omgCUJxFKJBDSgEiz7rJunh5oUBi61bMVhWU32SUNEfo044?=
 =?us-ascii?Q?cr6lYIYm/GHQJRKb7aKwqBdilHN2bspJM7NEkwxEdBL5xGfzAD/BlDCQ4toi?=
 =?us-ascii?Q?WZ5l8tHLWv4P/1tC18iCdy59pMscYkvLD0VdyvYdGt8Nca8V+epG2lkc1wE9?=
 =?us-ascii?Q?BZs67y23nV3dxdrBV56muuXhDsrXcXwjNps8a9gUpdkvpeKDtYVjYb1kSAoy?=
 =?us-ascii?Q?csKZincbrBTXIh8FgaAusEVpLWBiSZDkI7GTgEeZCdkaYYcj9V2Pn0bbmdPl?=
 =?us-ascii?Q?yN4I+byJnMQqGJXAuy/NuvgpKAkk56QU7ajDrQbvcnQd7syVCYHJVzOgGQ79?=
 =?us-ascii?Q?I1spCpYxorijc5e4yK2k5DH7yqIgBjDL7vM1Y2MalFZuTy/dqkLulQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2gnoqToeCHvCIKV8YSJrP9lurJsBlg1dIuw5MmdBOz1peHTawCjih4rLW3ke?=
 =?us-ascii?Q?M2KvhAWRuOtomfoJEee6tukswUALNLDJfVzBTY7myi+s4OJN4ZKxMPOhJOt0?=
 =?us-ascii?Q?TWXwq0W6ulHe0MOhtqz1gVWZ7tfD9r0mk22Aqw85KR9z52AdsdrJqRt4FaiD?=
 =?us-ascii?Q?gpmcMqGRFdIxJWHK/XuTLuQygMsTzmrVEjm4+2xIJJ/rwPXNTgr127FUlDAx?=
 =?us-ascii?Q?UNLJxhyBcTXebl5Eo/B0siH335msqQG42yJccAkYc9PR4Zjo7lQh7bFjJ0Is?=
 =?us-ascii?Q?kx17ZGzbrnnnw0M/UagMOnMEtlRGMbDg74Ss4KnU7CgyDtLhoUcqFNhafwZT?=
 =?us-ascii?Q?xIlAJ0kkvljbUEg+hMsdrMcaIJ9MTLhZ6aLF+bgTp7lBUxbsR/tuGEo/Mzot?=
 =?us-ascii?Q?hADLA4pSIqxNZEtvfSCFyIIP+zb8/7BeWKAoeppuclpMKnAoxM5QQ1yIlfQZ?=
 =?us-ascii?Q?VwtXEo8WN2adsIzUmJABM9U5MJrXjamUGgrd1/sgwM7IItB0ljHH5xt/YV8g?=
 =?us-ascii?Q?zzfdo3hZ3xBra94BX5YlUMMC/XtPf6oKNE0wS5ogjUaQESbrL024X8/1EX4y?=
 =?us-ascii?Q?O0xanegf66LNZHBi+IEqW1OmmRQoUchZFJqonZANsUyY6p70Hev6uLr0P2vf?=
 =?us-ascii?Q?oSy2360EvcnHxqrutrgoW/2hKpkXR2enpsRh0dpgpTM49uFRXiD97xruUimE?=
 =?us-ascii?Q?EPHrrjIu2zRI1SlKLbbOafBPOFv0S12hvhETn/QWfOj8ezB5+SMa6Kv+1bJO?=
 =?us-ascii?Q?nTyItIZEGMQb9vg3UMGEj83+20HcExNPoYpGhcW+rOqlwZod8NdJzaRF5JXo?=
 =?us-ascii?Q?qpt8a8LIeR72Wk+fTp2eNxUTyqWl0Z1ejHYjO8ppHY7WFK1+WqsFAI97J6nX?=
 =?us-ascii?Q?19CBafr7y0WvyYPbgU9FQ8y9+6+MtCjk8qUC1v1OZ0q3AfPQcrBdcS6UZza9?=
 =?us-ascii?Q?5mskGlcMkZilyyoibelAcYnsD/qRHYGM0JprfE7JBk1s4VN5zA50zxcUtGnN?=
 =?us-ascii?Q?fwhijAT+PqCw+HNbcuGr0ZZ2PiQAFGT3xJZ1pYhBZprUxJWEepEbW7AiYn5E?=
 =?us-ascii?Q?7h4QJq5Bm8YKc9dx1nNPPxvbIDx09RTr51U79uATH4Jsen+EotkDFtVZb8pt?=
 =?us-ascii?Q?p3+RVHAtTBRWNt6BqVvtPJyBFZ8lwBWdjYRVTOg0pCwBRaE2k4lc5kjdY3ED?=
 =?us-ascii?Q?H+d0G7/ouWKEOTE2lc/ZXyMc30x10e8bckUetvEavqXM//UDLMKkAoeTzovW?=
 =?us-ascii?Q?e8Govq+YDYq3I/QPynfhgRNcCebwBNtdFhBa/sVl3aGKyJJ66qlkgzDtUi9Q?=
 =?us-ascii?Q?6lH8cc78Rpw8XerF7VoXeITwXRyBMzcdAjdsWvU2LwVgVcgLo2OdVRCC4lmo?=
 =?us-ascii?Q?hLfAGSTCEgxzWs8ijfWr+iV6Jzv8tCVsUPq4DV+4rMs1ieDEeqIEFaf8b30P?=
 =?us-ascii?Q?Ic4Z7xueM11c+TRUW8F3nhXhXTD9EhA+tpTw5mT+mqwqQnYLR5WkKf/kCbst?=
 =?us-ascii?Q?M4nzrc+iBqWs9wOJ0GcTwej9gnfvyhtD5/2PvZDXZ+3aXrJHrmlsOVhLwV44?=
 =?us-ascii?Q?yS/GSPkz0U1nQjUrGjsdMu2auLV/IspI87IG8ROL2n1FDA83v8d/c5UPKpW3?=
 =?us-ascii?Q?Q83IOu221lRGNwvz4kqtzFU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a008a8a-fd78-4e6a-24d0-08dd90fda020
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 02:35:14.6097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zveiwJoLYyNo9+wiEdKlP5mQR34Yq/qIWeMKEWxYZ7s9EYWvbb+78B3ZWq2ZFu/xLTXBbhQBlUqouGn2EMdllaM0LXNoCnrXDdXUnjq31RMhfLbGuZ7qSSxEFckSq37k
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10948

audio-graph-card2.yaml references audio-graph.yaml property.
Now, audio-graph.yaml already has "routing" property, let's reference it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 .../devicetree/bindings/sound/audio-graph-card2.yaml      | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml b/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
index 77c21733f9e63..f80273898421f 100644
--- a/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
+++ b/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
@@ -17,12 +17,6 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle-array
   label:
     maxItems: 1
-  routing:
-    description: |
-      A list of the connections between audio components.
-      Each entry is a pair of strings, the first being the
-      connection's sink, the second being the connection's source.
-    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
   aux-devs:
     description: |
       List of phandles pointing to auxiliary devices, such
@@ -37,6 +31,8 @@ properties:
   codec2codec:
     type: object
     description: Codec to Codec node
+  routing:
+    $ref: audio-graph.yaml#/properties/routing
   hp-det-gpios:
     $ref: audio-graph.yaml#/properties/hp-det-gpios
   hp-det-gpio:
-- 
2.43.0

