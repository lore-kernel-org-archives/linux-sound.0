Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Id69ZyID"
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 644AD10C7;
	Sat,  9 Dec 2023 12:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702155250;
	bh=6CEHnbgdwJYVfipM0adU97EnT1wECk7R50CpX/0QHJY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Id69ZyIDTAm3eTwaAMpObLY7Pfvb6t2SroKMHWS/GNl4eASvs3AODZdJo1MgYBzfV
	 QPBxLhM3s0sbsu1URy5UST72rHUNLWndJ3X74dgM7qMWZVFHqewC4qkYvAxyNGqieX
	 PCGW3w7aPuLW0Vz7NR7HoAWAqgDfx88TAWzGbnU7qem+ekTG9agiVJYk+Xv0gDqnoL
	 u+CiA+lW8Xywq+/oilR2AEEds90QmQMPUgZXF7WboCYQr0JOrZt7zc9vg/VOE1pYZV
	 kPepGinJUExbvcD79cBXMARcD00oP8c+NVWrAV9oIICG5CnKU8yFsQiFU16Dl9vPo8
	 iVdCqQ/FhubdQ==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 3E62337813E6;
	Sat,  9 Dec 2023 20:54:10 +0000 (UTC)
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
Subject: [PATCH 07/11] ASoC: SOF: core: Skip firmware test for undefined fw_name
Date: Sat,  9 Dec 2023 22:53:46 +0200
Message-ID: <20231209205351.880797-8-cristian.ciocaltea@collabora.com>
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

Some SOF drivers like AMD ACP do not always rely on a single static
firmware file, but may require multiple files having their names
dynamically computed on probe time, e.g. based on chip name.

In those cases, providing an invalid default_fw_filename in their
sof_dev_desc struct will prevent probing due to 'SOF firmware
and/or topology file not found' error.

Fix the issue by allowing drivers to omit initialization for this member
(or alternatively provide a dynamic override via ipc_file_profile_base)
and update sof_test_firmware_file() to verify the given profile data and
skip firmware testing if either fw_path or fw_name is not defined.

Fixes: 6c393ebbd74a ("ASoC: SOF: core: Implement IPC version fallback if firmware files are missing")
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 sound/soc/sof/fw-file-profile.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/sof/fw-file-profile.c b/sound/soc/sof/fw-file-profile.c
index 138a1ca2c4a8..e63700234df0 100644
--- a/sound/soc/sof/fw-file-profile.c
+++ b/sound/soc/sof/fw-file-profile.c
@@ -21,6 +21,9 @@ static int sof_test_firmware_file(struct device *dev,
 	const u32 *magic;
 	int ret;
 
+	if (!profile->fw_path || !profile->fw_name || !*profile->fw_name)
+		return 0;
+
 	fw_filename = kasprintf(GFP_KERNEL, "%s/%s", profile->fw_path,
 				profile->fw_name);
 	if (!fw_filename)
-- 
2.43.0

