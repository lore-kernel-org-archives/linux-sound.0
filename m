Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF7A37BE86
	for <linux-sound@vger.kernel.org>; Mon,  8 Jun 2026 13:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780925990; cv=none; b=q1qesU+A9bSSr7gCYKStClm7qXnK3VM1tz9FPcgj8Ev5AzbKKy0dVuvCUT2d11WwkwxVv9UuDhgboJ38yEmiEu1fkLqqwedbLhQ83CbvXBDtiIgjvUDDyMitwiM4feCps8tPYuyoojeovYdmE+Zws5nTU41IVq/UDBzKXMWnoZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780925990; c=relaxed/simple;
	bh=Fku3y1CGF4nhcunbUPtMiClanJb89VvqUuwkh2+knqc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=elPbcHk0hZV/DTl0MME0d9JfM9oZ5wlMs+jqsMuoKUlb4OBNqUZVhPwCmJUQmqbkD0R4OCFQvJ3FxO0t+7ouMrXvrNmxXlPeHyNetsks/xx06StiOkMR+A2soNXFubyi4tKSFXiGkMCFaeTt9hxk67C3jdA3TFB+T28smkJe7NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=soPQGuAj; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="soPQGuAj"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-304fb780deaso4226154eec.1
        for <linux-sound@vger.kernel.org>; Mon, 08 Jun 2026 06:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780925988; x=1781530788; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YBhrbnQZkkDV1+28VAJe073K28r+xjYcWQgKCYCLNoY=;
        b=soPQGuAj9/yrkCa/JTz0MZfBohNMYiXxWF1wuZyHw0E767AaKJBHEUpFOmzq234XaC
         /hCegh+6US0IqsecrM7eiRTzGzGsbXFRwDTqv/FIC4mp3QU8tFykEOOpLjk/ISNRQWJY
         bnNVfCoU1EqOkP7f2VyQm8yXea2cXSas6GrXocyWIk4KdVqZM3iI5ExkGfecSD+n/ztf
         hHkRY5XDhcXyvZWg4HAHJwE9gbKIdMjcH2k6IDtcZuJ6BYodVA6E5a8ncRb6QBFif8pL
         Km6Asj8D6wVHL37OFRRw4CBwhp7TdH0haqL+9NqHvXcpEllaeMXGbJzIoEqzKyMh2GFT
         VSVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780925988; x=1781530788;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YBhrbnQZkkDV1+28VAJe073K28r+xjYcWQgKCYCLNoY=;
        b=HLA+suKD43xxCwV96zecoxHiUYhVRszu+/pzIdkYlRrYxPlOujyDbzBADvloT1vqSu
         zXfXlJR9O/kiqHx2hOyvRC9KVzuqUPIcgYuxB0obM+RPhc54aFrh9bVnkPDUMssurgep
         sY4BivAPK4cbzrZJ2JqwGXRn5CoKDAstodZsqmn+3IrMU2E34qpJauIjzWNbsUVaCGrT
         8eZv3TZLVrlt/UfcZtBAoA/krsO9yfweNMh2nqzp6kzrNIjgXORWN7HtAk3IG3exQ4Vb
         1Lwcz2qR4RNrf0PF8ZeUEc31blL1CpbRibD+qvEGPeWec+oNQ7bS6AuA+lZjjBBjxVt+
         OJ+Q==
X-Gm-Message-State: AOJu0YxQ26BK0kwXdB2OQWK0Q/INNViYrIukNBrBEWEQjg9WKewfSr+a
	uN55XUaHmGdDvhIZ4EYqCINtiaqA1QkrxPj7Y4b3LyEIObB1W1Ui8ef4
X-Gm-Gg: Acq92OHOrtYo0Y7xs0qp8LwO0yYFNNyfX3teUXL8R2+Shfe30buOA5IQ+9UertUXROk
	9ucfDztn9G9zoDX/wgfN2IgpqQSo/kKAghTf66cG3ukpv5yWQU2vCMgM9R5LLnmksKr90o+klHg
	YXkhIz4qPCPeusDXA6gKcrQbCnyTNTtyVVtZbzb8KdVziOVj2qrt15uHF68OnhxTQ8pSTvSRXl+
	IYks8V5I72rhb3tYuaQ6uVF6+m2Mm/oNeirkjmWrZHTQAnhMWgIlvl+ytDiZNGcKikxZwB3jV4j
	2PlAJ72jUk79MMeBky9X9QjRS61gEVqpPmBg3hrtjACbLCasSal7qVTZMLAOB4zVgcZhKryTgy0
	fFwus5V4LoCJ+yHg30yL8rE1PP2Q+0snT80NJ1t/5I7OmH9+TBmXE6AuGpVqmJm7IsrZr3vEHBI
	rVtBwJywyHhMegI5VmSDmW0hRuxGinySEo5W7jAwz2Or908ypqLIkaqY11LGi3INDxZNp3+Umg9
	1/1H6FXpnxQ2ihJ4D8tTzc=
