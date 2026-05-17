Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70FA234D3B9
	for <linux-sound@vger.kernel.org>; Sun, 17 May 2026 08:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779008020; cv=none; b=qXe7nxlWVJ4/kh43BGS7wbz/1cbTJHf0KapSDaFuvAcUrsvUq06fKXJ9PQLsV1tl49UZqV8VBC3B2E4Ul0uD3LGNIE8czBD7QfejmGX0rUuqzuf0EP/r3VG3FVNh2WlJxCAXshcd010U1L5NKlWOPQruIYbxG4M7f1CcKlAZTfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779008020; c=relaxed/simple;
	bh=5HtuVgaiY0YvcIv/uLoN/3sTJCwrQF8ruRChvqh129c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JSP030arPb2zLdS0e6Y3HPUcRVj1cSAql5WpLVoto8l3yLXhQjuW08WyoxVgsAuhXKSHoG7houKDgH2Cdy1AmIJ7LtoSVt9yJL4NS4qAyTjLzRQItrb1EmVnXQYD6liGEpR9mKdoqS5D5Gaev1jyXCuLfjzGpqzQKDngZ7Eel4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mZUIAXDn; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mZUIAXDn"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2b95a78a11dso2970515ad.0
        for <linux-sound@vger.kernel.org>; Sun, 17 May 2026 01:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779008019; x=1779612819; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ANUCFNHeQjHjR+ZPRwbIJN1ptVHRpArx0eEvrWvlZZ8=;
        b=mZUIAXDnEwU8UcPJCP7jSUNQm5txo5OG5F4KKziCiwVDA7qPDYn+Zcw1G3BhxYFa++
         ZXXcHmWs94QDVeY8j0cFF6a0q+KgujhjEt+oXQerzUEI/BZB8SVyCsXA1euLP7QTXrW4
         BJiSZ7juEwS1EmYgPHCKCPFCOB2KsOdlUJaNSLNd/Hfl9bMPTPEzBQaKs3MVH/pzMkrU
         cJSq26haDBjhraVD/hwCg4L6ta5vukDq5KziEiEBJHcbkVxWpp/cSYErDlprrBitlhia
         owV6ttS1B+5DnCZyTuqsSlMBvH3b0nbtG2tH+ve05DOsugm5Nc54djlkPlKxfTI8pgzC
         oEmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779008019; x=1779612819;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ANUCFNHeQjHjR+ZPRwbIJN1ptVHRpArx0eEvrWvlZZ8=;
        b=kLSA5XfBVN0x60SEpu0EJ4KLav2Ike4EK6aaY65RkWkXDVX0PnP5RzVZreAM6rCMeJ
         WfBPK1D4ULzj2wNgEECVWep+Fca2NNBvMVxBSW78ZmxxC4nXjORlnBcJuKwfGQoR3RYB
         8uYV0prMXOujB+RJRhIZxmLkF+pIfb+mlBLPLDtQXeWfbShO8I+I19tjJRod/gGkl9J0
         vTiXJHw4ucEh1jEvaE6ZB5/SpzocdP01K74McJ8/G6CZq5FC50cuBqI7hjPjgD9Weqzc
         DSBhl95HpHKkZDWEyaGDhzBdsAokhEvMwZUxQ79HGq8tDgS6OvJd+6rCHVWetncVWW0g
         knsA==
X-Forwarded-Encrypted: i=1; AFNElJ/DnRRsrgIFqlbNErw8MbrXPiCFD+7oHeMXCqyOWBBKsmho4ayOBC64hUAdm5A+O76/hLo9CTBaW7m6gg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKV6iRogzvvVBcOpF1w+UBfOTzWN8eNsGBx7npgZ0ueKEH7j9i
	vokh968onSESeMOmQgJq7o8ABh/itWf9KAVcqu7gRsQu3WqQHcde0csV
