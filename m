Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8492498928
	for <linux-sound@vger.kernel.org>; Thu, 17 Sep 2026 21:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789678969; cv=none; b=B6Q+v8pvTDNYTQAfM0Zv6l5pk+qe0hku8KTmED4tTG2yW82IHPAB54F9W6II77PleAOcaUnGu9r6uKIpFv4uONRAhys6FMgYIm5f8c31cVMtDeWjdphVdPZMQD6wrFRXJYE7iY20xsh2aJ4GcO311t0XtMCXRFbYwATXCkfpST8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789678969; c=relaxed/simple;
	bh=vu+Bm1uBGIa5rQR0KJvCXwwxy1648qk7OnTjRUBnopY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sepiKBj7wZ+sunbxv4KcG1sE5YerBwTWwKbH6DDZBZemiiz7B9Fu7aYEWAwiJp66yyeuIrTuQf5L7dLDSPLdE9DQpKEtdCASA/WGXNyt74YxK/8+dqsje9GlvxAFlL/U2mWSGQQxYwvspQrFqwWQl0vk35a4vM8FEez8+jmzOPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=jW+Q9yK7; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="jW+Q9yK7"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b91369d18so783035e9.0
        for <linux-sound@vger.kernel.org>; Thu, 17 Sep 2026 14:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789678965; x=1790283765; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pQfq1mATHoXVEi2yZgGnZpynXkHV46ypp/DnWHom6Nw=;
        b=jW+Q9yK72RWoq3WmHe8KNAtPEh7KfvRNDbcjHNk3+ZaO2apNhfFTziYnMhfZnTzAf6
         gEz8Lh+pFCEBegz7gptsL9cb2rzUqZaD4B2T/GEvwWjOAkpWcCjGFOpnevltOADVVm5g
         Yu9r22ukRBlglnzkNWO9fNsxQEfRqxpMMK27Y5tWqtTIzB29uFmdIBCvoAuGWPJwNGVX
         kHUEgDUK50nZgI/dCehrFIfxIr4cgC7FjaPI+ncNL2+A1T8ZB+KwzqV90xWycaaE/D3O
         NvPN+waG1gTtnM6t+OPxexHLy4HTPLvchJ8H3/dbJU9PfFhfDh95hRP/T3KSHApI8pNh
         q4rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789678965; x=1790283765;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pQfq1mATHoXVEi2yZgGnZpynXkHV46ypp/DnWHom6Nw=;
        b=c4XFToWb8ZpyJT1T/7K4tvnPCcmeMPwLQujdLMBo/Z30KOvuODefC62whBzVSlBAZh
         RVQLT6Sl6EdWWBLgDwhtqIRnlM4UDPZT12rLS/XRIoM8jlUUSg2BZlL0Hmad0zbDnOeH
         yrwk20hUwMIkr7qoPhVqinViZ2UF4vkD2Zb2nlNEXVPugUMjDiDOjM/H8S/CyIqptYMs
         6oylZcexZN9vZjRTHVYfz8HQbJWUF9YCMdlT1cqQIPN61GsUgPOx6vYrm+Vecpmrz/TC
         YQLT8h4xi/LhwemnicnXVNGf6qH8EspYc680ZHNQV55N51YtQd2bG+z3Inzy0bgDIOfB
         Ljww==
X-Gm-Message-State: AFuF++mC5FG6KIfWL+5babOKn3MgHtAvw1LLVN4JTbv0PfE+PDOdlzWt
	hpc1XSZxs9WtvefmLhHkmDxon2zuCSFBUK5yRPeftdaKoSyUd/beugVH4yntZflVbWM=
X-Gm-Gg: AYBFou2uu4kRYk1XvWaI7ZULTqn1cGzJ8JgNKKpW9Yk3YNSEElgLMwAmxPhsjf9AeTZ
	dYTQjlMdOyqqwWpCEIUEnqraDqr36jQNo/U7Rzy/H7Zn+5M47wux6fBroMO9esgtStAxE4+8T85
	5Eku/QzwH2o0ZiwRk/jOrZ4pz8ScA0gJyNtx/QAddRLQ9qlhd/P7H8MGWpWBTQXgqdH0ZDasIVq
	KYLYHR+9hIoCkv6bH10GlYibRvnOWLaw6hqZ3ulMWy2COVpjiJkU/gnL8KxSF8wQEWECUh0uPX/
	jB8Qs3nh+H562rv+0IqBq/jb8R/CNIQMs2roeMBHWbsnUuCYGz6+GLHV8yIHhCuTyZKMVKpai34
	evcuJq3Ct2LTilBXsf03XbW0bCqTvczUBemG2NKQkgqvW9Ywza72y3cpj9F/UeNEoWHYTwxHxO+
	KpFCi06lthT0TcTXzcw03hAgQyqiNqyCj10WhyNEpxaE86HcaxRuNutpLT7kqOkeKOZA==
