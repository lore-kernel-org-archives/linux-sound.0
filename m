Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977A5386551
	for <linux-sound@vger.kernel.org>; Thu,  4 Jun 2026 03:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780542676; cv=none; b=N46h/diHIOCvcJhhObjA/T4fUqGAYzDBvx3YiG575ITahz8tYNanWc7xPeDnVpycniN7+9FCNrWWp3UBoFxRK+Co0iV2MR06lFdfC4j7j+MuVPxxUmGaSD1JVeuaR0KE5cLTO8dF+5nf1/ZPtdgQHarRUvWhRfdg9t0UOfWibuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780542676; c=relaxed/simple;
	bh=Q6/RP/ICLpgOkDTGL9yzNqK8wqGv6aHYVnskfy5B/CY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=PVhUITGgzQ0QfIZsghu7R32t1X0Uj/KIDkjloAGnXRyZ0a2jb5KeKIOzNZ6RZGDf2rVM0vO4z9xdY4i/ujMIIPB0doPmFky0oh5CcJUF7HCHv94LH8CnA/1tXX3fihXp73Oc402SQtg8Upy+V7PTVBDpEjiSpa/nePzkLmxwpS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FFKvqLaJ; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FFKvqLaJ"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-135e7f4a295so149885c88.0
        for <linux-sound@vger.kernel.org>; Wed, 03 Jun 2026 20:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780542675; x=1781147475; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VbwdIBSDHSxTBOxkXvou9QueKyiGAI0qWq+McK1ImMc=;
        b=FFKvqLaJ2Sv5b6JwVBEk0iNRR3cjO4uoc4vTH/HS3aeGZWiTZpdVk8EWdAy+952VpR
         YF72kJp8aNZlk9auQY8PBWohZixZMcDLJX2FqRq6VeD5rDEfmTreJBEuXMtU8xpYzIt/
         mdhWSMHPvcDy2OgV8qbnaQg5Lq4gU1IzHGYofYbIm8BmUsQg4T82rmq8ZC5WzVWKp+TS
         MxU1E9QOPg8WjsKdpcGTgVveAOwummjND3AmLL+xuMVTTgdj0WJ43p3JqL2vfokjw0EM
         GgY0++CaLFQ2sIe/Uc66LBmtAe7RJuSUxwBuY4zXSq+ke29GWntPE0aEYS1IZcO2kkuj
         b9bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780542675; x=1781147475;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VbwdIBSDHSxTBOxkXvou9QueKyiGAI0qWq+McK1ImMc=;
        b=tT6Sc8z9cUCGK2HvVoKGWW1Sd8BL2hgiSq/ZC9URo0SkFm7V9cPCOmLliYo31eBgcT
         otnF3MCW7nlxA/AEyFcoL9kYy5UCGSB4AI3ePZQuoABQ18U7bNwjUM/Y7nR9Poinp/wp
         S2+tJDXy8TMtgE8QrVuaPyVmI53IZCkjbhr8xUVUcvecEMU6EgHksv0pasv9VfLX9kMU
         bEYxthWmugCIxkXgJh7d8j5w9AbeDhZTI+mHkdO33SWxJ3Cbfcc9ieZREDzVlihEmu7G
         E3rkWFHuwcGgBCtS8jp/42ihSrcf+XKKAFiGMvUL0BwlqIC+9cOqEld1xqoV4o4WRK6z
         uPzA==
X-Forwarded-Encrypted: i=1; AFNElJ87FimX8mrXP4hrkQfxWlXrsAm4XUwHYzjyUxwLs1ZDFyf5K3qMe5iMLfaJwb1yx1XaLbuWUpHsAaQ6Qg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLTcDecIu6b11Rkn4YiPBnv/OdBaLPeajtqr/NiYKTZFm7T99i
	qOr39K9xf19O1SWvIpHO9RaGEdJroKJRdi6jHBPW9gScReKjuOYujz8n
X-Gm-Gg: Acq92OFWrcVJnucCZrdUqXY65m3SMWvHQiEelB6rMwDiNLsQMV2l7CbC84IveQ7R6rq
	QncbUFQc26pYAtNbuxqVWNmSHImfSkuM5DTabBYVTRl7Wih9gyxYgpihQsytpIUoChPqxV61a+/
	i5IUDE2DPLNJ3tnXmdDw9hsBOxNKKSULKn0R36HkEtIDLruXjR/O0uC5U3uI5YHRO2TPffgq0Zo
	7hoW3flnxu3YZuEnh9knqSki/EdFEwX6UBX860A0nwEeSmVsTIllmHaXwnKIfOoLkNEp1GF/UbX
	/b3IGYM5u/CUy+9vOMw/7u803DeMmCuBIEdOkmMhIyJ5shK8CZa31nIH3nIqlGRKv38uYAOYSf+
	RP7o+7CLKFNdjsOeJcfTBqqBVDYZBj9SN68h67LWQ5/Ef4aUGwdZEvYSygBNzN/YPGLQC/TNJE5
	c9hO69FHw5OBASZNSa29guayh+YegEtiav6a1f+Y0V7MnI/13P7mD4eHgoP97u9m4UtXtd3AXVY
	LHQMpsKRtHd
X-Received: by 2002:a05:7022:252c:b0:137:ee08:ad37 with SMTP id a92af1059eb24-137fdf25676mr791902c88.13.1780542674423;
        Wed, 03 Jun 2026 20:11:14 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-23.user3p.v-tal.net.br. [177.4.161.23])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f54899acsm2888211c88.3.2026.06.03.20.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 20:11:13 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Thu, 04 Jun 2026 00:10:58 -0300
