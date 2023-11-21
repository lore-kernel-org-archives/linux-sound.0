Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="b16MAPFI"
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CDD1123;
	Tue, 21 Nov 2023 04:07:56 -0800 (PST)
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0404D6607286;
	Tue, 21 Nov 2023 12:07:54 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700568475;
	bh=OPO6PjGpzSwciJq8nGHbJqxbgmsPtmRTdm9UuIC1Pgg=;
	h=From:To:Cc:Subject:Date:From;
	b=b16MAPFIwTHeMbcsiU6r2Bd0R0+l2qT7cBQhhAFvM9Zcbo/c2187N2emtX6AelGCJ
	 mgb/PyWfqBDozMQ8aYTHTPTF0qyGgq6VlHIsEb3E2aFIen8wAFQEcaOTFEm11890ye
	 M51/8nU0PGSs3Z10ZzQP9dXXji86lV6pvnSVznG08xcZXqzQCf9QKRJVxZlhubPk8r
	 FNrst196n38+SDbkJCxWsrtDbeFwtNvqbp+CM1JNr/HYauH0nUfp1F3ROTkg3aruBM
	 qMgZcnpmvEg4XuCTa2g+xNZiNeGWeqXOteQwnapF2KgQHHka0HxQIuyBPvqUCL9dWK
	 UPMwNvoNeHXBA==
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-sound@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: doc: Fix undefined SND_SOC_DAPM_NOPM argument
Date: Tue, 21 Nov 2023 14:07:51 +0200
Message-ID: <20231121120751.77355-1-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.42.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The virtual widget example makes use of an undefined SND_SOC_DAPM_NOPM
argument passed to SND_SOC_DAPM_MIXER().  Replace with the correct
SND_SOC_NOPM definition.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 Documentation/sound/soc/dapm.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/sound/soc/dapm.rst b/Documentation/sound/soc/dapm.rst
index 8e44107933ab..c3154ce6e1b2 100644
--- a/Documentation/sound/soc/dapm.rst
+++ b/Documentation/sound/soc/dapm.rst
@@ -234,7 +234,7 @@ corresponding soft power control. In this case it is necessary to create
 a virtual widget - a widget with no control bits e.g.
 ::
 
-  SND_SOC_DAPM_MIXER("AC97 Mixer", SND_SOC_DAPM_NOPM, 0, 0, NULL, 0),
+  SND_SOC_DAPM_MIXER("AC97 Mixer", SND_SOC_NOPM, 0, 0, NULL, 0),
 
 This can be used to merge to signal paths together in software.
 
-- 
2.42.1

