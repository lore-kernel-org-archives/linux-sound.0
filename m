Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010043.outbound.protection.outlook.com [52.101.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CD81624DF
	for <linux-sound@vger.kernel.org>; Mon,  8 Jun 2026 01:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780881887; cv=fail; b=tuLYzhsvfY6a4ol4c0EaAKpWqOSrH+4+QuGup9dF/vGkdMYCKu++nxz4gb18/Z2ENGjcxMg40S5yleWtCI5eXzF/C+U9pD88kIkxK0hYxKSkWGYaMoce8Iq4e4HiH+oThpzeTXoReHtYlGpm6gqQgwBBrHcErFKybO7BG0g8nEs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780881887; c=relaxed/simple;
	bh=yqsVvu/mNtPjZKQmxcxysKI9BkPXGDy+/41ZNxkNtqE=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=AHK6LXU7n+0ia3pY7id1UiNGhu1QMwHZ2JEBStNdKFmBMb/5+sOuog6yjQuldjKDIpzupKK7IJqx5axTzxNOIHvo1gb78tTkZedzrI5XLkFKSzZXb18PB3Ne8K5d1WYoMTLPQ2soFBH9LA3rfQTFltjhUELoEAgjq6AFmOuvFL0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=m3jB/0bO; arc=fail smtp.client-ip=52.101.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="m3jB/0bO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=St5bRHdBHty5NyEbBzaJeH3hJ1CKahbcMV9HQ0dJUMGjVXAbIumuUVngyl4PwlTdlSHv1+LLgfXR5F3h0BWK7FkajXcA1fsBWSoR4LNLrlMcr/et0YidetRpn5rZ1WWJoI9JvOG0PkHusweBODE3nq8BladhJM1F9WzKr4P5tisaq70shras7AwwG6a8z7OtvKBD2vA+kavBSMhTZeLwnd38a7WBYMxQ/cVnY67PM/5pQ8+UpXRDlQLVnO5KF3ub8ahvCQRP77GjgW83o/fZtt4SCbwckLmnc2yZ5Lc9EZSJaKVrSVHo+kzx6IKwm0siD0DjIRGhPheLXoe5/7TWLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0RSSANJGoUrn070HkFPpAmAlopW1Wb5R1xphZND/4EY=;
 b=gQnES5WIIKm199LzMv9K2jjbrER8+iqEaw3bCffUgmLEi9VDsX63Yts5E+sr984OLqzq6uPXq/uVUvRkOAbTauvEb4iZaNDWKG2Rn0hJ+NQwJCXrJRBdvJ4ZjtKtnxQU4WZ95kgPccZHHtfaQzJuseWTd8DCHF7DWdOKdTIVSd7izi5m1UikczrSxbZShoOp3/Kyh30d6mloZMHyWAY77+/ZRTzR9qaJFhD3YwNs9MZcJ1Dqge9ZqtoCFAf8NjIxBUpc0b8JtZbhYgdFJC287uk0g1dmr52joBTCsTwm0F+zf0MqQRfSITBrBU+zicQlyrF/4ZXz/W5KbLMQnxVpOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0RSSANJGoUrn070HkFPpAmAlopW1Wb5R1xphZND/4EY=;
 b=m3jB/0bOFDZSUrHXfnQk/ci3x8qhfFTJwsU+OJAWt+Jsep4CxfRi0CzaDFXzVFzPIdSG23jEV99uggGZ5jE2jtjxInUKt4DiDkP9hGHeV4/UvpGtoFxmQkVAsBCAG4HycflJAHOrXBXj6NjdPIpa/fSXfeDzsVOysR/c816mElc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS7PR01MB16954.jpnprd01.prod.outlook.com (2603:1096:604:41e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 01:24:44 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 01:24:44 +0000
Message-ID: <87h5ndesdg.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/6] ASoC: mediatek: cleanup mtk_sof_dailink_parse_of() param
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Takashi Iwai <tiwai@suse.com>
In-Reply-To: <87ik7tesdw.wl-kuninori.morimoto.gx@renesas.com>
References: <87ik7tesdw.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 8 Jun 2026 01:24:43 +0000
X-ClientProxiedBy: TY4P286CA0111.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:380::6) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS7PR01MB16954:EE_
X-MS-Office365-Filtering-Correlation-Id: 4745353e-16c1-4bd3-9fdb-08dec4fcb878
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014|56012099006|11063799006|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	m4yNisCnOyBO8fKK2cGPWpKJ+BpsJJ2egba+uqOCGGe+XZWM5cWC/hDhUuX+2NDW3e6M4ubOKrJNB1idP01DmrlRxe6LBMxxcDOV6/S9goXCu/t3qRvo5qUpCaLhUJlPYQW5BPy4Pwbldtr535FAiXPY9fXACKiz++PVifNbwMxdGi3xwUf9Kl8f+uC85rf8q1wPLNRStMpZwcsIOy2aD6UkuiijtpNxDFAFqmmb+8wAhO0aISFnzGIr3UTn55uJjZblUgyBgUyXLIsHvhCmdgBAAZp1oMYUGRrKTKtrfWyIlqWZhYS5kdU4Nb5SN5or+1H13YJLASwsEw6WURIpd+CLCIOCD6qUIUqK3H7s4xqgUOFnPwKpOGPzgkJPDDuqBgl/uWDXftC5E69vB781ISZZksIq6aN4icbXKgyi77xLzKh0UgsWWNQQisAVTsztmD+UAltk7rt6FsIE5JewTCkuMeqyUEedRvFciw04pBnIn538y9KhcrDQwcjqEJDArjW3jIzXbnFF5UB8p2joSn3t685Xtyf+hFIwr1E8fY4dYWwsH2NkzIuqk0SlqQZkPHrAVQPl1hCLmoCwe7lBpGpQNFWgPEszxQNS46gC3eS7ElL963B1VuMbyGNcWw5XnMaxNjWupFoiZO/cyiWUqxB+85+inp0it71ZvNRsNedpTRD4YPQdsFfuEAtCAY5supboH79LrgeYEpvPhE67KTlEjuRDn+KlzERCivLdNU5djCxB7p+Adg4LHq/xW2yY
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014)(56012099006)(11063799006)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ugsly+VaR4sciFL/1XK/EgXTb1/IlIuBa5MwSkvcDAkKRS0YvYZs09a6rKnY?=
 =?us-ascii?Q?SZa1yLPEZrevoofHsc8HsdoGMQSHgR0rPfr/7KEuRV6pIiUZuhaWjI+wJpfy?=
 =?us-ascii?Q?chWbiM/XmZ61sG0kAYakfrCAXI9UMjtnEUpm4ftf++jmJUQodP7+txfrz8aE?=
 =?us-ascii?Q?9Ee4ME9rUxSvYr9qwUcugCcnkGkJM2z10N/Kxg7b13RJXnMAVdhOQ2tjJdoh?=
 =?us-ascii?Q?+uGxAMOT2n5cZtNKiSdfHUCLchRyZC1dhyDAPvD9NfNjayBFW7lk51sbjCx8?=
 =?us-ascii?Q?WS9bI57lwHIEL6VlctC2TDIZA3bYi52ApyZbeP4e0x20Y+dziYiIcRDT0ESs?=
 =?us-ascii?Q?dK7oKGT6CqUSW+ZkUoQ4qTVgtTlJWcjHp6Cl/zDj1HRDw6Nj0Di9LbFmnscW?=
 =?us-ascii?Q?nNOZm9JxmEJwaJxzQsRhjHrrS4QX7oH/q4PvgsIw1VGRJ6XQ6uayHVpEI7h6?=
 =?us-ascii?Q?U45SO++qfJbCCjkDZ005grzQceWJtKblqJt47TZQwd3WinLuKea27Umajt49?=
 =?us-ascii?Q?ErepP64eATUzhsJdxoOpLF3tqhFpXilKdcIwzMEo9wvCR8bU7kzRGATvmHBx?=
 =?us-ascii?Q?+gdgTOsGoaViHs3g5lCmDO93CCduscudv3JeEN47T4wpu6XIrXS7MommT+kT?=
 =?us-ascii?Q?zISUiG7OYycdrx2MKy+3IyrYPRomaWQVfpiH5oVHDYs1KKPxtZJZhL4B8vg9?=
 =?us-ascii?Q?87VgUbBagrdDVoi8xHx442lbW3vL2yP/8boC0pV2EPkhZQLryiEPF76bqt7v?=
 =?us-ascii?Q?0oFJ3EyFbj0ovJUVLEqi5Ar3d3HU/giXz2F/ILdMie019J5JseQX/45FbiFM?=
 =?us-ascii?Q?y1NUBaFBZLENPoiJHzVTd/3fLcpszbhlt2o6QElGCOpqiDaOnzCqy8cEbvty?=
 =?us-ascii?Q?muHtcjn05zKRa2dZnARIKI/Stek2kufKZH7wFOEd3luxUMjhbDjTIrftb1lg?=
 =?us-ascii?Q?uLlxX9xxbSbBbgxjnYo9wHyoxqcdUpuG50zDppwaMJtlcOvQ//vnLVqxQ1xm?=
 =?us-ascii?Q?xukv3kbSKHhP3Jn3b218Xzhr1iSQj14SL3cBSo265sHplvKDO2OMlsGyfJwi?=
 =?us-ascii?Q?gzd1b0EGk/aEaAp/uEc6fzw6zaDgcjG0Pdlr8l/GZddCq7R4rC7V+IUp8/BI?=
 =?us-ascii?Q?s33wM0W4MoWKv8EF1tO5E3ISnjkm+EPM6exiqv7r+LtesTeE8JR2vBc9R3Hp?=
 =?us-ascii?Q?tYYFmT/8jp6q2XiidP3R0oRtNRu4plv4I/Vd8BMPhcGV20TWIjNk5K/YWnil?=
 =?us-ascii?Q?TPbXmqc9xWa4XG+X0yivMAyXKxvWvASb0hQPiwj9ppTAEEeWze4Mvcf3d+aa?=
 =?us-ascii?Q?vdLyxTnHPplS3SiZ/Y6cb0Y5peuY62aTYzYbW4A/Wfn/htEy61N8NxzSDLOP?=
 =?us-ascii?Q?2dzVHNhPmdSqagDohCoUw8/YHVDPKkgw6GcXSFB4Wk1fDlf09hcQV5qID8nY?=
 =?us-ascii?Q?n+7oJBeXh/Q4CFNoYgeg9PDtA2+Dkz3Ama4L7vGV4pEbIgIxrQk+AVle2EjD?=
 =?us-ascii?Q?FYULt8vy5ROvCBoFsAjmZI4/fzTZk6uKcxH8FlFxIhgduU1uQah0M9Udfx91?=
 =?us-ascii?Q?76VYagGJ0YvsRK7bbJgJ7d/xBMMu8++6CFFQ0ZrKNMbyAm+vJRSVTa1ox0kn?=
 =?us-ascii?Q?ud+J6MfFvYbhafFRlep9B9UXOOoqot7UELOpkZ4w4ZRsmpFJ4hWOXE2CAmV1?=
 =?us-ascii?Q?bYjfnYFRabLu+guMCosnftzAqUXRrW780afQ4ORQAtLx1zjWK278ejT4YL0K?=
 =?us-ascii?Q?S57Sr1sHR3rfFE5qJHdS7/OkSlrx4WJqScFSoGoWYSAPYW2blB1M?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4745353e-16c1-4bd3-9fdb-08dec4fcb878
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 01:24:44.1160
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GrAdAwiML331vJr3Ewkt70aRe28Sa1SS2x4+CTFcdluVevaglBDlZIdswvk3+mw+ViqoSXwRh4fv7sc7SrErLwWdgatUAIyIVLT6S+5I5JFT95SF5Jrxq7wN3cIMQ/Ir
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB16954