X-Gm-Gg: Acq92OHeVVHK7jyLT1tqO0KGcRSvYEVnwHPUrJ4y8JQUZUkiYazPFxDavVXvEnl/xwP
	TFZPb1bkFhWbhK40ncJuVFYNjdIp26IhNt+utG+GzVF5G31r4E4FQglfnxhZsXku1UKU0OA0bB8
	IrOhb6JBS5QpY+FM8OJ1ux+ljXBkWmi4ZcMSK+LO5+9ZmvxvT6jGQAgjHkFl9EyVAxXct1xzm+4
	sFk4AyBggncuM9WcS+yauJQg+zQzp6garL+XOO5hOmfKbQxy8/+KD/KWRw1kIZ5+e/ZQ3ur9quw
	MGRLrLLFS4uYUCc/DmSlxe6cAK3T2rKaxtHRnhsD11+Jm21VQa322/2EWYVwzosFA1GVYKxxk97
	jE0uG0VECNPdUpJG3DL4GRNLUYzdUqNrUyTmVEc6ysQjltaLccEjB42xAMl9AmXQXlcFSj1PkIo
	V+NDfq3Bimdnbgxcg7rb0NYirWNdJAFd+PGfDTQ523BlqdQaKSs6Rx5kg=
X-Received: by 2002:a17:90a:c883:b0:369:a719:6747 with SMTP id 98e67ed59e1d1-369a7196e42mr1004072a91.3.1779008018693;
        Sun, 17 May 2026 01:53:38 -0700 (PDT)
Received: from nixos.golden-musical.ts.net ([122.161.241.87])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb1156absm10194919a12.27.2026.05.17.01.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 01:53:37 -0700 (PDT)
From: Sidharth Sharma <wednisegit@gmail.com>
To: Vijendar.Mukunda@amd.com,
	venkataprasad.potturu@amd.com,
	broonie@kernel.org
Cc: lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sidharth Sharma <wednisegit@gmail.com>
Subject: [PATCH] ASoC: amd: ps: Add support for MSI Crosshair A16 HX
Date: Sun, 17 May 2026 14:23:23 +0530
Message-ID: <20260517085323.2565039-1-wednisegit@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MSI Crosshair A16 HX (D8WFKG) uses a Ryzen 9 8940HX processor,
which identifies with ACP PCI revision 0x62. This revision is currently
unlisted in the Pink Sardine driver, causing the probe to return -ENODEV.

Furthermore, the MSI BIOS lacks the necessary 'acp-audio-device-type'
and '_WOV' ACPI entries required to automatically route the internal
digital microphone array.

Add the 0x62 revision to the PCI validation switch block, and introduce
a DMI quirk table to manually force the PDM configuration flag for this
specific board, allowing the acp63-dmic-capture node to map correctly.

Signed-off-by: Sidharth Sharma <wednisegit@gmail.com>
---
 sound/soc/amd/ps/pci-ps.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/sound/soc/amd/ps/pci-ps.c b/sound/soc/amd/ps/pci-ps.c
index 9751cf078..b9758a7b5 100644
--- a/sound/soc/amd/ps/pci-ps.c
+++ b/sound/soc/amd/ps/pci-ps.c
@@ -17,10 +17,24 @@
 #include <linux/pm_runtime.h>
 #include <linux/iopoll.h>
 #include <linux/soundwire/sdw_amd.h>
+#include <linux/dmi.h>
 #include "../mach-config.h"
 
 #include "acp63.h"
 
+#define ACP62_PCI_REV 0x62
+
+static const struct dmi_system_id acp63_dmic_quirk_table[] = {
+	{
+		.ident = "MSI Crosshair A16 HX",
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Micro-Star International Co., Ltd."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Crosshair A16 HX D8WFKG"),
+		}
+	},
+	{}
+};
+
 static void handle_acp70_sdw_wake_event(struct acp63_dev_data *adata)
 {
 	struct amd_sdw_manager *amd_manager;
@@ -436,6 +450,12 @@ static int get_acp63_device_config(struct pci_dev *pci, struct acp63_dev_data *a
 	if (dmic_en && wov_en)
 		is_dmic_dev = true;
 
+	/* fallback for msi firmware lacking standard acpi audio routing flags */
+	if (dmi_check_system(acp63_dmic_quirk_table)) {
+		is_dmic_dev = true;
+		acp_data->is_pdm_config = true;
+	}
+
 	if (acp_data->is_sdw_config) {
 		ret = acp_scan_sdw_devices(&pci->dev, ACP63_SDW_ADDR);
 		if (!ret && acp_data->info.link_mask)
@@ -587,6 +607,7 @@ static int snd_acp63_probe(struct pci_dev *pci,
 
 	/* ACP PCI revision id check for ACP6.3, ACP7.0 & ACP7.1 platforms */
 	switch (pci->revision) {
+	case ACP62_PCI_REV:
 	case ACP63_PCI_REV:
 	case ACP70_PCI_REV:
 	case ACP71_PCI_REV:
-- 
2.53.0