X-Received: by 2002:a05:7300:230b:b0:304:2eb0:2726 with SMTP id 5a478bee46e88-3077b22df0fmr7429361eec.25.1780925987987;
        Mon, 08 Jun 2026 06:39:47 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-23.user3p.v-tal.net.br. [177.4.161.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074db560d7sm23893449eec.5.2026.06.08.06.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:39:47 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Mon, 08 Jun 2026 10:39:11 -0300
Subject: [PATCH 1/3] ASoC: qcom: common: use scoped OF node handling
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260608-asoc-of-node-scoped-cleanup-v1-1-9e3ac518dc2e@gmail.com>
References: <20260608-asoc-of-node-scoped-cleanup-v1-0-9e3ac518dc2e@gmail.com>
In-Reply-To: <20260608-asoc-of-node-scoped-cleanup-v1-0-9e3ac518dc2e@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>, 
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Herve Codina <herve.codina@bootlin.com>, 
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org, notify@kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4019;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=Fku3y1CGF4nhcunbUPtMiClanJb89VvqUuwkh2+knqc=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFlqxySsmP6Uc+po3Tn/8kP/s2fH8w/HHkoXC4xxXeCRb
 /CAZ39pRykLgxgXg6yYIsvqpEWWe7oeXK2PW+EBM4eVCWQIAxenAEzk1y+GPxwrOKKqzBacSJxt
 9/tcgR5Dgp68lparbeMO/TVCrQstljMynC35KmN89b1HxdbVHh9ufDaRTzlueZRld/yU+ZP/P/X
 ewwAA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

qcom_snd_parse_of() manually drops the link child node and the
cpu/platform/codec child nodes on error paths and at the end of each
iteration.

Use for_each_available_child_of_node_scoped() for the link node and
__free(device_node) for the named child nodes. This keeps the existing
ownership rules for DAI component phandle references, while removing the
manual cleanup labels from a path that has previously needed OF refcount
fixes.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/soc/qcom/common.c | 47 +++++++++++++++--------------------------------
 1 file changed, 15 insertions(+), 32 deletions(-)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index cf1f3a767cee..edc4611691f7 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -25,10 +25,6 @@ static const struct snd_soc_dapm_widget qcom_jack_snd_widgets[] = {
 
 int qcom_snd_parse_of(struct snd_soc_card *card)
 {
-	struct device_node *np;
-	struct device_node *codec = NULL;
-	struct device_node *platform = NULL;
-	struct device_node *cpu = NULL;
 	struct device *dev = card->dev;
 	struct snd_soc_dai_link *link;
 	struct of_phandle_args args;
@@ -82,12 +78,10 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 	card->num_links = num_links;
 	link = card->dai_link;
 
-	for_each_available_child_of_node(dev->of_node, np) {
+	for_each_available_child_of_node_scoped(dev->of_node, np) {
 		dlc = devm_kcalloc(dev, 2, sizeof(*dlc), GFP_KERNEL);
-		if (!dlc) {
-			ret = -ENOMEM;
-			goto err_put_np;
-		}
+		if (!dlc)
+			return -ENOMEM;
 
 		link->cpus	= &dlc[0];
 		link->platforms	= &dlc[1];
@@ -98,32 +92,33 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 		ret = of_property_read_string(np, "link-name", &link->name);
 		if (ret) {
 			dev_err(card->dev, "error getting codec dai_link name\n");
-			goto err_put_np;
+			return ret;
 		}
 
-		cpu = of_get_child_by_name(np, "cpu");
-		platform = of_get_child_by_name(np, "platform");
-		codec = of_get_child_by_name(np, "codec");
+		struct device_node *cpu __free(device_node) =
+			of_get_child_by_name(np, "cpu");
+		struct device_node *platform __free(device_node) =
+			of_get_child_by_name(np, "platform");
+		struct device_node *codec __free(device_node) =
+			of_get_child_by_name(np, "codec");
 
 		if (!cpu) {
 			dev_err(dev, "%s: Can't find cpu DT node\n", link->name);
-			ret = -EINVAL;
-			goto err;
+			return -EINVAL;
 		}
 
 		ret = snd_soc_of_get_dlc(cpu, &args, link->cpus, 0);
 		if (ret) {
 			dev_err_probe(card->dev, ret,
 				      "%s: error getting cpu dai name\n", link->name);
-			goto err;
+			return ret;
 		}
 
 		link->id = args.args[0];
 
 		if (link->id >= LPASS_MAX_PORT) {
 			dev_err(dev, "%s: Invalid cpu dai id %d\n", link->name, link->id);
-			ret = -EINVAL;
-			goto err;
+			return -EINVAL;
 		}
 
 		if (platform) {
@@ -132,8 +127,7 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 					0);
 			if (!link->platforms->of_node) {
 				dev_err(card->dev, "%s: platform dai not found\n", link->name);
-				ret = -EINVAL;
-				goto err;
+				return -EINVAL;
 			}
 		} else {
 			link->platforms->of_node = link->cpus->of_node;
@@ -144,7 +138,7 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 			if (ret < 0) {
 				dev_err_probe(card->dev, ret,
 					      "%s: codec dai not found\n", link->name);
-				goto err;
+				return ret;
 			}
 
 			if (platform) {
@@ -167,10 +161,6 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 
 		link->stream_name = link->name;
 		link++;
-
-		of_node_put(cpu);
-		of_node_put(codec);
-		of_node_put(platform);
 	}
 
 	if (!card->dapm_widgets) {
@@ -179,13 +169,6 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 	}
 
 	return 0;
-err:
-	of_node_put(cpu);
-	of_node_put(codec);
-	of_node_put(platform);
-err_put_np:
-	of_node_put(np);
-	return ret;
 }
 EXPORT_SYMBOL_GPL(qcom_snd_parse_of);
 

-- 
2.54.0

