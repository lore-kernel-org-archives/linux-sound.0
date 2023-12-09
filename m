Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ez+KkUY/"
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [IPv6:2a00:1098:ed:100::25])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ECCFE1;
	Sat,  9 Dec 2023 12:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702155245;
	bh=Uzyzme1p3X66fqRyIz81KnujYtpDW+X/POMynZA7CsA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ez+KkUY/Mctyu+Il5OAscxfygxVAXr0MyAj8VUhaMowHF/cXZglw6BSp8PStaAbCk
	 naQOFKrMDZ5urm2BOKiMbej+gsyGUucUEfg7E/+tz2/B75oJPLds4u6Q0UYCQ0VAHp
	 7BjI+Wch/+y1qjAgjmi/hU9UA5z+74AuuQQ5BLnVD05La5xEvYKLrFqUxEI9zzmIR8
	 ISQjCRVUDQ1FzaJOM9YzRWeXpVaVCGSg+u1sAieZHY+Tliq47eBmXYHTF89E4AESmk
	 x5Wz8vZokHdUG+wAU4/CPb3Smb6OGWQS7T4USbQDyO2JNm+zkxDP+zp524Bz6U2Ihy
	 dN/fpBpSGDFJg==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 8DB3937813E0;
	Sat,  9 Dec 2023 20:54:05 +0000 (UTC)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Alper Nebi Yasak <alpernebiyasak@gmail.com>,
	Syed Saba Kareem <Syed.SabaKareem@amd.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Marian Postevca <posteuca@mutex.one>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>,
	Mastan Katragadda <Mastan.Katragadda@amd.com>,
	Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sound-open-firmware@alsa-project.org,
	kernel@collabora.com
Subject: [PATCH 03/11] ASoC: amd: acp: Add missing error handling in sof-mach
Date: Sat,  9 Dec 2023 22:53:42 +0200
Message-ID: <20231209205351.880797-4-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231209205351.880797-1-cristian.ciocaltea@collabora.com>
References: <20231209205351.880797-1-cristian.ciocaltea@collabora.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Handle potential acp_sofdsp_dai_links_create() errors in ACP SOF machine
driver's probe function.  Additionally, switch to dev_err_probe().

Fixes: 9f84940f5004 ("ASoC: amd: acp: Add SOF audio support on Chrome board")
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 sound/soc/amd/acp/acp-sof-mach.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/sound/soc/amd/acp/acp-sof-mach.c b/sound/soc/amd/acp/acp-sof-mach.c
index 1d313fcb5f2d..6f0ca23638af 100644
--- a/sound/soc/amd/acp/acp-sof-mach.c
+++ b/sound/soc/amd/acp/acp-sof-mach.c
@@ -112,16 +112,14 @@ static int acp_sof_probe(struct platform_device *pdev)
 	if (dmi_id && dmi_id->driver_data)
 		acp_card_drvdata->tdm_mode = dmi_id->driver_data;
 
-	acp_sofdsp_dai_links_create(card);
+	ret = acp_sofdsp_dai_links_create(card);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "Failed to create DAI links\n");
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
-	if (ret) {
-		dev_err(&pdev->dev,
-				"devm_snd_soc_register_card(%s) failed: %d\n",
-				card->name, ret);
-		return ret;
-	}
-
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Failed to register card(%s)\n", card->name);
 	return 0;
 }
 
-- 
2.43.0

