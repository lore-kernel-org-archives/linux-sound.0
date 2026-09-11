Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F00847127D
	for <linux-sound@vger.kernel.org>; Fri, 11 Sep 2026 12:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789129273; cv=none; b=VKVQGM8+Pd8RxkRTRT7soRE2IrdMqpqrLUtLv9hDsQ6wdZIsVKficSHYeM32nqPQtXd2lLj7Hnl4syuDcqFiMqg+0A7urIWmcJVNihIwP9usRrgO6YbfD2C8HQqsM8c73El2Xn2g/HIx3Emn0s62So4hGtkhqdGWjg11L1ZnWFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789129273; c=relaxed/simple;
	bh=qNjHbCegpK0PneAU3gTf/b8bWCGIpW6pwcavouxoPjE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C/10Sr/k/AhHWd31S+7bKedPkD5X0waL3rc9T1D/JMHSRyFtbh91LvhlaQbTWA3xCwHorqFL0W9dnr9ivj1kOR61gY+r/9vjGcWWoJoXR3d0TC15MMiCJavtOaNJ80AlHFJW5Ohnx++m5u+6kTPVvu1IGGUPpDJ0Pq4KLHfsUQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nikitakoval.com; spf=fail smtp.mailfrom=nikitakoval.com; dkim=pass (2048-bit key) header.d=nikitakoval.com header.i=@nikitakoval.com header.b=Gxa3BnI5; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nikitakoval.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nikitakoval.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nikitakoval.com header.i=@nikitakoval.com header.b="Gxa3BnI5"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-530d8021e97so5595531cf.1
        for <linux-sound@vger.kernel.org>; Fri, 11 Sep 2026 05:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nikitakoval.com; s=google; t=1789129267; x=1789734067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=E4nRFUH8wjkOeF35ugK2Zd5Rp1OvGxki+KtOMMNuAgU=;
        b=Gxa3BnI5KjiK8nV0c4Ou1wAl1FwKaVyLED81/4fmUdMGLWXXWoPP+y0p4NkMXLCJTK
         9CiYAiUTM4hrIi6x7GsJdHmlM20AR2FWsE81JxB8nJ4gurMJKvff3xPDXiixzq0cHM+k
         4E77KB4M0Guej3NEMR6pY2EQOGj2cREjvMNz1bwmnICPuUK6Sx4g27m7gYPJH5LDlrS5
         AXPgJMTvdzHKiI82DYNiF/1bnITyDgjtN/TxQGs4NzpRmRbGhXMjqqgTUloW092xF+K5
         pjqcKanPjWNNarJxmZpne3X/3ht81W7okEwI8MvqCfASXbwaQKLCGadxWueEVh2cES0y
         OERw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789129267; x=1789734067;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E4nRFUH8wjkOeF35ugK2Zd5Rp1OvGxki+KtOMMNuAgU=;
        b=Rcrxz86m6XafhExfWGZvSATZNoiV2DRrX06VGFTCGgQma8R81bD6MZFLddDPi/ttQv
         Fg7g+eDcHCeGiA/N2yQxZ00FGCK0YQQTxbC4bMsaKHYYD0hhTlydXG3bKXE3jzxrpoZ+
         7rMNtw5ZHJU8wYisqbccQLkBGE5c5yJu+onSS4wXA0C/vRmlwJ1Raas/+2QdstiApt0H
         j65+6Fy7uWtWiDVQdAo2NzJYqyi01Wl8fcNBrLnQbHCOjHXvSlfmE/sX7TLLB9LEGx3P
         k4GpprptN3a4nSny7xb3xNhz69dcf4bp5o5juoRhKyyCsy2hc9mJ/LQCHkY/uSP5pg/D
         qUxw==
X-Forwarded-Encrypted: i=1; AKwUvBx7fBtuNysZOV3ViFkUtMrSprGKKV8Yo9DbigQYzDCIEaUtZZKn48EAQQG1UJNwdVB7XWXkSUpRjN7bmg==@vger.kernel.org
X-Gm-Message-State: AFuF++mhw9n9gvSapnYhQTIy+VrP36fhPZfblLAHu8+9fZS1m2logF87
	tWw6+7OXERw5nx+M3wbSNVr2ZYt6B0e9/guDwGsa7pdXLU6VcbPtVC6t8EcVylGvwbiK
X-Gm-Gg: AYBFou2M8v0Cu83Cqd7Te1zXY+KOR3loFT957itGJmNTxbVvYa/hXOgRkmprGTvDuuJ
	XMs/vOnTqm5QcYzyLFYocFVCo00vuwy9h+pklGsOKS1qawSSU6UqKtL2SxuaM/cfvlB1ukqjQPs
	3+xlkg56zo9CpJVwlWiiAeh4nOu/c47GmFtjJCEd/HqmPnK2m433Ui7saLI4Z48/rIiZ9NrvBZf
	h7nN4ofQTQRD/EBYeMzii08eaLBewk66/wughKgEuyW46K+gQxS64Uf9A9c1wdU6iAdqBIprp1v
	SvUi4MbWqg7oJX52FDEryKnOLD/8lIV265DTALk1RXExpSxCuQlA6GvNFx2Doef/6VSHOM1I7/w
	trzn2VWCTeCDJN+o7o2c5ETl9oA5cqrfnRkkoTG2x+DyQivxCoUb6X9jw0OTY6aatCp4VRDY/pe
	VzbRSxV5ElkLnxMzoyhbYf57dV5nXNmQGIZTYMOfEGE618Awqw1ndUC1XbvTqRgQ3iLZE=