mtk_sof_dailink_parse_of() is using unnecessarily complicated parameters.
Let's cleanup it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/mediatek/common/mtk-dsp-sof-common.c   | 13 ++++++-------
 sound/soc/mediatek/common/mtk-dsp-sof-common.h   |  5 ++---
 sound/soc/mediatek/common/mtk-soundcard-driver.c |  5 ++---
 3 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-dsp-sof-common.c b/sound/soc/mediatek/common/mtk-dsp-sof-common.c
index fd10616a08a06..17b9ea6be6040 100644
--- a/sound/soc/mediatek/common/mtk-dsp-sof-common.c
+++ b/sound/soc/mediatek/common/mtk-dsp-sof-common.c
@@ -228,11 +228,10 @@ int mtk_sof_card_late_probe(struct snd_soc_card *card)
 }
 EXPORT_SYMBOL_GPL(mtk_sof_card_late_probe);
 
-int mtk_sof_dailink_parse_of(struct snd_soc_card *card, struct device_node *np,
-			     const char *propname, struct snd_soc_dai_link *pre_dai_links,
-			     int pre_num_links)
+int mtk_sof_dailink_parse_of(struct device *dev, struct snd_soc_card *card,
+			     const char *propname)
 {
-	struct device *dev = card->dev;
+	struct device_node *np = dev->of_node;
 	struct snd_soc_dai_link *parsed_dai_link;
 	const char *dai_name = NULL;
 	int i, j, ret, num_links, parsed_num_links = 0;
@@ -255,9 +254,9 @@ int mtk_sof_dailink_parse_of(struct snd_soc_card *card, struct device_node *np,
 			return ret;
 		}
 		dev_dbg(dev, "ASoC: Property get dai_name:%s\n", dai_name);
-		for (j = 0; j < pre_num_links; j++) {
-			if (!strcmp(dai_name, pre_dai_links[j].name)) {
-				memcpy(&parsed_dai_link[parsed_num_links++], &pre_dai_links[j],
+		for (j = 0; j < card->num_links; j++) {
+			if (!strcmp(dai_name, card->dai_link[j].name)) {
+				memcpy(&parsed_dai_link[parsed_num_links++], &card->dai_link[j],
 				       sizeof(struct snd_soc_dai_link));
 				break;
 			}
diff --git a/sound/soc/mediatek/common/mtk-dsp-sof-common.h b/sound/soc/mediatek/common/mtk-dsp-sof-common.h
index 8784ee471132a..1a0a47d64761f 100644
--- a/sound/soc/mediatek/common/mtk-dsp-sof-common.h
+++ b/sound/soc/mediatek/common/mtk-dsp-sof-common.h
@@ -36,8 +36,7 @@ int mtk_sof_dai_link_fixup(struct snd_soc_pcm_runtime *rtd,
 			   struct snd_pcm_hw_params *params);
 int mtk_sof_card_probe(struct snd_soc_card *card);
 int mtk_sof_card_late_probe(struct snd_soc_card *card);
-int mtk_sof_dailink_parse_of(struct snd_soc_card *card, struct device_node *np,
-			     const char *propname, struct snd_soc_dai_link *pre_dai_links,
-			     int pre_num_links);
+int mtk_sof_dailink_parse_of(struct device *dev, struct snd_soc_card *card,
+			     const char *propname);
 
 #endif
diff --git a/sound/soc/mediatek/common/mtk-soundcard-driver.c b/sound/soc/mediatek/common/mtk-soundcard-driver.c
index cdff7322426a9..24118217fe5c2 100644
--- a/sound/soc/mediatek/common/mtk-soundcard-driver.c
+++ b/sound/soc/mediatek/common/mtk-soundcard-driver.c
@@ -275,9 +275,8 @@ int mtk_soundcard_common_probe(struct platform_device *pdev)
 
 	if (adsp_node) {
 		if (of_property_present(pdev->dev.of_node, "mediatek,dai-link")) {
-			ret = mtk_sof_dailink_parse_of(card, pdev->dev.of_node,
-						       "mediatek,dai-link",
-						       card->dai_link, card->num_links);
+			ret = mtk_sof_dailink_parse_of(&pdev->dev, card,
+						       "mediatek,dai-link");
 			if (ret) {
 				of_node_put(adsp_node);
 				of_node_put(platform_node);
-- 
2.53.0

