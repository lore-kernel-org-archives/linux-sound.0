Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3D518C92F;
	Thu,  9 Jan 2025 18:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736446978; cv=none; b=LZPXIoOv3heJtJgBiM6NGK8Qezoh8MiaNoevtohRofzwoaz327BYOTAaBk8cG0ZnHVnj+tddvtXkfFNl4pEwLxEzQWQ/ijiSWaAca6CfE7e8fFbCtEJr1ZrS021EmCXsrkSZ90gfkDCaGr2bD/c8gekUWIF49OFekiNy4yJE02A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736446978; c=relaxed/simple;
	bh=7yJahYtl/ITLiBj1e2HM6xldIw+Ims/VjC/sYdLWY48=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XfYU4TvEX8h9KO2Wsgb0UcVJ+if7/E3x5qtrj9dwmgrOpYDGmEzDUonsu+ez8pPKSu7pbjnJfAU5THaqVi1IkO2amm6d2SfIo6N+BJZAdVx2qeQ1t7WH1utxFkK9i9xzyWGBVBPvt3OrkKrsW1mcOjZrhte9cBLDNuBXr3GvgcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sKu0eeXv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sKu0eeXv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FC29C4CED2;
	Thu,  9 Jan 2025 18:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736446977;
	bh=7yJahYtl/ITLiBj1e2HM6xldIw+Ims/VjC/sYdLWY48=;
	h=From:To:Cc:Subject:Date:From;
	b=sKu0eeXvlMaHXjClH2pfeqby7b9X1Ee3U52f+fMNl0/obU7uvvLYKt/5bEQCVmpj7
	 yTNZmwXnce+EPsKsrTrpTxBU49zUDmkpPcafgqlU0pnp+eOW05RmoRJ9jAgP0cd1Hc
	 U8lL3HmCKiJWuAfS8PF+FFr4EhIevLUfj/BBFVjQWg9k0HxN0biESZIGYblH0UUQDL
	 bMfrYg0aSOqNByWNX8nWyM32RG2Rr63WmnhISZZ9Jgbum7QcEKILQ8WcHmSvjZ7jk+
	 LEUNYzmL2vRivPLRwXzzwY9+H+BXDfg2hOulWVDLAxI/VY/c+Uh0O5PjV3q8yNorRX
	 FiMSMHlYVEnsQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Mark Brown <broonie@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: simple-card: Drop unnecessary "dai-tdm-slot-width-map" property presence check
Date: Thu,  9 Jan 2025 12:22:02 -0600
Message-ID: <20250109182202.3971965-2-robh@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It doesn't matter whether "dai-tdm-slot-width-map" is not present or
there is some other issue parsing it in of_property_count_elems_of_size()
causing an error. Drop the presence check and rely on
of_property_count_elems_of_size() error return if not present.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 sound/soc/generic/simple-card-utils.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index 91325286894e..e25b387a9776 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -139,10 +139,9 @@ int simple_util_parse_tdm_width_map(struct device *dev, struct device_node *np,
 	int n, i, ret;
 	u32 *p;
 
-	if (!of_property_read_bool(np, "dai-tdm-slot-width-map"))
-		return 0;
-
 	n = of_property_count_elems_of_size(np, "dai-tdm-slot-width-map", sizeof(u32));
+	if (n <= 0)
+		return 0;
 	if (n % 3) {
 		dev_err(dev, "Invalid number of cells for dai-tdm-slot-width-map\n");
 		return -EINVAL;
-- 
2.45.2