Subject: [PATCH] ASoC: topology: Check PCM and DAI name strings before use
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260604-asoc-topology-check-pcm-dai-names-v1-1-e1b0f6f7c2ce@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNwQrCMAyA4VcZORtIK4zhq4iHmGVb1bWl2UQZe
 3erHr/L/29gWoIanJoNij6DhRQr3KEBmTiOiqGvBk++pZaOyJYEl5TTI41vlEnljllm7Dlg5Fk
 NaZCO2LvOMUHt5KJDeP0e58vftl5vKss3DPv+AaVrT6GFAAAA
X-Change-ID: 20260603-asoc-topology-check-pcm-dai-names-0fc80a2181a0
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, 
 Mengdong Lin <mengdong.lin@linux.intel.com>
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 notify@kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3564;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=Q6/RP/ICLpgOkDTGL9yzNqK8wqGv6aHYVnskfy5B/CY=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFkKb859//mQi+1XIJ9Fg9nV80/XL3ecv1QuYS/vqVuXw
 x9fErra0lHKwiDGxSArpsiyOmmR5Z6uB1fr41Z4wMxhZQIZwsDFKQAT+X2J4Z/F8U7Z63GJfyay
 Pj+0g6PsnhJncOg9V6MLbO1G7m/qlF8xMlxkPxqdrrCw3a9qzmPtemm7Z0vaezwN69Xvv52zjOH
 KDA4A
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

Topology objects store several PCM and DAI names in fixed-size UAPI
arrays. Other topology parser paths validate these fields with bounded
strnlen() checks before using them as C strings, but the PCM and DAI
paths still pass some fixed-size arrays directly to strlen(),
devm_kstrdup(), DAI lookup, and diagnostic prints.

A malformed topology blob with a non-NUL-terminated PCM, DAI, or stream
capability name can therefore make the parser read past the end of the
fixed-size field.

Reject unterminated PCM and DAI name fields before consuming them as C
strings.

Fixes: 64527e8a3529 ("ASoC: topology: Add FE DAIs dynamically")
Fixes: acfc7d46cddc ("ASoC: topology: Add FE DAI links dynamically")
Fixes: 0038be9a84dc ("ASoC: topology: Add support for configuring existing BE DAIs")
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/soc/soc-topology.c | 37 ++++++++++++++++++++++++++++++++++---
 1 file changed, 34 insertions(+), 3 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 85679c8e0229..35cbe29d2275 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -1326,9 +1326,24 @@ static int soc_tplg_dapm_complete(struct soc_tplg *tplg)
 	return ret;
 }
 
+static int soc_tplg_check_name(const char *name)
+{
+	if (strnlen(name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) ==
+	    SNDRV_CTL_ELEM_ID_NAME_MAXLEN)
+		return -EINVAL;
+
+	return 0;
+}
+
 static int set_stream_info(struct soc_tplg *tplg, struct snd_soc_pcm_stream *stream,
 			   struct snd_soc_tplg_stream_caps *caps)
 {
+	int ret;
+
+	ret = soc_tplg_check_name(caps->name);
+	if (ret)
+		return ret;
+
 	stream->stream_name = devm_kstrdup(tplg->dev, caps->name, GFP_KERNEL);
 	if (!stream->stream_name)
 		return -ENOMEM;
@@ -1380,7 +1395,11 @@ static int soc_tplg_dai_create(struct soc_tplg *tplg,
 	if (dai_drv == NULL)
 		return -ENOMEM;
 
-	if (strlen(pcm->dai_name)) {
+	ret = soc_tplg_check_name(pcm->dai_name);
+	if (ret)
+		goto err;
+
+	if (pcm->dai_name[0]) {
 		dai_drv->name = devm_kstrdup(tplg->dev, pcm->dai_name, GFP_KERNEL);
 		if (!dai_drv->name) {
 			ret = -ENOMEM;
@@ -1486,7 +1505,11 @@ static int soc_tplg_fe_link_create(struct soc_tplg *tplg,
 	if (tplg->ops)
 		link->dobj.unload = tplg->ops->link_unload;
 
-	if (strlen(pcm->pcm_name)) {
+	ret = soc_tplg_check_name(pcm->pcm_name);
+	if (ret)
+		goto err;
+
+	if (pcm->pcm_name[0]) {
 		link->name = devm_kstrdup(tplg->dev, pcm->pcm_name, GFP_KERNEL);
 		link->stream_name = devm_kstrdup(tplg->dev, pcm->pcm_name, GFP_KERNEL);
 		if (!link->name || !link->stream_name) {
@@ -1496,7 +1519,11 @@ static int soc_tplg_fe_link_create(struct soc_tplg *tplg,
 	}
 	link->id = le32_to_cpu(pcm->pcm_id);
 
-	if (strlen(pcm->dai_name)) {
+	ret = soc_tplg_check_name(pcm->dai_name);
+	if (ret)
+		goto err;
+
+	if (pcm->dai_name[0]) {
 		link->cpus->dai_name = devm_kstrdup(tplg->dev, pcm->dai_name, GFP_KERNEL);
 		if (!link->cpus->dai_name) {
 			ret = -ENOMEM;
@@ -1848,6 +1875,10 @@ static int soc_tplg_dai_config(struct soc_tplg *tplg,
 
 	memset(&dai_component, 0, sizeof(dai_component));
 
+	ret = soc_tplg_check_name(d->dai_name);
+	if (ret)
+		return ret;
+
 	dai_component.dai_name = d->dai_name;
 	dai = snd_soc_find_dai(&dai_component);
 	if (!dai) {

---
base-commit: c90ab81b8d75e0ea3d725f60dafed9a8285855f5
change-id: 20260603-asoc-topology-check-pcm-dai-names-0fc80a2181a0

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