X-Received: by 2002:a05:600c:3b98:b0:49d:1f10:8b9f with SMTP id 5b1f17b1804b1-49fc56dba0dmr2100645e9.7.1789678964981;
        Thu, 17 Sep 2026 14:02:44 -0700 (PDT)
Received: from [127.0.1.1] ([151.42.87.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc5755c40sm3106095e9.3.2026.09.17.14.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 14:02:44 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Thu, 17 Sep 2026 23:02:35 +0200
Subject: [PATCH v2 5/6] ASoC: meson: gx-card: add support for audin FIFO
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-audin-v2-5-38de4bc1de34@baylibre.com>
References: <20260917-audin-v2-0-38de4bc1de34@baylibre.com>
In-Reply-To: <20260917-audin-v2-0-38de4bc1de34@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2156; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=vu+Bm1uBGIa5rQR0KJvCXwwxy1648qk7OnTjRUBnopY=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFlrQnNvBO8UVQ8+9qB99/VbLAl3fB9mMG7qDv2Yxp5U5
 frLok6to5SFQYyLQVZMkYVl+r3fBaVqD40TThbAzGFlAhnCwMUpABMJ0mZkWOu4oW5S2wKu3Rzr
 Q+/P8zi2ftoWrZUGXCl7/jeey3uy8inD//RNdj9qdysuEMmYfGw9S67zmvPuhY+4dB5MXj71EvO
 So3wA
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

Slightly modify "gx_card_cpu_identify()" by making the compatible matching
string an input parameter. This allows to easily support also AUDIN's FIFO
with minimal changes.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/gx-card.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/sound/soc/meson/gx-card.c b/sound/soc/meson/gx-card.c
index 932be0a09306..35bc47254752 100644
--- a/sound/soc/meson/gx-card.c
+++ b/sound/soc/meson/gx-card.c
@@ -66,10 +66,10 @@ static int gx_card_parse_i2s(struct snd_soc_card *card,
 }
 
 static int gx_card_cpu_identify(struct snd_soc_dai_link_component *c,
-				char *match)
+				const char *compatible_match, const char *dai_match)
 {
-	if (of_device_is_compatible(c->of_node, DT_PREFIX "aiu")) {
-		if (strstr(c->dai_name, match))
+	if (of_device_is_compatible(c->of_node, compatible_match)) {
+		if (strstr(c->dai_name, dai_match))
 			return 1;
 	}
 
@@ -96,21 +96,23 @@ static int gx_card_add_link(struct snd_soc_card *card, struct device_node *np,
 	if (ret)
 		return ret;
 
-	if (gx_card_cpu_identify(dai_link->cpus, "FIFO"))
-		return  meson_card_set_fe_link(card, dai_link, np, true);
+	if (gx_card_cpu_identify(dai_link->cpus, DT_PREFIX "aiu", "FIFO"))
+		return meson_card_set_fe_link(card, dai_link, np, true);
+	if (gx_card_cpu_identify(dai_link->cpus, DT_PREFIX "gx-audin", "FIFO"))
+		return meson_card_set_fe_link(card, dai_link, np, false);
 
 	ret = meson_card_set_be_link(card, dai_link, np);
 	if (ret)
 		return ret;
 
 	/* Or apply codec to codec params if necessary */
-	if (gx_card_cpu_identify(dai_link->cpus, "CODEC CTRL")) {
+	if (gx_card_cpu_identify(dai_link->cpus, DT_PREFIX "aiu", "CODEC CTRL")) {
 		dai_link->c2c_params = &codec_params;
 		dai_link->num_c2c_params = 1;
 	} else {
 		dai_link->no_pcm = 1;
 		/* Check if the cpu is the i2s encoder and parse i2s data */
-		if (gx_card_cpu_identify(dai_link->cpus, "I2S Encoder"))
+		if (gx_card_cpu_identify(dai_link->cpus, DT_PREFIX "aiu", "I2S Encoder"))
 			ret = gx_card_parse_i2s(card, np, index);
 	}
 

-- 
2.47.3