X-Received: by 2002:a05:622a:550c:b0:52d:9dd9:63bd with SMTP id d75a77b69052e-530c84f375emr64494671cf.10.1789129266423;
        Fri, 11 Sep 2026 05:21:06 -0700 (PDT)
Received: from koval-p14s ([92.245.124.48])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939e807eb69sm229705285a.27.2026.09.11.05.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 05:21:06 -0700 (PDT)
From: Nikita Koval <me@nikitakoval.com>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-sound@vger.kernel.org,
	Nikita Koval <me@nikitakoval.com>
Subject: [PATCH] ASoC: amd: fix DMIC detection on Lenovo ThinkPad P14s Gen 6 AMD
Date: Fri, 11 Sep 2026 18:20:50 +0600
Message-ID: <20260911122050.42453-1-me@nikitakoval.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lenovo ThinkPad P14s Gen 6 AMD with BIOS R2XET41W (1.21)
reports acp-audio-config-flag as FLAG_AMD_LEGACY_ONLY_DMIC.

This causes the legacy ACP driver path to be selected and results in:

  No matching ASoC machine driver found

The firmware otherwise exposes a valid PDM microphone device through
ACPI, with _ADR 0x02 and acp-audio-device-type 0x02.

After selecting the snd_pci_ps path, the firmware _WOV method returns
0. The driver currently treats this as disabling the PDM/DMIC path,
which prevents the internal microphone from being registered.

Add DMI quirks for the ThinkPad P14s Gen 6 AMD to ignore the firmware
ACP config flag and the _WOV value.

With these quirks applied, the internal microphone is registered as:

  acp63: DMIC capture dmic-hifi-0

and capture works correctly.

DMI:
  System Vendor: LENOVO
  Product Name: 21RV000NUS
  Product Version: ThinkPad P14s Gen 6 AMD

Tested with BIOS R2XET41W (1.21) and Linux 7.2.4.

Signed-off-by: Nikita Koval <me@nikitakoval.com>
---
 sound/soc/amd/acp-config.c |  7 +++++++
 sound/soc/amd/ps/pci-ps.c  | 14 +++++++++++++-
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/sound/soc/amd/acp-config.c b/sound/soc/amd/acp-config.c
index 2d50be819..0372906f9 100644
--- a/sound/soc/amd/acp-config.c
+++ b/sound/soc/amd/acp-config.c
@@ -77,6 +77,13 @@ static const struct dmi_system_id acp70_acpi_flag_override_table[] = {
 			DMI_MATCH(DMI_BOARD_NAME, "8EA2"),
 		},
 	},
+	{
+		/* Lenovo ThinkPad P14s Gen 6 AMD */
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "ThinkPad P14s Gen 6 AMD")
+		},
+	},
 	{}
 };
 
diff --git a/sound/soc/amd/ps/pci-ps.c b/sound/soc/amd/ps/pci-ps.c
index 729f9aaba..afb8c78d3 100644
--- a/sound/soc/amd/ps/pci-ps.c
+++ b/sound/soc/amd/ps/pci-ps.c
@@ -10,6 +10,7 @@
 #include <linux/module.h>
 #include <linux/io.h>
 #include <linux/delay.h>
+#include <linux/dmi.h>
 #include <linux/platform_device.h>
 #include <linux/acpi.h>
 #include <linux/interrupt.h>
@@ -401,6 +402,17 @@ static int acp63_machine_register(struct device *dev)
 	return 0;
 }
 
+static const struct dmi_system_id acp_ignore_wov_table[] = {
+	{
+		/* Lenovo ThinkPad P14s Gen 6 AMD */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "ThinkPad P14s Gen 6 AMD"),
+		},
+	},
+	{}
+};
+
 static int get_acp63_device_config(struct pci_dev *pci, struct acp63_dev_data *acp_data)
 {
 	struct acpi_device *pdm_dev;
@@ -430,7 +442,7 @@ static int get_acp63_device_config(struct pci_dev *pci, struct acp63_dev_data *a
 
 		handle = ACPI_HANDLE(&pci->dev);
 		ret = acpi_evaluate_integer(handle, "_WOV", NULL, &dmic_status);
-		if (!ACPI_FAILURE(ret))
+		if (!ACPI_FAILURE(ret) && !dmi_check_system(acp_ignore_wov_table))
 			wov_en = dmic_status;
 	}
 
-- 
2.55.0

