Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="BM1AxB/9"
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5116A13A;
	Sat,  9 Dec 2023 12:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702155255;
	bh=Xs+m1eeyJ8qSJwxEkU2Al7uwFtkLxLKKyx9Q9Aji0SQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BM1AxB/90+ZZf9BPE3xnjreVuHJFGy9SalattDgPSSrF66q6vmhvYZdHx0dPJxHyj
	 EvCObBHwhMyZKBEkp62RGYREpOQdDJjEvkzYRXH4dBrMuxaGO87T/aDpvnz3459VDm
	 tBtOqigUoPuQlYRa9GCUVL4eY4BLgzcxoNBRvSDXofTijK2+Q9Uj1YgpDX5Miievab
	 CPaxcg11RfkJbwP/vb8IR8fgcAusgnBLLZdPP29tjIt6XhlDB3AeIhWcc4ESUfts/p
	 DeHOcnZjaQ5LkFUFklS0ZkOhnwmuQEzsNFHH0+Oijb7mpFOd7mCPThhe3Hl/JwHYnQ
	 aSSJMxewyAStA==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id CCD2537813ED;
	Sat,  9 Dec 2023 20:54:14 +0000 (UTC)
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
Subject: [PATCH 11/11] ASoC: SOF: topology: Add new DAI type entry for SOF_DAI_AMD_BT
Date: Sat,  9 Dec 2023 22:53:50 +0200
Message-ID: <20231209205351.880797-12-cristian.ciocaltea@collabora.com>
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

Commit efb931cdc4b9 ("ASoC: SOF: topology: Add support for AMD ACP
DAIs") registered "ACP" name for SOF_DAI_AMD_BT DAI type.  However, some
boards, i.e. Steam Deck OLED, seem to require "ACPBT" for the same type:

[  467.489680] snd_sof_amd_vangogh 0000:04:00.5: ipc tx error for 0x30030000 (msg/reply size: 16/0): -22
[  467.492775] snd_sof_amd_vangogh 0000:04:00.5: sof_ipc3_route_setup: route ACPBT2.IN -> BUF5.0 failed
[  467.495839] snd_sof_amd_vangogh 0000:04:00.5: sof_ipc3_set_up_all_pipelines: route set up failed
[  467.499128] snd_sof_amd_vangogh 0000:04:00.5: error: tplg component load failed -22
[  467.502210] snd_sof_amd_vangogh 0000:04:00.5: error: failed to load DSP topology -22
[  467.505289] snd_sof_amd_vangogh 0000:04:00.5: ASoC: error at snd_soc_component_probe on 0000:04:00.5: -22
[  467.508430] sof_mach nau8821-max: ASoC: failed to instantiate card -22
[  467.511725] sof_mach nau8821-max: error -EINVAL: Failed to register card(sof-nau8821-max)
[  467.514861] sof_mach: probe of nau8821-max failed with error -22

Add "ACPBT" alias for "ACP" SOF DAI type.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 sound/soc/sof/topology.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index e3e7fbe40fa6..73bf791e7520 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -290,6 +290,7 @@ static const struct sof_dai_types sof_dais[] = {
 	{"SAI", SOF_DAI_IMX_SAI},
 	{"ESAI", SOF_DAI_IMX_ESAI},
 	{"ACP", SOF_DAI_AMD_BT},
+	{"ACPBT", SOF_DAI_AMD_BT},
 	{"ACPSP", SOF_DAI_AMD_SP},
 	{"ACPDMIC", SOF_DAI_AMD_DMIC},
 	{"ACPHS", SOF_DAI_AMD_HS},
-- 
2.43.0

